Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0B5CDE010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 21:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVSNnx6r2pF6bXOmuirL1YtxX4Xz3CG4Q/di0IqvFXg=; b=WGGNzjlxp8niJu8xX4PgnwZITs
	IB6baWNjBoYUW6HAq1F/NCbHwtKpnIE9hGfhNrRL/pPXbJewnTCXdz5PkKY6/SSz7rUAALZd35W5l
	9RZNkuSNjqXnpCxVnc6zVM6G86FNEB7535nc+MOa2yo5jPVy6wNw6U8ygWmHZ7okJberhRTch1whY
	vAHm9Df2j5dMxztf6KsLU4yKoCeDkJu6o6BqF9RllQdBABv4j5ZGfWhMmvwTqIG6qge1wkqWBJ0s1
	BUN/LQRzvDq4Czdijrxv3Su2FOdAwrNw3hgIFIiq6O+Q/S7C3wV3gxsIY8ny5Um4gRk5RErsNMX4n
	vwvCZj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5P-00000009tnb-3hQL;
	Thu, 25 Jun 2026 21:58:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5H-00000009tgM-069z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 21:58:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so10600125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 14:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424685; x=1783029485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVSNnx6r2pF6bXOmuirL1YtxX4Xz3CG4Q/di0IqvFXg=;
        b=qHyDaVmxKroXzuTkPo56QYjP7aNbX7lmIbaLqyA79n5b4ieB50EPjQb2HIR+myTfdv
         18NaG3PuhQTiEambswnQCipMeZkWWVuhELavlcAqsb4XuQwCe9ofQd2vkgYMaD0oJOkQ
         hhB70vchXM+rPlPWqsjNbaZ2iXP2uibtsW9BR9hVNMnTZf5heBZIIc5YJLs+2R3Uk4JG
         9pJ//2WT/XRvLPyvQ4eIVDK+BmSmw8/GVePYT6adWmAV5iohvilXYwSV1Z4py/UZQLWe
         xzdpoUNZccDr2fSpD8mFrA4UIOOemxEz2sXqh01P/eAkkcnNAmtP7GbeknTenFLCCoQS
         BFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424685; x=1783029485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dVSNnx6r2pF6bXOmuirL1YtxX4Xz3CG4Q/di0IqvFXg=;
        b=jzBRZkuRQIY0V0mV1lq7xsghZpU6y8AB/kc1VufoEhQdwE4jlOfd4pDqiPiNWszdWm
         09OO/DC+2J0MyeQdpX7nvwzQJS/5h05ukENJ82coHseImmAAHwXEO0aOI/zwKi2QSCoo
         BmoZmpVq4woxLSK3GbfI4+huq1LbLgGD9VDONLjHtUfk7oyiQuhW0YmCestCwMEDCDMq
         Fl+j04GUH+lugqtGwjDjNqwZBlK/f8qy9zU1/g9t1J0P8y12dN7nOxT9s2TkGUNtCoT3
         9iHyNMXblAkZMszz9kCSgWVo2NXQ8vQbeLU5rYc4IumxWFUespGy24As7rf0rktVHObZ
         3a2g==
X-Forwarded-Encrypted: i=1; AFNElJ8GRrFHGGH/i1jM6DYckj7ixH3ZvTRAGo62OTQkGNms4IQG5vKgX4ywq7McQyK76ssr3kudjcmuH53594dlrr3W@lists.infradead.org
X-Gm-Message-State: AOJu0YylZxu00nUHeoxUsWHrSPwopZNtRkhUm5v1puku504URLmb38FA
	0nMFjOq7GRoWAGpKbz0H+ZEAQksKtqTn8FcTijfIYetVlFfFKfPdSu5c
