Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F462C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mx0nEFIXpNYIGmqxOGntVSkofaMtXcIVBSvPTVVXgss=; b=xgw9vkF6Nvah3K2A3TTzIxD47G
	zll4ChuuHRBfW8SOAKlP2syynE0YbO3HuXCyoFzG6EG75vAz72UExdl4BOUe30sqjRrPHI2Y6pSYh
	FBs/ySzNyMpsM4mkPje1dBdsUZZmV+My04fVSNUGO4nLblUGxVEWNQGGQNg97JpmFE9GFPz8dShJ7
	9u5RySRKlv1rp2arTfayUaCS4jJZZDFytrtvXKnCwaVgWulWMr+neIIqRB3+4mwcDBS3p0KnYT0Sj
	NWU3pNyg/er5hCWhhe7y4Y1pfEtKZoiXYS0scKObwLOeRTkbGiXvAWytyQY4hrA01mjDqjoU+F761
	7lYMk0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x773K-0000000ApU1-03TJ;
	Thu, 17 Sep 2026 08:01:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7730-0000000ApDq-1Xri;
	Thu, 17 Sep 2026 08:00:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 637E9602D4;
	Thu, 17 Sep 2026 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A929C2BD04;
	Thu, 17 Sep 2026 08:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789632045;
	bh=+d8XlJStIrPlLf0i0LWNLFLSYKcxR9dxtCajhUKMsN8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PhQnjch/qI8r3sdt9UYX/COVJ4ZZur4CQ+Ty75HFRo4zNZVnVYH9CDOhbVKbGD/Yp
	 71/gllq0s5V/2bgQLOK5UiecaKfa1ji6aMiH7HLDOLkrn6XN/ntZ00qVlmqnR6f77y
	 ZJoeOMSBubXuTRlkVyy3mBwuiUO08jOmCz4mw+t/DvUwkww62Ag1ilxwrAi03g+geD
	 in5NEMpI+BIv6IZHRWa+E0X5Kobuk1QEk1MmKfOHRdaRaER0MvgfmyrbzQyxgu3i0/
	 mfoqnuwc+zU5dBwulA2DXih67T8/ZBR/9O4UD/SsMBEJI+8TR7pigYvCuXt71QUhsq
	 mj1NCevnfnc9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB31AC982D3;
	Thu, 17 Sep 2026 08:00:44 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 17 Sep 2026 09:59:02 +0200
Subject: [PATCH v12 3/6] mfd: khadas-mcu: Add support for VIM4 MCU variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add-mcu-fan-khadas-vim4-v12-3-497cd543a148@aliel.fr>
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4415;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=Q/kGNzPkcptM03i3MwBjKTn4st9t+jVHg+6yzSnT5b0=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9bqebJmM4P13onsTFyc1NMWKpm6sL+JzbW2MJRhmXtAa
 NfyGyYdpSwMYlwMsmKKLP1zLU+8u3z0zNc96ikwc1iZQIYwcHEKwETatzH8FdlQvy7L/nHjkcfh
 5kqG5Tu3+Mz01LjryxJ1eF684muLGEaG7jK9yGKJqiVbDtQkspmzMhY0+3erbTG7xH/z1MOne41
 ZAA==
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

Add a new compatible string "khadas,vim4-mcu".

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/mfd/khadas-mcu.c | 96 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index 0e74efe14f367..4b37e74e2b04a 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -84,38 +84,107 @@ static const struct mfd_cell khadas_mcu_cells[] = {
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
+static const struct mfd_cell khadas_mcu_vim4_fan_cells[] = {
+	MFD_CELL_NAME("khadas-mcu-vim4-fan"),
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
+	const void *mcu_variant;
 
 	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;
 
+	mcu_variant = i2c_get_match_data(client);
+	if (!mcu_variant)
+		return -ENODEV;
+
+	switch ((uintptr_t)mcu_variant) {
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
@@ -123,7 +192,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
 
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



