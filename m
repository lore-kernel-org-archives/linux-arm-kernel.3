Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553C5C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uofQjs/jGmDjx1yeGI6g2kqnGMt/pKpgqBUa+GLhyks=; b=OeVm/ebRXBwRN5IZnWX30pHYaq
	7cDxE+Fhw5U96dw68ZgpcY7AuvhrN4qZcGpHhtzyE+f1eegx6o+A6Hnn6+A+qutwrt5lV1NEpSaCJ
	h9vM6lbwKGssFsxsicv69EEn5S3u/vbJKveX2gtddKgRJmcy1JuS06+PY8tWybCP1X4jPQWj1PNx9
	4IgtaqWBjxdYjta60kHp4aEn6z9QcMZDcoBjaJ7SH1jlFoSygOXerrK+rtk3HfqU0bp+tPX8gL2+A
	uf2Ge4bWa5Xg9DuhrjsUdHHfSXzROjSakoG5mzvEm/ZiglCRhuj+09YBV3MBQHkq4q/229OnZ64MW
	C0ItfQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbo5-00000002iIY-0ACA;
	Wed, 05 Feb 2025 09:34:53 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfblP-00000002huT-1Ejf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 09:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738747927; x=1770283927;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eHxpZj/qg2ID/KeN2wK/bM2xcQGbbf7k3wokyWvv4rw=;
  b=kRxELil65G7N12sk8+USSE09LcOVaeFmxZZWWXw1jOe+IFRSiKyQvGia
   b1BvRIruxyqTx6yaKuylDT/hx2WXcIWiqxwI4yybOKARZLjFtaQSgzWgE
   KNX0ZlXScK/fneGxWP+78AdPLV5kvLjtH5hsry43BLW4HgHiRQbUMjRp1
   M2CKo9eWdAT6+D3MhbS7D8OrhFiMVDpF9Ko//W21EdUudDM9P34usGVan
   xBSEaK/H5HnM8rlmUnMjtwfuGIM1HGgrgOTPpgGfqMQwsXQbx4+968icq
   Q4TfDulWljzZRR/NO6ZIk9+s9LcQYBxwoBNJkTIy4d7ZIkpmBVBo4Ioiu
   g==;
X-CSE-ConnectionGUID: zHRr2XhdQVSzGEcVekohcQ==
X-CSE-MsgGUID: FYVbuq5JSTO06Kv/qzbd4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39189573"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39189573"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:32:05 -0800
X-CSE-ConnectionGUID: WQidQxV/SLGzESNWYIEYsQ==
X-CSE-MsgGUID: ViPIXb7zQ2uBe47wjStDyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115466167"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 05 Feb 2025 01:32:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2F4A73A7; Wed, 05 Feb 2025 11:32:01 +0200 (EET)
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
Subject: [PATCH v2 2/2] gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()
Date: Wed,  5 Feb 2025 11:31:11 +0200
Message-ID: <20250205093200.373709-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
References: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_013207_384586_2308FC95 
X-CRM114-Status: GOOD (  11.96  )
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

Relatively recently bitmap APIs were expanded by introduction of
bitmap_read() and bitmap_write(). These APIs are generic ones
that may replace custom functions in this driver, i.e. xgpio_get_value32()
and xgpio_set_value32(). Do replace them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xilinx.c | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 1ff527ccf6c7..c58a7e1349b4 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -71,23 +71,6 @@ struct xgpio_instance {
 	struct clk *clk;
 };
 
-static inline u32 xgpio_get_value32(const unsigned long *map, int bit)
-{
-	const size_t index = BIT_WORD(bit);
-	const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
-
-	return (map[index] >> offset) & 0xFFFFFFFFul;
-}
-
-static inline void xgpio_set_value32(unsigned long *map, int bit, u32 v)
-{
-	const size_t index = BIT_WORD(bit);
-	const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
-
-	map[index] &= ~(0xFFFFFFFFul << offset);
-	map[index] |= (unsigned long)v << offset;
-}
-
 static inline int xgpio_regoffset(struct xgpio_instance *chip, int ch)
 {
 	switch (ch) {
@@ -103,15 +86,17 @@ static inline int xgpio_regoffset(struct xgpio_instance *chip, int ch)
 static void xgpio_read_ch(struct xgpio_instance *chip, int reg, int bit, unsigned long *a)
 {
 	void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
+	unsigned long value = xgpio_readreg(addr);
 
-	xgpio_set_value32(a, bit, xgpio_readreg(addr));
+	bitmap_write(a, value, round_down(bit, 32), 32);
 }
 
 static void xgpio_write_ch(struct xgpio_instance *chip, int reg, int bit, unsigned long *a)
 {
 	void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
+	unsigned long value = bitmap_read(a, round_down(bit, 32), 32);
 
-	xgpio_writereg(addr, xgpio_get_value32(a, bit));
+	xgpio_writereg(addr, value);
 }
 
 static void xgpio_read_ch_all(struct xgpio_instance *chip, int reg, unsigned long *a)
@@ -385,14 +370,15 @@ static void xgpio_irq_mask(struct irq_data *irq_data)
 	unsigned long flags;
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
+	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset), enable;
 	u32 mask = BIT(bit / 32), temp;
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	__clear_bit(bit, chip->enable);
 
-	if (xgpio_get_value32(chip->enable, bit) == 0) {
+	enable = bitmap_read(chip->enable, round_down(bit, 32), 32);
+	if (enable == 0) {
 		/* Disable per channel interrupt */
 		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
 		temp &= ~mask;
@@ -412,17 +398,15 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 	unsigned long flags;
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
-	u32 old_enable = xgpio_get_value32(chip->enable, bit);
+	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset), enable;
 	u32 mask = BIT(bit / 32), val;
 
 	gpiochip_enable_irq(&chip->gc, irq_offset);
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
-	__set_bit(bit, chip->enable);
-
-	if (old_enable == 0) {
+	enable = bitmap_read(chip->enable, round_down(bit, 32), 32);
+	if (enable == 0) {
 		/* Clear any existing per-channel interrupts */
 		val = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
 		val &= mask;
@@ -437,6 +421,8 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, val);
 	}
 
+	__set_bit(bit, chip->enable);
+
 	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


