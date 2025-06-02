Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CD0C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 12:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53Wlw+eTBxlCXmP6bibokB8myYtJTgOns4jsfc++01Q=; b=eICCizAW3FJjYauFJwjpwuXUsI
	BdEpBn7D/PaH2uHvZ8whpxbQKxrtIyBI6/tSbLhtNCLlOWgwWLhwj82WK6c+8hLFclDEhzQQSUY2F
	4/X2gjbeyqlvJzCJ/aH+3GZF0MQ1pqOBlH50hlZmOMBJPc4eJm09QVjKpvDOgRGeClL75C+nAQAkw
	l7ylhxG7h3YnPfrX49Gerq7lAWW896quoIU0blOOPNHsJ/a8RxJFVk1cVcZ12Aj/afzuf/VZ7vM7c
	Whkn1iUHLmXDXCIiz3udt3y1bMNxGOKEulrERVQGXDjOsygXk9Rc1q3Qe0JmDdpiIaEpG5Kdidsmq
	RcOZDk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM4c4-00000007ObU-3OJa;
	Mon, 02 Jun 2025 12:50:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM4Zu-00000007ORr-1YF0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 12:47:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6C775C5787;
	Mon,  2 Jun 2025 12:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B763C4CEEB;
	Mon,  2 Jun 2025 12:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748868465;
	bh=HW3Z90l7RNBksiCHnADYX0xsQ1oyiXxM4OgllXOR9NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqZqdg19cTQfnr3uMJSzkWMJI11jMh9dsJ72dji6DqM43sBlwThnQuG9afVGw6mFq
	 oDGJN2F2kJL9QibiX49oi7WfgDzBtizvE2MQCoXV9NTeYhhBcqvwfLuRceoft7dEn+
	 auQmA3lF+wnjyK9uqJ60dfprBsEdpDbdbCLWwNTNs57GUtzwyVZkr4yodlKj/ksKxW
	 WxvDspEtJXk1p3hktrgbJdrZjuQ+oBVmF1CTskUbngqJx2rMAUIHVMez/kQwXszSxN
	 qJRI1pv0qTLoVQLDOAYE3UY4W6U2KBQyAhVO5FZ4gmV0fSCTU+J9YM2d97fnEX/zeG
	 ZO1380svXV1LA==
Date: Mon, 2 Jun 2025 13:47:39 +0100
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH] arm64/trap: fix broken ct->nmi_nesting when die() is
 called in a kthread
Message-ID: <20250602124738.GD1227@willie-the-truck>
References: <20250530092723.3307630-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530092723.3307630-1-yeoreum.yun@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_054746_497780_A41C3F73 
X-CRM114-Status: GOOD (  28.02  )
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
Cc: mark.rutland@arm.com, ptosi@google.com, catalin.marinas@arm.com, bigeasy@linutronix.de, linux-kernel@vger.kernel.org, kristina.martsenko@arm.com, mcgrof@kernel.org, broonie@kernel.org, geert@linux-m68k.org, joey.gouly@arm.com, james.morse@arm.com, pcc@google.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

[+Ada]

On Fri, May 30, 2025 at 10:27:23AM +0100, Yeoreum Yun wrote:
> When a kernel thread hits BUG() outside of an interrupt handler and
> panic_on_oops is not set, it exits via make_task_dead(), which is called by die().
> In this case, the nmi_nesting value in context_tracking becomes
> inconsistent because the proper context tracking exit functions are not reached.
> 
> Here’s an example scenario on arm64:
>   1. A kernel thread hits the BUG() macro outside an interrupt handler,
>      and panic_on_oops is not set (ct->nmi_nesting == CT_NESTING_IRQ_NONIDLE).
> 
>   2. The exception handler jumps to el1_dbg() and calls arm64_enter_el1_dbg(),
>      which invokes ct_nmi_enter(). (ct->nmi_nesting == CT_NESTING_IRQ_NONIDLE + 2)
> 
>   3. bug_handler() runs, and if the bug type is BUG_TRAP_TYPE_BUG, it calls die().
> 
>   4. die() then calls make_task_dead(), which terminates the kernel thread and
>      schedules another task—assume this is the idle_task.

