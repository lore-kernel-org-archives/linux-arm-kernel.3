Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1087FCA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwrgNFoljuTmWvOXG9RLWDFeOgKXGA5r4wbvVNJnkZo=; b=watUxcvyG287LPV1LaZdKznHnT
	0KtNMQcz764H/ijcmUX73n7+vq+yn++/NQd3AqHuighvC6HZKTEKGipzfFopfUJwk1FBTmZYmwCzS
	xg1JaibM6YbAcZuxUhkjTpFK6KnTXyc5Xm8iRVRd84XN90NN4v2myu4H1n61g5traSSzg8+uEfhm8
	dhOPq+ZmIoQKhpb2M0hoNM1kuE3zP2/5NTw6egs2kGVySZRRDJxG8bAu/eFcbaV2OKeAXJmDjgL47
	GYHMJSlTWI5ZKKp9/3185m8J4Xx1HgqU00Kv+NcfpnA5sQNV4kptFFmuXr0OHznK9y3YBfdo40rGb
	f5TgZEHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwcE-00000005NDI-0TF0;
	Fri, 29 Aug 2025 10:45:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvI7-000000057jR-1Yg7;
	Fri, 29 Aug 2025 09:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756459261;
	bh=VoNHArVKJHheM4m4+fk2gAoKWZNKxoMFzo/aP2dZ4Eg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hAB7WQ9QTcKcwy/boi3CqsVaRlsvkWzyXbdfUSZkv/GEGBoS0KePZfU4ieiBJlIfk
	 QGTaqIkypc7FcQrrfJuI2Z1dIiFPEYCL1FGDdH4yXdjN4XOXbYbNWpx+tX6cfQ1AbA
	 ok7MjOsMQwxhPGMRGxO8+30M1s86Pr3vzZ2oeWvWMwkjvQuLUVNnm3oso7h7D++2cu
	 UqDCBNMZpngOc4xvQlPGvR55TYlFh045a2UoriKJ/OPKkfZ0NrgC1+f8/3onVbzNai
	 jSelPZajCGfLaKvtUlVoh+rX6rQA/OKkyXYiNFk/GYfDdtNEAhXiaELRFsiErR+tSw
	 d3V7TD9p4MsnQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:f5b1:db54:a11a:c333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C80D417E12BC;
	Fri, 29 Aug 2025 11:21:00 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v5 06/27] clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use mtk_gate struct
Date: Fri, 29 Aug 2025 11:18:52 +0200
Message-Id: <20250829091913.131528-7-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829091913.131528-1-laura.nao@collabora.com>
References: <20250829091913.131528-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_022103_585870_BD15739B 
X-CRM114-Status: GOOD (  13.35  )
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

MT8196 uses a HW voter for gate enable/disable control, with
set/clr/sta registers located in a separate regmap. Refactor
mtk_clk_register_gate() to take a struct mtk_gate, and add a pointer to
it in struct mtk_clk_gate. This allows reuse of the static gate data
(including HW voter register offsets) without adding extra function
arguments, and removes redundant duplication in the runtime data struct.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-gate.c | 52 ++++++++++++---------------------
 1 file changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 67d9e741c5e7..816e5f2d4079 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -17,10 +17,7 @@
 struct mtk_clk_gate {
 	struct clk_hw	hw;
 	struct regmap	*regmap;
-	int		set_ofs;
-	int		clr_ofs;
-	int		sta_ofs;
-	u8		bit;
+	const struct mtk_gate *gate;
 };
 
 static inline struct mtk_clk_gate *to_mtk_clk_gate(struct clk_hw *hw)
@@ -33,9 +30,9 @@ static u32 mtk_get_clockgating(struct clk_hw *hw)
 	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
 	u32 val;
 
-	regmap_read(cg->regmap, cg->sta_ofs, &val);
+	regmap_read(cg->regmap, cg->gate->regs->sta_ofs, &val);
 
-	return val & BIT(cg->bit);
+	return val & BIT(cg->gate->shift);
 }
 
 static int mtk_cg_bit_is_cleared(struct clk_hw *hw)
@@ -52,28 +49,30 @@ static void mtk_cg_set_bit(struct clk_hw *hw)
 {
 	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
 
-	regmap_write(cg->regmap, cg->set_ofs, BIT(cg->bit));
+	regmap_write(cg->regmap, cg->gate->regs->set_ofs, BIT(cg->gate->shift));
 }
 
 static void mtk_cg_clr_bit(struct clk_hw *hw)
 {
 	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
 
-	regmap_write(cg->regmap, cg->clr_ofs, BIT(cg->bit));
+	regmap_write(cg->regmap, cg->gate->regs->clr_ofs, BIT(cg->gate->shift));
 }
 
 static void mtk_cg_set_bit_no_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
 
-	regmap_set_bits(cg->regmap, cg->sta_ofs, BIT(cg->bit));
+	regmap_set_bits(cg->regmap, cg->gate->regs->sta_ofs,
+			BIT(cg->gate->shift));
 }
 
 static void mtk_cg_clr_bit_no_setclr(struct clk_hw *hw)
 {
 	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
 
-	regmap_clear_bits(cg->regmap, cg->sta_ofs, BIT(cg->bit));
+	regmap_clear_bits(cg->regmap, cg->gate->regs->sta_ofs,
+			  BIT(cg->gate->shift));
 }
 
 static int mtk_cg_enable(struct clk_hw *hw)
@@ -152,12 +151,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv = {
 };
 EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
 
-static struct clk_hw *mtk_clk_register_gate(struct device *dev, const char *name,
-					 const char *parent_name,
-					 struct regmap *regmap, int set_ofs,
-					 int clr_ofs, int sta_ofs, u8 bit,
-					 const struct clk_ops *ops,
-					 unsigned long flags)
+static struct clk_hw *mtk_clk_register_gate(struct device *dev,
+						const struct mtk_gate *gate,
+						struct regmap *regmap)
 {
 	struct mtk_clk_gate *cg;
 	int ret;
@@ -167,18 +163,14 @@ static struct clk_hw *mtk_clk_register_gate(struct device *dev, const char *name
 	if (!cg)
 		return ERR_PTR(-ENOMEM);
 
-	init.name = name;
-	init.flags = flags | CLK_SET_RATE_PARENT;
-	init.parent_names = parent_name ? &parent_name : NULL;
-	init.num_parents = parent_name ? 1 : 0;
-	init.ops = ops;
+	init.name = gate->name;
+	init.flags = gate->flags | CLK_SET_RATE_PARENT;
+	init.parent_names = gate->parent_name ? &gate->parent_name : NULL;
+	init.num_parents = gate->parent_name ? 1 : 0;
+	init.ops = gate->ops;
 
 	cg->regmap = regmap;
-	cg->set_ofs = set_ofs;
-	cg->clr_ofs = clr_ofs;
-	cg->sta_ofs = sta_ofs;
-	cg->bit = bit;
-
+	cg->gate = gate;
 	cg->hw.init = &init;
 
 	ret = clk_hw_register(dev, &cg->hw);
@@ -228,13 +220,7 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 			continue;
 		}
 
-		hw = mtk_clk_register_gate(dev, gate->name, gate->parent_name,
-					    regmap,
-					    gate->regs->set_ofs,
-					    gate->regs->clr_ofs,
-					    gate->regs->sta_ofs,
-					    gate->shift, gate->ops,
-					    gate->flags);
+		hw = mtk_clk_register_gate(dev, gate, regmap);
 
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %pe\n", gate->name,
-- 
2.39.5


