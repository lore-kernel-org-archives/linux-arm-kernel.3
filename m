Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A57CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdcylGYFAZFMp7kKhd3xmrvp0fnAjWRQbdLg+mQxxwI=; b=rGm7gruVRp/PW/3/uAEqliS2mu
	qbCdmBZUtOq71JmHgan5Blsjc0VvGMabP1QSRZxs3fHT22BNVbK26q/yG/XBwTuj9iOdQpamKNcrY
	IZVSHR4/Qsd6BNysnIubMG35F8RGRPDaOi0nj0glEBHa9RzJ8iTj2YI5l5g5cSO9pctheb2/i2/6O
	TPb/63weDsG5/34oCMGHtkNYvTcXKgvYqFOo2dgB+ow2bxR0JlbmTPDcjQQY097bwIobRm+doQHWQ
	h6FTGd3Unnt+/6qFlTHWMYRN9GzANctUuxJlHoF3FsX7y38Y95F5/f13hbkWvVM5a6XAyej1hzqW7
	BPvPW9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLAd-0000000Djkr-0WD8;
	Mon, 27 Oct 2025 11:13:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLAa-0000000Djis-47GD;
	Mon, 27 Oct 2025 11:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761563626;
	bh=GnXom17LPeRNQIG22zsGuukZcFHtFvIHWJ7Waw4tsSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YhLo3hnYFIORfQSJhhO3fVp1Np3qphJn4ftm9mVOpuYmYzk786LG2IK0zdPOKQ51f
	 vzhzWsct1XLj2KNusefo00Drw00bXa3ETa4gSXFNPBAU1xiQAurVMuh0uGtU/sIGX+
	 OoerBTMQnJ12YQK4iOtbUFIvS1AJMaQDe1uddGD0L4PUTeH7D6/+F66o4xxqFkcAF5
	 n0ne2fIIiq8eG/ye1vA06BlH9GSf8AZbI4H+F7pCDTiADtwFtKDi7cDjv6pgLANVyz
	 ruNQNyP7wReHF2fBSBacq1aAl3+H/xZ+G5sLEBtk97Q0h5RX/Pd98KrFjtDcmZx+L4
	 /MJnoHrIInQ7g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 46B4A17E12AE;
	Mon, 27 Oct 2025 12:13:46 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	laura.nao@collabora.com,
	nfraprado@collabora.com,
	wenst@chromium.org,
	y.oudjana@protonmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 1/7] clk: mediatek: Split out registration from mtk_clk_register_gates()
Date: Mon, 27 Oct 2025 12:13:37 +0100
Message-ID: <20251027111343.21723-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027111343.21723-1-angelogioacchino.delregno@collabora.com>
References: <20251027111343.21723-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_041349_205305_8040194D 
X-CRM114-Status: GOOD (  13.65  )
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

In preparation for adding support for clock controllers over SPMI
bus, split out the actual registration iterator out of the function
mtk_clk_register_gates() to a new mtk_clk_register_all_gates()
private function, taking a handle to regmap and hwv_regmap as
parameters.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-gate.c | 43 ++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index f6b1429ff757..fd8cec95cd8d 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -252,30 +252,17 @@ static void mtk_clk_unregister_gate(struct clk_hw *hw)
 	kfree(cg);
 }
 
-int mtk_clk_register_gates(struct device *dev, struct device_node *node,
-			   const struct mtk_gate *clks, int num,
-			   struct clk_hw_onecell_data *clk_data)
+static int mtk_clk_register_all_gates(struct device *dev, struct device_node *node,
+				      struct regmap *regmap, struct regmap *hwv_regmap,
+				      const struct mtk_gate *clks, int num,
+				      struct clk_hw_onecell_data *clk_data)
 {
 	int i;
 	struct clk_hw *hw;
-	struct regmap *regmap;
-	struct regmap *regmap_hwv;
 
 	if (!clk_data)
 		return -ENOMEM;
 
-	regmap = device_node_to_regmap(node);
-	if (IS_ERR(regmap)) {
-		pr_err("Cannot find regmap for %pOF: %pe\n", node, regmap);
-		return PTR_ERR(regmap);
-	}
-
-	regmap_hwv = mtk_clk_get_hwv_regmap(node);
-	if (IS_ERR(regmap_hwv))
-		return dev_err_probe(
-			dev, PTR_ERR(regmap_hwv),
-			"Cannot find hardware voter regmap for %pOF\n", node);
-
 	for (i = 0; i < num; i++) {
 		const struct mtk_gate *gate = &clks[i];
 
@@ -311,6 +298,28 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 
 	return PTR_ERR(hw);
 }
+
+int mtk_clk_register_gates(struct device *dev, struct device_node *node,
+			   const struct mtk_gate *clks, int num,
+			   struct clk_hw_onecell_data *clk_data)
+{
+	struct regmap *regmap, *regmap_hwv;
+
+	regmap = device_node_to_regmap(node);
+	if (IS_ERR(regmap)) {
+		pr_err("Cannot find regmap for %pOF: %pe\n", node, regmap);
+		return PTR_ERR(regmap);
+	}
+
+	regmap_hwv = mtk_clk_get_hwv_regmap(node);
+	if (IS_ERR(regmap_hwv))
+		return dev_err_probe(
+			dev, PTR_ERR(regmap_hwv),
+			"Cannot find hardware voter regmap for %pOF\n", node);
+
+	return mtk_clk_register_all_gates(dev, node, regmap, regmap_hwv,
+					  clks, num, clk_data);
+}
 EXPORT_SYMBOL_GPL(mtk_clk_register_gates);
 
 void mtk_clk_unregister_gates(const struct mtk_gate *clks, int num,
-- 
2.51.1


