Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A23C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 22:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pISafSJiVZnu+3T2nuCjyIRJYlg9QHOnQKp4Z5jklI=; b=WB4Oycwb/t5WsMYBi/+LNB59Ml
	XKns69VONd6hhWs5eBe3Lt+iUHPEjCJGyCtKqAdVNJmlmbw+Arv4mm4yw+h4fmQDd5nXDNF3UgP97
	g+6n88yA6ZnSu+JFGiS7ERwHtSzcWsir4wFle9CsahBl1dUt42UOJlwRZ0RANIh3QyfdKm1kER6GP
	4CRJQorHL98eNVLEohmDwYGaFXJqmqyS9g82FrNtGL2KuFG+SvT7YKIpbUbpZ5h7Jz7TQNsvAq6jR
	6YV+dRicEw7YhFs6bdUpYEshy696KmU31zkffBVEzZwJE9oQOhvenjoKjEPyhViy7WbeFO7OJxtW1
	yp8j1lOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExvm-0000000DeJU-1LSt;
	Tue, 13 May 2025 22:16:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExfK-0000000DcR3-2o2y
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 21:59:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0pISafSJiVZnu+3T2nuCjyIRJYlg9QHOnQKp4Z5jklI=; b=n2kqrEO9Smk1fOLIg+pIUTsC3v
	sYj/WM0v/zT09To9Jk46+FoGoAxCxpqLB7vkMreu0HerNAjqIGKBgz4d/ktAem92qBlMAdtemLkEM
	a8jySYYp5piK5tjceRKv/HzfOoFqlvZ/rdu0F127pv7MQl9pG9JO4A22sOcJKfM+U8xxCMomR3ORY
	XvpoQajxLeuZS7aeliw/8ijSWklNnHr2jITO8TyJAeGcSAJi1b89YbhigvMn2AoB4n7iRKpKhSQbo
	ufaTrv/30c8NaWncO4UeVcUosEb7r54SLZFf4N0f0C7XwYuRAfm7h9KyZoh+SuJjqzTdddghgs269
	k3xGd9fg==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uExfD-0000000H2lW-1thO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 21:59:57 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxaFo2965935;
	Tue, 13 May 2025 16:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747173576;
	bh=0pISafSJiVZnu+3T2nuCjyIRJYlg9QHOnQKp4Z5jklI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IsxgsznddCdPywhjydnyipviNkC9XBG/eWHX1HwWW1Yxyx+q9VoiUjPrBJ4joR0sl
	 R38j/DKlxxOWbdXmYxDaMvOmyZgCUXlpYORjuAV7NHZRpS2E5ITzsylQqvxUy2S2Ee
	 g+3tGGKdfCm9AgljAz8kqyOxUyfrZWeDYw9POvHA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54DLxZD62966904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 13 May 2025 16:59:35 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 16:59:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 16:59:34 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxYdE111031;
	Tue, 13 May 2025 16:59:34 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Bin Liu <b-liu@ti.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Andrew Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/7] serial: 8250: Add PRUSS UART driver
Date: Tue, 13 May 2025 16:59:30 -0500
Message-ID: <20250513215934.933807-4-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513215934.933807-1-jm@ti.com>
References: <20250513215934.933807-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_225954_830977_D910E73D 
X-CRM114-Status: GOOD (  27.61  )
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

From: Bin Liu <b-liu@ti.com>

This adds a new serial 8250 driver that supports the UART in PRUSS or
PRU_ICSS*.

The UART sub-module is based on the industry standard TL16C550 UART
controller, which has 16-bytes FIFO and supports 16x and 13x over
samplings.

Signed-off-by: Bin Liu <b-liu@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/tty/serial/8250/8250_pruss.c | 178 +++++++++++++++++++++++++++
 drivers/tty/serial/8250/Kconfig      |  11 ++
 drivers/tty/serial/8250/Makefile     |   1 +
 3 files changed, 190 insertions(+)
 create mode 100644 drivers/tty/serial/8250/8250_pruss.c

