Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1A0CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 09:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woH6kLZkDwnvCpb+bUK7eSkZhcxNNtIAI54fNYeYV2A=; b=SMW8XZpkvRkuZPH2h5jpmtduQ/
	K8vPW9NDfll9oZ0qz9OjaEjhKyebZJc0XMY1JKQo4GMQciEzlCCKV0zod2mQArQQDHiePZxwFMTWb
	XeoJhnMxDOj7jrfcRs7TsoxAowLwhXfaXacC8qSYxa/eddot8+Yw4Pt4I3RSPRxlW8xeTu1k4X9oD
	++zcSPoyxm+Uhncm60S5RHb3P0NaFw54NRoT1HN9vr02Q33cvEndhuhxTpZ/eCa5gyz8GBJnSj7xb
	UBHZlX66OBUrkiCrDn0iKZms5DTPk3kUYlgVfML9IUUCX0b41qlWZ5AVYLCUR6BNCXaQgZGBzk7Lv
	Px2fFlYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1A5-00000000Lj0-1fBh;
	Tue, 06 Oct 2026 09:08:37 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1A1-00000000Li9-3EeG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 09:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1791277714; x=1822813714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F4/2ziFaQ+14aJz8mQUHdsabipvtJe9Jxq46ZQmJerg=;
  b=rR+8pGv/qnRlg14yX1lKhgHjV2/ULp5cua8BTWQjJy0Nct3//3klwTjJ
   Iam3Ei7Vle8mrhUDyCTAyHlBtXbERzrHVT9d35jZ/lLdoTl4iJsFTKA7W
   /UeBQqEm0Ojqfj3ukarVZ3zIqgmtlR2wPpkS6VlFH2OhAd4QIb33MHHik
   DfOgo0v0ZKoUacZ2lTfESbLmFCDCZqFfhwsHEfszSe7v92s3dgyYu9OS4
   X3KhjXEbxeWwrG7SjS4076ZxHiTqUZTkou499qQQlMl9RkmIuOEFDmHbi
   fwgP6+2X9J2xftLrRPk2RTTtka3nl7acxI/uqSis+ue2dXoeYWMM6xmhw
   A==;
X-CSE-ConnectionGUID: jRLNxqlsSGixo9xz01mp1Q==
X-CSE-MsgGUID: 9B8ro+kAQkmZ6Gh8NTRf1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="257336423"
X-IronPort-AV: E=Sophos;i="6.27,143,1786978800"; 
   d="scan'208";a="257336423"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 18:08:28 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1DFC5820710
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Oct 2026 09:08:28 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C55278D29FB
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Oct 2026 09:08:27 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.10.34.24])
	by az2nlsmom4.fujitsu.com (Postfix) with SMTP id 0228720002A7;
	Tue,  6 Oct 2026 09:08:21 +0000 (UTC)
Date: Tue, 6 Oct 2026 18:08:19 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Tomohiro Misono <misono.tomohiro@fujitsu.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 4/4] irqchip/gicv3: Add workaround for FUJITSU-MONAKA
 erratum E#030003
Message-ID: <asS5r0WNCQpMIo4p@FCCLS0092175.localdomain>
References: <20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com>
 <20261002-monaka-fix-for-upstream-v1-4-4aec0b0cbe34@fujitsu.com>
 <86tsn42sqr.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86tsn42sqr.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_020834_331040_AAEA9C14 
X-CRM114-Status: GOOD (  54.22  )
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

On 10/02 13:26, Marc Zyngier wrote:
> On Fri, 02 Oct 2026 11:26:52 +0100,
> Tomohiro Misono <misono.tomohiro@fujitsu.com> wrote:
> > 
> > From: Kohei Enju <enju.kohei@fujitsu.com>
> > 
> > On affected FUJITSU-MONAKA CPUs, an SGI generated by writing to
> > ICC_SGI0R_EL1, ICC_SGI1R_EL1, or ICC_ASGI1R_EL1 may be lost if the
> > operation races with CPU interface processing triggered by the arrival
> > of a higher-priority interrupt, an update to a pending interrupt, or a
> > transition of the PE to the Sleep state. When this occurs, the system
> > register write does not complete, causing the issuing core to hang.
> >
> 
> Is the SGI lost? Or is the sender core hanging?

Both: the SGI is lost, and the sysreg write does not complete, causing
the sending core to hang.

