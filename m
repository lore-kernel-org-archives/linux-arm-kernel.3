Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33B0CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzFl26ddi0jEQXsVe9q4+m4rXNgAUesMeoLcq3/Soy8=; b=UFL118pvef/Os3lKTnTvlo4e4d
	xmJJWfTz7iNTzHTMuQ4+k534L7eB0Kbv6of9lMf1GTZ6K5P+cDmUh9aGrv4P916QZZadjfi0NIF2i
	+pmGfsHA9yHCVk4M/6fNdx4wpITz8rc1J9NwzYbcY0F2Tqk2Zy/F+zAl4YypsoPThnpkRAzc4DbNz
	ugUWa4ROPH0ohMWRGlM+1FGdQIsTXiHr8TZFAiiIX7JNo3AQFz3yfTJK6FYhpMsCO/kfKlMfYNfWQ
	TyfwsjzqRg3zfJcn0gQc2OMu4YvvAhnVeV3hAxqsvacHKp5nW8ckWbXjKCHDwfDzk0XqfWOFPY6l4
	4brBCBPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28n-00000006Rdw-1b2S;
	Tue, 23 Jun 2026 14:30:17 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28T-00000006RVX-2Dtj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:29:58 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so4511914f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782224995; x=1782829795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzFl26ddi0jEQXsVe9q4+m4rXNgAUesMeoLcq3/Soy8=;
        b=cD7ele7Yd/T9Bc87hlQA8gfqa9MTcK6izcp1ZhCP0uYdO7jXesxGIZ5mGExVLUfEIi
         MhVc0Hxfl+s30Y23WJ+tskxMF5c6MvGiij1hTr5im6LPTzo+KZuHO1cX3L1WID+LFX+T
         4ubicMNyTU7AY3ksGFlzkflOjEfQ1y+pY2xCEnCMDtQa+2WbIkWmjWfhpqS+uWE5dZoI
         XcL7JL4uH49PDbGuPgbfI5QiyBt7F9cRgDqpHdKXjVimWYYqvOiZdHOTzUFTRkpj+j7J
         hau8lDFwCH9pHOYHhp/aDumNCAKFaYvxQ8zyy0bqKfoE4hTAjTvpL8eMRZ81Fwl+dV3R
         r1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224995; x=1782829795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FzFl26ddi0jEQXsVe9q4+m4rXNgAUesMeoLcq3/Soy8=;
        b=qyrbzuccNkwer9TOx+HsdwpGnz9kcThW5NoLzsRkeLk1a/3ubAonurIxxh+W8WH7qd
         adw6jor/2muoBvVWqNOMeUwOCzEqJP0my3V1HlJa9DPksR5ewxkA8lKvx/w3H+PANC7t
         ZB0aBR7qB9BQJmNCg4o4pzEE5CsburvMg6JGw378Jm2wgdF/LszdjZ7GWd0JRBbV3mZZ
         o1+gcj1HlHc1zTGwMoZsQCgAtEx7dW9r2lkbKNRTVii9EM6g7Q7JIiT1ycouYRX0WCDl
         EmZjidMb6P8DCpOEyY1Fa/NGx8AO33HEI3OgLBmyyYV7J+ZUpUI+UtgxSRJqfD8BgzGH
         Dcig==
X-Forwarded-Encrypted: i=1; AFNElJ/dmaGhKC1/VJW5IZzxm9hwhkHQRNhz5yxi4/OD2pCZV3c2Nkev+enmCbUx6N8EVAEGW9BVHtZHiE3lFhkBIm0g@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa/VJ527Pux3WigPfaORNjxhBLa/4xGrfFslRruvMRS3b94joj
	KcVukjezkErSTEmSpWmmdiZKDUQxDJV3WRPH7U0ksfPyQ773RoVyxIvQDvYzUJLlZFQ=
