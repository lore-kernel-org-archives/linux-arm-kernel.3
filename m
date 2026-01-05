Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9DCC79FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EuNbESseqgdTNP6c3baq2W5/YnGkPTH8cbXyHLgT9A=; b=eeFkygUJcYU/D1rO8ei2fH3DfU
	udfER+sSHkxPZYz8zELCrvZni8+Cgq1FsAZFp+3/Lp2Iw/Qn+xYHzoWI9yHkjhybFkFXiOlAhvZOV
	e0QurigEOkwkf2FDV1Cl6+EVZ/0WbmrH2Z+XyAhiWemeJad5iJh+QHF75I1XAjH1JJScdMO/7bB4C
	fdIpjd9NNrh48OqBgClm0HiJtf0oRQNRk2crIc/C+XtdWOS8rF/3sRqUZJW7cxUoDRRZPrGGaXW6/
	SagpWem4ek2vK8HjUAdP6mIhmwUv1Gg2uqdJXs/2FdzaITozLrUhyNJc3MUoU95MgkRPWuBrcgJlR
	knvoujbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnfP-0000000BkKe-2bTv;
	Mon, 05 Jan 2026 16:42:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnfM-0000000BkJk-3BMK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:42:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83E4C339;
	Mon,  5 Jan 2026 08:42:40 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 374173F6A8;
	Mon,  5 Jan 2026 08:42:45 -0800 (PST)
Date: Mon, 5 Jan 2026 16:42:34 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	james.clark@linaro.org, mark.rutland@arm.com, james.morse@arm.com
Subject: Re: [RFC PATCH v6 17/35] KVM: arm64: Add writable SPE system
 registers to VCPU context
Message-ID: <aVvp-vp47ZIc5vfH@raptor>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-18-alexandru.elisei@arm.com>
 <3ccbd4df-92a3-4d70-9ed8-c4a5658508d1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ccbd4df-92a3-4d70-9ed8-c4a5658508d1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_084249_373136_D75672DA 
X-CRM114-Status: GOOD (  23.97  )
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

Hi Suzuki,

