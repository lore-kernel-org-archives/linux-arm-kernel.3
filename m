Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13809E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 00:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88ypJKEjfY/PQxYw2dDvihxL+GlYw4/eG83FW6BzWoY=; b=B38IYkLopJ5tvA/J+7SYafI9X6
	J4Baeb/cfIxEljrXDmd6d3LJ9kOk4nkrvll+SY0AQ8jtcoGuv/uVYYKZHN0bQBv86jpECmMpESRBL
	pdNqY6zGFsdh01YN09NctMQTWQAo1wzprvs+pd200F5+RsvKiG4iryDAZc9ZQZGWkSjiEZ6JUmWJ6
	/CAHk0OyMJM9vC+4vrdm67INNPeOZpUYV5Qqbs9ZpZdfWPTdTrMlGSZKswhnuHVGFXwbKzEoe5Oo5
	u3P9vcblJEn9/rz6qsq5xwcZVi4ro8IgzkvxC4dbk7oAVlnpGDH33pXL+B4NKR9CXmMm4Ujc+49t4
	HOys50dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQjU-00000003RkD-0PFK;
	Fri, 20 Dec 2024 00:19:08 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOQiJ-00000003RPF-3yYK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 00:17:57 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso15023941fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 16:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734653874; x=1735258674; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=88ypJKEjfY/PQxYw2dDvihxL+GlYw4/eG83FW6BzWoY=;
        b=m7pYb+4AgH95gguwnzkz6byWUlEhVz7J8e0VsCGuoel8sG38IUzvjuTgBKdiUxsh4K
         Gvqd5VDb97ta55VaXmH+qL0eM99epNu424QCHBcrJLpdWAM7yr3h8Wr9P8s/7MMQGhzT
         hhFp91T0lOxEHKJjA6njlfBFh9jKFLUAFESv/Dpyi0SyJTP/v0/bZNAWO3sxIG0Is+OG
         aXxjuDLOJqF7hzRRzXU3oKkNEG2TwhCJ8J+csY00dEuVYAu9Md4Ic01YsqgcsPMQcNFl
         goLPR275+3CIZFpR/6k14gNU3jPY4LFdqmOUusrMRW1Njf3rhc3HhZWzdfhgrO8veUPt
         VdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734653874; x=1735258674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88ypJKEjfY/PQxYw2dDvihxL+GlYw4/eG83FW6BzWoY=;
        b=oOoNWlN0ev3N26ftWKQbQnIlbSjD1VzwfZ6gzTtp5xRpvOSJxUOUmRY72TqJyT5JRa
         X1JLdbrRweseJ8I8L8Ygt3afv7qi5a3HICy0hVF98psUf63/UwuESMjHsicubtD+wnEn
         c/IgueOaoy+fg+z/T5Csw9XvSn0jjecZpKqIUCZfICznKxTKvOvYlETLP8G6U4zKNq7w
         UDH/MZwOBfIp0b5XR0ZOcnAIhNP6UscgiH7A2lahOpU33vPOoXimN2xP9JrcthoVCNKi
         Zn2GxsZnqMtTF/eqWk/Mt/ScaRukqPvRHYzd2apRhyQ0RccRuC7YESdAu3QXDB7FleeX
         bGuA==
X-Forwarded-Encrypted: i=1; AJvYcCXfAGvune0/ic0p3z3fccO89LayryxQkXaMNTznD9zi8E1Xko8dPrmJP50tAapxhbFxHFPNIa1xMD+FZOGb7/lT@lists.infradead.org
X-Gm-Message-State: AOJu0YxDfkiFM8qWei0PDlz/jT8QgOLlCaHsjWR0q9zZS/hMkLlwNW/4
	Z5+daYaDjGptOJI3okkfZ639RHVEXO0ZMUaRSutjKQG3re6VA6thb17/aMUDFvw=
X-Gm-Gg: ASbGnct6zCrTzFU5NPadQA28iArtIPY4l7CZ5R3WOLGqBYL2MxfuqL+AYGhycTVgSda
	OWa9+2n5+uZryBv3Mi1gGdHVuJMtG6bey7Iy77T7tY446LZWlKBJwLfkkRix9aewLcB4J0y/bOD
	zK3Dp1mtL2m3jSgo0IAO+jZ8VStLErbZkmsJyCTcw2+kQ4HCvGtJ4JhZkh3vyzZsZUK4YhtKLoL
	My0ags0PlNRjSu8YsQSUL5SDkODZi50Ez5N+jrVCvE7d2WhNZy1+9EH83i3tM/ykCWD9WE+y2ii
	LLO9wAy3tKiolZi7AwegeM9h9bKo58kbz1p/
X-Google-Smtp-Source: AGHT+IFB2i5vKnWXGFFd2MWZqu6ISfQEn6gsPEZ+iz0AquMdjU/HdGNzEaZYfYTM6DlCEi0nsU27SA==
X-Received: by 2002:a05:651c:4ca:b0:302:4130:e19c with SMTP id 38308e7fff4ca-30468571039mr2038491fa.19.1734653874050;
        Thu, 19 Dec 2024 16:17:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cb8asm3815281fa.18.2024.12.19.16.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 16:17:52 -0800 (PST)
Date: Fri, 20 Dec 2024 02:17:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 09/15] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <irh3rei7to7gevrr5dqwa3qr3nl2lunenyvvvlqnpiyplbk2vj@ooedydnvl4df>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-10-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219080604.1423600-10-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_161755_979253_F8733F90 
X-CRM114-Status: GOOD (  24.84  )
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

On Thu, Dec 19, 2024 at 04:05:58PM +0800, Damon Ding wrote:
> If the panel can not be found in the beginning of rockchip_dp_probe()
> using the platform bus, we can still try to find it in analogix_dp_bind()
> through the DP AUX bus after the &analogix_dp_device.aux has been
> initialized.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 9429c50cc1bc..eae02819e3bb 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -19,12 +19,14 @@
>  #include <linux/platform_device.h>
>  
>  #include <drm/bridge/analogix_dp.h>
> +#include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> @@ -1733,6 +1735,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>  		goto err_disable_pm_runtime;
>  	}
>  
> +	if (!dp->plat_data->panel) {
> +		/*
> +		 * If the edp-panel module has not yet been initialized, the
> +		 * devm_of_dp_aux_populate_bus() function will return 0 and
> +		 * the done_probing() callback will not be called either.
> +		 * Consequently, the panel will never be found.
> +		 *
> +		 * This is the reason why we do not use the done_probing()
> +		 * callback and do not check the reture value here.

NAK. It is there for exactly this reason, to account for the panel
driver being not present yet. Please make a use of the done_probing()
callback.

> +		 */
> +		devm_of_dp_aux_populate_bus(&dp->aux, NULL);
> +		ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0,
> +						  &dp->plat_data->panel, NULL);
> +		if (ret)
> +			goto err_unregister_aux;
> +	}
> +
>  	ret = analogix_dp_create_bridge(drm_dev, dp);
>  	if (ret) {
>  		DRM_ERROR("failed to create bridge (%d)\n", ret);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

