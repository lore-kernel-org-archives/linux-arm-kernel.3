Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A269CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muO9LZ6kEmosm3Ges2kz3Rxg8kQYhqoJRKbnsDIH6Ac=; b=irNsBGbydoAwVqSHvVfWrOP9uj
	CM+YYdfZ+x1LxhbTgCTOdnxtnK/vVVolou55h7pywNjkqrNoNGhX3mS8vnEvc5IWJzJrn2749Pnbr
	z/LAlFO4bJSSWhCDZvocll1XmbXyjHVe6T6f4yZ7JmGWgMFLyvjTk82oYDIKHX4chevxjkF+g1sDt
	dFXJm5CKSC5wj8VlDmv9xmoL2UTkdUB5O6IUBwzs5oisTiGKWTdt/a5lAM+S+Y6g9+eMCxn9+ANLI
	/7oOHIaNbWXgd4QJQtio8y0Dl2xgI+aP+Kqeopv4RegN0aWSzIl7xqZbTfX5un8aO/+z9XnwxKM30
	US/Dx/MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJddv-0000000B41a-45y5;
	Thu, 13 Nov 2025 20:10:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJddt-0000000B410-1IaV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 20:10:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADDYZs43763273
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 20:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	muO9LZ6kEmosm3Ges2kz3Rxg8kQYhqoJRKbnsDIH6Ac=; b=oBXyI0gwG2mzWFPb
	YLePrDX9GYEoRrOR05DxjZbPT55KcIzhujqTdpUg2R5vrrBa96yTX3gmie+BPUC8
	rclPgOmmc0RHKknAodh9cYAEDO6o2LcSLLWqaNNvtY8Y53c6d2tE3x9t5gKItNrK
	LJ3K08GgCBaCJ2N9gfUiP9EGwVx3h3ZmZMx8RjjKB8mNV6/AfDZvLJeieKn3J0yQ
	0TOiYYT0ckAKVQErNFW7zyu/+l3lVoGrl5Teqpj5874jr/BmDKQLG4iMunAWFCuG
	ySmI7Tj+Yvyqc4/VVvdxloQeexx8kftl+PMqAiQp+M6a7J07mw1gJG4H/QKXCqhc
	xPI7eQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9jn2nrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 20:10:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a9fb6fcc78so1115103b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 12:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763064604; x=1763669404; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=muO9LZ6kEmosm3Ges2kz3Rxg8kQYhqoJRKbnsDIH6Ac=;
        b=EfZr+jI26XanRMUwViSbI6c/GHaJL/lxpl30gHHXy19XhjfCE14Q+dj7UQmRu+ojDm
         W5cP4MDdPLmTupGXBmtKUSy53oirut02o+dnI2L3ePZDTHRiheF+PLHDUVdmk+Murm4L
         0VtrMvl9FUi2T0F7a35QlJ+5MfoyYYXZtI1n76jnI7qf/fP4EiAV8pZBfNREt6UqViKF
         QCE93nz8cZFPb+3UOkpZ9GRfM6PvKRITObGHJda8qoITWbtFjqRQovyNXp+3wgGtU9GH
         lTxDwyszmsUYZRVBatKIVGJMbysmrWhUcZXhOqK4P5wPIvmUKhsc5H2hEf7eCnbiAQZk
         6k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763064604; x=1763669404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muO9LZ6kEmosm3Ges2kz3Rxg8kQYhqoJRKbnsDIH6Ac=;
        b=nI/Xv57JwjfEa1ZgVvgZoca2heo2RXq+NpfNM4cnbKejsIc4Oga6s/FnIivAT3tGlp
         zNQXIeIcXbD6EAUAu5St/K6+nxVyFXqYWV5HpXYBRKVVl2gWkxhgJWrGXJ7I8hnFUzOh
         z8fOxZmK+FoIZ0fWHT91NvPU0VdCS+f+473n4FFzJuXHeQKAAyODhNvLYIpAkR3CbGUP
         e+kKqE8oFMff/uBZNbGZzB8SOI5XdRrU9Jxoeykqcw/fcSjxxffVhxhWtECJ3JkxL3O6
         3Srv4UwQ9jzbuP2tv4LpCzeMuq/iJeXytBOTaEWPf1Y3iPWofe31Tj403rHCT1XWl7xq
         TUMg==
