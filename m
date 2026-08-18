Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8064C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KU+bDqYU/O9Dr1Oo3XPL7kKeSTUBEiouuUJWuvT/yEQ=; b=kRQgeq6Ty46FdGrYcP9ZU9ZPry
	d9bVsCFtznrAcQzAM8bnM7mai8rEaLKJtXMw+eSk+gNonvGiJSQ2+FJl2OarV8JpipQ40H+ig+2B3
	+jcZIyeqTYBUssv77NLt/aYrlrNriPnbsfGemY//+uB9U0IHw7/GW7WDerZnSOJtLZjcYSdtEQUvo
	MMlrnseQ5GyYhGwHhOv35NTlJ6v5a7wWwk564ZlyM0ZFWKSbtoK0rMdyze8FCfDYkYLmqi9eOp281
	azL0qw7SKT6m8F8LxPdDwguzDhaxW8SRTYvHfft4vpkTA5NXCJHE4+SIAVWtAuSGT9T6VxKn1qFQt
	evq0C2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6r-00000007ioK-380j;
	Tue, 18 Aug 2026 10:31:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6l-00000007iiy-0F7D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:31:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso44436765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049109; x=1787653909; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KU+bDqYU/O9Dr1Oo3XPL7kKeSTUBEiouuUJWuvT/yEQ=;
        b=XDK0RIxPHFJxwvl1144ojE1H4UGOSYVpz5/OxHdrsEiXNmWdx8WZ95cWHe0pAxwKZE
         0SMB2KTqAzQCvB4YVs9a9LPWTEbuPWypaAev33zE8uIgl24n6uwck7CH5agbhfYDvyoz
         rYLj61mR0edQ9qUpCCy/3eq6dQAtThOqueojjuikY+NqTEITOYeCYUatcwW3PphOYd+d
         E0EuqNIZPhf8OVw/Fz4r7M0rJzCNznVI2fQ8dKGiOZmQmJYSPamLJjkEDOw0SV7gP/Tk
         mcsDHtKbaLquRWeKMOo4YkVOY8HGn7qBqex9midyfm9iE46/Delp+3ciYgpZMIHyPaAJ
         2NMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049109; x=1787653909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KU+bDqYU/O9Dr1Oo3XPL7kKeSTUBEiouuUJWuvT/yEQ=;
        b=DgzRqE+NodS/n8wtr+xrFcAXLRIrrGnouivSnlWHZRSAIpaXp7E28Oj0R/o4w9ybAc
         FKQ4XVbhdmBCh5Tt2GxZ2MwfazW4s3IPRFIf6uvcI9uO2yhBKnhXtG4EAKbBiD5Dfq4d
         QhfvrhNNyiiotYRw41COIlly/ozwZS90xGd2oO/Z9Q6/3SFtClxHHJmYuXhbMCQMGBYW
         hIb5DTpd1xuc9FN8EdiyyvCvL+TwS32XKsfBe0+y5b7s1HnuMAiGyvfZpT+ZK8R3ATwx
         WsvGNxHKgUR97FZMP81DlsmAwWlUqx0e1QboGXYCeM8bZY2lxmz2Sy4sGeo8+266+Bzd
         VUOw==
X-Forwarded-Encrypted: i=1; AHgh+RpqADD+3YH47AbmVJprsR8dYZHB1nc5nonrC7GN0NkJHMcjUmlUfUo6EbDfravqYe2Yep2tnIkd2NCAhvoSMof+@lists.infradead.org
X-Gm-Message-State: AOJu0YyXSvDxQXeNxMocqrRCmsPSAcSLLLkjiOnH+5If8sD2d/ppXAms
	4V2MwcwfJOkKM0Q/j41AGQlrXDbxbk3mKLYcjPUIIV+ogYNLko0Cyhy3IKfnUFP4X+Y=
