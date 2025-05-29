Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44344C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R10/6b6Xf36HyFSNb4SRKN0wr+JLKLnM/MuUs7P42Sk=; b=y+fxIYea3s+Ih3bRpuOAYxuS50
	STyMFwkJ/obTWvj2bUP8rrU6/yMYuoN06EhTezLlEkViFDoz19b7/6rrmRRZWHX0zCRoG65ixbUqj
	sh8oMMqEe0qPRPDx2UjuYDen0U/nrPjNUK6q9W45lFbePstqKzKA8nuAIEPKjkJ/A3oWMWjdL9BTS
	j7GjUNxandgnG5A/7OAwUN5/9PW7fd2P4BrdOR2m82wXocWJpm1xoi6uKjaHyKWSOfxrIhMl8BiT9
	vxL5YeqatLk12j0aBmohlray3oMhmbhewo4o2neMUovoXj/Dh84KA5ylFmlV1lbxw5xB+NR3ZYRdB
	N7htShPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbiT-0000000Ffjh-24dh;
	Thu, 29 May 2025 11:46:33 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbL7-0000000FbE4-1wp4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:22:26 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so1471090a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517744; x=1749122544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R10/6b6Xf36HyFSNb4SRKN0wr+JLKLnM/MuUs7P42Sk=;
        b=JBoqsyRjG2RfL7iPBG/ZxGXW41tsKAe8pTlppLrWtTlVQxiJBpTSX1s2x9PN5l7Yc6
         u4QAoSN4HImR0+sKcPW3sys8TM2iTZCVGA1pvgGhSNzwGJXKfMfI6kplMXmAeCdEtDqm
         LvfTcWDrN65kc3SfQJX7APUMif6BAuv9ertTXpZoqXOKwh661yBLW5PxJc+rboV9zGad
         buk6X6XeVKjhOKw0VKrn2qfzl27yDaWJineODhNnE2PSMJHT9Y8nNoOfZqPIgogXOUqZ
         xgTn3Azt3HUL9Kms8NtkeCjgjnYv0qVZRAOup78yMMHwWF7XH1f0yV1yxTT4+tFIEmR9
         +ASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517744; x=1749122544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R10/6b6Xf36HyFSNb4SRKN0wr+JLKLnM/MuUs7P42Sk=;
        b=rMkHHvkj/sMMgxHUqWvpM75UNO/yLIrJDEs6gPcMZXlFGrmeOl86OapamXJ1QAc3Kx
         vohGOrGT0+JW1ASilKLjlihXOh/esWMU2JwT7m00mNARH5ikjjBH1EY5pmRWkRMrhMC5
         d5WMHt/eiMzVqSdjs0AiDmhqV0wQKIFW2Ye0gtw+j9i27fxc0WCsYnKhAX4eGqeffeu4
         Qx4SPRpiBMhmnxq0g5kgQaXxPmlOpe4AXVlRna6p3ph+rRjuy/vdkJd8LtWxf9nTdx0z
         LWg4lxdVAd3CpnREhiYcMsoQDxDTXx1pRXzkskgVv0QsINJd01VsfAXyA04pPFpf92np
         YYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuw6VvRk+TUvEBze5+bvxQi2DQimoFflhdslMSC7/Oq4x9zP/tpWqQqWE5PI/rtu1rR7Uf/mjbOf0vIGFjnbFC@lists.infradead.org
X-Gm-Message-State: AOJu0YzoJIb0YmXkNC7t7kRH/i6Y8kERrljizdRYr4ydNYhlpnV6X4GQ
	7boDMuGGXy0VjW2LbNRH/E7wE5Zcms50nhE9Vpn/dxmqIQDNkWXQpi5QoAVGUiryhn4=
X-Gm-Gg: ASbGncvK0CZ+Yn+lwUKvMG7C3Jq5hhUbolrkxtH/AKL5DbcsHVGD0hqAg7rligLZlGc
	aVPw11BYnGGOXCs2dZy2UAsDKNEkPs/pGf5wI6UuwMhxKYx2x3BCzLL876GtM15FExyoH9Jbl/c
	2o+ObK9OaMYvX7LcphRON9MbIWvBzRZlszp9L28h7rtScqRbiVzD7McamwCvAWH9GEw1QjajHU5
	Z7j/Sn8RWS8CUasVYiNJfezDoVdJOMT8qkuhUGxHT6ky8ILUAZCGxvlJCuIkVle1v8HCxbJg1TU
	l3oS9/D7EiYTJ4Cl7ly88aSHU2XftbetsC85c+Dg5w4MN0bQfknpvphTUc1zJuUNwbCRwrLHedl
	zyKrdcFj4fikrjR8CnJCAmg==
