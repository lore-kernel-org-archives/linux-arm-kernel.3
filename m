Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD341C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERl4wTZyWv1vQsjv06YEWQxA6mOQp5u853Smknj5ows=; b=RHy1B4RxtsEG2bznjL0g4wxrr3
	4WJwZH406Kux+7kXLlw0zVpWcnbIjs8nRxpY0uN9xk8zjMCslzbGf8+39svs8vFDz+wftSuzs6fn9
	cQ6hD2kfdcbYP8cioGZM6klxKFRdMsMyr/WxkMZsAlXxyFtrOSkvTfwr0B5RTCAsUbgl7/j3vW+gX
	mOvqa9oyFN30VJO9F8gfbhSHdNNJYcg7Gbv5xLDsvToKHpthc8pbs2IWHCfnhp+6ppOW8aVkLWzU+
	wU3xVLdWLwNDfKJiN99EGQKQLm8m1/NVJb3EcO8Jbb+fa5U0f9zOHdaQyX2pKxTzoT3bidYpq/XWj
	so16uaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfAj-0000000Bx2g-492O;
	Mon, 06 Jul 2026 08:59:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfAi-0000000Bx28-11jL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:59:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666841404156901
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 08:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERl4wTZyWv1vQsjv06YEWQxA6mOQp5u853Smknj5ows=; b=Axhgdy3TrH2DtrJ8
	weETRVwRSctUP3G+Iqa7U//pwX5JnIoG6vEPa5wrZuq0Wy3hmcKd6l8MXeOQj8bu
	WdMq9zkrIgNO66vIBa1vGQF1hlRBin/sFhk5w+wzn8LYN0PL0rD3yWNukq3C2IPI
	CG10qet/6xYlsfT0CyRbbPB5ZfRaXXfThWM7mQ7BnF31txQMtZ6dI/Chd51ZZIRM
	pILhbWV6PNLv3b9rQ8Fdm8Bia+o9612oGW/zVoCNVSAloq7tuMnCDl3YqDTjvPa0
	6vEmuQfc43TMpZTsNxr0OrpJdtW9A+Gv/k31WFpv8Dw/2MVHGEVdiWp3CziEmTEV
	twlSKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h987rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:59:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so20914901cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328362; x=1783933162; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ERl4wTZyWv1vQsjv06YEWQxA6mOQp5u853Smknj5ows=;
        b=X3Ul9jSyWXx4ffnvkP1KmQzZmp6UiYGSTS1kVCM3DAd440LGzoNDgm3WNH6ppbxpjT
         Z9TnPI2SRZVT7oYorvUEcQbFOOo1nV4Y+rjWPR2OP+GKvRnsaS54HfA0KM7tTd1aUioo
         e1bPCJDaHM5lSv3RIyUi4FsUKAcViVNnvs8dxQz9uqu0xjt2HjSe3MqBZR0ejOhObTF6
         XSfNMWMC2AtRW6jGa4WVwr/Gs/7/YBNl+8+Moicy4UTCt4x04mB45KOESbjNfAlVeavp
         doLFSicyBVDLIuPhu2DcLj+VJKMBniqjsVDfRK+BjCpI4PExphIENbCOam6DUfaayCtF
         qyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328362; x=1783933162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ERl4wTZyWv1vQsjv06YEWQxA6mOQp5u853Smknj5ows=;
        b=Oji9HGfV3yqA+XqvjptzqER5gn0S2kSsECW4v7HzT7plll+hc3/SDC84f3ksXDTaJt
         rQsA6gN9kcqG4VxTuJKIDXd1+NnRxL4PMMQwFIYx8rEbDm9ErQr51j5whcu4BgRW84ra
         9VdViI9dQ+uH3YMVK2oUQ5Xscxj9pqEpABtdPygiIExurh6f3aMlpsfIEXi9l5zWRbG3
         lgPkksDPC2WF7H2L/shHYC31XihYdWnuHxQ3MWKvmOMJjJs+trCZ3+rYyDHd+wBLFNDy
         Ta9bvtwsZPhUlqfUQfgQD1JuJAQGM3xe3gpsiVFt7lZlF/vSszcaJS/4h1895piMguLq
         xL2g==
X-Forwarded-Encrypted: i=1; AHgh+Rq4ScP7hoHxOyrwFK06kNvwtpxP/tQmRhUhu++wO4OOzv7W8Bu56DttDKcbOiZuuut5AD6HGGP/qlSNmWP3lT3t@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl9zFxFOwfuI7axxWKgz+D0kj+t+/Xjv0v2r4dJdX7nbl7gK8c
	UQNLpxAd5i4A6JhjxSORJlbkwcCfV8DGdvZjGw+r3oAnq1KRoY8zQBXYT+t02acVySNoc4/Ot7W
	QMXWe3ZvnjNjGUciKuLpxGKZ0UiP0IJ5/0c5mQwmWPHR5eiid0ZiqW8I0IXRBzXODagMg9eKrCS
	JFejp6XDFzWg==
