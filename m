Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF34CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUXQFFKo1Pv4M2rvre8t7B9CCNvKB01SFKiEFm6LRLA=; b=XOS5I4ngIkGJ0dzp0xkCKcOX8t
	4/0/101jylrSaahxkaKHhCUHV33fvs1GlZAGoLbVVrKIYVeqU0b8Oug2YcurouxAZ7mG+YOqKGdu/
	0n/kK+MGQ50QXsLExe7Uw3XbK1QMzg5caN/YG+A+UWXKY02y3HUylZbmqP6LaB8i3NiFN899TcM9I
	7cuvWg91pBV6V0vdrwS1RXzrUBNBssrXsBT8U0GLzPOLU1+WsdMIYWnjQnmMgna9Z2oLQwFzqzm5v
	gU6GK60JWlvAJDFPuWHVIpGI0eE6kFbjllfTpQVaK/PJ8yA1IFCkHjY1ivdHtch3i/7/0pDel61gN
	oqsxwzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp4G-0000000DUeN-3IpR;
	Mon, 20 Oct 2025 12:32:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2D-0000000DRj8-0BYM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pUXQFFKo1Pv4M2rvre8t7B9CCNvKB01SFKiEFm6LRLA=; b=cQACr1ibEk5en1+Nvxb1Ni2BNC
	Sp/pwr9MaIm1avzbbkAIDDb4SS1UouTQT4s47fi3ziDniSO1lUcnTvg/vO4V4eZ3Rs68/ONbRBtCB
	Wpmgfsjl8C/k6iMHAFVlPz57GYTYCZj1G0cZOi69rBDehiNY13LSFf4A4NW5mvafWPPGz//mkcZ8/
	sj0OQKuFmnjC3zhPiUnDpbau9vI4V8B6KUwqg7tWw9yd5Ld9j+pYaQQHFzSgyVCOY9OHKbwR6m6MS
	1GeRTl5T/CEvq5MmTihv6NabYnfLjwKe9sbPagI07HJFdi1T3PFiLqZKsFBd0LkbW0t2FFg72yDmt
	balE/X9w==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp27-000000074J8-2e7Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F31C48ADA;
	Mon, 20 Oct 2025 12:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E39C116B1;
	Mon, 20 Oct 2025 12:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963414;
	bh=v/v0QyeagRIyAv+E9uORe5cEqPKFIALzdwQ8WmOq0to=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LUz/jsK/+XGMM5FlE+JJskKsIAcrEf3gDjS6a9EEBZNRptyAON/1DSn9kcstXXqBb
	 /YtvKqmQSZWlHqbZa3whEVEN+YJ0KXqi2I9fvZGQ2Ds4Xgj/ALfVnUq/OD1uEx2C65
	 3EoQnb1CHEPoAX7F/fXq9+02zR6fR80/WIz4lpq82rKfnzWZAS2jvkbc9+g3b6DvMZ
	 5acCJQYwSX0APp9eG6h6YoedQt9KxrrGNHYDOcet/m2pPSdSG8YfI8uCkEKetnXYjg
	 FvXyBBKerCOMDhCLKubKch9Qnla2/fEDjgaKfuP28D1441f/wwTUx97SXLwWgSWDoB
	 w/JpIGpeUaXnw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1g-0000000FUu2-0nyL;
	Mon, 20 Oct 2025 12:30:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 16/26] genirq: Allow per-cpu interrupt sharing for non-overlapping affinities
Date: Mon, 20 Oct 2025 13:29:33 +0100
Message-ID: <20251020122944.3074811-17-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_133041_369183_5B9EC528 
X-CRM114-Status: GOOD (  23.72  )
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

Interrupt sharing for percpu-devid interrupts is forbidden, and
for good reasons. These are interrupts generated *from* a CPU and
handled by itself (timer, for example). Nobody in their right mind
would put two devices on the same pin (and if they have, they get to
keep the pieces...).

But this also prevents more benign cases, where devices are connected
to groups of CPUs, and for which the affinities are not overlapping.
Effectively, the only thing they share is the interrupt number, and
nothing else.

