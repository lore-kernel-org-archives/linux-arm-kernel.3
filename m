Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D6BC44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8nGVDCT8nrnBM5hXodvr6ytY8ni1kRQkp0Y6K87ybY=; b=uMq8OrjnsoesnaXV6tvCw+Vh67
	saxaIRQoAL6Cp1dGX9nJzqKV6eYvcdyp+/VszJyzx/s+cuOEACcxwH5U/rUIh+zUa/3EsDzsuc4i7
	FPYPVtQTs4mRy62dDClGRv0QF8lWg6Mw+Il4Q1Bw5Jr6W9mMkfbEg+kKSJ+jaKCcTaB5tGIP1buZZ
	sFf+8Q4Z78wH3PitQztrpqre+B78tH+LcBbV5MPjXTpqTe6ZHsW+h//oHlAxKxHlFuHkA81oMfFNc
	zu6ruVyEKharZxeVPA7KpvZKRfFBXc42ybGPGRqOnxzKdiz8lHC6C1mBlLTpp5UhORGj+PCbzDVfb
	k/I/2GXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmB5p-00000009bWU-48Qp;
	Tue, 21 Jul 2026 14:05:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmB5n-00000009bWH-3dEy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:05:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6556600D8;
	Tue, 21 Jul 2026 14:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E967D1F000E9;
	Tue, 21 Jul 2026 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642706;
	bh=d8nGVDCT8nrnBM5hXodvr6ytY8ni1kRQkp0Y6K87ybY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KSMdw/tPhe2IZD0LT6nPHFeQYsQzRfom5nSFHCg3AC4uAHM2z3AXwwe3nLT9FOiQS
	 ps2xxu93g7+JeHzzqRJQKjZdZE6dYwTAAiBawthwdl66GpzqJBNdjkicIT+4EpTXVL
	 vZ9RuMua0mng2/WfrQPvjrebixP2succFbvlfTpTg/bm7Y6PgQ2Yj0EfI98Ld7o99O
	 hWqXFdLjT8LkudaRp2hj28Wmp5nl56HQOd6ILZLo48Zu9Yvb/m5MpKt9vgSdqswIl8
	 KNF5vXGVg4i8xN0EMlnVJnbXrHx2Ae9QfOTd7zl460YrsqlMimJhRr3mLM4wdRW9tN
	 LETm5kTtIDhrg==
Date: Tue, 21 Jul 2026 15:05:01 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Yiqi Sun <sunyiqixm@gmail.com>
Subject: Re: [PATCH v2] arm64: syscall: Ensure saved x0 is kept in-sync with
 tracer updates
Message-ID: <al98jdcleu-6tMDL@willie-the-truck>
References: <20260716120640.6590-1-will@kernel.org>
 <178420908877.33796.2351583216856259313.b4-ty@kernel.org>
 <alpsSRyTU_mquZyA@willie-the-truck>
 <8d3d3ea7-b250-4022-8ed7-6d438b43a518@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d3d3ea7-b250-4022-8ed7-6d438b43a518@huawei.com>
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

Hi Jinjie,

