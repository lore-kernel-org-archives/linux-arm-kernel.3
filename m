Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7068103E302
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 00:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mIFc/uEzWs/Jv/GutHNakd36l/15dAsS+EbiPHnMa4s=; b=nDJGd65VNwnK3eALpeADGzg9S/
	Ui6+mHPqJsH2KHYWtwZ85F2lx2QAQ7t+mH8CkD3/BUbC1oHEPEh/jvZx089jENXpwHoqPL5dRNIml
	eVr+AOQUICdlIthSqOrvg9aqd5UxkoCpqp6ttvwguj9YwXbEoYQQox7VwWd0TRdi8CeGDoha7QfIE
	8MWzO3IFTCjUKvk9Hmv918Id26NPYpCfH8b5SVEFkkcZ1/OtPikxB7dtspr5FEmT6bCC9IZa7slaF
	PxkvLR2xYW103lFfdm6u3ZKRiEcxGp2KvxKD5rfvSuXq2ptmp3FnaG/sQ5MC33j6BNPg53PJCszHR
	qVu3NX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0q5G-0000000Frvo-2tLE;
	Fri, 13 Mar 2026 00:08:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0q5C-0000000Frtp-1zmD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 00:08:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72A84165C;
	Thu, 12 Mar 2026 17:08:38 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C24DC3F694;
	Thu, 12 Mar 2026 17:08:42 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
Date: Fri, 13 Mar 2026 01:06:52 +0100
Message-ID: <20260313000652.11470-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_170850_630569_C214F27A 
X-CRM114-Status: GOOD (  27.23  )
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

Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
register frame. So far we were instantiating one GPIO chip per pinctrl
device, which covers multiple banks of up to 32 GPIO pins per bank. The
GPIO numbers were set to match the absolute pin numbers, even across the
typically two instances of the pinctrl device.

Convert the GPIO part of the sunxi pinctrl over to use the gpio_generic
framework. This alone allows to remove some sunxi specific code, which
is replaced with the existing generic code. This will become even more
useful with the upcoming A733 support, which adds set and clear
registers for the output.
As a side effect this also changes the GPIO device and number
allocation: Each bank is now represented by its own gpio_chip, with only
as many pins as there are actually implemented. The numbering is left up
to the kernel (.base = -1).

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/Kconfig         |   1 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 245 ++++++++++++--------------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  11 +-
 3 files changed, 124 insertions(+), 133 deletions(-)

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index dc62eba96348e..5905810dbf398 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -4,6 +4,7 @@ if ARCH_SUNXI
 config PINCTRL_SUNXI
 	bool
 	select PINMUX
+	select GPIO_GENERIC
 	select GENERIC_PINCONF
 	select GPIOLIB
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 48434292a39b5..4235f9feff00d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -13,6 +13,7 @@
 #include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irqchip/chained_irq.h>
@@ -86,17 +87,6 @@ static void sunxi_mux_reg(const struct sunxi_pinctrl *pctl,
 	*mask  = (BIT(MUX_FIELD_WIDTH) - 1) << *shift;
 }
 
