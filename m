Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04658C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfzbqaq8ZKTwJRIrKLYawdeTasItrhrf77HuM5aL2no=; b=aH6nkwCvesnfs7IXokI8tGqQHn
	0bEYu1ocIp+ryH/aSi6PmvcUUuZpdkmAKywiAWBngEJprQhr9Tg7ESSrEiN2wHqxBNG48UlRBnVma
	suOUzSFQK3aBM4AyruCfyu19tdXvuUAAM0Jqe+HDBmDhQ/1Qz9Ed08swBCrUf3Ay+mdCxBLQT6L45
	CuR6sk87HQNbMhcDC2bevHUtuD7EEZJwF/kQIe2kWoDD6X7RjeLEx6ErHHRVuVQNWFZJimQDV1im8
	XSa255DmOrBmZDPabOFlaq97pNPyjdnswX2DEFWTCyrauYQCNNWI7MMATHy+C/9yECOHASHrRrlL7
	FxjoCZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tivRW-0000000EwUZ-2OOK;
	Fri, 14 Feb 2025 13:09:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tivEy-0000000Etb4-3mMy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 12:56:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E77961596;
	Fri, 14 Feb 2025 04:56:40 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7AA83F58B;
	Fri, 14 Feb 2025 04:56:18 -0800 (PST)
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
Subject: [PATCH v2 08/15] clk: sunxi-ng: a523: add system mod clocks
Date: Fri, 14 Feb 2025 12:53:52 +0000
Message-ID: <20250214125359.5204-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250214125359.5204-1-andre.przywara@arm.com>
References: <20250214125359.5204-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_045621_025787_7407B47F 
X-CRM114-Status: GOOD (  10.85  )
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

Add the clocks driving some core system related subsystems of the SoC:
the "CE" crypto engine, the high speed timers, the DRAM and the associated
MBUS clock, and the PCIe clock.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 119 +++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 0ef1fd71a1ca5..b68c44bce825f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -423,6 +423,18 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
 				    BIT(31),	/* gate */
 				    0);
 
