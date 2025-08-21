Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB08CCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NJO6+lnpiL3tyUy96V8M/9mIk0w6RhG2+4t1jg5wAY=; b=oE3/ZmPPIEusVguRVuMjCz0KJ5
	XUjhwgZai10ClzjNIxxhKh4EVj/IsLR0cK/6nmGNLMS7NSrBDGlSn1FsPl7/tNaU7+9FqKTkmK3pt
	f+uMWhixDiQ/gcd0XIV5BctdTG0r9n+qdH4m7+QiIkeW7OhovEw2GTCA7cIn2tSsJlPkyr5TFk9CF
	+E05x/8wMQPzZAP4tagEDtpkDdcqOCUDzwN3slQI4J7ODLkQg6GcFiyN8m5WViaTvR9AKrfcYOt47
	XaLzUSclLas4A2kq5OSWgxvPmMyGsExQfjEZ1YvIXgHBiLqBtjgnuFYfcRTOnDzjVWZKQkppvILKF
	t28tr3+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7n-0000000FdrU-2qe0;
	Thu, 21 Aug 2025 03:38:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotR8-0000000FKVh-0rrn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 00:45:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A53E712FC;
	Wed, 20 Aug 2025 17:45:41 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E427D3F63F;
	Wed, 20 Aug 2025 17:45:47 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH 4/9] pinctrl: sunxi: refactor IRQ register accessors
Date: Thu, 21 Aug 2025 01:42:27 +0100
Message-ID: <20250821004232.8134-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_174550_321475_F409C5D8 
X-CRM114-Status: GOOD (  20.51  )
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

So far on Allwinner SoCs the registers for controlling the IRQ
capabilities of each bank are grouped separately, behind all the pinmux
related register for all banks:
    0x000   0x024      0x144       0x200  0x220     0x320
    PortA   PortB  ... PortJ <gap> IRQ-A  IRQ-B ... IRQ-J

The newest SoCs now group the IRQ registers together with the other
per-bank registers, so we need to change the accessor functions to
account for that:
    0x080 0x0c0   0x100 0x140      0x580 0x5c0
    PortA IRQ-A   PortB IRQ-B  ... PortK IRQ-K

In preparation for supporting those newer SoCs, pass in the pointer to
"struct sunxi_pinctrl" instead of just its member "desc", so that we gain
access to the flags, to later determine which of the layout variants we
need to use. To simplify that, add a new sunxi_irq_base_reg() function
that returns the respective IRQ register base address.
Also split off the IRQ control register base offset (0x200) from each
IRQ register's offset, so that the individual offsets can be added later
separately, to that base address.

No functional change at this point, just refactoring.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 21 +++++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 55 ++++++++++++++++-----------
 2 files changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 2af6ebef7a10b..540fa6c285cfc 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -734,9 +734,10 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		else
 			val = 0xD; /* 3.3V */
 
-		reg = readl(pctl->membase + sunxi_grp_config_reg(pin));
+		reg = readl(pctl->membase + sunxi_grp_config_reg(pctl, pin));
 		reg &= ~IO_BIAS_MASK;
-		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
+		writel(reg | val, pctl->membase +
+		       sunxi_grp_config_reg(pctl, pin));
 		return 0;
 	case BIAS_VOLTAGE_PIO_POW_MODE_CTL:
 		val = uV > 1800000 && uV <= 2500000 ? BIT(bank) : 0;
@@ -1072,7 +1073,7 @@ static void sunxi_pinctrl_irq_release_resources(struct irq_data *d)
 static int sunxi_pinctrl_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
-	u32 reg = sunxi_irq_cfg_reg(pctl->desc, d->hwirq);
+	u32 reg = sunxi_irq_cfg_reg(pctl, d->hwirq);
 	u8 index = sunxi_irq_cfg_offset(d->hwirq);
 	unsigned long flags;
 	u32 regval;
