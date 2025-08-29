Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC24CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6KGFDXUrXjmqjNvF+HeNpG68Ymd+oSGVd8+UK9MIlM=; b=vbXr73BwVBxd/OWRFkoSQ7o/fa
	GJ5iU20NlD9ohUayq7UkOVtQTvFslD8PfCVyUVZvwwK7GWcJZcLM8CitZQcoHefYlxUbqN3aS8LhW
	RVHH1imlwfJtAWyVpLmKe03lM1Ox9vMPi9gJ+39aWt60fmuCki49fUi43eMkNdiUe+v7XYDZNoiMP
	91EL8sTBsk8T5/fMba9Up4WWtFAa5cPEp/9I0OGB1yn16jJGxh/fZ3S4BrckMxQqji+8R4GXkTahP
	NNwLkmETUROjmavMhjkBiXDAyBALBuRRW7kC+TyJQuKtJHkdRe/yu0kmDAVCvFbJUTf4uv+ZMylr/
	SB+N+2+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwet-00000005NTv-1AgT;
	Fri, 29 Aug 2025 10:48:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvI8-000000057ji-20Nh;
	Fri, 29 Aug 2025 09:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756459262;
	bh=Vvege64kPoPnQQukHIBuyxh/O+bjL4JbLdwzZugGzM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UBSuGfa4BPZaUx21rQNdtA6f8sahJo7ne0BaNWCsTE6s0+F7VIL3qYIc9LUkq2+P6
	 36KvBLKjNpf1MpaiSNvMrZ0HM0nEzq2njuNk5K5dpxMXAmc1v81eCp2xjnEUP6S5LA
	 iVp3BUpbgLrhrEaIn61cPh3ya84lrogpA3aBRHOCbGZLoFspa9IhOIFB7JdVsepdtS
	 MgUuuO9AKx8hR0Pqd44cQRlChOqLTdifW3oXp3rlP7qXgr3t3fOlehLBfpTmYp12cU
	 c/hUlZpIQaWVJi15yPasqDouxbAndQI2rBwnVWUOp/bcdMAhRLh2fZc0p2uXtzAhAf
	 aTbmjXrQD7HYg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:f5b1:db54:a11a:c333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4FBE17E12BE;
	Fri, 29 Aug 2025 11:21:01 +0200 (CEST)
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
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v5 07/27] clk: mediatek: clk-gate: Add ops for gates with HW voter
Date: Fri, 29 Aug 2025 11:18:53 +0200
Message-Id: <20250829091913.131528-8-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829091913.131528-1-laura.nao@collabora.com>
References: <20250829091913.131528-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_022104_693891_29413E02 
X-CRM114-Status: GOOD (  18.08  )
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

MT8196 use a HW voter for gate enable/disable control. Voting is
performed using set/clr regs, with a status bit used to verify the vote
state. Add new set of gate clock operations with support for voting via
set/clr regs.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-gate.c | 73 +++++++++++++++++++++++++++++++--
 drivers/clk/mediatek/clk-gate.h |  3 ++
 2 files changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 816e5f2d4079..b81791d975a4 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/dev_printk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/printk.h>
@@ -12,11 +13,13 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include "clk-mtk.h"
 #include "clk-gate.h"
 
 struct mtk_clk_gate {
 	struct clk_hw	hw;
 	struct regmap	*regmap;
+	struct regmap	*regmap_hwv;
 	const struct mtk_gate *gate;
 };
 
@@ -99,6 +102,32 @@ static void mtk_cg_disable_inv(struct clk_hw *hw)
 	mtk_cg_clr_bit(hw);
 }
 
+static int mtk_cg_hwv_set_en(struct clk_hw *hw, bool enable)
+{
+	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
+	u32 val;
+
+	regmap_write(cg->regmap_hwv,
+		     enable ? cg->gate->hwv_regs->set_ofs :
+			      cg->gate->hwv_regs->clr_ofs,
+		     BIT(cg->gate->shift));
+
+	return regmap_read_poll_timeout_atomic(cg->regmap_hwv,
+					       cg->gate->hwv_regs->sta_ofs, val,
+					       val & BIT(cg->gate->shift), 0,
+					       MTK_WAIT_HWV_DONE_US);
+}
+
+static int mtk_cg_hwv_enable(struct clk_hw *hw)
+{
+	return mtk_cg_hwv_set_en(hw, true);
+}
+
+static void mtk_cg_hwv_disable(struct clk_hw *hw)
+{
+	mtk_cg_hwv_set_en(hw, false);
+}
+
 static int mtk_cg_enable_no_setclr(struct clk_hw *hw)
 {
 	mtk_cg_clr_bit_no_setclr(hw);
@@ -123,6 +152,15 @@ static void mtk_cg_disable_inv_no_setclr(struct clk_hw *hw)
 	mtk_cg_clr_bit_no_setclr(hw);
 }
 
