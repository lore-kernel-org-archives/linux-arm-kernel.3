Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F90C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gvB5qwbT78hXA6WigUj4DzknIHPDynctPCi9ezZArQ=; b=hGEaq73rXm0WQD
	f8YOxm7v7DksDeAVyfPTuB4gR4B1CqNhbDVumQAySj7JA6h8xIjqdw3FMZGcMXxfiZTf0RTtGlI9L
	EHjEdnZVk5cELcLbes9GMqrKcfRDxG2DWZvXidZ7iM9bnHGv+49mX6jfkYtfM+LKnoSX8EXt0OKIQ
	4u1Hz1GProjN2d8lg1UqlWgCNb3NRY4y9o3iWrm8lchtPcAJ7H4NQl08c9/PyDUne8LbEm3qOROsE
	Aop5nONc/gYm3VIfAXyFgVaPK3q+s9HXNVeajf1RjKDa2UhcO+tP2jroAVsiTRk+B1rGQ6+ZNmfdz
	s2z1aY/cf07L6FrNLERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Ue-00000004AtC-4A6t;
	Fri, 10 Jul 2026 05:09:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Ud-00000004AsT-0IFV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:09:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B5BD66001A;
	Fri, 10 Jul 2026 05:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD641F000E9;
	Fri, 10 Jul 2026 05:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783660181;
	bh=/gvB5qwbT78hXA6WigUj4DzknIHPDynctPCi9ezZArQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RV6c1iXakob2plSYioZq0ZlQFxbU0si4E0zbzqFMhpsnIOL/qW84hVY3I/rBp5KA6
	 8jpgSJr3mGUxqYb/QpBzEOqPCMAm4KDqMvOFIY4umfyT/9gwFRbUIhZ1HWTJ3Dx5Ok
	 s2KJUJqmWTd3MvL7/D5HJXiOseK9GWy8mtpjqoRhSXe1KQemCk3LuPvymovPU+SsIz
	 7l+sQk1Hg9fW2P4OvWMqa1I8el+LjzM0gEX2DAr0ZPhfWrVhdntU0er+Z1FYce0wRg
	 m4EREBILvvVmtbsc4BdUA+1gmoBfAYJeTeHhFBq9sHZjQFKw7Xr/oNgEhcLmJsQ9GR
	 IrpcOLcYdb/1A==
Date: Fri, 10 Jul 2026 14:09:36 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Pu Hu <hupu@transsion.com>
Subject: Re: [RFC v2 2/3] arm64: kprobes: Allow reentering kprobes while
 single-stepping
Message-Id: <20260710140936.8788416564452e490c71634c@kernel.org>
In-Reply-To: <20260709142215.226872-3-hupu@transsion.com>
References: <20260709142215.226872-1-hupu@transsion.com>
	<20260709142215.226872-3-hupu@transsion.com>
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
Cc: Hongyan Xia <hongyan.xia@transsion.com>, Jiazi Li <jiazi.li@transsion.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "naveen@kernel.org" <naveen@kernel.org>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "will@kernel.org" <will@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 9 Jul 2026 14:22:25 +0000
Pu Hu <hupu@transsion.com> wrote:

> From: Pu Hu <hupu@transsion.com>
> 
> A kprobe can be hit while another kprobe is in KPROBE_HIT_SS state. This
> can happen when tracing or perf code runs from the debug exception path
> while the first kprobe is preparing or executing its out-of-line
> single-step instruction.
> 
> Currently arm64 treats a kprobe hit in KPROBE_HIT_SS as unrecoverable,
> the same as a hit in KPROBE_REENTER. This is too strict. A hit in
> KPROBE_HIT_SS is still a one-level reentry and can be handled by saving
> the current kprobe state and setting up single-step for the new probe,
> just like reentry from KPROBE_HIT_ACTIVE or KPROBE_HIT_SSDONE.
> 
> The truly unrecoverable case is hitting another kprobe while already in
> KPROBE_REENTER, because the reentry save area has already been consumed.
> 
> Move KPROBE_HIT_SS to the recoverable reentry cases and leave
> KPROBE_REENTER as the unrecoverable nested reentry case.
> 
> This mirrors the x86 fix in commit 6a5022a56ac3
> ("kprobes/x86: Allow to handle reentered kprobe on single-stepping").
> 

Hi, as Sashiko commented, we have to save the saved_irqflag to
prev_kprobbe.

https://sashiko.dev/#/patchset/20260709142215.226872-1-hupu%40transsion.com?part=2

Thank you,

> Signed-off-by: Pu Hu <hupu@transsion.com>
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> ---
>  arch/arm64/kernel/probes/kprobes.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 798e4b091d1a..2ca5916eca2f 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -240,10 +240,16 @@ static int __kprobes reenter_kprobe(struct kprobe *p,
>  	switch (kcb->kprobe_status) {
>  	case KPROBE_HIT_SSDONE:
>  	case KPROBE_HIT_ACTIVE:
> +	case KPROBE_HIT_SS:
> +		/*
> +		 * A probe can be hit while another kprobe is preparing or
> +		 * executing its XOL single-step instruction. This is still a
> +		 * recoverable one-level reentry, so handle it in the same way as
> +		 * reentry from KPROBE_HIT_ACTIVE or KPROBE_HIT_SSDONE.
> +		 */
>  		kprobes_inc_nmissed_count(p);
>  		setup_singlestep(p, regs, kcb, 1);
>  		break;
> -	case KPROBE_HIT_SS:
>  	case KPROBE_REENTER:
>  		pr_warn("Failed to recover from reentered kprobes.\n");
>  		dump_kprobe(p);
> -- 
> 2.43.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