> 
> I expect that virtualised accesses to these registers are not
> affected, since they trap, but it'd be good to document this.

You're right. I'll document it in v2.

> 
> > Work around the erratum by writing 1 to the bit corresponding to the
> > target SGI INTID in GICR_ISPENDR0 of each target PE's GIC Redistributor,
> > instead of writing to the affected system registers.
> > 
> > The affinity topology of affected systems has Aff0 == 0 for every PE,
> > with PEs distinguished by higher affinity levels. Consequently, an
> > ICC_SGI1R_EL1 write can target only one PE, so the workaround does not
> > increase the number of writes required to send an SGI to multiple PEs.
> >
> > Accessing a target PE's GICR_ISPENDR0 requires its Redistributor base to
> > have been discovered. Affected platforms conform to SBBR, which requires
> > PSCI for secondary CPU boot. They therefore do not use the ACPI Parking
> > protocol, which sends an IPI before the secondary CPU has initialized
> > its Redistributor. With PSCI, a secondary CPU discovers its
> > Redistributor before becoming an IPI target.
> > 
> > Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> > ---
> >  Documentation/arch/arm64/silicon-errata.rst |  2 ++
> >  drivers/irqchip/irq-gic-v3.c                | 48 +++++++++++++++++++++++++++++
> >  2 files changed, 50 insertions(+)
> > 
> > diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> > index 429bdf9a3d9d..13328a30df59 100644
> > --- a/Documentation/arch/arm64/silicon-errata.rst
> > +++ b/Documentation/arch/arm64/silicon-errata.rst
> > @@ -377,6 +377,8 @@ stable kernels.
> >  +----------------+-----------------+-----------------+-----------------------------+
> >  | Fujitsu        | MONAKA          | E#030002        | FUJITSU_ERRATUM_030002      |
> >  +----------------+-----------------+-----------------+-----------------------------+
> > +| Fujitsu        | MONAKA GICv3/v4 | E#030003        | N/A                         |
> > ++----------------+-----------------+-----------------+-----------------------------+
> >  +----------------+-----------------+-----------------+-----------------------------+
> >  | ASR            | ASR8601         | #8601001        | N/A                         |
> >  +----------------+-----------------+-----------------+-----------------------------+
> > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> > index 6e1fa5b247fc..e73fea8a0e27 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -80,6 +80,8 @@ static DEFINE_STATIC_KEY_FALSE(gic_nvidia_t241_erratum);
> >  
> >  static DEFINE_STATIC_KEY_FALSE(gic_arm64_2941627_erratum);
> >  
> > +static DEFINE_STATIC_KEY_FALSE(gic_fujitsu_030003_erratum);
> > +
> >  static struct gic_chip_data gic_data __read_mostly;
> >  static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
> >  
> > @@ -238,6 +240,9 @@ static DEFINE_PER_CPU(bool, has_rss);
> >  #define gic_data_rdist()		(this_cpu_ptr(gic_data.rdists.rdist))
> >  #define gic_data_rdist_rd_base()	(gic_data_rdist()->rd_base)
> >  #define gic_data_rdist_sgi_base()	(gic_data_rdist_rd_base() + SZ_64K)
> > +#define gic_data_rdist_cpu(cpu)		(per_cpu_ptr(gic_data.rdists.rdist, cpu))
> > +#define gic_data_rdist_rd_base_cpu(cpu)	(gic_data_rdist_cpu(cpu)->rd_base)
> > +#define gic_data_rdist_sgi_base_cpu(cpu)	(gic_data_rdist_rd_base_cpu(cpu) + SZ_64K)
> >  
> >  /* Our default, arbitrary priority value. Linux only uses one anyway. */
> >  #define DEFAULT_PMR_VALUE	0xf0
> > @@ -1373,6 +1378,13 @@ static void gic_send_sgi(u64 cluster_id, u16 tlist, unsigned int irq)
> >  	gic_write_sgi1r(val);
> >  }
> >  
> > +static void gic_send_sgi_via_rdist(int cpu, unsigned int irq)
> > +{
> > +	void __iomem *base = gic_data_rdist_sgi_base_cpu(cpu);
> > +
> > +	writel_relaxed(BIT(irq), base + GICR_ISPENDR0);
> > +}
> > +
> 
> I don't think there is any need for a helper, given that there is a
> single caller.

Ack.

