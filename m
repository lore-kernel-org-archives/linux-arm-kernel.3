Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC59FC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LfP8e5x0rZHsf9ExJEXX76SCeU8LzRmYzw6di9A6bo=; b=m2SZJwgzq9ut5liTDOa7+c0iAY
	CQlJ59n9EXvGJZEhdFLx063/evnQ88C7KKhbr0nxEbfiqKrybzTGUWzEWx5KmmMd1hViohH2BRuz1
	8WIqFF4diGmEDUtULKZtGevu1v9PXgzQ03zHJAZXSwokJ3hAfGyCnsZdx4R9NyOJ5ULHxCMXFg78C
	QdB/6oMkpgxTvODOmMpgBjW6CV08lcHhmw1pphXIYHMC5D0EaY62w9ImDchaikLbk5DbxkUgPo0w0
	t8H7ulfoQiJtWfZVMRelrbd33KPv7DC0MBwlNv4HwAEUKULFdadiaJ6+KimUV9/W/G/M8WI6YEq37
	aoq0HwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOU8-00000001LQw-02Ks;
	Tue, 04 Feb 2025 19:21:24 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOBp-00000001JA6-3s2W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738695750; x=1770231750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sEL+RL9bkM7/DYpMbQAOmXoxyvdc786QUWh+3yHBmgM=;
  b=Vcl0hK+IAGiz0HL7A2qzGMG5n988kXIHzZ/HSdldlAdXF3qEhcKTI8HH
   sjT8QSv0nLhkZBt2XFKBBJXLuMhSFOcSU3L7przUoXEzi2eB4TLP+f6b2
   E5v3dvgI8szSjPH28I7T+Y8FzLDHf9MxeEmYkbpkZ8+KCf2+icNBrfJoX
   b3DKptURB8sJ/EqeQnptogcNsXoGqT0LYLOVQp6BACJU8QQCThfCz0ZSd
   x8X5xThBKu2Pl9p0FsfrEdqkHNq0C/yEgbBnCImG+e2Ta0iPXGQuULqxz
   9nGNhzN1ug/88VLe+YU/Yvdx9hAUh7s1/7gyET4HPEaxR2Br63vGxyOgq
   g==;
X-CSE-ConnectionGUID: SUlVGuJ0Q/aabh8F50y0ew==
X-CSE-MsgGUID: 4MOyZT4nRpmVXdIgdNZxrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39501844"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="39501844"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 11:02:25 -0800
X-CSE-ConnectionGUID: nGF7aZEGT7K8/BO1l5r56w==
X-CSE-MsgGUID: mdzd++rxT+CrQizee1bvKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="141542480"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2025 11:02:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8F6C4D2; Tue, 04 Feb 2025 21:02:20 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] gpio: xilinx: Use better bitmap APIs where appropriate
Date: Tue,  4 Feb 2025 21:00:47 +0200
Message-ID: <20250204190218.243537-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250204190218.243537-1-andriy.shevchenko@linux.intel.com>
References: <20250204190218.243537-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_110229_977380_D2C9CE6C 
X-CRM114-Status: GOOD (  14.58  )
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

There are bitmap_gather() and bitmap_scatter() that are factually
simplified version of the APIs used in the driver. Use them where
appropriate.

While at it, replace bitmap_bitremap() with find_nth_bit()
for the sake of simplification.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xilinx.c | 68 +++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 41 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 792d94c49077..1ff527ccf6c7 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -45,8 +45,7 @@
  * struct xgpio_instance - Stores information about GPIO device
  * @gc: GPIO chip
  * @regs: register block
- * @hw_map: GPIO pin mapping on hardware side
- * @sw_map: GPIO pin mapping on software side
+ * @map: GPIO pin mapping on hardware side
  * @state: GPIO write state shadow register
  * @last_irq_read: GPIO read state register from last interrupt
  * @dir: GPIO direction shadow register
