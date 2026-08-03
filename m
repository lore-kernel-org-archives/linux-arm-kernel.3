Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EA4C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbvI0ggZq8PjkiNtxEJqo1Oe8mNxS+rnGJpGxPDJVZs=; b=U1I01aVLSBydH4q5Vga/LXiXz3
	UZoQn6lRvnWhXgtMs029jRbvD0r90Ze4ApQ2jhC/CQdCxwWabGLI1mI/cQ7kFLS3xIt9dUGotd5GC
	yjbMIOKrsVSpltR9vPVmOLZe4YfLYw0b+X76HjHLj1Nox45VSXm8EGQoXxc8sHr/THe0u24kfOQZ7
	F+Nze9N5jcdl5N+BD25nMVf+DsQMCWTDK/5jbclnkSyy617cYtwZR2UTtvhaKOBM407OM9z4GNxwa
	Eqz7b22bHwIy3CieOa044Hm06ZxISDqfeGoS7n1kXNNz4FqtJ86hpO4bI1ItlgmKWUzudIgX0m8cW
	X6jB8ozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUs-0000000HKpi-3ABJ;
	Mon, 03 Aug 2026 14:18:30 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUo-0000000HKjS-2feK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:29 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so849789a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766706; x=1786371506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbvI0ggZq8PjkiNtxEJqo1Oe8mNxS+rnGJpGxPDJVZs=;
        b=g/PkI7PuFHGkXQ2simwfk7ZgwNgaisHscm0OUN0bLYssHTNlA8oUKkSIrULUuRCUGL
         EjnXIoDWhDAcE1efZTHycxzAJXPBz0hcA0sz5Nv8wTe0MrRZsX8Fk/xQm8lAT4WxN4g1
         8pHtiFZibbMmDYa60JMCSTWtq1KBQY7pN/5fKWXUStIYbMsGJo/bjIO0wPcylZuUUXI+
         4fb/B40HvyU0hUUooxex9mN8AvrKvht2RZY/28/aRY0oeSx9bbyiOaT8Sg07n/E/M1U0
         aDerm/80cNnWfvw7UbQ+DKUy6jVsvheiRhd6ChEtYuyR6HsZwzOh7Wzga7BxvkJqWTw3
         nC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766706; x=1786371506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbvI0ggZq8PjkiNtxEJqo1Oe8mNxS+rnGJpGxPDJVZs=;
        b=tRnK3bcZz1zKaMTXdbXG7tZ+INUzV1VNsFsWmF0BJrh1p3HgVTSioRgXJiCGGzG3jo
         VA0n9vxagoWJolBa8jZqHddfgfDjke5QFV7rqwa5rt9VlN5E9F6ElzpSJxjMjEt4/5AD
         9tI4qdVCBxqjowUTsFWZfHZQcnbXPWV2NfTXMgD1+bkcjP2HsWHgzlJkKFoKsOnVOLCL
         7JdjfcF4Pnm1Hkei5EGfKQ+fmia/k473kBdc0ecay968fzT3NYAztyyip4wNJ1KE3Gqa
         0J+5HyHtSSfIHOVurqbUNY5HMAVoFKB/NLf+W7X38gxfCrOP2Was2rr9aVep7UVFFcD/
         JOKg==
X-Forwarded-Encrypted: i=1; AHgh+Rpij3evxLARVOn5Dr2s+MnF3PTMeowCRyix+qntGpVKNAPd9w9MSrnd7K3CVtjVyYxgWlhNOMbO/gn8xCrfVujM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4wj4NMNqpjRFUKrD+EyY/Hvnxs0h/o8rsOKqrODhHQ5pYQ6XV
	RQStvWQ4HyeOc0mSoYU60Hk3lHY2smCsLY0deQttOJNSUSb8vVOTnTOtI8Fnab9r
X-Gm-Gg: AR+sD13vqSHbDSTVO24215Ht+UDFtdpcDuGeor6gXYP0Yi3NOw8Q/ePWbSG8ps/sQUB
	0hIblg5G9fvyGTcHBSUxU4yXTKWei3SzgTHsOlQts3oi20J5+/qQIK4pTj43TvGFtkNNHEjifsc
	rrloSfBUX0GqdUTURYc7moxp+hbRdjjlob028x3gU5IAuXzsv+uFHIWCNu4v7oQLdTy9aX1vlGb
	+PDeCM7xxN0zQben5vshKXuOv4yKjLoiqic1kigeakwN47y5BxjBxgwOyLUT42vcxR5LSkCuHPn
	j86lvpnUnVeUUmUNx0fuIqhbkLLKgkC2qB7X7rq/aBy0LnXVIN9DJ2/f4WOTwFMQOrgVy4K1gWP
	2qzidBl1tpRv8CXDjKnkUKNF1XN9jdjoM16zp6RazYVJHLW0giqzQVaHVo3x0T65D0d0hEk7orG
	+rYWXI26hV4U/Yip/xIjxeDAIPeVsBB3juBZjUBm+9HBX27WW55R/xoHICYaqedDWVJESRFMwHZ
	xTxKhlg6MILat873Qxz
