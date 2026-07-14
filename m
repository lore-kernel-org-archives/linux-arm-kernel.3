Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74300C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veRGkLISMehf8RXhzpz3c0dz8vEqqd5XVWE0pPHfpPw=; b=gSbTNrIAKwc8Y/XgXT8T1dPuFv
	vdloot/DTmiQa62e2rOuIBgHVS81mpwo/9J/EMKVIE4juo/gflm4CYmwiDWC+67SvBCNifu5epbSE
	SHoPnAB+fyNT5yGdOjYwpa4uV5EKLNwYQkNv2RvlZLj5ufLvNr2MowT7nF7+OOlchfuJzHrC9kAoW
	ZfW1p7+Me0H/lXrRiv5OOjQiOXDmSlbUhq2C2a7ERmF0HdLqBKgv09/BuSvV8IO53uuKFy2J2pGpm
	fBg+bLV62ywosj0rZ6Z4I+d4OLj4ddVDksHUMwJcA2vf/dzvuzHObPqVMrho/RBy6glUKkce5SuMw
	p8fN8cww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjila-0000000D2eL-3BGK;
	Tue, 14 Jul 2026 19:26:06 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilT-0000000D2Xk-3b8d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:26:01 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6a3897109bfso1481175eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057159; x=1784661959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=veRGkLISMehf8RXhzpz3c0dz8vEqqd5XVWE0pPHfpPw=;
        b=NS3DFvwtVPvpYIw/cQ4p0LPAatqisBsTCs4B71Se3ZMaW2uB81izlUtIKfwIy+zZgQ
         AryO8/CfAt2tHutH/KigB64Ls34ZtaKQmd5uPPTdKFkNBw9HeogRkDiHXkN7ye9oujed
         IE3km45J2u80ULOaLL/oNsYQoyFJkQfy4nZVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057159; x=1784661959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=veRGkLISMehf8RXhzpz3c0dz8vEqqd5XVWE0pPHfpPw=;
        b=j96Yh1M1l4UprbhD8oVt66cDdb+sxW0mfS2Qi3ZxdXgaDR+8Ja62GVADyJfaIIogcT
         WRqxH8gaL4NuUxoqXopjozs3tWz1ED67vp/uhg1vKwEH+W2VEF/eaJ+QSU6lQNEhMVik
         odbM30w0vR8t9yLjjLJRgJcI5rqapAR1MmK/Z1sz11EvlKWNCRibRRYqn1BzjIhxbWHv
         C6KRXlj7wkAN93vXjm0l6l5DpSIJcZqFfHfFvEsflCN1vgjDX1YRNF97FDde2OpfRZzs
         vZI7073EXE2l4fQC8pJX5+Kabi9hPJCGRAxyATaLjWNzYt1VSkKCINUhrrbm9WkH42ZU
         mt8g==
X-Forwarded-Encrypted: i=1; AFNElJ+jH5N3ab4gDyqJ5+SobqgFBow1vBj4+LWC/8ofKe8HQUElumeliysWAFzKZ8ogU6N2j8qzM4ITCa52RqLOu4qi@lists.infradead.org
X-Gm-Message-State: AOJu0YyfMuFLW7UdKmjmGG2Odk46OBzqtgmP6YxB9BRnKvp5CL/jekpf
	b9pqSYdw43Dt+v9ftJJf5NK5577Q+q0wO2ve07Y88Z+40Fx2gDQzKORHhfgumAuQwA==
X-Gm-Gg: AfdE7ckt8SMb57uB+OKCAeVd0Pnr5ym1uNwdjZZIVhXDBOcYPgpASeZ5qzWYKnboedz
	ou/qbzfPA8sYzolmShBIW0spLfFyo58rD+GJeDTLrH5w3YUnUfe3dywpMoxJWvzD563KFafWAkC
	BAxCjmPNpPCYOrY0al3KC2evpO+4q7XWuX6NfnyvXyuhFBw/86kUkXa1H36JAfkyT2sbaRtmper
	2wvdj7/wmD5gjTRbXDGL9oWj896tgCGMnvmWjLIg2Eve+YV6J4KJAe24o4pEr7F8MLIK1zMDl9Y
	oquya/J1YLBFkYUqbkJVoWbaDv0tRjahiH9bygwoGu717Xo14fLYjA86y1ZOzB7DMEjKyZEdyFv
	Vb4EohCCXOXezZcRy1wTIyPYlnYYWBsfYchUgJL7C0x720ngQ1Mut23CgYm0k2dRf+3R8ZpNG82
	gLF7KjKt0=
X-Received: by 2002:a05:6820:2108:b0:6a1:4833:fd4b with SMTP id 006d021491bc7-6a3d9eb58a9mr69686eaf.5.1784057158678;
        Tue, 14 Jul 2026 12:25:58 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm15759043fac.7.2026.07.14.12.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:58 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] pinctrl: rockchip: Add RV1106 pinctrl support
