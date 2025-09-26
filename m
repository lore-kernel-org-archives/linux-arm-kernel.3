Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84E0CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 07:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhX1MQVp2llautb0DmRTSASiQwh70/qTePQeQGepbgs=; b=miKTea79AAIXlVziOM+/d9NKGC
	3E61MBPKXeuWCX8zdZ3j7Xotp+9RnmYmsM64ymmLmlMinyB4TPi3wXujHGfSYhesHQqslCvyCNyQ7
	G5x5N9uJ9rc8rizGHGqpYFFxDGq9cLzSUiSqKvDDdhQJP/i13Z9BsQDn5a5f6KL0rAR2fqIXojPxJ
	bOQzR3FTlRhbyxl6rFyIMBdMMXcumCHsxf5SVLMvOYSnjBYVPIkRmYQFkab0uE+TyVW76BllYa5OU
	+UsJ2qmBbV3v5n6GqL14xlzdPy6H67l+3BV32i9+HvL+hgSa0g3tenJ4akPpfWHlj/C9mhnnD12yg
	tetyeJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v234K-0000000GsAA-2iTq;
	Fri, 26 Sep 2025 07:40:40 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2346-0000000Grqo-24oA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 07:40:28 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250926074024epoutp032ac3326632b418f026d0b7e2eaa4402f~oxSavtGL51458414584epoutp03I
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:40:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250926074024epoutp032ac3326632b418f026d0b7e2eaa4402f~oxSavtGL51458414584epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758872424;
	bh=qhX1MQVp2llautb0DmRTSASiQwh70/qTePQeQGepbgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G1Mvp0kM32Z+tMvBfXiDvk5BS4VFFZa6niYY4UCn47dpHtxFaKhelkAQlrn5bPFxC
	 IkyaV0bzPol+oMfyIp9FuN06QBh0HZ82oD6FABoakTyJt8vro5vl8LpkS4F5lg2XUQ
	 5Uyd4Y6R0A9gZkZOUe4RKrt+42nZkMk/+2yQMflM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250926074023epcas2p22563ba73fbe48ebf01f75ffac03cd49d~oxSaQwfAt3019630196epcas2p2D;
	Fri, 26 Sep 2025 07:40:23 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cY2Yg09Qyz3hhTQ; Fri, 26 Sep
	2025 07:40:23 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250926074022epcas2p3aa1179b587beac076ef5942004c7d099~oxSY5eD7k2057720577epcas2p3g;
	Fri, 26 Sep 2025 07:40:22 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250926074022epsmtip2570a9e2d16c5857aa194b0b3c2963907~oxSYzvL2p1189511895epsmtip2W;
	Fri, 26 Sep 2025 07:40:22 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org, m.szyprowski@samsung.com,
	jh80.chung@samsung.com, shradha.t@samsung.com
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	sh86.bae@samsung.com
Subject: [PATCH 4/4] phy: exynos: Add PCIe PHY support for ExynosAutov920
 SoC
Date: Fri, 26 Sep 2025 16:39:19 +0900
Message-ID: <20250926073921.1000866-5-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250926073921.1000866-1-sh86.bae@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250926074022epcas2p3aa1179b587beac076ef5942004c7d099
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250926074022epcas2p3aa1179b587beac076ef5942004c7d099
References: <20250926073921.1000866-1-sh86.bae@samsung.com>
	<CGME20250926074022epcas2p3aa1179b587beac076ef5942004c7d099@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_004026_881517_0B87CDE4 
X-CRM114-Status: GOOD (  19.77  )
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

Add PCIe PHY support for ExynosAutov920 SoC

Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
---
 drivers/phy/samsung/phy-exynos-pcie.c | 231 ++++++++++++++++++++++++++
 1 file changed, 231 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos-pcie.c b/drivers/phy/samsung/phy-exynos-pcie.c
index 5a55a22f9661..5b9d65f8f6c7 100644
--- a/drivers/phy/samsung/phy-exynos-pcie.c
+++ b/drivers/phy/samsung/phy-exynos-pcie.c
@@ -129,14 +129,87 @@
 #define FSD_PCIE_SYSREG_PHY_1_CMN_RSTN			BIT(1)
 #define FSD_PCIE_SYSREG_PHY_1_INIT_RSTN			BIT(3)
 
