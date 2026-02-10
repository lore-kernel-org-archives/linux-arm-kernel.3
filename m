Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD9BEA3F2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+bGd3ua6CM30Mg2VXtf08LWh5BH559jUH485cw6AnM=; b=F0MFdesRREuyOL9FTZcqatNdvh
	Hy6CyJSvPAqq/2wg9+wiaeGccTJBfAduTcp1tuVTyqWjJiyEevCI2rGlGm45R8kVfCv3h84q7JAXg
	LP3guBu+cGz493lE2XHlsr5WVxPomh4tt+LWRiGCWyAhangnUIlaQXdMzPVSZnpjaUQdbWZa5L5fb
	7JGlXPILWDIqL5P6I1sRLqWvhaIH+3jOq54wL/DC+7SLVHv+o1abx4rzb/56O/LAb6ogqAp/IwzLC
	Gf9F2CFOaHhvRjwb6bcAQY8jUc5T8C4acwjRX4GeGn3WrNgJqjhSnFbNVX/a6fX92Ph71rjj4YY8q
	RshZBY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpjle-0000000GjKp-1I1h;
	Tue, 10 Feb 2026 09:10:46 +0000
Received: from mail-m19731115.qiye.163.com ([220.197.31.115])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpjlZ-0000000GjJZ-45cm;
	Tue, 10 Feb 2026 09:10:43 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33b982511;
	Tue, 10 Feb 2026 17:10:34 +0800 (GMT+08:00)
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
Subject: [PATCH v9 15/15] drm/bridge: analogix_dp: Apply panel_bridge helper
Date: Tue, 10 Feb 2026 17:10:24 +0800
Message-Id: <20260210091024.2732369-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210091024.2732369-1-damon.ding@rock-chips.com>
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
 <20260210091024.2732369-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c46d119c903a3kunm0d7fbd00b0728b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pMTFZMTk0eSh4dS0JISRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=OKtvtFXsqWlBYecb/9qXzGeTAlxfcIbetsEaqAvwUeNlTH8nh24vkAf5xgVZF4+NvYmI3FCgjs4U07oBIFB7GnvMsKqJMYqkNsOP8ck14wO6RAry0kQJ3joV/JF1pvLjM3wbNtnA/Kh4jGHCPBrWeIzRt0x9yL6FU/u20PCbqqM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=T+bGd3ua6CM30Mg2VXtf08LWh5BH559jUH485cw6AnM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_011042_186262_4A3C606C 
X-CRM114-Status: GOOD (  16.20  )
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

In order to unify the handling of the panel and bridge, apply
panel_bridge helpers for Analogix DP driver. With this patch, the
bridge support will also become available.

The following changes have ben made:
- Apply plane_bridge helper to wrap the panel as the bridge.
- Remove the explicit panel APIs calls, which can be replaced with
  the automic bridge APIs calls wrapped by the panel.
- Remove the unnecessary analogix_dp_bridge_get_modes().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

---

Changes in v4:
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge.

Changes in v5:
- Move panel_bridge addition a little forward.
- Move next_bridge attachment from Analogix side to Rockchip/Exynos
  side.

Changes in v6
- Remove the unnecessary analogix_dp_bridge_get_modes().
- Not to set DRM_BRIDGE_OP_MODES if the next is a panel.
- Squash [PATCH v5 15/17]drm/bridge: analogix_dp: Remove panel
  disabling and enabling in analogix_dp_set_bridge() into this
  commit.
- Fix the &drm_bridge->ops to DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT.

Changes in v9:
- Add Tested-by tag.
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 41 +++++--------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 7e3e9d4f4ea2..d2ea93e1c9a3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -749,9 +749,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
 {
 	int ret;
 
-	/* Keep the panel disabled while we configure video */
-	drm_panel_disable(dp->plat_data->panel);
-
 	ret = analogix_dp_train_link(dp);
 	if (ret) {
 		dev_err(dp->dev, "unable to do link train, ret=%d\n", ret);
@@ -771,9 +768,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
 		return ret;
 	}
 
-	/* Safe to enable the panel now */
-	drm_panel_enable(dp->plat_data->panel);
-
 	/* Check whether panel supports fast training */
 	ret = analogix_dp_fast_link_train_detection(dp);
 	if (ret)
@@ -858,17 +852,6 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
 	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
 }
 
-static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
-{
-	struct analogix_dp_device *dp = to_dp(bridge);
-	int num_modes = 0;
-
-	if (dp->plat_data->panel)
-		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
-
-	return num_modes;
-}
-
 static const struct drm_edid *analogix_dp_bridge_edid_read(struct drm_bridge *bridge,
 							   struct drm_connector *connector)
 {
@@ -909,7 +892,7 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
 	struct analogix_dp_device *dp = to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
-	if (dp->plat_data->panel || dp->plat_data->next_bridge)
+	if (dp->plat_data->next_bridge)
 		return connector_status_connected;
 
 	if (!analogix_dp_detect_hpd(dp))
@@ -995,8 +978,6 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	/* Don't touch the panel if we're coming back from PSR */
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
-
-	drm_panel_prepare(dp->plat_data->panel);
 }
 
 static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
@@ -1168,16 +1149,12 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
 
-	drm_panel_disable(dp->plat_data->panel);
-
 	disable_irq(dp->irq);
 
 	analogix_dp_set_analog_power_down(dp, POWER_ALL, 1);
 
 	pm_runtime_put_sync(dp->dev);
 
-	drm_panel_unprepare(dp->plat_data->panel);
-
 	dp->fast_train_enable = false;
 	dp->psr_supported = false;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
@@ -1252,7 +1229,6 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.atomic_post_disable = analogix_dp_bridge_atomic_post_disable,
 	.atomic_check = analogix_dp_bridge_atomic_check,
 	.attach = analogix_dp_bridge_attach,
-	.get_modes = analogix_dp_bridge_get_modes,
 	.edid_read = analogix_dp_bridge_edid_read,
 	.detect = analogix_dp_bridge_detect,
 };
@@ -1498,17 +1474,22 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		return ret;
 	}
 
-	if (dp->plat_data->panel)
-		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
-	else
-		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
-
+	bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
 	bridge->of_node = dp->dev->of_node;
 	bridge->type = DRM_MODE_CONNECTOR_eDP;
 	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
 	if (ret)
 		goto err_unregister_aux;
 
+	if (dp->plat_data->panel) {
+		dp->plat_data->next_bridge = devm_drm_panel_bridge_add(dp->dev,
+								       dp->plat_data->panel);
+		if (IS_ERR(dp->plat_data->next_bridge)) {
+			ret = PTR_ERR(bridge);
+			goto err_unregister_aux;
+		}
+	}
+
 	ret = drm_bridge_attach(dp->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		DRM_ERROR("failed to create bridge (%d)\n", ret);
-- 
2.34.1


