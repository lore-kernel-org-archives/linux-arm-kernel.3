Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09700C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 18:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9Kh9l3YF1FAtGMD1cqxpT6/dGRNv6OrsREqpoQKAgI=; b=YwaLXNQBQnbsGw68qOd4M5wZuK
	kdKyjJ5m5+O1QeKqW6GEJdL2dbOCzRBKH7knhI/l50joAeBs/wcsgT/YuI8u93fFuhbZbO62vktz/
	A3XgKQzxvpR2RwXL6L+sXvOq0ZSMHSE2ygWaGQGFx0019+/4YDb+gFmq3t6U+U1sYxkMnVC8aF2Ji
	rpvPRYJfiDMyWjt1mIPyWyVQKyQ1yPXrIrJVSaj0zjr+/DDQDoyrCZuYMyfar4O3MGj5OWaqNE0nn
	hv05+5UvwuaqWqa6I4M2hbaat3kSOU7DM3vNAH9I9wVaiUDB40dknuM9VrzroHB776lQDtQxLqQWO
	cgeDXc3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUTP-00000000gAc-3Aaa;
	Sun, 06 Jul 2025 18:52:23 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYU5c-00000000dKN-0PwH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:27:49 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E01EA25B63;
	Sun,  6 Jul 2025 20:27:46 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fW7Epcihj-kx; Sun,  6 Jul 2025 20:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826465; bh=uRAQPW/XAX0Tqz1bC3rL04fGoa2FbtZRBUYo1jwG2sk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ikDWFnrRp9CZp9CSxDIqSl8wrdd+p32unXN9XSr8Hs2/+BERwhUU2Y6HgqNac+xIS
	 GDG/SCVXCSgD85Pk2MTE189VpvDyB84h5F1dbz9AOdG79RuLVD+AIWAEkAzYKO5XqV
	 xB3z6brS7GfJ+iG9uNpc7mhOgMeEt6Ta5wpcciTdfakr0T+FGg5PgWTpX99xzrX7oS
	 PHafCYawRI/UvYzDfryfbFfmmvEXwMd1p6SryHNyD/BEdFsWPVsaz5JeezTsLOkEwW
	 J9xCjL31xshQ8nh6Hcjmr25b4GM+nfV2SD5SJ/01HBD9lcHuE+V+DpVnfRqla9NGQU
	 2i1RZiv8/cc3A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:44 +0530
Subject: [PATCH v3 10/13] drm/bridge: samsung-dsim: add ability to define
 clock names for every variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-10-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=8008;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=uRAQPW/XAX0Tqz1bC3rL04fGoa2FbtZRBUYo1jwG2sk=;
 b=qlKkcdPw+G+E3adxMetLXhT8Xm4F1vFtKcC0Migri0bTuR/EVz9jrKq0lOz87UCkFevXsE0PS
 NVtebD/ujinAdhvjwvA114/bcoRI0Se6tGZQ7/N670vgO1pn60p5d63
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_112748_422185_B24D8D47 
X-CRM114-Status: GOOD (  22.88  )
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

Presently, all devices refer to clock names from a single array. The
only controlling parameter is the number of clocks (num_clks field of
samsung_dsim_driver_data) which uses the first n clocks of that array.
As new devices are added, this approach turns out to be cumbersome.

Separate the clock names in individual arrays required by each variant,
in a struct clk_bulk_data. Add a pointer field to the driver data struct
which points to their respective clock names, and rework the clock usage
code to use the clk_bulk_* API instead.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 88 +++++++++++++++++------------------
 include/drm/bridge/samsung-dsim.h     |  2 +-
 2 files changed, 44 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 4b49707730db76aa8fd3ab973b02507436750889..b6b3bbcbd0f438e5e1d3faf18f8c2d532a4ecc93 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -219,23 +219,31 @@
 #define DSI_XFER_TIMEOUT_MS		100
 #define DSI_RX_FIFO_EMPTY		0x30800002
 
-#define OLD_SCLK_MIPI_CLK_NAME		"pll_clk"
-
 #define PS_TO_CYCLE(ps, hz) DIV64_U64_ROUND_CLOSEST(((ps) * (hz)), 1000000000000ULL)
 
-static const char *const clk_names[5] = {
-	"bus_clk",
-	"sclk_mipi",
-	"phyclk_mipidphy0_bitclkdiv8",
-	"phyclk_mipidphy0_rxclkesc0",
-	"sclk_rgb_vclk_to_dsim0"
-};
-
 enum samsung_dsim_transfer_type {
 	EXYNOS_DSI_TX,
 	EXYNOS_DSI_RX,
 };
 
+static struct clk_bulk_data exynos3_clk_bulk_data[] = {
+	{ .id = "bus_clk" },
+	{ .id = "pll_clk" },
+};
+
+static struct clk_bulk_data exynos4_clk_bulk_data[] = {
+	{ .id = "bus_clk" },
+	{ .id = "sclk_mipi" },
+};
+
+static struct clk_bulk_data exynos5433_clk_bulk_data[] = {
+	{ .id = "bus_clk" },
+	{ .id = "sclk_mipi" },
+	{ .id = "phyclk_mipidphy0_bitclkdiv8" },
+	{ .id = "phyclk_mipidphy0_rxclkesc0" },
+	{ .id = "sclk_rgb_vclk_to_dsim0" },
+};
+
 enum reg_idx {
 	DSIM_STATUS_REG,	/* Status register (legacy) */
 	DSIM_LINK_STATUS_REG,	/* Link status register */
@@ -408,7 +416,8 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.has_legacy_status_reg = 1,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
-	.num_clks = 2,
+	.clk_data = exynos3_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos3_clk_bulk_data),
 	.max_freq = 1000,
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
@@ -439,7 +448,8 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.has_legacy_status_reg = 1,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
-	.num_clks = 2,
+	.clk_data = exynos4_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos4_clk_bulk_data),
 	.max_freq = 1000,
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
@@ -468,7 +478,8 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x58,
 	.has_legacy_status_reg = 1,
