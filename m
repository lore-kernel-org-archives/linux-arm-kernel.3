Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F334CD232E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 07:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRT58lzEzd+gLCQT0DaHvPwQU+Zbax+UmuJHfDra6JM=; b=F2wQhLPny9Lps0eg3+WzLg6/rd
	4L+/xeeofto0jWyiM96056OKbSNJ3JXtRVzlfxzUnsve7XYDpwU/xv2Iu0TiE3dnW5an5BPRZNo0O
	v4x732T/IGi9dq9dZqr8X+e1k6/lvokNbV0obJbkaqD5zE9dZ0vY8Lbt34OrG/tPFehf4RQiiX6jN
	Qb1u5h+tkGUaBOJ5hk/dGqxOz/Rut47dFmNl95ri7ogeh8a+4qjNsnW6itPuDdLueyR+NC/poTdq2
	W7ZX+k24c4vIuDtmMmah1FybkGElPur4r2+OlMvmFzyH9fwJpnpFC6kxVtMC6RAwh6K/66sX9FbPu
	BM+euuIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6ym-00000001jP2-37Lr;
	Fri, 09 Jan 2026 07:32:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6yj-00000001jLN-1XtS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 07:32:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EACA44E4201A;
	Fri,  9 Jan 2026 07:32:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C18C260734;
	Fri,  9 Jan 2026 07:32:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C144103C87F9;
	Fri,  9 Jan 2026 08:32:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767943930; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mRT58lzEzd+gLCQT0DaHvPwQU+Zbax+UmuJHfDra6JM=;
	b=XRC/D36UGx21h9ZgVCVfwREKXJPrX7XxTKk0lpFMtj8GPfDjB8N+YAtS5MxP/Em+bsvFdb
	6+EIa7mzQ2QgdHHL/P3aRzbeT+Nxh8JWcN1Iq9Dr7Zl1wSovDssC4GjE+uyONBtJEpSaEI
	sXvsQVvuTvp0+B+kOoBUI9CgM9ICtcCTfRDybNsqVtj09FrpPYnYZHVdSWQSSAoOl3pH3I
	qlHUp96T9k4SP8Pw3AnBpPqlAm1NBHKxg074dLyUPx7sFXITMCW8IKHc3qic3JXYzvgEsj
	u/gvOVrM4OqVf+di3o2h7rQcGxN4aZ2GiZkdkOLnX2ElBJOzN/6hLeqCPPKN+Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:38 +0100
Subject: [PATCH v2 07/12] drm/bridge: lt8912b: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-7-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
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
X-CRM114-CacheID: sfid-20260108_233213_708495_3728D361 
X-CRM114-Status: GOOD (  14.45  )
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 342374cb8fc6..8a0b48efca58 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -35,7 +35,6 @@ struct lt8912 {
 	struct regmap *regmap[I2C_MAX_IDX];
 
 	struct device_node *host_node;
-	struct drm_bridge *hdmi_port;
 
 	struct mipi_dsi_device *dsi;
 
@@ -407,8 +406,8 @@ lt8912_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct lt8912 *lt = connector_to_lt8912(connector);
 
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_DETECT)
-		return drm_bridge_detect(lt->hdmi_port, connector);
+	if (lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_DETECT)
+		return drm_bridge_detect(lt->bridge.next_bridge, connector);
 
 	return lt8912_check_cable_status(lt);
 }
@@ -429,7 +428,7 @@ static int lt8912_connector_get_modes(struct drm_connector *connector)
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	int ret, num;
 
-	drm_edid = drm_bridge_edid_read(lt->hdmi_port, connector);
+	drm_edid = drm_bridge_edid_read(lt->bridge.next_bridge, connector);
 	drm_edid_connector_update(connector, drm_edid);
 	if (!drm_edid)
 		return 0;
@@ -519,8 +518,8 @@ static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 	struct drm_connector *connector = &lt->connector;
 
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD) {
-		drm_bridge_hpd_enable(lt->hdmi_port, lt8912_bridge_hpd_cb, lt);
+	if (lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+		drm_bridge_hpd_enable(lt->bridge.next_bridge, lt8912_bridge_hpd_cb, lt);
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 	} else {
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
@@ -529,7 +528,7 @@ static int lt8912_bridge_connector_init(struct drm_bridge *bridge)
 
 	ret = drm_connector_init(bridge->dev, connector,
 				 &lt8912_connector_funcs,
-				 lt->hdmi_port->type);
+				 lt->bridge.next_bridge->type);
 	if (ret)
 		goto exit;
 
@@ -549,7 +548,7 @@ static int lt8912_bridge_attach(struct drm_bridge *bridge,
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 	int ret;
 
-	ret = drm_bridge_attach(encoder, lt->hdmi_port, bridge,
+	ret = drm_bridge_attach(encoder, lt->bridge.next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0) {
 		dev_err(lt->dev, "Failed to attach next bridge (%d)\n", ret);
@@ -585,8 +584,8 @@ static void lt8912_bridge_detach(struct drm_bridge *bridge)
 
 	lt8912_hard_power_off(lt);
 
-	if (lt->connector.dev && lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
-		drm_bridge_hpd_disable(lt->hdmi_port);
+	if (lt->connector.dev && lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD)
+		drm_bridge_hpd_disable(lt->bridge.next_bridge);
 }
 
 static enum drm_mode_status
@@ -611,8 +610,8 @@ lt8912_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_DETECT)
-		return drm_bridge_detect(lt->hdmi_port, connector);
+	if (lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_DETECT)
+		return drm_bridge_detect(lt->bridge.next_bridge, connector);
 
 	return lt8912_check_cable_status(lt);
 }
@@ -626,8 +625,8 @@ static const struct drm_edid *lt8912_bridge_edid_read(struct drm_bridge *bridge,
 	 * edid must be read through the ddc bus but it must be
 	 * given to the hdmi connector node.
 	 */
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_EDID)
-		return drm_bridge_edid_read(lt->hdmi_port, connector);
+	if (lt->bridge.next_bridge->ops & DRM_BRIDGE_OP_EDID)
+		return drm_bridge_edid_read(lt->bridge.next_bridge, connector);
 
 	dev_warn(lt->dev, "The connected bridge does not supports DRM_BRIDGE_OP_EDID\n");
 	return NULL;
@@ -723,8 +722,8 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 		goto err_free_host_node;
 	}
 
-	lt->hdmi_port = of_drm_find_bridge(port_node);
-	if (!lt->hdmi_port) {
+	lt->bridge.next_bridge = of_drm_find_and_get_bridge(port_node);
+	if (!lt->bridge.next_bridge) {
 		ret = -EPROBE_DEFER;
 		dev_err_probe(lt->dev, ret, "%s: Failed to get hdmi port\n", __func__);
 		goto err_free_host_node;

-- 
2.52.0


