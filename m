Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C215AFAD3E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 01:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzewzguANFV2TNonu/EWhffR9Fy4HKyLATDqORBGlZc=; b=aAmc0GWUXYa3FgTncxP/emQob5
	L5NNg7ARshTyHEHcvAonmG24F5KhMakhVZhSQ/ar6qokv8hCtIcVYKKCaNq52Sm1M3BxE+4rMQ2zH
	g2ILRDLRi5E5cA/fgMLIuHIBa3Bw/ehEMdjMCnds3+SiwTahnZuODpYYeY+PFDiy4/cp9dObscOsn
	oGNAokJ5xMlEzANEHR+kv9V7DOgyZEu0YjgjWcm6R0WTQ4VxNA9l1dP6kFdOyqU1Od7XvSPANautP
	sC6pgbVP60crbPzII/L1w2dSlvsWS4n5H7mu5HfjvCcHHarJXAevcVl/tbbX1TdBSEtyCn9iuw5SE
	UZbsrcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFjBR-0000000AuMk-45YJ;
	Thu, 23 Apr 2026 01:48:49 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFjBO-0000000AuMH-1EnM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 01:48:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UzewzguANFV2TNonu/EWhffR9Fy4HKyLATDqORBGlZc=;
	b=g15DtmAg0PRLsNMtBcmAqBTCqVjbf8q15uVwK/QT4P5lONLjW3pcwWqNDT8aIinawPaHCWKYH
	8EOxRav4KjZwJ4YQZmmmIzDdIK8kkRdSLNYUs8Mbwt1p8xxs7oLwWEFzKS8UNnZH3+IPFw2LskD
	srKdL81deQGcjrFQnxtfp6s=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4g1Jjr59NgzpSx7;
	Thu, 23 Apr 2026 09:42:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F5C440537;
	Thu, 23 Apr 2026 09:48:34 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Apr 2026 09:48:33 +0800
Message-ID: <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
Date: Thu, 23 Apr 2026 09:48:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>
CC: Mathias Stearn <mathias@mongodb.com>, Mathieu Desnoyers
	<mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, Dmitry
 Vyukov <dvyukov@google.com>, <regressions@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Blake Oler
	<blake.oler@mongodb.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87wlxy22x7.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_184846_988761_1E922FA3 
X-CRM114-Status: GOOD (  20.78  )
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



On 4/23/2026 3:47 AM, Thomas Gleixner wrote:
> On Wed, Apr 22 2026 at 19:11, Mark Rutland wrote:
>> On Wed, Apr 22, 2026 at 07:49:30PM +0200, Thomas Gleixner wrote:
>> Conceptually we just need to use syscall_enter_from_user_mode() and
>> irqentry_enter_from_user_mode() appropriately.
> 
> Right. I figured that out.
> 
>> In practice, I can't use those as-is without introducing the exception
>> masking problems I just fixed up for irqentry_enter_from_kernel_mode(),
>> so I'll need to do some similar refactoring first.
> 
> See below.
> 
>> I haven't paged everything in yet, so just to cehck, is there anything
>> that would behave incorrectly if current->rseq.event.user_irq were set
>> for syscall entry? IIUC it means we'll effectively do the slow path, and
>> I was wondering if that might be acceptable as a one-line bodge for
>> stable.
> 
> It might work, but it's trivial enough to avoid that. See below. That on
> top of 6.19.y makes the selftests pass too.

This aligns with my thoughts when convert arm64 to generic syscall
entry. Currently, the arm64 entry code does not distinguish between IRQ
and syscall entries. It fails to call rseq_note_user_irq_entry() for IRQ
entries as the generic entry framework does, because arm64 uses
enter_from_user_mode() exclusively instead of
irqentry_enter_from_user_mode().

https://lore.kernel.org/all/20260320102620.1336796-10-ruanjinjie@huawei.com/

> 
> Thanks,
> 
>         tglx
> ---
>  arch/arm64/kernel/entry-common.c |   14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -58,6 +58,12 @@ static void noinstr exit_to_kernel_mode(
>  	irqentry_exit(regs, state);
>  }
>  
> +static __always_inline void arm64_enter_from_user_mode_syscall(struct pt_regs *regs)
> +{
> +	enter_from_user_mode(regs);
> +	mte_disable_tco_entry(current);
> +}
> +
>  /*
>   * Handle IRQ/context state management when entering from user mode.
>   * Before this function is called it is not safe to call regular kernel code,
> @@ -65,8 +71,8 @@ static void noinstr exit_to_kernel_mode(
>   */
>  static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
>  {
> -	enter_from_user_mode(regs);
> -	mte_disable_tco_entry(current);
> +	arm64_enter_from_user_mode_syscall(regs);
> +	rseq_note_user_irq_entry();
>  }
>  
>  /*
> @@ -717,7 +723,7 @@ static void noinstr el0_brk64(struct pt_
>  
>  static void noinstr el0_svc(struct pt_regs *regs)
>  {
> -	arm64_enter_from_user_mode(regs);
> +	arm64_enter_from_user_mode_syscall(regs);
>  	cortex_a76_erratum_1463225_svc_handler();
>  	fpsimd_syscall_enter();
>  	local_daif_restore(DAIF_PROCCTX);
> @@ -869,7 +875,7 @@ static void noinstr el0_cp15(struct pt_r
>  
>  static void noinstr el0_svc_compat(struct pt_regs *regs)
>  {
> -	arm64_enter_from_user_mode(regs);
> +	arm64_enter_from_user_mode_syscall(regs);
>  	cortex_a76_erratum_1463225_svc_handler();
>  	local_daif_restore(DAIF_PROCCTX);
>  	do_el0_svc_compat(regs);


