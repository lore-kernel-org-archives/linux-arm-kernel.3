Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E38C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 14:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CtaJGW5QWe0qiAUChS4FBLMJd1/uIw8kCqbYGukC2Zc=; b=gQgB6jIVLYMmIX
	BTw9vAtZZe7VXPagqfHM0wr12h70JfFMoW/JJT9LB6KNRjXwglMkpbSSHf+mYEXDAV9NajSj/GR+8
	dJXtgBntQMA7XxYeaQ1ME/FpwbSQTz9UjcsKDv89Gx/N1gNxZSiXom1Mb9+SGCy2OnyBduZcp6l5l
	bTkwpWybrRgiEA20afJYjtpuOk8HBRZFc+rqQ5gbKmn73tZXGgzRjgZWz6dWufzzE9LGfwIhyKYjP
	qcFoNXasovir10lLsRM+18NnMMIjyqqpl07ETRHwZAiHj+MTTkXZv/V76LVJEC+6jsneGUVyC0kgL
	4r2j8R/zE+F5+VFF3oiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucm8l-0000000CorP-1Joc;
	Fri, 18 Jul 2025 14:32:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucm4Y-0000000CoXP-2h0h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 14:28:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F150B16A3;
	Fri, 18 Jul 2025 07:28:15 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.30.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B6CD3F694;
	Fri, 18 Jul 2025 07:28:21 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64/entry: Mask DAIF in cpu_switch_to(), call_on_irq_stack()