X-Forwarded-Encrypted: i=1; AJvYcCX50BWP2NmHlZfmOprJUAq7l+PdkIxOqoa3Drx3d/zB3FGj5nX0cOL/m94RFL+j2RKEaB7FPccNulrqHbVguEzo@lists.infradead.org
X-Gm-Message-State: AOJu0YyqUnu17uRHgYH2gPbhrh85FtGZLhahAz1WWGSRAn07yKgffHnp
	kk4Nh0419V78cdeq6/xNOe6P9+EBiH0EyfTw3jgaMIl7YHW03cyzKFT7k7PDWEaP9NalXvfcfMp
	KLVaB4PaQ2K2djhgZF8p7UKHRQzBfC3xtVvqiA/r7gVkn1mp9IFD9p42nQOwJYTnzR2dAuq8qfQ
	UnYg==
X-Gm-Gg: ASbGncv35/89a61wF37zVz4N+hOXUcebxmMuxOk4s1oCHFzWDbarnW2lbqRJ/9o4AiQ
	/QoHhLH+e78jSs5M8h/vqpkpfArbt34vIQLWBxzXPcZMOfsbEm1HcUfGvVaBzAqcf+7VMNFJZEJ
	y5tjxhCmeKq4xaMPuVT8m1N8SDLotZ1iIv6n88kuPforc3lSJ4jShsNjeNO63g718f4Miyp2c2r
	g75whF40MtJGHwgFPzoLae7L+Cv+wkCpc8VtRAUXyvO5UIoVXYe+80W9kSR3r/DtPi3tCwDqa74
	K2IOD98UFT8VFE6VaYZfcwIhN/LeE8oj7nh63ngoPlySJJC4xh/IKWTik+RBPHbB2ovQUJNRrCX
	X+p7j7nCeF59P89OVtqMwwQ==
X-Received: by 2002:a05:6a00:18a9:b0:7a2:7c48:e394 with SMTP id d2e1a72fcca58-7ba379a7b0cmr708753b3a.0.1763064603684;
        Thu, 13 Nov 2025 12:10:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXw02RGuW9FGIDBukM/HjJLOOcWHafS/kj+OCLzdcZqwqyZ3wk2YYJnz5mKp+Dfeu3fQ0m6A==
X-Received: by 2002:a05:6a00:18a9:b0:7a2:7c48:e394 with SMTP id d2e1a72fcca58-7ba379a7b0cmr708721b3a.0.1763064602969;
        Thu, 13 Nov 2025 12:10:02 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aea005sm3129109b3a.3.2025.11.13.12.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 12:10:02 -0800 (PST)
Message-ID: <5b841c60-cac9-4def-928c-33cbf3d908f5@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 01:39:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] drm/msm/adreno: Introduce A8x GPU Support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-13-bef18acd5e94@oss.qualcomm.com>
 <aff7043c-0029-433c-9340-22718909e583@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <aff7043c-0029-433c-9340-22718909e583@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BvmQAIX5 c=1 sm=1 tr=0 ts=69163b1c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=53R2tzsCfDe74MVAKjgA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 202p9qj7IUSS04lzsiYqPDFnjbIfynJi
X-Proofpoint-GUID: 202p9qj7IUSS04lzsiYqPDFnjbIfynJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE1NyBTYWx0ZWRfX8dfRGzYBEDtV
 0kkddjhZoJkWuDKqB9LdUQVnRldYzBEmPbCpBwsQ6MPOpcFG4LXZcaVYuIz/Fet1w//A27lvz7C
 JWe2NMYZk4SQBfzHorYMv26t/jYy5M6xCyceqotIIpXl/8Mz1KYAl8dKEanSR+KoOPqXYB0cXQf
 JLcYN2KrGPZiCEGDMRL+44PsMxcU9dABM5ezO1iWCWquB/fUzDS8tFh/cIIwl6uml0a+PN/PgsB
 lrOLs6azH28lfHBu1wqTQ+W3LYogeoRTK6CyTv5aP9gu9LXQf9Vg2qtxx+tqeKaWvG3cWW1s8J2
 m6+UMkYdepiO60fUMmXoe7TSiJJKNiQoI5d2Rnrh6N9WBjgqrKmz3wQtX5JUfQRN27q7krRpReA
 kkTq8QBuMM7IqtHwKH0EMCLYzDZzTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_121005_791800_F6A77572 
