Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC09C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqEkOfqemOuBq7MfK7NLzkx6aModADt/bX/v6BBIpLk=; b=eJ99qhzFaw9Un66mO7ddUF8zUg
	314lSjlDdeyMFweQ6j5QtZLxmBXQN43TWsrmdVy0yc7FxVH9Z9x3ehFmZqVRBai60Nn6i1MSTE8yo
	X//+kmLlgPcj63YPHuBm9W1Y0k3t2ArRAko4wjFav2gpt4SYVkqYDL5W2gTh5ei6xAyBj6edOtD00
	dC8N2ujWTAfL7+SNzA3z+l6g9nlo3Yw6k4+gOk0xykUbAZK0iwU9+w07cjUXr+6hXqZGhSr3YZHzB
	Wy7A/bWntjstVNuT84xQE2m9N+x396pr9/h3RVzQGxKGgE7jdEHA2ByssgNIeMfyzcdM0KT83uYje
	rs0RaFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNt6-000000001vX-1Pg0;
	Thu, 16 Jul 2026 15:20:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNt4-000000001vK-3KQM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 15:20:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D550860A63;
	Thu, 16 Jul 2026 15:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440B71F000E9;
	Thu, 16 Jul 2026 15:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784215233;
	bh=xqEkOfqemOuBq7MfK7NLzkx6aModADt/bX/v6BBIpLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NxWAbXAfxER1bDsr9+Ry25MKcWs9G8aOuDSXUXXyyWEJhIVKOXhlhYe8L3E1790PK
	 tlz3IoqgzPulnjUjJlJZmJEIM8+PDVMAuKWrlJ80ZsNa0hg9RD6m/UQwFUOM9vTIPD
	 PsXIoumb7pNF+9G2N+JjYBfD5CU+OsQ+apSRBW0jvEfXcocsiXp+AVNwAfmRL/RJ6+
	 oASNnepTWd6neQb47wlJUENGA5sLnSs51kSAT2vPwaLw1wANe0N2e25/JK/YdsCfIl
	 zChHic5ALc47Ql0oWQgpHO8eeSNpTx/wZ9YqIdo5qbVhXyJvGxSH2Tu4Z+NQsQIMIx
	 c6OjcT39f6LEQ==
Date: Thu, 16 Jul 2026 16:20:27 +0100
From: Will Deacon <will@kernel.org>
To: Pu Hu <hupu@transsion.com>
Subject: Re: [RFC v3 2/2] arm64: kprobes: Allow reentering kprobes while
 single-stepping
Message-ID: <alj2uxE1M8mcMBhA@willie-the-truck>
References: <20260710063242.228714-1-hupu@transsion.com>
 <20260710063242.228714-3-hupu@transsion.com>
 <aljbf_RmOd9U2KDT@willie-the-truck>
 <0f049d38-b7f6-47f0-a410-95ad2aee7fd4@transsion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f049d38-b7f6-47f0-a410-95ad2aee7fd4@transsion.com>
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
Cc: Hongyan Xia <hongyan.xia@transsion.com>, Jiazi Li <jiazi.li@transsion.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "naveen@kernel.org" <naveen@kernel.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "davem@davemloft.net" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2026 at 02:38:58PM +0000, Pu Hu wrote:
> On 7/16/2026 9:24 PM, Will Deacon wrote:
> > On Fri, Jul 10, 2026 at 06:32:55AM +0000, Pu Hu wrote:
> >> From: Pu Hu <hupu@transsion.com>
> >>
> >> A kprobe can be hit while another kprobe is in KPROBE_HIT_SS state. This
> >> can happen when tracing or perf code runs from the debug exception path
> >> while the first kprobe is preparing or executing its out-of-line
> >> single-step instruction.
> > 
> > I don't understand this part. The single-step runs with debug exceptions
> > disabled (kprobes_save_local_irqflag() sets PSTATE.D) so how do we end
> > up taking one?
>
> You are right that the single-step runs with debug exceptions disabled.
> However, the case I was referring to is not a hardware breakpoint or a
> software-step exception, but another Breakpoint Instruction exception
> generated by executing a BRK instruction. A BRK instruction exception is 
> not masked by PSTATE.D, so it can still be taken while handling a kprobe.
> 
> As far as I understand the architecture, there are two different cases here:
> 
>    - Breakpoint Instruction exceptions, generated by executing a BRK
>      instruction.
>    - Breakpoint exceptions, generated by the debug logic, for example by
>      programmed breakpoint registers.
> 
> PSTATE.D masks debug exceptions such as hardware breakpoints, 
> watchpoints and software-step exceptions, but it does not mask 
> Breakpoint Instruction exceptions generated by BRK. This also seems 
> consistent with the pseudocode for BRK, 
> Arch64.SoftwareBreakpoint(imm16), which does not appear to check 
> PSTATE.D before taking the exception.
> 
> Therefore, even if kprobes_save_local_irqflag() sets PSTATE.D while 
> handling the first kprobe, if the code executed from that path reaches 
> another instruction patched with BRK, it can still take a Breakpoint 
> Instruction exception. In other words, the nested case I mentioned is 
> another kprobe BRK being hit, not a hardware debug exception or a 
> software-step exception.

Yes, that's correct, but if we're doing the out-of-line step, how do we
end up executing a BRK? Or are you saying that it's the kprobes
BRK64_OPCODE_KPROBES_SS instruction that we use to implement the
single-step that is the problem? If so, how does taking that exception
result in us executing tracing or perf code?

Sorry for all the questions, I just haven't understood what's going on
here from the commit message.

Will

