Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F79C44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iwh65dKO5+bsZr13pVdRagINz4uUME07b+uSSD/0Nc=; b=DbvhlRMAJtdKjKfH+07l626jKu
	GzO9ujUie4DCSEVjt+nZmsiyp2/TzTI2TR+7q3bfjFs8NHQDxiy+SECAEA6PO9j24F/60DLo68Sfs
	B3yp9C4yItV0kW5VCP7g2UFSitR3xbos6cd5+qG9rOK3CuNm88JX9HSZKUlPAes6K7NJ+7arR7i2/
	zoW3xtshwnUdDjVw5KhUbHe6Wt30OpzZWV5WyLfqI4vVP+GdQ+VbIAArJ7nPeGrYIOmclrwYxk/hX
	SwQUt9N4hJaBitdH319DUpukO7cFvl7zO3uHRB1mSLdFEdp/SeqByr1inGDb31/sVtBtTBDwrZwWd
	gOWXH6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXwL-0000000H33I-25lK;
	Tue, 30 Jun 2026 12:51:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXwE-0000000H2xF-2GYU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:51:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 17FD1C51476;
	Tue, 30 Jun 2026 12:51:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DE3D6025A;
	Tue, 30 Jun 2026 12:51:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C680106F1EA6;
	Tue, 30 Jun 2026 14:51:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782823898; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+iwh65dKO5+bsZr13pVdRagINz4uUME07b+uSSD/0Nc=;
	b=wKCCAdMXTbId36Xcy84/uXy9ierwa8xUGcPE+dhoEL+fCikztA4aLkjCKwiZgSNgxgZ8D1
	b+s+jGwSXKwr5hTPrnaDWxXvNxXulZIjiccKT7uCUCev2FmGLVZ48y+QqBDXMdbLTbjqOJ
	rWhCQ701jN8BtP0HWy0KvPLFk+dyPc0SPAyFRdsVUsWNAv8NX0bKCDPQazDgsf9v4fXdFd
	BzcSwIrSKGth0DozEii9a9d/bl+FikQAOH3MReWq+v6lXFtZWXcy6sliTpbrEsVcxreFeM
	afoTPk3n16ijY6DaPj7X3ZoaYe4F+M6INdq4dNvZsbsnBDOAMNiWTQZUlMsB2w==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 30 Jun 2026 14:51:15 +0200
Subject: [PATCH v6 5/5] watchdog: aaeon: Add watchdog driver for SRG-IMX8P
 MCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-dev-b4-aaeon-mcu-driver-v6-5-d66b5fcbd2f0@bootlin.com>
References: <20260630-dev-b4-aaeon-mcu-driver-v6-0-d66b5fcbd2f0@bootlin.com>
In-Reply-To: <20260630-dev-b4-aaeon-mcu-driver-v6-0-d66b5fcbd2f0@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_055143_761700_107FBB9E 
X-CRM114-Status: GOOD (  20.59  )
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

Add watchdog driver for the Aaeon SRG-IMX8P embedded controller.
This driver provides system monitoring and recovery capabilities
through the MCU's watchdog timer.

The watchdog supports start, stop, and ping operations with a maximum
hardware heartbeat of 25 seconds and a default timeout of 240 seconds.
The software timeout can be changed via the WDIOC_SETTIMEOUT ioctl,
the DT timeout-sec property, or the watchdog_timeout kernel boot
parameter.

Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
 MAINTAINERS                      |   1 +
 drivers/watchdog/Kconfig         |  10 +++
 drivers/watchdog/Makefile        |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c | 144 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 156 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2538f8c4bc14..7b92af42c9fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -193,6 +193,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
 F:	drivers/gpio/gpio-aaeon-mcu.c
 F:	drivers/mfd/aaeon-mcu.c
+F:	drivers/watchdog/aaeon_mcu_wdt.c
 F:	include/linux/mfd/aaeon-mcu.h
 
 AAEON UPBOARD FPGA MFD DRIVER
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index d3b9df7d466b..f67a0b453316 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -420,6 +420,16 @@ config SL28CPLD_WATCHDOG
 
 # ARM Architecture
 
+config AAEON_MCU_WATCHDOG
+	tristate "Aaeon MCU Watchdog"
+	depends on MFD_AAEON_MCU
+	select WATCHDOG_CORE
+	help
+	  Select this option to enable watchdog timer support for the Aaeon
+	  SRG-IMX8P onboard microcontroller (MCU). This driver provides
+	  watchdog functionality through the MCU, allowing system monitoring
+	  and automatic recovery from system hangs.
+
 config AIROHA_WATCHDOG
 	tristate "Airoha EN7581 Watchdog"
 	depends on ARCH_AIROHA || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index ba52099b1253..2deec425d3ea 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_USBPCWATCHDOG) += pcwd_usb.o
 # ALPHA Architecture
 
 # ARM Architecture
+obj-$(CONFIG_AAEON_MCU_WATCHDOG) += aaeon_mcu_wdt.o
 obj-$(CONFIG_ARM_SP805_WATCHDOG) += sp805_wdt.o
 obj-$(CONFIG_ARM_SBSA_WATCHDOG) += sbsa_gwdt.o
 obj-$(CONFIG_ARMADA_37XX_WATCHDOG) += armada_37xx_wdt.o
