Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB089CEE343
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGfq3+o76gasNqjhRUD5fDSxtMn7/maZ/Vlsn3dafG4=; b=M70n83O/f9aM/BxJwwrbZZ3vJ3
	kSkgbSHzvfg3VSMV00qwR901JI25UNpULpANdW85IGthwViWVEqMYLTPSWyWa2MjPA8tm6S5YiEjz
	MBULFuZAaCwJTjMPGn2hhuiMl8CUpOc7sjmnLim+Kb8iUoM3R7/CEEA0j8HQw3jH97rd623tabhYg
	2B1Ip5BR2nojzV5PnXNSyQP5RVk09TF8G5s+CTOn+N7mXuhhF+1+E/HkjTQvrZkMxYP6OP1qcXy7Y
	tCEH66MZlfwsDWvujeL/PjMiG8sfkK0A1MuGqR/nGJwYqmHK9WJ5+3cGKQfpwuH+GeTBXL8Pt9B7x
	hlviC4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPwf-00000000ta2-2p5c;
	Tue, 18 Nov 2025 17:56:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPwe-00000000tZf-0VCo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:56:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIG4NEB2249858
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 17:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGfq3+o76gasNqjhRUD5fDSxtMn7/maZ/Vlsn3dafG4=; b=VwmT8sKIt895LNEz
	nwSV2POpOiQMw4EJCsVpK5GouVyWWNQZJ1P6cik/hjPgO4GxpurwtjD7LuUnMYb/
	bPWDsi/sXEfi4S4XbTcgu0LrBRo0GYJXljXPaMAy1HqQy46w+FmJZM3bHqzPC1hc
	GkpMr/ezsxZFq8ynz9hbFSU5g5Nh45FC4OBrq+/RBzt2KRz14Obd/pVyhaBNphZB
	R2BBcweU7do7EBFhZTez5gotoEl5BwAluHE2aRi/TUC6HiKkB0RO314WJ2lZZB/K
	cSGPE71k5SWTGHiMbjNPHDdNRjI9/XXy8OccCbSEnVG8YXLYT6lTMfst37Ml9csq
	d1XdFg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnc5hp1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 17:56:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297dabf9fd0so75134405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 09:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763488607; x=1764093407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGfq3+o76gasNqjhRUD5fDSxtMn7/maZ/Vlsn3dafG4=;
        b=ExVOE7AyBoie7DGvFJMvDK8so5pA17hdzyV5du+vdZvFvAimu9ioVeZC8K0+ZqYv6e
         TFSlwrnxAB2ncq/UYiCgRa+1Wr2M/8inLXLfuJoqDxwY1eYjbLAtr1O2K3seu0Kq51Lf
         WBPaJL4qF7mAChW38ZrWBxeF227et9fUhssJyC2hWMH+dhfAmqlCvjNniHsiJQizBZiP
         KizJ31SFIBDOjFy+vvR4wVcp1BqVFMsods721Nh4tbzEh8EOdHrE2dzAgHBQm6Vb3m6v
         WQMT7Gm1bQgq/anG5CLfdu4I7W4ExMT0YxWxHXWrDwUrVYakE2XT9x1JeQ4G2wcvFxRe
         3BUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763488607; x=1764093407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGfq3+o76gasNqjhRUD5fDSxtMn7/maZ/Vlsn3dafG4=;
        b=AWTkax21NSbjvL6J5pbIiTffBQ31a5nv6i7nrpht0Bk1JCP1Vq1b0mgByFrwFqHe6I
         uHKcKJXHSoND7QVLGkPCWtknxmh+Iw+1n44i83/h6vGdF3x6krlEmYJPaRdIFnmIwDOX
         Uqxvl+kVTcsVxBeUsBEXN5e3VYuFkrB+mh2nYitmwCOty2E3YxHwuLK5Wd5RqDPPBWcj
         fcI89/lGy1nQIUxDhmTqQ5NiSngaTAKWd6iL2lccQKiDh28/zinBv1wP3du3rSczJjt8
         PsOC6LzzKJI186SZQNM615gmC0bZodS8sp5BJKNJXX9/P5rFx3Hf6eX1bDbvjY4fCclA
         dF4g==
X-Forwarded-Encrypted: i=1; AJvYcCUVY9SawsesNq68mEtcEi8wMjNALuQMnTfAfMpVr8C6S3ROFj7qvkJrq3wL9yvEBoZqXJJGZSAfbjgGDOemtTov@lists.infradead.org
X-Gm-Message-State: AOJu0YxPlg56JE+A3p2b3p5FEEIHXybiB0fUQB2X/6TkljXeohR48oAg
	Cm6+eZrmj2tQc6OcBj7aIqKsy1+M9qZi4jY36AUDG+f+wuJAuwNQ3D/BgnQIXG48z/2SRKekt4L
	rZmafBd3uQp+diIrqJMhaT4L08vxHU0vvuzpdHXc5knHy7CTwGKlSjfln0IwxiqzFb/Gyvcd4XA
	L1jw==
X-Gm-Gg: ASbGncsfUFNsllacc4cshCunpMhwRnks4m7lrLZVEPbh9rL4GaPWjI6tuI+82lnksKe
	bQ86+k+y/GrHP8a4GMe5D6Y3+sTstk1lbXLJhMUq4uXK3PyNNimmD3SMW3r/Xi83T2BmsNCssCb
	J/Qd4rzZklpP33hLJjWb+KqMPY7eZeaTl4o1i/iVnLqmHqcLLF/DSPRy8q3OH8fPvSi+ppSAAqC
	U+QHSwJuj2c9Qx/E7EMmgxQ+WzVa0Y6GjqvuxB+nAo7GEuR0PXtGBCr3w66AbzrtzJyEoxnOEHP
	C1LgJh/mq25d1vynJUzxt2ZGTO6BQlEWtrGL3UuU//VF17TwBNWv7NOggNeIiD9TC/H+l1q6vdi
	dhFWzfbnk0gWuWWlJ3fqKMRE=
