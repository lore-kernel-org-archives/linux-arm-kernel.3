Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3DDCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/hSmSXJaHEKANxY7b911Jeuq3Okz1lZH5CE6S4se5Q=; b=ZrODhsX4vRem1quUtoShVEegzX
	CKfRz1DufQYYhtoaxaE0AEaIBZ3wzagOlI5B14lbWyC/80Wm5OUAxkGjHvd2TEqqk5BIbMw3f7D/M
	QztgO87bpH/H6ukGuAZzVoofW5YFcTa8h13z8DoWj5FBgYxqR7K/qVKL7VM3Y2TQrAJFDipJwZcfw
	b926v2YQUs27TVz8rckh+5/bb9x1PqD/Qxt0fUzTDTUBdLXqA8n/3dSBVPNyHDY2+QUhv6H3EE51j
	2nSDu9VcPp0F0MjGdZzmcMGE0bYPaWw/FJPORCL2ZpTBU4lZchfDTsHfkby8HlAQxcLvASDXUEZKo
	wgaVUeWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCm7-00000004M72-3N34;
	Sat, 16 Aug 2025 09:00:31 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCa5-00000004KBh-1Iui;
	Sat, 16 Aug 2025 08:48:06 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-76e2ea94c7cso2382674b3a.2;
        Sat, 16 Aug 2025 01:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334084; x=1755938884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/hSmSXJaHEKANxY7b911Jeuq3Okz1lZH5CE6S4se5Q=;
        b=JTrfovErX4snR7W3OYbYk5Vx0j2p18O16IhqzdjljnDi0Cy9XdNCk2ajOlC5k9ubru
         yBMYMH4zzv5vLiRIZZsnb9pf73X8Xjo5FKXnxEdGOp8viYCnpm/4E5RHtzqcEH3jUDaB
         TXbpJ2EBd59J8UGyS5O53xAR6exfCH+gUHFpWxXS8y4e94XfPyX2KfQhhkygNhZj1Jbz
         AEqMLtdJkaCvJqHgh8Q5/rg1LAJroy/qCBZFwDofHsnqwC89D5g9+CfWNAF6FHrGReQX
         Nm+5mIAFvP0gcCxAUm2JSYcE2Fs+v7STxniGMkDmvyU1lVAngGQQ5mhc4o9TqueyqvP3
         9NkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334084; x=1755938884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/hSmSXJaHEKANxY7b911Jeuq3Okz1lZH5CE6S4se5Q=;
        b=YlH1wp3bMv5woYGSFGznIyijKfCB4QGGn2JMxO4fSSMdvWBg+r8Et7+VBFDOLIMyo0
         9QNnoO4CE/rTpW9iauXUuiM3aAQk85FABRg6K4XotxSgU2iXGeHNqVyFKqmOuw5CwlI1
         P+4FdYtlksHmbZXpSB1VItQd/agoXplrRVU+3PgBF5rykzlKgqBBUtal4V/S/pYJGbIg
         xbzX1ouJ7JHqA/9Nk4OT+g+Zvk3ASXvJcRLlHSvVtcRxsAxUMof9q0AXIkK+TQlLwylB
         K+28faGgHjkxPguaazV8hVR3gWGu63QR7g777rO1NtR+yFiDzODYZzpqLlgu1VUJy0j+
         OthQ==
X-Forwarded-Encrypted: i=1; AJvYcCW99GlPuqdc6kIzkZzcutH1HvKAAhxaoJharqrHgLV9qgC11TbWg5okMfwzzu+HPz456jDMps3Wh/nXxDLQjbdO@lists.infradead.org, AJvYcCX0rYOSuzEnMCcJRnVAtBjvzcUo4KEHyHK9TjZ1Jv92+IrPQU+h6ye9n4NLa7MgGuC+g+MUEoV9/PGY@lists.infradead.org
X-Gm-Message-State: AOJu0YzT9pP9aWz75dDaQVwqnYKIUjPsT/37ionCMITnbirXdV2CLUpZ
	ShPBJ9mNzh4yrYK7tOGhdZdXbDOrkKpnVUaMAZEVYXRxiNpr2qbjWdF92ZKM1vInvhU=
