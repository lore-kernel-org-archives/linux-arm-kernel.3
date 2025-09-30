Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CDDCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcDYvvx/kWESRIwdIUfePzUjwXfd5DkiWsQQ0UqQcPs=; b=GITsCMK6V/sPWvL9jLtadLJcAr
	07W6nHeS3pLMM0hJt2BNSSfZgUtsCRwqDgIFRjP6obnljjjx0MXY6zOo1o12eI/xcTvmMkHEw+E1p
	tzPATorYwVMWAsHz55K9Mw41CCB0URtaPWpxZ8le9Y6EBzwcyA5gSdk6fiahDs8XenVi28cJfJ5mY
	brCfPoOlB3D8lMR1hhg6XkhCe2Si/n74Y7g1pMuqgK41k4Oj77K4GM6FzipOOTBuRESFdD6AkPUxD
	5V7q8XKPsv3lf/S0Z8P1dv1P5hieXO2Qcq8q3sbKr1zeCdCeeJwU9THAgcHP7gOeBPX6K6A2FVbI+
	F6EXA1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3V7T-00000004Xk0-2j0e;
	Tue, 30 Sep 2025 07:49:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3V7P-00000004XjC-1OOB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:49:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HVKR017574
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tcDYvvx/kWESRIwdIUfePzUj
	wXfd5DkiWsQQ0UqQcPs=; b=mbPXCIfsnKiNtisq0erGetEyK+l37muV+7YinheB
	bYj644FZBNuf1NgkhSgSbqRlm+TYG5UJuTdvExajM+vrUhtwvopVf/wSpTJ/WkqC
	hu2tYYX0OahWkjx/XHHgJ165uF0Hdl0hZ0NmfphU42nznbmNIJHNgJcE+NtGueab
	od5nvAuCN+cVzlntj3IJiIy7FHLagNgVuDVgefB2uDbvVHjVWmKsT3TunRetSyK/
	SXZxXbuQKgsXBy8egQfp4FHYNPv0FfnA5OKfkxqjjmN2DiFC/r0Lp+ZgdSNra7UX
	qUjV2tDvYdey7K8eKSeHm1dSYSwas7M8x+dBmnqjSl5Xfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tr6ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 07:49:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d6a41b5b66so139351281cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 00:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759218589; x=1759823389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcDYvvx/kWESRIwdIUfePzUjwXfd5DkiWsQQ0UqQcPs=;
        b=lCcrWrEYEiuzBLe79NVsVoOHWn8cjbOi7gYI3y2oEOACSv7cZh6RkcxbUyspRlox01
         L2O1vBZ/I5aB/2M0H/etxIR8miClUlmyFm45Nfuovc10+zGQzqPWbo0Epy6QNQ0tiLFv
         wdymKKzVC4/rhpiIu2XPdy2tVi2lqUumtARsSEraV0y8/5UDoM+vgNy2OYKZ5802bKLt
         Ut6JvjIWUcFda6yY6k0zzSy5ZxsgIb6IP59g4RtleHv303k7xBDQUzX0/Bv34y20Q2Ai
         bYF4K65vF5msWJ4A0sQiK1MhA9r01f7Fn1GDc60Dg2W1t980E5oOCYi55PZs2+9r6mG0
         wdpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlbecpJu8xNmZHR8M0NcFaJjWKJpe7lwAuWkqFnZH+5N1FdS/9kxMqeSZyKMaFmM461mlckZ8TgsoQcpLoCpVN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt4Ln4aZQQ2h00u7yOiQ5rryJsA8b8xP75Ch//xJOtvIIok2ta
	FCOxumzR2JWqdEiSKyIbjIxXKWpi7MFMzoRIzJmUj04I12Qn3RNG6u1trEFqIzIVfjN7Pox+25e
	hS5XNFMgPoeULkhUAQEHLLQ0C1e53bJUqYi7Idv2DGleLFD0hmQqUEbFIVDhBSfU7B32Nxt2VDQ
	kGeg==
