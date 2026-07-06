Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226C6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVprqCFVdEAD2aWCw5Q12fLKvWtWmKiMoP9O+awDYus=; b=m8gVwJWp6WvzQH/d7BfsIMyoDZ
	CGwaQTSBChpGdmcFxOjyIZXVqHoEIfC+RGj2XWqKsFzO/GOjwTvv7OdWBvMye6b6kddG0o5SthxOW
	xYOwy6XEEhci99AYiHVwl+lZ+Gfb49a/CmwcQlIgHqBiZ0fQwSSPlgE2VzVpdpRusUL0Wl3uHpV5h
	LZXqccdh/N4nEDhc8gcX/nlITb1S9MZK844u5jyJtnEC317DGCDEBty/I6pZAUUIPL8SRAiKN5zdJ
	CuH2EoCr8yAnCe7WZcaiiRFqAa4Bcv7vAK6K32VVCD1VPwPyINkDdv4iR/ITmAncmTXRzBUA99xzl
	hTKxiKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpQR-0000000DUof-3Oii;
	Mon, 06 Jul 2026 19:56:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpQP-0000000DUnz-0bdB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:56:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF8ut990252
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 19:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVprqCFVdEAD2aWCw5Q12fLKvWtWmKiMoP9O+awDYus=; b=ST78Cn0CaHEAkBgQ
	hRRjEv4Z/xXKv2pMOPJkqYAqsxxiYT8or41dWgrQWnOH9cJiSAgKRORgiMr+lok9
	5tyUYKpaSbfYS4wJTiwDGn9JsKqgBBt8PD6L37SJO1XXQ6gva5mwocEWJqFYDvc0
	ujpTfltzo75l9CEPP7rBpbZQAj/QCeetpwFJ8pdaN1+N3cKJfH8YVq+W8vKza5WL
	Bha+6cda/Q0xM9PkaiwdIU6hXe+Afqo151kx0J3vFMLm9fp+o2IlYBtKOAzYFcG7
	0cWdN2uBMOoZUjYHvGBZtdePiaG3jV1Y7aC1gOPh+jPcdnnYhpcyK3T8k4iNmKGq
	IYfdeQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gtpdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 19:56:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2473225a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783367775; x=1783972575; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CVprqCFVdEAD2aWCw5Q12fLKvWtWmKiMoP9O+awDYus=;
        b=jL7bcK6RvGeO9Mf9kH/FVDRQk20IZICM/fjwAd42duPgEGTgz8f29KJbTm/Z+nNC4B
         pAs847lGqo2FSv3J7Vhfo0y42F2dc0MCyltYxR+hyGESVxSF5MR5+RG9pYf27eeEd0Pg
         Xco/8BdxCqTNtPu8XknnWJdqUL6WGbUJURrFMcsnUy98ea5W5vJP0J308qFLFOX/9Mca
         JWVPIor6kqKjnOdh6qjHsKu1ZcWE822xDZciadLR4MIc6o6PaGel2QOGNpVOU5wwHRp3
         wbwx/G1qlPWc9q5Q5+8qT+SO3/u4YKlSp9lkSBGOMwYKhP4AfVqkvbAtWJxFn7rramTU
         XYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367775; x=1783972575;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVprqCFVdEAD2aWCw5Q12fLKvWtWmKiMoP9O+awDYus=;
        b=c7519ky1jp6wFRrk2w0peaYPDeK+HOoLyREqvxINBmH1oVe8v8tUL7jJvXCj8VOp8R
         Fw96XecbP/w3Aox9fMm6BLHtaXdBl1T8tBPoH/q6NFddZK8Zn7f8ovn9x5LMDd/OpFBZ
         y8izh6Ijiw+shb65XEXpLDbPRMHYi3wgzlsoFgvsEqJTCGyr14GX4vPPrnj1bR20UYoR
         MWRMfWWc7nPpV96/30LUdsav+jYhsvxMAHadVanm3TSLOLuIdCxe8a5t58/usxcxKc4I
         XhbjNFxGi5XVnIipMZ1e6xQKxJ8tjZ9x2x76TBU5aV5BW6anu6LzbIV84KFfXbQgczdo
         pYQA==
X-Forwarded-Encrypted: i=1; AHgh+RpUoXgy35mOhzkECbNvFUh1d2zpERnbEfmiHXRYy5SD7eDmEudqQ49N8vUFKYG1BQnUzNgwHAOMnyj7aALpDFdQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy20SH3CuhMOcx0LSZxxofxmnJiM/ErahDB/q7tKUygGViJLSWc
	b9Z5a+LoHW/WN7WQa+c3pCd++Ehco9o+dqUSgqmgh4mTURAOZCEV5ATAXN8jBh3K39TbY5HuJTR
	DQDgoVo8eKyBHbujEUVNM5Dr8W590gmthhGeVQzrq2jd5Ns3bSvsp7RTneCBE+8uebmok/MSH+V
	rh5XHcBFLKfA==
X-Gm-Gg: AfdE7ckY1ofi5+4IP1PwwO9k3a/hqdCcWKbNipBwmkDZLaJ8fbI7Q1k5aGW6WhPycsu
	5e8AlE058sxEGaajgP9GooX0iiqGY9rZnsWb1OqgnM98u1aKyXJXxYwpeTRBxhEzBLRD1yzoJKj
	n2EjsvR5/1BMz1b0m7GEP28J7Jf+rmPVfnjLqCANoyl2Zd0ejzPhW9oT9g3Jz3ZCidyju9nwClQ
	jovjOHdSzEuslyGiXA+7bCmjQJnrjgIpLlYRBIsSWGcYmoVP9z7L3s8BXKASELU7/gUSP4fTwCI
	rDMctb+P6KJz4oKNImmW64U3yBHpznfsnaSeVecaYsxNY0d5xxj4O63VWRhTheY0ue7VhLKsBIU
	sPem5qHGrq3dxhONpxGMhwW2OxSzq2IztpOc=
