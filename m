Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AB2CEE33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xA75Nc+EsSknPn3jEM8iZ2cQyKWxLBBNMrMgRm9WUfQ=; b=nEcOJxQXnYryoH24a6aOf/VuDz
	iT3FEe7UP6zpUkKhZPqqBSgczIWxOii0Q4y9abG/dR7DNOZgtbgLcu+qAdMfX1mG0xVAb56WNRVad
	cwh5p2v4B3igBiVC/g+MrSE3txeV1fwyAyLjzlYi2uA0fXjjKZRNGl7FfFhm/JX5n2x37jzKOrVBh
	CudsKo4vvgYxb3PBZvxug05Q2g5rIClQvoJVEinj2NR7kzj8gLIWAlLGYa1BZvxKsaWVTz3kzi+Uh
	QEoVv6y7Pnw7WhOwWzURgB8DKrsMoQMKumj0FeBRH/Mx7K9UVRS7BODELYBXfeatm721SrQ2IQZpJ
	tdcDfkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPD1-00000000osu-2eqD;
	Tue, 18 Nov 2025 17:09:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPCz-00000000os1-0I34
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:09:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E205A497;
	Tue, 18 Nov 2025 09:09:26 -0800 (PST)
Received: from [10.57.39.196] (unknown [10.57.39.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A87D83F66E;
	Tue, 18 Nov 2025 09:09:29 -0800 (PST)
Message-ID: <970d9689-4188-4c40-92e6-bdf1e589e8a2@arm.com>
Date: Tue, 18 Nov 2025 18:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/11] arm64/ptrace: Split report_syscall()
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
 <20251117133048.53182-2-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251117133048.53182-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_090937_231673_B529D145 
X-CRM114-Status: GOOD (  20.99  )
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
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/ptrace.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 4b001121c72d..5534c175ceb7 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2317,7 +2317,7 @@ enum ptrace_syscall_dir {
>  	PTRACE_SYSCALL_EXIT,
>  };

This is now unused so it should be removed.

>  
> -static void report_syscall(struct pt_regs *regs, enum ptrace_syscall_dir dir)
> +static void report_syscall_enter(struct pt_regs *regs)

Nit: better to call it "report_syscall_entry" to match its final name.

>  {
>  	int regno;
>  	unsigned long saved_reg;
> @@ -2340,13 +2340,24 @@ static void report_syscall(struct pt_regs *regs, enum ptrace_syscall_dir dir)
>  	 */
>  	regno = (is_compat_task() ? 12 : 7);
>  	saved_reg = regs->regs[regno];
> -	regs->regs[regno] = dir;
> +	regs->regs[regno] = PTRACE_SYSCALL_ENTER;
>  
> -	if (dir == PTRACE_SYSCALL_ENTER) {
> -		if (ptrace_report_syscall_entry(regs))
> -			forget_syscall(regs);
> -		regs->regs[regno] = saved_reg;
> -	} else if (!test_thread_flag(TIF_SINGLESTEP)) {
> +	if (ptrace_report_syscall_entry(regs))
> +		forget_syscall(regs);
> +	regs->regs[regno] = saved_reg;
> +}
> +
> +static void report_syscall_exit(struct pt_regs *regs)
> +{
> +	int regno;
> +	unsigned long saved_reg;
> +
> +	/* See comment for report_syscall_enter() above */
> +	regno = (is_compat_task() ? 12 : 7);

Probably best not to duplicate such magic numbers, moving this line to a
helper would be good.

- Kevin

> +	saved_reg = regs->regs[regno];
> +	regs->regs[regno] = PTRACE_SYSCALL_EXIT;
> +
> +	if (!test_thread_flag(TIF_SINGLESTEP)) {
>  		ptrace_report_syscall_exit(regs, 0);
>  		regs->regs[regno] = saved_reg;
>  	} else {
> @@ -2366,7 +2377,7 @@ int syscall_trace_enter(struct pt_regs *regs)
>  	unsigned long flags = read_thread_flags();
>  
>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
> -		report_syscall(regs, PTRACE_SYSCALL_ENTER);
> +		report_syscall_enter(regs);
>  		if (flags & _TIF_SYSCALL_EMU)
>  			return NO_SYSCALL;
>  	}
> @@ -2394,7 +2405,7 @@ void syscall_trace_exit(struct pt_regs *regs)
>  		trace_sys_exit(regs, syscall_get_return_value(current, regs));
>  
>  	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
> -		report_syscall(regs, PTRACE_SYSCALL_EXIT);
> +		report_syscall_exit(regs);
>  
>  	rseq_syscall(regs);
>  }

