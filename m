Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387CACAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 09:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4eLcONxj3fXb5R2acgcxDhVDGBywKwE0CE0kXriyQY=; b=PJFCkB7HGy7wphq62E0cwmC2gQ
	ep/7T2Io3POznfFHpo2pSjTG6OYmCmYW4TGgwd0nnMRW5DA+JNcChqTZjS/HvBjITnuSb2QcYCtdS
	R5DyY99PwCb5KCiFTy3CDs7wQPsF/vqt/y1ReVoDenGx5TeUkJqUVFJJiy8Q22fONxw/mE/+qQSTX
	dbxl9Jkx4uWPnoiMJ1OoWlGNAqHfbT/Nos6Ly1DF8PmNJTCRsUXcPpRLxPmaKluEHgDpGh/H/jT2Z
	qEoAlau1Mzevss8I/DaKovX13YfvEK4BUEtKphw3JRg74a+3dVcLR3M8QdZSNlSV3mrMShAi/5N7h
	biW/l+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WSc-00000004mDE-2II7;
	Tue, 30 Sep 2025 09:15:50 +0000
Received: from mail-m15566.qiye.163.com ([101.71.155.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WRt-00000004lbK-2BfZ;
	Tue, 30 Sep 2025 09:15:19 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 249404064;
	Tue, 30 Sep 2025 17:14:56 +0800 (GMT+08:00)
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
Subject: [PATCH v6 13/18] drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
Date: Tue, 30 Sep 2025 17:09:15 +0800
Message-Id: <20250930090920.131094-14-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930090920.131094-1-damon.ding@rock-chips.com>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9999e74e4e03a3kunmd96de74a43be4a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx1OGVZJTB8eGUkZQ0waQ0tWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=R8HGy2s/txGC3yDcLEI6LBbZnj78UHxl/GtiHGU738Pa6aJbc72mhyDwFSmlIRKjBIscvME9t0tPRta+f6RN2GoFyqF4gE1T/er7I99Tl9ZN0BL6zah/F+pXnbXbrkw5vg5DThfJ7VlPogqPP5Mg+D000eiuP1Y6zgTMwAEyyz4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=b4eLcONxj3fXb5R2acgcxDhVDGBywKwE0CE0kXriyQY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_021510_579542_BDAA1B74 
X-CRM114-Status: GOOD (  16.79  )
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

Since the panel/bridge should logically be positioned behind the
Analogix bridge in the display pipeline, it makes sense to handle
the panel/bridge parsing on the Analogix side. Therefore, we add
a new API analogix_dp_finish_probe(), which combines the panel/bridge
parsing with component addition, to do it.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---

Changes in v4:
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge.
- Remame API analogix_dp_find_panel_or_bridge() to
  analogix_dp_finish_probe().

Changes in v5:
- Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP.
---
 drivers/gpu/drm/bridge/analogix/Kconfig       |  1 +
 .../drm/bridge/analogix/analogix_dp_core.c    | 48 +++++++++++++++++++
 include/drm/bridge/analogix_dp.h              |  2 +
 3 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 4846b2e9be7c..964122b5bd39 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -29,6 +29,7 @@ config DRM_ANALOGIX_ANX78XX
 config DRM_ANALOGIX_DP
 	tristate
 	depends on DRM
+	select DRM_DISPLAY_DP_AUX_BUS
 
 config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 81c6e81dd352..933f1843777f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -20,12 +20,14 @@
 #include <linux/platform_device.h>
 
 #include <drm/bridge/analogix_dp.h>
+#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -1581,6 +1583,52 @@ struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
 }
 EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
 
+static int analogix_dp_aux_done_probing(struct drm_dp_aux *aux)
+{
+	struct analogix_dp_device *dp = to_dp(aux);
+	struct analogix_dp_plat_data *plat_data = dp->plat_data;
+	int port = plat_data->dev_type == EXYNOS_DP ? 0 : 1;
+	int ret;
+
+	/*
+	 * If drm_of_find_panel_or_bridge() returns -ENODEV, there may be no valid panel
+	 * or bridge nodes. The driver should go on for the driver-free bridge or the DP
+	 * mode applications.
+	 */
+	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, port, 0,
+					  &plat_data->panel, &plat_data->next_bridge);
+	if (ret && ret != -ENODEV)
+		return ret;
+
+	return component_add(dp->dev, plat_data->ops);
+}
+
+int analogix_dp_finish_probe(struct analogix_dp_device *dp)
+{
+	int ret;
+
+	ret = devm_of_dp_aux_populate_bus(&dp->aux, analogix_dp_aux_done_probing);
+	if (ret) {
+		/*
+		 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing() will
+		 * not be called because there are no EP devices. Then the callback function
+		 * analogix_dp_aux_done_probing() will be called directly in order to support
+		 * the other valid DT configurations.
+		 *
+		 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROBE_DEFER.
+		 */
+		if (ret != -ENODEV) {
+			dev_err(dp->dev, "failed to populate aux bus\n");
+			return ret;
+		}
+
+		return analogix_dp_aux_done_probing(&dp->aux);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_finish_probe);
+
 MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
 MODULE_DESCRIPTION("Analogix DP Core Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 3428ffff24c5..bae969dec63a 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -30,6 +30,7 @@ struct analogix_dp_plat_data {
 	struct drm_bridge *next_bridge;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
+	const struct component_ops *ops;
 
 	int (*power_on)(struct analogix_dp_plat_data *);
 	int (*power_off)(struct analogix_dp_plat_data *);
@@ -49,5 +50,6 @@ int analogix_dp_stop_crc(struct drm_connector *connector);
 
 struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux);
 struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
+int analogix_dp_finish_probe(struct analogix_dp_device *dp);
 
 #endif /* _ANALOGIX_DP_H_ */
-- 
2.34.1


