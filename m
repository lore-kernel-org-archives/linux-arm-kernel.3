Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D783DCEE341
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIVix5WvX9EQSjQTFslCxqneopeSe8orG20ZDYvlVaw=; b=PKozMPnrbAmdnQUKU0UsyW0/Z/
	fvkrjDl+wqz8z9hQZhcXATx/K9JSBourOJswQj+X3eHAGZfIcsijahx4H7wzs1Ny7KFyDJEFsmxa6
	s/JapELPOp+7tIYWWjWJ8LRnHUG9KVKgNMOQLYiDdwofONYyW/gCD3skM0Ygj9aS0KDcCWC0lBu4N
	qkkoc0wrVLxaoR77Z89H4pnJmAAK1S2RmItk+rui99He+yiKhxgKMr7gXrieJzCaG7jzoH0c/Mv1C
	nL9WVweR+v5pKWnPI+K+ZY2ZTielQj60cGW0hiFDupw/QH7MnQGwh91Fy6LH3xwv6I3reiSM0+ziX
	62iFUtWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPEJ-00000000p59-252t;
	Tue, 18 Nov 2025 17:10:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPEE-00000000p4V-1XQ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:10:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 649E91516;
	Tue, 18 Nov 2025 09:10:45 -0800 (PST)
Received: from [10.57.39.196] (unknown [10.57.39.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51BE83F66E;
	Tue, 18 Nov 2025 09:10:47 -0800 (PST)
Message-ID: <57c2c83c-9eea-40e0-9f95-47f21b1c75be@arm.com>
Date: Tue, 18 Nov 2025 18:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/11] arm64/ptrace: Refator el0_svc_common()
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 akpm@linux-foundation.org, ldv@strace.io, macro@orcam.me.uk, deller@gmx.de,
 mark.rutland@arm.com, song@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com, kmal@cock.li, lihongbo22@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
 <20251117133048.53182-4-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251117133048.53182-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_091056_325434_0B538B17 
X-CRM114-Status: GOOD (  25.20  )
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

In subject: s/refator/refactor/

Also nit: this is less about ptrace than about syscall entry, so maybe
"arm64/syscall:"?

On 17/11/2025 14:30, Jinjie Ruan wrote:
> Compared to the generic entry code, arm64 terminate the process

s/terminate/terminates/ (similar observation for other commit messages)

> after report_syscall_exit() if the syscall is issued within
> a restartable sequence.

Presumably this implies that forcing SIGSEGV before or after calling the
tracing handlers makes no difference, if so it should be clarified.

> In preparation for moving arm64 over to the generic entry code,
> refactor el0_svc_common() as below:
>
> - Extract syscall_exit_to_user_mode_prepare() to replace the
>   the combination of read_thread_flags() and syscall_trace_exit(),
>   also move the syscall exit check logic into it.
>
> - Move rseq_syscall() ahead, so the CONFIG_DEBUG_RSEQ check is
>   not needed.
>
> - Move has_syscall_work() helper into asm/syscall.h, which will be
>   reused by ptrace.c.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/syscall.h |  7 ++++++-
>  arch/arm64/kernel/ptrace.c       | 10 +++++++++-
>  arch/arm64/kernel/syscall.c      | 26 +++++---------------------
>  3 files changed, 20 insertions(+), 23 deletions(-)
>
> diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
> index d69f590a989b..6225981fbbdb 100644
> --- a/arch/arm64/include/asm/syscall.h
> +++ b/arch/arm64/include/asm/syscall.h
> @@ -114,7 +114,12 @@ static inline int syscall_get_arch(struct task_struct *task)
>  	return AUDIT_ARCH_AARCH64;
>  }
>  
> +static inline bool has_syscall_work(unsigned long flags)
> +{
> +	return unlikely(flags & _TIF_SYSCALL_WORK);
> +}
> +
>  int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags);
> -void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
> +void syscall_exit_to_user_mode_prepare(struct pt_regs *regs);
>  
>  #endif	/* __ASM_SYSCALL_H */
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index bbb868f6b292..95984bbf53db 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2403,7 +2403,7 @@ int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
>  	return regs->syscallno;
>  }
>  
> -void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
> +static void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
>  {
>  	audit_syscall_exit(regs);
>  
> @@ -2412,8 +2412,16 @@ void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
>  
>  	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
>  		report_syscall_exit(regs);
> +}
> +
> +void syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
> +{
> +	unsigned long flags = read_thread_flags();
>  
>  	rseq_syscall(regs);
> +
> +	if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
> +		syscall_trace_exit(regs, flags);

Since we're trying to align as much with the generic code as possible,
we might as well rename this function to syscall_exit_work() as well.

>  }
>  
>  /*
> diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
> index 6e3fe760e0bb..9713b038d750 100644
> --- a/arch/arm64/kernel/syscall.c
> +++ b/arch/arm64/kernel/syscall.c
> @@ -65,11 +65,6 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
>  	choose_random_kstack_offset(get_random_u16());
>  }
>  
> -static inline bool has_syscall_work(unsigned long flags)
> -{
> -	return unlikely(flags & _TIF_SYSCALL_WORK);
> -}
> -
>  static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
>  			   const syscall_fn_t syscall_table[])
>  {
> @@ -125,26 +120,15 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
>  		if (scno == NO_SYSCALL)
>  			syscall_set_return_value(current, regs, -ENOSYS, 0);
>  		scno = syscall_trace_enter(regs, regs->syscallno, flags);
> -		if (scno == NO_SYSCALL)
> -			goto trace_exit;

Why not keep the goto instead of duplicating the call? It could be
renamed if necessary.

- Kevin

> +		if (scno == NO_SYSCALL) {
> +			syscall_exit_to_user_mode_prepare(regs);
> +			return;
> +		}
>  	}
>  
>  	invoke_syscall(regs, scno, sc_nr, syscall_table);
>  
> -	/*
> -	 * The tracing status may have changed under our feet, so we have to
> -	 * check again. However, if we were tracing entry, then we always trace
> -	 * exit regardless, as the old entry assembly did.
> -	 */
> -	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
> -		flags = read_thread_flags();
> -		if (!has_syscall_work(flags) && !(flags & _TIF_SINGLESTEP))
> -			return;
> -	}
> -
> -trace_exit:
> -	flags = read_thread_flags();
> -	syscall_trace_exit(regs, flags);
> +	syscall_exit_to_user_mode_prepare(regs);
>  }
>  
>  void do_el0_svc(struct pt_regs *regs)

