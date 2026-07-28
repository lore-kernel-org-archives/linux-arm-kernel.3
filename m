Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C01C54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXpssYsc4AcLiK97gaR32zQo53mvdLCYSUj6Mi84jCs=; b=R1oXq85B4x3ix15bEz5Xey5EJF
	QgeoaMI1NmuQaj4LXz3IFqtQPnFJxXx/9TWHD/weIvzPE4yQ0hzxOND1w4jMj3HXIZ9VjV/fSoWLP
	tzYG3Gtb80BWlt72WyKry3Q09b7/DIlFDJHyIktelrSQ84T3xrwWAROoPMGLqfapirOypwgCOnj+g
	SWU9SpN5WvAj1GyOhxb8osKc0JRI0ykpG0I302OjzLv1xDtbYCqWSsNYq8yd18nN/fijCmqoNYwlo
	YWCy5U2Rp4Q6yalGKxqPWNq/IKe0NBKOMPsMnKisQfVZqxkjqoqUCye4cFh4bTXJTLPBUZ6IzzRbx
	Vf0/5Ekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok89-00000005jZW-1erU;
	Tue, 28 Jul 2026 15:54:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok86-00000005jYB-3IzX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:54:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DED67169E;
	Tue, 28 Jul 2026 08:54:00 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A7F93F66F;
	Tue, 28 Jul 2026 08:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785254045; bh=q6wYkZC/S7niIdrsVebuDR2WJR/5r2MKu2teOHVHvWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXnKqSBwnzNmM53UQAu+WKc5j3k171ZXSRYAa1EwXXYSCEFi97MgHkzWa51TkYWz8
	 Lrtyy8QQFnYbYPQ31laTvJm2HavsBO8H2mZ2QjVcvBG+1vhMoDHy4CMDUt2uauDMrf
	 QLvsDb+fzP0CcirNwQGf9V8zQOGejJaxmkOQimH0=
Date: Tue, 28 Jul 2026 16:53:52 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <amjQkPyNAsFRJF9I@J2N7QTR9R3>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-7-mark.rutland@arm.com>
 <20260728141958.GV751831@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728141958.GV751831@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085406_929566_9B65E42C 
