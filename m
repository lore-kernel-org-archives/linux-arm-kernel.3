Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2378CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keRrUcWeaqsNKhpvJvQPT0J0ua19qEmtTXZDFb0cKTU=; b=xEiHlAOpnRKGsupP3HLuelqgrY
	sAv7x/R37+O7CknWURFyM+KkgJhaQLa6MwVioeo2i/+mP/Tuy0FHvS6uaNrLBcUAT3RYEINvgldcy
	TF8KullOC6mCQmBzmo5B/fxYfJ4pw5+mBhGXu7zYoG/hVuYZzil6G6+KV1LYML2EYpEDFUnwZs2qY
	AD93Uggnhqga+xfQYncPOYFDM0mBS2U6Vzc6k9A73dwaAjn8eyrcfHzpytreHEzjl1BnChDwmcsnx
	cBU4XemxjHsxqM3MuV52czZ393DOsEkAd3uIalpAYBNQJRRTL198PiHjBbH+Rtj309PIEOS29i46a
	/e+BMDRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIw2-0000000HUBy-2Ap4;
	Fri, 05 Jun 2026 01:01:18 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvu-0000000HU1C-1VPJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 01:01:13 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-48662d16d08so534759b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 18:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621269; x=1781226069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keRrUcWeaqsNKhpvJvQPT0J0ua19qEmtTXZDFb0cKTU=;
        b=kXCfINKpTz4C+778p8TvHlqvPo1DKbBGZRi60kfW1+zrsUB8Zprp46Bua59KhagKMF
         85a67bWOFAq3c+b2cY0NHyyMJfjagE90CmQBG5i7hGVT3blbCRvTyIJ/muHGFoB7+IqN
         a8g3fLuzBe1w8BXfqPW0bAzOIDmcODg+IDnb3Wauly/nH9rHvhO2wiJljcdJY7rmGRMR
         M8ulZLp6C7JvIgwapQe3wWNX+oPqoq7f7F0WjMnSfHZsweyfn/uQV9MmO7ayzWV0bbT7
         q9WNUsmicFipqu9xzsqB0OrUjDs7WEfUhKtKCjYKXR6yrNGbE7+vTIQRtloYhhmfXnst
         mU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621269; x=1781226069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keRrUcWeaqsNKhpvJvQPT0J0ua19qEmtTXZDFb0cKTU=;
        b=Yz90/MsoqCiKhR82ZfiFmQeLQffG9UzCCXqr6Had61ejzP0qTCfjYOFC/lJBbF5QcM
         wLmfIy70rZ4/xRnCiAZOKxCgxFITm1FtHm1oRj9nxXF3LFeqFP8TcMVvFYZ6fg3Yw23Q
         94P/ozjuEEsC4ZWQqTxCRA7uKNzE5g5OJf8CFZKeM2WHhmi5hKHXHa13asOLZD6woiX2
         RJ7os9w+M7kgTe5peEDqz0BVF4DN2pyHOTzSigGiN95PxXDM2OciTbymnpdukigFhgBt
         kXC6BOMIkLKkzSRxQxwkaHctug2s+jpbRWr45/Xxh5I8aM8VYg/ibbbOdBHc745b+VZu
         cDKg==
X-Forwarded-Encrypted: i=1; AFNElJ94yhyV6uD4eQYieleBZ6+1/c385yIPKd6Ho9j9VDBEKsFPZQ8bZ7BNsoE/wDDE0AkjbQsv5E7JCmQ2fgIpPvD7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi+u3OFV8rpgcrxayxluYN6Jj566O/ydnd0KIf9MalKbOX7Bw1
	MfWF9dEAwaKIZ3ItslJsNwKGosO6a+tFEW8GXufSTJ/2mnOKoH8bMO4vO4snoJdDHxo=
X-Gm-Gg: Acq92OFAqoxfLYSs842hA4desGLRj+FsxyK9FNwczDWuzOXvN05V9jos/d+CeYgDwPs
	HgqQVCD8acPP5djY39mCUCGHeBYozgDtTmfYXT38O4Q50U7mNyJpSNZksMaGmlasYvt/K+vAYcW
	qJaRUFgQChtNpkV2QZnU/mEa5thfMwPEJ9YtDyinAwRh+wKbQeoTC5KQZMiFNDdYUAfZinUoqAT
	M2LkXMJhnt92NVrheabahSejTx7Zv09ssMxhdwPjtjJSRZ4a9uK8I450oZ7UQtIGiKk7b+/AqJN
	0hHj5OhNwMwp+OdneeLfE8aqXLHoKVRDAB4Tk5T7b5s3fdzOxIUD9daAbbW5orpbuRC5Q8j2rfS
	Sj1hJPFxjhL0CNtx6ZflqJmllaHvCSVudtB4p3dpm7gtBP5PB9TSYFKLDxFlavR6uDyOsdqP4Yh
	qxiuF2PcH5opSkBjvlRlNiVqQzQ99tEcqxPsquf7JAg80lJNag
