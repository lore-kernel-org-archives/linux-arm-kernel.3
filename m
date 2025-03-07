Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C54C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWhhaEnpyle1vAdZ8fq1wymfc1LLibwshQVGVimj/aY=; b=AV9B4ZcGZojFexFhrQF/nABwR7
	WglLiDm4EvIP42Fqte5dOnx4qGLEV4nhuojvwTt7FcwUXKsZnk903ZOIymgxVMeDhHo8bOJ1Yn2jY
	61K79B5+mLrDqau3h2kzGENj8+h4HfCIC6Ls0OXshMRbFHRXcLK7nieFQI1XyGIE907LgMmKZB0/R
	fViF8LHqy6Pa7b1L8ANYEX0z2e8ME/EZn/bxUGnUyffbIWCwH9xrcHuB7HXM58TAlNfr4VDj4yZ7M
	EWQMWoWgQ/RxReOl0wRjLRdmbkCv+J4e6OpWJPrw94Q8byiyYZWTjWt3LE9mCtRfzr33CdP7E3WHA
	s8JI8OLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLuI-0000000CgQc-004r;
	Fri, 07 Mar 2025 00:49:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLYN-0000000CdCR-0qJg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:27:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F3D91BC0;
	Thu,  6 Mar 2025 16:27:15 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3D683F673;
	Thu,  6 Mar 2025 16:27:00 -0800 (PST)
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
Subject: [PATCH v4 13/14] clk: sunxi-ng: a523: add reset lines
Date: Fri,  7 Mar 2025 00:26:27 +0000
Message-ID: <20250307002628.10684-14-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307002628.10684-1-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_162703_329862_1D2C7B76 
X-CRM114-Status: GOOD (  11.73  )
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

Allwinner SoCs do not contain a separate reset controller, instead the
reset lines for the various devices are integrated into the "BGR" (Bus
Gate / Reset) registers, for each device group: one for all UARTs, one
for all SPI interfaces, and so on.
The Allwinner CCU driver also doubles as a reset provider, and since the
reset lines are indeed just single bits in those BGR register, we can
represent them easily in an array of structs, just containing the
register offset and the bit number.

Add the location of the reset bits for all devices in the A523/T527
SoCs, using the existing sunxi CCU infrastructure.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 84 ++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 736544f6a1415..9efb9fd24b424 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -1526,11 +1526,95 @@ static struct clk_hw_onecell_data sun55i_a523_hw_clks = {
 	},
 };
 
