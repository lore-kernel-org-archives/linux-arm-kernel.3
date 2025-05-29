Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3036C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 08:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbN1iwwYM9NEJ/dmRGgVge3McT1OM4smURjlQ/FgS8U=; b=Y6UOHHCCmfvxYmqeqVg05zqLEO
	E9INAbq6FdvgYWb3JjFcefCWDRkUidh7NEZHCJuADZ2FVvOlEPtS0S0kRJ8CzJNLoktYWuiQJZaGk
	O9S4VXP2TRQbV+fUHn1xPrAsYF51G6ZzcgRXMqtnrSx8bhYtW4plws23nfG5DuZ3raiCnqE9tUYNK
	lIi/FOavWktYQ1zTXKxObgq5WTV4c19wzAcx4HQ4LmrjfFNC8gNaq1MUX1/MeUq8JQOo7Ohs8VFgq
	4DQGZma18MFN7QrUmh+T3nsBP8KUkHK912EfZ2/Wwylksx0xpTPhPz9Tty0Wh+zX9aFKQPscOudod
	aLTAHftQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKYBI-0000000FDr1-1Cjf;
	Thu, 29 May 2025 08:00:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKY99-0000000FDdQ-3OE6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 07:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D737B5C6294;
	Thu, 29 May 2025 07:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2C1C4CEE7;
	Thu, 29 May 2025 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748505470;
	bh=IjRBVjwuYn/Jhd2j1NvIjEqF1XI2NQEh86RM/+YfwSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mL2jKA/aWBA53rwgjzaXA641wNEL238LEiztOJaDTp8WY49q/I3JEYIghDzBEFRsc
	 xhgx4wyw0OZFz+4cfDiwrtLKsNKqmCo4E7vHQL3361w5s4YEHxIQFduwNyEdD+6Yby
	 qI+TofAbadaI9tPBDQhCat070TucA6B0OoHnoXGs+2UQMJzVj/SKdc7AKgIQZ3MHQ9
	 W3YomvNakloRI0As882uzwpFeWs3Ri+UyxM+J43wZiMD1rQqpng0p1El65/Xm2Z4KV
	 F06p3dFQVEjRa5cog1HoF3sKMwNx2+FGv6Sr1AZJFtRPXeqHWGXFRVKm4H+0ucUz18
	 JIKm3PB3KDP8Q==
Date: Thu, 29 May 2025 09:57:42 +0200
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
Subject: Re: [PATCH v4 20/26] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <aDgTdorrkNFg7Jkf@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-20-b36e9b15a6c3@kernel.org>
 <20250528151524.00006dd9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528151524.00006dd9@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_005751_934187_C90B69D8 
X-CRM114-Status: GOOD (  48.99  )
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

On Wed, May 28, 2025 at 03:15:24PM +0100, Jonathan Cameron wrote:

[...]

> > +/* Shift and mask definitions for GIC CDDI */
> 
> Technically just masks (which are shifted) but none the less I wouldn't
> expect the comment to say Shift and mask.

Fixed.

> 
> > +#define GICV5_GIC_CDDI_TYPE_MASK	GENMASK_ULL(31, 29)
> > +#define GICV5_GIC_CDDI_ID_MASK		GENMASK_ULL(23, 0)
> > +
> > +/* Shift and mask definitions for GICR CDIA */
> 
> Likewise.
> 
> > +#define GICV5_GIC_CDIA_VALID_MASK	BIT_ULL(32)
> 
> Maybe
> GICV5_GICR_CDIA_VALID(r) etc given the instruction define name.

Yes I can do that.

> > +#define GICV5_GIC_CDIA_VALID(r)		FIELD_GET(GICV5_GIC_CDIA_VALID_MASK, r)
> 
> Personally I rarely see benefit in wrapping FIELD_GET() in another macro
> The bare code is only a little shorter and the FIELD_GET() inline keeps things nice
> and clear.  It's your code though so keep this if you really want to!

