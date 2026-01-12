Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A5FC9EC78
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2JmRiUqBYtCdS8FrD8qXLISm98EGqzZdbyMB+r6h/I=; b=USd4umb+95mutgJHzHziJn8WTI
	NCU8RLbmKyeRekQx/HYpGImqGRehZ4Bz+R7OKHUM11c/6bo8eHCiS6NV3d6gacmtiNssCxbVBjD+5
	bQ6nata3Q/3nOQXqD5y0oKkvnPFldacKfRKEyWqez+SB/F/G/XydG6d43ACBbgNvnIe4PORhVr/tr
	CLwY5RG4tveGw4zT0xUdCcbuRXRNzg13BoHjiKHJsRRvQfohG2jLDNpiU3bPI0yP1Y7XbeAs4U3WJ
	U02BT3qg4v/Bcxy+ZXxqTe7AQd1gSn8V5BO+5DOOVelHe7Ppv+m8disi1t1XYkloCps/qCVRatEAT
	96AzGpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfG6R-00000005G0o-07CH;
	Mon, 12 Jan 2026 11:28:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfG6O-00000005Fzs-28wH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:28:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9B771516;
	Mon, 12 Jan 2026 03:28:44 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C76C03F694;
	Mon, 12 Jan 2026 03:28:49 -0800 (PST)
Date: Mon, 12 Jan 2026 11:28:47 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: mark.rutland@arm.com, james.morse@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [RFC PATCH v6 19/35] KVM: arm64: Trap PMBIDR_EL1 and PMSIDR_EL1
Message-ID: <aWTa76KXpIwzPh4k@raptor>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-20-alexandru.elisei@arm.com>
 <f7d73dc3-aa4a-4c32-aabb-21a61a2f773f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7d73dc3-aa4a-4c32-aabb-21a61a2f773f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_032852_641790_92F063A5 
X-CRM114-Status: GOOD (  29.56  )
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

Hi James,