X-CRM114-Status: GOOD (  38.65  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/13/2025 3:45 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> A8x is the next generation of Adreno GPUs, featuring a significant
>> hardware design change. A major update to the design is the introduction
>> of Slice architecture. Slices are sort of mini-GPUs within the GPU which
>> are more independent in processing Graphics and compute workloads. Also,
>> in addition to the BV and BR pipe we saw in A7x, CP has more concurrency
>> with additional pipes.
>>
>> From a software interface perspective, these changes have a significant
>> impact on the KMD side. First, the GPU register space has been extensively
>> reorganized. Second, to avoid  a register space explosion caused by the
>> new slice architecture and additional pipes, many registers are now
>> virtualized, instead of duplicated as in A7x. KMD must configure an
>> aperture register with the appropriate slice and pipe ID before accessing
>> these virtualized registers.
>>
>> This patch adds only a skeleton support for the A8x family. An A8x GPU
>> support will be added in an upcoming patch.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	u32 val;
>> +
>> +	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
> 
> There's also a BIT(23) value here which is seemingly never set, but
> perhaps may come in useful for the bigger GPU
> 
>> +
>> +	if (a6xx_gpu->cached_aperture == val)
>> +		return;
>> +
>> +	gpu_write(gpu, REG_A8XX_CP_APERTURE_CNTL_HOST, val);
>> +
>> +	a6xx_gpu->cached_aperture = val;
>> +}
>> +
>> +static void a8xx_aperture_aquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
> 
> "acquire"

Oops!

> 
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
>> +
>> +	a8xx_aperture_slice_set(gpu, pipe, 0);
> 
> Maybe we can add "unsigned long flags[MAX_NUM_SLICES]" to a6xx_gpu
> to make the API a little more ergonomic.. but maybe that's too much
> IDK
> 
> [...]
> 
>> +	a6xx_gpu->slice_mask = a6xx_llc_read(a6xx_gpu,
>> +			REG_A8XX_CX_MISC_SLICE_ENABLE_FINAL) & GENMASK(3, 0);
> 
> Please define that field in the XML
This should be more clear in the next rev

> 
> [...]
> 
>> +}
>> +
>> +static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
>> +{
>> +	return ffs(a6xx_gpu->slice_mask) - 1;
>> +}
>> +
>> +static inline bool _a8xx_check_idle(struct msm_gpu *gpu)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	/* Check that the GMU is idle */
>> +	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
>> +		return false;
>> +
>> +	/* Check that the CX master is idle */
>> +	if (gpu_read(gpu, REG_A8XX_RBBM_STATUS) &
>> +			~A8XX_RBBM_STATUS_CP_AHB_BUSY_CX_MASTER)
>> +		return false;
>> +
>> +	return !(gpu_read(gpu, REG_A8XX_RBBM_INT_0_STATUS) &
>> +		A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT);
> 
> Odd parenthesis-alignment (couple times in the file), checkpatch
> usually mumbles at that
Not sure about the issue here, but I do run b4 prep --check and didn't
see any complaints.

> 
> [...]
> 
>> +
>> +void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	uint32_t wptr;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ring->preempt_lock, flags);
>> +
>> +	/* Copy the shadow to the actual register */
>> +	ring->cur = ring->next;
>> +
>> +	/* Make sure to wrap wptr if we need to */
>> +	wptr = get_wptr(ring);
>> +
>> +	/* Update HW if this is the current ring and we are not in preempt*/
>> +	if (!a6xx_in_preempt(a6xx_gpu)) {
>> +		if (a6xx_gpu->cur_ring == ring)
>> +			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> 
> I think this should use _fenced too, but I guess the preempt detail
> is just a harmless copypasta
I have reused a6xx_flush here in next rev.

> 
> [...]
> 
>> +static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>> +	u32 val;
>> +
>> +	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
>> +			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
>> +	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
>> +			state ? 0x110111 : 0);
> 
> a840 sets this, a830 sets 0x10111, please confirm which way x2 skews
This is correct for X2.

