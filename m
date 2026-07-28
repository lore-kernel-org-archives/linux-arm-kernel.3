Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B2AC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhlajuHyoPf54wxfOla7I4/BG+IlIRWbYYSGKFish8g=; b=O+K51zoDgk3zwCU0xNuTRIsZRr
	ebtl4VI+BoCDlHcMZ3S1AQENF5A19p6pPJgFTeq5LPC/66vnkz9PptjvM1FGPmxTcR/H2G4ZbtpOa
	fTV+QF7Hhh92zZHiimPDNvNq5OKV1ja2YCjoMAflChU7bpCv/qwevHbFi0Eghp90944VUnpI4mKJN
	As3t8oiZNQj+yPSBceNIfYXWyLaiUXi0acBLgKKYEZeZGyAQruGIO6waWfuB2VXMrTaX3rFF4woc3
	CV6rpAxBQR7d2kSbT5Q4zYIj/nh5Gzd973o0zsnoq4sNjYb5wTl7xtNixSGtFZ5RbCZGubXmqi8s/
	HbtbbkxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woif5-00000005STw-2iG9;
	Tue, 28 Jul 2026 14:20:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woif4-00000005STS-254Q
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Jul 2026 14:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fhlajuHyoPf54wxfOla7I4/BG+IlIRWbYYSGKFish8g=; b=G1v2FUtuHLemnMjYcdQbqS+W+b
	UBIxWfD8YWMkPme2QDY770d+1X2pSHPsLhlPdf6v3JYRbNw8lubyqIgXBP1iqcJzLMmBP9vkLuUf5
	Vn0kM1ZmONru8EEF8n98h8O5blwDFwQEvtCAXzxmoXb2Q3bN10CEV4s6Yg5Qs9M7UWEJb+PPDUPh7
	wUr+6qabWa7UEPpf/tXEvsv/xnwq5jricWGs9kQfOG5Mjthv5leaDGImUFOCfAy7VOJe0jOuXldqf
	5DJ1Lcuha9/xZLeVNZ8m+2V6B+u1vsf9zfqh+6lG5AUHYGoK9NAvBOz8H9L7ybtC4mhX6MJ0q4q3c
	3k5aa7kQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1woif1-000000050fK-2lPx;
	Tue, 28 Jul 2026 14:19:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 58358300969; Tue, 28 Jul 2026 16:19:58 +0200 (CEST)
Date: Tue, 28 Jul 2026 16:19:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <20260728141958.GV751831@noisy.programming.kicks-ass.net>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-7-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728123859.2911495-7-mark.rutland@arm.com>
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

On Tue, Jul 28, 2026 at 01:38:52PM +0100, Mark Rutland wrote:

> With the scheme added in this patch, this can be compiled as:
> 
> | <outline_this_cpu_add_u64>:
> |        mrs     x2, sp_el0
> |        mov     x4, #0xc80

Perhaps add a comment to that like:

  |        mov     x4, #0xc80 # {x0, x4, x3}

to make the literal less magical?

> |        strh    w4, [x2, #20]

Anyway, interrupt can hit here, at which point it will:

  x4 := this_cpu_offset
  x3 := x0 + x4

> |        mrs     x4, tpidr_el1
> |        add     x3, x0, x4

Which it then recomputes, and so is harmless.

> | 1:     ldxr    x6, [x3]
> |        add     x6, x6, x1
> |        stxr    w5, x6, [x3]

IIRC any interrupt in between LL/SC will cause the stxr to fail anyway,
irrespective of the fixup, so goto 1b we go.

> |        cbnz    w5, 1b

If we get here and interrupts happens, we recompute pointlessly, no harm
done.

Anyway, per this sequence there is no point in ever doing the fixup. So
perhaps give a better example?

> |        strh    wzr, [x2, #20]
> |        ret
> 
> TODO: Save/restore the PCPU GPRs in __sdei_asm_handler(). This will
> require some mechanical rework to the __sdei_asm_handler() assembly.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>

> @@ -51,6 +53,47 @@ static inline unsigned long __kern_my_cpu_offset(void)
>  	return off;
>  }
>  
> +#define PCPU_GPR_PCP			GENMASK(4, 0)
> +#define PCPU_GPR_OFF			GENMASK(9, 5)
> +#define PCPU_GPR_ADDR			GENMASK(14, 10)

I hate those macros, I can never remember what they all do. Now, esp.
since you then not use them here:

> +#define __VAL_PCPU_GPRS(pcp, off, addr)				\
> +	"("							\
> +		"(.L__gpr_num_" pcp  " << 0) | "		\
> +		"(.L__gpr_num_" off  " << 5) | "		\
> +		"(.L__gpr_num_" addr " << 10)"			\
> +	")"

... continue comment at irqentry_exit_pcpu_adjust().

> +#define ____PCPU_GPRS_BEGIN(gprs, pcp, off, addr)			\
> +	__DEFINE_ASM_GPR_NUMS						\
> +	__DEFINE_ASM_GPR_ALIASES					\
> +	"	mov w" off ", #" __VAL_PCPU_GPRS(pcp, off, addr) "\n"	\
> +	"	strh	w" off ", " gprs "\n"				\
> +	__KERN_ASM_CPU_OFFSET(off) "\n"

Can this macro also generate a readable comment for those few of us
building the .i file ?

> +/*
> + * Where the context being returned to had an active percpu GPR critical
> + * section, ensure that the offset and address GPRs are updated to match the
> + * current CPU.
> + *
> + * For simplicity we always update the GPRs when a critical section is active
> + * and preemption was *possible*, regardless of whether preemption actually
> + * occurred. Where preemption did not occur, the updates are redundant but not
> + * harmful.
> + */
> +static __always_inline void irqentry_exit_pcpu_adjust(struct pt_regs *regs)
> +{
> +	int reg_pcp, reg_off, reg_addr;
> +	unsigned long pcp, off, addr;
> +	u16 gprs = regs->pcpu_gprs;
> +
> +	/*
> +	 * Zero means no active PCPU GPRs. As the PCPU GPRs must be distinct,
> +	 * a PCPU critical section cannot possibly use {x0,x0,x0}.
> +	 */
> +	if (likely(!gprs))
> +		return;
> +
> +	reg_pcp  = FIELD_GET(PCPU_GPR_PCP,  gprs);
> +	reg_off  = FIELD_GET(PCPU_GPR_OFF,  gprs);
> +	reg_addr = FIELD_GET(PCPU_GPR_ADDR, gprs);

Would it not be more readable to write this like:

	reg_pcp  = (grps >>  0) & 0x1f;
	reg_off  = (grps >>  5) & 0x1f;
	reg_addr = (grps >> 10) & 0x1f;

To better match __VAL_PCPU_GRPS() ?

> +	pcp = pt_regs_read_reg(regs, reg_pcp);
> +
> +	off = __kern_my_cpu_offset();
> +	pt_regs_write_reg(regs, reg_off, off);
> +
> +	addr = pcp + off;
> +	pt_regs_write_reg(regs, reg_addr, addr);
> +}

