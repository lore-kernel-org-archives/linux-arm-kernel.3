Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EE1C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLVG3SX52DlefiwDjns2adr70Tf1dqx00lt8nOWy2eE=; b=Esh/umYAScAtrj/SyETWqYpwGH
	z4ioGfEnSoQH3SO/J5b1HMqgDZkIU2Q8OQXSBiaiLZCR5+PoQmuNxACKUOtSw80svzwKNqu8VJLZN
	HF/OlWbjW/+G9Isk1hLsj4ouZYkoqGlNrBPnzIymTf0hwQ3emVukIo/t174mA35NdfBy4K5P6xNpO
	agD7Gb5wu9YEePl4ENaSqskE77vvCNCzUXyrwNfrytZhnfHGjZojP+ZVxWfQKophpZv+jD3tYbiVP
	QMM8w8TAYj708seUi+MWsZIKIReuyB7w9iaEM2jW3xTSNn3YpllqGG+W2eRhOklAPos3nvNELmsO3
	Q5GUbytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwtJ-00000008Mz1-02l6;
	Wed, 02 Jul 2025 12:48:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqx-00000008M8g-20wq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 12:46:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D224613AA;
	Wed,  2 Jul 2025 12:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59500C4CEED;
	Wed,  2 Jul 2025 12:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751460378;
	bh=xNQPpZ20lOA6x5uCrJooB3aWOdhA2rmyyeDbQ7gnXko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mNR7wl67fUJ2fLWJnrx1eA6CYJm6IV4JftZYI+XEmFVsz7lMGCEwGdCC5HQJKSL+P
	 WbmtKE5A2VC1USq0Zsu02x7JgMEDqI3gACbYL4GUNmkzSQNkm5l7OettVTB8PxH4jg
	 j1YwlRsQiXVoIOgLo/OtOkw1wX8jRCEMXx6p9WelxYiMLV42sQIdcs8glj9kFFvMVI
	 pqRPtMWSLgSw3hdmoOxX3X5LUSuHyDDW/0aBNru7JFTLVe7mTzPYNj4vyBOXlR4TI7
	 GObGd74Oiz8VsftLMHHvCOJqdJSHHn8DOzxIFepQJmodlbIv0Q7gdZkSD544yKhGl/
	 DnCgvewI3yFFQ==
Date: Wed, 2 Jul 2025 14:46:10 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v6 20/31] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <aGUqEkascwGFD9x+@lpieralisi>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
 <20250626-gicv5-host-v6-20-48e046af4642@kernel.org>
 <20250702124019.00006b01@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702124019.00006b01@huawei.com>
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

On Wed, Jul 02, 2025 at 12:40:19PM +0100, Jonathan Cameron wrote:
> On Thu, 26 Jun 2025 12:26:11 +0200
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> 
> > The GICv5 CPU interface implements support for PE-Private Peripheral
> > Interrupts (PPI), that are handled (enabled/prioritized/delivered)
> > entirely within the CPU interface hardware.
> 
> I can't remember where I got to last time so if I repeat stuff that
> you already responded to, feel free to just ignore me this time ;)
> 
> All superficial stuff. Feel free to completely ignore if you like.

We are at v6.16-rc4, series has been on the lists for 3 months, it has
been reviewed and we would like to get it into v6.17 if possible and
deemed reasonable, I am asking you folks please, what should I do ?

I can send a v7 with the changes requested below (no bug fixes there)
- it is fine by me - but I need to know please asap if we have a
plan to get this upstream this cycle.

Thanks,
Lorenzo

> > diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> > new file mode 100644
> > index 000000000000..a08daa562d21
> > --- /dev/null
> > +++ b/drivers/irqchip/irq-gic-v5.c
> > @@ -0,0 +1,461 @@
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
> > +
> > +#define PPI_NR	128
> > +
> > +static bool gicv5_cpuif_has_gcie(void)
> > +{
> > +	return this_cpu_has_cap(ARM64_HAS_GICV5_CPUIF);
> > +}
> > +
> > +struct gicv5_chip_data {
> > +	struct fwnode_handle	*fwnode;
> > +	struct irq_domain	*ppi_domain;
> > +};
> > +
> > +static struct gicv5_chip_data gicv5_global_data __read_mostly;
> 
> > +static void gicv5_hwirq_eoi(u32 hwirq_id, u8 hwirq_type)
> > +{
> > +	u64 cddi = hwirq_id | FIELD_PREP(GICV5_GIC_CDDI_TYPE_MASK, hwirq_type);
> 
> Slight preference for not needing to care where hwirq_id goes in CDDI or how big
> it is (other than when I checked the header defines).
>  
> 	u64 cddi = FIELD_PREP(GICV5_GIC_CDDI_ID_MASK, hwirq_id) |
>         	   FIELD_PREP(GICV5_GIC_CDDI_TYPE_MASK, hwirq_type);
> 
> 
> > +
> > +	gic_insn(cddi, CDDI);
> > +
> > +	gic_insn(0, CDEOI);
> > +}
> 
> > +static int gicv5_ppi_irq_get_irqchip_state(struct irq_data *d,
> > +					   enum irqchip_irq_state which,
> > +					   bool *state)
> > +{
> > +	u64 hwirq_id_bit = BIT_ULL(d->hwirq % 64);
> > +
> > +	switch (which) {
> > +	case IRQCHIP_STATE_PENDING:
> > +		*state = !!(read_ppi_sysreg_s(d->hwirq, PPI_PENDING) & hwirq_id_bit);
> 
> Technically don't need the !! but if you really like it I don't mind that much.
> 
> > +		return 0;
> > +	case IRQCHIP_STATE_ACTIVE:
> > +		*state = !!(read_ppi_sysreg_s(d->hwirq, PPI_ACTIVE) & hwirq_id_bit);
> > +		return 0;
> > +	default:
> > +		pr_debug("Unexpected PPI irqchip state\n");
> > +		return -EINVAL;
> > +	}
> > +}
> 
> 
> > +static int gicv5_irq_ppi_domain_translate(struct irq_domain *d,
> > +					  struct irq_fwspec *fwspec,
> > +					  irq_hw_number_t *hwirq,
> > +					  unsigned int *type)
> > +{
> > +	if (!is_of_node(fwspec->fwnode))
> > +		return -EINVAL;
> > +
> > +	if (fwspec->param_count < 3)
> 
> I don't care that much, but could relax this seeing as fwspec->param[2]
> isn't used anyway? Maybe a tiny comment on why it matters?
> 
> > +		return -EINVAL;
> > +
> > +	if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI)
> > +		return -EINVAL;
> > +
> > +	*hwirq = fwspec->param[1];
> > +
> > +	/*
> > +	 * Handling mode is hardcoded for PPIs, set the type using
> > +	 * HW reported value.
> > +	 */
> > +	*type = gicv5_ppi_irq_is_level(*hwirq) ? IRQ_TYPE_LEVEL_LOW : IRQ_TYPE_EDGE_RISING;
> > +
> > +	return 0;
> 
> 
> > +static int __init gicv5_of_init(struct device_node *node, struct device_node *parent)
> > +{
> > +	int ret = gicv5_init_domains(of_fwnode_handle(node));
> > +	if (ret)
> > +		return ret;
> > +
> > +	gicv5_set_cpuif_pribits();
> > +
> > +	ret = gicv5_starting_cpu(smp_processor_id());
> > +	if (ret)
> > +		goto out_dom;
> > +
> > +	ret = set_handle_irq(gicv5_handle_irq);
> > +	if (ret)
> > +		goto out_int;
> > +
> > +	return 0;
> > +
> > +out_int:
> > +	gicv5_cpu_disable_interrupts();
> > +out_dom:
> > +	gicv5_free_domains();
> 
> Naming is always tricky but I'd not really expect gicv5_free_domains() as the
> pair of gicv5_init_domains() (which is doing creation rather than just initializing).
> 
> Ah well, names are never prefect and I don't really mind.
> 
> > +
> > +	return ret;
> > +}
> > +IRQCHIP_DECLARE(gic_v5, "arm,gic-v5", gicv5_of_init);
> 

