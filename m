Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CCCCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 20:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdLCuj5V1B6mGqY302QitcGKFp9JJVU/Ya21+9Ly7EM=; b=EpJihlsSzJLl78/s0RDGpd+P+l
	4WpqBCy0d3Wx4KiA6GSlynaZn4mGMtFMlpo/d7iRk0dqoYzNzxyM0opnXeFBqHw69vnwZijHU4kmY
	FGWPJKgKS40ymEuPnAV47Px8WdvLjF7J+f7esdzyLI5OKE/IT+0Erikqj4PUq3wuBrSBgP7tWXZEE
	iRGIz8mbH74pGtWGGk5GZsaNAXgGrEeeGZh98K1471gl6tIJHuPMEi1pOijS8BzNiQK39EHv/W/VE
	Ce1tF6ho026ZHDlzyxtFp4eUfUBUDxOfnT0uPJAzQrzZgBiNz1bJ6HkBp02NgEmPC4h3poUnQVuXG
	R8hn51ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gnW-000000069oE-13yE;
	Tue, 30 Sep 2025 20:18:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gnT-000000069nG-3j36
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 20:18:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC4FpF013512
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sdLCuj5V1B6mGqY302QitcGK
	Fp9JJVU/Ya21+9Ly7EM=; b=Pe4Y/dsRASMVOkBpq1opV2LmbOdpxDfVc7aI+ElS
	544wIH3lQYA5SQiUMZQp28vek9ObwV7iz4w5vSnE7J6E8IHtOQJ9ckTV1jlERRwm
	/TbtSHV0W/1HHnQUknINy73i9V+ig57gpREelyC0QDOeIbrviiLhLLnyEo1lUJlu
	clNg+5gsqLIPJX8z27r3tLuiyZrTYejLf00vyCyGbF5nHBIeKquXRSrH8sn1bkA8
	4VQ+AnhjucwyY1qmVl7s9xGCGCkn67p7AurHo/w0O/S0x7arWbbM3X/Ltj67qCxd
	3eTuof2oqS+cN5qfBi+MgrgTzORxYpFN0fEgTMkCoWpdxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a62cap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 20:18:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de5fe839aeso114133501cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 13:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263482; x=1759868282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdLCuj5V1B6mGqY302QitcGKFp9JJVU/Ya21+9Ly7EM=;
        b=fh9y+lXP7BG/wDbBxZx11dsYnr6PZkl003J08/SGATS2ih1CcFoy0GNitEiglpcKfL
         TJuoZj31evYu75HEd9OWArUY3uuT1Ug0p/ZgVel2UVWvc9mYTEuG4vevKVpvHFWwkAsM
         Fixmoumu/dhXv/kZPnwcyI7di0P8yzjseeJ791/w3AVrwHTb/P3u+UI6gWCj3Qibttj7
         Jy5xo5JX2nMPiGzx8EqslIafDz9h9fPrs7PXL44BLTi1CZ7ced9rvFeM3WM26K6jY5vf
         ptQwc4HwnLi8LScRDnpl0PX55i78aMkHGq1BvVHsiPZOi9eH+RH9rQ1YOUnUZXDdpEL/
         lzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkXiSd05yfVFmqmG4JZO/cpLvTnMC+h/KvmBwuOfhQ1fKTwVgdMgeEhhPAGqQZeuaNM8RhYN2lL8mFliYYLyGd@lists.infradead.org
X-Gm-Message-State: AOJu0YzdVFr/lZdurrZbbq5KdJYLTeoCtAOFhUcwKmlTu7fN8dCuZ8Ae
	F8p71+HggQpl9Bcgp9GQRL3omTCYtUgER+7mckg6AGAnmU7Ooi5aqozL6AtfV6JKiXnkV83MHmL
	qTtYQkSFywXGmwm962UnmHgBi4+mVgXo/ceZvhM3AAV0S+gWIeTD66wAnmnCi1G2lBFtWKxJnkf
	8aOQ==
X-Gm-Gg: ASbGnctDfoNTDx6AIFjKtdNwtpG+pwRGkf468fFMpe0EyUvYCIdCHdepSL3Ytnk8OQn
	3pa4PQf+mp9/WTl9CYZ+bGvddQydAtbyKCQ0UpCorYyzUU/54CjlqTwD4DUKPRiIJtANPo3HvE/
	aTg6GqauBuVJqhm4Wkz4qOm+sjK7Y1M8+/6Aar1q7CdKqdivuX4xyWCMPGYY9FdfoFJ0yjX+jmY
	VazvH5fRxD9pJ4j5ClUDIx+0bvPxPkH5Gg6bzfZa70ZwvAwVC+v6zW4TJNAxf2nWzzO+hryGjJz
	Lp9qgr7XpbD0NcOxRG0WPVE0hhntr/gcA6t0SsmfnQA24D78loTfWQT3Gn23DLTTN8OacEjTeMw
	28nkMKr4zLiYocR92QQG49I3jcwdj3D8rCIw5FQhOaZ0v72X6N7nneCL5qg==
X-Received: by 2002:a05:622a:30b:b0:4db:f72a:b816 with SMTP id d75a77b69052e-4e41ca1cd94mr12855351cf.22.1759263481817;
        Tue, 30 Sep 2025 13:18:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzLJ/aNHaWVThXpiXhQPhNd6bXcsrZRT/lYLsQU/H/2CL9o9NPlqCKuAEDT1vBgHAP0z6Niw==
