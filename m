Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9C3C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8C9xP3j9vVHObZ0nbWK6/+zkEBNpOvThUrqh9AzmzU=; b=g96D27eynG7hjFlL5Hd2k6TU4m
	3vM4n14gi8uRM2PShGPUM7PPenRjd1u2g0AY2Q8mk92zXYQl0FS423aJLooItBdK6YaTonUsIIJoS
	u9Yq3j59qoGrN1Gmb2NeM99vsf0HuMF5kI8enZpNZSjZWXP0Xxk/JGrs3txWeX1vVRaqELzW86DeE
	dScAoAC5cunLqu/iMNuBn4nQiwPBNIl7cnYeS2LrF9rVT+jNgkComb/3kuurP+ce9JgISMlP+AJmI
	lWKjSgr2uyzoyjwM91zSWCQuA35uu9N1t/I2lS4xReRnZWhzzq2P2Yey23RTtrkc+uimFPHPJ344u
	2+aqknFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYxg-0000000B6Oq-0wIO;
	Thu, 13 Feb 2025 13:09:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYqq-0000000B516-1dZt
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Feb 2025 13:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/8C9xP3j9vVHObZ0nbWK6/+zkEBNpOvThUrqh9AzmzU=; b=CT+MPDKRMNaFGAZRizcc0MSRFS
	rogqsw266Bg7mT/oVpEqersIiU3SrWjFCTSIapJ+V/AO1qJYdKmrm7LB/Jl+lFOOA0veoEWC++kbO
	dBlHoAeuNm2AZGbBJuIBHjLM50tVAT70RsGKO+t9VCbYBlFzKvcZt2tVTOwnwgpADLF3P3qAFzJfn
	x0ypa5/zEKNyBeZwwQIviBJC7CRdpwhhc5cMd4uUZNlU7TKBnNcGBEYRWRseD9iGtGk/4fBJmJWqi
	1EU40ssh/qebMAdVedv1Q/pzbz8aOI8RHfy8gHDVcpaHJ9IbLLzr9vLK9PqWuPVYFoSaP5kB2C3sP
	uTGGBIOA==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYqm-00000000zkr-27nJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:01:55 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4YtwFs1rQvz1V6fb;
	Thu, 13 Feb 2025 20:57:53 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B738140202;
	Thu, 13 Feb 2025 21:01:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 13 Feb
 2025 21:01:39 +0800
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
Subject: [PATCH -next v6 6/8] arm64: entry: Refactor preempt_schedule_irq() check code
Date: Thu, 13 Feb 2025 21:00:05 +0800
Message-ID: <20250213130007.1418890-7-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20250213_130153_482291_F6B8E1CE 
X-CRM114-Status: GOOD (  15.12  )
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

ARM64 requires an additional check whether to reschedule on return
from interrupt. So add arch_irqentry_exit_need_resched() as the default
NOP implementation and hook it up into the need_resched() condition in
raw_irqentry_exit_cond_resched(). This allows ARM64 to implement
the architecture specific version for switching over to
the generic entry code.

To align the structure of the code with irqentry_exit_cond_resched()
from the generic entry code, hoist the need_irq_preemption()
and IS_ENABLED() check earlier. And different preemption check functions
are defined based on whether dynamic preemption is enabled.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v6:
- Update the commit message.
- Hoist the IS_ENABLED() and need_irq_preemption() check earlier.
- Merge the 4 pathes.
---
 arch/arm64/include/asm/preempt.h |  4 ++++
 arch/arm64/kernel/entry-common.c | 35 ++++++++++++++++++--------------
 kernel/entry/common.c            | 16 ++++++++++++++-
 3 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 0159b625cc7f..0f0ba250efe8 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -85,6 +85,7 @@ static inline bool should_resched(int preempt_offset)
 void preempt_schedule(void);
 void preempt_schedule_notrace(void);
 
+void raw_irqentry_exit_cond_resched(void);
 #ifdef CONFIG_PREEMPT_DYNAMIC
 
 DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
@@ -92,11 +93,14 @@ void dynamic_preempt_schedule(void);
 #define __preempt_schedule()		dynamic_preempt_schedule()
 void dynamic_preempt_schedule_notrace(void);
 #define __preempt_schedule_notrace()	dynamic_preempt_schedule_notrace()
+void dynamic_irqentry_exit_cond_resched(void);
+#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
 
 #else /* CONFIG_PREEMPT_DYNAMIC */
 
 #define __preempt_schedule()		preempt_schedule()
 #define __preempt_schedule_notrace()	preempt_schedule_notrace()
+#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
 
 #endif /* CONFIG_PREEMPT_DYNAMIC */
 #endif /* CONFIG_PREEMPTION */
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index dceef4cb140b..1b4936d4cf6e 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -281,19 +281,8 @@ static void noinstr arm64_exit_el1_dbg(struct pt_regs *regs,
 		lockdep_hardirqs_on(CALLER_ADDR0);
 }
 
-#ifdef CONFIG_PREEMPT_DYNAMIC
-DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-#define need_irq_preemption() \
-	(static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
-#else
-#define need_irq_preemption()	(IS_ENABLED(CONFIG_PREEMPTION))
-#endif
-
 static inline bool arm64_preempt_schedule_irq(void)
 {
-	if (!need_irq_preemption())
-		return false;
-
 	/*
 	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
 	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
@@ -576,6 +565,24 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
 	arm64_exit_nmi(regs, state);
 }
 
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
 static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
@@ -585,10 +592,8 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	if (!preempt_count() && need_resched()) {
-		if (arm64_preempt_schedule_irq())
-			preempt_schedule_irq();
-	}
+	if (IS_ENABLED(CONFIG_PREEMPTION))
+		irqentry_exit_cond_resched();
 
 	exit_to_kernel_mode(regs, state);
 }
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index b82032777310..4aa9656fa1b4 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -142,6 +142,20 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 	return ret;
 }
 
+/**
+ * arch_irqentry_exit_need_resched - Architecture specific need resched function
+ *
+ * Invoked from raw_irqentry_exit_cond_resched() to check if need resched.
+ * Defaults return true.
+ *
+ * The main purpose is to permit arch to skip preempt a task from an IRQ.
+ */
+static inline bool arch_irqentry_exit_need_resched(void);
+
+#ifndef arch_irqentry_exit_need_resched
+static inline bool arch_irqentry_exit_need_resched(void) { return true; }
+#endif
+
 void raw_irqentry_exit_cond_resched(void)
 {
 	if (!preempt_count()) {
@@ -149,7 +163,7 @@ void raw_irqentry_exit_cond_resched(void)
 		rcu_irq_exit_check_preempt();
 		if (IS_ENABLED(CONFIG_DEBUG_ENTRY))
 			WARN_ON_ONCE(!on_thread_stack());
-		if (need_resched())
+		if (need_resched() && arch_irqentry_exit_need_resched())
 			preempt_schedule_irq();
 	}
 }
-- 
2.34.1


