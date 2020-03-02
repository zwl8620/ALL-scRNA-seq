#!/bin/bash

#Note: this script is used for single-cell RNA-seq data analysis.
#this script is applied to two computer languags, R and shell, may be have Python.
#


#rawdata direction
rawdata=/sdc1/home/ldl/ytt10x/rawdata/ytt/rawdata67_new

YTT7_YTT7_paired=/sdc1/home/ldl/ytt10x/002_Filter/YTT7_YTT7_paired

YTT7_YTT7_unpaired=/sdc1/home/ldl/ytt10x/002_Filter/unpaired/YTT7_YTT7_unpaired

mkdir -p ${YTT7_YTT7_paired}

mkdir -p ${YTT7_YTT7_unpaired}

#work in conda environment
conda activate scseq

java -jar /sdc1/home/ldl/miniconda3/envs/scseq/share/trimmomatic-0.39-1/trimmomatic.jar PE -threads 30 -phred33 \
${rawdata}/YTT7-YTT7-1_1.fq.gz \
${rawdata}/YTT7-YTT7-1_2.fq.gz \
${YTT7_YTT7_paired}/YTT7_S1_L001_R1_001.fastq.gz \
${YTT7_YTT7_unpaired}/YTT7-YTT7-1_R1_unpaired.fastq.gz \
${YTT7_YTT7_paired}/YTT7_S1_L001_R2_001.fastq.gz  \
${YTT7_YTT7_unpaired}/YTT7-YTT7-1_R2_unpaired.fastq.gz \
ILLUMINACLIP:/sdc1/home/ldl/miniconda3/envs/scseq/share/trimmomatic-0.39-1/adapters/TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15
	
java -jar /sdc1/home/ldl/miniconda3/envs/scseq/share/trimmomatic-0.39-1/trimmomatic.jar PE -threads 30 -phred33 \
${rawdata}/YTT7-YTT7-2_1.fq.gz \
${rawdata}/YTT7-YTT7-2_2.fq.gz \
${YTT7_YTT7_paired}/YTT7_S1_L002_R1_001.fastq.gz \
${YTT7_YTT7_unpaired}/YTT7-YTT7-2_R1_unpaired.fastq.gz \
${YTT7_YTT7_paired}/YTT7_S1_L002_R2_001.fastq.gz \
${YTT7_YTT7_unpaired}/YTT7-YTT7-2_R2_unpaired.fastq.gz \
ILLUMINACLIP:/sdc1/home/ldl/miniconda3/envs/scseq/share/trimmomatic-0.39-1/adapters/TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15
	
java -jar /sdc1/home/ldl/miniconda3/envs/scseq/share/trimmomatic-0.39-1/trimmomatic.jar PE -threads 30 -phred33 \
	${rawdata}/YTT7-YTT7-3_1.fq.gz \
	${rawdata}/YTT7-YTT7-3_2.fq.gz \
	${YTT7_YTT7_paired}/YTT7_S1_L003_R1_001.fastq.gz \
	${YTT7_YTT7_unpaired}/YTT7-YTT7-3_R1_unpaired.fastq.gz \
	${YTT7_YTT7_paired}/YTT7_S1_L003_R2_001.fastq.gz  \
	${YTT7_YTT7_unpaired}/YTT7-YTT7-3_R2_unpaired.fastq.gz \
	ILLUMINACLIP:/sdc1/home/ldl/miniconda3/envs/scseq/share/trimmomatic-0.39-1/adapters/TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15
	
java -jar /sdc1/home/ldl/miniconda3/envs/scseq/share/trimmomatic-0.39-1/trimmomatic.jar PE -threads 30 -phred33 \
	${rawdata}/YTT7-YTT7-4_1.fq.gz \
	${rawdata}/YTT7-YTT7-4_2.fq.gz \
	${YTT7_YTT7_paired}/YTT7_S1_L004_R1_001.fastq.gz \
	${YTT7_YTT7_unpaired}/YTT7-YTT7-4_R1_unpaired.fastq.gz \
	${YTT7_YTT7_paired}/YTT7_S1_L004_R2_001.fastq.gz  \
	${YTT7_YTT7_unpaired}/YTT7-YTT7-4_R2_unpaired.fastq.gz \
	ILLUMINACLIP:/sdc1/home/ldl/miniconda3/envs/scseq/share/trimmomatic-0.39-1/adapters/TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15	
		
#part II
#cellranger count:cells and genes quantitative
cd /sdc1/home/ldl/ytt10x

cellranger count --id=YTT7_YTT7 --fastqs=${YTT7_YTT7_paired} --transcriptome=/sdc1/home/ldl/ref_genome/GRCh38_3.0.0/refdata-cellranger-GRCh38-3.0.0 --localcores 30	
