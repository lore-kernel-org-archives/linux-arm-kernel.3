Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C50FC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKxfAVjschJlYx2IfYQXxKkBwb2tbT6rq8uyRxwxvzQ=; b=n/awiD4qgR1nkVf1MkQSXxBQ0L
	BkwLRfm2201AaW2UGIF+i4Dl9UTBnDj059Jm0ItGPWtG7xe+p4R4fHW18KaAQps08WPtKg0K3NZiv
	XOvFrTHctKLIi1iMmCyA9MFUcIliRSVR/gJtyk9wj2/WK3tpjw5DJdu7mUdRR9T9dLpyrshI0LnN5
	W9i14VlatztS8JxB3mGyK5ZJP5yHZOes1NiCdl5XQTSV7QLzbjcKVKma4Nhh+B9LJje/U0Gg3kLat
	NlY5rwPdPCLqmP4TMbJv4uokd0KQJqCS0JWdmsbfqcOdZgHVwQaFGbRudq2tLCcvVLes9YSwg64iM
	rTZDj+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QOr-0000000CUC1-1iPp;
	Tue, 01 Sep 2026 15:27:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QOp-0000000CU8q-1S13;
	Tue, 01 Sep 2026 15:27:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CECC543394;
	Tue,  1 Sep 2026 15:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2BBDC32781;
	Tue,  1 Sep 2026 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788276466;
	bh=TpKUTT9UnXyJkMGklfvshLexshR4zNIwKPjchubwhf0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U0jSXkIzzo2cu71Bg36KXpqDdrw+lxNwmfn3nwqbgHfbXjnej2K4zkdefF1eMSA3T
	 0gJ0GuQ0NXhUREksAIsqn9g6wNh+oJgtdiLvliOQobp0PzrvxS4WbcqHjozuYgi9zu
	 ECrw9/M8o4RnRWZW1u12S77N0FHNqEfd4s4s/tRma0q8NH2CUTbr1TfKuGbA1NdSGa
	 DCjJo395ChWlNWJJ6QOefU0/PI7S53LiByyO2ITAzxLBiB1K2YhtwGH65kGzX9qApR
	 q6ShBXj06B1ZD29/kHxykTSczI1Z57c00Wqhxn4WMD4n3B+hWusv059pRFC6TnfgnR
	 Uag7tp4E2FK7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87253C624D6;
	Tue,  1 Sep 2026 15:27:46 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Tue, 01 Sep 2026 17:25:54 +0200
Subject: [PATCH v10 3/6] mfd: khadas-mcu: Add support for VIM4 MCU variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-add-mcu-fan-khadas-vim4-v10-3-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
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
 mfd@lists.linux.dev, Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5696;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=huWXhUHwpCRJwBvPNQon4ySNunAT1WR74/SHbV4RoFk=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9a0d29q46QDV5q/Ntmc5Sr4lWVp7L+tvkbGbOuTlM5M1
 xAXvtPcUcrCIMbFICumyNI/1/LEu8tHz3zdo54CM4eVCWQIAxenAExkyzJGhqXthlkz67aePNb+
 47faAo3QFh79aS3XAxt/7mD/+CP86kdGhmdpS7d/Sjo0d8qFxfvOCvxoTek27RGR4Dx2eEF5Gsu
 Ffm4A
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

Refactor probe() to use per-variant values
instead of hardcoded globals.

Add dedicated regmap configuration for the VIM4 MCU,
with its own volatile/writeable registers.

Introduce struct khadas_mcu_fan_pdata to pass the fan
control register and duty-cycle levels per variant.
VIM4 uses a different register and level set (0-100)
 declared as a list (0, 30, 40, 55, 75, 100) compared
 to previous boards (0-3).

