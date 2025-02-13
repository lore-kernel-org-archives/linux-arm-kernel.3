Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A705C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEqHYah2qP1v0vIIHodnQ4Ix31VPIWVY8Rv8d3MGHgk=; b=MaP/DGIwbVe94QPTCFjp8negU5
	h6rnLA9Yl20YFJMf793v5DQYFb+/BVhZH5BcHVmWhSHxttNKjbvsut+PeEJ5v+yLrTPICajvpxj5z
	k2EBZtg5NrLh+OS4xmPxQpM9SQxulI7gjtOmNibhTJo6HRCs/EAN43xkLCtNGG1kfaIq6De6p6c0P
	XGwSMnkEyvv0mDuPrvXqkeT1QImDaQxMghwJgkh/Bbe5kT5GGYFKMmnWtAR38b/JSE8nwRAXPorbm
	Yqdg0JpbriAg6Pi+YR7hSW2skua5h9o8ohQ6qZjhyRTe46RwrA869PgGsK5X1eAh8ZNS8Mbna07zk
	BC75yzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZ1t-0000000B773-0t71;
	Thu, 13 Feb 2025 13:13:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYqr-0000000B52A-42fY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Feb 2025 13:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vEqHYah2qP1v0vIIHodnQ4Ix31VPIWVY8Rv8d3MGHgk=; b=hCfSmQmMFbaqA++TNVMHK5iPtf
	vKnafqTQzl70AYFlgZOSrj3kuFyiUuhyh2tRqygmEHhqqLxIPW/NT8orti4nqdYDhqLqh1xd6H/pr
	JN/hc+PluMmIriUwv5w6te+HsGXVe8i0SX60cuEJeAOD9S4k6rM/uHsZpINAiaBuSLX1Aq+rPhPIg
	utCwIE+iiUQQcSZwRvfn0wYHc5VzTEzev692JiKGdRilVWJ/bttescFUDaSORY18as+fPQ0Suefip
	TVqd6vCQt9v6ancXC+sLvXRuhWJtAsGhZNplLzU3CsnoOi0mF1sPrMzSW3XrOxxjVQsUU/NiCFV/v
	yyZmxOyA==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYqo-00000000zkx-0YdA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:01:56 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YtwLq73fsz20qN4;
	Thu, 13 Feb 2025 21:02:11 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id 4DDA01A016C;
	Thu, 13 Feb 2025 21:01:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 13 Feb
 2025 21:01:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <kees@kernel.org>, <aliceryhl@google.com>,
	<ojeda@kernel.org>, <samitolvanen@google.com>, <masahiroy@kernel.org>,
	<rppt@kernel.org>, <xur@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<mark.rutland@arm.com>, <puranjay@kernel.org>, <broonie@kernel.org>,
	<mbenes@suse.cz>, <sudeep.holla@arm.com>, <guohanjun@huawei.com>,
	<prarit@redhat.com>, <liuwei09@cestc.cn>, <Jonathan.Cameron@huawei.com>,
	<dwmw@amazon.co.uk>, <kristina.martsenko@arm.com>, <liaochang1@huawei.com>,
	<ptosi@google.com>, <thiago.bauermann@linaro.org>, <kevin.brodsky@arm.com>,
	<Dave.Martin@arm.com>, <joey.gouly@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <xen-devel@lists.xenproject.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v6 7/8] arm64: entry: Move arm64_preempt_schedule_irq() into __exit_to_kernel_mode()
