Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD3EC44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 05:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaUeI3qNp2QRpOOJEQpyY+Xbckyb97iqqtxaVt1svzE=; b=LdcQGzRd3wjoBa
	S+qnh18I0buYkURCayxwGSDlpUp4OoXnUTsp0NcDDutHgIKIcVTVuQEB50V+HTz8iuCFRNBt7M7WV
	lARr0kD3DQaArs8E5TBbLjw5Fh5BwzFwxdAEct8+TUBL7r7lbbL4JgcounREwHleSQopXkaJKabCR
	5+Ukk3hLGx+V0G6Dpzxn/ZbLAszeOgZUrYVydIXxkddT9zZEb7ZdVtZWS7DH+yjEQhDPn4DDxGLAU
	7YpUrfp+mjfKPYB3CAUeWt3JJOon6lwdkThtAivxIjsyC9rGpQdRwtG9zVyvtDDJfbLmI/AvbNCiy
	vZtmlCJqezr0LwLZ47Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlKRL-00000004mGl-14nT;
	Sun, 19 Jul 2026 05:51:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlKRK-00000004mGe-1TrA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 05:51:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4547843613;
	Sun, 19 Jul 2026 05:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144311F000E9;
	Sun, 19 Jul 2026 05:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784440309;
	bh=BaUeI3qNp2QRpOOJEQpyY+Xbckyb97iqqtxaVt1svzE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=n9ZueUneYX4xhMusRkJGUDPB6+QxxLyPm1giQYPf07Kzu04p+N9LjDasWd0/tOfNB
	 lXeDkClJCu37tIk6F34XbMC3KQkIcw+hrCnuHeTudkfuBcBT311N+DlvSuY0m8wG7I
	 7Lk2qsTzEb2J2NY9ABGF7kxQXQ49yyY7djuPwdsAoIyZANDxmbRoxjdVK1BlOt9jnU
	 xbwJ37iVlmjU6Iq92hahEdtWUyP1jVeekgQj+IoamUVfOnCDdDd2rkZQtWKD2XQNZA
	 ORfCCeEodldqP9IggZHjEJp+OHVJsK6Lt0uNbq37C4Qcl3MZnqI7YJaSKKhQRBR9d2
	 FAKH+1s1omjCQ==
Date: Sun, 19 Jul 2026 14:51:43 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Hongyan Xia <hongyan.xia@transsion.com>
Subject: Re: [RFC v3 2/2] arm64: kprobes: Allow reentering kprobes while
 single-stepping
Message-Id: <20260719145143.78fdbc359174e1180a5646be@kernel.org>
In-Reply-To: <be182a18-4cea-445d-a319-1ed3a6c17598@transsion.com>
References: <20260710063242.228714-1-hupu@transsion.com>
	<20260710063242.228714-3-hupu@transsion.com>
	<aljbf_RmOd9U2KDT@willie-the-truck>
	<0f049d38-b7f6-47f0-a410-95ad2aee7fd4@transsion.com>
	<alj2uxE1M8mcMBhA@willie-the-truck>
	<e0e800f5-a6f8-48ae-b55c-5c3d928bf234@transsion.com>
	<aloLb0j8sg0usmAF@willie-the-truck>
	<be182a18-4cea-445d-a319-1ed3a6c17598@transsion.com>
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
Cc: Pu Hu <hupu@transsion.com>, Jiazi Li <jiazi.li@transsion.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "naveen@kernel.org" <naveen@kernel.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, Will Deacon <will@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 17 Jul 2026 11:31:31 +0000
Hongyan Xia <hongyan.xia@transsion.com> wrote:

