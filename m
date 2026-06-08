Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A42CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSKKlCPm41pvMUdMrmydhlLiUs0iGWjoDgYMRyPMrdw=; b=mLX8YDpEPPnQdgLWXr7N1G47FH
	nQpkJhZcqnkpFzxvD5wZeVwGQtm/9Tk6VM06KJtFnncHus2XVLC2/nfEYoU4VO1RZJd4SWHorcV9k
	kxbH64oZxlSazgr3C1Kjar/rnAyBl4HKMLAHZCBt4LdINIrj9I4vYk5bMWZLtvPd8XM2/JRpHIuCc
	bQCQ4s/x91RRmhKNXZAI1OwXp6ey9wlf07YW5LO+hlKibMBFOkJoZCtKLkDTs8zV9WVfvpb321TRG
	SuqTAyVVTQPt4fsw56ApOdWy+0cbVIrvUB6L5ONr20899g9u1GKVaxkLzJIYzFvxAZqlDxP6xM7WX
	qg/hKcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbN2-00000003sl3-1pAr;
	Mon, 08 Jun 2026 14:54:32 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbMy-00000003siY-3F0p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:54:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45ef5146b56so3442689f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780930467; x=1781535267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSKKlCPm41pvMUdMrmydhlLiUs0iGWjoDgYMRyPMrdw=;
        b=PNQYPoWFHWNy+QIk2GmxBEVAVC0FAH6b4hV0n88URZ9pkLGkamK9unlmeX3Wpo8rS2
         NjDXatO25ZjuqPufbHTtZbMo/sAh0+qT0svM1RYBUH9oM7mtpKD5dFI8K6ceR5yRq6et
         qu96LpqlhnTnNAO2jk7BSDQnPEl4Es8iINTjsRPNsoFpSSsavnhjbXjLioGaHJqRNwSe
         5ZGxkMQBg0Cp8Km+keZeApFboiggrizp6tcsSujXn/3b/Q3EtCe2kknpz7zwvKlDWfaT
         ZgEzL6iyHPte9hL0sYczNNQuuscXQ14Io+/TZWEWGhAI3chi5FqPoSYfzhIlnJwQ9RCq
         /Xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930467; x=1781535267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSKKlCPm41pvMUdMrmydhlLiUs0iGWjoDgYMRyPMrdw=;
        b=MxJGIkpzM1iiI3KymdtoMruBsosf1TXoezP8yatCLwKg47HGfpjIuRhPy30XtgTcxT
         5Ixb50/QYPbspm38uTi0Ed8KWTy/itgaW6EbetOTp6MdcVdmQ5OlajnUAA4di67nB6Bv
         S7JgO/YAYOOhfyr9IZ1oubtHLvUTQ7f0Uy7bYYSkzTgohvHLahc0C1EMWyWe7/l74q3Q
         zB0BAyXadQgFAMyy91pawPtiInXLHOgL0dga5FzsP39KtSM3H4SVqqSBZNPd1ditUY7/
         gpEc79ZsGNJ8lEjdwvzfw25EM6MkK87IjmTpy499IJrdM4zD9PzXgH/RaCMtNtLQA7Vf
         CJWg==
X-Forwarded-Encrypted: i=1; AFNElJ8jnCOLoseqUnLuW2JcVNmoA6Ao0sREEH58A9h9uOI40OcPdUkz6+7iEmPjOYdfbnXawUdckq0q2lO34V4dJ+vE@lists.infradead.org
X-Gm-Message-State: AOJu0YxcFmEgEmv+wW0RmtWboinj4Kp845QlH8FNLVpfpByH7llr+/gD
	mea62D+9ELmuPiU5cU4mSWORsqAbM9J7c3OCkCI3/ztvBXJK8+qbPD3wkPbX9MYioik=
