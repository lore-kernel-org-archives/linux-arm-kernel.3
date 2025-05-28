Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC051C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMl7NmCXqOrDuCOXIRVJM7JrFL2qdgrBU/snagTn0+k=; b=uV6sNx37UaeW/F
	0fObVDHvun0ixPmz2m4w+q+O3sDzLiZQu+/+BsxwXI8Ykyjoe27j1dhR4yYmgFPdMkoHT/L9q+9PE
	g0rRC+jE5rwFYvkPRUnxuEEfNlIoDQNcjBnBYNrKfhVT5kYbOVmvX99UX6MsTXAk7q7V8mgl5SJiV
	BUl47JWWsyysiAPqUG+6PaK5R+CXq1XOCrx+zikStzdhjuE5SqpfXYfDvU6ZGpLKG9xkaAuceXPZe
	gUuKdiTYAZsufI7TJ7RppKoKJ1oWjvNukSDtdnwowFbgL2xvRyLt1b9QhReLFIpKoMIa+aAZBeGGP
	u5l1w8mrJIJRx5dVJrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJe1-0000000Dfv8-14Pf;
	Wed, 28 May 2025 16:28:45 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJFV-0000000Dc6q-2stJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 16:03:27 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b6vQQ74Vgz6K9MM;
	Thu, 29 May 2025 00:02:06 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1361C140277;
	Thu, 29 May 2025 00:03:20 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 May
 2025 18:03:19 +0200
Date: Wed, 28 May 2025 17:03:18 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v4 21/26] irqchip/gic-v5: Add GICv5 IRS/SPI support
Message-ID: <20250528170318.00001dd8@huawei.com>
In-Reply-To: <20250513-gicv5-host-v4-21-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
	<20250513-gicv5-host-v4-21-b36e9b15a6c3@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_090326_023160_0E6B9CAB 
