Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73ECFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 11:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6kbSqYZzJcGS2gc3yj0gG/zi1Gf5AJhMNDlMIMu6Qc=; b=EqcyWnON3wZF5NCBRShu7/V7mb
	ZRh07mSJLbWpIDzj0+dMHQpojwptMbawrCdSYzuNitSWcGe+0aLtQTNFyCeurOVK1joMLAdyxJL7H
	C2XrNthjRaENlxd7NSdpBwoeT8XSKZp3RTfGlg4Bv/Me1MoOqi0+00R3PpBOU2yJ0VVGJQSQyRJpC
	Qv7SDB3ZLDNCeR7oBrLrRQxgMLDptOs/Gay4ZX+iFawomCXb7a959qMoafapgGCrSKjOCY+ck0wRX
	0U+d/L6/2N2BuI5vvFPhKBdf8a6Y2AFHcllgQKNcQSe3jwTApxdLDIo+CWLpWO3vg1+dsX3ERf0v1
	QHPLNwyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgem-00000001LoX-2VUe;
	Tue, 28 Apr 2026 11:31:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgek-00000001Lns-1EKA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 11:31:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9l3UL1329248
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e6kbSqYZzJcGS2gc3yj0gG/z
	i1Gf5AJhMNDlMIMu6Qc=; b=jQ5hqlpDoI5BgghzDD08b6QhYBNPnGVP59FNl306
	RKI4JmoDxQR2wC7GVpKTCu78SEiIPsFPP4UQybMmKVR0No4kDAOvDwk/fQp+AwQs
	lbaZ6d80X3JWDXqFIJLGyBiLLyhLS7dzfryR5dbIiPcTx6ahGVYsnJnkss1v2KdP
	MsMRubDrpKOLP9yHj582DYpcqyP9dmBO4sAr0MB9HBWPrIzaCfeBf2qptnqfPvVt
	+fV+m/tg55TUGIdHToBbmCbWqp4MPb9aX5fQkCVZRXH131IgHgRl+iiBPr2w/+lL
	tqw14LubPn0tZkEOyoC8FBb+Qq0UOvr4ug39jHyNQhF8wg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhahkxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:31:09 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-68cfc614246so1232348eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 04:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375868; x=1777980668; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e6kbSqYZzJcGS2gc3yj0gG/zi1Gf5AJhMNDlMIMu6Qc=;
        b=fF7DC+TIWAKjy6yXeJIjWfFG+avmtg5tdw6VP3C+Agrh4K3I6vlWKX7iBHG6kDjAab
         +Q5Xn07ka4fKlwUoBBHz4kiN7rvDMvPx9voNVb76pyHHljFXmsOlUnBlJ3vJnrSi1M/i
         Aluk1rUvj+n08T5PGhXvOf65yFU4tdCb+eMMlb93UEVctuJOolq2CO9vYpGAwE86AQja
         XF61r+PtC/oG0EvYAEYElCRKXh/Vz7eX3+16m7Scrl2dIdTat2nujLedq5Yr9yPBXuvN
         ZECsq50QEQxtAvShgY6Yzfg1vFtnimWlr/OBziY17644UumOwMSm3GVgwBpS06JhZV4s
         CIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375868; x=1777980668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6kbSqYZzJcGS2gc3yj0gG/zi1Gf5AJhMNDlMIMu6Qc=;
        b=DS9zeZSAsRcwchSUtK6OAJQgb4LsOO9wHR2phYfp4phF4Ya2jgIaWAVY2NR4C620cP
         GZWNHEMezSOfAdBfcHH9vsffQOWafWMZJyOZDhhc7PIVbkGknwY90OIa+u0W6n9yctht
         RbK4K4lrVKDFbhsAvVm1Ls7sq6ndi00xPYy4gCZULYgvA64EOAI6esKrqMjQEnFkF/dD
         AL8+ic1d9rgryURrl5NxVCIxEfsIdLMN/CZUFghfS+5RKN1mYTHe/uej3XX+Sa+kbmCp
         KdE/s7z84zmGbJ+AiVWKNzUyyRYPEMTzF0KZganBVRtXVPvn4eYDZJPDgz0cQU2S28jJ
         RNeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yvye0zZ3ZYNDXEVl0yVSscJWnXXY8el6x0RVnL5qwEyM87ulkMeFNIU6N1e8rrYXUO4AC2jIrUpRl+/tIdYku@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/G5WTjLvk3Ex+92WuiE6M+UtwEfOcukgOj19g3g+g/jA+0D1I
	mz38K7K6FT0xGFDsFl0EQMsV5SVNr/zmOvvVZJSh8x+ZNYSNQFJBI6Q/gqP+SO4rcPSDb/VMUEp
	xqw1yRX1WlBsUsPuLd2nKe3VWotCLXcH3gBSLGLRMspTL1rt1pFCOXQfI/3AAXOhivqL1xDB45j
	0cLQ==
