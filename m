Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19AAD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 13:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68C/AOp5dddCTFKAvTPChltO/Kzx4iR5yHHK/fe74tA=; b=UYkxen6LU4obO7qN0vVZ7N5bdr
	33y2YD57Z5vM+0rjBesRi/JljcE0MDdWdOHl9E6FgI577rx+IqsPiiRMJBGcXpmu7CxSPl9QzbbPr
	OBXmMOburOLu+S4ADWL5RMgpeQOCtRde4OrLQwQf109513MWb1zY/YH5LgIpAP1WW9orCpJdPQFwp
	Fe47MQqLQdxBSJptYveZRe9aKvP41pZH+6DKjXh0Op0z/iXKFeEph5dns1Lc1TcoXMUJ54SHZJMJ0
	VTiyrSY8HdIx4QdPVt/RLMjgw/9QspJ6l+ctHJgM6uYncTJUojRPUWpgXrY1fMjcaXn61UEo9mJat
	SdDWJ8Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc46-0000000GgD7-1g8F;
	Thu, 27 Nov 2025 13:29:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc44-0000000GgBx-0UyY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 13:29:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FB671756;
	Thu, 27 Nov 2025 05:29:31 -0800 (PST)
Received: from [10.57.43.59] (unknown [10.57.43.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A00E23F66E;
	Thu, 27 Nov 2025 05:29:31 -0800 (PST)
Message-ID: <2cc2b342-d350-415d-bc5a-05aa3da17d50@arm.com>
Date: Thu, 27 Nov 2025 14:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/12] arm64/ptrace: Return early for
 ptrace_report_syscall_entry() error
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 charlie@rivosinc.com, akpm@linux-foundation.org, ldv@strace.io,
 macro@orcam.me.uk, deller@gmx.de, mark.rutland@arm.com, efault@gmx.de,
 song@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com, kmal@cock.li,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251126071446.3234218-1-ruanjinjie@huawei.com>
 <20251126071446.3234218-7-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251126071446.3234218-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_052940_205964_0A2D853E 
X-CRM114-Status: GOOD (  17.93  )
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

On 26/11/2025 08:14, Jinjie Ruan wrote:
> The generic entry abort the syscall_trace_enter() sequence if
> ptrace_report_syscall_entry() errors out, but arm64 not.
>
> As the ptrace_report_syscall_entry() comment said, the calling arch code
> should abort the system call and must prevent normal entry so no system
> call is made if ptrace_report_syscall_entry() return nonzero.

Which is already the case on arm64 before patch 2, which changes
syscall_trace_enter() so that it no longer returns regs->syscallno,
meaning that forget_syscall() no longer skips the syscall.

The most sensible thing to do is probably to move this patch before
patch 2. This ensures patch 2 doesn't introduce a regression, and then
the only effect of this patch is to abort the trace sequence early.

- Kevin

> In preparation for moving arm64 over to the generic entry code,
> return early if ptrace_report_syscall_entry() encounters an error.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/ptrace.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 233a7688ac94..da9687d30bcf 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -2346,15 +2346,18 @@ static inline unsigned long ptrace_save_reg(struct pt_regs *regs,
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
> @@ -2380,9 +2383,11 @@ static void report_syscall_exit(struct pt_regs *regs)
>  
>  int syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long flags)
>  {
> +	int ret;
> +
>  	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
> -		report_syscall_entry(regs);
> -		if (flags & _TIF_SYSCALL_EMU)
> +		ret = report_syscall_entry(regs);
> +		if (ret || (flags & _TIF_SYSCALL_EMU))
>  			return NO_SYSCALL;
>  	}
>  