@@ -1119,7 +1120,7 @@ static int sunxi_pinctrl_irq_set_type(struct irq_data *d, unsigned int type)
 static void sunxi_pinctrl_irq_ack(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
-	u32 status_reg = sunxi_irq_status_reg(pctl->desc, d->hwirq);
+	u32 status_reg = sunxi_irq_status_reg(pctl, d->hwirq);
 	u8 status_idx = sunxi_irq_status_offset(d->hwirq);
 
 	/* Clear the IRQ */
@@ -1129,7 +1130,7 @@ static void sunxi_pinctrl_irq_ack(struct irq_data *d)
 static void sunxi_pinctrl_irq_mask(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
-	u32 reg = sunxi_irq_ctrl_reg(pctl->desc, d->hwirq);
+	u32 reg = sunxi_irq_ctrl_reg(pctl, d->hwirq);
 	u8 idx = sunxi_irq_ctrl_offset(d->hwirq);
 	unsigned long flags;
 	u32 val;
@@ -1146,7 +1147,7 @@ static void sunxi_pinctrl_irq_mask(struct irq_data *d)
 static void sunxi_pinctrl_irq_unmask(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
-	u32 reg = sunxi_irq_ctrl_reg(pctl->desc, d->hwirq);
+	u32 reg = sunxi_irq_ctrl_reg(pctl, d->hwirq);
 	u8 idx = sunxi_irq_ctrl_offset(d->hwirq);
 	unsigned long flags;
 	u32 val;
@@ -1250,7 +1251,7 @@ static void sunxi_pinctrl_irq_handler(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	reg = sunxi_irq_status_reg_from_bank(pctl->desc, bank);
+	reg = sunxi_irq_status_reg_from_bank(pctl, bank);
 	val = readl(pctl->membase + reg);
 
 	if (val) {
@@ -1491,7 +1492,7 @@ static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
 
 		writel(src | div << 4,
 		       pctl->membase +
-		       sunxi_irq_debounce_reg_from_bank(pctl->desc, i));
+		       sunxi_irq_debounce_reg_from_bank(pctl, i));
 	}
 
 	return 0;
@@ -1678,10 +1679,10 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	for (i = 0; i < pctl->desc->irq_banks; i++) {
 		/* Mask and clear all IRQs before registering a handler */
 		writel(0, pctl->membase +
-			  sunxi_irq_ctrl_reg_from_bank(pctl->desc, i));
+			  sunxi_irq_ctrl_reg_from_bank(pctl, i));
 		writel(0xffffffff,
 		       pctl->membase +
-		       sunxi_irq_status_reg_from_bank(pctl->desc, i));
+		       sunxi_irq_status_reg_from_bank(pctl, i));
 
 		irq_set_chained_handler_and_data(pctl->irq[i],
 						 sunxi_pinctrl_irq_handler,
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 77a08ccde095a..252cf58387e33 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -57,20 +57,21 @@
 
 #define IRQ_PER_BANK		32
 
-#define IRQ_CFG_REG		0x200
+#define IRQ_REGS_OFFSET		0x200
+#define IRQ_CFG_REG_OFFSET	0x00
 #define IRQ_CFG_IRQ_PER_REG		8
 #define IRQ_CFG_IRQ_BITS		4
 #define IRQ_CFG_IRQ_MASK		((1 << IRQ_CFG_IRQ_BITS) - 1)
-#define IRQ_CTRL_REG		0x210
+#define IRQ_CTRL_REG_OFFSET	0x10
 #define IRQ_CTRL_IRQ_PER_REG		32
 #define IRQ_CTRL_IRQ_BITS		1
 #define IRQ_CTRL_IRQ_MASK		((1 << IRQ_CTRL_IRQ_BITS) - 1)
-#define IRQ_STATUS_REG		0x214
+#define IRQ_STATUS_REG_OFFSET	0x14
 #define IRQ_STATUS_IRQ_PER_REG		32
 #define IRQ_STATUS_IRQ_BITS		1
 #define IRQ_STATUS_IRQ_MASK		((1 << IRQ_STATUS_IRQ_BITS) - 1)
 
-#define IRQ_DEBOUNCE_REG	0x218
+#define IRQ_DEBOUNCE_REG_OFFSET	0x18
 
 #define IRQ_MEM_SIZE		0x20
 
@@ -224,7 +225,8 @@ struct sunxi_pinctrl {
 		.irqnum = _irq,					\
 	}
 
-static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc, u8 bank)
+static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
+					u8 bank)
 {
 	if (!desc->irq_bank_map)
 		return bank;
@@ -232,68 +234,77 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc, u
 		return desc->irq_bank_map[bank];
 }
 
-static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl_desc *desc,
+static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
+{
+	return IRQ_REGS_OFFSET +
+	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
+}
+
+static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl *pctl,
 				    u16 irq)
 {
 	u8 bank = irq / IRQ_PER_BANK;
 	u8 reg = (irq % IRQ_PER_BANK) / IRQ_CFG_IRQ_PER_REG * 0x04;
 
-	return IRQ_CFG_REG +
-	       sunxi_irq_hw_bank_num(desc, bank) * IRQ_MEM_SIZE + reg;
+	return sunxi_irq_base_reg(pctl, bank) + IRQ_CFG_REG_OFFSET + reg;
 }
 
 static inline u32 sunxi_irq_cfg_offset(u16 irq)
 {
 	u32 irq_num = irq % IRQ_CFG_IRQ_PER_REG;
+
 	return irq_num * IRQ_CFG_IRQ_BITS;
 }
 
