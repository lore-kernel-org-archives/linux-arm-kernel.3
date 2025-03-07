Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0EAC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32gBUELQ6WwyDNUJMGmcC+iLrzYtegAeEzx6Kv63GZg=; b=Q99fG1L6MBOfbYPODI4GKIcD9J
	5mgaYS615I/OgZMtthXglsH5UUpR2z9LhlSFwmrnkRuZYftqNd1rpyYY985G4eP4BILT0lu0vZYr6
	WeV1mAOMe09rEkqi/gAws5qzsskN831NWejOyVEMA0rfXVLBMFBAsZ2wz2KB7lVHo6foSa/s03rVd
	mxorySyn82gSlqdWmLdSneDxAdE51dk4IvkU0ptcCRWJaq50GN1xqBqKHbB5RjPyyCYAk0JLa5yTq
	yywi+IU+d6m5yN0rh6mdN/LBqm/wDFU+0SxA895AuZSwsLYfBu0TZ8NnbeIpw76zRk6N2miMkfHD4
	E3eURbGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLki-0000000Cf2V-1Mjf;
	Fri, 07 Mar 2025 00:39:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLYA-0000000Cd7n-28k1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:26:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFB491BC0;
	Thu,  6 Mar 2025 16:27:02 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F8253F762;
	Thu,  6 Mar 2025 16:26:48 -0800 (PST)
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
Subject: [PATCH v4 07/14] clk: sunxi-ng: a523: add video mod clocks
Date: Fri,  7 Mar 2025 00:26:21 +0000
Message-ID: <20250307002628.10684-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307002628.10684-1-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_162650_634917_273CE9D0 
X-CRM114-Status: GOOD (  11.77  )
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

Add the clocks driving the various video subsystems of the SoC: the "DE"
display engine, the "DI" deinterlacer, the "G2D" 2D graphics system, the
Mali "GPU", the "VE" video engine, its associated IOMMU, as well as the
clocks for the various video output drivers (HDMI, DP, LCDs).

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 238 +++++++++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index c8a96b642bb1e..17a4ffc0b7f52 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -364,6 +364,208 @@ static SUNXI_CCU_M_DATA_WITH_MUX(apb1_clk, "apb1", apb1_parents, 0x524,
 				 24, 3,		/* mux */
 				 0);
 
