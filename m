Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFA2CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4Gl+sGd+5M6eL6jAwWWBS7MqC+3SN+gEIe9ESRruM0=; b=wq4YnclmjPseoMrP+3DarOLGUc
	0lq/hrj7KITa2BHysltSmiE6mzliPPLU1OE0rFA0YZr2GD86ABwZqJLRjgmclXPcamz1ULc/Yae9C
	oN5vd54uie2lhfQTl9jMZmdPCE9yPHtPcLcNQ7DIcVshXlPPYXHNuo2Umq51HafwdKlAIM3Ky0gte
	B2KQdlQIXqIqxQYNbOKkpF0HPIwpFkRX5kBt3h4e/S0tRVW8Js5WJ0b6ZTmtU6c353VydmuLrn0fX
	dBtBdbukEAljTGN5dl3wqrln0ZaguZwoCvKdP6GqzSJnBSvaz+2YIQE2Cs5FhLoROFdq+6k0Nt8Aj
	BgcUi93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeJM-0000000DIOD-3VFT;
	Tue, 13 Oct 2026 15:21:04 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeIT-0000000DHfi-1lTi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:20:12 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-881269371acso2513749b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904808; x=1792509608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4Gl+sGd+5M6eL6jAwWWBS7MqC+3SN+gEIe9ESRruM0=;
        b=SOdvBNd84AAIQwae06piUv922j2voAWTxtWfZnWw4V3bcLzPaJReWqJfHN1cw+zPPJ
         RC2zgkfqDI7NF96z+GJkf+8uKT8+buP0lyEkMttGCKSha29MrYwOJc7XOCic0sMM/Val
         HVv3BwdHu7XkYY+eiCq7Ap5FrpdjKBSjH+4wBuuDe3xOjUeyswN5KguPLK+HYw8oGOJh
         Cg7qgwRNJH/8NeV2iezsC+ohscr33YRIel0TfzNXy0npUfYJ3egSeGziDg/Zlo7LIts5
         N2a7m/GayZSnLaL6xXMDguZfrfnpaa5/qLZCu/nIxvryGcxQogJqR8HRFTQxkx3bzHEE
         iVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904808; x=1792509608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B4Gl+sGd+5M6eL6jAwWWBS7MqC+3SN+gEIe9ESRruM0=;
        b=rz1flaj/d8nSrdk0teeyC6SfTm9rVrIfY1k6mD7jvHA6oJ1uG3uCYweH7+078wCVr2
         xpRnNly4i31z642v1DZdjS9cDBNsiPhYhKqSCaivfl/CDJmeFUFtjWHG7Ap5glCQIPeQ
         mv5D9MRBFUIFVal2OTu+mOeoNQ2H2WL1F4QuXZ1j5hwHcaHX52RB5SbG7WFKtRJw5Tbl
         sfUrM2zSN8bneXWliq2w2nC9kNtzEHvcWs8zIARMvmCr+LbqkTYY95OtKORC/vNegE2r
         4kHbnCWd/pKq+fbBIcLdPLh7Kx7yKHAgpCbpKIxUfy3AmbdW7ZM7mADnd3KOWUDetvGu
         7GGw==
X-Forwarded-Encrypted: i=1; AKwUvBw8QxC1iinfV3f5WQBlv+j0VjTbdzIMKb736IRWC1adWbv0AY4D5ieqMO8xQPz2RvfE9QCB+GcboT3sn7Q1hVEJ@lists.infradead.org
X-Gm-Message-State: AFq9FYIU3/YdBfUBHt22G34+JraGuO3zuD6VNM+1tL+/M+5j+GSLslQw
	jZPTOiLiJC9E1yzPCcrP+8GSKvk3Qj5WuYJ31l5NORh5G3csH8ptICfZ
X-Gm-Gg: AYBFou0bSr4yYBEU+S8frM6JtqubHszz7KEr4HyMXf+y53vWHafj/2ivL37OXlIZuZX
	QQP39AzHLOsBPQvxO9mWpWdek21Z16sZE48Ht7wcl55ceTFqXrnbFPLyzbS5uUQqb8eYdTOskwL
	9/3VnCRTD+W7o10X/NfxEMtguqJZCOg/NPKxyCDtPRuGNBU2telzEZS35M4nh7Xf70jSYReLxSv
	kQnC8u8JcCYhN3g2QUlLNYdvW342ZcbYpjgd7vV1qoMJCUHzYyRlQhRVBtYDHk5yAxpCZIltGGM
	8Sf4F6j0KFdqH0/tUFMAm9FD/jwAvlvi/wiuwrf6vzTzDEwcdrWLffecSrllF7BT4fOBmm6MCh2
	TPXbsuZEqZYZ7ymJkjGj6jF4lE5vYnzPqwHIsgeNK0XMgkCLPC0xLjwOTqxNY+lLz46ffIB73AL
	VfeDcze8lUoP4Ebj4RzIPGDV/Vu0RYtctoCDGCNmaY2hIrO/UTaQzwONdAVBfgWY6e5ovzzluah
	eqmUzSzH+C1iYTcCfX1Kxm5/YZ8cdxdbYCcZFU=
