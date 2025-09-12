Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2A5CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAmTwhSSOjeVvdgZsWyAdmIr2/ULoeK9dehgdSOeXuw=; b=NkUyo8GBxk2Iw6y7rWFM7cQG3G
	vVACrUQBFHDH6I7xEm/oOn2POuN2cRblq3xtIk25AkGRRBJi5euahB4kx91bk6or+ygA5N8Zrp3sM
	p7w2KkjYL08O4Bd7momqomrdPJEL45NlW/uR3xPW6uZABSRgUYhf2cWTAfwqSol5RhJG/7Z1moIOv
	0mJ0AmnhwFR8iqlBli86fXl+w/iaOKhR08u9SVj1SvfoMttxtTxKzPsSoKk9tR+islYJjRycHqTCm
	RAdlYQHEw66JRd4FgBkJPmjDO3VuF40S3ySu5r0h+bOLImr/OcfJBuZbd7aYV0nMh31rddWYwd2th
	GLHhyXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzcx-000000085So-2O0J;
	Fri, 12 Sep 2025 08:59:31 +0000
Received: from mail-m49237.qiye.163.com ([45.254.49.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzcl-000000085A1-2W9o;
	Fri, 12 Sep 2025 08:59:21 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2298809b7;
	Fri, 12 Sep 2025 16:59:14 +0800 (GMT+08:00)
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
	jingoohan1@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 07/17] drm/exynos: exynos_dp: Add legacy bridge to parse the display-timings node
Date: Fri, 12 Sep 2025 16:58:36 +0800
Message-Id: <20250912085846.7349-8-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993d26758a03a3kunm813a8c8ea45c40
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlIQlZOSRhJSkwdTk1MHh9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=CuUUrGCp3SMBooUrPs22ScQ/wJE6Cs/Q1quvt75cQMCx9X2yCBXl/NTvvsRNszieCe9lYi1FUuamNeWoNbp0vtrbguyJ0nTqp+qgPjPlaxt2SbBQn7m67k9XI9YhbHE6SahtB268HzLHHc2F5cKGyeNHXm/rA58SJz7U68wx3OA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=DAmTwhSSOjeVvdgZsWyAdmIr2/ULoeK9dehgdSOeXuw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_015919_886650_8A6D3C13 
X-CRM114-Status: GOOD (  15.80  )
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

Adding a legacy bridge to parse the display-timings node would get
rid of &analogix_dp_plat_data.get_modes() and make the codes more
consistent.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 132 ++++++++++++++++++-----------
 1 file changed, 82 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 702128d76ae3..33e9758bc00d 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -33,16 +33,90 @@
 
 #define to_dp(nm)	container_of(nm, struct exynos_dp_device, nm)
 
+#define to_legacy_bridge(bridge)	container_of(bridge, struct exynos_dp_legacy_bridge, base)
+
 struct exynos_dp_device {
 	struct drm_encoder         encoder;
 	struct drm_device          *drm_dev;
 	struct device              *dev;
 
-	struct videomode           vm;
 	struct analogix_dp_device *adp;
 	struct analogix_dp_plat_data plat_data;
 };
 
+struct exynos_dp_legacy_bridge {
+	struct drm_bridge base;
+	struct drm_display_mode mode;
+
+	u32 bus_flags;
+};
+
+static int exynos_dp_legacy_bridge_attach(struct drm_bridge *bridge,
+					  struct drm_encoder *encoder,
+					  enum drm_bridge_attach_flags flags)
+{
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int exynos_dp_legacy_bridge_get_modes(struct drm_bridge *bridge,
+					     struct drm_connector *connector)
+{
+	struct exynos_dp_legacy_bridge *legacy_bridge = to_legacy_bridge(bridge);
+	int ret;
+
+	ret = drm_connector_helper_get_modes_fixed(connector, &legacy_bridge->mode);
+	if (ret)
+		return ret;
+
+	connector->display_info.bus_flags = legacy_bridge->bus_flags;
+
+	return 0;
+}
+
+struct drm_bridge_funcs exynos_dp_legacy_bridge_funcs = {
+	.attach = exynos_dp_legacy_bridge_attach,
+	.get_modes = exynos_dp_legacy_bridge_get_modes,
+};
+
+static int exynos_dp_dt_parse_legacy_bridge(struct exynos_dp_device *dp,
+					    struct drm_bridge **bridge)
+{
+	struct exynos_dp_legacy_bridge *legacy_bridge;
+	int ret;
+
+	if (!bridge)
+		return -EINVAL;
+
+	legacy_bridge = devm_drm_bridge_alloc(dp->dev, struct exynos_dp_legacy_bridge,
+					      base, &exynos_dp_legacy_bridge_funcs);
+	if (IS_ERR(legacy_bridge))
+		return PTR_ERR(legacy_bridge);
+
+	ret = of_get_drm_display_mode(dp->dev->of_node,
+				      &legacy_bridge->mode,
+				      &legacy_bridge->bus_flags,
+				      OF_USE_NATIVE_MODE);
+	if (ret)
+		return ret;
+
+	legacy_bridge->mode.type |= DRM_MODE_TYPE_DRIVER;
+
+	legacy_bridge->base.of_node = dp->dev->of_node;
+	legacy_bridge->base.ops = DRM_BRIDGE_OP_MODES;
+	legacy_bridge->base.type = DRM_MODE_CONNECTOR_eDP;
+
+	ret = devm_drm_bridge_add(dp->dev, &legacy_bridge->base);
+	if (ret)
+		return ret;
+
+	*bridge = &legacy_bridge->base;
+
+	return 0;
+}
+
 static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
 				bool enable)
 {
@@ -67,44 +141,20 @@ static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
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
+		if (plat_data->next_bridge->funcs == &exynos_dp_legacy_bridge_funcs)
+			flags = DRM_BRIDGE_ATTACH_NO_CONNECTOR;
+
+		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge, flags);
 		if (ret)
 			return ret;
 	}
@@ -129,19 +179,6 @@ static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_funcs = {
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
@@ -151,12 +188,6 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	if (!dp->plat_data.panel && !dp->plat_data.next_bridge) {
-		ret = exynos_dp_dt_parse_panel(dp);
-		if (ret)
-			return ret;
-	}
-
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
@@ -223,6 +254,8 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
+	if (ret == -ENODEV)
+		ret = exynos_dp_dt_parse_legacy_bridge(dp, &bridge);
 	if (ret)
 		return ret;
 
@@ -233,7 +266,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.attach = exynos_dp_bridge_attach;
-	dp->plat_data.get_modes = exynos_dp_get_modes;
 
 out:
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
-- 
2.34.1


