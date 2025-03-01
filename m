Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C601C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 10:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARlFYvbcSt9dWCmJzxITT+h0H7iskhEG77STtqMQei4=; b=DNJgXMeCJFsIZ67oBJyenZuLtg
	d20d+e+28DvaSeU8dB/FNm3Kuv+UNW9iXk4fSAQAPnur6t/gXpy00KrKAh/XnIapgE3AXdnQXYnMQ
	0JLDW5/cZHHD/oGAhc+QyBrRHRuxtMddrVIMRPtbxZLCjDmyGI7kBwPFIHfLkJTLll5GQSehvk70V
	zmrn1nBHSxjNhq5AA5A7QRTo6TWaJrEUNEEjPMH0X2GqgvuLvIa0546NvYI9+TdAtQHMPFS/FHW9k
	nPSN1N0PCRY9EzBwGY0Yypz9DGhnZen8wIGyYCAm0YEwW2YAYzsdFMDNpQrb214MDx9QEfZGdA8Mo
	ckP9jnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toKW0-0000000DnL6-3rsE;
	Sat, 01 Mar 2025 10:56:16 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toKNo-0000000DmTY-3Z2I;
	Sat, 01 Mar 2025 10:47:50 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9EAB325D15;
	Sat,  1 Mar 2025 11:47:47 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYXAj15D2LYa; Sat,  1 Mar 2025 11:47:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740826062; bh=24/fM25kYYpFUi8g0nBw6v3VxpKWAQB9iUoSs2evMuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EGDgDacb8FZjKnNZPW9kIvRennie5y1g1WetGPPztEFEAGE3ri9Z2FNwaxEvF19Fa
	 vmNRUNzqRFdEIIqnsIyUm0TZDFaPFep8g8PPLeenip8Sbq/d/irMFxe1Sli2D90au+
	 JfYH3owK/7n8eAn6CwQGLgTbLfOvcwmdhVVoUCE0bF/0jbpQzFDX7kpTNrlhyvCk3F
	 KcLvPCVaAA9E8CFa5UvOB+D0qY8Q1XsSmXp1qeUQ0lzkXQdd46nbhNZY+Vdb+2pMgi
	 mfpe0gZySUlZmGtwuSe31qWoXJMGmr4f2WBqH8GLipKbC34XiOE0WAaFtmkW2W/AQ3
	 EiGFmT/LlDRHg==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 6/8] clk: rockchip: rk3528: Add SD/SDIO tuning clocks in GRF region
Date: Sat,  1 Mar 2025 10:47:24 +0000
Message-ID: <20250301104724.36399-1-ziyao@disroot.org>
In-Reply-To: <20250301104250.36295-1-ziyao@disroot.org>
References: <20250301104250.36295-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_024749_149942_5A2CA883 
X-CRM114-Status: GOOD (  14.10  )
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
 drivers/clk/rockchip/clk-rk3528.c | 56 ++++++++++++++++++++++++++++---
 drivers/clk/rockchip/clk.h        |  3 ++
 2 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3528.c b/drivers/clk/rockchip/clk-rk3528.c
index b8b577b902a0..b89440dd7448 100644
--- a/drivers/clk/rockchip/clk-rk3528.c
+++ b/drivers/clk/rockchip/clk-rk3528.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/syscon.h>
 
 #include <dt-bindings/clock/rockchip,rk3528-cru.h>
 
@@ -1061,23 +1062,62 @@ static struct rockchip_clk_branch rk3528_clk_branches[] __initdata = {
 			0, 1, 1),
 };
 
