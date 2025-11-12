Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D98DCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7J8baXgxyTkhN2ZdMYqtwC3Hhdgc0z63es0iUEKVbE=; b=nGdniUtms20JWKHvDjVXJ+zdje
	bEY3NWzzIcm3ZJXDD2FoCnfTBAklIFiB1HQMHWIdQiNGh2iEJ9fPDKPDrBCkBwpUKfVclrAEeZT8i
	OFiVjZH59w+oEMAByeyAedIvfmvNg5EjQrEUQNJJmFmsBYCgh4OE9UcSuKL/dVD4ZH0suR5dKDMuy
	WMRXZQ5L/SHHTt7p1k0o8fjPxSK0zX5Yx/VS3G7MQeWB/x3hGSNBwzxJR+JSh3I5K3scB98vMj9aX
	2hS2PgnehyfD6H9gcvuevAdJqaVFc0PQPvNDuvA4KrOcsazgX8hUw2Yo13hsdsm70+uWh27bFvzR4
	3SkyGU9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8WI-00000008cdK-0u8X;
	Wed, 12 Nov 2025 10:56:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8WF-00000008ccR-0NGK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:56:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9gjNQ1109256
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 10:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7J8baXgxyTkhN2ZdMYqtwC3Hhdgc0z63es0iUEKVbE=; b=YlTfbT+TpP6Q//J2
	88dZBFYjCM7mJWQbvLvCgNBnt79B1djKmdfOGuzl/+iuS3qaHSbgt8nZm9geeWJM
	EwucGUm3IpaplnqdDfeWTdrpoCVvJeAa0SlphjJx/CipbmbNbfOWCvoG9sMatwTH
	tHQ/dxIhZuY1GhAaGECAtuO+JzvLQACttntfzqIZC7a19Cw7Bzvqfd0Re5N1viYa
	OGTENQuDwMfZhdelpH3rWa43UBIvTuMqKThNYEGIjsZjkllXWb++ZOtls0/VL7U2
	NUr1jhbOIGY/esw833NUGvru2Hdy5K62Xkeftl/wTpZSV2SxrX/ssMhfqEsxgAec
	VRvoBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum0768-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 10:56:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6317be8cso2224911cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762944965; x=1763549765; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7J8baXgxyTkhN2ZdMYqtwC3Hhdgc0z63es0iUEKVbE=;
        b=PoqNfPCYttmahC5KUqpW1+U3E1cWfGtbDm7Yc2O4zyk8blEcNpllZW5zSf4Wy/usmX
         mVbj87FJb1wVORShlpRWf8u3phQWnE02GbvLG6tetjEW21IywGl7/Rjrhc4Hqvl0G3Rc
         viRcbQ4Tjkfm+2vypDGuIR8H2PJQaLvQYVwiXNV2GDXMSoxCaV1D5Sgp1YHeb8xrqCA/
         rSULWsKT4OP8WYYwUjp9baUUmrVVnb7rA6I1DQ2PvZJGvpALY/ezUS654AqYj1qcZXLB
         9MEwIVqmrT/LSGGiCaM4eVH0gMA53q1z1dhA2p0lexKEZ5LIpqXtRmEGvxVkHs6Akmnh
         ZUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762944965; x=1763549765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7J8baXgxyTkhN2ZdMYqtwC3Hhdgc0z63es0iUEKVbE=;
        b=FX5BQpl2v7rWE4JuEIkMII/Dlh1eDya57JWGv3yWJ3rKBleefeG4PJNFRsWsvl6MKz
         QFbAPJeJ6FpXamASHH/L58S/S5fyplM4jjHHSbH/KSJ+PcB6r5CB4A+yZxgPfdt5J4m0
         uayZV1TcDuUq4Jfw+Xq3NIdJ1QgmOosK3MwS2vTrcCwcpCwu1Xj1/b2x/tFdXYqqyNY2
         jRZbshnI6WK6YKtohy6s+kXSHwtkHJBx9TwcG4y/k7DIUbWQXO7WP+7FTVQ4rhER5BcE
         m5FXOoNGWbOn33eU+h2exWWLD4EvFYvAVL+6cltwNJGWdW9LWfoXVrllI4c2e7K3F7WS
         5hFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn3bwLCAyiuwHVTixpA0evH6knseOwK89OShjT2mN/N0Auwu6D4U5IQ7K6MjfvpqOSOCNlftq90tVFel+IorIB@lists.infradead.org
X-Gm-Message-State: AOJu0YzaJnVKagtHffvFrjpgd+/9VfeP3ousEDxaYC6cj3NopZXv/7pz
	pA8Jo7pdA7pxQ9hY50kfV3uex4N1iFf7bpQ/1eRaIKj9izUi5H2uIUCKM8CLrb8g+bXwqu+qWYu
	sw3PTW2IsQxaoxhBIQAbkhTtRAF1NEMgNKRbtOsXgOu27NCq0vNWSh0nOoNwpPHE8HHHeL/8GmB
	CgnQ==
