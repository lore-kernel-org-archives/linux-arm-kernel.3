Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D769C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFmbK55pvIxEu417n/WZzBKXJOdI+2ERSD0oPB4zYoE=; b=DKu4J8UYV4UvYUZdx37Q6v8ERZ
	SryTITb/ajj7w1ZXCfxuFQOS+lFT8ZkNAMsBmUrERD4LMQGZ2NJFrUVMNe6ZQc7t/DGLyrz0ZwGIH
	9o2BMc7TOGfbcxO4cqcEeH6F2+D5MAyU+zcly6S8QVtNopTKqkayOEXHzk3+CSKUuwzEjTh8aWJnr
	/G88UuR+iAvHK7DiA/eKvYejuYW8DdRwQkxBF2gTQ9mK0w3Yw4nToBveIZbCoAjlPASA04g0IWXv+
	LWuQMK1G8bqBGQ9x8SUJ7STZGsP9KZG7RCrVp6K9Tqvf+kH07bX7MtCHiJlQ3Eno3KkKymGgPvcbe
	lxKTx83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBA0M-00000003kJZ-0JnN;
	Sat, 03 May 2025 10:21:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB9m9-00000003iwb-38QG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 10:07:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB4EFA4AC20;
	Sat,  3 May 2025 10:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB924C4CEFB;
	Sat,  3 May 2025 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746266836;
	bh=W5v4ILEWqwYup4TO+1wngMEiHTv2uO2HibHXWAT5/0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VeMXClSayvJbyxO5B5imez9AgCW7Vaq8ZK6aFxHvr3IgEDBEpgd31aojpp0LUWjf/
	 HHiMSc90vsIfZYZw6L/BABWeec53HXVuuXNzKD+o7GUhCQkPzsY9YPCirz2vDjp7RN
	 osbys+Vc5UpLDztWUyzMzsjF9t/rdzhVAjlxdLOWJpZ55bZDQF7zaABtSJOcemXYHj
	 Wz99oOwUcmJM3zrOUDJHlBY/LXGfsq/lQoa/s1Q4vp39ARW445tfjO0T+53d5TRcm3
	 obm1eIQKRuAs7T2dO+xhCpQcQ7PZcjIT6iZB7BzV8WpITS+tfySR8YNB9wnZCMMzZZ
	 1SMY5xzYszUHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E324CC3ABB0;
	Sat,  3 May 2025 10:07:15 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 03 May 2025 10:06:52 +0000
Subject: [PATCH v4 5/9] gpio: Add new gpio-macsmc driver for Apple Macs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-smc-6-15-v4-5-500b9b6546fc@svenpeter.dev>
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
In-Reply-To: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9874; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=sBsBGWttfmg7jpQNav+7mHxAFPoaCZSWN9SXvWfj1Fo=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4boq1N3F79aP7X97GLrZqHN8h7Juhua7yzJ4uf9LeMi0
 RwRcsK3o5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRZyoM/z3u+mjlRfE78Sz9
 dGQV33OPkuuXv4bfdZwrwGpats3xwW+Gf2aFrbrzTseVNqQWpLnf3h50wOD5oWV7tpzuFFx8/O3
 bXHYA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_030717_922914_DD30A5EE 