-static void sunxi_data_reg(const struct sunxi_pinctrl *pctl,
-			   u32 pin, u32 *reg, u32 *shift, u32 *mask)
-{
-	u32 offset = pin % PINS_PER_BANK * DATA_FIELD_WIDTH;
-
-	*reg   = sunxi_bank_offset(pctl, pin) + DATA_REGS_OFFSET +
-		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
-	*shift = offset % BITS_PER_TYPE(u32);
-	*mask  = (BIT(DATA_FIELD_WIDTH) - 1) << *shift;
-}
-
 static void sunxi_dlevel_reg(const struct sunxi_pinctrl *pctl,
 			     u32 pin, u32 *reg, u32 *shift, u32 *mask)
 {
@@ -930,99 +920,22 @@ static const struct pinmux_ops sunxi_pmx_ops = {
 	.strict			= true,
 };
 
-static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip *chip,
-					unsigned offset)
-{
-	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
-
-	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL,
-					    chip->base + offset, true);
-}
-
-static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
-{
-	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
-	bool set_mux = pctl->desc->irq_read_needs_mux &&
-		gpiochip_line_is_irq(chip, offset);
-	u32 pin = offset + chip->base;
-	u32 reg, shift, mask, val;
-
-	sunxi_data_reg(pctl, offset, &reg, &shift, &mask);
-
-	if (set_mux)
-		sunxi_pmx_set(pctl->pctl_dev, pin, SUN4I_FUNC_INPUT);
-
-	val = (readl(pctl->membase + reg) & mask) >> shift;
-
-	if (set_mux)
-		sunxi_pmx_set(pctl->pctl_dev, pin, SUN4I_FUNC_IRQ);
-
-	return val;
-}
-
-static int sunxi_pinctrl_gpio_set(struct gpio_chip *chip, unsigned int offset,
-				  int value)
-{
-	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
-	u32 reg, shift, mask, val;
-	unsigned long flags;
-
-	sunxi_data_reg(pctl, offset, &reg, &shift, &mask);
-
-	raw_spin_lock_irqsave(&pctl->lock, flags);
-
-	val = readl(pctl->membase + reg);
-
-	if (value)
-		val |= mask;
-	else
-		val &= ~mask;
-
-	writel(val, pctl->membase + reg);
-
-	raw_spin_unlock_irqrestore(&pctl->lock, flags);
-
-	return 0;
-}
-
-static int sunxi_pinctrl_gpio_direction_output(struct gpio_chip *chip,
-					unsigned offset, int value)
-{
-	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
-
-	sunxi_pinctrl_gpio_set(chip, offset, value);
-	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL,
-					    chip->base + offset, false);
-}
-
-static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
-				const struct of_phandle_args *gpiospec,
-				u32 *flags)
-{
-	int pin, base;
-
-	base = PINS_PER_BANK * gpiospec->args[0];
-	pin = base + gpiospec->args[1];
-
-	if (pin > gc->ngpio)
-		return -EINVAL;
-
-	if (flags)
-		*flags = gpiospec->args[2];
-
-	return pin;
-}
-
 static int sunxi_pinctrl_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
 	struct sunxi_desc_function *desc;
-	unsigned pinnum = pctl->desc->pin_base + offset;
-	unsigned irqnum;
+	unsigned int pinnum, irqnum, i;
 
 	if (offset >= chip->ngpio)
 		return -ENXIO;
 
+	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++)
+		if (pctl->banks[i].chip.gc.base == chip->base)
+			break;
+	if (i == SUNXI_PINCTRL_MAX_BANKS)
+		return -EINVAL;
+	pinnum = pctl->desc->pin_base + i * PINS_PER_BANK + offset;
+
 	desc = sunxi_pinctrl_desc_find_function_by_pin(pctl, pinnum, "irq");
 	if (!desc)
 		return -EINVAL;
@@ -1039,18 +952,19 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
 	struct sunxi_desc_function *func;
-	int ret;
+	int pinnum = pctl->irq_array[d->hwirq], ret;
+	int bank = (pinnum - pctl->desc->pin_base) / PINS_PER_BANK;
 
-	func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
-					pctl->irq_array[d->hwirq], "irq");
+	func = sunxi_pinctrl_desc_find_function_by_pin(pctl, pinnum, "irq");
 	if (!func)
 		return -EINVAL;
 
