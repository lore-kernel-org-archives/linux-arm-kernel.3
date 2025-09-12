Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AF2CAC594
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rT3Uj90o6n1MAWl76/V/H3c62dOJ056k8A1rPD+vgg=; b=XMUKncazS4xM0SPeAkcvZXm2pN
	G1ML2vACYet60rV9VwbbfDzYmjGV203qs1DPuN0zjiLjXG2lS9VvK1G5iGK2164UiTob/wbwSQHCn
	o9HfgwhEbPEJIxZ/7H4X+bCp/mKAxyJqtjk1CAk9lnT0DTR4TXi4/Tz2gDJfQBrmTihXPA3wjeqVe
	WH5SxiOaYwmc0wEg7RieRTt3C56I+tIJeuW7+qdP2lOz8WiJZObM1za4ZfyLulTNoh/CuJYilxTwg
	iGBqxaMzeNZCPLTM9EOaxvZF4ak1aGmCrI6x9xUQMk00rJVXPVsoIwhk/chWp8AWoRNOM0qPqub7z
	MtifSN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzch-0000000855s-0Eox;
	Fri, 12 Sep 2025 08:59:15 +0000
Received: from mail-m49251.qiye.163.com ([45.254.49.251])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzcY-000000084uS-41NU;
	Fri, 12 Sep 2025 08:59:08 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 229880974;
	Fri, 12 Sep 2025 16:59:02 +0800 (GMT+08:00)
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
Subject: [PATCH v5 02/17] drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to &drm_bridge_funcs.atomic_enable
Date: Fri, 12 Sep 2025 16:58:31 +0800
Message-Id: <20250912085846.7349-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993d2646cc03a3kunm813a8c8ea45b33
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGktNTVZCSR1LTxpMSUlCQ0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Zbo6mOcNxm6e+nxPNjhDjfj3odewHBMVoe2Z9f29PEEeYCDou/c/eFoyIctHsaD5w5YF76i2UUI9Lsa/zyBEfIz+WX32NUBPMJDIptfbirjImtvmkd99Z/FW2cvmJ0tbcvf9az2AJ1rea+dc/bBbPOcLcOvgmDTBIJKwjgCtKd4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=5rT3Uj90o6n1MAWl76/V/H3c62dOJ056k8A1rPD+vgg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_015907_200042_46726932 
X-CRM114-Status: GOOD (  16.61  )
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

According to the include/drm/drm_bridge.h, the callback
&drm_bridge_funcs.mode_set is deprecated and it should be better to
include the mode setting in the &drm_bridge_funcs.atomic_enable instead.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 161 +++++++++---------
 1 file changed, 82 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 0d7941d37771..e08511e8c9d5 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1086,12 +1086,88 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 	return ret;
 }
 
