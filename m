Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642DBD41D40
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 00:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6fc3EGXfegM5Gl9ET7OjeUwedmwB+zaVDFPfCkGZso=; b=fB7E+xCUjamZXo27eCCqvE9wuj
	/5US2rxNf7wbCLc6upDSGdXTl/MWvBH8sCWpOY8XhoHGtCkj48e3kjtnwcWpgzlYu/bio3wAy8Nds
	hocir2Fu8K1WtwhAHrb/2i9brbBysZwGgRNFdx6flHkxn87ZTWH1IySnpGWMpqhBcANEa71y9dp4E
	ces7GcqLIHnwuCBQxHU/GVNOhhbIkYqfUPyN4vRAxylADEG4U45gv2J+J/KKV5Dz9+bkIys2MzB/h
	AQvurJ9f/XQamusxJZzgxvEyyyHUVXBiAizOQ4FADtu7EpZvAtRI3vpDCNDwPLOtvqpDNo+LFLyFU
	siXwv61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAec7-00000001iuQ-3Bqm;
	Tue, 12 Nov 2024 00:18:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeTY-00000001haw-16nj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 00:09:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 554815C5E15;
	Tue, 12 Nov 2024 00:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BC4C4CECF;
	Tue, 12 Nov 2024 00:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731370183;
	bh=+wNaAMYromdcohDAezTNDP7dAaqSxh5Qc6S+kfA9zok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aD4mRna3ugPKQWM4cOYBiWxmDjX8BBgEW3HwVF0euRUOzCg+b1GAAbaHZE3Y0o+k9
	 JnNOHrLfmGtIEMYwwqTtlZnEJLgaT4yftDzmVSZx24luoTKag42NJvoqcJd78byrAa
	 8jHx/cqfb15RX8atqTbCVGK3poX1q6W4aG55VvSOYBt4tV9L3BAEe+LRcnezeRbXAy
	 zYzD/rBRFFX+NhJINS4s5kcA24/R3RF0lWGweVNt0XPN6ZSmLKhB+wmUJOesYox+kH
	 JFB/AfciI47J5VSOewVU657plCOvGYMWscYd2TwmyE1J7u/M0Zqbngv5SfixE94Bns
	 1UJ79QHI3ZuwQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 12 Nov 2024 01:08:51 +0100
Subject: [PATCH RESEND v2 4/7] clk: en7523: introduce chip_scu regmap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-clk-en7581-syscon-v2-4-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
In-Reply-To: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, 
 ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_160944_427391_1A8ACB8E 
X-CRM114-Status: GOOD (  16.06  )
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

Introduce chip_scu regmap pointer since EN7581 SoC will access chip-scu
memory area via a syscon node. Remove first memory region mapping
for EN7581 SoC. This patch does not introduce any backward incompatibility
since the dts for EN7581 SoC is not upstream yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 81 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index da112c9fe8ef94e830449a64f54e77885b7dda83..7f83cbce01eeb852597d3f0bea11255aa78572c1 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -3,8 +3,10 @@
 #include <linux/delay.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
@@ -247,15 +249,11 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
 };
 
-static unsigned int en7523_get_base_rate(void __iomem *base, unsigned int i)
+static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
 {
-	const struct en_clk_desc *desc = &en7523_base_clks[i];
-	u32 val;
-
 	if (!desc->base_bits)
 		return desc->base_value;
 
-	val = readl(base + desc->base_reg);
 	val >>= desc->base_shift;
 	val &= (1 << desc->base_bits) - 1;
 
@@ -265,16 +263,11 @@ static unsigned int en7523_get_base_rate(void __iomem *base, unsigned int i)
 	return desc->base_values[val];
 }
 
-static u32 en7523_get_div(void __iomem *base, int i)
+static u32 en7523_get_div(const struct en_clk_desc *desc, u32 val)
 {
-	const struct en_clk_desc *desc = &en7523_base_clks[i];
-	u32 reg, val;
-
 	if (!desc->div_bits)
 		return 1;
 
-	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
-	val = readl(base + reg);
 	val >>= desc->div_shift;
 	val &= (1 << desc->div_bits) - 1;
 
@@ -416,9 +409,12 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 
 	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
 		const struct en_clk_desc *desc = &en7523_base_clks[i];
+		u32 reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+		u32 val = readl(base + desc->base_reg);
 
-		rate = en7523_get_base_rate(base, i);
-		rate /= en7523_get_div(base, i);
+		rate = en7523_get_base_rate(desc, val);
+		val = readl(base + reg);
+		rate /= en7523_get_div(desc, val);
 
 		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
@@ -454,21 +450,66 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 	return 0;
 }
 
+static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
+				   struct regmap *map, void __iomem *base)
+{
+	struct clk_hw *hw;
+	u32 rate;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
+		const struct en_clk_desc *desc = &en7523_base_clks[i];
+		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+		int err;
+
+		err = regmap_read(map, desc->base_reg, &val);
+		if (err) {
+			pr_err("Failed reading fixed clk rate %s: %d\n",
+			       desc->name, err);
+			continue;
+		}
+		rate = en7523_get_base_rate(desc, val);
+
+		err = regmap_read(map, reg, &val);
+		if (err) {
+			pr_err("Failed reading fixed clk div %s: %d\n",
+			       desc->name, err);
+			continue;
+		}
+		rate /= en7523_get_div(desc, val);
+
+		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register clk %s: %ld\n",
+			       desc->name, PTR_ERR(hw));
+			continue;
+		}
+
+		clk_data->hws[desc->id] = hw;
+	}
+
+	hw = en7523_register_pcie_clk(dev, base);
+	clk_data->hws[EN7523_CLK_PCIE] = hw;
+
+	clk_data->num = EN7523_NUM_CLOCKS;
+}
+
 static int en7581_clk_hw_init(struct platform_device *pdev,
 			      struct clk_hw_onecell_data *clk_data)
 {
-	void __iomem *base, *np_base;
+	void __iomem *np_base;
+	struct regmap *map;
 	u32 val;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
 
-	np_base = devm_platform_ioremap_resource(pdev, 1);
+	np_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(np_base))
 		return PTR_ERR(np_base);
 
-	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
+	en7581_register_clocks(&pdev->dev, clk_data, map, np_base);
 
 	val = readl(np_base + REG_NP_SCU_SSTR);
 	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
@@ -545,7 +586,7 @@ static int en7523_reset_register(struct platform_device *pdev,
 	if (!soc_data->reset.idx_map_nr)
 		return 0;
 
-	base = devm_platform_ioremap_resource(pdev, 2);
+	base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 

-- 
2.47.0


