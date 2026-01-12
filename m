Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C6EC9EC80
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIH643sYoJOcH1Mru2R+3Oj0JEsbAevRoY9PB/3oBTA=; b=oGCEYlWuaHYyaVFYNMJYziRhWy
	zaaBjZx4A9khsRdURUPbFjQ6XH/QdkCRbIusvolqh4iflWCgSrVYt/XF4wFNqEl8JBqbq380CAEbd
	WvPpiNmKiPKB5jz/AvR48i1yijhZ84LJ2KkB93NlDMvA6ONOH504aFOQzu2vdmZs3ssiekGR6KhRW
	ieHly/JndJuT2VBWsgBvP5lVD9rnUhBM3frGIt6gtEKMvEXzZfxj+gnOlPIDtlREr0hPfnLIrvkEn
	/I7SWBz65aYZLWmtwpIYkS6OnKH2/23e83bUOBkg36ka+xQwjXtmHVmpd23dN6+67SIJSBQwx4uO8
	nLOpgbtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHHV-00000005L9l-20sX;
	Mon, 12 Jan 2026 12:44:25 +0000
Received: from mail-m155115.qiye.163.com ([101.71.155.115])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHHS-00000005L6E-1Qip;
	Mon, 12 Jan 2026 12:44:23 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 305730454;
	Mon, 12 Jan 2026 20:44:18 +0800 (GMT+08:00)
From: Joseph Chen <chenjh@rock-chips.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Joseph Chen <chenjh@rock-chips.com>
Subject: [PATCH v3 2/3] mfd: rk8xx: Add RK801 support
Date: Mon, 12 Jan 2026 20:43:50 +0800
Message-Id: <20260112124351.17707-3-chenjh@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260112124351.17707-1-chenjh@rock-chips.com>
References: <20260112124351.17707-1-chenjh@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bb23c5c9809d2kunm3fddfe07a7f1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkgdGFZPSB1NTU5NSRhDSktWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LMCaxcQw263JenxWxtyHR9L2vOi8br+dIvrvju+RErWkrhV78Cg+UyzAry2o5RzTLD550JA9vc8C3WwjKU7UNQ4nZKZrdhHSIr1ZXrkHSmLFUG0kmaT6pVL/9BKmu46cJzXmvRMuMIOyyt2OKlrJQSosiLk4zSV0R/8ijqdpN2M=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nIH643sYoJOcH1Mru2R+3Oj0JEsbAevRoY9PB/3oBTA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_044422_617555_DCA89588 
X-CRM114-Status: GOOD (  18.51  )
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

The RK801 is a Power Management IC (PMIC) for multimedia
and handheld devices. It contains the following components:

- 4 BUCK
- 2 LDO
- 1 SWITCH

Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
---
 drivers/mfd/Kconfig       |   6 +-
 drivers/mfd/rk8xx-core.c  |  81 ++++++++++++++++++++++++++
 drivers/mfd/rk8xx-i2c.c   |  33 ++++++++++-
 include/linux/mfd/rk808.h | 118 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 234 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6cec1858947..2f11f95343e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1355,15 +1355,15 @@ config MFD_RK8XX
 	select MFD_CORE
 
 config MFD_RK8XX_I2C
-	tristate "Rockchip RK805/RK808/RK809/RK816/RK817/RK818 Power Management Chip"
+	tristate "Rockchip RK8xx Power Management Chips"
 	depends on I2C && OF
 	select MFD_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
 	select MFD_RK8XX
 	help
-	  If you say yes here you get support for the RK805, RK808, RK809,
-	  RK816, RK817 and RK818 Power Management chips.
+	  If you say yes here you get support for the RK801, RK805, RK808,
+	  RK809, RK816, RK817 and RK818 Power Management chips.
 	  This driver provides common support for accessing the device
 	  through I2C interface. The device supports multiple sub-devices
 	  including interrupts, RTC, LDO & DCDC regulators, and onkey.
diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index def4587fdfb..3dcf6abfda7 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -37,6 +37,11 @@ static const struct resource rk817_rtc_resources[] = {
 	DEFINE_RES_IRQ(RK817_IRQ_RTC_ALARM),
 };
 
