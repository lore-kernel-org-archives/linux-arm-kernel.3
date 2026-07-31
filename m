Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CD8C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/POiDSF4+IDt70JCBdZJdIZK3UUd6KqN9kSgrd/+PSA=; b=iv1ytgr9vVwRKp6blfFwvgP/ZZ
	FyF9bAXIQOjKk8Ve/JpFZOjW1TGlGzvXwsOEIXMrz6uFgKcjXJRLJnPV6yg9GpKwTxewVvjW9PldO
	Zy+Xv7UjIMQD+2nYr1DwIxA4eVCOQcvJWNL3Vzgzyqa68PEWn80BOEkLzHhd+MvuNWhYvyXRAjKEA
	M7K4h5grgvkVF7IkoxFCXq6WnyK4A6dz0mTVkfLyFV30s12qZpFo9TKDmOJolOSx8aQOvjXFBLfGA
	QB4lgj8oPsfaWh8h01Suwq0qVgHzgMT14ZOJlcTYOCgBYsxXZLXh0AZEIn9FYduykrvrgyMUZ8co8
	BqvsmQsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppqX-0000000Cy13-3AES;
	Fri, 31 Jul 2026 16:12:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppqV-0000000Cy0M-2RXV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:12:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15FAF204C;
	Fri, 31 Jul 2026 09:12:22 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAF1C3F86F;
	Fri, 31 Jul 2026 09:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785514346; bh=OIrbsNtLBKqeLLiyTmESOoHaJ+8BZ8ouhX3sjsjrM2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKRnAsadszwh0OBdqjd4fc4kmNwbh8RndSsUlRaaR32LyiuOp2fTCLLcgkfvwdBUJ
	 D5hWgZKuZz357hFEDQu64Wh29dOX+/+7SHrYKCvHI9U3dQoXUS0WJIkA3u7OcQoplt
	 Fw5rXoJblKMhfAu75Yr96Qu/WYf06FMIC+BnnhDA=
Date: Fri, 31 Jul 2026 17:12:22 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 8/9] arm64/kprobes: Drop the XOL single-step fault PC
 check
Message-ID: <amzJZoxnpScpKWSR@J2N7QTR9R3>
References: <cover.1785153469.git.hongyan.xia@transsion.com>
 <747c80a43d3345cae59ec1456dfff45d237981dc.1785153469.git.hongyan.xia@transsion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <747c80a43d3345cae59ec1456dfff45d237981dc.1785153469.git.hongyan.xia@transsion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_091228_280189_FB881B97 
X-CRM114-Status: GOOD (  23.06  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jul 27, 2026 at 12:25:46PM +0000, Hongyan Xia wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> With the armed single-step window closed (the whole path noinstr, and
> every piece of instrumentable code confined to instrumentation windows
> that run in KPROBE_HIT_ACTIVE/HIT_SSDONE state), no code other than the
> XOL instruction itself can execute while the state is KPROBE_HIT_SS or
> KPROBE_REENTER. A page fault taken in those states therefore necessarily
> originates from the XOL instruction, and the faulting-PC comparison is
> redundant; revert to handling all such faults as single-step faults (as
> before commit 879a6754d3d1).
> 
> The simulated-kprobe early bail is kept: simulated probes have no XOL
> slot and execute (inside an instrumentation window) in debug trap
> context, so a fault there can still come from the simulation handlers
> and must not be treated as a single-step fault.

As commented on an earlier patch, to fix this properly I think we have
to make the simulation noinstr-safe.

Mark.

> 
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> ---
>  arch/arm64/kernel/probes/kprobes.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 1658b6acd803..73bbbcdbbfe5 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -309,18 +309,6 @@ int noinstr kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)
>  	switch (kcb->kprobe_status) {
>  	case KPROBE_HIT_SS:
>  	case KPROBE_REENTER:
> -		/*
> -		 * A page fault taken while in KPROBE_HIT_SS or
> -		 * KPROBE_REENTER state is only attributable to kprobe
> -		 * single-stepping if the faulting PC points to the
> -		 * current kprobe's XOL instruction. If the fault occurred
> -		 * elsewhere (e.g. in perf or tracing code invoked from the
> -		 * debug exception path), leave it for the normal page fault
> -		 * handler to process.
> -		 */
> -		if (instruction_pointer(regs) != (unsigned long)cur->ainsn.xol_insn)
> -			break;
> -
>  		/*
>  		 * We are here because the instruction being single
>  		 * stepped caused a page fault. We reset the current
> -- 
> 2.47.3
> 

