Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAC8C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeejemYXNeCI+G618X39Md1/hOA1PJGV3DxHUDmwxX4=; b=2cFCTW/SzYxjGDHjR6eW8NPgPz
	Uuoy08zm25E+n2usf1xnPe9eFSJ4+CbpznSdmYtsjba3QYeyhg6UIfVObF8RAIObZx1l3ChEHWE5C
	LWDc8tJtStrrRfj5MWIQ9M+eBd2au/sxFl/47PAEjKiewvdS7gp7+CZ7LHXiR74Z/5aGmmJQdUJBC
	aT1OXQZAd8QrhTWIOeL7tuPvd9A07PMs/PvkIs00PWoaZ0S+IcQjJLnJe6gwnbkBAFPnGVfEQXjNz
	4mfcUFN08CwlpP30rHfwe04kHlg+D612VSmvRkkglM25U1flZ5TnNakkey1O879N7gPfRhBwYjmXi
	B4t+0V+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVJ-0000000HLQf-0EM8;
	Mon, 03 Aug 2026 14:18:57 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVG-0000000HLMT-0ftS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:55 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so2873980a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766733; x=1786371533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HeejemYXNeCI+G618X39Md1/hOA1PJGV3DxHUDmwxX4=;
        b=q63raIQvDF8VPW+j3BFzZOougxCoAytmGW1PN1yCXqillZkiMj5PDeDZoM6Lhgm+qc
         02kjSIgC9NlHPu1BXRag6aTxCFAToORl5w8Wox/KGTf2ikeLAjctAFw5CRwZfVr4O/SQ
         hj3/7x1EsynC9Jx4CpQDIyBmV0972YXv9BnhE7+kb8d0/MziEYEGL5bYL58aEoVi4lXD
         1DE+TF0R4r7vHpz5BeB/9HALOvH0meegCHCyENFCE/n9I7w8f5HSskoP/XNIpJmdMES5
         zBvDoWb9hRIzxKIGkDWuglR6G2dpytclHlF29CkwgonwVPUVBC4cwU1m4XimqwLEGgYS
         +7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766733; x=1786371533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HeejemYXNeCI+G618X39Md1/hOA1PJGV3DxHUDmwxX4=;
        b=DPut8FxurDGUDzAfulZZWKeeFx7QdEQ7putEr8OODIaNL2qwbv0tcOwwm469zEsa+g
         d4F/MroQ8Kep1B61PehbM0nU1BbzBxXGaxbTWt4cdik0pvPJ3Ivonm0d7KfpJSrzFHzt
         OkqpJSbWnVhlhy5r6LcwMACKaaUK0+opPLcJ7X97nNPbmPdmDWbKvoBSALJNK4vetjze
         WFlemZiqSLAtCamfkkWyfQtTo2DUtPF2kv959BgJ2FsmZdQ4e2A0SJZBavuWwM5NV1Np
         JKmRfqzPGeNggtAfEnR8TzpcwxtmzlRkblVkX+BXuIv1YHwPzpUDyX3Uc4ZvL2pIpvEP
         wF9w==
X-Forwarded-Encrypted: i=1; AHgh+Rr+kFywJv0pPi2HzKyKhPRLdXzlCVV+Bf4/Wofc22Lfhrj1Hy5Opq5m18Skjfs2uLFSKprl2k5sMVwA+W9E/Guf@lists.infradead.org
X-Gm-Message-State: AOJu0YwZJAvPodw8xG60VPlP9xwJIpHHM6M4PPloUcw6o0Yev39S3bXx
	AYoGMTfUlOeiudlrg9o3om9GQ9a+wnYh7ds1P33HngUriWG0ITSmg8sd
X-Gm-Gg: AR+sD12sIR60bW90bnvfzWUq0z8VoGgnYd5+bNznGVgrzAWTB8+bflg61ZzszK8n9LM
	E8vg/6weFZEcbqpKZarLuK+gpLv8hSgNJNutjj2B1YAgpd8WC9X7TLUd+pkkjL5KdV6VMMlXC3d
	p9eCxutiiVY8kPODcBD7dfuWDNnTgoBBwe+vVeSmnklKma8v8g7qQzLwe8RlmsO8oHJWm4+j1lS
	qJbP2iWCPV7JrPyxQoKrI3bLs9SE/eAZLoch2HbJI4ItJdl5KS//yNXtD4mcGgLPv/pFxJu5iN7
	SdUA2mjYAb/qSwZFSr9aStMO8PgwAoLShLeAqgR8DL/UjWjcNX0btTMnm530w0ljef+baEuNrAz
	9PVjAHyrzVyXmq5GQ1tdjNTFTSr7DmqATICqJZfP0tCiVkPJnRp78SAdnsCjhM+1ghO3xUP0qe8
	XDN3xU6KYjjdQ2Jw7FpGoEsoH+YMXLtakB9sjw8ZHSQQYDvDHEePDlZM2tBwMa20ZRgd1KdrQtH
	vKVUNnBh6GmlzoTrH9m
X-Received: by 2002:a17:90b:2251:b0:384:5dbc:cba5 with SMTP id 98e67ed59e1d1-38fbc4cdedamr9398208a91.26.1785766733423;
        Mon, 03 Aug 2026 07:18:53 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:53 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 19/32] clk: mediatek: mt7622: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:46 +0900
Message-ID: <20260803141659.559129-20-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071854_241948_342AE0AE 
X-CRM114-Status: GOOD (  17.64  )
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

The MT7622 clock drivers can use the MediaTek clock framework common
initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
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
2.55.0


