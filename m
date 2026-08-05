Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B9FC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy4Y0gaC5ktZKg+2qOASCifq8sJvLeariutbIIYNiz0=; b=PhTbuXBpCt8W/XT4hvQyxzt6fr
	0ymIuWaan/PfcaRsK5JWHj8t7djRCSolxrEkq+8IBg0lFa+MQ2prVGQlPLpPasWM7PfhPCaHQJyol
	8vaEd8y4qi+WLcRgUGVejyuTEwL5W4PajESVfo3Ec/KL0mQYIvh9wgEOFLp0b0sqjz6NYyO6qdLkM
	NXeHMZFir8HlnXUQkN68rsiV6hu/HzbjXDjH+1JsYcqerTmt/nSIjO61BdYZ7oKmAyWB7JPPjObuC
	0UXOTIQrVmvm6p4H+xNeehRAwpo/jBa3U6aPPGKVIxAJk7d/F3CALjE+5dym8JMq2XNfzct0Fb+qm
	r7RPirMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrac4-00000003tDs-27Fg;
	Wed, 05 Aug 2026 12:20:48 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrac1-00000003tAh-0WOH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:20:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4954d29264cso4730265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932443; x=1786537243; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qy4Y0gaC5ktZKg+2qOASCifq8sJvLeariutbIIYNiz0=;
        b=YgYMOeF/svq11CLh9j9s6n2fTeeKtguntyn195kGbRemV4m1wXJ2W+wcGFsKhJZOIx
         DzegE0oIeSrPmQSK0Zow54XlsYVZzDaiG0csP3Ih91M74+WO05QC1ImZASep1np8KV1d
         11EB1BBhXsaSzNu1nVEy6Azvxl2FZeZO/P52yPcGdo1+nwdcnL8mEfe42OKXyfII0Gax
         Z4x2RkoNOo6e1oAX3FRzcXdmEEbirdbGvaAcjgHcALFArL/FXEJuY0Q+AoUHOusNy1Pd
         vIhp/MbwYxYaZBnYkga4R7Sz6pumWxX8xmclsD7mFxJmS9aZ7MabbdHyY+xtFA1rQrp6
         nibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932443; x=1786537243;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy4Y0gaC5ktZKg+2qOASCifq8sJvLeariutbIIYNiz0=;
        b=TUh2gcc5oN8Db5UFOgtsdHP+HoosEo+9NSr1/JNqDB/sZUGVjSsQoqi/74apUZhFFR
         90GT835YIeoqDUOmRn5ozjprKBxmVFFtnR7KS3CqEfyIF50WVzsBbZLzjIaK6td3zRY4
         3k5H4iZ6CfMrK4TuD/MVtRo5RUX2jyxJQUeqr6+gTREys1WXXFkjf5JcDXgTEiRxGb/W
         4AXnrwJ8qEjpxz3KNwApgZhJJ9I/mXxbSYNNUPI+81oZPBqRT2qxkzx2Heb2V9uV2MBo
         HOOJ1VnYYPGMlU7u0gUdaiQ4iOFJtwuQ6/81qWjMK7Mrn3KQzfnl/hucV7twbEV56rC9
         2wyA==
X-Forwarded-Encrypted: i=1; AHgh+RoiQGsxx/qf1dJ1M7xIaRQuJRCA0B0Wbqxqn/2cEahufgux3C8Xy+SXfJAzGFv5Vmzr147kTCBO7x2+mwvI7BAQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxPQsTB4hDnFcRKDyfV9+CE7vCW0EXxzBVHU7yIhsB73kXIt6e9
	JO5FN6+4ZE9wYwd4Ctqy8X12S7+vbz9y1IN7Kyyn6lOUFDa+Bt/e0nW6Ef3SXg8vzJE=