On Tue, Dec 16, 2025 at 11:54:54AM +0000, Suzuki K Poulose wrote:
> On 14/11/2025 16:06, Alexandru Elisei wrote:
> > Add the writable SPE registers to the VCPU context. The registers for now
> > have generic accessors, with proper handling to be added. PMSIDR_EL1 and
> > PMBIDR_EL1 are not part of the VCPU context because they are read-only
> > registers.
..
> > diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
> > index 3ad6b7c6e4ba..0821ebfb03fa 100644
> > --- a/arch/arm64/kvm/debug.c
> > +++ b/arch/arm64/kvm/debug.c
> > @@ -38,19 +38,28 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
> >   {
> >   	preempt_disable();
> > -	/*
> > -	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
> > -	 * to disable guest access to the profiling and trace buffers
> > -	 */
> >   	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
> >   					 *host_data_ptr(nr_event_counters));
> > +	/*
> > +	 * This also clears MDCR_EL2_E2PB_MASK to disable guest access to the
> > +	 * trace buffer.
> 
> nit: MDCR_EL2_E2TB_MASK is for the trace buffer.

Indeed, I'll fix.

Thanks,
Alex

> 
> 
> Suzuki
> 
> 
> > +	 */
> >   	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
> > -				MDCR_EL2_TPMS |
> >   				MDCR_EL2_TTRF |
> >   				MDCR_EL2_TPMCR |
> >   				MDCR_EL2_TDRA |
> >   				MDCR_EL2_TDOSA);
> > +	if (vcpu_has_spe(vcpu)) {
> > +		/* Set buffer owner to EL1 and trap the buffer registers. */
> > +		vcpu->arch.mdcr_el2 |= FIELD_PREP(MDCR_EL2_E2PB, MDCR_EL2_E2PB_EL1_TRAP);
> > +		/* Leave TPMS zero and don't trap the sampling registers. */
> > +	} else {
> > +		/* Trap the sampling registers. */
> > +		vcpu->arch.mdcr_el2 |= MDCR_EL2_TPMS;
> > +		/* Leave E2PB zero and trap the buffer registers. */
> > +	}
> > +
> >   	/* Is the VM being debugged by userspace? */
> >   	if (vcpu->guest_debug)
> >   		/* Route all software debug exceptions to EL2 */
> > diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> > index 0c4896c6a873..5b3dc622cf82 100644
> > --- a/arch/arm64/kvm/spe.c
> > +++ b/arch/arm64/kvm/spe.c
> > @@ -8,6 +8,7 @@
> >   #include <linux/kvm_host.h>
> >   #include <linux/perf/arm_spe_pmu.h>
> > +#include <asm/kvm_emulate.h>
> >   #include <asm/kvm_spe.h>
> >   #include <asm/sysreg.h>
> > @@ -78,6 +79,18 @@ u8 kvm_spe_get_pmsver_limit(void)
> >   	return min(pmsver, ID_AA64DFR0_EL1_PMSVer_V1P5);
> >   }
> > +bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
> > +{
> > +	__vcpu_assign_sys_reg(vcpu, val, reg);
> > +
> > +	return true;
> > +}
> > +
> > +u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
> > +{
> > +	return __vcpu_sys_reg(vcpu, reg);
> > +}
> > +
> >   static u64 max_buffer_size_to_pmbidr_el1(u64 size)
> >   {
> >   	u64 msb_idx, num_bits;
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index ac859c39c2be..5eeea229b46e 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -1374,6 +1374,28 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
> >   	return 0;
> >   }
> > +static unsigned int spe_visibility(const struct kvm_vcpu *vcpu,
> > +				   const struct sys_reg_desc *r)
> > +{
> > +	if (vcpu_has_spe(vcpu))
> > +		return 0;
> > +
> > +	return REG_HIDDEN;
> > +}
> > +
> > +static bool access_spe_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
> > +			   const struct sys_reg_desc *r)
> > +{
> > +	u64 val = p->regval;
> > +	int reg = r->reg;
> > +
> > +	if (p->is_write)
> > +		return kvm_spe_write_sysreg(vcpu, reg, val);
> > +
> > +	p->regval = kvm_spe_read_sysreg(vcpu, reg);
> > +	return true;
> > +}
> > +
> >   /* Silly macro to expand the DBG{BCR,BVR,WVR,WCR}n_EL1 registers in one go */
> >   #define DBG_BCR_BVR_WCR_WVR_EL1(n)					\
> >   	{ SYS_DESC(SYS_DBGBVRn_EL1(n)),					\
> > @@ -1406,6 +1428,14 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
> >   	  .reset = reset_pmevtyper,					\
> >   	  .access = access_pmu_evtyper, .reg = (PMEVTYPER0_EL0 + n), }
> > +#define SPE_TRAPPED_REG(name)						\
> > +	SYS_DESC(SYS_##name), .reg = name, .access = access_spe_reg,	\
> > +	.reset = reset_val, .val = 0, .visibility = spe_visibility
> > +
> > +#define SPE_UNTRAPPED_REG(name)						\
> > +	SYS_DESC(SYS_##name), .reg = name, .access = undef_access,	\
> > +	.reset = reset_val, .val = 0, .visibility = spe_visibility
> > +
> >   /* Macro to expand the AMU counter and type registers*/
> >   #define AMU_AMEVCNTR0_EL0(n) { SYS_DESC(SYS_AMEVCNTR0_EL0(n)), undef_access }
> >   #define AMU_AMEVTYPER0_EL0(n) { SYS_DESC(SYS_AMEVTYPER0_EL0(n)), undef_access }
> > @@ -3323,19 +3353,19 @@ static const struct sys_reg_desc sys_reg_descs[] = {
> >   	{ SYS_DESC(SYS_FAR_EL1), access_vm_reg, reset_unknown, FAR_EL1 },
> >   	{ SYS_DESC(SYS_PAR_EL1), NULL, reset_unknown, PAR_EL1 },
> > -	{ SYS_DESC(SYS_PMSCR_EL1), undef_access },
> > -	{ SYS_DESC(SYS_PMSNEVFR_EL1), undef_access },
> > -	{ SYS_DESC(SYS_PMSICR_EL1), undef_access },
> > -	{ SYS_DESC(SYS_PMSIRR_EL1), undef_access },
> > -	{ SYS_DESC(SYS_PMSFCR_EL1), undef_access },
> > -	{ SYS_DESC(SYS_PMSEVFR_EL1), undef_access },
> > -	{ SYS_DESC(SYS_PMSLATFR_EL1), undef_access },
> > -	{ SYS_DESC(SYS_PMSIDR_EL1), undef_access },
> > -	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
> > -	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
> > -	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
> > -	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
> > -	/* PMBIDR_EL1 is not trapped */
> > +	{ SPE_UNTRAPPED_REG(PMSCR_EL1) },
> > +	{ SPE_UNTRAPPED_REG(PMSNEVFR_EL1) },
> > +	{ SPE_UNTRAPPED_REG(PMSICR_EL1) },
> > +	{ SPE_UNTRAPPED_REG(PMSIRR_EL1) },
> > +	{ SPE_UNTRAPPED_REG(PMSFCR_EL1) },
> > +	{ SPE_UNTRAPPED_REG(PMSEVFR_EL1) },
> > +	{ SPE_UNTRAPPED_REG(PMSLATFR_EL1) },
> > +	{ SYS_DESC(SYS_PMSIDR_EL1), .access = undef_access },
> > +	{ SPE_TRAPPED_REG(PMBLIMITR_EL1) },
> > +	{ SPE_TRAPPED_REG(PMBPTR_EL1) },
> > +	{ SPE_TRAPPED_REG(PMBSR_EL1) },
> > +	{ SPE_UNTRAPPED_REG(PMSDSFR_EL1) },
> > +	{ SYS_DESC(SYS_PMBIDR_EL1), .access = undef_access },
> >   	{ PMU_SYS_REG(PMINTENSET_EL1),
> >   	  .access = access_pminten, .reg = PMINTENSET_EL1,
> 