Date: Fri, 18 Jul 2025 15:28:14 +0100
Message-ID: <20250718142814.133329-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_072826_776119_3118F3C2 
X-CRM114-Status: GOOD (  24.06  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, Cristian Prundeanu <cpru@amazon.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

`cpu_switch_to()` and `call_on_irq_stack()` manipulate SP to change
to different stacks along with the Shadow Call Stack if it is enabled.
Those two stack changes cannot be done atomically and both functions
can be interrupted by SErrors or Debug Exceptions which, though unlikely,
is very much broken : if interrupted, we can end up with mismatched stacks
and Shadow Call Stack leading to clobbered stacks.

In `cpu_switch_to()`, it can happen when SP_EL0 points to the new task,
but x18 stills points to the old task's SCS. When the interrupt handler
tries to save the task's SCS pointer, it will save the old task
SCS pointer (x18) into the new task struct (pointed to by SP_EL0),
clobbering it.

In `call_on_irq_stack()`, it can happen when switching from the task stack
to the IRQ stack and when switching back. In both cases, we can be
interrupted when the SCS pointer points to the IRQ SCS, but SP points to
the task stack. The nested interrupt handler pushes its return addresses
on the IRQ SCS. It then detects that SP points to the task stack,
calls `call_on_irq_stack()` and clobbers the task SCS pointer with
the IRQ SCS pointer, which it will also use !

This leads to tasks returning to addresses on the wrong SCS,
or even on the IRQ SCS, triggering kernel panics via CONFIG_VMAP_STACK
or FPAC if enabled.

This is possible on a default config, but unlikely.
However, when enabling CONFIG_ARM64_PSEUDO_NMI, DAIF is unmasked and
instead the GIC is responsible for filtering what interrupts the CPU
should receive based on priority.
Given the goal of emulating NMIs, pseudo-NMIs can be received by the CPU
even in `cpu_switch_to()` and `call_on_irq_stack()`, possibly *very*
frequently depending on the system configuration and workload, leading
to unpredictable kernel panics.

Completely mask DAIF in `cpu_switch_to()` and restore it when returning.
Do the same in `call_on_irq_stack()`, but restore and mask around
the branch.
Mask DAIF even if CONFIG_SHADOW_CALL_STACK is not enabled for consistency
of behaviour between all configurations.

Introduce and use an assembly macro for saving and masking DAIF,
as the existing one saves but only masks IF.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reported-by: Cristian Prundeanu <cpru@amazon.com>
Fixes: 59b37fe52f49955791a460752c37145f1afdcad1 ("arm64: Stash shadow stack pointer in the task struct on interrupt")
---
Hi,
I spent some time evaluating the performance impact of this change
to make sure that it would be OK to mask in those functions.
They have very few instructions so have few chances to be interrupted
to begin with so the impact should be minimal.

Disclaimer : I am no benchmarking or performance analysis expert.
I'm happy to take additional inputs/validation of the findings below !

I ran the following benchmarks on 4 core VMs running on recent
commercial hardware, trying to maximize task switches :
 - `stress-ng --switch` with 100 processes [0],
 - `hackbench -T` and `hackbench -P`, both with 400 tasks [1].

Comparing the effect on base defconfig :
 - `stress-ng` is nearly identical, the median switch time with the fix
   was reduced by 0.1%, average raised by 0.04%.
 - `hackbench` results are slightly different, medians were reduced by
   0.3-0.4%, with some high task time outliers raising the average by
   1.7-1.8%.
 - Both benchmarks have almost identical distribution.
 - The effects seem mostly minimal, possibly in the noise.

Comparing the effects with pNMI+SCS, pNMI enabled :
 - `stress-ng` is slightly slower : median is +1.9%, average +1.4%.
 - `hackbench` is similar : median is +0.8-0.9%, average +0.3-+0.6%.
 - Times distribution is larger in both cases.
 - There seems to be a small performance impact, however without the fix
   there is a high likelihood of triggering the race condition and panic
   at some point.

I also tried to benchmark the performance impact on `memcached`
as a workload reported to crash with pNMI enabled and SCS.
I used `mc-crusher`[2] as recommended per the `memcached` documentation,
specifically the `binconf`, `slab_rebal_torture` and `slab_rebal_torture5`
configurations, measuring the average amount of get/set operations
per second each minute.
Those were also run on a 4 core VM, but running on an older machine.

Comparing the effects on base defconfig :
 - `binconf` is slightly worse, -0.8% ops/s on average
 - `slab_rebal_torture` is slightly better, +0.7% op/s on average
 - `slab_rebal_torture5` is almost identical, +0.1% op/s on average
 - There is much less variation in operations/s.

Comparing the effects with pNMI+SCS, pNMI enabled :
 - `binconf` is slightly better, +0.5% op/s on average
 - `slab_rebal_torture` as well, +0.5% op/s on average
 - `slab_rebal_torture5` is slightly worse, -0.6% op/s on average
 - The spread of values is similar

The `mc-crusher` performance results seem to validate that the change
has little impact in practice and might very much be lost in the noise.

Given those results I feel it is OK to mask DAIF in `call_on_irq_stack()`
and `cpu_switch_to()` in all configurations for consistency of behaviour,
as well as not being notably detrimental in cases where it does fix the
race condition.

My apologies if this is all *very long*. I felt it was important to
explain the mechanisms triggering the issues, as well as justifying
the performance impact given the functions affected (though this has
less place in the commit message itself.)
I might be wrong on both counts, so I'm happy to trim the commit
message if needed or be corrected on the performance impact !

Thanks,
Ada

[0]: https://github.com/ColinIanKing/stress-ng
[1]: https://man.archlinux.org/man/hackbench.8
[2]: https://github.com/memcached/mc-crusher
---
 arch/arm64/include/asm/assembler.h | 5 +++++
 arch/arm64/kernel/entry.S          | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index ad63457a05c5..c56c21bb1eec 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -41,6 +41,11 @@
 /*
  * Save/restore interrupts.
  */
+	.macro save_and_disable_daif, flags
+	mrs	\flags, daif
+	msr	daifset, #0xf
+	.endm
+
 	.macro	save_and_disable_irq, flags
 	mrs	\flags, daif
 	msr	daifset, #3
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 5ae2a34b50bd..30dcb719685b 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -825,6 +825,7 @@ SYM_CODE_END(__bp_harden_el1_vectors)
  *
  */
 SYM_FUNC_START(cpu_switch_to)
+	save_and_disable_daif x11
 	mov	x10, #THREAD_CPU_CONTEXT
 	add	x8, x0, x10
 	mov	x9, sp
@@ -848,6 +849,7 @@ SYM_FUNC_START(cpu_switch_to)
 	ptrauth_keys_install_kernel x1, x8, x9, x10
 	scs_save x0
 	scs_load_current
+	restore_irq x11
 	ret
 SYM_FUNC_END(cpu_switch_to)
 NOKPROBE(cpu_switch_to)
@@ -874,6 +876,7 @@ NOKPROBE(ret_from_fork)
  * Calls func(regs) using this CPU's irq stack and shadow irq stack.
  */
 SYM_FUNC_START(call_on_irq_stack)
+	save_and_disable_daif x9
 #ifdef CONFIG_SHADOW_CALL_STACK
 	get_current_task x16
 	scs_save x16
@@ -888,8 +891,10 @@ SYM_FUNC_START(call_on_irq_stack)
 
 	/* Move to the new stack and call the function there */
 	add	sp, x16, #IRQ_STACK_SIZE
+	restore_irq x9
 	blr	x1
 
+	save_and_disable_daif x9
 	/*
 	 * Restore the SP from the FP, and restore the FP and LR from the frame
 	 * record.
@@ -897,6 +902,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	mov	sp, x29
 	ldp	x29, x30, [sp], #16
 	scs_load_current
+	restore_irq x9
 	ret
 SYM_FUNC_END(call_on_irq_stack)
 NOKPROBE(call_on_irq_stack)

base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
-- 
2.43.0


