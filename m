Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D176E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 04:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrtrBK5bSD0BG4gQ3/HFzyh9uM4A4XrCEOCe7dy4fgk=; b=Grp6cZga4dzAjcYyFzsw8ahfIR
	NJoktz5lYgAMJ9PCpX7wq8QpFPjA7D7vt80WdebfhaU5QcomWrePiYOkUziDCNyC6znY6z5M9WLzC
	Ng1PLsyAjsS2fennTqClCdYcPFJ4PqBjgd8uuprAKXF9pd/f97pCiNTF3LtjsT84xG1DdjXyvXAyd
	ecPEQwUZsQjONGJqrX4S/PuvXao/16BGO1HJsoPbueNeKhVnfOYDgBbuuSIFx+ANuU4YXEHX6qobg
	fYEC1649sH28yH7Cu1lhLPBVvGZWD2BsevEPPKQeHL9QpkNfXulrG754E2uxJ1T7fmdUoFs9WZb3D
	cUCzRUUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPwRB-0000000BEwS-0co6;
	Tue, 24 Dec 2024 04:22:29 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPwPy-0000000BEoJ-0xPe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 04:21:16 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so5372675e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 20:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735014073; x=1735618873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrtrBK5bSD0BG4gQ3/HFzyh9uM4A4XrCEOCe7dy4fgk=;
        b=OzSjIuBqzgqZFso1ABu5lI16wJvoaOifg60DrJotYfo34wYk6EBElCBPxfbIxu8e5v
         jk30EzyVpNKI7BKCzFkDAK7VyM1KZyn6flepiqJ2EJpVVPyJaOEJMA5tgUkYLwy3tm2l
         U9rRSKKnEN/cDKR24VuRqbTiTceNBPiSHxGoPw1C6bVoThi13p4Wm1jrzy9Z6xX4w4g6
         q52UbAtbqM3ssdX20l3lLznl7yaMdVtdgE/qQ0dq5nLx67Tujc0Msv9rMNSuLou/2rxQ
         QotgiOLONgxnguIjNZqW+oBYsqLjlgy+vPjFQEFaHCFGZgaxVSvpq1N19MbLE9PtBMAU
         jwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735014073; x=1735618873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrtrBK5bSD0BG4gQ3/HFzyh9uM4A4XrCEOCe7dy4fgk=;
        b=gpQb6H5hhaef1BzISjduhSQzDZMPAC70QocQzfKsPoXBk5cw1AwM8MkFDuUW19Ss5f
         OBPEyRywJJgdExFov0rDGjcNY218CNdmFCjLgI1jd4AT4QssC6yJMyPTKLanfTvbGLCn
         o4VyjhWbesjDKKOOksefyKuPZBF6oTnidhZOCJ7XZzYpJa2jpjCdsf/0Bi7FKCP4qCb6
         OexDCxK1KI6dT0Xz+ufyKoeGMnvXYq4Zy+izytfsYLK8ZxOHEq4F1NBzA0AsruMo6i5G
         bAcliUyhZoIjaHhBh0xC7ggpdUxDWSLVxQ+lv6dWITZFE7j5ZGrTWulpwEUonyEQsYGj
         vpHA==
X-Forwarded-Encrypted: i=1; AJvYcCXcYHq2Rhq3gZrxROwjMy4Fxiir8Mxn0ZgLYINche3hCd6sHBN9aJ7Pva4tjbTEXOXA4kpf2aa/lV+fz6gJp1D8@lists.infradead.org
X-Gm-Message-State: AOJu0YwIriXwZos61oAjDKHobZSrZyZE5AmrVzGDhFyV1dptL5flQWCO
	6J7Br/vw58HJLdjBfYZdyINUEUNAdFGZeguLqlX3ZTNZVV+8sTSH1sRiwTSBkZE=
X-Gm-Gg: ASbGncs+MUvAVeoGD1n0wbgIctRpBPYrpO7CRKP/pLIZYg7+RkfJhAYMRmr9+RXQpi0
	FDS/kmQcRcdv1i1esc93Qxys38wZoZveU6aGGKVFBueKEwlwyOJxR2NYvKoq/vMMiViDlxPbEAi
	zQtzEQHUpTxKDp8W5UcPTCyFcbBu41KtWmMSBISBGXDyQQapXvoRVvn0tqqShK3HiEIFEpJiu9w
	qgc5M6XAUE2jcJqQu8UNPNtO97gohFsf/6OBEt6W6E+HlBX5FTcZQHFmPdT/Di5WzXkx1UENuuu
	HZAGLxTNio4/XxmML2kwIQQfKv6TdW8XaI7u
X-Google-Smtp-Source: AGHT+IFnlazk3zp2S6fkLYTj/a/W11Tm8ZQUr/v3AouJ9WApV+dF+AqJMzBzTQnC6rJjgT9VhrQ83Q==
X-Received: by 2002:a05:6512:b22:b0:540:5b5c:c196 with SMTP id 2adb3069b0e04-5422956be94mr4052066e87.56.1735014072611;
        Mon, 23 Dec 2024 20:21:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422360054csm1498117e87.111.2024.12.23.20.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:21:11 -0800 (PST)
Date: Tue, 24 Dec 2024 06:21:08 +0200
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
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
References: <20241224014701.253490-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224014701.253490-1-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_202114_273920_4CD09A85 
X-CRM114-Status: GOOD (  23.93  )
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

On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> The output_port set to 1 makes the DW HDMI driver core look up the
> next bridge in DT, where the next bridge is often the hdmi-connector .
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
> V2: No change
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

Quoting my feedback to a similar Liu's patch:

This will break compatibility with older DT files, which don't have
output port. I think you need to add output_port_optional flag to
dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
is set, but there is no remote node.

>  
>  	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->dw_hdmi))
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

