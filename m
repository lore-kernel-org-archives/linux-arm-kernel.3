Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83FCE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 01:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3CvzPcAkLXjsb0Utu5Ntg8+0IyMGFyxJmACpHhJ2L8=; b=D18s+/59yWELXQnAyISNP4WGwZ
	5dxLrYh97BgFAcKgnom9O6r+mAJbpDA0quAL9VflmBSQ+RsKYgVKF4/U3XuZggK1npHCJuJILkJoJ
	0WGgUa40WKEU7SYVJmAPJbLMrrVJZojx5ukwy5McrPCOKJdCa70yfiGJSRrVvwGb5kkFIk0OlZQJ1
	jLdUDhdQ61/81hoRknujAP/omjm9yfKF5uIWGa4R2jF5MJty148eTEPBxen8kwEkTq8OkTpQS2PLA
	U7HkDl4buogmdQXWGWeYFa+RdXgERGetfxEyEu+k+peekGXD618YVOyRLTRsOAm4YZQ892k1pAqAE
	9/q4uiaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPtOY-0000000AzCd-08zs;
	Tue, 24 Dec 2024 01:07:34 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPtNM-0000000Az9c-0xJ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 01:06:21 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30227ccf803so56008891fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 17:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735002378; x=1735607178; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/3CvzPcAkLXjsb0Utu5Ntg8+0IyMGFyxJmACpHhJ2L8=;
        b=IFjAj9iP1fYPpWuUeQLONrqFric47OfsPsGDiUDPH022KLAuMxuw13RUcT/hHIceiA
         rp3i73oLLUv4LqTZx82QxtFi/pbwyhjmFQxXivAL/dNjc4pwbTT+LoCd4HCNXfZIH/zR
         la+1c/UXaoNv91zbyNaLffvsicVmFA5vniB2yuw0hZ3qbTY4V6kjUjSRA50uQgBbQc0Y
         sw/ZVGg1lAXb4acOJzwkpvYRwZA5NWpqPJtdOK1NlsZaABuE36MHk/+nZGNYjQRSMNia
         X5EsSOfGq3+IAApJMU/0GS6KpIDM+fi3Kir3R8Lw68sISbNWDNdipD3LcFl84LZoLMdi
         XSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735002378; x=1735607178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3CvzPcAkLXjsb0Utu5Ntg8+0IyMGFyxJmACpHhJ2L8=;
        b=RXKBKM1gZPzL98GKDbTrYfCgKn4itkNE79BpkgE/6LZdVzN3Sv7M4ttp81YvCCC7dg
         U0mk8f0R9xtnqTm+iTPBiAzoc59OAfXbnMPAXSGrhaZ6dRV8t+oW6fQuLULlztYg7ybE
         O44BIIRtjUFi/fmVFSeCl3C7lNwDekIFlKFBuM+QISszZq8hHBnZtwsw0+VnhrDZ+fhB
         xvZ0f8H47WiyVJ1AFMpVnET05eTobUPYuh6c3Z4w7kB2/mHBQeilIrxSUmIlhhCIvuQ4
         328Mlk2MQ9dHs+3DvvyUPFp8sdMkHYin3YTz3zCdcDnZYILcjMgkseG27C5kh/ZvIrwA
         2Neg==
X-Forwarded-Encrypted: i=1; AJvYcCU1V5ISij/f57IjPVhsFbjfBOVSLWgXrWx/13lly+ySfdZopEby7WZ494eOPjefhVW8XLtOnXdl02cG/FvwLJpB@lists.infradead.org
X-Gm-Message-State: AOJu0YzPTfAqvathREtYIzIaERyF+Mv1XV9MRFPSusdanWQR2hSZplWa
	QbB0DMIOYB5/4m38Vb+6mwuMeh4lmvUksZcr8BauXrxUCuEufbTSZqqXdetroJ4=
X-Gm-Gg: ASbGncuPlWJAyUUGPdLOR0wverGKayuR16gsW1T8UaCStKsX8n1Hs8232qko7FbXRiA
	dEOsuNGAYjmws5qYUOklVXOh3vX2GQgx2hDzpn0vf/NPVnJGZXdDTOOim8AlWJHHxvi7IX13SY/
	MGThG2sCIyV5SKW2aCogn+atsulO5CfGaLwzFEsT7Ed16BpGbptzEaR4ezBt6jOh5CsDcoMwCyO
	uY7vbHZkrG5uZXkxP8eUDW9MFYnQtQt3hZ5Y2EN1MHArT24jHtJ0mHHpdRObz4BecwsOUXgtu1X
	o6EijePpYACLr4yHuWjENAC6mPLrYKVD5xdD
