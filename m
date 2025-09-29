Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D47CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 12:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oO1g6MVsIwHZqI00UWOe7M4zzpRvLEWu88wj9uOkgOA=; b=Y469PvA/TDwtRQZNZBavbTJM1J
	c6TMAKLMjGz7+x0oxlZND/bUez5xaG+sG2mw0TTyIu9mAfUqqg3W+qOc5JQERp0I3nkwDPnJsGaEx
	Q06YfVC5tm6alib+CirABd9f969Ic/aKtNXBPC4URkkFRNvmz0M681WGBfZiZIJ4/KPm9WeAnyueM
	q7Mvy3lcWsUFG04S3kqbxzQMvXi/UKNtcurqeva5XMWoRbUzof4dtEnGGpXnIO0tsN4tBUmMkfuYX
	4T7pRcHfr6wgN4O8iMtVj2kdboJOO+OAn84KPgCKml/Zr4Gr8QtqKwfY11mtnQtsHiJ5zAjlba6Oy
	y/H/j6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Clr-00000002Rom-3We8;
	Mon, 29 Sep 2025 12:14:23 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Clm-00000002Rj4-1LxA;
	Mon, 29 Sep 2025 12:14:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759148041; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l3IeeCFfddAq9uI/UL9Z1bGtfVcNvp/qVEJ18KqA0m2pXjSHrdvxn1tzBASNztGNUDEpQ6DYz9xDe2gHerdLD7L28dOPj+W32rK35W16DZKlE7lfRE7UxQNrUSHae2lOEEeHlTXM3oWppCM2WnfFyh1Zf5kU824s0L2NGhqckZg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759148041; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oO1g6MVsIwHZqI00UWOe7M4zzpRvLEWu88wj9uOkgOA=; 
	b=DPwhpsFk+q7iIs/sctiye/mx9b9K+KmDeuSIAYFzHnJvVhgw8jOcw5CNewfD/9YfiEJ4g6RwQQZE6C4EoY/4IbWuvCbkfxfC6BXfxMlG3rJVQ5B/VDjPA9Lmd5mf0VrD1XbPyHf5nwK72zMSGXBRNMPW8QftS8E9gGql/n2UO60=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759148041;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=oO1g6MVsIwHZqI00UWOe7M4zzpRvLEWu88wj9uOkgOA=;
	b=H9BMuKhA5abb5FBGv3R7hSPNM4EE9i9hpN7KoDimM7ku/gZtE7Ph3jGbb52UUjTN
	h+sr8BdzJSdy2r3+pZnefnefPEyUqY7q0boos6c2VgY7Uv+pBhVF6HOP1/6MNmuqc9n
	a5P4dLc1N49JC71q3YyA2dprmAuypm1xT0lscqQ4=
Received: by mx.zohomail.com with SMTPS id 1759148039321413.33555808567644;
	Mon, 29 Sep 2025 05:13:59 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 29 Sep 2025 14:13:23 +0200
Subject: [PATCH 4/4] clk: mediatek: Add rpm clocks to clk-mt8196-mfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-mtk-pll-rpm-v1-4-49541777878d@collabora.com>
References: <20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com>
In-Reply-To: <20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Guangjie Song <guangjie.song@mediatek.com>, 
 Laura Nao <laura.nao@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: kernel@collabora.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_051418_428956_69A1979A 
X-CRM114-Status: GOOD (  24.30  )
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

The mfgpll clocks on mt8196 require that the MFG's EB clock is on if
their control registers are touched in any way at all. Failing to ensure
this results in a pleasant SError interrupt if the EB clock happens to
be off.

To achieve this, leverage the CCF core's runtime power management
support. Define the necessary suspend/resume callbacks, add the
necessary code to get RPM clocks from the DT, and make sure RPM is
enabled before clock registration happens.

For the RPM callbacks to really make much sense at all, we change the
drvdata from clk_data to a new private struct, as is common in drivers
across the Linux kernel.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/mediatek/clk-mt8196-mfg.c | 104 +++++++++++++++++++++++++++-------
 drivers/clk/mediatek/clk-pll.h        |   2 +
 2 files changed, 87 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-mfg.c b/drivers/clk/mediatek/clk-mt8196-mfg.c