+static const struct clk_parent_data ce_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_480M_clk.common.hw },
+	{ .hw = &pll_periph0_400M_clk.hw },
+	{ .hw = &pll_periph0_300M_clk.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ce_clk, "ce", ce_parents, 0x680,
+				       0, 5,	/* M */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       0);
+
 static const struct clk_hw *ve_parents[] = {
 	&pll_ve_clk.common.hw,
 	&pll_periph0_480M_clk.common.hw,
@@ -435,6 +447,65 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(ve_clk, "ve", ve_parents, 0x690,
 				    BIT(31),	/* gate */
 				    CLK_SET_RATE_PARENT);
 
+static const struct clk_parent_data hstimer_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "iosc" },
+	{ .fw_name = "losc" },
+	{ .hw = &pll_periph0_200M_clk.hw },
+};
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
+				       hstimer_parents, 0x730,
+				       0, 0,	/* M */
+				       0, 3,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer1_clk, "hstimer1",
+				       hstimer_parents,
+				       0x734,
+				       0, 0,	/* M */
+				       0, 3,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer2_clk, "hstimer2",
+				       hstimer_parents,
+				       0x738,
+				       0, 0,	/* M */
+				       0, 3,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer3_clk, "hstimer3",
+				       hstimer_parents,
+				       0x73c,
+				       0, 0,	/* M */
+				       0, 3,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer4_clk, "hstimer4",
+				       hstimer_parents,
+				       0x740,
+				       0, 0,	/* M */
+				       0, 3,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer5_clk, "hstimer5",
+				       hstimer_parents,
+				       0x744,
+				       0, 0,	/* M */
+				       0, 3,	/* P */
+				       24, 3,	/* mux */
+				       BIT(31),	/* gate */
+				       CLK_SET_RATE_PARENT);
+
 static const struct clk_parent_data iommu_parents[] = {
 	{ .hw = &pll_periph0_600M_clk.hw },
 	{ .hw = &pll_ddr0_clk.common.hw },
@@ -450,6 +521,34 @@ static SUNXI_CCU_M_DATA_WITH_MUX_GATE(iommu_clk, "iommu", iommu_parents, 0x7b0,
 				      BIT(31),	/* gate */
 				      CLK_SET_RATE_PARENT);
 
+static const struct clk_hw *dram_parents[] = {
+	&pll_ddr0_clk.common.hw,
+	&pll_periph0_600M_clk.hw,
+	&pll_periph0_480M_clk.common.hw,
+	&pll_periph0_400M_clk.hw,
+	&pll_periph0_150M_clk.hw,
+};
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(dram_clk, "dram", dram_parents, 0x800,
+				    0, 5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_IS_CRITICAL);
+
+static CLK_FIXED_FACTOR_HW(mbus_clk, "mbus",
+			   &dram_clk.common.hw, 4, 1, 0);
+
+static const struct clk_parent_data losc_hosc_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+};
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(pcie_aux_clk, "pcie-aux",
+				      losc_hosc_parents, 0xaa0,
+				      0, 5,	/* M */
+				      24, 1,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
 static SUNXI_CCU_GATE_DATA(hdmi_24M_clk, "hdmi-24M", osc24M, 0xb04, BIT(31), 0);
 
 /* TODO: add mux between 32kOSC and PERIPH0/18750 */
@@ -584,8 +683,17 @@ static struct ccu_common *sun55i_a523_ccu_clks[] = {
 	&di_clk.common,
 	&g2d_clk.common,
 	&gpu_clk.common,
+	&ce_clk.common,
 	&ve_clk.common,
+	&hstimer0_clk.common,
+	&hstimer1_clk.common,
+	&hstimer2_clk.common,
+	&hstimer3_clk.common,
+	&hstimer4_clk.common,
+	&hstimer5_clk.common,
 	&iommu_clk.common,
+	&dram_clk.common,
+	&pcie_aux_clk.common,
 	&hdmi_24M_clk.common,
 	&hdmi_cec_32k_clk.common,
 	&hdmi_cec_clk.common,
@@ -644,11 +752,22 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
 		[CLK_AHB]		= &ahb_clk.common.hw,
 		[CLK_APB0]		= &apb0_clk.common.hw,
 		[CLK_APB1]		= &apb1_clk.common.hw,
+		[CLK_MBUS]		= &mbus_clk.hw,
 		[CLK_DE]		= &de_clk.common.hw,
 		[CLK_DI]		= &di_clk.common.hw,
 		[CLK_G2D]		= &g2d_clk.common.hw,
 		[CLK_GPU]		= &gpu_clk.common.hw,
+		[CLK_CE]		= &ce_clk.common.hw,
 		[CLK_VE]		= &ve_clk.common.hw,
+		[CLK_HSTIMER0]		= &hstimer0_clk.common.hw,
+		[CLK_HSTIMER1]		= &hstimer1_clk.common.hw,
+		[CLK_HSTIMER2]		= &hstimer2_clk.common.hw,
+		[CLK_HSTIMER3]		= &hstimer3_clk.common.hw,
+		[CLK_HSTIMER4]		= &hstimer4_clk.common.hw,
+		[CLK_HSTIMER5]		= &hstimer5_clk.common.hw,
+		[CLK_IOMMU]		= &iommu_clk.common.hw,
+		[CLK_DRAM]		= &dram_clk.common.hw,
+		[CLK_PCIE_AUX]		= &pcie_aux_clk.common.hw,
 		[CLK_HDMI_24M]		= &hdmi_24M_clk.common.hw,
 		[CLK_HDMI_CEC_32K]	= &hdmi_cec_32k_clk.common.hw,
 		[CLK_HDMI_CEC]		= &hdmi_cec_clk.common.hw,
-- 
2.46.3


