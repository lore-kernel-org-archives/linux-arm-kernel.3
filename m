Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF537C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfbhvjCps3TvY9ALK0rieR0dmwrL7uiQ1/04JBGNXFs=; b=2yXREZnApZ9m9Ss7XEvD/ktDRB
	tV/6PL3k6+mbdF3oPO/+QXaodsVpDKFpEzX3FWYMXJsUwdVFq5+5VchoAmO/DOAItqRqUPfnAEQT2
	DjoXKGrRJ3ZK1enHZETq0S1E9VEQiy4CsSBR7JxJQV2eRgEXX3CxaWXHHwNaw/nj/Iyo2X/SITGsK
	dCv+ILnMwQRnlwIhMKchcQnBBh/y2mGZXgc5y1+UYV+ZxvVD7gFkLfe2hlR7iXf5D5jhd2L/3ixam
	52fdcEJ9GqC/6BCapg0ORv2QRqV3Ve3pMWzxLhwP+2rM08uFZPUGuu31mLJikRZxH2sB4LSG3LLQ8
	G8bP0/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtV9-0000000HLDX-21iD;
	Mon, 03 Aug 2026 14:18:47 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtV6-0000000HL9X-3mqu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:46 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2592890a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766724; x=1786371524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfbhvjCps3TvY9ALK0rieR0dmwrL7uiQ1/04JBGNXFs=;
        b=cqz5dJc+Q7GmwvQPPN3692D6bAenRB4ccCwzeKSOGWWUPnpGVpicHX68iG+EjT+hzY
         odW8/55eYn6GIS6PKgVsmexfQzyK8eCkTOHdUW1GomgdYHgUpK0uszcDPGfbzv/oAaJu
         8vA/52LPp02n5swnNazWeNvOrwNPit82QplITHEnW9fKlwm229cIWX5OlX+/hWtg/du6
         MAHtxCXcHITNpimjtNgOlPYT6QrHnw9/d/gEgmSHjOeBwU+7tZlgKZKCh2Qp7DoPRLbT
         uGnwkV4rND3TNr951BgW18NucT9Q+SAVQ4qR+s1bpNmNXCAWNvoYb5mUIuq0hTyN1kG4
         CtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766724; x=1786371524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bfbhvjCps3TvY9ALK0rieR0dmwrL7uiQ1/04JBGNXFs=;
        b=Kw3KYKi1ZmWe1mnNJUioSwTnzZ+tuhCtzctiEifGIQ5TMtrg71dt4um+sOhIr7yxMQ
         pbX8x5LzaN86UPDXvBHM3MEJNTga8K+XiWCKYtPkc/Dqei43YANPAgCCeH9nPMhUmC7j
         Cy0TPengMC1X62E1fM14fuWK9mAJi+DKzseZpshgoUMGzdvv+cpAtHYjO7AHe7bbn43I
         NFX/qsfjpgDjjAsJO0vdB/lyEo8xF0pBvlzU4DFnHsTJrRwF/qasD9DUinm5c4aYECqO
         dBgdev9xFnB2TmmiCO8oYLhrrShDAcyAgvNRpKg3/2jkWI9/VNIHSGAZAILyo1Xniehx
         mo+w==
X-Forwarded-Encrypted: i=1; AHgh+RoyLAuGjJwZ35fM73Db8fRSrcmjB7MjBveOzvARh12kqXXD9WOh3h5phwllPR2FiaqZ7W1G7efwxeDOZqsafeIB@lists.infradead.org
X-Gm-Message-State: AOJu0YyBLECpHLI52JXpGUVcDe81AcKi5XPvyIVV5fzbNUJAD0TMwLf/
	/Y0a/7kC35JIqPdMRUxxPgSMa9Xg/iMi4gvxR4DUhuKjkpWwZ6Sa4uNj
X-Gm-Gg: AR+sD10w/i79ZyU3OFIzHEiSCTJF4hV3PNTvBDosZ8gNvYhBC5K4SreEVumFyDUhJ1X
	Aiq/hRbaMpBg4uOeip1kOq4xMiZxV+fPENeLTfp1hjiEexB5Szp4yybxYc8d/2vh9dRlpM6mraT
	D2ROHveBMJoobvYl++cLwM7HCYzjNplyiCv0hIjpgn47lviqpH+WLCs1KnmIKqaMAZ0Gt3jTogV
	h6GunOemHaTAeMpQGUfjJItuLyXtczX15OgWc/iYhxYVWzq1JRdhcBbLXa6lP9VhQE3Qp/n2xdH
	YgpcJ6ry6Z2jBMu//7iwWmm4irBabIhdHqFp7S+naJebRie+W8ub7v2qWCjXrTZK8dEfa3rySOj
	xCNyq6i1/UmS8rvZADehT/q2GQzIgXcdAk1WfQtfXC/Rv2oT1DzF1Pl1kdIuGLRjP1flvWer1/s
	4gFcTKfCpfZYkaLmgWToRPwhvIUCrBNmyG2o0pb11OwViWT2e2/DMY2lejlJWigE+8ZwUwLlSOJ
	DoEiYUF8rJqCPKHk3de
