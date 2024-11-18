Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2FBD49205
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fOyYhW/88qHGGmM9QOYNQJqLo1yTsoyhwIyniU1DSY=; b=fhLwSInkG3rZzSiK4zdVV+SVAX
	oNKjQBr1trQPJ8ZyOFQy46wAZtaG0ziA5I9ns+p6/fqfCD18OBD5mo6LRhp2UEzqqj0ew8XaHN6NM
	cFRdHkRFzN2yr6tCqo46GE4JBXNfWt5y3ERENr5NiSB+HVCwjomgTTTtT84BvJjVE6aeiWfj0hCRS
	mVonpr/uUizM372Rn455a46p2IXBDW2zoB7dGver1nv9BnKI9FBzUBVPp/J+UAU+aQrojpd27aunS
	JmL8RKGvcOB9CHEoUl0G4q5w6gLXeqHNzb/r2HsD7qlb5ppW5EKUOgOfzG+xMAv858RLI2yO5yJ4m
	WbduqIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCykY-000000092BY-0LdM;
	Mon, 18 Nov 2024 10:12:54 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyhp-000000091Pp-11W1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 10:10:06 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so2427506e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 02:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731924603; x=1732529403; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fOyYhW/88qHGGmM9QOYNQJqLo1yTsoyhwIyniU1DSY=;
        b=VwqwQKZUaFjNy+1FKlVUwx/9hA5i+q0FFzL09WvyYkcCLMw7Bwe1Gl00mfeMReqOSH
         Xhz4ii+ainRA32HkQ0YaQU8sNFruKfbY8/ivzFus2kGGKW8haUJoewj8ElF2LEXlGSC1
         xdc70JmsC61Q4IQRp0gSj8s9aPzoLks0+QuY+uQNtu2j9w6l5FrlsMl8EQtZ1iPiW8tC
         ZEPM+CpY7zKzCr6QV5qTwJH0sJxsWyNtH0FKKh57s/GR3y0046nzWl8OTPr+sPUZg9vc
         7W2duPt/pJtAcOY/hf7He3/lt1xhItnZwNhPf8KHZEcApwd4IIJXhC2N3enHDYjAOz5z
         SqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924603; x=1732529403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fOyYhW/88qHGGmM9QOYNQJqLo1yTsoyhwIyniU1DSY=;
        b=EzQ7CrpSQAdOlCFkg02jfWoRT7N3COYwG60YxnoY8hhpJiJlM+XHrgNZLMTtJcQOU0
         4xpxNS7Ui2w5S6+/aYA+6ND/hjpPse/2taUBFKSwmWCHSQDtR8aNdQ1DJGM/ogBr4/pf
         Ng6K6NuaQyFRGOAeXtyIvlqkP7tspMkYdgWaQEvtAbqNrHxiN9BqEuSpzeNAGym4IaSJ
         h75zOzfi16EQe/Mlx0a5C/dLX2Ys/PSkR3Nmxor6xbo8x9gzwBHdDerKmVm5SzE1guBa
         T8rZgsvUm/+mY2WGOGVvbYR9tuPXyo0LzorBjr/LWtvS+wPju1JgDHWsPKBozJlQ8O15
         FwRw==
X-Forwarded-Encrypted: i=1; AJvYcCW6HZOX08D6msxycAfqL5H+fh1cR15XSaAqNw49fAsvC+kEsTzI9gm6uGGQc/E9X5oa5c8YFbKh/criEx+5Z2Yn@lists.infradead.org
X-Gm-Message-State: AOJu0YwidFHh79rjJlrL/dM77OKdtqiVuBhBQEMDQ11bqZEngyW0d153
	bUHuAWoxRUTA7H9R+0myBqk0FA6XkbJFiL0xs7xySRbvNrrIzRF6
X-Google-Smtp-Source: AGHT+IEsM+bEYVWPcdxMX4ty+jlvxNzXr16PKephGvFY1LmTwDkGEiU9Vu06vwaLgV1jjEKcvAJWkw==
X-Received: by 2002:a05:6512:2391:b0:53d:a6c8:fb95 with SMTP id 2adb3069b0e04-53dab29efffmr5766910e87.19.1731924602776;
        Mon, 18 Nov 2024 02:10:02 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa20e046932sm518546366b.170.2024.11.18.02.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:10:02 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 18 Nov 2024 13:09:54 +0300
