Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4290D6ACF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NFsguID+3JOW+n7uen1rTmDML80+B58lxjFyewbZl8=; b=Qjn3I4GBNm8yfKvE/o2TqRZw+6
	earm5vr00gjG1EOnf4g/HFie6XR6gjr5FT04pVDx5/2UL31lWtmmYfzMEZbNgmbkjgvhuBSSn3jfC
	1rDvj0sPIcwYByibTUCynfyeKyMDrci3XFc1crUlGTtWfvde8MPj3keCS6iDQA7FVMX+/P26t0wok
	8NWgmXY9EsQ4YX/2YtjqY1i60gHD3nCga5d6jvlvlnOwl+Ssl0sgVLic+pKYFE+8HIkHLEnSrWsWv
	PysWeB53tbKPEJGKw1HkhzC+Q9PQjvjplI//WWp9lHiAOHygSxvUzO31amLJPXofRM1kV7LUePzAw
	vcgaLOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLGF-0000000DgWN-1M6C;
	Wed, 27 Nov 2024 16:51:31 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL9g-0000000DfGC-2jBv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:44:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4684BFB52;
	Wed, 27 Nov 2024 17:44:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1732725883; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6NFsguID+3JOW+n7uen1rTmDML80+B58lxjFyewbZl8=;
	b=apbtFTICgIofepE4xyTVW1/mgmKsC9sEBtHYd6J61Yt79hqopF/TKvolbgQdZzmcL68Her
	3mtkxefb98YixUwK8Nf2n7kSTu7fiMn/HrW/Evir9Ayi0t/dtD8ZjJc9DDVSjcd0YPpk2C
	/g0YSUKw82qB2sUVVRPaC0MNKHcxZmFjME4YsTAXIKgSe84HoMD5fA3VmFixDscwN6fhb8
	zcOlIliMQ/OIi1H8DCcovreSsbnJoGnpSBEQfMJJmSFBZ+HU6bMMeRJIKv3dD2Ge5mkOts
	Papx6QGlOiLRHOUE0s3V27hJSyW1fbwDhIKHabhtgl1uU6u1pq5x/IdPlhdDUw==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Bo Liu <liubo03@inspur.com>,
	Joy Zou <joy.zou@nxp.com>
