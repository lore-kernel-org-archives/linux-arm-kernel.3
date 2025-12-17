Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8F8D64099
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLgwRoSZkiEzvN/zcPKGoFOzo9iVfJiXb9YkvPXxjaY=; b=AFx+JquicesboSWN77EdUJOnTT
	72YLVFX1pyaqP/elDgi/8kJSkpK/SfA5xI1vjBGFiRQpcyxaFz4SYxDZ31zhQ73tIrqOblbSg0x5t
	2YRHb4kiObPoSnw2p47dLTYWLI/r/33mZhr9WCzzcu8jmtDLalGEeXX1lk+PZOWy/gyqKjqYB2J92
	oL3LAok7LTrDaepxDNgFpz6M37DMyULgrCnc/KWgjXl1II5IhG4anNq/FMWqaJKNLTYFu9SXk+8MO
	jwXw0H7XoDMubQzVR4KVjP4B/YeV97e3eO8N/gVN1LtmWos7amvam4crEf8+TeHaheisBCDjfDs8J
	BLNTtUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnv6-00000006Qa4-3vIL;
	Wed, 17 Dec 2025 09:34:08 +0000
Received: from mail-m32107.qiye.163.com ([220.197.32.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnuy-00000006QL9-1dyL;
	Wed, 17 Dec 2025 09:34:01 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d931e546;
	Wed, 17 Dec 2025 17:33:55 +0800 (GMT+08:00)
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
Subject: [PATCH v8 08/18] drm/exynos: exynos_dp: Apply of-display-mode-bridge to parse the display-timings node
Date: Wed, 17 Dec 2025 17:33:11 +0800
Message-Id: <20251217093321.3108939-9-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217093321.3108939-1-damon.ding@rock-chips.com>
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b2ba8b58903a3kunma9c945a29ee92
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkwdTlZCSh1ISk4aH0xKSENWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=JzLEkicpgq+L4NaO8VGL6z4OCGaph6O5YD3pdtwxMfLXlWKO+N7O4TbFIUNx9edtCh/aQyCZLJEgcZKe9yF2doI/OYIvdS7nkJ6a7I5tHTLgw4Pd/AmolNIwW/2MvwYY+kHgOHCRS0Qa+rkvCwFj7BrW3XR9KyzUH88e8fhTgC4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=DLgwRoSZkiEzvN/zcPKGoFOzo9iVfJiXb9YkvPXxjaY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_013400_682776_67A7DC97 
X-CRM114-Status: GOOD (  16.88  )
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

If there is neither a panel nor a bridge, the display timing can be
parsed from the display-timings node under the dp node.

In order to get rid of &analogix_dp_plat_data.get_modes() and make
the codes more consistent, apply DRM of-display-mode-bridge to parse
display timings.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

------

Changes in v6:
- Apply DRM legacy bridge to parse display timings instead of
  implementing the same codes only for Exynos DP.

Changes in v7:
- Use temporary flag &exynos_dp_device.has_of_bridge, which will be
  removed in the following patch, instead of applying API
  drm_bridge_is_legacy().
- Remove exynos_dp_legacy_bridge_init() and inline API
  devm_drm_of_display_mode_bridge().
---
 drivers/gpu/drm/exynos/Kconfig     |  1 +
 drivers/gpu/drm/exynos/exynos_dp.c | 66 ++++++++----------------------
 2 files changed, 17 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 0d13828e7d9e..380d9a8ce259 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -72,6 +72,7 @@ config DRM_EXYNOS_DP
 	select DRM_ANALOGIX_DP
 	select DRM_DISPLAY_DP_HELPER
 	default DRM_EXYNOS
+	select DRM_OF_DISPLAY_MODE_BRIDGE
 	select DRM_PANEL
 	help
 	  This enables support for DP device.
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index e20513164032..ac16138a22fe 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -19,6 +19,7 @@
 #include <video/videomode.h>
 
 #include <drm/bridge/analogix_dp.h>
+#include <drm/bridge/of-display-mode-bridge.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
@@ -38,9 +39,10 @@ struct exynos_dp_device {
 	struct drm_device          *drm_dev;
 	struct device              *dev;
 
-	struct videomode           vm;
 	struct analogix_dp_device *adp;
 	struct analogix_dp_plat_data plat_data;
+
+	bool has_of_bridge;
 };
 
 static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
@@ -67,44 +69,20 @@ static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
 	return exynos_dp_crtc_clock_enable(plat_data, false);
 }
 
-static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data,
-			       struct drm_connector *connector)
-{
-	struct exynos_dp_device *dp = to_dp(plat_data);
-	struct drm_display_mode *mode;
-
-	if (dp->plat_data.panel)
-		return 0;
-
-	mode = drm_mode_create(connector->dev);
-	if (!mode) {
-		DRM_DEV_ERROR(dp->dev,
-			      "failed to create a new display mode.\n");
-		return 0;
-	}
-
-	drm_display_mode_from_videomode(&dp->vm, mode);
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
-
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	drm_mode_set_name(mode);
-	drm_mode_probed_add(connector, mode);
-
-	return 1;
-}
-
 static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
 				   struct drm_bridge *bridge,
 				   struct drm_connector *connector)
 {
 	struct exynos_dp_device *dp = to_dp(plat_data);
+	enum drm_bridge_attach_flags flags = 0;
 	int ret;
 
 	/* Pre-empt DP connector creation if there's a bridge */
 	if (plat_data->next_bridge) {
-		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
-					0);
+		if (dp->has_of_bridge)
+			flags = DRM_BRIDGE_ATTACH_NO_CONNECTOR;
+
+		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge, flags);
 		if (ret)
 			return ret;
 	}
@@ -129,19 +107,6 @@ static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_funcs = {
 	.disable = exynos_dp_nop,
 };
 
-static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
-{
-	int ret;
-
-	ret = of_get_videomode(dp->dev->of_node, &dp->vm, OF_USE_NATIVE_MODE);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev,
-			      "failed: of_get_videomode() : %d\n", ret);
-		return ret;
-	}
-	return 0;
-}
-
 static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
@@ -151,12 +116,6 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	if (!dp->plat_data.panel && !dp->plat_data.next_bridge) {
-		ret = exynos_dp_dt_parse_panel(dp);
-		if (ret)
-			return ret;
-	}
-
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
@@ -223,6 +182,14 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
+	if (ret == -ENODEV) {
+		dp->plat_data.next_bridge = devm_drm_of_display_mode_bridge(dp->dev,
+									dp->dev->of_node,
+									DRM_MODE_CONNECTOR_eDP);
+		ret = IS_ERR(dp->plat_data.next_bridge) ? PTR_ERR(dp->plat_data.next_bridge) : 0;
+		if (!ret)
+			dp->has_of_bridge = true;
+	}
 	if (ret)
 		return ret;
 
@@ -233,7 +200,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.attach = exynos_dp_bridge_attach;
-	dp->plat_data.get_modes = exynos_dp_get_modes;
 	dp->plat_data.skip_connector = !!bridge;
 
 out:
-- 
2.34.1


