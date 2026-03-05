Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592A8F47CBA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlfBZBfy+QU0L5O0GfwIiyS7VHoS5h2DdaD1PoGMWjQ=; b=mVaE6X87eTRit6uD8XZ06vbHBm
	K48wA6P5mGxUPqTyZgT8BnEg23YxHESuXo+jXx5xatfN2wrZmXtgB8lu6LD1s0Ua+tj6bitkUHT/F
	wve/h5q/FNAEHvl+ydsUj/dngqE8fSSCcix11D8/8hSNbAzrftsWtasu4FWEFprm48rJe3FNNNO5L
	DKOrcHZL5c5EuyzEfRCr/BIYYtrOAARqZxC5h4jhdQVar337cxOsGg2yX1wuhD7vrKzSao4HqY9nf
	+IK88acR73vzwYvzSVrzmFa8p2pZe3T+k7/kMl6CxrLpEyc2wpmGknCxNu0kvmLWOybz8FouRUMpl
	WTZo5yFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEGE-00000002RYs-0zTB;
	Thu, 05 Mar 2026 19:21:26 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEG7-00000002RTG-4AEu;
	Thu, 05 Mar 2026 19:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=WlfBZBfy+QU0L5O0GfwIiyS7VHoS5h2DdaD1PoGMWjQ=; b=LtbZ9HE8PfLmg+8ZtFQJ7gKPl6
	oDCcuFVArfuggzBHNPxs+reOS5f+lnHjpT5E3r+CM/yoBdGZeOoUNhLuY8Eyka8OnK6yIs3zdBxCT
	ZE4vDm8jeU6HhzwL+mI0jNU9olHRlNrzynyCJeAOWTajCBkqGBK4A9j7oCjSyk5uLcCQ=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:42592 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyEG1-0002na-W4; Thu, 05 Mar 2026 14:21:15 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robin@protonic.nl,
	andy@kernel.org,
	geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	hvilleneuve@dimonoff.com,
	mkorpershoek@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lee@kernel.org,
	alexander.sverdlin@gmail.com,
	marek.vasut@gmail.com,
	akurz@blala.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	hugo@hugovil.com
Date: Thu,  5 Mar 2026 14:20:50 -0500
Message-ID: <20260305192101.2125660-5-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305192101.2125660-1-hugo@hugovil.com>
References: <20260305192101.2125660-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: [PATCH v4 4/4] Input: charlieplex_keypad: add GPIO charlieplex keypad
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_112120_137700_6C638481 
X-CRM114-Status: GOOD (  26.46  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Add support for GPIO-based charlieplex keypad, allowing to control
N^2-N keys using N GPIO lines.

Reuse matrix keypad keymap to simplify, even if there is no concept
of rows and columns in this type of keyboard.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 MAINTAINERS                                 |   7 +
 drivers/input/keyboard/Kconfig              |  14 ++
 drivers/input/keyboard/Makefile             |   1 +
 drivers/input/keyboard/charlieplex_keypad.c | 214 ++++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 drivers/input/keyboard/charlieplex_keypad.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ed6d11a77466..0b2d71f32b400 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5765,6 +5765,13 @@ S:	Maintained
 F:	Documentation/hwmon/powerz.rst
 F:	drivers/hwmon/powerz.c
 
+CHARLIEPLEX KEYPAD DRIVER
+M:	Hugo Villeneuve <hvilleneuve@dimonoff.com>
+S:	Supported
+W:	http://www.mosaic-industries.com/embedded-systems/microcontroller-projects/electronic-circuits/matrix-keypad-scan-decode
+F:	Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
+F:	drivers/input/keyboard/charlieplex_keypad.c
+
 CHECKPATCH
 M:	Andy Whitcroft <apw@canonical.com>
 M:	Joe Perches <joe@perches.com>
diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 2ff4fef322c24..ae54b4b7e2d8a 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -289,6 +289,20 @@ config KEYBOARD_MATRIX
 	  To compile this driver as a module, choose M here: the
 	  module will be called matrix_keypad.
 
+config KEYBOARD_CHARLIEPLEX
+	tristate "GPIO driven chearlieplex keypad support"
+	depends on GPIOLIB || COMPILE_TEST
+	select INPUT_MATRIXKMAP
+	help
+	  Enable support for GPIO driven charlieplex keypad. A charlieplex
+	  keypad allows to use fewer GPIO lines to interface to key switches.
+	  For example, an N lines charlieplex keypad can be used to interface
+	  to N^2-N different key switches. However, this type of keypad
+	  cannot detect more than one key press at a time.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called charlieplex_keypad.
+
 config KEYBOARD_HIL_OLD
 	tristate "HP HIL keyboard support (simple driver)"
 	depends on GSC || HP300
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index 2d906e14f3e27..40b5cf5d374d2 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_KEYBOARD_LOCOMO)		+= locomokbd.o
 obj-$(CONFIG_KEYBOARD_LPC32XX)		+= lpc32xx-keys.o
 obj-$(CONFIG_KEYBOARD_MAPLE)		+= maple_keyb.o
 obj-$(CONFIG_KEYBOARD_MATRIX)		+= matrix_keypad.o