X-Gm-Gg: Acq92OGshmB46JoloATQ+15wef2RJNvuwrNHauIFO1um6PgsjEGaSya0km8LPnYLCWm
	LFamHejbJLMk9MKBozO4f9ao6+u+76pbxU2Wnxmn/W8XoD56ShXnw0h0BJVolwg1+zT+4HM94O3
	lroKSgU4SVmFyPDrmaHoLqwmqcnE81aJPtYc7/jMCntVO9JzWSB+KrXRMYXKG3QDrqbocwyKquP
	iOrcqKMCJvVO+E+AIEI4sdy+lgvFac59iljZyXEwUNrQWf+rrY4bqMBz6Y8Md5jwGJ03JXbi/+0
	WRiyac4hA01X2PnAFAu9jCkWhn6cAB5IsUo5jvhU/7mczK390w0RBQzNZ4mudswSXlgHyaLKEOD
	4voQKxnq33ieqgukdsitwQrrvzRhm6Szrk3iVHnxJESBE/3mikiw19yna+eYiH0Sma7PMAglQ6c
	rrdBCw7mi/faNGfXynNDUEqkl1geTpARjUTDPniMWBCaKBOxbsME9DKzvkPVDc
X-Received: by 2002:a05:6000:4024:b0:45e:f7ae:d599 with SMTP id ffacd0b85a97d-46032dbeb2emr22113309f8f.25.1780930466854;
        Mon, 08 Jun 2026 07:54:26 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm56927851f8f.36.2026.06.08.07.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:54:26 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v2 2/2] soc: aspeed: add host-side PCIe BMC device driver
Date: Mon,  8 Jun 2026 14:51:23 +0000
Message-ID: <13d18d25f53e0a084a8c17219804b305d4667c6b.1780929570.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1780929570.git.gregoire.layet@9elements.com>
References: <cover.1780929570.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_075428_868955_27E15BE0 
X-CRM114-Status: GOOD (  27.62  )
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

Taken from ASPEED 6.18 Kernel SDK

Add support for VUART over PCIe between BMC and host.
This add host side driver.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
Tested-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/soc/aspeed/Kconfig               |   8 +
 drivers/soc/aspeed/Makefile              |   1 +
 drivers/soc/aspeed/aspeed-host-bmc-dev.c | 249 +++++++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-host-bmc-dev.c

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 3e1fcf3c3268..5deefb64e8c7 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -11,6 +11,14 @@ config ASPEED_BMC_DEV
 	  Enable support for the ASPEED AST2600 BMC Device.
 	  This exposes the PCIe-to-LPC bridge of the BMC to the host over PCIe.
 
+config ASPEED_HOST_BMC_DEV
+	tristate "ASPEED Host BMC Device"
+	depends on PCI
+	depends on SERIAL_8250
+	help
+	  Enable support for the ASPEED AST2600 BMC Device on the Host.
+	  This configure the PCIe and setup two 8250 compatible VUART ports.
+
 config ASPEED_LPC_CTRL
 	tristate "ASPEED LPC firmware cycle control"
 	select REGMAP
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index fab0d247df66..3fd3f6d8d36e 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_ASPEED_BMC_DEV)		+= aspeed-bmc-dev.o
+obj-$(CONFIG_ASPEED_HOST_BMC_DEV)	+= aspeed-host-bmc-dev.o
 obj-$(CONFIG_ASPEED_LPC_CTRL)		+= aspeed-lpc-ctrl.o
 obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