Date: Tue, 14 Jul 2026 13:25:31 -0600
Message-ID: <20260714132531.v2.3.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714192535.2082729-1-sjg@chromium.org>
References: <20260714192535.2082729-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122559_918699_1252B9E9 
X-CRM114-Status: GOOD (  26.79  )
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

Add pinctrl support for the Rockchip RV1106, based on the vendor
kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
5.10.160 kernel tree). Each GPIO bank has its own IO control (IOC)
register block, referenced by the rockchip,grf phandle of the bank
node; the register offsets are relative to the bank's own block. The
drive strength uses the RK3568-style exponential encoding and only
pins 0-6 of GPIO0 have drive-strength registers.

The RV1103 is a package variant of the RV1106 with fewer pins and uses
the same pin controller.

[1] https://github.com/LuckfoxTECH/luckfox-pico

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v2:
- Use a separate IOC regmap per bank, taken from the rockchip,grf
  phandle of each bank node and identified by the gpio alias, with
  block-relative register offsets
- Reject drive-strength requests for GPIO0 pins above 6, which have no
  drive-strength registers
- Specify only the first iomux offset for each bank, letting the driver
  calculate the increments

 drivers/pinctrl/pinctrl-rockchip.c | 168 +++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h |   4 +
 2 files changed, 172 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7e0fcd45fd26..0589a7a0879f 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1188,6 +1188,10 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 	else
 		regmap = info->regmap_base;
 
+	/* Banks with their own IOC block use its regmap for the iomux */
+	if (bank->regmap_ioc)
+		regmap = bank->regmap_ioc;
+
 	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
 		return 0;
 
@@ -1317,6 +1321,10 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	else
 		regmap = info->regmap_base;
 
+	/* Banks with their own IOC block use its regmap for the iomux */
+	if (bank->regmap_ioc)
+		regmap = bank->regmap_ioc;
+
 	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
 		return 0;
 
