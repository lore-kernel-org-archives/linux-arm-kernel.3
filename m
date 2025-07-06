Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C30C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 18:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qTV1cyWpX6lZ2Ag8VpeEMPxu+/OV4+3OTo4m5d14FY=; b=QLJ2lHypGXoj3WSU72fHQZmYeI
	GAsQwm3Xc8FW4EKKLa/jQtDmVOMuuC2KxALF8XN994SNNk2vDxoMrJpBHyN8kFzc3UiCdTvJNV/GC
	2Iv5TsdjOJydl0RgDMyPV3TKeB/XxBK9DYuwhzcGVD3ZeTRB/VlEBsQleUgUh2yA4RxPV1xkadlis
	2SNiiF5MVx3GQDyolZHKvgswqaHJD8l4ok+zXyuYAx7n0nlu6qbtkoIPt9MIs/1Agtx/TUfjFbIto
	OX9sUI3kh1KS8H1TnPtdiMVoKSm0UECeebiMvGel1G0SYoRpv1VqzYXuCpreMMgq+dzbwkWtdqlJq
	tjmuIEEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUFV-00000000ee4-3NzM;
	Sun, 06 Jul 2025 18:38:01 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYU4Q-00000000czC-49G6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:26:36 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B3B6B20D0D;
	Sun,  6 Jul 2025 20:26:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDJ92r2bbDG9; Sun,  6 Jul 2025 20:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826391; bh=sezB2gCswpH+5X4wtjHO7EgIJxpR2I20H2UdxlxKbhw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JtSlV/smLZG2bl5+B7mmihBHGo3+fJ9roKgh7SAbzQg+sTIr2YJF6tsTg+wKIxKCQ
	 LFxpjF/QmnhMX9RulB5av6iNruuGqHsWq2OqJXD/DorxmY5hdID7qQGC7ydWPSY7iX
	 hv6ZHHJ3FXWNCi4mPv9x2rqI4xL566kxQYEgiKhfijwcfu2Q0NYkhtTiMIHHLM/xKZ
	 yTJdcU1InI+wfvWlRTfoZii2pvhSlYmgysfdcrocoEQUc0JcJp1QVQ9BoJxk8LX7CS
	 lbMldvVv4PYw7gDZVHZ36dj3r5kXHtWxovEAPaH+ERaohRJVcatNSq51+1F0gN68V/
	 rfuw8fEdMLYkw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:38 +0530
Subject: [PATCH v3 04/13] drm/bridge: samsung-dsim: allow configuring bits
 and offsets of CLKCTRL register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-4-9879fb9a644d@disroot.org>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=7642;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=sezB2gCswpH+5X4wtjHO7EgIJxpR2I20H2UdxlxKbhw=;
 b=YSDbnyRo0JWyo+i/N5TLD3qZDifxZYYJqAWtDasZwYC0zVYKDFJ+rxo+zzpzNstU1wyCrIZaL
 h0toq+NKBccCePdEUeFSlzI9StbtFd9Fxn4PqVCrreNGnRPj9g4gFhb
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_112635_295716_3D6497A7 
X-CRM114-Status: GOOD (  15.82  )
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

DSIM_CLKCTRL bit and offset values hardcoded in the driver:

name                      | bit/offset value
--------------------------+-----------------
DSIM_LANE_ESC_CLK_EN_CLK  | 19
DSIM_LANE_ESC_CLK_EN_DATA | 20
DSIM_BYTE_CLKEN           | 24
DSIM_ESC_CLKEN            | 28
DSIM_TX_REQUEST_HSCLK     | 31

DSIM_CLKCTRL bit and offset values in Exynos7870 DSIM as per downstream
kernel sources:

name                      | bit/offset value
--------------------------+-----------------
DSIM_LANE_ESC_CLK_EN_CLK  | 8
DSIM_LANE_ESC_CLK_EN_DATA | 9
DSIM_BYTE_CLKEN           | 17
DSIM_ESC_CLKEN            | 16
DSIM_TX_REQUEST_HSCLK     | 20

In order to support both, move all values to the driver data struct and
define it for every driver compatible. Reference the values from there
instead, in functions wherever required.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 76 +++++++++++++++++++++++++----------
 include/drm/bridge/samsung-dsim.h     |  5 +++
 2 files changed, 59 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 84af24171b6856cbcf95b9077b997ee587fc0409..199c7ace78bfeb01d3ef9a841fe9339c0fb9f478 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -46,17 +46,13 @@
 #define DSIM_BTA_TIMEOUT(x)		((x) << 16)
 
 /* DSIM_CLKCTRL */
-#define DSIM_ESC_PRESCALER(x)		(((x) & 0xffff) << 0)
-#define DSIM_ESC_PRESCALER_MASK		(0xffff << 0)
-#define DSIM_LANE_ESC_CLK_EN_CLK	BIT(19)
-#define DSIM_LANE_ESC_CLK_EN_DATA(x)	(((x) & 0xf) << 20)
-#define DSIM_LANE_ESC_CLK_EN_DATA_MASK	(0xf << 20)
-#define DSIM_BYTE_CLKEN			BIT(24)
-#define DSIM_BYTE_CLK_SRC(x)		(((x) & 0x3) << 25)
-#define DSIM_BYTE_CLK_SRC_MASK		(0x3 << 25)
-#define DSIM_PLL_BYPASS			BIT(27)
-#define DSIM_ESC_CLKEN			BIT(28)
-#define DSIM_TX_REQUEST_HSCLK		BIT(31)
+#define DSIM_ESC_PRESCALER(x)			(((x) & 0xffff) << 0)
+#define DSIM_ESC_PRESCALER_MASK			(0xffff << 0)
+#define DSIM_LANE_ESC_CLK_EN_DATA(x, offset)	(((x) & 0xf) << offset)
+#define DSIM_LANE_ESC_CLK_EN_DATA_MASK(offset)	(0xf << offset)
+#define DSIM_BYTE_CLK_SRC(x)			(((x) & 0x3) << 25)
+#define DSIM_BYTE_CLK_SRC_MASK			(0x3 << 25)
+#define DSIM_PLL_BYPASS				BIT(27)
 
 /* DSIM_CONFIG */
 #define DSIM_LANE_EN_CLK		BIT(0)
