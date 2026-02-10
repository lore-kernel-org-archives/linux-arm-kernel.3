Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438CBEA3F15
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 07:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5GS5vfwTVfAl23/CtmQinQG9E3Zp0oDflrp1gqCYsc=; b=jVuSCKpcbvY319X3YZ7IPKzpM3
	wFZQDaE0lxtQlHyAO1bQT2yU9IrD7P/Xr5opUUzRrMt+j/5CihChsXN4fGxbhC5EaGWNEEbpA6OZ6
	PE1qSZ1c9W8LELvg5BlcQD/Zjqa2J3e54JDPHirQUR8dr1GLlvffJC8nndMEK20GDKjalmSjJP2cZ
	AkKFYU/Ce+VZEjcNk/kIzo9dtTOt/3gELUi14/L9TGUzcIeNooVqgFR5aWSlYuGvO6ajaZfxT15qb
	BaSE8lcwEVg6J2B8VZHK3uKbqeBsbT20MwPfTRmp9bBYO0wWGYXuWnN/lhGlsoffWDPidUKqIDmo+
	z+5Rke/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphvb-0000000GaZ6-0kem;
	Tue, 10 Feb 2026 07:12:55 +0000
Received: from mail-m1973186.qiye.163.com ([220.197.31.86])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vphvV-0000000GaQa-3kNJ;
	Tue, 10 Feb 2026 07:12:51 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33b514a04;
	Tue, 10 Feb 2026 15:12:43 +0800 (GMT+08:00)
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
Subject: [PATCH v9 03/15] drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
Date: Tue, 10 Feb 2026 15:12:13 +0800
Message-Id: <20260210071225.2566099-4-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210071225.2566099-1-damon.ding@rock-chips.com>
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c466535c203a3kunm1f53a888aef96c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU9DHlYdQkpDH0kZGB4YGEhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Fop36RiJtSo8SwfUG8xXQkWAb/fIP99dcRRo1X+9VI5fIOdpm2d9vE4dWE2FVzCw8CqNgZMm3TzRuCxL58mAuu0ajZ91eLTSW+PUkgomAJtDBiZrEhU12V/XfBk5ZI4+dWd5w62i63ksblrwP6Hb9F6kzSW7BTMB0um/4Kqm9HA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=d5GS5vfwTVfAl23/CtmQinQG9E3Zp0oDflrp1gqCYsc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_231250_113276_3A1954C9 
X-CRM114-Status: GOOD (  11.94  )
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

Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
directly.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

------

Changes in v3:
- Fix the typographical error for &dp->plat_data.bridge.

Changes in v4:
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge.

Changes in v9:
- Add Reviewed-by and Tested-by tags.
---
 drivers/gpu/drm/exynos/exynos_dp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 5bcf41e0bd04..f469ac5b3c2a 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -36,7 +36,6 @@
 struct exynos_dp_device {
 	struct drm_encoder         encoder;
 	struct drm_connector       *connector;
-	struct drm_bridge          *ptn_bridge;
 	struct drm_device          *drm_dev;
 	struct device              *dev;
 
@@ -106,8 +105,8 @@ static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
 	dp->connector = connector;
 
 	/* Pre-empt DP connector creation if there's a bridge */
-	if (dp->ptn_bridge) {
-		ret = drm_bridge_attach(&dp->encoder, dp->ptn_bridge, bridge,
+	if (plat_data->next_bridge) {
+		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
 					0);
 		if (ret)
 			return ret;
@@ -155,7 +154,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	if (!dp->plat_data.panel && !dp->ptn_bridge) {
+	if (!dp->plat_data.panel && !dp->plat_data.next_bridge) {
 		ret = exynos_dp_dt_parse_panel(dp);
 		if (ret)
 			return ret;
@@ -232,6 +231,7 @@ static int exynos_dp_probe(struct platform_device *pdev)
 
 	/* The remote port can be either a panel or a bridge */
 	dp->plat_data.panel = panel;
+	dp->plat_data.next_bridge = bridge;
 	dp->plat_data.dev_type = EXYNOS_DP;
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
@@ -239,8 +239,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	dp->plat_data.get_modes = exynos_dp_get_modes;
 	dp->plat_data.skip_connector = !!bridge;
 
-	dp->ptn_bridge = bridge;
-
 out:
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
 	if (IS_ERR(dp->adp))
-- 
2.34.1


