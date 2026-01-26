Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192A4D19501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNit3TAYA5iWQoP+9Fw/A3QojwtlF6fg/wiqRzSychc=; b=YTpMJjkXjJB8YF/ZUr+1wz+aFm
	33UAD9254+8LLcM3LRmDkoLlHlfIB8lArYmd/96Az7H4BSN1I4Mi7s1Hj8ZYXTKPFCJKKZQWmqLKW
	BzZ0RVOp35dpcQLtaNeuz6VIhkL2eGNj1+TDRa2kMq2OSP5hqg+xx8dkl8ItzLrOfjhXMzpB9Lfmb
	CSVYVz6c3udH3xM9PjoKvAjo85tuU1jdGX59xA+qZzYFuNYevdYwpz6QHo00Wjha8y71/82PSvcXr
	HS40gjjVjsD2WZ+AXvoQO882Lf7hwAL7nySvfl8PWsoZxDrYVaJYeMJr5T1JfhGYMLkZ96kdyPVvw
	I7tLCJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPfl-0000000Csda-0pjZ;
	Mon, 26 Jan 2026 16:42:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPfk-0000000CsdJ-0ENr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:42:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20D4760121;
	Mon, 26 Jan 2026 16:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D924C116C6;
	Mon, 26 Jan 2026 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769445758;
	bh=PJaTUfkdd4haptrZxquY4mIde87ex5by4Uui9ExW1qA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFG79mBikd6dMwuEXIWR1hwu+xUuVP0S380vYBICICSY2TPaqeyiGkwiP2oEV5Yty
	 w+nIAJaECaAw4Gu/QlhL6zlTcMOdQoK70hKj7Wb4ppUc0kNm/j1EhePFDy7HDjiYZs
	 R5wcd1Tt8phjNKwSPUzkUAocVPmOk/jqjPPLUKFMBpBmi9wdWZnZp8oJ4O4k6nyssX
	 YRi1Z0dHndWol37MKCzp1Ugy0hKffbkNC0fgfQA1mVjFQH4lXP5s/LlE+KJNZxWu+c
	 FkAbH3OxCJJkGCCLFu7vFjXqeApvtSFaHGhPMKQ3dAUYk5++VZNPavVAYKbIHd09FT
	 9SLCze+1VCxHg==
Date: Mon, 26 Jan 2026 16:42:30 +0000
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v10 04/16] arm64/ptrace: Refactor
 syscall_trace_enter/exit()
Message-ID: <aXeZdh3CtznU8u6L@willie-the-truck>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
 <20251222114737.1334364-5-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222114737.1334364-5-ruanjinjie@huawei.com>
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, kmal@cock.li, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, charlie@rivosinc.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, tglx@linutronix.de, richard.weiyang@gmail.com, dvyukov@google.com, wad@chromium.org, oleg@redhat.com, linux-kernel@vger.kernel.org, liqiang01@kylinos.cn, akpm@linux-foundation.org, reddybalavignesh9979@gmail.com, macro@orcam.me.uk
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Dec 22, 2025 at 07:47:25PM +0800, Jinjie Ruan wrote:
> The generic syscall entry code has the following form, which use
> the input syscall work flag and syscall number:
> 
> | syscall_trace_enter(struct pt_regs *regs, long syscall,
> |		      unsigned long work)
> |
> | syscall_exit_work(struct pt_regs *regs, unsigned long work)
> 
> In preparation for moving arm64 over to the generic entry code,
> refactor syscall_trace_enter/exit() to also pass thread flags, and
> get syscall number by syscall_get_nr() helper.
> 
> No functional changes.
> 
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/syscall.h |  4 ++--
>  arch/arm64/kernel/ptrace.c       | 25 ++++++++++++++++---------
>  arch/arm64/kernel/syscall.c      |  5 +++--
>  3 files changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> index 5e4c7fc44f73..cef1d9ce6e1b 100644
> --- a/arch/arm64/include/asm/syscall.h
> +++ b/arch/arm64/include/asm/syscall.h
> @@ -120,7 +120,7 @@ static inline int syscall_get_arch(struct task_struct *task)
>  	return AUDIT_ARCH_AARCH64;
>  }
>  
> -int syscall_trace_enter(struct pt_regs *regs);
> -void syscall_trace_exit(struct pt_regs *regs);
> +int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags);
> +void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
>  
>  #endif	/* __ASM_SYSCALL_H */
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index f333791ffba6..79762ff33945 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2407,9 +2407,8 @@ static void report_syscall_exit(struct pt_regs *regs)
>  	}
>  }
>  
> -int syscall_trace_enter(struct pt_regs *regs)
> +int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
>  {
> -	unsigned long flags = read_thread_flags();
>  	int ret;
>  
>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
> @@ -2422,19 +2421,27 @@ int syscall_trace_enter(struct pt_regs *regs)
>  	if (secure_computing() == -1)
>  		return NO_SYSCALL;
>  
> -	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
> -		trace_sys_enter(regs, regs->syscallno);
> +	/* Either of the above might have changed the syscall number */
> +	syscall = syscall_get_nr(current, regs);

I understand that you're gradually making the arch code more similar to
the core code so that we can switch over to it, but I'm struggling to
understand why syscall_trace_enter() takes the 'syscall' argument.

Even the core code just seems to use it as a local variable, which it
overrides before it ever uses it. What am I missing?

Will