+static struct ccu_reset_map sun55i_a523_ccu_resets[] = {
+	[RST_MBUS]		= { 0x540, BIT(30) },
+	[RST_BUS_NSI]		= { 0x54c, BIT(16) },
+	[RST_BUS_DE]		= { 0x60c, BIT(16) },
+	[RST_BUS_DI]		= { 0x62c, BIT(16) },
+	[RST_BUS_G2D]		= { 0x63c, BIT(16) },
+	[RST_BUS_SYS]		= { 0x64c, BIT(16) },
+	[RST_BUS_GPU]		= { 0x67c, BIT(16) },
+	[RST_BUS_CE]		= { 0x68c, BIT(16) },
+	[RST_BUS_SYS_CE]	= { 0x68c, BIT(17) },
+	[RST_BUS_VE]		= { 0x69c, BIT(16) },
+	[RST_BUS_DMA]		= { 0x70c, BIT(16) },
+	[RST_BUS_MSGBOX]	= { 0x71c, BIT(16) },
+	[RST_BUS_SPINLOCK]	= { 0x72c, BIT(16) },
+	[RST_BUS_CPUXTIMER]	= { 0x74c, BIT(16) },
+	[RST_BUS_DBG]		= { 0x78c, BIT(16) },
+	[RST_BUS_PWM0]		= { 0x7ac, BIT(16) },
+	[RST_BUS_PWM1]		= { 0x7ac, BIT(17) },
+	[RST_BUS_DRAM]		= { 0x80c, BIT(16) },
+	[RST_BUS_NAND]		= { 0x82c, BIT(16) },
+	[RST_BUS_MMC0]		= { 0x84c, BIT(16) },
+	[RST_BUS_MMC1]		= { 0x84c, BIT(17) },
+	[RST_BUS_MMC2]		= { 0x84c, BIT(18) },
+	[RST_BUS_SYSDAP]	= { 0x88c, BIT(16) },
+	[RST_BUS_UART0]		= { 0x90c, BIT(16) },
+	[RST_BUS_UART1]		= { 0x90c, BIT(17) },
+	[RST_BUS_UART2]		= { 0x90c, BIT(18) },
+	[RST_BUS_UART3]		= { 0x90c, BIT(19) },
+	[RST_BUS_UART4]		= { 0x90c, BIT(20) },
+	[RST_BUS_UART5]		= { 0x90c, BIT(21) },
+	[RST_BUS_UART6]		= { 0x90c, BIT(22) },
+	[RST_BUS_UART7]		= { 0x90c, BIT(23) },
+	[RST_BUS_I2C0]		= { 0x91c, BIT(16) },
+	[RST_BUS_I2C1]		= { 0x91c, BIT(17) },
+	[RST_BUS_I2C2]		= { 0x91c, BIT(18) },
+	[RST_BUS_I2C3]		= { 0x91c, BIT(19) },
+	[RST_BUS_I2C4]		= { 0x91c, BIT(20) },
+	[RST_BUS_I2C5]		= { 0x91c, BIT(21) },
+	[RST_BUS_CAN]		= { 0x92c, BIT(16) },
+	[RST_BUS_SPI0]		= { 0x96c, BIT(16) },
+	[RST_BUS_SPI1]		= { 0x96c, BIT(17) },
+	[RST_BUS_SPI2]		= { 0x96c, BIT(18) },
+	[RST_BUS_SPIFC]		= { 0x96c, BIT(19) },
+	[RST_BUS_EMAC0]		= { 0x97c, BIT(16) },
+	[RST_BUS_EMAC1]		= { 0x98c, BIT(16) | BIT(17) },	/* GMAC1-AXI */
+	[RST_BUS_IR_RX]		= { 0x99c, BIT(16) },
+	[RST_BUS_IR_TX]		= { 0x9cc, BIT(16) },
+	[RST_BUS_GPADC0]	= { 0x9ec, BIT(16) },
+	[RST_BUS_GPADC1]	= { 0x9ec, BIT(17) },
+	[RST_BUS_THS]		= { 0x9fc, BIT(16) },
+	[RST_USB_PHY0]		= { 0xa70, BIT(30) },
+	[RST_USB_PHY1]		= { 0xa74, BIT(30) },
+	[RST_BUS_OHCI0]		= { 0xa8c, BIT(16) },
+	[RST_BUS_OHCI1]		= { 0xa8c, BIT(17) },
+	[RST_BUS_EHCI0]		= { 0xa8c, BIT(20) },
+	[RST_BUS_EHCI1]		= { 0xa8c, BIT(21) },
+	[RST_BUS_OTG]		= { 0xa8c, BIT(24) },
+	[RST_BUS_3]		= { 0xa8c, BIT(25) },	/* BSP + register */
+	[RST_BUS_LRADC]		= { 0xa9c, BIT(16) },
+	[RST_BUS_PCIE_USB3]	= { 0xaac, BIT(16) },
+	[RST_BUS_DISPLAY0_TOP]	= { 0xabc, BIT(16) },
+	[RST_BUS_DISPLAY1_TOP]	= { 0xacc, BIT(16) },
+	[RST_BUS_HDMI_MAIN]	= { 0xb1c, BIT(16) },
+	[RST_BUS_HDMI_SUB]	= { 0xb1c, BIT(17) },
+	[RST_BUS_MIPI_DSI0]	= { 0xb4c, BIT(16) },
+	[RST_BUS_MIPI_DSI1]	= { 0xb4c, BIT(17) },
+	[RST_BUS_TCON_LCD0]	= { 0xb7c, BIT(16) },
+	[RST_BUS_TCON_LCD1]	= { 0xb7c, BIT(17) },
+	[RST_BUS_TCON_LCD2]	= { 0xb7c, BIT(18) },
+	[RST_BUS_TCON_TV0]	= { 0xb9c, BIT(16) },
+	[RST_BUS_TCON_TV1]	= { 0xb9c, BIT(17) },
+	[RST_BUS_LVDS0]		= { 0xbac, BIT(16) },
+	[RST_BUS_LVDS1]		= { 0xbac, BIT(17) },
+	[RST_BUS_EDP]		= { 0xbbc, BIT(16) },
+	[RST_BUS_VIDEO_OUT0]	= { 0xbcc, BIT(16) },
+	[RST_BUS_VIDEO_OUT1]	= { 0xbcc, BIT(17) },
+	[RST_BUS_LEDC]		= { 0xbfc, BIT(16) },
+	[RST_BUS_CSI]		= { 0xc1c, BIT(16) },
+	[RST_BUS_ISP]		= { 0xc2c, BIT(16) },	/* BSP + register */
+};
+
 static const struct sunxi_ccu_desc sun55i_a523_ccu_desc = {
 	.ccu_clks	= sun55i_a523_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun55i_a523_ccu_clks),
 
 	.hw_clks	= &sun55i_a523_hw_clks,
+
+	.resets		= sun55i_a523_ccu_resets,
+	.num_resets	= ARRAY_SIZE(sun55i_a523_ccu_resets),
 };
 
 static const u32 pll_regs[] = {
-- 
2.46.3