X-Gm-Gg: AeBDietUQz+q1D9ifdwAS/8KE+tOEvmW7qtepVK8tFtis1rtaw0cMCHXhrFFylIOv63
	tyv++1guS3iCrhO2PXs5/5CQO4NT4L2rDtntwnsfnCn8YXXZZlb2uhZ56tcZe5MIxldp9R1HU22
	LF439TsQRhpTahS6k2KS+4HXsveEqvXsKQ7gPOR0rNDT1iT+0jk6egt3ZJX/WdQ01MG1kKrJGP6
	KQKrLWD2J1wL3Mv16T0Xr6eQbitp9nN5fWBhTMETvDcFv9CSr82vkpRXefyvSH6p+1YgeI2MYvh
	lnHyj7Ub/OHwWJ8XGvCVlTQZpzk1nnj6dcxgtKJ/HB143JRHvdvZc41VG3N0M8kNDvZMCxTSAT+
	IZAlU9sMkaa2Y232aOkkMd4SUSuRqItiAsUZXX4l0c3ekhdXHwfOlOZuPlNVWCq8s/t6k8B0/Qz
	LVWf/pdL3i2ZZhbpuYZa5XTMds5X8bgYH0KhlojVrilc4L1Q==
X-Received: by 2002:a05:6820:1b05:b0:694:914f:c18f with SMTP id 006d021491bc7-6965ca69f0emr1224716eaf.3.1777375868614;
        Tue, 28 Apr 2026 04:31:08 -0700 (PDT)
X-Received: by 2002:a05:6820:1b05:b0:694:914f:c18f with SMTP id 006d021491bc7-6965ca69f0emr1224690eaf.3.1777375868164;
        Tue, 28 Apr 2026 04:31:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5f91sm548695e87.43.2026.04.28.04.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:31:07 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:31:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/11] drm/msm/hdmi: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <4zlmusbxhafoevbprgxempl7yjmhc2cvo2xozlt4yhcnwa247z@ac6xhtfrc5bz>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-3-4300744a1c47@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-3-4300744a1c47@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfX+pbkX7pt82pb
 Ub9HcBue640adHFMyFpsWrOJ6zje/I5SEZLfcfNanKe2Nw6SnOJu1MsPlKW9UUoA8amLgokPaGu
 HzMVq6hKvaLiqPg1JiU/WddusGnb9aubGde0ulZnROgrMBjN/I4tBUGVd/qcbfueyAISOPj5/aN
 mrwsxxJB7zkIMwdcp1XdFpD6GwMuYnEq2A1/eegLTvFwlMGwiaDlXwXYFq7WHcV7sxO9/WV/8iD
 nze9fLC+Ne8VhFjfYOv7NUqkCfB6xKXAgsEDVv//xE/5QjMRFYlqhIp4/v4gq1qDm92XE5A1uVa
 w3FWP7sVxk07jdHGIwMDv3myFn1eGPyM4Pb9FlCGj2MFefay5D0k3D/rVwwhRsqXew6iqbeUKSj
 4SN84CQ9Swbauff4Qa3vmcoWSS0NwYMRV0Ht5HD83HTUbLBgpEJ7KcAg77NUtvjn2itsRdlepC+
 nQQ75x6vVP3CSeTnpYQ==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f09a7d cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=hXVsb92WUBna0ZnZifYA:9 a=CjuIK1q_8ugA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 5ijFogjO-vzBvTIntpZ2JuWZhbmzgAB3
X-Proofpoint-ORIG-GUID: 5ijFogjO-vzBvTIntpZ2JuWZhbmzgAB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_043110_453503_7BDC7079 
X-CRM114-Status: GOOD (  16.61  )
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

On Tue, Apr 28, 2026 at 11:15:49AM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