diff --git a/drivers/tty/serial/8250/8250_pruss.c b/drivers/tty/serial/8250/8250_pruss.c
new file mode 100644
index 000000000000..04a455580022
--- /dev/null
+++ b/drivers/tty/serial/8250/8250_pruss.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  Serial Port driver for PRUSS UART on TI platforms
+ *
+ *  Copyright (C) 2025 by Texas Instruments Incorporated - http://www.ti.com/
+ *  Author: Bin Liu <b-liu@ti.com>
+ */
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/serial_reg.h>
+#include <linux/serial_core.h>
+
+#include "8250.h"
+
+/* PowerManagement and Emulation */
+#define PRUSS_UART_PEREMU_MGMT	12
+#define PRUSS_UART_TX_EN	BIT(14)
+#define PRUSS_UART_RX_EN	BIT(13)
+#define PRUSS_UART_FREE_RUN	BIT(0)
+
+/* Oversampling Mode Select */
+#define PRUSS_UART_MDR			13
+#define PRUSS_UART_MDR_OSM_SEL_MASK	BIT(0)
+#define PRUSS_UART_MDR_16X_MODE		0
+#define PRUSS_UART_MDR_13X_MODE		1
+
+struct pruss8250_data {
+	struct clk *clk;
+	int line;
+};
+
+static int pruss8250_startup(struct uart_port *port)
+{
+	int ret;
+
+	port->serial_out(port, PRUSS_UART_PEREMU_MGMT, 0);
+
+	ret = serial8250_do_startup(port);
+	if (!ret)
+		port->serial_out(port, PRUSS_UART_PEREMU_MGMT, PRUSS_UART_TX_EN |
+							       PRUSS_UART_RX_EN |
+							       PRUSS_UART_FREE_RUN);
+
+	return ret;
+}
+
+static unsigned int pruss8250_get_divisor(struct uart_port *port,
+					  unsigned int baud,
+					  unsigned int *frac)
+{
+	unsigned int uartclk = port->uartclk;
+	unsigned int div_13, div_16;
+	unsigned int abs_d13, abs_d16;
+	u16 quot;
+
+	div_13 = DIV_ROUND_CLOSEST(uartclk, 13 * baud);
+	div_16 = DIV_ROUND_CLOSEST(uartclk, 16 * baud);
+	div_13 = div_13 ? : 1;
+	div_16 = div_16 ? : 1;
+
+	abs_d13 = abs(baud - uartclk / 13 / div_13);
+	abs_d16 = abs(baud - uartclk / 16 / div_16);
+
+	if (abs_d13 >= abs_d16) {
+		*frac = PRUSS_UART_MDR_16X_MODE;
+		quot = div_16;
+	} else {
+		*frac = PRUSS_UART_MDR_13X_MODE;
+		quot = div_13;
+	}
+
+	return quot;
+}
+
+static void pruss8250_set_divisor(struct uart_port *port, unsigned int baud,
+				  unsigned int quot, unsigned int quot_frac)
+{
+	serial8250_do_set_divisor(port, baud, quot);
+
+	/*
+	 * quot_frac holds the MDR over-sampling mode
+	 * which is set in pruss8250_get_divisor()
+	 */
+	quot_frac &= PRUSS_UART_MDR_OSM_SEL_MASK;
+	port->serial_out(port, PRUSS_UART_MDR, quot_frac);
+}
+
+static int pruss8250_probe(struct platform_device *pdev)
+{
+	struct uart_8250_port port8250;
+	struct uart_port *port = &port8250.port;
+	struct device *dev = &pdev->dev;
+	struct pruss8250_data *data;
+	struct resource *res;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memset(&port8250, 0, sizeof(port8250));
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "Failed to get resource");
+		return -EINVAL;
+	}
+
+	if (!port->uartclk) {
+		data->clk = devm_clk_get(dev, NULL);
+		if (IS_ERR(data->clk)) {
+			dev_err(dev, "Failed to get clock!\n");
+			return -ENODEV;
+		} else {
+			port->uartclk = clk_get_rate(data->clk);
+			devm_clk_put(dev, data->clk);
+		}
+	}
+
+	port->dev = dev;
+	port->mapbase = res->start;
+	port->mapsize = resource_size(res);
+	port->type = PORT_16550A;
+	port->flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_FIXED_TYPE |
+		      UPF_IOREMAP;
+	port->startup = pruss8250_startup;
+	port->rs485_config = serial8250_em485_config;
+	port->get_divisor = pruss8250_get_divisor;
+	port->set_divisor = pruss8250_set_divisor;
+
+	ret = uart_read_port_properties(port);
+	if (ret)
+		return ret;
+
+	port->iotype = UPIO_MEM32;
+	port->regshift = 2;
+
+	spin_lock_init(&port8250.port.lock);
+	port8250.capabilities = UART_CAP_FIFO | UART_CAP_AFE;
+
+	ret = serial8250_register_8250_port(&port8250);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Unable to register 8250 port.\n");
+
+	data->line = ret;
+	platform_set_drvdata(pdev, data);
+	return 0;
+}
+
+static void pruss8250_remove(struct platform_device *pdev)
+{
+	struct pruss8250_data *data = platform_get_drvdata(pdev);
+
+	serial8250_unregister_port(data->line);
+}
+
+static const struct of_device_id pruss8250_of_match[] = {
+	{ .compatible = "ti,pruss-uart", .data = (void *)PORT_16550A },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, pruss8250_of_match);
+
+static struct platform_driver pruss8250_driver = {
+	.driver = {
+		.name = "pruss8250",
+		.of_match_table = pruss8250_of_match,
+	},
+	.probe = pruss8250_probe,
+	.remove = pruss8250_remove,
+};
+
+module_platform_driver(pruss8250_driver);
+
+MODULE_AUTHOR("Bin Liu <b-liu@ti.com");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Serial Port driver for PRUSS UART on TI platforms");
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index f64ef0819cd4..5fdb502b7eae 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -582,6 +582,17 @@ config SERIAL_8250_NI
 	  To compile this driver as a module, choose M here: the module
 	  will be called 8250_ni.
 
+config SERIAL_8250_PRUSS
+	tristate "TI PRU-ICSS UART support"
+	depends on SERIAL_8250
+	depends on (PRU_REMOTEPROC && TI_PRUSS_INTC) || COMPILE_TEST
+	help
+	  This driver is to support the UART module in PRU-ICSS which is
+	  available in some TI platforms.
+
+	  To compile this driver as a module, chose M here: the
+	  module will be called 8250_pruss.
+
 config SERIAL_OF_PLATFORM
 	tristate "Devicetree based probing for 8250 ports"
 	depends on SERIAL_8250 && OF
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index b04eeda03b23..3132b4f40a34 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_SERIAL_8250_PARISC)	+= 8250_parisc.o
 obj-$(CONFIG_SERIAL_8250_PCI)		+= 8250_pci.o
 obj-$(CONFIG_SERIAL_8250_PCI1XXXX)	+= 8250_pci1xxxx.o
 obj-$(CONFIG_SERIAL_8250_PERICOM)	+= 8250_pericom.o
+obj-$(CONFIG_SERIAL_8250_PRUSS)		+= 8250_pruss.o
 obj-$(CONFIG_SERIAL_8250_PXA)		+= 8250_pxa.o
 obj-$(CONFIG_SERIAL_8250_RT288X)	+= 8250_rt288x.o
 obj-$(CONFIG_SERIAL_8250_CS)		+= serial_cs.o
-- 
2.49.0


