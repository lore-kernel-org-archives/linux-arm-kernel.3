Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA19C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZ6+W/WIGOdds27pMI7EwoChJQJ9HCLyepCyO2d3rcA=; b=YIkcO+0azPuptbGy9Sltr6Z3Eb
	e9Zc70uD/s6LPKGVV/7ETH95ybeAQBH7Da/j6hQqp1Q28RUfad2+my7lVNyd5YmefXH1v9Zew8lQ1
	gdeJKG4ewJTroUZeI8r19nkarZgYFNn5teq2P2J3IxIl6bVaYsLUs/CnmeKoyZJRyJU7VEgvu/Tmf
	FTy+JuGOScPpvBT3vA4QDiBEgBbolUycaFMX91+tjM2BO2e9r+sfKDKiWtMQPS3/vJLO5XENAgLaF
	kLawfx15OUXDunWt9gwtFsO1zuOXLIZkzsVK1PCd0OFeJj4h1c830NQ1NYj5aIuFze6srn3KRIFWA
	osIfub/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLr6-0000000Cfxw-2CKY;
	Fri, 07 Mar 2025 00:46:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLYI-0000000CdBL-3bjo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:27:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BAA81BC0;
	Thu,  6 Mar 2025 16:27:11 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD6E63F673;
	Thu,  6 Mar 2025 16:26:56 -0800 (PST)
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
Subject: [PATCH v4 11/14] clk: sunxi-ng: a523: remaining mod clocks
Date: Fri,  7 Mar 2025 00:26:25 +0000
Message-ID: <20250307002628.10684-12-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307002628.10684-1-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_162658_986484_ED66129E 
X-CRM114-Status: GOOD (  10.93  )
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