X-Gm-Gg: ASbGncuxddS6LwKhRnXBBeY8E6sxLeTmYfXdCJ/QqTI0Ai+HPUpiRtCoLiDYbYRZoFi
	5fsVM3dB9DLq6IkvuQ6MupNqzCiDEP/Nw9hJlzVYXHdN+XuH2rvcnWMvIIaGAf070UB1KDiqjkL
	cub6mNn3B1dB1FWL6lt/HCdH8pG5VwRbdbyvEVG/fBK8uZqWooOKgVenHrzBSHPWY/+twPfdhk3
	6JuhqUK587gmPOtenWIQbgJxw8eYhjJoja23aUqhcX75qzPcfBwbz4p3QGDffD7OEKEfvssfVDr
	GDiFmuE7OValKaP36mxpc4i3cYhP9wI+0GAtWt0IXh2sU7yFIxd+DsV60UxcmBN6XM54Xts5lbE
	Ews9D0/2k7lgOGaa8jKqTl+Pa/qO3j0mr6PDXPB83E2L9ZVODVtSoO5CVaw==
X-Received: by 2002:a05:622a:17c3:b0:4e3:25d7:57d4 with SMTP id d75a77b69052e-4e325d772ffmr15078641cf.80.1759218589257;
        Tue, 30 Sep 2025 00:49:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1NOqQxAPdQp+Dh3rh+AoIDtXwXlBUdceAQk5B9YJWaQLrY/hOzC1FHHQS6Zz8p9Hkpk4YgQ==
X-Received: by 2002:a05:622a:17c3:b0:4e3:25d7:57d4 with SMTP id d75a77b69052e-4e325d772ffmr15078221cf.80.1759218588705;
        Tue, 30 Sep 2025 00:49:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58567242ef3sm2908507e87.19.2025.09.30.00.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 00:49:47 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:49:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
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
Subject: Re: [PATCH 15/17] drm/msm/adreno: Do CX GBIF config before GMU start
Message-ID: <ae2ooybajk6mcjggeztumubht6auw5qlhmsdrblikc5ruoxtmm@oj5kvpxithva>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-15-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-15-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfXzMEAo3zEkdFc
 oPsi0Gq+kpsmV7QybfZ0cMSamZFatQ7NKBnpwx4oRoBdHsOEYX8S5H4sGELwGdPmWRGBtgShpJa
 DJYrnABVZno38AWAV8kHaPkcvDO9BXN58YbvA1uMmYKGxjrRj24G8hbmNnu29IxcG3nn0NfYLZR
 yt9LQ+zSCyiCdxZF+OHcOADQiJpr8y4l0ylnu6Dgz7TmSgH6QukDHsPOTDcHgrUJF/bdKwQFr33
 28iVQAbvnWK+7jo9zVPP0TESuxoZMK72WahrrwBnT7PS5+vcbNvFN9Lb6Bo45xzUfOIzfjmvxsl
 4aFww08mfNhjLutFac+x0VL/acH6CuYV9ejentcOYS0Mb2PO8ofzVaXvnz+cKF115jIXZNlkwh0
 Wd2XUUxUSIyp5g38bDwYS6t/O1/DmQ==
X-Proofpoint-GUID: yTga1MtzNGzbMdG3Wb9Gdtfvzl73G-Cu
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68db8b9e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=219S4Ll1wpRkBpzXM0IA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: yTga1MtzNGzbMdG3Wb9Gdtfvzl73G-Cu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_004953_100347_E7711CD8 
X-CRM114-Status: GOOD (  16.36  )
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

On Tue, Sep 30, 2025 at 11:18:20AM +0530, Akhil P Oommen wrote:
> GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
> configurations before GMU wakes up. Also, move these registers to
> the catalog.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Fixes tag?

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 12 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 17 ++++++++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 10 +++-------
>  5 files changed, 49 insertions(+), 14 deletions(-)
> 

-- 
With best wishes
Dmitry

