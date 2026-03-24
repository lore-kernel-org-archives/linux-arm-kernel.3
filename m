Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F20CFEC0F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=965oKsqPDXZ5lcp7Yx51ep8Jv2s0H2ArfAjccQU4GKk=; b=Q1t7d2Oi2atHvIMkF1qbWr/T9g
	ZgEy16WUskUxyon0eHq0TqVqAIyaqC2yLG2dhR2mddcpTkyTdZ+rUw9fEaBB662/Wi8/tffAQomA3
	WlSOkOxsvhyG/w++MKoRNbJ8UEp0peoJ8wdYz8zgo/g/qc3r5awUg461ypAspyjHVndxsaUrecYG+
	m+sDkh5g1pgrThF2LhJxE0nMAgD4vNKsgFVOriql25s7LVOitCX2D3WeDhiCt8usw3q8VGIjDu+c2
	Ck13hLHFtaJ10J+tkL1gGQy+2659H8Cb9n4iN9fglLakE6HtTWi8FxPMtYVR32SQZPIn6H6zqWqp2
	qHgZ+8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57N8-000000028zk-35XR;
	Tue, 24 Mar 2026 19:25:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57N4-000000028wH-0psC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 19:24:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C24B04E427DD;
	Tue, 24 Mar 2026 19:24:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 978FC601A0;
	Tue, 24 Mar 2026 19:24:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22377104510FD;
	Tue, 24 Mar 2026 20:24:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774380295; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=965oKsqPDXZ5lcp7Yx51ep8Jv2s0H2ArfAjccQU4GKk=;
	b=uRCM72zo8lBaGeHFDWQqQcDXat0HwdCI/rktBpcoJDyPw5MpuuTMKdrVWUIJv8bh1qy1ie
	SagFkMWqyWvYGJ75TPsAwQiDohi9yEtJajWvw45VtK3z1OyXjzmegZkk+hvaXuhWJwnDY3
	aQ5/sQ8q69KblBRCVFT5VwKRu+oyjvfBnanSEdr6sGyOFdmIIK/2+NpQwtUAlXKqptNED8
	lbRuO7nZhX88MqsD8bUSt2gZnG6BCTy+3Ar64+kpXISmV5KVg2Jp7+/hVugkCnQZ1XKP9t
	aE+q0xy+fCjZe82BF0q37DMMDg1pQrxoHcEmwJtAuFZ1H8NdhVNqUGQez6Fpug==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Tue, 24 Mar 2026 20:24:30 +0100
