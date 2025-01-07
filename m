Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF38E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BB8jR7nXUYydyK9dfdg79I9SeH0rKSouMJyEMKtyGM=; b=2oBWdFc7g55ZnGgrEYvTI7QWg+
	F9YqBZjR4hb1FLIqsmp1NYcSMUtzL8PIXn0ZD+mSch61kOckfjxsW+CbiVMhZ7PufOjm329EkXmhi
	Y+iEUpcp9D0jdB7gnHdDaC6WGQXHmzmm7WboYCnkKTcHas3dUku9XRxn4IWTW0LcFb9S7OVSItDzW
	10z3O3rUBCGjFhy8Q2tU6hOKEAfmpe+svTkJJw+ArTYyjd+nfq3Buk19KTOkFjKHQWpM89IUDYb5I
	5wi68d9VvkOE9xUe5YpVN/0OacWdWANdAU4qKQgSUxo2Qx6XvkDpVlC9KXhDBa89B9c0JwlLCSeWh
	fbUowMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV60P-0000000499f-1BRH;
	Tue, 07 Jan 2025 09:36:09 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5wC-000000048Av-1uKK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:31:49 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so7506753a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736242307; x=1736847107; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BB8jR7nXUYydyK9dfdg79I9SeH0rKSouMJyEMKtyGM=;
        b=TvwauHNlYe5lvgWJDvxb+xCQTXR4kXBLEKU6t5+SYQGQQxjqcnBKy+IBQBfyWQuuDp
         kmuUDtEVDTaole4exfS6ao+00e3FHSuwOcNmuVRFpsYsUPmDpXanvxr5eUBgZvH02PsR
         FrbyOk3+TzQk7mgoNO5u+hSCQdYvMK8EPyPOd1QAfQwUKf1R6I5PvMHS9XnHPszO+cf4
         mPqcb5zmxKcB89bRYcQ1keU7ZlK/91G1ptBMiU1EaJ766D7+iFRX0orAECeyjJzPiFVI
         W85cYxEicy/vXvosxlejL5i8JfS+wdolZlj1S2xaq9cNDLAUUw2fAcgqIainS6L3MKVh
         8TfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242307; x=1736847107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BB8jR7nXUYydyK9dfdg79I9SeH0rKSouMJyEMKtyGM=;
        b=iJhPQsq0dihmIRmn0j0FSKZafNS9cwVoFpFn4BCQyr6twL4IPw7hAVVVP51y/pNLPe
         60b5k2JALhFPmSzGv8Z70vjIBvM9nveMlo0Higf6G7LOqsGIzo+A8rvSEZ1HvYyl2Ayd
         VDkkE0sG+bON3JBh64oalxq1HdHE6ljSfh1uh6UdFCTCG8WNr0i2jPdhdvkWbMz7OFeK
         c6GYoxmUCMino3MYa2s1HYXiCuIoeO8HfI3EcM91I7xe2HooBx7tnZBgU2Py1dJtVO3o
         F0pTS3+Ld6Ju52grHHVM0qLGH4ej2YNze1HZOrgRyJtA/wkBxGQKNmloHikx7FjQz9Fk
         Ai1w==
X-Forwarded-Encrypted: i=1; AJvYcCVtazLm/2IDyFO/WTPvajztqwRKdquEkBPlHQjLpLPnVIOeTxZgcTjw0txIK+n2rWeTDpoEQrT4MIPo/5U0oOZO@lists.infradead.org
X-Gm-Message-State: AOJu0YyJye99qXi/qbWzYeXUldq9AIT5+GuPQU1V4Ur3gwO44h+Gck5A
	2oI7KcXoUUSTJWQeveo06QPJy9WSDc7n5AFrwMgCfvrldozYLFfF4hg2qg==
X-Gm-Gg: ASbGnctdkGFjv2k7ojjQ+T0gZhvHdMyIaReiwk4GbFXcJp41gMdrcBP4H9DCSnbVY9B
	7zydJIUt3u1h2HC2f3pMHCp4I/Zme8vVs+9JXnmC86HTs8Y95Y6qets4Cnx1r/DcWfMGs+sOTg9
	qr5Pi6bdRhK5TeUIXzEpQdlzJ1L9fHp3IfDvaSLvx49Uss80Oteqpf7+/t9HHSx0tNVZKoS7fK7
	jBVouF7cxDq7zwn8n8OMw6xHd5QPyPlWMEA4nEdqI3vkS5jFuu+PthFD8qnQ/ejcOQQNx7JYGaS
	ReXv6EMy1v5gfMjmPg7LhWX6Cw==
X-Google-Smtp-Source: AGHT+IHVSwvO5REOZsXpr6NedG5NC3Z7zjoKMr78xylkWpwdIh5MXwXw5HCbuKJpAPKQjtruRtWSWQ==
X-Received: by 2002:a05:6402:35c2:b0:5cf:c33c:34cf with SMTP id 4fb4d7f45d1cf-5d81dd99557mr50433144a12.15.1736242306459;
        Tue, 07 Jan 2025 01:31:46 -0800 (PST)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-232.telecom.by. [46.53.210.232])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806feddfasm24976300a12.58.2025.01.07.01.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:31:46 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 07 Jan 2025 12:31:31 +0300
Subject: [PATCH v6 2/2] power: supply: max17042: add platform driver
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-b4-max17042-v6-2-3d0104ad5bc7@gmail.com>
References: <20250107-b4-max17042-v6-0-3d0104ad5bc7@gmail.com>
In-Reply-To: <20250107-b4-max17042-v6-0-3d0104ad5bc7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736242298; l=14259;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=/U5C+nfuke8YP3qpDkMfO7fqpvAqGnzMcDfWnXPrw5w=;
 b=tEoMRIasMIbReaQ1PMoag6ClMoUYVwBoShQ1bPoGXdU4NoRKkypyLSn4FRTBLH20qj2g3Tsk4
 QGmA90ITz9LA6Vwv3/5F8YUtVI3h+Fq2UTU81Lz39xfQAvat/vViEPg
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_013148_505182_88ADA615 
X-CRM114-Status: GOOD (  30.64  )
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

For example, in max77705 PMIC fuelgauge has additional registers, like
IIN_REG, VSYS_REG, ISYS_REG. Those needed to measure PMIC input current,
system voltage and current respectively. Those measurements cannot be
bound to any of fuelgauge properties.

The solution here add and option to use max17042 driver as a MFD sub
device, thus allowing any additional functionality be implemented as
another sub device. This will help to reduce code duplication in MFD
fuel gauge drivers.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- fix changelog: move `use parent device of_node` change to v5 from v6
  list, since it first appeared there
- reformat commit message with vim `gq` to wrap closer to 75 chars

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
- use parent device of_node

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


