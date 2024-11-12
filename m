Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA7CD41D41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 00:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbP5DCM03nPHhB2PUDdN9HKFsz/JxPmvAuGZNQQ1Sto=; b=hZHqZMQ9dgy2tQMhSIVO2nE0OJ
	7pEgyhw7ITpfSsdwugs9dq7QeacPG40acKtmf1H9gRGpq7FQNtQgZSHqfZ4IEQ4nAA4lGE6hd/O/r
	xxOQwNp5z+odjIvV5NH5A3jG/NY3avvt+Lz15wAQahSBNEVzQWvk5MU/glgB/Sj6SFwrY6GkfEwkD
	3+PV97gFZcO+2zQGel+mxdCI/9E4jQrAo2jI8wtLHquhT6N1lOQJo18CED5lksKwrOk65GfQtPm8N
	MLJAnwA0bnjoWlF/Pci9LVrLGf+IQROV9LyPaXNfcml3xweEfS9xVrxwueiAwtTrkO63u4STFb20I
	DnVBmcPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAehK-00000001jPe-2tWn;
	Tue, 12 Nov 2024 00:23:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeTg-00000001hcg-0raR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 00:09:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DC3A5C5D32;
	Tue, 12 Nov 2024 00:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E312C4CECF;
	Tue, 12 Nov 2024 00:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731370191;
	bh=jlZDDRZ80YrCEZP6PYAXZ69UYnlvobdXU8ley54UQpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qVaPw2fvkRToBcVxLLIsxMuauCg2zome8OYWw76HP/s20Dl8eZGruInFOXZD5TNoP
	 K9b15iy41vRBcb02RgKm7Xl4g7g0vMX1p/eF7bmImn9zsfGaHOhO6NzPFrsSYPNts0
	 JukCIB6rzrxeRKuxeyFmZSV23Q5fV/Z9M9O2AOQds67dhNaVwwo33plhY9t6sftz14
	 S0I9x0LPQwXdJf4Qst+hr9HgyjCt+F+xMf5/xA7hV6CHdXNS+xg7NN+EFRA8xwpJJS
	 uCCYY1pnvQiPANxgqCmvOl/jIE98LfhRJlCw245OCrLlHunjLl9c8G7D+exYmQy1zk
	 3ug2L1UVuqHYQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 12 Nov 2024 01:08:54 +0100
Subject: [PATCH RESEND v2 7/7] clk: en7523: map io region in a single block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-clk-en7581-syscon-v2-7-8ada5e394ae4@kernel.org>
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
X-CRM114-CacheID: sfid-20241111_160952_363762_8E006F48 
X-CRM114-Status: GOOD (  14.14  )
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

Map all clock-controller memory region in a single block.
This patch does not introduce any backward incompatibility since the dts
for EN7581 SoC is not upstream yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 60dc938144d75b5fa21c9109ff05ed1083a16678..e52c5460e927f54c6df152c60560f438f89ec928 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -39,8 +39,8 @@
 #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
 #define REG_CRYPTO_CLKSRC2		0x20c
 
-#define REG_RST_CTRL2			0x00
-#define REG_RST_CTRL1			0x04
+#define REG_RST_CTRL2			0x830
+#define REG_RST_CTRL1			0x834
 
 struct en_clk_desc {
 	int id;
@@ -645,15 +645,9 @@ static const struct reset_control_ops en7581_reset_ops = {
 	.status = en7523_reset_status,
 };
 
-static int en7581_reset_register(struct platform_device *pdev)
+static int en7581_reset_register(struct device *dev, void __iomem *base)
 {
-	struct device *dev = &pdev->dev;
 	struct en_rst_data *rst_data;
-	void __iomem *base;
-
-	base = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
 
 	rst_data = devm_kzalloc(dev, sizeof(*rst_data), GFP_KERNEL);
 	if (!rst_data)
@@ -677,27 +671,27 @@ static int en7581_reset_register(struct platform_device *pdev)
 static int en7581_clk_hw_init(struct platform_device *pdev,
 			      struct clk_hw_onecell_data *clk_data)
 {
-	void __iomem *np_base;
 	struct regmap *map;
+	void __iomem *base;
 	u32 val;
 
 	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
 	if (IS_ERR(map))
 		return PTR_ERR(map);
 
-	np_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(np_base))
-		return PTR_ERR(np_base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	en7581_register_clocks(&pdev->dev, clk_data, map, np_base);
+	en7581_register_clocks(&pdev->dev, clk_data, map, base);
 
-	val = readl(np_base + REG_NP_SCU_SSTR);
+	val = readl(base + REG_NP_SCU_SSTR);
 	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
-	writel(val, np_base + REG_NP_SCU_SSTR);
-	val = readl(np_base + REG_NP_SCU_PCIC);
-	writel(val | 3, np_base + REG_NP_SCU_PCIC);
+	writel(val, base + REG_NP_SCU_SSTR);
+	val = readl(base + REG_NP_SCU_PCIC);
+	writel(val | 3, base + REG_NP_SCU_PCIC);
 
-	return en7581_reset_register(pdev);
+	return en7581_reset_register(&pdev->dev, base);
 }
 
 static int en7523_clk_probe(struct platform_device *pdev)

-- 
2.47.0