Let's tweak the definition of IRQF_SHARED applied to percpu_devid
interrupts to allow this particular case. This results in extra
validation at the point of the interrupt being setup and freed,
as well as a tiny bit of extra complexity for interrupts at handling
time (to pick the correct irqaction).

Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 kernel/irq/chip.c   |  8 ++++--
 kernel/irq/manage.c | 67 +++++++++++++++++++++++++++++++++++++--------
 2 files changed, 61 insertions(+), 14 deletions(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 633e1f67bb6f4..19e0a87a2663e 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -897,8 +897,9 @@ void handle_percpu_irq(struct irq_desc *desc)
 void handle_percpu_devid_irq(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct irqaction *action = desc->action;
 	unsigned int irq = irq_desc_get_irq(desc);
+	unsigned int cpu = smp_processor_id();
+	struct irqaction *action;
 	irqreturn_t res;
 
 	/*
@@ -910,12 +911,15 @@ void handle_percpu_devid_irq(struct irq_desc *desc)
 	if (chip->irq_ack)
 		chip->irq_ack(&desc->irq_data);
 
+	for (action = desc->action; action; action = action->next)
+		if (cpumask_test_cpu(cpu, action->affinity))
+			break;
+
 	if (likely(action)) {
 		trace_irq_handler_entry(irq, action);
 		res = action->handler(irq, raw_cpu_ptr(action->percpu_dev_id));
 		trace_irq_handler_exit(irq, action, res);
 	} else {
-		unsigned int cpu = smp_processor_id();
 		bool enabled = cpumask_test_cpu(cpu, desc->percpu_enabled);
 
 		if (enabled)
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index b1a3140e5f3c9..ea3dbf6fee194 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1418,6 +1418,19 @@ setup_irq_thread(struct irqaction *new, unsigned int irq, bool secondary)
 	return 0;
 }
 
+static bool valid_percpu_irqaction(struct irqaction *old, struct irqaction *new)
+{
+	do {
+		if (cpumask_intersects(old->affinity, new->affinity) ||
+		    old->percpu_dev_id == new->percpu_dev_id)
+			return false;
+
+		old = old->next;
+	} while (old);
+
+	return true;
+}
+
 /*
  * Internal function to register an irqaction - typically used to
  * allocate special interrupts that are part of the architecture.
@@ -1438,6 +1451,7 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 	struct irqaction *old, **old_ptr;
 	unsigned long flags, thread_mask = 0;
 	int ret, nested, shared = 0;
+	bool per_cpu_devid;
 
 	if (!desc)
 		return -EINVAL;
@@ -1447,6 +1461,8 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 	if (!try_module_get(desc->owner))
 		return -ENODEV;
 
+	per_cpu_devid = irq_settings_is_per_cpu_devid(desc);
+
 	new->irq = irq;
 
 	/*
@@ -1554,13 +1570,20 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 		 */
 		unsigned int oldtype;
 
-		if (irq_is_nmi(desc)) {
+		if (irq_is_nmi(desc) && !per_cpu_devid) {
 			pr_err("Invalid attempt to share NMI for %s (irq %d) on irqchip %s.\n",
 				new->name, irq, desc->irq_data.chip->name);
 			ret = -EINVAL;
 			goto out_unlock;
 		}
 
+		if (per_cpu_devid && !valid_percpu_irqaction(old, new)) {
+			pr_err("Overlapping affinities for %s (irq %d) on irqchip %s.\n",
+				new->name, irq, desc->irq_data.chip->name);
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+
 		/*
 		 * If nobody did set the configuration before, inherit
 		 * the one provided by the requester.
@@ -1711,7 +1734,7 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 		if (!(new->flags & IRQF_NO_AUTOEN) &&
 		    irq_settings_can_autoenable(desc)) {
 			irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
-		} else {
+		} else if (!per_cpu_devid) {
 			/*
 			 * Shared interrupts do not go well with disabling
 			 * auto enable. The sharing interrupt might request
@@ -2346,7 +2369,7 @@ void disable_percpu_nmi(unsigned int irq)
 static struct irqaction *__free_percpu_irq(unsigned int irq, void __percpu *dev_id)
 {
 	struct irq_desc *desc = irq_to_desc(irq);
-	struct irqaction *action;
+	struct irqaction *action, **action_ptr;
 
 	WARN(in_interrupt(), "Trying to free IRQ %d from IRQ context!\n", irq);
 
@@ -2354,21 +2377,33 @@ static struct irqaction *__free_percpu_irq(unsigned int irq, void __percpu *dev_
 		return NULL;
 
 	scoped_guard(raw_spinlock_irqsave, &desc->lock) {
-		action = desc->action;
-		if (!action || action->percpu_dev_id != dev_id) {
-			WARN(1, "Trying to free already-free IRQ %d\n", irq);
-			return NULL;
+		action_ptr = &desc->action;
+		for (;;) {
+			action = *action_ptr;
+
+			if (!action) {
+				WARN(1, "Trying to free already-free IRQ %d\n", irq);
+				return NULL;
+			}
+
+			if (action->percpu_dev_id == dev_id)
+				break;
+
+			action_ptr = &action->next;
 		}
 
-		if (!cpumask_empty(desc->percpu_enabled)) {
-			WARN(1, "percpu IRQ %d still enabled on CPU%d!\n",
-			     irq, cpumask_first(desc->percpu_enabled));
+		if (cpumask_intersects(desc->percpu_enabled, action->affinity)) {
+			WARN(1, "percpu IRQ %d still enabled on CPU%d!\n", irq,
+			     cpumask_first_and(desc->percpu_enabled, action->affinity));
 			return NULL;
 		}
 
 		/* Found it - now remove it from the list of entries: */
-		desc->action = NULL;
-		desc->istate &= ~IRQS_NMI;
+		*action_ptr = action->next;
+
+		/* Demote from NMI if we killed the last action */
+		if (!desc->action)
+			desc->istate &= ~IRQS_NMI;
 	}
 
 	unregister_handler_proc(irq, action);
@@ -2462,6 +2497,14 @@ struct irqaction *create_percpu_irqaction(irq_handler_t handler, unsigned long f
 	action->percpu_dev_id = dev_id;
 	action->affinity = affinity;
 
+	/*
+	 * We allow some form of sharing for non-overlapping affinity
+	 * masks. Obviously, covering all CPUs prevents any sharing
+	 * the first place.
+	 */
+	if (!cpumask_equal(affinity, cpu_possible_mask))
+		action->flags |= IRQF_SHARED;
+
 	return action;
 }
 
-- 
2.47.3