Subject: [PATCH v3 2/2] power: supply: max17042: add platform driver
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-b4-max17042-v3-2-9bcaeda42a06@gmail.com>
References: <20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com>
In-Reply-To: <20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731924598; l=7718;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=08avkvJXc6YpLMi35Ewq9sInOmvPK/XUfpBoJCW4Zgo=;
 b=Tb5f0aAMBx2MGt3QTrkgclj08UpXH0InARdTWId9PBKICIi4GRNuva4CIHo0xUUNPX4OG64yq
 tgZv4Ji6Oe6DCAShAYu8XgKwIixcAaIg1oTLpWOdRFCFDU6SObAAzr3
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_021005_288363_CB3F6734 
X-CRM114-Status: GOOD (  24.27  )
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

Maxim PMICs may include fuel gauge with additional features, which is
out of single Linux power supply driver scope.

For example, in max77705 PMIC fuelgauge has additional registers,
like IIN_REG, VSYS_REG, ISYS_REG. Those needed to measure PMIC input
current, system voltage and current respectively. Those measurements
cannot be bound to any of fuelgauge properties.

The solution here add and option to use max17042 driver as a MFD
sub device, thus allowing any additional functionality be implemented as
another sub device. This will help to reduce code duplication in MFD
fuel gauge drivers.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v3:
- pass dev pointer in max17042_probe
- remove prints
---
 drivers/power/supply/max17042_battery.c | 114 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------
 1 file changed, 90 insertions(+), 24 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 99bf6915aa23..d11bf37aaae2 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -16,6 +16,7 @@
 #include <linux/i2c.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/mod_devicetable.h>
 #include <linux/power_supply.h>
@@ -1029,14 +1030,12 @@ static const struct power_supply_desc max17042_no_current_sense_psy_desc = {
 	.num_properties	= ARRAY_SIZE(max17042_battery_props) - 2,
 };
 
-static int max17042_probe(struct i2c_client *client)
+static int max17042_probe(struct i2c_client *client, struct device *dev,
+			  enum max170xx_chip_type chip_type)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct i2c_adapter *adapter = client->adapter;
 	const struct power_supply_desc *max17042_desc = &max17042_psy_desc;
 	struct power_supply_config psy_cfg = {};
-	const struct acpi_device_id *acpi_id = NULL;
-	struct device *dev = &client->dev;
 	struct max17042_chip *chip;
 	int ret;
 	int i;
@@ -1045,33 +1044,24 @@ static int max17042_probe(struct i2c_client *client)
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
 		return -EIO;
 
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
 	chip->client = client;
-	if (id) {
-		chip->chip_type = id->driver_data;
-	} else {
-		acpi_id = acpi_match_device(dev->driver->acpi_match_table, dev);
-		if (!acpi_id)
-			return -ENODEV;
-
-		chip->chip_type = acpi_id->driver_data;
-	}
 	chip->regmap = devm_regmap_init_i2c(client, &max17042_regmap_config);
 	if (IS_ERR(chip->regmap)) {
-		dev_err(&client->dev, "Failed to initialize regmap\n");
+		dev_err(dev, "Failed to initialize regmap\n");
 		return -EINVAL;
 	}
 
 	chip->pdata = max17042_get_pdata(chip);
 	if (!chip->pdata) {
-		dev_err(&client->dev, "no platform data provided\n");
+		dev_err(dev, "no platform data provided\n");
 		return -EINVAL;
 	}
 
-	i2c_set_clientdata(client, chip);
+	dev_set_drvdata(dev, chip);
 	psy_cfg.drv_data = chip;
 	psy_cfg.of_node = dev->of_node;
 
@@ -1095,17 +1085,17 @@ static int max17042_probe(struct i2c_client *client)
 		regmap_write(chip->regmap, MAX17042_LearnCFG, 0x0007);
 	}
 
