Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EF7C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sy+3CQp5uMIEjT1xFCDDjV/XqRXnSP0C+Ski+YXq6Bg=; b=C4aYBSXAWaIkJ7tw9TkD7iPqhm
	JkAOuzA1ztBn3h+bVmmpxWorE/ijnQpW0Wdo4KiveMl9G8BwoqWq1Xp0S1wQjrz5HJdF05lB0lB65
	CfNIT3tCGbJXEDoJdR5oCbE/hKwwJTfRyohGtTeiWYIFTA2qz45/uRuhh1du4Qjhic0sWxvDHY6Qn
	uF+NdEsDKLRkCcm2TvBYIWkaOtz2tQkE0RNtGhZ1Rkz+zJ2+MMvUI79GKR4SFAB1P8Evx+7qYaRZq
	ygFY2d0dy+LUz32wiFVzHLXLcNS7I5u04Ui1opSuthuDY6XVcmWwbPne2kmwuvCwPxQdcfuThtBUn
	vByjikpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgJh-000000025sp-3cED;
	Fri, 17 Jul 2026 11:01:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgJa-000000025ns-09V8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 11:01:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C889A4362D;
	Fri, 17 Jul 2026 11:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790D41F00A3A;
	Fri, 17 Jul 2026 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286069;
	bh=sy+3CQp5uMIEjT1xFCDDjV/XqRXnSP0C+Ski+YXq6Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jKm+fA9Btt2zwJNSK7aZF5mI4KNi2XmQjJiBVzsQvzda44O/cV0gCxm7lMHLkjqHa
	 AAKsPeOeNs0bBOZmByzA3mvEkJnSHWE/Z7Fc2k+evvgGBTWkgApggPPlx3i5upSKDG
	 fHb5FSMpwhaqGR2CQZorLurTTm4Jmod2DPRwm82YVX2DcxS3j/tB7kVL+OiRPGk8wo
	 QZC0aPUBjqQiXvxNNiBeqzj24b4Y/CukxCa3twj8xYlTS2TpM4zkr6DSYsbzDGmykG
	 oodfOswcQKjj6RAhTyQc6X51E0V1I5+r4OmuXlIVa85Vu2DMHLQRnxIuM/o9iIXgez
	 G5py+HnHlPsuw==
Date: Fri, 17 Jul 2026 12:01:03 +0100
From: Will Deacon <will@kernel.org>
To: Hongyan Xia <hongyan.xia@transsion.com>
Subject: Re: [RFC v3 2/2] arm64: kprobes: Allow reentering kprobes while
 single-stepping
Message-ID: <aloLb0j8sg0usmAF@willie-the-truck>
References: <20260710063242.228714-1-hupu@transsion.com>
 <20260710063242.228714-3-hupu@transsion.com>
 <aljbf_RmOd9U2KDT@willie-the-truck>
 <0f049d38-b7f6-47f0-a410-95ad2aee7fd4@transsion.com>
 <alj2uxE1M8mcMBhA@willie-the-truck>
 <e0e800f5-a6f8-48ae-b55c-5c3d928bf234@transsion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0e800f5-a6f8-48ae-b55c-5c3d928bf234@transsion.com>
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
Cc: Pu Hu <hupu@transsion.com>, Jiazi Li <jiazi.li@transsion.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "naveen@kernel.org" <naveen@kernel.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "davem@davemloft.net" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2026 at 01:51:12AM +0000, Hongyan Xia wrote:
> On 7/16/2026 11:20 PM, Will Deacon wrote:
> > On Thu, Jul 16, 2026 at 02:38:58PM +0000, Pu Hu wrote:
> >> On 7/16/2026 9:24 PM, Will Deacon wrote:
> >>> On Fri, Jul 10, 2026 at 06:32:55AM +0000, Pu Hu wrote:
> >>>> From: Pu Hu <hupu@transsion.com>
> >>>>
> >>>> A kprobe can be hit while another kprobe is in KPROBE_HIT_SS state. This
> >>>> can happen when tracing or perf code runs from the debug exception path
> >>>> while the first kprobe is preparing or executing its out-of-line
> >>>> single-step instruction.
> >>>
> >>> I don't understand this part. The single-step runs with debug exceptions
> >>> disabled (kprobes_save_local_irqflag() sets PSTATE.D) so how do we end
> >>> up taking one?
> >>
> >> You are right that the single-step runs with debug exceptions disabled.
> >> However, the case I was referring to is not a hardware breakpoint or a
> >> software-step exception, but another Breakpoint Instruction exception
> >> generated by executing a BRK instruction. A BRK instruction exception is
> >> not masked by PSTATE.D, so it can still be taken while handling a kprobe.
> >>
> >> As far as I understand the architecture, there are two different cases here:
> >>
> >>     - Breakpoint Instruction exceptions, generated by executing a BRK
> >>       instruction.
> >>     - Breakpoint exceptions, generated by the debug logic, for example by
> >>       programmed breakpoint registers.
> >>
> >> PSTATE.D masks debug exceptions such as hardware breakpoints,
> >> watchpoints and software-step exceptions, but it does not mask
> >> Breakpoint Instruction exceptions generated by BRK. This also seems
> >> consistent with the pseudocode for BRK,
> >> Arch64.SoftwareBreakpoint(imm16), which does not appear to check
> >> PSTATE.D before taking the exception.
> >>
> >> Therefore, even if kprobes_save_local_irqflag() sets PSTATE.D while
> >> handling the first kprobe, if the code executed from that path reaches
> >> another instruction patched with BRK, it can still take a Breakpoint
> >> Instruction exception. In other words, the nested case I mentioned is
> >> another kprobe BRK being hit, not a hardware debug exception or a
> >> software-step exception.
> > 
> > Yes, that's correct, but if we're doing the out-of-line step, how do we
> > end up executing a BRK? Or are you saying that it's the kprobes
> > BRK64_OPCODE_KPROBES_SS instruction that we use to implement the
> > single-step that is the problem? If so, how does taking that exception
> > result in us executing tracing or perf code?
> > 
> > Sorry for all the questions, I just haven't understood what's going on
> > here from the commit message.
> 
> The key is that, when you use 'perf --call-graph dwarf' to sample 
> certain events, kernel perf code will sample a piece of user stack each 
> time those events are hit, and copy_to/from_user() triggers page faults. 
> Say you are profiling preempt_enable events:
> 
> 1st BRK -> preempt_disable() -> debug_exception() -> set SS state -> 
> preempt_enable() -> triggers perf -> perf_sample() -> sample user stack 
> using copy_to/from_user() -> page fault or 2nd BRK on the page fault path.
> 
> The key is perf sampling the user stack while the 1st BRK is still 
> running. When a page fault is hit, a can of worms is released, including 
> a possible 2nd BRK.

Thanks. So perf is run synchronously from the debug exception entry path,
rather than because of a second exception taking place. Got it. But then
it sounds like we should really make the debug exception handling path (at
least, the part that runs for handling the kprobe step) noinstr to avoid
getting into this state to begin with. Is that practical?

Will