X-Google-Smtp-Source: AGHT+IEgCizdehshsU6S5taaSqGacDAHuP/T9b1P4y5toncDOWpmaiF+W82krv8hJVBYZVsHiBdNaA==
X-Received: by 2002:a05:6402:4407:b0:5fd:1696:3c24 with SMTP id 4fb4d7f45d1cf-602d9df0450mr17341177a12.16.1748517743773;
        Thu, 29 May 2025 04:22:23 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d794121sm2201314a12.60.2025.05.29.04.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:23 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10 07/13] misc: rp1: RaspberryPi RP1 misc driver
Date: Thu, 29 May 2025 13:23:42 +0200
Message-ID: <20250529112357.24182-2-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_042225_558232_F28873C4 
X-CRM114-Status: GOOD (  35.34  )
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

The RaspberryPi RP1 is a PCI multi function device containing
peripherals ranging from Ethernet to USB controller, I2C, SPI
and others.

Implement a bare minimum driver to operate the RP1, leveraging
actual OF based driver implementations for the on-board peripherals
by loading a devicetree overlay during driver probe if the RP1
node is not already present in the DT.

The peripherals are accessed by mapping MMIO registers starting
from PCI BAR1 region.

With the overlay approach we can achieve more generic and agnostic
approach to managing this chipset, being that it is a PCI endpoint
and could possibly be reused in other hw implementations. The
presented approach is also used by Bootlin's Microchip LAN966x
patchset (see link) as well, for a similar chipset.
In this case, the inclusion tree for the DT overlay is as follow
(the arrow points to the includer):

 rp1-pci.dtso <---- rp1-common.dtsi

On the other hand, to ensure compatibility with downstream, this
driver can also work with a DT already comprising the RP1 node, so
the dynamically loaded overlay will not be used if the DT is already
fully defined.

The reason why this driver is contained in drivers/misc has
been paved by Bootlin's LAN966X driver, which first used the
overlay approach to implement non discoverable peripherals behind a
PCI bus. For RP1, the same arguments apply: it's not used as an SoC
since the driver code is not running on-chip and is not like an MFD
since it does not really need all the MFD infrastructure (shared regs,
etc.). So, for this particular use, misc has been proposed and deemed
as a good choice. For further details about that please check the links.

This driver is heavily based on downstream code from RaspberryPi
Foundation, and the original author is Phil Elwell.

Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
Link: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
Link: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
Link: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/
Link: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>   # quirks.c, pci_ids.h
---
 drivers/misc/Kconfig          |   1 +
 drivers/misc/Makefile         |   1 +
 drivers/misc/rp1/Kconfig      |  20 ++
 drivers/misc/rp1/Makefile     |   3 +
 drivers/misc/rp1/rp1-pci.dtso |  25 +++
 drivers/misc/rp1/rp1_pci.c    | 333 ++++++++++++++++++++++++++++++++++
 drivers/pci/quirks.c          |   1 +
 include/linux/pci_ids.h       |   3 +
 8 files changed, 387 insertions(+)
 create mode 100644 drivers/misc/rp1/Kconfig
 create mode 100644 drivers/misc/rp1/Makefile
 create mode 100644 drivers/misc/rp1/rp1-pci.dtso
 create mode 100644 drivers/misc/rp1/rp1_pci.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 6b37d61150ee..3b9606bb4ccc 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -648,4 +648,5 @@ source "drivers/misc/uacce/Kconfig"
 source "drivers/misc/pvpanic/Kconfig"
 source "drivers/misc/mchp_pci1xxxx/Kconfig"
 source "drivers/misc/keba/Kconfig"
+source "drivers/misc/rp1/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index d6c917229c45..e15a732de690 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -74,3 +74,4 @@ lan966x-pci-objs		:= lan966x_pci.o
 lan966x-pci-objs		+= lan966x_pci.dtbo.o
 obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
 obj-y				+= keba/
