Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC50FEEF34
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLv5i7gUYtbhhfXN8tc8TM2fRy2lPIV/SqLTEWstjX0=; b=McQVD+E2ABNxFl
	KmwSPJ5agQ5ZUsk0jjr6U6WLsg8iFDrFo2Qt5dBJ/Yom+6k2XWJWnOuP9uYDpMneKB9HfhOKJlP/W
	7b+VF3MC8G0LuAHu1p4ilazjsU2L4EXXc94H1lC7/g+aBbNnQQUdKXCblopmt1DEfQKvnkxhDXc1F
	7Fsy6i62rSiaXjPskghYskInqfGmHzyE6/gG3EqZHWqhWrqlyvDAM/SGu6wDFXvf3COLvZ7nUZ9tl
	ZCjEuiRxsFAxeTHlo68CWADoAFSWMOdBSjkWErDJXYCsKxB8wnZ6zuvL3YFooGwnkjZCk+RHrzEOr
	Y/4Biqhu0UE6ccw/mjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6JB-00000006UyV-1o5X;
	Tue, 07 Apr 2026 13:17:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6J8-00000006Uxm-3L3s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:17:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB7C416F2;
	Tue,  7 Apr 2026 06:17:23 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8ACF3F7D8;
	Tue,  7 Apr 2026 06:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775567849; bh=PnpEGCqDI+7mLHxmW6SNuY7AJrvNh7KFQZ2iYdYu5IY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=goIwi3pNbLHft1v0o6PDcVBwKRIElAkF/C2v+8yrw7o/8jllrfZHizN6sqfFhCav5
	 6CKmK0/PJr5biaroT/Rz1K3DdzCFJ4d7p3+6qMCpawcGZ5py0FpOJcXoBV9SGO05ls
	 stXyhRh4t2GbbffxdusJ8XhjZLojzHgURuG2HaAk=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH 02/10] entry: Remove local_irq_{enable,disable}_exit_to_user()
Date: Tue,  7 Apr 2026 14:16:42 +0100
Message-Id: <20260407131650.3813777-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260407131650.3813777-1-mark.rutland@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061730_914728_1ACDC592 
X-CRM114-Status: GOOD (  13.86  )
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

The local_irq_enable_exit_to_user() and local_irq_disable_exit_to_user()
functions are never overridden by architecture code, and are always
equivalent to local_irq_enable() and local_irq_disable().

These functions were added on the assumption that arm64 would override
them to manage 'DAIF' exception masking, as described by Thomas Gleixner
in these threads:

  https://lore.kernel.org/all/20190919150809.340471236@linutronix.de/
  https://lore.kernel.org/all/alpine.DEB.2.21.1910240119090.1852@nanos.tec.linutronix.de/

In practice arm64 did not need to override either. Prior to moving to
the generic irqentry code, arm64's management of DAIF was reworked in
commit:

  97d935faacde ("arm64: Unmask Debug + SError in do_notify_resume()")

Since that commit, arm64 only masks interrupts during the 'prepare' step
when returning to user mode, and masks other DAIF exceptions later.
Within arm64_exit_to_user_mode(), the arm64 entry code is as follows:

	local_irq_disable();
	exit_to_user_mode_prepare_legacy(regs);
	local_daif_mask();
	mte_check_tfsr_exit();
	exit_to_user_mode();

Remove the unnecessary local_irq_enable_exit_to_user() and
local_irq_disable_exit_to_user() functions.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 include/linux/entry-common.h     |  2 +-
 include/linux/irq-entry-common.h | 31 -------------------------------
 kernel/entry/common.c            |  4 ++--
 3 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index f83ca0abf2cdb..dbaa153100f44 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -321,7 +321,7 @@ static __always_inline void syscall_exit_to_user_mode(struct pt_regs *regs)
 {
 	instrumentation_begin();
 	syscall_exit_to_user_mode_work(regs);
-	local_irq_disable_exit_to_user();
+	local_irq_disable();
 	syscall_exit_to_user_mode_prepare(regs);
 	instrumentation_end();
 	exit_to_user_mode();
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 3cf4d21168ba1..93b4b551f7ae4 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -100,37 +100,6 @@ static __always_inline void enter_from_user_mode(struct pt_regs *regs)
 	instrumentation_end();
 }
 
-/**
- * local_irq_enable_exit_to_user - Exit to user variant of local_irq_enable()
- * @ti_work:	Cached TIF flags gathered with interrupts disabled
- *
- * Defaults to local_irq_enable(). Can be supplied by architecture specific
- * code.
- */
-static inline void local_irq_enable_exit_to_user(unsigned long ti_work);
-
-#ifndef local_irq_enable_exit_to_user
-static __always_inline void local_irq_enable_exit_to_user(unsigned long ti_work)
-{
-	local_irq_enable();
-}
-#endif
-
-/**
- * local_irq_disable_exit_to_user - Exit to user variant of local_irq_disable()
- *
- * Defaults to local_irq_disable(). Can be supplied by architecture specific
- * code.
- */
-static inline void local_irq_disable_exit_to_user(void);
-
-#ifndef local_irq_disable_exit_to_user
-static __always_inline void local_irq_disable_exit_to_user(void)
-{
-	local_irq_disable();
-}
-#endif
-
 /**
  * arch_exit_to_user_mode_work - Architecture specific TIF work for exit
  *				 to user mode.
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 9ef63e4147913..b5e05d87ba391 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -47,7 +47,7 @@ static __always_inline unsigned long __exit_to_user_mode_loop(struct pt_regs *re
 	 */
 	while (ti_work & EXIT_TO_USER_MODE_WORK_LOOP) {
 
-		local_irq_enable_exit_to_user(ti_work);
+		local_irq_enable();
 
 		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
 			if (!rseq_grant_slice_extension(ti_work & TIF_SLICE_EXT_DENY))
@@ -74,7 +74,7 @@ static __always_inline unsigned long __exit_to_user_mode_loop(struct pt_regs *re
 		 * might have changed while interrupts and preemption was
 		 * enabled above.
 		 */
-		local_irq_disable_exit_to_user();
+		local_irq_disable();
 
 		/* Check if any of the above work has queued a deferred wakeup */
 		tick_nohz_user_enter_prepare();
-- 
2.30.2