On Mon, Jul 20, 2026 at 11:48:40AM +0800, Jinjie Ruan wrote:
> On 7/18/2026 1:54 AM, Will Deacon wrote:
> > On Thu, Jul 16, 2026 at 05:48:01PM +0100, Will Deacon wrote:
> >> On Thu, 16 Jul 2026 13:06:39 +0100, Will Deacon wrote:
> >>> When seccomp support was originally added to arm64 in a1ae65b21941
> >>> ("arm64: add seccomp support"), seccomp was erroneously called _before_
> >>> the ptrace syscall-enter-stop and therefore the tracer could trivially
> >>> manipulate the syscall register state after the seccomp check had
> >>> passed. This was subsequently fixed in a5cd110cb836 ("arm64/ptrace: run
> >>> seccomp after ptrace") by moving the seccomp check after the tracer has
> >>> run. Unfortunately, a decade later, that fix has been reported to be
> >>> incomplete.
> >>>
> >>> [...]
> >>
> >> Applied to arm64 (for-next/fixes), thanks!
> >>
> >> [1/1] arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
> >>       https://git.kernel.org/arm64/c/e057b9477232
> > 
> > Bah, I've had to revert this. I think Sashiko makes a good point here
> > that the seccomp interaction is still broken when the filter is
> > re-evaluated after the tracer stop, because that all happens inside
> > secure_computing() so we don't get a chance to update 'orig_x0':
> > 
> > https://sashiko.dev/#/patchset/20260716120640.6590-1-will@kernel.org
> > 
> 
> Yes, I also think the point raised by Sashiko is meaningful.
> 
> After reviewing the relevant code, I believe that the issue Sashiko
> pointed out regarding the compat task also exists.
> 
> My confusion is that on arm64 compat mode, both audit and trace use
> orig_x0, but the first parameter used for executing system calls is
> regs->reg[0]. If x0 is modified at the system call entry point in ptrace
> but orig_x0 is not modified, or if orig_x0 is modified but x0 is not,
> then the first parameter for audit and the actual system call being
> executed will be out of sync. Could there be any issues here? Is it the
> responsibility of ptrace to ensure that orig_x0 and x0 are synchronized
> at the system call entry point on arm64 compat mode?

Even with orig_r0, I think compat suffers from some similar issues here.
However, I really don't want to diverge from the arch/arm/ behaviour, so
the 32-bit code should be fixed first if we want to change anything there.
Having said that, I notice we're already different in how we invoke
audit_syscall_entry() :(

I also don't know what the correct behaviour should be when both r0 and
orig_r0 are exposed to the tracer. I have a horrible feeling it probably
all worked until the API in syscall.h came along, at which point orig_r0
was suddenly used for more than restarting.

> Whether it is ptrace or the kernel, ensuring that orig_x0 and x0 are
> synchronized at the entry point of a system call, I believe it is
> reasonable to use orig_x0 as the first parameter of the system call
> execution and pre-set an error code in advance, as this way orig_x0
> always retains the latest value of x0.
> 
> diff --git a/arch/arm64/include/asm/syscall_wrapper.h
> b/arch/arm64/include/asm/syscall_wrapper.h
> index abb57bc54305..6b13d7c8ad95 100644
> --- a/arch/arm64/include/asm/syscall_wrapper.h
> +++ b/arch/arm64/include/asm/syscall_wrapper.h
> @@ -12,7 +12,7 @@
> 
>  #define SC_ARM64_REGS_TO_ARGS(x, ...)                          \
>         __MAP(x,__SC_ARGS                                       \
> -             ,,regs->regs[0],,regs->regs[1],,regs->regs[2]     \
> +             ,,regs->orig_x0,,regs->regs[1],,regs->regs[2]     \
>               ,,regs->regs[3],,regs->regs[4],,regs->regs[5])

I quite like this idea, but I think we'll have to limit it to native
(64-bit) tasks. The 32-bit code in arch/arm/ looks like it passes
regs[0] for the first argument and so tracers could easily be relying on
that.

I'll do that as a follow-up patch.

>  #ifdef CONFIG_COMPAT
> diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
> index 2535cae9413d..a978bab59924 100644
> --- a/arch/arm64/kernel/syscall.c
> +++ b/arch/arm64/kernel/syscall.c
> @@ -62,6 +62,7 @@ static __always_inline void el0_svc_common(struct
> pt_regs *regs, int scno, int s
>         unsigned long work;
> 
>         regs->orig_x0 = regs->regs[0];
> +       syscall_set_return_value(current, regs, -ENOSYS, 0);

I don't think it's safe to do this unconditionally as tracers could be
relying on reading X0 with ptrace to retrieve the first syscall argument.

Will