On Fri, Jan 09, 2026 at 04:29:37PM +0000, James Clark wrote:
> 
> 
> On 14/11/2025 4:07 pm, Alexandru Elisei wrote:
> > PMBIDR_EL1 and PMSIDR_EL1 are read-only registers that describe the SPE
> > implementation. Trap reads to allow KVM to control how SPE is described to
> > a virtual machine. In particular, this is needed to:
> > 
> > - Advertise the maximum buffer size set by userspace in
> >    PMBIDR_EL1.MaxBuffSize.
> > - Hide in PMSIDR_EL1, if necessary, the presence of FEAT_SPE_FDS and
> >    FEAT_SPE_FnE, both of which add new registers which are already
> >    trapped via the FGU mechanism.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >   arch/arm64/include/asm/kvm_spe.h |  4 +-
> >   arch/arm64/kvm/config.c          | 13 ++++-
> >   arch/arm64/kvm/spe.c             | 82 +++++++++++++++++++++++++++++++-
> >   arch/arm64/kvm/sys_regs.c        | 13 +++--
> >   4 files changed, 103 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
> > index 3506d8c4c661..47b94794cc5f 100644
> > --- a/arch/arm64/include/asm/kvm_spe.h
> > +++ b/arch/arm64/include/asm/kvm_spe.h
> > @@ -40,7 +40,7 @@ int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
> >   int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
> >   bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val);
> > -u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg);
> > +u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding);
> >   #else
> >   struct kvm_spe {
> >   };
> > @@ -78,7 +78,7 @@ static inline bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
> >   {
> >   	return true;
> >   }
> > -static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
> > +static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding)
> >   {
> >   	return 0;
> >   }
> > diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> > index 24bb3f36e9d5..ed6b167b7aa8 100644
> > --- a/arch/arm64/kvm/config.c
> > +++ b/arch/arm64/kvm/config.c
> > @@ -6,6 +6,7 @@
> >   #include <linux/kvm_host.h>
> >   #include <asm/kvm_emulate.h>
> > +#include <asm/kvm_spe.h>
> >   #include <asm/kvm_nested.h>
> >   #include <asm/sysreg.h>
> > @@ -1489,6 +1490,16 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
> >   		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
> >   }
> > +static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
> > +{
> > +	__compute_fgt(vcpu, HDFGRTR_EL2);
> > +
> > +	if (vcpu_has_spe(vcpu)) {
> > +		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= HDFGRTR_EL2_PMBIDR_EL1;
> > +		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= HDFGRTR_EL2_PMSIDR_EL1;
> > +	}
> > +}
> > +
> >   static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
> >   {
> >   	__compute_fgt(vcpu, HDFGWTR_EL2);
> > @@ -1505,7 +1516,7 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
> >   	__compute_fgt(vcpu, HFGRTR_EL2);
> >   	__compute_hfgwtr(vcpu);
> >   	__compute_fgt(vcpu, HFGITR_EL2);
> > -	__compute_fgt(vcpu, HDFGRTR_EL2);
> > +	__compute_hdfgrtr(vcpu);
> >   	__compute_hdfgwtr(vcpu);
> >   	__compute_fgt(vcpu, HAFGRTR_EL2);
> > diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> > index 5b3dc622cf82..92eb46276c71 100644
> > --- a/arch/arm64/kvm/spe.c
> > +++ b/arch/arm64/kvm/spe.c
> > @@ -22,10 +22,16 @@ struct arm_spu_entry {
> >   	struct arm_spe_pmu *arm_spu;
> >   };
> > +static u64 max_buffer_size_to_pmbidr_el1(u64 size);
> > +
> >   void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
> >   {
> >   	struct arm_spu_entry *entry;
> > +	/* PMBIDR_EL1 cannot be trapped without FEAT_FGT. */
> > +	if (!cpus_have_final_cap(ARM64_HAS_FGT))
> > +		return;
> > +
> 
> Isn't this only required if you want to report a different PMBIDR value? If
> the value in hardware is already what you want to give to guests then it's
> not strictly required. Maybe it's something we can do as an addition later
> to make it usable in more places.

The maximum buffer size is advertised in PMBIDR_EL1.

Thanks,
Alex

> 
> >   	/* TODO: pKVM and nVHE support */
> >   	if (is_protected_kvm_enabled() || !has_vhe())
> >   		return;
> > @@ -86,9 +92,81 @@ bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
> >   	return true;
> >   }
> > -u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
> > +static bool kvm_spe_has_feat_spe_fds(struct kvm *kvm)
> > +{
> > +	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.arm_spu;
> > +
> > +	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P4) &&
> > +	       FIELD_GET(PMSIDR_EL1_FDS, spe_pmu->pmsidr_el1);
> > +}
> > +
> > +static bool kvm_spe_has_feat_spe_fne(struct kvm *kvm)
> > +{
> > +	struct arm_spe_pmu *spe_pmu = kvm->arch.kvm_spe.arm_spu;
> > +
> > +	return kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P2) &&
> > +	       FIELD_GET(PMSIDR_EL1_FnE, spe_pmu->pmsidr_el1);
> > +}
> > +
> > +static u64 kvm_spe_get_pmsidr_el1(struct kvm_vcpu *vcpu)
> >   {
> > -	return __vcpu_sys_reg(vcpu, reg);
> > +	struct kvm *kvm = vcpu->kvm;
> > +	u64 pmsidr = kvm->arch.kvm_spe.arm_spu->pmsidr_el1;
> > +
> > +	/* Filter out known RES0 bits. */
> > +	pmsidr &= ~GENMASK_ULL(63, 33);
> > +
> > +	if (!kvm_spe_has_feat_spe_fne(kvm))
> > +		pmsidr &= ~PMSIDR_EL1_FnE;
> > +
> > +	if (!kvm_spe_has_feat_spe_fds(kvm))
> > +		pmsidr &= ~PMSIDR_EL1_FDS;
> > +
> > +	return pmsidr;
> > +}
> > +
> > +static u64 kvm_spe_get_pmbidr_el1(struct kvm_vcpu *vcpu)
> > +{
> > +	struct kvm *kvm = vcpu->kvm;
> > +	struct kvm_spe *kvm_spe = &kvm->arch.kvm_spe;
> > +	u64 max_buffer_size = kvm_spe->max_buffer_size;
> > +	u64 pmbidr_el1 = kvm_spe->arm_spu->pmbidr_el1;
> > +
> > +	/* Filter out known RES0 bits. */
> > +	pmbidr_el1 &= ~(GENMASK_ULL(63, 48) | GENMASK_ULL(31, 12));
> > +
> > +	if (!kvm_has_feat(kvm, ID_AA64DFR2_EL1, SPE_nVM, IMP)) {
> > +		pmbidr_el1 &= ~PMBIDR_EL1_AddrMode;
> > +		pmbidr_el1 |= PMBIDR_EL1_AddrMode_VM_ONLY;
> > +	}
> > +
> > +	pmbidr_el1 &= ~PMBIDR_EL1_MaxBuffSize;
> > +	pmbidr_el1 |= max_buffer_size_to_pmbidr_el1(max_buffer_size);
> > +
> > +	return pmbidr_el1;
> > +}
> > +
> > +u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg, u32 encoding)
> > +{
> > +	u64 val = 0;
> > +
> > +	switch (encoding) {
> > +	case SYS_PMBIDR_EL1:
> > +		val = kvm_spe_get_pmbidr_el1(vcpu);
> > +		break;
> > +	case SYS_PMSIDR_EL1:
> > +		val = kvm_spe_get_pmsidr_el1(vcpu);
> > +		break;
> > +	case SYS_PMBLIMITR_EL1:
> > +	case SYS_PMBPTR_EL1:
> > +	case SYS_PMBSR_EL1:
> > +		val = __vcpu_sys_reg(vcpu, reg);
> > +		break;
> > +	default:
> > +		WARN_ON_ONCE(1);
> > +	}
> > +
> > +	return val;
> >   }
> >   static u64 max_buffer_size_to_pmbidr_el1(u64 size)
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index 5eeea229b46e..db86d1dcd148 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -1386,13 +1386,18 @@ static unsigned int spe_visibility(const struct kvm_vcpu *vcpu,
> >   static bool access_spe_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
> >   			   const struct sys_reg_desc *r)
> >   {
> > +	u32 encoding = reg_to_encoding(r);
> >   	u64 val = p->regval;
> >   	int reg = r->reg;
> > -	if (p->is_write)
> > +	if (p->is_write) {
> > +		if (WARN_ON_ONCE(encoding == SYS_PMBIDR_EL1 ||
> > +				 encoding == SYS_PMSIDR_EL1))
> > +			return write_to_read_only(vcpu, p, r);
> >   		return kvm_spe_write_sysreg(vcpu, reg, val);
> > +	}
> > -	p->regval = kvm_spe_read_sysreg(vcpu, reg);
> > +	p->regval = kvm_spe_read_sysreg(vcpu, reg, encoding);
> >   	return true;
> >   }
> > @@ -3360,12 +3365,12 @@ static const struct sys_reg_desc sys_reg_descs[] = {
> >   	{ SPE_UNTRAPPED_REG(PMSFCR_EL1) },
> >   	{ SPE_UNTRAPPED_REG(PMSEVFR_EL1) },
> >   	{ SPE_UNTRAPPED_REG(PMSLATFR_EL1) },
> > -	{ SYS_DESC(SYS_PMSIDR_EL1), .access = undef_access },
> > +	{ SYS_DESC(SYS_PMSIDR_EL1), .access = access_spe_reg, .visibility = spe_visibility },
> >   	{ SPE_TRAPPED_REG(PMBLIMITR_EL1) },
> >   	{ SPE_TRAPPED_REG(PMBPTR_EL1) },
> >   	{ SPE_TRAPPED_REG(PMBSR_EL1) },
> >   	{ SPE_UNTRAPPED_REG(PMSDSFR_EL1) },
> > -	{ SYS_DESC(SYS_PMBIDR_EL1), .access = undef_access },
> > +	{ SYS_DESC(SYS_PMBIDR_EL1), .access = access_spe_reg, .visibility = spe_visibility },
> >   	{ PMU_SYS_REG(PMINTENSET_EL1),
> >   	  .access = access_pminten, .reg = PMINTENSET_EL1,
> 