X-CRM114-Status: GOOD (  49.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>, linux-kernel@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sascha
 Bischoff <sascha.bischoff@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 13 May 2025 19:48:14 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> The GICv5 Interrupt Routing Service (IRS) component implements
> interrupt management and routing in the GICv5 architecture.
> 
> A GICv5 system comprises one or more IRSes, that together
> handle the interrupt routing and state for the system.
> 
> An IRS supports Shared Peripheral Interrupts (SPIs), that are
> interrupt sources directly connected to the IRS; they do not
> rely on memory for storage. The number of supported SPIs is
> fixed for a given implementation and can be probed through IRS
> IDR registers.
> 
> SPI interrupt state and routing are managed through GICv5
> instructions.
> 
> Each core (PE in GICv5 terms) in a GICv5 system is identified with
> an Interrupt AFFinity ID (IAFFID).
> 
> An IRS manages a set of cores that are connected to it.
> 
> Firmware provides a topology description that the driver uses
> to detect to which IRS a CPU (ie an IAFFID) is associated with.
> 
> Use probeable information and firmware description to initialize
> the IRSes and implement GICv5 IRS SPIs support through an
> SPI-specific IRQ domain.
> 
> The GICv5 IRS driver:
> 
> - Probes IRSes in the system to detect SPI ranges
> - Associates an IRS with a set of cores connected to it
> - Adds an IRQchip structure for SPI handling
> 
> SPIs priority is set to a value corresponding to the lowest
> permissible priority in the system (taking into account the
> implemented priority bits of the IRS and CPU interface).
> 
> Since all IRQs are set to the same priority value, the value
> itself does not matter as long as it is a valid one.
> 
> Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>

A few comments inline. Mostly around of cpu phandle parsing.
+CC Ali as there is a comment on his SMT DT patch set inline.


> ---
>  arch/arm64/include/asm/sysreg.h    |  36 +++
>  drivers/irqchip/Makefile           |   2 +-
>  drivers/irqchip/irq-gic-v5-irs.c   | 433 +++++++++++++++++++++++++++++++++++++
>  drivers/irqchip/irq-gic-v5.c       | 341 +++++++++++++++++++++++++++--
>  include/linux/irqchip/arm-gic-v5.h | 130 +++++++++++
>  5 files changed, 920 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 9d28d408f9c6df24526dd8ecbf3c7d920246b22d..fbac3b6f056ae6fafd64457600d45808e4904ae3 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -1082,14 +1082,50 @@
>  /*
>   * Definitions for GICv5 instructions
>   */

>  
> +/* Shift and mask definitions for GIC CDAFF */

Similar comment. Mask definitions seems more accurate to me.



> +/* Shift and mask definitions for GIC CDDIS */
> +#define GICV5_GIC_CDDIS_TYPE_MASK	GENMASK_ULL(31, 29)
> +#define GICV5_GIC_CDDIS_TYPE(r)		FIELD_GET(GICV5_GIC_CDDIS_TYPE_MASK, r)
> +#define GICV5_GIC_CDDIS_ID_MASK		GENMASK_ULL(23, 0)
> +#define GICV5_GIC_CDDIS_ID(r)		FIELD_GET(GICV5_GIC_CDDIS_ID_MASK, r)

Similar to earlier comment. I'm not sure the shortened forms are worth the bother.



> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..8c448487b909c7d3b4e1f95a5bc02b741ecc40b3
> --- /dev/null
> +++ b/drivers/irqchip/irq-gic-v5-irs.c
> @@ -0,0 +1,433 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024-2025 ARM Limited, All Rights Reserved.
> + */
> +
> +#define pr_fmt(fmt)	"GICv5 IRS: " fmt
> +
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +
> +#include <linux/irqchip.h>
> +#include <linux/irqchip/arm-gic-v5.h>



> +int gicv5_spi_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct gicv5_irs_chip_data *irs_data = d->chip_data;
> +	u32 selr, cfgr;
> +	bool level;
> +	int ret;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +	case IRQ_TYPE_EDGE_FALLING:
> +		level = false;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +	case IRQ_TYPE_LEVEL_LOW:
> +		level = true;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	guard(raw_spinlock)(&irs_data->spi_config_lock);
> +
> +	selr = FIELD_PREP(GICV5_IRS_SPI_SELR_ID, d->hwirq);
> +	irs_writel_relaxed(irs_data, selr, GICV5_IRS_SPI_SELR);
> +	ret = gicv5_irs_wait_for_spi_op(irs_data);
> +	if (ret)
> +		return ret;
> +
> +	cfgr = FIELD_PREP(GICV5_IRS_SPI_CFGR_TM, level);
> +
> +	irs_writel_relaxed(irs_data, cfgr, GICV5_IRS_SPI_CFGR);
> +	ret = gicv5_irs_wait_for_spi_op(irs_data);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
	return gicv5_irq_wait_for_spi_op()

unless more code turns up here in a later patch.

> +}