X-CRM114-Status: GOOD (  30.62  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

This driver implements the GPIO service on top of the SMC framework
on Apple Mac machines. In particular, these are the GPIOs present in the
PMU IC which are used to control power to certain on-board devices.

Although the underlying hardware supports various pin config settings
(input/output, open drain, etc.), this driver does not implement that
functionality and leaves it up to the firmware to configure things
properly. We also don't yet support interrupts/events. This is
sufficient for device power control, which is the only thing we need to
support at this point. More features will be implemented when needed.

To our knowledge, only Apple Silicon Macs implement this SMC feature.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 MAINTAINERS                |   1 +
 drivers/gpio/Kconfig       |  10 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-macsmc.c | 246 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 258 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 831df43892a64c95e00c24d77b8aa2a6ec87e074..5a52d5ada993c1b339fe1bdd1cda532faeeb9749 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2293,6 +2293,7 @@ F:	drivers/bluetooth/hci_bcm4377.c
 F:	drivers/clk/clk-apple-nco.c
 F:	drivers/cpufreq/apple-soc-cpufreq.c
 F:	drivers/dma/apple-admac.c
+F:	drivers/gpio/gpio-macsmc.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f2c39bbff83a33dcb12b2d32aa3ebc358a0dd949..f0e25105f8ebe7356344722987333a9fc244ea1f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1440,6 +1440,16 @@ config GPIO_LP87565
 	  This driver can also be built as a module. If so, the module will be
 	  called gpio-lp87565.
 
+config GPIO_MACSMC
+	tristate "Apple Mac SMC GPIO"
+	depends on MFD_MACSMC
+	help
+	  Support for GPIOs controlled by the SMC microcontroller on Apple Mac
+	  systems.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called gpio-macsmc.
+
 config GPIO_MADERA
 	tristate "Cirrus Logic Madera class codecs"
 	depends on PINCTRL_MADERA
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index af130882ffeeef8b1d518867bfe1493ec4f21b5f..c2e47f356bfae73384ace8103074f246e49fb9d6 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -97,6 +97,7 @@ obj-$(CONFIG_GPIO_LP873X)		+= gpio-lp873x.o
 obj-$(CONFIG_GPIO_LP87565)		+= gpio-lp87565.o
 obj-$(CONFIG_GPIO_LPC18XX)		+= gpio-lpc18xx.o
 obj-$(CONFIG_GPIO_LPC32XX)		+= gpio-lpc32xx.o
+obj-$(CONFIG_GPIO_MACSMC)		+= gpio-macsmc.o
 obj-$(CONFIG_GPIO_MADERA)		+= gpio-madera.o
 obj-$(CONFIG_GPIO_MAX3191X)		+= gpio-max3191x.o
 obj-$(CONFIG_GPIO_MAX7300)		+= gpio-max7300.o
diff --git a/drivers/gpio/gpio-macsmc.c b/drivers/gpio/gpio-macsmc.c
new file mode 100644
index 0000000000000000000000000000000000000000..289be4268f63a45e5156ab54c3ee3b9ff2935556
--- /dev/null
+++ b/drivers/gpio/gpio-macsmc.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Apple SMC GPIO driver
+ * Copyright The Asahi Linux Contributors
+ *
+ * This driver implements basic SMC PMU GPIO support that can read inputs
+ * and write outputs. Mode changes and IRQ config are not yet implemented.
+ */
+
+#include <linux/bitmap.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/macsmc.h>
+
+#define MAX_GPIO 64
+
+/*
+ * Commands 0-6 are, presumably, the intended API.
+ * Command 0xff lets you get/set the pin configuration in detail directly,
+ * but the bit meanings seem not to be stable between devices/PMU hardware
+ * versions.
+ *
+ * We're going to try to make do with the low commands for now.
+ * We don't implement pin mode changes at this time.
+ */
+
+#define CMD_ACTION	(0 << 24)
+#define CMD_OUTPUT	(1 << 24)
+#define CMD_INPUT	(2 << 24)
+#define CMD_PINMODE	(3 << 24)
+#define CMD_IRQ_ENABLE	(4 << 24)
+#define CMD_IRQ_ACK	(5 << 24)
+#define CMD_IRQ_MODE	(6 << 24)
+#define CMD_CONFIG	(0xff << 24)
+
+#define MODE_INPUT	0
+#define MODE_OUTPUT	1
+#define MODE_VALUE_0	0
+#define MODE_VALUE_1	2
+
+#define IRQ_MODE_HIGH		0
+#define IRQ_MODE_LOW		1
+#define IRQ_MODE_RISING		2
+#define IRQ_MODE_FALLING	3
+#define IRQ_MODE_BOTH		4
+
+#define CONFIG_MASK	GENMASK(23, 16)
+#define CONFIG_VAL	GENMASK(7, 0)
+
+#define CONFIG_OUTMODE	GENMASK(7, 6)
+#define CONFIG_IRQMODE	GENMASK(5, 3)
+#define CONFIG_PULLDOWN	BIT(2)
+#define CONFIG_PULLUP	BIT(1)
+#define CONFIG_OUTVAL	BIT(0)
+
+/*
+ * Output modes seem to differ depending on the PMU in use... ?
+ * j274 / M1 (Sera PMU):
+ *   0 = input
+ *   1 = output
+ *   2 = open drain
+ *   3 = disable
+ * j314 / M1Pro (Maverick PMU):
+ *   0 = input
+ *   1 = open drain
+ *   2 = output
+ *   3 = ?
+ */
+
+struct macsmc_gpio {
+	struct device *dev;
+	struct apple_smc *smc;
+	struct gpio_chip gc;
+
+	int first_index;
+};
+
+static int macsmc_gpio_nr(smc_key key)
+{
+	int low = hex_to_bin(key & 0xff);
+	int high = hex_to_bin((key >> 8) & 0xff);
+
+	if (low < 0 || high < 0)
+		return -1;
+
+	return low | (high << 4);
+}
+
+static int macsmc_gpio_key(unsigned int offset)
+{
+	return _SMC_KEY("gP\0\0") | hex_asc_hi(offset) << 8 | hex_asc_lo(offset);
+}
+
+static int macsmc_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+	smc_key key = macsmc_gpio_key(offset);
+	u32 val;
+	int ret;
+
+	/* First try reading the explicit pin mode register */
+	ret = apple_smc_rw_u32(smcgp->smc, key, CMD_PINMODE, &val);
+	if (!ret)
+		return (val & MODE_OUTPUT) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+
+	/*
+	 * Less common IRQ configs cause CMD_PINMODE to fail, and so does open drain mode.
+	 * Fall back to reading IRQ mode, which will only succeed for inputs.
+	 */
+	ret = apple_smc_rw_u32(smcgp->smc, key, CMD_IRQ_MODE, &val);
+	return ret ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int macsmc_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+	smc_key key = macsmc_gpio_key(offset);
+	u32 cmd, val;
+	int ret;
+
+	ret = macsmc_gpio_get_direction(gc, offset);
+	if (ret < 0)
+		return ret;
+
+	if (ret == GPIO_LINE_DIRECTION_OUT)
+		cmd = CMD_OUTPUT;
+	else
+		cmd = CMD_INPUT;
+
+	ret = apple_smc_rw_u32(smcgp->smc, key, cmd, &val);
+	if (ret < 0)
+		return ret;
+
+	return val ? 1 : 0;
+}
+
+static void macsmc_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+	smc_key key = macsmc_gpio_key(offset);
+	int ret;
+
+	value |= CMD_OUTPUT;
+	ret = apple_smc_write_u32(smcgp->smc, key, CMD_OUTPUT | value);
+	if (ret < 0)
+		dev_err(smcgp->dev, "GPIO set failed %p4ch = 0x%x\n",
+			&key, value);
+}
+
+static int macsmc_gpio_init_valid_mask(struct gpio_chip *gc,
+				       unsigned long *valid_mask, unsigned int ngpios)
+{
+	struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
+	int count;
+	int i;
+
+	count = smcgp->smc->key_count;
+	if (count > MAX_GPIO)
+		count = MAX_GPIO;
+
+	bitmap_zero(valid_mask, ngpios);
+
+	for (i = 0; i < count; i++) {
+		int ret, gpio_nr;
+		smc_key key;
+
+		ret = apple_smc_get_key_by_index(smcgp->smc, smcgp->first_index + i, &key);
+		if (ret < 0)
+			return ret;
+
+		if (key > SMC_KEY(gPff))
+			break;
+
+		gpio_nr = macsmc_gpio_nr(key);
+		if (gpio_nr < 0 || gpio_nr > MAX_GPIO) {
+			dev_err(smcgp->dev, "Bad GPIO key %p4ch\n", &key);
+			continue;
+		}
+
+		set_bit(gpio_nr, valid_mask);
+	}
+
+	return 0;
+}
+
+static int macsmc_gpio_probe(struct platform_device *pdev)
+{
+	struct macsmc_gpio *smcgp;
+	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
+	smc_key key;
+	int ret;
+
+	smcgp = devm_kzalloc(&pdev->dev, sizeof(*smcgp), GFP_KERNEL);
+	if (!smcgp)
+		return -ENOMEM;
+
+	smcgp->dev = &pdev->dev;
+	smcgp->smc = smc;
+	smcgp->first_index = apple_smc_find_first_key_index(smc, SMC_KEY(gP00));
+
+	if (smcgp->first_index >= smc->key_count)
+		return -ENODEV;
+
+	ret = apple_smc_get_key_by_index(smc, smcgp->first_index, &key);
+	if (ret < 0)
+		return ret;
+
+	if (key > macsmc_gpio_key(MAX_GPIO - 1))
+		return -ENODEV;
+
+	dev_info(smcgp->dev, "First GPIO key: %p4ch\n", &key);
+
+	smcgp->gc.label = "macsmc-pmu-gpio";
+	smcgp->gc.owner = THIS_MODULE;
+	smcgp->gc.get = macsmc_gpio_get;
+	smcgp->gc.set = macsmc_gpio_set;
+	smcgp->gc.get_direction = macsmc_gpio_get_direction;
+	smcgp->gc.init_valid_mask = macsmc_gpio_init_valid_mask;
+	smcgp->gc.can_sleep = true;
+	smcgp->gc.ngpio = MAX_GPIO;
+	smcgp->gc.base = -1;
+	smcgp->gc.parent = &pdev->dev;
+
+	return devm_gpiochip_add_data(&pdev->dev, &smcgp->gc, smcgp);
+}
+
+static const struct of_device_id macsmc_gpio_of_table[] = {
+	{ .compatible = "apple,smc-gpio", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, macsmc_gpio_of_table);
+
+static struct platform_driver macsmc_gpio_driver = {
+	.driver = {
+		.name = "macsmc-gpio",
+		.of_match_table = macsmc_gpio_of_table,
+	},
+	.probe = macsmc_gpio_probe,
+};
+module_platform_driver(macsmc_gpio_driver);
+
+MODULE_AUTHOR("Hector Martin <marcan@marcan.st>");
+MODULE_LICENSE("Dual MIT/GPL");
+MODULE_DESCRIPTION("Apple SMC GPIO driver");
+MODULE_ALIAS("platform:macsmc-gpio");

-- 
2.34.1



