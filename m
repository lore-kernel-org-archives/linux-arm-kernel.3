Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31C3CEFCE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76lI+Kw/EnQnZBp12vCtTjE/XaOzQk4fLYsLcpPHt8g=; b=Xx5eaqbMJWifn6G59aKCn7MQa+
	rm1GLjAYGstUYJE0EMcfy1RRiKrTI7lt0zY2SXRa2R6ilJJwZwbbIDXLOUd9jv7MoWZxT+ehM1h5Y
	YKMMUtzXP5hKRytd/bkPAq9ME7IP9NY3Cradp8cbUNWi/sT4B0pTClwznMdBnvryIQgXt9G8d5Jhz
	IgXyKzzalGTGy0voFJBrWpZ4azSLlClVuNhj4IADPY43vx0IOEEQv3lj6PlrhoHsi2reUeg/PqmDA
	4rhRyCZFfZ+7dlrhuhNB/9ZpTTFu+D404IAIZFRa1y7gfr7QUl7Nmd1sVzdTYEGC90r2Qrv3s4zZ/
	avil2crw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB62-0000000DbIf-0kNC;
	Tue, 06 Jan 2026 17:43:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdB5x-0000000DbCf-3Sc5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:43:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 81538C1E4B6;
	Tue,  6 Jan 2026 17:43:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DCAA60739;
	Tue,  6 Jan 2026 17:43:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D95BE103C81A0;
	Tue,  6 Jan 2026 18:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767721424; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=76lI+Kw/EnQnZBp12vCtTjE/XaOzQk4fLYsLcpPHt8g=;
	b=eiEVOvpdPaKYfOKYmcNZfnJ9Yyv2w6wcqdUVdRQF8PFiht9YIcsuxqXt0JXKw4OaebSRTx
	ooSD9JF2RReQ6NT3zhRdWlyW37LX7Stn/tjC8+T1qmMYUNfcarUOO6FsGtwpB4lM5nVUC5
	kpbXL4FFA2K9kRvzw9V3bXqd0VKJ0B3hz/5OpaN9SpEEDQqu1uI9+J51M7BB0+eD1NFKRC
	9U9FcEigN44wvr5Hf0mQPmd2kxRPUqiLMO3/H7p00lYLnP874kSkI1V7pguCcp6Qs2O+US
	stHwkjki91IMTKwPcIqMo0twhdYfFl+z6MkVUSvgp9z9ZqNfPrq6FmhbkEzCiw==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Tue, 06 Jan 2026 18:42:23 +0100
Subject: [PATCH v3 07/22] drm/tilcdc: Remove component framework support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-feature_tilcdc-v3-7-9bad0f742164@bootlin.com>
References: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
In-Reply-To: <20260106-feature_tilcdc-v3-0-9bad0f742164@bootlin.com>
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
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_094350_051193_EA8AF7D6 
X-CRM114-Status: GOOD (  26.43  )
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

The tilcdc driver previously used the component framework to bind
external encoder subdrivers (specifically the TDA998x HDMI encoder).
With the removal of these subdrivers in previous commits, the component
framework is no longer needed.

This commit removes all component framework infrastructure including:
- Component master operations and bind/unbind callbacks
- The is_componentized flag and conditional code paths
- tilcdc_get_external_components() and tilcdc_add_component_encoder()
- TDA998x-specific panel configuration

The driver now uses a simplified initialization path that directly
attaches external devices via the DRM bridge API, eliminating the
complexity of dual code paths for componentized vs non-componentized
configurations.

This cleanup removes approximately 140 lines of code and makes the
driver initialization flow more straightforward.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c     | 10 ----
 drivers/gpu/drm/tilcdc/tilcdc_drv.c      | 80 ++++----------------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h      |  1 -
 drivers/gpu/drm/tilcdc/tilcdc_external.c | 65 --------------------------
 drivers/gpu/drm/tilcdc/tilcdc_external.h |  3 --
 5 files changed, 9 insertions(+), 150 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 2309a9a0c925d..252e5adaeb6e2 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -1021,16 +1021,6 @@ int tilcdc_crtc_create(struct drm_device *dev)
 
 	drm_crtc_helper_add(crtc, &tilcdc_crtc_helper_funcs);
 
