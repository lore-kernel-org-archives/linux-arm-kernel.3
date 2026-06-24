Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05466CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 14:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xG8EMFeVhGasRYPKVnx7TFUGEcTMXpQJ816rfp051y0=; b=vZzLcxl9BBwjXp
	hVcA3YUgExdFcSxQ5bf5WweFO5bGL9fVyV0X9kCU1G3J7U9a96OmZKLpDlT2c2MqjMPz5oW3oK4de
	2y0wlGa8ugnbNS6d0t9fNyKEhs17FVTPf8ZNn7ruODNqmZ4DAmihOLFmGueoROdLchC7m3QQKXrZM
	taQq1BrPlrZhU/4dYI6K4yrItE7Pkh60fLeYZe7hDr5L7uODZL8pX0VrG2Ty7y2GHPr8IW9tHDVJP
	kxbmeOUOJZdAchJ78budyN8zR3VZvdFXpckkQwkGJsGlRGFOo2z8scHHhDRperElrrQ4rq2P/Krlt
	ekW1i72VS8llacDfw0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOjb-00000007vQW-1fEQ;
	Wed, 24 Jun 2026 14:37:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOjX-00000007vPx-3SoZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 14:37:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24C4316F8;
	Wed, 24 Jun 2026 07:37:38 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEEF63F62B;
	Wed, 24 Jun 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782311862; bh=IhdOzyYXv5nEsX/+9fyXolNPwse17GhTsUX6FORTq0s=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=OgfTHXMYQ36PY4w33tIznk2U9ffS76wkD1HB1ZeAW/ZWTipQeAPJq9S7boJV4n9MK
	 OkqZu5QRDdjbnr4JpgsxO+VhkqRBRpIrZbc4Ggpz7/ZacRRvXEbDu0t0k+dX5Z/vEQ
	 vVmc2qyBPwrS0xzsTwvaPPew1X39CQ59e4lwfqJc=
Message-ID: <768cc347-c42f-411d-90c3-bfaa39afeaf7@arm.com>
Date: Wed, 24 Jun 2026 15:37:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 07/11] arm64: syscall: Introduce
 syscall_exit_to_user_mode_work()
To: Jinjie Ruan <ruanjinjie@huawei.com>, mark.rutland@arm.com
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-8-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20260511092103.1974980-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_073744_037974_35D59E40 
X-CRM114-Status: GOOD (  37.64  )
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
Cc: peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, will@kernel.org, kees@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, oleg@redhat.com, linux-kernel@vger.kernel.org, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, linusw@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/05/2026 10:20, Jinjie Ruan wrote:
> Refactor the system call exit path to align with the generic entry
> framework. This consolidates thread flag checking, rseq handling, and
> syscall tracing into a structure that mirrors the generic
> syscall_exit_to_user_mode_work() implementation.
>
> [Rationale]
> The generic entry code employs a hierarchical approach for
> syscall exit work:
>
> 1. syscall_exit_to_user_mode_work(): The entry point that handles
>     rseq and checks if further exit work (tracing/audit) is required.
>
> 2. syscall_exit_work(): Performs the actual tracing, auditing, and
>     ptrace reporting.
>
> [Changes]
> - Rename and Encapsulate: Rename syscall_trace_exit() to
>    syscall_exit_work() and make it static, as it is now an internal
>    helper for the exit path.
>
> - New Entry Point: Implement syscall_exit_to_user_mode_work() to
>    replace the manual flag-reading logic in el0_svc_common(). This
>    function now encapsulates the rseq_syscall() call and the
>    conditional execution of syscall_exit_work().
>
> - Simplify el0_svc_common(): Remove the complex conditional checks
>    for tracing and CONFIG_DEBUG_RSEQ at the end of the syscall path,
>    delegating this responsibility to the new helper.
It is indeed simpler, however to me there are two changes to the behaviour,
which are not called out (apologies if I missed some prior discussion
when I looked for some) :
1. As pointed by the removed comment, in mainline we *always* trace on exit
    if we traced on entry. This is why there are two 
`has_syscall_work()` checks
    on exit, with a re-read of the flags after syscall execution in between.
    This change only checks once on exit after updating the flags, so if
    there was work on entry but the flags got cleared, it *won't* trace 
on exit.
    Is this desired ? Can this change of behaviour have an impact ?
> - Helper Migration: Move has_syscall_work() to asm/syscall.h
>    to allow its reuse across ptrace.c and syscall.c.
>
> - Clean up RSEQ: Remove the explicit IS_ENABLED(CONFIG_DEBUG_RSEQ)
>    check in the caller, as rseq_syscall() is already a no-op when the
>    config is disabled.
2. `rseq_syscall()` is indeed a no-op, but removing the explicit check here
    does change the behaviour : in mainline we *always* trace on exit if
    `CONFIG_DEBUG_RSEQ` is enabled, bypassing the `has_syscall_work()` 