X-Received: by 2002:a05:6808:1310:b0:467:1941:1f0d with SMTP id 5614622812f47-4868dc8f006mr912741b6e.11.1780621268713;
        Thu, 04 Jun 2026 18:01:08 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:01:08 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 13/14] net: stmmac: tc956x: add TC956x/QPS615 support
Date: Thu,  4 Jun 2026 20:00:20 -0500
Message-ID: <20260605010022.968612-14-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_180110_476802_731C6880 
X-CRM114-Status: GOOD (  28.99  )
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

From: Daniel Thompson <daniel@riscstar.com>

Toshiba TC956x is an Ethernet AVB/TSN bridge and is essentially a
small and highly-specialized SoC. TC956x includes an "eMAC" subsystem
that can be accessed, along with several other peripherals, via two
PCIe endpoint functions. There is a main driver for the endpoint that
decomposes things and creates auxiliary bus devices to model the SoC.

The eMAC consists of a Designware XGMAC, XPCS and PMA. Each eMAC is
supported by an MSIGEN that bridges TC956x level interrupts to PCIe
MSIs.

Add a driver for the eMAC/MSIGEN combination.

Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
 MAINTAINERS                                   |   2 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  14 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
 .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 818 ++++++++++++++++++
 4 files changed, 836 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0439607d1155f..418537cbefbbb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27059,6 +27059,8 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
 F:	drivers/gpio/gpio-tc956x.c
 F:	drivers/misc/tc956x_pci.c
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
+F:	include/soc/toshiba/tc956x-dwmac.h
 
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index e3dd5adda5aca..8d247e033e356 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -404,6 +404,20 @@ config DWMAC_MOTORCOMM
 	  This enables glue driver for Motorcomm DWMAC-based PCI Ethernet
 	  controllers. Currently only YT6801 is supported.
 
+config DWMAC_TC956X
+	tristate "Toshiba TC956X DWMAC support"
+	depends on PCI
+	depends on COMMON_CLK
+	depends on TOSHIBA_TC956X_PCI
+	default TOSHIBA_TC956X_PCI
+	select GENERIC_IRQ_CHIP
+	help
+	  This selects the Toshiba TC956X (and Qualcomm QPS615) support in the
+	  stmmac driver.
+
+	  This provides support for the ethernet controllers found on these
+	  devices.
+
 config STMMAC_PCI
 	tristate "STMMAC PCI bus support"
 	depends on PCI
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index a1cea2f57252e..e8e7f95dbe3e8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -51,4 +51,6 @@ obj-$(CONFIG_STMMAC_PCI)	+= stmmac-pci.o
 obj-$(CONFIG_DWMAC_INTEL)	+= dwmac-intel.o
 obj-$(CONFIG_DWMAC_LOONGSON)	+= dwmac-loongson.o
 obj-$(CONFIG_DWMAC_MOTORCOMM)	+= dwmac-motorcomm.o
+obj-$(CONFIG_TC956X_PCI)	+= tc956x-pci.o
+obj-$(CONFIG_DWMAC_TC956X)	+= dwmac-tc956x.o
 stmmac-pci-objs:= stmmac_pci.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
