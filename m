Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA70C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRkku8XajuG1Sq1QJ3KXLUrgrwMemBzRuKMCHE/pP0M=; b=nnEyct8ILu0ee+kP+ctGcMYine
	PVaeuRTlSymdqyD1quwjByk5wfMh+H4vJ1fMT4E+Q0Ao163/0TXQX2tFFOOhf/ChZlyn0KB4mnas8
	um3f1Y+FSvMe5sVWBmy5COIJuFDTLt0pSyQ32+8NPnbPKOQeoK+/TPkrL69mq1TmOYrGzl9gVPipc
	E7ldDUUZuOZl/ffTbpjVE5YBCvsVxM6ggy7Ga4vsjwR5a05UiCFlXwcV7BNrpVGNDTO+I7tVUURw1
	ffSwNm4kvtvNvJaNWxXvP6TiyuiGiQnGPMqhpWhQjN9Rkw49cFXcLVMzBSxylFT/WUZ2tzjDxqxju
	KydRGnLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuI0-0000000Cr1S-0JZ5;
	Thu, 26 Jun 2025 21:37:48 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsnj-0000000Cg9P-2o3N;
	Thu, 26 Jun 2025 20:02:29 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5985225E01;
	Thu, 26 Jun 2025 22:02:26 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvH0vo_XIayP; Thu, 26 Jun 2025 22:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968144; bh=kl8iNFIBnOgLWpvFT93EaWi/fQ7+TYZePru6lirB2A0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WeYCZ1YI/pQpQUDtKMdOVIWGMbrEj3ukq6PDmc5fOND7dvKKHien9UeyB/dYnB0NR
	 +5d1Z24jns9j/G84OYd5V9fyuc+bi3UFrzBCTApEMDmsSlDTCYYfcZ3z0UfgeEcYSV
	 kSkfATgpIJQb1Kz2iotPeKxgW8Zl85WNW+z/XBSOc2GdV2eov4wrwAZJLf6fPLQqo4
	 u8RrRsM8Hd1ja3zpHPJtOxMTkTcbMZv8saxTqxqFzye3VcNz0fUhkqq5GVSzwhw+sJ
	 2JKaQBgp0sOEx+w6QndM2FPUQurIISbtj9PuVckM2CZi2JPV3c6ipXokiSiXvIk8v7
	 nCI3nGs8vqO9A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:31:55 +0530
Subject: [PATCH 2/2] phy: exynos-mipi-video: allow skipping absent PHYs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-mipi-phy-fix-v1-2-2eefab8b50df@disroot.org>
References: <20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org>
In-Reply-To: <20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968127; l=10374;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=kl8iNFIBnOgLWpvFT93EaWi/fQ7+TYZePru6lirB2A0=;
 b=dllRAVpa41utrX5agLKI6r43dJtae/TbO0r7TErIcBn11Gr/kOenhIj2D+k+HWe/PQm+CCyBa
 NL7SRwvc/DWCBYgNTtyEJHH9mKdxAaKEvaW7d3I7mFLYUvj5v5DXtr/
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130227_984643_AF41FD10 
X-CRM114-Status: GOOD (  14.69  )
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

In Exynos7870 MIPI PHY, DSIM1 PHY is not present. The num_phys field of
mipi_phy_device_desc when set to a value, say n, always unconditionally
initializes the first n phys, so there is no mechanism to skip over
these absent PHY blocks.

Introduce a "present" flag in all PHY descriptors which needs to be set
to true. And instead of checking the first n PHYs, check all of them. If
a certain PHY is not defined, the flag remains false and is skipped
during the init phase.

