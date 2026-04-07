Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F98FEEF34
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfx1sdL4YvCqGqrakY6/ukdioMtXRVh1xiBOhBAcotg=; b=bGL2w27/NzcXg8
	O1K2d0YnXcPG+Oe1Fqo2UGKfL1rl9ZfOp27d2IQUTxw6x1bcC9b0wm9rRl4bvMXQBO3wHm+lV2q6G
	ovjWgKrd9NHozUP8pLv8yD2MZFDxwr+uW01e+6TKp+onNsxQT3D8zEEtCy2sQ73MdzBABsnTDPnyD
	IBK4HuyGWkR7k5NUzE6ObOYdJwWd219Skhtb4NTAZ1NdOIZgkSvt+7ehpKZm0LEXi/wvnmhYD29bF
	+RS3I3uVzPFFdk9XU+RslqhLJkoATNVDCA33MSjgVVCxjk+yd5OQt3iUkdtnZHqwj7P9NR1tccsmQ
	uh8GbOUV8Ri8m34HJtOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6KJ-00000006VUh-0esF;
	Tue, 07 Apr 2026 13:18:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6KE-00000006VSH-04O3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:18:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CCEC1BB2;
	Tue,  7 Apr 2026 06:18:31 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C2093F7D8;
	Tue,  7 Apr 2026 06:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775567917; bh=460FgsMVIrnBcOu9FijuyxZpOYyi6/RG8mHA95P9+Io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gA7xhDQqj9L8+kOdQ/cZfGURpSwMsEo4+Mcz5SwFjo0kDIGGcHFNJKLyIHpPBR7wW
	 DyRM4Wu7cliyr6q9WKab9xiAkOm20AxOmLryXsoO5AwpZKkGCgLHjYRfGMZDzVZZk3
	 yKfzKwKvtOWSu2TwFhzYKB64uvWDKU3RE7taYTCk=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 07/10] arm64: entry: Consistently prefix arm64-specific wrappers
Date: Tue,  7 Apr 2026 14:16:47 +0100
Message-Id: <20260407131650.3813777-8-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260407131650.3813777-1-mark.rutland@arm.com>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061838_155843_2A0EE5BA 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

For historical reasons, arm64's entry code has arm64-specific functions
named enter_from_kernel_mode() and exit_to_kernel_mode(), which are
wrappers for similarly-named functions from the generic irqentry code.
Other arm64-specific wrappers have an 'arm64_' prefix to clearly
distinguish them from their generic counterparts, e.g.
arm64_enter_from_user_mode() and arm64_exit_to_user_mode().

For consistency and clarity, add an 'arm64_' prefix to these functions.

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
 arch/arm64/kernel/entry-common.c | 38 ++++++++++++++++----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 3625797e9ee8f..3d01cdacdc7a2 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -35,7 +35,7 @@
  * Before this function is called it is not safe to call regular kernel code,
  * instrumentable code, or any code which may trigger an exception.
  */
-static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
+static noinstr irqentry_state_t arm64_enter_from_kernel_mode(struct pt_regs *regs)
 {
 	irqentry_state_t state;
 
@@ -51,8 +51,8 @@ static noinstr irqentry_state_t enter_from_kernel_mode(struct pt_regs *regs)
  * After this function returns it is not safe to call regular kernel code,
  * instrumentable code, or any code which may trigger an exception.
  */
-static void noinstr exit_to_kernel_mode(struct pt_regs *regs,
-					irqentry_state_t state)
+static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
+					      irqentry_state_t state)
 {
 	mte_check_tfsr_exit();
 	irqentry_exit(regs, state);
@@ -298,11 +298,11 @@ static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
 	unsigned long far = read_sysreg(far_el1);
 	irqentry_state_t state;
 
-	state = enter_from_kernel_mode(regs);
+	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_mem_abort(far, esr, regs);
 	local_daif_mask();
-	exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state);
 }
 
 static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
@@ -310,55 +310,55 @@ static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
 	unsigned long far = read_sysreg(far_el1);
 	irqentry_state_t state;
 
-	state = enter_from_kernel_mode(regs);
+	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_sp_pc_abort(far, esr, regs);
 	local_daif_mask();
-	exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state);
 }
 
 static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
 {
 	irqentry_state_t state;
 
-	state = enter_from_kernel_mode(regs);
+	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_el1_undef(regs, esr);
 	local_daif_mask();
-	exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state);
 }
 
 static void noinstr el1_bti(struct pt_regs *regs, unsigned long esr)
 {
 	irqentry_state_t state;
 
-	state = enter_from_kernel_mode(regs);
+	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_el1_bti(regs, esr);
 	local_daif_mask();
-	exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state);
 }
 
 static void noinstr el1_gcs(struct pt_regs *regs, unsigned long esr)
 {
 	irqentry_state_t state;
 
-	state = enter_from_kernel_mode(regs);
+	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_el1_gcs(regs, esr);
 	local_daif_mask();
-	exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state);
 }
 
 static void noinstr el1_mops(struct pt_regs *regs, unsigned long esr)
 {
 	irqentry_state_t state;
 
-	state = enter_from_kernel_mode(regs);
+	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_el1_mops(regs, esr);
 	local_daif_mask();
-	exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state);
 }
 
 static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
@@ -420,11 +420,11 @@ static void noinstr el1_fpac(struct pt_regs *regs, unsigned long esr)
 {
 	irqentry_state_t state;
 
-	state = enter_from_kernel_mode(regs);
+	state = arm64_enter_from_kernel_mode(regs);
 	local_daif_inherit(regs);
 	do_el1_fpac(regs, esr);
 	local_daif_mask();
-	exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state);
 }
 
 asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
@@ -491,13 +491,13 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 {
 	irqentry_state_t state;
 
-	state = enter_from_kernel_mode(regs);
+	state = arm64_enter_from_kernel_mode(regs);
 
 	irq_enter_rcu();
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	exit_to_kernel_mode(regs, state);
+	arm64_exit_to_kernel_mode(regs, state);
 }
 static void noinstr el1_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
-- 
2.30.2


