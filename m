Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3278C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 00:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DoBs6OVTwFF+JmRKLxgaU515KdcbQmUXJDbYvNv8Tsk=; b=zns17B5xYIn5JIQs/YlHFLXjfU
	iUiJW3BD/mGfYVqXRJemdYanIGuurDplvRo/+2bHmhvnMdxmHJCVzW6WGipdtHSKEg88EwG9d/l6W
	euT9oyYsMMd6WbUsrg4ZAjYGl2EUKZxX1IauagNPgAMy4+BbDaFVeTx5BNBe+pLNLqEIDvjU09pVt
	B+sHgEDA4j2ni3AZibokBhtbHNe0viejl4/Lf+4oKRl2tXhR+QfzTyZiXhn0eY76uF0MauYPnFJJC
	fUnHGO8fXEqO/jBIpGdDSyeoLpBe+GA4vun9nTRNBm6RJ4+ac14DEjUUGjBHNtn+zRIXz0q/5HMB2
	Eaj9DZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSbA-0000000AwgM-0Xdf;
	Sat, 26 Jul 2025 00:17:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufSX2-0000000AwGr-1kl6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 00:12:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PJJJOi018125
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 00:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DoBs6OVTwFF+JmRKLxgaU515
	KdcbQmUXJDbYvNv8Tsk=; b=AkcdKEWch4hN0ZdD5TgDOmbaOcmN27fIS/ZlHbWe
	3ULXqdAcgmVi41jdu/XZjfaiA3D7okA2KiiMsqLdEVWadDDOTywEvW0cb9vaNYcH
	BZte5R7/RAjP9G30k/XrAEZQoSPGAzuoI1m7cBtt+qwTY0JWPGJSJOIr6Cq+GyFo
	NFbF/T6c/D7WKznCMg8bU3AWiToqyIHXEdleQLztsN9ljT5ZMoeIebuFk4agoqoI
	cSCm9nKK3HTqFL/9Vh/zr3Th+7Z94MSdGtRntAg4M8H66eC/jQzOk0nZrKgO6EOP
	wXNcFxn88yKgJLj8/B3MvF9G6u1enWDcHWWnp4BGwfzSeg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2s3rbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 00:12:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab844acca0so60695271cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 17:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753488774; x=1754093574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoBs6OVTwFF+JmRKLxgaU515KdcbQmUXJDbYvNv8Tsk=;
        b=NbZWnsGy+oZg9O8IcnBEPZp/Qn13pyq9xW3dCTPHfqShfqWMClhdkRISaLy0VyrzZb
         Gpgq6/n05nN+y7dOSjbLBMO/2o9hw8n62xL7shW3lAI+iKV6oZT6NonKlmdB9e/gFG74
         c5mBsI+OIHZ4GGI8q9EjBESXopTVpFnwWYKoc6gflz8GfMeINAUJTTf7TjDoZpVXgoft
         9K3htaU/TkVRPdwy8t5Xixj9GzTtgDDcS4GbRqUgZmGv9Q3UsLA3uVBlka5l3SwLyS7H
         K+XRgymf5AOpXRhX4LtybfTCZLMvBVDMqnopcW6NUN7uObuszhfNhUOWjMpkLWWZRMKh
         aUOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUApjZb2AV0ZjEwN7vzp/k8UW7+w2BbD8kuBQV9iEDFYeN4Jnc3V20z37FaP8OU/GB52CiG1afTQaqiXLBxkygI@lists.infradead.org
X-Gm-Message-State: AOJu0YzbqSp9GAtUuuCPR6Drs40ESAhtb0JBUk7hmyq6biZ4PxAMMdAg
	6YIT/788RgDKFlePijFKAXK8gHTL8O5eUEwKDhZWQrxWiNeULINCcppwQ9DYhFTVOGPaPpPabfR
	mF5eksWeDdGCab88SP+wNV2qvgRrX3vUKgFh8lv58IUOkiLX/FP22GjxhKZ6LJZpkRopCsQyBP5
	HXmQ==
