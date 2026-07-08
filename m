Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3F9C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 07:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uj+mFAOAsZprBnGJFeUh4asxeFG2wYPwTiHo6+BIk7E=; b=jG6Qi1zxFdLIzf
	wdWKhKUzEtg3C1OIoh87BC4PDEo+mMfjcnDc9nNFHTpISjIhOjFGQc2k++riqLr5+71aEmvcn+KFO
	fv51ZiKTFUpDoarOO3Idgfb9zwYoreQa8XITC3AmQk4wxkC5HN83xzVaHei/O3+KjvV2f64i7pKJP
	Ze69QO6a1ExnuZDFpXQ/esSofuGHkTTE82BYMIdk22HeAcp+b9eXwBbiwMJyHL8zjOmdVOjD+pRTY
	FI0fEnxaALYjmCosVe3eFU/M1VV2OL6i6tVUQjom4ctjlopfAWEqbVAE0/uULjNs5AXFI+Ro54oP+
	sigROcxw6fCgJSgW/avw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMvN-0000000GWjM-36DP;
	Wed, 08 Jul 2026 07:42:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMvL-0000000GWjF-3gNX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 07:42:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EC2142B67;
	Wed,  8 Jul 2026 07:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B443E1F000E9;
	Wed,  8 Jul 2026 07:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783496547;
	bh=Uj+mFAOAsZprBnGJFeUh4asxeFG2wYPwTiHo6+BIk7E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BRuVsAVsOM5Md3eB/trfw7dSE/yS1iZjrJwVcoAAqYybjEvKuHn9vITRGemgkGS+r
	 lzmivtHH2tM28Vlflf23nv+oB1V/xpu+00+O6Ux52zkTlb6igCfgwNvpzTAGxNyjDE
	 oHdeXUHoNtoz4FRnAxBq6jBLqAi+8QwROAGTCyuZ/BK5zEShstgyYkoJ3cUpO3GKT0
	 o/BdZCni1+5Ss3A7rCAAeDKB+ogD8d9oIKFcVudKZ/IUMxTeGfmA+RpBqLZSaP38I8
	 z4iuXafH4YdSDB5/D8CmonY6Wkn7bsaZ6llQeET5kq0rB/VvWkGAPfc99w4gemiEgm
	 MgujiO6VDHqMg==
Date: Wed, 8 Jul 2026 16:42:24 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Hongyan Xia <hongyan.xia@transsion.com>
Subject: Re: [RFC 1/3] arm64: kprobes: Do not handle non-XOL faults as
 kprobe faults
Message-Id: <20260708164224.c080a1e834f02ac953007e5c@kernel.org>
In-Reply-To: <8cc07468-804e-4ee1-acad-77bc99af74c6@transsion.com>
References: <20260704234730.46d51c47d75e7d208e7bec9f@kernel.org>
	<20260706083636.159883-1-hupu@transsion.com>
	<20260706083636.159883-2-hupu@transsion.com>
	<20260708094623.9a1d40bed37bce3c7969ad20@kernel.org>
	<8cc07468-804e-4ee1-acad-77bc99af74c6@transsion.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Pu Hu <hupu@transsion.com>, Jiazi Li <jiazi.li@transsion.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "naveen@kernel.org" <naveen@kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "will@kernel.org" <will@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, 8 Jul 2026 05:57:24 +0000
Hongyan Xia <hongyan.xia@transsion.com> wrote:

