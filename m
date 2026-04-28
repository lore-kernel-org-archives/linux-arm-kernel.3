Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C65FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tq7wLm5Qjy/VWPuE7Hon9QVm3LdoZsXSZF3xzGhx52k=; b=l6Pht7CMlm+mCBP5GsRn94hznN
	t3jPx/Z8QWsRkzmr2bFEtDBWJgWL6OgEoGI8BLuFGiIb3l6Pm24llLXLtGP/atPabq766rFYdvZs3
	w1XVCIsys1mVEWZALkUq+FhJRx6e686CcOA9LtrYX2lnyNPhNyF6+Li/5cPbMrlOVcYODYvOXJPtO
	uDm2McJZ4vyu9OnvxeTDb5t8ecXl1X9aaoEZeeZqS7/lQiI2KeNLbB6jQTMNtNw2Kkl8LlcakS/Ad
	dyuCop9z3oaE8N3zrT+ZmXpFsSKdfu/7zc6QL6udeHTkM+c06fOP6lAb5UiMPKTJTOyH1Tou1C7nI
	GKewb3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeYZ-000000013nG-2Bg2;
	Tue, 28 Apr 2026 09:16:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeYU-000000013hU-0SKE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:16:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B60E21A346B;
	Tue, 28 Apr 2026 09:16:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89D75601D0;
	Tue, 28 Apr 2026 09:16:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00FF910728638;
	Tue, 28 Apr 2026 11:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777367791; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Tq7wLm5Qjy/VWPuE7Hon9QVm3LdoZsXSZF3xzGhx52k=;
	b=F55Y8HGJrPsA1QleW8uHKusfZdRSpcUbqIEw7Fx05F/b6YzZ5IgjjpckL4ukkpVLg2qWI7
	NTzH6RAm7OUB52NaS6bnI+whokVed+tUXXQfM/8fU6TAC5XGBNVYJVh0wyLBtAF+I6v1oT
	79FxnMRd1T4Dcm7403umxrgiBRXJchSppXymjcr8wOWk2h7z7Fg2Iv0C/w+1Xbb9hFHrEo
	RJdcPfM6dwIUD1PD8LfeudKd4h1nxnbUJ5fEg4/l8O5j1A22JOqh1ebYZRoQPgXyt+I0Ht
	0UO9QOdqpDkBw/Pk71vJrlfz5eLqQ9/BI0OhSDcnIkDb/SPUhyPVVv+w1EILzA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 28 Apr 2026 11:15:51 +0200
Subject: [PATCH v2 05/11] drm/bridge: chrontel-ch7033: switch to
 of_drm_get_bridge_by_endpoint()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-5-4300744a1c47@bootlin.com>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_021634_426627_D2CBDBF6 
X-CRM114-Status: GOOD (  14.03  )
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
2.53.0


