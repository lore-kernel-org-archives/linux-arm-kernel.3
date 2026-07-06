Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94897C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvpgM8iEMmGwLW3WZ/vDkcz2b692kXnqlfLB+Q/ZfdA=; b=zpV08dL7/rm+3/LAIsa4kU2gPk
	huhU5OTI2gQSTgnrb8e7mKN7moMozn+cislYLAjLIPg/Y9AeTiBqfJof6cK22TisxbZynwfjHDrTe
	VCpjdTpp0BaZR/Ez7bLNV5/WZwFePMLlrZLK8HbP/+i14UH3smBgchbO1Kjj9i97pBeNTRwyyad87
	rYe1TJstBx5wu8D0X8JHlZXGkkqYdUS+eodqXQ5VH2kwxUobA/d0f3lra5Af5DM3JNfokEa3LT3sF
	rjeU+SJl51X9FTfEtOQMOyVh6EcENQv7jg2o5A1HiCq9p0yMHtz/XoB3o2QFLuxcrsHujZKxbfECt
	cz5SGkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTR-0000000DVIp-2Ksd;
	Mon, 06 Jul 2026 19:59:25 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTL-0000000DVBl-2vgr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:59:21 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6a116bd18ebso1686499eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367958; x=1783972758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvpgM8iEMmGwLW3WZ/vDkcz2b692kXnqlfLB+Q/ZfdA=;
        b=XUwPD7QwokDRQj7wvbh1AyKwWlwd7w6qOsAqrd9W6U5VcdrTsu+b0gKPNyyQAOffrl
         27z5+kz6NjLgb/jlifJsUOLP+eFxywCYc5DVjbnacPraKEH3wrFMDVWYF4FD4p2jUapw
         zgEYmaIILfkh26uAlyamdWpsxGR0eI+cQx5QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367958; x=1783972758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvpgM8iEMmGwLW3WZ/vDkcz2b692kXnqlfLB+Q/ZfdA=;
        b=jmp/AmOkVgV8BrRbDvqAa4oDwQ1herGZpIxqMwjcQ6NvapHaTcl9nqP/Fk9WX3XdQC
         o8xdNsdbs1NPPaGh0yrZ9QC9Fk25W5GXRQo0o6krzXEqOSKou8pb1qI1o74ko1LgP5HS
         mbiNskZlxJMNH43aS+PUY6TXZkusxSYQZCAxMp+89d9zXoEsqU2bX/hKWQ5cFSexT34N
         EmJQAKTQjIjgOGFZPkTvVKb2fXaKk0ttd+SuRVxv+mS+NLiITeHU7tAjOw3aZ/5VkNgc
         KeDo4O0tSMcxBaSmAQaaoVVfNW79nMOzP8kt7/LxJDXbpmderV/+pWsNK/I6yfL0xXO4
         OWYg==
X-Forwarded-Encrypted: i=1; AFNElJ/98m8+tT5eG/tvoHp8HHzw+hlK8NLV1hP9BML2owBnAc2mXxUsF2banov354B8JxMhOxAuqg7GXnCNkyTRK4T9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8XGTjhVDEnE7Dh+F4O4dZMfOjEhFaTcDsgomPcQGhtlnXLoTI
	l+2fwZE1YcY57Jmr4IPCgiM2KzKeQuvlT1woExJJN4GMQckEqjwbdnsi8QQ9rap4OQ==