X-Received: by 2002:a17:90b:3c4a:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38fbc579dd9mr9519180a91.34.1785766705954;
        Mon, 03 Aug 2026 07:18:25 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:25 -0700 (PDT)
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
Subject: [PATCH 13/32] clk: mediatek: mt2701: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:40 +0900
Message-ID: <20260803141659.559129-14-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071826_716015_50099C3A 
X-CRM114-Status: GOOD (  20.19  )
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

The MT2701 clock drivers can use the MediaTek clock framework
common initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Drop the CLK_OF_DECLARE_DRIVER early init for infracfg; the kernel's
deferred probe mechanism ensures dependent drivers like cpufreq are
initialized correctly.

Since all MT2701 clock drivers can now be built as modules,
change Kconfig settings to "tristate".

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/Kconfig          |  18 +-
 drivers/clk/mediatek/clk-mt2701-aud.c |  35 +---
 drivers/clk/mediatek/clk-mt2701.c     | 233 ++++++--------------------
 3 files changed, 65 insertions(+), 221 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2c09fd729bab..b58656a7e8c3 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -19,7 +19,7 @@ config COMMON_CLK_MEDIATEK_FHCTL
 	  spread spectrum clocking features.
 
 config COMMON_CLK_MT2701
-	bool "Clock driver for MediaTek MT2701"
+	tristate "Clock driver for MediaTek MT2701"
 	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK && ARM
@@ -27,49 +27,49 @@ config COMMON_CLK_MT2701
 	  This driver supports MediaTek MT2701 basic clocks.
 
 config COMMON_CLK_MT2701_MMSYS
-	bool "Clock driver for MediaTek MT2701 mmsys"
+	tristate "Clock driver for MediaTek MT2701 mmsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 mmsys clocks.
 
 config COMMON_CLK_MT2701_IMGSYS
-	bool "Clock driver for MediaTek MT2701 imgsys"
+	tristate "Clock driver for MediaTek MT2701 imgsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 imgsys clocks.
 
 config COMMON_CLK_MT2701_VDECSYS
-	bool "Clock driver for MediaTek MT2701 vdecsys"
+	tristate "Clock driver for MediaTek MT2701 vdecsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 vdecsys clocks.
 
 config COMMON_CLK_MT2701_HIFSYS
-	bool "Clock driver for MediaTek MT2701 hifsys"
+	tristate "Clock driver for MediaTek MT2701 hifsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 hifsys clocks.
 
 config COMMON_CLK_MT2701_ETHSYS
-	bool "Clock driver for MediaTek MT2701 ethsys"
+	tristate "Clock driver for MediaTek MT2701 ethsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 ethsys clocks.
 
 config COMMON_CLK_MT2701_BDPSYS
-	bool "Clock driver for MediaTek MT2701 bdpsys"
+	tristate "Clock driver for MediaTek MT2701 bdpsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 bdpsys clocks.
 
 config COMMON_CLK_MT2701_AUDSYS
-	bool "Clock driver for Mediatek MT2701 audsys"
+	tristate "Clock driver for Mediatek MT2701 audsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports Mediatek MT2701 audsys clocks.
 
 config COMMON_CLK_MT2701_G3DSYS
-	bool "Clock driver for MediaTek MT2701 g3dsys"
+	tristate "Clock driver for MediaTek MT2701 g3dsys"
 	depends on COMMON_CLK_MT2701
 	help
 	  This driver supports MediaTek MT2701 g3dsys clocks.
