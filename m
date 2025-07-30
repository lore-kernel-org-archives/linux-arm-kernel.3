Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08772C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfjowidRpDzRmg+SJ8LzikBUjRetoAAo+roDlRrgyjw=; b=Uu5E/BHNJHP679lABa+ec1JoNL
	4kAcMg6BR83pTslxqUDj5gulegF55BvRXyggFsCx/13txIYsVZetvcEGwoStL4inBv42o/5gGwI68
	A/5sLYQ1sdy5hmTbEVAqzVgut601QNo55mrWGFO6EKbIa/nSQPUzylK3icS19lzqklqeKg7ALtwKR
	m6bfowfrbX/ux7jgZ5sDtRoWxr2pvo9nVxwrogLyCJto/hGnF3vidHsEzCdi8JuF1Y3On0d5W4joc
	+/QOKhIrjbbrVC9AWyCQSIB6xhmPvhw/dHdgrlRHEbGD0TAAENOs/54Sy0TS+IEJ0Wyh/Y1UOizQk
	qWA5UnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5cB-00000001Ptb-2l9b;
	Wed, 30 Jul 2025 12:08:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4Vl-00000001H3Z-3Zjt;
	Wed, 30 Jul 2025 10:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753873096;
	bh=c7x0clmj7cUlg8J9XQHJHL7jOX6dfFW8OeGT5kvmvIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YrZJfjvbFspvjISigHRW5uCjcbpXM+gQLKsxho0eNRsWr3+0doukN4aH91S1BOSnm
	 jGyooclbaBqY0zB0B8+JCohvW0LFlBLtSRA6yJvaUy9fKx9OuVYJngkRO4IBSZkMBn
	 lOFLsFEOZwff/OdzWbrjXikFbPHzeZfEpIos2UmK2LLo9sRtN/LhYrG4571lZRb7Jz
	 h4TAq9fv+v6Pf385V9sQOGLMVe7vXUnDoG14uVjYFJm+Ne0hic7jpPM/bkvurAgHzA
	 2wIHMEfpgqM6Fxg5Bdk5ac26k85NsaziP/GWsuUes9FzwZu/skCxSvk8Ql0peqWjAv
	 gLzrTP/M9w98g==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4db2:e926:c82d:3276])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A0E117E15DE;
	Wed, 30 Jul 2025 12:58:15 +0200 (CEST)
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
Subject: [PATCH v3 07/27] clk: mediatek: clk-gate: Add ops for gates with HW voter
Date: Wed, 30 Jul 2025 12:56:33 +0200
Message-Id: <20250730105653.64910-8-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730105653.64910-1-laura.nao@collabora.com>
References: <20250730105653.64910-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_035818_047234_3DE886F2 
X-CRM114-Status: GOOD (  18.86  )
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
 drivers/clk/mediatek/clk-gate.c | 77 +++++++++++++++++++++++++++++++--
 drivers/clk/mediatek/clk-gate.h |  3 ++
 2 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 0375ccad4be3..426f3a25763d 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/dev_printk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/printk.h>
@@ -12,14 +13,19 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include "clk-mtk.h"
 #include "clk-gate.h"
 
 struct mtk_clk_gate {
 	struct clk_hw	hw;
 	struct regmap	*regmap;
+	struct regmap	*regmap_hwv;
 	int		set_ofs;
 	int		clr_ofs;
 	int		sta_ofs;
+	unsigned int	hwv_set_ofs;
+	unsigned int	hwv_clr_ofs;
+	unsigned int	hwv_sta_ofs;
 	u8		bit;
 };
 
@@ -100,6 +106,28 @@ static void mtk_cg_disable_inv(struct clk_hw *hw)
 	mtk_cg_clr_bit(hw);
 }
 
+static int mtk_cg_hwv_set_en(struct clk_hw *hw, bool enable)
+{
+	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
+	u32 val;
+
+	regmap_write(cg->regmap_hwv, enable ? cg->hwv_set_ofs : cg->hwv_clr_ofs, BIT(cg->bit));
+
+	return regmap_read_poll_timeout_atomic(cg->regmap_hwv, cg->hwv_sta_ofs, val,
+					       val & BIT(cg->bit),
+					       0, MTK_WAIT_HWV_DONE_US);
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
@@ -124,6 +152,15 @@ static void mtk_cg_disable_inv_no_setclr(struct clk_hw *hw)
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
@@ -138,6 +175,20 @@ const struct clk_ops mtk_clk_gate_ops_setclr_inv = {
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
@@ -153,8 +204,9 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv = {
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
@@ -169,11 +221,22 @@ static struct clk_hw *mtk_clk_register_gate(struct device *dev,
 	init.parent_names = gate->parent_name ? &gate->parent_name : NULL;
 	init.num_parents = gate->parent_name ? 1 : 0;
 	init.ops = gate->ops;
+	if (mtk_cg_uses_hwv(init.ops) && !regmap_hwv) {
+		dev_err(dev, "regmap not found for hardware voter clocks\n");
+		return ERR_PTR(-ENXIO);
+	}
 
 	cg->regmap = regmap;
+	cg->regmap_hwv = regmap_hwv;
 	cg->set_ofs = gate->regs->set_ofs;
 	cg->clr_ofs = gate->regs->clr_ofs;
 	cg->sta_ofs = gate->regs->sta_ofs;
+	if (gate->hwv_regs) {
+		cg->hwv_set_ofs = gate->hwv_regs->set_ofs;
+		cg->hwv_clr_ofs = gate->hwv_regs->clr_ofs;
+		cg->hwv_sta_ofs = gate->hwv_regs->sta_ofs;
+	}
+
 	cg->bit = gate->shift;
 
 	cg->hw.init = &init;
@@ -206,6 +269,7 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 	int i;
 	struct clk_hw *hw;
 	struct regmap *regmap;
+	struct regmap *regmap_hwv;
 
 	if (!clk_data)
 		return -ENOMEM;
@@ -216,6 +280,13 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 		return PTR_ERR(regmap);
 	}
 
+	regmap_hwv = mtk_clk_get_hwv_regmap(node);
+	if (IS_ERR(regmap_hwv)) {
+		pr_err("Cannot find hardware voter regmap for %pOF: %pe\n",
+		       node, regmap_hwv);
+		return PTR_ERR(regmap_hwv);
+	}
+
 	for (i = 0; i < num; i++) {
 		const struct mtk_gate *gate = &clks[i];
 
@@ -225,7 +296,7 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
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


