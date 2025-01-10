Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CD8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7er3opSYby3NP27eo0o9TgpEwI26lkeOJxlM8PGkSVc=; b=yc2vbmOMQZBbx/U7PkWIxIIUgF
	9BOwQBYMKeeufEdVyVqExESB/hiXdRfcwLBWm/Y4nlcnyijvtbPQNt708SH1ut3Pr5bCw7sO3bRIo
	bmX1eU4fTbZg9A6MIJUj5OAEjwtseta/BHPxbRxJx+FO+N3VS92HSOLOUP0nC//MxV7dTyaEX1SEF
	rqd7tnjqsWLhtiK271V7eOZbLVZ1am2qaaHLuiEBcez/5Pv0nlprmdBIIWP+pfjjg3seBdbDtvWGb
	qGmA6wQancwOnpmzEur0Rv8lYCMv15FUuTur6cvtdym8ppn+E3qMEvEVMfrx14yOqpRgRKkV0C/GA
	yKOTemUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWI1k-0000000GIny-0ygK;
	Fri, 10 Jan 2025 16:38:28 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHxb-0000000GHw6-0YEc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:34:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736526846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7er3opSYby3NP27eo0o9TgpEwI26lkeOJxlM8PGkSVc=;
	b=pqCLo51zdyht5882klDKd9uScHG6XyoVHwTWIZWZ2LAJ3HvN1v1gQnm2elWdF+bWvRhJq4
	P5KmVS5mWEZOiK2PSA9L6qhULJf+3JltmhKq7sJAxN1YTXkRVjIqMhcQjWpI77enJiNrfj
	DsG3UPv03cLn3wunCGmhqnVAZdTFKt0=
From: Sean Anderson <sean.anderson@linux.dev>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Cc: Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Robert Hancock <hancock@sedsystems.ca>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: xilinx: Convert gpio_lock to raw spinlock
Date: Fri, 10 Jan 2025 11:33:54 -0500
Message-Id: <20250110163354.2012654-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_083412_251593_EB561BBE 
X-CRM114-Status: GOOD (  11.12  )
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

irq_chip functions may be called in raw spinlock context. Therefore, we
must also use a raw spinlock for our own internal locking.

This fixes the following lockdep splat:

[    5.349336] =============================
[    5.353349] [ BUG: Invalid wait context ]
[    5.357361] 6.13.0-rc5+ #69 Tainted: G        W
[    5.363031] -----------------------------
[    5.367045] kworker/u17:1/44 is trying to lock:
[    5.371587] ffffff88018b02c0 (&chip->gpio_lock){....}-{3:3}, at: xgpio_irq_unmask (drivers/gpio/gpio-xilinx.c:433 (discriminator 8))
[    5.380079] other info that might help us debug this:
[    5.385138] context-{5:5}
[    5.387762] 5 locks held by kworker/u17:1/44:
[    5.392123] #0: ffffff8800014958 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work (kernel/workqueue.c:3204)
[    5.402260] #1: ffffffc082fcbdd8 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work (kernel/workqueue.c:3205)
[    5.411528] #2: ffffff880172c900 (&dev->mutex){....}-{4:4}, at: __device_attach (drivers/base/dd.c:1006)
[    5.419929] #3: ffffff88039c8268 (request_class#2){+.+.}-{4:4}, at: __setup_irq (kernel/irq/internals.h:156 kernel/irq/manage.c:1596)
[    5.428331] #4: ffffff88039c80c8 (lock_class#2){....}-{2:2}, at: __setup_irq (kernel/irq/manage.c:1614)
[    5.436472] stack backtrace:
[    5.439359] CPU: 2 UID: 0 PID: 44 Comm: kworker/u17:1 Tainted: G        W          6.13.0-rc5+ #69
[    5.448690] Tainted: [W]=WARN
[    5.451656] Hardware name: xlnx,zynqmp (DT)
[    5.455845] Workqueue: events_unbound deferred_probe_work_func
[    5.461699] Call trace:
[    5.464147] show_stack+0x18/0x24 C
[    5.467821] dump_stack_lvl (lib/dump_stack.c:123)
[    5.471501] dump_stack (lib/dump_stack.c:130)
[    5.474824] __lock_acquire (kernel/locking/lockdep.c:4828 kernel/locking/lockdep.c:4898 kernel/locking/lockdep.c:5176)
[    5.478758] lock_acquire (arch/arm64/include/asm/percpu.h:40 kernel/locking/lockdep.c:467 kernel/locking/lockdep.c:5851 kernel/locking/lockdep.c:5814)
[    5.482429] _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:111 kernel/locking/spinlock.c:162)
[    5.486797] xgpio_irq_unmask (drivers/gpio/gpio-xilinx.c:433 (discriminator 8))
[    5.490737] irq_enable (kernel/irq/internals.h:236 kernel/irq/chip.c:170 kernel/irq/chip.c:439 kernel/irq/chip.c:432 kernel/irq/chip.c:345)
[    5.494060] __irq_startup (kernel/irq/internals.h:241 kernel/irq/chip.c:180 kernel/irq/chip.c:250)
[    5.497645] irq_startup (kernel/irq/chip.c:270)
[    5.501143] __setup_irq (kernel/irq/manage.c:1807)
[    5.504728] request_threaded_irq (kernel/irq/manage.c:2208)

