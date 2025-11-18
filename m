Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789DDCEE341
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7eJ5hJBlt7c4B4di5d+Js72tP1QdBc/i0mzeTtCatQ=; b=UcWiIgbuPFAvvMauf29sUWyMUf
	h8j5ew5l8l06Gt64tZwjY//cpTGSqV9tRYuChyUmcQJ6r/iksDEGjAzBoO3fQDVuZNkcKRr1T5pFZ
	SVih2a5VyLhIj78czcIq83UQlYmFsf/2yAbHRODLSWUmsHe6pKunXCdDbKnPw38RA3dodhouCG1bb
	5NcPmtN/caCxnyPX+1kRoEmGUJErcH6X+Nhg6TczsE5Ol4sZfVCRsPdJZob0YjojCOjyoMS4/6JsX
	YYKA4p5ckq8Bo0ZsrB46uGZ2sdSRSz+FSzitGXWZ19/9Jn/TbxubvdHq6X/dRR6Vkzyofpex6wHOV
	+6pIe2bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPFY-00000000pMh-0nMB;
	Tue, 18 Nov 2025 17:12:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPFU-00000000pLn-3L06
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:12:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 921DB1596;
	Tue, 18 Nov 2025 09:12:04 -0800 (PST)
Received: from [10.57.39.196] (unknown [10.57.39.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90A1D3F66E;
	Tue, 18 Nov 2025 09:12:07 -0800 (PST)
Message-ID: <ba8450ad-e5ab-4b4f-868f-9b0da274f406@arm.com>
Date: Tue, 18 Nov 2025 18:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/11] arm64/ptrace: Handle
 ptrace_report_syscall_entry() error
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
 <20251117133048.53182-6-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251117133048.53182-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_091212_952403_E666E952 
X-CRM114-Status: GOOD (  21.38  )
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
> The generic entry handle error of ptrace_report_syscall_entry(), but
> arm64 not.

This suggests that arm64 ignores the error completely, which isn't the
case: no syscall will be performed, but tracing will still occur as normal.

What this patch seems to be doing is to abort the _enter sequence if
ptrace_report_syscall_entry() errors out. The commit title and message
should be reworded accordingly.

> As the comment said, the calling arch code should abort the system

Which comment?

> call and must prevent normal entry so no system call is
> made if ptrace_report_syscall_entry() return nonzero.

This is already the case since we're calling forget_syscall().

> In preparation for moving arm64 over to the generic entry code,
> return early if ptrace_report_syscall_entry() encounters an error.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/ptrace.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 95984bbf53db..707951ad5d24 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2317,10 +2317,10 @@ enum ptrace_syscall_dir {
>  	PTRACE_SYSCALL_EXIT,
>  };
>  
> -static void report_syscall_enter(struct pt_regs *regs)
> +static int report_syscall_enter(struct pt_regs *regs)
>  {
> -	int regno;
>  	unsigned long saved_reg;
> +	int regno, ret;
>  
>  	/*
>  	 * We have some ABI weirdness here in the way that we handle syscall
> @@ -2342,9 +2342,13 @@ static void report_syscall_enter(struct pt_regs *regs)
>  	saved_reg = regs->regs[regno];
>  	regs->regs[regno] = PTRACE_SYSCALL_ENTER;
>  
> -	if (ptrace_report_syscall_entry(regs))
> +	ret = ptrace_report_syscall_entry(regs);
> +	if (ret)
>  		forget_syscall(regs);

The generic syscall_trace_enter() doesn't do this (i.e. setting
regs->syscallno to NO_SYSCALL). Is that an oversight or do we just not
need it? In principle this does have a visible effect (e.g. via
REGSET_SYSTEM_CALL).

- Kevin

> +
>  	regs->regs[regno] = saved_reg;
> +
> +	return ret;
>  }
>  
>  static void report_syscall_exit(struct pt_regs *regs)
> @@ -2374,9 +2378,11 @@ static void report_syscall_exit(struct pt_regs *regs)
>  
>  int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
>  {
> +	int ret;
> +
>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
> -		report_syscall_enter(regs);
> -		if (flags & _TIF_SYSCALL_EMU)
> +		ret = report_syscall_enter(regs);
> +		if (ret || (flags & _TIF_SYSCALL_EMU))
>  			return NO_SYSCALL;
>  	}
>  