-static inline u32 sunxi_irq_ctrl_reg_from_bank(const struct sunxi_pinctrl_desc *desc, u8 bank)
+static inline u32 sunxi_irq_ctrl_reg_from_bank(const struct sunxi_pinctrl *pctl,
+					       u8 bank)
 {
-	return IRQ_CTRL_REG + sunxi_irq_hw_bank_num(desc, bank) * IRQ_MEM_SIZE;
+	return sunxi_irq_base_reg(pctl, bank) + IRQ_CTRL_REG_OFFSET;
 }
 
-static inline u32 sunxi_irq_ctrl_reg(const struct sunxi_pinctrl_desc *desc,
-				     u16 irq)
+static inline u32 sunxi_irq_ctrl_reg(const struct sunxi_pinctrl *pctl, u16 irq)
 {
 	u8 bank = irq / IRQ_PER_BANK;
 
-	return sunxi_irq_ctrl_reg_from_bank(desc, bank);
+	return sunxi_irq_ctrl_reg_from_bank(pctl, bank);
 }
 
 static inline u32 sunxi_irq_ctrl_offset(u16 irq)
 {
 	u32 irq_num = irq % IRQ_CTRL_IRQ_PER_REG;
+
 	return irq_num * IRQ_CTRL_IRQ_BITS;
 }
 
-static inline u32 sunxi_irq_debounce_reg_from_bank(const struct sunxi_pinctrl_desc *desc, u8 bank)
+static inline
+u32 sunxi_irq_debounce_reg_from_bank(const struct sunxi_pinctrl *pctl, u8 bank)
 {
-	return IRQ_DEBOUNCE_REG +
-	       sunxi_irq_hw_bank_num(desc, bank) * IRQ_MEM_SIZE;
+	return sunxi_irq_base_reg(pctl, bank) + IRQ_DEBOUNCE_REG_OFFSET;
 }
 
-static inline u32 sunxi_irq_status_reg_from_bank(const struct sunxi_pinctrl_desc *desc, u8 bank)
+static inline
+u32 sunxi_irq_status_reg_from_bank(const struct sunxi_pinctrl *pctl, u8 bank)
 {
-	return IRQ_STATUS_REG +
-	       sunxi_irq_hw_bank_num(desc, bank) * IRQ_MEM_SIZE;
+	return sunxi_irq_base_reg(pctl, bank) + IRQ_STATUS_REG_OFFSET;
 }
 
-static inline u32 sunxi_irq_status_reg(const struct sunxi_pinctrl_desc *desc,
+static inline u32 sunxi_irq_status_reg(const struct sunxi_pinctrl *pctl,
 				       u16 irq)
 {
 	u8 bank = irq / IRQ_PER_BANK;
 
-	return sunxi_irq_status_reg_from_bank(desc, bank);
+	return sunxi_irq_status_reg_from_bank(pctl, bank);
 }
 
 static inline u32 sunxi_irq_status_offset(u16 irq)
 {
 	u32 irq_num = irq % IRQ_STATUS_IRQ_PER_REG;
+
 	return irq_num * IRQ_STATUS_IRQ_BITS;
 }
 
-static inline u32 sunxi_grp_config_reg(u16 pin)
+static inline u32 sunxi_grp_config_reg(const struct sunxi_pinctrl *pctl,
+				       u16 pin)
 {
 	u8 bank = pin / PINS_PER_BANK;
 
-- 
2.46.3