X-Gm-Gg: ASbGncuVimMFXMncVFVuyQ4pLC8jh3qPuV0iQtpqZbSMyPeROU8a9N4KFuAmL3PpA8b
	aIHuHhMshSuPQc4sTwteUM0oNX3O6jxiu/R+TflsKL0g0CltKbpEKGENl92ptvlvmFiZPuKKQhC
	VG+UFUxLOOAVbmtdRfQt4w4MXxuxlI6cwwEzSkpcmUDr9OrUjItIJn+2if/6g0KTonXvFxyYiyl
	HfP/XafjLpFCBk9Rlwh06FfnEXqdGyy0WqSlE+pm0D8zzLADdk4dAFU6sU4DQNPZliT2mXJ1D8z
	jcH67POP2dG0D1bIuIPVEkVbiEu6s8mviSu/5dG2tSmwcz3mhGtW3Fp6/fWPY2tasvg/JNv82In
	l17d0JC7efAHz9S3TznZHGExFuHoTO03uBVPsjOlp9M3NMdykObLhVj2W
X-Received: by 2002:a05:622a:5d12:b0:4ed:de8b:4436 with SMTP id d75a77b69052e-4edde8b4640mr9664921cf.12.1762944965486;
        Wed, 12 Nov 2025 02:56:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHehnHC4uvc/Oy+HlpbxtFmbNd/Io3lA6JdYlICTyBqU+FS0kyknsLAZ4U0LhGMGqz+5Q6+5A==
X-Received: by 2002:a05:622a:5d12:b0:4ed:de8b:4436 with SMTP id d75a77b69052e-4edde8b4640mr9664541cf.12.1762944965047;
        Wed, 12 Nov 2025 02:56:05 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b73381dd3besm103142666b.43.2025.11.12.02.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 02:56:04 -0800 (PST)
Message-ID: <8f1caccc-8a49-4c26-aeb4-f46f81593a30@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:56:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] drm/msm/a6xx: Rebase GMU register offsets
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
 <20251110-kaana-gpu-support-v2-9-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-9-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4NyBTYWx0ZWRfX4D7nSCUQbfQf
 ydP9VbI6P7rpn7csv2w52pdOLxVZ19JrdUHfkDjPdTI9W+Z3adyTMiOwidKf5bK4ydp17qbR20M
 27an2FxrPMCh+ysPjoAbIIqkoHYQ9DYdPGtSiMGFWlyJYbErwxihGvfyG8WfboSLAwIfFiRRtJI
 HTIGRnJMzquQlKyjK/G/2+LsWqX5zDTdgS9hPvK8mIbth2UBdctDN1udjVzL/ZVORDKDpRsb0dT
 RAeJYpgDlDNJu/mLMa7PAGz9AKXIaaWtoeKaxu8C5YEJfDxwsG0A2+JSy92OBgr25G2gP9BwP47
 uvsFkyMhrazuGrRneMlBCj0QWAZQ9OQT4+ueGBjUDsu72rfp0lILmb6yEkZ8wz+ZwgJQcQWRlwj
 1GLdTGTiNfjoKvJjUgk0oMzVIHOwUA==
X-Proofpoint-GUID: AQOvr_h2T40bZBkuxUqloqHpCUS9PplY
X-Proofpoint-ORIG-GUID: AQOvr_h2T40bZBkuxUqloqHpCUS9PplY
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=691467c6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LTedVN9yYKzQwah-PCsA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_025607_248225_D4C2A95A 
X-CRM114-Status: GOOD (  17.81  )
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> GMU registers are always at a fixed offset from the GPU base address,
> a consistency maintained at least within a given architecture generation.
> In A8x family, the base address of the GMU has changed, but the offsets
> of the gmu registers remain largely the same. To enable reuse of the gmu
> code for A8x chipsets, update the gmu register offsets to be relative
> to the GPU's base address instead of GMU's.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

The resulting diff is a little convoluted, but I think it generally
does the right thing

[...]

> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> +		const char *name, resource_size_t *start)
> +{
> +	void __iomem *ret;
> +	struct resource *res = platform_get_resource_byname(pdev,
> +			IORESOURCE_MEM, name);
> +
> +	if (!res) {
> +		DRM_DEV_ERROR(&pdev->dev, "Unable to find the %s registers\n", name);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	ret = ioremap(res->start, resource_size(res));
> +	if (!ret) {
> +		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
> +		return ERR_PTR(-EINVAL);
> +	}

You can use devres here too, devm_platform_get_and_ioremap_resource()

Konrad