X-Gm-Gg: AfdE7ckKDn5HqKKMVCi17KmCnYtV4mAf5qNTxciJsaN998mOf780dEOFZ11OLgYKrt6
	+fUCC3OIkAy62SFInuaGaREpMdo4bEAVAqXQ82Kug3tepxoDK1xFN/JOgyUDpVTuCYKBAUj344C
	1jiHjrvdjxbESB9pk4WhfIM2Iwti6zAOZwU1rLLMGQySr8LnAvLHk+hrwTzZwKBr925V5n65OoQ
	fxwWHn4e7NcPgzY5WprUJhUgUN+Ym39+LwxP8gUwcdKEwCvxsmI0Ju5rNDHfs86x83Uv8EcPQXG
	hbYGREdThtT4Q7+5pF8e4RYAroMiXcJ1H0EuvJFuxfGEkqb3sHDy4/V9fX57qmAsX2Y1o9vODPX
	gmXEWwYqDjgqB+u3jKo+D2VnUQ+xhp3nPSLRTBxyBYGWkG7QwG6iVW0TsBF71z25bRbVGHobRlV
	Nk2c+geifRItHmkTmTLRLJ/Rgk4szagPiSuCc/d+FkxG10vla8jOAUO4NcGXbflFkIJu1F9r12D
	/FZZCDblIvCybJgUcvzjP5pu4Zd
X-Received: by 2002:a05:600c:698c:b0:492:4c9e:c95d with SMTP id 5b1f17b1804b1-4925b3b21e1mr48666485e9.18.1782224995461;
        Tue, 23 Jun 2026 07:29:55 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm362507805e9.2.2026.06.23.07.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:29:55 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 5/7] soc: aspeed: add host-side PCIe BMC device driver
Date: Tue, 23 Jun 2026 14:25:43 +0000
Message-ID: <8746971524bf4186c9a393dab637ad4e27ce4563.1782224059.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_072957_632809_471667BF 
X-CRM114-Status: GOOD (  27.73  )
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

Add support for VUART over PCIe between BMC and host.
This add host side driver.
This only support the AST2600.

Taken from ASPEED 6.18 Kernel SDK and trimmed down.

The host can't detect the VUART adresses, they are forced
at 0x3f8 and 0x2f8, similar from the initial ASPEED driver.

The MSI vector index has been changed for the VUART2 from 15 to 17.
The index 15 used in the initial driver was not working.

Data path in both direction is tested on both VUART.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
Tested-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/soc/aspeed/Kconfig               |   8 +
 drivers/soc/aspeed/Makefile              |   1 +
 drivers/soc/aspeed/aspeed-host-bmc-dev.c | 183 +++++++++++++++++++++++
 3 files changed, 192 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-host-bmc-dev.c

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 63a656449a1a..ebd023b10701 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -4,6 +4,14 @@ if ARCH_ASPEED || COMPILE_TEST
 
 menu "ASPEED SoC drivers"
 
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
index b35d74592964..c515e163eab7 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_ASPEED_HOST_BMC_DEV)	+= aspeed-host-bmc-dev.o
 obj-$(CONFIG_ASPEED_LPC_CTRL)		+= aspeed-lpc-ctrl.o
 obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
