Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C31BCD4847
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 21:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KLUxP1A+fJKIGmw2pZNAAkuORqzlask/BowKwIFvtA=; b=VI5EiApfto+zcbDLBJGGl2FJAp
	6ybxMRBfUhs/a7v9xhtbRm95XLiqVxeoUsUo0EpeqjODJkkKr+dNU/b9y8skk3qrYEYEm7grREHsZ
	QuMrP9cklgyRCGBxc8giMEStQJrMFyYSiRn9wLOpTvGo1/nmJV+gWj9L9zZriqmSrPmihiieuEsFm
	luemjOcpRz+G1LiQshP8sij6Ts2Up2DGxf7RV8d+4Em40lCNYJNfqz8b/obIzRdemNDuhJ70PE3ZS
	7zzAvvt0DjHenF950kAptSS9wG8+BKRk3dyc90MOBakWlY/IM+K5/Dl5vKtBgpwWqfxj5yYW8uaqe
	+F3dCmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJID5-00000009Wne-2NVe;
	Wed, 12 Nov 2025 21:16:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJID2-00000009WnF-3ztd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 21:16:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACFX6KS510766
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 21:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4KLUxP1A+fJKIGmw2pZNAAkuORqzlask/BowKwIFvtA=; b=Keh42dv6DiOMyBbz
	5Tbb1I2a55SDATcKLk323qMBe+6ZMJPIQLAMr1FFEzCZuoxZQzPUigsaBfmTl6OC
	LlcCJOFwX5oZ9HGoUA1JbcLVzd939kWrEogRs16f7lciqkrjMxDELr1QebNgRrga
	ctmGxyu0pLDW5RIUhCHdTPbuceAJ+je8pQ68eam4KBjvxOrUrGM+BDBdv82cNtj8
	Juakh5ix88e9JCvbkO0gU3USEDzkWklSVR8UQAxNXLc7tO2H+OzxkI4V5t55llu/
	fIt0cUV8F18JwwIvRHdlkkkT6Kpv5Bb/xaLctPAYXZzhk/yfhdzUQ0AayOS6I/Ga
	oRQLOg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqdgja02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 21:16:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2955f0b8895so15579015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 13:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762982215; x=1763587015; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KLUxP1A+fJKIGmw2pZNAAkuORqzlask/BowKwIFvtA=;
        b=LH2CZNEc4wKPryKHJmtBH3LOtF/uEWFq7L0I2bl59YWI67DyKg1UuNMlRi4BdazYpu
         NhazjhjEnDhSDdpfTGWjJPODYchytxRDqShNNGYPWMmV2+pG11K2De7bd4i8O1BNVyze
         2JEGhYWW4BvTFrBZP/LbrrboW7fDbb47wUUfNd2FezuOE34FWRz2+U7oawNkJ4mFWVmT
         4n1AnOirFVipKmfZrP2PH5MVzd++HNSGr8BGnw8dCBnCT8G1rZnmnQ/V4kt/9pBEmaiK
         8fftjQwjX0Ay3K6Gfk9/NzocrJWaCd/TN99rS2Hq/0JvcKUbcED2kDmmmoEg5ykk6erv
         SWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762982215; x=1763587015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KLUxP1A+fJKIGmw2pZNAAkuORqzlask/BowKwIFvtA=;
        b=AKQxie/RrVcesHRZmfdG5qF6C72HFhpRzHO5gEEyBfTcxcNyryITwXBRoG/c8ea8pn
         +jmzmjw6yRoqgReXVo/2HSA5D2rYl0AR+b5grAZlhgRxDHyfH7h3odrgokNYVhoFSDvV
         RsNBwc10GoQtpxWS5t/D2Cq8oc1XC0wVLYBEUuElKNB71JIPa+nGB4U20FrAAo/mjx4o
         DHDmG4TbDUs6erVoK6n2nUnazK3QChmzR3dRUhV+f3CFJV+/+a+QHZdcHGXt5OvmmNSP
         PNWIL1HxVIFjRFYLeacts+HtpO8gu7JPY4R3CXwHSiq41yIwFo4gTCfRTL+Iw6bFA3iT
         vj7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFADVOxbEFl1fH29IrO/KTOKZffXXCdMBoBgsZJM5GcpbyZ9F0nkexZsuO58zt+psM8tm6SCB6sv2hwmm+aMCj@lists.infradead.org
X-Gm-Message-State: AOJu0YyDje81eRMaxSvfgVuKSBTeEV8haOeUK53SW00YJXtX47RyPBCE
	njhOUDMAOIyIDuV+1HkA91O8TgXXVQ4/VcN/JVLqZCAfjG22NjPbIp5vpOA/4cFeoSCX5+8Rbhp
	BvyIoZ/orTzcAdDg02BR/gVOFw+RHvaQGrAXkZqJkojra+cOOVoeIpoZJzfBNufXemv1c2bh4Ji
	zSuA==