X-Gm-Gg: AR+sD12vwXgx1m21XUeSVCK++9upRere9FVcwRI3QsXeeRcjWH6EswJT+zngE/Dd3PM
	ZhL7Ta/k8kEhUoJFB9iMsB0vQH6HjZsGlomox4b31NwCKQgZoHLCIhLax+Z+JH58RN6z446UgY0
	lICkopuNDQaOQYfzmV/JIfOVP2+6LodG4YJE2NBy/M9DWS8WMMyrNrY+TWa1/5PnebCQRC8eMHY
	iR4aSqGxRAr1sP+/Z8ubTeo4otD6MwZjIji7uUgTriBRmovOhmx5zrZPjPoOjYaPi/5neJgdVGP
	eVy8wyJ2s6W/gIaGKqVJWds0vR6fZC3wTtq1qwfP6Oih839dN+erqdS7h6LNpBWrUInVCh18+/+
	qx+pDYR+EImi4W9gouZpXmHAYdWC86QrLIUyVRtRAKfpQQrv9bEHuqElV5b8wowIsJKUwx/ielu
	zI/r9byPn5eFxJpl22W2pwSW+WQvaqCC6PrVc3KA8i13kgAJsY3SVgGKYa7azGnjb63chRDatSg
	9+XeNO5l5jIBhMI7CCUHYDDG9jVgTSLIP7AFyyZK/FEH6g8O+aNoEeNFLSOyNpQQeKtSjM3SjaX
	J/7Kob9e9sZ4
X-Received: by 2002:a05:600c:1f96:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-4994e7cbc2fmr65080725e9.14.1785932442983;
        Wed, 05 Aug 2026 05:20:42 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:42 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <git@gregoirelayet.com>,
	Tan Siewert <tan.siewert@9elements.com>
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 4/6] soc: mfd: add ASPEED AST2600 PCIe BMC device driver
Date: Wed,  5 Aug 2026 14:19:51 +0200
Message-ID: <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_052045_207481_F01CA437 
X-CRM114-Status: GOOD (  31.63  )
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

Add support for UART over PCIe between ASPEED
AST2600 BMC and host.
This is the host-side driver.

Based on ASPEED 6.18 Kernel SDK and trimmed down
and changed to MFD driver.

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
 MAINTAINERS                   |   6 ++
 drivers/mfd/Kconfig           |  12 ++++
 drivers/mfd/Makefile          |   2 +
 drivers/mfd/aspeed-pci-core.c | 120 ++++++++++++++++++++++++++++++++++
 4 files changed, 140 insertions(+)
 create mode 100644 drivers/mfd/aspeed-pci-core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4016b3db13af..6afe1b8c6555 100644
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
index 000000000000..ad6732133ec5
--- /dev/null
+++ b/drivers/mfd/aspeed-pci-core.c
@@ -0,0 +1,120 @@
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
+#define ASPEED_BMC_VUART		2
+
+#define DRIVER_NAME "ast2600-pci-core"
+
+static const unsigned int vuart_msi_index[ASPEED_BMC_VUART] = { 16, 17 };
+static const u16 vuart_port_addr[ASPEED_BMC_VUART] = { 0x3f8, 0x2f8 };
+
+struct aspeed_pci_bmc_dev {
+	struct plat_serial8250_port uart[ASPEED_BMC_VUART + 1];
+	struct mfd_cell cell;
+};
+
+static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev,
+					     struct aspeed_pci_bmc_dev *pci_bmc_dev)
+{
+	resource_size_t bar = pci_resource_start(pdev, 1);
+	struct plat_serial8250_port *port;
+	u16 vuart_ioport;
+	unsigned int i;
+
+	for (i = 0; i < ASPEED_BMC_VUART; i++) {
+		port = &pci_bmc_dev->uart[i];
+
+		/* ASPEED BMC device shift addresses by 2 to the left */
+		vuart_ioport = vuart_port_addr[i] << 2;
+
+		port->mapbase = bar + vuart_ioport;
+		port->uartclk = 115200 * 16;
+		port->irq = pci_irq_vector(pdev, vuart_msi_index[i]);
+		port->iotype = UPIO_MEM32;
+		port->type = PORT_16550A;
+		port->flags |= (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE);
+		port->regshift = 2;
+	}
+
+	pci_bmc_dev->cell = (struct mfd_cell) {
+		.name		= "serial8250",
+		.platform_data	= pci_bmc_dev->uart,
+		.pdata_size	= sizeof(pci_bmc_dev->uart),
+	};
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
+	struct aspeed_pci_bmc_dev *pci_bmc_dev;
+	int rc = 0;
+
+	if (pdev->revision == ASPEED_BMC_REVISION_AST2700)
+		return dev_err_probe(dev, -ENODEV, "AST2700 detected but not supported\n");
+
+	pci_bmc_dev = devm_kzalloc(dev, sizeof(*pci_bmc_dev), GFP_KERNEL);
+	if (!pci_bmc_dev)
+		return -ENOMEM;
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
+	aspeed_pci_bmc_device_setup_vuart(pdev, pci_bmc_dev);
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				    &pci_bmc_dev->cell, 1, &pdev->resource[1],
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