X-Received: by 2002:a05:622a:30b:b0:4db:f72a:b816 with SMTP id d75a77b69052e-4e41ca1cd94mr12854801cf.22.1759263481206;
        Tue, 30 Sep 2025 13:18:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-585f4a77b82sm3072757e87.27.2025.09.30.13.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:17:59 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:17:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com,
        luca.ceresoli@bootlin.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 07/18] drm/exynos: exynos_dp: Apply legacy bridge to
 parse the display-timings node
Message-ID: <73bpf77trhqdo5amfxbn4qhlwf4ta7hmouwfen7m3aslycd3bj@72artzwafbmq>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-8-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dc3afa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=tHzXnULJKltlW3Z4dK8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: fXSIaz-sFTBt_fFkNezmreNC2PpWU_dF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX6KlANL0R9Q6R
 gnhUaXB8zwVhU+BznMclgAwtAqDUGmwCHK9WwtKwgp4ZMS2NyUOIWl83zZKshq+no0gkbjQFfZr
 ch670eMMKNB4euVy/UbG6i92Bx1DkVxt48JzEbiQUCzGLwa+tQoIizx43IGJ2koaIfiu7EehM5h
 hOBYFdvgh86UJZoJowPh1ce2YRSkRegzXURGX85moHjQkMTarR6hmOtOS+lUOQExyaW5Un/Jc2+
 K2OyX4h4XXVI9VbeWhFlY/OXVla58cF6oNq5WA68hmRfBUbMAkjX+R/S/3f0LDp0Gy+Ev/5IfvT
 yW2eJSus3FZXoeNK9N6lFFBs8I3Q12qpwvmJFuLxJkJJiLWQ2C/3+HQIut6SSL95iBd57wAVEra
 mMiXVrAIv1aEoVzgxhjrPwQvW2qpEQ==
X-Proofpoint-ORIG-GUID: fXSIaz-sFTBt_fFkNezmreNC2PpWU_dF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_131804_043975_3D95D1B3 
X-CRM114-Status: GOOD (  33.04  )
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

On Tue, Sep 30, 2025 at 05:09:09PM +0800, Damon Ding wrote:
> If there is neither a panel nor a bridge, the display timing can be
> parsed from the display-timings node under the dp node.
> 
> In order to get rid of &analogix_dp_plat_data.get_modes() and make
> the codes more consistent, apply DRM legacy bridge to parse display
> timings.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v6:
> - Apply DRM legacy bridge to parse display timings intead of
>   implementing the same codes only for Exynos DP.
> ---
>  drivers/gpu/drm/exynos/Kconfig     |  1 +
>  drivers/gpu/drm/exynos/exynos_dp.c | 71 +++++++++---------------------
>  2 files changed, 22 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index 0d13828e7d9e..66665d317848 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -72,6 +72,7 @@ config DRM_EXYNOS_DP
>  	select DRM_ANALOGIX_DP
>  	select DRM_DISPLAY_DP_HELPER
>  	default DRM_EXYNOS
> +	select DRM_LEGACY_BRIDGE
>  	select DRM_PANEL
>  	help
>  	  This enables support for DP device.
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
> index e20513164032..507d0a98fe5b 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -19,6 +19,7 @@
>  #include <video/videomode.h>
>  
>  #include <drm/bridge/analogix_dp.h>
> +#include <drm/bridge/legacy-bridge.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
> @@ -38,11 +39,23 @@ struct exynos_dp_device {
>  	struct drm_device          *drm_dev;
>  	struct device              *dev;
>  
> -	struct videomode           vm;
>  	struct analogix_dp_device *adp;
>  	struct analogix_dp_plat_data plat_data;
>  };
>  
> +static int exynos_dp_legacy_bridge_init(struct exynos_dp_device *dp,
> +					struct drm_bridge **bridge)
> +{
> +	if (!bridge)
> +		return -EINVAL;

Well, this can't happen, can it?

> +
> +	*bridge = devm_drm_legacy_bridge(dp->dev, dp->dev->of_node, DRM_MODE_CONNECTOR_eDP);
> +	if (IS_ERR(*bridge))
> +		return PTR_ERR(*bridge);
> +
> +	return 0;
> +}

I'd suggest inlining the function. It doesn't make sense to have
one-line wrapper.

> +
>  static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
>  				bool enable)
>  {

[...]

>  static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
>  				   struct drm_bridge *bridge,
>  				   struct drm_connector *connector)
>  {
>  	struct exynos_dp_device *dp = to_dp(plat_data);
> +	enum drm_bridge_attach_flags flags = 0;
>  	int ret;
>  
>  	/* Pre-empt DP connector creation if there's a bridge */
>  	if (plat_data->next_bridge) {
> -		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
> -					0);
> +		if (drm_bridge_is_legacy(plat_data->next_bridge))

I see... You are going to kill this line in one of the next patches, but
the API will stay. I suggest adding a flag to the exynos_dp_device and
then removing the flag once you migrate to drm_bridge_connector.

> +			flags = DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> +
> +		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge, flags);
>  		if (ret)
>  			return ret;
>  	}

-- 
With best wishes
Dmitry

