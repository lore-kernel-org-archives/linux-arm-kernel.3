Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2751BD41D41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 00:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRXzqmgvT+RDAritng6JB0goXJ+Bsw0d1Ws0M+tu0xA=; b=fKM/RBStLRRRD/8gmRkM0bvEbm
	Ra+pCOxS7xvkd/YlEuheIL0sTWQlbL2LO82ox7YvqbXexsnP2hCJs5rz2Vv468TkT+0Tu8XJ/4kfC
	icBYtostQs3UmEAOERMLr5JJcwAm/iWfN1n/IDc5T5PPGy84B3faWv3XirruAPsiZEPCFB1ZTzsEb
	dorbRUSwn2sJtFjLqlO33XjutyTAGHGWH9EB8tmbenTeTpedIQUwKPvgBpYXe9w2tjyxeh3wT55UW
	9IZAp4oDXHH+Qk1U4XsfnC9GAbeWyC4Fm8JgbPXcrQ8y+6Z09e/mbfN+W0Vms0yReNp7eXqiIFqs4
	Xv+n05/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeaO-00000001iec-23TI;
	Tue, 12 Nov 2024 00:16:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeTV-00000001haa-2bBV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 00:09:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAC4E5C5DD5;
	Tue, 12 Nov 2024 00:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EEDC4CECF;
	Tue, 12 Nov 2024 00:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731370180;
	bh=BRj4TFuAIsBPXFqeCEeJxEejtdO/oVR1pEVWRHwQ8W4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uQ1QhQ2FV3rBfvsGw90nGHUz1Yz8LrX6jqwnaQw4zBDhPQ1UM1JnhcFyCvlzlH1IC
	 XyXV/6vMhTdEWgxoGzQ0wWC0cvYpy0OF8LjKKEp5+L2YYnNjxPiEAkmeWwN2bXSMWz
	 oRcDy2WMoQZFFIVArfbpLEY7G9BHEVNzO9UzxObg0BO1ZBI1keMMDwAwiwbsHj1Xtq
	 tN/5zBQR/56IABq1kdnRAbP3Jc0BqQ9BoGJ+iwn1B0WnoVPpaMdBRa2L44PY2LtD0C
	 +mSwGPj60J3CGjQH1vnlv8omw0cRYGpZjAdZicL2d8dnl26NkBqS0LqfmeLlJ0rzJW
	 t6De8EmHMLhcg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 12 Nov 2024 01:08:50 +0100
Subject: [PATCH RESEND v2 3/7] clk: en7523: move clock_register in hw_init
 callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-clk-en7581-syscon-v2-3-8ada5e394ae4@kernel.org>
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
X-CRM114-CacheID: sfid-20241111_160941_783341_BBB2C9E2 
X-CRM114-Status: GOOD (  15.23  )
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

Move en7523_register_clocks routine in hw_init callback.
Introduce en7523_clk_hw_init callback for EN7523 SoC.
This is a preliminary patch to differentiate IO mapped region between
EN7523 and EN7581 SoCs in order to access chip-scu IO region
<0x1fa20000 0x384> on EN7581 SoC as syscon device since it contains
miscellaneous registers needed by multiple devices (clock, pinctrl ..).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 82 +++++++++++++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index ec6716844fdcf7fc25482c6e587d062279360675..da112c9fe8ef94e830449a64f54e77885b7dda83 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -78,7 +78,8 @@ struct en_clk_soc_data {
 		const u16 *idx_map;
 		u16 idx_map_nr;
 	} reset;
-	int (*hw_init)(struct platform_device *pdev, void __iomem *np_base);
+	int (*hw_init)(struct platform_device *pdev,
+		       struct clk_hw_onecell_data *clk_data);
 };
 
 static const u32 gsw_base[] = { 400000000, 500000000 };
@@ -406,20 +407,6 @@ static void en7581_pci_disable(struct clk_hw *hw)
 	usleep_range(1000, 2000);
 }
 
-static int en7581_clk_hw_init(struct platform_device *pdev,
-			      void __iomem *np_base)
-{
-	u32 val;
-
-	val = readl(np_base + REG_NP_SCU_SSTR);
-	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
-	writel(val, np_base + REG_NP_SCU_SSTR);
-	val = readl(np_base + REG_NP_SCU_PCIC);
-	writel(val | 3, np_base + REG_NP_SCU_PCIC);
-
-	return 0;
-}
-
 static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   void __iomem *base, void __iomem *np_base)
 {
@@ -449,6 +436,49 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 	clk_data->num = EN7523_NUM_CLOCKS;
 }
 
+static int en7523_clk_hw_init(struct platform_device *pdev,
+			      struct clk_hw_onecell_data *clk_data)
+{
+	void __iomem *base, *np_base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	np_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(np_base))
+		return PTR_ERR(np_base);
+
+	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
+
+	return 0;
+}
+
+static int en7581_clk_hw_init(struct platform_device *pdev,
+			      struct clk_hw_onecell_data *clk_data)
+{
+	void __iomem *base, *np_base;
+	u32 val;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	np_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(np_base))
+		return PTR_ERR(np_base);
+
+	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
+
+	val = readl(np_base + REG_NP_SCU_SSTR);
+	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
+	writel(val, np_base + REG_NP_SCU_SSTR);
+	val = readl(np_base + REG_NP_SCU_PCIC);
+	writel(val | 3, np_base + REG_NP_SCU_PCIC);
+
+	return 0;
+}
+
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -543,31 +573,18 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base, *np_base;
 	int r;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	np_base = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(np_base))
-		return PTR_ERR(np_base);
-
-	soc_data = device_get_match_data(&pdev->dev);
-	if (soc_data->hw_init) {
-		r = soc_data->hw_init(pdev, np_base);
-		if (r)
-			return r;
-	}
-
 	clk_data = devm_kzalloc(&pdev->dev,
 				struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
-	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
+	soc_data = device_get_match_data(&pdev->dev);
+	r = soc_data->hw_init(pdev, clk_data);
+	if (r)
+		return r;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
@@ -590,6 +607,7 @@ static const struct en_clk_soc_data en7523_data = {
 		.prepare = en7523_pci_prepare,
 		.unprepare = en7523_pci_unprepare,
 	},
+	.hw_init = en7523_clk_hw_init,
 };
 
 static const struct en_clk_soc_data en7581_data = {

-- 
2.47.0


