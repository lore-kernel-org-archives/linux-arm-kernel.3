Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40081C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRnnT//T4YwhR6wGUyS5EPCPL2d0a1t+uJ9dg+ssPmA=; b=ndbRd93EtnW+7vwgeQljnPE1ZU
	spzIYlFGt/2Z7paKe7PSZuHg+h+FZqnvFaYSn0ZrK2EWDDd6JSNy3O2frMldx4jlT8enowxr5/3ct
	gGS3JSnl5Tf9GHeUvvUXSYZ3UR9REhbhojUiGNEkp0hPV5HAB/EDjtFX6J6mA7F+J75jk4t+iPx+/
	rDXHQCKzK9donahl1uCwPmCVAk+z52jnjjtXEQsIGKtUnumqY6rFSKhDv0JfcCP7Bvz5a55E+AjXK
	VAZrwvGJFydqBhK9ss96fGCvF3JCyzHSTrTPDlMzFrARJGlY9RZfhTWBNPmdtHyXDG9QXySD6xzzw
	4ppVJeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowr-0000000EYHh-44i1;
	Thu, 12 Jun 2025 20:54:57 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjhu-0000000Dl6g-2Kkr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:19:11 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5835E25DB0;
	Thu, 12 Jun 2025 17:19:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kMzdi55nzo78; Thu, 12 Jun 2025 17:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741547; bh=DtgL5cONrrLs8Uf/WS1yZpcpZJT1lQIo6Xea/pN2b24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gouDZNGUg6l6iHsyLZQ4IrcicTgJ/GdGtMsSBtVWxBhqfuA6FYFARs+GAbS5V0vDq
	 Wyq9Pd6eJXzS2iHtqT/RssZJUPw7IMJQB+8kpqeztmH9trVEROUOBIsc0wi+mS63vN
	 tJOoIS10rEOt9pVUPLZQXAywuLSojLvlThomWJ0ERvjvCyQgzzbs5dy/dbsBGFXNyv
	 O5mrw4pOuEhk2egL74tmYJ0XrRi90Ak0rti9fiF1E27DmSZfU/9ruhLR1W5xD+I3aj
	 arh/7z3cqdlg/Ll8JK+VZtHZFubWRUv0zGgFIxfPgNOpygfs76kS+7FE3jOGkg9drz
	 Td61+Q3i++tEw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:08 +0530
Subject: [PATCH 04/12] drm/bridge: samsung-dsim: allow configuring bits and
 offsets of CLKCTRL register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-4-1a330bca89df@disroot.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
In-Reply-To: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=7642;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=DtgL5cONrrLs8Uf/WS1yZpcpZJT1lQIo6Xea/pN2b24=;
 b=CUFjZAYl8NnIwgUsGvdbp3viDqOgwe0cQIR+E9IwpnVDwBzp80xeJmlqg3WI75WDXyRL7JD+6
 JlW16mgkylACaWsBTd9jNFN1Q4Wj1b6Ana3uRvnUt1LnX3uGMOSP549
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_081910_866230_F558C3FB 
X-CRM114-Status: GOOD (  15.06  )
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
index 356c949aaa030a2ecc39beb43ae8608c1e6af828..dbd30b2a10c3c0abf49117db7ebc9a47ff0ea08a 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -44,17 +44,13 @@
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
@@ -419,6 +415,11 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
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
@@ -439,6 +440,11 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
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
@@ -457,6 +463,11 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
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
@@ -475,6 +486,11 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
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
@@ -493,6 +509,11 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
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
@@ -511,6 +532,11 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
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
@@ -714,6 +740,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
 {
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	unsigned long hs_clk, byte_clk, esc_clk, pix_clk;
 	unsigned long esc_div;
 	u32 reg;
@@ -747,15 +774,17 @@ static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
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
@@ -859,11 +888,14 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
 
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
index 3641c57557f42fd90cd2e8c0282f69dbe36ba2de..8938eccf78730019e0404101c855dc2d7d225668 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -63,6 +63,11 @@ struct samsung_dsim_driver_data {
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


