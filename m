Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3850E7718E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ajg7xx/d8ESd5hASRxHgzAQg5WAudGbS8KuIMOLuqU=; b=b7da1UKw0+oIExo5JOlsbOV65f
	3PBxRTKcT2dlI1UKs1EOzo7OOBJfOFdT+/08X7MkHBE6DByWTsc8EkNzQ3EoWhF+SP63cxfocSZSv
	4VOn+5odfIq8IBhi2UsC0Ngipq4vXtlinkQze5kRGvRwwdgXMh3j0873hpuW/qN43uYhT8WwLUViJ
	wPPJwdj3eZCB7wjy07IkVgf6lbPb3LTVu5/jEaNLsPJMrJ2JxBDUyxM69JmyD+/BDVt4Uy2XVI0OB
	GiO5tfudb2ge3sP739cVhXC4wxX/gR7rHGVTBoKusrqhT8KfTs1IarCvFgzDrqzR5wO1/LgSM+Zo6
	AXo73KLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjXW-0000000ACBo-1cbC;
	Mon, 23 Dec 2024 14:36:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPiWl-0000000A4WI-347w
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Dec 2024 13:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7ajg7xx/d8ESd5hASRxHgzAQg5WAudGbS8KuIMOLuqU=; b=Z14cKcPclIxQbTX+fukXjIYPyP
	Pn9FwOoopeRgQ/elzKZyMh3cUyl4dYY6NxEEGw+aENFAODpt5V0z1HdqUQVEsue9T55xgGBouXqV4
	swMm03nJskk++PDyu3dSCqfaDVLLVKeDxFFrlUqmilM5AbsMWq5Pgz8qycEaKZJJt4vP1ZqB40YkD
	RGLqzjq+wTalIllx7236kBzeOHPA9pXdCeaum4uXqcAVUnh44qwdaMKqXZrhQXko9oiLge7ipzql/
	d5z98vztYZ9ZfrZE8VReZLblrLwhZutKjFJOLng5mveObVUPU9PlkXC2d446Ej7PsyL3W88DBVG81
	BcUBYfMQ==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPiWi-00000006MX9-331E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 13:31:18 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so753140966b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 05:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734960674; x=1735565474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ajg7xx/d8ESd5hASRxHgzAQg5WAudGbS8KuIMOLuqU=;
        b=NTrwZqYTP9DGkkaxquLdqA96imZvPVCiuZKi3odCzdwS9CxmB5LynXRRcdZW0YTEMr
         E/9szVC1dNVn6AKFHdirrs+J6XIj6oeFscAmPkcTIuwMZ9q8yeaOF0wF1xA3WHTfu3wF
         NBr9ZSGDZc95wqraXVpG8S3oljs5EoV5EQnJPh1Ad8Ti/0K9suWJ1UQxbMRijwkIdGxz
         N7CJ0B1Q0ec7llminhl1xwshs4uBYSTJbwtdhwSiK2AMAOtpZrUVjdzY8NIYpwyFyPAs
         aBdCrSDiuyXupWygRIBRLI4vJXlF4E5L9zn3bXIQkxOidZ84awEnVJzj1Qe8Z+6yV6K+
         ZcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734960674; x=1735565474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ajg7xx/d8ESd5hASRxHgzAQg5WAudGbS8KuIMOLuqU=;
        b=hcWuXGZccybwSMK+Z8VYFuAmUC1MeeuujbSTznZhEwFWlb0pumu21hNEESisbBgFlJ
         mGDmSbipXJpzY3CGmYYY8zRyCbLROVURDWMm0gakSZRDkWL3e4BjwHkXyg1BNWFDvNS9
         l/S7oriO8R9JeENawAB1/k6w1xQ1obHzK0Q5bR7U5HZyQPsLbeVchPKW+SxdxfPTzFQl
         ktr/nO/LeqngEKcarTUcaXO7si/aswAnFJq9ZQhxbNpyrTMI0lDqsimeTT5KadEPmFPb
         Coy6g1Dl/TZZZzC+/kjgPhPtIgcGMXVISH4GMXU781VjWNBUDzOBK43ArBx0+e1kudTq
         0olA==
X-Forwarded-Encrypted: i=1; AJvYcCVXfsytRcyh0sG6qNK9mZmbeoTGRn9xDtL2Pe6uY1klm3oMtb4RfchipyPfwM7vBxvcwtgrRuRjATZpjIxBgUDH@lists.infradead.org
X-Gm-Message-State: AOJu0YxpEycMGgV23qUHvOzTUmfrY0bUP8yp4PHaCILbsNnfuiZSKKjb
	OQAkbiSjcNqJASUVKpEN4O0IlHJIBUpvGKYijU0gl59joIl/3qJT
