Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28112CEE33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYBHLIUBUHF4NLOeEbJw0PAhkbhvlW7vx+Gg28sGeU0=; b=hgk+XmPOIAyLYhUvhn8JeJO41H
	KIOfFuPLWv9dYxpKvifIWKxfLS/xzBtzQeNhlN/J/mlzqDUWYrs/UombnJPAHGB3EskKJ0GnCG9lW
	ukelNM4Rx9fFQR7pX0+Ookge94gCsYKWc81psOkbsD/QqoKpLlrtSCOUBY4QhZhwtu6a3JLvVq+h0
	yphV909Os/pQJZqoatczshDOmQR+AjeJ8zIve9LyYXtXK7RZoYgYvqbnEd05qGb3ti/se9KVzhUGv
	qkX4r1mNcmufRYhe4cZbpLHu9QNpH1Z/+5JUCbtAArP0R/996YqzLwBnHozEYJFnEV/OgRNnSRqG2
	V/THMdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPDM-00000000ovr-0BCq;
	Tue, 18 Nov 2025 17:10:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPDK-00000000ovK-1C7N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:09:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7114A1007;
	Tue, 18 Nov 2025 09:09:49 -0800 (PST)
Received: from [10.57.39.196] (unknown [10.57.39.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37B5E3F66E;
	Tue, 18 Nov 2025 09:09:52 -0800 (PST)
Message-ID: <4984d8e6-1431-4dcc-9723-c5470b5bcd49@arm.com>
Date: Tue, 18 Nov 2025 18:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64/ptrace: Refactor
 syscall_trace_enter/exit()
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
 <20251117133048.53182-3-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251117133048.53182-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_090958_368782_B1DDEB3C 
X-CRM114-Status: GOOD (  14.91  )
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

On 17/11/2025 14:30, Jinjie Ruan wrote:
> [...]
>
> @@ -2386,19 +2384,27 @@ int syscall_trace_enter(struct pt_regs *regs)
>  	if (secure_computing() == -1)
>  		return NO_SYSCALL;
>  
> -	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
> -		trace_sys_enter(regs, regs->syscallno);
> +	/* Either of the above might have changed the syscall number */
> +	syscall = syscall_get_nr(current, regs);
> +
> +	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT)) {
> +		trace_sys_enter(regs, syscall);
>  
> -	audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1],
> +		/*
> +		 * Probes or BPF hooks in the tracepoint may have changed the
> +		 * system call number as well.
> +		 */
> +		 syscall = syscall_get_nr(current, regs);
> +	}
> +
> +	audit_syscall_entry(syscall, regs->orig_x0, regs->regs[1],
>  			    regs->regs[2], regs->regs[3]);
>  
>  	return regs->syscallno;

It would be good to align the return with the generic version as well.

>  }
>  
> -void syscall_trace_exit(struct pt_regs *regs)
> +void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
>  {
> -	unsigned long flags = read_thread_flags();
> -
>  	audit_syscall_exit(regs);
>  
>  	if (flags & _TIF_SYSCALL_TRACEPOINT)
> diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
> index aba7ca6bca2d..6e3fe760e0bb 100644
> --- a/arch/arm64/kernel/syscall.c
> +++ b/arch/arm64/kernel/syscall.c
> @@ -124,7 +124,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
>  		 */
>  		if (scno == NO_SYSCALL)
>  			syscall_set_return_value(current, regs, -ENOSYS, 0);
> -		scno = syscall_trace_enter(regs);
> +		scno = syscall_trace_enter(regs, regs->syscallno, flags);

Nit: could use scno instead of regs->syscallno.

- Kevin

>  		if (scno == NO_SYSCALL)
>  			goto trace_exit;
>  	}
> @@ -143,7 +143,8 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
>  	}
>  
>  trace_exit:
> -	syscall_trace_exit(regs);
> +	flags = read_thread_flags();
> +	syscall_trace_exit(regs, flags);
>  }
>  
>  void do_el0_svc(struct pt_regs *regs)