index 8e09c0f7b7548f8e286671cea2dac64530b8ce47..64cc0c037f62d7eab8d0e7fc00c05d122bf4130c 100644
--- a/drivers/clk/mediatek/clk-mt8196-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8196-mfg.c
@@ -13,6 +13,7 @@
 #include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include "clk-mtk.h"
 #include "clk-pll.h"
@@ -38,7 +39,7 @@
 	    _flags, _rst_bar_mask,				\
 	    _pd_reg, _pd_shift, _tuner_reg,			\
 	    _tuner_en_reg, _tuner_en_bit,			\
-	    _pcw_reg, _pcw_shift, _pcwbits) {			\
+	    _pcw_reg, _pcw_shift, _pcwbits, _rpm_clks) {	\
 		.id = _id,					\
 		.name = _name,					\
 		.reg = _reg,					\
@@ -58,26 +59,60 @@
 		.pcw_shift = _pcw_shift,			\
 		.pcwbits = _pcwbits,				\
 		.pcwibits = MT8196_INTEGER_BITS,		\
+		.rpm_clk_names = _rpm_clks,			\
+		.num_rpm_clks = ARRAY_SIZE(_rpm_clks),		\
 	}
 
+static const char * const mfgpll_rpm_clk_names[] = {
+	NULL
+};
+
 static const struct mtk_pll_data mfg_ao_plls[] = {
 	PLL(CLK_MFG_AO_MFGPLL, "mfgpll", MFGPLL_CON0, MFGPLL_CON0, 0, 0, 0,
-	    BIT(0), MFGPLL_CON1, 24, 0, 0, 0,
-	    MFGPLL_CON1, 0, 22),
+	    BIT(0), MFGPLL_CON1, 24, 0, 0, 0, MFGPLL_CON1, 0, 22,
+	    mfgpll_rpm_clk_names),
 };
 
 static const struct mtk_pll_data mfgsc0_ao_plls[] = {
 	PLL(CLK_MFGSC0_AO_MFGPLL_SC0, "mfgpll-sc0", MFGPLL_SC0_CON0,
 	    MFGPLL_SC0_CON0, 0, 0, 0, BIT(0), MFGPLL_SC0_CON1, 24, 0, 0, 0,
-	    MFGPLL_SC0_CON1, 0, 22),
+	    MFGPLL_SC0_CON1, 0, 22, mfgpll_rpm_clk_names),
 };
 
 static const struct mtk_pll_data mfgsc1_ao_plls[] = {
 	PLL(CLK_MFGSC1_AO_MFGPLL_SC1, "mfgpll-sc1", MFGPLL_SC1_CON0,
 	    MFGPLL_SC1_CON0, 0, 0, 0, BIT(0), MFGPLL_SC1_CON1, 24, 0, 0, 0,
-	    MFGPLL_SC1_CON1, 0, 22),
+	    MFGPLL_SC1_CON1, 0, 22, mfgpll_rpm_clk_names),
 };
 