diff --git a/drivers/clk/mediatek/clk-mt2701-aud.c b/drivers/clk/mediatek/clk-mt2701-aud.c
index e103121cf58e..533d35614661 100644
--- a/drivers/clk/mediatek/clk-mt2701-aud.c
+++ b/drivers/clk/mediatek/clk-mt2701-aud.c
@@ -128,6 +128,7 @@ static const struct mtk_gate audio_clks[] = {
 static const struct mtk_clk_desc audio_desc = {
 	.clks = audio_clks,
 	.num_clks = ARRAY_SIZE(audio_clks),
+	.populate_children = true,
 };
 
 static const struct of_device_id of_match_clk_mt2701_aud[] = {
@@ -136,39 +137,9 @@ static const struct of_device_id of_match_clk_mt2701_aud[] = {
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt2701_aud);
 
-static int clk_mt2701_aud_probe(struct platform_device *pdev)
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
-static void clk_mt2701_aud_remove(struct platform_device *pdev)
-{
-	of_platform_depopulate(&pdev->dev);
-	mtk_clk_simple_remove(pdev);
-}
-
 static struct platform_driver clk_mt2701_aud_drv = {
-	.probe = clk_mt2701_aud_probe,
-	.remove = clk_mt2701_aud_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-aud",
 		.of_match_table = of_match_clk_mt2701_aud,
diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 710c4f2f9f30..5ea0c4acaf1b 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/module.h>
 
 #include "clk-cpumux.h"
 #include "clk-gate.h"
@@ -655,38 +656,19 @@ static const struct mtk_gate top_clks[] = {
 		28),
 };
 
-static int mtk_topckgen_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-								clk_data);
-
-	mtk_clk_register_factors(top_fixed_divs, ARRAY_SIZE(top_fixed_divs),
-								clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_muxes,
-				    ARRAY_SIZE(top_muxes), base,
-				    &mt2701_clk_lock, clk_data);
-
-	mtk_clk_register_dividers(&pdev->dev, top_adj_divs, ARRAY_SIZE(top_adj_divs),
-				base, &mt2701_clk_lock, clk_data);
-
-	mtk_clk_register_gates(&pdev->dev, node, top_clks,
-			       ARRAY_SIZE(top_clks), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc topck_desc = {
+	.clks = top_clks,
+	.num_clks = ARRAY_SIZE(top_clks),
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(top_fixed_divs),
+	.composite_clks = top_muxes,
+	.num_composite_clks = ARRAY_SIZE(top_muxes),
+	.divider_clks = top_adj_divs,
+	.num_divider_clks = ARRAY_SIZE(top_adj_divs),
+	.clk_lock = &mt2701_clk_lock,
+};
 
 static const struct mtk_gate_regs infra_cg_regs = {
 	.set_ofs = 0x0040,
@@ -725,81 +707,21 @@ static const struct mtk_fixed_factor infra_fixed_divs[] = {
 static u16 infrasys_rst_ofs[] = { 0x30, 0x34, };
 static u16 pericfg_rst_ofs[] = { 0x0, 0x4, };
 
-static const struct mtk_clk_rst_desc clk_rst_desc[] = {
-	/* infrasys */
-	{
-		.version = MTK_RST_SIMPLE,
-		.rst_bank_ofs = infrasys_rst_ofs,
-		.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
-	},
-	/* pericfg */
-	{
-		.version = MTK_RST_SIMPLE,
-		.rst_bank_ofs = pericfg_rst_ofs,
-		.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
-	},
+static const struct mtk_clk_rst_desc infra_rst_desc = {
+	.version = MTK_RST_SIMPLE,
+	.rst_bank_ofs = infrasys_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 };
 
-static struct clk_hw_onecell_data *infra_clk_data;
-
-static void __init mtk_infrasys_init_early(struct device_node *node)
-{
-	int r, i;
-
-	if (!infra_clk_data) {
-		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
-		if (!infra_clk_data)
-			return;
-
-		for (i = 0; i < CLK_INFRA_NR; i++)
-			infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
-	}
-
-	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
-						infra_clk_data);
-
-	mtk_clk_register_cpumuxes(NULL, node, cpu_muxes, ARRAY_SIZE(cpu_muxes),
-				  infra_clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				   infra_clk_data);
-	if (r)
-		pr_err("%s(): could not register clock provider: %d\n",
-			__func__, r);
-}
-CLK_OF_DECLARE_DRIVER(mtk_infra, "mediatek,mt2701-infracfg",
-			mtk_infrasys_init_early);
-
-static int mtk_infrasys_init(struct platform_device *pdev)
-{
-	int r, i;
-	struct device_node *node = pdev->dev.of_node;
-
-	if (!infra_clk_data) {
-		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
-		if (!infra_clk_data)
-			return -ENOMEM;
-	} else {
-		for (i = 0; i < CLK_INFRA_NR; i++) {
-			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
-				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
-		}
-	}
-
-	mtk_clk_register_gates(&pdev->dev, node, infra_clks,
-			       ARRAY_SIZE(infra_clks), infra_clk_data);
-	mtk_clk_register_factors(infra_fixed_divs, ARRAY_SIZE(infra_fixed_divs),
-						infra_clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				   infra_clk_data);
-	if (r)
-		return r;
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc[0]);
-
-	return 0;
-}
+static const struct mtk_clk_desc infracfg_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+	.factor_clks = infra_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(infra_fixed_divs),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &infra_rst_desc,
+};
 
 static const struct mtk_gate_regs peri0_cg_regs = {
 	.set_ofs = 0x0008,
@@ -883,36 +805,20 @@ static const struct mtk_composite peri_muxs[] = {
 		0x40c, 3, 1),
 };
 
-static int mtk_pericfg_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_PERI_NR);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_gates(&pdev->dev, node, peri_clks,
-			       ARRAY_SIZE(peri_clks), clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, peri_muxs,
-				    ARRAY_SIZE(peri_muxs), base,
-				    &mt2701_clk_lock, clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		return r;
-
-	mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc[1]);
+static const struct mtk_clk_rst_desc peri_rst_desc = {
+	.version = MTK_RST_SIMPLE,
+	.rst_bank_ofs = pericfg_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(pericfg_rst_ofs),
+};
 
-	return 0;
-}
+static const struct mtk_clk_desc pericfg_desc = {
+	.clks = peri_clks,
+	.num_clks = ARRAY_SIZE(peri_clks),
+	.composite_clks = peri_muxs,
+	.num_composite_clks = ARRAY_SIZE(peri_muxs),
+	.rst_desc = &peri_rst_desc,
+	.clk_lock = &mt2701_clk_lock,
+};
 
 #define MT8590_PLL_FMAX		(2000 * MHZ)
 #define CON0_MT8590_RST_BAR	BIT(27)
