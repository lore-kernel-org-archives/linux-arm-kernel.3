Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF9DD3ABEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 05:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gSMBENzzXEaeNJWYpLcNe7aCGIPyFqqlgzJPLn4DZU=; b=gbbHx3WOXOmmcI1u5ARJzFgl5X
	dPi+kEH7JIc4RG9KQFCGfStJ7z0RhpYCqVYIyurOAUAsMmMrEu1nyia7+iG8jrA4l/sZzuoIFpe3W
	yPEoJ3zS0Lmb3DRmq6P4GvNGedwiY9LJAklNmPqAA96PumlTqu0xg2pgY8IEab+ECZj9Iowupfp9g
	vrqmX41QYuHbllJ1rTTfU1tBUDE1KFYdOiXW14HLbqoKNJNqkkEQ/SX/xoDKERV/sQbHVj5LVMYPb
	8S8aWlHR6AIWZXspshTjFThY2j4myskcm1qzwXomhqbAtNvZaCL7CiGsz7+xNGvNpN2pt5X3ZaQ0a
	sSBKARQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSTOE-0000000Cb25-1zPU;
	Mon, 08 Dec 2025 05:02:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSTOB-0000000Cb1W-34rw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 05:02:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CC1C1595;
	Sun,  7 Dec 2025 21:02:14 -0800 (PST)
Received: from [10.164.18.52] (unknown [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC3033F762;
	Sun,  7 Dec 2025 21:02:14 -0800 (PST)
Message-ID: <b66f285f-20d8-4c29-ad0d-1ab0857b38b0@arm.com>
Date: Mon, 8 Dec 2025 10:32:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/16] arm64/ptrace: Split report_syscall()
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 deller@gmx.de, macro@orcam.me.uk, charlie@rivosinc.com,
 kevin.brodsky@arm.com, ldv@strace.io, mark.rutland@arm.com, song@kernel.org,
 ryan.roberts@arm.com, ada.coupriediaz@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
 <20251204082123.2792067-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251204082123.2792067-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_210223_926638_4223E3D0 
X-CRM114-Status: GOOD (  18.66  )
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

On 04/12/25 1:51 PM, Jinjie Ruan wrote:
> The generic syscall entry code has the form:
> 
> | syscall_trace_enter()
> | {
> |	ptrace_report_syscall_entry()
> | }
> |
> | syscall_exit_work()
> | {
> |	ptrace_report_syscall_exit()
> | }
> 
> In preparation for moving arm64 over to the generic entry code, split
> report_syscall() to two separate enter and exit functions to align
> the structure of the arm64 code with syscall_trace_enter() and
> syscall_exit_work() from the generic entry code.
> 
> No functional changes.
> 
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
> v8:
> - report_syscall_enter() -> report_syscall_entry().
> - Add ptrace_save_reg() helper.
> ---
>  arch/arm64/kernel/ptrace.c | 41 +++++++++++++++++++++++++++-----------
>  1 file changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 4b001121c72d..4532e9831856 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2317,9 +2317,10 @@ enum ptrace_syscall_dir {
>  	PTRACE_SYSCALL_EXIT,
>  };
>  
> -static void report_syscall(struct pt_regs *regs, enum ptrace_syscall_dir dir)
> +static __always_inline unsigned long ptrace_save_reg(struct pt_regs *regs,
> +						     enum ptrace_syscall_dir dir,
> +						     int *regno)
>  {
> -	int regno;
>  	unsigned long saved_reg;
>  
>  	/*
> @@ -2338,15 +2339,31 @@ static void report_syscall(struct pt_regs *regs, enum ptrace_syscall_dir dir)
>  	 * - Syscall stops behave differently to seccomp and pseudo-step traps
>  	 *   (the latter do not nobble any registers).
>  	 */
> -	regno = (is_compat_task() ? 12 : 7);
> -	saved_reg = regs->regs[regno];
> -	regs->regs[regno] = dir;
> +	*regno = (is_compat_task() ? 12 : 7);
> +	saved_reg = regs->regs[*regno];
> +	regs->regs[*regno] = dir;
>  
> -	if (dir == PTRACE_SYSCALL_ENTER) {
> -		if (ptrace_report_syscall_entry(regs))
> -			forget_syscall(regs);
> -		regs->regs[regno] = saved_reg;
> -	} else if (!test_thread_flag(TIF_SINGLESTEP)) {
> +	return saved_reg;
> +}
> +
> +static void report_syscall_entry(struct pt_regs *regs)
> +{
> +	unsigned long saved_reg;
> +	int regno;
> +
> +	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_ENTER, &regno);
> +	if (ptrace_report_syscall_entry(regs))
> +		forget_syscall(regs);
> +	regs->regs[regno] = saved_reg;
> +}
> +
> +static void report_syscall_exit(struct pt_regs *regs)
> +{
> +	unsigned long saved_reg;
> +	int regno;
> +
> +	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_EXIT, &regno);
> +	if (!test_thread_flag(TIF_SINGLESTEP)) {
>  		ptrace_report_syscall_exit(regs, 0);
>  		regs->regs[regno] = saved_reg;
>  	} else {
> @@ -2366,7 +2383,7 @@ int syscall_trace_enter(struct pt_regs *regs)
>  	unsigned long flags = read_thread_flags();
>  
>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
> -		report_syscall(regs, PTRACE_SYSCALL_ENTER);
> +		report_syscall_entry(regs);
>  		if (flags & _TIF_SYSCALL_EMU)
>  			return NO_SYSCALL;
>  	}
> @@ -2394,7 +2411,7 @@ void syscall_trace_exit(struct pt_regs *regs)
>  		trace_sys_exit(regs, syscall_get_return_value(current, regs));
>  
>  	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
> -		report_syscall(regs, PTRACE_SYSCALL_EXIT);
> +		report_syscall_exit(regs);
>  
>  	rseq_syscall(regs);
>  }


