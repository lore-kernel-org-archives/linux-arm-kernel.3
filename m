Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31F0CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvZ4HUQAMtPnMu23/b94zBMRRF7ubPr1onbf1FIrmU4=; b=unDwl7KsjAw8PG/KeoN7MDQxyQ
	BD8ajlBFZzT0vrGpHrxZZ27dazBFDcAzrS21l/oX9ltHT3I2h4JK06xx+UAgNmeGh4V4GV9MMlEo+
	kZOuPd0Jr0gj+c4obkzWgFzkJU8yU5rqMdq/vVf1xzp68dY9meNciL379Im/hP1Ieak4jQW+Gtfpq
	f2C2VIiDUym5cP7Axh2rgYX2FSZQUqxw51+sdQE19oFYg/EiqoGWUSLzTIiIwEtHvFpYsFFBwaUI8
	Z3H+LNTLkQUti7dhRbvJw7EBAFTTovhuQ3fF66lTmJJKoSiEnKhBrNGE+5YgzbhNZzWxtCusYvHPD
	IdByQptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2a9-0000000FdYt-0dkX;
	Tue, 21 Oct 2025 02:58:41 +0000
Received: from mail-m19731108.qiye.163.com ([220.197.31.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2a6-0000000FdWZ-32sC;
	Tue, 21 Oct 2025 02:58:40 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2697bbbed;
	Tue, 21 Oct 2025 10:58:34 +0800 (GMT+08:00)
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
Subject: [PATCH v7 14/18] drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
Date: Tue, 21 Oct 2025 10:57:00 +0800
Message-Id: <20251021025701.1524229-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021025701.1524229-1-damon.ding@rock-chips.com>
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <20251021025701.1524229-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a04b443ff03a3kunmcdd3bf8c5a48b9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxpOTFZPTkxLSxpKGR1CSU9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=YaEynfXY23Oub9XICo1+FkgrLlH11F1g+dBOl0CWOSl+awSiligI5wFbVBgxkuT0TUp3+uHZAG9Lp8oPvhXpYUKdWJ3iXLPqSKuwymz//1qXmbiWQm06D+AQwX6oOMC4ALXNHxwpuw/aM99yyWAhLahvbXSsqDbsFajCtIxGIVw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=QvZ4HUQAMtPnMu23/b94zBMRRF7ubPr1onbf1FIrmU4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_195838_934437_B7A73F69 
X-CRM114-Status: GOOD (  14.32  )
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

Apply analogix_dp_finish_probe() in order to move the panel/bridge
parsing from Rockchip side to the Analogix side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---

Changes in v4:
- Rename analogix_dp_find_panel_or_bridge() to
  analogix_dp_finish_probe().

Changes in v5:
- Remove DRM_DISPLAY_DP_AUX_BUS for ROCKCHIP_ANALOGIX_DP
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 38 +------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 3b6b2d3ca5d1..0784f19a2ed9 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -21,14 +21,12 @@
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 
-#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -416,24 +414,6 @@ static const struct component_ops rockchip_dp_component_ops = {
 	.unbind = rockchip_dp_unbind,
 };
 
-static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
-{
-	struct analogix_dp_plat_data *plat_data = analogix_dp_aux_to_plat_data(aux);
-	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
-	int ret;
-
-	/*
-	 * If drm_of_find_panel_or_bridge() returns -ENODEV, there may be no valid panel
-	 * or bridge nodes. The driver should go on for the driver-free bridge or the DP
-	 * mode applications.
-	 */
-	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat_data->panel, NULL);
-	if (ret && ret != -ENODEV)
-		return ret;
-
-	return component_add(dp->dev, &rockchip_dp_component_ops);
-}
-
 static int rockchip_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -472,6 +452,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
+	dp->plat_data.ops = &rockchip_dp_component_ops;
 
 	ret = rockchip_dp_of_probe(dp);
 	if (ret < 0)
@@ -483,22 +464,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
 
-	ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);
-	if (ret) {
-		/*
-		 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing() will not
-		 * be called because there are no EP devices. Then the rockchip_dp_link_panel()
-		 * will be called directly in order to support the other valid DT configurations.
-		 *
-		 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROBE_DEFER.
-		 */
-		if (ret != -ENODEV)
-			return dev_err_probe(dp->dev, ret, "failed to populate aux bus\n");
-
-		return rockchip_dp_link_panel(analogix_dp_get_aux(dp->adp));
-	}
-
-	return 0;
+	return analogix_dp_finish_probe(dp->adp);
 }
 
 static void rockchip_dp_remove(struct platform_device *pdev)
-- 
2.34.1


