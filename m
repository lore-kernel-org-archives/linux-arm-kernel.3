Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9C2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoDbn2USP7rhV4t6L+eml08WCJvJ3oAL0lApnhJ84Ds=; b=A3S86jJBYNVNox
	W3R1SjgfjEC28DTX7CzFIp9+2JpcJA1K0/vqHwpSuDq2TXoh+wBDw2Qm0MxvcxMko5LPS444XWE+4
	gmfCBxzkUnChstMfTDVvLVhtRAMpIGNQPQonYntG/Ps0gk49UhUGlEjm6kRlXeEPT7GRBjkEOFpzw
	WSCp5Jx1KHA7hmQbtxvrYDUGRDSpyHuKDxWSWBJApWaOFuXjLl8N/SGF6kp19+gu/7mhjQ4Rtg6RN
	YiIBpHvJjSoCSmzx3tR7oYoqRxhfqClHIhYj5a7WDTW3VULuchoyLNmdjiX3IpGh5zWYJWT/PbH91
	f5oGKgGMys/DkAifmi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT1L-0000000HFi2-2DCB;
	Wed, 08 Jul 2026 14:13:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT1J-0000000HFhV-3si4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:13:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0344760008;
	Wed,  8 Jul 2026 14:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84A51F000E9;
	Wed,  8 Jul 2026 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783519980;
	bh=DoDbn2USP7rhV4t6L+eml08WCJvJ3oAL0lApnhJ84Ds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LURa7VZD2J7mM+oWfn8gDUQhA8YEbMA3yGnJsR2SzmPa4o2NGjVSNkNcEdH3zaiia
	 bDw3ICsi9UD1I01KUr6EmwGJ1BwiesNT5wzR2Hzszl0p/v3ACYhZlNsnowUpPLcDkT
	 TRx7iWSW7YZ08PBqtZpehbvIruqAGQfkOIXsPqtawlUkjrR3p9CUrhj69qS8W3TrD1
	 BXZ4+8UTz4Mz2jHsUq/ThUki4yrH0mDW5FobotZZ7CkMilWn+HukbG1akPoZXg3rkW
	 mfpeHKTP64mGmLNvSFdkrXEWoJrZbad6veXU+sPfrnTCmkgxQsu6Yo6v4co3TpVUtR
	 zC22/06T0N0DA==
Date: Wed, 8 Jul 2026 23:12:55 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Hongyan Xia <hongyan.xia@transsion.com>
Subject: Re: [RFC 2/3] arm64: kprobes: Allow reentering kprobes while
 single-stepping
Message-Id: <20260708231255.4162b7acfdb4a703aa076a33@kernel.org>
In-Reply-To: <68189403-9728-4938-8ee2-924e4702eab7@transsion.com>
References: <20260704234730.46d51c47d75e7d208e7bec9f@kernel.org>
	<20260706083636.159883-1-hupu@transsion.com>
	<20260706083636.159883-3-hupu@transsion.com>
	<20260708095400.7582bc9589fd9da925aa9c1d@kernel.org>
	<68189403-9728-4938-8ee2-924e4702eab7@transsion.com>
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

On Wed, 8 Jul 2026 07:12:39 +0000
Hongyan Xia <hongyan.xia@transsion.com> wrote:

> On 7/8/2026 8:54 AM, Masami Hiramatsu wrote:
> > On Mon, 6 Jul 2026 08:36:49 +0000
> > Pu Hu <hupu@transsion.com> wrote:
> >
> >> From: Pu Hu <hupu@transsion.com>
> >>
> >> A kprobe can be hit while another kprobe is in KPROBE_HIT_SS state. This
> >> can happen when tracing or perf code runs from the debug exception path
> >> while the first kprobe is preparing or executing its out-of-line
> >> single-step instruction.
> >>
> >> Currently arm64 treats a kprobe hit in KPROBE_HIT_SS as unrecoverable,
> >> the same as a hit in KPROBE_REENTER. This is too strict. A hit in
> >> KPROBE_HIT_SS is still a one-level reentry and can be handled by saving
> >> the current kprobe state and setting up single-step for the new probe,
> >> just like reentry from KPROBE_HIT_ACTIVE or KPROBE_HIT_SSDONE.
> >>
> >> The truly unrecoverable case is hitting another kprobe while already in
> >> KPROBE_REENTER, because the reentry save area has already been consumed.
> >>
> >> Move KPROBE_HIT_SS to the recoverable reentry cases and leave
> >> KPROBE_REENTER as the unrecoverable nested reentry case.
> >>
> >> This mirrors the x86 fix in commit 6a5022a56ac3
> >> ("kprobes/x86: Allow to handle reentered kprobe on single-stepping").
> >
> > Can you also check the Sashiko comment?
> >
> > https://sashiko.dev/#/patchset/20260706083636.159883-1-hupu%40transsion.com?part=2
> >
> > This seems indicating potentially brakage of reenter kprobes on arm64.
> > But is it possible to hit another kprobe while SS on arm64? It is
> > the same question about the previous one, can NMI happens during
> > the single stepping? (maybe yes, because it is non-maskable)
> 
> It is possible as this is what we hit. There are
> preempt_enable/disable() calls during SS which can trigger perf events
> sampling the user stack, which may then trigger page faults and send the
> CPU into one more level of exception context. I believe this is what you
> saw in 6a5022a56ac3?

Ah, it was more generic perf NMI case, not only preempt_enable/disable().
But anyway, the result is same.

> > Anyway, for making it safer, we need to add saved_irqflags to prev_kprobe.
> 
> Yes, this seems to be a legit bug that needs to be fixed. Thank you.

OK, thanks!


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

