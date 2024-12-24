Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721FFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sPdm4i2gmspq8ydS+ozzIZpPwIyse6GSBJIfGwfydBA=; b=hOAhbLFIHzMad1Q7Km5DfaleI9
	Ua08bK3dViONnGQt9OwAJjvwjMvO63w5yzNRlJc2PjxjAzxe0POBC2opnloYceC7dCkhmq7c39kk7
	pYOmJFadPx+orzCTNd5S91l2qzQYpaHeKxDa3Q+e2BEpexSM+z2/Pzy5Ioe/Vr1x0Htk8207/4Il/
	HX0ni1vkSTRL4DkuWDmEacnKSCsv6PwFH9aHz/UPG8o6lgtLNQbUUZxut0r7o7Kwb/tVAcLN7poxW
	k4tgV8XONRbJr8PM8DcjFbB+npev4FkZMzDYU1cGEiTTIpKQynvDmGL8xODsf1ePBsOWriRzGNMOf
	TZltEQaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1MT-0000000Bc26-1yWo;
	Tue, 24 Dec 2024 09:37:57 +0000
Received: from mail-m49242.qiye.163.com ([45.254.49.242])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Kz-0000000Bbnk-26Tj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 09:36:27 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aa78f78;
	Tue, 24 Dec 2024 17:36:20 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v2 2/2] pinctrl: rockchip: add rk3562 support
Date: Tue, 24 Dec 2024 17:36:20 +0800
Message-Id: <20241224093620.3815705-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkMeSVZCSx8aTE1PTEseGR9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f806460303afkunm6aa78f78
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nz46Axw*CjIQHEoVFxUSHj0h
	PQIaCRxVSlVKTEhOS0hJQkNJSUNPVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDQ0lNNwY+
DKIM-Signature: a=rsa-sha256;
	b=hmzS8D4R0XYs/GitxAp6G2XJG97JR0805L/+AUukE8jt+rscSabtO/kVx+ZBxVsUtRs0vXR4jpwiTiC6zZqVaC9rQXHlxLRzQF5FW/fssDKKWQLx8eRFEw4iRvJAOCEpjDsUjXP9Je95XfunBktoCjJHQw3HSg7J9I+xqHyg7Bg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=sPdm4i2gmspq8ydS+ozzIZpPwIyse6GSBJIfGwfydBA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_013625_748940_4C32D967 
X-CRM114-Status: GOOD (  15.85  )
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

From: Steven Liu <steven.liu@rock-chips.com>

Add support for the 5 GPIO banks in the rk3562.

Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v2:
- collect review tag

 drivers/pinctrl/pinctrl-rockchip.c | 200 ++++++++++++++++++++++++++++-
 drivers/pinctrl/pinctrl-rockchip.h |   3 +-
 2 files changed, 200 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 36d4eaf0ebd1..15145882950f 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Pinctrl driver for Rockchip SoCs
- *
+ * Copyright (c) 2020-2024 Rockchip Electronics Co., Ltd.
  * Copyright (c) 2013 MundoReader S.L.
  * Author: Heiko Stuebner <heiko@sntech.de>
  *
@@ -2003,6 +2003,151 @@ static int rk3399_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RK3562_DRV_BITS_PER_PIN		8
+#define RK3562_DRV_PINS_PER_REG		2
+#define RK3562_DRV_GPIO0_OFFSET		0x20070
+#define RK3562_DRV_GPIO1_OFFSET		0x200
+#define RK3562_DRV_GPIO2_OFFSET		0x240
+#define RK3562_DRV_GPIO3_OFFSET		0x10280
+#define RK3562_DRV_GPIO4_OFFSET		0x102C0
+
+static int rk3562_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		*reg = RK3562_DRV_GPIO0_OFFSET;
+		break;
+
+	case 1:
+		*reg = RK3562_DRV_GPIO1_OFFSET;
+		break;
+
+	case 2:
+		*reg = RK3562_DRV_GPIO2_OFFSET;
+		break;
+
+	case 3:
+		*reg = RK3562_DRV_GPIO3_OFFSET;
+		break;
+
+	case 4:
+		*reg = RK3562_DRV_GPIO4_OFFSET;
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RK3562_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3562_DRV_PINS_PER_REG;
+	*bit *= RK3562_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RK3562_PULL_BITS_PER_PIN		2
+#define RK3562_PULL_PINS_PER_REG		8
+#define RK3562_PULL_GPIO0_OFFSET		0x20020
+#define RK3562_PULL_GPIO1_OFFSET		0x80
+#define RK3562_PULL_GPIO2_OFFSET		0x90
+#define RK3562_PULL_GPIO3_OFFSET		0x100A0
+#define RK3562_PULL_GPIO4_OFFSET		0x100B0
+
+static int rk3562_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		*reg = RK3562_PULL_GPIO0_OFFSET;
+		break;
+
+	case 1:
+		*reg = RK3562_PULL_GPIO1_OFFSET;
+		break;
+
+	case 2:
+		*reg = RK3562_PULL_GPIO2_OFFSET;
+		break;
+
+	case 3:
+		*reg = RK3562_PULL_GPIO3_OFFSET;
+		break;
+
+	case 4:
+		*reg = RK3562_PULL_GPIO4_OFFSET;
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RK3562_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3562_PULL_PINS_PER_REG;
+	*bit *= RK3562_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RK3562_SMT_BITS_PER_PIN		2
+#define RK3562_SMT_PINS_PER_REG		8
+#define RK3562_SMT_GPIO0_OFFSET		0x20030
+#define RK3562_SMT_GPIO1_OFFSET		0xC0
+#define RK3562_SMT_GPIO2_OFFSET		0xD0
+#define RK3562_SMT_GPIO3_OFFSET		0x100E0
+#define RK3562_SMT_GPIO4_OFFSET		0x100F0
+
+static int rk3562_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	switch (bank->bank_num) {
+	case 0:
+		*reg = RK3562_SMT_GPIO0_OFFSET;
+		break;
+
+	case 1:
+		*reg = RK3562_SMT_GPIO1_OFFSET;
+		break;
+
+	case 2:
+		*reg = RK3562_SMT_GPIO2_OFFSET;
+		break;
+
+	case 3:
+		*reg = RK3562_SMT_GPIO3_OFFSET;
+		break;
+
+	case 4:
+		*reg = RK3562_SMT_GPIO4_OFFSET;
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RK3562_SMT_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3562_SMT_PINS_PER_REG;
+	*bit *= RK3562_SMT_BITS_PER_PIN;
+
+	return 0;
+}
+
 #define RK3568_PULL_PMU_OFFSET		0x20
 #define RK3568_PULL_GRF_OFFSET		0x80
 #define RK3568_PULL_BITS_PER_PIN	2
