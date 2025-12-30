Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C06E9412E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 09:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZGTwUQXXsaH9P/sj36gCU1NPe3EIdV70fYUKRoUz14=; b=jD3lXCjOc53M5Pj1QLTnvlqq/N
	c9SflfWYkf/XbGqmwtFA6AhPylEoQVic1ib8vyb+2AQYnkRigfYaFd7HYcIgy/Lscx4J/aFRXd5/6
	wJz1c+n27Z7uejasYd8lH27ZNdplbKKi3pevpYKKyljF+Khq/N7kOCgfm2x034u7SvHbanHKy5rJ4
	cPHRftoohMZgInGkWJkSoVQzn8V4EAKJMJbM05f23LNuWKwdXgzkJ9w3AKeD772VQGL73B61Dce7t
	G+DnDtjn5lyj8MSswGQCG6tAz5fP91E2RqhVXDXU8bciuRb1ZLQBQ6J0R4PWW7J9C97M9a5h1btyt
	VjUkQJ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVrA-00000004f41-2Ib8;
	Tue, 30 Dec 2025 09:17:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVr7-00000004f3W-00EA;
	Tue, 30 Dec 2025 09:17:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 37B664E40C59;
	Tue, 30 Dec 2025 09:17:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E54CE6072C;
	Tue, 30 Dec 2025 09:17:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E979D113B05C1;
	Tue, 30 Dec 2025 10:17:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767086241; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rZGTwUQXXsaH9P/sj36gCU1NPe3EIdV70fYUKRoUz14=;
	b=CrPy81H0ZL6UTXpsNBD6TmghQkFld1EUqrMmDF/sauZPPbByFEHCvAfe9XNGnQNeDKRfIc
	AxZslYDC3B68czrpggoz9i3fH7+4HCM1zh/TlP2eHZPlds25F8mr+9yAt90ws1Hc7hKHG7
	4Pfw/d9dX6lnm51ysE4yyTkKBXjs2fuFiVpkLnYyZTTZ2GGPD6ZBdJ97epu9jA/+hhlOPu
	UYCSytTI99tgN4NL9+kP1yL4KVpDrA1TR0lypBQN8ajzCb2Np8JTV6VvOhctGM90PvTYmK
	zF3QLxNsYiGFylS/TvdJvFhe8w+FpMshXSIkJ8lPEYBMyjiySddhKV+2cmLHig==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
Subject: Re: [PATCH v3 00/22] drm/bridge: add of_drm_find_and_get_bridge()
 and a managed *next_bridge, deprecate of_drm_find_bridge()
Message-Id: <176708623356.127863.8623917477288453126.b4-ty@bootlin.com>
Date: Tue, 30 Dec 2025 10:17:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_011729_326410_A74ED6BA 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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


On Tue, 16 Dec 2025 18:58:33 +0100, Luca Ceresoli wrote:
> This series deprecates of_drm_find_bridge(), adds a replacement which
> handles bridge refcounting, and converts some of the direct users.
> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].
> 
> Here's the work breakdown (➜ marks the current series):
> 
> [...]

Applied, thanks!

[01/22] drm/bridge: add of_drm_find_and_get_bridge()
        commit: 293a8fd7721a90987d9bf149feab60e756dac269
[02/22] drm/bridge: deprecate of_drm_find_bridge()
        commit: 9da0e06abda87b1f97014113d5231fdeb4700749
[03/22] drm/todo: add entry about converting to of_drm_find_and_get_bridge()
        commit: c637217efb892ac5d0d5f9aea3df92147c2e24db
[04/22] drm/bridge: make of_drm_find_bridge() a wrapper of of_drm_find_and_get_bridge()
        commit: 5d7cb36254b5facd2a349331c1a47102d4e66e40
[05/22] drm/arcpgu: convert to of_drm_find_and_get_bridge()
        commit: 7282066e55347b26cb31784059ab62c2de8a3e01
[06/22] drm/bridge: add next_bridge pointer to struct drm_bridge
        commit: 3fdeae134ba956aacbd87d5532c025913c98fc49
[07/22] drm/bridge: ite-it66121: get/put the next bridge
        commit: 8f92a5fcbfe33f86b08f5f74dcc58a41425ea8c0
[08/22] drm/bridge: imx8qxp-pixel-combiner: get/put the next bridge
        commit: ae754f049ce1c01f09d175f80265970f0d5b4489
[09/22] drm/bridge: simple-bridge: get/put the next bridge
        commit: b9a7d5918bd436d64699b80af061f21c168df699
[10/22] drm/meson: encoder_cvbs: get/put the next bridge
        commit: 47fa48b3faa7cae925c9b14b18376cdc4622bae0
[11/22] drm/meson: encoder_dsi: get/put the next bridge
        commit: bfb8f5d0a9e756c57d4fc0f7966e4873bbfb34a5
[12/22] drm/meson: encoder_hdmi: get/put the next bridge
        commit: c87ad784aacb89cf88c00cde78970543010a6d67
[13/22] drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers
        commit: ceea3f7806a109baba4a23c9066eb9e86659408b
[14/22] drm/bridge: imx8qxp-pxl2dpi: remove excess error message
        commit: 54af17788629fbf343c5a9ebc55454d6a5486ff8
[15/22] drm/bridge: imx8qxp-pxl2dpi: imx8qxp_pxl2dpi_find_next_bridge: return int, not ERR_PTR
        commit: 0dc4a8d6d096f97a00b10919e8ffe2466666f03c
[16/22] drm/bridge: imx8qxp-pxl2dpi: get/put the next bridge
        commit: 6802c7ee360d98a018962adb8412d42dcca28272
[17/22] drm/bridge: imx8qxp-pxl2dpi: get/put the companion bridge
        commit: 900699ba830fd3558ba00f55fbf014022dc7ecdb
[18/22] drm/bridge: imx8qxp-pixel-link: simplify logic to find next bridge
        (no commit info)
[19/22] drm/bridge: imx8qxp-pixel-link: simplify freeing of the remote device_node
        (no commit info)
[20/22] drm/bridge: imx8qxp-pixel-link: remove excess error message
        commit: 40630210211a34f0714fe976530ccf1291e5ef78
[21/22] drm/bridge: imx8qxp-pixel-link: imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
        (no commit info)
[22/22] drm/bridge: imx8qxp-pixel-link: get/put the next bridge
        (no commit info)

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


