Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71636FEEF34
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRW/rhdoBLZIZyaW13/lRDZNfNHyoW5jc1ZKLvfkYoI=; b=LFj0cS9hiPBHFD
	w9A0hoxPGx5VAJlCR+80a4XeGXHapJRTs9FQti49Hb96HQbqGyMB+Ac9iLQAVpQN4PvsZBADxGRCE
	8Ye7DAWv4D+HBQvuEsAUXoPABwSSi9jZKHMDr1lP/CKohfTLYKtSXse3JNOgFqZFjvo6+4xkqtRfI
	JZn+0Jf6mxDaVxbrqItGl8RRwcrlqXVu7NE2HSn/tMoeqwhNSAMCcDb70EFTKb7qEuqg1o1i5rxOw
	XJJgFMWCvLDaNrOOBh/9ygoEPv4jB61Ago0gYH+G548NM+VrMUj7scu2WE0iQvtnIWjDwgcRBXY3n
	3fZRpK69/1sUNNGoU1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6JI-00000006V1N-36EZ;
	Tue, 07 Apr 2026 13:17:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6JG-00000006V0V-2M5T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:17:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7490016F2;
	Tue,  7 Apr 2026 06:17:31 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 558443F7D8;
	Tue,  7 Apr 2026 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775567857; bh=nL/6sqoqt3SzzXYp2uRKEzMSNyRXDO4GvLQ6+fh1NXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f+ZY3Za17PzlohERV7xh8kVTf7+6EzO3xlpw2XHLlc9c5YTUBHPex11JMbub22PvS
	 y6mA4hK/QVjHe47Vh6hZD/9bIn1oIeuPRxUVQwIkZUI3RhSPD0Al5OI70lN/Y9DYye
	 qEdBaaJdWlKcHpiq5sn5F85z1N4Ce8Z8xp9vVOGk=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH 03/10] entry: Move irqentry_enter() prototype later
Date: Tue,  7 Apr 2026 14:16:43 +0100
Message-Id: <20260407131650.3813777-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260407131650.3813777-1-mark.rutland@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061738_717757_AD677D65 
X-CRM114-Status: GOOD (  10.82  )
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

Subsequent patches will rework the irqentry_*() functions. The end
result (and the intermediate diffs) will be much clearer if the
prototype for the irqentry_enter() function is moved later, immediately
before the prototype of the irqentry_exit() function.

Move the prototype later.

This is purely a move; there should be no functional change as a result
of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 include/linux/irq-entry-common.h | 44 ++++++++++++++++----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 93b4b551f7ae4..d1e8591a59195 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -334,6 +334,28 @@ typedef struct irqentry_state {
 } irqentry_state_t;
 #endif
 
+/**
+ * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
+ *
+ * Conditional reschedule with additional sanity checks.
+ */
+void raw_irqentry_exit_cond_resched(void);
+
+#ifdef CONFIG_PREEMPT_DYNAMIC
+#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
+#define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_resched
+#define irqentry_exit_cond_resched_dynamic_disabled	NULL
+DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
+#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
+#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
+DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
+void dynamic_irqentry_exit_cond_resched(void);
+#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
+#endif
+#else /* CONFIG_PREEMPT_DYNAMIC */
+#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
+#endif /* CONFIG_PREEMPT_DYNAMIC */
+
 /**
  * irqentry_enter - Handle state tracking on ordinary interrupt entries
  * @regs:	Pointer to pt_regs of interrupted context
@@ -367,28 +389,6 @@ typedef struct irqentry_state {
  */
 irqentry_state_t noinstr irqentry_enter(struct pt_regs *regs);
 
-/**
- * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
- *
- * Conditional reschedule with additional sanity checks.
- */
-void raw_irqentry_exit_cond_resched(void);
-
-#ifdef CONFIG_PREEMPT_DYNAMIC
-#if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
-#define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_resched
-#define irqentry_exit_cond_resched_dynamic_disabled	NULL
-DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
-#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
-#elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
-DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void);
-#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
-#endif
-#else /* CONFIG_PREEMPT_DYNAMIC */
-#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
-#endif /* CONFIG_PREEMPT_DYNAMIC */
-
 /**
  * irqentry_exit - Handle return from exception that used irqentry_enter()
  * @regs:	Pointer to pt_regs (exception entry regs)
-- 
2.30.2