@@ -1725,6 +1733,78 @@ static int rv1103b_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RV1106_DRV_BITS_PER_PIN		8
+#define RV1106_DRV_PINS_PER_REG		2
+#define RV1106_PULL_BITS_PER_PIN	2
+#define RV1106_PULL_PINS_PER_REG	8
+#define RV1106_SMT_BITS_PER_PIN		1
+#define RV1106_SMT_PINS_PER_REG		8
+
+/*
+ * Each bank has its own IOC block, referenced by the rockchip,grf
+ * phandle of the bank node. The offsets below are relative to the
+ * bank's own block.
+ */
+static const int rv1106_drv_offsets[] = { 0x10, 0x80, 0xc0, 0x100, 0x20 };
+static const int rv1106_pull_offsets[] = { 0x38, 0x1c0, 0x1d0, 0x1e0, 0x70 };
+static const int rv1106_smt_offsets[] = { 0x40, 0x280, 0x290, 0x2a0, 0xa0 };
+
+static int rv1106_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	if (bank->bank_num >= ARRAY_SIZE(rv1106_drv_offsets) ||
+	    !bank->regmap_ioc)
+		return -EINVAL;
+
+	/* Only pins 0-6 of GPIO0 have drive-strength registers */
+	if (bank->bank_num == 0 && pin_num > 6)
+		return -ENOTSUPP;
+
+	*regmap = bank->regmap_ioc;
+	*reg = rv1106_drv_offsets[bank->bank_num];
+	*reg += ((pin_num / RV1106_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_DRV_PINS_PER_REG;
+	*bit *= RV1106_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+static int rv1106_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	if (bank->bank_num >= ARRAY_SIZE(rv1106_pull_offsets) ||
+	    !bank->regmap_ioc)
+		return -EINVAL;
+
+	*regmap = bank->regmap_ioc;
+	*reg = rv1106_pull_offsets[bank->bank_num];
+	*reg += ((pin_num / RV1106_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_PULL_PINS_PER_REG;
+	*bit *= RV1106_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+static int rv1106_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	if (bank->bank_num >= ARRAY_SIZE(rv1106_smt_offsets) ||
+	    !bank->regmap_ioc)
+		return -EINVAL;
+
+	*regmap = bank->regmap_ioc;
+	*reg = rv1106_smt_offsets[bank->bank_num];
+	*reg += ((pin_num / RV1106_SMT_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_SMT_PINS_PER_REG;
+	*bit *= RV1106_SMT_BITS_PER_PIN;
+
+	return 0;
+}
+
 #define RV1108_PULL_PMU_OFFSET		0x10
 #define RV1108_PULL_OFFSET		0x110
 #define RV1108_PULL_PINS_PER_REG	8
@@ -3310,6 +3390,7 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		ret = strength;
 		goto config;
 	} else if (ctrl->type == RV1103B ||
+		   ctrl->type == RV1106 ||
 		   ctrl->type == RK3506 ||
 		   ctrl->type == RK3528 ||
 		   ctrl->type == RK3562 ||
@@ -3482,6 +3563,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 				: PIN_CONFIG_BIAS_DISABLE;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RK3188:
 	case RK3288:
@@ -3547,6 +3629,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 		break;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RV1126:
 	case RK3188:
@@ -3843,6 +3926,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 		return pull ? false : true;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RV1126:
 	case RK3188:
@@ -4452,6 +4536,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *base;
 	int ret;
+	int i;
 
 	if (!dev->of_node)
 		return dev_err_probe(dev, -ENODEV, "device tree node not found\n");
@@ -4505,6 +4590,44 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	/* try to find the optional reference to the ioc1 syscon */
 	info->regmap_ioc1 = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,ioc1");
 
+	/*
+	 * On SoCs where each GPIO bank has its own IOC block, the bank nodes
+	 * carry a rockchip,grf phandle pointing at it. The bank number comes
+	 * from the gpio alias, as used by the gpio driver, falling back to
+	 * the node position for devicetrees without aliases. The fallback is
+	 * wrong when an SoC variant omits a bank, so aliases are needed
+	 * there.
+	 */
+	i = 0;
+	for_each_child_of_node_scoped(np, child) {
+		struct rockchip_pin_bank *bank = NULL;
+		int id, j;
+
+		if (!of_match_node(rockchip_bank_match, child))
+			continue;
+
+		id = of_alias_get_id(child, "gpio");
+		if (id < 0)
+			id = i;
+		i++;
+
+		for (j = 0; j < ctrl->nr_banks; j++) {
+			if (ctrl->pin_banks[j].bank_num == id) {
+				bank = &ctrl->pin_banks[j];
+				break;
+			}
+		}
+		if (!bank)
+			continue;
+
+		bank->regmap_ioc = syscon_regmap_lookup_by_phandle_optional(
+							child, "rockchip,grf");
+		if (IS_ERR(bank->regmap_ioc))
+			return dev_err_probe(dev, PTR_ERR(bank->regmap_ioc),
+					     "%pOFn: failed to look up bank ioc\n",
+					     child);
+	}
+
 	ret = rockchip_pinctrl_register(pdev, info);
 	if (ret)
 		return ret;
@@ -4623,6 +4746,49 @@ static struct rockchip_pin_ctrl rv1103b_pin_ctrl __maybe_unused = {
 	.schmitt_calc_reg	= rv1103b_calc_schmitt_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rv1106_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS_OFFSET(0, 32, "gpio0",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0, -1, -1, -1),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(1, 32, "gpio1",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0, -1, -1, -1),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(2, 32, "gpio2",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20, -1, -1, -1),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(3, 32, "gpio3",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x40, -1, -1, -1),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(4, 24, "gpio4",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0,
+				    0, -1, -1, -1),
+};
+
+static struct rockchip_pin_ctrl rv1106_pin_ctrl __maybe_unused = {
+	.pin_banks		= rv1106_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rv1106_pin_banks),
+	.label			= "RV1106-GPIO",
+	.type			= RV1106,
+	.pull_calc_reg		= rv1106_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rv1106_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rv1106_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rv1108_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
 					     IOMUX_SOURCE_PMU,
@@ -5261,6 +5427,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &px30_pin_ctrl },
 	{ .compatible = "rockchip,rv1103b-pinctrl",
 		.data = &rv1103b_pin_ctrl },
+	{ .compatible = "rockchip,rv1106-pinctrl",
+		.data = &rv1106_pin_ctrl },
 	{ .compatible = "rockchip,rv1108-pinctrl",
 		.data = &rv1108_pin_ctrl },
 	{ .compatible = "rockchip,rv1126-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index bb0e803e3b8a..f62213d99792 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -186,6 +186,7 @@
 enum rockchip_pinctrl_type {
 	PX30,
 	RV1103B,
+	RV1106,
 	RV1108,
 	RV1126,
 	RK2928,
@@ -295,6 +296,8 @@ struct rockchip_drv {
  * @dev: the pinctrl device bind to the bank
  * @reg_base: register base of the gpio bank
  * @regmap_pull: optional separate register for additional pull settings
+ * @regmap_ioc: optional per-bank IO control regmap, for SoCs where each
+ *	    bank has its own IOC block
  * @clk: clock of the gpio bank
  * @db_clk: clock of the gpio debounce
  * @irq: interrupt of the gpio bank
@@ -323,6 +326,7 @@ struct rockchip_pin_bank {
 	struct device			*dev;
 	void __iomem			*reg_base;
 	struct regmap			*regmap_pull;
+	struct regmap			*regmap_ioc;
 	struct clk			*clk;
 	struct clk			*db_clk;
 	int				irq;
-- 
2.43.0


