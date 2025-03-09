Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8309C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXGZSQaYq8bc/tr8X+R6iDGpv0XCfiL/MLUXqqcdlyQ=; b=leFhb+3EAD9jk89ZxQ/WimwpOC
	FcZXGWnYY86kNi6EUSw41RAVfp8RmlsoVphYt1sxvwueVkibEr8+oMI3wu+IqZG+dQ3Jo0VI4LRB6
	JVq+XOyE0cVyPmgV6CZIh55s6p+GdlkKXema7QpVRNahNG9bfJ6pPvtWNiytkLH701NKQt0D914bq
	gNMvif+/Gk2Wn0bTOmrftLyZItPLZYQROHf7jH30wpvn0wAXeItUg+Esrg4TZuP1DFeWJvd5LYii5
	7L90jHO3OAGgl4NUh6YnmHqI5PdEvlwqwtL1zljIVE4gTKrRQ7icEON6bWqwX90LFBY1+NXZJ91UD
	SOknz9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGoh-00000000bSw-3xGS;
	Sun, 09 Mar 2025 13:35:43 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGjr-00000000aQ7-26Ct;
	Sun, 09 Mar 2025 13:30:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39140bd6317so485125f8f.1;
        Sun, 09 Mar 2025 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527040; x=1742131840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXGZSQaYq8bc/tr8X+R6iDGpv0XCfiL/MLUXqqcdlyQ=;
        b=JDJ9J3MkrqcQXb9cx2uKgFeX+TFrG+bDs4aG8Du/Mvej7zAySo8nHp/i2yqW6u2Zg/
         cmmnQPr5vAKutxn/gd6ts4OYKdBh2+rbT7P8UpaKT6i9LfX95tqixr/Ye9zMhEa8ELu5
         fikoXx3eDxwhDPUqMTtx6qxBB1N3Kwq6u7SRW+W1dVbJr37Cq70RFqz8oqh+1wlFZluh
         wUK90lq+sVFW48CsTo+VSZBbA0muR4OJ6DU0Cn9TbhNOOCjgQk84kAPrBg2dOiEM7wm2
         4/fnNla2VuqOOAKS6Rp/ICp93vA65MdvLRzAJ7zaQw+6umc4Xr/i1ZcF68pV8stq3IF5
         PMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527040; x=1742131840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXGZSQaYq8bc/tr8X+R6iDGpv0XCfiL/MLUXqqcdlyQ=;
        b=hfJnfiKMJSFg34oQKCGKGHFZ3q7fS2o6JsveYL9LqufAOpT3+JCSJ0aiY8V0vVlHC/
         AzSzyQfi9hqsLV0NueMicFyjL69uHK1SI0BkRybiQ7QRfOPFG1tF9oXsHyHJigBtdDMa
         EJdpSSzugN4AO8N+pJ8CfLOCgQ+cys/EJt2HCeYC+xZDdlkCNWJZVU3zSIJH2rbRIRd7
         2CdSgorXBxP2ZDAqN9gnhoxS8g81hXdGMfxC00aQsnFIBkOgHlqXCdKyWbUz+SQ+sirh
         1iG8K9AtDkqtjN+CLR2diEC7uQIGxeVDu1KqIMWt8VnjSGUr1nL3jOEXfjWsZp6vMLyl
         tzHw==
X-Forwarded-Encrypted: i=1; AJvYcCVogWUPhjUt2ixjqviOP9QzCFNjQPeCyT7BH1XA+eKa4XfRoEK3fQLhKSezy9RHJFXtgWkhsQWcqC+cD7nE4/di@lists.infradead.org, AJvYcCWbHagbC6b+r/LzbK98Pbnuv3dPh0hP0toFx6gx9bEf1D2lIIFQyd7975r66silqMhULTb4cUk1XisR@lists.infradead.org, AJvYcCWvknSzE2piy+UqOWieVrwJyAl7jz8O4p5rU7HSryhFc8DJV2TEJp3jaO0eVFR+W4idRcOavmTIAKnCbf3Djk0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwarTDiTduqO2F1Ve1MY705VZ+Ta342jGl0btjBZrpjhOHBet+T
	1rCy254AYBONeq2tJhB3HmFec2hilPfWeVF4YX5YJDT+mCYa7NezLcC8xQ==
