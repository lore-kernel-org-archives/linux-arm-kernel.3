Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7385CCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxpBGRYtUFGhrKS3G6ggzgLtRnD5bM6dA2JvZ+ovCn4=; b=O8H94d3t0tw5+fZKOm6yTko+VB
	cLDipw+OpZ6e14cuCoyUjBQ68QtX4EqUwJhevJEOnjbCSupjB7OKXSeXDnghpGjPsOX5OdA5kRcux
	28j5GLOABP6MwdhxcB44o5E9YqrjBwigN6dI9UQG2Sb+Kg6o382ipSsPODHC9hXiLoHpev2JPccoz
	dCWXM0huCPuwL47TJMrSwv08kMNrm9lyWv717JZ0KB+a5XCiaj/lZEPJVNbbkoJPnmdCe1xWdBPGp
	dL+o/XMwAKw2vPR4sCRL4LtOiH78Np5DuUMT9gR2nGuPMhsRmOkbwOe6YA32qLkiqp1SuJxIkBZYy
	PncGY6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2Z0-0000000Fcx6-3fKg;
	Tue, 21 Oct 2025 02:57:30 +0000
Received: from mail-m49240.qiye.163.com ([45.254.49.240])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2Yw-0000000FcsP-3U8f;
	Tue, 21 Oct 2025 02:57:28 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26979c64d;
	Tue, 21 Oct 2025 10:57:22 +0800 (GMT+08:00)
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
Subject: [PATCH v7 10/18] drm/bridge: analogix_dp: Move the color format check to .atomic_check() for Rockchip platforms
Date: Tue, 21 Oct 2025 10:56:56 +0800
Message-Id: <20251021025701.1524229-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021025701.1524229-1-damon.ding@rock-chips.com>
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <20251021025701.1524229-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a04b32b4403a3kunmcdd3bf8c5a4145
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0xDSFZPHh5JGE0fSx5DTBpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZX0Hgm09rqWTcJ06TWPXJofB4SxSqeL0OfLfY1DNzXIOwydJvzNcGmb2EgL36+39AIwXorrRzJrSBMPaWLQd8WUA+KqGfG0FH8Rg9j6KuAdddy3QvFi7+A8yqStmcvmFjJ0siCpZ6zzCEnunhIlH6/LCw35EfCb60KffAwcMMCw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=HxpBGRYtUFGhrKS3G6ggzgLtRnD5bM6dA2JvZ+ovCn4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_195727_068282_CF83A32B 
X-CRM114-Status: GOOD (  12.11  )
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

For Rockchip platforms, the YUV color formats are currently unsupported.
This compatibility check was previously implemented in
&analogix_dp_plat_data.get_modes().

Moving color format check to &drm_connector_helper_funcs.atomic_check()
would get rid of &analogix_dp_plat_data.get_modes() and be more
reasonable than before.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +++++++++++
 .../gpu/drm/rockchip/analogix_dp-rockchip.c    | 18 ------------------
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 4606ecc3f480..5bf41b364aba 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -894,8 +894,19 @@ static int analogix_dp_atomic_check(struct drm_connector *connector,
 				    struct drm_atomic_state *state)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
+	struct drm_display_info *di = &connector->display_info;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
+	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
+
+	if (is_rockchip(dp->plat_data->dev_type)) {
+		if ((di->color_formats & mask)) {
+			DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
+			di->color_formats &= ~mask;
+			di->color_formats |= DRM_COLOR_FORMAT_RGB444;
+			di->bpc = 8;
+		}
+	}
 
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
 	if (WARN_ON(!conn_state))
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 94da0f745525..0a185ebd26af 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -165,23 +165,6 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
 	return 0;
 }
 
-static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
-				 struct drm_connector *connector)
-{
-	struct drm_display_info *di = &connector->display_info;
-	/* VOP couldn't output YUV video format for eDP rightly */
-	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
-
-	if ((di->color_formats & mask)) {
-		DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
-		di->color_formats &= ~mask;
-		di->color_formats |= DRM_COLOR_FORMAT_RGB444;
-		di->bpc = 8;
-	}
-
-	return 0;
-}
-
 static bool
 rockchip_dp_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 				   const struct drm_display_mode *mode,
@@ -480,7 +463,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
-	dp->plat_data.get_modes = rockchip_dp_get_modes;
 
 	ret = rockchip_dp_of_probe(dp);
 	if (ret < 0)
-- 
2.34.1