X-Gm-Gg: ASbGncvnI6SK7CLZnYKgxM5fHvEWXBOn+wlFDaA6EUfChN507uDeASMPICRru2zwogo
	hxwcvWvNYzxO6wP6NE5T6jKBq7UB+Ert/xLy6bgOeMs8dfWQcDbMamlQVnzSfslwZLj5vhOKjfI
	7bpQ6GOK8fm8CJSAe+wePU3LQnLWe6tLEHLjp6thPQrc1sw2LFgZl8sc126mvwbR1O+32ogy5ov
	QYUK1HSAGeKTwcBYZ++K0TQZJ5o6rRMcYGyJqhpaKjDyJIukZrrosvOBrI5viUl/6k6O+GOzfOZ
	9UklV+95Mlkvo5Bv2UwGTykQDQ==
X-Google-Smtp-Source: AGHT+IHEjo3x7fD8aSiXxOmFUV3hV1/DIPle/JX4NtwkWVI7TfmAfR2G3lYPFinPk/RyEV7fRoWnxQ==
X-Received: by 2002:a17:907:6096:b0:aa6:800a:128b with SMTP id a640c23a62f3a-aac271305cemr1109984466b.9.1734960673411;
        Mon, 23 Dec 2024 05:31:13 -0800 (PST)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-232.telecom.by. [46.53.210.232])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0e895502sm523749966b.63.2024.12.23.05.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 05:31:13 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 23 Dec 2024 16:30:40 +0300
Subject: [PATCH v5 2/2] power: supply: max17042: add platform driver
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-b4-max17042-v5-2-e4e409723bce@gmail.com>
References: <20241223-b4-max17042-v5-0-e4e409723bce@gmail.com>
In-Reply-To: <20241223-b4-max17042-v5-0-e4e409723bce@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734960669; l=14031;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=CsA8p5yHzaSIiP1c2/pE9CLJULSv0HYY6su7li6YTA8=;
 b=Keb/p3VYxjVZja9jO9lwQQEdinxhirqOLuxsH5MHwjI27znBDcpWQoKTHZx3tZtxhXnayJngg
 u3oXVH4JoDcDqTpWmQCHEJtKAFzg6u1rgJT9PtgMNhcPdpz/hVeCq7Q
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_133117_105540_3831DA96 
X-CRM114-Status: GOOD (  30.09  )
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
Changes in v6:
- use parent device of_node

Changes in v5:
- replace *client field on *dev and irq in driver data struct
  this needed to provide correct dev and irq from platform probe
- s/&chip->client->dev/chip->dev/
- s/chip->client->irq/chip->irq/
- add regmap name to avoid possible conflicts in debugfs
- get i2c_client with common to_i2c_client(pdev->dev.parent); approach,
  not from platform data
- add device types to `of_device_id max17042_dt_match`, for platform
  version to be able to set platform device id, like in `clk-s2mps11.c`
  driver.

Changes in v4:
- rename module_init and module_exit fuctions
- rework max17042_init
- assign chip_type in probe function
- pass i2c_client as pointer on pointer, to use same pointer created in
  MFD. This allows devm_regmap_init_i2c to cleanup gracefully.

