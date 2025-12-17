Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E3DD6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7IW9RhB6EXfEX86gqyI+5tjdEGaoOhKiu3+um4WlPI=; b=Yq1SCH6J4WbVbCdCyoKx2BbaiO
	pafAAQk4fPmqXqidxKWnJdZb5m+tfQI3jCtJBBPguy28v72R41tnO2KcH1z23GxYToq3F+rA+oBAW
	Z0mk+zGP1aW3CfLutDQ85tzCvXjl6MQECc88dpV+E5RQ3THxSTWsy7xlxWVHn1fBE+acrWvsQtXjz
	ox92YqaBBaaWQfltojaEtNuHjvJ2hrnI8sKP9RvQkjylTGmLrUy3UpVmKh5vyd0tQ8puMKHhaBbmR
	90wLd0cQsYJ0+cmpmLcMSaTUOY8NmTB8cDB7m3uykAErlfRHsWIw2N1dMBkyC+phMHsdsRNWGMza7
	7roWoIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoKx-00000006UTJ-1Ptl;
	Wed, 17 Dec 2025 10:00:51 +0000
Received: from mail-m15590.qiye.163.com ([101.71.155.90])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoKp-00000006UPg-28nr;
	Wed, 17 Dec 2025 10:00:44 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d942d686;
	Wed, 17 Dec 2025 18:00:38 +0800 (GMT+08:00)
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
Subject: [PATCH v8 16/18] drm/bridge: analogix_dp: Attach the next bridge in analogix_dp_bridge_attach()
Date: Wed, 17 Dec 2025 17:59:10 +0800
Message-Id: <20251217095912.3109103-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217095912.3109103-1-damon.ding@rock-chips.com>
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217095912.3109103-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b2bc12bd103a3kunm23626673a43cc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUJKQ1ZDQ08YTE9DGE9MQhlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=h5wJ9E9TrKns4ooPInl9KQJTvK4ZQtlHENVyK1n3Q/5JRFzaWeswmvJhlt3hbHePo0pjSnqWa4tipdlcz1GEvho+menqYTSK2w9ngwSpjmP/2BEddB5Ndc3ybklG40d+10V1Sy1ff/TXbqa2XJif2xGWvBIw+C2MqXFbCrAq7ps=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=z7IW9RhB6EXfEX86gqyI+5tjdEGaoOhKiu3+um4WlPI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_020043_763942_A0D94302 
X-CRM114-Status: GOOD (  11.43  )
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
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

------

Changes in v6:
- Move the next bridge attachment to the Analogix side rather than
  scattered on Rockchip and Exynos sides.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c |  7 ++++---
 drivers/gpu/drm/exynos/exynos_dp.c             | 18 ------------------
 include/drm/bridge/analogix_dp.h               |  1 -
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 933f1843777f..a6c5601e16ff 100644
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
index 6126820aad3b..6884ea6d04eb 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -68,23 +68,6 @@ static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
 	return exynos_dp_crtc_clock_enable(plat_data, false);
 }
 
-static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
-				   struct drm_bridge *bridge)
-{
-	struct exynos_dp_device *dp = to_dp(plat_data);
-	int ret;
-
-	/* Pre-empt DP connector creation if there's a bridge */
-	if (plat_data->next_bridge) {
-		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
-					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
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
@@ -195,7 +178,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
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


