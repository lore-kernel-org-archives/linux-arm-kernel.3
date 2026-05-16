Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95359CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 17:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEna5jcmnnmO+ZjzofYZ+GjqXa5FMiBuqh9DMsRmCkI=; b=PJV4K8WFVgz9Oj6FJ99hAg9DGh
	6ojZvARt5IM6+3ZfEzaSUegijBUOktiCoT3OkDmYFc39oAU/lzHGcXJM97QJbXmBb5VZF/Qpt5UQI
	Hdz8npoFHPswzZfkGcXe8KZA3JJB4AjG2vXOEyDtfdIRvhKg20OozLlE5zYv3Lm/WFNo2Nz4wDCM1
	7bI8FPIvjmDaqaFPlqtsSCK8dh82dog59xV99xKqNpzQn8+hQ+qWn/zOBrCh/VbqRUMc0rWsHsIc6
	rwQ3anxYtPLcOxyDKR/WxHWY0cEkAZIUTDNjCYs1q1PFXU2ORDMlSctBUcWzOoK9zLr0RuFTvy5GF
	907EoN6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOIef-0000000B5VP-0U4s;
	Sat, 16 May 2026 17:18:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOIed-0000000B5Tc-1jOf;
	Sat, 16 May 2026 17:18:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A73BC601F2;
	Sat, 16 May 2026 17:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4094AC2BCF7;
	Sat, 16 May 2026 17:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778951902;
	bh=vcddWAKBUUc53BVyhxK72EFohe0DoJxhoQgjf6bXTGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Md5MwT7AgzVQWQH08Fe1gqrytP8Plx3AUNPVDaB4vDelIBfUj16Ruzd4NOfuJSboD
	 hABi57WS+BW1n4W+49K1fjBnKNNOkn1C3GQLmzEJANrahC+8JgLMIO2MlXz/bKrJv4
	 dRiKCEWChQGdFLpIpHuJohUNjc4EmVB6wiNLewJROMbiOO0Jt6FL9V628lMzphhP8Y
	 xF5rkQj7oE3AHDCS6+5RRCPVm3GWsoI8GCaSfJRXbEj+SICYmBcRX5Zod0I9f6lsC8
	 byF9wv+E9Ua5VgCLhHLRo9fikN4sngQIcqg8FCnJxwEcVbQqTesVhOJ/Y5CcEn+Q0y
	 fxEW/mK+RN48A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355A7CD4F25;
	Sat, 16 May 2026 17:18:22 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sat, 16 May 2026 19:17:04 +0200
Subject: [PATCH v6 4/8] mfd: khadas-mcu: Add support for VIM4 MCU variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260516-add-mcu-fan-khadas-vim4-v6-4-cccc9b61f465@aliel.fr>
References: <20260516-add-mcu-fan-khadas-vim4-v6-0-cccc9b61f465@aliel.fr>
In-Reply-To: <20260516-add-mcu-fan-khadas-vim4-v6-0-cccc9b61f465@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5516;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=qs6BYksNaYQxO8cRXhUkAsFpyxmfuBDf4W1LAvds4Ks=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxbHsmur+KI+ti9sl51ikNlclTvvcIuMoW3Mq513o7hco
 mQfL9LqKGVhEONikBVTZOmfa3ni3eWjZ77uUU+BmcPKBDKEgYtTACbyNZ/hryDb6UrV5re6b/Lr
 +6SSbk89nT2/X0Uicuf1C6v+qK7abcvIMLti4++pTW83n8wp6BXZMXG2fflryy/7N4nI2TQa/1Z
 7zwYA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Refactor probe() to use per-variant khadas_mcu_data
instead of hardcoded globals.

Add dedicated regmap configuration and device data for the VIM4 MCU,
with its own volatile/writeable registers.

Add the fan control register
(0–100 levels vs 0–3 for previous supported boards).

