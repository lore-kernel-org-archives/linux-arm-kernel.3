Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFDBC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPET2NhrdD6HSvBQlq/W5IT0tYfRgFI87leV1mZtICo=; b=Bmzu9IzjdNpWLIvVf8VuwX2xw/
	P1piIJ428b5AoGX94iftdjhM53GDF3WnuOVJRwuA0ChYPtpHV1cZIB8A30NILNojZiDS6Em3C7l/C
	tZOW1imc02MXGdP59s9G0bgqaDwxzGRUrdOInaQYPhDSCAdGH5/2hn1hpVwFu1HvPM8IpfXj26CXJ
	sN4RTibUBG7f00Yxny29obVEuChxQzFkhAk/w29aJqSSki6xi/HaNuqVQJA86KixX2mYn6nYIuk2H
	3tSvRGTqyU+CpxS3JOzCu+z3W2d8I/NvVPWRDGi+ZZj+Q2SmDhoKKhzPnrx0SRFQF3XAtOkScFmXC
	DC9d0UXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pyp-00000009JPp-1w87;
	Wed, 16 Sep 2026 13:47:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6pya-00000009J6Y-1LsM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 13:47:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C43144E40736;
	Wed, 16 Sep 2026 13:47:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95CE160337;
	Wed, 16 Sep 2026 13:47:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B423011C7B03B;
	Wed, 16 Sep 2026 15:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789566418; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cPET2NhrdD6HSvBQlq/W5IT0tYfRgFI87leV1mZtICo=;
	b=b9FMJI3689bW6Mbp3QP/ZTgl/CWUhb8O+HyJBznbODXELvvhwULKj8sn/RhTSRHvKohWrN
	IoclnNC1/3J4nwYlZTnTFwM3INfHr04fEmprfB1H0qwZmdsyVA0Xio+nEQY9AYX7dByIrV
	yzp6KnOX2F2QDWAMoOIy/ks3dPpzEZwNHvH7R9SJ6YlOL8aHTe5UmcZoEttoiXNE7o05Mh
	D6qvEGQ5zVOsTsPfXMt71MkYGQXtedfNhSpWJ+vENj5Abz1dgOKbBANkTXr1jdPKYO0NRn
	c9FWdb1D3hEnCMkxW9QebJz8Fh9o+t/4iSO/3myOXSqD+CBMjHhWPvghwb+94w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 16 Sep 2026 15:45:33 +0200
Subject: [PATCH v3 09/19] drm/bridge: tc358767: don't create a panel_bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-drm-bridge-every-panel-v3-9-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Sean Paul <sean@poorly.run>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Albert Esteve <aesteve@redhat.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, asahi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_064705_193204_C2EBCE86 
X-CRM114-Status: GOOD (  19.13  )
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

Now a panel_bridge is automatically created for every drm_panel and the
panel-bridge API is just a deprecated wrapper to access it.

Update and simplify the code by just getting a reference to the
already-existing bridge using of_drm_get_bridge_by_endpoint().

As of_drm_get_bridge_by_endpoint() returns a refcounted bridge, take care
of putting the bridge reference by using bridge->next_bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig    |  2 --
 drivers/gpu/drm/bridge/tc358767.c | 64 ++++++++++++---------------------------
 2 files changed, 20 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 89e87460aefc..4766ae85da17 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -402,8 +402,6 @@ config DRM_TOSHIBA_TC358767
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select DRM_MIPI_DSI
-	select DRM_PANEL
-	select DRM_PANEL_BRIDGE
 	help
 	  Toshiba TC358767 eDP bridge chip driver.
 
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index ac83af7902cd..51f4baa62a53 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -35,7 +35,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -370,7 +369,6 @@ struct tc_data {
 	struct drm_dp_aux	aux;
 
 	struct drm_bridge	bridge;
-	struct drm_bridge	*panel_bridge;
 	struct drm_connector	connector;
 
 	struct mipi_dsi_device	*dsi;
@@ -1742,8 +1740,8 @@ static int tc_connector_get_modes(struct drm_connector *connector)
 		return 0;
 	}
 