Add a new compatible string "khadas,vim4-mcu".

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/mfd/khadas-mcu.c | 120 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 106 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index 0e74efe14f367..4cb305ac915e1 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -75,47 +75,138 @@ static const struct regmap_config khadas_mcu_regmap_config = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
+static const unsigned int khadas_mcu_fan_levels[] = {
+	0, 1, 2, 3,
+};
+
+static const struct khadas_mcu_fan_pdata khadas_mcu_fan_pdata = {
+	.fan_reg	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
+	.levels		= khadas_mcu_fan_levels,
+	.nlevels	= ARRAY_SIZE(khadas_mcu_fan_levels),
+};
+
 static const struct mfd_cell khadas_mcu_fan_cells[] = {
 	/* VIM1/2 Rev13+ and VIM3 only */
-	MFD_CELL_NAME("khadas-mcu-fan-ctrl"),
+	MFD_CELL_BASIC("khadas-mcu-fan-ctrl", NULL, &khadas_mcu_fan_pdata,
+		       sizeof(khadas_mcu_fan_pdata), 0),
 };
 
 static const struct mfd_cell khadas_mcu_cells[] = {
 	MFD_CELL_NAME("khadas-mcu-user-mem"),
 };
 
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
+static const unsigned int khadas_mcu_vim4_fan_levels[] = {
+	0, 30, 40, 55, 75, 100,
+};
+
+static const struct khadas_mcu_fan_pdata khadas_mcu_vim4_fan_pdata = {
+	.fan_reg	= KHADAS_MCU_VIM4_FAN_CTRL_REG,
+	.levels		= khadas_mcu_vim4_fan_levels,
+	.nlevels	= ARRAY_SIZE(khadas_mcu_vim4_fan_levels),
+};
+
+static const struct mfd_cell khadas_mcu_vim4_fan_cells[] = {
+	MFD_CELL_BASIC("khadas-mcu-fan-ctrl", NULL, &khadas_mcu_vim4_fan_pdata,
+		       sizeof(khadas_mcu_vim4_fan_pdata), 0),
+};
+
 static int khadas_mcu_probe(struct i2c_client *client)
 {
+	const struct mfd_cell *cells, *fan_cells;
+	const struct regmap_config *regmap_cfg;
 	struct device *dev = &client->dev;
+	int ncells, nfan_cells, ret;
 	struct khadas_mcu *ddata;
-	int ret;
+	const void *match;
 
 	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;
 
+	match = i2c_get_match_data(client);
+	if (!match)
+		return -ENODEV;
+
+	switch ((uintptr_t)match) {
+	case KHADAS_MCU_GENERIC:
+		regmap_cfg	= &khadas_mcu_regmap_config;
+		cells		= khadas_mcu_cells;
+		ncells		= ARRAY_SIZE(khadas_mcu_cells);
+		fan_cells	= khadas_mcu_fan_cells;
+		nfan_cells	= ARRAY_SIZE(khadas_mcu_fan_cells);
+		break;
+	case KHADAS_MCU_VIM4:
+		regmap_cfg	= &khadas_mcu_vim4_regmap_config;
+		cells		= NULL;
+		ncells		= 0;
+		fan_cells	= khadas_mcu_vim4_fan_cells;
+		nfan_cells	= ARRAY_SIZE(khadas_mcu_vim4_fan_cells);
+		break;
+	default:
+		return -ENODEV;
+	}
+
 	i2c_set_clientdata(client, ddata);
 
 	ddata->dev = dev;
 
-	ddata->regmap = devm_regmap_init_i2c(client, &khadas_mcu_regmap_config);
+	ddata->regmap = devm_regmap_init_i2c(client, regmap_cfg);
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
+	if (cells && ncells) {
+		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
+					   cells,
+					   ncells,
+					   NULL, 0, NULL);
+		if (ret)
+			return ret;
+	}
 
 	if (of_property_present(dev->of_node, "#cooling-cells"))
 		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
-					    khadas_mcu_fan_cells,
-					    ARRAY_SIZE(khadas_mcu_fan_cells),
+					    fan_cells,
+					    nfan_cells,
 					    NULL, 0, NULL);
 
 	return 0;
@@ -123,7 +214,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
 
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