X-Received: by 2002:a05:6a20:5499:b0:3bf:9e25:1a18 with SMTP id adf61e73a8af0-3c08ef55ba0mr2517875637.52.1783367774857;
        Mon, 06 Jul 2026 12:56:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:5499:b0:3bf:9e25:1a18 with SMTP id adf61e73a8af0-3c08ef55ba0mr2517836637.52.1783367774370;
        Mon, 06 Jul 2026 12:56:14 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.230.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm90197173eec.9.2026.07.06.12.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 12:56:13 -0700 (PDT)
Message-ID: <3dea2be9-7c72-4c5a-865c-139837d294c1@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 01:26:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/msm/a6xx: Add Adreno 722 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-3-c9f1354dbd29@oss.qualcomm.com>
 <f1d1db6e-068d-4b31-b53a-02bdac9d945e@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f1d1db6e-068d-4b31-b53a-02bdac9d945e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oiSBj3O3z9-4wfXFBpCXpYoic8Bi-jq6
X-Proofpoint-ORIG-GUID: oiSBj3O3z9-4wfXFBpCXpYoic8Bi-jq6
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4c085f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fsdq8dFr2Uux402FS9br8A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Gg-SMJLLMV3ST4U2SEgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIwMSBTYWx0ZWRfX9CjxyuOQRu/X
 ZlseD6wTNsJ5ilepj5HtbbpKyTx0SXuekDj7fpApZ52neULg+ImBKpZSRk+kAsjMnHB/g6wMHCe
 E/OaD8W3X0U9ApJcouifDi2a+35J9GcJMGcs1Rj3IUOElu9NvSKn2fNak4zUDtCpy2/NPWvgjYA
 JZwoiAQL4iTrhWS2QiLMvOfRfZ8Ge3EQbWlVlzQWxT/spycS36A2lMF4S8vtar0GVb4PC48xd/0
 AlDNXG+XfSHWL94G7aLox1an6DY5v4UkaJIRELVMNgxsZvDuC5pnHilaoHZurZyNBedPuTvHwVn
 LliOvuGse2Sm264qkdyu+nwTOvM/JuelNzcMjgBUwN90Q3ypQv4y4HAz7j7p21cIs5n3UGj8Evv
 UWKzNMghnjATm8PItfLepjIHPcbIp8sP9cC7/3GIHaFpHkfYWUoe+3Ko0T4a3/re4Syf2KEW2Ot
 W5YIWSzV6CLtanzF2Ig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIwMSBTYWx0ZWRfXyK1dJaJo27A2
 /G4nf8SdKzxq++Uwh/TEHuWiMJxBjnqYjus/gSIfiwc3yhuM9Wcqc40Np4u/r4wFx2hhzZqkYy1
 +NEUXM80NXg4UgZoLPUxChfP4jORWhY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125617_195082_42D3E01F 
X-CRM114-Status: GOOD (  20.32  )
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

On 7/6/2026 2:29 PM, Konrad Dybcio wrote:
> On 7/5/26 10:14 AM, Akhil P Oommen wrote:
>> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>>
>> Add support for Adreno A722, a member of the GEN1 A7xx family. It is
>> derived from A730 and shares the same IP-level configurations: HWCG
>> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
>> Major differences include lower cache/core counts, 1MB GMEM, no
>> Concurrent Binning & LPAC support. Some of the peripheral blocks like
>> RSCC are from A740 that resulted in updates to RSC layout.
>>
>> Add a new entry to the catalog to describe the usual configuration and
>> few additional fixup mainly due to missing CB/LPAC features and updated
>> RSC layout.
>>
>> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -710,7 +710,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
>>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
>>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4,
>> -		       adreno_is_a740_family(adreno_gpu) ? 0x80000021 : 0x80000000);
>> +		       (adreno_is_a740_family(adreno_gpu) ||
>> +			adreno_is_a722(adreno_gpu)) ? 0x80000021 : 0x80000000);
> 
> This is a discrepancy vs kgsl (did you look at gen7_14 instead of
> gen7_17? did you test this on device?)

Both 7_17 and 7_14 are same GPU IP. Yes, this was tested on Eliza MTP.	

> 
> [...]
> 
>>  	/* The second spin of A7xx GPUs messed with some register offsets.. */
>> -	if (adreno_is_a740_family(adreno_gpu))
>> +	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu))
>>  		seqmem0_drv0_reg = REG_A7XX_RSCC_SEQ_MEM_0_DRV0_A740;
> 
> Likewise
> 
> [...]
> 
>>  	/* The second spin of A7xx GPUs messed with some register offsets.. */
>> -	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a8xx(adreno_gpu))
>> +	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu) ||
>> +	    adreno_is_a8xx(adreno_gpu))
>>  		seqmem_off = 4;
> 
> Likewise
> 
>>  
>>  	/* Make sure there are no outstanding RPMh votes */
>> @@ -1100,7 +1104,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);
>>  
>> -	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))
>> +	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a722(adreno_gpu) &&
>> +	    !adreno_is_a8xx(adreno_gpu))
>>  		return;
> 
> Likewise
> 
> You also need to if-out concurrent binning for this SKU

You mean the PM4 pkts? If yes, fw will skip them as NOP.

-Akhil.
> 
> Konrad


