Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE9CC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 13:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJjmQ4a3Ouz3YNYkZSgRMItKTn83OC5OVjYzGwSkUxg=; b=L1JCy2XEmMXn9gcoMDVNrYFu6A
	NON1k67JxQGqErhBZZCMqy8DPRhb02qR5NdY/kJcwZK78al1115xh22JvVfXclfjPqB1dlJj0xY4r
	gOnzyFa0l8TrmAZbPSe+nG7jOq57HOYfet6Hm4YxvqQAGTMk+h47hfYN1ueA6TPrH8geYPCtQm6Gl
	aUxrj1tufDhCi6l6q1lIOw9fvBNkTyQEPicbFARkHBpE3MbavQulBF23z8LLg/E4LYkUrHBc6kmcc
	ONyzKges0AyIrwk81N9+vbila5QDoisJuUjW/B1bNeu4pXRNS0GjbWrSc3xqIV/1aLhfpm087OrtI
	sEi35hEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk14A-00000000krU-0zOW;
	Thu, 07 Aug 2025 13:53:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk11d-00000000kSA-3iiw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 13:51:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29655600B0;
	Thu,  7 Aug 2025 13:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FADC4CEEB;
	Thu,  7 Aug 2025 13:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754574680;
	bh=ThfZI8md9CrWZXrgTa6/c+SU3B836P9u3EP0N0TYPVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K3bhKNAyofngSo0q4FYjTFuJ4a+/xREwldMHlQbBr0Y/Z2NJXnFcpf7APS4qRM164
	 iyWJcKH2bC6GqE1137p59HkJBm43BYf/+36HNhvmv/4aYdtJ//AYDjLYOBUFFyQV8B
	 PdX/tw8eRoArAHN1JP4xGyvWgmnK6bi39xHvKzAQAkGWVrj9dBcoCKGq5Gop+lN4uw
	 VQektz4b5PfZoM5HR50mVBwH7UTBQv2A3FIy09KQfzCMGPP+cYakrqgBmmXYYtVNYt
	 oEGL5HSJjYXbBYkN0LMDXHbTaY9BVMFTBQA9D6Fc53UH41Y6sVPw0FAOxAMnqWi1dw
	 YNU7G1SLtwZjQ==
Date: Thu, 7 Aug 2025 15:51:13 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 22/31] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <aJSvUWRqLEiARDIW@lpieralisi>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
 <20250703-gicv5-host-v7-22-12e71f1b3528@kernel.org>
 <cc611dda-d1e4-4793-9bb2-0eaa47277584@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc611dda-d1e4-4793-9bb2-0eaa47277584@huawei.com>
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

