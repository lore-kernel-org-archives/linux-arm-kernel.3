Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B364FC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/ydAfWV1G8TMoCdvFFs40/LgJqcSF5J0BVvenaiJ/Y=; b=0vQnIv9DfKfJyxyTxx1x7/HnGv
	ZQTPePcRTL7eG4PnVhFWMk7eSfiWYhKzIgb++SFA798Qgqphb9vcDAOwzp9ELvjlYiyd5NMRTmrho
	q78ruUFh7563t2SIVIqLAy5jFW3sej4J/3b1PUJgr2rDWZNcYFPi1NsCMI3+JqeCAj1cJuFW3yeOa
	NxPet+2V1AgW82eUI4IvJmzWAQma2yEkQHUWPRLV2FVYvFF+Ag/8PfOb5Ssx2uS0LWwE2hHEoDx91
	5ZNSCkmh7+MCKX8SsS+nWGnMCshz4fyTcugSmq2IajlKOQ1toWwaStqidwOeuvMF6eQgLTKtsjmjd
	sKbSBgRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCazM-0000000Ew87-30hd;
	Wed, 07 May 2025 09:22:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaAG-0000000Ek5u-0FRm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 08:30:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CEF342B98;
	Wed,  7 May 2025 08:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B25AC4CEE7;
	Wed,  7 May 2025 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746606603;
	bh=LgZIIR3VWR/B7NCGqfYJnfn8zg8b4s8/O2CmZ0PJpS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQVl1AAsAzPugaTbhcwnyMqVE8YJga+7DZmHrA/tgTUXLEAgXl84aD5k4IRr5v1A/
	 cscW4kkPIESdZQD0uYOHjZNS/jJ0XWybnrbxB2nOCBtJXLTRM7Se5ph3PqfjXx/ihH
	 Tqyuesewk7mNSRpBbFxc4fvwg+n0oDaolAaiaTDX6IVx81RMrWwAGo68M3r2LBTETh
	 GU0xAlvJz4cVUtrhK3EW+3uCnE2nb/6KTxYu9DjPwibSJthMLOAwMBsvDwe4JJzP65
	 RzFyJhXyOPFqa0eYddjViK16bTXwcOO6GHNpbZ9zHR9AfuoQc2lVNw104kwvqvhDCd
	 uqOUS3LvJ/u4w==
Date: Wed, 7 May 2025 10:29:56 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <aBsaBDB17LAV48ZB@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
 <87zffpn5rk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zffpn5rk.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_013004_140318_6A8F9E17 
X-CRM114-Status: GOOD (  36.40  )
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

On Tue, May 06, 2025 at 05:00:31PM +0200, Thomas Gleixner wrote:
> On Tue, May 06 2025 at 14:23, Lorenzo Pieralisi wrote:
> > +
> > +static u8 pri_bits = 5;
> 
> __ro_after_init ?

Ok.

> 
> > +#define GICV5_IRQ_PRI_MASK 0x1f
> 
> Please put a new line before the #define and use a TAB between the
> symbol and the value.

Ok, sorry.

> > +#define GICV5_IRQ_PRI_MI \
> > +		(GICV5_IRQ_PRI_MASK & GENMASK(4, 5 - pri_bits))
> 
> No line break required. You have 100 characters

Right.

