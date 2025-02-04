Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2B9C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvKmZwb+bi+gQfZ8BtTau7plftP9PhwwEkby45K6dfg=; b=Gc5ouiDLrapTmdXecHp62Y4lK6
	DfkGlvaQ+PuGIoS+mTmVc2hwyjHBy9MjwBMX6444mUKBCLkBmMZ6tDoU02c5tw8gsIieAEHwXXEP9
	dH1HfTEtnXH8291kVfGSkJX7VkV7Pug6YfLOBpqUnRaIf2cJfWfpksaV1mDK9MQekox/R1d5ZEDMQ
	RjEw26QBc7em9WBeNXH5CSL/yVYq7lPVevzrwavbwwtyPozWGUyBanunbTqy3vuuVFTOv3CnKOfk+
	Nv76oX5h4sEOHPhE2cUD12ZgPpBwqyeSMkB+fmE2MBNWTvIA7GeIqoYrbC1XRj9tnSJrqnZoNm8fB
	6nJ7QMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfORW-00000001LBc-2ynm;
	Tue, 04 Feb 2025 19:18:42 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOBl-00000001JA6-2gaP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738695746; x=1770231746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uPcVdAtRWpZ0AglXlZdSj+u1jA9t4CapbWMO23b2j00=;
  b=ezdFq2AdanOSfwvcSxT7bXxezLfLFbA7/9R4dawnFhQhehF2MKgvbGE8
   MOwH2HtLvSwXcmLObD5Ti/wzneL/f5xgzwq9Sp/NlPh5Z/1kYIGs1EB+b
   qFK6J59NNnjkBhaz5n0r7uuGclHguPLXuN37JlsxQQfX0I7xmbNAMBPmi
   7G8L7rBvPhlDpkaO87Aw5OY3ZI6eJbMTNv6paUEMryY0OayDatpXzNZWy
   6wEewbGVmWwG4WWLzJLY0oU1+9f2HG/52FN8U0mtWqlkgkR97XLdDuP0n
   CZ0P74qg31pEXPX8pXf+IXbRRCcD/MwGPIlZvzjWPpImogAvKwVUboiLb
   Q==;
X-CSE-ConnectionGUID: JLg9w1ylRxGixg+qj8WYww==
X-CSE-MsgGUID: D9DP5IQBQ3KBws4kRxwxsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39501840"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="39501840"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 11:02:24 -0800
X-CSE-ConnectionGUID: up+77qcoR6eg2GWYh9wVGQ==
X-CSE-MsgGUID: 2/Udqy5eQ/WDHsAI1cB4Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="141542482"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2025 11:02:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9FD0C399; Tue, 04 Feb 2025 21:02:20 +0200 (EET)
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
Subject: [PATCH v1 2/2] gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()
Date: Tue,  4 Feb 2025 21:00:48 +0200
Message-ID: <20250204190218.243537-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250204190218.243537-1-andriy.shevchenko@linux.intel.com>
References: <20250204190218.243537-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_110225_693423_B890E064 
X-CRM114-Status: GOOD (  12.04  )
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
 drivers/gpio/gpio-xilinx.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 1ff527ccf6c7..91015ff8a17b 100644
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
@@ -386,13 +371,14 @@ static void xgpio_irq_mask(struct irq_data *irq_data)
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
 	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
+	unsigned long old_enable = bitmap_read(chip->enable, round_down(bit, 32), 32);
 	u32 mask = BIT(bit / 32), temp;
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	__clear_bit(bit, chip->enable);
 
-	if (xgpio_get_value32(chip->enable, bit) == 0) {
+	if (old_enable == 0) {
 		/* Disable per channel interrupt */
 		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
 		temp &= ~mask;
@@ -413,7 +399,7 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
 	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
-	u32 old_enable = xgpio_get_value32(chip->enable, bit);
+	unsigned long old_enable = bitmap_read(chip->enable, round_down(bit, 32), 32);
 	u32 mask = BIT(bit / 32), val;
 
 	gpiochip_enable_irq(&chip->gc, irq_offset);
-- 
2.43.0.rc1.1336.g36b5255a03ac