+static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
+					const struct drm_display_mode *mode)
+{
+	struct analogix_dp_device *dp = to_dp(bridge);
+	struct drm_display_info *display_info = &dp->connector.display_info;
+	struct video_info *video = &dp->video_info;
+	struct device_node *dp_node = dp->dev->of_node;
+	int vic;
+
+	/* Input video interlaces & hsync pol & vsync pol */
+	video->interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
+	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
+	video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
+
+	/* Input video dynamic_range & colorimetry */
+	vic = drm_match_cea_mode(mode);
+	if ((vic == 6) || (vic == 7) || (vic == 21) || (vic == 22) ||
+	    (vic == 2) || (vic == 3) || (vic == 17) || (vic == 18)) {
+		video->dynamic_range = CEA;
+		video->ycbcr_coeff = COLOR_YCBCR601;
+	} else if (vic) {
+		video->dynamic_range = CEA;
+		video->ycbcr_coeff = COLOR_YCBCR709;
+	} else {
+		video->dynamic_range = VESA;
+		video->ycbcr_coeff = COLOR_YCBCR709;
+	}
+
+	/* Input vide bpc and color_formats */
+	switch (display_info->bpc) {
+	case 12:
+		video->color_depth = COLOR_12;
+		break;
+	case 10:
+		video->color_depth = COLOR_10;
+		break;
+	case 8:
+		video->color_depth = COLOR_8;
+		break;
+	case 6:
+		video->color_depth = COLOR_6;
+		break;
+	default:
+		video->color_depth = COLOR_8;
+		break;
+	}
+	if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+		video->color_space = COLOR_YCBCR444;
+	else if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+		video->color_space = COLOR_YCBCR422;
+	else
+		video->color_space = COLOR_RGB;
+
+	/*
+	 * NOTE: those property parsing code is used for providing backward
+	 * compatibility for samsung platform.
+	 * Due to we used the "of_property_read_u32" interfaces, when this
+	 * property isn't present, the "video_info" can keep the original
+	 * values and wouldn't be modified.
+	 */
+	of_property_read_u32(dp_node, "samsung,color-space",
+			     &video->color_space);
+	of_property_read_u32(dp_node, "samsung,dynamic-range",
+			     &video->dynamic_range);
+	of_property_read_u32(dp_node, "samsung,ycbcr-coeff",
+			     &video->ycbcr_coeff);
+	of_property_read_u32(dp_node, "samsung,color-depth",
+			     &video->color_depth);
+	if (of_property_read_bool(dp_node, "hsync-active-high"))
+		video->h_sync_polarity = true;
+	if (of_property_read_bool(dp_node, "vsync-active-high"))
+		video->v_sync_polarity = true;
+	if (of_property_read_bool(dp_node, "interlaced"))
+		video->interlaced = true;
+}
+
 static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 					     struct drm_atomic_state *old_state)
 {
 	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_crtc *crtc;
-	struct drm_crtc_state *old_crtc_state;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int timeout_loop = 0;
 	int ret;
 
@@ -1099,6 +1175,11 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (!crtc)
 		return;
 
+	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
+	if (!new_crtc_state)
+		return;
+	analogix_dp_bridge_mode_set(bridge, &new_crtc_state->adjusted_mode);
+
 	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
 	/* Not a full enable, just disable PSR and continue */
 	if (old_crtc_state && old_crtc_state->self_refresh_active) {
@@ -1205,83 +1286,6 @@ static void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		DRM_ERROR("Failed to enable psr (%d)\n", ret);
 }
 
-static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
-				const struct drm_display_mode *orig_mode,
-				const struct drm_display_mode *mode)
-{
-	struct analogix_dp_device *dp = to_dp(bridge);
-	struct drm_display_info *display_info = &dp->connector.display_info;
-	struct video_info *video = &dp->video_info;
-	struct device_node *dp_node = dp->dev->of_node;
-	int vic;
-
-	/* Input video interlaces & hsync pol & vsync pol */
-	video->interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
-	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
-	video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
-
-	/* Input video dynamic_range & colorimetry */
-	vic = drm_match_cea_mode(mode);
-	if ((vic == 6) || (vic == 7) || (vic == 21) || (vic == 22) ||
-	    (vic == 2) || (vic == 3) || (vic == 17) || (vic == 18)) {
-		video->dynamic_range = CEA;
-		video->ycbcr_coeff = COLOR_YCBCR601;
-	} else if (vic) {
-		video->dynamic_range = CEA;
-		video->ycbcr_coeff = COLOR_YCBCR709;
-	} else {
-		video->dynamic_range = VESA;
-		video->ycbcr_coeff = COLOR_YCBCR709;
-	}
-
-	/* Input vide bpc and color_formats */
-	switch (display_info->bpc) {
-	case 12:
-		video->color_depth = COLOR_12;
-		break;
-	case 10:
-		video->color_depth = COLOR_10;
-		break;
-	case 8:
-		video->color_depth = COLOR_8;
-		break;
-	case 6:
-		video->color_depth = COLOR_6;
-		break;
-	default:
-		video->color_depth = COLOR_8;
-		break;
-	}
-	if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
-		video->color_space = COLOR_YCBCR444;
-	else if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
-		video->color_space = COLOR_YCBCR422;
-	else
-		video->color_space = COLOR_RGB;
-
-	/*
-	 * NOTE: those property parsing code is used for providing backward
-	 * compatibility for samsung platform.
-	 * Due to we used the "of_property_read_u32" interfaces, when this
-	 * property isn't present, the "video_info" can keep the original
-	 * values and wouldn't be modified.
-	 */
-	of_property_read_u32(dp_node, "samsung,color-space",
-			     &video->color_space);
-	of_property_read_u32(dp_node, "samsung,dynamic-range",
-			     &video->dynamic_range);
-	of_property_read_u32(dp_node, "samsung,ycbcr-coeff",
-			     &video->ycbcr_coeff);
-	of_property_read_u32(dp_node, "samsung,color-depth",
-			     &video->color_depth);
-	if (of_property_read_bool(dp_node, "hsync-active-high"))
-		video->h_sync_polarity = true;
-	if (of_property_read_bool(dp_node, "vsync-active-high"))
-		video->v_sync_polarity = true;
-	if (of_property_read_bool(dp_node, "interlaced"))
-		video->interlaced = true;
-}
-
 static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -1290,7 +1294,6 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.atomic_enable = analogix_dp_bridge_atomic_enable,
 	.atomic_disable = analogix_dp_bridge_atomic_disable,
 	.atomic_post_disable = analogix_dp_bridge_atomic_post_disable,
-	.mode_set = analogix_dp_bridge_mode_set,
 	.attach = analogix_dp_bridge_attach,
 };
 
-- 
2.34.1