-	.num_clks = 2,
+	.clk_data = exynos3_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos3_clk_bulk_data),
 	.max_freq = 1000,
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
@@ -497,7 +508,8 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.plltmr_reg = 0xa0,
 	.has_legacy_status_reg = 1,
 	.has_clklane_stop = 1,
-	.num_clks = 5,
+	.clk_data = exynos5433_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos5433_clk_bulk_data),
 	.max_freq = 1500,
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
@@ -526,7 +538,8 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.plltmr_reg = 0xa0,
 	.has_legacy_status_reg = 1,
 	.has_clklane_stop = 1,
-	.num_clks = 2,
+	.clk_data = exynos3_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos3_clk_bulk_data),
 	.max_freq = 1500,
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
@@ -555,7 +568,8 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.plltmr_reg = 0xa0,
 	.has_legacy_status_reg = 1,
 	.has_clklane_stop = 1,
-	.num_clks = 2,
+	.clk_data = exynos4_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos4_clk_bulk_data),
 	.max_freq = 2100,
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
@@ -2021,7 +2035,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct samsung_dsim *dsi;
-	int ret, i;
+	int ret;
 
 	dsi = devm_drm_bridge_alloc(dev, struct samsung_dsim, bridge, &samsung_dsim_bridge_funcs);
 	if (IS_ERR(dsi))
@@ -2045,23 +2059,11 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
-	dsi->clks = devm_kcalloc(dev, dsi->driver_data->num_clks,
-				 sizeof(*dsi->clks), GFP_KERNEL);
-	if (!dsi->clks)
-		return -ENOMEM;
-
-	for (i = 0; i < dsi->driver_data->num_clks; i++) {
-		dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
-		if (IS_ERR(dsi->clks[i])) {
-			if (strcmp(clk_names[i], "sclk_mipi") == 0) {
-				dsi->clks[i] = devm_clk_get(dev, OLD_SCLK_MIPI_CLK_NAME);
-				if (!IS_ERR(dsi->clks[i]))
-					continue;
-			}
-
-			dev_info(dev, "failed to get the clock: %s\n", clk_names[i]);
-			return PTR_ERR(dsi->clks[i]);
-		}
+	ret = devm_clk_bulk_get(dev, dsi->driver_data->num_clks,
+				dsi->driver_data->clk_data);
+	if (ret) {
+		dev_err(dev, "failed to get clocks in bulk (%d)\n", ret);
+		return ret;
 	}
 
 	dsi->reg_base = devm_platform_ioremap_resource(pdev, 0);
@@ -2134,7 +2136,7 @@ static int samsung_dsim_suspend(struct device *dev)
 {
 	struct samsung_dsim *dsi = dev_get_drvdata(dev);
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
-	int ret, i;
+	int ret;
 
 	usleep_range(10000, 20000);
 
@@ -2150,8 +2152,7 @@ static int samsung_dsim_suspend(struct device *dev)
 
 	phy_power_off(dsi->phy);
 
-	for (i = driver_data->num_clks - 1; i > -1; i--)
-		clk_disable_unprepare(dsi->clks[i]);
+	clk_bulk_disable_unprepare(driver_data->num_clks, driver_data->clk_data);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
 	if (ret < 0)
@@ -2164,7 +2165,7 @@ static int samsung_dsim_resume(struct device *dev)
 {
 	struct samsung_dsim *dsi = dev_get_drvdata(dev);
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
-	int ret, i;
+	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
 	if (ret < 0) {
@@ -2172,11 +2173,9 @@ static int samsung_dsim_resume(struct device *dev)
 		return ret;
 	}
 
-	for (i = 0; i < driver_data->num_clks; i++) {
-		ret = clk_prepare_enable(dsi->clks[i]);
-		if (ret < 0)
-			goto err_clk;
-	}
+	ret = clk_bulk_prepare_enable(driver_data->num_clks, driver_data->clk_data);
+	if (ret < 0)
+		goto err_clk;
 
 	ret = phy_power_on(dsi->phy);
 	if (ret < 0) {
@@ -2187,8 +2186,7 @@ static int samsung_dsim_resume(struct device *dev)
 	return 0;
 
 err_clk:
-	while (--i > -1)
-		clk_disable_unprepare(dsi->clks[i]);
+	clk_bulk_disable_unprepare(driver_data->num_clks, driver_data->clk_data);
 	regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
 
 	return ret;
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 04ed11787bbd22503f7221cad1a491a4e5e66781..eb9fdbab1b34074923daa0aa0443c33c5b99ae42 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -58,6 +58,7 @@ struct samsung_dsim_driver_data {
 	unsigned int has_clklane_stop:1;
 	unsigned int has_broken_fifoctrl_emptyhdr:1;
 	unsigned int has_sfrctrl:1;
+	struct clk_bulk_data *clk_data;
 	unsigned int num_clks;
 	unsigned int min_freq;
 	unsigned int max_freq;
@@ -104,7 +105,6 @@ struct samsung_dsim {
 
 	void __iomem *reg_base;
 	struct phy *phy;
-	struct clk **clks;
 	struct clk *pll_clk;
 	struct regulator_bulk_data supplies[2];
 	int irq;

-- 
2.49.0