X-Gm-Gg: ASbGncsEobNyMX2J88DwQKHwLpoI1vSUwfNW4fVthTYWmm4etg9/YyXhCwFo0DciDMm
	t1vbHJJhKuZ3j9yr+M0CL1Y1UnPmlrXFil4/+vjepHR2Hz7y+h06p5Ls4gs4COTkj0oggQb1Ru5
	0fgOl3uZm+CD8PZIrQF6ofZwhQGHnEKX4XT37e+CgUpj08izpHglS4K/IiKdIjLEuv/wNAJ6NnL
	S2RMIhJRKS2O0J4PHnBo3aG77mn/f/kJpU/+Z4xcrdLXsfI3RQ/pMcEoxzLKo1L0xHb6KohpwRv
	MduosPdhtsJjTr7TwGEaMctkDQGHwgYijWss3QhhoaZXREuoahaXyWZFtv7Vgs8uTuCVjaxOPL4
	a2YUPX00fgkEelw3wierD84NqtIZXOmvRykzC4YahyP0NQB4lF5WQ
X-Received: by 2002:a05:6214:e4a:b0:706:ffcd:d3ef with SMTP id 6a1803df08f44-707204d91f1mr65699726d6.11.1753488774205;
        Fri, 25 Jul 2025 17:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbddedN9+X5RQ+51/olzP++4eSaSJsPJ6FulQapEa8W/10AV19KAs7kk0J58zSr+jFJwBgmQ==
X-Received: by 2002:a05:6214:e4a:b0:706:ffcd:d3ef with SMTP id 6a1803df08f44-707204d91f1mr65699336d6.11.1753488773736;
        Fri, 25 Jul 2025 17:12:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b633760e6sm186357e87.160.2025.07.25.17.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 17:12:51 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:12:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 03/14] drm/rockchip: analogix_dp: Apply
 drmm_encoder_init() instead of drm_simple_encoder_init()
Message-ID: <6psjcrhbnk7czdrdtxh65kr6qvygkwogvert75dg2svbm2cqd3@uhffyfdxqpec>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-4-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-4-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: WQrzn9_t8yhkzluWyAe0vQle_-PwTbLW
X-Authority-Analysis: v=2.4 cv=IZyHWXqa c=1 sm=1 tr=0 ts=68841d87 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=HslhmZ87janovOCoqE8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: WQrzn9_t8yhkzluWyAe0vQle_-PwTbLW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX4iGasivhCDLN
 L1Y1czV63MNsKq6gYpNKcOesyDgxzJB59n71v3+LmlzYfiWcuZHCGXxzxJUJMtkMeuK88XhwFG6
 ct2SpvIOvffzeidaICQFYW9YXQq8mFKJSjiu8rnpBCpsksxnFdbBGVY42I2qZZbPhdiCYJNVfL6
 V+zsl7ugdvm/ldccJXfxW7iLEmq96zsEPNc2DLXSq7PlVt2M3DvyzbiNrZvjUAgArrqum4SkKYf
 nq++oA+JplNXLpT9YKVrzW6EoQ8QWBYtuUem5DeJm6faXbwWnpucbBNU0i5W5I/pDZcRS4Dkkuz
 2IvfmMfHQXwGpPWMKRqI86GoiQ+pxc0OwxouuNLOPJJ3TxlXcSpsLamgE+XEiQqmKvF6j7CYY62
 k5drMCaTrUksxIVfDiOUlKEQkwSUX9OudNYC8HPEFvLudZqFe0/9qenCWH0cilL2rErKNFS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 mlxlogscore=753 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_171256_595236_D587F37C 
X-CRM114-Status: GOOD (  21.16  )
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

On Thu, Jul 24, 2025 at 04:02:53PM +0800, Damon Ding wrote:
> Compared with drm_simple_encoder_init(), drmm_encoder_init() can handle
> the cleanup automatically through registering drm_encoder_cleanup() with
> drmm_add_action().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index d30f0983a53a..4ed6bf9e5377 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -29,7 +29,6 @@
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  
>  #include "rockchip_drm_drv.h"
>  
> @@ -377,8 +376,7 @@ static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
>  							     dev->of_node);
>  	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>  
> -	ret = drm_simple_encoder_init(drm_dev, encoder,
> -				      DRM_MODE_ENCODER_TMDS);
> +	ret = drmm_encoder_init(drm_dev, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);

It's not possible to use drmm_encoder_init() here. Per the documentation
the encoder data structure should be allocated by drmm_kzalloc().
However this drm_encoder is a part of struct rockchip_dp_device. It's
allocated by rockchip_dp_probe() via devm_kzalloc(). This means that it
can potentially be freed before the drm device is completely released,
creating a use-after-free error.

>  	if (ret) {
>  		DRM_ERROR("failed to initialize encoder with drm\n");
>  		return ret;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