Fixes: a32c7caea292 ("gpio: gpio-xilinx: Add interrupt support")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Cc: stable@vger.kernel.org
---

 drivers/gpio/gpio-xilinx.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index c6a8f2c82680..792d94c49077 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -65,7 +65,7 @@ struct xgpio_instance {
 	DECLARE_BITMAP(state, 64);
 	DECLARE_BITMAP(last_irq_read, 64);
 	DECLARE_BITMAP(dir, 64);
-	spinlock_t gpio_lock;	/* For serializing operations */
+	raw_spinlock_t gpio_lock;	/* For serializing operations */
 	int irq;
 	DECLARE_BITMAP(enable, 64);
 	DECLARE_BITMAP(rising_edge, 64);
@@ -179,14 +179,14 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
 	int bit = xgpio_to_bit(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write to GPIO signal and set its direction to output */
 	__assign_bit(bit, chip->state, val);
 
 	xgpio_write_ch(chip, XGPIO_DATA_OFFSET, bit, chip->state);
 
-	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
 /**
@@ -210,7 +210,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	bitmap_remap(hw_mask, mask, chip->sw_map, chip->hw_map, 64);
 	bitmap_remap(hw_bits, bits, chip->sw_map, chip->hw_map, 64);
 
-	spin_lock_irqsave(&chip->gpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	bitmap_replace(state, chip->state, hw_bits, hw_mask, 64);
 
@@ -218,7 +218,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 
 	bitmap_copy(chip->state, state, 64);
 
-	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
 /**
@@ -236,13 +236,13 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
 	int bit = xgpio_to_bit(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Set the GPIO bit in shadow register and set direction as input */
 	__set_bit(bit, chip->dir);
 	xgpio_write_ch(chip, XGPIO_TRI_OFFSET, bit, chip->dir);
 
-	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
 	return 0;
 }
@@ -265,7 +265,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
 	int bit = xgpio_to_bit(chip, gpio);
 
-	spin_lock_irqsave(&chip->gpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write state of GPIO signal */
 	__assign_bit(bit, chip->state, val);
@@ -275,7 +275,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	__clear_bit(bit, chip->dir);
 	xgpio_write_ch(chip, XGPIO_TRI_OFFSET, bit, chip->dir);
 
-	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
 	return 0;
 }
@@ -398,7 +398,7 @@ static void xgpio_irq_mask(struct irq_data *irq_data)
 	int bit = xgpio_to_bit(chip, irq_offset);
 	u32 mask = BIT(bit / 32), temp;
 
-	spin_lock_irqsave(&chip->gpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	__clear_bit(bit, chip->enable);
 
@@ -408,7 +408,7 @@ static void xgpio_irq_mask(struct irq_data *irq_data)
 		temp &= ~mask;
 		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, temp);
 	}
-	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
 	gpiochip_disable_irq(&chip->gc, irq_offset);
 }
@@ -428,7 +428,7 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 
 	gpiochip_enable_irq(&chip->gc, irq_offset);
 
-	spin_lock_irqsave(&chip->gpio_lock, flags);
+	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	__set_bit(bit, chip->enable);
 
@@ -447,7 +447,7 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, val);
 	}
 
-	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+	raw_spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
 
 /**
@@ -512,7 +512,7 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 
 	chained_irq_enter(irqchip, desc);
 
-	spin_lock(&chip->gpio_lock);
+	raw_spin_lock(&chip->gpio_lock);
 
 	xgpio_read_ch_all(chip, XGPIO_DATA_OFFSET, all);
 
@@ -529,7 +529,7 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 	bitmap_copy(chip->last_irq_read, all, 64);
 	bitmap_or(all, rising, falling, 64);
 
-	spin_unlock(&chip->gpio_lock);
+	raw_spin_unlock(&chip->gpio_lock);
 
 	dev_dbg(gc->parent, "IRQ rising %*pb falling %*pb\n", 64, rising, 64, falling);
 
@@ -620,7 +620,7 @@ static int xgpio_probe(struct platform_device *pdev)
 	bitmap_set(chip->hw_map,  0, width[0]);
 	bitmap_set(chip->hw_map, 32, width[1]);
 
-	spin_lock_init(&chip->gpio_lock);
+	raw_spin_lock_init(&chip->gpio_lock);
 
 	chip->gc.base = -1;
 	chip->gc.ngpio = bitmap_weight(chip->hw_map, 64);
-- 
2.35.1.1320.gc452695387.dirty


