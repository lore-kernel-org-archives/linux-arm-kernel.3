Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EE0C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7OFgxhjrlOClcQCwgaNlhjhHelztdxjPu3EaPafcLuY=; b=XeJyEACu/z6mrv
	dRtPe4EZLSAHsSrd+8JFOVbR2nkOeIWJNdP2JsDvmwpy12pTWcAj03as12jteRF1QBy8qh/ZkhrQN
	Za1b/xc38OLkC+R0oDj39GwYzqct9YSbKOzc4RDi+B801eKty3A0VpOCjewTHso/pn0tDKsStDOEN
	be9FObIOr7YoBaR0pZqII0KnOOsbZ1bGpPTyBRFZM4aBcwBEGjThWhx7Igk/GNeH5yyoT9C9gLIly
	UuQCpSZa5lF8jiQ4WO3wNRWJ55oO/FUILzNb2cTZNTwUgRTGgyW1SzNwLoVkYJEJ2HQrog+p+wzP3
	N27DGCB+nxBUvEob3xDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh68-00000005GQK-3fYk;
	Tue, 28 Jul 2026 12:39:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh60-00000005GNn-0wmr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:39:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 261191BC0;
	Tue, 28 Jul 2026 05:39:39 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D6063F86F;
	Tue, 28 Jul 2026 05:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785242383; bh=w1+YIJTVAP5jT45iufkHCyc6hDcCQv6aD2oTFAUaN5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e9MZfImJJQjWew8KtLyIaQAjM1i7qvWrGcWwiEJo7mFFetOKMVHhSr8m1GJVNL/5p
	 68fnOIzemnhv1lsqLD0DGiLMejQMPynp0l5qVVkMCGJlx+0zOUCn3TFcpK/rtdY74q
	 Y11YbY0E6vZi19/g5ivDqd99VbfEOemRgJ0jk4BQ=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 01/13] arm64: preempt: Simplify and optimize __preempt_count_dec_and_test()
Date: Tue, 28 Jul 2026 13:38:47 +0100
Message-Id: <20260728123859.2911495-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260728123859.2911495-1-mark.rutland@arm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_053944_363335_18556060 
X-CRM114-Status: GOOD (  17.57  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

In arm64's __preempt_count_dec_and_test(), the final conditional load of
'ti->preempt_count' is always executed in the common case. The
conditional load leads to unfortunate code generation for
preempt_enable[_notrace](), and it would be better to unconditionally
load 'ti->preempt_count', as described below.

On arm64, struct thread_info contains the following union:

| union {
|         u64             preempt_count;
|         struct {
|                 u32     count;
|                 u32     need_resched;
|         } preempt;
| };

Note: 'need_resched' is encoded so that '0' means a reschedule is
needed, and '1' means a reschedule is NOT needed.

The core logic of __preempt_count_dec_and_test() is:

| static inline bool __preempt_count_dec_and_test(void)
| {
|         struct thread_info *ti = current_thread_info();
|         u64 pc = READ_ONCE(ti->preempt_count);
|
|         WRITE_ONCE(ti->preempt.count, --pc);
|
|         return !pc || !READ_ONCE(ti->preempt_count);
| }

The '!pc' condition can only be true when both:

* The initial value of 'need_resched' was 0, meaning that a reschedule
  is needed. This should be rare.

* The initial value of 'count' was exactly 1. This cannot be true for a
  nested preempt_disable() ... preempt_enable() sequence.

Hence in common cases, '!pc' will be false, and it's necessary to
execute the final READ_ONCE(ti->preempt_count).

This results in a conditional branch in the common case, as can be seen
when __preempt_count_dec_and_test() is outlined:

| <outline___preempt_count_dec_and_test>:
|        mrs     x2, sp_el0
|        ldr     x1, [x2, #8]
|        mov     w0, #0x1
|        sub     x1, x1, #0x1
|        str     w1, [x2, #8]
|        cbz     x1, 1f
|        ldr     x0, [x2, #8]
|        cmp     x0, #0x0
|        cset    w0, eq  // eq = none
| 1:     ret

It would be better to avoid the special case for 'pc == 0', and to
always load 'ti->preempt_count' after decrementing 'ti->preempt.count'.
For the common cases this will remove a conditional branch. For the rare
cases where preemption is needed initially, this only adds a single
load, whose cost should be dominated by other factors.

Remove the special case for 'pc == 0', and always load the combined
'ti->preempt_count' after decrementing 'ti->preempt.count'.

The removal of the conditional branch helps with code generation, as the
compiler can more easily move a dependent slow path out-of-line, as
demonstrated with the following compiled with GCC 15.2.0:

| void outline_preempt_enable_notrace(void)
| {
|        preempt_enable_notrace();
| }

Before this patch:

| <outline_preempt_enable_notrace>:
|        mrs     x1, sp_el0
|        ldr     x0, [x1, #8]
|        sub     x0, x0, #0x1
|        str     w0, [x1, #8]
|        cbz     x0, 1f
|        ldr     x0, [x1, #8]
|        cbnz    x0, 2f
| 1:     paciasp
|        stp     x29, x30, [sp, #-16]!
|        mov     x29, sp
|        bl      preempt_schedule_notrace
|        ldp     x29, x30, [sp], #16
|        autiasp
|        ret
| 2:     ret

After this patch:

| <outline_preempt_enable_notrace>:
|        mrs     x0, sp_el0
|        ldr     w1, [x0, #8]
|        sub     w1, w1, #0x1
|        str     w1, [x0, #8]
|        ldr     x0, [x0, #8]
|        cbz     x0, 1f
|        ret
| 1:     paciasp
|        stp     x29, x30, [sp, #-16]!
|        mov     x29, sp
|        bl      preempt_schedule_notrace
|        ldp     x29, x30, [sp], #16
|        autiasp
|        ret

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/preempt.h | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 932ea4b620428..ca2ad1a8db095 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -55,30 +55,23 @@ static inline void __preempt_count_sub(int val)
 	WRITE_ONCE(current_thread_info()->preempt.count, pc);
 }
 
-static inline bool __preempt_count_dec_and_test(void)
-{
-	struct thread_info *ti = current_thread_info();
-	u64 pc = READ_ONCE(ti->preempt_count);
-
-	/* Update only the count field, leaving need_resched unchanged */
-	WRITE_ONCE(ti->preempt.count, --pc);
-
-	/*
-	 * If we wrote back all zeroes, then we're preemptible and in
-	 * need of a reschedule. Otherwise, we need to reload the
-	 * preempt_count in case the need_resched flag was cleared by an
-	 * interrupt occurring between the non-atomic READ_ONCE/WRITE_ONCE
-	 * pair.
-	 */
-	return !pc || !READ_ONCE(ti->preempt_count);
-}
-
 static inline bool should_resched(int preempt_offset)
 {
 	u64 pc = READ_ONCE(current_thread_info()->preempt_count);
 	return pc == preempt_offset;
 }
 
+static inline bool __preempt_count_dec_and_test(void)
+{
+	/*
+	 * We must load the combined 'prempt_count' after decrementing
+	 * 'preempt.count' as an interrupt could modify 'need_resched' before
+	 * __preempt_count_sub() writes back to 'preempt.count'.
+	 */
+	__preempt_count_sub(1);
+	return should_resched(0);
+}
+
 #ifdef CONFIG_PREEMPTION
 
 void preempt_schedule(void);
-- 
2.30.2


