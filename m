Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE83E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGnxf1on7vbCNJ6zUrQbJDRlvKlaGkJHDsx++AAJ4Mo=; b=psEnJrZimq7A4Vka9t/v9kFoQs
	aki4FdMV2wH64CYFXzkxSLzw9S9J3m1KW6OHLUlNVuuavsiGqPmXfBPitQ6wwiRIfudNAnJ+QS7Uo
	T3ALhuYCN3Vw7febFURzG8hTCavgAU5g3uuUGjtOxkJU2DzCJlFfkBeytvXXA/L3yUpqN1ijCYD5J
	pcC6chtOATMQW4VzNn2iK7u13ClfIRmv1ffu/vAVc6hNG1wzvCTSmJm7MmYRDg6rPVJ/BiDOMtThr
	EsldLUgdcxx9jYGMZmoNz8QBvCZ4ZOwguDsaZHgjjPhz/kBF39CQwDTmDLEFdTyZ/oYsE9yOyLwad
	DFx6XDsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNP1-0000000F66B-47X9;
	Wed, 11 Dec 2024 14:09:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNMv-0000000F5fT-1AXw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 14:07:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D10BB15A1;
	Wed, 11 Dec 2024 06:07:40 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA4273F720;
	Wed, 11 Dec 2024 06:07:11 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aishwarya.tcv@arm.com,
	catalin.marinas@arm.com,
	keescook@chromium.org,
	kent.overstreet@linux.dev,
	mark.rutland@arm.com,
	peterz@infradead.org,
	will@kernel.org
Subject: [PATCH 1/2] arm64: stacktrace: Skip reporting LR at exception boundaries
Date: Wed, 11 Dec 2024 14:07:03 +0000
Message-Id: <20241211140704.2498712-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241211140704.2498712-1-mark.rutland@arm.com>
References: <20241211140704.2498712-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_060713_397560_2C1611AB 
X-CRM114-Status: GOOD (  16.47  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Aishwarya reports that warnings are sometimes seen when running the
ftrace kselftests, e.g.

| WARNING: CPU: 5 PID: 2066 at arch/arm64/kernel/stacktrace.c:141 arch_stack_walk+0x4a0/0x4c0
| Modules linked in:
| CPU: 5 UID: 0 PID: 2066 Comm: ftracetest Not tainted 6.13.0-rc2 #2
| Hardware name: linux,dummy-virt (DT)
| pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
| pc : arch_stack_walk+0x4a0/0x4c0
| lr : arch_stack_walk+0x248/0x4c0
| sp : ffff800083643d20
| x29: ffff800083643dd0 x28: ffff00007b891400 x27: ffff00007b891928
| x26: 0000000000000001 x25: 00000000000000c0 x24: ffff800082f39d80
| x23: ffff80008003ee8c x22: ffff80008004baa8 x21: ffff8000800533e0
| x20: ffff800083643e10 x19: ffff80008003eec8 x18: 0000000000000000
| x17: 0000000000000000 x16: ffff800083640000 x15: 0000000000000000
| x14: 02a37a802bbb8a92 x13: 00000000000001a9 x12: 0000000000000001
| x11: ffff800082ffad60 x10: ffff800083643d20 x9 : ffff80008003eed0
| x8 : ffff80008004baa8 x7 : ffff800086f2be80 x6 : ffff0000057cf000
| x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff800086f2b690
| x2 : ffff80008004baa8 x1 : ffff80008004baa8 x0 : ffff80008004baa8
| Call trace:
|  arch_stack_walk+0x4a0/0x4c0 (P)
|  arch_stack_walk+0x248/0x4c0 (L)
|  profile_pc+0x44/0x80
|  profile_tick+0x50/0x80 (F)
|  tick_nohz_handler+0xcc/0x160 (F)
|  __hrtimer_run_queues+0x2ac/0x340 (F)
|  hrtimer_interrupt+0xf4/0x268 (F)
|  arch_timer_handler_virt+0x34/0x60 (F)
|  handle_percpu_devid_irq+0x88/0x220 (F)
|  generic_handle_domain_irq+0x34/0x60 (F)
|  gic_handle_irq+0x54/0x140 (F)
|  call_on_irq_stack+0x24/0x58 (F)
|  do_interrupt_handler+0x88/0x98
|  el1_interrupt+0x34/0x68 (F)
|  el1h_64_irq_handler+0x18/0x28
|  el1h_64_irq+0x6c/0x70
|  queued_spin_lock_slowpath+0x78/0x460 (P)

The warning in question is:

  WARN_ON_ONCE(state->common.pc == orig_pc))

