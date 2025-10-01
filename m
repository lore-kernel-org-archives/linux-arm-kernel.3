Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BBCCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 22:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tahmT1PTe+yL6IlloLfwZS8CDuOsIe0H/cgXQSKTibY=; b=W/38miRQN/yvS0R0aztj84bqvg
	fjiXr/Wb5jm3X2w7UjE1YXztf+CoQYH/uFBNJv0l0ocmiIBM7hzzHLkqG3fuw0zdhhe1xnXouqG11
	+rCE5BhzLb9UTe8XGEFbsGED/Lo4wSppL2d9N43pihphEdWUG8yaYz0lxMLlxRm49eYtHHeTM9MwZ
	trP4f/amyG4WlrHkeLJ0YngG97hoZ1c4qrQpO+cqmfqf/yIy1Cw3dCJI5KBAIseoBNgJLpiggUH1k
	cqvt2xF7V1XhpPzonppDAmh30UgEVKEuiwClnw2n5JRryFY4uVVY0XUewldT1tSAfyA9aouXaHEaT
	S+zZP0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v44s4-000000096Ef-2z3h;
	Wed, 01 Oct 2025 22:00:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v44s2-000000096Dz-1cji
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 22:00:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic8kS008546
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Oct 2025 22:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tahmT1PTe+yL6IlloLfwZS8CDuOsIe0H/cgXQSKTibY=; b=CgHtWHf4QYacRtFJ
	F55IPjX3GrlHxD9+Uk2GBUIWvPe04OJTlGfiOBLVizXpsvXq2htqbPQIxYB8YQLL
	I+01S/mg2sXAa7/wg/4t8NA1nGxdG62QHOoKkse6x6Fc6nEtSHHPlQS7oP9XGNEQ
	spwVW+ry0HYHyHGtE4p2L0xIEesd0dmOmoH1MT6P0CQiriUpb2bo203GkdzY8M+h
	sh3Qxv/guKzd1GbQTBAaAtVwZnZ4aM1aUA/n9MusX7I2H5bskLKK0Bblg2LS9ikR
	6Q/OUmO0yWuWb97dyyT/wmVpFnYercQ1EuTL/FI+7W/GaDtETryK2nr8/q7OlOqG
	Z4+Ulg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr9d55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 22:00:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78038ed99d9so509666b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 15:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356015; x=1759960815;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tahmT1PTe+yL6IlloLfwZS8CDuOsIe0H/cgXQSKTibY=;
        b=q+arTdz/ws/EubblfFsx1M46r0ar+3p7FusvB2DiSeteLd50dRsWOYewnhC4Mfzgje
         WNCpwW9Xxw4SuICoX1u8d+f51PIJ9P8vlrU6RkWeZKDDdpSaBj0gwzMTmuiK2FWhBKkk
         TblpXZDxmTNJgm9uHqVYnJKECEGOX9xZa2ZZIIPX53s+tR4w1itf37hok1GsVzvgj4nq
         Q6k8T6AbBXQ4i2cOriQL2IQfVyMB+gDiNm6kDt7AtmsxB9P4wFSkt12ev/CgvVIoWAMl
         87VnCdXv0lb0kWSknURVJ76cwem+OgGcjwr0arMxZqx5ufE3AG1r41KAU+2V9uBhbnIk
         NUcg==
X-Forwarded-Encrypted: i=1; AJvYcCX9nS52H/Bip7QjprqLuxlnAdtXS7vHPnR/d5J2WHbDE+X6KrD6eYz+ybrM8UZP5UBvS6n2fuk5JiNX9lemGVOx@lists.infradead.org
X-Gm-Message-State: AOJu0YyWOS15VmdIHOQs/Hm8wwWn/LfrqzEiT7tf6YJfc1wJvTZXheNi
	iwCAAKat7K7VGV1nt/WX/+PX+OOO/fIkDTk6OrR+dgpQaGFehLk99f7yGXKB6WPb0/uDJnOaSy+
	WeqYVYBJG4xeSzN1pYrjKUxDoQIAPQmKHLZsQN6hevBUiixoqUvItzzb3/QDr9J4CWFMLNyEnrP
	/Peo5MFrwVHw==
X-Gm-Gg: ASbGnctE/ZHn8DiNGf7+Yy8v9oSX5NxHg/fmfK2QTEQ7waUFO8w2kni000fe7AxibnW
	p77ANZKDxQIwsmcg8zAruHeOIVH8TMjT3dwum5apUEyLnd9GBv4k88MDHKvYzHhGyEdsIRTuzdu
	wIb8vFTlVJLD1DVHhvqQvjM1L0aLXA2jM8+9tyvprFU6kjUZ1YEyYRGlc+U0gR4yFjgrszgNipC
	wDtFff0L1RKbHxM8z2XfrcewgXLJmQisQxKhMQtfhUMp/JkYzp8RQWbFmC1zFn5gV5sh1NdUOrI
	B+6dk6nBdMsVfLcT1wjlxxaPXKm0ezv9iXBs834F5kkhi8qguXdHEVLHFOpRAeaGs8w=
X-Received: by 2002:a05:6a00:98c:b0:781:b23:6b7e with SMTP id d2e1a72fcca58-78af41efa31mr5716891b3a.15.1759356015498;
        Wed, 01 Oct 2025 15:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHifSlan3h5RBjjCLPaJeaE4EOWmKdwWuMjDg/ZbUeJT6bjRGbcINV4nFTXqWDsiHfMn8qoQA==
X-Received: by 2002:a05:6a00:98c:b0:781:b23:6b7e with SMTP id d2e1a72fcca58-78af41efa31mr5716824b3a.15.1759356014792;
        Wed, 01 Oct 2025 15:00:14 -0700 (PDT)