@@ -421,6 +417,11 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.esc_clken_bit = 28,
+	.byte_clken_bit = 24,
+	.tx_req_hsclk_bit = 31,
+	.lane_esc_clk_bit = 19,
+	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -442,6 +443,11 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.esc_clken_bit = 28,
+	.byte_clken_bit = 24,
+	.tx_req_hsclk_bit = 31,
+	.lane_esc_clk_bit = 19,
+	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -461,6 +467,11 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.esc_clken_bit = 28,
+	.byte_clken_bit = 24,
+	.tx_req_hsclk_bit = 31,
+	.lane_esc_clk_bit = 19,
+	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -480,6 +491,11 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.esc_clken_bit = 28,
+	.byte_clken_bit = 24,
+	.tx_req_hsclk_bit = 31,
+	.lane_esc_clk_bit = 19,
+	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
 	.pll_fin_min = 6,
@@ -499,6 +515,11 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.esc_clken_bit = 28,
+	.byte_clken_bit = 24,
+	.tx_req_hsclk_bit = 31,
+	.lane_esc_clk_bit = 19,
+	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
 	.pll_fin_min = 6,
@@ -518,6 +539,11 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.esc_clken_bit = 28,
+	.byte_clken_bit = 24,
+	.tx_req_hsclk_bit = 31,
+	.lane_esc_clk_bit = 19,
+	.lane_esc_data_offset = 20,
 	/*
 	 * Unlike Exynos, PLL_P(PMS_P) offset 14 is used in i.MX8M Mini/Nano/Plus
 	 * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
@@ -721,6 +747,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
 {
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	unsigned long hs_clk, byte_clk, esc_clk, pix_clk;
 	unsigned long esc_div;
 	u32 reg;
@@ -754,15 +781,17 @@ static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
 		hs_clk, byte_clk, esc_clk);
 
 	reg = samsung_dsim_read(dsi, DSIM_CLKCTRL_REG);
-	reg &= ~(DSIM_ESC_PRESCALER_MASK | DSIM_LANE_ESC_CLK_EN_CLK
-			| DSIM_LANE_ESC_CLK_EN_DATA_MASK | DSIM_PLL_BYPASS
-			| DSIM_BYTE_CLK_SRC_MASK);
-	reg |= DSIM_ESC_CLKEN | DSIM_BYTE_CLKEN
-			| DSIM_ESC_PRESCALER(esc_div)
-			| DSIM_LANE_ESC_CLK_EN_CLK
-			| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1)
-			| DSIM_BYTE_CLK_SRC(0)
-			| DSIM_TX_REQUEST_HSCLK;
+	reg &= ~(DSIM_ESC_PRESCALER_MASK | BIT(driver_data->lane_esc_clk_bit)
+		| DSIM_LANE_ESC_CLK_EN_DATA_MASK(driver_data->lane_esc_data_offset)
+		| DSIM_PLL_BYPASS
+		| DSIM_BYTE_CLK_SRC_MASK);
+	reg |= BIT(driver_data->esc_clken_bit) | BIT(driver_data->byte_clken_bit)
+		| DSIM_ESC_PRESCALER(esc_div)
+		| BIT(driver_data->lane_esc_clk_bit)
+		| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1,
+					    driver_data->lane_esc_data_offset)
+		| DSIM_BYTE_CLK_SRC(0)
+		| BIT(driver_data->tx_req_hsclk_bit);
 	samsung_dsim_write(dsi, DSIM_CLKCTRL_REG, reg);
 
 	return 0;
@@ -866,11 +895,14 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 
 static void samsung_dsim_disable_clock(struct samsung_dsim *dsi)
 {
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	u32 reg;
 
 	reg = samsung_dsim_read(dsi, DSIM_CLKCTRL_REG);
-	reg &= ~(DSIM_LANE_ESC_CLK_EN_CLK | DSIM_LANE_ESC_CLK_EN_DATA_MASK
-			| DSIM_ESC_CLKEN | DSIM_BYTE_CLKEN);
+	reg &= ~(BIT(driver_data->lane_esc_clk_bit)
+		| DSIM_LANE_ESC_CLK_EN_DATA_MASK(driver_data->lane_esc_data_offset)
+		| BIT(driver_data->esc_clken_bit)
+		| BIT(driver_data->byte_clken_bit));
 	samsung_dsim_write(dsi, DSIM_CLKCTRL_REG, reg);
 
 	reg = samsung_dsim_read(dsi, DSIM_PLLCTRL_REG);
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 62c07952bd00f9c2c287a6a998f0e243dd4032a9..b1e64c7f993189879d9549f147f7eebdf3b7ded4 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -64,6 +64,11 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_hdr_fifo;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int esc_clken_bit;
+	unsigned int byte_clken_bit;
+	unsigned int tx_req_hsclk_bit;
+	unsigned int lane_esc_clk_bit;
+	unsigned int lane_esc_data_offset;
 	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
 	unsigned int pll_fin_min;

-- 
2.49.0


