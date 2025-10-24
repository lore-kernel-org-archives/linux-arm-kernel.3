Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E486CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdcylGYFAZFMp7kKhd3xmrvp0fnAjWRQbdLg+mQxxwI=; b=DzQBpXHVIr9nThEcRSgQgdSrgW
	XUzEhUQCF4NqhN76UQze1WxXOOiq9OWuoxz/Z69tS+jqzxozUk01r9rbaFjTpfN//NeiQXV5JK8v7
	hTF1Jja00Q/45LV/FgqolEsiyl6GomJp3DKxWlXGc839/YquaAPCiKaWRLzSsLA0P778ixxczyYKT
	0PW9jbIw/AD8+ZnwX9E//in7vg3W7pppOfSlm0zsi0wDZVcE1V7TB1B8CRHzm+jMC6WwJCvb1iopx
	BKzSnNjbv7mR5rIcM0u5u2827SU3g4lQ5VuDvCntjx341ZRoJo2M8X2bM4ojGIUVCUiuEUPEMrrKV
	+9kz12ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDF1-00000008hZg-40Xd;
	Fri, 24 Oct 2025 08:33:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEW-00000008gof-3FkP;
	Fri, 24 Oct 2025 08:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294790;
	bh=GnXom17LPeRNQIG22zsGuukZcFHtFvIHWJ7Waw4tsSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pYMeoMlufLsWIxH3fO9lyb2yv5FCpKI3l9gBfEd5dCyjhWvUu3d/rwiGyTeWLpga1
	 CCWKdrO3DdGobDBcGlcyrrtfE2MWJw3jd5n1ByqvduSmlP+MKB+5J55Oa/5NEkP/pE
	 qVwQ8Z+5B2XMYbHQJOIPw1ggu52W91dT83WGunEE7V+XwHiXgtF4/iqSMV4lUVazBe
	 Xx1EXf9dZt6rlodhtQGjRVh29y55AJs86oNy1zKs28bowOdLmEFtqVoxzHRs6mADV9
	 gyLthaUdv0lRzhANwwSnTNkJAa4w6TuQoTwLpsSOSU1F0BzoHF5MiO1zoXUFT8g6Np
	 ESj9XGS3KkziA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 45F1D17E00AC;
	Fri, 24 Oct 2025 10:33:10 +0200 (CEST)
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
Subject: [PATCH v1 1/7] clk: mediatek: Split out registration from mtk_clk_register_gates()
Date: Fri, 24 Oct 2025 10:32:55 +0200
Message-ID: <20251024083301.25845-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024083301.25845-1-angelogioacchino.delregno@collabora.com>
References: <20251024083301.25845-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013313_033358_0D2C628B 
X-CRM114-Status: GOOD (  13.64  )
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


