Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C0BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 00:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPa4plMMy8iNMbmyGa8gqrqo+2w2vQ9zdj+sw1yvhu4=; b=rVK0PW79wdYigF
	MeD4lix62MZsRUrwLk2t7GiHR2Bh9Lafv5VFlSrwiVIhXBC1A7C9bLZv1SHoccQ2l4Cp6MAOn0ZnA
	cIPhJIaKJgIxRIoFiBlzQ/eHmotwKc8aIkJqETpkjWLEQSvWCFqL8/tvJEoeqbK/KG/2HhSXqXsHo
	l8HDWfomcQfusFCkZKz0sfkrAE0a6pdP0KxqAKXuhMR4TNwda6sO/hVHT1lQ0WDRl+an4z49bZHuc
	xZkb8sNTNEoR6Qw8aRFL6i50ngbxXbwBcAhKF4IOdP95UdezFHuQQrNnZsH0DHiBkndBBjE9uOhHg
	zPfJdvcY5/bn+j+VKqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whGYB-0000000G4eW-3x8t;
	Wed, 08 Jul 2026 00:54:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whGYA-0000000G4eK-3KKz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 00:54:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E469432DC;
	Wed,  8 Jul 2026 00:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CA91F000E9;
	Wed,  8 Jul 2026 00:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783472046;
	bh=ZPa4plMMy8iNMbmyGa8gqrqo+2w2vQ9zdj+sw1yvhu4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=N2Jx82NDbi6EzBMJXNZ+eQya5X1w9wWA/Dumuygz7IlwXT7d5gZZcIGhWwpYmv49U
	 cObt4MJcGrCZpDMIVerxelhPQY3BRpujm7Gx77KwqWJjQJRUoLBr1INMp+x4EYHZWa
	 5UNPl+F7ChI/S4WckCJCNrJ9TsBSOfbP4tpZ1joBzf1xyia0VcPLzYbVyqsKcA5ENq
	 1GqQSMvbxl0FoEKTukuqOwz+DwpjEjHkYvbb1FJeEyGAVtctAS8iOO40k6vKB+/Eqm
	 OaEfG9ICQlsQ24OMyY6SnZJgI8L5e/WWHdUklazZ1NXLmCgHNaq31J1HSqLAW4z48v
	 8lg3xJJ85tjSQ==
Date: Wed, 8 Jul 2026 09:54:00 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Pu Hu <hupu@transsion.com>
Subject: Re: [RFC 2/3] arm64: kprobes: Allow reentering kprobes while
 single-stepping
Message-Id: <20260708095400.7582bc9589fd9da925aa9c1d@kernel.org>
In-Reply-To: <20260706083636.159883-3-hupu@transsion.com>
References: <20260704234730.46d51c47d75e7d208e7bec9f@kernel.org>
	<20260706083636.159883-1-hupu@transsion.com>
	<20260706083636.159883-3-hupu@transsion.com>
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

On Mon, 6 Jul 2026 08:36:49 +0000
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

Can you also check the Sashiko comment?

https://sashiko.dev/#/patchset/20260706083636.159883-1-hupu%40transsion.com?part=2

This seems indicating potentially brakage of reenter kprobes on arm64.
But is it possible to hit another kprobe while SS on arm64? It is
the same question about the previous one, can NMI happens during
the single stepping? (maybe yes, because it is non-maskable)

Anyway, for making it safer, we need to add saved_irqflags to prev_kprobe.

Thank you,

> 
> Signed-off-by: Pu Hu <hupu@transsion.com>
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> ---
>  arch/arm64/kernel/probes/kprobes.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index e4d2852ce2fb..764b2228cca0 100644
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

