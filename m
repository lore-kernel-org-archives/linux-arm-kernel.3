Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157D3C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tymp/Vt4S5+XSPW8UjzWdeMF26jfzeYKksb+zkcmqKs=; b=qfHgwswQUPjRPVFK0XcFJsZUuY
	jqs1ty7W6uMnAkoemd88RYB0hCpNlPbB+0D5lOP7XVVCeKdh7MuXrR6PpV9sv8HLwGQqA2YvFfptd
	Ou+Zc3iNEUu5zs1JGstmnczoZae47W4VdFe+WL1wuQjTy2FHmmd1FKfzFwRDxRjrxHeYkvCO25VTU
	QfmgRZ15iA4JBx7vleAQasxEu1nFSNpk6YQav7Nwy0cLowJzXdVWugEJymzxSkP8DbwWCVluN6f0n
	kCOLbLszfrEfYfu5yPPpkd1ljcDVQazzY3roHEE7YESyabyLb4Ze+uGUXjgc76Ikd8nQGf0yokKOE
	Prv1Uwcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WK3-00000002cGT-36Do;
	Fri, 04 Sep 2026 15:59:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WJo-00000002bha-3LG4;
	Fri, 04 Sep 2026 15:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537547;
	bh=nMeyY06EOfx0vESy7Xk1OSBkWXqd9xnXY6V0LsKPumI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pW1V5EotjqK2xl77lsCVkRaqA7GirTiysnhTjDETrFu5bmSX9HzNuEDjgHQd3WEdj
	 1x1ClkEHUgfYuU23HbIayYlvgMyHa8xeGIolr59ol1DeVA38qEfbeExIYj5BVNcaaR
	 bWhKsRdI5VdMq+OlNOr2Tq+LGF4UNVrnXfsj3D093kRvpnxrtOnbnjH5kDVAnJUElm
	 Jui3hNgbe2vlTeZKeTAkmfdWPA3NxSPsk9mB6ETJv2+yMHRSkOiZcKSB+M1bqS9j4K
	 ADroX3Kf7nEjjmeb1ejXeZdm6Sp+OksCaHPrGlwRGyAlyZ3YFBpKQnoloNU8Jjgrah
	 Bv2TRAWEq2bZw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D12F117E1023;
	Fri, 04 Sep 2026 17:59:05 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:27 +0200
Subject: [PATCH v6 16/27] clk: mediatek: Move fhctl_parse_dt call into
 mtk_clk_register_pllfhs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-16-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=7115;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=nMeyY06EOfx0vESy7Xk1OSBkWXqd9xnXY6V0LsKPumI=;
 b=1SKsMeMoCDyzxqq0sn/6HXcDLmGa7Byn+TqzhC1ivIqdHMA9HOha2Y6aUfeud7WgV8eW58+sl
 duQqiRnNvGPAVBDAGv/zQs9rSPmJ4Y+Gx40aIK3GFFeQ7w6y+Tvi8jc
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_085908_997864_1BD3801B 
X-CRM114-Status: GOOD (  16.51  )
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

Currently, in the probe functions of apmixedsys drivers with PLL
frequency hopping support (FHCTL), the call to mtk_clk_register_pllfh
is always preceded by a call to fhctl_parse_dt.

This function purpose is to prepare FHCTL-related internal data, that
are then used by mtk_clk_register_pllfhs. It is not used in another
case and both functions are implemented in the same source file
(clk-pllfh.c). There is little interest to keep as it this call
sequence in the several probe functions.