diff --git a/drivers/soc/aspeed/aspeed-host-bmc-dev.c b/drivers/soc/aspeed/aspeed-host-bmc-dev.c
new file mode 100644
index 000000000000..3160b6aedb5b
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-host-bmc-dev.c
@@ -0,0 +1,183 @@
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
+#define BMC_MULTI_MSI	32
+#define PCI_BMC_DEVICE_ID 0x2402
+
+#define DRIVER_NAME "aspeed-host-bmc-dev"
+
+enum aspeed_platform_id {
+	ASPEED,
+};
+
+static int vuart_msi_index[2] = { 16, 17 };
+static int vuart_port_addr[2] = {0x3f8, 0x2f8};
+
+struct aspeed_pci_bmc_dev {
+	struct device *dev;
+	kernel_ulong_t driver_data;
+	int id;
+
+	unsigned long message_bar_base;
+
+	struct uart_8250_port uart[2];
+	int uart_line[2];
+
+	int *msi_idx_table;
+};
+
+static void aspeed_pci_setup_irq_resource(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+
+	pci_bmc_dev->msi_idx_table = vuart_msi_index;
+
+	if (pci_alloc_irq_vectors(pdev, 1, BMC_MULTI_MSI, PCI_IRQ_INTX | PCI_IRQ_MSI) <= 1)
+		/* If pci_alloc fail, set all msi index to the first vector */
+		memset(pci_bmc_dev->msi_idx_table, 0, sizeof(vuart_msi_index));
+}
+
+static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev, int idx)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	struct uart_8250_port *uart = &pci_bmc_dev->uart[idx];
+	u16 vuart_ioport;
+	int ret;
+
+	/* Assign the line to non-exist device before everything is setup */
+	pci_bmc_dev->uart_line[idx] = -ENOENT;
+
+	vuart_ioport = vuart_port_addr[idx];
+	/* ASPEED BMC device shift adresses by 2 to the left */
+	vuart_ioport = vuart_ioport << 2;
+
+	uart->port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
+	uart->port.uartclk = 115200 * 16;
+	uart->port.irq = pci_irq_vector(pdev, pci_bmc_dev->msi_idx_table[idx]);
+	uart->port.dev = dev;
+	uart->port.iotype = UPIO_MEM32;
+	uart->port.iobase = 0;
+	uart->port.mapbase = pci_bmc_dev->message_bar_base + vuart_ioport;
+	uart->port.membase = 0;
+	uart->port.type = PORT_16550A;
+	uart->port.flags |= (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE);
+	uart->port.regshift = 2;
+
+	ret = serial8250_register_8250_port(&pci_bmc_dev->uart[idx]);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Can't setup PCIe VUART%d\n", idx);
+		return ret;
+	}
+
+	pci_bmc_dev->uart_line[idx] = ret;
+
+	return 0;
+}
+
+static void aspeed_pci_host_bmc_device_release_vuart(struct pci_dev *pdev, int idx)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+
+	if (pci_bmc_dev->uart_line[idx] >= 0)
+		serial8250_unregister_port(pci_bmc_dev->uart_line[idx]);
+}
+
+static int aspeed_pci_host_setup(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+	int rc = 0;
+
+	pci_bmc_dev->message_bar_base = pci_resource_start(pdev, 1);
+
+	if (pdev->revision == 0x27) {
+		pr_err("AST2700 detected but not supported");
+		return -ENODEV;
+	}
+
+	rc = aspeed_pci_bmc_device_setup_vuart(pdev, 0);
+	if (rc)
+		return rc;
+
+	rc = aspeed_pci_bmc_device_setup_vuart(pdev, 1);
+	if (rc)
+		goto out_freeVUART1;
+
+	return 0;
+
+out_freeVUART1:
+	aspeed_pci_host_bmc_device_release_vuart(pdev, 0);
+
+	return rc;
+}
+
+static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev;
+	int rc = 0;
+
+	pci_bmc_dev = devm_kzalloc(&pdev->dev, sizeof(*pci_bmc_dev), GFP_KERNEL);
+	if (!pci_bmc_dev)
+		return -ENOMEM;
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
+	aspeed_pci_setup_irq_resource(pdev);
+
+	/* Setup BMC PCI device */
+	rc = aspeed_pci_host_setup(pdev);
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
+	aspeed_pci_host_bmc_device_release_vuart(pdev, 0);
+	aspeed_pci_host_bmc_device_release_vuart(pdev, 1);
+
+	pci_free_irq_vectors(pdev);
+	pci_disable_device(pdev);
+}
+
+static struct pci_device_id aspeed_host_bmc_dev_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_ASPEED, PCI_BMC_DEVICE_ID), .class = 0xFF0000, .class_mask = 0xFFFF00,
+	  .driver_data = ASPEED },
+	{ 0 }
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
+module_driver(aspeed_host_bmc_dev_driver, pci_register_driver, pci_unregister_driver);
+
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_DESCRIPTION("ASPEED Host BMC DEVICE Driver");
+MODULE_LICENSE("GPL");
-- 
2.54.0


