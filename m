Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE671C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqLtA786//MfuCWFmozSkshMVqGaZw5gxCAba0vdq/o=; b=0eb7Nw/deXLgbJS0MJz5SwFoFq
	UXm3wFpBeS3wXx09AoayUzdG6JZK7ueNUM7/A6OUKxDQbJgWEXsDszjUQCtVwOJ6EGaCMa1S8NHao
	1gIjTaOElquUgmTBGqCLLMdQsV8OrSrtYQ8IyQ6UVNMdiTGLwGB0LxcFxVd6sZkXcTQ+lVHlA6Auq
	0sbNUUrsNNhdXvedtqMoj9X+8G8FIEVAaEZL9X19sBLBp9Cr9KTf8quyDPUhioCktzv8wEEF6mC3A
	MB1nRB/ywad8bEebZJG8DoQmrmHTe8X0lkNnWb2FsL4ksy0a0lJTz9Oskuj/iwolc5zZmlGBGvp13
	1/PKywEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnqe-0000000EJ4i-2Ykn;
	Thu, 12 Jun 2025 19:44:28 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjZF-0000000Djsm-3Qlk;
	Thu, 12 Jun 2025 15:10:15 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8F02C25FB2;
	Thu, 12 Jun 2025 17:10:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJ1Bprx92anx; Thu, 12 Jun 2025 17:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741011; bh=ZBf5elUyhBLG4hiQ5P/eKSJ7k0IszZpiLUbpxTJh6Sg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VJ//WEXoj5tcbY6u8jcO4SiNyrxXIh70qSxzK5lO9WwYES8a/PyEkhjOOsX1tvIWd
	 gy5kIx3qo5V1ZaMWwItCReEuGLmaNfXMqODhec28RaThJwgxvjZxYPnKIxskNa3buk
	 jC0BxMxb/oHy/xK7YUcc/7iO5wOG0FwGkRmlY44qX5PIjo8VTfxo6y4z+syicSVyVU
	 PVzh0capKDSXB2l47OTLiL7rQGXQXAJ7xrioQzEunJ/fJ46rOUoLrqt6hVAagg9cpR
	 mFwif402Y9t5+RS127rMIVQav27r8Bban5zk3L0M1j71Au9jIfjzN11j++TumXI44L
	 mSD3no75ED78Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:39:30 +0530
Subject: [PATCH 2/2] phy: exynos-mipi-video: introduce support for
 exynos7870
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-mipi-phy-v1-2-3fff0b62d9d3@disroot.org>
References: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
In-Reply-To: <20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749740994; l=3417;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ZBf5elUyhBLG4hiQ5P/eKSJ7k0IszZpiLUbpxTJh6Sg=;
 b=Z6Xp4WEDseNWyIADRgljEU9FgbZ0ED9ByLA7aPhS8sodMygivmbuAE+5yMrlFX5hdZe6jkNoZ
 HTap08GpmE9BJKrbSBCuWgN+iOx4RHJ7GSvrK7//L2zRCdHtmD8o+YX
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081014_125836_0091C447 
X-CRM114-Status: GOOD (  10.43  )
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

Add support for Exynos7870 in the existing MIPI CSIS/DSIM driver. The
SoC has one DSIM phy and three CSIS phys.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/phy/samsung/phy-exynos-mipi-video.c | 52 +++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h |  5 +++
 2 files changed, 57 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos-mipi-video.c b/drivers/phy/samsung/phy-exynos-mipi-video.c
index f6756a609a9a0774ecb6e27cf96726891683636c..b184923b9b400f0d536a913bdf32f3156c0a1854 100644
--- a/drivers/phy/samsung/phy-exynos-mipi-video.c
+++ b/drivers/phy/samsung/phy-exynos-mipi-video.c
@@ -213,6 +213,55 @@ static const struct mipi_phy_device_desc exynos5433_mipi_phy = {
 	},
 };
 
+static const struct mipi_phy_device_desc exynos7870_mipi_phy = {
+	.num_regmaps = 3,
+	.regmap_names = {
+		"samsung,pmu-syscon",
+		"samsung,disp-sysreg",
+		"samsung,cam-sysreg"
+	},
+	.num_phys = 4,
+	.phys = {
+		{
+			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM0,
+			.enable_val = EXYNOS4_PHY_ENABLE,
+			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL0,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(0),
+			.resetn_reg = 0,
+			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS0,
+			.enable_val = EXYNOS4_PHY_ENABLE,
+			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL0,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(0),
+			.resetn_reg = 0,
+			.resetn_map = EXYNOS_MIPI_REGMAP_DISP,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_CSIS1 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
+			.enable_val = EXYNOS4_PHY_ENABLE,
+			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL1,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(1),
+			.resetn_reg = 0,
+			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_CSIS2 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
+			.enable_val = EXYNOS4_PHY_ENABLE,
+			.enable_reg = EXYNOS7870_MIPI_PHY_CONTROL2,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(2),
+			.resetn_reg = 0,
+			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
+		},
+	},
+};
+
 struct exynos_mipi_video_phy {
 	struct regmap *regmaps[EXYNOS_MIPI_REGMAPS_NUM];
 	int num_phys;
@@ -351,6 +400,9 @@ static const struct of_device_id exynos_mipi_video_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos5433-mipi-video-phy",
 		.data = &exynos5433_mipi_phy,
+	}, {
+		.compatible = "samsung,exynos7870-mipi-video-phy",
+		.data = &exynos7870_mipi_phy,
 	},
 	{ /* sentinel */ },
 };
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 1a2c0e0838f99821151661878f022f2129a0c19b..8fd59994bca76a6bf21306337f0b47ccb5a22adc 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -662,6 +662,11 @@
 #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 
+/* For Exynos7870 */
+#define EXYNOS7870_MIPI_PHY_CONTROL0				(0x070c)
+#define EXYNOS7870_MIPI_PHY_CONTROL1				(0x0714)
+#define EXYNOS7870_MIPI_PHY_CONTROL2				(0x0734)
+
 /* For Tensor GS101 */
 /* PMU ALIVE */
 #define GS101_SYSIP_DAT0					(0x810)

-- 
2.49.0


