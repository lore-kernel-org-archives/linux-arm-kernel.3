Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32237C28B22
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eg4OOux6ni9f04EijjEgVYXAKV0hU2H4rxo1TxR8dY=; b=zwwAHEXhpembIU/yRFLRI6EfuY
	uX6Nnpou27MP6kbjgfTXb/1UPZja87ZD+n0JrKC8PT88mQAq8JOOARk1QoPcHVVjLN9L8fynDqpw/
	yPKaj77jHDWsERfnr6wUbXO57+mF7Xbc8m/8NQMdYI+0js2vJQU0xPab5ez/8nKKxUuuYMJ3lcVBi
	R2Zq1rOGYNEPptmmHBBhzddauVdfrRcRfBqI6N2cfdx8feefqaqQhoQqTBVfZz3nTNgR04LrY7HPw
	jJHeW2PJugQ10xobc6l60RB/E8IYsnMBW8prV73ssKsMWjASwLBDFU0P71YhJ2DhjKjAUhaip7pNw
	JN1wOHoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tposZ-00000008Cc8-0BQM;
	Wed, 05 Mar 2025 13:33:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnf8-00000007z2U-3yUO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 12:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4eg4OOux6ni9f04EijjEgVYXAKV0hU2H4rxo1TxR8dY=; b=oE+jLL8Gmp4PBjOVsMlr4aPvHc
	oYRgMeOAANzeyxiULpv97Znxw2fpXbC0imw9oEqHWWZua97GusiOBDV7IrszQ+mdNArzqlOi7UGf8
	pNm1x286E0cQXzDZcMW2xF7CHjXmyMzb4j0sRAatSmPF2OnG1WzX9jP3hzBwPczb17oIPf5QpBPYY
	lTIgDcEhHzxjasyHbq4lTUDYuEejUsMmEOl2OqA6EaDMrZHG2LgtLXP05YbeiJOcU2NVYiPvLx4Ta
	edhtgS/a1+VsSuqR7NmswLLRa54WvyP5wu1MyijXsCiPTnvHsxbDKQ8lQlKUalcq0XDMlgmy10JVQ
	DfeBUA1w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnf5-00000000W5C-2MDz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 12:15:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B18F5FEC;
	Wed,  5 Mar 2025 04:15:54 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7417A3F66E;
	Wed,  5 Mar 2025 04:15:38 -0800 (PST)
Date: Wed, 5 Mar 2025 12:15:35 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Valentin Schneider <vschneid@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-users@vger.kernel.org, Mike Galbraith <efault@gmx.de>,
	Peter Collingbourne <pcc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Petr Tesarik <ptesarik@suse.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Juri Lelli <juri.lelli@redhat.com>, Phil Auld <pauld@redhat.com>
Subject: Re: [PATCH 1/1] arm64: enable PREEMPT_LAZY
Message-ID: <Z8hAZ09Q40fxLJSk@J2N7QTR9R3>
References: <20250305104925.189198-1-vschneid@redhat.com>
 <20250305104925.189198-2-vschneid@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305104925.189198-2-vschneid@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_121543_926698_D4D83055 
X-CRM114-Status: GOOD (  27.74  )
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

On Wed, Mar 05, 2025 at 11:49:25AM +0100, Valentin Schneider wrote:
> From: Mark Rutland <mark.rutland@arm.com>
> 
> For an architecture to enable CONFIG_ARCH_HAS_RESCHED_LAZY, two things are
> required:
> 1) Adding a TIF_NEED_RESCHED_LAZY flag definition
> 2) Checking for TIF_NEED_RESCHED_LAZY in the appropriate locations
> 
> 2) is handled in a generic manner by CONFIG_GENERIC_ENTRY, which isn't
> (yet) implemented for arm64. However, outside of core scheduler code,
> TIF_NEED_RESCHED_LAZY only needs to be checked on a kernel exit, meaning:
> o return/entry to userspace.
> o return/entry to guest.
> 
> The return/entry to a guest is all handled by xfer_to_guest_mode_handle_work()
> which already does the right thing, so it can be left as-is.
> 
> arm64 doesn't use common entry's exit_to_user_mode_prepare(), so update its
> return to user path to check for TIF_NEED_RESCHED_LAZY and call into
> schedule() accordingly.
> 
> Link: https://lore.kernel.org/linux-rt-users/20241216190451.1c61977c@mordecai.tesarici.cz/
> Link: https://lore.kernel.org/all/xhsmh4j0fl0p3.mognet@vschneid-thinkpadt14sgen2i.remote.csb/
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> [testdrive, _TIF_WORK_MASK fixlet and changelog.]
> Signed-off-by: Mike Galbraith <efault@gmx.de>
> [Another round of testing; changelog faff]
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---
>  arch/arm64/Kconfig                   |  1 +
>  arch/arm64/include/asm/thread_info.h | 16 +++++++++-------
>  arch/arm64/kernel/entry-common.c     |  2 +-
>  3 files changed, 11 insertions(+), 8 deletions(-)

