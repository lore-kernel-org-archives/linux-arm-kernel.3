Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844BCFEEF41
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8YXaeVDZsodlsVYP5hdx2ZgrHnCbz2roFeBZohX4IxI=; b=qU2clTG2CcFTTA
	mGKjAT0kywT4VbBYN+6jtqCrw+4omxAkqwVJSScZHRnhbSIAdzp0dAbMeMoJRDvuvY1oElvxOD57j
	JyL7T9iLBbmD+q0Yqika80YZUTTwcsxRR/5NDyXOZ9o6+s3uX4efjBh8iAjWzC14kbpsbiF66D94d
	VS2PlaTXf9V/BwfsFRnr2rH2yf5vJchXDiS2pzZ7RCt2KgmkYPAFNtTtafIfFMdiEI0vgjmV+Ic2g
	95LzxCzkgRcgIhU9zwc4f/9V7xf92hkNP/ydxuOsNwgudivJ4bOPpPRVbQB/rGefwusTEoZooPbSJ
	bzzAhu+7h+7DX9NLZ1Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6Jc-00000006VBz-3YoK;
	Tue, 07 Apr 2026 13:18:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6JZ-00000006VA4-0RMq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:17:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EACC1BB2;
	Tue,  7 Apr 2026 06:17:50 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DFFA93F7D8;
	Tue,  7 Apr 2026 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775567875; bh=tUnltGjcHlvxDk6vVHLGfWgevDbKvhXeMPsvKLPUGi0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i1GCfrQypMEjFouN11jFhy570D5SApBrIpY3oo1ghHbwpi+3FQik0WHbrIoeg4PIy
	 oEy/KcYEqwQtdxl6bbDdhdZ7wsLZvdU4F1CPmrkySts9U6HeKxlfprLXKBbwmurcy+
	 QYODOJQ13glCj+K16sN6NsPbo3CZqejEPGl8FIig=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH 05/10] entry: Split preemption from irqentry_exit_to_kernel_mode()
Date: Tue,  7 Apr 2026 14:16:45 +0100
Message-Id: <20260407131650.3813777-6-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260407131650.3813777-1-mark.rutland@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061757_238837_3413735F 
X-CRM114-Status: GOOD (  16.52  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, catalin.marinas@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Some architecture-specific work needs to be performed between the state
management for exception entry/exit and the "real" work to handle the
exception. For example, arm64 needs to manipulate a number of exception
masking bits, with different exceptions requiring different masking.

Generally this can all be hidden in the architecture code, but for arm64
the current structure of irqentry_exit_to_kernel_mode() makes this
particularly difficult to handle in a way that is correct, maintainable,
and efficient.

The gory details are described in the thread surrounding:

  https://lore.kernel.org/lkml/acPAzdtjK5w-rNqC@J2N7QTR9R3/

The summary is:

* Currently, irqentry_exit_to_kernel_mode() handles both involuntary
  preemption AND state management necessary for exception return.

* When scheduling (including involuntary preemption), arm64 needs to
  have all arm64-specific exceptions unmasked, though regular interrupts
  must be masked.

* Prior to the state management for exception return, arm64 needs to
  mask a number of arm64-specific exceptions, and perform some work with
  these exceptions masked (with RCU watching, etc).

While in theory it is possible to handle this with a new arch_*() hook
called somewhere under irqentry_exit_to_kernel_mode(), this is fragile
and complicated, and doesn't match the flow used for exception return to
user mode, which has a separate 'prepare' step (where preemption can
occur) prior to the state management.

To solve this, refactor irqentry_exit_to_kernel_mode() to match the
style of {irqentry,syscall}_exit_to_user_mode(), moving preemption logic
into a new irqentry_exit_to_kernel_mode_preempt() function, and moving
state management in a new irqentry_exit_to_kernel_mode_after_preempt()
function. The existing irqentry_exit_to_kernel_mode() is left as a
caller of both of these, avoiding the need to modify existing callers.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 include/linux/irq-entry-common.h | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

Thomas/Peter/Andy, as mentioned on IRC, I haven't created kerneldoc
comments for these new functions because the existing comments don't
seem all that consistent (e.g. for user mode vs kernel mode), and I
suspect we want to rewrite them all in one go for wider consistency.

I'm happy to respin this, or to follow-up with that as per your
preference.

Mark.

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 2206150e526d8..24830baa539c6 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -421,10 +421,18 @@ static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct p
 	return ret;
 }
 
-static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, irqentry_state_t state)
+static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs, irqentry_state_t state)
 {
-	lockdep_assert_irqs_disabled();
+	if (regs_irqs_disabled(regs) || state.exit_rcu)
+		return;
+
+	if (IS_ENABLED(CONFIG_PREEMPTION))
+		irqentry_exit_cond_resched();
+}
 
+static __always_inline void
+irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_t state)
+{
 	if (!regs_irqs_disabled(regs)) {
 		/*
 		 * If RCU was not watching on entry this needs to be done
@@ -443,9 +451,6 @@ static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, i
 		}
 
 		instrumentation_begin();
-		if (IS_ENABLED(CONFIG_PREEMPTION))
-			irqentry_exit_cond_resched();
-
 		/* Covers both tracing and lockdep */
 		trace_hardirqs_on();
 		instrumentation_end();
@@ -459,6 +464,17 @@ static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, i
 	}
 }
 
+static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs, irqentry_state_t state)
+{
+	lockdep_assert_irqs_disabled();
+
+	instrumentation_begin();
+	irqentry_exit_to_kernel_mode_preempt(regs, state);
+	instrumentation_end();
+
+	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
+}
+
 /**
  * irqentry_enter - Handle state tracking on ordinary interrupt entries
  * @regs:	Pointer to pt_regs of interrupted context
-- 
2.30.2


