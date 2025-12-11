Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC40AD41D69
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrLE9DmCjwAQqwwhBvUzVJpeX/Pzl72dCfyYD6sC8EI=; b=U6MgadP2nCMO0gI2axUZ/9U9t1
	569cK2V7dAmvHUYFZVgciJFJySNtCGVQHlHEKyilhRy2cenG0qaLkvYUfngJgLEnY1k06YQ9u5eks
	52A0h89BOHORdds0qDD32m5GgUSiDsgv4LYqX8sfPupi7BquIpGgW4HMMUzNzeQ7/vNHsRQanKNut
	BUC2kLs2nVIlvFW4zhsgC15JHrdUj+uXhR/WesbZbGBrFLLyV+EPPHK/vW9Tm8MuX9jXgPN4J0sG1
	5nEgjfZEKpElzMvZ/tTjlZn0p+q+FB2RgReDms/6sWY8zkVsTHSGKx1h4QWK95wCdgRRdGyO1IDin
	BnH6c/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjid-0000000Gy76-1Xoz;
	Thu, 11 Dec 2025 16:40:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjiZ-0000000Gy0D-3xcE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 16:40:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 684E04E41B7E;
	Thu, 11 Dec 2025 16:40:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CB416072F;
	Thu, 11 Dec 2025 16:40:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B347103C8C1E;
	Thu, 11 Dec 2025 17:40:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765471236; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JrLE9DmCjwAQqwwhBvUzVJpeX/Pzl72dCfyYD6sC8EI=;
	b=mUPi1NLwfl9r8BdYQNEQq9Zk0qoVPRBY93VRRRdAlSt3vSnTISpz9hEgx6Y0CnxLlaEUZt
	pqM32u6RKOlWjPts4qvnbEYf3hRWNQmUHzlW9tcae67XYcuuampt2cA2pAV/C//6+XAD4+
	NmKHWmlUJCUOajeqvIOu7M/cKlQpkSZJJ/yLybXQeRy9j+ESOFL7+Q7amXs0ou4IMIsWyc
	nYNsGHEm28tH6zMdKr0wsSSvUXzf+yKbJPdF39tj93Y0PiiHU6id8TUFfHJyk0mTPTfnE7
	uRNMy0TSAr8/5bL204sqrIQ35gMnO6ppQjlY2RfIseiEZRAG9C3C4EaB/W10nQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Thu, 11 Dec 2025 17:39:03 +0100
Subject: [PATCH v2 19/20] drm/bridge: tda998x: Add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-feature_tilcdc-v2-19-f48bac3cd33e@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_084040_323182_10D245CB 
X-CRM114-Status: GOOD (  20.47  )
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

Add support for the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to allow display
controller drivers to create their own connectors. This modernizes the
driver to work with the current DRM bridge framework.

The implementation includes:
- Refactoring detection and EDID reading into bridge-usable helpers
- Adding bridge operations: edid_read, detect, hpd_enable, hpd_disable
- Setting appropriate bridge ops (DRM_BRIDGE_OP_EDID, DRM_BRIDGE_OP_DETECT,
  DRM_BRIDGE_OP_HPD) and connector type (HDMIA)
- Skipping connector creation when DRM_BRIDGE_ATTACH_NO_CONNECTOR is set
- Handling conditional connector cleanup in bridge_detach

The driver maintains backward compatibility by continuing to create its
own connector when the flag is not set.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/bridge/tda998x_drv.c | 96 +++++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridge/tda998x_drv.c
index 43ace6ee2ca35..4d78615634691 100644
--- a/drivers/gpu/drm/bridge/tda998x_drv.c
+++ b/drivers/gpu/drm/bridge/tda998x_drv.c
@@ -1193,16 +1193,22 @@ static int tda998x_audio_codec_init(struct tda998x_priv *priv,
 
 /* DRM connector functions */
 
-static enum drm_connector_status
-tda998x_connector_detect(struct drm_connector *connector, bool force)
+static enum drm_connector_status tda998x_conn_detect(struct tda998x_priv *priv)
 {
-	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
 	u8 val = cec_read(priv, REG_CEC_RXSHPDLEV);
 
 	return (val & CEC_RXSHPDLEV_HPD) ? connector_status_connected :
 			connector_status_disconnected;
 }
 
+static enum drm_connector_status
+tda998x_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
+
+	return tda998x_conn_detect(priv);
+}
+
 static const struct drm_connector_funcs tda998x_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -1276,11 +1282,10 @@ static int read_edid_block(void *data, u8 *buf, unsigned int blk, size_t length)
 	return ret;
 }
 
