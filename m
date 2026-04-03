Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3C4E85384
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BzcSw7vPRFLh2EUBcrYhqUwnxbIkB4ljkpRES7Otzs=; b=facDDUMLP6ND4/u7Dc6NmxbXKK
	jUNcisiuqmcjPzE6DiGYfy7XTgplxoumSs1GyxCmrZgo386i16dtXZ3s5dQlEigJ5yVyIyPhwU1Lf
	7Kvcz9i0zemw6HXrCw+HQ/oRYZVQQPi0wuPbbtXoWiv6WK8xn1K0U7fSLpwEfJyCmLft5BLwUMQ6G
	P9ObbYUNJI1V/7Ebf2o4tEagCBzWPlBEO4JSxNwdupJL6XA2UoWg1Ap0BnYFRpTxbd3jq78ehUZ9K
	pbWYPJBrUCbz9g4LFmxn8t0B8JO9Lw1R2Xe6BYX2K/ZPi/afFbHFUI53MxYZHqqQCYihiKXhgD3HC
	y8r8A0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5U-00000002GMX-2nH7;
	Fri, 03 Apr 2026 16:09:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5R-00000002GEU-0S3s;
	Fri, 03 Apr 2026 16:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2BzcSw7vPRFLh2EUBcrYhqUwnxbIkB4ljkpRES7Otzs=; b=JRU2TyWEMEXkmGBYsFn5WGsRB2
	kUBjoxRj/3AyyueyyJUuzg29eOU8ZLjjyYErwpjUdZjYSC39w4bVkayF75UFQXcwcaHIebLS7SDrz
	0R57lO65tg8r8TB0e7nZpduzbHkGmJ3na0anRQK9ZZzsxPHAlVzYxTxPenrpUDoENwIQxIekHn2eK
	IGe+uwc5bneJ5LyBLApaO57pmeHTxEctSPPOD+i9DQmwYX6pRb7kW+OVDjxv/Dsx1kW3G1sVbJ3mO
	3UFJmSjfhx4+yu0/ZHTBgEYfTW1fK1IY5tibmqMwz4REPMwL0KEO4zgwP0XupT52toMoVCAV002sc
	jKUJuUzQ==;
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h5M-00000004OCy-1f7M;
	Fri, 03 Apr 2026 16:09:31 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775232559;
	bh=emjopVGd5uVLfwcqEy71jr1NYUE1/T1lgxk1RfDuCzk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=syPq+mVRfCWfVMO5kwGj5d87YfQIA8M8v5mx3QAzGQPSVEB2LIRNy34U31VsWEhPI
	 zaYj4LvmDfdagEhc9HBu1qP9u5JLT87WVjtcdgIlBckDp1lYAy8ozszD4FbnkQUGbZ
	 NPM2Tx26mP9XX+gnqKZ7Ck6zFHtiyS7fmwOMyzN4=
Date: Fri, 03 Apr 2026 18:08:37 +0200
Subject: [PATCH v2 4/8] mfd: khadas-mcu: Add support for VIM4 MCU variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-add-mcu-fan-khadas-vim4-v2-4-70536b22439a@aliel.fr>
References: <20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr>
In-Reply-To: <20260403-add-mcu-fan-khadas-vim4-v2-0-70536b22439a@aliel.fr>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775232552; l=5062;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=emjopVGd5uVLfwcqEy71jr1NYUE1/T1lgxk1RfDuCzk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIsXEJ4KldedgbozLhByCUwgiAptnRgyd6YnNjxsASYMDtbP1w6KzoV+MY6POn72D1RG5kMF5hy
 F9AK2tmMcQg8=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_170928_666872_2A79EF6F 
X-CRM114-Status: GOOD (  13.53  )
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

Refactor probe() to use per-variant khadas_mcu_data
instead of hardcoded globals.

Add dedicated regmap configuration and device data for the VIM4 MCU,
with its own volatile/writeable registers.

Add the fan control register
(0–100 levels vs 0–3 for previous supported boards).

Add a new compatible string "khadas,vim4-mcu".

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/mfd/khadas-mcu.c | 106 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 95 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index ba981a7886921..b36b3b3ab73c0 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -75,15 +75,91 @@ static const struct regmap_config khadas_mcu_regmap_config = {
 	.cache_type	= REGCACHE_MAPLE,
 };
 
+static const struct khadas_mcu_fan_pdata khadas_mcu_fan_pdata = {
+	.fan_reg	= KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
+	.max_level	= 3,
+};
+
 static struct mfd_cell khadas_mcu_fan_cells[] = {
 	/* VIM1/2 Rev13+ and VIM3 only */
-	{ .name = "khadas-mcu-fan-ctrl", },
+	{
+		.name = "khadas-mcu-fan-ctrl",
+		.platform_data = &khadas_mcu_fan_pdata,
+		.pdata_size    = sizeof(khadas_mcu_fan_pdata),
+	},
 };
 
 static struct mfd_cell khadas_mcu_cells[] = {
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
@@ -94,28 +170,35 @@ static int khadas_mcu_probe(struct i2c_client *client)
 	if (!ddata)
 		return -ENOMEM;
 
+	ddata->data = i2c_get_match_data(client);
+	if (!ddata->data)
+		return -EINVAL;
+
 	i2c_set_clientdata(client, ddata);
 
 	ddata->dev = dev;
 
-	ddata->regmap = devm_regmap_init_i2c(client, &khadas_mcu_regmap_config);
+	ddata->regmap = devm_regmap_init_i2c(client,
+					     ddata->data->regmap_config);
 	if (IS_ERR(ddata->regmap)) {
 		ret = PTR_ERR(ddata->regmap);
 		dev_err(dev, "Failed to allocate register map: %d\n", ret);
 		return ret;
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
@@ -123,7 +206,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
 
 #ifdef CONFIG_OF
 static const struct of_device_id khadas_mcu_of_match[] = {
-	{ .compatible = "khadas,mcu", },
+	{ .compatible = "khadas,mcu", .data = &khadas_mcu_data },
+	{ .compatible = "khadas,vim4-mcu", .data = &khadas_vim4_mcu_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);

-- 
2.49.0


