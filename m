Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A623D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C//JOKMQQVhq74SdcbEm6r0tZ93bnR7w3Mc5YX+hJxg=; b=3n9kwl23x0Qg5vweb1Z1Y82lgr
	lrnxLdgjBDSYOG0MN3yTzElG3UfaxbUaYeexEqP1Dk134xuz2t6cPMsUyVFdo1PzTXczQm9lG+q4K
	WaBkO7MZHrbcJCCbXsxlWWl+mNpsuUBRCy8AR9+374nwK+a7O8EUJRgsCz1rS0HHKld0WYqx1Yurf
	vRnYcDtWsymXbR5HaWCJntUVhwqfMNawNChKGi8LfUNeuS8TTfHOqtELp1ZZ1VfXqH5Y3OS49t5zA
	uW/sE6/Cyg2HB7j/8flNmwsc7OowAwBQXsWK5qP5Q/ZPiqKH8fkRVMUlfm/tjqcAhAexNRX1rA8t0
	tRpWL1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0uw-00000003IXa-3QDI;
	Mon, 01 Dec 2025 10:14:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0uu-00000003IWu-1jvu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:14:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40082497;
	Mon,  1 Dec 2025 02:13:52 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 403413F73B;
	Mon,  1 Dec 2025 02:13:57 -0800 (PST)
Date: Mon, 1 Dec 2025 10:13:54 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	chris@zankel.net, jcmvbkbc@gmail.com, akpm@linux-foundation.org,
	macro@orcam.me.uk, charlie@rivosinc.com, deller@gmx.de,
	ldv@strace.io, rostedt@goodmis.org, tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: Avoid memcpy() for syscall_get_arguments()
Message-ID: <aS1qYhHhZK3CD_bU@J2N7QTR9R3>
References: <20251127123630.4149828-1-ruanjinjie@huawei.com>
 <20251127123630.4149828-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251127123630.4149828-3-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_021400_569423_BD9925AB 
X-CRM114-Status: GOOD (  17.96  )
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

On Thu, Nov 27, 2025 at 08:36:30PM +0800, Jinjie Ruan wrote:
> Do not use memcpy() to extract syscall arguments from struct pt_regs
> but rather just perform direct assignments.
> 
> The performance benchmarks with Generic Entry patch[1] with audit on
> from perf bench basic syscall on kunpeng920 gives roughly a 1%
> performance uplift and also aligns the implementation with
> x86 and RISC-V.
> 
> | Metric     | W/O this patch | With this patch | Change    |
> | ---------- | -------------- | --------------- | --------- |
> | Total time | 2.241 [sec]    | 2.211 [sec]     |  ↓1.36%   |
> | usecs/op   | 0.224157       | 0.221146        |  ↓1.36%   |
> | ops/sec    | 4,461,157      | 4,501,409       |  ↑0.9%    |
> 
> Before:
> <syscall_get_arguments.constprop.0>:
>        aa0103e2        mov     x2, x1
>        91002003        add     x3, x0, #0x8
>        f9408804        ldr     x4, [x0, #272]
>        f8008444        str     x4, [x2], #8
>        a9409404        ldp     x4, x5, [x0, #8]
>        a9009424        stp     x4, x5, [x1, #8]
>        a9418400        ldp     x0, x1, [x0, #24]
>        a9010440        stp     x0, x1, [x2, #16]
>        f9401060        ldr     x0, [x3, #32]
>        f9001040        str     x0, [x2, #32]
>        d65f03c0        ret
>        d503201f        nop
> 
> After:
>        a9408e82        ldp     x2, x3, [x20, #8]
>        2a1603e0        mov     w0, w22
>        f9400e84        ldr     x4, [x20, #24]
>        f9408a81        ldr     x1, [x20, #272]
>        9401c4ba        bl      ffff800080215ca8 <__audit_syscall_entry>

It's probably worth noting that __audit_syscall_entry() only takes 4
syscall arguments, and hence the compiler has elided the copy of
regs->regs[4] and regs->regs[5], which it apparently couldn't manage
before.

> [1]: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/syscall.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> index f3853047c28e..f3564ba97f7e 100644
> --- a/arch/arm64/include/asm/syscall.h
> +++ b/arch/arm64/include/asm/syscall.h
> @@ -82,9 +82,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  					 unsigned long *args)
>  {
>  	args[0] = regs->orig_x0;
> -	args++;
> -
> -	memcpy(args, &regs->regs[1], 5 * sizeof(args[0]));
> +	args[1] = regs->regs[1];
> +	args[2] = regs->regs[2];
> +	args[3] = regs->regs[3];
> +	args[4] = regs->regs[4];
> +	args[5] = regs->regs[5];
>  }

FWIW, I think this is clearer than the 'args++' and the memcpy(), so I'm
happy with this regardless of the performance concern.

However, as Dmitry says, we should keep this structurally the same as
syscall_set_arguments(), and so we should update that in the same way.

Mark.