-	if (priv->is_componentized) {
-		crtc->port = of_graph_get_port_by_id(dev->dev->of_node, 0);
-		if (!crtc->port) { /* This should never happen */
-			dev_err(dev->dev, "Port node not found in %pOF\n",
-				dev->dev->of_node);
-			ret = -EINVAL;
-			goto fail;
-		}
-	}
-
 	priv->crtc = crtc;
 	return 0;
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 28f09b9c1879b..9b3a0435a8d2d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -6,7 +6,6 @@
 
 /* LCDC DRM driver, based on da8xx-fb */
 
-#include <linux/component.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
@@ -229,9 +228,6 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	platform_set_drvdata(pdev, ddev);
 	drm_mode_config_init(ddev);
 
-	priv->is_componentized =
-		tilcdc_get_external_components(dev, NULL) > 0;
-
 	priv->wq = alloc_ordered_workqueue("tilcdc", 0);
 	if (!priv->wq) {
 		ret = -ENOMEM;
@@ -348,42 +344,32 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	}
 #endif
 
-	if (priv->is_componentized) {
-		ret = component_bind_all(dev, ddev);
-		if (ret < 0)
-			goto unregister_cpufreq_notif;
-
-		ret = tilcdc_add_component_encoder(ddev);
-		if (ret < 0)
-			goto unbind_component;
-	} else {
-		ret = tilcdc_attach_external_device(ddev);
-		if (ret)
-			goto unregister_cpufreq_notif;
-	}
+	ret = tilcdc_attach_external_device(ddev);
+	if (ret)
+		goto unregister_cpufreq_notif;
 
 	if (!priv->external_connector &&
 	    ((priv->num_encoders == 0) || (priv->num_connectors == 0))) {
 		dev_err(dev, "no encoders/connectors found\n");
 		ret = -EPROBE_DEFER;
-		goto unbind_component;
+		goto unregister_cpufreq_notif;
 	}
 
 	ret = drm_vblank_init(ddev, 1);
 	if (ret < 0) {
 		dev_err(dev, "failed to initialize vblank\n");
-		goto unbind_component;
+		goto unregister_cpufreq_notif;
 	}
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto unbind_component;
+		goto unregister_cpufreq_notif;
 	priv->irq = ret;
 
 	ret = tilcdc_irq_install(ddev, priv->irq);
 	if (ret < 0) {
 		dev_err(dev, "failed to install IRQ handler\n");
-		goto unbind_component;
+		goto unregister_cpufreq_notif;
 	}
 
 	drm_mode_config_reset(ddev);
@@ -401,9 +387,6 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 stop_poll:
 	drm_kms_helper_poll_fini(ddev);
 	tilcdc_irq_uninstall(ddev);
