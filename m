Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE1ACAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWqdJYIgBrFAk/VfJaE8W7hboLe7bmM+zzZwNVqEq3g=; b=M5QnY460ys8ZcLUym0FWECC3dV
	+hwRZ5wxWnAOiGA0bfkp2FxZc1q0Scy/Qg59KTDC9bJ9aEY1q8FVMtmMtsDJZ+RKuDkglCofFv1Mi
	FTCy6u6jlvstWBF08NVcGg3+oUaj66wh5Lxem6tB0PTxoensn3bssHrbhkxxJmD8NphNeuVJLBY1R
	x43yUbYduVtgZl5+LTLhNR12G7sPRbBb4UBLKOz5ChBmJm46UvWIYcxsX1n0SW/d95vF231TAd0z6
	H0SQMDNC+4JD/CscvoEO85djrHzoEminIAbJKmcjHTa9F2GbG7JaQb2GILyJw1yEjopDer/kSuEEV
	lCirOVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43yC-00000008ydt-1nvy;
	Wed, 01 Oct 2025 21:02:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43y9-00000008ydA-11ET
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:02:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcQO0024114
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Oct 2025 21:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWqdJYIgBrFAk/VfJaE8W7hboLe7bmM+zzZwNVqEq3g=; b=jcEwFVUCNmXpe4Hx
	Sw/v2WMFPD6phRbFbDegjtGk92GQIFNujZBL9pIfyegiHHHlEMNpbQ96WIhogOIi
	yIueEOnyDO8kxbeMtbdU200j5vg9E+WRufclP0LHVVLR9eQXJ5ZpPTS0GZBF7UIl
	priz9x9aq7yrK6u2mQ3vb7Jfop325EBTi/TctO/ibhpv/7i2DfENiMvCCEjLg1m4
	bBS6yT06EXJuH18oThldxrZtXFNeeF6wZXXq/TaEbR59P98QizUbqzVfsJScJZ0T
	T66xSOXGAzc+6LIPqMyBfZGE6dTt1SNhHggGmhUw4fHCp+iRHV/o3LRrw5wKTbZr
	GaZ+cg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a65w2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 21:02:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-339a6d9defdso685263a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352554; x=1759957354;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWqdJYIgBrFAk/VfJaE8W7hboLe7bmM+zzZwNVqEq3g=;
        b=QwmosAKH9Cnnb+cPO1+wQlUwhp56EA89gqTOZOge0k44ARAXtF499+RTXTLusTiXzR
         Tah52k8zbudCyGmE+x7bIrsVD1ALRgNOACskfA0srLUY7z3Ssy/4IuNj+7JZy9bbC0Wu
         5ri6zdkiSREDnEEGtQ6NcAf3yPlCJZNSUz3YZiQrXbVBsUNwOwlVgJsoi9HuRlLOns4H
         4zGH69m00Nfv4RcpqnDOxaw5pWDq2U8XO5cl8muWNjLTW+q/KgB+5+hPIFzLuMt+HjQt
         z6BVbkZQUnMp9ZQJX5MecUAhPj3tKVTsH/wVu2MKVj3nH9V7fHfN2jTxMjLNx/t6UtFJ
         MpQg==
X-Forwarded-Encrypted: i=1; AJvYcCWA4ZVsQzmuOQUvh2Q+BukBR0e4GEZB8xoLE17S4SbBlSDtH+HokyEvI5Rvm6C5qMIyZ5qmtgOhwAmojaDmnCLt@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo/gi4GBGBC2bmj9amuiho3lSrGVZVA7mE437yUxzPVRMm7znH
	z1l3Wel/0iBjxlR+2HirrEgRrTI6zhuFdxNRQ9XeRGn3NGbC4rvaCIXf2yhhW9mxll65Y0Ojkmq
	7RXSFNjAm/Ubyv64N93mJd3koZLRgIIYwWvkR1YM6KJLDwdhtkVFEPTDRPxJY8GHHXOiPts6qSG
	z+Yw==
