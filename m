Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E7DCD484C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQiLwU4eE3Me1Gr15TTZ3jrsK6Y1VMrcmciESbSasFw=; b=RjoDUOK2FIHdtwhENrCTr7okVt
	lHiNtta6z1S96fIyOf0TBjxMajyJ8ztzNVZb+EwrYYhVvL39qYvd7sAp/H0UwwD2dQ4eASlw5B9OD
	op4if//oEUTVWqsPmpo328Tg85AeW43ddYReF8VUHNzuMwr9cGqF4HM0uXK4VzkXcud5yIMBAYCP3
	kGyidvtFMUrXNi6fLNwXlU7iXmdynGEUGxjKzZjbwIwPr/LgdntJVchEMm3n/ZYG2CSbiAKZzuRTh
	Q4egGYCxUHNCuMoXJknIDP9PRGkOvSVf4RSq3CiRxOsFx38m6vlBzBTKSxVzQ/gcyOegGsO3EzHMt
	7A+SFXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTgc-0000000EF9R-2p8c;
	Mon, 11 May 2026 16:40:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTga-0000000EF74-0OXI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:40:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A998B4E42BF4;
	Mon, 11 May 2026 16:40:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C47660646;
	Mon, 11 May 2026 16:40:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B303A11AF9F77;
	Mon, 11 May 2026 18:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778517648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aQiLwU4eE3Me1Gr15TTZ3jrsK6Y1VMrcmciESbSasFw=;
	b=hkHBwjqzvzWjh0GfNSFFgnCxIlEjwB5li1JMUMSgBsA9/RhB7Jnxhk2AzRwp9mCWVEEpkS
	kjTZ6O6Hk2QLX+KU8lbXD1zsACIyAYKL1/lLicMQxyC8kTqEnQpSScc7AIcqHVnMGtRDdz
	2hulpLa57itP3zKJ/SyDpbMf08PCU+nZWMqx7v7z7A25MM91f6ZqgYid6TODBBLRIrGK93
	+buXEbdAV0/Pbnup4pVGRQ6vblnU6bLQ7xpCO6jxP8Y031YbCw5CUH20WkSz15nLcKr537
	XzxrWzgS1AQT6CEbwIDRVgepTgDVpfprge2QvDK0gQ3l2foQ6aEncBfDovfaTA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 11 May 2026 18:40:09 +0200
Subject: [PATCH v6 05/11] drm/bridge: chrontel-ch7033: switch to
 of_drm_get_bridge_by_endpoint()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-5-f61c9e498b3f@bootlin.com>
References: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
In-Reply-To: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_094052_413864_F432D74A 
X-CRM114-Status: GOOD (  13.64  )
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

This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
@panel parameter, thus using a reduced feature set of that function.
Replace this call with the simpler of_drm_get_bridge_by_endpoint().

Since of_drm_get_bridge_by_endpoint() increases the refcount of the
returned bridge, ensure it is put on removal. To achieve this, instead of
adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
pointer which is automatically put when the bridge is eventually freed.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 54d49d4882c8..a237c65ebd69 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -199,7 +199,6 @@ enum {
 
 struct ch7033_priv {
 	struct regmap *regmap;
-	struct drm_bridge *next_bridge;
 	struct drm_bridge bridge;
 	struct drm_connector connector;
 };
@@ -215,7 +214,7 @@ static enum drm_connector_status ch7033_connector_detect(
 {
 	struct ch7033_priv *priv = conn_to_ch7033_priv(connector);
 
-	return drm_bridge_detect(priv->next_bridge, connector);
+	return drm_bridge_detect(priv->bridge.next_bridge, connector);
 }
 
 static const struct drm_connector_funcs ch7033_connector_funcs = {
@@ -233,7 +232,7 @@ static int ch7033_connector_get_modes(struct drm_connector *connector)
 	const struct drm_edid *drm_edid;
 	int ret;
 
-	drm_edid = drm_bridge_edid_read(priv->next_bridge, connector);
+	drm_edid = drm_bridge_edid_read(priv->bridge.next_bridge, connector);
 	drm_edid_connector_update(connector, drm_edid);
 	if (drm_edid) {
 		ret = drm_edid_connector_add_modes(connector);
@@ -275,7 +274,7 @@ static int ch7033_bridge_attach(struct drm_bridge *bridge,
 	struct drm_connector *connector = &priv->connector;
 	int ret;
 
-	ret = drm_bridge_attach(encoder, priv->next_bridge, bridge,
+	ret = drm_bridge_attach(encoder, priv->bridge.next_bridge, bridge,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;
@@ -283,15 +282,15 @@ static int ch7033_bridge_attach(struct drm_bridge *bridge,
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
 		return 0;
 
-	if (priv->next_bridge->ops & DRM_BRIDGE_OP_DETECT) {
+	if (priv->bridge.next_bridge->ops & DRM_BRIDGE_OP_DETECT) {
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 	} else {
 		connector->polled = DRM_CONNECTOR_POLL_CONNECT |
 				    DRM_CONNECTOR_POLL_DISCONNECT;
 	}
 
-	if (priv->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
-		drm_bridge_hpd_enable(priv->next_bridge, ch7033_hpd_event,
+	if (priv->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+		drm_bridge_hpd_enable(priv->bridge.next_bridge, ch7033_hpd_event,
 				      priv);
 	}
 
@@ -299,8 +298,8 @@ static int ch7033_bridge_attach(struct drm_bridge *bridge,
 				 &ch7033_connector_helper_funcs);
 	ret = drm_connector_init_with_ddc(bridge->dev, &priv->connector,
 					  &ch7033_connector_funcs,
-					  priv->next_bridge->type,
-					  priv->next_bridge->ddc);
+					  priv->bridge.next_bridge->type,
+					  priv->bridge.next_bridge->ddc);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
 		return ret;
@@ -313,8 +312,8 @@ static void ch7033_bridge_detach(struct drm_bridge *bridge)
 {
 	struct ch7033_priv *priv = bridge_to_ch7033_priv(bridge);
 
-	if (priv->next_bridge->ops & DRM_BRIDGE_OP_HPD)
-		drm_bridge_hpd_disable(priv->next_bridge);
+	if (priv->bridge.next_bridge->ops & DRM_BRIDGE_OP_HPD)
+		drm_bridge_hpd_disable(priv->bridge.next_bridge);
 	drm_connector_cleanup(&priv->connector);
 }
 
@@ -543,10 +542,9 @@ static int ch7033_probe(struct i2c_client *client)
 
 	dev_set_drvdata(dev, priv);
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, NULL,
-					  &priv->next_bridge);
-	if (ret)
-		return ret;
+	priv->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, -1);
+	if (IS_ERR(priv->bridge.next_bridge))
+		return PTR_ERR(priv->bridge.next_bridge);
 
 	priv->regmap = devm_regmap_init_i2c(client, &ch7033_regmap_config);
 	if (IS_ERR(priv->regmap)) {

-- 
2.54.0


