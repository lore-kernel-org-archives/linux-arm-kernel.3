Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58054C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVHr+x2R2Oa5+KwDxR1ZXY2m5S1vLj6FhpG941DUZD4=; b=UutoxNzoqE3rJVvlul+x9hX1Ox
	aXN0tTX4mlMnKIsZ2wG5jC5A3twNMSfYrf0UndXj+2dWcWcf6C2yBP7fFhFLoMT9Vi+xEm/UI8oKf
	gPjr8Xna+QwtoAcOg3ZPDFworp7Jrxd4NaA0SfBoYCJX3VUjs1SfcgvONGAkCbLY/HZWU2Ei2XWhm
	o2/ZHVDShRZr9wy4Pq4YkoYFJxqwnD26cLGYR1BldEisJQD+H9fYjeHLW9HmZcENXtgXNvbrFvVde
	Pbau0g9747T/g5HvUCwcL1qjFaC5DcJKYyJf/xWRFJv3tWR6e8EVemZtO37LZxjmG1pfBTHeh2gVw
	eSHxseng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLnt-0000000CfRL-3YP4;
	Fri, 07 Mar 2025 00:43:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLYE-0000000Cd9t-2qhi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:26:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2289C1BC0;
	Thu,  6 Mar 2025 16:27:07 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 763B33F673;
	Thu,  6 Mar 2025 16:26:52 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/14] clk: sunxi-ng: a523: add interface mod clocks
Date: Fri,  7 Mar 2025 00:26:23 +0000
Message-ID: <20250307002628.10684-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307002628.10684-1-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_162654_804204_3E8F1D0F 
X-CRM114-Status: GOOD (  10.31  )
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

Add the clocks driving what the user manual summarises under "interface"
devices: raw NAND flash, MMC, SPI, EMAC, "IR" infrared, and the "GPADC"
general purpose analogue/digital converter.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 159 +++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index c59f3f789d052..953b11f7135cf 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -113,6 +113,9 @@ static CLK_FIXED_FACTOR_HWS(pll_periph0_150M_clk, "pll-periph0-150M",
 			    pll_periph0_2x_hws, 8, 1, 0);
 static CLK_FIXED_FACTOR_HWS(pll_periph0_160M_clk, "pll-periph0-160M",
 			    pll_periph0_480M_hws, 3, 1, 0);
