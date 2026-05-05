Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2043BCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 20:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFvr9dpkmNdHKrycuo28tXSnDK+PIn/Xjg+wesAdMy0=; b=EdrdzhoA8uBMTDACNRrErj/h98
	G3RPmKgdX9zfAEUQ2UpkarG+OwVkGO3peS4s/QcGtOsd8EgR7vwz++An/a7kZcyru9RBoKGuG5pu8
	wAP5KP5a9RfufwVV6I5rCsopv+3mWGRxSNQS3kcMELiXc0sm5AeGwhANpL0+eQA92BMU1ZUSd51vB
	+KNcywDZ16zr4TnkXIXorlI+RAjmaIffVtGKRniqrirlQ2ynVV/xiruVrFw4IJ5bT0Wbr/npwySNE
	DD849fCQSdi5LJdl39FmssCBdMniCa9TTCuOrXn2WP/rfgl9D3qrytENz8bokwemipov+OESnYI2e
	oqa69Y6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKM4j-0000000HO21-1LLT;
	Tue, 05 May 2026 20:09:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKM4h-0000000HO1k-2EbA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 20:08:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A482960181;
	Tue,  5 May 2026 20:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0935C2BCB4;
	Tue,  5 May 2026 20:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778011738;
	bh=/j11J9M2rpjHFDo2P3PpYGg75ACUlpOX6HbyyxFh7nk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eocsxk8/k0flO75+vYiaiRdFsHmYWsbGcX1ILS8p9jwmitTwEiStHDi+9MuFyzSvp
	 kJI/WG/HeTBKGhzh3fvWcNYRmmFJ5IhSdG/LxxGliTZo5ctiCxiYrWEn7PVnWu+sRD
	 eTdMr1LftCcqow29DhBAZBwQsQUdJhHLG0PEci07XLjMOtH2JU1QwykZJ9fRluqigN
	 h7lBS7JMOQitGZ/qZQnVapq3Kj1E9scCekC9fL+SAX8YGnC2gbYm4djsGPfhPNRyYa
	 ApNWchCJhBndTET24wXpzEm+MRiYxdDSHfJXhFODQ3zPOVkrrROIqSVqN8eTMV0npD
	 a3v8U68ShHQpA==
From: Thomas Gleixner <tglx@kernel.org>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Cc: nd <nd@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>
Subject: Re: [PATCH 2/3] irqchip/gic-v5: Allow for nr_irqs > 1 for LPI alloc
 and teardown
In-Reply-To: <20260430153352.3654325-3-sascha.bischoff@arm.com>
References: <20260430153352.3654325-1-sascha.bischoff@arm.com>
 <20260430153352.3654325-3-sascha.bischoff@arm.com>
Date: Tue, 05 May 2026 22:08:55 +0200
Message-ID: <87zf2dwre0.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, Apr 30 2026 at 15:34, Sascha Bischoff wrote:
> Formerly the LPI allocaion and freeing was handled by the domains
> built on top of the LPI domain, and hence the LPI to use was passed in
> from the child domain. This mandadated that LPI allocation and freeing
> was done one at a time, rather than for a range of interrupts in one
> go.
>
> Now that the underlying restriction has been removed and all LPI
> tracking happens within the LPI domain itself, drop the requirement to
> allocate and free LPIs one-by-one.  While we're at it, clean up the
> IPI allocation to request all LPIs in one go, rather than requesting
> them one at a time.
>
> Incidentally, this fixes a unwind bug for IPIs where previously
> allocated entries were not unwound on a failed parent allocation.

See previous reply

> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5.c | 70 +++++++++++++++++++-----------------
>  1 file changed, 38 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index a3c9eaa8ff486..61a70fe48bc32 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -800,17 +800,16 @@ static void gicv5_irq_lpi_domain_free(struct irq_domain *domain, unsigned int vi
>  				      unsigned int nr_irqs)
>  {
>  	struct irq_data *d;
> +	int i;
>  
> -	if (WARN_ON_ONCE(nr_irqs != 1))
> -		return;
> -
> -	d = irq_domain_get_irq_data(domain, virq);
> -
> +	for (i = 0; i < nr_irqs; i++) {

        for (unsigned int = 0; ....

> +		d = irq_domain_get_irq_data(domain, virq + i);

  s/virq/ and then make
  
        for (unsigned int = 0; ....; i++, virq++)

>  static int gicv5_irq_lpi_domain_alloc(struct irq_domain *domain, unsigned int virq,
> @@ -818,32 +817,38 @@ static int gicv5_irq_lpi_domain_alloc(struct irq_domain *domain, unsigned int vi
>  {
>  	irq_hw_number_t hwirq;
>  	struct irq_data *irqd;
> -	int ret;
> -
> -	if (WARN_ON_ONCE(nr_irqs != 1))
> -		return -EINVAL;
> +	int ret, i;

unsigned int i;

>  static const struct irq_domain_ops gicv5_irq_lpi_domain_ops = {
> @@ -871,11 +876,11 @@ static int gicv5_irq_ipi_domain_alloc(struct irq_domain *domain, unsigned int vi
>  	struct irq_data *irqd;
>  	int ret, i;
>  
> -	for (i = 0; i < nr_irqs; i++) {
> -		ret = irq_domain_alloc_irqs_parent(domain, virq + i, 1, NULL);
> -		if (ret)
> -			return ret;
> +	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
> +	if (ret)
> +		return ret;
>  
> +	for (i = 0; i < nr_irqs; i++) {

  for (unsigned int i ....

Thanks,

        tglx

