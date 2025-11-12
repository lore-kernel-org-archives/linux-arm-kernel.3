Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A2DCD484D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 21:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akUL7PFUD7ZtgXkGMHVEnif1hzpe+FepoSGWQH2GuzU=; b=dbEyvx+q/Wp7Umd90S87r0p+Pv
	TVkcBEFoDKio91XTgV/eH5iHPWJKCBhZ1WEBJgamuPUcPsA2lKJAyRNC/B0APLQmr8IOVh46f+zOC
	+peF9oOrHp0CWFDUOjkR3bMer4wXk1mldIMOZXlc3JDG0KT+gJRUs0iYrJ4PBmju2OpYC01FjWbzS
	yhKT2G5HaKqku458LxQeaGjhzaNhbNC61a//1saKnOSKitmrLrmAAoB34l+f4UQ/7NE1j2y4uadgb
	atQn7INykp+KaF5nqeltAc9fsCxi/z4TJYnGIBPsoppsKe6OnS/CwHrUx7p4obFDqH4+p5dwM/a0S
	Xav95OsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJIUR-00000009XeJ-1bPh;
	Wed, 12 Nov 2025 21:34:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJIUO-00000009Xdl-2cHr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 21:34:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACGp4N41001861
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 21:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	akUL7PFUD7ZtgXkGMHVEnif1hzpe+FepoSGWQH2GuzU=; b=fqcUSt9okdwq+O/A
	nofu1KSHZH1rUmDP8mvBPhnE2B/5LEJnP2vLLPI9vEF/iNvu0DyLGh50G+KEI+WM
	LRHkj9REyt/WxYPE3lDn3Gcg3uNjO3bXMOB/nc16urhbV5yAEMZ4PYdGSioWaVpn
	RKSBZosefZPp8G9k91rMLS/e9/liDN5xCLcAL/fL/ZO2TvjCCZBgtjG6wCi7Jw8k
	mH4dBfMQlPOG4+0g+SISllVJzHNXK45YBd+Tdo6YrRwfmQZhK5DJCjkN4WtZpi1F
	c4S6aYUEWrMmN/sG5crNNt1IZj94DAJcmmXVmfMTyIL7ygrj+IlEi9zKe8wbWieJ
	ANYvcg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqq22682-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 21:34:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ba265ee0e34so101042a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 13:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762983290; x=1763588090; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=akUL7PFUD7ZtgXkGMHVEnif1hzpe+FepoSGWQH2GuzU=;
        b=WXOgEJo2TkG2HtDomeK+HLVODp0vj+AtpeRN4YSLvRGY5vELL2bK+SOcbYwvw8Ehgc
         xWWX5OXucjIvIySi03/cQ3lUVzpDICFSWw4bgJIyVjN+KI+3ouA35pOYjT1+bek39Qwv
         Zoi6veeLhbXq389Rv6bB6k6l4LMs3Tj7LN1e7/YXrC92YFAu5j2mYYW574+Mo6T2bSJg
         0rZInm2xqvyt6JWBz+t2xaaJHCuxTJt3Pw7v787f4wCg4JQJ+QH5fCNARvcRZVvVtuPs
         0ZI+y1zKOc3tkdDcSjpWECJa6AgxyIbmhWC4wv2agP53d/cz3wEWAdJC1dOobiXVHfdN
         Qt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762983290; x=1763588090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akUL7PFUD7ZtgXkGMHVEnif1hzpe+FepoSGWQH2GuzU=;
        b=EpEyeQClWe60okKxNrU1zolggGk38/68ZH+6YEJ5lzA+bJcB+iOckJ5ykVZRhMPs9O
         IQUIEpbVJk+LEza4iYpzeabieSI3MjRMJdOgR7g+o8L/g2g96QsLd3xIB+2emEnaQzoF
         5M8YnH4thIZhFrGD5QHi9Vtjk814+KTz/kvNh9yqpckZgmEXEL9lksorjifiIqDThS0f
         SViZhR4k8YMrKzlIrmjaGP2jFkGlZGyNGKZiafWpjKyqRmilHl3DXcdQptNgXRJImj3g
         CDpFBxDFYvmoGrswEGGiqE3gU+SpZNt2XgW9avl0wSsmHAEkXv1m7UTq0RffkaRVM8AM
         0GGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlJaymlOC7ZWUnl38pkQFyLZRAKQQbEegaqq9GPcwav27Mxb4yUPQorVf27TC+SsAx6CzSqXou6uhw4632ERlG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+7WzkUUovCD3CZxBG3+53YQPMC4SARuBnAm9McWP6spDXTEA2
	k5kR32ZVLEZpVf1PGd/Rnk8EcmpieqvFlSafe6NDBQ5debGbw6nYx89gvxmnI6QaIUYDGEDQvC2
	bG1Ox30guOdwImZAp81gGYfJqlJSOfAJVnKu9EcscaZi+W6TD8d05GNzTsavExQU+2NNIGr22uk
	FzaA==