X-Gm-Gg: ASbGncuOg1FQQULX9THt3D7++y86QQkZyBF7YQi5DyieAWQgMD12rf7Qq1igGsaj7Iv
	O/t1FjuD3T0xYvqS0M8dGfIzfUOzX1T+X8LkBzym+fPH3Ui35sgnlR+bscWOGleSAYtH2V9l9hZ
	sGE629wgYCqqnD+AA9PH9kCsRLwBohVTOvGj4x5ncVq5XGOU4hMSfWGlW7BkhYHyxYlYN4l2qJs
	9iXnhSJXiZ52CxbtyeknaoD6eMe73GDTu5eGRWKJyUEz+NcKMG56Dei5Vaf4grdcfn2oKU5/afx
	vWBE+vGIkFjOzbjvLddH4k84fwqOMAgHl3yUkGbM6IsBuHkA03/vhCyAoDuagGwYhik=
X-Received: by 2002:a17:90b:4d86:b0:338:3d3c:3e03 with SMTP id 98e67ed59e1d1-339a6f93accmr5793956a91.35.1759352553788;
        Wed, 01 Oct 2025 14:02:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+adF5Hw1qoHbQQDpjT41fXsJfxm6K0JOkLji8AXIaoSONPxkixcPS43sXq5iToRh0+l8CaQ==
X-Received: by 2002:a17:90b:4d86:b0:338:3d3c:3e03 with SMTP id 98e67ed59e1d1-339a6f93accmr5793895a91.35.1759352553114;
        Wed, 01 Oct 2025 14:02:33 -0700 (PDT)
