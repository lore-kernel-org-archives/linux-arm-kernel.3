Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B0FCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8aJTvAowz2MeXf/l0LS9pZrzy/MnVv3cfYmNSpGbCE=; b=1R3e15Mp/X+FegJRZE0VrwyQ9J
	shGVmM+8Uxu9jM044hpPteRuirb3c1UWgweDphqgk0Aj7/+ejX9WazBtuHGnZ0ubQ6/hkh22rPv8b
	/sbVAy2V6YvXEOC8P1Mb1vgVNWUGDImbZOx3ZXmpboTjTIy613o+dIc4JXkrNkzR3rYgIjdOXHq0B
	tq9aAQOWcm8jYHRHdR8DkTAc/goOXmBpjVwj80lthqIsCHpxsb/prBjRE5zIHsK5lGwT8ZazM0TZE
	YOegnWz4ogsU6wE7A0BC0sDxK13PZcjFKi0nY6K+q+9kKcdy66NHsDlmOHIcahNZ2MLZOe2dun6Fc
	jgEFm2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OVL-0000000HKWi-2W3h;
	Wed, 24 Sep 2025 12:21:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OVJ-0000000HKUH-2TBx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 12:21:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D72C8106F;
	Wed, 24 Sep 2025 05:21:38 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13B483F66E;
	Wed, 24 Sep 2025 05:21:44 -0700 (PDT)
Date: Wed, 24 Sep 2025 13:21:37 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mengchen Li <mengchenli64@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: kgdb: Ensure atomic single-step execution
Message-ID: <aNPiUbdRhaRklebF@J2N7QTR9R3>
References: <1756972043-12854-1-git-send-email-mengchenli64@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1756972043-12854-1-git-send-email-mengchenli64@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_052149_704957_78092ADF 
X-CRM114-Status: GOOD (  35.44  )
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

On Thu, Sep 04, 2025 at 03:47:23PM +0800, Mengchen Li wrote:
> The existing KGDB single-step handling on ARM64 is susceptible to
> interference from external interrupts. If an interrupt arrives in the
> narrow time window between the execution of the instruction under test
> and the generation of the step exception, the CPU will vector to the
> interrupt handler (e.g., el1_interrupt -> __el1_irq) instead of
> triggering the debug exception immediately.
> 
> When the step exception is finally taken, the context is no longer that
> of the original instruction. This causes the debugger to appear "stuck",
> as it repeatedly tries to single-step through the interrupt handler's
> code (e.g., irq_enter_rcu()) instead of the target code.
> 
> The fix is to make the single-step operation atomic by masking interrupts
> for its duration:
> 1. Upon receiving a step ('s') request from GDB, save the current
>    PSTATE and then mask IRQs by setting the PSTATE.I bit.
> 2. After the single-step exception is taken, in kgdb_single_step_handler(),
>    disable the kernel's single-step mechanism and meticulously restore
>    the original interrupt mask state from the saved PSTATE.

I don't think that works:

* Anything which reads PSTATE/DAIF will see PSTATE.I set unexpectedly.
  For example, that will break irqflag tracing, since
  arch_irqs_disabled_flags() will return true in cases where it is
  expected to return false.

* That will break anything which sets PSTATE.I.
  For example, if stepping local_irq_disable(), the initial DAIF value
  might have DAIF.I clear. If that's restored *after*
  local_irq_disable() has set DAIF.I, then restoring the original DAIF.I
  value will erroneously unmask interrupts.

More generally:

* The DAIF.IF bits need to be handled atomically, for platforms where
  FIQ is used.

* Even if the DAIF.IF bits are set, It's still possible to take SError,
  and potentially other exceptions in future (e.g. PMU, NMI). I don't
  think we can only think about the DAIF.I or DAIF.IF bits.

If we want to do something here, I think we'd need to enlighten the
entry code with more comprehensive management of the singlestep state.
I'm not too keen on coupling that with KGDB.

> This guarantees the instruction is executed without interruption and the
> debug exception is taken in the correct context.
> 
> As a result of this new approach, the following cleanups are also made:
> - The global `kgdb_single_step` flag is removed, as state is now precisely
>   managed by `kgdb_cpu_doing_single_step` and the interrupt mask.
> - The logic to disable single-step and manage the flag in the 'c'ontinue
>   case is removed, as it is rendered redundant.
> - The call to `kernel_rewind_single_step()` is unnecessary and is removed.
> 
> Tested on OrangePi 3B (RK3566) via serial console (kgdboc);
> allows reliable single-stepping with GDB where it previously failed.
> 
> Signed-off-by: Mengchen Li <mengchenli64@gmail.com>
> ---
>  arch/arm64/kernel/kgdb.c | 49 ++++++++++++++++++++----------------------------
>  1 file changed, 20 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
> index 968324a..ee8a7e3 100644
> --- a/arch/arm64/kernel/kgdb.c
> +++ b/arch/arm64/kernel/kgdb.c
> @@ -101,6 +101,8 @@ struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
>  	{ "fpcr", 4, -1 },
>  };
>  
> +static DEFINE_PER_CPU(unsigned int, kgdb_pstate);
> +
>  char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs)
>  {
>  	if (regno >= DBG_MAX_REG_NUM || regno < 0)
> @@ -128,25 +130,15 @@ int dbg_set_reg(int regno, void *mem, struct pt_regs *regs)
>  void
>  sleeping_thread_to_gdb_regs(unsigned long *gdb_regs, struct task_struct *task)
>  {
> -	struct cpu_context *cpu_context = &task->thread.cpu_context;
> +	struct pt_regs *thread_regs;
>  
>  	/* Initialize to zero */
>  	memset((char *)gdb_regs, 0, NUMREGBYTES);
>  
> -	gdb_regs[19] = cpu_context->x19;
> -	gdb_regs[20] = cpu_context->x20;
> -	gdb_regs[21] = cpu_context->x21;
> -	gdb_regs[22] = cpu_context->x22;
> -	gdb_regs[23] = cpu_context->x23;
> -	gdb_regs[24] = cpu_context->x24;
> -	gdb_regs[25] = cpu_context->x25;
> -	gdb_regs[26] = cpu_context->x26;
> -	gdb_regs[27] = cpu_context->x27;
> -	gdb_regs[28] = cpu_context->x28;
> -	gdb_regs[29] = cpu_context->fp;
> -
> -	gdb_regs[31] = cpu_context->sp;
> -	gdb_regs[32] = cpu_context->pc;
> +	thread_regs = task_pt_regs(task);
> +	memcpy((void *)gdb_regs, (void *)thread_regs->regs, GP_REG_BYTES);
> +	/* Special case for PSTATE */
> +	dbg_get_reg(33, gdb_regs + GP_REG_BYTES, thread_regs);
>  }

The commit message doesn't explain anything about the behaviour for
sleeping threads, so it's not clear why this is changed at all.

The task_pt_regs() helper returns a pointer to the pt_regs for the
*userspace* context of a task. That doesn't represent the kernel
context, and that's meaningless for kthreads without a userspace
context.

Regardless of anything else, this is definitely wrong. It is at best
pointless.

[...]

> +		/* mask interrupts while single stepping */
> +		__this_cpu_write(kgdb_pstate, linux_regs->pstate);
> +		linux_regs->pstate |= (1 << 7);

As a general note, please don't open-code bit shifts like this.

IIUC this is PSR_I_BIT.

Mark.

