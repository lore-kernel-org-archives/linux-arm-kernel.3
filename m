Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36312C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 00:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAweAZg4dWwJLo+81vLYXM1tyKY29Oi765eX3QjZTKI=; b=y2ZnHDvlGH5y6cjC/+jTBMnpf3
	6L429UwdgNlMzf7sXkVa+4ol2cOKUxCxO6ZwrhH/SZVOoX5Qgt9zO/6L8tMoCzZ8fS19L1h1E4KxW
	pp/5OHY8yXMg1OGAzmSOql6DTglE6eIPIrPB2M5CQ+De32YN+vX7osmC38u+oFmYjNDl6Sy5BPaJ3
	piRqYWHfd7/7lYEV80/w9gqs2NPDcJqJI9W3WhQidCSvHFkRC7BDazoEwfKXq3raO5xFap4+PFn3t
	aZ0ohM6+zyfrvvtLwTP9Xs15d52wfctEcXp8PczLpW60wf7CW3CGJZyB4hIFtahnTe6kNRTTi/er8
	FbmpTXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQJl-00000003BXr-47AZ;
	Mon, 09 Jun 2025 00:24:49 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQHe-00000003BU2-17Hv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 00:22:39 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bFshL00cwz9tJR;
	Mon,  9 Jun 2025 02:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749427698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAweAZg4dWwJLo+81vLYXM1tyKY29Oi765eX3QjZTKI=;
	b=CXern0UQ49VkOu8XOKrXfmR6v/coq2kSf3PWwSIaII+MXEGSCG3hLXp9DuLPBM8Jx0ghoy
	Eyo8HErEg8ONWwYr3w02JM1yQjTdOEEElcwoasJte9WGmb5zLW3HI0MfUqvk/XLP6EG5UZ
	hqaq508IMI94MDgFGkkITbkEzK5d3drGjsPw7MG55NJvbS5YP9BSDI1gR+rl/sHkGyxxWk
	bdfck0g1NIprJRMBRuj/K9Xm7vN5ja/pACTH5NqnWB1QHqoHEX8VCuCZV2ibEyHg3uNCex
	3paHTIa6wOAZkexqDux3S1Bm/OIuJfSQmztfyPzluiyYPqXUvJ9H5+SOXbnsxQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749427695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAweAZg4dWwJLo+81vLYXM1tyKY29Oi765eX3QjZTKI=;
	b=JN8MuGZ2zHoYDSldhkUbm0bT+R3x6OXBRHszcUuq2gbi8URXguzRlPKao7JSYtyeDsM7Fv
	PdGAEbnbdrjmFSTVZvozN9LHheJqJk4LYOJ7zxcAMkzTGTsVEptZiZaM7EZIaOSPoH3UZj
	8hWoTiHby8aXvOwVNEtLqo+rKjsjFP1Evr6MWy0lXOKctViLvKjGGSL67r4DZ/+1pH3+vx
	DxI0aHhLR4bGzBXivFlzYEhjCKbYSxKsl4/235TdwmlfLEoSAXatWxxXdYb35fG1ZTMv/3
	bLq9Wjuu6D1fPsYJZpBc+6bl1OQfrnvHufPxIqYcW6vL7gDHMfQs1zvghYbE5Q==
To: linux-arm-kernel@lists.infradead.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH 2/2] regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280
Date: Mon,  9 Jun 2025 02:06:42 +0200
Message-ID: <20250609000748.1665219-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
References: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3e13s6q4d7cfa54f788cuqtm8x3ot3qg
X-MBO-RS-ID: a313380a87c061665cd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_172238_447482_ABFE3012 
X-CRM114-Status: GOOD (  23.26  )
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Add regulator for the 7" Raspberry Pi 720x1280 DSI panel based on ili9881.
This is the Raspberry Pi DSI Panel V2. The newer Raspberry Pi 5" and 7"
panels have a slightly different register map to the original one. Add a
new driver for this "regulator" chip, this time by exposing two GPIOs and
one PWM controller, both of which can be consumed by panel driver and
pwm-backlight respectively.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Loosely based on:
https://github.com/raspberrypi/linux 3c07b87e877e ("regulator: Add a regulator for the new LCD panels")]
https://github.com/raspberrypi/linux 68c59b9e6275 ("regulator: rpi_panel_v2: Add remove and shutdown hooks")]
---
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
---
 drivers/regulator/Kconfig                  |  10 ++
 drivers/regulator/Makefile                 |   1 +
 drivers/regulator/rpi-panel-v2-regulator.c | 114 +++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 drivers/regulator/rpi-panel-v2-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 6d8988387da4..21ad6d938e4d 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1153,6 +1153,16 @@ config REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
 	  touchscreen unit. The regulator is used to enable power to the
 	  TC358762, display and to control backlight.
 