X-Gm-Gg: AfdE7clATIhIr0CPlKNj0462eFivqnKGZsG3IiqBmHAw9OHIyNKzWb9qb3YVQWUWdQZ
	VLtJuXGiLRTLLyF+hg+LRbx5xvLuo7NOnWYj5JZ3VV4odpXtBhIaYsRjXLXrbMYH5jJpcBfiyEr
	+W2YztDY8G7dQOqWN2o2Kd098bxaprhvVaHvQ2e4EbctHSlaiCpxKTXutQdkLEatxiGD3kCEH6u
	0DZFgwnFuKlZ7Ljr//taVMgx5AI0LopRqtcshJ4x6ZwSbjUrdv2/c1NsCnLoAQ3g1wnKRQbVeLA
	I+6hhAhmjQblcT4QeRtEL1n26kW7OPsPdXwQUokECkHKxm6uDDos9dGjd5KZi2kLTQRilMytDIS
	z5Q5MBSCIhajqv+XnFouhWrJjdGi47sf9tXVFI8lJeOgiA/6EGZ5ZbyXOshbjUSh54TzPnnbPem
	qJ7MK7lK9l3eIbYfpHRA==
X-Received: by 2002:a05:6820:1806:b0:6a1:8b23:d4c8 with SMTP id 006d021491bc7-6a35538decamr1446369eaf.3.1783367958449;
        Mon, 06 Jul 2026 12:59:18 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:17 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Linus Walleij <linusw@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] pinctrl: rockchip: Add RV1106 pinctrl support
Date: Mon,  6 Jul 2026 13:58:00 -0600
Message-ID: <20260706195818.3906949-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125920_172103_792463DE 
X-CRM114-Status: GOOD (  17.73  )
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

Add pinctrl support for the Rockchip RV1106, taken from the vendor
kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
5.10.160 kernel tree). The IOC registers are spread across several
blocks, addressed through per-bank offsets, with the GPIO0 block in the
PMU. The drive strength uses the RK3568-style exponential encoding.

The RV1103 is a package variant of the RV1106 with fewer pins and uses
the same pin controller.

[1] https://github.com/LuckfoxTECH/luckfox-pico

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 drivers/pinctrl/pinctrl-rockchip.c | 208 +++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h |   1 +
 2 files changed, 209 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7e0fcd45fd26..f9cbcb955853 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1725,6 +1725,166 @@ static int rv1103b_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RV1106_DRV_BITS_PER_PIN		8