+static const struct clk_hw *pll_periph0_150M_hws[] = {
+	&pll_periph0_150M_clk.hw
+};
 
 #define SUN55I_A523_PLL_PERIPH1_REG	0x028
 static struct ccu_nm pll_periph1_4x_clk = {
@@ -555,6 +558,132 @@ static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(dram_clk, "dram", dram_parents,
 					    CLK_IS_CRITICAL,
 					    CCU_FEATURE_UPDATE_BIT);
 
+static const struct clk_parent_data nand_mmc_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_400M_clk.hw },
+	{ .hw = &pll_periph0_300M_clk.hw },
+	{ .hw = &pll_periph1_400M_clk.hw },
+	{ .hw = &pll_periph1_300M_clk.hw },
+};
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(nand0_clk, "nand0", nand_mmc_parents,
+				    0x810,
+				    0, 5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    0);
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(nand1_clk, "nand1", nand_mmc_parents,
+				    0x814,
+				    0, 5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    0);
+
+static SUNXI_CCU_MP_MUX_GATE_POSTDIV_DUALDIV(mmc0_clk, "mmc0", nand_mmc_parents,
+					     0x830,
+					     0, 5,	/* M */
+					     8, 5,	/* P */
+					     24, 3,	/* mux */
+					     BIT(31),	/* gate */
+					     2,		/* post div */
+					     0);
+
+static SUNXI_CCU_MP_MUX_GATE_POSTDIV_DUALDIV(mmc1_clk, "mmc1", nand_mmc_parents,
+					     0x834,
+					     0, 5,	/* M */
+					     8, 5,	/* P */
+					     24, 3,	/* mux */
+					     BIT(31),	/* gate */
+					     2,		/* post div */
+					     0);
+
+static const struct clk_parent_data mmc2_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_800M_clk.common.hw },
+	{ .hw = &pll_periph0_600M_clk.hw },
+	{ .hw = &pll_periph1_800M_clk.common.hw },
+	{ .hw = &pll_periph1_600M_clk.hw },
+};
+
+static SUNXI_CCU_MP_MUX_GATE_POSTDIV_DUALDIV(mmc2_clk, "mmc2", mmc2_parents,
+					     0x838,
+					     0, 5,	/* M */
+					     8, 5,	/* P */
+					     24, 3,	/* mux */
+					     BIT(31),	/* gate */
+					     2,		/* post div */
+					     0);
+
+static const struct clk_parent_data spi_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_300M_clk.hw },
+	{ .hw = &pll_periph0_200M_clk.hw },
+	{ .hw = &pll_periph1_300M_clk.hw },
+	{ .hw = &pll_periph1_200M_clk.hw },
+};
+static SUNXI_CCU_DUALDIV_MUX_GATE(spi0_clk, "spi0", spi_parents, 0x940,
+				  0, 5,		/* M */
+				  8, 5,		/* P */
+				  24, 3,	/* mux */
+				  BIT(31),	/* gate */
+				  0);
+static SUNXI_CCU_DUALDIV_MUX_GATE(spi1_clk, "spi1", spi_parents, 0x944,
+				  0, 5,		/* M */
+				  8, 5,		/* P */
+				  24, 3,	/* mux */
+				  BIT(31),	/* gate */
+				  0);
+static SUNXI_CCU_DUALDIV_MUX_GATE(spi2_clk, "spi2", spi_parents, 0x948,
+				  0, 5,		/* M */
+				  8, 5,		/* P */
+				  24, 3,	/* mux */
+				  BIT(31),	/* gate */
+				  0);
+static SUNXI_CCU_DUALDIV_MUX_GATE(spifc_clk, "spifc", nand_mmc_parents, 0x950,
+				  0, 5,		/* M */
+				  8, 5,		/* P */
+				  24, 3,	/* mux */
+				  BIT(31),	/* gate */
+				  0);
+
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac0_25M_clk, "emac0-25M",
+				      pll_periph0_150M_hws,
+				      0x970, BIT(31) | BIT(30), 6, 0);
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac1_25M_clk, "emac1-25M",
+				      pll_periph0_150M_hws,
+				      0x974, BIT(31) | BIT(30), 6, 0);
+
+static const struct clk_parent_data ir_rx_parents[] = {
+	{ .fw_name = "losc" },
+	{ .fw_name = "hosc" },
+};
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ir_rx_clk, "ir-rx", ir_rx_parents, 0x990,
+				      0, 5,	/* M */
+				      24, 1,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+static const struct clk_parent_data ir_tx_ledc_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph1_600M_clk.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ir_tx_clk, "ir-tx", ir_tx_ledc_parents,
+				      0x9c0,
+				      0, 5,	/* M */
+				      24, 1,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static SUNXI_CCU_M_WITH_GATE(gpadc0_clk, "gpadc0", "hosc", 0x9e0,
+				 0, 5,		/* M */
+				 BIT(31),	/* gate */
+				 0);
+static SUNXI_CCU_M_WITH_GATE(gpadc1_clk, "gpadc1", "hosc", 0x9e4,
+				 0, 5,		/* M */
+				 BIT(31),	/* gate */
+				 0);
+
 static const struct clk_parent_data losc_hosc_parents[] = {
 	{ .fw_name = "hosc" },
 	{ .fw_name = "losc" },
@@ -725,6 +854,21 @@ static struct ccu_common *sun55i_a523_ccu_clks[] = {
 	&hstimer5_clk.common,
 	&iommu_clk.common,
 	&dram_clk.common,
+	&nand0_clk.common,
+	&nand1_clk.common,
+	&mmc0_clk.common,
+	&mmc1_clk.common,
+	&mmc2_clk.common,
+	&spi0_clk.common,
+	&spi1_clk.common,
+	&spi2_clk.common,
+	&spifc_clk.common,
+	&emac0_25M_clk.common,
+	&emac1_25M_clk.common,
+	&ir_rx_clk.common,
+	&ir_tx_clk.common,
+	&gpadc0_clk.common,
+	&gpadc1_clk.common,
 	&pcie_aux_clk.common,
 	&hdmi_24M_clk.common,
 	&hdmi_cec_32k_clk.common,
@@ -801,6 +945,21 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
 		[CLK_HSTIMER5]		= &hstimer5_clk.common.hw,
 		[CLK_IOMMU]		= &iommu_clk.common.hw,
 		[CLK_DRAM]		= &dram_clk.common.hw,
+		[CLK_NAND0]		= &nand0_clk.common.hw,
+		[CLK_NAND1]		= &nand1_clk.common.hw,
+		[CLK_MMC0]		= &mmc0_clk.common.hw,
+		[CLK_MMC1]		= &mmc1_clk.common.hw,
+		[CLK_MMC2]		= &mmc2_clk.common.hw,
+		[CLK_SPI0]		= &spi0_clk.common.hw,
+		[CLK_SPI1]		= &spi1_clk.common.hw,
+		[CLK_SPI2]		= &spi2_clk.common.hw,
+		[CLK_SPIFC]		= &spifc_clk.common.hw,
+		[CLK_EMAC0_25M]		= &emac0_25M_clk.common.hw,
+		[CLK_EMAC1_25M]		= &emac1_25M_clk.common.hw,
+		[CLK_IR_RX]		= &ir_rx_clk.common.hw,
+		[CLK_IR_TX]		= &ir_tx_clk.common.hw,
+		[CLK_GPADC0]		= &gpadc0_clk.common.hw,
+		[CLK_GPADC1]		= &gpadc1_clk.common.hw,
 		[CLK_PCIE_AUX]		= &pcie_aux_clk.common.hw,
 		[CLK_HDMI_24M]		= &hdmi_24M_clk.common.hw,
 		[CLK_HDMI_CEC_32K]	= &hdmi_cec_32k_clk.common.hw,
-- 
2.46.3