> +
> +static void __init gicv5_irs_init_bases(struct gicv5_irs_chip_data *irs_data,
> +					void __iomem *irs_base,
> +					struct fwnode_handle *handle)
> +{
> +	struct device_node *np = to_of_node(handle);
> +	u32 cr0, cr1;
> +
> +	irs_data->fwnode = handle;
> +	irs_data->irs_base = irs_base;
> +
> +	if (of_property_read_bool(np, "dma-noncoherent")) {
> +		/*
> +		 * A non-coherent IRS implies that some cache levels cannot be
> +		 * used coherently by the cores and GIC. Our only option is to mark
> +		 * memory attributes for the GIC as non-cacheable; by default,
> +		 * non-cacheable memory attributes imply outer-shareable
> +		 * shareability, the value written into IRS_CR1_SH is ignored.
> +		 */
> +		cr1 = FIELD_PREP(GICV5_IRS_CR1_VPED_WA, GICV5_NO_WRITE_ALLOC)	|
As per earlier comments is this less clear as:
		cr1 = FIELD_PREP(GICV5_IRS_CR1_VPED_WA, 0)	|

To me, seems fine but up to you.

> +			FIELD_PREP(GICV5_IRS_CR1_VPED_RA, GICV5_NO_READ_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_VMD_WA, GICV5_NO_WRITE_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_VMD_RA, GICV5_NO_READ_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_VPET_RA, GICV5_NO_READ_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_VMT_RA, GICV5_NO_READ_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_IST_WA, GICV5_NO_WRITE_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_IST_RA, GICV5_NO_READ_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_IC, GICV5_NON_CACHE)		|
> +			FIELD_PREP(GICV5_IRS_CR1_OC, GICV5_NON_CACHE);
> +			irs_data->flags |= IRS_FLAGS_NON_COHERENT;
> +	} else {
> +		cr1 = FIELD_PREP(GICV5_IRS_CR1_VPED_WA, GICV5_WRITE_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_VPED_RA, GICV5_READ_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_VMD_WA, GICV5_WRITE_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_VMD_RA, GICV5_READ_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_VPET_RA, GICV5_READ_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_VMT_RA, GICV5_READ_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_IST_WA, GICV5_WRITE_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_IST_RA, GICV5_READ_ALLOC)	|
> +			FIELD_PREP(GICV5_IRS_CR1_IC, GICV5_WB_CACHE)		|
> +			FIELD_PREP(GICV5_IRS_CR1_OC, GICV5_WB_CACHE)		|
> +			FIELD_PREP(GICV5_IRS_CR1_SH, GICV5_INNER_SHARE);
> +	}
> +
> +	irs_writel_relaxed(irs_data, cr1, GICV5_IRS_CR1);
> +
> +	cr0 = FIELD_PREP(GICV5_IRS_CR0_IRSEN, 0x1);
> +	irs_writel_relaxed(irs_data, cr0, GICV5_IRS_CR0);
> +	gicv5_irs_wait_for_idle(irs_data);
> +}
> +
> +static int __init gicv5_irs_of_init_affinity(struct device_node *node,
> +					     struct gicv5_irs_chip_data *irs_data,
> +					     u8 iaffid_bits)
> +{
> +	/*
> +	 * Detect IAFFID<->CPU mappings from the device tree and
> +	 * record IRS<->CPU topology information.
> +	 */
> +	u16 iaffid_mask = GENMASK(iaffid_bits - 1, 0);
> +	u16 *iaffids __free(kfree) = NULL;

See comments in cleanup.h.  Linus has been fairly clear he doesn't like
separating the constructor and destructor like this - just declare
iaffids where you construct it.

> +	int ret, i, ncpus, niaffids;
> +

> +	ncpus = of_property_count_elems_of_size(node, "cpus", sizeof(u32));

cpus is a phandle? I think this is going to run into current discussion
on what phandles to CPUs on an SMT system look like (Rob Herring and Mark
Rutland have different views)
https://lore.kernel.org/linux-arm-kernel/20250512080715.82-1-alireza.sanaee@huawei.com/

Anyhow this doesn't look right to me.
I think it should be of_count_phandle_with_args()   Potentially with cpu-cells
as the argument depending on how that thread goes.

> +	if (ncpus < 0)
> +		return -EINVAL;
> +
> +	niaffids = of_property_count_elems_of_size(node, "arm,iaffids",
> +						   sizeof(u16));
> +	if (niaffids != ncpus)
> +		return -EINVAL;
> +
	u16 *iaffids __free(kfree) = kcalloc(niaffids, sizeof(*iaffids),
					     GFP_KERNEL);

> +	iaffids = kcalloc(niaffids, sizeof(*iaffids), GFP_KERNEL);
> +	if (!iaffids)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u16_array(node, "arm,iaffids", iaffids, niaffids);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < ncpus; i++) {
> +		struct device_node *cpu_node;
> +		u32 cpu_phandle;
> +		int cpu;
> +
> +		if (of_property_read_u32_index(node, "cpus", i, &cpu_phandle))
> +			continue;
> +
> +		cpu_node = of_find_node_by_phandle(cpu_phandle);

		cpu_node = of_parse_phandle(node, "cpus", i);

not work here?
 
> +		if (WARN_ON(!cpu_node))
> +			continue;
> +
> +		cpu = of_cpu_node_to_id(cpu_node);

If this is all you want then Ali's series gives you a helper

		cpu = of_cpu_phandle_to_id(node, &cpu_node, i);

Though even better to have a helper that allows
		cpu = of_cpu_phandle_to_id(node, NULL, i); and handles
the node put as internally.

Ali, any reason we can't do that?  Seems to be a fairly common
pattern.


 
> +		of_node_put(cpu_node);
> +		if (WARN_ON(cpu < 0))
> +			continue;
> +
> +		if (iaffids[i] & ~iaffid_mask) {
> +			pr_warn("CPU %d iaffid 0x%x exceeds IRS iaffid bits\n",
> +				cpu, iaffids[i]);
> +			continue;
> +		}
> +
> +		per_cpu(cpu_iaffid, cpu).iaffid = iaffids[i];
> +		per_cpu(cpu_iaffid, cpu).valid = true;
> +
> +		/* We also know that the CPU is connected to this IRS */
> +		per_cpu(per_cpu_irs_data, cpu) = irs_data;
> +	}
> +
> +	return ret;
> +}

> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index a50982e5d98816d88e4fca37cc0ac31684fb6c76..e58ff345dbfaf840b17ad63c4fdb6c227137cf4b 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
>
> +
> +static int gicv5_spi_irq_set_irqchip_state(struct irq_data *d,
> +					   enum irqchip_irq_state which,
> +					   bool val)
> +{

Similar to previous, I'd call the state parameter state rather than val.


> diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
> index 4ff0ba64d9840c3844671f7850bb3d81ba2eb1b6..187af307de9170d9569898cb1e50de376a38bd0a 100644
> --- a/include/linux/irqchip/arm-gic-v5.h
> +++ b/include/linux/irqchip/arm-gic-v5.h
> @@ -5,6 +5,8 @@
>  #ifndef __LINUX_IRQCHIP_ARM_GIC_V5_H
>  #define __LINUX_IRQCHIP_ARM_GIC_V5_H

>  
> +#define GICV5_NO_READ_ALLOC		0b0
> +#define GICV5_READ_ALLOC		0b1
> +#define GICV5_NO_WRITE_ALLOC		0b0
> +#define GICV5_WRITE_ALLOC		0b1

Given these are being written to fields called _RA and _WA
so the defines provide value over 0 and 1 in appropriate places?
Maybe just about. Anyhow, your code so on this up to you.

> +
> +#define GICV5_NON_CACHE			0b00
> +#define GICV5_WB_CACHE			0b01
> +#define GICV5_WT_CACHE			0b10
> +
> +#define GICV5_NON_SHARE			0b00
> +#define GICV5_OUTER_SHARE		0b10
> +#define GICV5_INNER_SHARE		0b11
> +
> +#define GICV5_IRS_IDR1			0x0004
> +#define GICV5_IRS_IDR2			0x0008
> +#define GICV5_IRS_IDR5			0x0014
> +#define GICV5_IRS_IDR6			0x0018
> +#define GICV5_IRS_IDR7			0x001c
> +#define GICV5_IRS_CR0			0x0080
> +#define GICV5_IRS_CR1			0x0084
> +#define GICV5_IRS_SPI_SELR		0x0108
> +#define GICV5_IRS_SPI_CFGR		0x0114
> +#define GICV5_IRS_SPI_STATUSR		0x0118
> +#define GICV5_IRS_PE_SELR		0x0140
> +#define GICV5_IRS_PE_STATUSR		0x0144
> +#define GICV5_IRS_PE_CR0		0x0148

Blank line here as this is end of register offsets.

> +#define GICV5_IRS_IDR1_PRIORITY_BITS	GENMASK(22, 20)
> +#define GICV5_IRS_IDR1_IAFFID_BITS	GENMASK(19, 16)