X-Gm-Gg: AR+sD13j+ECibNmxVrajG8K8UFa0iI66ZcqjEdeO9nRiEFSw4zwIQCYy7m8TzzGe9EA
	xaZAYofKbzCgFBUnK8vTbmX+PAxS1XWcZTJq+IQ4PrriQLxqMnRMxemUhUxf0y4BTRyeD6XkraX
	yWUDGBoJjlWeRgL67pgxhYKmuR+WcgXS7N0ijfr9imTiZt9U5JCUOUXs2QjWLHa9ILY51j688fm
	zJkK4wvX0Fm//H+JO2US8/pj+XjzZnCKEWp1z+bdTv9Yeee1yb+i2Cg7/Dmz7LzuhafZwPNrGm5
	AEsk5oa2INUTAAmSLK7Fz+hh7qTFyG1+BmmUFKy5ntEtrvQ7rAZ+4nibQf51hZZ7f25G2evu4N+
	tAbkzCq/+9Rj2V5CUuGdwNJO3lETtVtW/lt7uLEIpFBhmK8i7iWnzxFZt/k68seWbuyh4W7ZMJK
	sdsuBFeeDyk4e7wbAQL38TEJuY5A7NB/YoRZb15YZHGQQGdAw7IeA9qqXDgX/w++qvo3elWbLCR
	0LAv1ZqI0S8blTdrMogK8D7MMt35CkZ3hZEqja96hWu49QVcjN4Oo4QXeoI
X-Received: by 2002:a05:600c:3b8f:b0:495:4491:b8c2 with SMTP id 5b1f17b1804b1-499906ce446mr411847085e9.3.1787049109066;
        Tue, 18 Aug 2026 03:31:49 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:48 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:17 +0000
Subject: [PATCH v6 4/6] mfd: aspeed-pci-core: add AST2600 PCIe BMC device
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-4-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_033151_229627_86AD8E83 
X-CRM114-Status: GOOD (  30.46  )
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

Add support for UART over PCIe between ASPEED AST2600 BMC and
host. This is the host-side driver.

Based on ASPEED 6.18 Kernel SDK and trimmed down and changed to
MFD driver.

The AST2600 has two 8250-compatible register set usable over PCIe.
These act as two UARTs. As there is only a FIFO internally between both
ends, they are called Virtual UARTs. This patch adds both VUARTs as
plat_serial8250_port. This is the core driver in charge of setting up
MSI interrupts. It doesn't bind the whole PCIe resource to allow each
sub-driver to bind the needed addresses.

This is not added as a PCI 8250 UART device, but as a MFD driver, as this
host driver can be expanded upon for IPMI over KCS. It can also be used
in the future for custom BMC<->host communication with shared memory and
doorbell.

This host module should be the entry point for setting up all features
related to an AST2600 present on the PCI bus.

Notes on the implementation:
The host can't detect the VUART addresses, so they are forced to
0x3f8 and 0x2f8, as in the initial ASPEED driver.

The MSI vector index of VUART2 has been changed from 15 to 17.
The index 15 used in the initial driver was not working.

Tested:
Data path in both direction is tested on both VUARTs.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 MAINTAINERS                   |   6 +++
 drivers/mfd/Kconfig           |  12 +++++
 drivers/mfd/Makefile          |   2 +
 drivers/mfd/aspeed-pci-core.c | 115 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 135 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 562754f2d166..7ea6c7d4703e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4011,6 +4011,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/aspeed,*
 F:	drivers/crypto/aspeed/
 
