Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9E2D12D4B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 19:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzjTpF4vcCvC+88m4NTYCvpBKv5iwpeXsY67V7asRZs=; b=sqbqDtsP/2pokxW6lmh6Q/yvKk
	zSP/3t1NPnVGJwet+dOnPH4yUJkLnCyzz1CyRXyG78OByT3L8fA35VpQinjK1rKX9lON0S5+CmrUi
	weR9iRhWT+OfAS3aKjLRICTTB6MoWe22HEazqqA2+4ximFgQcgzrC+u5u4MjWugYEoaVTu92NHjKA
	nd+4icD679qtnN+1TSiWSKOQJSH1yd0sEJ+riJqjp4TE/EUOaZVmnliRfcFCJ8xP2iGYwDsiyTHZX
	/nNoIK8FV11sMnXQu8VOJf7Ujb2tTFtQwwdzVdSSqVvBUL2PxBUkwFkTa4kdbnzluXa52OED8qgve
	YgfmoRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tADd8-0000000FSd8-40Sv;
	Sun, 10 Nov 2024 19:29:50 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tADY1-0000000FS37-0W1f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 19:24:34 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so677844966b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 11:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731266671; x=1731871471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzjTpF4vcCvC+88m4NTYCvpBKv5iwpeXsY67V7asRZs=;
        b=Mvg8sPuZzxHtWiv59g4pEjh4j5l6YPI2FBKMHxFEnS2xfVh89KfPBk4f0KlZsTTtyU
         tPw7UFLhCzyzum9hhe3QOcVEGQQ7JLJk3Vhb91G5udhZwXFA1vhXTWe07NmjKR89gmsg
         C1DAS3PjNoSf3IwWtPxyt0YxshvgKGncbDuGOHc01wKQy6d187LW0P0uRl3H1KwJI4Tc
         zovgDMn9lTKoNajY9HO1GSCht1X77DnN1j3oHT2L6zZzC/jTatgcYOVrjIVnM3kYyZTu
         P3SP2IY+4epBPP61S3mjbsJ2B7h+AI39Y34I0kmoB/9Lc7cCEbNW3XNjV/x0FNOsTMRh
         bVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731266671; x=1731871471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzjTpF4vcCvC+88m4NTYCvpBKv5iwpeXsY67V7asRZs=;
        b=VqMvWnyylYlvtUMfjH3eWIjovyh/sdsTQ1OqG5WUgSFu6Qmjsy2IQdAZxA4TnZeMo8
         1jv2khlzASeZMRQJlsJFzC4lPq+EOYCG/NDplUQI3CiHQ74DmEyFUuqraJtaYNTRxAiK
         zHn5JlSRk8jVCNazwRBSHmKnjqGOuEBb9ufGLOAFrN84KmOh6iJeQeb7+o5lwvRuL4nu
         f//O1zJ6K/sZZ0aDPod8iyVv/yIRUkGJUDvCU0UuqININXqswrVfOawDXmTdalMP7z93
         m7qpMAuaqxzbvTOidDgNAZSVWR2D767r89nJ09HC99jprIplde2QBkLuYXmDBgH8PgEE
         1jiA==
X-Forwarded-Encrypted: i=1; AJvYcCV/yEijO4oybofwZnbCfblnKh7gtgAaVV6OcKWBJaeyclCqI6ODHqxGZHqf6r6Z8ZG4zJ0JfMyWM0wmStFrByTE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0bFdwUSWqpjwllGtBRDrt4/6z6WbFuE/7pIZwxNgsjqqgNZyM
	cC8qgOgCtjilg0aW4vou7bmp7dsp+DNeR/yFp8A2Ja0X87BRnmHv
X-Google-Smtp-Source: AGHT+IFHsrzKAH1JXGqmrjEG47YYUuWxOy0DeShOLNpqUqSJjuxWTT1PZUGZb3HouVX3vdnd7BOhRw==
X-Received: by 2002:a17:907:7f28:b0:a9a:5cf8:9e40 with SMTP id a640c23a62f3a-a9eeff10a14mr923178466b.24.1731266670951;
        Sun, 10 Nov 2024 11:24:30 -0800 (PST)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9ee0e0fabesm502497666b.174.2024.11.10.11.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 11:24:29 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sun, 10 Nov 2024 22:24:16 +0300
Subject: [PATCH v2 2/2] power: supply: max17042: add platform driver
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-b4-max17042-v2-2-f058f7a16bab@gmail.com>
References: <20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com>
In-Reply-To: <20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com>
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
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731266662; l=5546;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=U4A1URsY+DSB9fqZhsXbXU4iN6/BssEpg8gHHdYuWhI=;
 b=swSnXIKrCHvZ5yseK48cwBu0mSP/TUGzwXb8VhRn0lHC1PwRDPUPLDuPb9x3Y5JunOH2lOS9s
 2asjCJJ555aCA3CYUHrWF0g0UhPt+3BUGGw3zNgbvGaWX3mirK5TGs9
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_112433_206262_3DD1D495 
X-CRM114-Status: GOOD (  21.75  )
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
 drivers/power/supply/max17042_battery.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 83 insertions(+), 14 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 99bf6915aa23..e78c177802db 100644
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
@@ -1029,13 +1030,12 @@ static const struct power_supply_desc max17042_no_current_sense_psy_desc = {
 	.num_properties	= ARRAY_SIZE(max17042_battery_props) - 2,
 };
 
-static int max17042_probe(struct i2c_client *client)
+static int max17042_probe(struct i2c_client *client, enum max170xx_chip_type chip_type)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	pr_info("do probe!\n");
 	struct i2c_adapter *adapter = client->adapter;
 	const struct power_supply_desc *max17042_desc = &max17042_psy_desc;
 	struct power_supply_config psy_cfg = {};
-	const struct acpi_device_id *acpi_id = NULL;
 	struct device *dev = &client->dev;
 	struct max17042_chip *chip;
 	int ret;
@@ -1050,15 +1050,6 @@ static int max17042_probe(struct i2c_client *client)
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
 		dev_err(&client->dev, "Failed to initialize regmap\n");
@@ -1139,6 +1130,40 @@ static int max17042_probe(struct i2c_client *client)
 	return 0;
 }
 
+static int max17042_i2c_probe(struct i2c_client *client)
+{
+	pr_info("i2c probe!\n");
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
+	return max17042_probe(client, chip_type);
+}
+
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
+	return max17042_probe(i2c, id->driver_data);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int max17042_suspend(struct device *dev)
 {
@@ -1204,6 +1229,16 @@ static const struct i2c_device_id max17042_id[] = {
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
@@ -1211,10 +1246,44 @@ static struct i2c_driver max17042_i2c_driver = {
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