@@ -968,74 +874,41 @@ static const struct mtk_fixed_factor apmixed_fixed_divs[] = {
 	FACTOR(CLK_APMIXED_HDMI_REF, "hdmi_ref", "tvdpll", 1, 1),
 };
 
-static int mtk_apmixedsys_init(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, apmixed_plls, ARRAY_SIZE(apmixed_plls),
-								clk_data);
-	mtk_clk_register_factors(apmixed_fixed_divs, ARRAY_SIZE(apmixed_fixed_divs),
-								clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc apmixedsys_desc = {
+	.plls = apmixed_plls,
+	.num_plls = ARRAY_SIZE(apmixed_plls),
+	.factor_clks = apmixed_fixed_divs,
+	.num_factor_clks = ARRAY_SIZE(apmixed_fixed_divs),
+};
 
 static const struct of_device_id of_match_clk_mt2701[] = {
 	{
 		.compatible = "mediatek,mt2701-topckgen",
-		.data = mtk_topckgen_init,
+		.data = &topck_desc,
 	}, {
 		.compatible = "mediatek,mt2701-infracfg",
-		.data = mtk_infrasys_init,
+		.data = &infracfg_desc,
 	}, {
 		.compatible = "mediatek,mt2701-pericfg",
-		.data = mtk_pericfg_init,
+		.data = &pericfg_desc,
 	}, {
 		.compatible = "mediatek,mt2701-apmixedsys",
-		.data = mtk_apmixedsys_init,
+		.data = &apmixedsys_desc,
 	}, {
 		/* sentinel */
 	}
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt2701);
 
-static int clk_mt2701_probe(struct platform_device *pdev)
-{
-	int (*clk_init)(struct platform_device *);
-	int r;
-
-	clk_init = of_device_get_match_data(&pdev->dev);
-	if (!clk_init)
-		return -EINVAL;
-
-	r = clk_init(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
-
 static struct platform_driver clk_mt2701_drv = {
-	.probe = clk_mt2701_probe,
 	.driver = {
 		.name = "clk-mt2701",
 		.of_match_table = of_match_clk_mt2701,
 	},
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
-
-static int __init clk_mt2701_init(void)
-{
-	return platform_driver_register(&clk_mt2701_drv);
-}
-
-arch_initcall(clk_mt2701_init);
+module_platform_driver(clk_mt2701_drv);
 
 MODULE_DESCRIPTION("MediaTek MT2701 main clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0