X-Received: by 2002:a17:903:388d:b0:298:8a9:766a with SMTP id d9443c01a7336-2986a76744amr178497785ad.53.1763488606654;
        Tue, 18 Nov 2025 09:56:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQlMErgROQXlsJJoTVKsYRv9QN0O/2YGJMmSrS6nuYJu/7XEVDBts4CiDzoWr4bcLhtAddlA==
X-Received: by 2002:a17:903:388d:b0:298:8a9:766a with SMTP id d9443c01a7336-2986a76744amr178497255ad.53.1763488606089;
        Tue, 18 Nov 2025 09:56:46 -0800 (PST)
Received: from [192.168.1.13] ([106.222.233.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346b8sm181565255ad.16.2025.11.18.09.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:56:45 -0800 (PST)
Message-ID: <dcaaba7e-1073-4900-a4c8-88dac40be434@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 23:26:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/22] drm/msm/adreno: Support AQE engine
To: Connor Abbott <cwabbott0@gmail.com>
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
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
 <CACu1E7HzsnSjz0SiUJT0SMNJ7cFhiNdtUE9jKHpvD3UzG6EegQ@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CACu1E7HzsnSjz0SiUJT0SMNJ7cFhiNdtUE9jKHpvD3UzG6EegQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IYKMLc5iL2OALJuXpsD-alxr89nFnVdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NSBTYWx0ZWRfX+DkMKgajJXG3
 iKM6fJWFAuRNf0Ai4x+8nBj8cGrcIAsttJHahG37rGpLUXR3suT+f2nojphEcWen1Vz/toqDaoz
 TYFhM89LgEnIql8Fols6Ml+yfaivS60GSMmYbaczLgCkUuFLoTJ4h160agANxIc6sqLgw3mkNNb
 c7mVrTmHN5kMrgEeIgCaB0G1mFFx3w84nfqDuNYbFo95L7rDf5ZVwkO00Z440MciVdeyHixHXKR
 +6xYlPbZB84AVXLkve6OVdglHhZFuaqC8j2h2m+A4qUv8HYQR4yEhsPrvi6RF3sCUfSJm7V/CRU
 sQvnlG7TCml4Er6ezTUCKFp2692vhaSAAFj7VqvRCYc51HEhsqaJVe0QSI9UdcnbIj3ceiiXpUj
 j8KpnSx5fKxT3PF7iCiV6hEdnFebIg==
X-Authority-Analysis: v=2.4 cv=BYTVE7t2 c=1 sm=1 tr=0 ts=691cb35f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=/VsID1VB8JbHTH3F2fYZMQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=neJfBgYAGg7YAZYFY1IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: IYKMLc5iL2OALJuXpsD-alxr89nFnVdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_095648_170503_4CF9CCF5 
X-CRM114-Status: GOOD (  25.19  )
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

On 11/18/2025 9:26 PM, Connor Abbott wrote:
> On Tue, Nov 18, 2025 at 3:53 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
>> in Raytracing related workloads. Add support for loading the AQE firmware
>> and initialize the necessary registers.
>>
>> Since AQE engine has dependency on preemption context records, expose
>> Raytracing support to userspace only when preemption is enabled.
> 
> I guess the plan is to expose MSM_PARAM_AQE later once preemption
> records are in place and for now just load the firmware to ensure that
> people have it?
> 
> The interrupt error handling is still missing, but I guess that can be
> handled later if that's the plan.

Correct. The stale 2nd para in the commit text will be removed when Rob
apply the patches.

-Akhil

> 
> Connor
> 
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 22 ++++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>>  4 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 810b64b909f5..9a643bcccdcf 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1118,6 +1118,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>>                 }
>>         }
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
>> +       }
>> +
>>         /*
>>          * Expanded APRIV and targets that support WHERE_AM_I both need a
>>          * privileged buffer to store the RPTR shadow
>> @@ -2400,6 +2417,11 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>>                 drm_gem_object_put(a6xx_gpu->sqe_bo);
>>         }
>>
>> +       if (a6xx_gpu->aqe_bo) {
>> +               msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
>> +               drm_gem_object_put(a6xx_gpu->aqe_bo);
>> +       }
>> +
>>         if (a6xx_gpu->shadow_bo) {
>>                 msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->vm);
>>                 drm_gem_object_put(a6xx_gpu->shadow_bo);
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index e6218b0b9732..3a054fcdeb4a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -59,6 +59,8 @@ struct a6xx_gpu {
>>
>>         struct drm_gem_object *sqe_bo;
>>         uint64_t sqe_iova;
>> +       struct drm_gem_object *aqe_bo;
>> +       uint64_t aqe_iova;
>>
>>         struct msm_ringbuffer *cur_ring;
>>         struct msm_ringbuffer *next_ring;
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index c9cd7546024a..e011e80ceb50 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -627,6 +627,9 @@ static int hw_init(struct msm_gpu *gpu)
>>                 goto out;
>>
>>         gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>> +       if (a6xx_gpu->aqe_iova)
>> +               gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
>> +
>>         /* Set the ringbuffer address */
>>         gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
>>         gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index c496b63ffd41..0aca222c46bc 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -27,6 +27,7 @@ enum {
>>         ADRENO_FW_PFP = 1,
>>         ADRENO_FW_GMU = 1, /* a6xx */
>>         ADRENO_FW_GPMU = 2,
>> +       ADRENO_FW_AQE = 3,
>>         ADRENO_FW_MAX,
>>  };
>>
>>
>> --
>> 2.51.0
>>