+/* Exynosautov920 register offsets and bits */
+/* EA920: PHY registers */
+#define EA920_PCIE_PHY0_COMMON_CTRL			0x1000
+#define EA920_PCIE_PHY_RTUNE_REQ			0x10000001
+#define EA920_PCIE_PHY0_GEN_CTRL_1			0x1010
+#define EA920_PCIE_PHY0_REFA_CLK_SEL_MASK		GENMASK(17, 16)
+#define EA920_PCIE_PHY0_REFB_CLK_SEL_MASK		GENMASK(19, 18)
+#define EA920_PCIE_PHY0_PHY0_SRAM_BYPASS		BIT(10)
+#define EA920_PCIE_PHY0_PHY0_SRAM_EXT_LD_DONE		BIT(11)
+#define EA920_PCIE_PHY0_REFA_B_ALT1			0x061a0060
+#define EA920_PCIE_PHY0_REFA_B_ALT0			0x06100060
+#define EA920_PCIE_PHY0_REFA_B_PAD			0x06150060
+#define EA920_PCIE_PHY0_SRAM_INIT_DONE			31
+#define EA920_PCIE_PHY_EXT_TX_ROPLL_POSTDIV_CTRL	0x11a8
+#define EA920_PCIE_PHY_ROPLL_POSTDIV_VAL		0x1249
+#define EA920_PCIE_PHY_EXT_TX_OVRD_EN_CTRL		0x11c4
+#define EA920_PCIE_PHY_ROPLL_POSTDIV_OVRD_EN_VAL	(0xf << 0)
+#define EA920_PCIE_PIPE_LANEX_LANEPLL_BYPASS		0x1384
+#define EA920_PCIE_PIPE_BYPASS_MODE_CTRL_VAL1		0x0
+#define EA920_PCIE_PIPE_BYPASS_MODE_CTRL_VAL2		0x0
+/* EA920: SOC CTRL registers */
+#define EA920_PCIE_REFCLK_CTRL_SOC_OPTION_0		0xa200
+#define EA920_PCIE_REFCLK_OPTION0_RC			0x103f5
+#define EA920_PCIE_REFCLK_CTRL_SOC_OPTION_1		0xa204
+#define EA920_PCIE_REFCLK_OPTION1_RC			0x30c00
+/* EA920: PMU registers */
+#define EA920_PCIE_PHY_4L_CONFIGURATION			0x700
+#define EA920_PCIE_PHY_2L_CONFIGURATION			0x704
+#define EA920_PCIE_PHY_CFG_EN_PHY			(0x1 << 0)
+/* EA920: GEN SYS registers */
+#define EA920_GENERAL_SS_RST_CTRL_1			0x48
+#define EA920_GENERAL_RST_PE0_SOFT_WARM_PHY_RESET	GENMASK(2, 1)
+#define EA920_GENERAL_RST_PE1_SOFT_COLD_RESET		(0x1 << 8)
+#define EA920_GENERAL_RST_PE1_SOFT_WARM_PHY_RESET	(0x3 << 9)
+#define EA920_GENERAL_RST_PE0_SOFT_WARM_RESET		(0x1 << 1)
+#define EA920_GENERAL_RST_PE1_SOFT_WARM_RESET		(0x1 << 9)
+#define EA920_GENERAL_RST_PE0_1_PHY_EN			0x808
+#define EA920_PHY_TIMEOUT				2000
+/* EA920: SYSREG registers */
+#define EA920_HSI0_PCIE_GEN5_PHY_PWRDWN_4L		0x670
+#define EA920_HSI0_PCIE_GEN5_PHY_PWRDWN_2L		0x4
+#define EA920_HSI0_PCIE_PHY_TEST_PWRDWN_MSK		BIT(0)
+#define EA920_HSI0_PCIE_PHY_TEST_PWRDUP			0x0
+#define EA920_HSI0_PCIE_PHY_TEST_PWRDWN			0x1
+#define EA920_HSI0_PCIE_GEN5_4LA_PHY_CTRL		0x828
+#define EA920_HSI0_PCIE_GEN5_2LA_PHY_CTRL		0x868
+#define EA920_HSI0_PCIE_IP_CTRL_DEV_TYPE_MSK		GENMASK(27, 24)
+#define EA920_HSI0_PCIE_IP_CTRL_DEV_TYPE_RC_A		0x4
+#define EA920_HSI0_PLL_REG0				0x600
+#define EA920_HSI0_PLL_FOUTEN_MSK			BIT(8)
+#define EA920_HSI0_PLL_FOUTEN				0x1
+#define EA920_HSI0_PLL_REG1				0x604
+#define EA920_HSI0_PLL_FOUTPOSTDIVEN_MSK		BIT(0)
+#define EA920_HSI0_PLL_FOUTPOSTDIVEN			0x1
+#define EA920_HSI0_PLL_REG2				0x608
+#define EA920_HSI0_PLL_PLLEN_MSK			BIT(24)
+#define EA920_HSI0_PLL_PLLEN				0x1
+#define EA920_HSI0_CLKBUF0_REG0				0x620
+#define EA920_HSI0_CLKBUF1_REG0				0x630
+#define EA920_HSI0_CLKBUF2_REG0				0x640
+#define EA920_HSI0_CLKBUF3_REG0				0x650
+#define EA920_HSI0_CLKBUF_IMP_CTRL_MSK			BIT(0)
+#define EA920_HSI0_CLKBUF_IMP_CTRL			0x1
+
 /* For Exynos pcie phy */
 struct exynos_pcie_phy {
 	void __iomem *base;
 	void __iomem *pcs_base;
 	struct regmap *pmureg;
 	struct regmap *fsysreg;
+	int num_lanes;
 };
 