... in kunwind_recover_return_address(), which is triggered when
return_to_handler() is encountered in the trace, but
ftrace_graph_ret_addr() cannot find a corresponding original return
address on the fgraph return stack.

This happens because the stacktrace code encounters an exception
boundary where the LR was not live at the time of the exception, but the
LR happens to contain return_to_handler(); either because the task
recently returned there, or due to unfortunate usage of the LR at a
scratch register. In such cases attempts to recover the return address
via ftrace_graph_ret_addr() may fail, triggering the WARN_ON_ONCE()
above and aborting the unwind (hence the stacktrace terminating after
reporting the PC at the time of the exception).

Handling unreliable LR values in these cases is likely to require some
larger rework, so for the moment avoid this problem by restoring the old
behaviour of skipping the LR at exception boundaries, which the
stacktrace code did prior to commit:

  c2c6b27b5aa14fa2 ("arm64: stacktrace: unwind exception boundaries")

This commit is effectively a partial revert, keeping the structures and
logic to explicitly identify exception boundaries while still skipping
reporting of the LR. The logic to explicitly identify exception
boundaries is still useful for general robustness and as a building
block for future support for RELIABLE_STACKTRACE.

Fixes: c2c6b27b5aa14fa2 ("arm64: stacktrace: unwind exception boundaries")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/stacktrace.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index caef85462acb6..4a08ad8158380 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -26,7 +26,6 @@ enum kunwind_source {
 	KUNWIND_SOURCE_CALLER,
 	KUNWIND_SOURCE_TASK,
 	KUNWIND_SOURCE_REGS_PC,
-	KUNWIND_SOURCE_REGS_LR,
 };
 
 union unwind_flags {
@@ -178,23 +177,8 @@ int kunwind_next_regs_pc(struct kunwind_state *state)
 	state->regs = regs;
 	state->common.pc = regs->pc;
 	state->common.fp = regs->regs[29];
-	state->source = KUNWIND_SOURCE_REGS_PC;
-	return 0;
-}
-
-static __always_inline int
-kunwind_next_regs_lr(struct kunwind_state *state)
-{
-	/*
-	 * The stack for the regs was consumed by kunwind_next_regs_pc(), so we
-	 * cannot consume that again here, but we know the regs are safe to
-	 * access.
-	 */
-	state->common.pc = state->regs->regs[30];
-	state->common.fp = state->regs->regs[29];
 	state->regs = NULL;
-	state->source = KUNWIND_SOURCE_REGS_LR;
-
+	state->source = KUNWIND_SOURCE_REGS_PC;
 	return 0;
 }
 
@@ -274,11 +258,8 @@ kunwind_next(struct kunwind_state *state)
 	case KUNWIND_SOURCE_FRAME:
 	case KUNWIND_SOURCE_CALLER:
 	case KUNWIND_SOURCE_TASK:
-	case KUNWIND_SOURCE_REGS_LR:
-		err = kunwind_next_frame_record(state);
-		break;
 	case KUNWIND_SOURCE_REGS_PC:
-		err = kunwind_next_regs_lr(state);
+		err = kunwind_next_frame_record(state);
 		break;
 	default:
 		err = -EINVAL;
@@ -436,7 +417,6 @@ static const char *state_source_string(const struct kunwind_state *state)
 	case KUNWIND_SOURCE_CALLER:	return "C";
 	case KUNWIND_SOURCE_TASK:	return "T";
 	case KUNWIND_SOURCE_REGS_PC:	return "P";
-	case KUNWIND_SOURCE_REGS_LR:	return "L";
 	default:			return "U";
 	}
 }
-- 
2.30.2


