Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ECCCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNJSEuv89pKJkTkA6G3PhNKzIXIPG8+MW0l4XZyDNCw=; b=KoDnK7IIas/0XvwSo5iGXALt2g
	y3hnfNmTQbnZNuHzdfY99bqx6C3uV7I4d75g2/aqdYVwGvJZd/PvCySdjRT23w6GvyVJUzoeVy0Rl
	T3hReF0O3vZy/phAjmbQEc+y+2bmYFBiCPFFHmHZ87k8lIQY82uVU4YtjDT11dBHYEh7lNLqDAxTm
	g1RrgsQ8zqk5g9kxR0mK0qBY9VEKjF383TtigDn4XorcVWQkvk8VUTR2J2krbtaw6R6WwZwGiUG1V
	Z19XQAMsx1I4eXjMczCFbGir67lPOgw85r9h5GG8SRDFPrO82KMfaztT4Wnb2oOZNOg/0Vy/1dAKO
	brObBLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhjm-00000001xQg-01Uu;
	Mon, 08 Sep 2025 19:41:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemV-00000000lOQ-38Fm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6DF344A1D;
	Mon,  8 Sep 2025 16:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C75C4CEFD;
	Mon,  8 Sep 2025 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757349111;
	bh=Q/+zu+5tB3UsN0eWOWfFQqHDuwVMUrvVaWxWsxG4ILA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AshQby1jiypVhgYFlA/bV62XZaVP5bnskJrcQ/58HrH+2PtgjNbKzxWN+PvCWzYS3
	 NbXXHSumhHB6odRpwEv9wXoQ8bf7q+6PeOuoxs7oVYTRMzMivgbiccQUv4qGlGglrT
	 fnBuTI5BrtYcJdtSbyOdNT9WxdTcBv3baXCJMcDWDpRzNmtkTZxrzCct0nx1qVuQzZ
	 fQDGquJgqDlmYugFM9ESGK7qksrctdhb9Eb0xbNbepngRYfwdjIPT6vgm7CwGdtunH
	 L2TawKim915dFzIwdKbeoRixmRauwEotkc/jp0mbQqW4DPe6VZ4EeTHv4Sr0clrNZl
	 BEkkDgnuzupHQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uvemT-00000004NTm-2J2B;
	Mon, 08 Sep 2025 16:31:49 +0000
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
	James Clark <james.clark@linaro.org>
Subject: [PATCH 15/25] genirq: Allow per-cpu interrupt sharing for non-overlapping affinities
Date: Mon,  8 Sep 2025 17:31:17 +0100
Message-Id: <20250908163127.2462948-16-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250908163127.2462948-1-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093151_861964_902D514C 
X-CRM114-Status: GOOD (  27.76  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 kernel/irq/chip.c   |  8 ++++--
 kernel/irq/manage.c | 67 +++++++++++++++++++++++++++++++++++++--------
 2 files changed, 61 insertions(+), 14 deletions(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 0d0276378c707..af90dd440d5ee 100644
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
index a17ac522622e7..1ac79df0e5f76 100644
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
@@ -2464,6 +2499,14 @@ struct irqaction *create_percpu_irqaction(irq_handler_t handler,
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
2.39.2


