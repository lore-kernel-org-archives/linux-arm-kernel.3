Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9213ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 11:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BD9Onr8K9+9jo+30A6motAZuX482YkOJZ/gcP9ARng=; b=mzwyPhLOe0Ii/NcA8JZs0kipL6
	SMBKw1xlnSeDUCBRub9+mF1sv/uC3Sx1cvix13sypUr4R2vSElYU86516QNT/mWTKlmFgOgzW9jpN
	6ZTspsTTRigyaLxpDtRezm/bPmMcZnEdfHfVTRv2JvPusgPweRzHGJ4Q/YN6gwsRJOAhpUr8wLoYv
	QQjTunKrMlYcFL8QXJK1LzPzS0QHsqW0FB61BdVpMDVwtUpS5bHdmrUn2x2PviRQCa6zmr3v5GPhD
	CD2BDjJQHoSfpu/HCbAL0f1nHcz+yi/oKBr7izW9u8j9xh01rvbhjiJOKdIzLEvdakeWoxg/Q0SV/
	Ov34NcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ePF-0000000A9eC-2zIa;
	Mon, 22 Sep 2025 11:08:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ePD-0000000A9dt-3jXM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 11:08:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14588601FD;
	Mon, 22 Sep 2025 11:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4C7C4CEF0;
	Mon, 22 Sep 2025 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758539306;
	bh=8H2DVag6hTQmO7INCaFRzpGM0vzoCJhreoQ8hR1H9cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SybAgN8LLiYMb3bpJZqg4BUvIixL2rR0eKxerV6f/X/6YdftvcHthhB/L29Hgj49n
	 OaLHaAZKHmUxR534G5DuhXqXfpT0ipHW5E4oAabe13VGuaBG8o6QP6B/hzsxGeBWXK
	 7pOeYFp102UQ/7Wi/97lF91HL4FgpO5E67hxZuu8BhygX/V+4Wmm7ChGYzu0Bmm6cr
	 FuwkRXtnzTlzz2pNwrBlrbR2V6D3nIa+ljr4oFYdR37Cr5YZHCqBbXfoeGF3ubQI3i
	 xYmGTSCb+p6QEclPUmLV7riMd1uIRP+VIRXRarU4QheUDG2LPvfacfgGLFBdAVkffQ
	 yqiAMnaUPz5YQ==
Date: Mon, 22 Sep 2025 12:08:22 +0100
From: Will Deacon <will@kernel.org>
To: Mengchen Li <mengchenli64@gmail.com>
Subject: Re: [PATCH] arm64: kgdb: Ensure atomic single-step execution
Message-ID: <aNEuJu0BQAloEBX9@willie-the-truck>
References: <1756972043-12854-1-git-send-email-mengchenli64@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1756972043-12854-1-git-send-email-mengchenli64@gmail.com>
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, dianders@chromium.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
> 
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

Why are you now copying the caller saved registers?

Will