X-Received: by 2002:a05:6a20:a11f:b0:3e1:3734:63e0 with SMTP id adf61e73a8af0-3e16bec52eamr8017289637.41.1791904808186;
        Tue, 13 Oct 2026 08:20:08 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:07 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 22/35] clk: mediatek: mt7622: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:21 +0900
Message-ID: <20261013151734.3177690-23-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_082009_516408_AA0F2151 
X-CRM114-Status: GOOD (  18.51  )
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

The MT7622 apmixedsys driver used custom probe/remove callbacks to
register PLLs. The infracfg driver also needed CPU mux registration,
and the audsys driver needed child-device population.
With PLL, CPU mux, and child-device population support available in the
common helpers, all three drivers can use mtk_clk_simple_probe()
and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 62 +++--------------
 drivers/clk/mediatek/clk-mt7622-aud.c        | 35 +---------
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 72 +++-----------------
 3 files changed, 23 insertions(+), 146 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index fae8abda14b3..e9f731eadace 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -80,66 +80,22 @@ static const struct mtk_gate apmixed_clks[] = {
 	GATE_APMIXED_AO(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
 };
 
-static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_devm_alloc_clk_data(dev, CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (ret)
-		return ret;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-				     ARRAY_SIZE(apmixed_clks), clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_gates:
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-
-	return ret;
-}
-
-static void clk_mt7622_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+};
 
 static const struct of_device_id of_match_clk_mt7622_apmixed[] = {
-	{ .compatible = "mediatek,mt7622-apmixedsys" },
+	{ .compatible = "mediatek,mt7622-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_apmixed);
 
 static struct platform_driver clk_mt7622_apmixed_drv = {
-	.probe = clk_mt7622_apmixed_probe,
-	.remove = clk_mt7622_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7622-apmixed",
 		.of_match_table = of_match_clk_mt7622_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt7622-aud.c b/drivers/clk/mediatek/clk-mt7622-aud.c
index a4ea5e20efa2..6004c58be1b5 100644
--- a/drivers/clk/mediatek/clk-mt7622-aud.c
+++ b/drivers/clk/mediatek/clk-mt7622-aud.c
@@ -110,38 +110,9 @@ static const struct mtk_gate audio_clks[] = {
 static const struct mtk_clk_desc audio_desc = {
 	.clks = audio_clks,
 	.num_clks = ARRAY_SIZE(audio_clks),
+	.populate_children = true,
 };
 
-static int clk_mt7622_aud_probe(struct platform_device *pdev)
-{
-	int r;
-
-	r = mtk_clk_simple_probe(pdev);
-	if (r) {
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-		return r;
-	}
-
-	r = devm_of_platform_populate(&pdev->dev);
-	if (r)
-		goto err_plat_populate;
-
-	return 0;
-
-err_plat_populate:
-	mtk_clk_simple_remove(pdev);
-	return r;
-}
-
-static void clk_mt7622_aud_remove(struct platform_device *pdev)
-{
-	of_platform_depopulate(&pdev->dev);
-	mtk_clk_simple_remove(pdev);
-}
-
 static const struct of_device_id of_match_clk_mt7622_aud[] = {
 	{ .compatible = "mediatek,mt7622-audsys", .data = &audio_desc },
 	{ /* sentinel */ }
@@ -149,8 +120,8 @@ static const struct of_device_id of_match_clk_mt7622_aud[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_aud);
 
 static struct platform_driver clk_mt7622_aud_drv = {
-	.probe = clk_mt7622_aud_probe,
-	.remove = clk_mt7622_aud_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7622-aud",
 		.of_match_table = of_match_clk_mt7622_aud,
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cec19447d637..2e463d1481d0 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#include "clk-cpumux.h"
 #include "clk-gate.h"
 #include "clk-mtk.h"
 #include "reset.h"
@@ -51,76 +50,27 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 };
 
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &clk_rst_desc,
+};
+
 static const struct of_device_id of_match_clk_mt7622_infracfg[] = {
-	{ .compatible = "mediatek,mt7622-infracfg" },
+	{ .compatible = "mediatek,mt7622-infracfg", .data = &infra_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_infracfg);
 
-static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	void __iomem *base;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, infra_clks,
-				     ARRAY_SIZE(infra_clks), clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
-					ARRAY_SIZE(cpu_muxes), clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_cpumuxes;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_cpumuxes:
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-unregister_gates:
-	mtk_clk_unregister_gates(infra_clks, ARRAY_SIZE(infra_clks), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return ret;
-}
-
-static void clk_mt7622_infracfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-	mtk_clk_unregister_gates(infra_clks, ARRAY_SIZE(infra_clks), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt7622_infracfg_drv = {
 	.driver = {
 		.name = "clk-mt7622-infracfg",
 		.of_match_table = of_match_clk_mt7622_infracfg,
 	},
-	.probe = clk_mt7622_infracfg_probe,
-	.remove = clk_mt7622_infracfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt7622_infracfg_drv);
 
-- 
2.56.0