+config REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2
+	tristate "Raspberry Pi 7-inch touchscreen panel V2 regulator"
+	depends on I2C
+	select GPIO_REGMAP
+	select REGMAP_I2C
+	help
+	  This driver supports regulator on the V2 Raspberry Pi touchscreen
+	  unit. The regulator is used to enable power to the display and to
+	  control backlight PWM.
+
 config REGULATOR_RC5T583
 	tristate "RICOH RC5T583 Power regulators"
 	depends on MFD_RC5T583
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index c0bc7a0f4e67..be98b29d6675 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -136,6 +136,7 @@ obj-$(CONFIG_REGULATOR_PBIAS) += pbias-regulator.o
 obj-$(CONFIG_REGULATOR_PCAP) += pcap-regulator.o
 obj-$(CONFIG_REGULATOR_RAA215300) += raa215300.o
 obj-$(CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY)  += rpi-panel-attiny-regulator.o
+obj-$(CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2)  += rpi-panel-v2-regulator.o
 obj-$(CONFIG_REGULATOR_RC5T583)  += rc5t583-regulator.o
 obj-$(CONFIG_REGULATOR_RK808)   += rk808-regulator.o
 obj-$(CONFIG_REGULATOR_RN5T618) += rn5t618-regulator.o
diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
new file mode 100644
index 000000000000..b77383584a3a
--- /dev/null
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Raspberry Pi Ltd.
+ * Copyright (C) 2025 Marek Vasut
+ */
+
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+
+/* I2C registers of the microcontroller. */
+#define REG_ID		0x01
+#define REG_POWERON	0x02
+#define REG_PWM		0x03
+
+/* Bits for poweron register */
+#define LCD_RESET_BIT	BIT(0)
+#define CTP_RESET_BIT	BIT(1)
+
+/* Bits for the PWM register */
+#define PWM_BL_ENABLE	BIT(7)
+#define PWM_BL_MASK	GENMASK(4, 0)
+
+/* Treat LCD_RESET and CTP_RESET as GPIOs */
+#define NUM_GPIO	2
+
+static const struct regmap_config rpi_panel_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = REG_PWM,
+	.can_sleep = true,
+};
+
+static int rpi_panel_v2_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+				  const struct pwm_state *state)
+{
+	struct regmap *regmap = pwmchip_get_drvdata(chip);
+	unsigned int duty;
+
+	if (state->polarity != PWM_POLARITY_NORMAL)
+		return -EINVAL;
+
+	if (!state->enabled)
+		return regmap_write(regmap, REG_PWM, 0);
+
+	duty = pwm_get_relative_duty_cycle(state, PWM_BL_MASK);
+	return regmap_write(regmap, REG_PWM, duty | PWM_BL_ENABLE);
+}
+
+static const struct pwm_ops rpi_panel_v2_pwm_ops = {
+	.apply = rpi_panel_v2_pwm_apply,
+};
+
+/*
+ * I2C driver interface functions
+ */
+static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
+{
+	struct gpio_regmap_config gconfig = {
+		.ngpio		= NUM_GPIO,
+		.ngpio_per_reg	= NUM_GPIO,
+		.parent		= &i2c->dev,
+		.reg_set_base	= REG_POWERON,
+	};
+	struct regmap *regmap;
+	struct pwm_chip *pc;
+	int ret;
+
+	pc = devm_pwmchip_alloc(&i2c->dev, 1, 0);
+	if (IS_ERR(pc))
+		return PTR_ERR(pc);
+
+	pc->ops = &rpi_panel_v2_pwm_ops;
+
+	regmap = devm_regmap_init_i2c(i2c, &rpi_panel_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&i2c->dev, PTR_ERR(regmap), "Failed to allocate regmap\n");
+
+	pwmchip_set_drvdata(pc, regmap);
+
+	regmap_write(regmap, REG_POWERON, 0);
+
+	gconfig.regmap = regmap;
+	ret = PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&i2c->dev, &gconfig));
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret, "Failed to create gpiochip\n");
+
+	return devm_pwmchip_add(&i2c->dev, pc);
+}
+
+static const struct of_device_id rpi_panel_v2_dt_ids[] = {
+	{ .compatible = "raspberrypi,touchscreen-panel-regulator-v2" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, rpi_panel_v2_dt_ids);
+
+static struct i2c_driver rpi_panel_v2_regulator_driver = {
+	.driver = {
+		.name = "rpi_touchscreen_v2",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = of_match_ptr(rpi_panel_v2_dt_ids),
+	},
+	.probe = rpi_panel_v2_i2c_probe,
+};
+
+module_i2c_driver(rpi_panel_v2_regulator_driver);
+
+MODULE_AUTHOR("Dave Stevenson <dave.stevenson@raspberrypi.com>");
+MODULE_DESCRIPTION("Regulator device driver for Raspberry Pi 7-inch V2 touchscreen");
+MODULE_LICENSE("GPL");
-- 
2.47.2