X-Gm-Gg: ASbGncvvakbL+il0yC0SzktATtJC7A54l1t30b3nS/lXwfgOxTt5TMz0lNm7pj7yz5B
	cktzl2j3Be2FFGObmO2LjTi9iHub9OU0W8p+kIRntkFE59eKQ7wL8XTy6dBUFen7n5SfOogiwos
	JGmuzHBoEzd5sQTdRdfHjSEXd7i9LyGJQ83F3+OtHiCjhuElO6l35G0YRFnFSk6XZAq2J/jIPHS
	CFET/JUWa89SmfQ/dVsuD2CE2I8PsKeXKkIwJvOvoB5SzqYVWY40k5LQPng/xnpkBBTf64BR+Qe
	6y5Sjhclv5hTgcqZfR9UnOpi1cshpPWrrWnh8gOEYo43duHNtZAkMcgxWZxBPc96UoMihSn5Hrz
	ux9q+NZ5BCiU=
X-Google-Smtp-Source: AGHT+IHtjjsbl1HDfzV38iYeiPC60QdrfguJ+6kBdsjCS0cFJoEczwJE0FyIwHLnuIsHXh3TTN2JKw==
X-Received: by 2002:a17:903:22c9:b0:240:725d:c396 with SMTP id d9443c01a7336-24478f72011mr31631775ad.34.1755334084471;
        Sat, 16 Aug 2025 01:48:04 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:48:04 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 4/7] phy: allwinner: a523: add USB3/PCIe PHY driver
Date: Sat, 16 Aug 2025 16:46:57 +0800
Message-ID: <20250816084700.569524-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816084700.569524-1-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_014805_353386_8931CD31 
X-CRM114-Status: GOOD (  26.32  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 family of processors features a combophy for USB 3.0 and PCIe,
developed by Innosilicon. Simultaneous operation of both interfaces is
not supported by design.
Currently, the driver only adds support for USB 3.0. PCIe support is
currently unavailable and will be added later.
All data on phy configuration is taken from the manufacturer's BSP driver.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/phy/allwinner/Kconfig                |   9 +
 drivers/phy/allwinner/Makefile               |   1 +
 drivers/phy/allwinner/phy-sun55i-usb3-pcie.c | 267 +++++++++++++++++++
 3 files changed, 277 insertions(+)
 create mode 100644 drivers/phy/allwinner/phy-sun55i-usb3-pcie.c

diff --git a/drivers/phy/allwinner/Kconfig b/drivers/phy/allwinner/Kconfig
index fb584518b..af2a82e51 100644
--- a/drivers/phy/allwinner/Kconfig
+++ b/drivers/phy/allwinner/Kconfig
@@ -57,3 +57,12 @@ config PHY_SUN50I_USB3
 	  part of Allwinner H6 SoC.
 
 	  This driver controls each individual USB 2+3 host PHY combo.
+
+config PHY_SUN55I_USB3_PCIE
+	tristate "Allwinner A523 Innosilicon USB3/PCIe Combophy Driver"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on RESET_CONTROLLER
+	select GENERIC_PHY
+	help
+	  Enable this to support the Allwinner PCIe/USB3.0 combo PHY
+	  with Innosilicon IP block founded in A523/A527/H728/T527 SOC
diff --git a/drivers/phy/allwinner/Makefile b/drivers/phy/allwinner/Makefile
index bd74901a1..5948a27ef 100644
--- a/drivers/phy/allwinner/Makefile
+++ b/drivers/phy/allwinner/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_PHY_SUN4I_USB)		+= phy-sun4i-usb.o
 obj-$(CONFIG_PHY_SUN6I_MIPI_DPHY)	+= phy-sun6i-mipi-dphy.o
 obj-$(CONFIG_PHY_SUN9I_USB)		+= phy-sun9i-usb.o
 obj-$(CONFIG_PHY_SUN50I_USB3)		+= phy-sun50i-usb3.o