> 
> >  static void gic_ipi_send_mask(struct irq_data *d, const struct cpumask *mask)
> >  {
> >  	int cpu;
> > @@ -1386,6 +1398,22 @@ static void gic_ipi_send_mask(struct irq_data *d, const struct cpumask *mask)
> >  	 */
> >  	dsb(ishst);
> >  
> > +	if (static_branch_unlikely(&gic_fujitsu_030003_erratum)) {
> > +		/*
> > +		 * The affinity topology of affected systems has Aff0 == 0 for
> > +		 * every PE; PEs are distinguished by higher affinity levels.
> > +		 * ICC_SGI1R_EL1 therefore targets only one PE per write, so
> > +		 * using GICR_ISPENDR0 does not increase the number of writes
> > +		 * required to send an SGI to multiple PEs.
> 
> This is not about the number of writes, but the cost of individual
> writes. A sysreg access is almost free (at least it is on decent
> implementations), while an MMIO access is probably one of the worst
> offenders. Therefore implying that there is no extra overhead is
> likely to be misleading. The commit message has the same problem.
> 
> In any case, I don't think you need to justify anything here, as the
> choice between costly SGIs and a dead CPU is pretty moot.

Ack. I'll remove the comment and the corresponding explanation from the
commit message.

For context, on this implementation, we do not expect a significant
latency difference between the MMIO and system register accesses, as
both ultimately reach the same hardware block.

> 
> > +		 */
> > +		for_each_cpu(cpu, mask)
> > +			gic_send_sgi_via_rdist(cpu, d->hwirq);
> > +
> > +		/* Force the above writes to GICR_ISPENDR0 to be executed */
> > +		dsb(st);
> 
> This doesn't force things to be executed. This is about completion of
> the access, and with an nGnRE mapping, it doesn't enforce that the
> stores actually reach the RDs, only an arbitrary point in the memory
> subsystem.  The only way to guarantee this is to perform a read-back.

Understood.

I hadn't considered this when writing v1, but on further reflection, I
don't think gic_ipi_send_mask() needs to wait for the target CPUs to
handle the IPIs. Given that the GICv2 driver does not wait for MMIO
write completion either, I don't think we need to ensure completion of
these writes before returning. 

If my understanding is correct, I'll remove the dsb(st) in v2.

> 
> If this is relying on some additional properties that are
> implementation specific, then this requires to be documented (for
> example, if the implementation treats nGnRE as nGnRnE).
> 
> > +		return;
> > +	}
> > +
> >  	for_each_cpu(cpu, mask) {
> >  		u64 cluster_id = MPIDR_TO_SGI_CLUSTER_ID(gic_cpu_to_affinity(cpu));
> >  		u16 tlist;
> > @@ -1871,6 +1899,20 @@ static bool gic_enable_quirk_rk3399(void *data)
> >  	return false;
> >  }
> >  
> > +#define SMCCC_SOC_ID_FUJITSU_MONAKA	0x00040003
> > +
> > +static bool gic_enable_quirk_fujitsu_030003(void *data)
> > +{
> > +	s32 soc_id = arm_smccc_get_soc_id_version();
> > +
> > +	/* Check JEP106 code for FUJITSU-MONAKA chip (0004:0003) */
> > +	if (soc_id != SMCCC_SOC_ID_FUJITSU_MONAKA)
> > +		return false;
> 
> Why is this keyed on some firmware interface, while it is the CPU
> interface that is at fault? I'd expect that looking at the MIDR would
> be more reliable.

Ack.

> 
> > +
> > +	static_branch_enable(&gic_fujitsu_030003_erratum);
> > +	return true;
> > +}
> > +
> >  static bool rd_set_non_coherent(void *data)
> >  {
> >  	struct gic_chip_data *d = data;
> > @@ -1951,6 +1993,12 @@ static const struct gic_quirk gic_quirks[] = {
> >  		.mask	= 0xff000fff,
> >  		.init	= gic_enable_quirk_rk3399,
> >  	},
> > +	{
> > +		.desc	= "GICv3: Fujitsu erratum 030003",
> > +		.iidr	= 0x0403043b,
> > +		.mask	= 0xffffffff,
> > +		.init	= gic_enable_quirk_fujitsu_030003,
> 
> Same problem. This is looking that the distributor instead of the CPU.
> It's OK to use it as a proxy for further filtering, but the final
> decision should probably rest on the MIDR.

Ack. I'll use the MIDR instead of the SoC ID.

Thanks,
Kohei

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

