Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9C9CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kvHqxbcxxXje2oonPX+fzWNLx9A+z/O6oQCqym9uUI=; b=xBqlowEz9pR4NFaRUKoO35DqdX
	5JXCV5CILs2cEIGKgpHG5d8J0zOFpnM5B+lF0vfloic24kZJDPxgaJXGOk20C3ZJa0xPm4J9VOhU0
	BK8/UhlX/utYo01mwmnKVfq+AQAuZtB75L8G+BWcw5b+GI2fJJfE7U1Y08Mik8QeI6Nr5Tb0VthXw
	Z82vviAU0DtitnmVsl0OLS2TJ/rnmHiXlqqa06G75tZPawV9mEFAO9dHKhWMEQnf1lwb5NFQn3LOc
	ZWxlOyVpZOMZCkQxTptypf3juLBOqmTcJlXdIfe1dHFy+A8lLwsPWd6zQVE+YwvxoU0QWsclk7TAE
	pMuaz51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWh3-000000083Te-3kiO;
	Sat, 10 Oct 2026 13:00:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgt-000000083Ic-4Adl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a166199820so3376985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637242; x=1792242042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3kvHqxbcxxXje2oonPX+fzWNLx9A+z/O6oQCqym9uUI=;
        b=Kuoq23xWu/P6UdaEbpRKtQklSFbvuE3g42wcyAqk1aRYbEcB2tokGKrv2B5INUatPy
         31z9VfIFa0l3NuvkKVusXhC6XPefn9mISZ8Sq8nxTigLiCUBFJ+EPgJhcggk5SGmnhkE
         +JswUtJy1NCEIHfBr5ngNNhzXWmE5hoqJ1uVBy+vc1O/7K/TnVWynfS5iGHDfA0jdqtQ
         517mzKH20a2MbdVHomB1xG82Ik6BUgkP5YOFPH3dpIYemabbCb1gr64skJYMqDHR5kKm
         ISPJoP2kJ59Ztcth8395G1g+n6jbrSfEa4TJPXtqy+aDwuwJba2EFxAwEYiTmZBcGQ0S
         jM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637242; x=1792242042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3kvHqxbcxxXje2oonPX+fzWNLx9A+z/O6oQCqym9uUI=;
        b=K+2P+LF/0/A8+w7K2zUx4RtvoYvkvuvm3tsk26LO5TWTW3o1rD3pBcN6Z2Rj/V2Z0w
         DaJnaVpAhJf2DrUClp9v3AQpAn59dHiy+va/p0odvDnmfLr2gNkN+bAgw7IAVouE3SpF
         SZw4lzp1Ru4TGsZowJVmBYIlLOAoj6xJL9eMawYX+4/4JUi3YOJ1VfcXEArJtlSZ8Drw
         t7uXuxqyjPZkiUomV7GZotup3m0GZh5VaMhB7DmwnxF3MI0SfiqTqaZ4U/B7flhSAfcc
         iRnTs5+uaICeZqSgfHsVhG9BRNSCuQjQd0Ot6lK0xeMN7TwuC8eHHPYR333RekeP+B20
         gpJA==
X-Gm-Message-State: AFq9FYLgLoRSiN7Fqa5flxtX5nEvCBNsD/4+0lG5jXWU6xPbvP2tJLi9
	4g4HflA+TkWLkPAdCjEovy2s7sHmg8YeTkcRjwvBLpGJOTWr0KTYhF8nwuqhqM6i2FrEkQ==
