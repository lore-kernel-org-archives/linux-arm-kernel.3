Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AFAC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAwjkj+owsYwz+FUCcF2eTflLzVptWQJubVPUO8Pr/w=; b=H576xqjr22X57aO8WyjbLFbnqg
	30bFIVslFVWRpIZiMYd1MtQxCDFR8MzntBJzb7LdHt+SOnZ3O2Gz+fiaqffXF/HJGthJdBx6r314S
	QLYDVY9Lkegx/U0Ey3u4Tn7d4ldvUvqfGOtQCo9E8IJTLY8OcIcDboloo6Em08hDbjCpNXbNESCLr
	0rPLcWr/KwlEwMh7/E2fXLgGh8HmyaGiLDAunaYqIlNejeDPG/HLeB/CX3VF1Tn7xRbUcosWgt7ip
	Xtu6KreP7g9/HjhD2pwUgZDN0dQ8eb99sOLp0C5LXbYLiR/Hfx11QF3gggZ3pFB5evTQs1CQQx4Ml
	ulwxcFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCY0-0000000FHHl-0jE3;
	Wed, 14 May 2025 13:53:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF9WR-0000000Eohy-1y6O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 10:39:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E1BF5C638F;
	Wed, 14 May 2025 10:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF48C4CEE9;
	Wed, 14 May 2025 10:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747219174;
	bh=jdaKOxD2qt2jrO1zGt5BuJsLgrxKO8Tjw4sVNPmGmNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2sbotfmS8yko3IJtk8XVsHgYCDFtBVsGhhCxwPZlon3shJEZXif2/gpZglkjaOir
	 5ys+PFUjoRr4jsgRlDaOsQZ8dKT7+n2DQ97IGnxK6MKxTSqwiBvNA1sCaIc0FO4jKO
	 R8HFtSJ2mxI+TZm+NI/LZfsx9yAGU8MaWB4qbVthLFocMpXaaVyE6mQ4dIoeH6AhS8
	 AkaxffMkxGBqNEu15rfuGoFkQH+pKTh3/IlSITZBJzh79ateLjk3W2E0anKIbrcFy9
	 ut4DKOO26SynEkltCKpjgN6/WkNXhY8oxCT6CZQty64AQ4cxjQ5O85YX3wNHLCYtA/
	 WH8qs5ei9qPpA==
Date: Wed, 14 May 2025 12:39:28 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 18/26] arm64: smp: Support non-SGIs for IPIs
Message-ID: <aCRy4K/jvLr95GOp@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-18-b36e9b15a6c3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513-gicv5-host-v4-18-b36e9b15a6c3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_033935_599230_536D1632 
X-CRM114-Status: GOOD (  26.52  )
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

On Tue, May 13, 2025 at 07:48:11PM +0200, Lorenzo Pieralisi wrote:

[...]