@@ -2495,7 +2640,8 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3588_DRV_BITS_PER_PIN;
 		ret = strength;
 		goto config;
-	} else if (ctrl->type == RK3568) {
+	} else if (ctrl->type == RK3562 ||
+		   ctrl->type == RK3568) {
 		rmask_bits = RK3568_DRV_BITS_PER_PIN;
 		ret = (1 << (strength + 1)) - 1;
 		goto config;
@@ -2639,6 +2785,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3562:
 	case RK3568:
 	case RK3576:
 	case RK3588:
@@ -2699,6 +2846,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3562:
 	case RK3568:
 	case RK3576:
 	case RK3588:
@@ -2810,6 +2958,7 @@ static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
 
 	data >>= bit;
 	switch (ctrl->type) {
+	case RK3562:
 	case RK3568:
 		return data & ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1);
 	default:
@@ -2839,6 +2988,7 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
 
 	/* enable the write to the equivalent lower bits */
 	switch (ctrl->type) {
+	case RK3562:
 	case RK3568:
 		data = ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1) << (bit + 16);
 		rmask = data | (data >> 16);
@@ -2965,6 +3115,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3562:
 	case RK3568:
 	case RK3576:
 	case RK3588:
@@ -4086,6 +4237,49 @@ static struct rockchip_pin_ctrl rk3399_pin_ctrl = {
 		.drv_calc_reg		= rk3399_calc_drv_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rk3562_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS_OFFSET(0, 32, "gpio0",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20000, 0x20008, 0x20010, 0x20018),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(1, 32, "gpio1",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0, 0x08, 0x10, 0x18),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(2, 32, "gpio2",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20, 0, 0, 0),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(3, 32, "gpio3",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x10040, 0x10048, 0x10050, 0x10058),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(4, 16, "gpio4",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0,
+				    0,
+				    0x10060, 0x10068, 0, 0),
+};
+
+static struct rockchip_pin_ctrl rk3562_pin_ctrl __maybe_unused = {
+	.pin_banks		= rk3562_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rk3562_pin_banks),
+	.label			= "RK3562-GPIO",
+	.type			= RK3562,
+	.pull_calc_reg		= rk3562_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rk3562_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rk3562_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rk3568_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU | IOMUX_WIDTH_4BIT,
 					     IOMUX_SOURCE_PMU | IOMUX_WIDTH_4BIT,
@@ -4210,6 +4404,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &rk3368_pin_ctrl },
 	{ .compatible = "rockchip,rk3399-pinctrl",
 		.data = &rk3399_pin_ctrl },
+	{ .compatible = "rockchip,rk3562-pinctrl",
+		.data = &rk3562_pin_ctrl },
 	{ .compatible = "rockchip,rk3568-pinctrl",
 		.data = &rk3568_pin_ctrl },
 	{ .compatible = "rockchip,rk3576-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 6ebbb0a88ce7..87a20cec8e21 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2020-2021 Rockchip Electronics Co. Ltd.
+ * Copyright (c) 2020-2024 Rockchip Electronics Co., Ltd.
  *
  * Copyright (c) 2013 MundoReader S.L.
  * Author: Heiko Stuebner <heiko@sntech.de>
@@ -196,6 +196,7 @@ enum rockchip_pinctrl_type {
 	RK3328,
 	RK3368,
 	RK3399,
+	RK3562,
 	RK3568,
 	RK3576,
 	RK3588,
-- 
2.25.1