For these things to be honest I am reluctant to change them, it is
subjective - we may end up arguing forever.

> > +#define GICV5_GIC_CDIA_TYPE_MASK	GENMASK_ULL(31, 29)
> > +#define GICV5_GIC_CDIA_ID_MASK		GENMASK_ULL(23, 0)
> > +
> > +#define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
> > +#define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
> >  
> >  #define ARM64_FEATURE_FIELD_BITS	4
> >  
> > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > index 08bb3b031f23093311cf2f0918ad43e575b581d1..0f268f35b78531775aa233bfc362bfe119a68275 100644
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -54,6 +54,11 @@ config ARM_GIC_V3_ITS_FSL_MC
> >  	depends on FSL_MC_BUS
> >  	default ARM_GIC_V3_ITS
> >  
> > +config ARM_GIC_V5
> > +	bool
> > +	select IRQ_DOMAIN_HIERARCHY
> > +	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
> > +
> >  config ARM_NVIC
> >  	bool
> >  	select IRQ_DOMAIN_HIERARCHY
> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> > index 365bcea9a61ff89e2cb41034125b3fc8cd494d81..3f8225bba5f0f9ce5dbb629b6d4782eacf85da44 100644
> > --- a/drivers/irqchip/Makefile
> > +++ b/drivers/irqchip/Makefile
> > @@ -35,6 +35,7 @@ obj-$(CONFIG_ARM_GIC_V3)		+= irq-gic-v3.o irq-gic-v3-mbi.o irq-gic-common.o
> >  obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o irq-gic-v3-its-msi-parent.o
> >  obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
> >  obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
> > +obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o
> >  obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
> >  obj-$(CONFIG_ARM_NVIC)			+= irq-nvic.o
> >  obj-$(CONFIG_ARM_VIC)			+= irq-vic.o
> > diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a50982e5d98816d88e4fca37cc0ac31684fb6c76
> > --- /dev/null
> > +++ b/drivers/irqchip/irq-gic-v5.c
> > @@ -0,0 +1,460 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2024-2025 ARM Limited, All Rights Reserved.
> > + */
> > +
> > +#define pr_fmt(fmt)	"GICv5: " fmt
> > +
> > +#include <linux/irqdomain.h>
> > +#include <linux/wordpart.h>
> > +
> > +#include <linux/irqchip.h>
> > +#include <linux/irqchip/arm-gic-v5.h>
> > +
> > +#include <asm/cpufeature.h>
> > +#include <asm/exception.h>
> > +
> > +static u8 pri_bits __ro_after_init = 5;
> > +
> > +#define GICV5_IRQ_PRI_MASK	0x1f
> > +#define GICV5_IRQ_PRI_MI	(GICV5_IRQ_PRI_MASK & GENMASK(4, 5 - pri_bits))
> 
> 
> > +struct gicv5_chip_data {
> > +	struct fwnode_handle	*fwnode;
> > +	struct irq_domain	*ppi_domain;
> > +};
> > +
> > +static struct gicv5_chip_data gicv5_global_data __read_mostly;
> 
> 
> > +enum {
> > +	PPI_PENDING,
> > +	PPI_ACTIVE,
> > +	PPI_HM
> > +};
> > +
> > +static __always_inline u64 read_ppi_sysreg_s(unsigned int irq,
> > +					     const unsigned int which)
> 
> Name the enum and use that here rather than an unsigned int?
> Might as well give the compiler a hand.
> Maybe I'm missing a later use of this that means we can't do that.
> 
> This is almost enough combinations to justify a look up table but
> I guess the compiler might not figure out how to optimize that.	

Yes, while writing it I initially used a named enum, then switched
to this, does not change anything, function is always inline and either
the compiler manages to remove switch cases or the build fails :)
so at the end of the day a named enum does not change much, I
will change it to that though.