-	if (tc->panel_bridge) {
-		num_modes = drm_bridge_get_modes(tc->panel_bridge, connector);
+	if (tc->bridge.next_bridge) {
+		num_modes = drm_bridge_get_modes(tc->bridge.next_bridge, connector);
 		if (num_modes > 0)
 			return num_modes;
 	}
@@ -1788,7 +1786,7 @@ tc_connector_detect(struct drm_connector *connector, bool force)
 	if (tc->hpd_pin >= 0)
 		return tc_bridge_detect(&tc->bridge, connector);
 
-	if (tc->panel_bridge)
+	if (tc->bridge.next_bridge)
 		return connector_status_connected;
 	else
 		return connector_status_unknown;
@@ -1809,10 +1807,10 @@ static int tc_dpi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 
-	if (!tc->panel_bridge)
+	if (!tc->bridge.next_bridge)
 		return 0;
 
-	return drm_bridge_attach(tc->bridge.encoder, tc->panel_bridge,
+	return drm_bridge_attach(tc->bridge.encoder, tc->bridge.next_bridge,
 				 &tc->bridge, flags);
 }
 
@@ -1825,9 +1823,9 @@ static int tc_edp_bridge_attach(struct drm_bridge *bridge,
 	struct drm_device *drm = bridge->dev;
 	int ret;
 
-	if (tc->panel_bridge) {
+	if (tc->bridge.next_bridge) {
 		/* If a connector is required then this driver shall create it */
-		ret = drm_bridge_attach(tc->bridge.encoder, tc->panel_bridge,
+		ret = drm_bridge_attach(tc->bridge.encoder, tc->bridge.next_bridge,
 					&tc->bridge, flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret)
 			return ret;
@@ -2318,53 +2316,31 @@ static int tc_probe_dpi_bridge_endpoint(struct tc_data *tc)
 {
 	struct device *dev = tc->dev;
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
-	int ret;
 
 	/* port@1 is the DPI input/output port */
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, &bridge);
-	if (ret && ret != -ENODEV)
-		return dev_err_probe(dev, ret,
-				     "Could not find DPI panel or bridge\n");
-
-	if (panel) {
-		bridge = devm_drm_panel_bridge_add(dev, panel);
-		drm_panel_put(panel);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
-
-	if (bridge) {
-		tc->panel_bridge = bridge;
-		tc->bridge.type = DRM_MODE_CONNECTOR_DPI;
+	bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		return dev_err_probe(dev, PTR_ERR(bridge),
+				     "Could not find DPI bridge\n");
 
-		return 0;
-	}
+	tc->bridge.next_bridge = bridge;
+	tc->bridge.type = DRM_MODE_CONNECTOR_DPI;
 
-	return ret;
+	return 0;
 }
 
 static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
 {
 	struct device *dev = tc->dev;
-	struct drm_panel *panel;
-	int ret;
+	struct drm_bridge *bridge;
 
 	/* port@2 is the output port */
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, NULL);
-	if (ret && ret != -ENODEV)
-		return dev_err_probe(dev, ret,
-				     "Could not find DSI panel or bridge\n");
-
-	if (panel) {
-		struct drm_bridge *panel_bridge;
-
-		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-		drm_panel_put(panel);
-		if (IS_ERR(panel_bridge))
-			return PTR_ERR(panel_bridge);
+	bridge = of_drm_get_bridge_by_endpoint(dev->of_node, 2, 0);
+	if (IS_ERR(bridge) && PTR_ERR(bridge) != -ENODEV)
+		return dev_err_probe(dev, PTR_ERR(bridge), "Could not find DSI bridge\n");
 
-		tc->panel_bridge = panel_bridge;
+	if (!IS_ERR(bridge)) {
+		tc->bridge.next_bridge = bridge;
 		tc->bridge.type = DRM_MODE_CONNECTOR_eDP;
 	} else {
 		tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;

-- 
2.55.0


