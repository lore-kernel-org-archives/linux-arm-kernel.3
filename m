Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA95D43371
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 07:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/t/Lqv4AoGZ5V51nn2T+1fBK6i6gggmvBiRF4umYo00=; b=gp72pu9aEtTQM834q/q1ucPrHr
	UlBKRRz/2KG0TwL7fS8VbQ0k+McjpWZLfDKeCzCuvX8odJPSBabRr5unAOPkUPKG05LblGheO1/H6
	uL46JGx7JvPG2lAn7GoKPv6xIvntprrBmdaFuMFJhWhLOmolG25rLkGdu2Jw+4dLcgpaKWIwOeg5f
	8BaS2FWy0k3C1YV28WSxr1Swsj3zj4f80tboOMzcaF9+AvUBCOleEk1H896cdHmhNdR6BUUj+8K4H
	i9/a5ARW/28WvLqEoj2YKx9dpU2HdRjrYjYv+Oijz6q5Tm3tReLJEHtK0H3LOwBtz6He2FBEGWhEu
	BFvp9Eag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmk-00000000DRo-1BRJ;
	Fri, 12 Dec 2025 07:41:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmZ-00000000DI6-38SE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 07:41:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4EDC64E41BA8;
	Fri, 12 Dec 2025 07:41:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 234D7606DF;
	Fri, 12 Dec 2025 07:41:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51A3D103C8E03;
	Fri, 12 Dec 2025 08:41:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525301; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/t/Lqv4AoGZ5V51nn2T+1fBK6i6gggmvBiRF4umYo00=;
	b=DVEEAQR1oHaaVBR+IHsfJSALEfbcFTpE9FwMZfE3NqM0ndNM/wYoVfcqtwQtoyLzf7ycwM
	//mN87k26/qTTnZJ3GpVqkZ5Vwigp8wng2URY+a1R1suPhbqIZXyTuFFwdjoKxyzf4pOmq
	NPWsxwI7NxKaAU8DlMInLUm7DHRAs72jfDIAAM+x+JI8h8IrIQFpRCD46zaKPXYGt6ja9R
	V2R6LUUm+719+kjX97ar7DfuRnc5fmdzA/WD+U+0C8Q9IkDZgBX2cwf3w2ePEZqEmUAg/G
	J062vQaUgHpYZmdghCs69ytufcfDNKcJ5jzNSuh+9s3GISwqpfVQ3Ekp1OrDuQ==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 12 Dec 2025 08:41:09 +0100
Subject: [PATCH 6/8] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12@bootlin.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_234143_944615_C632FC66 
X-CRM114-Status: GOOD (  23.73  )
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

Add GPIO driver for the Aaeon SRG-IMX8PL embedded controller. This
driver supports 7 GPO (General Purpose Output) pins and 12 GPIO pins
that can be configured as inputs or outputs.

The driver implements proper state management for GPO pins (which are
output-only) and full direction control for GPIO pins. During probe,
all pins are reset to a known state (GPOs low, GPIOs as inputs) to
prevent undefined behavior across system reboots, as the MCU does not
reset GPIO states on soft reboot.

Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 drivers/gpio/Kconfig          |  10 ++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-aaeon-mcu.c | 248 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 259 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c74da29253e810b51540684b1186e8f274066b69..7e0f675b664fa25243fc2802edc3380572c94c41 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -157,6 +157,16 @@ config GPIO_74XX_MMIO
 	    8 bits:	74244 (Input), 74273 (Output)
 	    16 bits:	741624 (Input), 7416374 (Output)
 
+config GPIO_AAEON_MCU
+	tristate "Aaeon MCU GPIO support"
+	depends on MFD_AAEON_MCU && OF_GPIO
+	select GPIO_GENERIC
+	help
+	  Select this option to enable GPIO support for the Aaeon SRG-IMX8PL
+	  onboard MCU. This driver provides access to GPIO pins and GPO
+	  (General Purpose Output) pins controlled by the microcontroller.
+	  The driver handles both input and output configuration.
+
 config GPIO_ALTERA
 	tristate "Altera GPIO"
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 2421a8fd3733e0b06c2581262aaa9cd629f66c7d..1ba6318bc558743fbe5910966c2c8fc3f792efe9 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
 obj-$(CONFIG_GPIO_74X164)		+= gpio-74x164.o
 obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