X-Gm-Gg: ASbGncsP1IoBhZWMmxuk2kFzzVwrImbFkzzFlCb5RO5viqem8Lcf2k64fKiux8wtNJ/
	ZN8ESS/BiveT6dR7+2agNUJnUBI9A6GQPGWuc1K5AOllTKVvRBLwRRDEopheC+vgBl5RLGmoSW3
	54wvsS3gle/msnOVD4RsXs6dY9znA05rB+nLCa7uv6BX9x/vozRoHRCZbKG/Bom37o6gscq8YR0
	IiAR9tHwH0Dtzw5mcwnjZeZKf7gQUzRo0ps55Wx8DLr1o/XUWEB7kNaw9OLxNMbTOxCQq8fh8Z4
	U5paotsv0yd3xRbFCOpUE8Mok0x3txUWN9FdTfA5V17YIgwkIRV7nuq/BHKHvPUS0BtZ4BR1Hge
	R3flOH72a+PgK6CGH9A/TBg==
X-Received: by 2002:a05:6a20:7f8a:b0:340:db9b:cff7 with SMTP id adf61e73a8af0-359090967d7mr5549508637.5.1762983290333;
        Wed, 12 Nov 2025 13:34:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGex9yMVhli943u5iSx/utgvoPxPJzj5p0bexquPM0bky2PiZDhb0Iyz19ikO+MPy/f/zNHCw==
X-Received: by 2002:a05:6a20:7f8a:b0:340:db9b:cff7 with SMTP id adf61e73a8af0-359090967d7mr5549466637.5.1762983289783;
        Wed, 12 Nov 2025 13:34:49 -0800 (PST)
Received: from [192.168.1.5] ([106.222.234.47])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37818885fsm46671a12.38.2025.11.12.13.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 13:34:49 -0800 (PST)
Message-ID: <13c39ab6-f054-4552-a033-819906af29d5@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 03:04:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] drm/msm/adreno: Do CX GBIF config before GMU
 start
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
 <20251110-kaana-gpu-support-v2-16-bef18acd5e94@oss.qualcomm.com>
 <ae21a963-696a-48f3-af91-ee72aef4b60d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <ae21a963-696a-48f3-af91-ee72aef4b60d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EbHFgfmC c=1 sm=1 tr=0 ts=6914fd7b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=2IP1oaZ8+KUWsYovLW0HHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9a4g6yj39E2whjoMmyEA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: CX7QkYZF2JiBHm7o80pmB2PYn5Y_VzfX
X-Proofpoint-GUID: CX7QkYZF2JiBHm7o80pmB2PYn5Y_VzfX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE3MyBTYWx0ZWRfX5uGLiim89dMO
 eb8dV7KUm117LRVpTfB3HIaW8OpEr07hJUIP55PYxIQWSO0mznTADJh4eLkqf7QxESwu4fXSJW9
 4hr+cPgDUC3s/DKrBhUorcVYrsfWGad9coRTOJbzDozU1LeGwsPEm0nlG1rlbgFX+GDhZmNbo53
 fIYren3cDFmZTRVuLfzmDgNRvsOXYk9S9GnvvjysZIIRumx+Fjel5311A28CD8q+gRnEINnDdup
 QxvL3U8WPEnxhbhpgdZdLBD49dX2TwQlwFtuuVX/thgb2dKP1XDPVT4O3kfr/wHhYUCKtkILpnT
 Q5rLsbwaj9993IbTps6ysZXotzg61S8jkG4PSShmN8O3y3dAna0e4FGwKI6A9SuvbXuzXcFxVte
 zeEAOW5Dbtva65eQu6bBcTq/QhSn0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_133452_783956_E0C9BEE0 