This sounds like there is a genuine imbalance, then, as we're scheduling
in the context of an exception taken from EL1.

>   5. The idle_task attempts to enter the idle state by calling ct_idle_enter().
>      However, since the current ct->nmi_nesting value is CT_NESTING_IRQ_NONIDLE + 2,
>      ct_kernel_exit() triggers a WARN_ON_ONCE() warning.
> 
> Because the kernel thread couldn’t call the appropriate context tracking exit
> function in step 3, the ct->nmi_nesting value remains incorrect.
> This leads to warnings like the following:
> 
> [    7.133093] ------------[ cut here ]------------
> [    7.133129] WARNING: CPU: 2 PID: 0 at kernel/context_tracking.c:127 ct_kernel
> [    7.134157] Modules linked in:
> [    7.134158]     not ok 62 kasan_strings
> [    7.134280]
> [    7.134506] CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Tainted: G    B D W        N
> [    7.134930] Tainted: [B]=BAD_PAGE, [D]=DIE, [W]=WARN, [N]=TEST
> [    7.135150] pstate: 204003c5 (nzCv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    7.135441] pc : ct_kernel_exit+0xa4/0xb0
> [    7.135656] lr : ct_kernel_exit+0x1c/0xb0
> [    7.135866] sp : ffff8000829bbd90
> [    7.136011] x29: ffff8000829bbd90 x28: ffff80008224ecf0 x27: 0000000000000004
> [    7.136379] x26: ffff80008228ed30 x25: ffff80008228e000 x24: 0000000000000000
> [    7.137016] x23: f3ff000800a52280 x22: 0000000000000000 x21: ffff00087b6c7408
> [    7.137380] x20: ffff80008224b408 x19: 0000000000000005 x18: 0000000000000000
> [    7.137741] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> [    7.311316] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [    7.311673] x11: 0000000000000000 x10: 0000000000000000 x9 : 4000000000000000
> [    7.312031] x8 : 4000000000000002 x7 : 0000000000000000 x6 : 0000000000000000
> [    7.312387] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
> [    7.312740] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff8007f947c000
> [    7.313096] Call trace:
> [    7.313210]  ct_kernel_exit+0xa4/0xb0 (P)
> [    7.313445]  ct_idle_enter+0x14/0x28
> [    7.313666]  default_idle_call+0x2c/0x60
> [    7.313902]  do_idle+0xec/0x320
> [    7.314104]  cpu_startup_entry+0x40/0x50
> [    7.314331]  secondary_start_kernel+0x120/0x1a0
> 
> This behavior is specific to the arm64 architecture, where ct_nmi_enter()
> is called when handling a debug exception.
> In contrast, on other architectures, ct_nmi_enter() is not called when
> handling BUG().
> (i.e) when handling X86_TRAP_UD via handle_invalid_op(), it doesn't call
> ct_nmi_enter(). so it doesn’t cause any issues
> (While irq_entry_enter() does call ct_nmi_enter() for idle tasks,
> that doesn’t apply to debug exception handling).

It sounds like you're suggesting that we don't update the
context-tracking NMI state for BRK exceptions from EL1, to align
with x86. I think Ada's pending series might make that easier, but then
the patch you propose:

> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 529cff825531..9cf03b9ce691 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -227,8 +227,14 @@ void die(const char *str, struct pt_regs *regs, long err)
> 
>  	raw_spin_unlock_irqrestore(&die_lock, flags);
> 
> -	if (ret != NOTIFY_STOP)
> +	if (ret != NOTIFY_STOP) {
> +#ifdef CONFIG_CONTEXT_TRACKING_IDLE
> +		long nmi_nesting = ct_nmi_nesting();
> +		if (nmi_nesting && nmi_nesting != CT_NESTING_IRQ_NONIDLE)
> +			ct_nmi_exit();
> +#endif

tries to undo the context-tracking when we realise we're going to kill
the task, which feels like a hack.

Will