X-Gm-Gg: AfdE7cn+cWQXhZ/JIvl7nIM7yfpyNo2OUAXtedgfkBg8n4t71hcfG6MYkKGi9p+0+tC
	HLYpYySHxTcK+NTuZ7se0ur/81EAXv05EKi1rg7zUS+eteNX32ioVboRe22LjF0Bhi44VcTNOu2
	WP4lgCqbYgZEQzUUGgUus+FQKxrmyFjgRRhj5KrPlSfXwNx4M1Wv2C++1wRZ48tw4SNEQdmtGki
	75FB4uUO30cD02xQmtlhuSIJqgVI3sTee0Jo4isgoio0r1+R7sigshbf9YqXps7lCltDu3v03fO
	qQQ3+Tonl31P1ZscmYDU7R0Hx4hjAa5OaYN2GiwMd8FRhJQbk2N2VNY3TgkDSK4jLaUm7jWnYLM
	6vlCewP2XI4bCGkG8jk5v77AbnSHl9ft49dNEJrOrGS64UJGEGBLKjRiLWkVMKG7q0dhlygFQSs
	xDAKGpxUxvIb6899sl0JvjTFz5/IlPirZyNWWZOxlcG9i5wIlUvjxWdVrBpdsWxg/8//5Da0co7
	Mr4AnWMCtMnPk6PsbH021E=
X-Received: by 2002:a05:600c:c059:10b0:490:c1cb:48f4 with SMTP id 5b1f17b1804b1-4926641a8d8mr43206365e9.12.1782424684976;
        Thu, 25 Jun 2026 14:58:04 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:58:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581
Date: Thu, 25 Jun 2026 23:57:37 +0200
Message-ID: <20260625215741.3253212-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625215741.3253212-1-ansuelsmth@gmail.com>
References: <20260625215741.3253212-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_145807_107685_F3B3E9DC 
X-CRM114-Status: GOOD (  25.47  )
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

The Airoha AN7581 SoC supports configuring the first PCIe0 line to 2-lanes
mode by bonding it with the second PCIe line. This is done by configuring
the PCIe MUX in the SCU register.

To correctly configure the line for 2-lanes mode, it's required to define
in DT an additional reg, 'sec-pcie-mac' for the secondary PCIe.
It's also needed to define the additional reset and the PERSTOUT reset.
Also 'airoha,scu' property is mandatory to correctly configure the SCU
register for the PCIe MUX.

Finally to toggle 2-lanes mode, it's needed to define in DT 'num-lanes' as
2.

In such configuration the EQ preset are configured to the same values.

To permit correct configuration of the PCIe line, additional logic is added
to assert and deassert the PERSTOUT resets.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 98 +++++++++++++++++----
 1 file changed, 80 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..f750759bbc1d 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -32,6 +32,11 @@
 
 #include "../pci.h"
 
+/* AN7581 SCU register */
+#define SCU_PCIC			0x88
+#define SCU_PCIC_PCIE_CTRL		GENMASK(7, 0)
+
+/* PCIe register */
 #define PCIE_BASE_CFG_REG		0x14
 #define PCIE_BASE_CFG_SPEED		GENMASK(15, 8)
 
@@ -131,6 +136,7 @@
 #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
 
 #define MAX_NUM_PHY_RESETS		3
+#define MAX_NUM_PERSTOUT_RESETS		2
 
 #define PCIE_MTK_RESET_TIME_US		10
 