check.
    This change does not bypass the `has_syscall_work()` check if
    `CONFIG_DEBUG_RSEQ` is enabled, so there might be a change of behaviour.
    Same questions as above : is this change desired ? Can it have an 
impact ?

I understand that the change is to align with the generic entry, but it 
seems
like this could have an impact that I do not really understand, so I prefer
asking !

Apart from the above everything looks OK to me, but I'd like
some confirmation that the change of behaviours either do not exist or 
are OK !

Thanks,
Ada

> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v15
> - Make syscall_exit_to_user_mode_work() __always_inline to keep
>    the fast-path performance as Sashiko pointed out.
> ---
>   arch/arm64/include/asm/syscall.h | 18 +++++++++++++++++-
>   arch/arm64/kernel/ptrace.c       |  5 +----
>   arch/arm64/kernel/syscall.c      | 20 +-------------------
>   3 files changed, 19 insertions(+), 24 deletions(-)
>
> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> index 30b203ef156b..b331e09b937f 100644
> --- a/arch/arm64/include/asm/syscall.h
> +++ b/arch/arm64/include/asm/syscall.h
> @@ -8,6 +8,7 @@
>   #include <uapi/linux/audit.h>
>   #include <linux/compat.h>
>   #include <linux/err.h>
> +#include <linux/rseq.h>
>   
>   typedef long (*syscall_fn_t)(const struct pt_regs *regs);
>   
> @@ -121,6 +122,21 @@ static inline int syscall_get_arch(struct task_struct *task)
>   }
>   
>   int syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
> -void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
> +void syscall_exit_work(struct pt_regs *regs, unsigned long flags);
> +
> +static inline bool has_syscall_work(unsigned long flags)
> +{
> +	return unlikely(flags & _TIF_SYSCALL_WORK);
> +}
> +
> +static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
> +{
> +	unsigned long flags = read_thread_flags();

			^-- This only reflects the post-syscall flags

> +
> +	rseq_syscall(regs);
> +
> +	if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
> +		syscall_exit_work(regs, flags);
> +}
>   
>   #endif	/* __ASM_SYSCALL_H */
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 15a45eeb56da..256aa20377e1 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -28,7 +28,6 @@
>   #include <linux/hw_breakpoint.h>
>   #include <linux/regset.h>
>   #include <linux/elf.h>
> -#include <linux/rseq.h>
>   
>   #include <asm/compat.h>
>   #include <asm/cpufeature.h>
> @@ -2454,10 +2453,8 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
>   	return syscall;
>   }
>   
> -void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
> +void syscall_exit_work(struct pt_regs *regs, unsigned long flags)
>   {
> -	rseq_syscall(regs);
> -
>   	audit_syscall_exit(regs);

	 ^-- This was always called if entry had work or CONFIG_DEBUG_RSEQ was enabled,
	     which is not the case anymore (same for the rest of the function)

>   
>   	if (flags & _TIF_SYSCALL_TRACEPOINT)
> diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
> index f6f87b042995..dac7bcc4bbdf 100644
> --- a/arch/arm64/kernel/syscall.c
> +++ b/arch/arm64/kernel/syscall.c
> @@ -54,11 +54,6 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
>   	syscall_set_return_value(current, regs, 0, ret);
>   }
>   
> -static inline bool has_syscall_work(unsigned long flags)
> -{
> -	return unlikely(flags & _TIF_SYSCALL_WORK);
> -}
> -
>   static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
>   			   const syscall_fn_t syscall_table[])
>   {
> @@ -120,21 +115,8 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
>   	}
>   
>   	invoke_syscall(regs, scno, sc_nr, syscall_table);
> -
> -	/*
> -	 * The tracing status may have changed under our feet, so we have to
> -	 * check again. However, if we were tracing entry, then we always trace
> -	 * exit regardless, as the old entry assembly did.
> -	 */
> -	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {

					  ^-- We always traced exit if CONFIG_DEBUG_RSEQ is enabled
	     ^-- `flags` is unchanged since entry, and exit was always traced if there was work.

> -		flags = read_thread_flags();
> -		if (!has_syscall_work(flags) && !(flags & _TIF_SINGLESTEP))
> -			return;
> -	}
> -
>   trace_exit:
> -	flags = read_thread_flags();
> -	syscall_trace_exit(regs, flags);
> +	syscall_exit_to_user_mode_work(regs);
>   }
>   
>   void do_el0_svc(struct pt_regs *regs)

