Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CDDC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZN8p8GVvhL0vSLM98/0aC/exCQwg55pHhJkfI+byc3Y=; b=dYHO4jPzoYNzOkYdPF08L8pBuU
	ETcqZGlQzEJx25XxV1E0vn8+Goi8jIb2yOKEXFmVOvfY9WJlQRKhRwtLZGrZw2pMh+KXSsqHuJKHd
	XrHFLZIZHNfIA52rPB5mcZgnCJDXjhsRlhrgfpHYnj9VekhUqlO64IR83lw9q5MGjg/5RtxpM4CKA
	dRi1jLWEi/55RP7Ivoby+XMHrAm64IyXjuk1iZDpMcJaZnS0IIwpi+BsS/WFDp2NqdsZ31icuJvx6
	cL5AUbKGCZADYaGw9Lm1FJfwGJH/prhqO3O8RJ9AtBMy2EVg+swWO1GBpSwf5TJZ0MOuxcdVMdhOR
	jAM3STmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgLe8-00000009Hqj-3NCt;
	Sun, 05 Jul 2026 12:08:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgLe6-00000009HqG-19p8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 12:08:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6651sXcO396636
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 12:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZN8p8GVvhL0vSLM98/0aC/exCQwg55pHhJkfI+byc3Y=; b=P8gyfHdUAKSYbw5F
	ebPDrmUaIX13Jvn7JpP3n+q2E1UyjZJPvFp1eFAxNT5r9u5//qLxaHYmrmLHJ1QB
	rU6mbCndxiBnsUpoWGzNIxON+uFnzuEJjJiR/vblAOxOhgzg421bfw+xBSUNyN3v
	dECLnkLM9iGPoO0cjONObMCUB3R1zLv5WEXtgnGlOfImdbX24ZtX/2OEsrFZ+s+V
	0hlfG17GbXz4VT/5JNWGKdSV3kvOrYRizXR81CsilZXcgfVSVbmI6i+0VBalQQ7B
	owMYY3wAmNW4t7tV1dMLajYQtYISi2YPKOpvUZGFHG2ONseW1h4n4GVRtwvOiLx1
	D0HV1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8ujm34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:08:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3840994b0d2so1485193a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 05:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783253303; x=1783858103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZN8p8GVvhL0vSLM98/0aC/exCQwg55pHhJkfI+byc3Y=;
        b=hYQL2vPkZjOn4g7wZc6/o7Hxkms8fAK8KWbcyYvWMqfpQ/g2mDIKD0oQuYtT7lmDLQ
         GUeYCKymtKghMqXMjGMSq3Aqq43w9YAosUYWuHAU5bWxWLgOaaCvhE9q00aHtYex4o/C
         dX47s81I/OpM0QwJ+6UBr4I9qakt9cYd+V7Gfm18gk0XR8Iim5b4ld32VKsO3teIdwQF
         QhyD1R05jGU83ZAlzx/wg2R7dccCqvKiJLynV+sq9Sb3VZ6DNwlBEWYQiH5BfVN0B9aR
         KXtyzBh0gyXYMvKSJBR96xbeUC1cKfHK2ukpAe93Z7gwkZe6hJFOyEPCqgrfXRpnADiD
         GVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783253303; x=1783858103;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZN8p8GVvhL0vSLM98/0aC/exCQwg55pHhJkfI+byc3Y=;
        b=bQQGSvKmZXNh0vRAkU324MX6D5wxn3I6ypYG701qnR8i7Cz4BRms2DhBlMWI8+v5gg
         Enc7N7hJRjSr/XOyudlbHzjXoA7YzLi979iyBdKwg9kNnKIfPcu5ox8uU8f+gYgeivzZ
         Ekhh88kb8IReV4F1hhP3kIGIWmr9LLyoWEaD9RrHQGFY1Lw526M+kbgokF8DxkRUqZx9
         UIVp7I54rbpyNqDKmpx4X1numXud65uNcWm9zFs5YXh8geXpKMj3mM9KD98CDj3DbNnE
         FaUYSL+e8FQr3lUTMBuEPdueSr65NmEvDcifaYdTOPCeUAvFTcO7mGJhtnRn9mFVzpwn
         A4DQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSn/HtrkU9HUMGwXMLQZdK+jL20gKBFmwlULlKKiDbsE5ketzzVaNAp2QU9TVb/ciHWECEEaI6BNtuN0Nh9pJY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1r3E37ddh1oRs/s1dyC5Mi+X+eGdJE65G7h88CBJjk61ARTbH
	zl4kDzmnDxOOiYDdgCjGmXmndRCXiKZONiYZfw1WCUlOS1pnCym9lEwsgtVytd0H9oy2bRir1C7
	U2qB/PP5CmtsENxoKj02pFtUiyUcNKUSU5Z/iQLvR/CsVphREX7FOl5c/uJJtVFP/HxIxWr8lEf
	qcqA==
X-Gm-Gg: AfdE7ckTzaKWkBfg8kdm2ifwIyNum1elUWoS1H+N6B5hWdigDGJjFdTUUJgsN1HFVqy
	b8pm3wZPqO/4W7bGfkol5HJshaRiyjt2gAHoqNkbsvJ/NhPn++s1quFKBwwJVN3SVgmHFCt/vwU
	X5FOnKeVs3V61RQaROUb8Mwy0Y17bhxaYo6kRmDIyC6Xui70NbO41YD2HLqngLbM46xNo3ThPao
	4YSl9f7wsoyy70wgihAAyln5Lh8PpMF32oSy3omg3JtwkHQuHu/D1oO+d12yWC+EW9JB+8fREHc
	0a53KuyQLlRltcRpii+Ffw+FPD/EODnZXG9chlPFyle48FRJxQoh48A2KtFP/iO0mzJ/i5qAnJN
	0wCaopFotQ8UhETBYhW7+2K0cWdYwSFBj1g==