X-Gm-Gg: AfdE7cmUsk2zQUs1G3tnyhCEfM3ruQBjfh2Hjs/D23/AMuaB41bbnjPkBSCaNDKWAsO
	vyWjFGFSslSILj/hcnQ4IYjtbDQy2/0i4/UQEddgYs83yrd/WkxVnS7CIxDXqOi6TkbcrRCXb+c
	kaJQQMmpj0M720y5MosfgyaQE0UohY+AsozEZb988PuRB9eTYcLIe6KTUmuIMWpjBKZma9Mj+EN
	NowuG3/GHWNanbHfmSCs/CLAT8VgHNOzhqbGqNE9dpGbuVSmBVX/fdXUSQ2xZ1047mW6TO4h27C
	XfNfFKzlpm9X9T/PJNrD/2t69FFkra1V4tdt1/fz7RTzvW//C8MU4t2Lm5S8qrgyQHhbVzeMhQ9
	lWfgLDAdgpuJY/WhY3zWqyGaPNn2izjpafzw=
X-Received: by 2002:a05:620a:4405:b0:92b:7420:bd58 with SMTP id af79cd13be357-92e99e0f65bmr827907885a.0.1783328362390;
        Mon, 06 Jul 2026 01:59:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4405:b0:92b:7420:bd58 with SMTP id af79cd13be357-92e99e0f65bmr827904985a.0.1783328361880;
        Mon, 06 Jul 2026 01:59:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60550desm702417466b.7.2026.07.06.01.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:59:21 -0700 (PDT)
Message-ID: <f1d1db6e-068d-4b31-b53a-02bdac9d945e@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/msm/a6xx: Add Adreno 722 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-3-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-3-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GTIMwyxpVt38FW2MXrZKFl-ErptKDiua
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX1xbec0dm/rv4
 wqIgXYQo/LFG7ti+ncajrdRd5xjPf9u9cwviGnTD2wKVv4KKZIYdaN2PmKB1HYbdc9pSmyixZL0
 vpRiMIskaZsPRyfTZQqkDlmnxr1+6cs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX7XlQhgZVVo90
 VDxfkCwaZ6kXvJmrRjkKvY0OmFdZfU5tb4sUZgWh4AXJiuwEzXHs86XmTCgxFvhSMUZI74hwWNe
 48XrIQ8W7SyJ1Chgd6PMgMgCAL4XxbFLzs+m0991WvZ+18B1g/SPJIub1Fm1q2Uixb8iSJBGEPL
 PQotsng79u++DBdMnn5x0h99v2gYTByAJ+E14vI61zNBvcO3eFRDKsJ+/N5YDpcIzKAvW9LH8m/
 mvqrTyhJjvI1mQ8joB9qK8tF4OvvgpksyiYzZYTUqhZAP4F1cpqgIWopZHUnNIegHya6gu0WfCn
 //YFT3pu9fhXyNXHoNuDVwY3BhsByLwF9l1YWeVdYS4jjMrvHY2Nsl3y+U0iYOAvUFWb3+FalIB
 QSJnWSBIuS52JMWnDSuCmCDsqmIobBytDRgGydp3qgFOGzO4cu0qd9maRLiacn76w2KeV7RJlol
 wmZRDILdE/Jt/yU4M0A==
X-Proofpoint-GUID: GTIMwyxpVt38FW2MXrZKFl-ErptKDiua
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4b6e6b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ErYzCqf3RjAp607u9I4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_015924_405541_827BEAF8 
X-CRM114-Status: GOOD (  18.79  )
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

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Add support for Adreno A722, a member of the GEN1 A7xx family. It is
> derived from A730 and shares the same IP-level configurations: HWCG
> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
> Major differences include lower cache/core counts, 1MB GMEM, no
> Concurrent Binning & LPAC support. Some of the peripheral blocks like
> RSCC are from A740 that resulted in updates to RSC layout.
> 
> Add a new entry to the catalog to describe the usual configuration and
> few additional fixup mainly due to missing CB/LPAC features and updated
> RSC layout.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -710,7 +710,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4,
> -		       adreno_is_a740_family(adreno_gpu) ? 0x80000021 : 0x80000000);
> +		       (adreno_is_a740_family(adreno_gpu) ||
> +			adreno_is_a722(adreno_gpu)) ? 0x80000021 : 0x80000000);

This is a discrepancy vs kgsl (did you look at gen7_14 instead of
gen7_17? did you test this on device?)

[...]

>  	/* The second spin of A7xx GPUs messed with some register offsets.. */
> -	if (adreno_is_a740_family(adreno_gpu))
> +	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu))
>  		seqmem0_drv0_reg = REG_A7XX_RSCC_SEQ_MEM_0_DRV0_A740;

Likewise

[...]

>  	/* The second spin of A7xx GPUs messed with some register offsets.. */
> -	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a8xx(adreno_gpu))
> +	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu) ||
> +	    adreno_is_a8xx(adreno_gpu))
>  		seqmem_off = 4;

Likewise

>  
>  	/* Make sure there are no outstanding RPMh votes */
> @@ -1100,7 +1104,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
>  
> -	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))
> +	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a722(adreno_gpu) &&
> +	    !adreno_is_a8xx(adreno_gpu))
>  		return;

Likewise

You also need to if-out concurrent binning for this SKU

Konrad

