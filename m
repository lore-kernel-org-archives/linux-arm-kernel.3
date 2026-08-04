Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52CBC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHRwjPesqBoJn8UTIi0yl5fajUFgc9aYLcMXK0tV0Vg=; b=2CzTmvaFw9JR+9IAQFHtbigj3G
	8oJTVPkN5tFeAL2rmbUoCwLft8lMHSdG3eKhFDOO0QH64NMp7ANGNbfKRLDdRTxyW8KxAv9zHDmDP
	RUIMhTeW2A5P60lSWJrkoTmdAEvZBO2A+lvb3spBWO6BuZUA01bmWxCJx7j9Bnuj6iGJF5jpSrJOu
	d49hU5Ni9QtpjxQ4JCoeQqVaXG+ytBV0i+Z7B4I1OAqYAtwTcmH+YX8MEk7fKaoxm/zRQE/kOTEzh
	xBVCKlZQV2hi3DG352WOOpD9Q1jgzw3cvOML4wJZsncGgapI8iUe5Rp1Tl/eJL5DiaYLWwMl3kcwn
	i3FYhfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrG3l-000000024TQ-0hMm;
	Tue, 04 Aug 2026 14:24:01 +0000
Received: from [117.135.210.5] (helo=m16.mail.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrG3h-000000024Rp-1iFG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=ZHRwjPesqBoJn8UTIi0yl5fajUFgc9aYLcMXK0tV0Vg=;
	b=Z62ahoVwsCSBegc2m9RttLVriZICqT4n2BC2tUNBeBzcgX6V7UnJA32qc5uhsi
	PVC1wlEn/eCm/MiJWUbBaOvlU1AFONJjQjQw5aznsPV2QA6XkGvVoG8Q1ZFMPa+l
	LdsErW9zcmOHxaciVZcKhBnkmZ8FgMVTS2UrTJDogf/hM=
Received: from fedora (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H4+v9XFqDtAgNQ--.21955S2;
	Tue, 04 Aug 2026 22:22:41 +0800 (CST)
From: Ju Nan <junan76@163.com>
To: junan76@163.com,
	antonio.borneo@foss.st.com,
	linusw@kernel.org
Cc: alexandre.torgue@foss.st.com,
	arnd@arndb.de,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	mfd@lists.linux.dev,
	rostedt@goodmis.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v3] pinctrl: stm32: program the EXTI mux from .alloc instead of .activate
Date: Tue,  4 Aug 2026 22:14:03 +0800
Message-ID: <20260804141402.86911-2-junan76@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803061718.43210-1-junan76@163.com>
References: <20260803061718.43210-1-junan76@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H4+v9XFqDtAgNQ--.21955S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ww4rJw4fKryrZry8ZF4fZrb_yoWxWFy3pF
	WfXrsIyrsxX3WfZ3yDGF4jvF90ka92kasrKw1DKa4xZr1Yvwn5K3WSgFy8ZF4j9F97X3Z0
	yr4jqry5u3WDAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pina9fUUUUU=
X-Originating-IP: [2409:8a62:3e6:1400:e93f:3d77:3322:beb7]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC9hShU2px9bS6CAAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_072358_115004_2F7B1B1F 
X-CRM114-Status: GOOD (  22.51  )
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

stm32_gpio_domain_activate() writes the EXTI interrupt multiplexer
through a regmap obtained from the generic syscon driver. The irq core
calls .activate from __setup_irq() with the raw desc->lock held, so this
happens in a raw atomic section. regmap-mmio sets fast_io, and syscon
does not ask for a raw spinlock, so the regmap is protected by a
spinlock_t. On PREEMPT_RT that is a sleeping lock, which must not be
taken there. lockdep reports it as soon as a GPIO interrupt is
requested:

  BUG: Invalid wait context
  6.17.0 #4 Not tainted
  -----------------------------
  kworker/u8:0/12 is trying to lock:
  (&syscon_config)->lock){....}-{3:3}, at: regmap_lock_spinlock
  other info that might help us debug this:
  6 locks held by kworker/u8:0/12:
   #5: (&irq_desc_lock_class){-...}-{2:2}, at: __setup_irq
  stack backtrace:
   regmap_lock_spinlock
   regmap_field_update_bits_base
   stm32_gpio_domain_activate
   irq_domain_activate_irq
   __setup_irq
   request_threaded_irq

The driver was already aware of running in atomic context there: it uses
the _in_atomic() hwspinlock primitives around the very same access. The
syscon lock is the one lock in that section it does not control.

Program the mux from .alloc instead, which runs in a sleepable context.
That callback already owns this resource: it reserves the mux line in
pctl->irqmux_map under irqmux_lock, so writing the value it just claimed
is a natural fit, and the value only depends on the bank.

Nothing requires the mux to be reprogrammed at interrupt startup time:
the domain has no .deactivate, .free() only releases the irqmux_map bit
without touching the registers, and the resume path reprograms the mux
itself in stm32_pinctrl_restore_gpio_regs().