X-Received: by 2002:a17:90a:da83:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-381122ebe5amr11701444a91.11.1783253303550;
        Sun, 05 Jul 2026 05:08:23 -0700 (PDT)
X-Received: by 2002:a17:90a:da83:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-381122ebe5amr11701402a91.11.1783253303057;
        Sun, 05 Jul 2026 05:08:23 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.234.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31151fff32fsm6354185eec.21.2026.07.05.05.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 05:08:22 -0700 (PDT)
Message-ID: <81c657b0-7e61-4db3-b72c-46c213c707e9@oss.qualcomm.com>
Date: Sun, 5 Jul 2026 17:38:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] drm/msm/a6xx: Increase HFI GX perf level limit to
 24
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-1-6ac53de56314@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260705-kaana-gpu-dt-v2-1-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: is6lplS9HfYRNX6SRgxnb0-Jd9VBD6fD
X-Proofpoint-GUID: is6lplS9HfYRNX6SRgxnb0-Jd9VBD6fD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDEyNyBTYWx0ZWRfXyf3FMenLLGQA
 XEaXvDc04xM0TmJJ+bOIDc4RD0tA0ErJNUz6JIqzLg9kCR/yVtCFm9r7M1UwS8jzwCm7YoA6yRW
 TWrxUZDN68QYy/joPiyX5uUqfFy/ZIo=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4a4938 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b2dfFiZiitoj8S2i2yzycg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PFfvJpCOjzcRVZi79uIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDEyNyBTYWx0ZWRfX3aCdj0+75xSo
 GH2ppxT6yr3eb/dQpvmvyLeYP2n84d8L98xUqeY5I+ljaClFyKGMUmre0uC7sPOGEyhGZnDC/wp
 QLhrbNUevZ5bYfHG8ZYKls2xaxobXBDs2KP5MBFBGFSIK2r0e2zmY3yGzGHd8EdHItxVH7i9M07
 iFr0IbYDFFgQh2cxtKwUDEFvHD/r3NmE8O4shdeOTVreLFSYZQw8wpXXR4Fnz+EWjZJrVnvDgb+
 1NUR/SpwcNrWhTh5pbSwOWzx+DfwXcM05UGDOW4TyG37Mtn/4p46XGbwob4QJ0f5kKG5T6zgL5T
 KVp5Qqj/I+n3ZjyStFMKwgH8FiehwtY3us9/WJ24O+haGOS0yF6Fu8lV/4k0iLd09v4Qa+0naRC
 dA0qIkdmvdbIdggi2CYmhNw6v7NfAtOdI8qZJBMwgzE2D2MoxUasINo05mN2SGXc5K1EgW8ksFY
 gs/VCRN8OtMoSZrfyZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_050826_482957_80D5E0B8 
X-CRM114-Status: GOOD (  17.20  )
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

On 7/5/2026 1:30 PM, Akhil P Oommen wrote:
> Newer Adreno GPUs expose more than 16 GX frequency levels. Introduce
> HFI_MAX_GX_LEVELS and use it to size the perf-table and bandwidth-table
> GX vote arrays, and to derive GMU_MAX_GX_FREQS, so these levels are not
> truncated.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 3f96b10b5f61..62e3fb230cd3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -20,7 +20,7 @@ struct a6xx_gmu_bo {
>  	u64 iova;
>  };
>  
> -#define GMU_MAX_GX_FREQS	32
> +#define GMU_MAX_GX_FREQS	HFI_MAX_GX_LEVELS
>  #define GMU_MAX_CX_FREQS	6
>  #define GMU_MAX_BCMS		3
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> index e10d32ce93e0..f4da73a555c6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
> @@ -5,6 +5,7 @@
>  #define _A6XX_HFI_H_
>  
>  #define HFI_MAX_QUEUES 3
> +#define HFI_MAX_GX_LEVELS 24
>  
>  struct a6xx_hfi_queue_table_header {
>  	u32 version;
> @@ -119,7 +120,7 @@ struct a6xx_hfi_msg_perf_table_v1 {
>  	u32 num_gpu_levels;
>  	u32 num_gmu_levels;
>  
> -	struct perf_level gx_votes[16];
> +	struct perf_level gx_votes[HFI_MAX_GX_LEVELS];

This will break older firmwares (A7x/6x). Luckily, A8x uses
HFI_TABLE_GPU_PERF interface instead of this, which is more flexible.

Will drop this patch.

-Akhil.

>  	struct perf_level cx_votes[4];
>  } __packed;
>  
> @@ -128,7 +129,7 @@ struct a6xx_hfi_msg_perf_table {
>  	u32 num_gpu_levels;
>  	u32 num_gmu_levels;
>  
> -	struct perf_gx_level gx_votes[16];
> +	struct perf_gx_level gx_votes[HFI_MAX_GX_LEVELS];
>  	struct perf_level cx_votes[4];
>  } __packed;
>  
> @@ -144,7 +145,7 @@ struct a6xx_hfi_msg_bw_table {
>  	u32 cnoc_cmds_addrs[6];
>  	u32 cnoc_cmds_data[2][6];
>  	u32 ddr_cmds_addrs[8];
> -	u32 ddr_cmds_data[16][8];
> +	u32 ddr_cmds_data[HFI_MAX_GX_LEVELS][8];
>  } __packed;
>  
>  #define HFI_H2F_MSG_TEST 5
> 