The num_phys field has to go, it has no purpose as now we're checking
all elements of the exynos_mipi_phy_desc array.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/phy/samsung/phy-exynos-mipi-video.c | 100 ++++++++++++++++------------
 1 file changed, 57 insertions(+), 43 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index 1c9c340f708da0ca214639880d067706aaea8fc7..c120c4f3531661a45374793ed7d9e9f622ff3c5d 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -37,10 +37,10 @@ enum exynos_mipi_phy_regmap_id {
 };
 
 struct mipi_phy_device_desc {
-	int num_phys;
 	int num_regmaps;
 	const char *regmap_names[EXYNOS_MIPI_REGMAPS_NUM];
 	struct exynos_mipi_phy_desc {
+		bool present;
 		enum exynos_mipi_phy_id	coupled_phy_id;
 		u32 enable_val;
 		unsigned int enable_reg;
@@ -54,10 +54,9 @@ struct mipi_phy_device_desc {
 static const struct mipi_phy_device_desc s5pv210_mipi_phy = {
 	.num_regmaps = 1,
 	.regmap_names = {"syscon"},
-	.num_phys = 4,
 	.phys = {
-		{
-			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
+		[EXYNOS_MIPI_PHY_ID_CSIS0] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM0,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(0),
@@ -65,8 +64,9 @@ static const struct mipi_phy_device_desc s5pv210_mipi_phy = {
 			.resetn_val = EXYNOS4_MIPI_PHY_SRESETN,
 			.resetn_reg = EXYNOS4_MIPI_PHY_CONTROL(0),
 			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
+		},
+		[EXYNOS_MIPI_PHY_ID_DSIM0] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS0,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(0),
@@ -74,8 +74,9 @@ static const struct mipi_phy_device_desc s5pv210_mipi_phy = {
 			.resetn_val = EXYNOS4_MIPI_PHY_MRESETN,
 			.resetn_reg = EXYNOS4_MIPI_PHY_CONTROL(0),
 			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_CSIS1 */
+		},
+		[EXYNOS_MIPI_PHY_ID_CSIS1] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM1,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(1),
@@ -83,8 +84,9 @@ static const struct mipi_phy_device_desc s5pv210_mipi_phy = {
 			.resetn_val = EXYNOS4_MIPI_PHY_SRESETN,
 			.resetn_reg = EXYNOS4_MIPI_PHY_CONTROL(1),
 			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_DSIM1 */
+		},
+		[EXYNOS_MIPI_PHY_ID_DSIM1] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS1,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(1),
@@ -99,10 +101,9 @@ static const struct mipi_phy_device_desc s5pv210_mipi_phy = {
 static const struct mipi_phy_device_desc exynos5420_mipi_phy = {
 	.num_regmaps = 1,
 	.regmap_names = {"syscon"},
-	.num_phys = 5,
 	.phys = {
-		{
-			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
+		[EXYNOS_MIPI_PHY_ID_CSIS0] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM0,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS5420_MIPI_PHY_CONTROL(0),
@@ -110,8 +111,9 @@ static const struct mipi_phy_device_desc exynos5420_mipi_phy = {
 			.resetn_val = EXYNOS4_MIPI_PHY_SRESETN,
 			.resetn_reg = EXYNOS5420_MIPI_PHY_CONTROL(0),
 			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
+		},
+		[EXYNOS_MIPI_PHY_ID_DSIM0] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS0,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS5420_MIPI_PHY_CONTROL(0),
@@ -119,8 +121,9 @@ static const struct mipi_phy_device_desc exynos5420_mipi_phy = {
 			.resetn_val = EXYNOS4_MIPI_PHY_MRESETN,
 			.resetn_reg = EXYNOS5420_MIPI_PHY_CONTROL(0),
 			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_CSIS1 */
+		},
+		[EXYNOS_MIPI_PHY_ID_CSIS1] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM1,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS5420_MIPI_PHY_CONTROL(1),
@@ -128,8 +131,9 @@ static const struct mipi_phy_device_desc exynos5420_mipi_phy = {
 			.resetn_val = EXYNOS4_MIPI_PHY_SRESETN,
 			.resetn_reg = EXYNOS5420_MIPI_PHY_CONTROL(1),
 			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_DSIM1 */
+		},
+		[EXYNOS_MIPI_PHY_ID_DSIM1] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS1,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS5420_MIPI_PHY_CONTROL(1),
@@ -137,8 +141,9 @@ static const struct mipi_phy_device_desc exynos5420_mipi_phy = {
 			.resetn_val = EXYNOS4_MIPI_PHY_MRESETN,
 			.resetn_reg = EXYNOS5420_MIPI_PHY_CONTROL(1),
 			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_CSIS2 */
+		},
+		[EXYNOS_MIPI_PHY_ID_CSIS2] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS5420_MIPI_PHY_CONTROL(2),
@@ -162,10 +167,9 @@ static const struct mipi_phy_device_desc exynos5433_mipi_phy = {
 		"samsung,cam0-sysreg",
 		"samsung,cam1-sysreg"
 	},
-	.num_phys = 5,
 	.phys = {
-		{
-			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
+		[EXYNOS_MIPI_PHY_ID_CSIS0] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM0,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(0),
@@ -173,8 +177,9 @@ static const struct mipi_phy_device_desc exynos5433_mipi_phy = {
 			.resetn_val = BIT(0),
 			.resetn_reg = EXYNOS5433_SYSREG_CAM0_MIPI_DPHY_CON,
 			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
+		},
+		[EXYNOS_MIPI_PHY_ID_DSIM0] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS0,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(0),
@@ -182,8 +187,9 @@ static const struct mipi_phy_device_desc exynos5433_mipi_phy = {
 			.resetn_val = BIT(0),
 			.resetn_reg = EXYNOS5433_SYSREG_DISP_MIPI_PHY,
 			.resetn_map = EXYNOS_MIPI_REGMAP_DISP,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_CSIS1 */
+		},
+		[EXYNOS_MIPI_PHY_ID_CSIS1] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(1),
@@ -191,8 +197,9 @@ static const struct mipi_phy_device_desc exynos5433_mipi_phy = {
 			.resetn_val = BIT(1),
 			.resetn_reg = EXYNOS5433_SYSREG_CAM0_MIPI_DPHY_CON,
 			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_DSIM1 */
+		},
+		[EXYNOS_MIPI_PHY_ID_DSIM1] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(1),
@@ -200,8 +207,9 @@ static const struct mipi_phy_device_desc exynos5433_mipi_phy = {
 			.resetn_val = BIT(1),
 			.resetn_reg = EXYNOS5433_SYSREG_DISP_MIPI_PHY,
 			.resetn_map = EXYNOS_MIPI_REGMAP_DISP,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_CSIS2 */
+		},
+		[EXYNOS_MIPI_PHY_ID_CSIS2] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS4_MIPI_PHY_CONTROL(2),
@@ -220,10 +228,9 @@ static const struct mipi_phy_device_desc exynos7870_mipi_phy = {
 		"samsung,disp-sysreg",
 		"samsung,cam0-sysreg",
 	},
-	.num_phys = 4,
 	.phys = {
-		{
-			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
+		[EXYNOS_MIPI_PHY_ID_CSIS0] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM0,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL0,
@@ -231,8 +238,9 @@ static const struct mipi_phy_device_desc exynos7870_mipi_phy = {
 			.resetn_val = BIT(0),
 			.resetn_reg = 0,
 			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
+		},
+		[EXYNOS_MIPI_PHY_ID_DSIM0] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS0,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL0,
@@ -240,8 +248,9 @@ static const struct mipi_phy_device_desc exynos7870_mipi_phy = {
 			.resetn_val = BIT(0),
 			.resetn_reg = 0,
 			.resetn_map = EXYNOS_MIPI_REGMAP_DISP,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_CSIS1 */
+		},
+		[EXYNOS_MIPI_PHY_ID_CSIS1] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL1,
@@ -249,8 +258,9 @@ static const struct mipi_phy_device_desc exynos7870_mipi_phy = {
 			.resetn_val = BIT(1),
 			.resetn_reg = 0,
 			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
-		}, {
-			/* EXYNOS_MIPI_PHY_ID_CSIS2 */
+		},
+		[EXYNOS_MIPI_PHY_ID_CSIS2] = {
+			.present = true,
 			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
 			.enable_val = EXYNOS4_PHY_ENABLE,
 			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL2,
@@ -365,12 +375,15 @@ static int exynos_mipi_video_phy_probe(struct platform_device *pdev)
 		if (IS_ERR(state->regmaps[i]))
 			return PTR_ERR(state->regmaps[i]);
 	}
-	state->num_phys = phy_dev->num_phys;
+	state->num_phys = 0;
 	spin_lock_init(&state->slock);
 
 	dev_set_drvdata(dev, state);
 
-	for (i = 0; i < state->num_phys; i++) {
+	for (i = 0; i < EXYNOS_MIPI_PHYS_NUM; i++) {
+		if (!phy_dev->phys[i].present)
+			continue;
+
 		struct phy *phy = devm_phy_create(dev, NULL,
 						  &exynos_mipi_video_phy_ops);
 		if (IS_ERR(phy)) {
@@ -378,6 +391,7 @@ static int exynos_mipi_video_phy_probe(struct platform_device *pdev)
 			return PTR_ERR(phy);
 		}
 
+		state->num_phys++;
 		state->phys[i].phy = phy;
 		state->phys[i].index = i;
 		state->phys[i].data = &phy_dev->phys[i];

-- 
2.49.0


