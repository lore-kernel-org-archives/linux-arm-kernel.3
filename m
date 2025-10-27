Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72781CCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLUe7ok4FRIwf0amsFxxdNsa8W0l4xogDvz9PTcumrA=; b=oS1RbW4jIzeEazUt1wWDYp5mgC
	hZBtpwFyZ0Kcc+gfdAEdQxS7i5+JPw8+l8vspKVcKE/QB7C0rx8IzK2XpwcvFCFPblAqfMpZEWUXC
	doFY0MorLbo8EtFT0/zKJUccS0SRxvbV1NooLW2/94qmHCuMrQxCqH9efyaRUYDdBqKwT+yEF12zI
	GhKpezjG6LCqDc9JevRKk4C4OMD6YHz9Hc2gl1fH8mhyX1Q2IqoSIadIXWR6yVIUr0TDwtmmCZYsa
	qChjEOQiM2nOIdjHYYhN1SC4c7oXTgBVGOdTVeh0aeveZUX7H5hPLdrsRk6fVUj6hahQIr02VOfoN
	fdSTn0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLAs-0000000Djtt-1UcZ;
	Mon, 27 Oct 2025 11:14:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLAd-0000000Djjv-1P41;
	Mon, 27 Oct 2025 11:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761563629;
	bh=f5P3+e3xtzKeCpgjf0REjVgwacDa/HF6QyCwbdP8mxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xyxvd/U1O2a3lCyj/QysGL0noPhkvEb7ZearpAdcQoN6BXRe8Dt7PpdbzbncKghY8
	 jgrCcHOhdOxIkemvrtoxwVUERBEfcSICh++GmgL7Jso0rOgCl2Woehj0iDdQ+qGIA4
	 cK/yK2FfFbFJtuW1AHq7t7IDgMg3PSDjf6LLGYI7hyqpiR7ZjGELWKVKpxJq1IZNie
	 xOzwvxEtrRC30UTtyFx1KOo+rsMYUo2+hNTtaN8QakQlIlyGmgk+h4e0psdbZ7/jct
	 tXuVgNUFQ7cI5XkmiIbGLhF/rDJLywAyM0QLJPTt/B0u+grXtAld7yOkQ3zvsZkiDP
	 lJLhahC/Mxh4w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ADD0817E1413;
	Mon, 27 Oct 2025 12:13:48 +0100 (CET)
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
Subject: [PATCH v2 4/7] clk: mediatek: Add and wire up mtk_spmi_clk_register_gates()
Date: Mon, 27 Oct 2025 12:13:40 +0100
Message-ID: <20251027111343.21723-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027111343.21723-1-angelogioacchino.delregno@collabora.com>
References: <20251027111343.21723-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_041351_530575_DBF67DC3 
X-CRM114-Status: GOOD (  12.18  )
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

In preparation for adding means to register SPMI clock controllers
add a new mtk_spmi_clk_register_gates() function and wire it up to
mtk_clk_simple_probe_internal().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-gate.c | 10 ++++++++++
 drivers/clk/mediatek/clk-gate.h |  6 ++++++
 drivers/clk/mediatek/clk-mtk.c  |  8 ++++++--
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 8d1cc6a98a5f..1bc09c5ca897 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -319,6 +319,16 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_gates);
 
+int mtk_spmi_clk_register_gates(struct device *dev, struct device_node *node,
+				const struct mtk_gate *clks, int num,
+				struct clk_hw_onecell_data *clk_data,
+				struct regmap *regmap)
+{
+	return mtk_clk_register_all_gates(dev, node, regmap, NULL,
+					  clks, num, clk_data);
+}
+EXPORT_SYMBOL_GPL(mtk_spmi_clk_register_gates);
+
 void mtk_clk_unregister_gates(const struct mtk_gate *clks, int num,
 			      struct clk_hw_onecell_data *clk_data)
 {
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 4f05b9855dae..924219344021 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -14,6 +14,7 @@ struct clk_hw_onecell_data;
 struct clk_ops;
 struct device;
 struct device_node;
+struct regmap;
 
 extern const struct clk_ops mtk_clk_gate_ops_setclr;
 extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
@@ -57,6 +58,11 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 			   const struct mtk_gate *clks, int num,
 			   struct clk_hw_onecell_data *clk_data);
 
+int mtk_spmi_clk_register_gates(struct device *dev, struct device_node *node,
+				const struct mtk_gate *clks, int num,
+				struct clk_hw_onecell_data *clk_data,
+				struct regmap *regmap);
+
 void mtk_clk_unregister_gates(const struct mtk_gate *clks, int num,
 			      struct clk_hw_onecell_data *clk_data);
 
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index bf57c65b01ff..a33011358f08 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -552,8 +552,12 @@ int mtk_clk_simple_probe_internal(struct platform_device *pdev,
 	}
 
 	if (mcd->clks) {
-		r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks,
-					   mcd->num_clks, clk_data);
+		if (regmap)
+			r = mtk_spmi_clk_register_gates(&pdev->dev, node, mcd->clks,
+							mcd->num_clks, clk_data, regmap);
+		else
+			r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks,
+						   mcd->num_clks, clk_data);
 		if (r)
 			goto unregister_dividers;
 	}
-- 
2.51.1


