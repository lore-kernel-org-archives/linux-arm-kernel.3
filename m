Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A857C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykqrz8DrrE8onYC7AFaq41Bu3k6Q9XyPBzxfGsLzksg=; b=Uc7mn+a9FlzHpCgb4Cq0M6jBGJ
	tgWApszNYJw5Ihr1KbxEDLVOp/fT3IGcYggySrYu91b+qxxM33MMQtCLkDgP/IcPX0FWTSd+v8I2s
	G3yOOgdJB7KHqxRR99iaLMPqyA5HnGi5Ll8fdm1eMeW1oywucJupBYhY3UXq/LSn56VnTKDx+d1u8
	jBy616SQo7mD2ID3rO5midBrHnM+B6IEo7vtIS2QhAIAm/bqi1tLymxgv8je+gl5kbj4ZudUdGgk/
	wmseEOwEZLreE3rk1uwTjei69np6QW0O2FHqYglr+pz+W2edWJ+2etIr4PX++0HvPk+cqRV7A1szy
	66mMO4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P6U-00000008ma5-3ppj;
	Wed, 23 Sep 2026 15:41:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9P6S-00000008mZM-2hwt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:41:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3177600AA;
	Wed, 23 Sep 2026 15:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C0D1F000FF;
	Wed, 23 Sep 2026 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178107;
	bh=ykqrz8DrrE8onYC7AFaq41Bu3k6Q9XyPBzxfGsLzksg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oUYNcPTJ9kLnJrGmKa00IQAQBUF6UUp+1Y8JZkRJUZ8Ud5nJiS3WPbvrP7VCI4NJk
	 Zgc+9OgFsiDMIynjjCzYmmDikaqt+QiazTRloG3v019HyOSgDku0hzfdy3HYXRjNwj
	 aJJz5mqI+HIF3hTgeNwpvTDL2QknzZxTnQJlqIIxs6PML3AN7gjJ2JNzIjjOc3NqlL
	 ZJpuHziuHTmYgVCSNVa9sTtK4FaqgUtTyNdPUY5CIOyab+Fr62zunCk8WScTKlIojt
	 q/tt3mHWOQDHjUDoR0nNk0SJycW3aabZNCvk6r1ZOCpmt0RgoYktetM66VgjR1rZQI
	 /Shc+fZrDcJZQ==
Date: Wed, 23 Sep 2026 16:41:42 +0100
From: Will Deacon <will@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maz@kernel.org
Subject: Re: [PATCH] arm64: smp: Signal EOI after handling IPI_CPU_STOP*
Message-ID: <arPzNkDD69ZKFT99@willie-the-truck>
References: <20260922140109.12780-1-andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922140109.12780-1-andrea.porta@suse.com>
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

[+Marc]

On Tue, Sep 22, 2026 at 04:01:09PM +0200, Andrea della Porta wrote:
> On kdump/kexec, the boot CPU triggers an IPI_CPU_STOP (and subsequently
> an IPI_CPU_STOP_NMI if the first one does not respond) to the secondary
> CPUs, and the IPI handler eventually calls the firmware to shut down
> each CPU. Since the IPI is never acknowledged via EOI, the interrupt
> remains in an active state when the CPU goes idle.
> 
> In a virtualized environment, if the hypervisor does not reset the
> interrupt state, this causes the crashkernel (with cmdline option
> maxcpus > 1) to be unable to synchronize between the boot CPU and
> secondary CPUs via IPI_CALL_FUNC, leading the kernel to wait indefinitely
> for the CPUs to respond. This has been observed with the Hyper-V
> implementation.

Hmm, how is this different from panic()ing inside an interrupt handler?

> Both the Linux kernel and the Hyper-V firmware appear to violate the
> PSCI specification:
> 
> - The PSCI spec states that the OS kernel must migrate any interrupt away
> from the CPU that is about to be shut down via CPU_OFF, which by extension
> implies that no active interrupts are allowed. The kernel does not
> currently do this in the kdump crash path.
> 
> - The PSCI spec also states that the PSCI firmware must reset the CPU
> registers to their default values when turning on a CPU via the CPU_ON
> command.
> 
> Fixing this on the kernel side has the advantage of being
> hypervisor-agnostic.
> 
> Signal EOI at the end of the crash handler to prevent the subsequent
> crashkernel from hanging.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  arch/arm64/kernel/smp.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index a61dc3016a117..cc7f3261fe537 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -988,6 +988,27 @@ void kgdb_roundup_cpus(void)
>  }
>  #endif
>  
> +static void ipi_eoi(int ipinr)
> +{
> +	unsigned int cpu = smp_processor_id();
> +	struct irq_desc *desc;
> +	struct irq_chip *chip;
> +	struct irq_data *d;
> +
> +	if (ipinr >= MAX_IPI)
> +		return;
> +
> +	desc = get_ipi_desc(cpu, ipinr);
> +
> +	if (desc) {
> +		chip = irq_desc_get_chip(desc);
> +		d = irq_desc_get_irq_data(desc);
> +
> +		if (chip && chip->irq_eoi)
> +			chip->irq_eoi(d);
> +	}
> +}

Doesn't this hard-code the flow handler for the irqchip? It feels like it
would be better for the GIC driver to get a callback during the kexec
sequence (if it doesn't already) to prepare itself.

Will

>  /*
>   * Main handler for inter-processor interrupts
>   */
> @@ -1009,6 +1030,7 @@ static void do_handle_IPI(int ipinr)
>  
>  	case IPI_CPU_STOP:
>  	case IPI_CPU_STOP_NMI:
> +		ipi_eoi(ipinr);
>  		arm64_nmi_cpu_stop(get_irq_regs(), true);
>  		break;
>  
> -- 
> 2.35.3
> 

