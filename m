Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0966BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7pTdGF+cf6lxDRr76PXeqJm/rG1eB/tWFQcX60JvlI=; b=Im5fKzTB4+6iunHT9pFukAcZ9R
	i3QiXJ/DCCb0K5tqsrLQxKo8aI6C5VUz15Tmf1eDkXycKHtbQBzCrdSWy37MVfuTS+2/+8qgeVrZT
	S2g8QCeQUJKRpVZZpaSMVf2ADFKmotWn9VTITFDnXIoG8nHR8OLJY/96x+dK+tZhm3721WNwiNb2r
	fJHk/3LBUNEzFJvpq535rVk1nBSAkPkBVUuhWxJtu+Ut270DyKiYY7Ra+iFV0hDemuquvy+i50EyJ
	5mk0FDboN2VyINcPipDpaHWy12GElrPskWHMR7avG2CSLz35RdOZJyBzxMSUmCjG5e0CH3JrcEo3y
	DD8XTd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5R8t-0000000DVYU-15fZ;
	Thu, 17 Apr 2025 15:27:07 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QMr-0000000DLWL-3rDO;
	Thu, 17 Apr 2025 14:37:31 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AA93A25C5C;
	Thu, 17 Apr 2025 16:37:25 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-f57SXnfEKw; Thu, 17 Apr 2025 16:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744900645; bh=LJZ4BzkmqO5FCxtr98CW90UDUw7hXcAKNizoRIIljs8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yc1PQeianGTLnTA/XuDF4RfgiZyumOAd8xznKe/THAas00Ef/SdxTtq5MvsphaEwV
	 +NQpyu8spmcVqNAWKB/mygzUYmoI+Y/Iig0NzUI9FZryJN9bwv2INGUYAhoSMBKDZd
	 JKjZX63mze9f04VuiHAcDv6wKvDDkwz/StyYF7y8Vr6NEpXaqhUCjZ2yy6Dp1zWdX0
	 fHqxrjRmmdkApQBZRRiLk2LCNPyQVzP4vUsOoHH/PoN2AvbuCqvjkn9DL9tJVDoUdC
	 NJNcCFmsV5LzDC5mbBRTCoosa5Cpz3QnQROweWeN7ekD4hDVI8cOFdJGSIhU9c4JfM
	 qkkFtZDA82g2Q==
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
Subject: [PATCH v4 3/5] clk: rockchip: rk3528: Add SD/SDIO tuning clocks in GRF region
Date: Thu, 17 Apr 2025 14:36:45 +0000
Message-ID: <20250417143647.43860-4-ziyao@disroot.org>
In-Reply-To: <20250417143647.43860-1-ziyao@disroot.org>
References: <20250417143647.43860-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_073730_218539_6CD3ED13 
X-CRM114-Status: GOOD (  14.05  )
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
 drivers/clk/rockchip/clk-rk3528.c | 61 ++++++++++++++++++++++++++++---
 drivers/clk/rockchip/clk.h        |  3 ++
 2 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3528.c b/drivers/clk/rockchip/clk-rk3528.c
index b8b577b902a0..5c133a642ff9 100644
--- a/drivers/clk/rockchip/clk-rk3528.c
+++ b/drivers/clk/rockchip/clk-rk3528.c
@@ -10,6 +10,8 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/syscon.h>
+#include <linux/minmax.h>
 
 #include <dt-bindings/clock/rockchip,rk3528-cru.h>
 
@@ -1061,23 +1063,64 @@ static struct rockchip_clk_branch rk3528_clk_branches[] __initdata = {
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
-	struct rockchip_clk_provider *ctx;
+	unsigned long nr_vpu_branches = ARRAY_SIZE(rk3528_vpu_clk_branches);
+	unsigned long nr_vo_branches = ARRAY_SIZE(rk3528_vo_clk_branches);
+	unsigned long nr_branches = ARRAY_SIZE(rk3528_clk_branches);
+	unsigned long nr_clks, nr_vo_clks, nr_vpu_clks;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	unsigned long nr_branches = ARRAY_SIZE(rk3528_clk_branches);
-	unsigned long nr_clks;
+	struct rockchip_clk_provider *ctx;
+	struct regmap *vo_grf, *vpu_grf;
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
@@ -1091,6 +1134,12 @@ static int __init clk_rk3528_probe(struct platform_device *pdev)
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
index ec86ba1dd38c..f07cd1bb8952 100644
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
2.49.0