Changes in v3:
- pass dev pointer in max17042_probe
- remove prints
---
 drivers/power/supply/max17042_battery.c | 191 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------
 1 file changed, 141 insertions(+), 50 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 99bf6915aa23..4037843e25bb 100644
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
@@ -52,13 +53,14 @@
 #define MAX17042_VMAX_TOLERANCE		50 /* 50 mV */
 
 struct max17042_chip {
-	struct i2c_client *client;
+	struct device *dev;
 	struct regmap *regmap;
 	struct power_supply *battery;
 	enum max170xx_chip_type chip_type;
 	struct max17042_platform_data *pdata;
 	struct work_struct work;
 	int    init_complete;
+	int    irq;
 };
 
 static enum power_supply_property max17042_battery_props[] = {
@@ -573,11 +575,11 @@ static inline int max17042_model_data_compare(struct max17042_chip *chip,
 	int i;
 
 	if (memcmp(data1, data2, size)) {
-		dev_err(&chip->client->dev, "%s compare failed\n", __func__);
+		dev_err(chip->dev, "%s compare failed\n", __func__);
 		for (i = 0; i < size; i++)
-			dev_info(&chip->client->dev, "0x%x, 0x%x",
+			dev_info(chip->dev, "0x%x, 0x%x",
 				data1[i], data2[i]);
-		dev_info(&chip->client->dev, "\n");
+		dev_info(chip->dev, "\n");
 		return -EINVAL;
 	}
 	return 0;
@@ -812,14 +814,14 @@ static int max17042_init_chip(struct max17042_chip *chip)
 	/* write cell characterization data */
 	ret = max17042_init_model(chip);
 	if (ret) {
-		dev_err(&chip->client->dev, "%s init failed\n",
+		dev_err(chip->dev, "%s init failed\n",
 			__func__);
 		return -EIO;
 	}
 
 	ret = max17042_verify_model_lock(chip);
 	if (ret) {
-		dev_err(&chip->client->dev, "%s lock verify failed\n",
+		dev_err(chip->dev, "%s lock verify failed\n",
 			__func__);
 		return -EIO;
 	}
@@ -875,7 +877,7 @@ static irqreturn_t max17042_thread_handler(int id, void *dev)
 		return IRQ_HANDLED;
 
 	if ((val & STATUS_SMN_BIT) || (val & STATUS_SMX_BIT)) {
-		dev_dbg(&chip->client->dev, "SOC threshold INTR\n");
+		dev_dbg(chip->dev, "SOC threshold INTR\n");
 		max17042_set_soc_threshold(chip, 1);
 	}
 
@@ -907,7 +909,7 @@ static void max17042_init_worker(struct work_struct *work)
 static struct max17042_platform_data *
 max17042_get_of_pdata(struct max17042_chip *chip)
 {
-	struct device *dev = &chip->client->dev;
+	struct device *dev = chip->dev;
 	struct device_node *np = dev->of_node;
 	u32 prop;
 	struct max17042_platform_data *pdata;
@@ -949,7 +951,7 @@ static struct max17042_reg_data max17047_default_pdata_init_regs[] = {
 static struct max17042_platform_data *
 max17042_get_default_pdata(struct max17042_chip *chip)
 {
-	struct device *dev = &chip->client->dev;
+	struct device *dev = chip->dev;
 	struct max17042_platform_data *pdata;
 	int ret, misc_cfg;
 
@@ -990,7 +992,7 @@ max17042_get_default_pdata(struct max17042_chip *chip)
 static struct max17042_platform_data *
 max17042_get_pdata(struct max17042_chip *chip)
 {
-	struct device *dev = &chip->client->dev;
+	struct device *dev = chip->dev;
 
 #ifdef CONFIG_OF
 	if (dev->of_node)
@@ -1003,6 +1005,7 @@ max17042_get_pdata(struct max17042_chip *chip)
 }
 
 static const struct regmap_config max17042_regmap_config = {
+	.name = "max17042",
 	.reg_bits = 8,
 	.val_bits = 16,
 	.val_format_endian = REGMAP_ENDIAN_NATIVE,
@@ -1029,14 +1032,12 @@ static const struct power_supply_desc max17042_no_current_sense_psy_desc = {
 	.num_properties	= ARRAY_SIZE(max17042_battery_props) - 2,
 };
 
-static int max17042_probe(struct i2c_client *client)
+static int max17042_probe(struct i2c_client *client, struct device *dev, int irq,
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
@@ -1045,33 +1046,25 @@ static int max17042_probe(struct i2c_client *client)
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
 		return -EIO;
 
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	chip->client = client;
-	if (id) {
-		chip->chip_type = id->driver_data;
-	} else {
-		acpi_id = acpi_match_device(dev->driver->acpi_match_table, dev);
-		if (!acpi_id)
-			return -ENODEV;
-
-		chip->chip_type = acpi_id->driver_data;
-	}
+	chip->dev = dev;
+	chip->chip_type = chip_type;
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
 
@@ -1095,17 +1088,17 @@ static int max17042_probe(struct i2c_client *client)
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
 
-	if (client->irq) {
+	if (irq) {
 		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
 
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
+		ret = devm_request_threaded_irq(dev, irq,
 						NULL,
 						max17042_thread_handler, flags,
 						chip->battery->desc->name,
@@ -1116,18 +1109,20 @@ static int max17042_probe(struct i2c_client *client)
 					CFG_ALRT_BIT_ENBL);
 			max17042_set_soc_threshold(chip, 1);
 		} else {
-			client->irq = 0;
+			irq = 0;
 			if (ret != -EBUSY)
-				dev_err(&client->dev, "Failed to get IRQ\n");
+				dev_err(dev, "Failed to get IRQ\n");
 		}
 	}
 	/* Not able to update the charge threshold when exceeded? -> disable */
-	if (!client->irq)
+	if (!irq)
 		regmap_write(chip->regmap, MAX17042_SALRT_Th, 0xff00);
 
+	chip->irq = irq;
+
 	regmap_read(chip->regmap, MAX17042_STATUS, &val);
 	if (val & STATUS_POR_BIT) {
-		ret = devm_work_autocancel(&client->dev, &chip->work,
+		ret = devm_work_autocancel(dev, &chip->work,
 					   max17042_init_worker);
 		if (ret)
 			return ret;
@@ -1139,6 +1134,44 @@ static int max17042_probe(struct i2c_client *client)
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
+	return max17042_probe(client, dev, client->irq, chip_type);
+}
+
+static int max17042_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct i2c_client *i2c;
+	const struct platform_device_id *id;
+	int irq;
+
+	i2c = to_i2c_client(pdev->dev.parent);
+	if (!i2c)
+		return -EINVAL;
+
+	dev->of_node = dev->parent->of_node;
+	id = platform_get_device_id(pdev);
+	irq = platform_get_irq(pdev, 0);
+
+	return max17042_probe(i2c, dev, irq, id->driver_data);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int max17042_suspend(struct device *dev)
 {
@@ -1148,9 +1181,9 @@ static int max17042_suspend(struct device *dev)
 	 * disable the irq and enable irq_wake
 	 * capability to the interrupt line.
 	 */
-	if (chip->client->irq) {
-		disable_irq(chip->client->irq);
-		enable_irq_wake(chip->client->irq);
+	if (chip->irq) {
+		disable_irq(chip->irq);
+		enable_irq_wake(chip->irq);
 	}
 
 	return 0;
@@ -1160,9 +1193,9 @@ static int max17042_resume(struct device *dev)
 {
 	struct max17042_chip *chip = dev_get_drvdata(dev);
 
-	if (chip->client->irq) {
-		disable_irq_wake(chip->client->irq);
-		enable_irq(chip->client->irq);
+	if (chip->irq) {
+		disable_irq_wake(chip->irq);
+		enable_irq(chip->irq);
 		/* re-program the SOC thresholds to 1% change */
 		max17042_set_soc_threshold(chip, 1);
 	}
@@ -1183,12 +1216,26 @@ MODULE_DEVICE_TABLE(acpi, max17042_acpi_match);
 #endif
 
 #ifdef CONFIG_OF
-static const struct of_device_id max17042_dt_match[] = {
-	{ .compatible = "maxim,max17042" },
-	{ .compatible = "maxim,max17047" },
-	{ .compatible = "maxim,max17050" },
-	{ .compatible = "maxim,max17055" },
-	{ .compatible = "maxim,max77849-battery" },
+/*
+ * Device may be instantiated through parent MFD device and device matching is done
+ * through platform_device_id.
+ *
+ * However if device's DT node contains proper clock compatible and driver is
+ * built as a module, then the *module* matching will be done trough DT aliases.
+ * This requires of_device_id table.  In the same time this will not change the
+ * actual *device* matching so do not add .of_match_table.
+ */
+static const struct of_device_id max17042_dt_match[] __used = {
+	{ .compatible = "maxim,max17042",
+		.data = (void *) MAXIM_DEVICE_TYPE_MAX17042 },
+	{ .compatible = "maxim,max17047",
+		.data = (void *) MAXIM_DEVICE_TYPE_MAX17047 },
+	{ .compatible = "maxim,max17050",
+		.data = (void *) MAXIM_DEVICE_TYPE_MAX17050 },
+	{ .compatible = "maxim,max17055",
+		.data = (void *) MAXIM_DEVICE_TYPE_MAX17055 },
+	{ .compatible = "maxim,max77849-battery",
+		.data = (void *) MAXIM_DEVICE_TYPE_MAX17047 },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, max17042_dt_match);
@@ -1204,6 +1251,16 @@ static const struct i2c_device_id max17042_id[] = {
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
@@ -1211,10 +1268,44 @@ static struct i2c_driver max17042_i2c_driver = {
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
+		.pm	= &max17042_pm_ops,
+	},
+	.probe		= max17042_platform_probe,
+	.id_table	= max17042_platform_id,
+};
+
+static int __init max17042_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&max17042_platform_driver);
+	if (ret)
+		return ret;
+
+	ret = i2c_add_driver(&max17042_i2c_driver);
+	if (ret) {
+		platform_driver_unregister(&max17042_platform_driver);
+		return ret;
+	}
+
+	return 0;
+}
+module_init(max17042_init);
+
+static void __exit max17042_exit(void)
+{
+	i2c_del_driver(&max17042_i2c_driver);
+	platform_driver_unregister(&max17042_platform_driver);
+}
+module_exit(max17042_exit);
 
 MODULE_AUTHOR("MyungJoo Ham <myungjoo.ham@samsung.com>");
 MODULE_DESCRIPTION("MAX17042 Fuel Gauge");

-- 
2.39.5