X-Gm-Gg: ASbGnctSnSMd6TTo0bJctq0NAFWyZ+uU3J5Gu/JpcyWEyfp8RS7xdOmVJbLdRAQ+B53
	ooVb77w4mpsPEvhSRsSSMHovLWIkUFYNStRTcl4MThZWablLzxIfBURgaJxV1ggnhVOztvuQLms
	KuM2Q8smUkTWlgs0PhmT2/qEcJLo0QgdVQsT2vGPQXYm/p7HLxGG9DLN+2zOrAJJoVZyH5SnP7T
	q76NYI2SBXGEbZE6+hvgDtFYcX68TUp/zy4OaNWuInftHR6DiZC3ht06r0wuuH7VKm2DV5znPcj
	Va5QH3A60J5UMZrVdds2L4vW0XiBRgesqpUs2zHkAJAtsAsPaKYIRYkKYsBg6mkVzXiEgojoZRD
	H1YarRRtE29ozRA==
X-Google-Smtp-Source: AGHT+IExUCuOZLoF7gqcGan1qMq7cFGyQ2TzVW2KLuRBjuD+qOt/apk1yulFVHLpZzet4enxc1wYZQ==
X-Received: by 2002:a05:6000:2ac:b0:391:3094:d696 with SMTP id ffacd0b85a97d-39132de2bdfmr5586276f8f.54.1741527039657;
        Sun, 09 Mar 2025 06:30:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:39 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 01/13] clk: en7523: convert driver to regmap API
Date: Sun,  9 Mar 2025 14:29:32 +0100
Message-ID: <20250309132959.19045-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_063043_538640_A053CD77 
X-CRM114-Status: GOOD (  21.92  )
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

Convert driver to regmap API, in preparation for support of Airoha
AN7583 as the SCU will be an MFD and the regmap will be provided in the
parent node. Also Airoha EN7581 benefits from this in preparation of USB
support that required checking and configuring SCU SSR bits.

While at it also cleanup some register mask and use bitfield macro.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 137 ++++++++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 61 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 15bbdeb60b8e..314e7450313f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
@@ -34,6 +35,7 @@
 #define   REG_RESET_CONTROL_PCIE2	BIT(26)
 /* EN7581 */
 #define REG_NP_SCU_PCIC			0x88
+#define REG_PCIE_CTRL			GENMASK(7, 0)
 #define REG_NP_SCU_SSTR			0x9c
 #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
 #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
@@ -63,14 +65,14 @@ struct en_clk_desc {
 };
 
 struct en_clk_gate {
-	void __iomem *base;
+	struct regmap *map;
 	struct clk_hw hw;
 };
 
 struct en_rst_data {
 	const u16 *bank_ofs;
 	const u16 *idx_map;
-	void __iomem *base;
+	struct regmap *map;
 	struct reset_controller_dev rcdev;
 };
 
@@ -388,44 +390,44 @@ static u32 en7523_get_div(const struct en_clk_desc *desc, u32 val)
 static int en7523_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	u32 val;
 
-	return !!(readl(cg->base + REG_PCI_CONTROL) & REG_PCI_CONTROL_REFCLK_EN1);
+	regmap_read(cg->map, REG_PCI_CONTROL, &val);
+	return !!(val & REG_PCI_CONTROL_REFCLK_EN1);
 }
 
 static int en7523_pci_prepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
-	void __iomem *np_base = cg->base;
-	u32 val, mask;
+	struct regmap *map = cg->map;
+	u32 mask;
 
 	/* Need to pull device low before reset */
-	val = readl(np_base + REG_PCI_CONTROL);
-	val &= ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
-	writel(val, np_base + REG_PCI_CONTROL);
+	regmap_clear_bits(map, REG_PCI_CONTROL,
+			  REG_PCI_CONTROL_PERSTOUT1 |
+			  REG_PCI_CONTROL_PERSTOUT);
 	usleep_range(1000, 2000);
 
 	/* Enable PCIe port 1 */
-	val |= REG_PCI_CONTROL_REFCLK_EN1;
-	writel(val, np_base + REG_PCI_CONTROL);
+	regmap_set_bits(map, REG_PCI_CONTROL,
+			REG_PCI_CONTROL_REFCLK_EN1);
 	usleep_range(1000, 2000);
 
 	/* Reset to default */
-	val = readl(np_base + REG_RESET_CONTROL1);
 	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
 	       REG_RESET_CONTROL_PCIEHB;
-	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	regmap_clear_bits(map, REG_RESET_CONTROL1, mask);
 	usleep_range(1000, 2000);