+
+/**************************************************************************
+ *                          mod clocks                                    *
+ **************************************************************************/
+
+static const struct clk_hw *de_parents[] = {
+	&pll_periph0_300M_clk.hw,
+	&pll_periph0_400M_clk.hw,
+	&pll_video3_4x_clk.common.hw,
+	&pll_video3_3x_clk.hw,
+};
+
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(de_clk, "de", de_parents, 0x600,
+				    0, 5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static const struct clk_hw *di_parents[] = {
+	&pll_periph0_300M_clk.hw,
+	&pll_periph0_400M_clk.hw,
+	&pll_video0_4x_clk.common.hw,
+	&pll_video1_4x_clk.common.hw,
+};
+
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(di_clk, "di", di_parents, 0x620,
+				    0, 5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static const struct clk_hw *g2d_parents[] = {
+	&pll_periph0_400M_clk.hw,
+	&pll_periph0_300M_clk.hw,
+	&pll_video0_4x_clk.common.hw,
+	&pll_video1_4x_clk.common.hw,
+};
+
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(g2d_clk, "g2d", g2d_parents, 0x630,
+				    0, 5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    0);
+
+static const struct clk_hw *gpu_parents[] = {
+	&pll_gpu_clk.common.hw,
+	&pll_periph0_800M_clk.common.hw,
+	&pll_periph0_600M_clk.hw,
+	&pll_periph0_400M_clk.hw,
+	&pll_periph0_300M_clk.hw,
+	&pll_periph0_200M_clk.hw,
+};
+
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
+				    0, 4,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static const struct clk_hw *ve_parents[] = {
+	&pll_ve_clk.common.hw,
+	&pll_periph0_480M_clk.common.hw,
+	&pll_periph0_400M_clk.hw,
+	&pll_periph0_300M_clk.hw,
+};
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(ve_clk, "ve", ve_parents, 0x690,
+				    0, 5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static const struct clk_parent_data iommu_parents[] = {
+	{ .hw = &pll_periph0_600M_clk.hw },
+	{ .hw = &pll_ddr_clk.common.hw },
+	{ .hw = &pll_periph0_480M_clk.common.hw },
+	{ .hw = &pll_periph0_400M_clk.hw },
+	{ .hw = &pll_periph0_150M_clk.hw },
+	{ .fw_name = "hosc" },
+};
+
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(iommu_clk, "iommu", iommu_parents,
+					    0x7b0,
+					    0, 5,	/* M */
+					    0, 0,	/* no P */
+					    24, 3,	/* mux */
+					    BIT(31),	/* gate */
+					    CLK_SET_RATE_PARENT,
+					    CCU_FEATURE_UPDATE_BIT);
+
+static SUNXI_CCU_GATE_DATA(hdmi_24M_clk, "hdmi-24M", osc24M, 0xb04, BIT(31), 0);
+
+static SUNXI_CCU_GATE_HWS_WITH_PREDIV(hdmi_cec_32k_clk, "hdmi-cec-32k",
+				      pll_periph0_2x_hws,
+				      0xb10, BIT(30), 36621, 0);
+
+static const struct clk_parent_data hdmi_cec_parents[] = {
+	{ .fw_name = "losc" },
+	{ .hw = &hdmi_cec_32k_clk.common.hw },
+};
+static SUNXI_CCU_MUX_DATA_WITH_GATE(hdmi_cec_clk, "hdmi-cec", hdmi_cec_parents,
+				    0xb10,
+				    24, 1,	/* mux */
+				    BIT(31),	/* gate */
+				    0);
+
+static const struct clk_parent_data mipi_dsi_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .hw = &pll_periph0_200M_clk.hw },
+	{ .hw = &pll_periph0_150M_clk.hw },
+};
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(mipi_dsi0_clk, "mipi-dsi0",
+				      mipi_dsi_parents, 0xb24,
+				      0, 5,	/* M */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE(mipi_dsi1_clk, "mipi-dsi1",
+				      mipi_dsi_parents, 0xb28,
+				      0, 5,	/* M */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static const struct clk_hw *tcon_parents[] = {
+	&pll_video0_4x_clk.common.hw,
+	&pll_video1_4x_clk.common.hw,
+	&pll_video2_4x_clk.common.hw,
+	&pll_video3_4x_clk.common.hw,
+	&pll_periph0_2x_clk.common.hw,
+	&pll_video0_3x_clk.hw,
+	&pll_video1_3x_clk.hw,
+};
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(tcon_lcd0_clk, "tcon-lcd0", tcon_parents,
+				    0xb60,
+				    0,  5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(tcon_lcd1_clk, "tcon-lcd1", tcon_parents,
+				    0xb64,
+				    0,  5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static const struct clk_hw *tcon_tv_parents[] = {
+	&pll_video0_4x_clk.common.hw,
+	&pll_video1_4x_clk.common.hw,
+	&pll_video2_4x_clk.common.hw,
+	&pll_video3_4x_clk.common.hw,
+	&pll_periph0_2x_clk.common.hw,
+};
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(tcon_lcd2_clk, "tcon-lcd2",
+				    tcon_tv_parents, 0xb68,
+				    0,  5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(combophy_dsi0_clk, "combophy-dsi0",
+				    tcon_parents, 0xb6c,
+				    0,  5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(combophy_dsi1_clk, "combophy-dsi1",
+				    tcon_parents, 0xb70,
+				    0,  5,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(tcon_tv0_clk, "tcon-tv0", tcon_tv_parents,
+				    0xb80,
+				    0, 4,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(tcon_tv1_clk, "tcon-tv1", tcon_tv_parents,
+				    0xb84,
+				    0, 4,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
+static const struct clk_hw *edp_parents[] = {
+	&pll_video0_4x_clk.common.hw,
+	&pll_video1_4x_clk.common.hw,
+	&pll_video2_4x_clk.common.hw,
+	&pll_video3_4x_clk.common.hw,
+	&pll_periph0_2x_clk.common.hw,
+};
+static SUNXI_CCU_M_HW_WITH_MUX_GATE(edp_clk, "edp", edp_parents, 0xbb0,
+				    0, 4,	/* M */
+				    24, 3,	/* mux */
+				    BIT(31),	/* gate */
+				    CLK_SET_RATE_PARENT);
+
 /*
  * Contains all clocks that are controlled by a hardware register. They
  * have a (sunxi) .common member, which needs to be initialised by the common
@@ -394,6 +596,23 @@ static struct ccu_common *sun55i_a523_ccu_clks[] = {
 	&ahb_clk.common,
 	&apb0_clk.common,
 	&apb1_clk.common,
+	&de_clk.common,
+	&di_clk.common,
+	&g2d_clk.common,
+	&gpu_clk.common,
+	&ve_clk.common,
+	&iommu_clk.common,
+	&hdmi_24M_clk.common,
+	&hdmi_cec_32k_clk.common,
+	&hdmi_cec_clk.common,
+	&mipi_dsi0_clk.common,
+	&mipi_dsi1_clk.common,
+	&tcon_lcd0_clk.common,
+	&tcon_lcd1_clk.common,
+	&tcon_lcd2_clk.common,
+	&tcon_tv0_clk.common,
+	&tcon_tv1_clk.common,
+	&edp_clk.common,
 };
 
 static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
@@ -420,6 +639,7 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
 		[CLK_PLL_PERIPH1_200M]	= &pll_periph1_200M_clk.hw,
 		[CLK_PLL_PERIPH1_160M]	= &pll_periph1_160M_clk.hw,
 		[CLK_PLL_PERIPH1_150M]	= &pll_periph1_150M_clk.hw,
+		[CLK_PLL_GPU]		= &pll_gpu_clk.common.hw,
 		[CLK_PLL_VIDEO0_8X]	= &pll_video0_8x_clk.common.hw,
 		[CLK_PLL_VIDEO0_4X]	= &pll_video0_4x_clk.common.hw,
 		[CLK_PLL_VIDEO0_3X]	= &pll_video0_3x_clk.hw,
@@ -442,6 +662,24 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
 		[CLK_AHB]		= &ahb_clk.common.hw,
 		[CLK_APB0]		= &apb0_clk.common.hw,
 		[CLK_APB1]		= &apb1_clk.common.hw,
+		[CLK_DE]		= &de_clk.common.hw,
+		[CLK_DI]		= &di_clk.common.hw,
+		[CLK_G2D]		= &g2d_clk.common.hw,
+		[CLK_GPU]		= &gpu_clk.common.hw,
+		[CLK_VE]		= &ve_clk.common.hw,
+		[CLK_HDMI_24M]		= &hdmi_24M_clk.common.hw,
+		[CLK_HDMI_CEC_32K]	= &hdmi_cec_32k_clk.common.hw,
+		[CLK_HDMI_CEC]		= &hdmi_cec_clk.common.hw,
+		[CLK_MIPI_DSI0]		= &mipi_dsi0_clk.common.hw,
+		[CLK_MIPI_DSI1]		= &mipi_dsi1_clk.common.hw,
+		[CLK_TCON_LCD0]		= &tcon_lcd0_clk.common.hw,
+		[CLK_TCON_LCD1]		= &tcon_lcd1_clk.common.hw,
+		[CLK_TCON_LCD2]		= &tcon_lcd2_clk.common.hw,
+		[CLK_COMBOPHY_DSI0]	= &combophy_dsi0_clk.common.hw,
+		[CLK_COMBOPHY_DSI1]	= &combophy_dsi1_clk.common.hw,
+		[CLK_TCON_TV0]		= &tcon_tv0_clk.common.hw,
+		[CLK_TCON_TV1]		= &tcon_tv1_clk.common.hw,
+		[CLK_EDP]		= &edp_clk.common.hw,
 	},
 };
 
-- 
2.46.3