So, add an additional parameter (compatible name string) in
mtk_clk_register_pllfhs and move the fhctl_parse_dt call into it.
Finally, make this function private by removing it from clk-pllfh.h
include, remove its EXPORT_SYMBOL_GPL macro use and add the static
keyword.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c |  3 +--
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c |  5 ++---
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  4 +---
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  4 +---
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  4 +---
 drivers/clk/mediatek/clk-pllfh.c             | 10 ++++++----
 drivers/clk/mediatek/clk-pllfh.h             |  5 +----
 7 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..a860708ef908 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -151,8 +151,7 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-	ret = mtk_clk_register_pllfhs(dev, plls, ARRAY_SIZE(plls),
+	ret = mtk_clk_register_pllfhs(dev, fhctl_node, plls, ARRAY_SIZE(plls),
 				      pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (ret)
 		goto free_clk_data;
diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..8920eb1c3fa6 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -156,9 +156,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 		goto unmap_io;
 	}
 
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-	r = mtk_clk_register_pllfhs(dev, plls, ARRAY_SIZE(plls), pllfhs,
-				    ARRAY_SIZE(pllfhs), clk_data);
+	r = mtk_clk_register_pllfhs(dev, fhctl_node, plls, ARRAY_SIZE(plls),
+				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_clk_data;
 
diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
index d35dd2632e43..e8fc6bd90fcb 100644
--- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -149,9 +149,7 @@ static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-
-	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
+	r = mtk_clk_register_pllfhs(&pdev->dev, fhctl_node, plls, ARRAY_SIZE(plls),
 				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_apmixed_data;
diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index b0563a285bd6..2e4f5aff9eee 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -160,9 +160,7 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-
-	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
+	r = mtk_clk_register_pllfhs(&pdev->dev, fhctl_node, plls, ARRAY_SIZE(plls),
 				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_clk_data;
diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index a120c3305547..12e51b39b764 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -178,9 +178,7 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-
-	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
+	r = mtk_clk_register_pllfhs(&pdev->dev, fhctl_node, plls, ARRAY_SIZE(plls),
 				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_apmixed_data;
diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index f36dbc7fa06d..398edad2a69e 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -69,8 +69,9 @@ static struct mtk_pllfh_data *get_pllfh_by_id(struct mtk_pllfh_data *pllfhs,
 	return NULL;
 }
 
-void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
-		    int num_fhs)
+static void fhctl_parse_dt(const u8 *compatible_node,
+			   struct mtk_pllfh_data *pllfhs,
+			   int num_fhs)
 {
 	void __iomem *base;
 	struct device_node *node;
@@ -121,7 +122,6 @@ void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
 	iounmap(base);
 	goto out_node_put;
 }
-EXPORT_SYMBOL_GPL(fhctl_parse_dt);
 
 static int pllfh_init(struct mtk_fh *fh, struct mtk_pllfh_data *pllfh_data)
 {
@@ -252,7 +252,7 @@ static void mtk_clk_cleanup_pllfhs(void __iomem *iomem_base,
 }
 
 
-int mtk_clk_register_pllfhs(struct device *dev,
+int mtk_clk_register_pllfhs(struct device *dev, const u8 *fhctl_node,
 			    const struct mtk_pll_data *plls, int num_plls,
 			    struct mtk_pllfh_data *pllfhs, int num_fhs,
 			    struct clk_hw_onecell_data *clk_data)
@@ -261,6 +261,8 @@ int mtk_clk_register_pllfhs(struct device *dev,
 	int i;
 	struct clk_hw *hw;
 
+	fhctl_parse_dt(fhctl_node, pllfhs, num_fhs);
+
 	base = of_iomap(dev->of_node, 0);
 	if (!base) {
 		pr_err("%s(): ioremap failed\n", __func__);
diff --git a/drivers/clk/mediatek/clk-pllfh.h b/drivers/clk/mediatek/clk-pllfh.h
index a9eb7558de1c..07269e467e34 100644
--- a/drivers/clk/mediatek/clk-pllfh.h
+++ b/drivers/clk/mediatek/clk-pllfh.h
@@ -71,7 +71,7 @@ struct fh_operation {
 
 extern const struct clk_ops mtk_pllfh_setclr_ops;
 
-int mtk_clk_register_pllfhs(struct device *dev,
+int mtk_clk_register_pllfhs(struct device *dev, const u8 *fhctl_node,
 			    const struct mtk_pll_data *plls, int num_plls,
 			    struct mtk_pllfh_data *pllfhs, int num_pllfhs,
 			    struct clk_hw_onecell_data *clk_data);
@@ -80,7 +80,4 @@ void mtk_clk_unregister_pllfhs(const struct mtk_pll_data *plls, int num_plls,
 			       struct mtk_pllfh_data *pllfhs, int num_fhs,
 			       struct clk_hw_onecell_data *clk_data);
 
-void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
-		    int num_pllfhs);
-
 #endif /* __CLK_PLLFH_H */

-- 
2.55.0