Date: Thu, 13 Feb 2025 21:00:06 +0800
Message-ID: <20250213130007.1418890-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213130007.1418890-1-ruanjinjie@huawei.com>
References: <20250213130007.1418890-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemg200008.china.huawei.com (7.202.181.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_130155_398421_BEE814B8 
X-CRM114-Status: GOOD (  24.30  )
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

The arm64 entry code only preempts a kernel context upon a return from
a regular IRQ exception. The generic entry code may preempt a kernel
context for any exception return where irqentry_exit() is used, and so
may preempt other exceptions such as faults.

In preparation for moving arm64 over to the generic entry code, align
arm64 with the generic behaviour by calling
arm64_preempt_schedule_irq() from exit_to_kernel_mode(). To make this
possible, arm64_preempt_schedule_irq()
and dynamic/raw_irqentry_exit_cond_resched() are moved earlier in
the file, with no changes.

As Mark pointed out, this change will have the following 2 key impact:

- " We'll preempt even without taking a "real" interrupt. That
    shouldn't result in preemption that wasn't possible before,
    but it does change the probability of preempting at certain points,
    and might have a performance impact, so probably warrants a
    benchmark."

- " We will not preempt when taking interrupts from a region of kernel
    code where IRQs are enabled but RCU is not watching, matching the
    behaviour of the generic entry code.

    This has the potential to introduce livelock if we can ever have a
    screaming interrupt in such a region, so we'll need to go figure out
    whether that's actually a problem.

    Having this as a separate patch will make it easier to test/bisect
    for that specifically."

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v6:
- Update the commit message.
---
 arch/arm64/kernel/entry-common.c | 92 ++++++++++++++++----------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 1b4936d4cf6e..7056c584f59c 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -75,6 +75,49 @@ static noinstr arm64_irqentry_state_t enter_from_kernel_mode(struct pt_regs *reg
 	return state;
 }
 
+static inline bool arm64_preempt_schedule_irq(void)
+{
+	/*
+	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
+	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
+	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
+	 * DAIF we must have handled an NMI, so skip preemption.
+	 */
+	if (system_uses_irq_prio_masking() && read_sysreg(daif))
+		return false;
+
+	/*
+	 * Preempting a task from an IRQ means we leave copies of PSTATE
+	 * on the stack. cpufeature's enable calls may modify PSTATE, but
+	 * resuming one of these preempted tasks would undo those changes.
+	 *
+	 * Only allow a task to be preempted once cpufeatures have been
+	 * enabled.
+	 */
+	if (!system_capabilities_finalized())
+		return false;
+
+	return true;
+}
+
+void raw_irqentry_exit_cond_resched(void)
+{
+	if (!preempt_count()) {
+		if (need_resched() && arm64_preempt_schedule_irq())
+			preempt_schedule_irq();
+	}
+}
+
+#ifdef CONFIG_PREEMPT_DYNAMIC
+DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
+void dynamic_irqentry_exit_cond_resched(void)
+{
+	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
+		return;
+	raw_irqentry_exit_cond_resched();
+}
+#endif
+
 /*
  * Handle IRQ/context state management when exiting to kernel mode.
  * After this function returns it is not safe to call regular kernel code,
@@ -97,6 +140,9 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
 			return;
 		}
 
+		if (IS_ENABLED(CONFIG_PREEMPTION))
+			irqentry_exit_cond_resched();
+
 		trace_hardirqs_on();
 	} else {
 		if (state.exit_rcu)
@@ -281,31 +327,6 @@ static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs,
 		lockdep_hardirqs_on(CALLER_ADDR0);
 }
 
-static inline bool arm64_preempt_schedule_irq(void)
-{
-	/*
-	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
-	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
-	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
-	 * DAIF we must have handled an NMI, so skip preemption.
-	 */
-	if (system_uses_irq_prio_masking() && read_sysreg(daif))
-		return false;
-
-	/*
-	 * Preempting a task from an IRQ means we leave copies of PSTATE
-	 * on the stack. cpufeature's enable calls may modify PSTATE, but
-	 * resuming one of these preempted tasks would undo those changes.
-	 *
-	 * Only allow a task to be preempted once cpufeatures have been
-	 * enabled.
-	 */
-	if (!system_capabilities_finalized())
-		return false;
-
-	return true;
-}
-
 static void do_interrupt_handler(struct pt_regs *regs,
 				 void (*handler)(struct pt_regs *))
 {
@@ -565,24 +586,6 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
 	arm64_exit_nmi(regs, state);
 }
 
-void raw_irqentry_exit_cond_resched(void)
-{
-	if (!preempt_count()) {
-		if (need_resched() && arm64_preempt_schedule_irq())
-			preempt_schedule_irq();
-	}
-}
-
-#ifdef CONFIG_PREEMPT_DYNAMIC
-DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void)
-{
-	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
-		return;
-	raw_irqentry_exit_cond_resched();
-}
-#endif
-
 static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
@@ -592,9 +595,6 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	if (IS_ENABLED(CONFIG_PREEMPTION))
-		irqentry_exit_cond_resched();
-
 	exit_to_kernel_mode(regs, state);
 }
 static void noinstr el1_interrupt(struct pt_regs *regs,
-- 
2.34.1