X-Gm-Gg: AYBFou3SfCZ47Cpl+xSDW+P95kX9XBdWONB4PtkyEqtwpyvF9c3C4VBPtxi7TBEkE/W
	lFeOUzhINlNJRunPD+VkzPGrAMq1ABLLyLHQGqWEQU9SYZvCtpd/dRNndPExWGnM9ihami9zkMI
	Fw6Uc2eT+xHeIMEN8Qq67bf1TC+kngC3QjuDEqUcwGLaa7rhT+STlAu5gvT9Kw+lGAMDt1+eNYO
	O878RLMKHRba/4pBsfHQ5VlduSKuvdlFYPSexe41uVSGOmErDxNhhXNlmfLgaydP6hXgcrFqmFr
	ZRdXEB6olu8oYNsRobZDn5qftb2GLvDBPeia+JcM2SXyUl4noTDYTXiU7UAgkYw1nguXwHmJpZz
	Vtd6ULvYiVFbnIp65ir5Ycd6T1JUV2AAatBX9GqxIWHF8gGHFH6Ec+ct4jmFXieophJnIdahyFd
	tIarf5HbjaUDqHkBq7555zBQcFCbkguyocAbrpx9mFVvCV3eaqMVNfPZ6EfyWJj+O0kphDzWB1o
	buqKi19Dduee3CQEJA4Xtmy4TTcpD2n8Z9Hp6pEUXiwvOyfcuPIeUN0dx69a0Crm00+9Rf8VMpx
	PY/PNNyEakm2CrN4nkgV1YUMNvZ51KKqphExN7xdy4u+UBsVUvmhkmru27J8xnyb5nquhXqi
X-Received: by 2002:a05:600c:c10e:b0:4a1:93fd:913 with SMTP id 5b1f17b1804b1-4a193fd0ad6mr30014775e9.10.1791637242022;
        Sat, 10 Oct 2026 06:00:42 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:41 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Sat, 10 Oct 2026 13:59:51 +0100
Message-ID: <20261010130024.177503-14-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060044_101971_45A74680 
X-CRM114-Status: GOOD (  32.52  )
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

Bring up both controller links using the verified vendor sequence and
shared board reset. Propagate CRM/GPIO failures and retain the tested
Gen1/INTx configuration.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/pci/controller/dwc/Kconfig          |  12 +
 drivers/pci/controller/dwc/Makefile         |   1 +
 drivers/pci/controller/dwc/pcie-zx279128s.c | 322 ++++++++++++++++++++
 3 files changed, 335 insertions(+)
 create mode 100644 drivers/pci/controller/dwc/pcie-zx279128s.c

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index dcfbe7e229..511f59d079 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -577,4 +577,16 @@ config PCIE_ULTRARISC
 	  By default, this symbol is enabled when ARCH_ULTRARISC is active,
 	  requiring no further configuration on that platform.
 
+config PCIE_ZX279128S
+	bool "ZTE zx279128s PCIe controller"
+	depends on ARCH_ZTE || COMPILE_TEST
+	depends on PCI_MSI
+	select MFD_SYSCON
+	select PCIE_DW_HOST
+	help
+	  Say Y here to enable support for the two PCIe host controllers of
+	  the ZTE zx279128s SoC. They are based on the Synopsys DesignWare
+	  PCIe IP. On the ZTE ZXHN H3600 they connect the MT7915 Wi-Fi chip.
+	  The driver only supports legacy INTx interrupts.
+
 endmenu
diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
index d4f88cfc62..379198ebd6 100644
--- a/drivers/pci/controller/dwc/Makefile
+++ b/drivers/pci/controller/dwc/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_PCIE_TEGRA194) += pcie-tegra194.o
 obj-$(CONFIG_PCIE_UNIPHIER) += pcie-uniphier.o
 obj-$(CONFIG_PCIE_UNIPHIER_EP) += pcie-uniphier-ep.o
 obj-$(CONFIG_PCIE_VISCONTI_HOST) += pcie-visconti.o
+obj-$(CONFIG_PCIE_ZX279128S) += pcie-zx279128s.o
 obj-$(CONFIG_PCIE_RCAR_GEN4) += pcie-rcar-gen4.o
 obj-$(CONFIG_PCIE_SPACEMIT_K1) += pcie-spacemit-k1.o
 obj-$(CONFIG_PCIE_STM32_HOST) += pcie-stm32.o
