Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7177BD6100C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u26kzH7a4yx2IqNQoOkjpTbUsYSgAMFlxR5WM5SN1tM=; b=apr4SoK0NQzd5vjNQ7GzspagQ+
	U+W2epEgryen+qsmZm6I/O7C0G2bKRaBLEz/E27ZzerJw4ZdBz74fvNl2Rao+bSY8swUbQhZdaJkU
	9nzvn2iN0eSZPY4vjiOw21kBKxykJR+QXgPI1sHwFpqSuiHCzs9PujvtVnmvLoKITDcYozz3ap8X0
	SuuKysUUH1elPvtv9sMgFOHwC1CbYaArynRGC9orozZ7RP7FgMUlRaP1ayjZ2QDud3nCB0Isk114w
	37fvQrTUBddAFHNCfpkYOfBScCK/AXPmyt1753as9KSYg+FXgiCPXbG/CYHFjUC0E1J/gSxThXo9W
	VdEUBXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQnK-000000004cs-0KvV;
	Thu, 29 Jan 2026 12:06:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQnH-000000004cR-1xYI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 12:06:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3EF2153B;
	Thu, 29 Jan 2026 04:06:31 -0800 (PST)
Received: from [10.44.160.76] (e126510-lin.lund.arm.com [10.44.160.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F04AB3F632;
	Thu, 29 Jan 2026 04:06:31 -0800 (PST)
Message-ID: <c70d3fd6-0b62-464b-8e99-e74f07c20846@arm.com>
Date: Thu, 29 Jan 2026 13:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/14] arm64: ptrace: Move rseq_syscall() before
 audit_syscall_exit()
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 deller@gmx.de, akpm@linux-foundation.org, charlie@rivosinc.com,
 mark.rutland@arm.com, anshuman.khandual@arm.com, song@kernel.org,
 ryan.roberts@arm.com, thuth@redhat.com, ada.coupriediaz@arm.com,
 broonie@kernel.org, pengcan@kylinos.cn, liqiang01@kylinos.cn, kmal@cock.li,
 dvyukov@google.com, reddybalavignesh9979@gmail.com,
 richard.weiyang@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-4-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260128031934.3906955-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_040639_639235_0E65B4D0 
X-CRM114-Status: GOOD (  21.83  )
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

On 28/01/2026 04:19, Jinjie Ruan wrote:
> commit a9f3a74a29af ("entry: Provide generic syscall exit function")
> introduce generic syscall exit function and call rseq_syscall()
> before audit_syscall_exit() and arch_syscall_exit_tracehook().
>
> And commit b74406f37737 ("arm: Add syscall detection for restartable
> sequences") add rseq support for arm32, which also call rseq_syscall()
> before audit_syscall_exit() and tracehook_report_syscall().
>
> However, commit 409d5db49867c ("arm64: rseq: Implement backend rseq
> calls and select HAVE_RSEQ") implement arm64 rseq and call
> rseq_syscall() after audit_syscall_exit() and tracehook_report_syscall().
> So compared to the generic entry and arm32 code, arm64 calls
> rseq_syscall() a bit later.
>
> But as commit b74406f37737 ("arm: Add syscall detection for restartable
> sequences") said, syscalls are not allowed inside restartable sequences,
> so should call rseq_syscall() at the very beginning of system call
> exiting path for CONFIG_DEBUG_RSEQ=y kernel. This could help us to detect
> whether there is a syscall issued inside restartable sequences.
>
> As for the impact of raising SIGSEGV via rseq_syscall(), it makes no
> practical difference to signal delivery because signals are processed
> in arm64_exit_to_user_mode() at the very end.
>
> As for the "regs", rseq_syscall() only checks and update
> instruction_pointer(regs), ptrace can not modify the "pc" on syscall exit
> path but 'only changes the return value', so calling rseq_syscall()
> before or after ptrace_report_syscall_exit() makes no difference.

Let's update this as discussed on v10 - PC can be modified when
ptrace_report_syscall_exit() is called.

> And audit_syscall_exit() only checks the return value (x0 for arm64),
> so calling rseq_syscall() before or after audit syscall exit makes
> no difference. trace_sys_exit() only uses syscallno and the return value,
> so calling rseq_syscall() before or after trace_sys_exit() also makes
> no difference.
>
> In preparation for moving arm64 over to the generic entry code, move
> rseq_syscall() ahead before audit_syscall_exit().
>
> No functional changes.

And naturally this is not the case.

- Kevin

> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/ptrace.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 9f9aa3087c09..785280c76317 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2443,6 +2443,8 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
>  
>  void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
>  {
> +	rseq_syscall(regs);
> +
>  	audit_syscall_exit(regs);
>  
>  	if (flags & _TIF_SYSCALL_TRACEPOINT)
> @@ -2450,8 +2452,6 @@ void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
>  
>  	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
>  		report_syscall_exit(regs);
> -
> -	rseq_syscall(regs);
>  }
>  
>  /*

