Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14691094463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 09:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFpg1mbZW3Ctniu50/V4S1EGhLRWMwZR4yXu0pZ0YM0=; b=LCVrjFLjbLdT8BbGlXIKYr50d0
	RPdBC21Me3KQVVPZvqLV0WqWqLfOSWtQ+97qmmuXR4kXYFXWpTUhobIKsyQyByDVRMhAnf1fg6uhu
	6wiVcXBeQWFqg7G9k5IAk56YnNTwRlyZjXjt34T2fRawR/R5ePyJ4CPXjTuUty89bv+7wna1p/bxu
	gGrvFtyDh1HUIuhpluhp82pih8Qniv/2fLWSwEl+DhKvoEow9ZQkVNgL00RRbP+VLUF7k1/iqitVH
	BSld5+Dy/aVlXpnPl5b14ZSQd9dcDi7B9k+/ce5wKpzVdpZCie0qUbggb60nQReHX91wlI1BdmGGi
	0rw5AjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3smU-0000000EJPQ-1CGv;
	Sat, 21 Mar 2026 09:38:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3smR-0000000EJOI-2rAb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 09:38:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43b5bded412so1493285f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774085881; x=1774690681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFpg1mbZW3Ctniu50/V4S1EGhLRWMwZR4yXu0pZ0YM0=;
        b=MyknmDCIj+qJFMNIeO1j74rXO8XwVkTe1jlELM5LyzqKU+pVOotN9KiE7Ly0ifqeHG
         zORhtmG63vcZFnMyvUIeTd0OQO6Gwqa+o0mHxxljGidPopHKI7uEAobbHA9322/9tDjv
         wr+BDTLdMyE2bM74O2+TiTcr4ol5pDlqZRV1rV9x091ITgrebIK7OGjCHQVOFh5kBDrh
         oZ5zO113wBnIR3z0w+H/Q4CmYuMVMpvc2MB7Rm6aC78fTPZF3M5KUOSulDP9AGC0BqBk
         77sO76pljmoDpYvjTRJPfdRwmpIKit9yn+bj7imqR4IeH/Y0+Jf/bwOkL0cZMgGMy8CW
         cLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774085881; x=1774690681;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFpg1mbZW3Ctniu50/V4S1EGhLRWMwZR4yXu0pZ0YM0=;
        b=Tunmy1EJRqjJjzJMDfIJw+ijym5jOwNklSfHj6WK9m927gGbd6n/ogaUtRt0KMV3CH
         Kwnw+3v6OWSQWePlFhi1V+N+kJL0q/e1KeHRTbyO68TopKcMcO8wBETqTs9tE1XrBfNX
         8EwezVregh6tPBDK5sgdN3gF84j6/CZpm3bQrnDp3HxLx3yfGLQdLjjjjTdcccRWm41e
         okcY5TfeQn7uBM2H3pwTTVXu+0hCqQeYkw3EPD0YMiuhF1sTh0+5KCX/DsIB+jJaTBX5
         nv/util7guYjac3TUwRCs8w8tkcSQMs3Kn0x6B0+PQQgajjqK2fcpAVpNO4BkJQgVVup
         6W9A==
X-Forwarded-Encrypted: i=1; AJvYcCX4cX+jyKPSClfZRUk4pUsWLxQMeSqmh6zNauttxTAnjoU4c3Y0Me3+TsbO/xUf19hvOtw3jOtqkq0ag29EwIN9@lists.infradead.org
X-Gm-Message-State: AOJu0YyHpADHxkFGQyrsrnN/nb8mAXpYTHWgTAJQUcX3P7dciqXycl/5
	ZlFcpgVEjYK4SMCFtqJBwcXs51c8QsB1GCyuXNv/Ohc3KO43MGzdIRatgJYFvo6g7dM=
X-Gm-Gg: ATEYQzxs8L4Tfb0c2JwnLChusiDgQ9Z3o16idVqKjDeo/1XEUpkRqCYoXmsTFWLdOtZ
	a/aPntIJv0BSNrGAhRlSSaGcTmIuqGAlcd+selN4JSDc84Yy8Q7Oaup2BM+GJDJ4bLQIYxM+FV+
	ROyR0hEKq/AeDyEVcg/IipltgtPxcUEsDJvCVgjBs9LRokVXnyMBwEoF9AGvU8drAmVq96OLEN/
	OiXCQGdbey5LFgwDsVeslnM5xycekGstST7x0LG+Rai/3CtNgl75RPLs1+RXD2R2LZx28jJRgyo
	qT2wScb6h/R2+WAWG+fjVBWjWQeqIt96uPBsjq/UVVMkEPZicpUWAVsyKVMaKdhqxyzkKj4wiNr
	UqAyAr8Bf/LBYahX1cbihCf709PR33nj9QcYJ5W51hz77R7jJaJ2lUbb/6Ulr8xREE8hBbGDOj4
	rHBz8ThnEWR5Qk3178vBI5gC119DkQ4oxSYslp/UzRMW3O9btNcnjFY50VCuKHPOeTOHm46KoXk
	L9G1aJ/Umg3uUSRAny2XWU=
X-Received: by 2002:a05:6000:4021:b0:439:b1c3:84c8 with SMTP id ffacd0b85a97d-43b6423bc21mr10398940f8f.21.1774085880444;
        Sat, 21 Mar 2026 02:38:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64717e97sm13770100f8f.35.2026.03.21.02.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 02:37:59 -0700 (PDT)
Message-ID: <8462ee30-7e58-46ae-97f4-bc208dd40f27@linaro.org>
Date: Sat, 21 Mar 2026 10:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/meson: handle RGB101010 in format switches
To: Alexander Koskovich <akoskovich@pm.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
 <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_023803_740473_5CFFC940 
X-CRM114-Status: GOOD (  12.70  )
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

Le 21/03/2026 à 08:52, Alexander Koskovich a écrit :
> Add RGB101010 to the unsupported format cases to fix -Wswitch warnings
> introduced by the addition of the new pixel format.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index 66c73c512b0e..59fc0083d318 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -119,6 +119,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>   		dpi_data_format = DPI_COLOR_18BIT_CFG_2;
>   		venc_data_width = VENC_IN_COLOR_18B;
>   		break;
> +	case MIPI_DSI_FMT_RGB101010:
>   	case MIPI_DSI_FMT_RGB666_PACKED:
>   	case MIPI_DSI_FMT_RGB565:
>   		return -EINVAL;
> @@ -232,6 +233,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_data,
>   		break;
>   	case MIPI_DSI_FMT_RGB666:
>   		break;
> +	case MIPI_DSI_FMT_RGB101010:
>   	case MIPI_DSI_FMT_RGB666_PACKED:
>   	case MIPI_DSI_FMT_RGB565:
>   		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

