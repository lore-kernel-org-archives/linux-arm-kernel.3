Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3785DC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHXm1gYEL+Qrx3DLE8kFg5dfIhB8Jc/MOr68trWNX58=; b=zKqRFXgeq0BqTZ1y03bnrdAL84
	RI+v3PhtaiKFMdfgmj/sWZYaRu1o+os5wvkTnX7r2Po89cZBQL4sggCyEkPMsyAtb68LMoYYdo/Ie
	o/ay3QR/WcjqZWXoTVZruNwR8aMXyssORA4R6tNhRGwOMQYQpt+wwveD3cnZ9jpyTV2lyCj1lKjtB
	y/EOlMOOOAIcvKA3/Y59q8hxHcGw6plZfaC8oznRRGAqMYJxfVET+zoQAUB3rvo5CerGQQS8JupXF
	KeSDVc1lkMEvaAzCC1cDS12l0GZYuT/NG8GMPKstqwZHkMkQ3lZ25VJml8YVtiUsu5M917BtguTBR
	WRU3sUJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFrx-0000000BcoD-163b;
	Tue, 06 May 2025 10:49:49 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEWt-0000000BM5I-2WRy;
	Tue, 06 May 2025 09:24:00 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 233B225A88;
	Tue,  6 May 2025 11:23:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzqSGRRl0GDx; Tue,  6 May 2025 11:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746523437; bh=vzmS4N7eEX+rtChwmVzIew6PgA7WdiSb7izIi9hhSYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R25Y+/mwFNsTfWcgIsyRmTImPr7xXuqIdu2hMypgHiV7LAV6brmmK2Om901Dszvp7
	 qf6X2IZBVvxQ75SCxL2R7QEnUE4T9bb1HQH7BoNTa3nB1UPisw/0yLcVc8FArydn4R
	 2ngJk/wnsyg+cTmk9cJGxfA6AU1hE3GfzG6qb8YFfVZ9BMlGIq9+/uSh112Uwyyt4/
	 024ME07xoY26m2PeuYy5OwIDz5povbAJzk7MXcfsEB/GsAEo7TpFILsygtJJ4/Jqwu
	 huvQE4jxzPL08hXgpD7J7fYy+nY/K6iLI4vadv2Zu2oG8xrc3OTHR0dsYBTzl/GFgT
	 JV66GpwgE/UIg==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v5 3/5] clk: rockchip: rk3528: Add SD/SDIO tuning clocks in GRF region
Date: Tue,  6 May 2025 09:22:04 +0000
Message-ID: <20250506092206.46143-4-ziyao@disroot.org>
In-Reply-To: <20250506092206.46143-1-ziyao@disroot.org>
References: <20250506092206.46143-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_022359_904111_6F47842F 
X-CRM114-Status: GOOD (  15.26  )
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

These clocks locate in VO and VPU GRF, serving for SD/SDIO controller
tuning purpose. Add their definitions and register them in driver if
corresponding GRF is available.

GRFs are looked up by compatible to simplify devicetree binding.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/rockchip/clk-rk3528.c | 82 ++++++++++++++++++++++++++++---
 drivers/clk/rockchip/clk.h        |  5 ++
 2 files changed, 81 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3528.c b/drivers/clk/rockchip/clk-rk3528.c
index b8b577b902a0..f5f10493abfb 100644
--- a/drivers/clk/rockchip/clk-rk3528.c
+++ b/drivers/clk/rockchip/clk-rk3528.c
@@ -10,6 +10,8 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/syscon.h>
+#include <linux/minmax.h>
 
 #include <dt-bindings/clock/rockchip,rk3528-cru.h>
 
@@ -1061,23 +1063,65 @@ static struct rockchip_clk_branch rk3528_clk_branches[] __initdata = {
 			0, 1, 1),
 };
 
+static struct rockchip_clk_branch rk3528_vo_clk_branches[] __initdata = {
+	MMC_GRF(SCLK_SDMMC_DRV, "sdmmc_drv", "cclk_src_sdmmc0",
+			RK3528_SDMMC_CON(0), 1, grf_type_vo),
+	MMC_GRF(SCLK_SDMMC_SAMPLE, "sdmmc_sample", "cclk_src_sdmmc0",
+			RK3528_SDMMC_CON(1), 1, grf_type_vo),
+};
+
+static struct rockchip_clk_branch rk3528_vpu_clk_branches[] __initdata = {
+	MMC_GRF(SCLK_SDIO0_DRV, "sdio0_drv", "cclk_src_sdio0",
+			RK3528_SDIO0_CON(0), 1, grf_type_vpu),
+	MMC_GRF(SCLK_SDIO0_SAMPLE, "sdio0_sample", "cclk_src_sdio0",
+			RK3528_SDIO0_CON(1), 1, grf_type_vpu),
+	MMC_GRF(SCLK_SDIO1_DRV, "sdio1_drv", "cclk_src_sdio1",
+			RK3528_SDIO1_CON(0), 1, grf_type_vpu),
+	MMC_GRF(SCLK_SDIO1_SAMPLE, "sdio1_sample", "cclk_src_sdio1",
+			RK3528_SDIO1_CON(1), 1, grf_type_vpu),
+};
+
 static int __init clk_rk3528_probe(struct platform_device *pdev)
 {
-	struct rockchip_clk_provider *ctx;
+	unsigned long nr_vpu_branches = ARRAY_SIZE(rk3528_vpu_clk_branches);
+	unsigned long nr_vo_branches = ARRAY_SIZE(rk3528_vo_clk_branches);
+	unsigned long nr_branches = ARRAY_SIZE(rk3528_clk_branches);
+	unsigned long nr_clks, nr_vo_clks, nr_vpu_clks;
+	struct rockchip_aux_grf *vo_grf_e, *vpu_grf_e;
+	struct regmap *vo_grf, *vpu_grf;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	unsigned long nr_branches = ARRAY_SIZE(rk3528_clk_branches);
-	unsigned long nr_clks;
+	struct rockchip_clk_provider *ctx;
 	void __iomem *reg_base;
 
-	nr_clks = rockchip_clk_find_max_clk_id(rk3528_clk_branches,
-					       nr_branches) + 1;
-
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base))
 		return dev_err_probe(dev, PTR_ERR(reg_base),
 				     "could not map cru region");
 
