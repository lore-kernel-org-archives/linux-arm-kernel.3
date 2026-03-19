Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8672C1075274
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nqtoF/D220MG/noeTT5oBWNGSpkgFVHn7dHTvA+KUY=; b=DgDcB3uumKP5o4tEszPapxkSod
	NWNIp5mSyfo/sftlF87MF0HvioZGvTh5S2Rka8RlpJzCZWWKQRXJlYCxRwQ+Bx73OpxCEvMGq0Qsj
	29RGgVcPWApD7CI4zkYOj0QdCzQ3I93rpjIsAbxAQFRgQ14aGv/n/OwzGo0jWsy17G2Loe1QoCUB2
	KPQYhN5tPi8Py0Hzi1PikxECYjd4w1xFYKsyfKvjJ+dCIC7lOJxPMdVirV/aQprewzk52XcjIabJM
	9SIXzTWMYEiHTI3rvOtMV/2nIkW4jxVUFIS4/sYrj2KoHtSxKMZSLsIiwJeYKJO3NLqGD2hu4ThsY
	A6W18AnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w386r-0000000AB38-2DC6;
	Thu, 19 Mar 2026 07:48:01 +0000
Received: from mail-m49207.qiye.163.com ([45.254.49.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w386m-0000000AB1u-4C7Y;
	Thu, 19 Mar 2026 07:47:59 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3789bd66f;
	Thu, 19 Mar 2026 15:47:51 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	victor.liu@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alim.akhtar@samsung.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	nicolas.frattaroli@collabora.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v11 15/17] drm/bridge: analogix_dp: Attach the next bridge in analogix_dp_bridge_attach()
Date: Thu, 19 Mar 2026 15:47:42 +0800
Message-Id: <20260319074744.1965918-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319074744.1965918-1-damon.ding@rock-chips.com>
References: <20260319071452.1961274-1-damon.ding@rock-chips.com>
 <20260319074744.1965918-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d0510a8d703a3kunmf4d8b30239c79a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx1IGFYZSU5NH0NMT09DQhpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Xgs4MVRh/4rpN4LpO/LlsYPZSCl70Bak0hO8vsbMudWsCo9peLJzhLs87ODp+K3zdcaavV1LCDAioXemuf4BYmTntTaqAkMKoh9aJCc8295uadpNvvN450vKF9Eez0g03uZ7Lt6KBoSYtwVHG6eyE+t70fkmQnMfwNKFOVuL78g=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=/nqtoF/D220MG/noeTT5oBWNGSpkgFVHn7dHTvA+KUY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_004757_579973_F660AA9F 
X-CRM114-Status: GOOD (  12.24  )
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

Uniformly, move the next bridge attachment to the Analogix side
rather than scattered on Rockchip and Exynos sides. It can also
help get rid of the callback &analogix_dp_plat_data.attach() and
make codes more concise.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

------

Changes in v6:
- Move the next bridge attachment to the Analogix side rather than
  scattered on Rockchip and Exynos sides.

Changes in v9:
- Add Tested-by tag.

Changes in v11:
- Add Reviewed-by tag.
---
 .../drm/bridge/analogix/analogix_dp_core.c    |  7 ++++---
 drivers/gpu/drm/exynos/exynos_dp.c            | 19 -------------------
 include/drm/bridge/analogix_dp.h              |  1 -
 3 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b112df52cabf..b66fd3062e41 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -930,10 +930,11 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (dp->plat_data->attach) {
-		ret = dp->plat_data->attach(dp->plat_data, bridge);
+	if (dp->plat_data->next_bridge) {
+		ret = drm_bridge_attach(dp->encoder, dp->plat_data->next_bridge, bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret) {
-			DRM_ERROR("Failed at platform attach func\n");
+			dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
 			return ret;
 		}
 	}
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 9f3d4d4c7352..6884ea6d04eb 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -68,24 +68,6 @@ static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
 	return exynos_dp_crtc_clock_enable(plat_data, false);
 }
 
-static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
-				   struct drm_bridge *bridge)
-{
-	struct exynos_dp_device *dp = to_dp(plat_data);
-	enum drm_bridge_attach_flags flags = 0;
-	int ret;
-
-	/* Pre-empt DP connector creation if there's a bridge */
-	if (plat_data->next_bridge) {
-		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
-					flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static void exynos_dp_mode_set(struct drm_encoder *encoder,
 			       struct drm_display_mode *mode,
 			       struct drm_display_mode *adjusted_mode)
@@ -196,7 +178,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	dp->plat_data.dev_type = EXYNOS_DP;
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
-	dp->plat_data.attach = exynos_dp_bridge_attach;
 	dp->plat_data.ops = &exynos_dp_ops;
 
 out:
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index bae969dec63a..854af692229b 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -34,7 +34,6 @@ struct analogix_dp_plat_data {
 
 	int (*power_on)(struct analogix_dp_plat_data *);
 	int (*power_off)(struct analogix_dp_plat_data *);
-	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *);
 };
 
 int analogix_dp_resume(struct analogix_dp_device *dp);
-- 
2.34.1


