Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF67CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGL8GAWaaLOedHf3UhL1aLTVvYBZSCkBGEnCJ+zN+L0=; b=xe7w9wHkc4noHBC52/AYS8nDf1
	UkqONsg5mKvQTwwdq8CgOdixLvlitiizQ+1xHVndHOl5+xmpAMr81Mn+v7uZ2wQWyl3I7buJiasaU
	s7jiE8up4AaW7b/9g//Xwi04vLNqeYeY2yWSIQIwMXirq9u1wZBgcN9ZiSFw9ow21SiBfsFBPGewO
	H84zW7r0FVoMAKLqypXrkotj/nLjZMVa37C1Pl2AFaOaIp1dADcTrpgG1nbTTyLp14h127QSh2pD+
	v3ZkS7xG0Jpgmzar40Qq1nWGF3mSSiyGik4TqmFKCG6XD7o+2eisW8kbyQUaI9QNkSHRTaua8bvHR
	32pLjeBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLAm-0000000Djqf-15NQ;
	Mon, 27 Oct 2025 11:14:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLAb-0000000Djj7-3yVt;
	Mon, 27 Oct 2025 11:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761563627;
	bh=uMNDlVMiY8eMGT5nLR/6G4iE8k9njF/IX52KNy0kIlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KOLe+pT590qSbVdRx3pvAbjB/Bhp/aE/O91IrwnBFmc2QSFvx1vQXEAHGB9R4wvBl
	 OFauX9t0RCgIzuRhqvf9MkwrqZuTYHAQvfoAxLhpNTkpiLz8ECbzkF5esT9Jw6ThMI
	 RvVCRFbC5Gb3aPj3kiCGBG9fMcXQ1Gg3j93qVO8NMWFRDgldVMTrNu0lF89pPAmOIF
	 Thjf39wUB2Qo91n+jIdlGRdkumQ5MRla1Yask/+o4qZNNvRJjAN6siTfIHj1Uvqazx
	 8GrM8KJnpURL9ZOefmHVT223vZePkjgy4sRCvjofA4qL5xRTlyInX79pPB+XbSIOEy
	 kaGvYC0hHw3xw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 17D6B17E12D5;
	Mon, 27 Oct 2025 12:13:47 +0100 (CET)
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
Subject: [PATCH v2 2/7] clk: mediatek: clk-gate: Simplify and optimize registration iter
Date: Mon, 27 Oct 2025 12:13:38 +0100
Message-ID: <20251027111343.21723-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027111343.21723-1-angelogioacchino.delregno@collabora.com>
References: <20251027111343.21723-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_041350_131783_74D2CCBA 
X-CRM114-Status: GOOD (  12.15  )
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

Simplify and optimize mtk_clk_register_all_gates() by removing and
replacing the function-local clk_hw pointer assignment and check
and as last step the consequent assignment to the array containing
handles to the registered clocks with... just the last step.

This removes a bunch of useless assignments, and in case any error
happens, the tear down iterator will still do its job without any
change required, effectively bringing no functional change, and a
a small optimization.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-gate.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index fd8cec95cd8d..8d1cc6a98a5f 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -257,8 +257,7 @@ static int mtk_clk_register_all_gates(struct device *dev, struct device_node *no
 				      const struct mtk_gate *clks, int num,
 				      struct clk_hw_onecell_data *clk_data)
 {
-	int i;
-	struct clk_hw *hw;
+	int i, ret;
 
 	if (!clk_data)
 		return -ENOMEM;
@@ -272,21 +271,19 @@ static int mtk_clk_register_all_gates(struct device *dev, struct device_node *no
 			continue;
 		}
 
-		hw = mtk_clk_register_gate(dev, gate, regmap, regmap_hwv);
-
-		if (IS_ERR(hw)) {
+		clk_data->hws[gate->id] = mtk_clk_register_gate(dev, gate, regmap, hwv_regmap);
+		if (IS_ERR(clk_data->hws[gate->id])) {
 			pr_err("Failed to register clk %s: %pe\n", gate->name,
-			       hw);
+			       clk_data->hws[gate->id]);
+			ret = PTR_ERR(clk_data->hws[gate->id]);
 			goto err;
 		}
-
-		clk_data->hws[gate->id] = hw;
 	}
 
 	return 0;
 
 err:
-	while (--i >= 0) {
+	while (i-- >= 0) {
 		const struct mtk_gate *gate = &clks[i];
 
 		if (IS_ERR_OR_NULL(clk_data->hws[gate->id]))
@@ -296,7 +293,7 @@ static int mtk_clk_register_all_gates(struct device *dev, struct device_node *no
 		clk_data->hws[gate->id] = ERR_PTR(-ENOENT);
 	}
 
-	return PTR_ERR(hw);
+	return ret;
 }
 
 int mtk_clk_register_gates(struct device *dev, struct device_node *node,
-- 
2.51.1


