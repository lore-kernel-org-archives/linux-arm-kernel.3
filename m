Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581F0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 18:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJLTtYt8skTkQa/ayBcA5QTG5BimU4mHUK/+qBWt6To=; b=v4ssr4U1GGXpU4/08KkqPz0/XE
	+NloJGUo6iDDau6zVjjjtDaz7TAbjpFwu4AlTDApkqUmhoJdrlGPAMMk9UeC0lIb3H96pSbTZ1Pj5
	63gxMfarhJu8+Iu8mETnKSxg80eJDKSRrr0iWVqBLstnstMwJ49TIIvHs8+tbP18CFQFHhRZXdQX3
	rhmJzmnX5HMefiJFL37mX/1oe2wf5DnxYfim5W5kiYvwsSVEq+haGnovEPGfNRIRnTyTK9d/M2gc/
	Pa43noe1lw2XzKyuuHh8Ljz5Tc6mOWUb2vEwvAY8hw5vSB28+XDgD6h+8nT5QF1VJKxsylYnh8wxe
	+IBQkW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPXw-0000000B4CI-1oxE;
	Thu, 02 Jan 2025 18:03:48 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPSx-0000000B3Dq-3bwG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 17:58:41 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5401e6efffcso14095034e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 09:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735840717; x=1736445517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GJLTtYt8skTkQa/ayBcA5QTG5BimU4mHUK/+qBWt6To=;
        b=kL6izL9zzfYFjypi1IqFYnZASTAQ+MLvI41yZFlDg8K2Q3dUKxjpsuCmlqNDChO9xc
         LbV7CCf8xJNl9LhCVyKT/9VpPyhgvwbt6zWLD/C3UFmqUQV+8haiYYH2XghZWF/fxIR0
         6qkSpnXFzkAWM7rUCZVt/HQxP1q9/tfnlI+Tw+FfgxkCMVZXsFrCEsj5ytSPmEbHxF0O
         FCLjabZ/YRnuP9CxjdLJzckfoEzhr1u/cIzLAFU+aH4xvbtNp3yzBmy7orJTmVgKdZ/Y
         YFEm693zIBaQJ7tjGoa1GP18u7JTUPjdUNOqmorMZzg/ibZIAhi5w1eALVOa8rhWdPFN
         6sSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735840717; x=1736445517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJLTtYt8skTkQa/ayBcA5QTG5BimU4mHUK/+qBWt6To=;
        b=QUQ3mSnmKbhmK9eqNK5aaIf3D+ea9XlFEZdDT6JCa/JOUXrzk337SV8s8ewKtShaa0
         PxM7R5UGcli/zN1nagGR28AxKV+SUA15CDu0/cDzLcSdJyLWWmmjkRmLlh5SiiRSm061
         vABLz0KxOzjSMVuB23p+enIhn0aQ5z3uhbQXptUsftXr1U9sfO/09bDbsT9h1dWtFaQK
         yLRU9Xu7cZHR8Wj4zTVnWAZLWlInETaXrcXwukrXgPv29VOfgnf+5LIki4NbwKHeBOGu
         7eUHQ9hmlXRcHbCi+DiFuj0yaNthJf7KNF6v8/g0/ES5cIGh64dgv4UKDp0nnnfhIRyI
         7Cug==
X-Forwarded-Encrypted: i=1; AJvYcCV9LlK47P0XAgh4Mnf0vDheUb2G1VXsGnHSUyOybCIYs2PQ+xOfa9r6zq8Ml/GK6qLnlJokLg/4zzLu9C/T3zY/@lists.infradead.org
X-Gm-Message-State: AOJu0YxCR0cuRhS3NNBe7S0U/Vm/MDOGe9mprj/vO/Xu+ojS3LuVQpLC
	9t8r+iz4Quen33BWYrBI/9vnEP8TJl2YPgZdj3IM5/Ujd/rXYf2hKEkZ/kuo2Dw=
X-Gm-Gg: ASbGncslyLPRnLZaCWcMnffbZLdH25jQf+OPI+KFiXpbpx0Ck5K4on3sN/qUs29uEU4
	6FAAU7uB+yrwVGN9cb+cxzqlnuEUbR117L1GwK6VMocv3/zsdtbLfvE1vdMxMvMLDDnW0JNPQK2
	intZjGg4PPtLBWoNPxXrOz3fS7eRBvPrDV09q5/1kBPmyFy8tOu1RMIGgRNEp36W5TED+OakhmS
	oiZ9tT9vfibE3qaWCeXefMTQEZoXKBoWifxEUEDDn0BW2kUxUtgTkp3mnDAdfQ8k27kSswXXoeG
	6a3K3nZBWrUUHWEtaZaSva+FoZvj5vQ7CRSr