Keep the access inside the existing irqmux_lock section rather than
after it. hwspin_lock_timeout_in_atomic() deliberately skips the local
lock that the other hwspinlock modes take, so its caller is responsible
for disabling preemption and for excluding other local contexts; every
other hwspinlock user in this driver relies on bank->lock for that.
irqmux_lock plays the same role here, and it also turns the mux
reservation and the mux write into a single critical section. Nesting
the regmap spinlock_t inside irqmux_lock, itself a spinlock_t, is what
the wait-context checker expects.

Note that this bounds the semaphore hold time on !PREEMPT_RT only. On
PREEMPT_RT spinlock_t disables neither interrupts nor preemption, so the
hardware semaphore can be held across a preemptible section and a
coprocessor contending for it may poll for an unbounded time. That is
not introduced here: bank->lock is a spinlock_t too, so every existing
hwspinlock user in this driver behaves the same way on PREEMPT_RT.
Removing that exposure requires the EXTI mux regmap to be raw-spinlock
based, which the syscon core does not currently offer, and is left for a
separate change.

While moving the code, release the mux reservation when the hwspinlock
cannot be taken, which the .activate callback had no way of doing.

Reported-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Closes: https://lore.kernel.org/all/20220202174430.pf37tt6lua2op3gc@pengutronix.de/
Signed-off-by: Ju Nan <junan76@163.com>
---
Changes in v3:

- Keep the mux write inside the existing irqmux_lock critical section
rather than after it.

v2: https://lore.kernel.org/all/20260804032227.35017-3-junan76@163.com/
v1: https://lore.kernel.org/all/20260803061718.43210-1-junan76@163.com/
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 55 +++++++++++++--------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 6a99708a5a23..d97057ec28af 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -600,30 +600,6 @@ static int stm32_gpio_domain_translate(struct irq_domain *d,
 	return 0;
 }
 
-static int stm32_gpio_domain_activate(struct irq_domain *d,
-				      struct irq_data *irq_data, bool reserve)
-{
-	struct stm32_gpio_bank *bank = d->host_data;
-	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
-	int ret = 0;
-
-	if (pctl->hwlock) {
-		ret = hwspin_lock_timeout_in_atomic(pctl->hwlock,
-						    HWSPNLCK_TIMEOUT);
-		if (ret) {
-			dev_err(pctl->dev, "Can't get hwspinlock\n");
-			return ret;
-		}
-	}
-
-	regmap_field_write(pctl->irqmux[irq_data->hwirq], bank->bank_ioport_nr);
-
-	if (pctl->hwlock)
-		hwspin_unlock_in_atomic(pctl->hwlock);
-
-	return ret;
-}
-
 static int stm32_gpio_domain_alloc(struct irq_domain *d,
 				   unsigned int virq,
 				   unsigned int nr_irqs, void *data)
@@ -637,18 +613,40 @@ static int stm32_gpio_domain_alloc(struct irq_domain *d,
 	int ret = 0;
 
 	/*
-	 * Check first that the IRQ MUX of that line is free.
-	 * gpio irq mux is shared between several banks, protect with a lock
+	 * Check first that the IRQ MUX of that line is free, then point it at
+	 * this bank. The mux is shared between several banks, and the register
+	 * is shared with a coprocessor, so hold both irqmux_lock and the
+	 * hwspinlock across the update. irqmux_lock also provides the local
+	 * exclusion and the preemption disabling that the _in_atomic()
+	 * hwspinlock primitives leave to their caller, as it does for the other
+	 * hwspinlock users in this driver.
 	 */
 	spin_lock_irqsave(&pctl->irqmux_lock, flags);
 
 	if (pctl->irqmux_map & BIT(hwirq)) {
 		dev_err(pctl->dev, "irq line %ld already requested.\n", hwirq);
 		ret = -EBUSY;
-	} else {
-		pctl->irqmux_map |= BIT(hwirq);
+		goto unlock;
+	}
+
+	pctl->irqmux_map |= BIT(hwirq);
+
+	if (pctl->hwlock) {
+		ret = hwspin_lock_timeout_in_atomic(pctl->hwlock,
+						    HWSPNLCK_TIMEOUT);
+		if (ret) {
+			dev_err(pctl->dev, "Can't get hwspinlock\n");
+			pctl->irqmux_map &= ~BIT(hwirq);
+			goto unlock;
+		}
 	}
 
+	regmap_field_write(pctl->irqmux[hwirq], bank->bank_ioport_nr);
+
+	if (pctl->hwlock)
+		hwspin_unlock_in_atomic(pctl->hwlock);
+
+unlock:
 	spin_unlock_irqrestore(&pctl->irqmux_lock, flags);
 	if (ret)
 		return ret;
@@ -683,7 +681,6 @@ static const struct irq_domain_ops stm32_gpio_domain_ops = {
 	.translate	= stm32_gpio_domain_translate,
 	.alloc		= stm32_gpio_domain_alloc,
 	.free		= stm32_gpio_domain_free,
-	.activate	= stm32_gpio_domain_activate,
 };
 
 /* Pinctrl functions */
-- 
2.55.0