+static struct rockchip_clk_branch rk3528_vo_clk_branches[] __initdata = {
+	MMC_GRF(SCLK_SDMMC_DRV, "sdmmc_drv", "cclk_src_sdmmc0",
+			RK3528_SDMMC_CON(0), 1),
+	MMC_GRF(SCLK_SDMMC_SAMPLE, "sdmmc_sample", "cclk_src_sdmmc0",
+			RK3528_SDMMC_CON(1), 1),
+};
+
+static struct rockchip_clk_branch rk3528_vpu_clk_branches[] __initdata = {
+	MMC_GRF(SCLK_SDIO0_DRV, "sdio0_drv", "cclk_src_sdio0",
+			RK3528_SDIO0_CON(0), 1),
+	MMC_GRF(SCLK_SDIO0_SAMPLE, "sdio0_sample", "cclk_src_sdio0",
+			RK3528_SDIO0_CON(1), 1),
+	MMC_GRF(SCLK_SDIO1_DRV, "sdio1_drv", "cclk_src_sdio1",
+			RK3528_SDIO1_CON(0), 1),
+	MMC_GRF(SCLK_SDIO1_SAMPLE, "sdio1_sample", "cclk_src_sdio1",
+			RK3528_SDIO1_CON(1), 1),
+};
+
 static int __init clk_rk3528_probe(struct platform_device *pdev)
 {
+	unsigned long nr_vpu_branches = ARRAY_SIZE(rk3528_vpu_clk_branches);
+	unsigned long nr_vo_branches = ARRAY_SIZE(rk3528_vo_clk_branches);
+	unsigned long nr_branches = ARRAY_SIZE(rk3528_clk_branches);
 	struct rockchip_clk_provider *ctx;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	unsigned long nr_branches = ARRAY_SIZE(rk3528_clk_branches);
-	unsigned long nr_clks;
+	struct regmap *vo_grf, *vpu_grf;
 	void __iomem *reg_base;
-
-	nr_clks = rockchip_clk_find_max_clk_id(rk3528_clk_branches,
-					       nr_branches) + 1;
+	unsigned long nr_clks;
 
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base))
 		return dev_err_probe(dev, PTR_ERR(reg_base),
 				     "could not map cru region");
 
+	nr_clks = rockchip_clk_find_max_clk_id(rk3528_clk_branches,
+					       nr_branches) + 1;
+
+	vo_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3528-vo-grf");
+	if (!IS_ERR(vo_grf))
+		nr_clks = MAX(rockchip_clk_find_max_clk_id(rk3528_vo_clk_branches,
+							   nr_vo_branches) + 1,
+			      nr_clks);
+	else if (PTR_ERR(vo_grf) != ENODEV)
+		return dev_err_probe(dev, PTR_ERR(vo_grf),
+				     "failed to look up VO GRF\n");
+
+	vpu_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3528-vpu-grf");
+	if (!IS_ERR(vpu_grf))
+		nr_clks = MAX(rockchip_clk_find_max_clk_id(rk3528_vpu_clk_branches,
+							   nr_vpu_branches) + 1,
+			      nr_clks);
+	else if (PTR_ERR(vpu_grf) != ENODEV)
+		return dev_err_probe(dev, PTR_ERR(vpu_grf),
+				     "failed to look up VPU GRF\n");
+
 	ctx = rockchip_clk_init(np, reg_base, nr_clks);
 	if (IS_ERR(ctx))
 		return dev_err_probe(dev, PTR_ERR(ctx),
@@ -1091,6 +1131,12 @@ static int __init clk_rk3528_probe(struct platform_device *pdev)
 				     &rk3528_cpuclk_data, rk3528_cpuclk_rates,
 				     ARRAY_SIZE(rk3528_cpuclk_rates));
 	rockchip_clk_register_branches(ctx, rk3528_clk_branches, nr_branches);
+	if (!IS_ERR(vo_grf))
+		rockchip_clk_register_grf_branches(ctx, rk3528_vo_clk_branches,
+						   vo_grf, nr_vo_branches);
+	if (!IS_ERR(vpu_grf))
+		rockchip_clk_register_grf_branches(ctx, rk3528_vpu_clk_branches,
+						   vpu_grf, nr_vpu_branches);
 
 	rk3528_rst_init(np, reg_base);
 
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 5d82ec5facfa..02d4ca0012d7 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -217,6 +217,9 @@ struct clk;
 #define RK3528_CLKSEL_CON(x)		((x) * 0x4 + 0x300)
 #define RK3528_CLKGATE_CON(x)		((x) * 0x4 + 0x800)
 #define RK3528_SOFTRST_CON(x)		((x) * 0x4 + 0xa00)
+#define RK3528_SDMMC_CON(x)		((x) * 0x4 + 0x24)
+#define RK3528_SDIO0_CON(x)		((x) * 0x4 + 0x4)
+#define RK3528_SDIO1_CON(x)		((x) * 0x4 + 0xc)
 #define RK3528_PMU_CLKSEL_CON(x)	((x) * 0x4 + 0x300 + RK3528_PMU_CRU_BASE)
 #define RK3528_PMU_CLKGATE_CON(x)	((x) * 0x4 + 0x800 + RK3528_PMU_CRU_BASE)
 #define RK3528_PCIE_CLKSEL_CON(x)	((x) * 0x4 + 0x300 + RK3528_PCIE_CRU_BASE)
-- 
2.48.1


