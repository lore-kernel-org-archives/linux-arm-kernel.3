Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A507ACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBnYNPx0m93XbkdYJmwrk/PdDLQ8lp47f6etNXtdmtI=; b=nVknJ5NyeUPWyKGfSMkWtDvG3K
	lAKwbqanjKvFVW6e9MUygsMkWl6MMiI7x70CP2URBxiza4c5CPRrMLnOCqYaqwvW97MryEBWX2T1m
	9Ut4CtWlnstgLscNSPSxHDi6daY2AVAhhX4k4wEoKHP0UWuA7NdRhTJbFAOvbCTCzw1DcGqedArDD
	c288y3bu0+xyBT5gplOCOkPOaV8AUvjpJ8tTjVx3A0LUDuVnh7St/xoPCbFCOD5ct1ReABPIkczxa
	ae1TMuyqF+SO1F0efYxFWGngdq41Zur9ZoT5ZUr7kLv+aecbHU+DotJ/r+VTbF1alXBxPkreMG/W8
	WkxrZScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBl5-0000000858h-2ePF;
	Thu, 01 Oct 2026 08:03:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBl1-0000000857X-27Sm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:03:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3F4C31A109A;
	Thu,  1 Oct 2026 08:03:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0CAAB60341;
	Thu,  1 Oct 2026 08:03:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E319103292AE;
	Thu,  1 Oct 2026 10:02:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790841779; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bBnYNPx0m93XbkdYJmwrk/PdDLQ8lp47f6etNXtdmtI=;
	b=MG5n5IPRudGzRrmo8ILDJDWYoecFzTS0SG5Pj68X1y0b04+2YpsJIH//yybBHJhI+y+AtC
	5pMeaxML0tMeFxax6tyAu+LzwoDoQ/c/Ah0PkiwYB28ckeY49nocfOg/a/WqtSABY3QZu0
	5dticPDGy2Um1s2hSW0775Oluy3hNAKx+IZtru3r40kkA10tbG9o3CxLOC2vH/9reQwCaE
	foJ1gnJY4fZCSlBTVS3bJE4jECObDVBX9sCymzvRuZ8w7tT/lSd8l3M4NZ007dO41l1aHu
	L/lIqeuW8sQ6UWKOhQ374hDboAQFhi9uYFcx5erlR0oDpCFxyNKucgPpquU6yQ==
Message-ID: <78ca2d861e27bb5712db12de83a199b52e5dbae5.camel@bootlin.com>
Subject: Re: [PATCH v2 1/7] drm/imx/lcdc: stop using deprecated
 devm_drm_of_get_bridge()
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Li	 <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng	
 <zhengxingda@iscas.ac.cn>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>,  =?ISO-8859-1?Q?Ma=EDra?= Canal
	 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance	
 <kernel-list@raspberrypi.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni	 <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 	imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Thu, 01 Oct 2026 10:02:45 +0200
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v2-1-6da431d8f180@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
	 <20260929-drm-fix-of_get_bridge-build-regression-v2-1-6da431d8f180@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_010311_683163_F39C64C0 
X-CRM114-Status: GOOD (  13.39  )
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

Hi Lucas,

Le mardi 29 septembre 2026 =C3=A0 15:39 +0200, Luca Ceresoli a =C3=A9crit=
=C2=A0:
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put.
>=20
> Fixes build failure when CONFIG_OF is disabled.
>=20
> Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c")
> Reported-by: Arnd Bergmann <arnd@kernel.org>
> Link: https://lore.kernel.org/r/20260928161605.2271412-1-arnd@kernel.org
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Paul Cercueil <paul.cercueil@bootlin.com>

Cheers,
-Paul

> ---
> =C2=A0drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> index c67fe80b8115..805a659e3f85 100644
> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> @@ -385,7 +385,6 @@ static int imx_lcdc_probe(struct platform_device *pde=
v)
> =C2=A0{
> =C2=A0	struct imx_lcdc *lcdc;
> =C2=A0	struct drm_device *drm;
> -	struct drm_bridge *bridge;
> =C2=A0	int irq;
> =C2=A0	int ret;
> =C2=A0	struct device *dev =3D &pdev->dev;
> @@ -401,7 +400,8 @@ static int imx_lcdc_probe(struct platform_device *pde=
v)
> =C2=A0	if (IS_ERR(lcdc->base))
> =C2=A0		return dev_err_probe(dev, PTR_ERR(lcdc->base), "Cannot get IO
> memory\n");
> =C2=A0
> -	bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +	struct drm_bridge *bridge __free(drm_bridge_put) =3D
> +		of_drm_get_bridge_by_endpoint(dev->of_node, 0, 0);
> =C2=A0	if (IS_ERR(bridge))
> =C2=A0		return dev_err_probe(dev, PTR_ERR(bridge), "Failed to find
> bridge\n");
> =C2=A0