diff --git a/drivers/watchdog/aaeon_mcu_wdt.c b/drivers/watchdog/aaeon_mcu_wdt.c
new file mode 100644
index 000000000000..347ee8269bfd
--- /dev/null
+++ b/drivers/watchdog/aaeon_mcu_wdt.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU Watchdog driver
+ *
+ * Copyright (C) 2026 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/mfd/aaeon-mcu.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/watchdog.h>
+
+#define AAEON_MCU_PING_WDT	0x73
+
+#define AAEON_MCU_WDT_TIMEOUT         240
+#define AAEON_MCU_WDT_HEARTBEAT_MS    25000
+#define AAEON_MCU_WDT_MIN_TIMEOUT     1
+#define AAEON_MCU_WDT_MAX_TIMEOUT     3600
+
+static unsigned int timeout;
+module_param(timeout, uint, 0);
+MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
+
+struct aaeon_mcu_wdt {
+	struct watchdog_device wdt;
+	struct regmap *regmap;
+};
+
+static int aaeon_mcu_wdt_cmd(struct aaeon_mcu_wdt *data, u8 opcode, u8 arg)
+{
+	return regmap_write(data->regmap, AAEON_MCU_REG(opcode, arg), 0);
+}
+
+static int aaeon_mcu_wdt_start(struct watchdog_device *wdt)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+
+	return aaeon_mcu_wdt_cmd(data, AAEON_MCU_CONTROL_WDT_OPCODE, 0x01);
+}
+
+static int aaeon_mcu_wdt_status(struct watchdog_device *wdt, bool *enabled)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+	unsigned int rsp;
+	int ret;
+
+	ret = regmap_read(data->regmap,
+			  AAEON_MCU_REG(AAEON_MCU_CONTROL_WDT_OPCODE, 0x02),
+			  &rsp);
+	if (ret)
+		return ret;
+
+	*enabled = rsp == 0x01;
+	return 0;
+}
+
+static int aaeon_mcu_wdt_stop(struct watchdog_device *wdt)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+
+	return aaeon_mcu_wdt_cmd(data, AAEON_MCU_CONTROL_WDT_OPCODE, 0x00);
+}
+
+static int aaeon_mcu_wdt_ping(struct watchdog_device *wdt)
+{
+	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
+
+	return aaeon_mcu_wdt_cmd(data, AAEON_MCU_PING_WDT, 0x00);
+}
+
+static const struct watchdog_info aaeon_mcu_wdt_info = {
+	.identity	= "Aaeon MCU Watchdog",
+	.options	= WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT
+};
+
+static const struct watchdog_ops aaeon_mcu_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= aaeon_mcu_wdt_start,
+	.stop		= aaeon_mcu_wdt_stop,
+	.ping		= aaeon_mcu_wdt_ping,
+};
+
+static int aaeon_mcu_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct watchdog_device *wdt;
+	struct aaeon_mcu_wdt *data;
+	bool enabled;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!data->regmap)
+		return -ENODEV;
+
+	wdt = &data->wdt;
+	wdt->parent = dev;
+	wdt->info = &aaeon_mcu_wdt_info;
+	wdt->ops = &aaeon_mcu_wdt_ops;
+	/*
+	 * The MCU firmware has a fixed hardware timeout of 25 seconds that
+	 * cannot be changed. The watchdog core handles automatic pinging to
+	 * support software timeouts longer than the hardware limit. The default
+	 * software timeout of 240 seconds can be overridden via the DT
+	 * timeout-sec property or the watchdog_timeout kernel boot parameter.
+	 */
+	wdt->timeout = AAEON_MCU_WDT_TIMEOUT;
+	wdt->min_timeout = AAEON_MCU_WDT_MIN_TIMEOUT;
+	wdt->max_timeout = AAEON_MCU_WDT_MAX_TIMEOUT;
+	wdt->max_hw_heartbeat_ms = AAEON_MCU_WDT_HEARTBEAT_MS;
+	watchdog_init_timeout(wdt, timeout, dev);
+
+	watchdog_set_drvdata(wdt, data);
+	watchdog_stop_on_reboot(wdt);
+
+	ret = aaeon_mcu_wdt_status(wdt, &enabled);
+	if (ret)
+		return ret;
+
+	if (enabled)
+		set_bit(WDOG_HW_RUNNING, &wdt->status);
+
+	return devm_watchdog_register_device(dev, wdt);
+}
+
+static struct platform_driver aaeon_mcu_wdt_driver = {
+	.driver		= {
+		.name	= "aaeon-mcu-wdt",
+	},
+	.probe		= aaeon_mcu_wdt_probe,
+};
+
+module_platform_driver(aaeon_mcu_wdt_driver);
+
+MODULE_ALIAS("platform:aaeon-mcu-wdt");
+MODULE_DESCRIPTION("Aaeon MCU Watchdog Driver");
+MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
+MODULE_LICENSE("GPL");

-- 
2.54.0