-	chip->battery = devm_power_supply_register(&client->dev, max17042_desc,
+	chip->battery = devm_power_supply_register(dev, max17042_desc,
 						   &psy_cfg);
 	if (IS_ERR(chip->battery)) {
-		dev_err(&client->dev, "failed: power supply register\n");
+		dev_err(dev, "failed: power supply register\n");
 		return PTR_ERR(chip->battery);
 	}
 
 	if (client->irq) {
 		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
 
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
+		ret = devm_request_threaded_irq(dev, client->irq,
 						NULL,
 						max17042_thread_handler, flags,
 						chip->battery->desc->name,
@@ -1118,7 +1108,7 @@ static int max17042_probe(struct i2c_client *client)
 		} else {
 			client->irq = 0;
 			if (ret != -EBUSY)
-				dev_err(&client->dev, "Failed to get IRQ\n");
+				dev_err(dev, "Failed to get IRQ\n");
 		}
 	}
 	/* Not able to update the charge threshold when exceeded? -> disable */
@@ -1127,7 +1117,7 @@ static int max17042_probe(struct i2c_client *client)
 
 	regmap_read(chip->regmap, MAX17042_STATUS, &val);
 	if (val & STATUS_POR_BIT) {
-		ret = devm_work_autocancel(&client->dev, &chip->work,
+		ret = devm_work_autocancel(dev, &chip->work,
 					   max17042_init_worker);
 		if (ret)
 			return ret;
@@ -1139,6 +1129,38 @@ static int max17042_probe(struct i2c_client *client)
 	return 0;
 }
 
+static int max17042_i2c_probe(struct i2c_client *client)
+{
+	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	const struct acpi_device_id *acpi_id = NULL;
+	struct device *dev = &client->dev;
+	enum max170xx_chip_type chip_type;
+
+	if (id) {
+		chip_type = id->driver_data;
+	} else {
+		acpi_id = acpi_match_device(dev->driver->acpi_match_table, dev);
+		if (!acpi_id)
+			return -ENODEV;
+
+		chip_type = acpi_id->driver_data;
+	}
+
+	return max17042_probe(client, dev, chip_type);
+}
+
+static int max17042_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct i2c_client *i2c = dev_get_platdata(dev);
+	const struct platform_device_id *id = platform_get_device_id(pdev);
+
+	if (!i2c)
+		return -EINVAL;
+
+	return max17042_probe(i2c, dev, id->driver_data);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int max17042_suspend(struct device *dev)
 {
@@ -1204,6 +1226,16 @@ static const struct i2c_device_id max17042_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max17042_id);
 
+static const struct platform_device_id max17042_platform_id[] = {
+	{ "max17042", MAXIM_DEVICE_TYPE_MAX17042 },
+	{ "max17047", MAXIM_DEVICE_TYPE_MAX17047 },
+	{ "max17050", MAXIM_DEVICE_TYPE_MAX17050 },
+	{ "max17055", MAXIM_DEVICE_TYPE_MAX17055 },
+	{ "max77849-battery", MAXIM_DEVICE_TYPE_MAX17047 },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, max17042_platform_id);
+
 static struct i2c_driver max17042_i2c_driver = {
 	.driver	= {
 		.name	= "max17042",
@@ -1211,10 +1243,44 @@ static struct i2c_driver max17042_i2c_driver = {
 		.of_match_table = of_match_ptr(max17042_dt_match),
 		.pm	= &max17042_pm_ops,
 	},
-	.probe		= max17042_probe,
+	.probe		= max17042_i2c_probe,
 	.id_table	= max17042_id,
 };
-module_i2c_driver(max17042_i2c_driver);
+
+static struct platform_driver max17042_platform_driver = {
+	.driver	= {
+		.name	= "max17042",
+		.acpi_match_table = ACPI_PTR(max17042_acpi_match),
+		.of_match_table = of_match_ptr(max17042_dt_match),
+		.pm	= &max17042_pm_ops,
+	},
+	.probe		= max17042_platform_probe,
+	.id_table	= max17042_platform_id,
+};
+
+static int __init __driver_max17042_platform_init(void)
+{
+	int ret = 0;
+
+	ret = platform_driver_register(&max17042_platform_driver);
+
+	if (ret) {
+		platform_driver_unregister(&max17042_platform_driver);
+		return ret;
+	}
+
+	ret = i2c_add_driver(&max17042_i2c_driver);
+
+	return ret;
+}
+module_init(__driver_max17042_platform_init);
+
+static void __exit __driver_max17042_platform_exit(void)
+{
+	i2c_del_driver(&max17042_i2c_driver);
+	platform_driver_unregister(&max17042_platform_driver);
+}
+module_exit(__driver_max17042_platform_exit);
 
 MODULE_AUTHOR("MyungJoo Ham <myungjoo.ham@samsung.com>");
 MODULE_DESCRIPTION("MAX17042 Fuel Gauge");

-- 
2.39.2


