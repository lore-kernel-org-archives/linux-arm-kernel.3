Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BDCFD5F98
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evDDULkaN19Kd4xEpz1rCzPoPV7OAh1/yRM0SPJvQho=; b=ebH8nGbZunqxt5VjSIeaEo3Elm
	ZrqHQ39azwyxijzbzuWSjMPpTWGxaHPFatGNawkoZEoF63nCsVEQFcG/bNtl8WAVDF9Q+vxCyTsqJ
	hI6AUg4Q7YWxedW2tQXuVkf0iXPPdYPJs6E0qHHmZbn/io3uOGVC4NRyz1+k6254hUm3dhlaKAYm6
	birPSr5XAGStgLado/6nHUYdNQvmtR2kLuULBpYpgKUx+JiUiOfrn3xg9GkRfbl4DjEQ8ZptSQLn1
	an3OdWG1oDQjdm/WDImte7qCruI2ZOd8mOUjTA0aV32KatBOsoB3QURdBSy0ok7UrAB7u4c7f6+Fp
	WAaTZl1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOtY-00000008ZKg-0u2e;
	Wed, 08 Apr 2026 09:08:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOtV-00000008ZJp-41je
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:08:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F84B267F;
	Wed,  8 Apr 2026 02:08:10 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C8C93FDE2;
	Wed,  8 Apr 2026 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775639296; bh=eYsNaqDHlg8/2JcSmkyzzh4rtE74LSwT/A1zsvFOkBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vZzqAejPO+Rpcr5AYtK/8W9nRqL0AZ+mAcrftfV16DTCS8r0mMEoZR3tx4N5VuLB6
	 kVT7njKLSrJpqVAPfUOul1TrMbTINuotgBbAxHvIbgYA5/sPSceSIXoQdDWdinE9OF
	 /6Pg+FlOtf0cKMk9Rmc9/ueJXjVUVx8wQ0hBOYf8=
Date: Wed, 8 Apr 2026 10:08:12 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH 10/10] arm64: Check DAIF (and PMR) at task-switch time
Message-ID: <adYa_LVdtYtNTd-h@J2N7QTR9R3>
References: <20260407131650.3813777-1-mark.rutland@arm.com>
 <20260407131650.3813777-11-mark.rutland@arm.com>
 <26642def-7676-e081-98f3-9ab883048375@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26642def-7676-e081-98f3-9ab883048375@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_020818_122346_E581CA47 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, tglx@kernel.org, luto@kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Apr 08, 2026 at 10:17:56AM +0800, Jinjie Ruan wrote:
> On 2026/4/7 21:16, Mark Rutland wrote:
> > +static inline void debug_switch_state(void)
> > +{
> > +	if (system_uses_irq_prio_masking()) {
> > +		unsigned long daif_expected = 0;
> > +		unsigned long daif_actual = read_sysreg(daif);
> > +		unsigned long pmr_expected = GIC_PRIO_IRQOFF;
> > +		unsigned long pmr_actual = read_sysreg_s(SYS_ICC_PMR_EL1);
> > +
> > +		WARN_ONCE(daif_actual != daif_expected ||
> > +			  pmr_actual != pmr_expected,
> > +			  "Unexpected DAIF + PMR: 0x%lx + 0x%lx (expected 0x%lx + 0x%lx)\n",
> > +			  daif_actual, pmr_actual,
> > +			  daif_expected, pmr_expected);
> > +	} else {
> > +		unsigned long daif_expected = DAIF_PROCCTX_NOIRQ;
> > +		unsigned long daif_actual = read_sysreg(daif);
> > +
> > +		WARN_ONCE(daif_actual != daif_expected,
> > +			  "Unexpected DAIF value: 0x%lx (expected 0x%lx)\n",
> > +			  daif_actual, daif_expected);
> > +	}
> 
> This logic seems consistent with arm64's local_irq_disable()
> implementation. Do we need to wrap these debug checks in a config option
> (e.g., CONFIG_ARM64_DEBUG_PRIORITY_MASKING) to avoid unnecessary overhead?

Possibly. I'd expected this was infrequent enough that there wouldn't be
a noticeable overhead, but admittedly I don't have numbers.

Given Thomas seems happy to queue the preparatory bits, (hopefully) we
can queue the rest of this as-is, and I reckon it's probably best to
drop this patch for now and follow up with a better version later.

There are some other bits of state I'd like to check here (e.g. PAN),
and I think this requires a bit more work.

Thanks for looking at this!

Mark.

> 
> 
> __schedule()
>   -> local_irq_disable()
>     -> arch_local_irq_disable()
> 
> 52 static __always_inline void __daif_local_irq_disable(void)
>  53 {
>  54         barrier();
>  55         asm volatile("msr daifset, #3");
>  56         barrier();
>  57 }
>  58
>  59 static __always_inline void __pmr_local_irq_disable(void)
>  60 {
>  61         if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
>  62                 u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
>  63                 WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr !=
> GIC_PRIO_IRQOFF);
>  64         }
>  65
>  66         barrier();
>  67         write_sysreg_s(GIC_PRIO_IRQOFF, SYS_ICC_PMR_EL1);
>  68         barrier();
>  69 }
>  70
>  71 static inline void arch_local_irq_disable(void)
>  72 {
>  73         if (system_uses_irq_prio_masking()) {
>  74                 __pmr_local_irq_disable();
>  75         } else {
>  76                 __daif_local_irq_disable();
>  77         }
>  78 }
> 
> 
> > +}
> > +
> >  /*
> >   * Thread switching.
> >   */
> > @@ -708,6 +731,8 @@ struct task_struct *__switch_to(struct task_struct *prev,
> >  {
> >  	struct task_struct *last;
> >  
> > +	debug_switch_state();
> > +
> >  	fpsimd_thread_switch(next);
> >  	tls_thread_switch(next);
> >  	hw_breakpoint_thread_switch(next);