@@ -60,8 +59,7 @@
 struct xgpio_instance {
 	struct gpio_chip gc;
 	void __iomem *regs;
-	DECLARE_BITMAP(hw_map, 64);
-	DECLARE_BITMAP(sw_map, 64);
+	DECLARE_BITMAP(map, 64);
 	DECLARE_BITMAP(state, 64);
 	DECLARE_BITMAP(last_irq_read, 64);
 	DECLARE_BITMAP(dir, 64);
@@ -73,16 +71,6 @@ struct xgpio_instance {
 	struct clk *clk;
 };
 
-static inline int xgpio_from_bit(struct xgpio_instance *chip, int bit)
-{
-	return bitmap_bitremap(bit, chip->hw_map, chip->sw_map, 64);
-}
-
-static inline int xgpio_to_bit(struct xgpio_instance *chip, int gpio)
-{
-	return bitmap_bitremap(gpio, chip->sw_map, chip->hw_map, 64);
-}
-
 static inline u32 xgpio_get_value32(const unsigned long *map, int bit)
 {
 	const size_t index = BIT_WORD(bit);
@@ -128,7 +116,8 @@ static void xgpio_write_ch(struct xgpio_instance *chip, int reg, int bit, unsign
 
 static void xgpio_read_ch_all(struct xgpio_instance *chip, int reg, unsigned long *a)
 {
-	int bit, lastbit = xgpio_to_bit(chip, chip->gc.ngpio - 1);
+	unsigned long lastbit = find_nth_bit(chip->map, 64, chip->gc.ngpio - 1);
+	int bit;
 
 	for (bit = 0; bit <= lastbit ; bit += 32)
 		xgpio_read_ch(chip, reg, bit, a);
@@ -136,7 +125,8 @@ static void xgpio_read_ch_all(struct xgpio_instance *chip, int reg, unsigned lon
 
 static void xgpio_write_ch_all(struct xgpio_instance *chip, int reg, unsigned long *a)
 {
-	int bit, lastbit = xgpio_to_bit(chip, chip->gc.ngpio - 1);
+	unsigned long lastbit = find_nth_bit(chip->map, 64, chip->gc.ngpio - 1);
+	int bit;
 
 	for (bit = 0; bit <= lastbit ; bit += 32)
 		xgpio_write_ch(chip, reg, bit, a);
@@ -156,7 +146,7 @@ static void xgpio_write_ch_all(struct xgpio_instance *chip, int reg, unsigned lo
 static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int bit = xgpio_to_bit(chip, gpio);
+	unsigned long bit = find_nth_bit(chip->map, 64, gpio);
 	DECLARE_BITMAP(state, 64);
 
 	xgpio_read_ch(chip, XGPIO_DATA_OFFSET, bit, state);
@@ -177,7 +167,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int bit = xgpio_to_bit(chip, gpio);
+	unsigned long bit = find_nth_bit(chip->map, 64, gpio);
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
@@ -207,8 +197,8 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
 
-	bitmap_remap(hw_mask, mask, chip->sw_map, chip->hw_map, 64);
-	bitmap_remap(hw_bits, bits, chip->sw_map, chip->hw_map, 64);
+	bitmap_scatter(hw_mask, mask, chip->map, 64);
+	bitmap_scatter(hw_bits, bits, chip->map, 64);
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
@@ -234,7 +224,7 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int bit = xgpio_to_bit(chip, gpio);
+	unsigned long bit = find_nth_bit(chip->map, 64, gpio);
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
@@ -263,7 +253,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int bit = xgpio_to_bit(chip, gpio);
+	unsigned long bit = find_nth_bit(chip->map, 64, gpio);
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
@@ -395,7 +385,7 @@ static void xgpio_irq_mask(struct irq_data *irq_data)
 	unsigned long flags;
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	int bit = xgpio_to_bit(chip, irq_offset);
+	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
 	u32 mask = BIT(bit / 32), temp;
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
@@ -422,7 +412,7 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 	unsigned long flags;
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	int bit = xgpio_to_bit(chip, irq_offset);
+	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
 	u32 old_enable = xgpio_get_value32(chip->enable, bit);
 	u32 mask = BIT(bit / 32), val;
 
@@ -462,7 +452,7 @@ static int xgpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
 {
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	int bit = xgpio_to_bit(chip, irq_offset);
+	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
 
 	/*
 	 * The Xilinx GPIO hardware provides a single interrupt status
@@ -502,10 +492,10 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	DECLARE_BITMAP(rising, 64);
 	DECLARE_BITMAP(falling, 64);
-	DECLARE_BITMAP(all, 64);
+	DECLARE_BITMAP(hw, 64);
+	DECLARE_BITMAP(sw, 64);
 	int irq_offset;
 	u32 status;
-	u32 bit;
 
 	status = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
 	xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, status);
@@ -514,29 +504,28 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 
 	raw_spin_lock(&chip->gpio_lock);
 
-	xgpio_read_ch_all(chip, XGPIO_DATA_OFFSET, all);
+	xgpio_read_ch_all(chip, XGPIO_DATA_OFFSET, hw);
 
 	bitmap_complement(rising, chip->last_irq_read, 64);
-	bitmap_and(rising, rising, all, 64);
+	bitmap_and(rising, rising, hw, 64);
 	bitmap_and(rising, rising, chip->enable, 64);
 	bitmap_and(rising, rising, chip->rising_edge, 64);
 
-	bitmap_complement(falling, all, 64);
+	bitmap_complement(falling, hw, 64);
 	bitmap_and(falling, falling, chip->last_irq_read, 64);
 	bitmap_and(falling, falling, chip->enable, 64);
 	bitmap_and(falling, falling, chip->falling_edge, 64);
 
-	bitmap_copy(chip->last_irq_read, all, 64);
-	bitmap_or(all, rising, falling, 64);
+	bitmap_copy(chip->last_irq_read, hw, 64);
+	bitmap_or(hw, rising, falling, 64);
 
 	raw_spin_unlock(&chip->gpio_lock);
 
 	dev_dbg(gc->parent, "IRQ rising %*pb falling %*pb\n", 64, rising, 64, falling);
 
-	for_each_set_bit(bit, all, 64) {
-		irq_offset = xgpio_from_bit(chip, bit);
+	bitmap_gather(sw, hw, chip->map, 64);
+	for_each_set_bit(irq_offset, sw, 64)
 		generic_handle_domain_irq(gc->irq.domain, irq_offset);
-	}
 
 	chained_irq_exit(irqchip, desc);
 }
@@ -613,17 +602,14 @@ static int xgpio_probe(struct platform_device *pdev)
 	if (width[1] > 32)
 		return -EINVAL;
 
-	/* Setup software pin mapping */
-	bitmap_set(chip->sw_map, 0, width[0] + width[1]);
-
 	/* Setup hardware pin mapping */
-	bitmap_set(chip->hw_map,  0, width[0]);
-	bitmap_set(chip->hw_map, 32, width[1]);
+	bitmap_set(chip->map,  0, width[0]);
+	bitmap_set(chip->map, 32, width[1]);
 
 	raw_spin_lock_init(&chip->gpio_lock);
 
 	chip->gc.base = -1;
-	chip->gc.ngpio = bitmap_weight(chip->hw_map, 64);
+	chip->gc.ngpio = bitmap_weight(chip->map, 64);
 	chip->gc.parent = dev;
 	chip->gc.direction_input = xgpio_dir_in;
 	chip->gc.direction_output = xgpio_dir_out;
-- 
2.43.0.rc1.1336.g36b5255a03ac