diff --git a/drivers/soc/aspeed/aspeed-host-bmc-dev.c b/drivers/soc/aspeed/aspeed-host-bmc-dev.c
new file mode 100644
index 000000000000..7cb52a770fb6
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-host-bmc-dev.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (C) ASPEED Technology Inc.
+
+#include <linux/init.h>
+#include <linux/version.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/pci.h>
+#include <linux/serial_core.h>
+#include <linux/serial_8250.h>
+
+static DEFINE_IDA(bmc_device_ida);
+
+#define VUART_MAX_PARMS	2
+#define MAX_MSI_NUM		8
+#define BMC_MULTI_MSI	32
+
+#define DRIVER_NAME "aspeed-host-bmc-dev"
+
+enum aspeed_platform_id {
+	ASPEED,
+};
+
+enum msi_index {
+	VUART0_MSI,
+	VUART1_MSI,
+};
+
+/* Match msi_index */
+static int ast2600_msi_idx_table[MAX_MSI_NUM] = { 16, 15 };
+
+struct aspeed_platform {
+	int (*setup)(struct pci_dev *pdev);
+};
+
+struct aspeed_pci_bmc_dev {
+	struct device *dev;
+	struct aspeed_platform *platform;
+	kernel_ulong_t driver_data;
+	int id;
+
+	unsigned long message_bar_base;
+	unsigned long message_bar_size;
+	void __iomem *msg_bar_reg;
+
+	struct uart_8250_port uart[VUART_MAX_PARMS];
+	int uart_line[VUART_MAX_PARMS];
+
+	/* Interrupt
+	 * The index of array is using to enum msi_index
+	 */
+	int *msi_idx_table;
+};
+
+static void aspeed_pci_setup_irq_resource(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+
+	/* Assign static msi index table by platform */
+	pci_bmc_dev->msi_idx_table = ast2600_msi_idx_table;
+
+	if (pci_alloc_irq_vectors(pdev, 1, BMC_MULTI_MSI, PCI_IRQ_INTX | PCI_IRQ_MSI) <= 1)
+		/* Set all msi index to the first vector */
+		memset(pci_bmc_dev->msi_idx_table, 0, sizeof(int) * MAX_MSI_NUM);
+}
+
+static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	u16 vuart_ioport;
+	int ret, i;
+
+	for (i = 0; i < VUART_MAX_PARMS; i++) {
+		/* Assign the line to non-exist device */
+		pci_bmc_dev->uart_line[i] = -ENOENT;
+		vuart_ioport = 0x3F8 - (i * 0x100);
+		pci_bmc_dev->uart[i].port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
+		pci_bmc_dev->uart[i].port.uartclk = 115200 * 16;
+		pci_bmc_dev->uart[i].port.irq =
+			pci_irq_vector(pdev, pci_bmc_dev->msi_idx_table[VUART0_MSI + i]);
+		pci_bmc_dev->uart[i].port.dev = dev;
+		pci_bmc_dev->uart[i].port.iotype = UPIO_MEM32;
+		pci_bmc_dev->uart[i].port.iobase = 0;
+		pci_bmc_dev->uart[i].port.mapbase =
+			pci_bmc_dev->message_bar_base + (vuart_ioport << 2);
+		pci_bmc_dev->uart[i].port.membase = 0;
+		pci_bmc_dev->uart[i].port.type = PORT_16550A;
+		pci_bmc_dev->uart[i].port.flags |= (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE);
+		pci_bmc_dev->uart[i].port.regshift = 2;
+		ret = serial8250_register_8250_port(&pci_bmc_dev->uart[i]);
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "Can't setup PCIe VUART\n");
+			return ret;
+		}
+		pci_bmc_dev->uart_line[i] = ret;
+	}
+	return 0;
+}
+
+static void aspeed_pci_host_bmc_device_release_vuart(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < VUART_MAX_PARMS; i++) {
+		if (pci_bmc_dev->uart_line[i] >= 0)
+			serial8250_unregister_port(pci_bmc_dev->uart_line[i]);
+	}
+}
+
+static int aspeed_pci_host_setup(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+	int rc = 0;
+
+	/* Get Message BAR */
+	pci_bmc_dev->message_bar_base = pci_resource_start(pdev, 1);
+	pci_bmc_dev->message_bar_size = pci_resource_len(pdev, 1);
+	pci_bmc_dev->msg_bar_reg = pci_ioremap_bar(pdev, 1);
+	if (!pci_bmc_dev->msg_bar_reg)
+		return -ENOMEM;
+
+	if (pdev->revision < 0x27) {
+		/* AST2600 ERRTA40: dummy read */
+		(void)__raw_readl((void __iomem *)pci_bmc_dev->msg_bar_reg);
+	} else {
+		/* AST2700 not supported */
+		pr_err("AST2700 detected but not supported");
+		goto out_free0;
+	}
+
+	rc = aspeed_pci_bmc_device_setup_vuart(pdev);
+	if (rc) {
+		pr_err("Cannot setup Virtual UART");
+		goto out_free0;
+	}
+
+	return 0;
+
+out_free0:
+	pci_iounmap(pdev, pci_bmc_dev->msg_bar_reg);
+
+	return rc;
+}
+
+static struct aspeed_platform aspeed_pcie_host[] = {
+	{ .setup = aspeed_pci_host_setup },
+	{ 0 }
+};
+
+static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev;
+	int rc = 0;
+
+	pr_info("ASPEED BMC PCI ID %04x:%04x, IRQ=%u\n", pdev->vendor, pdev->device, pdev->irq);
+
+	pci_bmc_dev = devm_kzalloc(&pdev->dev, sizeof(*pci_bmc_dev), GFP_KERNEL);
+	if (!pci_bmc_dev)
+		return -ENOMEM;
+
+	/* Get platform id */
+	pci_bmc_dev->driver_data = ent->driver_data;
+	pci_bmc_dev->platform = &aspeed_pcie_host[ent->driver_data];
+
+	pci_bmc_dev->id = ida_alloc(&bmc_device_ida, GFP_KERNEL);
+	if (pci_bmc_dev->id < 0)
+		return pci_bmc_dev->id;
+
+	rc = pci_enable_device(pdev);
+	if (rc) {
+		dev_err(&pdev->dev, "pci_enable_device() returned error %d\n", rc);
+		return rc;
+	}
+
+	pci_set_master(pdev);
+	pci_set_drvdata(pdev, pci_bmc_dev);
+
+	/* Prepare IRQ resource */
+	aspeed_pci_setup_irq_resource(pdev);
+
+	/* Setup BMC PCI device */
+	rc = pci_bmc_dev->platform->setup(pdev);
+	if (rc) {
+		dev_err(&pdev->dev, "ASPEED PCIe Host device returned error %d\n", rc);
+		pci_free_irq_vectors(pdev);
+		pci_disable_device(pdev);
+		return rc;
+	}
+
+	return 0;
+}
+
+static void aspeed_pci_host_bmc_device_remove(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+
+	if (pci_bmc_dev->driver_data == ASPEED)
+		aspeed_pci_host_bmc_device_release_vuart(pdev);
+
+	ida_free(&bmc_device_ida, pci_bmc_dev->id);
+
+	pci_iounmap(pdev, pci_bmc_dev->msg_bar_reg);
+
+	pci_free_irq_vectors(pdev);
+	pci_disable_device(pdev);
+}
+
+/**
+ * This table holds the list of (VendorID,DeviceID) supported by this driver
+ *
+ */
+static struct pci_device_id aspeed_host_bmc_dev_pci_ids[] = {
+	/* ASPEED BMC Device */
+	{ PCI_DEVICE(0x1A03, 0x2402), .class = 0xFF0000, .class_mask = 0xFFFF00,
+	  .driver_data = ASPEED },
+	{
+		0,
+	}
+};
+
+MODULE_DEVICE_TABLE(pci, aspeed_host_bmc_dev_pci_ids);
+
+static struct pci_driver aspeed_host_bmc_dev_driver = {
+	.name		= DRIVER_NAME,
+	.id_table	= aspeed_host_bmc_dev_pci_ids,
+	.probe		= aspeed_pci_host_bmc_device_probe,
+	.remove		= aspeed_pci_host_bmc_device_remove,
+};
+
+static int __init aspeed_host_bmc_device_init(void)
+{
+	return pci_register_driver(&aspeed_host_bmc_dev_driver);
+}
+
+static void aspeed_host_bmc_device_exit(void)
+{
+	/* unregister pci driver */
+	pci_unregister_driver(&aspeed_host_bmc_dev_driver);
+}
+
+late_initcall(aspeed_host_bmc_device_init);
+module_exit(aspeed_host_bmc_device_exit);
+
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_DESCRIPTION("ASPEED Host BMC DEVICE Driver");
+MODULE_LICENSE("GPL");
-- 
2.51.2