+static bool mtk_cg_uses_hwv(const struct clk_ops *ops)
+{
+	if (ops == &mtk_clk_gate_hwv_ops_setclr ||
+	    ops == &mtk_clk_gate_hwv_ops_setclr_inv)
+		return true;
+
+	return false;
+}
+
 const struct clk_ops mtk_clk_gate_ops_setclr = {
 	.is_enabled	= mtk_cg_bit_is_cleared,
 	.enable		= mtk_cg_enable,
@@ -137,6 +175,20 @@ const struct clk_ops mtk_clk_gate_ops_setclr_inv = {
 };
 EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_setclr_inv);
 
+const struct clk_ops mtk_clk_gate_hwv_ops_setclr = {
+	.is_enabled	= mtk_cg_bit_is_cleared,
+	.enable		= mtk_cg_hwv_enable,
+	.disable	= mtk_cg_hwv_disable,
+};
+EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr);
+
+const struct clk_ops mtk_clk_gate_hwv_ops_setclr_inv = {
+	.is_enabled	= mtk_cg_bit_is_set,
+	.enable		= mtk_cg_hwv_enable,
+	.disable	= mtk_cg_hwv_disable,
+};
+EXPORT_SYMBOL_GPL(mtk_clk_gate_hwv_ops_setclr_inv);
+
 const struct clk_ops mtk_clk_gate_ops_no_setclr = {
 	.is_enabled	= mtk_cg_bit_is_cleared,
 	.enable		= mtk_cg_enable_no_setclr,
@@ -152,8 +204,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv = {
 EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
 
 static struct clk_hw *mtk_clk_register_gate(struct device *dev,
-						const struct mtk_gate *gate,
-						struct regmap *regmap)
+					    const struct mtk_gate *gate,
+					    struct regmap *regmap,
+					    struct regmap *regmap_hwv)
 {
 	struct mtk_clk_gate *cg;
 	int ret;
@@ -168,8 +221,14 @@ static struct clk_hw *mtk_clk_register_gate(struct device *dev,
 	init.parent_names = gate->parent_name ? &gate->parent_name : NULL;
 	init.num_parents = gate->parent_name ? 1 : 0;
 	init.ops = gate->ops;
+	if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv) {
+		return dev_err_ptr_probe(
+			dev, -ENXIO,
+			"regmap not found for hardware voter clocks\n");
+	}
 
 	cg->regmap = regmap;
+	cg->regmap_hwv = regmap_hwv;
 	cg->gate = gate;
 	cg->hw.init = &init;
 
@@ -201,6 +260,7 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 	int i;
 	struct clk_hw *hw;
 	struct regmap *regmap;
+	struct regmap *regmap_hwv;
 
 	if (!clk_data)
 		return -ENOMEM;
@@ -211,6 +271,13 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 		return PTR_ERR(regmap);
 	}
 
+	regmap_hwv = mtk_clk_get_hwv_regmap(node);
+	if (IS_ERR(regmap_hwv)) {
+		return dev_err_probe(
+			dev, PTR_ERR(regmap_hwv),
+			"Cannot find hardware voter regmap for %pOF\n", node);
+	}
+
 	for (i = 0; i < num; i++) {
 		const struct mtk_gate *gate = &clks[i];
 
@@ -220,7 +287,7 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 			continue;
 		}
 
-		hw = mtk_clk_register_gate(dev, gate, regmap);
+		hw = mtk_clk_register_gate(dev, gate, regmap, regmap_hwv);
 
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %pe\n", gate->name,
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 1a46b4c56fc5..4f05b9855dae 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -19,6 +19,8 @@ extern const struct clk_ops mtk_clk_gate_ops_setclr;
 extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
 extern const struct clk_ops mtk_clk_gate_ops_no_setclr;
 extern const struct clk_ops mtk_clk_gate_ops_no_setclr_inv;
+extern const struct clk_ops mtk_clk_gate_hwv_ops_setclr;
+extern const struct clk_ops mtk_clk_gate_hwv_ops_setclr_inv;
 
 struct mtk_gate_regs {
 	u32 sta_ofs;
@@ -31,6 +33,7 @@ struct mtk_gate {
 	const char *name;
 	const char *parent_name;
 	const struct mtk_gate_regs *regs;
+	const struct mtk_gate_regs *hwv_regs;
 	int shift;
 	const struct clk_ops *ops;
 	unsigned long flags;
-- 
2.39.5


