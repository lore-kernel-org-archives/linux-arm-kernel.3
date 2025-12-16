Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E387D609D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 18:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYJEE2opxHghuVaIu6hgRW6HhV8SDpecPQJMZReKags=; b=i4Di29WTPqBXG9Bj1jHjiSFOjY
	K+eJVAmvwnip30/u/BrASEOYPgTLLma4zwBUbXoNO4Tq1Fcun8i/BZL9aj90qrzwQY/nZ/adn7JHv
	7ejJ0I8BiSfEVfWAKmd11jAV+YMswChWjwxX/FtGEOP9tGnJ2FIB85AztkOYvLf9TTkMqbfM+1mk4
	u1nWHqlEIC8oMTCtp2BHCLPPuY1zjjQDwRjEg2ZbORNBgMgbejDZskkUREtEAhqGQPmIBGMwwL7Ow
	pAfdREr4gTKasRU34Rq7lovvEddd93woSk6pF4G+zqzetSPtdtBUYmHTldtaCUjvLNVQ69o0r2xPf
	bFKM+kdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLz-00000005fAf-1uUY;
	Tue, 16 Dec 2025 18:00:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLr-00000005f3G-2OZR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Dec 2025 18:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NYJEE2opxHghuVaIu6hgRW6HhV8SDpecPQJMZReKags=; b=EvhdYYfNQ2TFsKUxuXX9aYrHlg
	dRLqkPezXRHt/38QHeIRATdr7wzlebutKtavAydq6VfGoIsOxu6g58iLBe7CE/EEYR4oCCWx3fy3D
	Ho+CZh8ijKY0xrUZGknBtlFp3Vw88khOxqzznXQMl2HgqeYHmsIc7UwpCvZTPwiL0RkrkNUAWKfCX
	575hqTTSahG5ZQmnXnwqrI3RpJXjCZJ8JuvLCoqOYFosWdNxN+KV6JHnOyTRJg928kj59mP+Pa+9G
	wx8opucqu9LYGb0IVH+L0M9GdrpYKHtrDGKZcBKgIU2Xle+tEqushMC9zReS04fuR7NZrge6cm6e6
	EfzJs7ug==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYUJ-00000005JoD-03QB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 17:05:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 868EC4E41C36;
	Tue, 16 Dec 2025 18:00:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B1616071C;
	Tue, 16 Dec 2025 18:00:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6613119A97D5;
	Tue, 16 Dec 2025 19:00:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908040; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NYJEE2opxHghuVaIu6hgRW6HhV8SDpecPQJMZReKags=;
	b=D2bkKi7NoHC8TwpLYNq5yMx4usGX0uvHXODIrL/9+8JmdwSPajQgn/E7vPF5RS/thnq03V
	qj2HkSYZb/93l2sCultbAcfT58vfNWKl0owNvXpZyKVhfcz4ayDQsq4G5DLU8+DuMUGuOa
	KwsqVHY4bHAggDoNUIg/QjeSBDmIcNWtXBY8CieJUK827NCquljQkRuCW7rQ8NeC1/yVeq
	+E8RJVZfrfrm53JS8LVCjR+25aw2ks463N64RZJ9/NMsGeH9dPCllo86xtIL8WpLMCw4AB
	ilMgq6YwXcipvxchhqY5VGYZqI8O41TDlaNyR3VOndvt5Aa+8d/SIftUOY8VnQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:49 +0100
Subject: [PATCH v3 16/22] drm/bridge: imx8qxp-pxl2dpi: get/put the next
 bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-16-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_170527_547657_822F6B36 
X-CRM114-Status: GOOD (  12.59  )
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

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 2e66b003386e..556aec3b3734 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -35,7 +35,6 @@
 struct imx8qxp_pxl2dpi {
 	struct regmap *regmap;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct drm_bridge *companion;
 	struct device *dev;
 	struct imx_sc_ipc *ipc_handle;
@@ -60,7 +59,7 @@ static int imx8qxp_pxl2dpi_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	return drm_bridge_attach(encoder,
-				 p2d->next_bridge, bridge,
+				 p2d->bridge.next_bridge, bridge,
 				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 }
 
@@ -271,8 +270,8 @@ static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 		return -ENODEV;
 	}
 
-	p2d->next_bridge = of_drm_find_bridge(remote);
-	if (!p2d->next_bridge)
+	p2d->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+	if (!p2d->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	return 0;
@@ -351,8 +350,8 @@ static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2d)
 	 * the next bridges are connected to.  If they are marked as expecting
 	 * even pixels and odd pixels than we need to use the companion PXL2DPI.
 	 */
-	port1 = of_graph_get_port_by_id(p2d->next_bridge->of_node, 1);
-	port2 = of_graph_get_port_by_id(companion_p2d->next_bridge->of_node, 1);
+	port1 = of_graph_get_port_by_id(p2d->bridge.next_bridge->of_node, 1);
+	port2 = of_graph_get_port_by_id(companion_p2d->bridge.next_bridge->of_node, 1);
 	dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
 	of_node_put(port1);
 	of_node_put(port2);

-- 
2.52.0