X-Received: by 2002:a17:90b:5690:b0:38e:5ab7:ce9b with SMTP id 98e67ed59e1d1-38fbc4bc25dmr8700516a91.21.1785766724256;
        Mon, 03 Aug 2026 07:18:44 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:43 -0700 (PDT)
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
Subject: [PATCH 17/32] clk: mediatek: mt6795: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:44 +0900
Message-ID: <20260803141659.559129-18-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071844_976688_679848FF 
X-CRM114-Status: GOOD (  17.94  )
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

The MT6795 infracfg and pericfg drivers can use the MediaTek clock
framework common initialization sequence. Reduce boilerplate code by
creating struct mtk_clk_desc and using the mtk_clk_simple_probe/remove
helpers.

Note that the apmixedsys driver is excluded from this conversion because
it requires ref2usb_tx clock handling, which is not currently supported
by the common simple probe helper.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-infracfg.c | 72 ++++-----------------
 drivers/clk/mediatek/clk-mt6795-pericfg.c  | 73 ++++------------------
 2 files changed, 23 insertions(+), 122 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index 914bb069aa85..6aefc577ece5 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -8,7 +8,6 @@
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include "clk-cpumux.h"
 #include "clk-gate.h"
 #include "clk-mtk.h"
 #include "reset.h"
@@ -77,76 +76,27 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_idx_map_nr = ARRAY_SIZE(infra_ao_idx_map),
 };
 
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_gates,
+	.num_clks = ARRAY_SIZE(infra_gates),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &clk_rst_desc,
+};
+
 static const struct of_device_id of_match_clk_mt6795_infracfg[] = {
-	{ .compatible = "mediatek,mt6795-infracfg" },
+	{ .compatible = "mediatek,mt6795-infracfg", .data = &infra_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_infracfg);
 
-static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
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
-	ret = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
-				     ARRAY_SIZE(infra_gates), clk_data);
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
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return ret;
-}
-
-static void clk_mt6795_infracfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt6795_infracfg_drv = {
 	.driver = {
 		.name = "clk-mt6795-infracfg",
 		.of_match_table = of_match_clk_mt6795_infracfg,
 	},
-	.probe = clk_mt6795_infracfg_probe,
-	.remove = clk_mt6795_infracfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt6795_infracfg_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index 27d0ef7d7b2f..53c79e830b6a 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -85,77 +85,28 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_idx_map_nr = ARRAY_SIZE(peri_idx_map),
 };
 
+static const struct mtk_clk_desc pericfg_desc = {
+	.clks = peri_gates,
+	.num_clks = ARRAY_SIZE(peri_gates),
+	.composite_clks = peri_clks,
+	.num_composite_clks = ARRAY_SIZE(peri_clks),
+	.rst_desc = &clk_rst_desc,
+	.clk_lock = &mt6795_peri_clk_lock,
+};
+
 static const struct of_device_id of_match_clk_mt6795_pericfg[] = {
-	{ .compatible = "mediatek,mt6795-pericfg" },
+	{ .compatible = "mediatek,mt6795-pericfg", .data = &pericfg_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_pericfg);
 
-static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
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
-	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, peri_gates,
-				     ARRAY_SIZE(peri_gates), clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_composites(&pdev->dev, peri_clks,
-					  ARRAY_SIZE(peri_clks), base,
-					  &mt6795_peri_clk_lock, clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_composites;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_composites:
-	mtk_clk_unregister_composites(peri_clks, ARRAY_SIZE(peri_clks), clk_data);
-unregister_gates:
-	mtk_clk_unregister_gates(peri_gates, ARRAY_SIZE(peri_gates), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return ret;
-}
-
-static void clk_mt6795_pericfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_composites(peri_clks, ARRAY_SIZE(peri_clks), clk_data);
-	mtk_clk_unregister_gates(peri_gates, ARRAY_SIZE(peri_gates), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt6795_pericfg_drv = {
 	.driver = {
 		.name = "clk-mt6795-pericfg",
 		.of_match_table = of_match_clk_mt6795_pericfg,
 	},
-	.probe = clk_mt6795_pericfg_probe,
-	.remove = clk_mt6795_pericfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt6795_pericfg_drv);
 
-- 
2.55.0