Received: from [192.168.1.9] ([117.244.71.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4f6adc7sm583074a91.27.2025.10.01.14.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 14:02:32 -0700 (PDT)
Message-ID: <845ea929-d245-44b1-a0f5-2ea67ca595d9@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 02:32:21 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
To: Connor Abbott <cwabbott0@gmail.com>, rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
 <ks3ppjsy35wka2at5nxrr74l5mvzr4l6ovm5ncohanu2gn3ytl@gt2mzwjehq73>
 <CACSVV00AFEJVti7BryA-_sosmBKCuDtX7+NEi4aL4X98AqR1Qg@mail.gmail.com>
 <CACu1E7H0Y9wLwN=ztx+YSQLMQuqOF0hYPqvF-VdXyFW65og6og@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACu1E7H0Y9wLwN=ztx+YSQLMQuqOF0hYPqvF-VdXyFW65og6og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dd96ec cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=2kejHg7nZSoTgEpwAwsXNQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=FJEtwSaB2erPM9T07OEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: hkgG7BCMMJLYwr5laNncVaB9Pppmv9Z-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX7SxAqBhUCD1n
 riBo3ASTWlxn7T1btkLd0l4mC7EUQTd1XMQk8W1cWPj1OvWdBYKOt2/BU2kAmAXN9Nv9TNdrUGb
 d/hS0E/Lyx1+MeAwQZcYvPaa7JPHX7wbffuLu0usKaS71Sz52CGadAo6q8Mf7q0+owscFzp4buO
 5iD/aYeHVRS0W9OzVTItZT4p5OL1Hlz9CXsaT17giPPSc9yY8/v26BVH+8IgP2TtXVrxzr/YwdG
 LXb4u20WdMzNRsnJBRIZl4ixnP4G7mzIqSbAyZsaOS/545/sv4xy55r4Ts7eCgGSp0TSp8FISV5
 3h+e1NhDQKV4/Qa/b0L1u39nvLLYxbtD1szLli8xD36gAJqTQRXiUwR3uxwqDgBRcuxl6y0Ef6H
 qZoFPeD3axmZ/otT1i1ATwN9SixUEg==
X-Proofpoint-ORIG-GUID: hkgG7BCMMJLYwr5laNncVaB9Pppmv9Z-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_140237_412448_2EA6819F 
X-CRM114-Status: GOOD (  24.14  )
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

On 9/30/2025 2:11 PM, Connor Abbott wrote:
> On Tue, Sep 30, 2025 at 10:08 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>>
>> On Tue, Sep 30, 2025 at 12:43 AM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>
>>> On Tue, Sep 30, 2025 at 11:18:17AM +0530, Akhil P Oommen wrote:
>>>> A8x is the next generation of Adreno GPUs, featuring a significant
>>>> hardware design change. A major update to the design is the introduction
>>>> of Slice architecture. Slices are sort of mini-GPUs within the GPU which
>>>> are more independent in processing Graphics and compute workloads. Also,
>>>> in addition to the BV and BR pipe we saw in A7x, CP has more concurrency
>>>> with additional pipes.
>>>>
>>>> From a software interface perspective, these changes have a significant
>>>> impact on the KMD side. First, the GPU register space has been extensively
>>>> reorganized. Second, to avoid  a register space explosion caused by the
>>>> new slice architecture and additional pipes, many registers are now
>>>> virtualized, instead of duplicated as in A7x. KMD must configure an
>>>> aperture register with the appropriate slice and pipe ID before accessing
>>>> these virtualized registers.
>>>>
>>>> This patch adds only a skeleton support for the A8x family. An A8x GPU
>>>> support will be added in an upcoming patch.
>>>
>>> Consider this lands in a commit message. What would it mean in the Git
>>> history?

Commit text is not just for git history. This sentence is for a reviewer 
who is going through the patches one by one.

>>>
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/Makefile                      |    1 +
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c             |  103 +-
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h             |   21 +
>>>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c             | 1238 +++++++++++++++++++++
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h           |    7 +
>>>>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml     |    1 -
>>>>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |    1 +
>>>>  7 files changed, 1344 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>>> index 7acf2cc13cd047eb7f5b3f14e1a42a1cc145e087..8aa7d07303fb0cd66869767cb6298b38a621b366 100644
>>>> --- a/drivers/gpu/drm/msm/Makefile
>>>> +++ b/drivers/gpu/drm/msm/Makefile
>>>> @@ -24,6 +24,7 @@ adreno-y := \
>>>>       adreno/a6xx_gmu.o \
>>>>       adreno/a6xx_hfi.o \
>>>>       adreno/a6xx_preempt.o \
>>>> +     adreno/a8xx_gpu.o \
>>>>
>>>>  adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index bd4f98b5457356c5454d0316e59d7e8253401712..4aeeaceb1fb30a9d68ac636c14249e3853ef73ac 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -239,14 +239,21 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>>>>       }
>>>>
>>>>       if (!sysprof) {
>>>> -             if (!adreno_is_a7xx(adreno_gpu)) {
>>>> +             if (!(adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu))) {
>>>
>>> Here and in several other similar places:
>>>
>>>                 if (!adreno_is_a7xx(adreno_gpu) &&
>>>                     !adreno_is_a8xx(adreno_gpu))) {

Ack

>>>
>>>>                       /* Turn off protected mode to write to special registers */
>>>>                       OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
>>>>                       OUT_RING(ring, 0);
>>>>               }
>>>>
>>>> -             OUT_PKT4(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD, 1);
>>>> -             OUT_RING(ring, 1);
>>>> +             if (adreno_is_a8xx(adreno_gpu)) {
>>>> +                     OUT_PKT4(ring, REG_A8XX_RBBM_PERFCTR_SRAM_INIT_CMD, 1);
>>>> +                     OUT_RING(ring, 1);
>>>> +                     OUT_PKT4(ring, REG_A8XX_RBBM_SLICE_PERFCTR_SRAM_INIT_CMD, 1);
>>>> +                     OUT_RING(ring, 1);
>>>> +             } else {
>>>> +                     OUT_PKT4(ring, REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD, 1);
>>>> +                     OUT_RING(ring, 1);
>>>> +             }
>>>>       }
>>>>
>>>>       /* Execute the table update */
>>>> @@ -275,7 +282,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>>>>        * to make sure BV doesn't race ahead while BR is still switching
>>>>        * pagetables.
>>>>        */
>>>> -     if (adreno_is_a7xx(&a6xx_gpu->base)) {
>>>> +     if (adreno_is_a7xx(&a6xx_gpu->base) && adreno_is_a8xx(&a6xx_gpu->base)) {
>>>>               OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>>>>               OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
>>>>       }
>>>> @@ -289,20 +296,22 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>>>>       OUT_RING(ring, CACHE_INVALIDATE);
>>>>
>>>>       if (!sysprof) {
>>>> +             u32 reg_status = adreno_is_a8xx(adreno_gpu) ?
>>>> +                     REG_A8XX_RBBM_PERFCTR_SRAM_INIT_STATUS :
>>>> +                     REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS;
>>>>               /*
>>>>                * Wait for SRAM clear after the pgtable update, so the
>>>>                * two can happen in parallel:
>>>>                */
>>>>               OUT_PKT7(ring, CP_WAIT_REG_MEM, 6);
>>>>               OUT_RING(ring, CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ));
>>>> -             OUT_RING(ring, CP_WAIT_REG_MEM_POLL_ADDR_LO(
>>>> -                             REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS));
>>>> +             OUT_RING(ring, CP_WAIT_REG_MEM_POLL_ADDR_LO(reg_status));
>>>>               OUT_RING(ring, CP_WAIT_REG_MEM_POLL_ADDR_HI(0));
>>>>               OUT_RING(ring, CP_WAIT_REG_MEM_3_REF(0x1));
>>>>               OUT_RING(ring, CP_WAIT_REG_MEM_4_MASK(0x1));
>>>>               OUT_RING(ring, CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0));
>>>>
>>>> -             if (!adreno_is_a7xx(adreno_gpu)) {
>>>> +             if (!(adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu))) {
>>>>                       /* Re-enable protected mode: */
>>>>                       OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
>>>>                       OUT_RING(ring, 1);
>>>> @@ -441,6 +450,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>>       struct msm_ringbuffer *ring = submit->ring;
>>>>       unsigned int i, ibs = 0;
>>>> +     u32 rbbm_perfctr_cp0, cp_always_on_counter;
>>>>
>>>>       adreno_check_and_reenable_stall(adreno_gpu);
>>>>
>>>> @@ -460,10 +470,16 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>       if (gpu->nr_rings > 1)
>>>>               a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, submit->queue);
>>>>
>>>> -     get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
>>>> -             rbmemptr_stats(ring, index, cpcycles_start));
>>>> -     get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
>>>> -             rbmemptr_stats(ring, index, alwayson_start));
>>>> +     if (adreno_is_a8xx(adreno_gpu)) {
>>>> +             rbbm_perfctr_cp0 = REG_A8XX_RBBM_PERFCTR_CP(0);
>>>> +             cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_COUNTER;
>>>> +     } else {
>>>> +             rbbm_perfctr_cp0 = REG_A7XX_RBBM_PERFCTR_CP(0);
>>>> +             cp_always_on_counter = REG_A6XX_CP_ALWAYS_ON_COUNTER;
>>>> +     }
>>>> +
>>>> +     get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_start));
>>>> +     get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ring, index, alwayson_start));
>>>>
>>>>       OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>>>>       OUT_RING(ring, CP_SET_THREAD_BOTH);
>>>> @@ -510,10 +526,8 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>               OUT_RING(ring, 0x00e); /* IB1LIST end */
>>>>       }
>>>>
>>>> -     get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
>>>> -             rbmemptr_stats(ring, index, cpcycles_end));
>>>> -     get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
>>>> -             rbmemptr_stats(ring, index, alwayson_end));
>>>> +     get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_end));
>>>> +     get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ring, index, alwayson_end));
>>>>
>>>>       /* Write the fence to the scratch register */
>>>>       OUT_PKT4(ring, REG_A6XX_CP_SCRATCH(2), 1);
>>>> @@ -706,8 +720,11 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>       /* Copy the data into the internal struct to drop the const qualifier (temporarily) */
>>>>       *cfg = *common_cfg;
>>>>
>>>> -     cfg->ubwc_swizzle = 0x6;
>>>> -     cfg->highest_bank_bit = 15;
>>>> +     /* Use common config as is for A8x */
>>>> +     if (!adreno_is_a8xx(gpu)) {
>>>> +             cfg->ubwc_swizzle = 0x6;
>>>> +             cfg->highest_bank_bit = 15;
>>>> +     }
>>>>
>>>>       if (adreno_is_a610(gpu)) {
>>>>               cfg->highest_bank_bit = 13;
>>>> @@ -818,7 +835,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>>>                 cfg->macrotile_mode);
>>>>  }
>>>>
>>>> -static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>>>> +void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>>>>  {
>>>>       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> @@ -868,7 +885,7 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>>>>       lock->dynamic_list_len = 0;
>>>>  }
>>>>
>>>> -static int a7xx_preempt_start(struct msm_gpu *gpu)
>>>> +int a7xx_preempt_start(struct msm_gpu *gpu)
>>>>  {
>>>>       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> @@ -925,7 +942,7 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
>>>>       return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
>>>>  }
>>>>
>>>> -static int a7xx_cp_init(struct msm_gpu *gpu)
>>>> +int a7xx_cp_init(struct msm_gpu *gpu)
>>>>  {
>>>>       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> @@ -993,7 +1010,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>>>>               return false;
>>>>
>>>>       /* A7xx is safe! */
>>>> -     if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
>>>> +     if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu) || adreno_is_a8xx(adreno_gpu))
>>>>               return true;
>>>>
>>>>       /*
>>>> @@ -2161,7 +2178,7 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
>>>>  void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert)
>>>>  {
>>>>       /* 11nm chips (e.g. ones with A610) have hw issues with the reset line! */
>>>> -     if (adreno_is_a610(to_adreno_gpu(gpu)))
>>>> +     if (adreno_is_a610(to_adreno_gpu(gpu)) || adreno_is_a8xx(to_adreno_gpu(gpu)))
>>>>               return;
>>>>
>>>>       gpu_write(gpu, REG_A6XX_RBBM_SW_RESET_CMD, assert);
>>>> @@ -2192,7 +2209,12 @@ static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
>>>>
>>>>       msm_devfreq_resume(gpu);
>>>>
>>>> -     adreno_is_a7xx(adreno_gpu) ? a7xx_llc_activate(a6xx_gpu) : a6xx_llc_activate(a6xx_gpu);
>>>> +     if (adreno_is_a8xx(adreno_gpu))
>>>> +             a8xx_llc_activate(a6xx_gpu);
>>>> +     else if (adreno_is_a7xx(adreno_gpu))
>>>> +             a7xx_llc_activate(a6xx_gpu);
>>>> +     else
>>>> +             a6xx_llc_activate(a6xx_gpu);
>>>>
>>>>       return ret;
>>>>  }
>>>> @@ -2561,10 +2583,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>>       adreno_gpu->base.hw_apriv =
>>>>               !!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
>>>>
>>>> -     /* gpu->info only gets assigned in adreno_gpu_init() */
>>>> -     is_a7xx = config->info->family == ADRENO_7XX_GEN1 ||
>>>> -               config->info->family == ADRENO_7XX_GEN2 ||
>>>> -               config->info->family == ADRENO_7XX_GEN3;
>>>> +     /* gpu->info only gets assigned in adreno_gpu_init(). A8x is included intentionally */
>>>> +     is_a7xx = config->info->family >= ADRENO_7XX_GEN1;
>>>
>>> Is A8xx also a part of is_a7xx? What about the A9XX which will come at
>>> some point in future?