+	nr_clks = rockchip_clk_find_max_clk_id(rk3528_clk_branches,
+					       nr_branches) + 1;
+
+	vo_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3528-vo-grf");
+	if (!IS_ERR(vo_grf)) {
+		nr_vo_clks = rockchip_clk_find_max_clk_id(rk3528_vo_clk_branches,
+							  nr_vo_branches) + 1;
+		nr_clks = max(nr_clks, nr_vo_clks);
+	} else if (PTR_ERR(vo_grf) != -ENODEV) {
+		return dev_err_probe(dev, PTR_ERR(vo_grf),
+				     "failed to look up VO GRF\n");
+	}
+
+	vpu_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3528-vpu-grf");
+	if (!IS_ERR(vpu_grf)) {
+		nr_vpu_clks = rockchip_clk_find_max_clk_id(rk3528_vpu_clk_branches,
+							   nr_vpu_branches) + 1;
+		nr_clks = max(nr_clks, nr_vpu_clks);
+	} else if (PTR_ERR(vpu_grf) != -ENODEV) {
+		return dev_err_probe(dev, PTR_ERR(vpu_grf),
+				     "failed to look up VPU GRF\n");
+	}
+
 	ctx = rockchip_clk_init(np, reg_base, nr_clks);
 	if (IS_ERR(ctx))
 		return dev_err_probe(dev, PTR_ERR(ctx),
@@ -1092,6 +1136,32 @@ static int __init clk_rk3528_probe(struct platform_device *pdev)
 				     ARRAY_SIZE(rk3528_cpuclk_rates));
 	rockchip_clk_register_branches(ctx, rk3528_clk_branches, nr_branches);
 
+	if (!IS_ERR(vo_grf)) {
+		vo_grf_e = devm_kzalloc(dev, sizeof(*vo_grf_e), GFP_KERNEL);
+		if (!vo_grf_e)
+			return -ENOMEM;
+
+		vo_grf_e->grf	= vo_grf;
+		vo_grf_e->type	= grf_type_vo;
+		hash_add(ctx->aux_grf_table, &vo_grf_e->node, grf_type_vo);
+
+		rockchip_clk_register_branches(ctx, rk3528_vo_clk_branches,
+					       nr_vo_branches);
+	}
+
+	if (!IS_ERR(vpu_grf)) {
+		vpu_grf_e = devm_kzalloc(dev, sizeof(*vpu_grf_e), GFP_KERNEL);
+		if (!vpu_grf_e)
+			return -ENOMEM;
+
+		vpu_grf_e->grf	= vpu_grf;
+		vpu_grf_e->type	= grf_type_vpu;
+		hash_add(ctx->aux_grf_table, &vpu_grf_e->node, grf_type_vpu);
+
+		rockchip_clk_register_branches(ctx, rk3528_vpu_clk_branches,
+					       nr_vpu_branches);
+	}
+
 	rk3528_rst_init(np, reg_base);
 
 	rockchip_register_restart_notifier(ctx, RK3528_GLB_SRST_FST, NULL);
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index d411de7a6f4a..10be168f49e3 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -218,6 +218,9 @@ struct clk;
 #define RK3528_CLKSEL_CON(x)		((x) * 0x4 + 0x300)
 #define RK3528_CLKGATE_CON(x)		((x) * 0x4 + 0x800)
 #define RK3528_SOFTRST_CON(x)		((x) * 0x4 + 0xa00)
+#define RK3528_SDMMC_CON(x)		((x) * 0x4 + 0x24)
+#define RK3528_SDIO0_CON(x)		((x) * 0x4 + 0x4)
+#define RK3528_SDIO1_CON(x)		((x) * 0x4 + 0xc)
 #define RK3528_PMU_CLKSEL_CON(x)	((x) * 0x4 + 0x300 + RK3528_PMU_CRU_BASE)
 #define RK3528_PMU_CLKGATE_CON(x)	((x) * 0x4 + 0x800 + RK3528_PMU_CRU_BASE)
 #define RK3528_PCIE_CLKSEL_CON(x)	((x) * 0x4 + 0x300 + RK3528_PCIE_CRU_BASE)
@@ -446,6 +449,8 @@ enum rockchip_grf_type {
 	grf_type_pmu0,
 	grf_type_pmu1,
 	grf_type_ioc,
+	grf_type_vo,
+	grf_type_vpu,
 };
 
 /* ceil(sqrt(enums in rockchip_grf_type - 1)) */
-- 
2.49.0