>  /*
>   * Called from the secondary holding pen, this is the secondary CPU entry point.
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 3b3f6b56e733039cad7ff5b8995db16a68f3c762..3f3712e47c94c62836fb89cd4bfb3595fbb41557 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -83,7 +83,26 @@ enum ipi_msg_type {
>  
>  static int ipi_irq_base __ro_after_init;
>  static int nr_ipi __ro_after_init = NR_IPI;
> -static struct irq_desc *ipi_desc[MAX_IPI] __ro_after_init;
> +
> +struct ipi_descs {
> +	struct irq_desc *descs[MAX_IPI];
> +};
> +
> +static DEFINE_PER_CPU(struct ipi_descs, pcpu_ipi_desc);
> +
> +#define get_ipi_desc(__cpu, __ipi) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->descs[__ipi])
> +
> +static bool percpu_ipi_descs __ro_after_init;
> +
> +static int ipi_to_irq(int ipi, int cpu)
> +{
> +	return ipi_irq_base + (cpu * nr_ipi) + ipi;
> +}
> +
> +static int irq_to_ipi(int irq)
> +{
> +	return (irq - ipi_irq_base) % nr_ipi;
> +}
>  
>  static bool crash_stop;
>  
> @@ -844,7 +863,7 @@ int arch_show_interrupts(struct seq_file *p, int prec)
>  		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
>  			   prec >= 4 ? " " : "");
>  		for_each_online_cpu(cpu)
> -			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
> +			seq_printf(p, "%10u ", irq_desc_kstat_cpu(get_ipi_desc(cpu, i), cpu));
>  		seq_printf(p, "      %s\n", ipi_types[i]);
>  	}
>  
> @@ -919,7 +938,13 @@ static void __noreturn ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs
>  
>  static void arm64_backtrace_ipi(cpumask_t *mask)
>  {
> -	__ipi_send_mask(ipi_desc[IPI_CPU_BACKTRACE], mask);
> +	unsigned int cpu;
> +
> +	if (!percpu_ipi_descs)
> +		__ipi_send_mask(get_ipi_desc(0, IPI_CPU_BACKTRACE), mask);
> +	else
> +		for_each_cpu(cpu, mask)
> +			__ipi_send_single(get_ipi_desc(cpu, IPI_CPU_BACKTRACE), cpu);
>  }
>  
>  void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
> @@ -944,7 +969,7 @@ void kgdb_roundup_cpus(void)
>  		if (cpu == this_cpu)
>  			continue;
>  
> -		__ipi_send_single(ipi_desc[IPI_KGDB_ROUNDUP], cpu);
> +		__ipi_send_single(get_ipi_desc(cpu, IPI_KGDB_ROUNDUP), cpu);
>  	}
>  }
>  #endif
> @@ -1013,14 +1038,21 @@ static void do_handle_IPI(int ipinr)
>  
>  static irqreturn_t ipi_handler(int irq, void *data)
>  {
> -	do_handle_IPI(irq - ipi_irq_base);
> +	do_handle_IPI(irq_to_ipi(irq));
>  	return IRQ_HANDLED;
>  }
>  
>  static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
>  {
> +	unsigned int cpu;
> +
>  	trace_ipi_raise(target, ipi_types[ipinr]);
> -	__ipi_send_mask(ipi_desc[ipinr], target);
> +
> +	if (!percpu_ipi_descs)
> +		__ipi_send_mask(get_ipi_desc(0, ipinr), target);
> +	else
> +		for_each_cpu(cpu, target)
> +			__ipi_send_single(get_ipi_desc(cpu, ipinr), cpu);
>  }
>  
>  static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
> @@ -1046,11 +1078,15 @@ static void ipi_setup(int cpu)
>  		return;
>  
>  	for (i = 0; i < nr_ipi; i++) {
> -		if (ipi_should_be_nmi(i)) {
> -			prepare_percpu_nmi(ipi_irq_base + i);
> -			enable_percpu_nmi(ipi_irq_base + i, 0);
> +		if (!percpu_ipi_descs) {
> +			if (ipi_should_be_nmi(i)) {
> +				prepare_percpu_nmi(ipi_irq_base + i);
> +				enable_percpu_nmi(ipi_irq_base + i, 0);
> +			} else {
> +				enable_percpu_irq(ipi_irq_base + i, 0);
> +			}
>  		} else {
> -			enable_percpu_irq(ipi_irq_base + i, 0);
> +			enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, i)));
>  		}
>  	}
>  }
> @@ -1064,44 +1100,79 @@ static void ipi_teardown(int cpu)
>  		return;
>  
>  	for (i = 0; i < nr_ipi; i++) {
> -		if (ipi_should_be_nmi(i)) {
> -			disable_percpu_nmi(ipi_irq_base + i);
> -			teardown_percpu_nmi(ipi_irq_base + i);
> +		if (!percpu_ipi_descs) {
> +			if (ipi_should_be_nmi(i)) {
> +				disable_percpu_nmi(ipi_irq_base + i);
> +				teardown_percpu_nmi(ipi_irq_base + i);
> +			} else {
> +				disable_percpu_irq(ipi_irq_base + i);
> +			}
>  		} else {
> -			disable_percpu_irq(ipi_irq_base + i);
> +			disable_irq(irq_desc_get_irq(get_ipi_desc(cpu, i)));
>  		}
>  	}
>  }
>  #endif
>  
> -void __init set_smp_ipi_range(int ipi_base, int n)
> +static void ipi_setup_ppi(int ipi)
> +{
> +	int err, irq, cpu;
> +
> +	irq = ipi_irq_base + ipi;
> +
> +	if (ipi_should_be_nmi(irq)) {
> +		err = request_percpu_nmi(irq, ipi_handler, "IPI", &irq_stat);
> +		WARN(err, "Could not request IRQ %d as NMI, err=%d\n", irq, err);
> +	} else {
> +		err = request_percpu_irq(irq, ipi_handler, "IPI", &irq_stat);
> +		WARN(err, "Could not request IRQ %d as IRQ, err=%d\n", irq, err);
> +	}
> +
> +	for_each_possible_cpu(cpu)
> +		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
> +
> +	irq_set_status_flags(irq, IRQ_HIDDEN);
> +}
> +
> +static void ipi_setup_lpi(int ipi, int ncpus)
> +{
> +	for (int cpu = 0; cpu < ncpus; cpu++) {
> +		int err, irq;
> +
> +		irq = ipi_to_irq(ipi, cpu);
> +
> +		err = irq_force_affinity(irq, cpumask_of(cpu));
> +
> +		WARN(err, "Could not force affinity IRQ %d, err=%d\n", irq, err);
> +
> +		err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI",
> +				  &irq_stat);

Heads-up, kbuild bot (sparse) barfed (correctly) at this, because the
&irq_stat pointer does not match the request_irq() void *dev_id parameter
signature (it is void __percpu *).

Of course, the &irq_stat parameter is unused so this is harmless.

I would just pass NULL (because AFAICS irq_stat in the action handler is
unused), the question is why are we passing &irq_stat in
request_percpu_irq() if that's unused in ipi_handler() ?

Was it used before and we removed its usage ? Should we clean it up
for completeness ?

Thanks,
Lorenzo

> +
> +		WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
> +
> +		irq_set_status_flags(irq, (IRQ_HIDDEN | IRQ_NO_BALANCING_MASK));
> +
> +		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
> +	}
> +}
> +
> +void __init set_smp_ipi_range_percpu(int ipi_base, int n, int ncpus)
>  {
>  	int i;
>  
>  	WARN_ON(n < MAX_IPI);
>  	nr_ipi = min(n, MAX_IPI);
>  
> -	for (i = 0; i < nr_ipi; i++) {
> -		int err;
> -
> -		if (ipi_should_be_nmi(i)) {
> -			err = request_percpu_nmi(ipi_base + i, ipi_handler,
> -						 "IPI", &irq_stat);
> -			WARN(err, "Could not request IPI %d as NMI, err=%d\n",
> -			     i, err);
> -		} else {
> -			err = request_percpu_irq(ipi_base + i, ipi_handler,
> -						 "IPI", &irq_stat);
> -			WARN(err, "Could not request IPI %d as IRQ, err=%d\n",
> -			     i, err);
> -		}
> -
> -		ipi_desc[i] = irq_to_desc(ipi_base + i);
> -		irq_set_status_flags(ipi_base + i, IRQ_HIDDEN);
> -	}
> -
> +	percpu_ipi_descs = !!ncpus;
>  	ipi_irq_base = ipi_base;
>  
> +	for (i = 0; i < nr_ipi; i++) {
> +		if (!percpu_ipi_descs)
> +			ipi_setup_ppi(i);
> +		else
> +			ipi_setup_lpi(i, ncpus);
> +	}
> +
>  	/* Setup the boot CPU immediately */
>  	ipi_setup(smp_processor_id());
>  }
> 
> -- 
> 2.48.0
> 