-	ret = gpiochip_lock_as_irq(pctl->chip,
-			pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
+	ret = gpiochip_lock_as_irq(&pctl->banks[bank].chip.gc,
+				   d->hwirq % IRQ_PER_BANK);
 	if (ret) {
 		dev_err(pctl->dev, "unable to lock HW IRQ %lu for IRQ\n",
 			irqd_to_hwirq(d));
+
 		return ret;
 	}
 
@@ -1063,9 +977,10 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 static void sunxi_pinctrl_irq_release_resources(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
+	int pinnum = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
+	struct gpio_chip *gc = &pctl->banks[pinnum / PINS_PER_BANK].chip.gc;
 
-	gpiochip_unlock_as_irq(pctl->chip,
-			      pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
+	gpiochip_unlock_as_irq(gc, pinnum);
 }
 
 static int sunxi_pinctrl_irq_set_type(struct irq_data *d, unsigned int type)
@@ -1493,6 +1408,84 @@ static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
 	return 0;
 }
 
+static bool sunxi_of_node_instance_match(struct gpio_chip *chip, unsigned int i)
+{
+	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
+
+	if (i >= SUNXI_PINCTRL_MAX_BANKS)
+		return false;
+
+	return (chip->base == pctl->banks[i].chip.gc.base);
+}
+
+static int sunxi_num_pins_of_bank(struct sunxi_pinctrl *pctl, int bank)
+{
+	int max = -1, i;
+
+	for (i = 0; i < pctl->desc->npins; i++) {
+		int pinnum = pctl->desc->pins[i].pin.number - pctl->desc->pin_base;
+
+		if (pinnum / PINS_PER_BANK < bank)
+			continue;
+		if (pinnum / PINS_PER_BANK > bank)
+			break;
+		if (pinnum % PINS_PER_BANK > max)
+			max = pinnum % PINS_PER_BANK;
+	}
+
+	return max + 1;
+}
+
+static int sunxi_gpio_add_bank(struct sunxi_pinctrl *pctl, int index)
+{
+	char bank_name = 'A' + index + pctl->desc->pin_base / PINS_PER_BANK;
+	struct sunxi_gpio_bank *bank = &pctl->banks[index];
+	struct gpio_generic_chip_config config;
+	struct gpio_chip *gc = &bank->chip.gc;
+	int ngpio, ret;
+
+	ngpio = sunxi_num_pins_of_bank(pctl, index);
+	bank->pctl = pctl;
+	bank->base = pctl->membase + index * pctl->bank_mem_size;
+	if (!ngpio) {
+		gc->owner = THIS_MODULE;
+		gc->ngpio = 0;
+		gc->base = -1;
+		gc->of_gpio_n_cells = 3;
+
+		return 0;
+	}
+
+	config = (struct gpio_generic_chip_config) {
+		.dev = pctl->dev,
+		.sz = 4,
+		.dat = bank->base + DATA_REGS_OFFSET,
+		.set = bank->base + DATA_REGS_OFFSET,
+		.clr = NULL,
+		.flags = GPIO_GENERIC_READ_OUTPUT_REG_SET |
+			 GPIO_GENERIC_PINCTRL_BACKEND,
+	};
+
+	ret = gpio_generic_chip_init(&bank->chip, &config);
+	if (ret)
+		return dev_err_probe(pctl->dev, ret,
+				     "failed to init generic gpio chip\n");
+
+	gc->owner		= THIS_MODULE;
+	gc->label		= devm_kasprintf(pctl->dev, GFP_KERNEL,
+						 "%s-P%c", gc->label,
+						 bank_name);
+	gc->ngpio		= ngpio;
+	gc->base		= -1;
+	gc->of_gpio_n_cells	= 3;
+	gc->of_node_instance_match = sunxi_of_node_instance_match;
+	gc->set_config		= gpiochip_generic_config;
+	gc->to_irq		= sunxi_pinctrl_gpio_to_irq;
+	gc->can_sleep		= false;
+
+	return gpiochip_add_data(gc, pctl);
+}
+
 int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 				  const struct sunxi_pinctrl_desc *desc,
 				  unsigned long flags)
@@ -1503,6 +1496,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	struct sunxi_pinctrl *pctl;
 	struct pinmux_ops *pmxops;
 	int i, ret, last_pin, pin_idx;
