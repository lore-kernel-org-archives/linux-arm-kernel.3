Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD80CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztz0Dyg217U9i5PUqRvgVkR/TzINV5Q4KYUXK67qaJE=; b=fKOpumF+5gXXQT
	9XD81zOaOgsxzq2UG0D8eNMMu/F3QH92yvy4VypIB+xaFX/fl78RTkTEUwtQmcCemiGRvRTJ8TKXf
	+6pvcUZdZyB1zH6NKfEMY4ymtB9ZPALiYeGlwaK6VBHtnNFMYldQlREg+TSgamdCz+IEuIX0stxlN
	zJ3rb9D8MWIyNT4wg80EPss8d2AeQByptKfM6Z0Mj1m+Me7fznH6Ox9k08eLFi2NEanCf6hr7a9bz
	kK+HPnfgCq80jk3rktqjPHMMC7ikcbXszrFgQkpb2x9zkciXrfv/abGGTx8hcGLja5ZiQJpWAMEhE
	8v/UvmWn4NnjRsf5H/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGvb-00000004UCs-2khe;
	Wed, 27 May 2026 16:16:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGvS-00000004UAt-3xX6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 16:16:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3060F35CB;
	Wed, 27 May 2026 09:16:05 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.28.175])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B53F73F905;
	Wed, 27 May 2026 09:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779898570; bh=KYPTr/gK88AaBaLChZVSR1kNrRA4o9E9EEjPbUfbssA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXgFHWYq+tCAVjiANSHUqv7XI/GoLJWg1ZihY5KUSHBO6OAihAE152VpkLUwhWlNJ
	 Pi2eapxCdzNsqO9oWOs+L+Qo806oQ1HCs72kAU+NKiqb65Lq2MlJHFiPiivufU+cIl
	 gzGvjQrlH3RMz9ihrcsJmsZiRVElIGl2Nn0nPqnA=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64/debug: mask exceptions when switching cpu-bound watchpoints
Date: Wed, 27 May 2026 17:15:53 +0100
Message-ID: <20260527161553.97676-3-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527161553.97676-1-ada.coupriediaz@arm.com>
References: <20260527161553.97676-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_091612_759057_0515C7F2 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

When hit, EL1 watchpoints always disable EL0 watchpoints to avoid
the kernel triggering them during uaccess, and re-enable them depending
on the current task's `wps_disabled`.

This can lead to an inconsistent state when task switching between two
tasks with different `wps_disabled` and CPU-bound watchpoints :
`hw_breakpoint_thread_switch()` is called without debug exceptions masked
and could raise a watchpoint exception at EL1 while toggling the CPU-bound
watchpoints.
As the watchpoint and single step handlers are not aware of the switch
nor of any "next task", this can lead to an inconsistent enabled/disabled
state for CPU-bound hardware watchpoints.

In the worst case, some CPU-bound watchpoint will not trigger
when expected until the next time they are enabled (similar task switch,
single step after another watchpoint).
It can also lead to a watchpoint triggering while we were stepping another
watchpoint, but as far as I can tell this is covered by the existing
behaviour of the watchpoint and single step handlers.

Mask all DAIF exceptions if we are toggling CPU-bound watchpoint
during thread-switch to avoid this edge case.

Add some context on what breakpoints are switched in this function
and some reasoning as to why we are masking here.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/kernel/hw_breakpoint.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index ce99a00c8596..ce4f58f19bf4 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -20,6 +20,7 @@
 #include <linux/uaccess.h>
 
 #include <asm/current.h>
+#include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
 #include <asm/esr.h>
 #include <asm/exception.h>
@@ -899,7 +900,12 @@ bool try_step_suspended_breakpoints(struct pt_regs *regs)
 NOKPROBE_SYMBOL(try_step_suspended_breakpoints);
 
 /*
- * Context-switcher for restoring suspended breakpoints.
+ * Context-switcher for restoring suspended breakpoints
+ * which are not task-bound.
+ *
+ * Breakpoints of the previous task are uninstalled before
+ * this function is called, in perf_event_task_sched_out(), and those
+ * of the next task are installed after, in perf_event_task_sched_in().
  */
 void hw_breakpoint_thread_switch(struct task_struct *next)
 {
@@ -924,10 +930,24 @@ void hw_breakpoint_thread_switch(struct task_struct *next)
 				    !next_debug_info->bps_disabled);
 
 	/* Update watchpoints. */
-	if (current_debug_info->wps_disabled != next_debug_info->wps_disabled)
+	if (current_debug_info->wps_disabled != next_debug_info->wps_disabled) {
+		unsigned long mask;
+		/*
+		 * This is called with local_irqs masked, but not DAIF.D.
+		 * EL1 watchpoints always toggle EL0 watchpoints when hit,
+		 * re-enabling them depending on the _current_ task.
+		 *
+		 * Mask all exceptions to avoid creating an inconsistent state
+		 * by triggering a watchpoint mid-way through the switch.
+		 */
+		mask = local_daif_save();
+
 		toggle_bp_registers(AARCH64_DBG_REG_WCR,
 				    DBG_ACTIVE_EL0,
 				    !next_debug_info->wps_disabled);
+
+		local_daif_restore(mask);
+	}
 }
 
 /*
-- 
2.43.0