@@ -203,9 +209,11 @@ struct mtk_msi_set {
 struct mtk_gen3_pcie {
 	struct device *dev;
 	void __iomem *base;
+	void __iomem *sec_base;
 	phys_addr_t reg_base;
 	struct reset_control *mac_reset;
 	struct reset_control_bulk_data phy_resets[MAX_NUM_PHY_RESETS];
+	struct reset_control_bulk_data perstout_resets[MAX_NUM_PERSTOUT_RESETS];
 	struct phy *phy;
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -222,6 +230,9 @@ struct mtk_gen3_pcie {
 	DECLARE_BITMAP(msi_irq_in_use, PCIE_MSI_IRQS_NUM);
 
 	const struct mtk_gen3_pcie_pdata *soc;
+
+	/* AN7581 specific */
+	struct regmap *scu;
 };
 
 /* LTSSM state in PCIE_LTSSM_STATUS_REG bit[28:24] */
@@ -928,6 +939,14 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get PHY bulk reset\n");
 
+	pcie->perstout_resets[0].id = "perstout";
+	pcie->perstout_resets[1].id = "sec-perstout";
+
+	ret = devm_reset_control_bulk_get_optional_exclusive(dev, MAX_NUM_PERSTOUT_RESETS,
+							     pcie->perstout_resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get PERSTOUT bulk reset\n");
+
 	pcie->mac_reset = devm_reset_control_get_optional_exclusive(dev, "mac");
 	if (IS_ERR(pcie->mac_reset))
 		return dev_err_probe(dev, PTR_ERR(pcie->mac_reset), "failed to get MAC reset\n");
@@ -955,12 +974,29 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 {
 	struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
+	unsigned int num_lanes = max(1, pcie->num_lanes);
 	struct device *dev = pcie->dev;
 	struct resource_entry *entry;
 	struct regmap *pbus_regmap;
 	u32 val, args[2], size;
 	resource_size_t addr;
-	int err;
+	int i, err;
+
+	if (num_lanes == 2) {
+		struct platform_device *pdev = to_platform_device(dev);
+		struct resource *regs;
+
+		regs = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sec-pcie-mac");
+		if (!regs)
+			return -EINVAL;
+		pcie->sec_base = devm_ioremap_resource(dev, regs);
+		if (IS_ERR(pcie->sec_base))
+			return dev_err_probe(dev, PTR_ERR(pcie->sec_base), "failed to map secondary register base\n");
+
+		pcie->scu = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,scu");
+		if (IS_ERR(pcie->scu))
+			return dev_err_probe(dev, PTR_ERR(pcie->scu), "failed to map SCU regmap\n");
+	}
 
 	/*
 	 * The controller may have been left out of reset by the bootloader
@@ -1024,34 +1060,60 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
-	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
-	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
-	      FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
-	writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);
+	/* Assert PERSTOUT for all relevant lines */
+	err = reset_control_bulk_assert(MAX_NUM_PERSTOUT_RESETS,
+					pcie->perstout_resets);
+	if (err) {
+		dev_err(dev, "failed to assert PERSTOUTs\n");
+		goto err_perstout_assert;
+	}
+
+	/* Configure SCU MUX to disable PCIE1 for 2 lines mode */
+	if (num_lanes == 2)
+		regmap_update_bits(pcie->scu, SCU_PCIC, SCU_PCIC_PCIE_CTRL,
+				   FIELD_PREP(SCU_PCIC_PCIE_CTRL, BIT(1)));
 
-	val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
-	      FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
-	      FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
-	      FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
-	writel_relaxed(val, pcie->base + PCIE_PIPE4_PIE8_REG);
 
 	err = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
 	if (err) {
 		dev_err(dev, "failed to prepare clock\n");
-		goto err_clk_prepare_enable;
+		goto err_perstout_assert;
 	}
 
-	/*
-	 * Airoha EN7581 performs PCIe reset via clk callbacks since it has a
-	 * hw issue with PCIE_PE_RSTB signal. Add wait for the time needed to
-	 * complete the PCIe reset.
-	 */
+	/* Wait for refclk to stabilize */
 	msleep(PCIE_T_PVPERL_MS);
 
+	/* Configure all the lines to the same EQ config */
+	for (i = 0; i < num_lanes; i++) {
+		void __iomem *base = pcie->base;
+
+		if (i == 1)
+			base = pcie->sec_base;
+
+		val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
+			FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
+			FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
+			FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
+		writel_relaxed(val, base + PCIE_EQ_PRESET_01_REG);
+
+		val = PCIE_K_PHYPARAM_QUERY | PCIE_K_QUERY_TIMEOUT |
+			FIELD_PREP(PCIE_K_PRESET_TO_USE_16G, 0x80) |
+			FIELD_PREP(PCIE_K_PRESET_TO_USE, 0x2) |
+			FIELD_PREP(PCIE_K_FINETUNE_MAX, 0xf);
+		writel_relaxed(val, base + PCIE_PIPE4_PIE8_REG);
+	}
+
+	/* Deassert PERSTOUT for all relevant lines */
+	err = reset_control_bulk_deassert(MAX_NUM_PERSTOUT_RESETS,
+					  pcie->perstout_resets);
+	if (err) {
+		dev_err(dev, "failed to deassert PERSTOUTs\n");
+		goto err_perstout_assert;
+	}
+
 	return 0;
 
-err_clk_prepare_enable:
+err_perstout_assert:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
-- 
2.53.0


