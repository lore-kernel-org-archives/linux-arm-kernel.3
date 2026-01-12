Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C97FC9EC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDhga68n+rYDE/C594tUPTcK6XVKW0sjey2R7tsZcT0=; b=PB6NNje3FlsyBesuQ77B8qMLTo
	qyPVVzWxOYsnFwkIswa2DJM5nYMAYJYUirdDanXZbEgGKYp/mPgGI0B8tIsnMCR7TWIEIj6Vswb+v
	9P+jIc/e94JarmqtBlRCgePZorRQrcdZncx6JeOBGWQQQtxJJjN6hfxnZdsVjQPuO2b579zrgKLlP
	paJjFcdRK1lfISEXQ3v75UZsf3uqitXGjwrage87yKQ505P/PDfmy1fsw589TE213ogBkHhLu7WzQ
	LGknZTuIse4dIe5rYBTwFhoTb4/27sAzXhiiLQALz4Lq1GlnaYXRL/JfEvZeAuBAyvbB8m0OW110+
	8yvtTLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHHu-00000005LM0-2uA3;
	Mon, 12 Jan 2026 12:44:50 +0000
Received: from mail-m49236.qiye.163.com ([45.254.49.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHHq-00000005LKK-1M7m;
	Mon, 12 Jan 2026 12:44:49 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 305730496;
	Mon, 12 Jan 2026 20:44:42 +0800 (GMT+08:00)
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
Subject: [PATCH v3 3/3] regulator: rk808: Add RK801 support
Date: Mon, 12 Jan 2026 20:43:51 +0800
Message-Id: <20260112124351.17707-4-chenjh@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260112124351.17707-1-chenjh@rock-chips.com>
References: <20260112124351.17707-1-chenjh@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bb23cb98409d2kunm3fddfe07a8e6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh1MT1ZITB4dT0xISUtMSU5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jMTY5XKhEoxbSfVS9iqsQARjm3adU1cEjL54vPMR+iBh3c2XS4g13cnieR9DLgw/qW5crnjb6RIAhbawLoen0EwtEcxVx8AhKoiP7ZoNXcxAWyq586T6euZ/ZoXW3O07U4na5llJCFszkTu7QwBHdjcMHpws6UB+odCE0hYCOww=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=bDhga68n+rYDE/C594tUPTcK6XVKW0sjey2R7tsZcT0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_044446_554846_5C5724D6 
X-CRM114-Status: GOOD (  16.56  )
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

Add support for rk801 to the existing rk808 regulator driver.
It provides 4 BUCK, 2 LDO and 1 SWITCH.

Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
---
 drivers/regulator/rk808-regulator.c | 243 ++++++++++++++++++++++++++++
 1 file changed, 243 insertions(+)

diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
index 1e814247965..e66408f23bb 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -24,6 +24,9 @@
 #include <linux/gpio/consumer.h>
 
 /* Field definitions */
+#define RK801_BUCK_VSEL_MASK		0x7f
+#define RK801_LDO_VSEL_MASK		0x3f
+
 #define RK808_BUCK_VSEL_MASK	0x3f
 #define RK808_BUCK4_VSEL_MASK	0xf
 #define RK808_LDO_VSEL_MASK	0x1f
@@ -158,6 +161,11 @@
 	RK8XX_DESC_COM(_id, _match, _supply, _min, _max, _step, _vreg,	\
 	_vmask, _ereg, _emask, 0, 0, _etime, &rk808_reg_ops)
 
+#define RK801_DESC(_id, _match, _supply, _min, _max, _step, _vreg,	\
+	_vmask, _ereg, _emask, _disval, _etime)				\
+	RK8XX_DESC_COM(_id, _match, _supply, _min, _max, _step, _vreg,	\
+	_vmask, _ereg, _emask, _emask, _disval, _etime, &rk801_reg_ops)
+
 #define RK816_DESC(_id, _match, _supply, _min, _max, _step, _vreg,	\
 	_vmask, _ereg, _emask, _disval, _etime)				\
 	RK8XX_DESC_COM(_id, _match, _supply, _min, _max, _step, _vreg,	\
@@ -185,6 +193,11 @@
 		.ops		= _ops					\
 	}
 