new file mode 100644
index 0000000000000..c77585e4a50e6
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
@@ -0,0 +1,818 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ *
+ * Derived from code having the following copyrights:
+ * Copyright (C) 2011-2012  Vayavya Labs Pvt Ltd
+ * Copyright (C) 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/iopoll.h>
+#include <linux/irqdomain.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/pcs/pcs-xpcs-regmap.h>
+#include <linux/pcs/pcs-xpcs.h>
+#include <linux/phy.h>
+#include <linux/regmap.h>
+#include <linux/stmmac.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include <soc/toshiba/tc956x-dwmac.h>
+
+#include "common.h"
+#include "dwxgmac2.h"
+#include "stmmac.h"
+
+#define DRIVER_NAME			"dwmac-tc956x"
+
+#define TC956X_PTP_CLOCK_RATE		(250 * HZ_PER_MHZ)
+
+#define TC956X_RX_FIFO_KB		46	/* Shared by all RX queues */
+#define TC956X_TX_FIFO_KB		46	/* Shared by all TX queues */
+
+/* Fields and values for the EMACTL registers */
+#define EMAC_SP_SEL_MASK		GENMASK(3, 0)
+#define SP_SEL_2500BASEX		4
+#define SP_SEL_SGMII_1000M		5
+#define SP_SEL_SGMII_100M		6
+#define SP_SEL_SGMII_10M		7
+#define EMAC_PHY_INF_SEL_MASK		GENMASK(5, 4)
+#define PCS_CLK_PHY			1	/* Clock from PHY */
+#define EMAC_INV_SGM_SIG_DET		BIT(6)	/* 1 = polarity inverted */
+#define EMAC_LPIHWCLKEN			BIT(8)	/* 1 = low power mode */
+#define EMAC_INIT_DONE			BIT(21)
+
+/* MSIGEN Registers */
+#define MSI_OUT_EN_OFFSET		0x0000
+#define MSI_MASK_CLR_OFFSET		0x000c
+#define MSI_MASK_VALUE			BIT(0)
+#define MSI_INT_STS_OFFSET		0x0010
+
+enum msigen_hwirq {
+	HWIRQ_LPI		= 0,
+	HWIRQ_PMT		= 1,
+	HWIRQ_EVENT		= 2,
+	HWIRQ_TX0		= 3,
+	HWIRQ_RX0		= 11,
+	HWIRQ_XPCS		= 19,
+	HWIRQ_PHY		= 20,
+	HWIRQ_PFMAILBOX		= 21,
+	HWIRQ_MSIREQ_PLS	= 24
+};
+
+#define HWIRQ_COUNT			25
+
+/* Offset to the XPCS memory block, relative to the EMAC address range */
+#define DWMAC_XPCS_OFFSET		0x3a00
+
+/* Offset to the PMATOP memory block, relative to the EMAC address range */
+#define DWMAC_PMATOP_OFFSET			0x4000
+
+#define PMA_CML_GL_PM_CFG0			0x01b8
+
+/*
+ * Five sets three registers must be configured for PMA.  The HWT_REFCLK
+ * registers are each separated by 0x14 bytes.  The Common0 configuration
+ * registers are separated by 0x8 bytes.
+ */
+#define PMA_REG_COUNT				5
+
+#define PMA_HWT_REFCK_R_EN			0x1080
+#define PMA_HWT_REFCK_TERM_EN			0x1090
+#define PMA_HWT_REFCK_STRIDE			0x0014
+
+#define PMA_COMM_CFG_0_1			0x1888
+#define PMA_COMM_CFG_0_1_STRIDE			0x0008
+
+/* PMA_COMM_CFG_0_1 fields (WRITE_MASK is a field name) */
+#define COMM_CFG_WRITE_MASK_MASK		GENMASK(16, 9)
+#define WRITE_MASK_VALUE			0xf7	/* Power-on value */
+#define COMM_CFG_ENABLE				BIT(8)
+#define COMM_CFG_WRITE_DATA_MASK		GENMASK(7, 0)
+#define WRITE_DATA_VALUE			0x04	/* Power-on value */
+
+/**
+ * struct tc956x_data - Toshiba-specific platform data
+ * @dev:		Device pointer
+ * @irq_domain:		MSIGEN IRQ domain
+ * @auxbus_data:	Pointer to data passed from the parent device
+ * @plat:		Pointer to our stmmac platform data
+ * @dma_cfg:		DMA config buffer used by plat_stmmacenet_data
+ * @mdio_bus_data:	MDIO bus data used by plat_stmmacenet_data
+ * @axi:		AXI data used by plat_stmmacenet_data
+ * @res:		Structure passed to stmmac_dvr_probe()
+ * @desc:		DMA descriptor data used by mac_device_info
+ * @dma:		DMA operations data used by mac_device_info
+ */
+struct tc956x_data {
+	struct device *dev;
+	struct irq_domain *irq_domain;
+	struct tc956x_dwmac_data *auxbus_data;
+	struct plat_stmmacenet_data *plat;
+
+	/* These three fields are used by the plat_stmmacenet_data structure */
+	struct stmmac_dma_cfg dma_cfg;
+	struct stmmac_mdio_bus_data mdio_bus_data;
+	struct stmmac_axi axi;
+
+	/* This field is data passed to stmmac_dvr_probe() */
+	struct stmmac_resources res;
+
+	/* These two fields are used by the mac_device_info structure */
+	struct stmmac_desc_ops desc;
+	struct stmmac_dma_ops dma;
+};
+
+struct tc956x_mac_speed {
+	phy_interface_t phy_interface;
+	int speed;
+	u32 sp_sel;
+};
+
+static struct tc956x_mac_speed mac_speed[] = {
+	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_2500BASEX },
+	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M },
+	{ PHY_INTERFACE_MODE_SGMII,	SPEED_100,   SP_SEL_SGMII_100M },
+	{ PHY_INTERFACE_MODE_SGMII,	SPEED_10,    SP_SEL_SGMII_10M },
+};
+
+/* TC956x uses indirect addressing so this need only describe a 1KiB range */
+static const struct regmap_config xpcs_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_base	= 0x00,		/* Minimum XPCS reg offset */
+	.max_register	= 0xff,		/* Register DW_VR_CSR_VIEWPORT */
+	.reg_shift	= REGMAP_UPSHIFT(2),
+};
+
+static void tc956x_msigen_irq_handler(struct irq_desc *desc)
+{
+	struct irq_domain *irq_domain = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct irq_chip_generic *gc;
+	unsigned long status;
+	unsigned int hwirq;
+
+	gc = irq_get_domain_generic_chip(irq_domain, 0);
+
+	chained_irq_enter(chip, desc);
+
+	status = irq_reg_readl(gc, MSI_INT_STS_OFFSET);
+	for_each_set_bit(hwirq, &status, HWIRQ_COUNT)
+		generic_handle_domain_irq(irq_domain, hwirq);
+
+	/*
+	 * Clear the MSI flag. Most interrupts within TC956X are level-high
+	 * type. If any interrupts are still asserted then clearing this flag
+	 * will cause the (edge-triggered) MSI to be regenerated.
+	 */
+	irq_reg_writel(gc, MSI_MASK_VALUE, MSI_MASK_CLR_OFFSET);
+
+	chained_irq_exit(chip, desc);
+}
+
+static int tc956x_msigen_irq_chip_init(struct irq_chip_generic *gc)
+{
+	struct tc956x_data *td = gc->domain->host_data;
+
+	gc->reg_base = td->auxbus_data->msigen;
+	gc->chip_types[0].regs.mask = MSI_OUT_EN_OFFSET;
+	gc->chip_types[0].chip.irq_mask = irq_gc_mask_clr_bit;
+	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_set_bit;
+
+	/* Disable all interrupts */
+	irq_reg_writel(gc, 0, MSI_OUT_EN_OFFSET);
+
+	return 0;
+}
+
+static void tc956x_msigen_irq_chip_exit(struct irq_chip_generic *gc)
+{
+	irq_reg_writel(gc, 0, MSI_OUT_EN_OFFSET);
+}
+
+static int tc956x_msigen_irq_domain_init(struct irq_domain *irq_domain)
+{
+	struct tc956x_data *td = irq_domain->host_data;
+
+	irq_set_chained_handler_and_data(td->auxbus_data->msigen_irq,
+					 tc956x_msigen_irq_handler,
+					 irq_domain);
+
+	return 0;
+}
+
+static void tc956x_msigen_irq_domain_exit(struct irq_domain *irq_domain)
+{
+	struct tc956x_data *td = irq_domain->host_data;
+
+	irq_set_chained_handler_and_data(td->auxbus_data->msigen_irq,
+					 NULL, NULL);
+}
+
+/* We have one IRQ chip instance with 25 IRQs in its domain */
+static struct irq_domain *
+tc956x_msigen_irq_domain_instantiate(struct tc956x_data *td)
+{
+	struct irq_domain_chip_generic_info dgc_info;
+	struct irq_domain_info info;
+
+	dgc_info.name = devm_kasprintf(td->dev, GFP_KERNEL, "tc956x-msigen-%d",
+				       td->auxbus_data->mac_id);
+	if (!dgc_info.name)
+		return ERR_PTR(-ENOMEM);
+
+	dgc_info.handler = handle_level_irq;
+	dgc_info.irqs_per_chip = HWIRQ_COUNT;
+	dgc_info.num_ct = 1;
+	dgc_info.init = tc956x_msigen_irq_chip_init;
+	dgc_info.exit = tc956x_msigen_irq_chip_exit;
+
+	info.domain_flags = IRQ_DOMAIN_FLAG_DESTROY_GC;
+	info.size = HWIRQ_COUNT;
+	info.hwirq_max = HWIRQ_COUNT;
+	info.ops = &irq_generic_chip_ops;
+	info.host_data = td;
+	info.dgc_info = &dgc_info;
+	info.init = tc956x_msigen_irq_domain_init;
+	info.exit = tc956x_msigen_irq_domain_exit;
+
+	return devm_irq_domain_instantiate(td->dev, &info);
+}
+
+/**
+ * tc956x_pma_init() - Initialize PMA
+ * @td:	bsp_priv pointer
+ *
+ * Initialize (or re-initialize) the PMA, configure the clocks and wait for the
+ * eMAC to be ready.
+ */
+static void tc956x_pma_init(struct tc956x_data *td)
+{
+	const struct tc956x_chip *chip = td->auxbus_data->chip;
+	void __iomem *emac_ctl = td->auxbus_data->emac_ctl;
+	u32 id = td->auxbus_data->mac_id;
+	void __iomem *pmatop;
+	u32 val;
+	u32 i;
+
+	/*
+	 * When we re-initialize the PMA then the reset will already have
+	 * been deasserted. We must make sure the PMA reset is asserted
+	 * before we change the clock settings.
+	 */
+	tc956x_reset_assert(chip, id, MAC_RESET_PMA);
+
+	pmatop = td->auxbus_data->emac + DWMAC_PMATOP_OFFSET;
+
+	/* Power on CML buffer (0 = normal mode, 1 = power down) */
+	writel(0, pmatop + PMA_CML_GL_PM_CFG0);
+
+	/* This value switches clock from C0_REFCK to CLK_REF_I */
+	val = u32_encode_bits(WRITE_MASK_VALUE, COMM_CFG_WRITE_MASK_MASK);
+	val |= COMM_CFG_ENABLE;
+	val |= u32_encode_bits(WRITE_DATA_VALUE, COMM_CFG_WRITE_DATA_MASK);
+
+	for (i = 0; i < PMA_REG_COUNT; i++) {
+		u32 offset =  i * PMA_HWT_REFCK_STRIDE;
+
+		/* Disable C0_REFCK and 100 ohm termination */
+		writel(0, pmatop + PMA_HWT_REFCK_R_EN + offset);
+		writel(0, pmatop + PMA_HWT_REFCK_TERM_EN + offset);
+
+		/* Switch clock from C0_REFCK to CLK_REF_I */
+		offset =  i * PMA_COMM_CFG_0_1_STRIDE;
+		writel(val, pmatop + PMA_COMM_CFG_0_1 + offset);
+	}
+
+	tc956x_reset_deassert(chip, id, MAC_RESET_PMA);
+
+	WARN_ON(readl_poll_timeout(emac_ctl, val, val & EMAC_INIT_DONE,
+				   50, 1000000));
+}
+
+static int tc956x_mac_speed_select(struct tc956x_data *td,
+				   phy_interface_t interface, int speed)
+{
+	struct net_device *netdev;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mac_speed); i++) {
+		if (mac_speed[i].speed && mac_speed[i].speed != speed)
+			continue;
+
+		if (mac_speed[i].phy_interface == interface)
+			return mac_speed[i].sp_sel;
+	}
+	netdev = dev_get_drvdata(td->dev);
+	netdev_err(netdev, "%s/%d unsupported\n",
+		   phy_modes(interface), speed);
+
+	return -EOPNOTSUPP;
+}
+
+static int tc956x_mac_configure(struct tc956x_data *td,
+				phy_interface_t interface, int speed)
+{
+	void __iomem *emac_ctl = td->auxbus_data->emac_ctl;
+	int sp_sel;
+	u32 val;
+
+	sp_sel = tc956x_mac_speed_select(td, interface, speed);
+	if (sp_sel < 0)
+		return sp_sel;
+
+	val = readl(emac_ctl);
+	val |= EMAC_LPIHWCLKEN;
+	val &= ~EMAC_INV_SGM_SIG_DET;
+	val = u32_replace_bits(val, PCS_CLK_PHY, EMAC_PHY_INF_SEL_MASK);
+	val = u32_replace_bits(val, sp_sel, EMAC_SP_SEL_MASK);
+	writel(val, emac_ctl);
+
+	return 0;
+}
+
+static void tc956x_mac_enable(struct tc956x_data *td)
+{
+	const struct tc956x_chip *chip = td->auxbus_data->chip;
+	u32 id = td->auxbus_data->mac_id;
+
+	tc956x_clock_enable(chip, id, MAC_CLOCK_TX);
+	tc956x_clock_enable(chip, id, MAC_CLOCK_RX);
+	tc956x_clock_enable(chip, id, MAC_CLOCK_ALL);
+	if (id)
+		tc956x_clock_enable(chip, id, MAC_CLOCK_RMII);
+
+	tc956x_reset_deassert(chip, id, MAC_RESET_MAC);
+	tc956x_pma_init(td);
+	tc956x_reset_deassert(chip, id, MAC_RESET_XPCS);
+}
+
+static void tc956x_mac_disable(struct tc956x_data *td)
+{
+	const struct tc956x_chip *chip = td->auxbus_data->chip;
+	u32 id = td->auxbus_data->mac_id;
+
+	tc956x_reset_assert(chip, id, MAC_RESET_MAC);
+	tc956x_reset_assert(chip, id, MAC_RESET_PMA);
+	tc956x_reset_assert(chip, id, MAC_RESET_XPCS);
+
+	tc956x_clock_disable(chip, id, MAC_CLOCK_ALL);
+	tc956x_clock_disable(chip, id, MAC_CLOCK_RX);
+	tc956x_clock_disable(chip, id, MAC_CLOCK_TX);
+	if (id)
+		tc956x_clock_disable(chip, id, MAC_CLOCK_RMII);
+}
+
+static void tc956x_mac_init_state(struct tc956x_data *td)
+{
+	const struct tc956x_chip *chip = td->auxbus_data->chip;
+	u32 id = td->auxbus_data->mac_id;
+
+	tc956x_clock_disable(chip, id, MAC_CLOCK_125M);
+	tc956x_clock_disable(chip, id, MAC_CLOCK_312_5M);
+
+	tc956x_mac_disable(td);
+}
+
+/*
+ * Override method for dwxgmac301_dma_ops->init_rx_chan
+ *
+ * This differs from the dwxgmac301_dma_ops->init_rx_chan by translating the DMA
+ * address for TC956x internal bus. The window that provides DMA access to PCI
+ * is linearly mapped at 0x10_0000_0000.
+ */
+static void tc956x_dma_init_rx_chan(struct stmmac_priv *priv,
+				    void __iomem *ioaddr,
+				    struct stmmac_dma_cfg *dma_cfg,
+				    dma_addr_t phy, u32 chan)
+{
+	u64 translated = phy + TC956X_SLV00_SRC_ADDR;
+
+	dwxgmac2_dma_init_rx_chan(priv, ioaddr, dma_cfg, phy, chan);
+
+	writel(upper_32_bits(translated),
+	       ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));
+	writel(lower_32_bits(translated),
+	       ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));
+}
+
+/* Override method for dwxgmac301_dma_ops->init_tx_chan */
+static void tc956x_dma_init_tx_chan(struct stmmac_priv *priv,
+				    void __iomem *ioaddr,
+				    struct stmmac_dma_cfg *dma_cfg,
+				    dma_addr_t phy, u32 chan)
+{
+	u64 translated = phy + TC956X_SLV00_SRC_ADDR;
+
+	dwxgmac2_dma_init_tx_chan(priv, ioaddr, dma_cfg, phy, chan);
+
+	writel(upper_32_bits(translated),
+	       ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
+	writel(lower_32_bits(translated),
+	       ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));
+}
+
+/* Override method for dwxgmac210_desc_ops->set_addr */
+static void tc956x_desc_set_addr(struct dma_desc *p, dma_addr_t addr)
+{
+	u64 translated = addr + TC956X_SLV00_SRC_ADDR;
+
+	p->des0 = cpu_to_le32(lower_32_bits(translated));
+	p->des1 = cpu_to_le32(upper_32_bits(translated));
+}
+
+/* Override method for dwxgmac210_desc_ops->set_sec_addr */
+static void tc956x_desc_set_sec_addr(struct dma_desc *p, dma_addr_t addr,
+				     bool is_valid)
+{
+	u64 translated = addr + TC956X_SLV00_SRC_ADDR;
+
+	p->des2 = cpu_to_le32(lower_32_bits(translated));
+	p->des3 = cpu_to_le32(upper_32_bits(translated));
+}
+
+/*
+ * Use mac_setup to apply the override methods above.
+ *
+ * The memory for the modified ops structures is pre-allocated as part of
+ * struct tc956x_data.
+ */
+static int tc956x_mac_setup(void *apriv, struct mac_device_info *mac)
+{
+	struct stmmac_priv *priv = apriv;
+	struct tc956x_data *td;
+
+	td = priv->plat->bsp_priv;
+
+	/* dwxgmac301_dma_ops needs extending to provide DMA address translation */
+	td->dma = dwxgmac301_dma_ops;
+	td->dma.init_rx_chan = tc956x_dma_init_rx_chan;
+	td->dma.init_tx_chan = tc956x_dma_init_tx_chan;
+	mac->dma = &td->dma;
+
+	/* dwxgmac210_desc_ops also needs extending for the same reason */
+	td->desc = dwxgmac210_desc_ops;
+	td->desc.set_addr = tc956x_desc_set_addr;
+	td->desc.set_sec_addr = tc956x_desc_set_sec_addr;
+	mac->desc = &td->desc;
+
+	priv->hw = mac;
+
+	return dwxgmac2_setup(priv);
+}
+
+static int tc956x_pcs_init(struct stmmac_priv *priv)
+{
+	struct xpcs_regmap_config xpcs_regmap_cfg;
+	void __iomem *emac = priv->ioaddr;
+	struct regmap *xpcs_regmap;
+	void __iomem *xpcs_addr;
+	struct dw_xpcs *xpcs;
+
+	xpcs_addr = emac + DWMAC_XPCS_OFFSET;
+	xpcs_regmap = devm_regmap_init_mmio(priv->device, xpcs_addr,
+					    &xpcs_regmap_config);
+	if (IS_ERR(xpcs_regmap))
+		return PTR_ERR(xpcs_regmap);
+
+	xpcs_regmap_cfg.regmap = xpcs_regmap;
+	xpcs_regmap_cfg.reg_indir = true;
+
+	xpcs = devm_xpcs_regmap_register(priv->device, &xpcs_regmap_cfg);
+	if (IS_ERR(xpcs))
+		return PTR_ERR(xpcs);
+
+	xpcs_config_eee_mult_fact(xpcs, priv->plat->mult_fact_100ns);
+	priv->hw->phylink_pcs = xpcs_to_phylink_pcs(xpcs);
+
+	return 0;
+}
+
+static struct phylink_pcs *tc956x_select_pcs(struct stmmac_priv *priv,
+					     phy_interface_t interface)
+{
+	return priv->hw->phylink_pcs;
+}
+
+static void tc956x_fix_mac_speed(void *bsp_priv, phy_interface_t interface,
+				 int speed, unsigned int mode)
+{
+	struct tc956x_data *td = bsp_priv;
+
+	tc956x_mac_configure(td, interface, speed);
+	tc956x_pma_init(td);
+}
+
+static int tc956x_dwmac_suspend(struct device *dev, void *bsp_priv)
+{
+	struct tc956x_data *td = bsp_priv;
+
+	tc956x_mac_disable(td);
+
+	return 0;
+}
+
+static int tc956x_dwmac_resume(struct device *dev, void *bsp_priv)
+{
+	struct tc956x_data *td = bsp_priv;
+
+	tc956x_mac_enable(td);
+
+	return 0;
+}
+
+/* Called by tc956x_dwmac_probe(); return errors with dev_err_probe() */
+static int tc956x_dwmac_parse_dt(struct tc956x_data *td)
+{
+	struct device_node *mdio_node;
+	struct device *dev = td->dev;
+	struct device_node *np;
+
+	np = dev_of_node(dev);
+	if (!np)
+		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
+
+	/* Find the MDIO bus */
+	for_each_child_of_node(np, mdio_node) {
+		if (of_device_is_compatible(mdio_node,
+					    "snps,dwmac-mdio"))
+			break;
+	}
+
+	/* Pass the MDIO bus (if there is one) to the core driver */
+	if (mdio_node) {
+		td->plat->mdio_node = mdio_node;
+		td->plat->mdio_bus_data->needs_reset = true;
+	}
+
+	return 0;
+}
+
+static int tc956x_lookup_max_speed(phy_interface_t phy_interface)
+{
+	switch (phy_interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return SPEED_2500;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+/* Called by tc956x_dwmac_probe(); return errors with dev_err_probe() */
+static int tc956x_plat_dat_init(struct tc956x_data *td)
+{
+	struct plat_stmmacenet_data *plat;
+	phy_interface_t phy_interface;
+	struct device *dev = td->dev;
+	struct stmmac_axi *axi;
+	u32 speed;
+	int ret;
+	u32 i;
+
+	ret = device_get_phy_mode(dev);
+	if (ret < 0)
+		return -ENODEV;
+	phy_interface = ret;
+
+	/* The platform structure is allocated with devm_kzalloc() */
+	plat = stmmac_plat_dat_alloc(dev);
+	if (!plat)
+		return -ENOMEM;
+
+	ret = tc956x_lookup_max_speed(phy_interface);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "unsupported phy speed\n");
+	speed = ret;
+
+	plat->core_type = DWMAC_CORE_XGMAC;
+	plat->bus_id = td->auxbus_data->mac_id;
+	plat->phy_interface = phy_interface;
+	plat->mdio_bus_data = &td->mdio_bus_data;
+	/* Parent PCI device is used for DMA */
+	plat->dma_device = dev->parent;
+	plat->dma_cfg = &td->dma_cfg;
+	plat->dma_cfg->pbl = 32;
+	plat->dma_cfg->pblx8 = true;
+
+	/*
+	 * Our MAC clock rate is fixed at 125 MHz.  For XGMAC, clk_csr 0
+	 * represents "divide by 62" and gets the best rate under 2.5 MHz.
+	 */
+	plat->clk_csr = 0;	/* MDC clock = clk_csr_i / 62 */
+	plat->default_an_inband = true;
+	plat->force_sf_dma_mode = true;
+	plat->max_speed = speed;
+	plat->unicast_filter_entries = 32;
+
+	/*
+	 * TC956x has 8 RX queues but we observe significantly reduced RX
+	 * bandwidth if we don't have at least 8k FIFO space per queue, so
+	 * by default we avoid using all the queues.
+	 */
+	plat->rx_queues_to_use = 4;
+
+	/*
+	 * TC956x has 8 TX queues but only #0 to #3 work for general IP traffic.
+	 * For now we will limit the driver to only these queues.
+	 */
+	plat->tx_queues_to_use = 4;
+
+	/*
+	 * Oversized FIFOs result in reduced performance in bandwidth tests.
+	 * Limit them to 8KiB per queue, or the total available.
+	 */
+	plat->tx_fifo_size =
+		min(TC956X_TX_FIFO_KB, 8 * plat->tx_queues_to_use) * SZ_1K;
+	plat->rx_fifo_size =
+		min(TC956X_RX_FIFO_KB, 8 * plat->rx_queues_to_use) * SZ_1K;
+	plat->host_dma_width = 36;
+
+	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
+	plat->tx_sched_algorithm = MTL_TX_ALGORITHM_WRR;
+
+	/* Default RX chan is set to queue index (0..rx_queues_to_use-1) */
+	for (i = 0; i < plat->rx_queues_to_use; i++)
+		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
+
+	for (i = 0; i < plat->tx_queues_to_use; i++) {
+		plat->tx_queues_cfg[i].weight = 12;
+		plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_DCB;
+
+		/* Only queues 5-8 support time-based scheduling on TC956X */
+		if (i >= 5)
+			plat->tx_queues_cfg[i].tbs_en = 1;
+	}
+
+	plat->fix_mac_speed = tc956x_fix_mac_speed;
+	plat->suspend = tc956x_dwmac_suspend;
+	plat->resume = tc956x_dwmac_resume;
+	plat->mac_setup = tc956x_mac_setup;
+	plat->pcs_init = tc956x_pcs_init;
+	plat->select_pcs = tc956x_select_pcs;
+
+	plat->bsp_priv = td;
+	plat->clk_ptp_rate = TC956X_PTP_CLOCK_RATE;
+
+	/* AXI Configuration */
+	axi = &td->axi;
+	axi->axi_lpi_en = 1;
+	axi->axi_wr_osr_lmt = 31;
+	axi->axi_rd_osr_lmt = 31;
+	/* All sizes (2^2..2^8) are supported */
+	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
+	plat->axi = axi;
+
+	plat->mac_port_sel_speed = speed;
+	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
+
+	td->plat = plat;
+
+	return 0;
+}
+
+/*
+ * The domain was created with IRQ_DOMAIN_FLAG_DESTROY_GC, so any mapped IRQs
+ * will be disposed when the domain is removed (when the device is destroyed).
+ */
+static int tc956x_stmmac_resources_init(struct tc956x_data *td)
+{
+	struct irq_domain *irq_domain = td->irq_domain;
+	struct stmmac_resources *res = &td->res;
+	u32 i;
+
+	res->irq = irq_create_mapping(irq_domain, HWIRQ_EVENT);
+	if (!res->irq)
+		return -EINVAL;
+
+	for (i = 0; i < td->plat->tx_queues_to_use; i++) {
+		res->tx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_TX0 + i);
+		if (!res->tx_irq[i])
+			return -EINVAL;
+	}
+
+	for (i = 0; i < td->plat->rx_queues_to_use; i++) {
+		res->rx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_RX0 + i);
+		if (!res->rx_irq[i])
+			return -EINVAL;
+	}
+
+	res->addr = td->auxbus_data->emac;
+
+	return 0;
+}
+
+static void tc956x_stmmac_resources_exit(struct tc956x_data *td)
+{
+	struct stmmac_resources *res = &td->res;
+	u32 i;
+
+	for (i = 0; i < td->plat->rx_queues_to_use; i++)
+		irq_dispose_mapping(res->rx_irq[i]);
+
+	for (i = 0; i < td->plat->tx_queues_to_use; i++)
+		irq_dispose_mapping(res->tx_irq[i]);
+
+	irq_dispose_mapping(res->irq);
+}
+
+static int tc956x_dwmac_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct tc956x_data *td;
+	int ret;
+
+	td = devm_kzalloc(dev, sizeof(*td), GFP_KERNEL);
+	if (!td)
+		return -ENOMEM;
+
+	td->dev = dev;
+	td->auxbus_data = dev_get_platdata(dev);
+	if (!td->auxbus_data)
+		return dev_err_probe(dev, -EINVAL, "no platform data\n");
+
+	ret = tc956x_plat_dat_init(td);
+	if (ret)
+		return ret;
+
+	/* If successful, we hold a reference to the platform MDIO DT node */
+	ret = tc956x_dwmac_parse_dt(td);
+	if (ret)
+		return ret;
+
+	td->irq_domain = tc956x_msigen_irq_domain_instantiate(td);
+	if (IS_ERR(td->irq_domain)) {
+		ret = dev_err_probe(dev, PTR_ERR(td->irq_domain),
+				    "failed to instantiate IRQ domain\n");
+		goto err_put_mdio;
+	}
+
+	ret = tc956x_stmmac_resources_init(td);
+	if (ret) {
+		ret = dev_err_probe(dev, ret,
+				    "failed to initialize stmmac resources\n");
+		goto err_put_mdio;
+	}
+
+	/* Put the MAC in a known initial state, then enable it */
+	tc956x_mac_init_state(td);
+	tc956x_mac_enable(td);
+
+	ret = stmmac_dvr_probe(dev, td->plat, &td->res);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "failed stmmac probe\n");
+		goto err_disable_mac;
+	}
+
+	return 0;
+
+err_disable_mac:
+	tc956x_mac_disable(td);
+	tc956x_stmmac_resources_exit(td);
+err_put_mdio:
+	of_node_put(td->plat->mdio_node);
+
+	return ret;
+}
+
+static void tc956x_dwmac_remove(struct auxiliary_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct net_device *ndev = dev_get_drvdata(dev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct tc956x_data *td = priv->plat->bsp_priv;
+
+	stmmac_dvr_remove(dev);
+	tc956x_mac_disable(td);
+	tc956x_stmmac_resources_exit(td);
+	of_node_put(td->plat->mdio_node);
+}
+
+static const struct auxiliary_device_id tc956x_dwmac_ids[] = {
+	{ .name = TC956X_PCIE_DRIVER_NAME "." TC956X_XGMAC_DEV_NAME, },
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, tc956x_dwmac_ids);
+
+static struct auxiliary_driver tc956x_dwmac_driver = {
+	.name		= DRIVER_NAME,
+	.probe		= tc956x_dwmac_probe,
+	.remove		= tc956x_dwmac_remove,
+	.id_table	= tc956x_dwmac_ids,
+	.driver = {
+		.name	= DRIVER_NAME,
+		.pm	= &stmmac_simple_pm_ops,
+		.owner	= THIS_MODULE,
+	},
+};
+module_auxiliary_driver(tc956x_dwmac_driver);
+
+MODULE_DESCRIPTION("Toshiba TC956x PCIe Ethernet Network Driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