Subject: [PATCH v2 06/11] regulator: pca9450: Fix control register for LDO5
Date: Wed, 27 Nov 2024 17:42:22 +0100
Message-ID: <20241127164337.613915-7-frieder@fris.de>
In-Reply-To: <20241127164337.613915-1-frieder@fris.de>
References: <20241127164337.613915-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_084444_985448_CF2B5C4C 
X-CRM114-Status: GOOD (  20.05  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

For LDO5 we need to be able to check the status of the SD_VSEL input in
order to know which control register is used. Read the status of the
SD_VSEL signal via GPIO and use the correct register accordingly.

To use this, the LDO5 node in the devicetree needs the sd-vsel-gpios
property to reference the GPIO that is used to read back the SD_VSEL
status internally. Please note that the SION bit in the IOMUX must be
set if the signal is muxed as VSELECT and controlled by the USDHC
controller.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* rebase to current master and stop using generic helper from
  regulator core
---
 drivers/regulator/pca9450-regulator.c | 77 +++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 0f8a515a0b11a..8e525deaff0b7 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -31,6 +32,7 @@ struct pca9450_regulator_desc {
 struct pca9450 {
 	struct device *dev;
 	struct regmap *regmap;
+	struct gpio_desc *sd_vsel_gpio;
 	enum pca9450_chip_type type;
 	unsigned int rcnt;
 	int irq;
@@ -96,6 +98,58 @@ static const struct regulator_ops pca9450_ldo_regulator_ops = {
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
 };
 
+static unsigned int pca9450_ldo5_get_reg_voltage_sel(struct regulator_dev *rdev)
+{
+	struct pca9450 *pca9450 = rdev_get_drvdata(rdev);
+
+	if (pca9450->sd_vsel_gpio && !gpiod_get_value(pca9450->sd_vsel_gpio))
+		return PCA9450_REG_LDO5CTRL_L;
+
+	return rdev->desc->vsel_reg;
+}
+
+static int pca9450_ldo5_get_voltage_sel_regmap(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(rdev->regmap, pca9450_ldo5_get_reg_voltage_sel(rdev), &val);
+	if (ret != 0)
+		return ret;
+
+	val &= rdev->desc->vsel_mask;
+	val >>= ffs(rdev->desc->vsel_mask) - 1;
+
+	return val;
+}
+
+static int pca9450_ldo5_set_voltage_sel_regmap(struct regulator_dev *rdev, unsigned int sel)
+{
+	int ret;
+
+	sel <<= ffs(rdev->desc->vsel_mask) - 1;
+
+	ret = regmap_update_bits(rdev->regmap, pca9450_ldo5_get_reg_voltage_sel(rdev),
+				  rdev->desc->vsel_mask, sel);
+	if (ret)
+		return ret;
+
+	if (rdev->desc->apply_bit)
+		ret = regmap_update_bits(rdev->regmap, rdev->desc->apply_reg,
+					 rdev->desc->apply_bit,
+					 rdev->desc->apply_bit);
+	return ret;
+}
+
+static const struct regulator_ops pca9450_ldo5_regulator_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear_range,
+	.set_voltage_sel = pca9450_ldo5_set_voltage_sel_regmap,
+	.get_voltage_sel = pca9450_ldo5_get_voltage_sel_regmap,
+};
+
 /*
  * BUCK1/2/3
  * 0.60 to 2.1875V (12.5mV step)
@@ -445,7 +499,7 @@ static const struct pca9450_regulator_desc pca9450a_regulators[] = {
 			.of_match = of_match_ptr("LDO5"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO5,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo5_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO5_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo5_volts,
@@ -654,7 +708,7 @@ static const struct pca9450_regulator_desc pca9450bc_regulators[] = {
 			.of_match = of_match_ptr("LDO5"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO5,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo5_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO5_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo5_volts,
@@ -826,7 +880,7 @@ static const struct pca9450_regulator_desc pca9451a_regulators[] = {
 			.of_match = of_match_ptr("LDO5"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO5,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo5_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO5_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo5_volts,
@@ -884,6 +938,7 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 				      of_device_get_match_data(&i2c->dev);
 	const struct pca9450_regulator_desc	*regulator_desc;
 	struct regulator_config config = { };
+	struct regulator_dev *ldo5;
 	struct pca9450 *pca9450;
 	unsigned int device_id, i;
 	unsigned int reset_ctrl;
@@ -949,6 +1004,7 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 
 		config.regmap = pca9450->regmap;
 		config.dev = pca9450->dev;
+		config.driver_data = pca9450;
 
 		rdev = devm_regulator_register(pca9450->dev, desc, &config);
 		if (IS_ERR(rdev)) {
@@ -958,6 +1014,9 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 				desc->name, ret);
 			return ret;
 		}
+
+		if (!strcmp(desc->name, "ldo5"))
+			ldo5 = rdev;
 	}
 
 	if (pca9450->irq) {
@@ -1013,6 +1072,18 @@ static int pca9450_i2c_probe(struct i2c_client *i2c)
 		}
 	}
 
+	/*
+	 * For LDO5 we need to be able to check the status of the SD_VSEL input in
+	 * order to know which control register is used. Most boards connect SD_VSEL
+	 * to the VSELECT signal, so we can use the GPIO that is internally routed
+	 * to this signal (if SION bit is set in IOMUX).
+	 */
+	pca9450->sd_vsel_gpio = gpiod_get_optional(&ldo5->dev, "sd-vsel", GPIOD_IN);
+	if (IS_ERR(pca9450->sd_vsel_gpio)) {
+		dev_err(&i2c->dev, "Failed to get SD_VSEL GPIO\n");
+		return ret;
+	}
+
 	dev_info(&i2c->dev, "%s probed.\n",
 		type == PCA9450_TYPE_PCA9450A ? "pca9450a" :
 		(type == PCA9450_TYPE_PCA9451A ? "pca9451a" : "pca9450bc"));
-- 
2.46.1


