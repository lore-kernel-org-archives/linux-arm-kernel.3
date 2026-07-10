Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD98EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 04:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmXLyjVG3dnNcl3iG/4pgk01dI7PC3rxgc/2lNvuJy0=; b=G7oHqDSkPHW5dO
	gWftxSvQ/WhKhS69NcmQgV8YHMX41lnb3bltd9gHCER8aGPM6o39QeHM8+LJUyq1693RpcC2sh/88
	qcR+4yvmFUm35OjRl26e1xsYmY9VUR1toYa17bUXJmkekD+cUQKge8Yz0jN6sshFWmWuEXSSh/Gnv
	gzWrvsCTAM20CnsykYOGLJdOh0ZwBMpawNTsKVTipdSNpVSi65lKLVrY0sP2LKTSGpjH7hMM2yZsf
	7jrruY3fNC9uHdZpeKdYQ9E4NigWBDWOcsSPTpiAPrFXLdq4ebSuLBZc64b80d1EOE5L69AywRDpG
	H89kU3+dllTn+L3XAIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2Zj-0000000450E-3Uel;
	Fri, 10 Jul 2026 04:10:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi2Zi-00000004504-2LUT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 04:10:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C778600C3;
	Fri, 10 Jul 2026 04:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199881F000E9;
	Fri, 10 Jul 2026 04:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783656653;
	bh=pmXLyjVG3dnNcl3iG/4pgk01dI7PC3rxgc/2lNvuJy0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=neIgnZ0GrbGdzMUj0Zrc73GFKtLNF6NerYcoxBtvLv2NzUnOnb0eZ6c+Tit+4nO3+
	 p7u0OYj4MSR02R54GzBTso2H4FwhfV/zi4tpCqzTbGd0TsSeEnerKW6Fk+Z3+bwaMr
	 dmhkMrAaKX2CYdXelf0b2tgKegXLHg/PuR4g8xsppAniGZlojJGQPMRQUROxegrcz1
	 me3MtMyPDg4MmGXKfbN6sKdH2OYnyPiJJCtJr1B7WJXPZwKSekqc6JC2T6EPSDPUST
	 eVuKS+pvzjWtpeVV5YiFsgjwEyuljbs4pcM8mGSSOgSX0/8QKP6jkXs/SSqjKARu/3
	 o+dHHopmhLHPQ==
Date: Fri, 10 Jul 2026 13:10:47 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Pu Hu <hupu@transsion.com>
Subject: Re: [RFC v2 1/3] arm64: kprobes: Only handle faults originating
 from XOL slot
Message-Id: <20260710131047.1806f8477422f9c1703471eb@kernel.org>
In-Reply-To: <20260709142215.226872-2-hupu@transsion.com>
References: <20260709142215.226872-1-hupu@transsion.com>
	<20260709142215.226872-2-hupu@transsion.com>
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

On Thu, 9 Jul 2026 14:22:23 +0000
Pu Hu <hupu@transsion.com> wrote:

> From: Pu Hu <hupu@transsion.com>
> 
> kprobe_fault_handler() currently treats any page fault taken while in
> KPROBE_HIT_SS or KPROBE_REENTER state as a kprobe single-step fault. This
> assumption does not hold: perf or tracing code may run from the debug
> exception path during the single-step window and take its own page fault.
> 
> When the fault is handled as a kprobe fault, the PC is rewritten to the
> probe address, corrupting the exception recovery context for the real
> fault. A typical reproducer is running perf with preemptirq tracepoints
> and dwarf callchains while a kprobe is installed on a frequently
> executed function.
> 
> Fix this in two layers:
> 
> 1. At function entry, bail out immediately for simulated kprobes
>    (ainsn.xol_insn == NULL), since they have no XOL slot and any fault
>    taken during their execution cannot be a single-step fault.
> 
> 2. For kprobes with an XOL slot, only handle the fault when the
>    faulting PC matches the XOL instruction address. Faults from any
>    other PC are left to the normal page fault handler.
> 
> This follows the same principle as the x86 fix in commit 6381c24cd6d5
> ("kprobes/x86: Fix page-fault handling logic").
> 
> Signed-off-by: Pu Hu <hupu@transsion.com>
> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>

This looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

> ---
>  arch/arm64/kernel/probes/kprobes.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 43a0361a8bf0..798e4b091d1a 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -282,9 +282,31 @@ int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)
>  	struct kprobe *cur = kprobe_running();
>  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
>  
> +	/*
> +	 * Simulated kprobes execute in the debug trap context and have no
> +	 * XOL slot. Any page fault taken while a simulated kprobe is in
> +	 * progress cannot have been caused by kprobe single-stepping and
> +	 * must be left alone for the normal page fault handler, including
> +	 * fixup_exception.
> +	 */
> +	if (cur && !cur->ainsn.xol_insn)
> +		return 0;
> +
>  	switch (kcb->kprobe_status) {
>  	case KPROBE_HIT_SS:
>  	case KPROBE_REENTER:
> +		/*
> +		 * A page fault taken while in KPROBE_HIT_SS or
> +		 * KPROBE_REENTER state is only attributable to kprobe
> +		 * single-stepping if the faulting PC points to the
> +		 * current kprobe's XOL instruction. If the fault occurred
> +		 * elsewhere (e.g. in perf or tracing code invoked from the
> +		 * debug exception path), leave it for the normal page fault
> +		 * handler to process.
> +		 */
> +		if (instruction_pointer(regs) != (unsigned long)cur->ainsn.xol_insn)
> +			break;
> +
>  		/*
>  		 * We are here because the instruction being single
>  		 * stepped caused a page fault. We reset the current
> -- 
> 2.43.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

