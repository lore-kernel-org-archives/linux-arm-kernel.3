Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18098C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 09:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0K4j+Y1AFAQLUclYqkxypg3kLa1+RxlbYEiA2bnRwk=; b=cpMb/9G/iaRuby/BAiucfA0QcB
	WMVw74+cKYf1n9Wcm6S3b2vidyaAdskXVPTmamRrIw4xAND6NXSnmZw7ynj+79vNdA0GijDVVrVYO
	plBTe2MALSCxzUnCnAi2aMG5w5EFURlie7J8lpRKOBMptwF8ir97Ema1Y4MQ9AtFPvFqY7/7aiQ36
	CvRNbaXBsDrB9OXCQuqvA6bDOi11iwfgseB6Vhh+RhOBL/im5jcg6+31hrU0Eb5pyMh2MXomdVKlE
	XVirqV+gmzgkDJk6E0swHWvTEIQllcPG6Se3xAJuER0/O0q2u+VfwpjrCAXvCWQLCBBzLUIjWBJKJ
	mTrvGtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5tx-00000003tBE-3wu1;
	Mon, 16 Jun 2025 09:13:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR58x-00000003mVO-3VgP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 08:24:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C99AB106F;
	Mon, 16 Jun 2025 01:24:15 -0700 (PDT)
Received: from [10.164.146.15] (J09HK2D2RT.blr.arm.com [10.164.146.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B3513F58B;
	Mon, 16 Jun 2025 01:24:34 -0700 (PDT)
Message-ID: <74a2600e-12db-4712-b2be-349d83dfa733@arm.com>
Date: Mon, 16 Jun 2025 13:54:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] arm64: entry: Add entry and exit functions for
 debug exceptions
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <20250609173413.132168-7-ada.coupriediaz@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609173413.132168-7-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_012439_980476_E12AB5C9 
X-CRM114-Status: GOOD (  17.01  )
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



On 09/06/25 11:04 PM, Ada Couprie Diaz wrote:
> Move the `debug_exception_enter()` and `debug_exception_exit()`
> functions from mm/fault.c, as they are needed to split
> the debug exceptions entry paths from the current unified one.
> 
> Make them externally visible in include/asm/exception.h until
> the caller in mm/fault.c is cleaned up.
Makes sense.

> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/exception.h |  4 ++++
>  arch/arm64/kernel/entry-common.c   | 22 ++++++++++++++++++++++
>  arch/arm64/mm/fault.c              | 22 ----------------------
>  3 files changed, 26 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
> index d48fc16584cd..e54b5466fd2c 100644
> --- a/arch/arm64/include/asm/exception.h
> +++ b/arch/arm64/include/asm/exception.h
> @@ -80,4 +80,8 @@ void do_serror(struct pt_regs *regs, unsigned long esr);
>  void do_signal(struct pt_regs *regs);
>  
>  void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigned long far);
> +
> +void debug_exception_enter(struct pt_regs *regs);
> +void debug_exception_exit(struct pt_regs *regs);
> +
>  #endif	/* __ASM_EXCEPTION_H */
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 7c1970b341b8..3bdfa5abaf7a 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -441,6 +441,28 @@ static __always_inline void fpsimd_syscall_exit(void)
>  	__this_cpu_write(fpsimd_last_state.to_save, FP_STATE_CURRENT);
>  }
>  
> +/*
> + * In debug exception context, we explicitly disable preemption despite
> + * having interrupts disabled.
> + * This serves two purposes: it makes it much less likely that we would
> + * accidentally schedule in exception context and it will force a warning
> + * if we somehow manage to schedule by accident.
> + */
> +void debug_exception_enter(struct pt_regs *regs)
> +{
> +	preempt_disable();
> +
> +	/* This code is a bit fragile.  Test it. */
> +	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
> +}
> +NOKPROBE_SYMBOL(debug_exception_enter);
> +
> +void debug_exception_exit(struct pt_regs *regs)
> +{
> +	preempt_enable_no_resched();
> +}
> +NOKPROBE_SYMBOL(debug_exception_exit);
> +
>  UNHANDLED(el1t, 64, sync)
>  UNHANDLED(el1t, 64, irq)
>  UNHANDLED(el1t, 64, fiq)
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index ec0a337891dd..d451d7d834f1 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -966,28 +966,6 @@ void __init hook_debug_fault_code(int nr,
>  	debug_fault_info[nr].name	= name;
>  }
>  
> -/*
> - * In debug exception context, we explicitly disable preemption despite
> - * having interrupts disabled.
> - * This serves two purposes: it makes it much less likely that we would
> - * accidentally schedule in exception context and it will force a warning
> - * if we somehow manage to schedule by accident.
> - */
> -static void debug_exception_enter(struct pt_regs *regs)
> -{
> -	preempt_disable();
> -
> -	/* This code is a bit fragile.  Test it. */
> -	RCU_LOCKDEP_WARN(!rcu_is_watching(), "exception_enter didn't work");
> -}
> -NOKPROBE_SYMBOL(debug_exception_enter);
> -
> -static void debug_exception_exit(struct pt_regs *regs)
> -{
> -	preempt_enable_no_resched();
> -}
> -NOKPROBE_SYMBOL(debug_exception_exit);
> -
>  void do_debug_exception(unsigned long addr_if_watchpoint, unsigned long esr,
>  			struct pt_regs *regs)
>  {Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>