Add the remaining mod clocks, driving various parts of the SoC: the "LEDC"
LED controller, the "CSI" camera interface, the "ISP" image processor,
the DSP clock, and the "fanout" clocks, which allow to put clock signals
on external pins.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 185 +++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index f62a32fa70e4e..0f28e453440ae 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -862,6 +862,157 @@ static SUNXI_CCU_M_HW_WITH_MUX_GATE(edp_clk, "edp", edp_parents, 0xbb0,
 				    BIT(31),	/* gate */
 				    CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ledc_clk, "ledc", ir_tx_ledc_parents,
+				      0xbf0,
+				      0, 4,	/* M */
+				      24, 1,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static const struct clk_hw *csi_top_parents[] = {
+	&pll_periph0_300M_clk.hw,
+	&pll_periph0_400M_clk.hw,
+	&pll_periph0_480M_clk.common.hw,
+	&pll_video3_4x_clk.common.hw,
+	&pll_video3_3x_clk.hw,
+};
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(csi_top_clk, "csi-top", csi_top_parents,
+				    0xc04,
+				    0, 5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    0);
+
+static const struct clk_parent_data csi_mclk_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_video3_4x_clk.common.hw },
+	{ .hw = &pll_video0_4x_clk.common.hw },
+	{ .hw = &pll_video1_4x_clk.common.hw },
+	{ .hw = &pll_video2_4x_clk.common.hw },
+};
+static SUNXI_CCU_DUALDIV_MUX_GATE(csi_mclk0_clk, "csi-mclk0", csi_mclk_parents,
+				  0xc08,
+				  0, 5,		/* M */
+				  8, 5,		/* P */
+				  24, 3,	/* mux */
+				  BIT(31),	/* gate */
+				  0);
+
+static SUNXI_CCU_DUALDIV_MUX_GATE(csi_mclk1_clk, "csi-mclk1", csi_mclk_parents,
+				  0xc0c,
+				  0, 5,		/* M */
+				  8, 5,		/* P */
+				  24, 3,	/* mux */
+				  BIT(31),	/* gate */
+				  0);
+
+static SUNXI_CCU_DUALDIV_MUX_GATE(csi_mclk2_clk, "csi-mclk2", csi_mclk_parents,
+				  0xc10,
+				  0, 5,		/* M */
+				  8, 5,		/* P */
+				  24, 3,	/* mux */
+				  BIT(31),	/* gate */
+				  0);
+
+static SUNXI_CCU_DUALDIV_MUX_GATE(csi_mclk3_clk, "csi-mclk3", csi_mclk_parents,
+				  0xc14,
+				  0, 5,		/* M */
+				  8, 5,		/* P */
+				  24, 3,	/* mux */
+				  BIT(31),	/* gate */
+				  0);
+
+static const struct clk_hw *isp_parents[] = {
+	&pll_periph0_300M_clk.hw,
+	&pll_periph0_400M_clk.hw,
+	&pll_video2_4x_clk.common.hw,
+	&pll_video3_4x_clk.common.hw,
+};
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(isp_clk, "isp", isp_parents, 0xc20,
+				    0, 5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    0);
+
+static const struct clk_parent_data dsp_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "losc" },
+	{ .fw_name = "iosc" },
+	{ .hw = &pll_periph0_2x_clk.common.hw },
+	{ .hw = &pll_periph0_480M_clk.common.hw, },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(dsp_clk, "dsp", dsp_parents, 0xc70,
+				      0, 5,	/* M */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static SUNXI_CCU_GATE_DATA(fanout_24M_clk, "fanout-24M", osc24M,
+			   0xf30, BIT(0), 0);
+static SUNXI_CCU_GATE_DATA_WITH_PREDIV(fanout_12M_clk, "fanout-12M", osc24M,
+				       0xf30, BIT(1), 2, 0);
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_16M_clk, "fanout-16M",
+				      pll_periph0_480M_hws,
+				      0xf30, BIT(2), 30, 0);
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_25M_clk, "fanout-25M",
+				      pll_periph0_2x_hws,
+				      0xf30, BIT(3), 48, 0);
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_50M_clk, "fanout-50M",
+				      pll_periph0_2x_hws,
+				      0xf30, BIT(4), 24, 0);
+
+static const struct clk_parent_data fanout_27M_parents[] = {
+	{ .hw = &pll_video0_4x_clk.common.hw },
+	{ .hw = &pll_video1_4x_clk.common.hw },
+	{ .hw = &pll_video2_4x_clk.common.hw },
+	{ .hw = &pll_video3_4x_clk.common.hw },
+};
+static SUNXI_CCU_DUALDIV_MUX_GATE(fanout_27M_clk, "fanout-27M",
+				  fanout_27M_parents, 0xf34,
+				  0, 5,		/* div0 */
+				  8, 5,		/* div1 */
+				  24, 2,	/* mux */
+				  BIT(31),	/* gate */
+				  0);
+
+static const struct clk_parent_data fanout_pclk_parents[] = {
+	{ .hw = &apb0_clk.common.hw }
+};
+static SUNXI_CCU_DUALDIV_MUX_GATE(fanout_pclk_clk, "fanout-pclk",
+				  fanout_pclk_parents,
+				  0xf38,
+				  0, 5,		/* div0 */
+				  5, 5,		/* div1 */
+				  0, 0,		/* mux */
+				  BIT(31),	/* gate */
+				  0);
+
+static const struct clk_parent_data fanout_parents[] = {
+	{ .fw_name = "losc-fanout" },
+	{ .hw = &fanout_12M_clk.common.hw, },
+	{ .hw = &fanout_16M_clk.common.hw, },
+	{ .hw = &fanout_24M_clk.common.hw, },
+	{ .hw = &fanout_25M_clk.common.hw, },
+	{ .hw = &fanout_27M_clk.common.hw, },
+	{ .hw = &fanout_pclk_clk.common.hw, },
+	{ .hw = &fanout_50M_clk.common.hw, },
+};
+static SUNXI_CCU_MUX_DATA_WITH_GATE(fanout0_clk, "fanout0", fanout_parents,
+				    0xf3c,
+				    0, 3,	/* mux */
+				    BIT(21),	/* gate */
+				    0);
+static SUNXI_CCU_MUX_DATA_WITH_GATE(fanout1_clk, "fanout1", fanout_parents,
+				    0xf3c,
+				    3, 3,	/* mux */
+				    BIT(22),	/* gate */
+				    0);
+static SUNXI_CCU_MUX_DATA_WITH_GATE(fanout2_clk, "fanout2", fanout_parents,
+				    0xf3c,
+				    6, 3,	/* mux */
+				    BIT(23),	/* gate */
+				    0);
+
 /*
  * Contains all clocks that are controlled by a hardware register. They
  * have a (sunxi) .common member, which needs to be initialised by the common
@@ -936,6 +1087,23 @@ static struct ccu_common *sun55i_a523_ccu_clks[] = {
 	&tcon_tv0_clk.common,
 	&tcon_tv1_clk.common,
 	&edp_clk.common,
+	&ledc_clk.common,
+	&csi_top_clk.common,
+	&csi_mclk0_clk.common,
+	&csi_mclk1_clk.common,
+	&csi_mclk2_clk.common,
+	&csi_mclk3_clk.common,
+	&isp_clk.common,
+	&dsp_clk.common,
+	&fanout_24M_clk.common,
+	&fanout_12M_clk.common,
+	&fanout_16M_clk.common,
+	&fanout_25M_clk.common,
+	&fanout_27M_clk.common,
+	&fanout_pclk_clk.common,
+	&fanout0_clk.common,
+	&fanout1_clk.common,
+	&fanout2_clk.common,
 };
 
 static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
@@ -1031,6 +1199,23 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
 		[CLK_TCON_TV0]		= &tcon_tv0_clk.common.hw,
 		[CLK_TCON_TV1]		= &tcon_tv1_clk.common.hw,
 		[CLK_EDP]		= &edp_clk.common.hw,
+		[CLK_LEDC]		= &ledc_clk.common.hw,
+		[CLK_CSI_TOP]		= &csi_top_clk.common.hw,
+		[CLK_CSI_MCLK0]		= &csi_mclk0_clk.common.hw,
+		[CLK_CSI_MCLK1]		= &csi_mclk1_clk.common.hw,
+		[CLK_CSI_MCLK2]		= &csi_mclk2_clk.common.hw,
+		[CLK_CSI_MCLK3]		= &csi_mclk3_clk.common.hw,
+		[CLK_ISP]		= &isp_clk.common.hw,
+		[CLK_DSP]		= &dsp_clk.common.hw,
+		[CLK_FANOUT_24M]	= &fanout_24M_clk.common.hw,
+		[CLK_FANOUT_12M]	= &fanout_12M_clk.common.hw,
+		[CLK_FANOUT_16M]	= &fanout_16M_clk.common.hw,
+		[CLK_FANOUT_25M]	= &fanout_25M_clk.common.hw,
+		[CLK_FANOUT_27M]	= &fanout_27M_clk.common.hw,
+		[CLK_FANOUT_PCLK]	= &fanout_pclk_clk.common.hw,
+		[CLK_FANOUT0]		= &fanout0_clk.common.hw,
+		[CLK_FANOUT1]		= &fanout1_clk.common.hw,
+		[CLK_FANOUT2]		= &fanout2_clk.common.hw,
 	},
 };
 
-- 
2.46.3