> Hi Masami,
> 
> On 7/8/2026 8:46 AM, Masami Hiramatsu wrote:
> > On Mon, 6 Jul 2026 08:36:48 +0000
> > Pu Hu <hupu@transsion.com> wrote:
> >
> >> From: Pu Hu <hupu@transsion.com>
> >>
> >> kprobe_fault_handler() handles faults taken while kprobes is in
> >> KPROBE_HIT_SS or KPROBE_REENTER state as faults caused by the
> >> single-stepped instruction.
> >>
> >> That assumption is not always true. While a kprobe is preparing or
> >> executing the out-of-line single-step instruction, other code may run
> >> in that window. For example, perf or trace code can be invoked from the
> >> debug exception path and may take a fault of its own. In that case the
> >> fault did not happen on the kprobe XOL instruction, but the kprobe fault
> >> handler may still try to recover it as a kprobe single-step fault.
> >>
> >> This can corrupt the exception recovery flow and leave the real fault to
> >> be handled with a wrong PC. A typical reproducer is running simpleperf
> >> with preemptirq tracepoints and dwarf callchains while a kprobe is
> >> installed on a frequently executed kernel function.
> >>
> >> Fix this by handling faults in KPROBE_HIT_SS/KPROBE_REENTER only when
> >> the faulting PC points at the current kprobe's XOL instruction. Faults
> >> from any other PC are left to the normal fault handling path.
> >>
> >> This follows the same idea as the x86 fix in commit 6381c24cd6d5
> >> ("kprobes/x86: Fix page-fault handling logic").
> >>
> >> Signed-off-by: Pu Hu <hupu@transsion.com>
> >> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> >> ---
> >>   arch/arm64/kernel/probes/kprobes.c | 14 ++++++++++++++
> >>   1 file changed, 14 insertions(+)
> >>
> >> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> >> index 43a0361a8bf0..e4d2852ce2fb 100644
> >> --- a/arch/arm64/kernel/probes/kprobes.c
> >> +++ b/arch/arm64/kernel/probes/kprobes.c
> >> @@ -285,6 +285,20 @@ int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)
> >>        switch (kcb->kprobe_status) {
> >>        case KPROBE_HIT_SS:
> >>        case KPROBE_REENTER:
> >> +             /*
> >> +              * A fault taken while a kprobe is single-stepping is not
> >> +              * necessarily caused by the instruction in the XOL slot. For
> >> +              * example, tracing or perf code running in this window may take
> >> +              * an unrelated fault.
> >> +              *
> >> +              * Handle the fault here only when the faulting PC is the XOL
> >> +              * instruction of the current kprobe. Otherwise let the normal
> >> +              * fault handling path deal with it.
> >> +              */
> >> +             if (cur->ainsn.xol_insn &&
> >> +                     instruction_pointer(regs) != (unsigned long)cur->ainsn.xol_insn)
> >> +                     break;
> >
> > Can you check Sashiko's comments[1]?
> >
> > [1] https://sashiko.dev/#/patchset/20260706083636.159883-1-hupu%40transsion.com?part=1
> >
> > It seems that it complains about simulated kprobe's case.
> > In that case, cur->ainsn.xol_insn == NULL. The simulation should be done
> > in the kprobe context (which is a debug trap). I'm not sure the arm64
> > can cause NMI in that context, but if it happens and causes a fault,
> > it may cause a problem.
> >
> > So I think we can just ignore the fault on the simulated kprobes.
> >
> > To ensure that, you can just add:
> >
> >          if (cur && !cur->ainsn.xol_insn)
> >                  return 0;
> >
> > at the entry of this function. (and remove redundant cur->ainsn.xol_insn check)
> 
> Right, both cases:
> 
> 1. single-step XOL
> 2. simulated
> 
> have this problem and this patch fixed 1. 2 remains unchanged.
> 
> Ideally we should fix both, but the simulated case seems more
> complicated, and at least we didn't make things worse for 2. So I wonder
> if we can analyze 2 more thoroughly and fix it in a separate patch.

OK, but basically this fault handler is only for the SS XOL,
not for simulated one (as same as x86). So just skip the
simulated case is enough in this patch.
(Note that x86 also have simulated path, and that is not handled
by the fault handler)

Thank you,


> 
> > Thank you,
> >
> >> +
> >>                /*
> >>                 * We are here because the instruction being single
> >>                 * stepped caused a page fault. We reset the current
> >> --
> >> 2.43.0
> >>
> > --
> > Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