Received: from [192.168.1.9] ([117.244.71.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b020938b1sm636738b3a.83.2025.10.01.15.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 15:00:14 -0700 (PDT)
Message-ID: <26e29a80-df70-4ffb-9cc0-8b1ab74873ce@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 03:30:04 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 13/17] drm/msm/adreno: Support AQE engine
To: rob.clark@oss.qualcomm.com
Cc: Bjorn Andersson <andersson@kernel.org>,
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
 <20250930-kaana-gpu-support-v1-13-73530b0700ed@oss.qualcomm.com>
 <CACSVV01UygpiUj0m_Ppd_LSxvW0MFunz+Lfhg20XHR7vyOBx7w@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV01UygpiUj0m_Ppd_LSxvW0MFunz+Lfhg20XHR7vyOBx7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX+dEBpXITZaaF
 vWgMnnBQfAbLZ+BrakTVJK1YNheJZujPbaCcVCr8ydvFz+fEz4H/+7GgvJJekl+mE0H+0L0WoNs
 puz/cNEVCYvhp+DpCn2792xMP2dh/IxRiHgO0uZ6/opBm7g+O5UdF7+i76pNHPoJO6g0u+8TUrm
 R7p8QCqw/VbDFwKGFKj3yE3D4LP9USRh+o3G5xfC/ikN/ARU52LZK6cNeW3f4FnEMyUMDNJ9JxY
 5Y1GdjoVOOD26x9fGqxWG3x/B6EYOPwHrPZ6IfqJmmNdR6wsgkcYboZqVLZIyf+brIS4upanuXj
 TJgepAFp0PR5//G2brilQnoge7n7y5KiCI8gV0EWqhw7acdgVWqYxY6s1/KzbTZvhTBLwoG1uSb
 QkMarNAq0cE6n18s+IHui7b8WSn8sQ==
X-Proofpoint-ORIG-GUID: cHLSVlPeEwucLjfWxVFk86RKlbXeP2OF
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dda475 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=2kejHg7nZSoTgEpwAwsXNQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=neJfBgYAGg7YAZYFY1IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: cHLSVlPeEwucLjfWxVFk86RKlbXeP2OF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_150022_544202_C5ABF94D 
X-CRM114-Status: GOOD (  25.47  )
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



On 9/30/2025 1:57 PM, Rob Clark wrote:
> On Mon, Sep 29, 2025 at 10:51 PM Akhil P Oommen
> <akhilpo@oss.qualcomm.com> wrote:
>>
>> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
>> in Raytracing related workloads. Add support for loading the AQE firmware
>> and initialize the necessary registers.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 24 ++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>>   drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>>   4 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 4aeeaceb1fb30a9d68ac636c14249e3853ef73ac..07ac5be9d0bccf4d2345eb76b08851a94187e861 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1093,6 +1093,30 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>>                  }
>>          }
>>
>> +       if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
>> +               a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
>> +                       adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
>> +
>> +               if (IS_ERR(a6xx_gpu->aqe_bo)) {
>> +                       int ret = PTR_ERR(a6xx_gpu->aqe_bo);
>> +
>> +                       a6xx_gpu->aqe_bo = NULL;
>> +                       DRM_DEV_ERROR(&gpu->pdev->dev,
>> +                               "Could not allocate AQE ucode: %d\n", ret);
>> +
>> +                       return ret;
>> +               }
>> +
>> +               msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
>> +               if (!a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->aqe_bo)) {
> 
> a6xx_ucode_check_version() doesn't do anything for aqe fw (but also
> a6xx_ucode_check_version() should probably bail early for a8xx at this
> point?)
> 
> OTOH if over time we keep growing the version checks, we might need to
> re-think how a6xx_ucode_check_version() works.  But that is not a now
> problem.

Copy-paste miss. We can remove a6xx_ucode_check_version() until there 
are some security or any other major fixes in AQE firmware.

-Akhil.

> 
> BR,
> -R
> 
>> +                       msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
>> +                       drm_gem_object_put(a6xx_gpu->aqe_bo);
>> +
>> +                       a6xx_gpu->aqe_bo = NULL;
>> +                       return -EPERM;
>> +               }
>> +       }
>> +
>>          /*
>>           * Expanded APRIV and targets that support WHERE_AM_I both need a
>>           * privileged buffer to store the RPTR shadow
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 18300b12bf2a8bcd5601797df0fcc7afa8943863..a6ef8381abe5dd3eb202a645bb87a3bc352df047 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -58,6 +58,8 @@ struct a6xx_gpu {
>>
>>          struct drm_gem_object *sqe_bo;
>>          uint64_t sqe_iova;
>> +       struct drm_gem_object *aqe_bo;
>> +       uint64_t aqe_iova;
>>
>>          struct msm_ringbuffer *cur_ring;
>>          struct msm_ringbuffer *next_ring;
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index 6a64b1f96d730a46301545c52a83d62dddc6c2ff..9a09ce37687aba2f720637ec3845a25d72d2fff7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -599,6 +599,9 @@ static int hw_init(struct msm_gpu *gpu)
>>                  goto out;
>>
>>          gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>> +       if (a6xx_gpu->aqe_iova)
>> +               gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
>> +
>>          /* Set the ringbuffer address */
>>          gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
>>          gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 6a2157f31122ba0c2f2a7005c98e3e4f1ada6acc..3de3a2cda7a1b9e6d4c32075afaadc6604e74b15 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -27,6 +27,7 @@ enum {
>>          ADRENO_FW_PFP = 1,
>>          ADRENO_FW_GMU = 1, /* a6xx */
>>          ADRENO_FW_GPMU = 2,
>> +       ADRENO_FW_AQE = 3,
>>          ADRENO_FW_MAX,
>>   };
>>
>>
>> --
>> 2.51.0
>>