-static int tda998x_connector_get_modes(struct drm_connector *connector)
+static const struct drm_edid *tda998x_edid_read(struct tda998x_priv *priv,
+						struct drm_connector *connector)
 {
-	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
 	const struct drm_edid *drm_edid;
-	int n;
 
 	/*
 	 * If we get killed while waiting for the HPD timeout, return
@@ -1298,6 +1303,16 @@ static int tda998x_connector_get_modes(struct drm_connector *connector)
 	if (priv->rev == TDA19988)
 		reg_set(priv, REG_TX4, TX4_PD_RAM);
 
+	return drm_edid;
+}
+
+static int tda998x_connector_get_modes(struct drm_connector *connector)
+{
+	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
+	const struct drm_edid *drm_edid;
+	int n;
+
+	drm_edid = tda998x_edid_read(priv, connector);
 	drm_edid_connector_update(connector, drm_edid);
 	cec_notifier_set_phys_addr(priv->cec_notify,
 				   connector->display_info.source_physical_address);
@@ -1365,10 +1380,8 @@ static int tda998x_bridge_attach(struct drm_bridge *bridge,
 {
 	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
-	}
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
 
 	return tda998x_connector_init(priv, bridge->dev);
 }
@@ -1377,7 +1390,8 @@ static void tda998x_bridge_detach(struct drm_bridge *bridge)
 {
 	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
 
-	drm_connector_cleanup(&priv->connector);
+	if (priv->connector.dev)
+		drm_connector_cleanup(&priv->connector);
 }
 
 static enum drm_mode_status tda998x_bridge_mode_valid(struct drm_bridge *bridge,
@@ -1677,6 +1691,59 @@ static void tda998x_bridge_mode_set(struct drm_bridge *bridge,
 	mutex_unlock(&priv->audio_mutex);
 }
 
+static const struct drm_edid *
+tda998x_bridge_edid_read(struct drm_bridge *bridge,
+			 struct drm_connector *connector)
+{
+	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
+	const struct drm_edid *drm_edid;
+	const struct edid *edid;
+
+	drm_edid = tda998x_edid_read(priv, connector);
+	if (!drm_edid) {
+		dev_dbg(&priv->hdmi->dev, "failed to get edid\n");
+		return NULL;
+	}
+
+	/*
+	 * FIXME: This should use connector->display_info.has_audio from
+	 * a path that has read the EDID and called
+	 * drm_edid_connector_update().
+	 */
+	edid = drm_edid_raw(drm_edid);
+
+	dev_dbg(&priv->hdmi->dev, "got edid: width[%d] x height[%d]\n",
+		edid->width_cm, edid->height_cm);
+
+	priv->sink_has_audio = drm_detect_monitor_audio(edid);
+	cec_notifier_set_phys_addr_from_edid(priv->cec_notify, edid);
+
+	return drm_edid;
+}
+
+static enum drm_connector_status
+tda998x_bridge_detect(struct drm_bridge *bridge,
+		      struct drm_connector *connector)
+{
+	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
+
+	return tda998x_conn_detect(priv);
+}
+
+static void tda998x_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
+
+	cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
+}
+
+static void tda998x_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
+
+	cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
+}
+
 static const struct drm_bridge_funcs tda998x_bridge_funcs = {
 	.attach = tda998x_bridge_attach,
 	.detach = tda998x_bridge_detach,
@@ -1684,6 +1751,10 @@ static const struct drm_bridge_funcs tda998x_bridge_funcs = {
 	.disable = tda998x_bridge_disable,
 	.mode_set = tda998x_bridge_mode_set,
 	.enable = tda998x_bridge_enable,
+	.edid_read = tda998x_bridge_edid_read,
+	.detect = tda998x_bridge_detect,
+	.hpd_enable = tda998x_bridge_hpd_enable,
+	.hpd_disable = tda998x_bridge_hpd_disable,
 };
 
 /* I2C driver functions */
@@ -1872,6 +1943,7 @@ tda998x_probe(struct i2c_client *client)
 
 		/* enable HPD irq */
 		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
+		priv->bridge.ops = DRM_BRIDGE_OP_HPD;
 	}
 
 	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
@@ -1932,6 +2004,8 @@ tda998x_probe(struct i2c_client *client)
 	priv->bridge.of_node = dev->of_node;
 #endif
 
+	priv->bridge.ops |= DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+	priv->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	drm_bridge_add(&priv->bridge);
 
 	return 0;

-- 
2.43.0


