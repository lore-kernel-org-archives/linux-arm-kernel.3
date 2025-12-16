Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F9FD5E13E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53wx/l9Bicx82HEIi48rhqopVN+cJfr8QQsKHaeSvYs=; b=yq3pdSg2RHinFS8/3KrVwSudQS
	1mJ5Fwwx+uT8KxQGrAQPT34GgfO+7MdNo8/irg0KjaHvg5H5rmQzB52GEzpm8XfA3z7tEPMYrCRFN
	bQ58aYF1z/GUL7slzZA67Dwnd5XWsyqlNA5+PyURO6V8vvHwc9LPktaLF9ZRuaN81vbOHSGdlTk+K
	Jupqx05StLJ7HmNPcLAKbVVM3jscq0i+Z3ZfqXHmj1a2dYqjuIJBVIwt+OnKUu1tqdzvQYrkHQ/Lr
	+GGF+7lQ9vl6UqO5TLRMJ85yGMfPwftF9gF2vwh1vW+IlxTiCdDj+i47XMzBRov7WZ1N1lD6e/SOr
	rangsEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVT7S-000000056tE-0E58;
	Tue, 16 Dec 2025 11:21:30 +0000
Received: from mail-m19731120.qiye.163.com ([220.197.31.120])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVT7H-000000056gW-3VDt;
	Tue, 16 Dec 2025 11:21:23 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d6ee1f97;
	Tue, 16 Dec 2025 19:20:57 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v3 3/7] pinctrl: rockchip: Add rv1126b pinctrl support
Date: Tue, 16 Dec 2025 19:20:49 +0800
Message-Id: <20251216112053.1927852-4-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
References: <20251216112053.1927852-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b26e4593009d8kunm7ab62e1d2a7b26b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk0YH1ZCSRlCSUlNGkpPThhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bX2+5KIIz9+yqvMTanixYEdU7m16vkrtEL86+ULuHO/hma9zJq8GuoU/PVJIJyY+8jgGcnCAJNJ4UThXN9W0Qick+XgIZunvUeHKhCk+Ax6n1mLnIT1PvZ/zoYdijxVRTBrug9nk2eN/DK4Rkykj5L9XhYO3l9BfdMTudq4lzKo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=53wx/l9Bicx82HEIi48rhqopVN+cJfr8QQsKHaeSvYs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_032120_036189_246C6583 
X-CRM114-Status: GOOD (  15.53  )
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

Add gpio and pinctrl support for the 8 GPIO banks on RV1126B.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 181 ++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h |   1 +
 2 files changed, 181 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e44ef262beec..dc7ef12dfcb0 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -307,6 +307,20 @@
 #define RK3588_PIN_BANK_FLAGS(ID, PIN, LABEL, M, P)			\
 	PIN_BANK_IOMUX_FLAGS_PULL_FLAGS(ID, PIN, LABEL, M, M, M, M, P, P, P, P)
 
+#define PIN_BANK_IOMUX_4_OFFSET_DRV_8(id, pins, label, offset0,		\
+				      offset1, offset2, offset3)	\
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(id, pins, label,		\
+					      IOMUX_WIDTH_4BIT,		\
+					      IOMUX_WIDTH_4BIT,		\
+					      IOMUX_WIDTH_4BIT,		\
+					      IOMUX_WIDTH_4BIT,		\
+					      offset0, offset1,		\
+					      offset2, offset3,		\
+					      DRV_TYPE_IO_LEVEL_8_BIT,	\
+					      DRV_TYPE_IO_LEVEL_8_BIT,	\
+					      DRV_TYPE_IO_LEVEL_8_BIT,	\
+					      DRV_TYPE_IO_LEVEL_8_BIT)
+
 static struct regmap_config rockchip_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -1701,6 +1715,136 @@ static int rv1126_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RV1126B_DRV_BITS_PER_PIN		8