+#define RV1106_DRV_PINS_PER_REG		2
+#define RV1106_DRV_GPIO0_OFFSET		0x10
+#define RV1106_DRV_GPIO1_OFFSET		0x80
+#define RV1106_DRV_GPIO2_OFFSET		0x100C0
+#define RV1106_DRV_GPIO3_OFFSET		0x20100
+#define RV1106_DRV_GPIO4_OFFSET		0x30020
+
+static int rv1106_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* GPIO0_IOC is located in PMU */
+	switch (bank->bank_num) {
+	case 0:
+		*regmap = info->regmap_pmu;
+		*reg = RV1106_DRV_GPIO0_OFFSET;
+		break;
+
+	case 1:
+		*regmap = info->regmap_base;
+		*reg = RV1106_DRV_GPIO1_OFFSET;
+		break;
+
+	case 2:
+		*regmap = info->regmap_base;
+		*reg = RV1106_DRV_GPIO2_OFFSET;
+		break;
+
+	case 3:
+		*regmap = info->regmap_base;
+		*reg = RV1106_DRV_GPIO3_OFFSET;
+		break;
+
+	case 4:
+		*regmap = info->regmap_base;
+		*reg = RV1106_DRV_GPIO4_OFFSET;
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RV1106_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_DRV_PINS_PER_REG;
+	*bit *= RV1106_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RV1106_PULL_BITS_PER_PIN		2
+#define RV1106_PULL_PINS_PER_REG		8
+#define RV1106_PULL_GPIO0_OFFSET		0x38
+#define RV1106_PULL_GPIO1_OFFSET		0x1C0
+#define RV1106_PULL_GPIO2_OFFSET		0x101D0
+#define RV1106_PULL_GPIO3_OFFSET		0x201E0
+#define RV1106_PULL_GPIO4_OFFSET		0x30070
+
+static int rv1106_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* GPIO0_IOC is located in PMU */
+	switch (bank->bank_num) {
+	case 0:
+		*regmap = info->regmap_pmu;
+		*reg = RV1106_PULL_GPIO0_OFFSET;
+		break;
+
+	case 1:
+		*regmap = info->regmap_base;
+		*reg = RV1106_PULL_GPIO1_OFFSET;
+		break;
+
+	case 2:
+		*regmap = info->regmap_base;
+		*reg = RV1106_PULL_GPIO2_OFFSET;
+		break;
+
+	case 3:
+		*regmap = info->regmap_base;
+		*reg = RV1106_PULL_GPIO3_OFFSET;
+		break;
+
+	case 4:
+		*regmap = info->regmap_base;
+		*reg = RV1106_PULL_GPIO4_OFFSET;
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
+	*reg += ((pin_num / RV1106_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_PULL_PINS_PER_REG;
+	*bit *= RV1106_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+#define RV1106_SMT_BITS_PER_PIN		1
+#define RV1106_SMT_PINS_PER_REG		8
+#define RV1106_SMT_GPIO0_OFFSET		0x40
+#define RV1106_SMT_GPIO1_OFFSET		0x280
+#define RV1106_SMT_GPIO2_OFFSET		0x10290
+#define RV1106_SMT_GPIO3_OFFSET		0x202A0
+#define RV1106_SMT_GPIO4_OFFSET		0x300A0
+
+static int rv1106_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* GPIO0_IOC is located in PMU */
+	switch (bank->bank_num) {
+	case 0:
+		*regmap = info->regmap_pmu;
+		*reg = RV1106_SMT_GPIO0_OFFSET;
+		break;
+
+	case 1:
+		*regmap = info->regmap_base;
+		*reg = RV1106_SMT_GPIO1_OFFSET;
+		break;
+
+	case 2:
+		*regmap = info->regmap_base;
+		*reg = RV1106_SMT_GPIO2_OFFSET;
+		break;
+
+	case 3:
+		*regmap = info->regmap_base;
+		*reg = RV1106_SMT_GPIO3_OFFSET;
+		break;
+
+	case 4:
+		*regmap = info->regmap_base;
+		*reg = RV1106_SMT_GPIO4_OFFSET;
+		break;
+
+	default:
+		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
+		break;
+	}
+
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
@@ -3310,6 +3470,7 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		ret = strength;
 		goto config;
 	} else if (ctrl->type == RV1103B ||
+		   ctrl->type == RV1106 ||
 		   ctrl->type == RK3506 ||
 		   ctrl->type == RK3528 ||
 		   ctrl->type == RK3562 ||
@@ -3482,6 +3643,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 				: PIN_CONFIG_BIAS_DISABLE;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RK3188:
 	case RK3288:
@@ -3547,6 +3709,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 		break;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RV1126:
 	case RK3188:
@@ -3843,6 +4006,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 		return pull ? false : true;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RV1126:
 	case RK3188:
@@ -4623,6 +4787,48 @@ static struct rockchip_pin_ctrl rv1103b_pin_ctrl __maybe_unused = {
 	.schmitt_calc_reg	= rv1103b_calc_schmitt_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rv1106_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0",
+			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
+			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
+			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
+			     IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU),
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
+				    0x10020, 0x10028, 0, 0),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(3, 32, "gpio3",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20040, 0x20048, 0x20050, 0x20058),
+	PIN_BANK_IOMUX_FLAGS_OFFSET(4, 24, "gpio4",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0,
+				    0x30000, 0x30008, 0x30010, 0),
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
@@ -5261,6 +5467,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &px30_pin_ctrl },
 	{ .compatible = "rockchip,rv1103b-pinctrl",
 		.data = &rv1103b_pin_ctrl },
+	{ .compatible = "rockchip,rv1106-pinctrl",
+		.data = &rv1106_pin_ctrl },
 	{ .compatible = "rockchip,rv1108-pinctrl",
 		.data = &rv1108_pin_ctrl },
 	{ .compatible = "rockchip,rv1126-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index bb0e803e3b8a..e8b5e850bbef 100644
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
-- 
2.43.0