+obj-$(CONFIG_MISC_RP1)		+= rp1/
diff --git a/drivers/misc/rp1/Kconfig b/drivers/misc/rp1/Kconfig
new file mode 100644
index 000000000000..5232e70d3079
--- /dev/null
+++ b/drivers/misc/rp1/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# RaspberryPi RP1 misc device
+#
+
+config MISC_RP1
+	tristate "RaspberryPi RP1 misc device"
+	depends on OF_IRQ && OF_OVERLAY && PCI_MSI && PCI_QUIRKS
+	select PCI_DYNAMIC_OF_NODES
+	help
+	  Support the RP1 peripheral chip found on Raspberry Pi 5 board.
+
+	  This device supports several sub-devices including e.g. Ethernet
+	  controller, USB controller, I2C, SPI and UART.
+
+	  The driver is responsible for enabling the DT node once the PCIe
+	  endpoint has been configured, and handling interrupts.
+
+	  This driver uses an overlay to load other drivers to support for
+	  RP1 internal sub-devices.
diff --git a/drivers/misc/rp1/Makefile b/drivers/misc/rp1/Makefile
new file mode 100644
index 000000000000..508b4cb05627
--- /dev/null
+++ b/drivers/misc/rp1/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_MISC_RP1)		+= rp1-pci.o
+rp1-pci-objs			:= rp1_pci.o rp1-pci.dtbo.o
diff --git a/drivers/misc/rp1/rp1-pci.dtso b/drivers/misc/rp1/rp1-pci.dtso
new file mode 100644
index 000000000000..eea826b36e02
--- /dev/null
+++ b/drivers/misc/rp1/rp1-pci.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/*
+ * The dts overlay is included from the dts directory so
+ * it can be possible to check it with CHECK_DTBS while
+ * also compile it from the driver source directory.
+ */
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@0 {
+		target-path="";
+		__overlay__ {
+			compatible = "pci1de4,1";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			#include "arm64/broadcom/rp1-common.dtsi"
+		};
+	};
+};
diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
new file mode 100644
index 000000000000..803832006ec8
--- /dev/null
+++ b/drivers/misc/rp1/rp1_pci.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2025 Raspberry Pi Ltd.
+ *
+ * All rights reserved.
+ */
+
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/of_platform.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+
+#define RP1_HW_IRQ_MASK		GENMASK(5, 0)
+
+#define REG_SET			0x800
+#define REG_CLR			0xc00
+
+/* MSI-X CFG registers start at 0x8 */
+#define MSIX_CFG(x) (0x8 + (4 * (x)))
+
+#define MSIX_CFG_IACK_EN        BIT(3)
+#define MSIX_CFG_IACK           BIT(2)
+#define MSIX_CFG_ENABLE         BIT(0)
+
+/* Address map */
+#define RP1_PCIE_APBS_BASE	0x108000
+
+/* Interrupts */
+#define RP1_INT_END		61
+
+/* Embedded dtbo symbols created by cmd_wrap_S_dtb in scripts/Makefile.lib */
+extern char __dtbo_rp1_pci_begin[];
+extern char __dtbo_rp1_pci_end[];
+
+struct rp1_dev {
+	struct pci_dev *pdev;
+	struct irq_domain *domain;
+	struct irq_data *pcie_irqds[64];
+	void __iomem *bar1;
+	int ovcs_id;	/* overlay changeset id */
+	bool level_triggered_irq[RP1_INT_END];
+};
+
+static void msix_cfg_set(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
+{
+	iowrite32(value, rp1->bar1 + RP1_PCIE_APBS_BASE + REG_SET + MSIX_CFG(hwirq));
+}
+
+static void msix_cfg_clr(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
+{
+	iowrite32(value, rp1->bar1 + RP1_PCIE_APBS_BASE + REG_CLR + MSIX_CFG(hwirq));
+}
+
+static void rp1_mask_irq(struct irq_data *irqd)
+{
+	struct rp1_dev *rp1 = irqd->domain->host_data;
+	struct irq_data *pcie_irqd = rp1->pcie_irqds[irqd->hwirq];
+
+	pci_msi_mask_irq(pcie_irqd);
+}
+
+static void rp1_unmask_irq(struct irq_data *irqd)
+{
+	struct rp1_dev *rp1 = irqd->domain->host_data;
+	struct irq_data *pcie_irqd = rp1->pcie_irqds[irqd->hwirq];
+
+	pci_msi_unmask_irq(pcie_irqd);
+}
+
+static int rp1_irq_set_type(struct irq_data *irqd, unsigned int type)
+{
+	struct rp1_dev *rp1 = irqd->domain->host_data;
+	unsigned int hwirq = (unsigned int)irqd->hwirq;
+
+	switch (type) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		dev_dbg(&rp1->pdev->dev, "MSIX IACK EN for IRQ %u\n", hwirq);
+		msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK_EN);
+		rp1->level_triggered_irq[hwirq] = true;
+	break;
+	case IRQ_TYPE_EDGE_RISING:
+		msix_cfg_clr(rp1, hwirq, MSIX_CFG_IACK_EN);
+		rp1->level_triggered_irq[hwirq] = false;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct irq_chip rp1_irq_chip = {
+	.name		= "rp1_irq_chip",
+	.irq_mask	= rp1_mask_irq,
+	.irq_unmask	= rp1_unmask_irq,
+	.irq_set_type	= rp1_irq_set_type,
+};
+
+static void rp1_chained_handle_irq(struct irq_desc *desc)
+{
+	unsigned int hwirq = desc->irq_data.hwirq & RP1_HW_IRQ_MASK;
+	struct rp1_dev *rp1 = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned int virq;
+
+	chained_irq_enter(chip, desc);
+
+	virq = irq_find_mapping(rp1->domain, hwirq);
+	generic_handle_irq(virq);
+	if (rp1->level_triggered_irq[hwirq])
+		msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK);
+
+	chained_irq_exit(chip, desc);
+}
+
+static int rp1_irq_xlate(struct irq_domain *d, struct device_node *node,
+			 const u32 *intspec, unsigned int intsize,
+			 unsigned long *out_hwirq, unsigned int *out_type)
+{
+	struct rp1_dev *rp1 = d->host_data;
+	struct irq_data *pcie_irqd;
+	unsigned long hwirq;
+	int pcie_irq;
+	int ret;
+
+	ret = irq_domain_xlate_twocell(d, node, intspec, intsize,
+				       &hwirq, out_type);
+	if (ret)
+		return ret;
+
+	pcie_irq = pci_irq_vector(rp1->pdev, hwirq);
+	pcie_irqd = irq_get_irq_data(pcie_irq);
+	rp1->pcie_irqds[hwirq] = pcie_irqd;
+	*out_hwirq = hwirq;
+
+	return 0;
+}
+
+static int rp1_irq_activate(struct irq_domain *d, struct irq_data *irqd,
+			    bool reserve)
+{
+	struct rp1_dev *rp1 = d->host_data;
+
+	msix_cfg_set(rp1, (unsigned int)irqd->hwirq, MSIX_CFG_ENABLE);
+
+	return 0;
+}
+
+static void rp1_irq_deactivate(struct irq_domain *d, struct irq_data *irqd)
+{
+	struct rp1_dev *rp1 = d->host_data;
+
+	msix_cfg_clr(rp1, (unsigned int)irqd->hwirq, MSIX_CFG_ENABLE);
+}
+
+static const struct irq_domain_ops rp1_domain_ops = {
+	.xlate      = rp1_irq_xlate,
+	.activate   = rp1_irq_activate,
+	.deactivate = rp1_irq_deactivate,
+};
+
+static void rp1_unregister_interrupts(struct pci_dev *pdev)
+{
+	struct rp1_dev *rp1 = pci_get_drvdata(pdev);
+	int irq, i;
+
+	if (rp1->domain) {
+		for (i = 0; i < RP1_INT_END; i++) {
+			irq = irq_find_mapping(rp1->domain, i);
+			irq_dispose_mapping(irq);
+		}
+
+		irq_domain_remove(rp1->domain);
+	}
+
+	pci_free_irq_vectors(pdev);
+}
+
+static int rp1_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	u32 dtbo_size = __dtbo_rp1_pci_end - __dtbo_rp1_pci_begin;
+	void *dtbo_start = __dtbo_rp1_pci_begin;
+	struct device *dev = &pdev->dev;
+	struct device_node *rp1_node;
+	bool skip_ovl = true;
+	struct rp1_dev *rp1;
+	int err = 0;
+	int i;
+
+	/*
+	 * Either use rp1_nexus node if already present in DT, or
+	 * set a flag to load it from overlay at runtime
+	 */
+	rp1_node = of_find_node_by_name(NULL, "rp1_nexus");
+	if (!rp1_node) {
+		rp1_node = dev_of_node(dev);
+		skip_ovl = false;
+	}
+
+	if (!rp1_node) {
+		dev_err(dev, "Missing of_node for device\n");
+		err = -EINVAL;
+		goto err_put_node;
+	}
+
+	rp1 = devm_kzalloc(&pdev->dev, sizeof(*rp1), GFP_KERNEL);
+	if (!rp1) {
+		err = -ENOMEM;
+		goto err_put_node;
+	}
+
+	rp1->pdev = pdev;
+
+	if (pci_resource_len(pdev, 1) <= 0x10000) {
+		dev_err(&pdev->dev,
+			"Not initialized - is the firmware running?\n");
+		err = -EINVAL;
+		goto err_put_node;
+	}
+
+	err = pcim_enable_device(pdev);
+	if (err < 0) {
+		err = dev_err_probe(&pdev->dev, err,
+				    "Enabling PCI device has failed");
+		goto err_put_node;
+	}
+
+	rp1->bar1 = pcim_iomap(pdev, 1, 0);
+	if (!rp1->bar1) {
+		dev_err(&pdev->dev, "Cannot map PCI BAR\n");
+		err = -EIO;
+		goto err_put_node;
+	}
+
+	pci_set_master(pdev);
+
+	err = pci_alloc_irq_vectors(pdev, RP1_INT_END, RP1_INT_END,
+				    PCI_IRQ_MSIX);
+	if (err < 0) {
+		err = dev_err_probe(&pdev->dev, err,
+				    "Failed to allocate MSI-X vectors\n");
+		goto err_put_node;
+	} else if (err != RP1_INT_END) {
+		dev_err(&pdev->dev, "Cannot allocate enough interrupts\n");
+		err = -EINVAL;
+		goto err_put_node;
+	}
+
+	pci_set_drvdata(pdev, rp1);
+	rp1->domain = irq_domain_add_linear(rp1_node, RP1_INT_END,
+					    &rp1_domain_ops, rp1);
+	if (!rp1->domain) {
+		dev_err(&pdev->dev, "Error creating IRQ domain\n");
+		err = -ENOMEM;
+		goto err_unregister_interrupts;
+	}
+
+	for (i = 0; i < RP1_INT_END; i++) {
+		unsigned int irq = irq_create_mapping(rp1->domain, i);
+
+		if (!irq) {
+			dev_err(&pdev->dev, "Failed to create IRQ mapping\n");
+			err = -EINVAL;
+			goto err_unregister_interrupts;
+		}
+
+		irq_set_chip_and_handler(irq, &rp1_irq_chip, handle_level_irq);
+		irq_set_probe(irq);
+		irq_set_chained_handler_and_data(pci_irq_vector(pdev, i),
+						 rp1_chained_handle_irq, rp1);
+	}
+
+	if (!skip_ovl) {
+		err = of_overlay_fdt_apply(dtbo_start, dtbo_size, &rp1->ovcs_id,
+					   rp1_node);
+		if (err)
+			goto err_unregister_interrupts;
+	}
+
+	err = of_platform_default_populate(rp1_node, NULL, dev);
+	if (err) {
+		dev_err_probe(&pdev->dev, err, "Error populating devicetree\n");
+		goto err_unload_overlay;
+	}
+
+	return 0;
+
+err_unload_overlay:
+	of_overlay_remove(&rp1->ovcs_id);
+err_unregister_interrupts:
+	rp1_unregister_interrupts(pdev);
+err_put_node:
+	if (skip_ovl)
+		of_node_put(rp1_node);
+
+	return err;
+}
+
+static void rp1_remove(struct pci_dev *pdev)
+{
+	struct rp1_dev *rp1 = pci_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	of_platform_depopulate(dev);
+	of_overlay_remove(&rp1->ovcs_id);
+	rp1_unregister_interrupts(pdev);
+}
+
+static const struct pci_device_id dev_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_RPI, PCI_DEVICE_ID_RPI_RP1_C0), },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, dev_id_table);
+
+static struct pci_driver rp1_driver = {
+	.name		= KBUILD_MODNAME,
+	.id_table	= dev_id_table,
+	.probe		= rp1_probe,
+	.remove		= rp1_remove,
+};
+
+module_pci_driver(rp1_driver);
+
+MODULE_AUTHOR("Phil Elwell <phil@raspberrypi.com>");
+MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
+MODULE_DESCRIPTION("RaspberryPi RP1 misc device");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 8d610c17e0f2..dad0ca42707f 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -6284,6 +6284,7 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5020, of_pci_make_dev_node);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5021, of_pci_make_dev_node);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REDHAT, 0x0005, of_pci_make_dev_node);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, of_pci_make_dev_node);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_RPI, PCI_DEVICE_ID_RPI_RP1_C0, of_pci_make_dev_node);
 
 /*
  * Devices known to require a longer delay before first config space access
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 2e28182c3af0..ddfe09722d54 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2624,6 +2624,9 @@
 #define PCI_VENDOR_ID_TEKRAM		0x1de1
 #define PCI_DEVICE_ID_TEKRAM_DC290	0xdc29
 
+#define PCI_VENDOR_ID_RPI		0x1de4
+#define PCI_DEVICE_ID_RPI_RP1_C0	0x0001
+
 #define PCI_VENDOR_ID_ALIBABA		0x1ded
 
 #define PCI_VENDOR_ID_CXL		0x1e98
-- 
2.35.3