X-Google-Smtp-Source: AGHT+IGsMD2AJtN8AO7P8Gm6p46pCYxJlOrHtLA9sNt/dLBZQv2u2yZ/9NF4quLmhSUrRcYhu3IfXg==
X-Received: by 2002:a05:6512:39d0:b0:542:2a20:e69a with SMTP id 2adb3069b0e04-5422a20e779mr13437754e87.11.1735840717312;
        Thu, 02 Jan 2025 09:58:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238138c3sm3880439e87.140.2025.01.02.09.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 09:58:35 -0800 (PST)
Date: Thu, 2 Jan 2025 19:58:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/4] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR
 flag to drm_bridge_attach
Message-ID: <u4hjoteybchte2fdmxle5rsu5jbohm7hjjoejrxiqa6lszqm56@6facok3v55kg>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231192925.97614-3-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_095839_904505_C6BD95DF 
X-CRM114-Status: GOOD (  33.95  )
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

On Tue, Dec 31, 2024 at 08:28:50PM +0100, Marek Vasut wrote:
> Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
> added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
> this flag in some way since then.
> Newly added bridge drivers must no longer contain the connector creation and
> will fail probing if this flag isn't set.
> 
> In order to be able to connect to those newly added bridges as well,
> make use of drm_bridge_connector API and have the connector initialized
> by the display controller.
> 
> Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")
> 
> This makes LT9611 work with i.MX8M Plus.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: Add RB from Dmitry
> V3: - Select DRM_DISPLAY_HELPER
>     - Use return dev_err_probe() directly
>     - Add missing of_node_put(ep)
>     - Add test using drm_bridge_get_next_bridge() to try and determine
>       if the HDMI connector was missing in DT or not, and if it was
>       missing, if it was created by the HDMI bridge driver.
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  2 ++
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 30 ++++++++++++++++++++++++++++--
>  2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 264e74f455547..fe98674d5a298 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -12,6 +12,7 @@ config DRM_MXSFB
>  	select DRM_CLIENT_SELECTION
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> +	select DRM_BRIDGE_CONNECTOR

Shouldn't this chunk go to another patch?

>  	select DRM_GEM_DMA_HELPER
>  	select DRM_PANEL
>  	select DRM_PANEL_BRIDGE
> @@ -28,6 +29,7 @@ config DRM_IMX_LCDIF
>  	depends on COMMON_CLK
>  	depends on ARCH_MXC || COMPILE_TEST
>  	select DRM_CLIENT_SELECTION
> +	select DRM_DISPLAY_HELPER
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index 8ee00f59ca821..dc39adabb3cd9 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -17,6 +17,7 @@
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fbdev_dma.h>
> @@ -48,8 +49,10 @@ static const struct drm_encoder_funcs lcdif_encoder_funcs = {
>  static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  {
>  	struct device *dev = lcdif->drm->dev;
> +	struct drm_device *drm = lcdif->drm;
> +	struct drm_connector *connector;
>  	struct device_node *ep;
> -	struct drm_bridge *bridge;
> +	struct drm_bridge *bridge, *nextbridge;
>  	int ret;
>  
>  	for_each_endpoint_of_node(dev->of_node, ep) {
> @@ -97,13 +100,36 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  			return ret;
>  		}
>  
> -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> +		ret = drm_bridge_attach(encoder, bridge, NULL,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  		if (ret) {
>  			of_node_put(ep);
>  			return dev_err_probe(dev, ret,
>  					     "Failed to attach bridge for endpoint%u\n",
>  					     of_ep.id);
>  		}
> +
> +		nextbridge = drm_bridge_get_next_bridge(bridge);
> +		nextbridge = drm_bridge_get_next_bridge(nextbridge);
> +		/* Test if connector node in DT, if not, it was created already */

By whom? And why? There is no display-connector bridge, but there is a
normal bridge chain, you have passed DRM_BRIDGE_ATTACH_NO_CONNECTOR, so
now it's a proper time to create drm_bridge_connector. You have added
the next_bridge_optional flag, but it should just prevent the dw driver
from returning the error if there is no next_bridge.

> +		if (!nextbridge)
> +			continue;
> +
> +		connector = drm_bridge_connector_init(drm, encoder);
> +		if (IS_ERR(connector)) {
> +			of_node_put(ep);
> +			return dev_err_probe(drm->dev, PTR_ERR(connector),
> +					     "Failed to initialize bridge connector: %pe\n",
> +					     connector);
> +		}
> +
> +		ret = drm_connector_attach_encoder(connector, encoder);
> +		if (ret < 0) {
> +			of_node_put(ep);
> +			drm_connector_cleanup(connector);
> +			return dev_err_probe(drm->dev, ret,
> +					     "Failed to attach encoder.\n");
> +		}
>  	}
>  
>  	return 0;
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