+obj-$(CONFIG_PHY_SUN55I_USB3_PCIE)		+= phy-sun55i-usb3-pcie.o
diff --git a/drivers/phy/allwinner/phy-sun55i-usb3-pcie.c b/drivers/phy/allwinner/phy-sun55i-usb3-pcie.c
new file mode 100644
index 000000000..905c54a67
--- /dev/null
+++ b/drivers/phy/allwinner/phy-sun55i-usb3-pcie.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for Innosilicon USB3.0/PCIe phy found in Allwinner A523 processors.
+ * Currently, the driver only supports the USB3.0 part.
+ *
+ * Copyright (C) 2025 Mikhail Kalashnikov <iuncuim@gmail.com>
+ * Based on phy-sun50i-usb3.c, which is:
+ * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#define PHY_SYS_VER			0x00
+
+#define PHY_USB3_BGR		0x08
+/* Control bits for the USB3 part */
+#define USB3_RESETN			BIT(0)
+#define USB3_ACLK_EN		BIT(17)
+#define USB3_HCLK_EN		BIT(16)
+
+#define PHY_CTL				0x10
+/* Control bits for the common part */
+#define PHY_RSTN			BIT(0)
+/* Bit for selecting internal(0) or external(1) clock */
+#define PHY_CLK_SEL			BIT(30)
+/* Bit for selecting PCIe(0) or USB3(1) role */
+#define PHY_USE_SEL			BIT(31)
+
+#define PHY_CLK_OFFSET		0x80000
+
+struct sun55i_usb3_pcie_phy {
+	struct device *dev;
+	struct phy *phy;
+	void __iomem *regs;
+	void __iomem *regs_clk;
+	struct reset_control *reset;
+	struct clk *clk;
+};
+
+/*
+ * These values are derived from the manufacturer's driver code.
+ * Comments are preserved.
+ */
+static void sun55i_usb3_phy_open(struct sun55i_usb3_pcie_phy *phy)
+{
+	u32 val;
+
+	val = readl(phy->regs_clk + 0x1418);
+	val &= ~(GENMASK(17, 16));
+	val |= BIT(25);
+	writel(val, phy->regs_clk + 0x1418);
+
+	/* reg_rx_eq_bypass[3]=1, rx_ctle_res_cal_bypass */
+	val = readl(phy->regs_clk + 0x674);
+	val |= BIT(3);
+	writel(val, phy->regs_clk + 0x674);
+
+	/* rx_ctle_res_cal=0xf, 0x4->0xf */
+	val = readl(phy->regs_clk + 0x704);
+	val |= BIT(8) | BIT(9) | BIT(11);
+	writel(val, phy->regs_clk + 0x704);
+
+	/* CDR_div_fin_gain1 */
+	val = readl(phy->regs_clk + 0x400);
+	val |= BIT(4);
+	writel(val, phy->regs_clk + 0x400);
+
+	/* CDR_div1_fin_gain1 */
+	val = readl(phy->regs_clk + 0x404);
+	val |= GENMASK(3, 0);
+	val |= BIT(5);
+	writel(val, phy->regs_clk + 0x404);
+
+	/* CDR_div3_fin_gain1 */
+	val = readl(phy->regs_clk + 0x408);
+	val |= BIT(5);
+	writel(val, phy->regs_clk + 0x408);
+
+	val = readl(phy->regs_clk + 0x109c);
+	val |= BIT(1);
+	writel(val, phy->regs_clk + 0x109c);
+
+	/* SSC configure */
+	/* div_N */
+	val = readl(phy->regs_clk + 0x107c);
+	val &= ~(GENMASK(17, 12));
+	val |= BIT(12);
+	writel(val, phy->regs_clk + 0x107c);
+
+	/* modulation freq div */
+	val = readl(phy->regs_clk + 0x1020);
+	val &= ~(GENMASK(4, 0));
+	val |= BIT(1) | BIT(2);
+	writel(val, phy->regs_clk + 0x1020);
+
+	/* spread[6:0], 400*9=4410ppm ssc */
+	val = readl(phy->regs_clk + 0x1034);
+	val &= ~(GENMASK(22, 16));
+	val |= BIT(16) | BIT(19);
+	writel(val, phy->regs_clk + 0x1034);
+
+	val = readl(phy->regs_clk + 0x101c);
+	/* don't disable ssc = 0 */
+	val &= ~BIT(28);
+	/* choose downspread */
+	val |= BIT(27);
+	writel(val, phy->regs_clk + 0x101c);
+}
+
+static int sun55i_usb3_pcie_clk_init(struct sun55i_usb3_pcie_phy *phy)
+{
+	u32 val;
+	int ret;
+
+	ret = clk_prepare_enable(phy->clk);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(phy->reset);
+	if (ret) {
+		clk_disable_unprepare(phy->clk);
+		return ret;
+	}
+
+	val = readl(phy->regs + PHY_CTL);
+	val |= PHY_USE_SEL | PHY_RSTN;
+	val &= ~PHY_CLK_SEL;
+	writel(val, phy->regs + PHY_CTL);
+
+	val = readl(phy->regs + PHY_USB3_BGR);
+	val |= USB3_ACLK_EN | USB3_HCLK_EN | USB3_RESETN;
+	writel(val, phy->regs + PHY_USB3_BGR);
+
+	return 0;
+}
+
+static int sun55i_usb3_pcie_phy_init(struct phy *_phy)
+{
+	struct sun55i_usb3_pcie_phy *phy = phy_get_drvdata(_phy);
+
+	sun55i_usb3_phy_open(phy);
+
+	return 0;
+}
+
+static int sun55i_usb3_pcie_phy_exit(struct phy *_phy)
+{
+	struct sun55i_usb3_pcie_phy *phy = phy_get_drvdata(_phy);
+
+	reset_control_assert(phy->reset);
+	clk_disable_unprepare(phy->clk);
+
+	return 0;
+}
+
+static void sun55i_usb3_pcie_phy_power_set(struct phy *_phy, bool on)
+{
+	struct sun55i_usb3_pcie_phy *phy = phy_get_drvdata(_phy);
+	u32 val;
+
+	val = readl(phy->regs_clk + 0x14);
+	val = on ? (val & ~BIT(26)) : (val | BIT(26));
+	writel(val, phy->regs_clk + 0x14);
+
+	val = readl(phy->regs_clk);
+	val = on ? (val & ~BIT(10)) : (val | BIT(10));
+	writel(val, phy->regs_clk);
+}
+
+static int sun55i_usb3_pcie_phy_power_on(struct phy *_phy)
+{
+	sun55i_usb3_pcie_phy_power_set(_phy, true);
+
+	return 0;
+}
+
+static int sun55i_usb3_pcie_phy_power_off(struct phy *_phy)
+{
+	sun55i_usb3_pcie_phy_power_set(_phy, false);
+
+	return 0;
+}
+
+static const struct phy_ops sun55i_usb3_pcie_phy_ops = {
+	.init		= sun55i_usb3_pcie_phy_init,
+	.exit		= sun55i_usb3_pcie_phy_exit,
+	.power_on	= sun55i_usb3_pcie_phy_power_on,
+	.power_off	= sun55i_usb3_pcie_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static int sun55i_usb3_pcie_phy_probe(struct platform_device *pdev)
+{
+	struct sun55i_usb3_pcie_phy *phy;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	int ret;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	phy->dev = dev;
+	phy->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(phy->clk)) {
+		if (PTR_ERR(phy->clk) != -EPROBE_DEFER)
+			dev_err(dev, "failed to get phy clock\n");
+		return PTR_ERR(phy->clk);
+	}
+
+	phy->reset = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(phy->reset)) {
+		dev_err(dev, "failed to get reset control\n");
+		return PTR_ERR(phy->reset);
+	}
+
+	phy->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(phy->regs))
+		return PTR_ERR(phy->regs);
+
+	phy->regs_clk = phy->regs + PHY_CLK_OFFSET;
+	if (IS_ERR(phy->regs_clk))
+		return PTR_ERR(phy->regs_clk);
+
+	phy->phy = devm_phy_create(dev, NULL, &sun55i_usb3_pcie_phy_ops);
+	if (IS_ERR(phy->phy)) {
+		dev_err(dev, "failed to create PHY\n");
+		return PTR_ERR(phy->phy);
+	}
+
+	phy_set_drvdata(phy->phy, phy);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	ret = sun55i_usb3_pcie_clk_init(phy);
+	if (ret)
+		return ret;
+	dev_info(phy->dev, "phy version is: 0x%x\n", readl(phy->regs));
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id sun55i_usb3_pcie_phy_of_match[] = {
+	{ .compatible = "allwinner,sun55i-a523-usb3-pcie-phy" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sun55i_usb3_pcie_phy_of_match);
+
+static struct platform_driver sun55i_usb3_pcie_phy_driver = {
+	.probe	= sun55i_usb3_pcie_phy_probe,
+	.driver = {
+		.of_match_table	= sun55i_usb3_pcie_phy_of_match,
+		.name  = "sun55i-usb3-pcie-phy",
+	}
+};
+module_platform_driver(sun55i_usb3_pcie_phy_driver);
+
+MODULE_DESCRIPTION("Allwinner A523 USB3/PCIe phy driver");
+MODULE_AUTHOR("Mikhail Kalashnikov <iuncuim@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.50.1