+ASPEED PCI BMC DEVICE DRIVER
+M:	Grégoire Layet <git@gregoirelayet.com>
+M:	Tan Siewert <tan.siewert@9elements.com>
+S:	Maintained
+F:	drivers/mfd/aspeed-pci-core.c
+
 ASPEED PECI CONTROLLER
 M:	Iwona Winiarska <iwona.winiarska@intel.com>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 763ce6a34782..dd780f72d169 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2573,5 +2573,17 @@ config MFD_MAX7360
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_ASPEED_PCI_BMC_DEVICE
+	tristate "ASPEED BMC PCIe device"
+	depends on PCI
+	select MFD_CORE
+	help
+	  Host-side driver for the ASPEED AST2600 BMC PCIe device found on
+	  BMC expansion cards. Exposes two 8250-compatible VUART
+	  ports.
+
+	  If unsure, say N. Choose M here if this machine has an
+	  AST2600-based BMC expansion card on its PCIe bus.
+
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dd4bb7e77c33..a364b1b5936b 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -303,3 +303,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_ASPEED_PCI_BMC_DEVICE)	+= aspeed-pci-core.o
diff --git a/drivers/mfd/aspeed-pci-core.c b/drivers/mfd/aspeed-pci-core.c
new file mode 100644
index 000000000000..2f299955bc1b
--- /dev/null
+++ b/drivers/mfd/aspeed-pci-core.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (C) ASPEED Technology Inc.
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/pci.h>
+#include <linux/serial_8250.h>
+#include <linux/mfd/core.h>
+
+#define ASPEED_BMC_MULTI_MSI		32
+#define ASPEED_BMC_PCI_DEVICE_ID	0x2402
+#define ASPEED_BMC_REVISION_AST2700	0x27
+#define ASPEED_BMC_NR_VUART		2
+
+#define DRIVER_NAME "ast2600-pci-core"
+
+static const unsigned int vuart_msi_index[ASPEED_BMC_NR_VUART] = { 16, 17 };
+static const u16 vuart_port_addr[ASPEED_BMC_NR_VUART] = { 0x3f8, 0x2f8 };
+
+static struct plat_serial8250_port aspeed_uart_port[ASPEED_BMC_NR_VUART + 1] = {
+	{
+		.uartclk = 115200 * 16,
+		.iotype = UPIO_MEM32,
+		.type = PORT_16550A,
+		.flags = (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE),
+		.regshift = 2
+	},
+	{
+		.uartclk = 115200 * 16,
+		.iotype = UPIO_MEM32,
+		.type = PORT_16550A,
+		.flags = (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE),
+		.regshift = 2
+	},
+	{ 0 }
+};
+
+static const struct mfd_cell aspeed_bmc_cell = {
+	.name		= "serial8250",
+	.platform_data	= aspeed_uart_port,
+	.pdata_size	= sizeof(aspeed_uart_port),
+};
+
+static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev)
+{
+	resource_size_t bar = pci_resource_start(pdev, 1);
+	unsigned int i;
+
+	for (i = 0; i < ASPEED_BMC_NR_VUART; i++) {
+		aspeed_uart_port[i].mapbase = bar + (vuart_port_addr[i] << 2);
+		aspeed_uart_port[i].irq = pci_irq_vector(pdev, vuart_msi_index[i]);
+	}
+
+	return 0;
+}
+
+static void aspeed_bmc_pci_free_irqs(void *pdev)
+{
+	pci_free_irq_vectors(pdev);
+}
+
+static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev,
+					    const struct pci_device_id *ent)
+{
+	struct device *dev = &pdev->dev;
+	int rc = 0;
+
+	if (pdev->revision == ASPEED_BMC_REVISION_AST2700)
+		return dev_err_probe(dev, -ENODEV, "AST2700 detected but not supported\n");
+
+	rc = pcim_enable_device(pdev);
+	if (rc)
+		return dev_err_probe(dev, rc, "failed to enable device\n");
+
+	pci_set_master(pdev);
+
+	rc = pci_alloc_irq_vectors(pdev, ASPEED_BMC_MULTI_MSI, ASPEED_BMC_MULTI_MSI, PCI_IRQ_MSI);
+	if (rc < 0)
+		return dev_err_probe(dev, rc, "failed to allocate %d MSI vectors\n",
+				     ASPEED_BMC_MULTI_MSI);
+
+	rc = devm_add_action_or_reset(dev, aspeed_bmc_pci_free_irqs, pdev);
+	if (rc)
+		return rc;
+
+	aspeed_pci_bmc_device_setup_vuart(pdev);
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				    &aspeed_bmc_cell, 1, &pdev->resource[1],
+				    0, NULL);
+}
+
+static struct pci_device_id aspeed_bmc_dev_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_ASPEED, ASPEED_BMC_PCI_DEVICE_ID),
+		.class = PCI_CLASS_OTHERS << 16,
+		.class_mask = 0xFFFF00
+	},
+	{ 0 }
+};
+
+MODULE_DEVICE_TABLE(pci, aspeed_bmc_dev_pci_ids);
+
+static struct pci_driver aspeed_host_bmc_dev_driver = {
+	.name		= DRIVER_NAME,
+	.id_table	= aspeed_bmc_dev_pci_ids,
+	.probe		= aspeed_pci_host_bmc_device_probe,
+};
+
+module_pci_driver(aspeed_host_bmc_dev_driver);
+
+MODULE_AUTHOR("Grégoire Layet <gregoire.layet@9elements.com>");
+MODULE_DESCRIPTION("Host-side driver for the ASPEED BMC PCIe device");
+MODULE_LICENSE("GPL");

-- 
2.54.0