Catalin, Will, given this is small and self-contained, I reckon it makes
sense to pick this up ahead of Jinjie's series to move arm64 over to the
generic entry library (which is on my queue of things to review). Even
if we pick up both, it'll be easier to bisect and debug issues caused by
this patch alone.

The fixes/cleanups from Mike and Valentin look right to me, so FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fcdd0ed3eca89..7789d7fb6f191 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -41,6 +41,7 @@ config ARM64
>  	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>  	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>  	select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
> +	select ARCH_HAS_PREEMPT_LAZY
>  	select ARCH_HAS_PTE_DEVMAP
>  	select ARCH_HAS_PTE_SPECIAL
>  	select ARCH_HAS_HW_PTE_YOUNG
> diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
> index 1114c1c3300a1..4443ef2789758 100644
> --- a/arch/arm64/include/asm/thread_info.h
> +++ b/arch/arm64/include/asm/thread_info.h
> @@ -59,11 +59,12 @@ void arch_setup_new_exec(void);
>  
>  #define TIF_SIGPENDING		0	/* signal pending */
>  #define TIF_NEED_RESCHED	1	/* rescheduling necessary */
> -#define TIF_NOTIFY_RESUME	2	/* callback before returning to user */
> -#define TIF_FOREIGN_FPSTATE	3	/* CPU's FP state is not current's */
> -#define TIF_UPROBE		4	/* uprobe breakpoint or singlestep */
> -#define TIF_MTE_ASYNC_FAULT	5	/* MTE Asynchronous Tag Check Fault */
> -#define TIF_NOTIFY_SIGNAL	6	/* signal notifications exist */
> +#define TIF_NEED_RESCHED_LAZY	2	/* Lazy rescheduling needed */
> +#define TIF_NOTIFY_RESUME	3	/* callback before returning to user */
> +#define TIF_FOREIGN_FPSTATE	4	/* CPU's FP state is not current's */
> +#define TIF_UPROBE		5	/* uprobe breakpoint or singlestep */
> +#define TIF_MTE_ASYNC_FAULT	6	/* MTE Asynchronous Tag Check Fault */
> +#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
>  #define TIF_SYSCALL_TRACE	8	/* syscall trace active */
>  #define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
>  #define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
> @@ -85,6 +86,7 @@ void arch_setup_new_exec(void);
>  
>  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
>  #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
> +#define _TIF_NEED_RESCHED_LAZY	(1 << TIF_NEED_RESCHED_LAZY)
>  #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
>  #define _TIF_FOREIGN_FPSTATE	(1 << TIF_FOREIGN_FPSTATE)
>  #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
> @@ -100,10 +102,10 @@ void arch_setup_new_exec(void);
>  #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
>  #define _TIF_TSC_SIGSEGV	(1 << TIF_TSC_SIGSEGV)
>  
> -#define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
> +#define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY | \
>  				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
>  				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
> -				 _TIF_NOTIFY_SIGNAL)
> +				 _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING)
>  
>  #define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
>  				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index b260ddc4d3e9a..7993fab0cab4c 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -132,7 +132,7 @@ static void do_notify_resume(struct pt_regs *regs, unsigned long thread_flags)
>  	do {
>  		local_irq_enable();
>  
> -		if (thread_flags & _TIF_NEED_RESCHED)
> +		if (thread_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
>  			schedule();
>  
>  		if (thread_flags & _TIF_UPROBE)
> -- 
> 2.43.0
> 