Add a new compatible string "khadas,vim4-mcu".

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/mfd/khadas-mcu.c | 119 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 104 insertions(+), 15 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index ba981a7886921..7bc538232a445 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -75,15 +75,91 @@ static const struct regmap_config khadas_mcu_regmap_config = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
-static struct mfd_cell khadas_mcu_fan_cells[] = {
+static const struct khadas_mcu_fan_pdata khadas_mcu_fan_pdata = {
+	.fan_reg	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
+	.max_level	= 3, /* Fan speed: 0 = off, 1 = low, 2 = medium, 3 = high */
+};
+
+static const struct mfd_cell khadas_mcu_fan_cells[] = {
 	/* VIM1/2 Rev13+ and VIM3 only */
-	{ .name = "khadas-mcu-fan-ctrl", },
+	{
+		.name = "khadas-mcu-fan-ctrl",
+		.platform_data = &khadas_mcu_fan_pdata,
+		.pdata_size    = sizeof(khadas_mcu_fan_pdata),
+	},
 };
 
-static struct mfd_cell khadas_mcu_cells[] = {
+static const struct mfd_cell khadas_mcu_cells[] = {
 	{ .name = "khadas-mcu-user-mem", },
 };
 
+static const struct khadas_mcu_data khadas_mcu_data = {
+	.regmap_config	= &khadas_mcu_regmap_config,
+	.cells		= khadas_mcu_cells,
+	.ncells		= ARRAY_SIZE(khadas_mcu_cells),
+	.fan_cells	= khadas_mcu_fan_cells,
+	.nfan_cells	= ARRAY_SIZE(khadas_mcu_fan_cells),
+};
+
+static bool khadas_mcu_vim4_reg_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case KHADAS_MCU_PWR_OFF_CMD_REG:
+	case KHADAS_MCU_VIM4_REST_CONF_REG:
+	case KHADAS_MCU_WOL_INIT_START_REG:
+	case KHADAS_MCU_VIM4_LED_ON_RAM_REG:
+	case KHADAS_MCU_VIM4_FAN_CTRL_REG:
+	case KHADAS_MCU_VIM4_WDT_EN_REG:
+	case KHADAS_MCU_VIM4_SYS_RST_REG:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool khadas_mcu_vim4_reg_writeable(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case KHADAS_MCU_VERSION_0_REG:
+	case KHADAS_MCU_VERSION_1_REG:
+	case KHADAS_MCU_SHUTDOWN_NORMAL_STATUS_REG:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static const struct regmap_config khadas_mcu_vim4_regmap_config = {
+	.reg_bits	= 8,
+	.reg_stride	= 1,
+	.val_bits	= 8,
+	.max_register	= KHADAS_MCU_VIM4_SYS_RST_REG,
+	.volatile_reg	= khadas_mcu_vim4_reg_volatile,
+	.writeable_reg	= khadas_mcu_vim4_reg_writeable,
+	.cache_type	= REGCACHE_MAPLE,
+};
+
+static const struct khadas_mcu_fan_pdata khadas_vim4_fan_pdata = {
+	.fan_reg	= KHADAS_MCU_VIM4_FAN_CTRL_REG,
+	.max_level	= 0x64,
+};
+
+static const struct mfd_cell khadas_mcu_vim4_cells[] = {
+	{
+		.name		= "khadas-mcu-fan-ctrl",
+		.platform_data	= &khadas_vim4_fan_pdata,
+		.pdata_size	= sizeof(khadas_vim4_fan_pdata),
+	},
+};
+
+static const struct khadas_mcu_data khadas_vim4_mcu_data = {
+	.regmap_config	= &khadas_mcu_vim4_regmap_config,
+	.cells		= NULL,
+	.ncells		= 0,
+	.fan_cells	= khadas_mcu_vim4_cells,
+	.nfan_cells	= ARRAY_SIZE(khadas_mcu_vim4_cells),
+};
+
 static int khadas_mcu_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -94,28 +170,40 @@ static int khadas_mcu_probe(struct i2c_client *client)
 	if (!ddata)
 		return -ENOMEM;
 
+	switch ((uintptr_t)i2c_get_match_data(client)) {
+	case KHADAS_MCU_GENERIC:
+		ddata->data = &khadas_mcu_data;
+		break;
+	case KHADAS_MCU_VIM4:
+		ddata->data = &khadas_vim4_mcu_data;
+		break;
+	default:
+		return -ENODEV;
+	}
+
 	i2c_set_clientdata(client, ddata);
 
 	ddata->dev = dev;
 
-	ddata->regmap = devm_regmap_init_i2c(client, &khadas_mcu_regmap_config);
+	ddata->regmap = devm_regmap_init_i2c(client, ddata->data->regmap_config);
 	if (IS_ERR(ddata->regmap)) {
 		ret = PTR_ERR(ddata->regmap);
-		dev_err(dev, "Failed to allocate register map: %d\n", ret);
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to allocate register map\n");
 	}
 
-	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
-				   khadas_mcu_cells,
-				   ARRAY_SIZE(khadas_mcu_cells),
-				   NULL, 0, NULL);
-	if (ret)
-		return ret;
+	if (ddata->data->cells && ddata->data->ncells) {
+		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+					   ddata->data->cells,
+					   ddata->data->ncells,
+					   NULL, 0, NULL);
+		if (ret)
+			return ret;
+	}
 
 	if (of_property_present(dev->of_node, "#cooling-cells"))
 		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
-					    khadas_mcu_fan_cells,
-					    ARRAY_SIZE(khadas_mcu_fan_cells),
+					    ddata->data->fan_cells,
+					    ddata->data->nfan_cells,
 					    NULL, 0, NULL);
 
 	return 0;
@@ -123,7 +211,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
 
 #ifdef CONFIG_OF
 static const struct of_device_id khadas_mcu_of_match[] = {
-	{ .compatible = "khadas,mcu", },
+	{ .compatible = "khadas,mcu", .data = (void *)KHADAS_MCU_GENERIC },
+	{ .compatible = "khadas,vim4-mcu", .data = (void *)KHADAS_MCU_VIM4 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);

-- 
2.49.0