diff --git a/drivers/pci/controller/dwc/pcie-zx279128s.c b/drivers/pci/controller/dwc/pcie-zx279128s.c
new file mode 100644
index 0000000000..3559beb35a
--- /dev/null
+++ b/drivers/pci/controller/dwc/pcie-zx279128s.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ZTE zx279128s PCIe host controller
+ *
+ * The SoC has two DesignWare PCIe controllers with one lane each. Their
+ * clocks, resets and PHYs are controlled through the Top CRM (clock and reset
+ * module) blocks, and a pin state from the pin mux is applied before probe.
+ * The register sequence comes from the vendor firmware, and the meaning of
+ * most of its bits is not documented.
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "pcie-designware.h"
+
+/* Top CRM 1: PHY and PLL controls */
+#define CRM1_PHY_CTRL		0x008
+#define CRM1_MISC		0x024
+#define CRM1_MISC_BIT26		BIT(26)
+#define CRM1_PHY1_CAL0		0x1b0
+#define CRM1_PHY1_CAL1		0x1b4
+
+/* Top CRM 2: clocks and resets */
+#define CRM2_CLK		0x070
+#define CRM2_RST		0x074
+#define CRM2_RST_ALL		0x3f
+
+/* Controller wrapper ("ctrl" registers) */
+#define CTRL_CFG		0x000
+#define CTRL_CFG_EN		BIT(5)
+#define CTRL_STATUS		0x0dc
+#define CTRL_STATUS_LTSSM	GENMASK(22, 17)
+#define CTRL_LTSSM_L0		0x11
+
+enum { ZX_CRM1, ZX_CRM2, ZX_NUM_CRM };
+
+/* The CRM bits of one controller, which is identified by its ctrl address */
+struct zx279128s_pcie_port {
+	resource_size_t ctrl_addr;
+	u32 clk_on;		/* CRM2_CLK bits set first */
+	u32 clk_off;		/* CRM2_CLK bit cleared at the end */
+	u32 phy_on[3];		/* CRM1_PHY_CTRL bits, set in this order */
+	bool phy_cal;		/* write the CRM1_PHY1_CAL values */
+	u32 rst;		/* CRM2_RST bit */
+};
+
+static const struct zx279128s_pcie_port zx279128s_pcie_ports[] = {
+	{
+		.ctrl_addr = 0x09500000,
+		.clk_on = 0xb5,
+		.clk_off = BIT(8),
+		.phy_on = { BIT(15), BIT(13), BIT(14) },
+		.rst = BIT(0),
+	}, {
+		.ctrl_addr = 0x09600000,
+		.clk_on = 0x1aa00,
+		.clk_off = BIT(17),
+		.phy_on = { BIT(27), BIT(25), BIT(26) },
+		.phy_cal = true,
+		.rst = BIT(3),
+	},
+};
+
+struct zx279128s_pcie {
+	struct dw_pcie pci;
+	void __iomem *ctrl;
+	struct regmap *crm[ZX_NUM_CRM];
+	const struct zx279128s_pcie_port *port;
+	struct gpio_desc *reset;
+	struct gpio_desc *enable;
+};
+
+#define to_zx279128s_pcie(x)	container_of(x, struct zx279128s_pcie, pci)
+
+/* The board reset lines are shared by both controllers, see host_init */
+static DEFINE_MUTEX(zx279128s_board_lock);
+static bool zx279128s_board_released;
+
+/* Limit the link to 2.5 GT/s and retrain it, as the vendor firmware does */
+static void zx279128s_pcie_force_gen1(struct dw_pcie *pci)
+{
+	u8 cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u32 val;
+
+	if (WARN_ON(!cap))
+		return;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	val = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCTL2);
+	val &= ~PCI_EXP_LNKCTL2_TLS;
+	val |= PCI_EXP_LNKCTL2_TLS_2_5GT;
+	dw_pcie_writel_dbi(pci, cap + PCI_EXP_LNKCTL2, val);
+
+	val = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCTL);
+	dw_pcie_writel_dbi(pci, cap + PCI_EXP_LNKCTL, val | PCI_EXP_LNKCTL_RL);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
+static int zx279128s_pcie_init_crm(struct zx279128s_pcie *pcie)
+{
+	const struct zx279128s_pcie_port *port = pcie->port;
+	struct regmap *crm1 = pcie->crm[ZX_CRM1];
+	struct regmap *crm2 = pcie->crm[ZX_CRM2];
+	int ret, i;
+
+	/* Ungate the clocks */
+	ret = regmap_write_bits(crm2, CRM2_CLK, port->clk_on, port->clk_on);
+	if (ret)
+		return ret;
+	fsleep(50);
+
+	/* Power up the PHY and its PLL */
+	for (i = 0; i < ARRAY_SIZE(port->phy_on); i++) {
+		ret = regmap_write_bits(crm1, CRM1_PHY_CTRL, port->phy_on[i],
+					port->phy_on[i]);
+		if (ret)
+			return ret;
+		fsleep(50);
+
+		if (i == 0 && port->phy_cal) {
+			ret = regmap_write(crm1, CRM1_PHY1_CAL1, 0x00202d5a);
+			if (ret)
+				return ret;
+			ret = regmap_write(crm1, CRM1_PHY1_CAL0, 0x0046c24a);
+			if (ret)
+				return ret;
+		}
+	}
+
+	ret = regmap_write_bits(crm2, CRM2_RST, port->rst, 0);
+	if (ret)
+		return ret;
+	fsleep(50);
+
+	ret = regmap_write_bits(crm1, CRM1_MISC, CRM1_MISC_BIT26, 0);
+	if (ret)
+		return ret;
+	fsleep(50);
+
+	ret = regmap_write_bits(crm2, CRM2_RST, port->rst, port->rst);
+	if (ret)
+		return ret;
+	ret = regmap_write_bits(crm2, CRM2_CLK, port->clk_off, 0);
+	if (ret)
+		return ret;
+
+	return regmap_write(crm2, CRM2_RST, CRM2_RST_ALL);
+}
+
+static int zx279128s_pcie_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct zx279128s_pcie *pcie = to_zx279128s_pcie(pci);
+	int ret;
+
+	/*
+	 * The board lines reset a device that can sit behind both controllers
+	 * (the MT7915 of the H3600 uses both). The first controller to start
+	 * resets and releases it; the second must not reset it again.
+	 */
+	mutex_lock(&zx279128s_board_lock);
+	if (!zx279128s_board_released && (pcie->reset || pcie->enable)) {
+		ret = gpiod_direction_output(pcie->reset, 1);
+		if (ret)
+			goto err_unlock;
+		ret = gpiod_direction_output(pcie->enable, 0);
+		if (ret)
+			goto err_unlock;
+		msleep(100);
+		ret = gpiod_set_value_cansleep(pcie->reset, 0);
+		if (ret)
+			goto err_unlock;
+		ret = gpiod_set_value_cansleep(pcie->enable, 1);
+		if (ret)
+			goto err_unlock;
+		msleep(200);
+		zx279128s_board_released = true;
+	}
+	mutex_unlock(&zx279128s_board_lock);
+
+	ret = zx279128s_pcie_init_crm(pcie);
+	if (ret)
+		return dev_err_probe(pci->dev, ret, "failed to initialize CRM\n");
+
+	/* Enable the controller, which starts link training */
+	writel(readl(pcie->ctrl + CTRL_CFG) | CTRL_CFG_EN, pcie->ctrl + CTRL_CFG);
+
+	zx279128s_pcie_force_gen1(pci);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&zx279128s_board_lock);
+	return dev_err_probe(pci->dev, ret, "failed to drive the board GPIOs\n");
+}
+
+/*
+ * The Wi-Fi on the H3600 uses legacy INTx interrupts. Providing msi_init
+ * keeps the DWC core from setting up its internal MSI controller, which has
+ * not been tested on this SoC.
+ */
+static int zx279128s_pcie_msi_init(struct dw_pcie_rp *pp)
+{
+	return 0;
+}
+
+static const struct dw_pcie_host_ops zx279128s_pcie_host_ops = {
+	.init = zx279128s_pcie_host_init,
+	.msi_init = zx279128s_pcie_msi_init,
+};
+
+static int zx279128s_pcie_start_link(struct dw_pcie *pci)
+{
+	zx279128s_pcie_force_gen1(pci);
+
+	return 0;
+}
+
+static bool zx279128s_pcie_link_up(struct dw_pcie *pci)
+{
+	struct zx279128s_pcie *pcie = to_zx279128s_pcie(pci);
+	u32 val = readl(pcie->ctrl + CTRL_STATUS);
+
+	return FIELD_GET(CTRL_STATUS_LTSSM, val) == CTRL_LTSSM_L0;
+}
+
+static const struct dw_pcie_ops zx279128s_pcie_ops = {
+	.link_up = zx279128s_pcie_link_up,
+	.start_link = zx279128s_pcie_start_link,
+};
+
+static int zx279128s_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct zx279128s_pcie *pcie;
+	struct device_node *np;
+	struct resource *res;
+	int i;
+
+	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
+	if (!pcie)
+		return -ENOMEM;
+
+	pcie->pci.dev = dev;
+	pcie->pci.ops = &zx279128s_pcie_ops;
+	pcie->pci.pp.ops = &zx279128s_pcie_host_ops;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ctrl");
+	pcie->ctrl = devm_ioremap_resource(dev, res);
+	if (IS_ERR(pcie->ctrl))
+		return PTR_ERR(pcie->ctrl);
+
+	for (i = 0; i < ARRAY_SIZE(zx279128s_pcie_ports); i++)
+		if (zx279128s_pcie_ports[i].ctrl_addr == res->start)
+			pcie->port = &zx279128s_pcie_ports[i];
+	if (!pcie->port)
+		return dev_err_probe(dev, -EINVAL, "unknown controller at %pR\n",
+				     res);
+
+	for (i = 0; i < ZX_NUM_CRM; i++) {
+		np = of_parse_phandle(dev->of_node, "zte,crm", i);
+		if (!np)
+			return dev_err_probe(dev, -EINVAL,
+					     "missing Top CRM %d\n", i + 1);
+
+		pcie->crm[i] = syscon_node_to_regmap(np);
+		of_node_put(np);
+		if (IS_ERR(pcie->crm[i]))
+			return dev_err_probe(dev, PTR_ERR(pcie->crm[i]),
+					     "failed to get Top CRM %d\n", i + 1);
+	}
+
+	/*
+	 * Shared with the other controller: take the lines as they are, so
+	 * that a late probe can't reset a device the other one already uses.
+	 */
+	pcie->reset = devm_gpiod_get_optional(dev, "reset",
+					      GPIOD_ASIS | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	if (IS_ERR(pcie->reset))
+		return dev_err_probe(dev, PTR_ERR(pcie->reset),
+				     "failed to get the reset GPIO\n");
+
+	pcie->enable = devm_gpiod_get_optional(dev, "enable",
+					       GPIOD_ASIS | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	if (IS_ERR(pcie->enable))
+		return dev_err_probe(dev, PTR_ERR(pcie->enable),
+				     "failed to get the enable GPIO\n");
+
+	return dw_pcie_host_init(&pcie->pci.pp);
+}
+
+static const struct of_device_id zx279128s_pcie_of_match[] = {
+	{ .compatible = "zte,zx279128s-pcie" },
+	{ }
+};
+
+static struct platform_driver zx279128s_pcie_driver = {
+	.probe = zx279128s_pcie_probe,
+	.driver = {
+		.name = "zx279128s-pcie",
+		.of_match_table = zx279128s_pcie_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(zx279128s_pcie_driver);
-- 
2.55.0