+static const struct resource rk801_key_resources[] = {
+	DEFINE_RES_IRQ(RK801_IRQ_PWRON_FALL),
+	DEFINE_RES_IRQ(RK801_IRQ_PWRON_RISE),
+};
+
 static const struct resource rk805_key_resources[] = {
 	DEFINE_RES_IRQ(RK805_IRQ_PWRON_RISE),
 	DEFINE_RES_IRQ(RK805_IRQ_PWRON_FALL),
@@ -57,6 +62,14 @@ static const struct resource rk817_charger_resources[] = {
 	DEFINE_RES_IRQ(RK817_IRQ_PLUG_OUT),
 };
 
+static const struct mfd_cell rk801s[] = {
+	{ .name = "rk808-regulator", },
+	{	.name = "rk805-pwrkey",
+		.num_resources = ARRAY_SIZE(rk801_key_resources),
+		.resources = &rk801_key_resources[0],
+	},
+};
+
 static const struct mfd_cell rk805s[] = {
 	{ .name = "rk808-clkout", },
 	{ .name = "rk808-regulator", },
@@ -139,6 +152,15 @@ static const struct mfd_cell rk818s[] = {
 	},
 };
 
+static const struct rk808_reg_data rk801_pre_init_reg[] = {
+	{ RK801_SLEEP_CFG_REG, RK801_SLEEP_FUN_MSK, RK801_NONE_FUN },
+	{ RK801_SYS_CFG2_REG, RK801_RST_MSK, RK801_RST_RESTART_REG_RESETB },
+	{ RK801_INT_CONFIG_REG, RK801_INT_POL_MSK, RK801_INT_ACT_L },
+	{ RK801_POWER_FPWM_EN_REG, RK801_PLDO_HRDEC_EN, RK801_PLDO_HRDEC_EN },
+	{ RK801_BUCK_DEBUG5_REG, MASK_ALL, 0x54 },
+	{ RK801_CON_BACK1_REG, MASK_ALL, 0x18 },
+};
+
 static const struct rk808_reg_data rk805_pre_init_reg[] = {
 	{RK805_BUCK1_CONFIG_REG, RK805_BUCK1_2_ILMAX_MASK,
 				 RK805_BUCK1_2_ILMAX_4000MA},
@@ -284,6 +306,37 @@ static const struct rk808_reg_data rk818_pre_init_reg[] = {
 						    VB_LO_SEL_3500MV },
 };
 
+static const struct regmap_irq rk801_irqs[] = {
+	[RK801_IRQ_PWRON_FALL] = {
+		.mask = RK801_IRQ_PWRON_FALL_MSK,
+		.reg_offset = 0,
+	},
+	[RK801_IRQ_PWRON_RISE] = {
+		.mask = RK801_IRQ_PWRON_RISE_MSK,
+		.reg_offset = 0,
+	},
+	[RK801_IRQ_PWRON] = {
+		.mask = RK801_IRQ_PWRON_MSK,
+		.reg_offset = 0,
+	},
+	[RK801_IRQ_PWRON_LP] = {
+		.mask = RK801_IRQ_PWRON_LP_MSK,
+		.reg_offset = 0,
+	},
+	[RK801_IRQ_HOTDIE] = {
+		.mask = RK801_IRQ_HOTDIE_MSK,
+		.reg_offset = 0,
+	},
+	[RK801_IRQ_VDC_RISE] = {
+		.mask = RK801_IRQ_VDC_RISE_MSK,
+		.reg_offset = 0,
+	},
+	[RK801_IRQ_VDC_FALL] = {
+		.mask = RK801_IRQ_VDC_FALL_MSK,
+		.reg_offset = 0,
+	},
+};
+
 static const struct regmap_irq rk805_irqs[] = {
 	[RK805_IRQ_PWRON_RISE] = {
 		.mask = RK805_IRQ_PWRON_RISE_MSK,
@@ -532,6 +585,17 @@ static const struct regmap_irq rk817_irqs[RK817_IRQ_END] = {
 	REGMAP_IRQ_REG_LINE(23, 8)
 };
 
+static const struct regmap_irq_chip rk801_irq_chip = {
+	.name = "rk801",
+	.irqs = rk801_irqs,
+	.num_irqs = ARRAY_SIZE(rk801_irqs),
+	.num_regs = 1,
+	.status_base = RK801_INT_STS0_REG,
+	.mask_base = RK801_INT_MASK0_REG,
+	.ack_base = RK801_INT_STS0_REG,
+	.init_ack_masked = true,
+};
+
 static const struct regmap_irq_chip rk805_irq_chip = {
 	.name = "rk805",
 	.irqs = rk805_irqs,
@@ -610,6 +674,10 @@ static int rk808_power_off(struct sys_off_data *data)
 	unsigned int reg, bit;
 
 	switch (rk808->variant) {
+	case RK801_ID:
+		reg = RK801_SYS_CFG2_REG;
+		bit = DEV_OFF;
+		break;
 	case RK805_ID:
 		reg = RK805_DEV_CTRL_REG;
 		bit = DEV_OFF;
@@ -714,6 +782,13 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	dev_set_drvdata(dev, rk808);
 
 	switch (rk808->variant) {
+	case RK801_ID:
+		rk808->regmap_irq_chip = &rk801_irq_chip;
+		pre_init_reg = rk801_pre_init_reg;
+		nr_pre_init_regs = ARRAY_SIZE(rk801_pre_init_reg);
+		cells = rk801s;
+		nr_cells = ARRAY_SIZE(rk801s);
+		break;
 	case RK805_ID:
 		rk808->regmap_irq_chip = &rk805_irq_chip;
 		pre_init_reg = rk805_pre_init_reg;
@@ -831,6 +906,12 @@ int rk8xx_suspend(struct device *dev)
 	int ret = 0;
 
 	switch (rk808->variant) {
+	case RK801_ID:
+		ret = regmap_update_bits(rk808->regmap,
+					 RK801_SLEEP_CFG_REG,
+					 RK801_SLEEP_FUN_MSK,
+					 RK801_SLEEP_FUN);
+		break;
 	case RK805_ID:
 		ret = regmap_update_bits(rk808->regmap,
 					 RK805_GPIO_IO_POL_REG,
diff --git a/drivers/mfd/rk8xx-i2c.c b/drivers/mfd/rk8xx-i2c.c
index 37287b06dab..2951b2911a3 100644
--- a/drivers/mfd/rk8xx-i2c.c
+++ b/drivers/mfd/rk8xx-i2c.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Rockchip RK805/RK808/RK816/RK817/RK818 Core (I2C) driver
+ * Rockchip RK801/RK805/RK808/RK816/RK817/RK818 Core (I2C) driver
  *
  * Copyright (c) 2014, Fuzhou Rockchip Electronics Co., Ltd
  * Copyright (C) 2016 PHYTEC Messtechnik GmbH
@@ -21,6 +21,23 @@ struct rk8xx_i2c_platform_data {
 	int variant;
 };
 
+static bool rk801_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case RK801_SYS_STS_REG:
+	case RK801_INT_STS0_REG:
+	case RK801_SYS_CFG0_REG:
+	case RK801_SYS_CFG1_REG:
+	case RK801_SYS_CFG2_REG:
+	case RK801_SYS_CFG3_REG:
+	case RK801_SYS_CFG4_REG:
+	case RK801_SLEEP_CFG_REG:
+		return true;
+	}
+
+	return false;
+}
+
 static bool rk806_is_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -124,6 +141,14 @@ static const struct regmap_config rk818_regmap_config = {
 	.volatile_reg = rk808_is_volatile_reg,
 };
 
+static const struct regmap_config rk801_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = RK801_SYS_CFG3_OTP_REG,
+	.cache_type = REGCACHE_RBTREE,
+	.volatile_reg = rk801_is_volatile_reg,
+};
+
 static const struct regmap_config rk805_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -164,6 +189,11 @@ static const struct regmap_config rk817_regmap_config = {
 	.volatile_reg = rk817_is_volatile_reg,
 };
 
+static const struct rk8xx_i2c_platform_data rk801_data = {
+	.regmap_cfg = &rk801_regmap_config,
+	.variant = RK801_ID,
+};
+
 static const struct rk8xx_i2c_platform_data rk805_data = {
 	.regmap_cfg = &rk805_regmap_config,
 	.variant = RK805_ID,
@@ -224,6 +254,7 @@ static void rk8xx_i2c_shutdown(struct i2c_client *client)
 static SIMPLE_DEV_PM_OPS(rk8xx_i2c_pm_ops, rk8xx_suspend, rk8xx_resume);
 
 static const struct of_device_id rk8xx_i2c_of_match[] = {
+	{ .compatible = "rockchip,rk801", .data = &rk801_data },
 	{ .compatible = "rockchip,rk805", .data = &rk805_data },
 	{ .compatible = "rockchip,rk806", .data = &rk806_data },
 	{ .compatible = "rockchip,rk808", .data = &rk808_data },
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 28170ee0889..7ffc904c864 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -340,6 +340,123 @@ enum rk818_reg {
 #define RK818_USB_ILMIN_2000MA		0x7
 #define RK818_USB_CHG_SD_VSEL_MASK	0x70
 
+/* RK801 */
+enum rk801_reg {
+	RK801_ID_DCDC1,
+	RK801_ID_DCDC2,
+	RK801_ID_DCDC4,
+	RK801_ID_DCDC3,
+	RK801_ID_LDO1,
+	RK801_ID_LDO2,
+	RK801_ID_SWITCH,
+	RK801_ID_MAX,
+};
+
+#define RK801_SLP_REG_OFFSET		5
+#define RK801_NUM_REGULATORS		7
+
+#define RK801_HW_SYNC_US		32
+
+/* RK801 Register Definitions */
+#define RK801_ID_MSB			0x00
+#define RK801_ID_LSB			0x01
+#define RK801_OTP_VER_REG		0x02
+#define RK801_POWER_EN0_REG		0x03
+#define RK801_POWER_EN1_REG		0x04
+#define RK801_POWER_SLP_EN_REG		0x05
+#define RK801_POWER_FPWM_EN_REG		0x06
+#define RK801_SLP_LP_CONFIG_REG		0x07
+#define RK801_BUCK_CONFIG_REG		0x08
+#define RK801_BUCK1_ON_VSEL_REG		0x09
+#define RK801_BUCK2_ON_VSEL_REG		0x0a
+#define RK801_BUCK4_ON_VSEL_REG		0x0b
+#define RK801_LDO1_ON_VSEL_REG		0x0c
+#define RK801_LDO2_ON_VSEL_REG		0x0d
+#define RK801_BUCK1_SLP_VSEL_REG	0x0e
+#define RK801_BUCK2_SLP_VSEL_REG	0x0f
+#define RK801_BUCK4_SLP_VSEL_REG	0x10
+#define RK801_LDO1_SLP_VSEL_REG		0x11
+#define RK801_LDO2_SLP_VSEL_REG		0x12
+#define RK801_LDO_SW_IMAX_REG		0x13
+#define RK801_SYS_STS_REG		0x14
+#define RK801_SYS_CFG0_REG		0x15
+#define RK801_SYS_CFG1_REG		0x16
+#define RK801_SYS_CFG2_REG		0x17
+#define RK801_SYS_CFG3_REG		0x18
+#define RK801_SYS_CFG4_REG		0x19
+#define RK801_SLEEP_CFG_REG		0x1a
+#define RK801_ON_SOURCE_REG		0x1b
+#define RK801_OFF_SOURCE_REG		0x1c
+#define RK801_PWRON_KEY_REG		0x1d
+#define RK801_INT_STS0_REG		0x1e
+#define RK801_INT_MASK0_REG		0x1f
+#define RK801_INT_CONFIG_REG		0x20
+#define RK801_CON_BACK1_REG		0x21
+#define RK801_CON_BACK2_REG		0x22
+#define RK801_DATA_CON0_REG		0x23
+#define RK801_DATA_CON1_REG		0x24
+#define RK801_DATA_CON2_REG		0x25
+#define RK801_DATA_CON3_REG		0x26
+#define RK801_POWER_EXIT_SLP_SEQ0_REG	0x27
+#define RK801_POWER_EXIT_SLP_SEQ1_REG	0x28
+#define RK801_POWER_EXIT_SLP_SEQ2_REG	0x29
+#define RK801_POWER_EXIT_SLP_SEQ3_REG	0x2a
+#define RK801_POWER_ENTER_SLP_OR_SHTD_SEQ0_REG	0x2b
+#define RK801_POWER_ENTER_SLP_OR_SHTD_SEQ1_REG	0x2c
+#define RK801_POWER_ENTER_SLP_OR_SHTD_SEQ2_REG	0x2d
+#define RK801_POWER_ENTER_SLP_OR_SHTD_SEQ3_REG	0x2e
+#define RK801_BUCK_DEBUG1_REG		0x2f
+#define RK801_BUCK_DEBUG2_REG		0x30
+#define RK801_BUCK_DEBUG3_REG		0x31
+#define RK801_BUCK_DEBUG4_REG		0x32
+#define RK801_BUCK_DEBUG5_REG		0x33
+#define RK801_BUCK_DEBUG7_REG		0x34
+#define RK801_OTP_EN_CON_REG		0x35
+#define RK801_TEST_CON_REG		0x36
+#define RK801_EFUSE_CONTROL_REG		0x37
+#define RK801_SYS_CFG3_OTP_REG		0x38
+
+/* RK801 IRQ Definitions */
+#define RK801_IRQ_PWRON_FALL		0
+#define RK801_IRQ_PWRON_RISE		1
+#define RK801_IRQ_PWRON			2
+#define RK801_IRQ_PWRON_LP		3
+#define RK801_IRQ_HOTDIE		4
+#define RK801_IRQ_VDC_RISE		5
+#define RK801_IRQ_VDC_FALL		6
+#define RK801_IRQ_PWRON_FALL_MSK	BIT(0)
+#define RK801_IRQ_PWRON_RISE_MSK	BIT(1)
+#define RK801_IRQ_PWRON_MSK		BIT(2)
+#define RK801_IRQ_PWRON_LP_MSK		BIT(3)
+#define RK801_IRQ_HOTDIE_MSK		BIT(4)
+#define RK801_IRQ_VDC_RISE_MSK		BIT(5)
+#define RK801_IRQ_VDC_FALL_MSK		BIT(6)
+/* RK801_SLP_LP_CONFIG_REG */
+#define RK801_BUCK_SLP_LP_EN		BIT(3)
+#define RK801_PLDO_SLP_LP_EN		BIT(1)
+#define RK801_SLP_LP_MASK		(RK801_PLDO_SLP_LP_EN | RK801_BUCK_SLP_LP_EN)
+/* RK801_SLEEP_CFG_REG */
+#define RK801_SLEEP_FUN_MSK		0x3
+#define RK801_NONE_FUN			0x0
+#define RK801_SLEEP_FUN			0x1
+#define RK801_SHUTDOWN_FUN		0x2
+#define RK801_RESET_FUN			0x3
+/* RK801_SYS_CFG2_REG */
+#define RK801_SLEEP_POL_MSK		BIT(1)
+#define RK801_SLEEP_ACT_H		BIT(1)
+#define RK801_SLEEP_ACT_L		0
+#define RK801_RST_MSK			(0x3 << 4)
+#define RK801_RST_RESTART_PMU		(0x0 << 4)
+#define RK801_RST_RESTART_REG		(0x1 << 4)
+#define RK801_RST_RESTART_REG_RESETB	(0x2 << 4)
+/* RK801_INT_CONFIG_REG */
+#define RK801_INT_POL_MSK		BIT(1)
+#define RK801_INT_ACT_H			BIT(1)
+#define RK801_INT_ACT_L			0
+#define RK801_FPWM_MODE			1
+#define RK801_AUTO_PWM_MODE		0
+#define RK801_PLDO_HRDEC_EN		BIT(6)
+
 /* RK805 */
 enum rk805_reg {
 	RK805_ID_DCDC1,
@@ -1332,6 +1449,7 @@ enum {
 };
 
 enum {
+	RK801_ID = 0x8010,
 	RK805_ID = 0x8050,
 	RK806_ID = 0x8060,
 	RK808_ID = 0x0000,
-- 
2.25.1