> 
> > +{
> > +	switch (which) {
> > +	case PPI_PENDING:
> > +		return irq < 64	? read_sysreg_s(SYS_ICC_PPI_SPENDR0_EL1) :
> > +				  read_sysreg_s(SYS_ICC_PPI_SPENDR1_EL1);
> > +	case PPI_ACTIVE:
> > +		return irq < 64	? read_sysreg_s(SYS_ICC_PPI_SACTIVER0_EL1) :
> > +				  read_sysreg_s(SYS_ICC_PPI_SACTIVER1_EL1);
> > +	case PPI_HM:
> > +		return irq < 64	? read_sysreg_s(SYS_ICC_PPI_HMR0_EL1) :
> > +				  read_sysreg_s(SYS_ICC_PPI_HMR1_EL1);
> > +	default:
> > +		BUILD_BUG_ON(1);
> > +	}
> > +}
> > +
> > +static __always_inline void write_ppi_sysreg_s(unsigned int irq, bool set,
> > +					       const unsigned int which)
> 
> Likewise - nicer with enum perhaps.

Done.

> 
> > +{
> > +	u64 bit = BIT_ULL(irq % 64);
> > +
> > +	switch (which) {
> > +	case PPI_PENDING:
> > +		if (set) {
> > +			if (irq < 64)
> > +				write_sysreg_s(bit, SYS_ICC_PPI_SPENDR0_EL1);
> > +			else
> > +				write_sysreg_s(bit, SYS_ICC_PPI_SPENDR1_EL1);
> > +		} else {
> > +			if (irq < 64)
> > +				write_sysreg_s(bit, SYS_ICC_PPI_CPENDR0_EL1);
> > +			else
> > +				write_sysreg_s(bit, SYS_ICC_PPI_CPENDR1_EL1);
> > +		}
> > +		return;
> > +	case PPI_ACTIVE:
> > +		if (set) {
> > +			if (irq < 64)
> > +				write_sysreg_s(bit, SYS_ICC_PPI_SACTIVER0_EL1);
> > +			else
> > +				write_sysreg_s(bit, SYS_ICC_PPI_SACTIVER1_EL1);
> > +		} else {
> > +			if (irq < 64)
> > +				write_sysreg_s(bit, SYS_ICC_PPI_CACTIVER0_EL1);
> > +			else
> > +				write_sysreg_s(bit, SYS_ICC_PPI_CACTIVER1_EL1);
> > +		}
> > +		return;
> > +	default:
> > +		BUILD_BUG_ON(1);
> > +	}
> > +}
> > +
> > +static int gicv5_ppi_irq_get_irqchip_state(struct irq_data *d,
> > +					   enum irqchip_irq_state which,
> > +					   bool *val)
> > +{
> > +	u64 hwirq_id_bit = BIT_ULL(d->hwirq % 64);
> > +
> > +	switch (which) {
> > +	case IRQCHIP_STATE_PENDING:
> > +		*val = !!(read_ppi_sysreg_s(d->hwirq, PPI_PENDING) & hwirq_id_bit);
> 
> The !! isn't needed AFAICS but maybe adds a small amount of documentation value if
> people don't notice that *val is a bool. I'd call it state as per the
> definition as that's kind of more obviously boolean than 'val'.

Ok for naming it 'state'.

> > +		return 0;
> > +	case IRQCHIP_STATE_ACTIVE:
> > +		*val = !!(read_ppi_sysreg_s(d->hwirq, PPI_ACTIVE) & hwirq_id_bit);
> > +		return 0;
> > +	default:
> > +		pr_debug("Unexpected PPI irqchip state\n");
> > +		return -EINVAL;
> > +	}
> > +}
> 
> 
> > +
> > +static void __exception_irq_entry gicv5_handle_irq(struct pt_regs *regs)
> > +{
> > +	bool valid;
> > +	u32 hwirq;
> > +	u64 ia;
> > +
> > +	ia = gicr_insn(CDIA);
> > +	valid = GICV5_GIC_CDIA_VALID(ia);
> > +
> > +	if (!valid)
> > +		return;
> > +
> > +	/*
> > +	 * Ensure that the CDIA instruction effects (ie IRQ activation) are
> > +	 * completed before handling the interrupt.
> > +	 */
> > +	gsb_ack();
> > +
> > +	/*
> > +	 * Ensure instruction ordering between an acknowledgment and subsequent
> > +	 * instructions in the IRQ handler using an ISB.
> > +	 */
> > +	isb();
> > +
> > +	hwirq = FIELD_GET(GICV5_HWIRQ_INTID, ia);
> 
> As below - the GICV5_HWIRQ defines other than this one are going from
> hwirq to something the GIC cares about - this one is extracting the
> software managed hwirq from the CDIA register. 

I don't get what you mean. We are extracting the HW INTID from the value
read with CDIA.

>   
> > +
> > +	handle_irq_per_domain(hwirq);
> > +}
> > +
> > +static void gicv5_cpu_disable_interrupts(void)
> > +{
> > +	u64 cr0;
> > +
> > +	cr0 = FIELD_PREP(ICC_CR0_EL1_EN, 0);
> > +	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
> 
> This might get more complex later, but if not why not squash
> to one line? Given the register name is right there, there
> isn't a lot of documentation benefit in having cr0 as
> the variable name.

See above. No rule on the matter - it is subjective so I am
reluctant to change it.

> > +}
> > +
> > +static void gicv5_cpu_enable_interrupts(void)
> > +{
> > +	u64 cr0, pcr;
> > +
> > +	write_sysreg_s(0, SYS_ICC_PPI_ENABLER0_EL1);
> > +	write_sysreg_s(0, SYS_ICC_PPI_ENABLER1_EL1);
> > +
> > +	gicv5_ppi_priority_init();
> > +
> > +	pcr = FIELD_PREP(ICC_PCR_EL1_PRIORITY, GICV5_IRQ_PRI_MI);
> > +	write_sysreg_s(pcr, SYS_ICC_PCR_EL1);
> > +
> > +	cr0 = FIELD_PREP(ICC_CR0_EL1_EN, 1);
> > +	write_sysreg_s(cr0, SYS_ICC_CR0_EL1);
> 
> Similar to above, I'd squash into single line.

Ditto.

> > +}
> > +
> > +static int gicv5_starting_cpu(unsigned int cpu)
> > +{
> > +	if (WARN(!gicv5_cpuif_has_gcie(),
> > +	    "GICv5 system components present but CPU does not have FEAT_GCIE"))
> 
> Alignment off to my eyes.  Either a tab or align with !

Fixed it.

> > +		return -ENODEV;
> > +
> > +	gicv5_cpu_enable_interrupts();
> > +
> > +	return 0;
> > +}
> > +
> 
> > diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..4ff0ba64d9840c3844671f7850bb3d81ba2eb1b6
> > --- /dev/null
> > +++ b/include/linux/irqchip/arm-gic-v5.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (C) 2025 ARM Limited, All Rights Reserved.
> > + */
> > +#ifndef __LINUX_IRQCHIP_ARM_GIC_V5_H
> > +#define __LINUX_IRQCHIP_ARM_GIC_V5_H
> > +
> > +#include <asm/sysreg.h>
> > +
> > +#define GICV5_HWIRQ_ID			GENMASK(23, 0)
> > +#define GICV5_HWIRQ_TYPE		GENMASK(31, 29)
> > +#define GICV5_HWIRQ_INTID		GENMASK_ULL(31, 0)
> 
> Maybe some hint as to what these are in from their naming?
> 
> First two are from hwirq as defined in the irq domain stuff.
> Not the 3rd one if I follow this right.

The three of them are there to handle the HW GICv5 INTID and its related
fields (Rule R_TJPHS), maybe I should add a comment highlighting this ?

Thanks,
Lorenzo

> > +
> > +#define GICV5_HWIRQ_TYPE_PPI		UL(0x1)
> > +
> > +#endif
> > 
> 