+#define RK801_DESC_SWITCH(_id, _match, _supply, _ereg, _emask,		\
+	_disval)							\
+	RKXX_DESC_SWITCH_COM(_id, _match, _supply, _ereg, _emask,	\
+	_emask, _disval, &rk801_switch_ops)
+
 #define RK817_DESC_SWITCH(_id, _match, _supply, _ereg, _emask,		\
 	_disval)							\
 	RKXX_DESC_SWITCH_COM(_id, _match, _supply, _ereg, _emask,	\
@@ -802,6 +815,115 @@ static unsigned int rk8xx_regulator_of_map_mode(unsigned int mode)
 	}
 }
 
+static unsigned int rk801_get_mode(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	int err;
+
+	err = regmap_read(rdev->regmap, RK801_POWER_FPWM_EN_REG, &val);
+	if (err)
+		return err;
+
+	if (val & BIT(rdev->desc->id))
+		return REGULATOR_MODE_FAST;
+	else
+		return REGULATOR_MODE_NORMAL;
+}
+
+static int rk801_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	unsigned int offset = rdev->desc->id;
+
+	switch (mode) {
+	case REGULATOR_MODE_FAST:
+		return regmap_update_bits(rdev->regmap, RK801_POWER_FPWM_EN_REG,
+					  BIT(offset), RK801_FPWM_MODE << offset);
+	case REGULATOR_MODE_NORMAL:
+		return regmap_update_bits(rdev->regmap, RK801_POWER_FPWM_EN_REG,
+					  BIT(offset), RK801_AUTO_PWM_MODE << offset);
+	default:
+		dev_err(&rdev->dev, "do not support this mode\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rk801_set_suspend_voltage(struct regulator_dev *rdev, int uv)
+{
+	unsigned int reg;
+	int sel;
+
+	if (rdev->desc->id < RK801_ID_LDO1)
+		sel = regulator_map_voltage_linear_range(rdev, uv, uv);
+	else
+		sel = regulator_map_voltage_linear(rdev, uv, uv);
+	if (sel < 0)
+		return -EINVAL;
+
+	reg = rdev->desc->vsel_reg + RK801_SLP_REG_OFFSET;
+
+	return regmap_update_bits(rdev->regmap, reg,
+				  rdev->desc->vsel_mask, sel);
+}
+
+static int rk801_set_suspend_enable(struct regulator_dev *rdev)
+{
+	return regmap_update_bits(rdev->regmap, RK801_POWER_SLP_EN_REG,
+				  BIT(rdev->desc->id), BIT(rdev->desc->id));
+}
+
+static int rk801_set_suspend_disable(struct regulator_dev *rdev)
+{
+	return regmap_update_bits(rdev->regmap, RK801_POWER_SLP_EN_REG,
+				  BIT(rdev->desc->id), 0);
+}
+
+static int rk801_set_voltage_time_sel(struct regulator_dev *rdev,
+				      unsigned int old_selector,
+				      unsigned int new_selector)
+{
+	return regulator_set_voltage_time_sel(rdev, old_selector,
+					      new_selector) + RK801_HW_SYNC_US;
+}
+
+static const struct regulator_ops rk801_buck_ops = {
+	.list_voltage		= regulator_list_voltage_linear_range,
+	.map_voltage		= regulator_map_voltage_linear_range,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.set_voltage_time_sel	= rk801_set_voltage_time_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_mode		= rk801_set_mode,
+	.get_mode		= rk801_get_mode,
+	.set_suspend_voltage	= rk801_set_suspend_voltage,
+	.set_suspend_enable	= rk801_set_suspend_enable,
+	.set_suspend_disable	= rk801_set_suspend_disable,
+};
+
+static const struct regulator_ops rk801_reg_ops = {
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_suspend_voltage	= rk801_set_suspend_voltage,
+	.set_suspend_enable	= rk801_set_suspend_enable,
+	.set_suspend_disable	= rk801_set_suspend_disable,
+};
+
+static const struct regulator_ops rk801_switch_ops = {
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_suspend_enable	= rk801_set_suspend_enable,
+	.set_suspend_disable	= rk801_set_suspend_disable,
+};
+
 static const struct regulator_ops rk805_reg_ops = {
 	.list_voltage           = regulator_list_voltage_linear,
 	.map_voltage            = regulator_map_voltage_linear,
@@ -1049,6 +1171,123 @@ static const struct regulator_ops rk817_switch_ops = {
 	.set_suspend_disable	= rk817_set_suspend_disable,
 };
 
+static const struct linear_range rk801_buck1_voltage_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000,   0, 80, 12500),	/* 0.5v - 1.5v */
+	REGULATOR_LINEAR_RANGE(1800000, 81, 82, 400000),/* 1.8v - 2.2v */
+	REGULATOR_LINEAR_RANGE(3300000, 83, 83, 0),	/* 3.3v */
+	REGULATOR_LINEAR_RANGE(5000000, 84, 84, 0),	/* 5.0v */
+	REGULATOR_LINEAR_RANGE(5250000, 85, 85, 0),	/* 5.25v */
+};
+
+static const struct linear_range rk801_buck2_voltage_ranges[] = {
+	REGULATOR_LINEAR_RANGE(800000,  0, 2, 50000),	/* 0.8v - 0.9v */
+	REGULATOR_LINEAR_RANGE(1800000, 3, 4, 400000),	/* 1.8v - 2.2v */
+	REGULATOR_LINEAR_RANGE(3300000, 5, 5, 0),	/* 3.3v */
+	REGULATOR_LINEAR_RANGE(5000000, 6, 6, 0),	/* 5.0v */
+	REGULATOR_LINEAR_RANGE(5250000, 7, 7, 0),	/* 5.25v */
+};
+
+static const struct linear_range rk801_buck4_voltage_ranges[] = {
+	REGULATOR_LINEAR_RANGE(500000,   0, 80, 12500),	/* 0.5v - 1.5v */
+	REGULATOR_LINEAR_RANGE(1800000, 81, 82, 400000),/* 1.8v - 2.2v */
+	REGULATOR_LINEAR_RANGE(2500000, 83, 83, 0),	/* 2.5v */
+	REGULATOR_LINEAR_RANGE(2800000, 84, 84, 0),	/* 2.8v */
+	REGULATOR_LINEAR_RANGE(3000000, 85, 85, 0),	/* 3.0v */
+	REGULATOR_LINEAR_RANGE(3300000, 86, 86, 0),	/* 3.3v */
+};
+
+static const struct regulator_desc rk801_reg[] = {
+	{
+		.name = "dcdc1",
+		.supply_name = "vcc1",
+		.of_match = of_match_ptr("dcdc1"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = RK801_ID_DCDC1,
+		.ops = &rk801_buck_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 86,
+		.linear_ranges = rk801_buck1_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk801_buck1_voltage_ranges),
+		.vsel_reg = RK801_BUCK1_ON_VSEL_REG,
+		.vsel_mask = RK801_BUCK_VSEL_MASK,
+		.enable_reg = RK801_POWER_EN0_REG,
+		.enable_mask = ENABLE_MASK(RK801_ID_DCDC1),
+		.enable_val = ENABLE_MASK(RK801_ID_DCDC1),
+		.disable_val = DISABLE_VAL(RK801_ID_DCDC1),
+		.ramp_delay = 1000,
+		.of_map_mode = rk8xx_regulator_of_map_mode,
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	}, {
+		.name = "dcdc2",
+		.supply_name = "vcc2",
+		.of_match = of_match_ptr("dcdc2"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = RK801_ID_DCDC2,
+		.ops = &rk801_buck_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 8,
+		.linear_ranges = rk801_buck2_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk801_buck2_voltage_ranges),
+		.vsel_reg = RK801_BUCK2_ON_VSEL_REG,
+		.vsel_mask = RK801_BUCK_VSEL_MASK,
+		.enable_reg = RK801_POWER_EN0_REG,
+		.enable_mask = ENABLE_MASK(RK801_ID_DCDC2),
+		.enable_val = ENABLE_MASK(RK801_ID_DCDC2),
+		.disable_val = DISABLE_VAL(RK801_ID_DCDC2),
+		.ramp_delay = 1000,
+		.of_map_mode = rk8xx_regulator_of_map_mode,
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	}, {
+		.name = "dcdc3",
+		.supply_name = "vcc3",
+		.of_match = of_match_ptr("dcdc3"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = RK801_ID_DCDC3,
+		.ops = &rk801_switch_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 1,
+		.enable_reg = RK801_POWER_EN0_REG,
+		.enable_mask = ENABLE_MASK(RK801_ID_DCDC3),
+		.enable_val = ENABLE_MASK(RK801_ID_DCDC3),
+		.disable_val = DISABLE_VAL(RK801_ID_DCDC3),
+		.of_map_mode = rk8xx_regulator_of_map_mode,
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	}, {
+		.name = "dcdc4",
+		.supply_name = "vcc4",
+		.of_match = of_match_ptr("dcdc4"),
+		.regulators_node = of_match_ptr("regulators"),
+		.id = RK801_ID_DCDC4,
+		.ops = &rk801_buck_ops,
+		.type = REGULATOR_VOLTAGE,
+		.n_voltages = 87,
+		.linear_ranges = rk801_buck4_voltage_ranges,
+		.n_linear_ranges = ARRAY_SIZE(rk801_buck4_voltage_ranges),
+		.vsel_reg = RK801_BUCK4_ON_VSEL_REG,
+		.vsel_mask = RK801_BUCK_VSEL_MASK,
+		.enable_reg = RK801_POWER_EN0_REG,
+		.enable_mask = ENABLE_MASK(RK801_ID_DCDC4),
+		.enable_val = ENABLE_MASK(RK801_ID_DCDC4),
+		.disable_val = DISABLE_VAL(RK801_ID_DCDC4),
+		.ramp_delay = 1000,
+		.of_map_mode = rk8xx_regulator_of_map_mode,
+		.enable_time = 400,
+		.owner = THIS_MODULE,
+	},
+
+	RK801_DESC(RK801_ID_LDO1, "ldo1", "vcc5", 500, 3400, 50,
+		RK801_LDO1_ON_VSEL_REG, RK801_LDO_VSEL_MASK, RK801_POWER_EN1_REG,
+		ENABLE_MASK(0), DISABLE_VAL(0), 400),
+	RK801_DESC(RK801_ID_LDO2, "ldo2", "vcc6", 500, 3400, 50,
+		RK801_LDO2_ON_VSEL_REG, RK801_LDO_VSEL_MASK, RK801_POWER_EN1_REG,
+		ENABLE_MASK(1), DISABLE_VAL(1), 400),
+	RK801_DESC_SWITCH(RK801_ID_SWITCH, "switch", "vcc7", RK801_POWER_EN1_REG,
+		ENABLE_MASK(2), DISABLE_VAL(2)),
+};
+
 static const struct regulator_desc rk805_reg[] = {
 	{
 		.name = "DCDC_REG1",
@@ -1887,6 +2126,10 @@ static int rk808_regulator_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	switch (rk808->variant) {
+	case RK801_ID:
+		regulators = rk801_reg;
+		nregulators = RK801_NUM_REGULATORS;
+		break;
 	case RK805_ID:
 		regulators = rk805_reg;
 		nregulators = RK805_NUM_REGULATORS;
-- 
2.25.1