> On 7/17/2026 7:01 PM, Will Deacon wrote:
> > On Fri, Jul 17, 2026 at 01:51:12AM +0000, Hongyan Xia wrote:
> >> On 7/16/2026 11:20 PM, Will Deacon wrote:
> >>> On Thu, Jul 16, 2026 at 02:38:58PM +0000, Pu Hu wrote:
> >>>> On 7/16/2026 9:24 PM, Will Deacon wrote:
> >>>>> On Fri, Jul 10, 2026 at 06:32:55AM +0000, Pu Hu wrote:
> >>>>>> From: Pu Hu <hupu@transsion.com>
> >>>>>>
> >>>>>> A kprobe can be hit while another kprobe is in KPROBE_HIT_SS state. This
> >>>>>> can happen when tracing or perf code runs from the debug exception path
> >>>>>> while the first kprobe is preparing or executing its out-of-line
> >>>>>> single-step instruction.
> >>>>>
> >>>>> I don't understand this part. The single-step runs with debug exceptions
> >>>>> disabled (kprobes_save_local_irqflag() sets PSTATE.D) so how do we end
> >>>>> up taking one?
> >>>>
> >>>> You are right that the single-step runs with debug exceptions disabled.
> >>>> However, the case I was referring to is not a hardware breakpoint or a
> >>>> software-step exception, but another Breakpoint Instruction exception
> >>>> generated by executing a BRK instruction. A BRK instruction exception is
> >>>> not masked by PSTATE.D, so it can still be taken while handling a kprobe.
> >>>>
> >>>> As far as I understand the architecture, there are two different cases here:
> >>>>
> >>>>      - Breakpoint Instruction exceptions, generated by executing a BRK
> >>>>        instruction.
> >>>>      - Breakpoint exceptions, generated by the debug logic, for example by
> >>>>        programmed breakpoint registers.
> >>>>
> >>>> PSTATE.D masks debug exceptions such as hardware breakpoints,
> >>>> watchpoints and software-step exceptions, but it does not mask
> >>>> Breakpoint Instruction exceptions generated by BRK. This also seems
> >>>> consistent with the pseudocode for BRK,
> >>>> Arch64.SoftwareBreakpoint(imm16), which does not appear to check
> >>>> PSTATE.D before taking the exception.
> >>>>
> >>>> Therefore, even if kprobes_save_local_irqflag() sets PSTATE.D while
> >>>> handling the first kprobe, if the code executed from that path reaches
> >>>> another instruction patched with BRK, it can still take a Breakpoint
> >>>> Instruction exception. In other words, the nested case I mentioned is
> >>>> another kprobe BRK being hit, not a hardware debug exception or a
> >>>> software-step exception.
> >>>
> >>> Yes, that's correct, but if we're doing the out-of-line step, how do we
> >>> end up executing a BRK? Or are you saying that it's the kprobes
> >>> BRK64_OPCODE_KPROBES_SS instruction that we use to implement the
> >>> single-step that is the problem? If so, how does taking that exception
> >>> result in us executing tracing or perf code?
> >>>
> >>> Sorry for all the questions, I just haven't understood what's going on
> >>> here from the commit message.
> >>
> >> The key is that, when you use 'perf --call-graph dwarf' to sample
> >> certain events, kernel perf code will sample a piece of user stack each
> >> time those events are hit, and copy_to/from_user() triggers page faults.
> >> Say you are profiling preempt_enable events:
> >>
> >> 1st BRK -> preempt_disable() -> debug_exception() -> set SS state ->
> >> preempt_enable() -> triggers perf -> perf_sample() -> sample user stack
> >> using copy_to/from_user() -> page fault or 2nd BRK on the page fault path.
> >>
> >> The key is perf sampling the user stack while the 1st BRK is still
> >> running. When a page fault is hit, a can of worms is released, including
> >> a possible 2nd BRK.
> > 
> > Thanks. So perf is run synchronously from the debug exception entry path,
> 
> Yes, exactly.
> 
> > rather than because of a second exception taking place. Got it. But then
> > it sounds like we should really make the debug exception handling path (at
> > least, the part that runs for handling the kprobe step) noinstr to avoid
> > getting into this state to begin with. Is that practical?
> 
> Not sure about making the whole path noinstr (@Masami might have a 
> better opinion on this than me). Personally I don't mind either 
> disallowing it or making it correct.

Yeah I agree with making it noinstr. 

> 
> But it might be a good idea not to diverge too much between ISAs. This 
> patch is pretty much mirroring what the x86 side handles this situation.

I don't mind modifying how it is handled in each architecture, since
this part is too much depending on the ISA.

Thanks,


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

