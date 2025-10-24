Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FF6CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20CXCKiSZvKEtzFAa/ivRajfBQUzV3WM7mRP8YZrIio=; b=OBUtwpQmJpBYgeczJ6RjmK1vjr
	JcpGS7uBu+qdHhBmF/UMESGqscfzEvUP+MueV7yiHw0DGxZgaS2XgzjH24mYCeM1HxZgkJ0hIEWUM
	+c/9zf2a8yymLxcQnt1zl9/TpISWTL+oWmX0wzfNm94eAOVC1IZLEWM9dmfelpbJtJc/uC9TXBZpy
	aX5/ZyKD/A/JzSGIYK0L57+Ijn18LLjkBVAIGRmGGr+cMkU2mDf0EI0rPWASwDSDbp4IsQMuXwb67
	IfbElWyaAQCCezUY0A+DFNZXFJ2Uec0U2ywo6w1cCjgMvFVqpPCL4MAHd0ilf1qJFkPWuKDMd2FDQ
	/7McEtvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDF8-00000008hjE-2w9h;
	Fri, 24 Oct 2025 08:33:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEY-00000008gs1-2gt0;
	Fri, 24 Oct 2025 08:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294792;
	bh=8S0LstnbN6zAZRuT2LKAk9Y7d76WtGheDhDUHqXz5uM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BL2O8pMK+6gQvseCdRvhzkutJYAcJq47VVtrwPSC3p+xLzK38kHspjdFvTER7Q9PQ
	 XbmzeCwh2pgwQDfvXssFnIsyx8yspyKTs2fxBWDWZKep//KWrsnODbsTXDLPdxPxIV
	 wzR5W6+EqVrxobXgS1/biO7nKq9iaZr8Q3x30OWhUVne23Jh+PEoNHT3bpIsGmvx+r
	 waGIBxiBisJj1dJHn5Ub3dSrnc2d2hSKeqFHKNB8F2foeWdYvsnn08pg7CzW0xJrVv
	 l4Ix+y8s5Y5mG5SSjn8v7jjEJ5itRu1YBhTURChgUd+VGSu9cR1zFBnVdjdqZ/8aiy
	 GbQ8CbWg0LDlg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C6AD217E13F9;
	Fri, 24 Oct 2025 10:33:11 +0200 (CEST)
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
Subject: [PATCH v1 3/7] clk: mediatek: clk-mtk: Split and rename __mtk_clk_simple_probe()
Date: Fri, 24 Oct 2025 10:32:57 +0200
Message-ID: <20251024083301.25845-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024083301.25845-1-angelogioacchino.delregno@collabora.com>
References: <20251024083301.25845-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013314_879618_4751ABF0 
X-CRM114-Status: GOOD (  17.26  )
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

In preparation for adding support to register clock controllers
that are not reachable over MMIO but rather over a different bus,
especially SPMI (for PMIC clocks!), split out the current private
__mtk_clk_simple_probe() function in two, make it accept a handle
to regmap in and call it mtk_clk_simple_probe_internal().

The new function is not static, but its symbol is *not* exported:
this is done on purpose, because this is supposed to be usable
only by clock registration helpers inside of clk/mediatek, and
only ones built inside of the same module as clk-mtk, as will be
done in a later change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 58 ++++++++++++++++++++++++----------
 drivers/clk/mediatek/clk-mtk.h |  5 +++
 2 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 19cd27941747..93c7e28ffb5f 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -2,6 +2,8 @@
 /*
  * Copyright (c) 2014 MediaTek Inc.
  * Author: James Liao <jamesjj.liao@mediatek.com>
+ * Copyright (c) 2025 Collabora Ltd
+ *		      AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
 
 #include <linux/bitops.h>
@@ -14,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #include "clk-mtk.h"
@@ -464,26 +467,15 @@ void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_unregister_dividers);
 
-static int __mtk_clk_simple_probe(struct platform_device *pdev,
-				  struct device_node *node)
+int mtk_clk_simple_probe_internal(struct platform_device *pdev,
+				  struct device_node *node,
+				  const struct mtk_clk_desc *mcd,
+				  struct regmap *regmap)
 {
-	const struct platform_device_id *id;
-	const struct mtk_clk_desc *mcd;
 	struct clk_hw_onecell_data *clk_data;
 	void __iomem *base = NULL;
 	int num_clks, r;
 
-	mcd = device_get_match_data(&pdev->dev);
-	if (!mcd) {
-		/* Clock driver wasn't registered from devicetree */
-		id = platform_get_device_id(pdev);
-		if (id)
-			mcd = (const struct mtk_clk_desc *)id->driver_data;
-
-		if (!mcd)
-			return -EINVAL;
-	}
-
 	/* Composite and divider clocks needs us to pass iomem pointer */
 	if (mcd->composite_clks || mcd->divider_clks) {
 		if (!mcd->shared_io)
@@ -653,20 +645,52 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	mtk_free_clk_data(clk_data);
 }
 
+static int mtk_clk_get_desc(struct platform_device *pdev, const struct mtk_clk_desc **d)
+{
+	const struct platform_device_id *id;
+	const struct mtk_clk_desc *mcd;
+
+	mcd = device_get_match_data(&pdev->dev);
+	if (!mcd) {
+		/* Clock driver wasn't registered from devicetree */
+		id = platform_get_device_id(pdev);
+		if (id)
+			mcd = (const struct mtk_clk_desc *)id->driver_data;
+
+		if (!mcd)
+			return -EINVAL;
+	}
+	*d = mcd;
+
+	return 0;
+}
+
 int mtk_clk_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->parent->of_node;
+	const struct mtk_clk_desc *mcd;
+	int ret;
 
-	return __mtk_clk_simple_probe(pdev, node);
+	ret = mtk_clk_get_desc(pdev, &mcd);
+	if (ret)
+		return ret;
+
+	return mtk_clk_simple_probe_internal(pdev, node, mcd, NULL);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_pdev_probe);
 
 int mtk_clk_simple_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
+	const struct mtk_clk_desc *mcd;
+	int ret;
+
+	ret = mtk_clk_get_desc(pdev, &mcd);
+	if (ret)
+		return ret;
 
-	return __mtk_clk_simple_probe(pdev, node);
+	return mtk_clk_simple_probe_internal(pdev, node, mcd, NULL);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
 
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 5417b9264e6d..945fd3ee79ca 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -262,6 +262,11 @@ struct mtk_clk_desc {
 	bool need_runtime_pm;
 };
 
+int mtk_clk_simple_probe_internal(struct platform_device *pdev,
+				  struct device_node *node,
+				  const struct mtk_clk_desc *mcd,
+				  struct regmap *regmap);
+
 int mtk_clk_pdev_probe(struct platform_device *pdev);
 void mtk_clk_pdev_remove(struct platform_device *pdev);
 int mtk_clk_simple_probe(struct platform_device *pdev);
-- 
2.51.1


