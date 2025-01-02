Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B89E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 04:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qASnP2cY4XrN23QHAx7oo1qyNnemaNPNaz8WLNECAxw=; b=m7WUHewPfsn96gjasP6EHoKK7e
	UW0349//MW9jfh/Yy3eLpyvcFmseupKtFnca/DLG/43ASYeNW6UEC4uVYtEb5kCp8kDOHrZS8kxCp
	iGRuutGz/ExWsqamkv8VPM/uH2sHn8ixtCsFBGE0mMqemjLzevuMOSQNz+juZCv0AgfuntHpUuh9L
	PMULkdtYwNDI3LI+qxvd3kwOfaNsX14IU5tdO4DaAI08GZIlUTbrx4paT3umWQV7wGhjClUiHOV8t
	/dV2YgmPsX26XvMmXKlg4tAQE/4p4RNL3E+QFtPNlPPypzcK4niJiIXdmNT9hBPXYGW8HR/LI6VFZ
	UW+p5yUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTDGA-00000009jaJ-2OYJ;
	Thu, 02 Jan 2025 04:56:38 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTDF1-00000009jWd-1LXn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 04:55:28 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3003e203acaso115531081fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jan 2025 20:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735793725; x=1736398525; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qASnP2cY4XrN23QHAx7oo1qyNnemaNPNaz8WLNECAxw=;
        b=ZxGpiczt0kWg4fA8DgU+F25zSoClzLNiObQ2GuOXdkYkVfXpqBwXX+aY/3zliKwmXA
         kel7/UF6d7obyaB5O45CezHtyHWotV4xWqtFmePLsXxNwDpi2rdfu3XMhYX+mEZ705Nw
         thefytZZVeZo4ee2hGb6ICIFXrCr8nUDDXmbwmz8U0+rvxdkBqiifTbu3m9oh5k/UZSv
         SzE9bCkMEd8Egbd2peUlL+ISWFMRhct6NZj/Mp+kZd027Ahe1G+e0B0I2qUeB/dTKk2d
         OeRo5q0kvHsW0fOQHkLHCCbk9Pq3lj+dVxRZFf8fwIH2Vd3xVaU0DWI5JvYdRNln19S+
         2pEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735793725; x=1736398525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qASnP2cY4XrN23QHAx7oo1qyNnemaNPNaz8WLNECAxw=;
        b=sZLS10XaPmbC57qIruEdj5gXiMf48PoxSYdxLmn0aMGKGsyHSscCwZ0s28B1HZpUzH
         r5nvvrGv8RqgXILfAwLO34H3c6+rtH2s651Py23V6C48y7AS+KES/CrRkhTpQlK3Kp1z
         5tcUAcBIt+ednZRAcPGB2PWO8dRjAjn3+mvPmrHhVGT5MVN3Hmu/K6n/C9Skcq9eHDU6
         Et2eNC1T36x3RH+kiOT0UzzOJFS5JODIINmeqWLNblYT8odhx/mkrBQyKFByJK6ITj1y
         J2rOCuOL5G24UUszA4iXK/RN7hxcc7HCeegHBwLdzVr2K8ojAioo1nHfxp4BkxvdZPK1
         7z5g==
X-Forwarded-Encrypted: i=1; AJvYcCUdqMmRMtIcDBBZqiYcJWrizqcHtsHGEuobdl2s+z6ZZKx6nBLAB2SoimrEzn+0Mo+Z2YrQ2Lel+ip/W4orZx4/@lists.infradead.org
X-Gm-Message-State: AOJu0YzE8hgVlXswKfABZTIpNyR8bR9jiBlDj3aHvRJ+AIHoXkjHSLYV
	CsnRotuJ9WoRvp9ZrQXHT5JJU9i814xVD2Toapi1WAYatKxyeoakwXcgALMDqG0=
X-Gm-Gg: ASbGncsHeNU9LIAH8nSIHe8bcNzvaGPTPDRsHRudRfrfHlgbsD1Qs7JldcYwTXSsIDi
	OM9uB4lGtS2u1mpBk6P22EFD+46BhYtHQw0x1N8Ne7RZ7YIF7unvgm1vFEm+zKM8N4BU7JG+3ly
	qAzOYo4mhQXi0a283Cu9zlWkuNnvF2fTnSPv1zg5XUmNMkRdlEPiuUWveuU8Bp0Cbv+dGevrfxY
	5nCT3g9URe+5Ozo/GyAytIRsWDI/gxcuIkudZ0d0zt1fhsXYJDmTgv0ka+qYwDxFtPu18ibT1wg
	ml/4uMQuqU2RFKIDw9C8d4DNiasP8LSS0UYY
X-Google-Smtp-Source: AGHT+IGG3mukVpNeyVH5K54Lp9BzgauZG9/9OolikaWA8gUQhWcUH40nRVYnybuB5sK96BFCwAUJaQ==
X-Received: by 2002:a2e:b8c6:0:b0:300:7f87:a4f with SMTP id 38308e7fff4ca-30468557147mr160123631fa.19.1735793725424;
        Wed, 01 Jan 2025 20:55:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bbe9sm41388161fa.43.2025.01.01.20.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 20:55:25 -0800 (PST)
Date: Thu, 2 Jan 2025 06:55:22 +0200
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
Subject: Re: [PATCH v3 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <sjyw3afx5qyrupf5tixgtubevmklgmstjvj3hjt5xukzmgluuv@47j6afzl5dp6>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231192925.97614-2-marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_205527_398723_8CD46EFE 
X-CRM114-Status: GOOD (  30.27  )
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

On Tue, Dec 31, 2024 at 08:28:49PM +0100, Marek Vasut wrote:
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
> The output_port set to 1 makes the DW HDMI driver core look up the
> next bridge in DT, where the next bridge is often the hdmi-connector .
> 
> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> 
> Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
> the oldest commit which adds HDMI support is commit:
> 
> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")
> 
> That already contains the HDMI connector node. Most follow up additions
> of HDMI support to another devices has been a variation of the same commit,
> including connector node, which is the proper way of eanbling HDMI on the
> i.MX8MP.
> 
> The rest should be covered by output_port_optional which should make systems
> with DTs without HDMI connector node work, but such DTs should be updated and
> the HDMI connector node should be added.
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
> V3: - Update commit message
>     - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
>     - Enable output_port_optional
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb856..db5c8a76193ac 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -17,6 +17,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	tristate "Freescale i.MX8MP HDMI-TX bridge support"
>  	depends on OF
>  	depends on COMMON_CLK
> +	select DRM_DISPLAY_CONNECTOR

I was going to write that it is not to be selected by anybody, but then
I stumbled upon meson driver, which also selects the symbol.

I still think that it is not to be selected by your driver as there is
no direct dependency (and there can be other bridges inbetween or the
bridge chain can end up with some other bridge). Such decisions belong
to defconfig or distribution's kernel config file.

>  	select DRM_DW_HDMI
>  	imply DRM_IMX8MP_HDMI_PVI
>  	imply PHY_FSL_SAMSUNG_HDMI_PHY
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec2890..3d63200e468bf 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -101,6 +101,8 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>  	plat_data->priv_data = hdmi;
>  	plat_data->phy_force_vendor = true;
> +	plat_data->output_port = 1;
> +	plat_data->output_port_optional = true;
>  
>  	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->dw_hdmi))
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