+	int gpio_banks;
 	struct clk *clk;
 
 	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
@@ -1590,38 +1584,23 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 		return PTR_ERR(pctl->pctl_dev);
 	}
 
-	pctl->chip = devm_kzalloc(&pdev->dev, sizeof(*pctl->chip), GFP_KERNEL);
-	if (!pctl->chip)
-		return -ENOMEM;
-
-	last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number;
-	pctl->chip->owner = THIS_MODULE;
-	pctl->chip->request = gpiochip_generic_request;
-	pctl->chip->free = gpiochip_generic_free;
-	pctl->chip->set_config = gpiochip_generic_config;
-	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
-	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
-	pctl->chip->get = sunxi_pinctrl_gpio_get;
-	pctl->chip->set = sunxi_pinctrl_gpio_set;
-	pctl->chip->of_xlate = sunxi_pinctrl_gpio_of_xlate;
-	pctl->chip->to_irq = sunxi_pinctrl_gpio_to_irq;
-	pctl->chip->of_gpio_n_cells = 3;
-	pctl->chip->can_sleep = false;
-	pctl->chip->ngpio = round_up(last_pin, PINS_PER_BANK) -
-			    pctl->desc->pin_base;
-	pctl->chip->label = dev_name(&pdev->dev);
-	pctl->chip->parent = &pdev->dev;
-	pctl->chip->base = pctl->desc->pin_base;
-
-	ret = gpiochip_add_data(pctl->chip, pctl);
-	if (ret)
-		return ret;
+	last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number -
+		   pctl->desc->pin_base;
+	for (gpio_banks = 0;
+	     gpio_banks <= last_pin / PINS_PER_BANK;
+	     gpio_banks++) {
+		ret = sunxi_gpio_add_bank(pctl, gpio_banks);
+		if (ret)
+			goto gpiochip_error;
+	}
 
 	for (i = 0; i < pctl->desc->npins; i++) {
 		const struct sunxi_desc_pin *pin = pctl->desc->pins + i;
+		int bank = (pin->pin.number - pctl->desc->pin_base) / PINS_PER_BANK;
+		struct gpio_chip *gc = &pctl->banks[bank].chip.gc;
 
-		ret = gpiochip_add_pin_range(pctl->chip, dev_name(&pdev->dev),
-					     pin->pin.number - pctl->desc->pin_base,
+		ret = gpiochip_add_pin_range(gc, dev_name(&pdev->dev),
+					     pin->pin.number % PINS_PER_BANK,
 					     pin->pin.number, 1);
 		if (ret)
 			goto gpiochip_error;
@@ -1690,6 +1669,8 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	return 0;
 
 gpiochip_error:
-	gpiochip_remove(pctl->chip);
+	while (--gpio_banks >= 0)
+		gpiochip_remove(&pctl->banks[gpio_banks].chip.gc);
+
 	return ret;
 }
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index ad26e4de16a85..085131caa02fe 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -14,6 +14,7 @@
 #define __PINCTRL_SUNXI_H
 
 #include <linux/kernel.h>
+#include <linux/gpio/generic.h>
 #include <linux/spinlock.h>
 
 #define PA_BASE	0
@@ -159,9 +160,17 @@ struct sunxi_pinctrl_regulator {
 	refcount_t		refcount;
 };
 
+struct sunxi_pinctrl;
+
+struct sunxi_gpio_bank {
+	struct gpio_generic_chip chip;
+	struct sunxi_pinctrl *pctl;
+	void __iomem *base;
+};
+
 struct sunxi_pinctrl {
 	void __iomem			*membase;
-	struct gpio_chip		*chip;
+	struct sunxi_gpio_bank		banks[SUNXI_PINCTRL_MAX_BANKS];
 	const struct sunxi_pinctrl_desc	*desc;
 	struct device			*dev;
 	struct sunxi_pinctrl_regulator	regulators[11];
-- 
2.46.4