> > +#define READ_PPI_REG(irq, reg)							\
> > +	({									\
> > +		u64 __ppi_val;							\
> > +										\
> > +		if (irq < 64)							\
> > +			__ppi_val = read_sysreg_s(SYS_ICC_PPI_##reg##R0_EL1);	\
> > +		else								\
> > +			__ppi_val = read_sysreg_s(SYS_ICC_PPI_##reg##R1_EL1);	\
> > +		__ppi_val;							\
> > +	})
> > +
> > +#define WRITE_PPI_REG(set, irq, bit, reg)					\
> > +	do {									\
> > +		if (set) {							\
> > +			if (irq < 64)						\
> > +				write_sysreg_s(bit, SYS_ICC_PPI_S##reg##R0_EL1);\
> > +			else							\
> > +				write_sysreg_s(bit, SYS_ICC_PPI_S##reg##R1_EL1);\
> > +		} else {							\
> > +			if (irq < 64)						\
> > +				write_sysreg_s(bit, SYS_ICC_PPI_C##reg##R0_EL1);\
> > +			else							\
> > +				write_sysreg_s(bit, SYS_ICC_PPI_C##reg##R1_EL1);\
> > +		}								\
> > +	} while (0)
> 
> I'm not convinced that these need to be macros.
> 
> static __always_inline u64 read_ppi_sysreg_s(unsigned int irq, const unsigned int which)
> {
>         switch (which) {
>         case PPI_HM:
>         	return irq < 64 ? read_sysreg_s(SYS_ICC_PPI_HM_R0_EL1) :
>                 		  read_sysreg_s(SYS_ICC_PPI_HM_R1_EL1;
>         case ....:
> 
>         default:
>                 BUILD_BUG_ON(1);
>         }
> }
> 
> static __always_inline void write_ppi_sysreg_s(unsigned int irq, bool set, const unsigned int which)
> {
> 	u64 bit = BIT_ULL(irq % 64);
> 
>         switch (which) {  
>         case PPI_HM:
>         	if (irq < 64)
>                 	write_sysreg_s(bit, SYS_ICC_PPI_HM_R0_EL1);
>                 else
>                 	write_sysreg_s(bit, SYS_ICC_PPI_HM_R1_EL1;
>                 return;
>         case ....:
> 
>         default:
>                 BUILD_BUG_ON(1);
>         }
> }
> 
> Or something like that.

Done.

> > +static int gicv5_ppi_set_type(struct irq_data *d, unsigned int type)
> > +{
> > +	/*
> > +	 * The PPI trigger mode is not configurable at runtime,
> > +	 * therefore this function simply confirms that the `type`
> > +	 * parameter matches what is present.
> > +	 */
> > +	u64 hmr = READ_PPI_REG(d->hwirq, HM);
> > +
> > +	switch (type) {
> > +	case IRQ_TYPE_LEVEL_HIGH:
> > +	case IRQ_TYPE_LEVEL_LOW:
> > +		if (((hmr >> (d->hwirq % 64)) & 0x1) != GICV5_PPI_HM_LEVEL)
> > +			return -EINVAL;
> 
> Blink!
> 
> How does this test distinguish between LEVEL_LOW and LEVEL_HIGH? It only
> tests for level, no? So the test is interesting at best ...

There is no HIGH/LOW concept for level interrupts in the architecture,
level interrupts are asserted/de-asserted. On top of that, as you
already noticed, for PPIs this can't even be changed so this function
is utterly pointless.

> Secondly this comparison is confusing at best especially given that you
> mask with a hex constant (0x1) first.
> 
>      		if (hmr & BIT_UL(d->hwirq % 64))
>                 	return -EINVAL;
> 
> Aside of that why do you have a set_type() function if there is no way
> to set the type?

Yes, that's useless, the kernel is not there to validate firmware, I
will remove it.

> > +
> > +static int gicv5_ppi_irq_get_irqchip_state(struct irq_data *d,
> > +					   enum irqchip_irq_state which,
> > +					   bool *val)
> > +{
> > +	u64 pendr, activer, hwirq_id_bit = BIT_ULL(d->hwirq % 64);
> > +
> > +	switch (which) {
> > +	case IRQCHIP_STATE_PENDING:
> > +		pendr = READ_PPI_REG(d->hwirq, SPEND);
> > +
> > +		*val = !!(pendr & hwirq_id_bit);
> > +
> > +		return 0;
> 
> 		*val = !!(read_ppi_reg(d->hwirq, PPI_SPEND) & bit);
>                 return 0;
> 
> would take up less space and be readable.

Ok done.

> > +	case IRQCHIP_STATE_ACTIVE:
> > +		activer = READ_PPI_REG(d->hwirq, SACTIVE);
> > +
> > +		*val = !!(activer & hwirq_id_bit);
> > +
> > +		return 0;
> > +	default:
> > +		pr_debug("Unexpected PPI irqchip state\n");
> > +	}
> > +
> > +	return -EINVAL;
> 
> Move the return into the default case.

Ok.

> > +static int __init gicv5_init_domains(struct fwnode_handle *handle)
> > +{
> > +	struct irq_domain *d;
> > +
> > +	d = irq_domain_create_linear(handle, PPI_NR, &gicv5_irq_ppi_domain_ops,
> > +				     NULL);
> 
> Please use the full 100 charactes all over the place.

Ok.

> > +	if (!d)
> > +		return -ENOMEM;
> > +
> > +	irq_domain_update_bus_token(d, DOMAIN_BUS_WIRED);
> > +	gicv5_global_data.ppi_domain = d;
> > +
> > +	gicv5_global_data.fwnode = handle;
> 
> The random choices of seperating code with new lines are really
> amazing.

I separated code that initializes the domain from one that initialises
fwnode - it made sense to *me*, I don't know what makes sense to others
unless there are rules (or a script/bot reformatting the code for a
given subsytem) that one can follow I am afraid.

> > +static int __init gicv5_of_init(struct device_node *node, struct device_node *parent)
> > +{
> > +	int ret;
> > +
> > +	ret = gicv5_init_domains(&node->fwnode);
> 
>         int ret = ....;

Ok.

> > +	if (ret)
> 
> Thanks,
> 
>         tglx

Thanks for reviewing.

Lorenzo