X-Google-Smtp-Source: AGHT+IFB9DIkvfAI7cjpDzasCEmR4TU1CXKXT3DFKiXSsCrTKBANpHD1zxLbg90VBtOFOdmeLLerQQ==
X-Received: by 2002:a2e:a991:0:b0:300:8ff:d93f with SMTP id 38308e7fff4ca-30468577a7fmr49728481fa.22.1735002378148;
        Mon, 23 Dec 2024 17:06:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cccasm15083871fa.1.2024.12.23.17.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:06:16 -0800 (PST)
Date: Tue, 24 Dec 2024 03:06:14 +0200
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
Subject: Re: [PATCH 3/3] drm/mxsfb: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
Message-ID: <mqvhpdofvtuiewzkfn7qghwwmpf6o5d6ru6yq7lif6znvcva3a@piu42vpzofzk>
References: <20241224004439.239880-1-marex@denx.de>
 <20241224004439.239880-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224004439.239880-3-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_170620_287198_C3484280 
X-CRM114-Status: GOOD (  33.96  )
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

On Tue, Dec 24, 2024 at 01:42:49AM +0100, Marek Vasut wrote:
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
> This makes LT9611 work with i.MX8M Mini.
> 
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
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 36 +++++++++++++++++++++----------
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c |  6 +++---
>  4 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 07fb6901996ae..e67de148955b2 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -12,6 +12,7 @@ config DRM_MXSFB
>  	select DRM_CLIENT_SELECTION
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> +	select DRM_BRIDGE_CONNECTOR
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_PANEL
>  	select DRM_PANEL_BRIDGE
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 59020862cf65e..d034c21e186a4 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -20,6 +20,7 @@
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_dma.h>
> @@ -118,10 +119,10 @@ static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
>  
>  static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>  {
> +	struct drm_connector *connector = &mxsfb->connector;

Drop the initialisation, it is useless.

>  	struct drm_device *drm = mxsfb->drm;
> -	struct drm_connector_list_iter iter;
> -	struct drm_panel *panel;
>  	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
>  	int ret;
>  
>  	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
> @@ -139,21 +140,34 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>  	if (!bridge)
>  		return -ENODEV;
>  
> -	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
> +	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  	if (ret)
>  		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
>  
> -	mxsfb->bridge = bridge;
> +	connector = drm_bridge_connector_init(drm, &mxsfb->encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		dev_err_probe(drm->dev, ret,
> +			      "Failed to initialize bridge connector: %pe\n",
> +			      connector);
> +		return ret;
> +	}
>  
> -	/*
> -	 * Get hold of the connector. This is a bit of a hack, until the bridge
> -	 * API gives us bus flags and formats.
> -	 */
> -	drm_connector_list_iter_begin(drm, &iter);
> -	mxsfb->connector = drm_connector_list_iter_next(&iter);
> -	drm_connector_list_iter_end(&iter);
> +	ret = drm_connector_attach_encoder(connector, &mxsfb->encoder);
> +	if (ret < 0) {
> +		dev_err_probe(drm->dev, ret,
> +			      "Failed to attach encoder.\n");
> +		goto err_cleanup_connector;
> +	}
> +
> +	mxsfb->bridge = bridge;
>  
>  	return 0;
> +
> +err_cleanup_connector:
> +	drm_connector_cleanup(connector);
> +	return ret;
>  }
>  
>  static irqreturn_t mxsfb_irq_handler(int irq, void *data)
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> index d160d921b25fc..7a24e96ab4263 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -43,7 +43,7 @@ struct mxsfb_drm_private {
>  	} planes;
>  	struct drm_crtc			crtc;
>  	struct drm_encoder		encoder;
> -	struct drm_connector		*connector;
> +	struct drm_connector		connector;

This connector isn't getting used. How is this supposed to work? Store
the connector that you got from drm_bridge_connector_init() here
instead.

>  	struct drm_bridge		*bridge;
>  
>  	bool				crc_active;
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 7ed2516b6de05..30584091e2aa8 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -281,7 +281,7 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>  {
>  	struct drm_device *drm = mxsfb->crtc.dev;
>  	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
> -	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
> +	u32 bus_flags = mxsfb->connector.display_info.bus_flags;
>  	int err;
>  
>  	if (mxsfb->bridge && mxsfb->bridge->timings)
> @@ -378,8 +378,8 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	}
>  
>  	/* If there is no bridge, use bus format from connector */
> -	if (!bus_format && mxsfb->connector->display_info.num_bus_formats)
> -		bus_format = mxsfb->connector->display_info.bus_formats[0];
> +	if (!bus_format && mxsfb->connector.display_info.num_bus_formats)
> +		bus_format = mxsfb->connector.display_info.bus_formats[0];
>  
>  	/* If all else fails, default to RGB888_1X24 */
>  	if (!bus_format)
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