I think this is okay for now. I have a separate patch which reworks the 
cx_mem initialization. That will completely remove the above ugliness.

 >>>
>>>>
>>>>       a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
>>>>
>>>> +
>>>> +int a8xx_gpu_feature_probe(struct msm_gpu *gpu)
>>>> +{
>>>> +     struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>> +     struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> +     u32 fuse_val;
>>>> +     int ret;
>>>> +
>>>> +     /*
>>>> +      * Assume that if qcom scm isn't available, that whatever
>>>> +      * replacement allows writing the fuse register ourselves.
>>>> +      * Users of alternative firmware need to make sure this
>>>> +      * register is writeable or indicate that it's not somehow.
>>>> +      * Print a warning because if you mess this up you're about to
>>>> +      * crash horribly.
>>>> +      */
>>>> +     if (!qcom_scm_is_available()) {
>>>
>>> How can it be not available here?

Just in case someone loads Linux kernel in EL2.

>>>
>>>> +             dev_warn_once(gpu->dev->dev,
>>>> +                     "SCM is not available, poking fuse register\n");
>>>> +             a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
>>>> +                     A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
>>>> +                     A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
>>>> +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
>>>> +             adreno_gpu->has_ray_tracing = true;
>>>> +             return 0;
>>>> +     }
>>>> +
>>>> +     ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
>>>> +                                  QCOM_SCM_GPU_TSENSE_EN_REQ);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     /*
>>>> +      * On a750 raytracing may be disabled by the firmware, find out
>>>
>>> It's a8xx-related code, why do you have a750 in the comment?
>>
>> This is actually related to >= a750..  from a brief look it seems like
>> the whole fuse thing can be split into a helper and shared btwn
>> a7xx/a8xx?
> 
> It seems like we can just reuse a7xx_cx_mem_init() with maybe some
> slight changes to the generation check instead of copying and pasting
> it here.
> 

I forgot to squash this duplication. Yeah, we can reuse a7xx_cx_mem_init().

> Connor
> 
>>
>> BR,
>> -R
>>
>>>> +      * whether that's the case. The scm call above sets the fuse
>>>> +      * register.
>>>> +      */
>>>> +     fuse_val = a6xx_llc_read(a6xx_gpu,
>>>> +                              REG_A7XX_CX_MISC_SW_FUSE_VALUE);
>>>> +     adreno_gpu->has_ray_tracing =
>>>> +             !!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +
>>>> +#define GBIF_CLIENT_HALT_MASK                BIT(0)
>>>> +#define GBIF_ARB_HALT_MASK           BIT(1)
>>>> +#define VBIF_XIN_HALT_CTRL0_MASK     GENMASK(3, 0)
>>>> +#define VBIF_RESET_ACK_MASK          0xF0
>>>> +#define GPR0_GBIF_HALT_REQUEST               0x1E0
>>>> +
>>>> +void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off)
>>>> +{
>>>> +     struct msm_gpu *gpu = &adreno_gpu->base;
>>>> +
>>>> +     if (gx_off) {
>>>> +             /* Halt the gx side of GBIF */
>>>> +             gpu_write(gpu, REG_A8XX_RBBM_GBIF_HALT, 1);
>>>> +             spin_until(gpu_read(gpu, REG_A8XX_RBBM_GBIF_HALT_ACK) & 1);
>>>> +     }
>>>> +
>>>> +     /* Halt new client requests on GBIF */
>>>> +     gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
>>>> +     spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
>>>> +                     (GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
>>>> +
>>>> +     /* Halt all AXI requests on GBIF */
>>>> +     gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
>>>> +     spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
>>>> +                     (GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
>>>> +
>>>> +     /* The GBIF halt needs to be explicitly cleared */
>>>> +     gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
>>>> +}
>>>> +
>>>> +int a8xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>>>> +{
>>>> +     struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>> +     struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> +
>>>> +     mutex_lock(&a6xx_gpu->gmu.lock);
>>>> +
>>>> +     /* Force the GPU power on so we can read this register */
>>>> +     a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>>>> +
>>>> +     *value = gpu_read64(gpu, REG_A8XX_CP_ALWAYS_ON_COUNTER);
>>>> +
>>>> +     a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
>>>> +
>>>> +     mutex_unlock(&a6xx_gpu->gmu.lock);
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>>>> +{
>>>> +     struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>> +     struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>> +     u64 busy_cycles;
>>>> +
>>>> +     /* 19.2MHz */
>>>> +     *out_sample_rate = 19200000;
>>>> +
>>>> +     busy_cycles = gmu_read64(&a6xx_gpu->gmu,
>>>> +                     REG_A8XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L,
>>>> +                     REG_A8XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
>>>> +
>>>> +     return busy_cycles;
>>>> +}
>>>> +
>>>> +bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>>>> +{
>>>> +     return true;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> index 9831401c3bc865b803c2f9759d5e2ffcd79d19f8..6a2157f31122ba0c2f2a7005c98e3e4f1ada6acc 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>>>> @@ -90,6 +90,13 @@ struct adreno_reglist {
>>>>       u32 value;
>>>>  };
>>>>
>>>> +/* Reglist with pipe information */
>>>> +struct adreno_reglist_pipe {
>>>> +     u32 offset;
>>>> +     u32 value;
>>>> +     u32 pipe;
>>>> +};
>>>> +
>>>>  struct adreno_speedbin {
>>>>       uint16_t fuse;
>>>>       uint16_t speedbin;
>>>> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
>>>> index ddde2e03b748f447b5e57571e2b04c68f8f2efc2..c3a202c8dce65d414c89bf76f1cb458b206b4eca 100644
>>>> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
>>>> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
>>>> @@ -4876,7 +4876,6 @@ by a particular renderpass/blit.
>>>>  <domain name="A6XX_CX_MISC" width="32" prefix="variant" varset="chip">
>>>>       <reg32 offset="0x0001" name="SYSTEM_CACHE_CNTL_0"/>
>>>>       <reg32 offset="0x0002" name="SYSTEM_CACHE_CNTL_1"/>
>>>> -     <reg32 offset="0x0087" name="SLICE_ENABLE_FINAL" variants="A8XX-"/>
>>>
>>> Why?

This chunk should be part of another patch. Will fix this. Thanks.

-Akhil

>>>>       <reg32 offset="0x0039" name="CX_MISC_TCM_RET_CNTL" variants="A7XX-"/>
>>>>       <reg32 offset="0x0087" name="CX_MISC_SLICE_ENABLE_FINAL" variants="A8XX"/>
>>>>       <reg32 offset="0x0400" name="CX_MISC_SW_FUSE_VALUE" variants="A7XX-">
>>>> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
>>>> index 5dce7934056dd6472c368309b4894f0ed4a4d960..c4e00b1263cda65dce89c2f16860e5bf6f1c6244 100644
>>>> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
>>>> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
>>>> @@ -60,6 +60,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>>>>       <reg32 offset="0x1f400" name="GMU_ICACHE_CONFIG"/>
>>>>       <reg32 offset="0x1f401" name="GMU_DCACHE_CONFIG"/>
>>>>       <reg32 offset="0x1f40f" name="GMU_SYS_BUS_CONFIG"/>
>>>> +     <reg32 offset="0x1f50b" name="GMU_MRC_GBIF_QOS_CTRL"/>
>>>>       <reg32 offset="0x1f800" name="GMU_CM3_SYSRESET"/>
>>>>       <reg32 offset="0x1f801" name="GMU_CM3_BOOT_CONFIG"/>
>>>>       <reg32 offset="0x1f81a" name="GMU_CM3_FW_BUSY"/>
>>>>
>>>> --
>>>> 2.51.0
>>>>
>>>
>>> --
>>> With best wishes
>>> Dmitry