Subject: [PATCH v4 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260324-dev-b4-aaeon-mcu-driver-v4-4-afb011df4794@bootlin.com>
References: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
In-Reply-To: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9364;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=eFqla8qPpbYDWPfac3s+lPB3ga1v1YuIUFaJz8wk9x8=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpwuT2L/PghhQJMkl5WqxEFd5XhqPGcAepndyP1
 USKyEeRCNGJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCacLk9gAKCRCfwAsFcf4K
 7fqaDACdg7UlBACv3+rQH4K5eVI0/UYkC0f+pAl6jo7knsBGrTa/sEowEskup8tBPz/HvIzSL4g
 aZaGGLjQ6/pcyaOcAG85/gz0qjWRt7q3OHpTjtc2z5KSNmXtlAuKpbxLWEYViS1Z5YRs+5j/OjK
 fQ4cNEYf5t/+92agfXSGiN1qFUzGePvOelIFGWHFr9L7MqsPaumkSyzwJEnKxmaHm4okBlhbvAJ
 6zfOueLCCqsxSYFsgqo8fXOVviQOUG/v61i4rqvDCp0VfHZKfneG9Wnla2xl4Ztc4orsHQ7onls
 +xl2VeQ3gHxjC79klM16WQeG77hLXg7ymy3R0J7sucjhcGiZssC3WrzetaJNq/MQmnsLCS0Hv/k
 Tmo0Q0uwRQbkJC0SlbFuCUb2E3pQEUUGjhZOffxz/dFeukzlSP3vizwKcpj3z5/Dtz6nKvxrBy6
 LYSKG/UBGVr5nKDNTjNhpQcqPOL4nqiXzhCXNiRUmv2ocvQ34X5lZNrYk9pOd+9Eqg6zo=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_122458_550786_DE3F32F1 
X-CRM114-Status: GOOD (  24.12  )
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

Add GPIO driver for the Aaeon SRG-IMX8P embedded controller. This
driver supports 7 GPO (General Purpose Output) pins and 12 GPIO pins
that can be configured as inputs or outputs.

The driver implements proper state management for GPO pins (which are
output-only) and full direction control for GPIO pins. During probe,
all pins are reset to a known state (GPOs low, GPIOs as inputs) to
prevent undefined behavior across system reboots, as the MCU does not
reset GPIO states on soft reboot.

Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 MAINTAINERS                   |   1 +
 drivers/gpio/Kconfig          |  10 ++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-aaeon-mcu.c | 221 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 233 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f91b6a1826d04bef8a0f88221f6c8e8a3652cd77..2538f8c4bc1482b139e18243a68f0a21b9be3704 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -191,6 +191,7 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
 R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
+F:	drivers/gpio/gpio-aaeon-mcu.c
 F:	drivers/mfd/aaeon-mcu.c
 F:	include/linux/mfd/aaeon-mcu.h
 
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c74da29253e810b51540684b1186e8f274066b69..04285dc77430a5dbdb2d6e03e51bca64a432bf1a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -157,6 +157,16 @@ config GPIO_74XX_MMIO
 	    8 bits:	74244 (Input), 74273 (Output)
 	    16 bits:	741624 (Input), 7416374 (Output)
 
+config GPIO_AAEON_MCU
+	tristate "Aaeon MCU GPIO support"
+	depends on MFD_AAEON_MCU
+	select GPIO_GENERIC
+	help
+	  Select this option to enable GPIO support for the Aaeon SRG-IMX8P
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
index 0000000000000000000000000000000000000000..3b679259a6c66e3113cadc083dc7b4152d070ed5
--- /dev/null
+++ b/drivers/gpio/gpio-aaeon-mcu.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Aaeon MCU GPIO driver
+ *
+ * Copyright (C) 2025 Bootlin
+ * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+ * Author: Thomas Perrot <thomas.perrot@bootlin.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/aaeon-mcu.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define AAEON_MCU_CONFIG_GPIO_INPUT	0x69
+#define AAEON_MCU_CONFIG_GPIO_OUTPUT	0x6F
+#define AAEON_MCU_READ_GPIO		0x72
+#define AAEON_MCU_WRITE_GPIO		0x77
+
+#define AAEON_MCU_CONTROL_GPO		0x6C
+
+#define MAX_GPIOS	12
+#define MAX_GPOS	7
+
+struct aaeon_mcu_gpio {
+	struct gpio_chip gc;
+	struct regmap *regmap;
+	DECLARE_BITMAP(dir_in, MAX_GPOS + MAX_GPIOS);
+	DECLARE_BITMAP(gpo_state, MAX_GPOS);
+};
+
+static int aaeon_mcu_gpio_config_input_cmd(struct aaeon_mcu_gpio *data,
+					   unsigned int offset)
+{
+	return regmap_write(data->regmap,
+			    AAEON_MCU_REG(AAEON_MCU_CONFIG_GPIO_INPUT, offset - 7),
+			    0);
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
+	__set_bit(offset, data->dir_in);
+
+	return 0;
+}
+
+static int aaeon_mcu_gpio_config_output_cmd(struct aaeon_mcu_gpio *data,
+					    unsigned int offset,
+					    int value)
+{
+	int ret;
+
+	ret = regmap_write(data->regmap,
+			   AAEON_MCU_REG(AAEON_MCU_CONFIG_GPIO_OUTPUT, offset - 7),
+			   0);
+	if (ret < 0)
+		return ret;
+
+	return regmap_write(data->regmap,
+			    AAEON_MCU_REG(AAEON_MCU_WRITE_GPIO, offset - 7),
+			    !!value);
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
+	__clear_bit(offset, data->dir_in);
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
+	unsigned int rsp;
+	int ret;
+
+	if (offset < MAX_GPOS)
+		return test_bit(offset, data->gpo_state);
+
+	ret = regmap_read(data->regmap,
+			  AAEON_MCU_REG(AAEON_MCU_READ_GPIO, offset - 7),
+			  &rsp);
+	if (ret < 0)
+		return ret;
+
+	return rsp;
+}
+
+static int aaeon_mcu_gpo_set_cmd(struct aaeon_mcu_gpio *data, unsigned int offset, int value)
+{
+	return regmap_write(data->regmap,
+			    AAEON_MCU_REG(AAEON_MCU_CONTROL_GPO, offset + 1),
+			    !!value);
+}
+
+static int aaeon_mcu_gpio_set_cmd(struct aaeon_mcu_gpio *data, unsigned int offset, int value)
+{
+	return regmap_write(data->regmap,
+			    AAEON_MCU_REG(AAEON_MCU_WRITE_GPIO, offset - 7),
+			    !!value);
+}
+
+static int aaeon_mcu_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int value)
+{
+	struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
+
+	if (offset >= MAX_GPOS)
+		return aaeon_mcu_gpio_set_cmd(data, offset, value);
+
+	if (aaeon_mcu_gpo_set_cmd(data, offset, value) == 0)
+		__assign_bit(offset, data->gpo_state, value);
+
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
+		__clear_bit(i, data->dir_in);
+	}
+
+	/* Reset all GPIOs */
+	for (i = MAX_GPOS; i < MAX_GPOS + MAX_GPIOS; i++) {
+		ret = aaeon_mcu_gpio_config_input_cmd(data, i);
+		if (ret < 0)
+			dev_warn(dev, "Failed to reset GPIO %u state: %d\n", i, ret);
+		__set_bit(i, data->dir_in);
+	}
+}
+
+static int aaeon_mcu_gpio_probe(struct platform_device *pdev)
+{
+	struct aaeon_mcu_gpio *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!data->regmap)
+		return -ENODEV;
+
+	data->gc = aaeon_mcu_chip;
+	data->gc.parent = pdev->dev.parent;
+
+	/*
+	 * Reset all GPIO states to a known configuration. The MCU does not
+	 * reset GPIO state on soft reboot, only on power cycle (hard reboot).
+	 * Without this reset, GPIOs would retain their previous state across
+	 * reboots, which could lead to unexpected behavior.
+	 */
+	aaeon_mcu_gpio_reset(data, &pdev->dev);
+
+	return devm_gpiochip_add_data(&pdev->dev, &data->gc, data);
+}
+
+static struct platform_driver aaeon_mcu_gpio_driver = {
+	.driver = {
+		.name = "aaeon-mcu-gpio",
+	},
+	.probe = aaeon_mcu_gpio_probe,
+};
+module_platform_driver(aaeon_mcu_gpio_driver);
+
+MODULE_DESCRIPTION("GPIO interface for Aaeon MCU");
+MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
+MODULE_LICENSE("GPL");

-- 
2.53.0