+static u32 exynos_pcie_phy_readl(void __iomem *base, u32 offset)
+{
+	u32 data = 0;
+
+	data = readl(base + offset);
+	return data;
+}
+
 static void exynos_pcie_phy_writel(void __iomem *base, u32 val, u32 offset)
 {
 	writel(val, base + offset);
@@ -398,6 +471,152 @@ static int fsd_pcie_phy1_init(struct phy *phy)
 	return 0;
 }
 
+static int exynosautov920_pcie_phy_init(struct phy *phy)
+{
+	struct exynos_pcie_phy *ep = phy_get_drvdata(phy);
+	u32 val;
+	int timeout;
+
+	/* PHY on */
+	if (ep->num_lanes == 4) {
+		regmap_update_bits(ep->pmureg,
+				   EA920_PCIE_PHY_4L_CONFIGURATION,
+				   BIT(0), EA920_PCIE_PHY_CFG_EN_PHY);
+		regmap_update_bits(ep->fsysreg,
+				   EA920_HSI0_PCIE_GEN5_PHY_PWRDWN_4L,
+				   EA920_HSI0_PCIE_PHY_TEST_PWRDWN_MSK,
+				   EA920_HSI0_PCIE_PHY_TEST_PWRDUP);
+
+		/* SYSREG set to RC */
+		regmap_update_bits(ep->fsysreg,
+				   EA920_HSI0_PCIE_GEN5_4LA_PHY_CTRL,
+				   EA920_HSI0_PCIE_IP_CTRL_DEV_TYPE_MSK,
+				   EA920_HSI0_PCIE_IP_CTRL_DEV_TYPE_RC_A);
+	} else if (ep->num_lanes == 2) {
+		/* In 2L phy, 4L phy pmu should isolation off first */
+		regmap_update_bits(ep->pmureg,
+				   EA920_PCIE_PHY_4L_CONFIGURATION,
+				   BIT(0), EA920_PCIE_PHY_CFG_EN_PHY);
+		regmap_update_bits(ep->pmureg,
+				   EA920_PCIE_PHY_2L_CONFIGURATION,
+				   BIT(0), EA920_PCIE_PHY_CFG_EN_PHY);
+		regmap_update_bits(ep->fsysreg,
+				   EA920_HSI0_PCIE_GEN5_PHY_PWRDWN_2L,
+				   EA920_HSI0_PCIE_PHY_TEST_PWRDWN_MSK,
+				   EA920_HSI0_PCIE_PHY_TEST_PWRDUP);
+		/* SYSREG set to RC */
+		regmap_update_bits(ep->fsysreg,
+				   EA920_HSI0_PCIE_GEN5_2LA_PHY_CTRL,
+				   EA920_HSI0_PCIE_IP_CTRL_DEV_TYPE_MSK,
+				   EA920_HSI0_PCIE_IP_CTRL_DEV_TYPE_RC_A);
+	}
+
+	/* SOC control */
+	exynos_pcie_phy_writel(ep->pcs_base, EA920_PCIE_REFCLK_OPTION0_RC,
+			       EA920_PCIE_REFCLK_CTRL_SOC_OPTION_0);
+	exynos_pcie_phy_writel(ep->pcs_base, EA920_PCIE_REFCLK_OPTION1_RC,
+			       EA920_PCIE_REFCLK_CTRL_SOC_OPTION_1);
+
+	/* PLL setting */
+	regmap_update_bits(ep->fsysreg, EA920_HSI0_PLL_REG0,
+			   EA920_HSI0_PLL_FOUTEN_MSK, EA920_HSI0_PLL_FOUTEN);
+	regmap_update_bits(ep->fsysreg, EA920_HSI0_PLL_REG1,
+			   EA920_HSI0_PLL_FOUTPOSTDIVEN_MSK,
+			   EA920_HSI0_PLL_FOUTPOSTDIVEN);
+	regmap_update_bits(ep->fsysreg, EA920_HSI0_PLL_REG2,
+			   EA920_HSI0_PLL_PLLEN_MSK, EA920_HSI0_PLL_PLLEN);
+	regmap_update_bits(ep->fsysreg, EA920_HSI0_CLKBUF0_REG0,
+			   EA920_HSI0_CLKBUF_IMP_CTRL_MSK,
+			   EA920_HSI0_CLKBUF_IMP_CTRL);
+	regmap_update_bits(ep->fsysreg, EA920_HSI0_CLKBUF1_REG0,
+			   EA920_HSI0_CLKBUF_IMP_CTRL_MSK,
+			   EA920_HSI0_CLKBUF_IMP_CTRL);
+	regmap_update_bits(ep->fsysreg, EA920_HSI0_CLKBUF2_REG0,
+			   EA920_HSI0_CLKBUF_IMP_CTRL_MSK,
+			   EA920_HSI0_CLKBUF_IMP_CTRL);
+	regmap_update_bits(ep->fsysreg,	EA920_HSI0_CLKBUF3_REG0,
+			   EA920_HSI0_CLKBUF_IMP_CTRL_MSK,
+			   EA920_HSI0_CLKBUF_IMP_CTRL);
+
+	/* REFCLK setting */
+	val = exynos_pcie_phy_readl(ep->base, EA920_PCIE_PHY0_GEN_CTRL_1);
+	exynos_pcie_phy_writel(ep->base, val &
+			       ~EA920_PCIE_PHY0_REFA_CLK_SEL_MASK,
+			       EA920_PCIE_PHY0_GEN_CTRL_1);
+	exynos_pcie_phy_writel(ep->base,
+			       val & ~EA920_PCIE_PHY0_REFB_CLK_SEL_MASK,
+			       EA920_PCIE_PHY0_GEN_CTRL_1);
+	/* wait for REF CLK source change */
+	usleep_range(100, 110);
+	exynos_pcie_phy_writel(ep->base, EA920_PCIE_PHY_RTUNE_REQ,
+			       EA920_PCIE_PHY0_COMMON_CTRL);
+	exynos_pcie_phy_writel(ep->base, EA920_PCIE_PHY_ROPLL_POSTDIV_VAL,
+			       EA920_PCIE_PHY_EXT_TX_ROPLL_POSTDIV_CTRL);
+	exynos_pcie_phy_writel(ep->base,
+			       EA920_PCIE_PHY_ROPLL_POSTDIV_OVRD_EN_VAL,
+			       EA920_PCIE_PHY_EXT_TX_OVRD_EN_CTRL);
+	exynos_pcie_phy_writel(ep->base, EA920_PCIE_PIPE_BYPASS_MODE_CTRL_VAL1,
+			       EA920_PCIE_PIPE_LANEX_LANEPLL_BYPASS);
+	exynos_pcie_phy_writel(ep->base, EA920_PCIE_PIPE_BYPASS_MODE_CTRL_VAL2,
+			       EA920_PCIE_PIPE_LANEX_LANEPLL_BYPASS);
+	exynos_pcie_phy_writel(ep->base, EA920_PCIE_PHY0_REFA_B_ALT0,
+			       EA920_PCIE_PHY0_GEN_CTRL_1);
+
+	/* PHY warm reset */
+	val = exynos_pcie_phy_readl(ep->base, EA920_GENERAL_SS_RST_CTRL_1);
+	exynos_pcie_phy_writel(ep->base, val |
+			       EA920_GENERAL_RST_PE0_SOFT_WARM_PHY_RESET,
+			       EA920_GENERAL_SS_RST_CTRL_1);
+	usleep_range(10, 12);
+	exynos_pcie_phy_writel(ep->base, val &
+			       ~EA920_GENERAL_RST_PE0_SOFT_WARM_PHY_RESET,
+			       EA920_GENERAL_SS_RST_CTRL_1);
+
+	/* Set SRAM bypass */
+	val = exynos_pcie_phy_readl(ep->base, EA920_PCIE_PHY0_GEN_CTRL_1);
+	exynos_pcie_phy_writel(ep->base, val | EA920_PCIE_PHY0_PHY0_SRAM_BYPASS,
+			       EA920_PCIE_PHY0_GEN_CTRL_1);
+
+	/* Wait SRAM init */
+	timeout = 0;
+	do {
+		udelay(1);
+		timeout++;
+		if (timeout >= EA920_PHY_TIMEOUT)
+			return -ETIME;
+	} while (!(exynos_pcie_phy_readl(ep->base,
+					 EA920_PCIE_PHY0_GEN_CTRL_1) >>
+					 EA920_PCIE_PHY0_SRAM_INIT_DONE));
+
+	timeout = 0;
+	val = exynos_pcie_phy_readl(ep->base, EA920_PCIE_PHY0_GEN_CTRL_1);
+	exynos_pcie_phy_writel(ep->base, val |
+			       EA920_PCIE_PHY0_PHY0_SRAM_EXT_LD_DONE,
+			       EA920_PCIE_PHY0_GEN_CTRL_1);
+	/* wait for PHY init done */
+	mdelay(100);
+
+	return 0;
+}
+
+static int exynosautov920_pcie_phy_exit(struct phy *phy)
+{
+	struct exynos_pcie_phy *ep = phy_get_drvdata(phy);
+
+	if (ep->num_lanes == 4)
+		regmap_update_bits(ep->fsysreg,
+				   EA920_HSI0_PCIE_GEN5_PHY_PWRDWN_4L,
+				   EA920_HSI0_PCIE_PHY_TEST_PWRDWN_MSK,
+				   EA920_HSI0_PCIE_PHY_TEST_PWRDWN);
+	else if (ep->num_lanes == 2)
+		regmap_update_bits(ep->fsysreg,
+				   EA920_HSI0_PCIE_GEN5_PHY_PWRDWN_2L,
+				   EA920_HSI0_PCIE_PHY_TEST_PWRDWN_MSK,
+				   EA920_HSI0_PCIE_PHY_TEST_PWRDWN);
+
+	return 0;
+}
+
 static const struct phy_ops fsd_phy0_ops = {
 	.init		= fsd_pcie_phy0_init,
 	.reset		= fsd_pcie_phy0_reset,
@@ -410,6 +629,12 @@ static const struct phy_ops fsd_phy1_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_ops exynosautov920_phy_ops = {
+	.init		= exynosautov920_pcie_phy_init,
+	.exit		= exynosautov920_pcie_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
 static const struct of_device_id exynos_pcie_phy_match[] = {
 	{
 		.compatible = "samsung,exynos5433-pcie-phy",
@@ -423,6 +648,10 @@ static const struct of_device_id exynos_pcie_phy_match[] = {
 		.compatible = "tesla,fsd-pcie-phy1",
 		.data = &fsd_phy1_ops,
 	},
+	{
+		.compatible = "samsung,exynosautov920-pcie-phy",
+		.data = &exynosautov920_phy_ops,
+	},
 	{},
 };
 
@@ -468,6 +697,8 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
 
 	exynos_phy->pcs_base = devm_platform_ioremap_resource(pdev, 1);
 
+	of_property_read_u32(dev->of_node, "num-lanes", &exynos_phy->num_lanes);
+
 	phy_set_drvdata(generic_phy, exynos_phy);
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
-- 
2.45.2