On Thu, Aug 07, 2025 at 07:52:58PM +0800, Jinjie Ruan wrote:
> 
> 
> On 2025/7/3 18:25, Lorenzo Pieralisi wrote:
> > An IRS supports Logical Peripheral Interrupts (LPIs) and implement
> > Linux IPIs on top of it.
> > 
> > LPIs are used for interrupt signals that are translated by a
> > GICv5 ITS (Interrupt Translation Service) but also for software
> > generated IRQs - namely interrupts that are not driven by a HW
> > signal, ie IPIs.
> > 
> > LPIs rely on memory storage for interrupt routing and state.
> > 
> > LPIs state and routing information is kept in the Interrupt
> > State Table (IST).
> > 
> > IRSes provide support for 1- or 2-level IST tables configured
> > to support a maximum number of interrupts that depend on the
> > OS configuration and the HW capabilities.
> > 
> > On systems that provide 2-level IST support, always allow
> > the maximum number of LPIs; On systems with only 1-level
> > support, limit the number of LPIs to 2^12 to prevent
> > wasting memory (presumably a system that supports a 1-level
> > only IST is not expecting a large number of interrupts).
> > 
> > On a 2-level IST system, L2 entries are allocated on
> > demand.
> > 
> > The IST table memory is allocated using the kmalloc() interface;
> > the allocation required may be smaller than a page and must be
> > made up of contiguous physical pages if larger than a page.
> > 
> > On systems where the IRS is not cache-coherent with the CPUs,
> > cache mainteinance operations are executed to clean and
> > invalidate the allocated memory to the point of coherency
> > making it visible to the IRS components.
> > 
> > On GICv5 systems, IPIs are implemented using LPIs.
> > 
> > Add an LPI IRQ domain and implement an IPI-specific IRQ domain created
> > as a child/subdomain of the LPI domain to allocate the required number
> > of LPIs needed to implement the IPIs.
> > 
> > IPIs are backed by LPIs, add LPIs allocation/de-allocation
> > functions.
> > 
> > The LPI INTID namespace is managed using an IDA to alloc/free LPI INTIDs.
> > 
> > Associate an IPI irqchip with IPI IRQ descriptors to provide
> > core code with the irqchip.ipi_send_single() method required
> > to raise an IPI.
> > 
> > Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
> > Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> > Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
> > Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Reviewed-by: Marc Zyngier <maz@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  arch/arm64/include/asm/smp.h       |  17 ++
> >  arch/arm64/include/asm/sysreg.h    |   6 +
> >  arch/arm64/kernel/smp.c            |  17 --
> >  drivers/irqchip/irq-gic-v5-irs.c   | 364 +++++++++++++++++++++++++++++++++++++
> >  drivers/irqchip/irq-gic-v5.c       | 299 +++++++++++++++++++++++++++++-
> >  include/linux/irqchip/arm-gic-v5.h |  63 ++++++-
> >  6 files changed, 746 insertions(+), 20 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> > index d6fd6efb66a6..d48ef6d5abcc 100644
> > --- a/arch/arm64/include/asm/smp.h
> > +++ b/arch/arm64/include/asm/smp.h
> > @@ -50,6 +50,23 @@ struct seq_file;
> >   */
> >  extern void smp_init_cpus(void);
> >  
> > +enum ipi_msg_type {
> > +	IPI_RESCHEDULE,
> > +	IPI_CALL_FUNC,
> > +	IPI_CPU_STOP,
> > +	IPI_CPU_STOP_NMI,
> > +	IPI_TIMER,
> > +	IPI_IRQ_WORK,
> > +	NR_IPI,
> > +	/*
> > +	 * Any enum >= NR_IPI and < MAX_IPI is special and not tracable
> > +	 * with trace_ipi_*
> > +	 */
> > +	IPI_CPU_BACKTRACE = NR_IPI,
> > +	IPI_KGDB_ROUNDUP,
> > +	MAX_IPI
> > +};
> > +
> >  /*
> >   * Register IPI interrupts with the arch SMP code
> >   */
> > diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> > index efd2e7a1fbe2..948007cd3684 100644
> > --- a/arch/arm64/include/asm/sysreg.h
> > +++ b/arch/arm64/include/asm/sysreg.h
> > @@ -1088,6 +1088,7 @@
> >  #define GICV5_OP_GIC_CDAFF		sys_insn(1, 0, 12, 1, 3)
> >  #define GICV5_OP_GIC_CDDI		sys_insn(1, 0, 12, 2, 0)
> >  #define GICV5_OP_GIC_CDDIS		sys_insn(1, 0, 12, 1, 0)
> > +#define GICV5_OP_GIC_CDHM		sys_insn(1, 0, 12, 2, 1)
> >  #define GICV5_OP_GIC_CDEN		sys_insn(1, 0, 12, 1, 1)
> >  #define GICV5_OP_GIC_CDEOI		sys_insn(1, 0, 12, 1, 7)
> >  #define GICV5_OP_GIC_CDPEND		sys_insn(1, 0, 12, 1, 4)
> > @@ -1115,6 +1116,11 @@
> >  #define GICV5_GIC_CDEN_TYPE_MASK	GENMASK_ULL(31, 29)
> >  #define GICV5_GIC_CDEN_ID_MASK		GENMASK_ULL(23, 0)
> >  
> > +/* Definitions for GIC CDHM */
> > +#define GICV5_GIC_CDHM_HM_MASK		BIT_ULL(32)
> > +#define GICV5_GIC_CDHM_TYPE_MASK	GENMASK_ULL(31, 29)
> > +#define GICV5_GIC_CDHM_ID_MASK		GENMASK_ULL(23, 0)
> > +
> >  /* Definitions for GIC CDPEND */
> >  #define GICV5_GIC_CDPEND_PENDING_MASK	BIT_ULL(32)
> >  #define GICV5_GIC_CDPEND_TYPE_MASK	GENMASK_ULL(31, 29)
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index 2c501e917d38..4797e2c70014 100644
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -64,23 +64,6 @@ struct secondary_data secondary_data;
> >  /* Number of CPUs which aren't online, but looping in kernel text. */
> >  static int cpus_stuck_in_kernel;
> >  
> > -enum ipi_msg_type {
> > -	IPI_RESCHEDULE,
> > -	IPI_CALL_FUNC,
> > -	IPI_CPU_STOP,
> > -	IPI_CPU_STOP_NMI,
> > -	IPI_TIMER,
> > -	IPI_IRQ_WORK,
> > -	NR_IPI,
> > -	/*
> > -	 * Any enum >= NR_IPI and < MAX_IPI is special and not tracable
> > -	 * with trace_ipi_*
> > -	 */
> > -	IPI_CPU_BACKTRACE = NR_IPI,
> > -	IPI_KGDB_ROUNDUP,
> > -	MAX_IPI
> > -};
> > -
> >  static int ipi_irq_base __ro_after_init;
> >  static int nr_ipi __ro_after_init = NR_IPI;
> >  
> > diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> > index fba8efceb26e..f00a4a6fece7 100644
> > --- a/drivers/irqchip/irq-gic-v5-irs.c
> > +++ b/drivers/irqchip/irq-gic-v5-irs.c
> > @@ -5,12 +5,20 @@
> >  
> >  #define pr_fmt(fmt)	"GICv5 IRS: " fmt
> >  
> > +#include <linux/log2.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> >  
> >  #include <linux/irqchip.h>
> >  #include <linux/irqchip/arm-gic-v5.h>
> >  
> > +/*
> > + * Hardcoded ID_BITS limit for systems supporting only a 1-level IST
> > + * table. Systems supporting only a 1-level IST table aren't expected
> > + * to require more than 2^12 LPIs. Tweak as required.
> > + */
> > +#define LPI_ID_BITS_LINEAR		12
> > +
> >  #define IRS_FLAGS_NON_COHERENT		BIT(0)
> >  
> >  static DEFINE_PER_CPU_READ_MOSTLY(struct gicv5_irs_chip_data *, per_cpu_irs_data);
> > @@ -28,6 +36,331 @@ static void irs_writel_relaxed(struct gicv5_irs_chip_data *irs_data,
> >  	writel_relaxed(val, irs_data->irs_base + reg_offset);
> >  }
> >  
> > +static u64 irs_readq_relaxed(struct gicv5_irs_chip_data *irs_data,
> > +			     const u32 reg_offset)
> > +{
> > +	return readq_relaxed(irs_data->irs_base + reg_offset);
> > +}
> > +
> > +static void irs_writeq_relaxed(struct gicv5_irs_chip_data *irs_data,
> > +			       const u64 val, const u32 reg_offset)
> > +{
> > +	writeq_relaxed(val, irs_data->irs_base + reg_offset);
> > +}
> > +
> > +/*
> > + * The polling wait (in gicv5_wait_for_op_s_atomic()) on a GIC register
> > + * provides the memory barriers (through MMIO accessors)
> > + * required to synchronize CPU and GIC access to IST memory.
> > + */
> > +static int gicv5_irs_ist_synchronise(struct gicv5_irs_chip_data *irs_data)
> > +{
> > +	return gicv5_wait_for_op_atomic(irs_data->irs_base, GICV5_IRS_IST_STATUSR,
> > +					GICV5_IRS_IST_STATUSR_IDLE, NULL);
> > +}
> > +
> > +static int __init gicv5_irs_init_ist_linear(struct gicv5_irs_chip_data *irs_data,
> > +					    unsigned int lpi_id_bits,
> > +					    unsigned int istsz)
> > +{
> > +	size_t l2istsz;
> > +	u32 n, cfgr;
> > +	void *ist;
> > +	u64 baser;
> > +	int ret;
> > +
> > +	/* Taken from GICv5 specifications 10.2.1.13 IRS_IST_BASER */
> > +	n = max(5, lpi_id_bits + 1 + istsz);
> > +
> > +	l2istsz = BIT(n + 1);
> > +	/*
> > +	 * Check memory requirements. For a linear IST we cap the
> > +	 * number of ID bits to a value that should never exceed
> > +	 * kmalloc interface memory allocation limits, so this
> > +	 * check is really belt and braces.
> > +	 */
> > +	if (l2istsz > KMALLOC_MAX_SIZE) {
> > +		u8 lpi_id_cap = ilog2(KMALLOC_MAX_SIZE) - 2 + istsz;
> > +
> > +		pr_warn("Limiting LPI ID bits from %u to %u\n",
> > +			lpi_id_bits, lpi_id_cap);
> > +		lpi_id_bits = lpi_id_cap;
> > +		l2istsz = KMALLOC_MAX_SIZE;
> > +	}
> > +
> > +	ist = kzalloc(l2istsz, GFP_KERNEL);
> 
> 
> When kmemleak is on, There is a memory leak occurring as below:
> 
> 
> unreferenced object 0xffff00080039a000 (size 4096):
>   comm "swapper/0", pid 0, jiffies 4294892296
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace (crc 0):
>     kmemleak_alloc+0x34/0x40
>     __kmalloc_noprof+0x320/0x464
>     gicv5_irs_iste_alloc+0x1a4/0x484
>     gicv5_irq_lpi_domain_alloc+0xe4/0x194
>     irq_domain_alloc_irqs_parent+0x78/0xd8
>     gicv5_irq_ipi_domain_alloc+0x180/0x238
>     irq_domain_alloc_irqs_locked+0x238/0x7d4
>     __irq_domain_alloc_irqs+0x88/0x114
>     gicv5_of_init+0x284/0x37c
>     of_irq_init+0x3b8/0xb18
>     irqchip_init+0x18/0x40
>     init_IRQ+0x104/0x164
>     start_kernel+0x1a4/0x3d4
>     __primary_switched+0x8c/0x94

Thank you for reporting it.

It should be a false positive, we hand over the memory to the GIC but
never store the pointer anywhere (only its PA).

Patch below should "fix" it - well, it is obvious, we are telling
kmemleak to ignore the pointer value:

-- >8 --
diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index ad1435a858a4..e8a576f66366 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt)	"GICv5 IRS: " fmt
 
+#include <linux/kmemleak.h>
 #include <linux/log2.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -117,6 +118,7 @@ static int __init gicv5_irs_init_ist_linear(struct gicv5_irs_chip_data *irs_data
 		kfree(ist);
 		return ret;
 	}
+	kmemleak_ignore(ist);
 
 	return 0;
 }
@@ -232,6 +234,7 @@ int gicv5_irs_iste_alloc(const u32 lpi)
 		kfree(l2ist);
 		return ret;
 	}
+	kmemleak_ignore(l2ist);
 
 	/*
 	 * Make sure we invalidate the cache line pulled before the IRS