X-CRM114-Status: GOOD (  27.79  )
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
Cc: vladimir.murzin@arm.com, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2026 at 04:19:58PM +0200, Peter Zijlstra wrote:
> On Tue, Jul 28, 2026 at 01:38:52PM +0100, Mark Rutland wrote:
> 
> > With the scheme added in this patch, this can be compiled as:
> > 
> > | <outline_this_cpu_add_u64>:
> > |        mrs     x2, sp_el0
> > |        mov     x4, #0xc80
> 
> Perhaps add a comment to that like:
> 
>   |        mov     x4, #0xc80 # {x0, x4, x3}
> 
> to make the literal less magical?
> 
> > |        strh    w4, [x2, #20]

Sure, I'll make that: 

|        mov     x4, #0xc80 // __VAL_PCPU_GPRS(x0, x4, x3)

... to match the code we use below.

> > +#define PCPU_GPR_PCP			GENMASK(4, 0)
> > +#define PCPU_GPR_OFF			GENMASK(9, 5)
> > +#define PCPU_GPR_ADDR			GENMASK(14, 10)
> 
> I hate those macros, I can never remember what they all do.

Ah. :/

We use them pretty commonly throughout arch/arm64/ (e.g. for all the
sysreg stuff), so the core arm64 folk are all familiar with them.

> Now, esp.  since you then not use them here:
> 
> > +#define __VAL_PCPU_GPRS(pcp, off, addr)				\
> > +	"("							\
> > +		"(.L__gpr_num_" pcp  " << 0) | "		\
> > +		"(.L__gpr_num_" off  " << 5) | "		\
> > +		"(.L__gpr_num_" addr " << 10)"			\
> > +	")"
> 
> ... continue comment at irqentry_exit_pcpu_adjust().

I was being lazy here relative to what we do for asm-extable.h. How
about I match the pattern there, and have:

| #define PCPU_GPR_PCP_SHIFT              0
| #define PCPU_GPR_PCP                    GENMASK(4, 0)
| #define PCPU_GPR_OFF_SHIFT              5
| #define PCPU_GPR_OFF                    GENMASK(9, 5)
| #define PCPU_GPR_ADDR_SHIFT             10
| #define PCPU_GPR_ADDR                   GENMASK(14, 10)
| 
| #define __VAL_PCPU_GPRS(pcp, off, addr)                                                 \
|         "("                                                                             \
|                 "(.L__gpr_num_" pcp  " << " __stringify(PCPU_GPR_PCP_SHIFT) ") | "      \
|                 "(.L__gpr_num_" off  " << " __stringify(PCPU_GPR_OFF_SHIFT) ") | "      \
|                 "(.L__gpr_num_" addr " << " __stringify(PCPU_GPR_ADDR_SHIFT) ")"       \
|         ")"

... if that's any better?

Regardless of how we define these, I really want to keep the values in one
place (e.g. one header).


[...]

> > +#define ____PCPU_GPRS_BEGIN(gprs, pcp, off, addr)			\
> > +	__DEFINE_ASM_GPR_NUMS						\
> > +	__DEFINE_ASM_GPR_ALIASES					\
> > +	"	mov w" off ", #" __VAL_PCPU_GPRS(pcp, off, addr) "\n"	\
> > +	"	strh	w" off ", " gprs "\n"				\
> > +	__KERN_ASM_CPU_OFFSET(off) "\n"
> 
> Can this macro also generate a readable comment for those few of us
> building the .i file ?

Do you mean for __VAL_PCPU_GPRS, or ____PCPU_GPRS_BEGIN() ?

I can happily add comments for either (and the corresponding ENDs).

> > +/*
> > + * Where the context being returned to had an active percpu GPR critical
> > + * section, ensure that the offset and address GPRs are updated to match the
> > + * current CPU.
> > + *
> > + * For simplicity we always update the GPRs when a critical section is active
> > + * and preemption was *possible*, regardless of whether preemption actually
> > + * occurred. Where preemption did not occur, the updates are redundant but not
> > + * harmful.
> > + */
> > +static __always_inline void irqentry_exit_pcpu_adjust(struct pt_regs *regs)
> > +{
> > +	int reg_pcp, reg_off, reg_addr;
> > +	unsigned long pcp, off, addr;
> > +	u16 gprs = regs->pcpu_gprs;
> > +
> > +	/*
> > +	 * Zero means no active PCPU GPRs. As the PCPU GPRs must be distinct,
> > +	 * a PCPU critical section cannot possibly use {x0,x0,x0}.
> > +	 */
> > +	if (likely(!gprs))
> > +		return;
> > +
> > +	reg_pcp  = FIELD_GET(PCPU_GPR_PCP,  gprs);
> > +	reg_off  = FIELD_GET(PCPU_GPR_OFF,  gprs);
> > +	reg_addr = FIELD_GET(PCPU_GPR_ADDR, gprs);
> 
> Would it not be more readable to write this like:
> 
> 	reg_pcp  = (grps >>  0) & 0x1f;
> 	reg_off  = (grps >>  5) & 0x1f;
> 	reg_addr = (grps >> 10) & 0x1f;
> 
> To better match __VAL_PCPU_GRPS() ?

I wrote it this way to keep the field definitions in one place, and to
match what we do elsewhere, e.g.

| static bool ex_handler_uaccess_err_zero(const struct exception_table_entry *ex,
|                                         struct pt_regs *regs)
| {
|         int reg_err = FIELD_GET(EX_DATA_REG_ERR, ex->data);
|         int reg_zero = FIELD_GET(EX_DATA_REG_ZERO, ex->data);
| 
|         pt_regs_write_reg(regs, reg_err, -EFAULT);
|         pt_regs_write_reg(regs, reg_zero, 0); 
| 
|         regs->pc = get_ex_fixup(ex);
|         return true;
| }

My preference would be as-is (or with the proposal above), but I'll
defer to Will and Catalin.

If we do open-code the shifts, I'd strongly prefer that we have
<foo>_SHIFT constants to keep those in sync, e.g.

	reg_pcp	 = (gprs >> PCPU_GRP_PCP_SHIFT)  & 0x1f;
	reg_off	 = (gprs >> PCPU_GRP_OFF_SHIFT)  & 0x1f;
	reg_addr = (gprs >> PCPU_GRP_ADDR_SHIFT) & 0x1f;

Mark.