-unbind_component:
-	if (priv->is_componentized)
-		component_unbind_all(dev, ddev);
 unregister_cpufreq_notif:
 #ifdef CONFIG_CPU_FREQ
 	cpufreq_unregister_notifier(&priv->freq_transition,
@@ -552,65 +535,20 @@ static int tilcdc_pm_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(tilcdc_pm_ops,
 				tilcdc_pm_suspend, tilcdc_pm_resume);
 
-/*
- * Platform driver:
- */
-static int tilcdc_bind(struct device *dev)
-{
-	return tilcdc_init(&tilcdc_driver, dev);
-}
-
-static void tilcdc_unbind(struct device *dev)
-{
-	struct drm_device *ddev = dev_get_drvdata(dev);
-
-	/* Check if a subcomponent has already triggered the unloading. */
-	if (!ddev->dev_private)
-		return;
-
-	tilcdc_fini(ddev);
-	dev_set_drvdata(dev, NULL);
-}
-
-static const struct component_master_ops tilcdc_comp_ops = {
-	.bind = tilcdc_bind,
-	.unbind = tilcdc_unbind,
-};
-
 static int tilcdc_pdev_probe(struct platform_device *pdev)
 {
-	struct component_match *match = NULL;
-	int ret;
-
 	/* bail out early if no DT data: */
 	if (!pdev->dev.of_node) {
 		dev_err(&pdev->dev, "device-tree data is missing\n");
 		return -ENXIO;
 	}
 
-	ret = tilcdc_get_external_components(&pdev->dev, &match);
-	if (ret < 0)
-		return ret;
-	else if (ret == 0)
-		return tilcdc_init(&tilcdc_driver, &pdev->dev);
-	else
-		return component_master_add_with_match(&pdev->dev,
-						       &tilcdc_comp_ops,
-						       match);
+	return tilcdc_init(&tilcdc_driver, &pdev->dev);
 }
 
 static void tilcdc_pdev_remove(struct platform_device *pdev)
 {
-	int ret;
-
-	ret = tilcdc_get_external_components(&pdev->dev, NULL);
-	if (ret < 0)
-		dev_err(&pdev->dev, "tilcdc_get_external_components() failed (%pe)\n",
-			ERR_PTR(ret));
-	else if (ret == 0)
-		tilcdc_fini(platform_get_drvdata(pdev));
-	else
-		component_master_del(&pdev->dev, &tilcdc_comp_ops);
+	tilcdc_fini(platform_get_drvdata(pdev));
 }
 
 static void tilcdc_pdev_shutdown(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 79078b4ae7393..c23b593dc61f6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -84,7 +84,6 @@ struct tilcdc_drm_private {
 	struct drm_encoder *external_encoder;
 	struct drm_connector *external_connector;
 
-	bool is_componentized;
 	bool irq_enabled;
 };
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index da755a411d9ff..2970c41d9c3eb 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -4,7 +4,6 @@
  * Author: Jyri Sarha <jsarha@ti.com>
  */
 
-#include <linux/component.h>
 #include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -15,19 +14,6 @@
 #include "tilcdc_drv.h"
 #include "tilcdc_external.h"
 
-static const struct tilcdc_panel_info panel_info_tda998x = {
-		.ac_bias                = 255,
-		.ac_bias_intrpt         = 0,
-		.dma_burst_sz           = 16,
-		.bpp                    = 16,
-		.fdd                    = 0x80,
-		.tft_alt_mode           = 0,
-		.invert_pxl_clk		= 1,
-		.sync_edge              = 1,
-		.sync_ctrl              = 1,
-		.raster_order           = 0,
-};
-
 static const struct tilcdc_panel_info panel_info_default = {
 		.ac_bias                = 255,
 		.ac_bias_intrpt         = 0,
@@ -57,34 +43,6 @@ struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
 	return NULL;
 }
 
-int tilcdc_add_component_encoder(struct drm_device *ddev)
-{
-	struct tilcdc_drm_private *priv = ddev->dev_private;
-	struct drm_encoder *encoder = NULL, *iter;
-
-	list_for_each_entry(iter, &ddev->mode_config.encoder_list, head)
-		if (iter->possible_crtcs & (1 << priv->crtc->index)) {
-			encoder = iter;
-			break;
-		}
-
-	if (!encoder) {
-		dev_err(ddev->dev, "%s: No suitable encoder found\n", __func__);
-		return -ENODEV;
-	}
-
-	priv->external_connector =
-		tilcdc_encoder_find_connector(ddev, encoder);
-
-	if (!priv->external_connector)
-		return -ENODEV;
-
-	/* Only tda998x is supported at the moment. */
-	tilcdc_crtc_set_panel_info(priv->crtc, &panel_info_tda998x);
-
-	return 0;
-}
-
 static
 int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 {
@@ -153,26 +111,3 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
 	drm_encoder_cleanup(priv->external_encoder);
 	return ret;
 }
-
-static int dev_match_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
-int tilcdc_get_external_components(struct device *dev,
-				   struct component_match **match)
-{
-	struct device_node *node;
-
-	node = of_graph_get_remote_node(dev->of_node, 0, 0);
-
-	if (!of_device_is_compatible(node, "nxp,tda998x")) {
-		of_node_put(node);
-		return 0;
-	}
-
-	if (match)
-		drm_of_component_match_add(dev, match, dev_match_of, node);
-	of_node_put(node);
-	return 1;
-}
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.h b/drivers/gpu/drm/tilcdc/tilcdc_external.h
index fb4476694cd89..285a132f3035d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.h
@@ -7,8 +7,5 @@
 #ifndef __TILCDC_EXTERNAL_H__
 #define __TILCDC_EXTERNAL_H__
 
-int tilcdc_add_component_encoder(struct drm_device *dev);
-int tilcdc_get_external_components(struct device *dev,
-				   struct component_match **match);
 int tilcdc_attach_external_device(struct drm_device *ddev);
 #endif /* __TILCDC_SLAVE_H__ */

-- 
2.43.0


