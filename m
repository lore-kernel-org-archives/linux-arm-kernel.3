Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA6ECFD626
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9uPxQIzbm1x3tUEAMRFb/oOEwm7sA+lEOVv4AQtBEw=; b=SishEI5R3+xqKy/T7jAi7aeTs/
	B151DCPlHl6tmP2XtBowy+EuE8jEwOdhEkX01H3ySsHn4NzeDgvFQMaEMlUxtfO3DIaZW0NaDeFSa
	ypYnIBEd+kkDqiC2orneAJclY+I11jcX/aRWdDxzENhTW2sY5SZRWNBWNp4nkJWfgkgb4JrqE2Gzp
	FhygSQv4jjk3e58v4b+emQxDd036HBEdIWbbf+3ECeXGznN62DuGg9OEWxz/4H6PWpfbBjuj5icFQ
	Oj+mmKWlf18w9Ts243YrBZ2jBA/BjmcGqM9LhGeYAg/2FYqAUZ9Xk+OMRxkaZbFyZBqy992rNT5j1
	sYGPkrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTMW-0000000EyXu-49Gr;
	Wed, 07 Jan 2026 13:14:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTMS-0000000EyTr-2llb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 13:14:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D18F5C1EC8B;
	Wed,  7 Jan 2026 13:13:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC563606F8;
	Wed,  7 Jan 2026 13:14:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA269103C84C4;
	Wed,  7 Jan 2026 14:13:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c9uPxQIzbm1x3tUEAMRFb/oOEwm7sA+lEOVv4AQtBEw=;
	b=zlp4ImdTLiKKY2NZVTxqKuYqT0BFkRF8RThasuk4DhPWMqvukWNRiAumjzIRv6MhPxosoe
	OzEM4vb2Q2O18W5cY6/LTjOBODiZf/mxHm0HrYRCIgCoTpP8g1+8EBuN/+L9P9/SyNT7KY
	f3CjbRNEeoACW7IyZsB5l8Hw/81CglFLot7mgabjSM2CuHusuMRzdQ31vcQ4pER6cMSurn
	fcI7JCSXt0/WL0f7WeZ9n/YMXmOt83exTnJrsVRv3RzeHYNh0eZ96IjAnPrarqMC8DsFdR
	vXQEK4lxIQgnSBbowiZfaBva+Uz1kzEZ8LsLxvE68MZZ+YzbDvW/rrLxldee3Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:12:59 +0100
Subject: [PATCH 08/12] drm/bridge: imx8mp-hdmi-pvi: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-8-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_051405_657373_8F558267 
X-CRM114-Status: GOOD (  14.27  )
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 3a6f8587a257..15fbb1be07cd 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -29,7 +29,6 @@
 struct imx8mp_hdmi_pvi {
 	struct drm_bridge	bridge;
 	struct device		*dev;
-	struct drm_bridge	*next_bridge;
 	void __iomem		*regs;
 };
 
@@ -45,7 +44,7 @@ static int imx8mp_hdmi_pvi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
 
-	return drm_bridge_attach(encoder, pvi->next_bridge,
+	return drm_bridge_attach(encoder, pvi->bridge.next_bridge,
 				 bridge, flags);
 }
 
@@ -78,8 +77,8 @@ static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
 	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
 		val |= PVI_CTRL_OP_HSYNC_POL | PVI_CTRL_INP_HSYNC_POL;
 
-	if (pvi->next_bridge->timings)
-		bus_flags = pvi->next_bridge->timings->input_bus_flags;
+	if (pvi->bridge.next_bridge->timings)
+		bus_flags = pvi->bridge.next_bridge->timings->input_bus_flags;
 	else if (bridge_state)
 		bus_flags = bridge_state->input_bus_cfg.flags;
 
@@ -108,7 +107,7 @@ imx8mp_hdmi_pvi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
 					  unsigned int *num_input_fmts)
 {
 	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
-	struct drm_bridge *next_bridge = pvi->next_bridge;
+	struct drm_bridge *next_bridge = pvi->bridge.next_bridge;
 	struct drm_bridge_state *next_state;
 
 	if (!next_bridge->funcs->atomic_get_input_bus_fmts)
@@ -157,10 +156,10 @@ static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 	if (!remote)
 		return -EINVAL;
 
-	pvi->next_bridge = of_drm_find_bridge(remote);
+	pvi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 	of_node_put(remote);
 
-	if (!pvi->next_bridge)
+	if (!pvi->bridge.next_bridge)
 		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
 				     "could not find next bridge\n");
 
@@ -168,7 +167,7 @@ static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 
 	/* Register the bridge. */
 	pvi->bridge.of_node = pdev->dev.of_node;
-	pvi->bridge.timings = pvi->next_bridge->timings;
+	pvi->bridge.timings = pvi->bridge.next_bridge->timings;
 
 	drm_bridge_add(&pvi->bridge);
 

-- 
2.52.0