-	writel(val | mask, np_base + REG_RESET_CONTROL1);
+	regmap_set_bits(map, REG_RESET_CONTROL1, mask);
 	msleep(100);
-	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	regmap_clear_bits(map, REG_RESET_CONTROL1, mask);
 	usleep_range(5000, 10000);
 
 	/* Release device */
 	mask = REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
-	val = readl(np_base + REG_PCI_CONTROL);
-	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	regmap_clear_bits(map, REG_PCI_CONTROL, mask);
 	usleep_range(1000, 2000);
-	writel(val | mask, np_base + REG_PCI_CONTROL);
+	regmap_set_bits(map, REG_PCI_CONTROL, mask);
 	msleep(250);
 
 	return 0;
@@ -434,16 +436,13 @@ static int en7523_pci_prepare(struct clk_hw *hw)
 static void en7523_pci_unprepare(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
-	void __iomem *np_base = cg->base;
-	u32 val;
+	struct regmap *map = cg->map;
 
-	val = readl(np_base + REG_PCI_CONTROL);
-	val &= ~REG_PCI_CONTROL_REFCLK_EN1;
-	writel(val, np_base + REG_PCI_CONTROL);
+	regmap_clear_bits(map, REG_PCI_CONTROL, REG_PCI_CONTROL_REFCLK_EN1);
 }
 
 static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
-					       void __iomem *np_base)
+					       struct regmap *clk_map)
 {
 	const struct en_clk_soc_data *soc_data = device_get_match_data(dev);
 	struct clk_init_data init = {
@@ -456,7 +455,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (!cg)
 		return NULL;
 
-	cg->base = np_base;
+	cg->map = clk_map;
 	cg->hw.init = &init;
 
 	if (init.ops->unprepare)
@@ -474,21 +473,20 @@ static int en7581_pci_is_enabled(struct clk_hw *hw)
 	u32 val, mask;
 
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
-	val = readl(cg->base + REG_PCI_CONTROL);
+	regmap_read(cg->map, REG_PCI_CONTROL, &val);
 	return (val & mask) == mask;
 }
 
 static int en7581_pci_enable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
-	void __iomem *np_base = cg->base;
-	u32 val, mask;
+	struct regmap *map = cg->map;
+	u32 mask;
 
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
 	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
 	       REG_PCI_CONTROL_PERSTOUT;
-	val = readl(np_base + REG_PCI_CONTROL);
-	writel(val | mask, np_base + REG_PCI_CONTROL);
+	regmap_set_bits(map, REG_PCI_CONTROL, mask);
 
 	return 0;
 }
@@ -496,19 +494,18 @@ static int en7581_pci_enable(struct clk_hw *hw)
 static void en7581_pci_disable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
-	void __iomem *np_base = cg->base;
-	u32 val, mask;
+	struct regmap *map = cg->map;
+	u32 mask;
 
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
 	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
 	       REG_PCI_CONTROL_PERSTOUT;
-	val = readl(np_base + REG_PCI_CONTROL);
-	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	regmap_clear_bits(map, REG_PCI_CONTROL, mask);
 	usleep_range(1000, 2000);
 }
 
 static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-				   void __iomem *base, void __iomem *np_base)
+				   struct regmap *map, struct regmap *clk_map)
 {
 	struct clk_hw *hw;
 	u32 rate;
@@ -517,10 +514,12 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
 		const struct en_clk_desc *desc = &en7523_base_clks[i];
 		u32 reg = desc->div_reg ? desc->div_reg : desc->base_reg;
-		u32 val = readl(base + desc->base_reg);
+		u32 val;
+
+		regmap_read(map, desc->base_reg, &val);
 
 		rate = en7523_get_base_rate(desc, val);
-		val = readl(base + reg);
+		regmap_read(map, reg, &val);
 		rate /= en7523_get_div(desc, val);
 
 		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
@@ -533,30 +532,47 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		clk_data->hws[desc->id] = hw;
 	}
 
-	hw = en7523_register_pcie_clk(dev, np_base);
+	hw = en7523_register_pcie_clk(dev, clk_map);
 	clk_data->hws[EN7523_CLK_PCIE] = hw;
 }
 
+static const struct regmap_config en7523_clk_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
 static int en7523_clk_hw_init(struct platform_device *pdev,
 			      struct clk_hw_onecell_data *clk_data)
 {
 	void __iomem *base, *np_base;
+	struct regmap *map, *clk_map;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	map = devm_regmap_init_mmio(&pdev->dev, base,
+				    &en7523_clk_regmap_config);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
 	np_base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(np_base))
 		return PTR_ERR(np_base);
 
