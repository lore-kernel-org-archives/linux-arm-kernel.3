Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810B9EDB7D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 01:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRb+Osd/NggxIsIx4rl94ka4aexa6/QOGfXJoY+7LY0=; b=radGNpjrPyPSxY
	rKLT+hdeI9BRuoDM6wcFW0nvBvZHDVLjb4XDnx5Ou1c+7PRbkn0szwNs/Le476FEnbWAtodvjnu+4
	wMBcMdV/1qlth6MWLvylZD0mG/3C2jtIVMuhqPE42iew2P79Y+vD3vfTiKv4+Pu9kAY3SfDbb15/G
	EsfhPgBuaVN+8p0n1D/Qe9UrNeGoOSYlQyS8E3/ciFF3Zo6BD0zYbceudsLyYyRGVkaZgqwuXP2UZ
	WZkC5B442BRCGsHb2E2u+TTzYnqPll34ZH5hpO4ns7HWG+bib5GcU+31jNRWpZMFG1plK4BS6lKG7
	2uXJ0G4Ya1PumH8zi83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI5l-000000086vY-2JsB;
	Wed, 08 Apr 2026 01:52:29 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI5h-000000086t6-29sW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 01:52:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YRb+Osd/NggxIsIx4rl94ka4aexa6/QOGfXJoY+7LY0=;
	b=e7eSILFKCwBRQSsm3SPN85o/X1yqrfUBX9wfn0EzclLHI6v7L0hsmRemtv9l9xaRinSG/C+Gn
	8DTDe/kCzs6cNcpQapqkVUmHuq7nujphBCz6ejXD2hyjWyYDS4r3ZTJ9w3k/s1TuOmUqEM9KHRy
	ehBAD7TYWwrhaTw51nVzScs=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fr5WZ5SsLzpT0b;
	Wed,  8 Apr 2026 09:46:18 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 69C274056E;
	Wed,  8 Apr 2026 09:52:18 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Apr 2026 09:52:17 +0800
Message-ID: <01050228-13d1-d2d7-482e-62bb4fc7a8c0@huawei.com>
Date: Wed, 8 Apr 2026 09:52:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 09/10] arm64: entry: Use split preemption logic
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <20260407131650.3813777-10-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260407131650.3813777-10-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_185225_907563_F3FAF5EE 
X-CRM114-Status: GOOD (  25.46  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 2026/4/7 21:16, Mark Rutland wrote:
> The generic irqentry code now provides
> irqentry_exit_to_kernel_mode_preempt() and
> irqentry_exit_to_kernel_mode_after_preempt(), which can be used
> where architectures have different state requirements for involuntary
> preemption and exception return, as is the case on arm64.
> 
> Use the new functions on arm64, aligning our exit to kernel mode logic
> with the style of our exit to user mode logic. This removes the need for
> the recently-added bodge in arch_irqentry_exit_need_resched(), and
> allows preemption to occur when returning from any exception taken from
> kernel mode, which is nicer for RT.
> 
> In an ideal world, we'd remove arch_irqentry_exit_need_resched(), and
> fold the conditionality directly into the architecture-specific entry
> code. That way all the logic necessary to avoid preempting from a
> pseudo-NMI could be constrained specifically to the EL1 IRQ/FIQ paths,
> avoiding redundant work for other exceptions, and making the flow a bit
> clearer. At present it looks like that would require a larger
> refactoring (e.g. for the PREEMPT_DYNAMIC logic), and so I've left that
> as-is for now.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/entry-common.h | 21 ++++++++-------------
>  arch/arm64/kernel/entry-common.c      | 12 ++++--------
>  2 files changed, 12 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
> index 20f0a7c7bde15..cab8cd78f6938 100644
> --- a/arch/arm64/include/asm/entry-common.h
> +++ b/arch/arm64/include/asm/entry-common.h
> @@ -29,19 +29,14 @@ static __always_inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
>  
>  static inline bool arch_irqentry_exit_need_resched(void)
>  {
> -	if (system_uses_irq_prio_masking()) {
> -		/*
> -		 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
> -		 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> -		 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
> -		 * DAIF we must have handled an NMI, so skip preemption.
> -		 */
> -		if (read_sysreg(daif))
> -			return false;
> -	} else {
> -		if (read_sysreg(daif) & (PSR_D_BIT | PSR_A_BIT))
> -			return false;
> -	}
> +	/*
> +	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
> +	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
> +	 * using gic_arch_enable_irqs() for normal IRQs. If anything is set in
> +	 * DAIF we must have handled an NMI, so skip preemption.
> +	 */
> +	if (system_uses_irq_prio_masking() && read_sysreg(daif))
> +		return false;
>  
>  	/*
>  	 * Preempting a task from an IRQ means we leave copies of PSTATE
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 16a65987a6a9b..f42ce7b5c67f3 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -54,8 +54,11 @@ static noinstr irqentry_state_t arm64_enter_from_kernel_mode(struct pt_regs *reg
>  static void noinstr arm64_exit_to_kernel_mode(struct pt_regs *regs,
>  					      irqentry_state_t state)
>  {
> +	local_irq_disable();
> +	irqentry_exit_to_kernel_mode_preempt(regs, state);
> +	local_daif_mask();
>  	mte_check_tfsr_exit();
> -	irqentry_exit_to_kernel_mode(regs, state);
> +	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
>  }

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  /*
> @@ -301,7 +304,6 @@ static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>  	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_mem_abort(far, esr, regs);
> -	local_daif_mask();
>  	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
> @@ -313,7 +315,6 @@ static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
>  	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_sp_pc_abort(far, esr, regs);
> -	local_daif_mask();
>  	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
> @@ -324,7 +325,6 @@ static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
>  	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_el1_undef(regs, esr);
> -	local_daif_mask();
>  	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
> @@ -335,7 +335,6 @@ static void noinstr el1_bti(struct pt_regs *regs, unsigned long esr)
>  	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_el1_bti(regs, esr);
> -	local_daif_mask();
>  	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
> @@ -346,7 +345,6 @@ static void noinstr el1_gcs(struct pt_regs *regs, unsigned long esr)
>  	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_el1_gcs(regs, esr);
> -	local_daif_mask();
>  	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
> @@ -357,7 +355,6 @@ static void noinstr el1_mops(struct pt_regs *regs, unsigned long esr)
>  	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_el1_mops(regs, esr);
> -	local_daif_mask();
>  	arm64_exit_to_kernel_mode(regs, state);
>  }
>  
> @@ -423,7 +420,6 @@ static void noinstr el1_fpac(struct pt_regs *regs, unsigned long esr)
>  	state = arm64_enter_from_kernel_mode(regs);
>  	local_daif_inherit(regs);
>  	do_el1_fpac(regs, esr);
> -	local_daif_mask();
>  	arm64_exit_to_kernel_mode(regs, state);
>  }
>  