X-CRM114-Status: GOOD (  26.47  )
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

On 11/12/2025 4:07 PM, Konrad Dybcio wrote:
> On 11/10/25 5:37 PM, Akhil P Oommen wrote:
>> GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
>> configurations before GMU wakes up. This was not a problem so far, but
>> A840 GPU is very sensitive to this requirement. Also, move these
>> registers to the catalog.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
>> +	for (int i = 0; (gbif_cx && gbif_cx[i].offset); i++)
>> +		gpu_write(gpu, gbif_cx[i].offset, gbif_cx[i].value);
> 
> We haven't been doing this a lot in the GPU driver, but adding a
> .num_entries-like field is both more memory efficient and less error-prone

Gbif config array is reused a lot. So this is more memory efficient in
this particular case. But generally I agree, we should stick to one
scheme. We can revisit this later.

> 
>> +
>> +	/* For A7x and newer, do the CX GBIF configurations before GMU wake up */
> 
> duplicate comment
> 
>> +	if (adreno_is_a8xx(adreno_gpu)) {
>> +		gpu_write(gpu, REG_A8XX_GBIF_CX_CONFIG, 0x20023000);
>> +		gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
> 
> Either set this prio value here, or in a8xx_gpu.c

We should remove the other one.

> 
>> +	}
>> +
>>  	/* Set up the lowest idle level on the GMU */
>>  	a6xx_gmu_power_config(gmu);
>>  
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 029f7bd25baf..66771958edb2 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1265,17 +1265,20 @@ static int hw_init(struct msm_gpu *gpu)
>>  	/* enable hardware clockgating */
>>  	a6xx_set_hwcg(gpu, true);
>>  
>> -	/* VBIF/GBIF start*/
>> -	if (adreno_is_a610_family(adreno_gpu) ||
>> -	    adreno_is_a640_family(adreno_gpu) ||
>> -	    adreno_is_a650_family(adreno_gpu) ||
>> -	    adreno_is_a7xx(adreno_gpu)) {
>> +	/* For gmuwrapper implementations, do the VBIF/GBIF CX configuration here */
>> +	if (adreno_is_a610_family(adreno_gpu)) {
>>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
> 
> a640/650 family GPUs didn't receive a .gbif_cx addition in the catalog to match>

Oops, I missed that. Will fix this. Thanks.

>>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
>>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
>>  		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE3, 0x00071620);
>> -		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL,
>> -			  adreno_is_a7xx(adreno_gpu) ? 0x2120212 : 0x3);
>> +	}
>> +
>> +	if (adreno_is_a610_family(adreno_gpu) ||
>> +	    adreno_is_a640_family(adreno_gpu) ||
>> +	    adreno_is_a650_family(adreno_gpu)) {
>> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x3);
>> +	} else if (adreno_is_a7xx(adreno_gpu)) {
>> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x2120212);
>>  	} else {
>>  		gpu_write(gpu, REG_A6XX_RBBM_VBIF_CLIENT_QOS_CNTL, 0x3);
> 
> Downstream seems to set QOS_CNTL at the same time as QSB_SIDEn for
> these targets

This register is under GX power domain, so we can't configure this
early. This should be okay.

> 
> 
>>  	}
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 031ca0e4b689..cf700f7de09b 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -46,6 +46,7 @@ struct a6xx_info {
>>  	const struct adreno_protect *protect;
>>  	const struct adreno_reglist_list *pwrup_reglist;
>>  	const struct adreno_reglist_list *ifpc_reglist;
>> +	const struct adreno_reglist *gbif_cx;
>>  	const struct adreno_reglist_pipe *nonctxt_reglist;
>>  	u32 gmu_chipid;
>>  	u32 gmu_cgc_mode;
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index 2ef69161f1d0..ad140b0d641d 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -500,6 +500,9 @@ static int hw_init(struct msm_gpu *gpu)
>>  
>>  	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
>>  
>> +	/* Increase priority of GMU traffic over GPU traffic */
>> +	gmu_write(gmu, REG_A6XX_GMU_MRC_GBIF_QOS_CTRL, 0x33);
> 
> Kgsl (later) added this for A740 too - would it be beneficial to enable
> unconditionally on gen7+?
These are actually recommendations coming from HW designers for each
chipset. So we should just stick to that. I will check separately about
a740.

-Akhil.
> 
> Konrad