-	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
+	clk_map = devm_regmap_init_mmio(&pdev->dev, np_base,
+					&en7523_clk_regmap_config);
+	if (IS_ERR(clk_map))
+		return PTR_ERR(clk_map);
+
+	en7523_register_clocks(&pdev->dev, clk_data, map, clk_map);
 
 	return 0;
 }
 
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-				   struct regmap *map, void __iomem *base)
+				   struct regmap *map, struct regmap *clk_map)
 {
 	struct clk_hw *hw;
 	u32 rate;
@@ -593,7 +609,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		clk_data->hws[desc->id] = hw;
 	}
 
-	hw = en7523_register_pcie_clk(dev, base);
+	hw = en7523_register_pcie_clk(dev, clk_map);
 	clk_data->hws[EN7523_CLK_PCIE] = hw;
 }
 
@@ -601,15 +617,10 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
-	u32 val;
+	u32 addr = rst_data->bank_ofs[id / RST_NR_PER_BANK];
 
-	val = readl(addr);
-	if (assert)
-		val |= BIT(id % RST_NR_PER_BANK);
-	else
-		val &= ~BIT(id % RST_NR_PER_BANK);
-	writel(val, addr);
+	regmap_update_bits(rst_data->map, addr, BIT(id % RST_NR_PER_BANK),
+			   assert ? BIT(id % RST_NR_PER_BANK) : 0);
 
 	return 0;
 }
@@ -630,9 +641,11 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 addr = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 val;
 
-	return !!(readl(addr) & BIT(id % RST_NR_PER_BANK));
+	regmap_read(rst_data->map, addr, &val);
+	return !!(val & BIT(id % RST_NR_PER_BANK));
 }
 
 static int en7523_reset_xlate(struct reset_controller_dev *rcdev,
@@ -652,7 +665,7 @@ static const struct reset_control_ops en7581_reset_ops = {
 	.status = en7523_reset_status,
 };
 
-static int en7581_reset_register(struct device *dev, void __iomem *base)
+static int en7581_reset_register(struct device *dev, struct regmap *map)
 {
 	struct en_rst_data *rst_data;
 
@@ -662,7 +675,7 @@ static int en7581_reset_register(struct device *dev, void __iomem *base)
 
 	rst_data->bank_ofs = en7581_rst_ofs;
 	rst_data->idx_map = en7581_rst_map;
-	rst_data->base = base;
+	rst_data->map = map;
 
 	rst_data->rcdev.nr_resets = ARRAY_SIZE(en7581_rst_map);
 	rst_data->rcdev.of_xlate = en7523_reset_xlate;
@@ -678,9 +691,8 @@ static int en7581_reset_register(struct device *dev, void __iomem *base)
 static int en7581_clk_hw_init(struct platform_device *pdev,
 			      struct clk_hw_onecell_data *clk_data)
 {
-	struct regmap *map;
+	struct regmap *map, *clk_map;
 	void __iomem *base;
-	u32 val;
 
 	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
 	if (IS_ERR(map))
@@ -690,15 +702,18 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	en7581_register_clocks(&pdev->dev, clk_data, map, base);
+	clk_map = devm_regmap_init_mmio(&pdev->dev, base, &en7523_clk_regmap_config);
+	if (IS_ERR(clk_map))
+		return PTR_ERR(clk_map);
+
+	en7581_register_clocks(&pdev->dev, clk_data, map, clk_map);
 
-	val = readl(base + REG_NP_SCU_SSTR);
-	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
-	writel(val, base + REG_NP_SCU_SSTR);
-	val = readl(base + REG_NP_SCU_PCIC);
-	writel(val | 3, base + REG_NP_SCU_PCIC);
+	regmap_clear_bits(clk_map, REG_NP_SCU_SSTR,
+			  REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
+	regmap_update_bits(clk_map, REG_NP_SCU_PCIC, REG_PCIE_CTRL,
+			   FIELD_PREP(REG_PCIE_CTRL, 3));
 
-	return en7581_reset_register(&pdev->dev, base);
+	return en7581_reset_register(&pdev->dev, clk_map);
 }
 
 static int en7523_clk_probe(struct platform_device *pdev)
-- 
2.48.1


