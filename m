Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBC5C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w09LdgFhAz2aEyWgYRoG9Xdswi0Zxro7sCbjZSzX/DU=; b=E34J1uRfCGFMOJ
	mlidJ2UTm/drgk2DZIF9mQRnEgwJR8RKr3iDNl91zOtuW8HceHM8mvJbzFWvbRsfFhpmstqvYehiw
	Rfl2ENG29AFdJZayAh7gv4AWb0qy3r11ky3pjnXiezya1MB+VKHfEjWU0tRZDg3BrlgWp+7bxosjT
	H+mEwD9bxXAFu5PEVwteJtALEtQ6tn9TgsL4ESgPavoYR5qMflKTj65JtRA8YqD5VultpV8ME3Mzf
	hjK2gqVqysH+uQwRmXWFPYWLEsXwrvmsQUatf2AP3G2EETqho4D2E95LbR5GwSDeVonNJO5Mjkd2x
	mwn/VVhCeetZcSw2iDeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cFe-00000007IlN-3nOz;
	Mon, 07 Sep 2026 16:31:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cFZ-00000007Ije-2uqZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:31:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 214531476;
	Mon,  7 Sep 2026 09:31:08 -0700 (PDT)
Received: from e137867.carmbridge.arm.com (unknown [10.0.153.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 351D83F528;
	Mon,  7 Sep 2026 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788798671; bh=TBdM0euSD8Mi+FB5AQ03ZPBi1Zfiu+QeZn+neb/U8B4=;
	h=From:To:Cc:Subject:Date:From;
	b=GG8gsvbg25BC+NBmHm/3OBDCWDYxQlrZQx3Ckk06t1nB3hDRyvcPnUE7nSb/giXxZ
	 38FojhoiPuhQZXebYxt+fAb5EMUvkpmy4g77fvdO7jnklXmCg5PXL5iyTAfzBpG1hE
	 5o8tEfPw8x1LWpAT2yh6dp7gOUTdC27OyEU9hmRE=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64/debug: mask debug exceptions when called from common code
Date: Mon,  7 Sep 2026 17:31:01 +0100
Message-ID: <20260907163101.131569-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_093120_668226_70A3945F 
X-CRM114-Status: GOOD (  18.54  )
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

We can currently take debug exceptions while manipulating the hardware
breakpoint registers and perf slots when called from generic kernel code.
This can lead to errors and unsound behaviours in some pathological
(and self-inflicted) edge cases[0].

Save and restore the interrupt mask around those manipulations.

This is to avoid a superfluous save/restore when calling
`toggle_bp_registers()` and `hw_breakpoint_control()` from our arch code,
as debug exceptions will already be masked in all cases.
It should also allow some clean ups by batching ISBs when we update
multiple registers, rather than doing one for each register write.

Clarify some comments and specify a few functions which should be called
with debug exceptions masked (even though that is true for most of them).

[0]: https://lore.kernel.org/linux-arm-kernel/adeE4MD0RgapI8aL@J2N7QTR9R3/

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
----
This is a follow-up of [1], which blanketly masks debug exceptions rather
than fiddling with specific edge cases one by one as discussed with Will.

I'm not sure about specifying that `toggle_bp_registers()` and
`hw_breakpoint_control()` must be called with debug exceptions masked,
as most other functions here do too, but those are the only one that need it
which are called via common code, rather than arch entry or debug code.

Thanks,
Ada

[1]: https://lore.kernel.org/r/20260527161553.97676-1-ada.coupriediaz@arm.com
---
 arch/arm64/kernel/hw_breakpoint.c | 32 ++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index 73cce8ac8368..32b38967433e 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -20,6 +20,7 @@
 #include <linux/uaccess.h>
 
 #include <asm/current.h>
+#include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
 #include <asm/esr.h>
 #include <asm/exception.h>
@@ -221,6 +222,12 @@ static int hw_breakpoint_slot_setup(struct perf_event **slots, int max_slots,
 	return -ENOSPC;
 }
 
+/*
+ * Configure hardware breakpoint registers from a perf event,
+ * according to operation.
+ *
+ * Must be called with debug exceptions masked.
+ */
 static int hw_breakpoint_control(struct perf_event *bp,
 				 enum hw_breakpoint_ops ops)
 {
@@ -286,15 +293,24 @@ static int hw_breakpoint_control(struct perf_event *bp,
 
 /*
  * Install a perf counter breakpoint.
+ *
+ * Perf can and will call this with debug exceptions unmasked.
+ * Mask them to avoid triggering one while manipulating their registers.
  */
 int arch_install_hw_breakpoint(struct perf_event *bp)
 {
-	return hw_breakpoint_control(bp, HW_BREAKPOINT_INSTALL);
+	unsigned long daif = local_daif_save();
+	int ret = hw_breakpoint_control(bp, HW_BREAKPOINT_INSTALL);
+
+	local_daif_restore(daif);
+	return ret;
 }
 
 void arch_uninstall_hw_breakpoint(struct perf_event *bp)
 {
+	unsigned long daif = local_daif_save();
 	hw_breakpoint_control(bp, HW_BREAKPOINT_UNINSTALL);
+	local_daif_restore(daif);
 }
 
 static int get_hbp_len(u8 hbp_len)
@@ -586,7 +602,10 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 /*
  * Enable/disable all of the breakpoints active at the specified
  * exception level at the register level.
- * This is used when single-stepping after a breakpoint exception.
+ * This is used when single-stepping after a breakpoint exception or switching
+ * threads.
+ *
+ * Must be called with debug exceptions masked.
  */
 static void toggle_bp_registers(int reg, enum dbg_active_el el, int enable)
 {
@@ -908,7 +927,11 @@ bool try_step_suspended_breakpoints(struct pt_regs *regs)
 NOKPROBE_SYMBOL(try_step_suspended_breakpoints);
 
 /*
- * Context-switcher for restoring suspended breakpoints.
+ * Context-switcher for restoring suspended CPU-bound breakpoints.
+ *
+ * Breakpoints of the previous task are uninstalled before
+ * this function is called, in perf_event_task_sched_out(), and those
+ * of the next task are installed after, in perf_event_task_sched_in().
  */
 void hw_breakpoint_thread_switch(struct task_struct *next)
 {
@@ -922,6 +945,7 @@ void hw_breakpoint_thread_switch(struct task_struct *next)
 	 */
 
 	struct debug_info *current_debug_info, *next_debug_info;
+	unsigned long daif = local_daif_save();
 
 	current_debug_info = &current->thread.debug;
 	next_debug_info = &next->thread.debug;
@@ -937,6 +961,8 @@ void hw_breakpoint_thread_switch(struct task_struct *next)
 		toggle_bp_registers(AARCH64_DBG_REG_WCR,
 				    DBG_ACTIVE_EL0,
 				    !next_debug_info->wps_disabled);
+
+	local_daif_restore(daif);
 }
 
 /*

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0


