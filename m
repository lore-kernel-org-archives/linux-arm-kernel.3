Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E21C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86DU9m5pPkXTRY/r4EpyqKBxuIl8oiW6jaladL6LCD8=; b=WB9vXof7ngPt33
	9NbhDH3C8+q4oSbxW7pFeHZTNole5ljSZOn/azFO/fPVgEKDEKUne4nVteAe8aveyA/friOa7X89n
	Uj/tUIKppuPi6AY7sXGp8qRnJwMDLs4b6G/5ObQeGCqqg3LQdYJBrpKds4HrMzfW4nM1MhCdodPBU
	JKlm19dZFXgEdNalFJV+29gS3wLgSw+AuIEgGpfMMob0ZBwuXy3NJwi6WpAIUNO/095W/QWjumpdq
	AoX6m0bQPnOS3m6dOExVt8BNzn54+06UlFXnHTNU3v84wFcBeoLuSznKDwi2VGU4qqk2yXWDhXyAf
	Yxeuu5nj5ypEItL9umcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOhqD-00000004yo0-0CPX;
	Mon, 09 Jun 2025 19:07:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgP2-00000004otC-3LQj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:35:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B682573;
	Mon,  9 Jun 2025 10:35:01 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 17BBD3F66E;
	Mon,  9 Jun 2025 10:35:18 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 06/13] arm64: entry: Add entry and exit functions for debug exceptions
Date: Mon,  9 Jun 2025 18:34:06 +0100
Message-ID: <20250609173413.132168-7-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609173413.132168-1-ada.coupriediaz@arm.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_103520_922148_16D3DC82 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Move the `debug_exception_enter()` and `debug_exception_exit()`
functions from mm/fault.c, as they are needed to split
the debug exceptions entry paths from the current unified one.

Make them externally visible in include/asm/exception.h until
the caller in mm/fault.c is cleaned up.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/exception.h |  4 ++++
 arch/arm64/kernel/entry-common.c   | 22 ++++++++++++++++++++++
 arch/arm64/mm/fault.c              | 22 ----------------------
 3 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
index d48fc16584cd..e54b5466fd2c 100644
--- a/arch/arm64/include/asm/exception.h
+++ b/arch/arm64/include/asm/exception.h
@@ -80,4 +80,8 @@ void do_serror(struct pt_regs *regs, unsigned long esr);
 void do_signal(struct pt_regs *regs);
 
 void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigned long far);
+
+void debug_exception_enter(struct pt_regs *regs);
+void debug_exception_exit(struct pt_regs *regs);
+
 #endif	/* __ASM_EXCEPTION_H */
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 7c1970b341b8..3bdfa5abaf7a 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -441,6 +441,28 @@ static __always_inline void fpsimd_syscall_exit(void)
 	__this_cpu_write(fpsimd_last_state.to_save, FP_STATE_CURRENT);
 }
 
+/*
+ * In debug exception context, we explicitly disable preemption despite
+ * having interrupts disabled.
+ * This serves two purposes: it makes it much less likely that we would
+ * accidentally schedule in exception context and it will force a warning
+ * if we somehow manage to schedule by accident.
+ */
+void debug_exception_enter(struct pt_regs *regs)
+{
+	preempt_disable();
+
+	/* This code is a bit fragile.  Test it. */
+	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
+}
+NOKPROBE_SYMBOL(debug_exception_enter);
+
+void debug_exception_exit(struct pt_regs *regs)
+{
+	preempt_enable_no_resched();
+}
+NOKPROBE_SYMBOL(debug_exception_exit);
+
 UNHANDLED(el1t, 64, sync)
 UNHANDLED(el1t, 64, irq)
 UNHANDLED(el1t, 64, fiq)
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index ec0a337891dd..d451d7d834f1 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -966,28 +966,6 @@ void __init hook_debug_fault_code(int nr,
 	debug_fault_info[nr].name	= name;
 }
 
-/*
- * In debug exception context, we explicitly disable preemption despite
- * having interrupts disabled.
- * This serves two purposes: it makes it much less likely that we would
- * accidentally schedule in exception context and it will force a warning
- * if we somehow manage to schedule by accident.
- */
-static void debug_exception_enter(struct pt_regs *regs)
-{
-	preempt_disable();
-
-	/* This code is a bit fragile.  Test it. */
-	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
-}
-NOKPROBE_SYMBOL(debug_exception_enter);
-
-static void debug_exception_exit(struct pt_regs *regs)
-{
-	preempt_enable_no_resched();
-}
-NOKPROBE_SYMBOL(debug_exception_exit);
-
 void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
 			struct pt_regs *regs)
 {
-- 
2.43.0