X-Gm-Gg: ASbGncsXm/bFd1NnO/oryd5KJlpHngSOJ4h92C8t/Uq+kUQHxL7lmnTzOyuGN4IZpBQ
	pyXC47lBQZMwMQ9yDyC4p10+4u57BGsgcwb8hUD0S59xSQ4bpV+eqmvkyQK5EuNz5bZCdqdgtk6
	J/UJ72auDg8u/Ms1wJ3ElcLUbVKlofnKBGXSq5JjZFWje9JmAcRUjvOw6wM01VJ8cboOByApXiF
	oRNUfe929hpPZ1YGEjI2S+SJ9JU1w2ztqpf4kQSZriS76svhHMo8xigeH+C/Ui+KzVUMfDDPadq
	z9X3drFerQBk/xjCS1XS4y/q10JMuZI7M/GDga/C+K/+dVLiNYZk5lOgptt2PGzx4RnRyG21DvR
	1Ul9na4b7o+Ax8ULKimQ/4w==
X-Received: by 2002:a17:902:e951:b0:298:88:c006 with SMTP id d9443c01a7336-2985a4b366emr11201105ad.4.1762982214706;
        Wed, 12 Nov 2025 13:16:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfYCKhd6MQEsF06e3F32Ghk4Zj+VCRoijQ1Gh0yc34lnyP12H7UORYvh0CdBd1dlZ6GUpfaA==
X-Received: by 2002:a17:902:e951:b0:298:88:c006 with SMTP id d9443c01a7336-2985a4b366emr11200475ad.4.1762982214157;
        Wed, 12 Nov 2025 13:16:54 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2c16a1sm916005ad.95.2025.11.12.13.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 13:16:53 -0800 (PST)
Message-ID: <cc4ff1c7-3158-402d-b746-5aa57b4a855f@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 02:46:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/21] drm/msm/adreno: Support AQE engine
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
 <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <1202b66c-6d4f-4909-a010-7e5e3ec7f0c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtrWylg4 c=1 sm=1 tr=0 ts=6914f948 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1HEVVvjKVHWHBA54g4IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: yfsuHI_fnZ6YnpeZEkPH0yLcTsndOo4B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3MiBTYWx0ZWRfX2MpvlpdrL5ti
 rfIw9AXVHzEmqo7GOneHIVYUqA5vFRos26GeBJipcN02npbKTLywWYfrtNOllYXDHLUCwfE+Yl8
 AzdSwPF0te6O630bIN1NDyBoYVdVKZq3stZv3gkqidw4sD+Qe1Elro3ddK3avaMCuGG4c6Pr/d4
 F+ka8K8phZGhKdoXbtvkJd2hGxVdgxLfps+nUaxV5yt9lrgXtehPgJfTzQHKt9xbiuKJXF+TveB
 vEQbqzmKIhUidUFUFcKmH6ZCnqX5gMWSjJpZA+c/swtdkBUEdW/Dud8y9PxcAkAXKT5fT7mVdYt
 0juoLfYbmZtQn4imNEWxgBnZrv10PmiUqq+M0YTh6kOKEEH6zC8S51rxhROlsa/5jQvitosiYPs
 RcoFALwQpmXlQt336jJeVEEWJE8sgw==
X-Proofpoint-ORIG-GUID: yfsuHI_fnZ6YnpeZEkPH0yLcTsndOo4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_131657_027524_2E41D01F 
X-CRM114-Status: GOOD (  20.73  )
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

On 11/12/2025 4:37 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
>> in Raytracing related workloads. Add support for loading the AQE firmware
>> and initialize the necessary registers.
>>
>> Since AQE engine has dependency on preemption context records, expose
>> Raytracing support to userspace only when preemption is enabled.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> Side question: is the AQE fully functional on any gen7 targets?
> A750?

Yes. Only A750 has it in the A7x family.

> 
> [...]
> 
>> -		adreno_gpu->has_ray_tracing =
>> -			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
>> +		/*
>> +		 * AQE requires preemption records, so disable raytracing
>> +		 * if preemption is not supported
>> +		 */
>> +		if (gpu->nr_rings == 1)
> 
> "nr_rings > 1"?

Ack.

> 
>> +			adreno_gpu->has_ray_tracing =
>> +				!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
>>  	} else if (adreno_is_a740(adreno_gpu)) {
>>  		/* Raytracing is always enabled on a740 */
>>  		adreno_gpu->has_ray_tracing = true;
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index b507ff4e1756..7921b4a68937 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -58,6 +58,8 @@ struct a6xx_gpu {
>>  
>>  	struct drm_gem_object *sqe_bo;
>>  	uint64_t sqe_iova;
>> +	struct drm_gem_object *aqe_bo;
>> +	uint64_t aqe_iova;
>>  
>>  	struct msm_ringbuffer *cur_ring;
>>  	struct msm_ringbuffer *next_ring;
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index 78dcb9bc3377..2ef69161f1d0 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
>>  		goto out;
>>  
>>  	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>> +	if (a6xx_gpu->aqe_iova)
>> +		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
> 
> I believe you should also set CP_AQE_APRIV_CNTL per-pipe

We already configure CP_APRIV_CNTL_PIPE for this.

> 
> Should we also enable AQE1 while at it, to reduce potential backwards
> compatibility issues? Would that require solving the iommu woes?
Yeah, AQE1 is strictly for LPAC workloads. So lets wait for LPAC support
first.

-Akhil

> 
> Konrad