> 
>> +	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
>> +			state ? 0x55555 : 0);
>> +
>> +	gpu_write(gpu, REG_A8XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
>> +	gpu_write(gpu, REG_A8XX_RBBM_CGC_GLOBAL_LOAD_CMD, state ? 1 : 0);
> 
> !!state
> 
> [...]
> 
>> +static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>> +	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
>> +	unsigned int pipe_id, i;
>> +	unsigned long flags;
>> +
>> +	for (pipe_id = PIPE_NONE; pipe_id <= PIPE_DDE_BV; pipe_id++) {
>> +		/* We don't have support for LPAC yet */
>> +		if (pipe_id == PIPE_LPAC)
>> +			continue;
> 
> This seems arbitrary - one because there are no defines targetting PIPE_LPAC
> specifcally in the reg lists you shared and two because it would almost
> certainly not hurt to configure these registers and otherwise not power up
> the LPAC pipeline
> 
>> +
>> +		a8xx_aperture_aquire(gpu, pipe_id, &flags);
>> +
>> +		for (i = 0; regs[i].offset; i++) {
>> +			if (!(BIT(pipe_id) & regs[i].pipe))
>> +				continue;
>> +
>> +			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
>> +				*gmem_protect = regs[i].value;
>> +
>> +			gpu_write(gpu, regs[i].offset, regs[i].value);
>> +		}
>> +
>> +		a8xx_aperture_release(gpu, flags);
>> +	}
>> +
>> +	a8xx_aperture_clear(gpu);
>> +}
>> +
>> +static int a8xx_cp_init(struct msm_gpu *gpu)
>> +{
>> +	struct msm_ringbuffer *ring = gpu->rb[0];
>> +	u32 mask;
>> +
>> +	/* Disable concurrent binning before sending CP init */
>> +	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>> +	OUT_RING(ring, BIT(27));
>> +
>> +	OUT_PKT7(ring, CP_ME_INIT, 4);
>> +
>> +	/* Use multiple HW contexts */
>> +	mask = BIT(0);
>> +
>> +	/* Enable error detection */
>> +	mask |= BIT(1);
>> +
>> +	/* Set default reset state */
>> +	mask |= BIT(3);
>> +
>> +	/* Disable save/restore of performance counters across preemption */
>> +	mask |= BIT(6);
>> +
>> +	OUT_RING(ring, mask);
>> +
>> +	/* Enable multiple hardware contexts */
>> +	OUT_RING(ring, 0x00000003);
>> +
>> +	/* Enable error detection */
>> +	OUT_RING(ring, 0x20000000);
>> +
>> +	/* Operation mode mask */
>> +	OUT_RING(ring, 0x00000002);
> 
> Should we include the pwrup reglist from the get-go too? I don't think
> you used the ones you declared in patch 15 (or at least my ctrl-f can't
> find the use of it)

yeah. I should remove that for now.

> 
> [...]
> 
>> +#define A8XX_CP_INTERRUPT_STATUS_MASK_PIPE \
>> +	(A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFRBWRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB1WRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB2WRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB3WRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFSDSWRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFMRBWRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFVSDWRAP | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_OPCODEERROR | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VSDPARITYERROR | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_REGISTERPROTECTIONERROR | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_ILLEGALINSTRUCTION | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_SMMUFAULT | \
>> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VBIFRESP | \
> 
> kgsl also enables VBIFRESTP(TYPE/READ/LIENT)

Ack

> 
> [...]
> 
>> +	/* Setup GMEM Range in UCHE */
>> +	gmem_range_min = SZ_64M;
> 
> this doesn't seem to ever change, you can inline it

fwiw, this documents the magic number. ;)

-Akhil

> 
> [...]
> 
>> +static void a8xx_dump(struct msm_gpu *gpu)
>> +{
>> +	DRM_DEV_INFO(&gpu->pdev->dev, "status:   %08x\n",
>> +			gpu_read(gpu, REG_A8XX_RBBM_STATUS));
> 
> This can be a single line
> 
> Konrad



