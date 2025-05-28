Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4579C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnUw7T5dTAlGD+Mn8tzuDakTz2S3BGH1zLUIzlY5AS0=; b=Rq2s/2SAojmOwERqFgH60bHZt0
	Pz2+KZI9NrYF1VwoC9rEPDgv2ZBIx5wGgqLFF4czyVJdh5rLLc/MGZjuh/fobc7AQhkGDtZgh9D2T
	NRK+duYnak1Ry4nBg0rtNp85lqwA1d4WY41bHcXxEp9SC171YSbYEjkp/wTnGe8+rPRjZ+2xb0kxC
	W4mqOTee20FlX81KpoEcYKCPcbN6KAzMNblz5aSf1fAXu2ClcSCCIgUQudsC2dIp+h7bT3ekIoE5y
	AywSuIvRihoId+vW7R/DPP5wo66cuXQKCGXtGOszqaJC19P4gfoEuCHpuTAMsdDRqk8jF8yTRH+uF
	N/Afk44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHo2-0000000DPHG-2iM9;
	Wed, 28 May 2025 14:30:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHlS-0000000DOtC-3aPy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 14:28:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D72AA40C4A;
	Wed, 28 May 2025 14:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589E9C4CEE3;
	Wed, 28 May 2025 14:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748442497;
	bh=Pj2dKcYrs8qtXXImT3zhxemqWnlmlXzSCeJP/bi3GqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J7V4HdhH4LP0/xhdufXH7ukurAfnZkeM28NOSeG7dnwmm7xGN2Q21KwDYd99fZser
	 ENBiRECT9v5o6UwShPCdLRJs5hb76XQNPWD2f/FtHeNJ16IQ1P1atj4YicGXgqoJn1
	 Qd2um5zkwTUZJ2j0jGLZXafqR8nLyKbFR3akyuxesS0b0jKtOD4xUph+xmh7+49kee
	 b927Nhc/iraXGDSm+YLrubDnVPbh8ckd6J+rDLrEABHeq1f/+nNRsVK6PeHmm6jOV6
	 1a5v0NhCdVWXwv5mJEnlDyFrPrmCiExJ30hu90lAAlQ9yyNdZtG+Q+Zw+BxBaQHGoV
	 bk/5c/9YQyLKA==
Date: Wed, 28 May 2025 16:28:09 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 18/26] arm64: smp: Support non-SGIs for IPIs
Message-ID: <aDcdeWuwCzZ4pA9y@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-18-b36e9b15a6c3@kernel.org>
 <20250528131744.00001544@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528131744.00001544@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_072818_935838_B0D544F1 
X-CRM114-Status: GOOD (  22.18  )
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

On Wed, May 28, 2025 at 01:17:44PM +0100, Jonathan Cameron wrote:
> On Tue, 13 May 2025 19:48:11 +0200
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> 
> > From: Marc Zyngier <maz@kernel.org>
> > 
> > The arm64 arch has relied so far on GIC architectural software
> > generated interrupt (SGIs) to handle IPIs. Those are per-cpu
> > software generated interrupts.
> > 
> > arm64 architecture code that allocates the IPIs virtual IRQs and
> > IRQ descriptors was written accordingly.
> > 
> > On GICv5 systems, IPIs are implemented using LPIs that are not
> > per-cpu interrupts - they are just normal routable IRQs.
> > 
> > Add arch code to set-up IPIs on systems where they are handled
> > using normal routable IRQs.
> > 
> > For those systems, force the IRQ affinity (and make it immutable)
> > to the cpu a given IRQ was assigned to.
> > 
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > [timothy.hayes@arm.com: fixed ipi/irq conversion, irq flags]
> > Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> > [lpieralisi: changed affinity set-up, log]
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> Hi Lorenzo,
> 
> A few trivial comments inline.
> 
> > +
> > +static int ipi_to_irq(int ipi, int cpu)
> 
> Maybe this naming needs a breadcrumb to indicate this only
> applies only to lpi case as it's directly computed in the old ppi code?
> A comment might do the job.

Maybe rename it to ipi_to_irq_percpu() (similar to what we did for
set_smp_ipi_range()) and then

static int ipi_to_irq(int ipi)
{
	ipi_to_irq_percpu(ipi, 0);
}

and use ipi_to_irq() in ppi code ?

Likely overkill, not a big deal anyway.

> > +{
> > +	return ipi_irq_base + (cpu * nr_ipi) + ipi;
> > +}
> > +
> > +static int irq_to_ipi(int irq)
> > +{
> > +	return (irq - ipi_irq_base) % nr_ipi;
> > +}
> 
> 
> > +static void ipi_setup_lpi(int ipi, int ncpus)
> > +{
> > +	for (int cpu = 0; cpu < ncpus; cpu++) {
> > +		int err, irq;
> > +
> > +		irq = ipi_to_irq(ipi, cpu);
> > +
> > +		err = irq_force_affinity(irq, cpumask_of(cpu));
> > +
> Trivial local consistency thing but maybe no blank line here or...
> > +		WARN(err, "Could not force affinity IRQ %d, err=%d\n", irq, err);
> > +
> > +		err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI",
> > +				  &irq_stat);
> > +
> here to match the style in ipi_setup_ppi()

Done.

Thanks,
Lorenzo

> > +		WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
> > +
> > +		irq_set_status_flags(irq, (IRQ_HIDDEN | IRQ_NO_BALANCING_MASK));
> > +
> > +		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
> > +	}
> > +}
> 