+struct clk_mt8196_mfg {
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_bulk_data *rpm_clks;
+	unsigned int num_rpm_clks;
+};
+
+static int __maybe_unused clk_mt8196_mfg_resume(struct device *dev)
+{
+	struct clk_mt8196_mfg *clk_mfg = dev_get_drvdata(dev);
+
+	if (!clk_mfg || !clk_mfg->rpm_clks)
+		return 0;
+
+	return clk_bulk_prepare_enable(clk_mfg->num_rpm_clks, clk_mfg->rpm_clks);
+}
+
+static int __maybe_unused clk_mt8196_mfg_suspend(struct device *dev)
+{
+	struct clk_mt8196_mfg *clk_mfg = dev_get_drvdata(dev);
+
+	if (!clk_mfg || !clk_mfg->rpm_clks)
+		return 0;
+
+	clk_bulk_disable_unprepare(clk_mfg->num_rpm_clks, clk_mfg->rpm_clks);
+
+	return 0;
+}
+
 static const struct of_device_id of_match_clk_mt8196_mfg[] = {
 	{ .compatible = "mediatek,mt8196-mfgpll-pll-ctrl",
 	  .data = &mfg_ao_plls },
@@ -92,35 +127,60 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_mfg);
 static int clk_mt8196_mfg_probe(struct platform_device *pdev)
 {
 	const struct mtk_pll_data *plls;
-	struct clk_hw_onecell_data *clk_data;
+	struct clk_mt8196_mfg *clk_mfg;
 	struct device_node *node = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	const int num_plls = 1;
-	int r;
+	int r, i;
 
-	plls = of_device_get_match_data(&pdev->dev);
+	plls = of_device_get_match_data(dev);
 	if (!plls)
 		return -EINVAL;
 
-	clk_data = mtk_alloc_clk_data(num_plls);
-	if (!clk_data)
+	clk_mfg = devm_kzalloc(dev, sizeof(*clk_mfg), GFP_KERNEL);
+	if (!clk_mfg)
 		return -ENOMEM;
 
-	r = mtk_clk_register_plls(&pdev->dev, plls, num_plls, clk_data);
+	clk_mfg->num_rpm_clks = plls[0].num_rpm_clks;
+
+	if (clk_mfg->num_rpm_clks) {
+		clk_mfg->rpm_clks = devm_kcalloc(dev, clk_mfg->num_rpm_clks,
+						 sizeof(*clk_mfg->rpm_clks),
+						 GFP_KERNEL);
+		if (!clk_mfg->rpm_clks)
+			return -ENOMEM;
+
+		for (i = 0; i < clk_mfg->num_rpm_clks; i++)
+			clk_mfg->rpm_clks->id = plls[0].rpm_clk_names[i];
+
+		r = devm_clk_bulk_get(dev, clk_mfg->num_rpm_clks,
+				      clk_mfg->rpm_clks);
+		if (r)
+			return r;
+	}
+
+	clk_mfg->clk_data = mtk_alloc_clk_data(num_plls);
+	if (!clk_mfg->clk_data)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, clk_mfg);
+	pm_runtime_enable(dev);
+
+	r = mtk_clk_register_plls(dev, plls, num_plls, clk_mfg->clk_data);
 	if (r)
 		goto free_clk_data;
 
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
+				   clk_mfg->clk_data);
 	if (r)
 		goto unregister_plls;
 
-	platform_set_drvdata(pdev, clk_data);
-
 	return r;
 
 unregister_plls:
-	mtk_clk_unregister_plls(plls, num_plls, clk_data);
+	mtk_clk_unregister_plls(plls, num_plls, clk_mfg->clk_data);
 free_clk_data:
-	mtk_free_clk_data(clk_data);
+	mtk_free_clk_data(clk_mfg->clk_data);
 
 	return r;
 }
@@ -128,20 +188,26 @@ static int clk_mt8196_mfg_probe(struct platform_device *pdev)
 static void clk_mt8196_mfg_remove(struct platform_device *pdev)
 {
 	const struct mtk_pll_data *plls = of_device_get_match_data(&pdev->dev);
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct clk_mt8196_mfg *clk_mfg = dev_get_drvdata(&pdev->dev);
 	struct device_node *node = pdev->dev.of_node;
 
 	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, 1, clk_data);
-	mtk_free_clk_data(clk_data);
+	mtk_clk_unregister_plls(plls, 1, clk_mfg->clk_data);
+	mtk_free_clk_data(clk_mfg->clk_data);
 }
 
+static DEFINE_RUNTIME_DEV_PM_OPS(clk_mt8196_mfg_pm_ops,
+				 clk_mt8196_mfg_suspend,
+				 clk_mt8196_mfg_resume,
+				 NULL);
+
 static struct platform_driver clk_mt8196_mfg_drv = {
 	.probe = clk_mt8196_mfg_probe,
 	.remove = clk_mt8196_mfg_remove,
 	.driver = {
 		.name = "clk-mt8196-mfg",
 		.of_match_table = of_match_clk_mt8196_mfg,
+		.pm = pm_ptr(&clk_mt8196_mfg_pm_ops),
 	},
 };
 module_platform_driver(clk_mt8196_mfg_drv);
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index 0f2a1d19eea78b7390b221af47016eb9897f3596..82b86b849a67359d8f23d828f50422081c2747e3 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -53,6 +53,8 @@ struct mtk_pll_data {
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 	u8 pcw_chg_bit;
 	u8 fenc_sta_bit;
+	const char * const *rpm_clk_names;
+	unsigned int num_rpm_clks;
 };
 
 /*

-- 
2.51.0


