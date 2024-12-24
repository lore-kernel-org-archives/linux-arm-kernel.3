Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19166E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 01:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgxtTWwZUgiZR43yGPEWTTCFUTYez4EW86BjjsdTbVM=; b=g8jrgmpxT+oX++9ozoTY44zuPk
	laGcVDL/VxoGI4g22oeSbOIqZiMVkMZSFq9mNnj7C0g3IrDn0oOvS5o4BXnonmRCSgPoPgP1fg99Z
	HOFV38C4SG9utiJ9UGGgbMMoKKcb20pCiZ/Su8u2MpLMym0oE5bVKhjq+mHKEjdy1qA+FhHu94vbi
	hty6YJm6EHCsNPUKtsleOGHdiXYSFIHSpPibWgcBbNHoS9+ZXE+UvsDfAbGyOSiGgWxM7v4WTfuAb
	rxwyf7BlUy1WPVVjkXkDZ4/FjtChFYjB71c+Lnhz8dPRgXcc+yGJYk6FXDFxWZkVhsx7yqWK8Wiyt
	YOL74cdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPtep-0000000B04d-3ttM;
	Tue, 24 Dec 2024 01:24:23 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPtde-0000000B00z-1Zfq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 01:23:11 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53f22fd6887so4503963e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 17:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735003388; x=1735608188; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgxtTWwZUgiZR43yGPEWTTCFUTYez4EW86BjjsdTbVM=;
        b=UQ1zluncReM7e4Lqz0nPnZV1ZZcg8oKguyCLPZLwhRTNPQ7vD2Ld/JR0XNtk4nhGZ0
         f4SJh3I1zVhyDbtIOTblJojoaNJKzds9cTwTrLLcgxTCxTOonezGiQ6+39Ual8pc7Esr
         /OUVffOWGmQXg3YEDkbuf0drkci0JLPP+a4aiAqj7/JxYCZqmkgcSYqdFNrWIGnuXdnR
         suL+ZypG2jwvS6nT525gh7MdZOWmpq0oWIuWRiFQjHqVnKXy0vweNsz/7SySdCuGKQpz
         pDtpQfbflM2D7MJFheUlRFtVMEvGEgkjKcMM7gZ7NYfVjFqylLbX8un7wQCeB8gGHFdY
         8SoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735003388; x=1735608188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgxtTWwZUgiZR43yGPEWTTCFUTYez4EW86BjjsdTbVM=;
        b=DTQkScdXF/XSW+odL/cbb135Fnyy1HQMvUdvJ9HtwhHgRIZ6ikCWiGT5J8ICm5mZAC
         q8AN29d7yOFC4BTHvdDF4JzptBxsYCNcqFBIg0J0ImbWSXAQuiR7nsUuvq/Lnrh5+LzL
         JXFIZldlTBJfHzKcVeRDDeL7N5zlUie68GVFjFq4I8NWYB4s7k4I0UxcbOTpk2dXWOCH
         KyIbo/WybYTQ17GIFwMNKtXGGYz6OxB5iGMwYhLgloJkpshixYmQhq49uCcl7wc7yJHw
         H3FIgnSw0QcKDKCHrgvD6GMdibEkTwLi/n9qzU+PAn6DyQeYimoB5kP8cR8zw4t9xIxk
         RTxg==
X-Forwarded-Encrypted: i=1; AJvYcCWeSkpA6GIJZCXmX7Ehgnw3e8Ff5h7YsaFsw5KqptWXDF3pMYxomOTBY4CoEFzeY6UPA/UNW0JXgzR8xWSkqYSE@lists.infradead.org
X-Gm-Message-State: AOJu0YxpriuwEYpy2J8nAra34AKhVsdRRQn9y3Ie14azbK0QsM5p+eZ5
	6EUB0LM+1E7r6haMLvi7Q+x2AeM8mDjNa5sR1app5f9BD15Qtv+qD+b+0K0dhUI=
X-Gm-Gg: ASbGncusFJXGxT2solxWX422tiFtzwt0YFKlKu9O5KfRSIFkUlmAUB75IMA4uJkYgH9
	NAnYnbm8hVtkr2quqocBFoaGT2kKAEIn9WyYThfDAkd0hHodSt9JLBle7hbV41omfMUj2DjxlBL
	VYVYZTGaf9fR0C5zCXuRb16W91vjhHHautHH47L1vZJi9qx1Uuki4vowtiXgtTpOHCvjSoYvWqO
	+ME++13ToLDOT/E08mIHjRfobHIfvAEh3H+uRsXnfDmpSmtRZj4qO/90f0R6Dx9tCQdfMDsJJ5/
	rXywGFnWfySX+c2ppt/3ibe3sMfWnxO0kEOV
X-Google-Smtp-Source: AGHT+IE0cj501KVsxr5E+oOy+kYCAVFozA0mjr9ON0hVv1bfayb8BvzJJWWAMM6IBPiWdzjgftxlSw==
X-Received: by 2002:a05:6512:acc:b0:540:1dca:52d3 with SMTP id 2adb3069b0e04-54229540670mr4513495e87.29.1735003388265;
        Mon, 23 Dec 2024 17:23:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813692sm1417891e87.125.2024.12.23.17.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:23:06 -0800 (PST)
Date: Tue, 24 Dec 2024 03:23:04 +0200
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
Subject: Re: [PATCH 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <ovbuijd2kyq7c2ypjv6f4ttnpom53o5sagvafwf7ddvemq4orw@zi3hr22p4zjh>
References: <20241224004439.239880-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224004439.239880-1-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_172310_444766_456B483E 
X-CRM114-Status: GOOD (  23.58  )
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

On Tue, Dec 24, 2024 at 01:42:47AM +0100, Marek Vasut wrote:
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> The output_port set to 1 makes the DW HDMI driver core look up the
> next bridge in DT, where the next bridge is often the hdmi-connector .

Just to note: currently this will prevent one from using CEC with that
HDMI connector. I have a WIP series which provides generic CEC helpers
similar to HDMI Connector and HDMI Audio, but to make it work with
dw-hdmi would require one to convert the bridge into using
DRM_BRIDGE_OP_HDMI.

> 
> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
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
>  drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb856..d8e9fbf75edbb 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  config DRM_IMX8MP_HDMI_PVI
>  	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>  	depends on OF
> +	select DRM_DISPLAY_CONNECTOR
>  	help
>  	  Choose this to enable support for the internal HDMI TX Parallel
>  	  Video Interface found on the Freescale i.MX8MP SoC.
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec2890..4ebae5ad072ad 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>  	plat_data->priv_data = hdmi;
>  	plat_data->phy_force_vendor = true;
> +	plat_data->output_port = 1;
>  
>  	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->dw_hdmi))
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

