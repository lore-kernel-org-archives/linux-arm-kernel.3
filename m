Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0370CFD629
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AofJV46GCcIycup8AyvdwScpLkblbZyy7dzUs70zbeM=; b=n7l3Vzako5VCDT/o4qAbw7waK/
	Vmp+Fe4ive5eMVWIKCqgNJLEkU9A3/faGCQALH7YMIfP41J9fNJJSrkVBbbHunKmF+BJeCatH88VH
	uvGUAjEo/Imq2ncCOM9iasPhc1cIbHvKFawvmboo89g4gdIZqghURmNGc8m2EqeQyLbzzqRceYDIN
	1T6Hx25pTcIICHfMi3+S73Vr7fgPE1uy3dGe83QYCY1ial+CW29qHIFtJkdqXtlSP2a+wOgCnuxPb
	hPpmgGhRjhzh6BFZWQpore9S9EdDvcKLI7nbIR8RhzTh77RqZMAPR87OSYFE/HsPionOKhfPYbRM/
	GKiqImoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTMI-0000000EyMD-07o7;
	Wed, 07 Jan 2026 13:13:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTMF-0000000EyJH-0lbL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 13:13:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A53644E41FDE;
	Wed,  7 Jan 2026 13:13:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EA5B606F8;
	Wed,  7 Jan 2026 13:13:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BC18103C8744;
	Wed,  7 Jan 2026 14:13:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AofJV46GCcIycup8AyvdwScpLkblbZyy7dzUs70zbeM=;
	b=pPm8csoJHFOtCpXH2s+CTdsiSGlOr6aFzuCyOraotIbgXUOF67e30ioJY4KQ30d/H6x7gc
	G6WKbMrwHr2QbJzFOtDlld557GcNqd0KKD+Sni+DQ5Id3tTWL+1MUxKcJylQ3rW9WctVZu
	/2SdyuZcUpXPHO7GK2Mx6K59cv9frqTGZYRo6Q5xDYqjDjibdL4gMRCxcyjIAXKSlBOgA9
	6m45RVyHag4wNIpNkZUzPjXxrTXPMzr28GWso7PMYzjK7g8fU9YXeMnwZBON2kvOmyixOO
	ff7hgGnjSfA8/dLgG9b7VEs94HlAHXGbGvNLqCQrKDmnmF0wJQJ3WVQCU+1RIA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:12:56 +0100
Subject: [PATCH 05/12] drm/bridge: tfp410: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-5-283d7bba061a@bootlin.com>
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
X-CRM114-CacheID: sfid-20260107_051351_495620_F113BD02 
X-CRM114-Status: GOOD (  14.65  )
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
 drivers/gpu/drm/bridge/ti-tfp410.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index b80ee089f880..11b5bb50e9f4 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -30,7 +30,6 @@ struct tfp410 {
 	struct gpio_desc	*powerdown;
 
 	struct drm_bridge_timings timings;
-	struct drm_bridge	*next_bridge;
 
 	struct device *dev;
 };
@@ -53,8 +52,8 @@ static int tfp410_get_modes(struct drm_connector *connector)
 	const struct drm_edid *drm_edid;
 	int ret;
 
-	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_EDID) {
-		drm_edid = drm_bridge_edid_read(dvi->next_bridge, connector);
+	if (dvi->bridge.next_bridge->ops & DRM_BRIDGE_OP_EDID) {
+		drm_edid = drm_bridge_edid_read(dvi->bridge.next_bridge, connector);
 		if (!drm_edid)
 			DRM_INFO("EDID read failed. Fallback to standard modes\n");
 	} else {
@@ -89,7 +88,7 @@ tfp410_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct tfp410 *dvi = drm_connector_to_tfp410(connector);
 
-	return drm_bridge_detect(dvi->next_bridge, connector);
+	return drm_bridge_detect(dvi->bridge.next_bridge, connector);
 }
 
 static const struct drm_connector_funcs tfp410_con_funcs = {
@@ -126,7 +125,7 @@ static int tfp410_attach(struct drm_bridge *bridge,
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
 	int ret;
 
-	ret = drm_bridge_attach(encoder, dvi->next_bridge, bridge,
+	ret = drm_bridge_attach(encoder, dvi->bridge.next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		return ret;
@@ -134,14 +133,14 @@ static int tfp410_attach(struct drm_bridge *bridge,
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
 		return 0;
 
-	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_DETECT)
+	if (dvi->bridge.next_bridge->ops & DRM_BRIDGE_OP_DETECT)
 		dvi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	else
 		dvi->connector.polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
-	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+	if (dvi->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD) {
 		INIT_DELAYED_WORK(&dvi->hpd_work, tfp410_hpd_work_func);
-		drm_bridge_hpd_enable(dvi->next_bridge, tfp410_hpd_callback,
+		drm_bridge_hpd_enable(dvi->bridge.next_bridge, tfp410_hpd_callback,
 				      dvi);
 	}
 
@@ -149,8 +148,8 @@ static int tfp410_attach(struct drm_bridge *bridge,
 				 &tfp410_con_helper_funcs);
 	ret = drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
 					  &tfp410_con_funcs,
-					  dvi->next_bridge->type,
-					  dvi->next_bridge->ddc);
+					  dvi->bridge.next_bridge->type,
+					  dvi->bridge.next_bridge->ddc);
 	if (ret) {
 		dev_err(dvi->dev, "drm_connector_init_with_ddc() failed: %d\n",
 			ret);
@@ -169,8 +168,8 @@ static void tfp410_detach(struct drm_bridge *bridge)
 {
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
 
-	if (dvi->connector.dev && dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
-		drm_bridge_hpd_disable(dvi->next_bridge);
+	if (dvi->connector.dev && dvi->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+		drm_bridge_hpd_disable(dvi->bridge.next_bridge);
 		cancel_delayed_work_sync(&dvi->hpd_work);
 	}
 }
@@ -362,10 +361,10 @@ static int tfp410_init(struct device *dev, bool i2c)
 	if (!node)
 		return -ENODEV;
 
-	dvi->next_bridge = of_drm_find_bridge(node);
+	dvi->bridge.next_bridge = of_drm_find_and_get_bridge(node);
 	of_node_put(node);
 
-	if (!dvi->next_bridge)
+	if (!dvi->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	/* Get the powerdown GPIO. */

-- 
2.52.0


