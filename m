Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DD4D3ABEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 05:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoKBKtzpl3euXzIYJSdn0WfU6+MyP0zSLwVW1Wx7iLM=; b=YLP/j+wnKxcA+T/Fg9ywO6YB3T
	R23g+xzXKJmcg6buQMAvZqfyxuMvlAXbUOaFbzeRiPUGPvbrdRA70G4JqzUmX6QsAWbahozxxmHyQ
	jSms04MNLuLq1kNgZ34SaNCefW+cOZHoLXAVuO5dhbH502SxnBBujQ0hRiWkHU9Ok9lCyCpaj8de/
	rXYu4Q1bG3lsyWkxDHyj4Iw473JPl+KvL3atcZSO3G16Desv+3iML6+kCMYq47gn9N/Sp5vK+38xU
	dnQm9SxLP2OmpMIh9SYBYfDMcbXq9KOzk4C4Q6k9ATykTp5sm38PzU1+51wGStV+xNnhXeBMvG1h4
	4UfxodkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSTjr-0000000CcGr-1LJd;
	Mon, 08 Dec 2025 05:24:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSTjp-0000000CcGF-03wS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 05:24:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C501E168F;
	Sun,  7 Dec 2025 21:24:36 -0800 (PST)
Received: from [10.164.18.52] (unknown [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 890053F762;
	Sun,  7 Dec 2025 21:24:37 -0800 (PST)
Message-ID: <7c7e5c66-f618-466f-b353-54fad71c0e14@arm.com>
Date: Mon, 8 Dec 2025 10:54:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/16] arm64/ptrace: Return early for
 ptrace_report_syscall_entry() error
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
 <20251204082123.2792067-4-ruanjinjie@huawei.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251204082123.2792067-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_212445_450993_E8B085D3 
X-CRM114-Status: GOOD (  15.45  )
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
> The generic entry abort the syscall_trace_enter() sequence if
> ptrace_report_syscall_entry() errors out, but arm64 not.
> 
> As the ptrace_report_syscall_entry() comment said, the calling arch code
> should abort the system call and must prevent normal entry so no system
> call is made if ptrace_report_syscall_entry() return nonzero.
> 
> In preparation for moving arm64 over to the generic entry code,
> return early if ptrace_report_syscall_entry() encounters an error.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/ptrace.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 4532e9831856..3926ce6aa268 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2346,15 +2346,18 @@ static __always_inline unsigned long ptrace_save_reg(struct pt_regs *regs,
>  	return saved_reg;
>  }
>  
> -static void report_syscall_entry(struct pt_regs *regs)
> +static int report_syscall_entry(struct pt_regs *regs)
>  {
>  	unsigned long saved_reg;
> -	int regno;
> +	int regno, ret;
>  
>  	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_ENTER, &regno);
> -	if (ptrace_report_syscall_entry(regs))
> +	ret = ptrace_report_syscall_entry(regs);
> +	if (ret)
>  		forget_syscall(regs);
>  	regs->regs[regno] = saved_reg;
> +
> +	return ret;
>  }
>  
>  static void report_syscall_exit(struct pt_regs *regs)
> @@ -2381,10 +2384,11 @@ static void report_syscall_exit(struct pt_regs *regs)
>  int syscall_trace_enter(struct pt_regs *regs)
>  {
>  	unsigned long flags = read_thread_flags();
> +	int ret;
>  
>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
> -		report_syscall_entry(regs);
> -		if (flags & _TIF_SYSCALL_EMU)
> +		ret = report_syscall_entry(regs);
> +		if (ret || (flags & _TIF_SYSCALL_EMU))

A small nit.

Could report_syscall_entry(regs) be checked directly in the 'if' conditional
code block thus dropping new 'ret' altogether ?

>  			return NO_SYSCALL;
>  	}
>  