+obj-$(CONFIG_GPIO_AAEON_MCU)		+= gpio-aaeon-mcu.o
 obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5585)		+= gpio-adp5585.o
diff --git a/drivers/gpio/gpio-aaeon-mcu.c b/drivers/gpio/gpio-aaeon-mcu.c
new file mode 100644
index 0000000000000000000000000000000000000000..cebd17d1877147b987ea673b081334c8062f5fc0
--- /dev/null
+++ b/drivers/gpio/gpio-aaeon-mcu.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU GPIO driver
+ *
+ * Copyright (C) 2025 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/bitmap.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/aaeon-mcu.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define AAEON_MCU_CONFIG_GPIO_INPUT 0x69
+#define AAEON_MCU_CONFIG_GPIO_OUTPUT 0x6F
+#define AAEON_MCU_READ_GPIO 0x72
+#define AAEON_MCU_WRITE_GPIO 0x77
+
+#define AAEON_MCU_CONTROL_GPO 0x6C
+
+#define MAX_GPIOS 12
+#define MAX_GPOS 7
+
+struct aaeon_mcu_gpio {
+	struct gpio_chip gc;
+	struct aaeon_mcu_dev *mfd;
+	DECLARE_BITMAP(dir_in, MAX_GPOS + MAX_GPIOS);
+	DECLARE_BITMAP(gpo_state, MAX_GPOS);
+};
+
+static int aaeon_mcu_gpio_config_input_cmd(struct aaeon_mcu_gpio *data,
+					    unsigned int offset)
+{
+	u8 cmd[3], rsp;
+
+	cmd[0] = AAEON_MCU_CONFIG_GPIO_INPUT;
+	cmd[1] = offset - 7;
+	cmd[2] = 0x00;
+
+	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+}
+
+static int aaeon_mcu_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+	int ret;
+
+	if (offset < MAX_GPOS) {
+		dev_err(gc->parent, "GPIO offset (%d) must be an output GPO\n", offset);
+		return -EOPNOTSUPP;
+	}
+
+	ret = aaeon_mcu_gpio_config_input_cmd(data, offset);
+	if (ret < 0)
+		return ret;
+
+	set_bit(offset, data->dir_in);
+
+	return 0;
+}
+
+static int aaeon_mcu_gpio_config_output_cmd(struct aaeon_mcu_gpio *data,
+					     unsigned int offset,
+					     int value)
+{
+	u8 cmd[3], rsp;
+	int ret;
+
+	cmd[0] = AAEON_MCU_CONFIG_GPIO_OUTPUT;
+	cmd[1] = offset - 7;
+	cmd[2] = 0x00;
+
+	ret = aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+	if (ret < 0)
+		return ret;
+
+	cmd[0] = AAEON_MCU_WRITE_GPIO;
+	/* cmd[1] = offset - 7; */
+	cmd[2] = !!value;
+
+	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+}
+
+static int aaeon_mcu_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+	int ret;
+
+	if (offset < MAX_GPOS)
+		return 0;
+
+	ret = aaeon_mcu_gpio_config_output_cmd(data, offset, value);
+	if (ret < 0)
+		return ret;
+
+	clear_bit(offset, data->dir_in);
+
+	return 0;
+}
+
+static int aaeon_mcu_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+
+	return test_bit(offset, data->dir_in) ?
+		GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
+}
+
+static int aaeon_mcu_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+	u8 cmd[3], rsp;
+	int ret;
+
+	if (offset < MAX_GPOS)
+		return test_bit(offset, data->gpo_state);
+
+	cmd[0] = AAEON_MCU_READ_GPIO;
+	cmd[1] = offset - 7;
+	cmd[2] = 0x00;
+
+	ret = aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+	if (ret < 0)
+		return ret;
+
+	return rsp;
+}
+
+static int aaeon_mcu_gpo_set_cmd(struct aaeon_mcu_gpio *data, unsigned int offset, int value)
+{
+	u8 cmd[3], rsp;
+
+	cmd[0] = AAEON_MCU_CONTROL_GPO;
+	cmd[1] = offset + 1;
+	cmd[2] = !!value;
+
+	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+}
+
+static int aaeon_mcu_gpio_set_cmd(struct aaeon_mcu_gpio *data, unsigned int offset, int value)
+{
+	u8 cmd[3], rsp;
+
+	cmd[0] = AAEON_MCU_WRITE_GPIO;
+	cmd[1] = offset - 7;
+	cmd[2] = !!value;
+
+	return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
+}
+
+static int aaeon_mcu_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int value)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+
+	if (offset < MAX_GPOS) {
+		if (aaeon_mcu_gpo_set_cmd(data, offset, value) == 0)
+			assign_bit(offset, data->gpo_state, value);
+	} else {
+		return aaeon_mcu_gpio_set_cmd(data, offset, value);
+	}
+	return 0;
+}
+
+static const struct gpio_chip aaeon_mcu_chip = {
+	.label			= "gpio-aaeon-mcu",
+	.owner			= THIS_MODULE,
+	.get_direction		= aaeon_mcu_gpio_get_direction,
+	.direction_input	= aaeon_mcu_gpio_direction_input,
+	.direction_output	= aaeon_mcu_gpio_direction_output,
+	.get			= aaeon_mcu_gpio_get,
+	.set			= aaeon_mcu_gpio_set,
+	.base			= -1,
+	.ngpio			= MAX_GPOS + MAX_GPIOS,
+	.can_sleep		= true,
+};
+
+static void aaeon_mcu_gpio_reset(struct aaeon_mcu_gpio *data, struct device *dev)
+{
+	unsigned int i;
+	int ret;
+
+	/* Reset all GPOs */
+	for (i = 0; i < MAX_GPOS; i++) {
+		ret = aaeon_mcu_gpo_set_cmd(data, i, 0);
+		if (ret < 0)
+			dev_warn(dev, "Failed to reset GPO %u state: %d\n", i, ret);
+		clear_bit(i, data->dir_in);
+	}
+
+	/* Reset all GPIOs */
+	for (i = MAX_GPOS; i < MAX_GPOS + MAX_GPIOS; i++) {
+		ret = aaeon_mcu_gpio_config_input_cmd(data, i);
+		if (ret < 0)
+			dev_warn(dev, "Failed to reset GPIO %u state: %d\n", i, ret);
+		set_bit(i, data->dir_in);
+	}
+}
+
+static int aaeon_mcu_gpio_probe(struct platform_device *pdev)
+{
+	struct aaeon_mcu_dev *mfd = dev_get_drvdata(pdev->dev.parent);
+	struct aaeon_mcu_gpio *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->mfd = mfd;
+	data->gc = aaeon_mcu_chip;
+	data->gc.parent = &pdev->dev;
+
+	/*
+	 * Reset all GPIO states to a known configuration. The MCU does not
+	 * reset GPIO state on soft reboot, only on power cycle (hard reboot).
+	 * Without this reset, GPIOs would retain their previous state across
+	 * reboots, which could lead to unexpected behavior.
+	 */
+	aaeon_mcu_gpio_reset(data, &pdev->dev);
+
+	platform_set_drvdata(pdev, data);
+
+	return devm_gpiochip_add_data(&pdev->dev, &data->gc,
+				      data);
+}
+
+static const struct of_device_id aaeon_mcu_gpio_of_match[] = {
+	{ .compatible = "aaeon,srg-imx8pl-gpio" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, aaeon_mcu_gpio_of_match);
+
+static struct platform_driver aaeon_mcu_gpio_driver = {
+	.driver = {
+		.name = "aaeon-mcu-gpio",
+		.of_match_table = aaeon_mcu_gpio_of_match,
+	},
+	.probe = aaeon_mcu_gpio_probe,
+};
+
+module_platform_driver(aaeon_mcu_gpio_driver);
+
+MODULE_DESCRIPTION("GPIO interface for Aaeon MCU");
+MODULE_AUTHOR("Jérémie Dautherbes <jeremie.dautheribes@bootlin.com>");
+MODULE_LICENSE("GPL");

-- 
2.52.0