+#define RV1126B_DRV_PINS_PER_REG		2
+#define RV1126B_DRV_GPIO0_A_OFFSET		0x100
+#define RV1126B_DRV_GPIO0_C_OFFSET		0x8120
+#define RV1126B_DRV_GPIO_OFFSET(GPION)		(0x8100 + GPION * 0x8040)
+
+static int rv1126b_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		if (pin_num < 16)
+			*reg = RV1126B_DRV_GPIO0_A_OFFSET;
+		else
+			*reg = RV1126B_DRV_GPIO0_C_OFFSET - 0x20;
+		break;
+
+	case 1:
+	case 2:
+	case 3:
+	case 4:
+	case 5:
+	case 6:
+	case 7:
+		*reg = RV1126B_DRV_GPIO_OFFSET(bank->bank_num);
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RV1126B_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1126B_DRV_PINS_PER_REG;
+	*bit *= RV1126B_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RV1126B_PULL_BITS_PER_PIN		2
+#define RV1126B_PULL_PINS_PER_REG		8
+#define RV1126B_PULL_GPIO0_A_OFFSET		0x300
+#define RV1126B_PULL_GPIO0_C_OFFSET		0x8308
+#define RV1126B_PULL_GPIO_OFFSET(GPION)		(0x8300 + GPION * 0x8010)
+
+static int rv1126b_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		if (pin_num < 16)
+			*reg = RV1126B_PULL_GPIO0_A_OFFSET;
+		else
+			*reg = RV1126B_PULL_GPIO0_C_OFFSET - 0x8;
+		break;
+
+	case 1:
+	case 2:
+	case 3:
+	case 4:
+	case 5:
+	case 6:
+	case 7:
+		*reg = RV1126B_PULL_GPIO_OFFSET(bank->bank_num);
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RV1126B_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1126B_PULL_PINS_PER_REG;
+	*bit *= RV1126B_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RV1126B_SMT_BITS_PER_PIN		1
+#define RV1126B_SMT_PINS_PER_REG		8
+#define RV1126B_SMT_GPIO0_A_OFFSET		0x500
+#define RV1126B_SMT_GPIO0_C_OFFSET		0x8508
+#define RV1126B_SMT_GPIO_OFFSET(GPION)		(0x8500 + GPION * 0x8010)
+
+static int rv1126b_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		if (pin_num < 16)
+			*reg = RV1126B_SMT_GPIO0_A_OFFSET;
+		else
+			*reg = RV1126B_SMT_GPIO0_C_OFFSET - 0x8;
+		break;
+
+	case 1:
+	case 2:
+	case 3:
+	case 4:
+	case 5:
+	case 6:
+	case 7:
+		*reg = RV1126B_SMT_GPIO_OFFSET(bank->bank_num);
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RV1126B_SMT_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1126B_SMT_PINS_PER_REG;
+	*bit *= RV1126B_SMT_BITS_PER_PIN;
+
+	return 0;
+}
+
 #define RK3308_SCHMITT_PINS_PER_REG		8
 #define RK3308_SCHMITT_BANK_STRIDE		16
 #define RK3308_SCHMITT_GRF_OFFSET		0x1a0
@@ -3071,7 +3215,8 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3588_DRV_BITS_PER_PIN;
 		ret = strength;
 		goto config;
-	} else if (ctrl->type == RK3506 ||
+	} else if (ctrl->type == RV1126B ||
+		   ctrl->type == RK3506 ||
 		   ctrl->type == RK3528 ||
 		   ctrl->type == RK3562 ||
 		   ctrl->type == RK3568) {
@@ -3237,6 +3382,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 				: PIN_CONFIG_BIAS_DISABLE;
 	case PX30:
 	case RV1108:
+	case RV1126B:
 	case RK3188:
 	case RK3288:
 	case RK3308:
@@ -3299,6 +3445,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	case PX30:
 	case RV1108:
 	case RV1126:
+	case RV1126B:
 	case RK3188:
 	case RK3288:
 	case RK3308:
@@ -3582,6 +3729,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case PX30:
 	case RV1108:
 	case RV1126:
+	case RV1126B:
 	case RK3188:
 	case RK3288:
 	case RK3308:
@@ -4386,6 +4534,35 @@ static struct rockchip_pin_ctrl rv1126_pin_ctrl = {
 	.schmitt_calc_reg	= rv1126_calc_schmitt_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rv1126b_pin_banks[] = {
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(0, 32, "gpio0",
+				      0x0, 0x8, 0x8010, 0x8018),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(1, 32, "gpio1",
+				      0x10020, 0x10028, 0x10030, 0x10038),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(2, 32, "gpio2",
+				      0x18040, 0x18048, 0x18050, 0x18058),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(3, 32, "gpio3",
+				      0x20060, 0x20068, 0x20070, 0x20078),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(4, 32, "gpio4",
+				      0x28080, 0x28088, 0x28090, 0x28098),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(5, 32, "gpio5",
+				      0x300a0, 0x300a8, 0x300b0, 0x300b8),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(6, 32, "gpio6",
+				      0x380c0, 0x380c8, 0x380d0, 0x380d8),
+	PIN_BANK_IOMUX_4_OFFSET_DRV_8(7, 32, "gpio7",
+				      0x400e0, 0x400e8, 0x400f0, 0x400f8),
+};
+
+static struct rockchip_pin_ctrl rv1126b_pin_ctrl __maybe_unused = {
+	.pin_banks		= rv1126b_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rv1126b_pin_banks),
+	.label			= "RV1126B-GPIO",
+	.type			= RV1126B,
+	.pull_calc_reg		= rv1126b_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rv1126b_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rv1126b_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rk2928_pin_banks[] = {
 	PIN_BANK(0, 32, "gpio0"),
 	PIN_BANK(1, 32, "gpio1"),
@@ -4960,6 +5137,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rv1108_pin_ctrl },
 	{ .compatible = "rockchip,rv1126-pinctrl",
 		.data = &rv1126_pin_ctrl },
+	{ .compatible = "rockchip,rv1126b-pinctrl",
+		.data = &rv1126b_pin_ctrl },
 	{ .compatible = "rockchip,rk2928-pinctrl",
 		.data = &rk2928_pin_ctrl },
 	{ .compatible = "rockchip,rk3036-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 4f4aff42a80a..fe18b62ed994 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -187,6 +187,7 @@ enum rockchip_pinctrl_type {
 	PX30,
 	RV1108,
 	RV1126,
+	RV1126B,
 	RK2928,
 	RK3066B,
 	RK3128,
-- 
2.34.1


