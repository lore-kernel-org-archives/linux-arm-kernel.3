Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988D1C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJp6XbjVMtZqbYycSt12e7K/C6jIEpjE8r6d6uwvjwc=; b=Nn4vQ8fyQmvZMs
	BLC6IwqemqKX5S+daSidFlZZ7Rd92Zn0bLrGdTqovNBvE4gXWUaBcJVE7y27cWbYYSALpGcle35sR
	TpumxUFwalRZo4upXF6i+JrkkedKep+R3HPYQNBtYm5ReWgTY8l/22fpiBRUfnFe2dbNwfEvuWXK5
	fDamFVqiRYBdiUIbURLo9Zi/S2zVSTLwzeO2toyVZyAFfqhfdb9ZxoAXvMTv5hCTqlpNhyGxeQVp5
	J0R+AnCc6Jsi+r2y72he2OYEUXD3zpSLvgnDMa3kvYnXZ/t+D2MV/rYhZCr2wCqG1lv2vaPbRI8Gl
	/THTexAjGO9drrUfszzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOhuR-00000004z2s-2Dup;
	Mon, 09 Jun 2025 19:11:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgP6-00000004ouX-1ENu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:35:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD3EE1515;
	Mon,  9 Jun 2025 10:35:04 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.32.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62EFE3F66E;
	Mon,  9 Jun 2025 10:35:22 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 08/13] arm64: debug: refactor reinstall_suspended_bps()
Date: Mon,  9 Jun 2025 18:34:08 +0100
Message-ID: <20250609173413.132168-9-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609173413.132168-1-ada.coupriediaz@arm.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_103524_422843_323E38CE 
X-CRM114-Status: GOOD (  17.15  )
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

`reinstall_suspended_bps()` plays a key part in the stepping process
when we have hardware breakpoints and watchpoints enabled.
It checks if we need to step one, will re-enable it if it has
been handled and will return whether or not we need to proceed with
a single-step.

However, the current naming and return values make it harder to understand
the logic and goal of the function.

Rename it `try_step_suspended_breakpoints()` and change the return value
to a boolean, aligning it with similar functions used in
`do_el0_undef()` like `try_emulate_mrs()`, and making its behaviour
more obvious.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/debug-monitors.h |  6 +++---
 arch/arm64/kernel/debug-monitors.c      |  2 +-
 arch/arm64/kernel/hw_breakpoint.c       | 25 ++++++++++++-------------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/debug-monitors.h b/arch/arm64/include/asm/debug-monitors.h
index caee1d923f9c..586290e95d87 100644
--- a/arch/arm64/include/asm/debug-monitors.h
+++ b/arch/arm64/include/asm/debug-monitors.h
@@ -84,11 +84,11 @@ void kernel_rewind_single_step(struct pt_regs *regs);
 void kernel_fastforward_single_step(struct pt_regs *regs);
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-int reinstall_suspended_bps(struct pt_regs *regs);
+bool try_step_suspended_breakpoints(struct pt_regs *regs);
 #else
-static inline int reinstall_suspended_bps(struct pt_regs *regs)
+static inline bool try_step_suspended_breakpoints(struct pt_regs *regs)
 {
-	return -ENODEV;
+	return false;
 }
 #endif
 
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index 02ba2c5e40ec..74ffdfeff76f 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -195,7 +195,7 @@ static int single_step_handler(unsigned long unused, unsigned long esr,
 	 * If we are stepping a pending breakpoint, call the hw_breakpoint
 	 * handler first.
 	 */
-	if (!reinstall_suspended_bps(regs))
+	if (try_step_suspended_breakpoints(regs))
 		return 0;
 
 	if (call_step_hook(regs, esr) == DBG_HOOK_HANDLED)
diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index d7eede5d869c..309ae24d4548 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -847,36 +847,35 @@ NOKPROBE_SYMBOL(watchpoint_handler);
 /*
  * Handle single-step exception.
  */
-int reinstall_suspended_bps(struct pt_regs *regs)
+bool try_step_suspended_breakpoints(struct pt_regs *regs)
 {
 	struct debug_info *debug_info = &current->thread.debug;
-	int handled_exception = 0, *kernel_step;
-
-	kernel_step = this_cpu_ptr(&stepping_kernel_bp);
+	int *kernel_step = this_cpu_ptr(&stepping_kernel_bp);
+	bool handled_exception = false;
 
 	/*
 	 * Called from single-step exception handler.
-	 * Return 0 if execution can resume, 1 if a SIGTRAP should be
-	 * reported.
+	 * Return true if we stepped a breakpoint and can resume execution,
+	 * false if we need to handle a single-step.
 	 */
 	if (user_mode(regs)) {
 		if (debug_info->bps_disabled) {
 			debug_info->bps_disabled = 0;
 			toggle_bp_registers(AARCH64_DBG_REG_BCR, DBG_ACTIVE_EL0, 1);
-			handled_exception = 1;
+			handled_exception = true;
 		}
 
 		if (debug_info->wps_disabled) {
 			debug_info->wps_disabled = 0;
 			toggle_bp_registers(AARCH64_DBG_REG_WCR, DBG_ACTIVE_EL0, 1);
-			handled_exception = 1;
+			handled_exception = true;
 		}
 
 		if (handled_exception) {
 			if (debug_info->suspended_step) {
 				debug_info->suspended_step = 0;
 				/* Allow exception handling to fall-through. */
-				handled_exception = 0;
+				handled_exception = false;
 			} else {
 				user_disable_single_step(current);
 			}
@@ -890,17 +889,17 @@ int reinstall_suspended_bps(struct pt_regs *regs)
 
 		if (*kernel_step != ARM_KERNEL_STEP_SUSPEND) {
 			kernel_disable_single_step();
-			handled_exception = 1;
+			handled_exception = true;
 		} else {
-			handled_exception = 0;
+			handled_exception = false;
 		}
 
 		*kernel_step = ARM_KERNEL_STEP_NONE;
 	}
 
-	return !handled_exception;
+	return handled_exception;
 }
-NOKPROBE_SYMBOL(reinstall_suspended_bps);
+NOKPROBE_SYMBOL(try_step_suspended_breakpoints);
 
 /*
  * Context-switcher for restoring suspended breakpoints.
-- 
2.43.0


