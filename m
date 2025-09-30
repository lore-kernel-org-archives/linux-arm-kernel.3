Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069E0CCA46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 09:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8xesRGD6O/As+P5vaiSAXXfAHf6JkNbQ3WmOYLpR4Q=; b=0Njg2KrnnPdOW8aKKSB+mePC1e
	Gjy+5fKfFFyzE/wnhPv01pVhiyJOnyZ2qyxhJ7qPhkMHyvTXATKxPCgZWyzB+aGFbL5eu1auha8Mo
	gNPI2Uf4uTBxxrLpOUpaUcw7Sh6QF+SUkoP3TryjpnFH+JiC3bYh0P6ecKf8hXxSEE+sPtKSxLUtb
	BnN7A/Sg4zId0zzgX2WLdG1dbgWtTKCNHC0GyNzxRIorUnMTLpOKR1C8RsBOhSpsBfUED7SF9vpg9
	V+8z6Qeq6y2o9+3JzC99ipiLilCch+qWFGnq0OR5QGguo/+8w/86sFAuA5MU7vJZithdgJ24hB0eE
	njXiiAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WRf-00000004lQ1-2f3O;
	Tue, 30 Sep 2025 09:14:51 +0000
Received: from mail-m155106.qiye.163.com ([101.71.155.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WRR-00000004lA6-1vUu;
	Tue, 30 Sep 2025 09:14:39 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 249403ff0;
	Tue, 30 Sep 2025 17:14:32 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 04/18] drm/bridge: Move legacy bridge driver out of imx directory for multi-platform use
Date: Tue, 30 Sep 2025 17:09:06 +0800
Message-Id: <20250930090920.131094-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930090920.131094-1-damon.ding@rock-chips.com>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9999e6ef1e03a3kunmd96de74a43bbef
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ05DS1YeGh4ZTRkeS0gdQh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=jutpg2QsijRz2attaaPkPccyJ3Melcd1RJU+J5vSgywIXQy+X1Gg5w0sp7mwHb1kx9/mgrVcGYbKsTqxWZhCf27mZ04saHC4Jn+9JfMUOFPTEFRnWxVvTv71iDpDNmk1I5GZw/UyzhLmGkZorkt7LzY1pKLkWSkGYI/B3s3Odb4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=D8xesRGD6O/As+P5vaiSAXXfAHf6JkNbQ3WmOYLpR4Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_021437_772307_A0187498 
X-CRM114-Status: GOOD (  24.40  )
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

As suggested by Dmitry, the DRM legacy bridge driver can be pulled
out of imx/ subdir for multi-platform use. The driver is also renamed
to make it more generic and suitable for platforms other than i.MX.

Additionally, a new API drm_bridge_is_legacy() is added to identify
the legacy bridge, allowing specialized handling for such cases.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/Kconfig                | 10 ++
 drivers/gpu/drm/bridge/Makefile               |  1 +
 drivers/gpu/drm/bridge/imx/Kconfig            | 10 --
 drivers/gpu/drm/bridge/imx/Makefile           |  1 -
 .../gpu/drm/bridge/imx/imx-legacy-bridge.c    | 91 -----------------
 drivers/gpu/drm/bridge/legacy-bridge.c        | 99 +++++++++++++++++++
 drivers/gpu/drm/imx/ipuv3/Kconfig             |  4 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |  6 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c  |  4 +-
 include/drm/bridge/imx.h                      | 17 ----
 include/drm/bridge/legacy-bridge.h            | 18 ++++
 11 files changed, 135 insertions(+), 126 deletions(-)
 delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/legacy-bridge.c
 delete mode 100644 include/drm/bridge/imx.h
 create mode 100644 include/drm/bridge/legacy-bridge.h

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a250afd8d662..77d8de3fa8c4 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -125,6 +125,16 @@ config DRM_ITE_IT6505
 	help
 	  ITE IT6505 DisplayPort bridge chip driver.
 
+config DRM_LEGACY_BRIDGE
+	tristate
+	depends on DRM_BRIDGE && OF
+	help
+	  This is a DRM bridge implementation that uses of_get_drm_display_mode
+	  to acquire display mode.
+
+	  Newer designs should not use this bridge and should use proper panel
+	  driver instead.
+
 config DRM_LONTIUM_LT8912B
 	tristate "Lontium LT8912B DSI/HDMI bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index c7dc03182e59..f2cb7b4f26e5 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
 
 obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
+obj-$(CONFIG_DRM_LEGACY_BRIDGE) += legacy-bridge.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
 obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
 obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 9a480c6abb85..8dd89efa8ea7 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -3,16 +3,6 @@ if ARCH_MXC || COMPILE_TEST
 config DRM_IMX_LDB_HELPER
 	tristate
 
-config DRM_IMX_LEGACY_BRIDGE
-	tristate
-	depends on DRM_IMX
-	help
-	  This is a DRM bridge implementation for the DRM i.MX IPUv3 driver,
-	  that uses of_get_drm_display_mode to acquire display mode.
-
-	  Newer designs should not use this bridge and should use proper panel
-	  driver instead.
-
 config DRM_IMX8MP_DW_HDMI_BRIDGE
 	tristate "Freescale i.MX8MP HDMI-TX bridge support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index dd5d48584806..edb0a7b71b30 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,5 +1,4 @@
 obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
-obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
 obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
 obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
deleted file mode 100644
index 0e31d5000e7c..000000000000
--- a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
+++ /dev/null
@@ -1,91 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Freescale i.MX drm driver
- *
- * bridge driver for legacy DT bindings, utilizing display-timings node
- */
-
-#include <linux/export.h>
-
-#include <drm/drm_bridge.h>
-#include <drm/drm_modes.h>
-#include <drm/drm_probe_helper.h>
-#include <drm/bridge/imx.h>
-
-#include <video/of_display_timing.h>
-#include <video/of_videomode.h>
-
-struct imx_legacy_bridge {
-	struct drm_bridge base;
-
-	struct drm_display_mode mode;
-	u32 bus_flags;
-};
-
-#define to_imx_legacy_bridge(bridge)	container_of(bridge, struct imx_legacy_bridge, base)
-
-static int imx_legacy_bridge_attach(struct drm_bridge *bridge,
-				    struct drm_encoder *encoder,
-				    enum drm_bridge_attach_flags flags)
-{
-	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
-		return -EINVAL;
-
-	return 0;
-}
-
-static int imx_legacy_bridge_get_modes(struct drm_bridge *bridge,
-				       struct drm_connector *connector)
-{
-	struct imx_legacy_bridge *imx_bridge = to_imx_legacy_bridge(bridge);
-	int ret;
-
-	ret = drm_connector_helper_get_modes_fixed(connector, &imx_bridge->mode);
-	if (ret)
-		return ret;
-
-	connector->display_info.bus_flags = imx_bridge->bus_flags;
-
-	return 0;
-}
-
-struct drm_bridge_funcs imx_legacy_bridge_funcs = {
-	.attach = imx_legacy_bridge_attach,
-	.get_modes = imx_legacy_bridge_get_modes,
-};
-
-struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
-					      struct device_node *np,
-					      int type)
-{
-	struct imx_legacy_bridge *imx_bridge;
-	int ret;
-
-	imx_bridge = devm_drm_bridge_alloc(dev, struct imx_legacy_bridge,
-					   base, &imx_legacy_bridge_funcs);
-	if (IS_ERR(imx_bridge))
-		return ERR_CAST(imx_bridge);
-
-	ret = of_get_drm_display_mode(np,
-				      &imx_bridge->mode,
-				      &imx_bridge->bus_flags,
-				      OF_USE_NATIVE_MODE);
-	if (ret)
-		return ERR_PTR(ret);
-
-	imx_bridge->mode.type |= DRM_MODE_TYPE_DRIVER;
-
-	imx_bridge->base.of_node = np;
-	imx_bridge->base.ops = DRM_BRIDGE_OP_MODES;
-	imx_bridge->base.type = type;
-
-	ret = devm_drm_bridge_add(dev, &imx_bridge->base);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return &imx_bridge->base;
-}
-EXPORT_SYMBOL_GPL(devm_imx_drm_legacy_bridge);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("Freescale i.MX DRM bridge driver for legacy DT bindings");
diff --git a/drivers/gpu/drm/bridge/legacy-bridge.c b/drivers/gpu/drm/bridge/legacy-bridge.c
new file mode 100644
index 000000000000..0d0a398036fe
--- /dev/null
+++ b/drivers/gpu/drm/bridge/legacy-bridge.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2012 Sascha Hauer, Pengutronix
+ *
+ * bridge driver for legacy DT bindings, utilizing display-timings node
+ *
+ * Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+ */
+
+#include <linux/export.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/bridge/legacy-bridge.h>
+
+#include <video/of_display_timing.h>
+#include <video/of_videomode.h>
+
+struct legacy_bridge {
+	struct drm_bridge base;
+
+	struct drm_display_mode mode;
+	u32 bus_flags;
+};
+
+#define to_legacy_bridge(bridge)	container_of(bridge, struct legacy_bridge, base)
+
+static int legacy_bridge_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
+				enum drm_bridge_attach_flags flags)
+{
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int legacy_bridge_get_modes(struct drm_bridge *bridge,
+				   struct drm_connector *connector)
+{
+	struct legacy_bridge *legacy = to_legacy_bridge(bridge);
+	int ret;
+
+	ret = drm_connector_helper_get_modes_fixed(connector, &legacy->mode);
+	if (ret)
+		return ret;
+
+	connector->display_info.bus_flags = legacy->bus_flags;
+
+	return 0;
+}
+
+struct drm_bridge_funcs legacy_bridge_funcs = {
+	.attach = legacy_bridge_attach,
+	.get_modes = legacy_bridge_get_modes,
+};
+
+struct drm_bridge *devm_drm_legacy_bridge(struct device *dev,
+					  struct device_node *np,
+					  int type)
+{
+	struct legacy_bridge *legacy;
+	int ret;
+
+	legacy = devm_drm_bridge_alloc(dev, struct legacy_bridge,
+				       base, &legacy_bridge_funcs);
+	if (IS_ERR(legacy))
+		return ERR_CAST(legacy);
+
+	ret = of_get_drm_display_mode(np,
+				      &legacy->mode,
+				      &legacy->bus_flags,
+				      OF_USE_NATIVE_MODE);
+	if (ret)
+		return ERR_PTR(ret);
+
+	legacy->mode.type |= DRM_MODE_TYPE_DRIVER;
+
+	legacy->base.of_node = np;
+	legacy->base.ops = DRM_BRIDGE_OP_MODES;
+	legacy->base.type = type;
+
+	ret = devm_drm_bridge_add(dev, &legacy->base);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &legacy->base;
+}
+EXPORT_SYMBOL_GPL(devm_drm_legacy_bridge);
+
+bool drm_bridge_is_legacy(const struct drm_bridge *bridge)
+{
+	return bridge->funcs == &legacy_bridge_funcs;
+}
+EXPORT_SYMBOL(drm_bridge_is_legacy);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DRM bridge driver for legacy DT bindings");
diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index acaf25089001..401e9cfe5419 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -15,7 +15,7 @@ config DRM_IMX_PARALLEL_DISPLAY
 	depends on DRM_IMX
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
-	select DRM_IMX_LEGACY_BRIDGE
+	select DRM_LEGACY_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
 
@@ -36,7 +36,7 @@ config DRM_IMX_LDB
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_PANEL_BRIDGE
-	select DRM_IMX_LEGACY_BRIDGE
+	select DRM_LEGACY_BRIDGE
 	help
 	  Choose this to enable the internal LVDS Display Bridge (LDB)
 	  found on i.MX53 and i.MX6 processors.
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 6be7a57ad03d..3b0206c7d88e 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -28,7 +28,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/bridge/imx.h>
+#include <drm/bridge/legacy-bridge.h>
 
 #include "imx-drm.h"
 
@@ -605,8 +605,8 @@ static int imx_ldb_probe(struct platform_device *pdev)
 		 * checking the bus_format property.
 		 */
 		if (!channel->bridge) {
-			channel->bridge = devm_imx_drm_legacy_bridge(dev, child,
-								     DRM_MODE_CONNECTOR_LVDS);
+			channel->bridge = devm_drm_legacy_bridge(dev, child,
+								 DRM_MODE_CONNECTOR_LVDS);
 			if (IS_ERR(channel->bridge)) {
 				ret = PTR_ERR(channel->bridge);
 				goto free_child;
diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 6d8325c76697..f8f7206b45bb 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -19,7 +19,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
-#include <drm/bridge/imx.h>
+#include <drm/bridge/legacy-bridge.h>
 
 #include "imx-drm.h"
 
@@ -235,7 +235,7 @@ static int imx_pd_probe(struct platform_device *pdev)
 	/* port@1 is the output port */
 	imxpd->next_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
 	if (imxpd->next_bridge == ERR_PTR(-ENODEV))
-		imxpd->next_bridge = devm_imx_drm_legacy_bridge(dev, np, DRM_MODE_CONNECTOR_DPI);
+		imxpd->next_bridge = devm_drm_legacy_bridge(dev, np, DRM_MODE_CONNECTOR_DPI);
 	if (IS_ERR(imxpd->next_bridge)) {
 		ret = PTR_ERR(imxpd->next_bridge);
 		return ret;
diff --git a/include/drm/bridge/imx.h b/include/drm/bridge/imx.h
deleted file mode 100644
index b93f719fe0e7..000000000000
--- a/include/drm/bridge/imx.h
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (C) 2012 Sascha Hauer, Pengutronix
- */
-
-#ifndef DRM_IMX_BRIDGE_H
-#define DRM_IMX_BRIDGE_H
-
-struct device;
-struct device_node;
-struct drm_bridge;
-
-struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
-					      struct device_node *np,
-					      int type);
-
-#endif
diff --git a/include/drm/bridge/legacy-bridge.h b/include/drm/bridge/legacy-bridge.h
new file mode 100644
index 000000000000..27bc056f5543
--- /dev/null
+++ b/include/drm/bridge/legacy-bridge.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2012 Sascha Hauer, Pengutronix
+ */
+
+#ifndef DRM_LEGACY_BRIDGE_H
+#define DRM_LEGACY_BRIDGE_H
+
+struct device;
+struct device_node;
+struct drm_bridge;
+
+struct drm_bridge *devm_drm_legacy_bridge(struct device *dev,
+					  struct device_node *np,
+					  int type);
+bool drm_bridge_is_legacy(const struct drm_bridge *bridge);
+
+#endif
-- 
2.34.1


