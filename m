Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B790CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyGoWBCJrIVU2lZonI26bVfo/Kr7IC665y1ClCQUDV4=; b=BTIhcyYD0cVtmMk9CtFv8ujxMn
	2FSft0EyV1rrzsx0OFLY4NCkccsp6Y9B7jwR1Ygq39EPMjxXpbdHa4NmVsKvLkb0P4sjYoPLhtmbf
	J21Bnjb7RSZ0CnXqFXSln3rXS5dW1Je2w1qrypAjpLUAC5oU5FYWnSuRurOm4HkiPLcyaVL9jeRbL
	GZ3a1EQoB7kyoQFlyMTo0D75lf6FpAVEzLOcSidRfGBTDLOn0G33jLV7GKnBlMEkWrWQWvd5q6aoT
	rnfhOm1Gsa1seISqAcby/ABoJVHEbVSuzggLaFzZAWKB2tfYAWR9XSn2KuzK3w9LfQPCupME+2SuG
	b4jwZ3pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Qk-000000088oV-2DGD;
	Tue, 09 Sep 2025 15:38:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuUH-00000005tuj-3pwt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:18:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757409483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DyGoWBCJrIVU2lZonI26bVfo/Kr7IC665y1ClCQUDV4=;
	b=ysdAX9a7kn7T9QlMJmRJpgsDVriVX93E2TCUtnhpkYmACln7+MeOu/IkNoRCq3XmGB7ki2
	bbCNB9ZX8Xc+6obauVhjevhcE6OTbMNARbbUL5Fa4eOgFxnTR9PK32EBshHIwXqaoPD/cM
	5ziG8OQhT683Prb62Ap8AbWTPV9UXhdtfJ5jsPVVv0F7PETtY2WRWur4aDKnQaxIKS9hYT
	qLTe2zKno7QPu6O9tA9hGWrKjDLkitTp10IF0F0AOUPv6p6BrBPYNx5b5Y2Cf2QLvpDBPK
	QHUZI0tufr2Ji002cXTtvyZZ6Eu9zZyCjHIzARrC9dB2YyOGxSgisrHV5+53cA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757409483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DyGoWBCJrIVU2lZonI26bVfo/Kr7IC665y1ClCQUDV4=;
	b=wuIsSYusPYyMgMlU/Aut0z+gBUeiKg4JHx72+DsH1XpcB2lw7TLJa4RQYNcqrVl5SeMkBW
	i4oPdIUi+1IEp/DQ==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>, Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark
 <james.clark@linaro.org>
Subject: Re: [PATCH 01/25] irqdomain: Add firmware info reporting interface
In-Reply-To: <20250908163127.2462948-2-maz@kernel.org>
References: <20250908163127.2462948-1-maz@kernel.org>
 <20250908163127.2462948-2-maz@kernel.org>
Date: Tue, 09 Sep 2025 11:18:01 +0200
Message-ID: <87ikhsvvau.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021806_143995_90DAD39A 
X-CRM114-Status: GOOD (  21.52  )
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

On Mon, Sep 08 2025 at 17:31, Marc Zyngier wrote:
> +/**
> + * struct irq_fwspec_info - firmware provided IRQ information structure
> + *
> + * @fwspec:		IRQ specifier

s/IRQ/interrupt/g

> + * @cpumask:		Affinity mask for this interrupt
> + * @flags:		Information validity flags
> + *
> + * This structure reports firmware-specific information about an
> + * interrupt. The only significant information is the affinity of a
> + * per-CPU interrupt, but this is designed to be extended as required.
> + */
> +struct irq_fwspec_info {
> +	struct irq_fwspec	fwspec;
> +	const struct cpumask	*affinity;
> +
> +#define IRQ_FWSPEC_INFO_FWSPEC_VALID	BIT(0)
> +#define IRQ_FWSPEC_INFO_AFFINITY_VALID	BIT(1)
> +
> +	unsigned long		flags;

Can you please not stick the defines into the struct. That makes my eyes
bleed.

Also the ordering looks strange as flags should be before the fields it
validates for readability sake, no?

> +};
> +
>  /* Conversion function from of_phandle_args fields to fwspec  */
>  void of_phandle_args_to_fwspec(struct device_node *np, const u32 *args,
>  			       unsigned int count, struct irq_fwspec *fwspec);
> @@ -69,6 +90,8 @@ void of_phandle_args_to_fwspec(struct device_node *np, const u32 *args,
>   * @translate:	Given @fwspec, decode the hardware irq number (@out_hwirq) and
>   *		linux irq type value (@out_type). This is a generalised @xlate
>   *		(over struct irq_fwspec) and is preferred if provided.
> + * @get_info: Given @info, report additional firmware-provided information.
> + *            Optional.

get_info() is pretty generic. Can we have some more descriptive name for
that? Also please keep the tabular formatting of the doc intact.

>   * @debug_show:	For domains to show specific data for an interrupt in debugfs.
>   *
>   * Functions below are provided by the driver and called whenever a new mapping
> @@ -96,6 +119,7 @@ struct irq_domain_ops {
>  	void	(*deactivate)(struct irq_domain *d, struct irq_data *irq_data);
>  	int	(*translate)(struct irq_domain *d, struct irq_fwspec *fwspec,
>  			     unsigned long *out_hwirq, unsigned int *out_type);
> +	int (*get_info)(struct irq_fwspec_info *info);

TAB between int and '(*'

>  #endif
>  #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
>  	void	(*debug_show)(struct seq_file *m, struct irq_domain *d,
> @@ -602,6 +626,8 @@ void irq_domain_free_irqs_parent(struct irq_domain *domain, unsigned int irq_bas
>  
>  int irq_domain_disconnect_hierarchy(struct irq_domain *domain, unsigned int virq);
>  
> +int irq_populate_fwspec_info(struct irq_fwspec_info *info);
> +
> +
> +#ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY

Stray TAB

> +int irq_populate_fwspec_info(struct irq_fwspec_info *info)
> +{
> +	struct irq_domain *domain;
> +
> +	domain = fwspec_to_domain(&info->fwspec);

Just move that to the declaration line

> +	if (!domain || !domain->ops->get_info) {
> +		info->flags = 0;
> +		return 0;
> +	}
> +
> +	return domain->ops->get_info(info);
> +}
> +#endif
> +
> +unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
> +{
> +	struct irq_domain *domain;
> +	struct irq_data *irq_data;
> +	irq_hw_number_t hwirq;
> +	unsigned int type = IRQ_TYPE_NONE;

I know you moved it from the original function, but can you please
reorder it in reverse fir tree order?

> +	int virq;
> +
> +	domain = fwspec_to_domain(fwspec);
>  	if (!domain) {
>  		pr_warn("no irq domain found for %s !\n",
>  			of_node_full_name(to_of_node(fwspec->fwnode)));

Thanks,

        tglx