+obj-$(CONFIG_KEYBOARD_CHARLIEPLEX)	+= charlieplex_keypad.o
 obj-$(CONFIG_KEYBOARD_MAX7359)		+= max7359_keypad.o
 obj-$(CONFIG_KEYBOARD_MAX7360)		+= max7360-keypad.o
 obj-$(CONFIG_KEYBOARD_MPR121)		+= mpr121_touchkey.o
diff --git a/drivers/input/keyboard/charlieplex_keypad.c b/drivers/input/keyboard/charlieplex_keypad.c
new file mode 100644
index 0000000000000..53d6060e83fe9
--- /dev/null
+++ b/drivers/input/keyboard/charlieplex_keypad.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * GPIO driven charlieplex keypad driver
+ *
+ * Copyright (c) 2025 Hugo Villeneuve <hvilleneuve@dimonoff.com>
+ *
+ * Based on matrix_keyboard.c
+ */
+
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/input.h>
+#include <linux/input/matrix_keypad.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/types.h>
+
+struct charlieplex_keypad {
+	struct input_dev *input_dev;
+	struct gpio_descs *line_gpios;
+	unsigned int nlines;
+	unsigned int settling_time_us;
+	unsigned int debounce_threshold;
+	unsigned int debounce_count;
+	int debounce_code;
+	int current_code;
+};
+
+static void charlieplex_keypad_report_key(struct input_dev *input)
+{
+	struct charlieplex_keypad *keypad = input_get_drvdata(input);
+	const unsigned short *keycodes = input->keycode;
+
+	if (keypad->current_code > 0) {
+		input_event(input, EV_MSC, MSC_SCAN, keypad->current_code);
+		input_report_key(input, keycodes[keypad->current_code], 0);
+	}
+
+	if (keypad->debounce_code) {
+		input_event(input, EV_MSC, MSC_SCAN, keypad->debounce_code);
+		input_report_key(input, keycodes[keypad->debounce_code], 1);
+	}
+
+	input_sync(input);
+	keypad->current_code = keypad->debounce_code;
+}
+
+static void charlieplex_keypad_check_switch_change(struct input_dev *input,
+						   int code)
+{
+	struct charlieplex_keypad *keypad = input_get_drvdata(input);
+
+	if (code != keypad->debounce_code) {
+		keypad->debounce_count = 0;
+		keypad->debounce_code = code;
+	} else if (keypad->debounce_count < keypad->debounce_threshold) {
+		keypad->debounce_count++;
+
+		if (keypad->debounce_count >= keypad->debounce_threshold &&
+		    keypad->debounce_code != keypad->current_code)
+			charlieplex_keypad_report_key(input);
+	}
+}
+
+static void charlieplex_keypad_poll(struct input_dev *input)
+{
+	struct charlieplex_keypad *keypad = input_get_drvdata(input);
+	int oline;
+	int code;
+
+	for (code = 0, oline = 0; oline < keypad->nlines; oline++) {
+		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
+		int iline;
+		int err;
+
+		/* Activate only one line as output at a time. */
+		gpiod_direction_output(keypad->line_gpios->desc[oline], 1);
+
+		if (keypad->settling_time_us)
+			fsleep(keypad->settling_time_us);
+
+		/* Read input on all other lines. */
+		err = gpiod_get_array_value_cansleep(keypad->line_gpios->ndescs,
+						     keypad->line_gpios->desc,
+						     keypad->line_gpios->info, values);
+		if (err)
+			return;
+
+		for (iline = 0; iline < keypad->nlines; iline++) {
+			if (iline == oline)
+				continue; /* Do not read active output line. */
+
+			/* Check if GPIO is asserted. */
+			if (test_bit(iline, values)) {
+				code = MATRIX_SCAN_CODE(oline, iline,
+							get_count_order(keypad->nlines));
+				/*
+				 * Exit loop immediately since we cannot detect
+				 * more than one key press at a time.
+				 */
+				break;
+			}
+		}
+
+		gpiod_direction_input(keypad->line_gpios->desc[oline]);
+
+		if (code)
+			break;
+	}
+
+	charlieplex_keypad_check_switch_change(input, code);
+}
+
+static int charlieplex_keypad_init_gpio(struct platform_device *pdev,
+					struct charlieplex_keypad *keypad)
+{
+	keypad->line_gpios = devm_gpiod_get_array(&pdev->dev, "line", GPIOD_IN);
+	if (IS_ERR(keypad->line_gpios))
+		return PTR_ERR(keypad->line_gpios);
+
+	keypad->nlines = keypad->line_gpios->ndescs;
+
+	if (keypad->nlines > MATRIX_MAX_ROWS)
+		return -EINVAL;
+
+	for (unsigned int i = 0; i < keypad->nlines; i++)
+		gpiod_set_consumer_name(keypad->line_gpios->desc[i], "charlieplex_kbd_line");
+
+	return 0;
+}
+
+static int charlieplex_keypad_probe(struct platform_device *pdev)
+{
+	struct charlieplex_keypad *keypad;
+	unsigned int debounce_interval_ms;
+	unsigned int poll_interval_ms;
+	struct input_dev *input_dev;
+	int err;
+
+	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
+	if (!keypad)
+		return -ENOMEM;
+
+	input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	keypad->input_dev = input_dev;
+
+	device_property_read_u32(&pdev->dev, "poll-interval", &poll_interval_ms);
+	device_property_read_u32(&pdev->dev, "debounce-delay-ms", &debounce_interval_ms);
+	device_property_read_u32(&pdev->dev, "settling-time-us", &keypad->settling_time_us);
+
+	keypad->current_code = -1;
+	keypad->debounce_code = -1;
+	keypad->debounce_threshold = DIV_ROUND_UP(debounce_interval_ms, poll_interval_ms);
+
+	err = charlieplex_keypad_init_gpio(pdev, keypad);
+	if (err)
+		return err;
+
+	input_dev->name		= pdev->name;
+	input_dev->id.bustype	= BUS_HOST;
+
+	err = matrix_keypad_build_keymap(NULL, NULL, keypad->nlines,
+					 keypad->nlines, NULL, input_dev);
+	if (err)
+		dev_err_probe(&pdev->dev, -ENOMEM, "failed to build keymap\n");
+
+	if (device_property_read_bool(&pdev->dev, "autorepeat"))
+		__set_bit(EV_REP, input_dev->evbit);
+
+	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
+
+	err = input_setup_polling(input_dev, charlieplex_keypad_poll);
+	if (err)
+		dev_err_probe(&pdev->dev, err, "unable to set up polling\n");
+
+	input_set_poll_interval(input_dev, poll_interval_ms);
+
+	input_set_drvdata(input_dev, keypad);
+
+	err = input_register_device(keypad->input_dev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static const struct of_device_id charlieplex_keypad_dt_match[] = {
+	{ .compatible = "gpio-charlieplex-keypad" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, charlieplex_keypad_dt_match);
+
+static struct platform_driver charlieplex_keypad_driver = {
+	.probe		= charlieplex_keypad_probe,
+	.driver		= {
+		.name	= "charlieplex-keypad",
+		.of_match_table = charlieplex_keypad_dt_match,
+	},
+};
+module_platform_driver(charlieplex_keypad_driver);
+
+MODULE_AUTHOR("Hugo Villeneuve <hvilleneuve@dimonoff.com>");
+MODULE_DESCRIPTION("GPIO driven charlieplex keypad driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3


