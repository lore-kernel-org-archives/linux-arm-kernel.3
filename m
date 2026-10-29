Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892DC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qFKmZmsg;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dC3HqA+3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sCMf8bTlLJjVonCG39n3/nvXT5kk93Y5zWJCFDcw/+M=; b=qFKmZmsgc27NOHQT96gxvr6JeP
	Zc34VG5DFVmH6ZhUoAOpArNpo25X4JIr9GdhZcyrh6huML/CWv6uNXPkdXp4L1NzV4AeUKyvV+Vn9
	OWNCPLh2+NjEd29n/JTBz+GllTjkyTzZicMUJjlK4I9nrKGgbUnMCBRqoxZTvI/Ny+w5UUi3MXbPy
	aVPzfLJX6DVjBgH1rPgsmPFULNHccOcYH8LkG/nNszMRG6rSujP8grJJyxwSBUuY145pw0luZNGzB
	E2uRW90vMBqQPei74jSHA4OqyLEac+AD7PZWmOLfwwAPIs8nHp17tUrIh7S7R0dhQadtXxGxnO29L
	aPiOGfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSHR-00000009epR-1LM8;
	Thu, 29 Oct 2026 15:43:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSHQ-00000009epG-2S6w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 15:43:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0935560611;
	Thu, 29 Oct 2026 15:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0595B1F031E0;
	Thu, 29 Oct 2026 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793288583;
	bh=sCMf8bTlLJjVonCG39n3/nvXT5kk93Y5zWJCFDcw/+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dC3HqA+3dnHdbi2yhZJbhaggvZa889aJdyvvPnMRPPg/4eSYfRIZykHitQ9GMAbjh
	 BOrdCf+Hfn8um3F0MFmUCUUOgFLScpVr+h2BK3afFAkc6Qk6PKFFSwD07r/rjK1OHU
	 vN4mdJO04K4fK7xs0g33Ki7lMGAb5THFqN9pFXTTDcfOXYFcNlBgxI1FyyizIfeO6v
	 EWL3A8hbiELEMZLutCnwMJtsHtxBi64kQagmoaUmxApkmp7Af7HvNppWFJcxzBLYSe
	 ZjORrqtDaQvhZS3nHCG9gWIOfSym/ishmx4C/kFZCWKyryEKUl4QNxlqvzHY91vkbY
	 t0o8Tb537NGQg==
Date: Thu, 29 Oct 2026 15:42:57 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 16/28] KVM: arm64: Add SPE system registers to
 VCPU context
Message-ID: <auNTJpFW3XOPLXVP@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-17-alexandru.elisei@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-17-alexandru.elisei@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 03, 2026 at 05:06:11PM +0100, Alexandru Elisei wrote:
> Add the SPE registers to the VCPU context. Guest writes to the service bit,
> which change the state of the SPE maintenance interrupt, will be handled in
> a subsequent patch.
>
> Only the buffer registers are trapped, because KVM will need to keep track

Maybe worth saying which registers for ease?

Is this currently true as of this commit message? As this it is this commit
that's introducing these registers and I don't see anything that enforces
this?

If not, maybe worth saying something like 'ultimately, only the buffer registers
will be trapped. A warning is raised if a trap occurs for

> of the buffer enabled state for dirty page logging, errata handling and to
> sanitise writes to PMBLIMITR_EL1 based on the features exposed to the VM.

I think the commit message needs detail on what each of these means.

I think a key aspect of commit messages is to orient the reader in what the
series is trying to achieve - the code already tells you WHAT is going on but
the WHY and what foundations this patch establishes, etc. are not things that
people can automatically derive from the code.

In this case for instance, coming fresh to it - I wonder 'how does this interact
with dirty page logging, errata handling and santising writes to PMBLIMITR_EL1?
And why does SPE need to touch these things?' etc.

So I think thinking in those terms - giving context and orientating people
really helps drive a good commit message :)

I guess this is a long-winded way of suggesting that you should describe what
teach of these is needed for and how it influenced what you do here :P

>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Logic looks good here, but various nits and thoughts, and obviously the bot
raised a couple of things also.

> ---
>  arch/arm64/include/asm/kvm_host.h | 13 +++++++
>  arch/arm64/include/asm/kvm_spe.h  | 11 ++++++
>  arch/arm64/kvm/spe.c              | 29 ++++++++++++++++
>  arch/arm64/kvm/sys_regs.c         | 56 ++++++++++++++++++++++++-------
>  4 files changed, 96 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 10fa223bdbda..b92b19229c36 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -483,6 +483,19 @@ enum vcpu_sysreg {
>  	PMOVSSET_EL0,	/* Overflow Flag Status Set Register */
>  	PMUSERENR_EL0,	/* User Enable Register */
>
> +	/* SPE registers */
> +	PMSCR_EL1,
> +	PMSNEVFR_EL1,
> +	PMSICR_EL1,
> +	PMSIRR_EL1,
> +	PMSFCR_EL1,
> +	PMSEVFR_EL1,
> +	PMSLATFR_EL1,
> +	PMBLIMITR_EL1,
> +	PMBPTR_EL1,
> +	PMBSR_EL1,
> +	PMSDSFR_EL1,

OK so this is establishing the registers that SPE uses.

> +
>  	/* Pointer Authentication Registers in a strict increasing order. */
>  	APIAKEYLO_EL1,
>  	APIAKEYHI_EL1,
> diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
> index 4bae3e6b05c8..56dc9e660bef 100644
> --- a/arch/arm64/include/asm/kvm_spe.h
> +++ b/arch/arm64/include/asm/kvm_spe.h
> @@ -37,6 +37,9 @@ int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>
>  bool kvm_spe_pmu_set(struct kvm *kvm);
>  u8 kvm_spe_get_pmsver(struct kvm *kvm);
> +
> +bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val);
> +u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg);
>  #else
>  struct kvm_spe {
>  };
> @@ -81,6 +84,14 @@ static inline u8 kvm_spe_get_pmsver(struct kvm *kvm)
>  {
>  	return 0;
>  }
> +static inline bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
> +{
> +	return true;
> +}
> +static inline u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
> +{
> +	return 0;
> +}
>  #endif /* CONFIG_KVM_ARM_SPE */
>
>  #endif /* __ARM64_KVM_SPE_H__ */
> diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> index 4426d614a9e0..6a00a44c73ed 100644
> --- a/arch/arm64/kvm/spe.c
> +++ b/arch/arm64/kvm/spe.c
> @@ -7,6 +7,7 @@
>  #include <linux/kvm_host.h>
>  #include <linux/perf/arm_spe_pmu.h>
>
> +#include <asm/kvm_emulate.h>
>  #include <asm/kvm_spe.h>
>  #include <asm/sysreg.h>
>
> @@ -82,6 +83,34 @@ void kvm_spe_destroy_vm(struct kvm *kvm)
>  	module_put(spe_pmu->pmu.module);
>  }
>
> +bool kvm_spe_write_sysreg(struct kvm_vcpu *vcpu, int reg, u64 val)
> +{
> +	switch (reg) {
> +	case PMBLIMITR_EL1:
> +	case PMBSR_EL1:
> +	case PMBPTR_EL1:
> +		__vcpu_assign_sys_reg(vcpu, reg, val);
> +		break;
> +	default:
> +		WARN_ON_ONCE("unexpected trap");

I see the bot already raised this :)

> +	}
> +
> +	return true;

Hmm, this returns true unconditionally, should it be a void?

> +}
> +
> +u64 kvm_spe_read_sysreg(struct kvm_vcpu *vcpu, int reg)
> +{
> +	switch (reg) {
> +	case PMBLIMITR_EL1:
> +	case PMBSR_EL1:
> +	case PMBPTR_EL1:
> +		return __vcpu_sys_reg(vcpu, reg);

OK so only the buffer registers can be read?

> +	default:
> +		WARN_ON_ONCE("unexpected trap");

Obviously also needs a fixup as per bot :P (I'm pretty sure I've made this
exactly same mistake myself quite a few times so don't worry!)

> +		return 0;
> +	}
> +}
> +
>  bool kvm_spe_pmu_set(struct kvm *kvm)
>  {
>  	return !!kvm->arch.kvm_spe.spe_pmu;
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index a6bb6884b965..89b01b6ac783 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1554,6 +1554,28 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
>  	return 0;
>  }
>
> +static unsigned int spe_visibility(const struct kvm_vcpu *vcpu,
> +				   const struct sys_reg_desc *r)
> +{
> +	if (vcpu_has_spe(vcpu))
> +		return 0;
> +
> +	return REG_HIDDEN;
> +}

OK so this, I gather, is simply saying 'if the VCPU supports SPE, allow access
to the registers, otherwise don't.

> +
> +static bool access_spe_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
> +			   const struct sys_reg_desc *r)
> +{
> +	u64 val = p->regval;
> +	int reg = r->reg;
> +
> +	if (p->is_write)
> +		return kvm_spe_write_sysreg(vcpu, reg, val);
> +
> +	p->regval = kvm_spe_read_sysreg(vcpu, reg);
> +	return true;

NIT: I'm not sure the locals are really needed here, especially since you
reassign p->regval, so I think this would be better as:

static bool access_spe_reg(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
			   const struct sys_reg_desc *r)
{
	if (p->is_write)
		return kvm_spe_write_sysreg(vcpu, r->reg, p->regval);

	p->regval = kvm_spe_read_sysreg(vcpu, r->reg);
	return true;
}

> +}
> +
>  /* Silly macro to expand the DBG{BCR,BVR,WVR,WCR}n_EL1 registers in one go */
>  #define DBG_BCR_BVR_WCR_WVR_EL1(n)					\
>  	{ SYS_DESC(SYS_DBGBVRn_EL1(n)),					\
> @@ -1586,6 +1608,14 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
>  	  .reset = reset_pmevtyper,					\
>  	  .access = access_pmu_evtyper, .reg = (PMEVTYPER0_EL0 + n), }
>
> +#define SPE_SYS_REG(name)						\
> +	SYS_DESC(SYS_##name), .reg = name, .access = access_spe_reg,	\
> +	.reset = reset_val, .val = 0, .visibility = spe_visibility
> +
> +#define SPE_UNTRAPPED_REG(name)						\
> +	SYS_DESC(SYS_##name), .reg = name, .access = undef_access,	\
> +	.reset = reset_val, .val = 0, .visibility = spe_visibility

Could the first just be SPE_REG()? 'SYS' seems a bit redundant here.

And these are identical other than access, could you just make this
SPE_REG() with a parameter for visibility?

Actually, it seems like this pattern already exists, e.g. TIMER_REG():

#define TIMER_REG(name, vis)					   \
	SYS_REG_USER_FILTER(name, access_arch_timer, reset_val, 0, \
			    arch_timer_get_user, arch_timer_set_user, vis)

So this could be something like:

#define SPE_REG(name, acc)						\
	SYS_REG_USER_FILTER(name, acc, reset_val, 0, NULL, NULL,	\
			    spe_visibility)

Perhaps?

> +
>  /* Macro to expand the AMU counter and type registers*/
>  #define AMU_AMEVCNTR0_EL0(n) { SYS_DESC(SYS_AMEVCNTR0_EL0(n)), undef_access }
>  #define AMU_AMEVTYPER0_EL0(n) { SYS_DESC(SYS_AMEVTYPER0_EL0(n)), undef_access }
> @@ -3525,19 +3555,19 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	{ SYS_DESC(SYS_FAR_EL1), access_vm_reg, reset_unknown, FAR_EL1 },
>  	{ SYS_DESC(SYS_PAR_EL1), NULL, reset_unknown, PAR_EL1 },
>
> -	{ SYS_DESC(SYS_PMSCR_EL1), undef_access },
> -	{ SYS_DESC(SYS_PMSNEVFR_EL1), undef_access },
> -	{ SYS_DESC(SYS_PMSICR_EL1), undef_access },
> -	{ SYS_DESC(SYS_PMSIRR_EL1), undef_access },
> -	{ SYS_DESC(SYS_PMSFCR_EL1), undef_access },
> -	{ SYS_DESC(SYS_PMSEVFR_EL1), undef_access },
> -	{ SYS_DESC(SYS_PMSLATFR_EL1), undef_access },
> -	{ SYS_DESC(SYS_PMSIDR_EL1), undef_access },
> -	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
> -	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
> -	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
> -	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
> -	/* PMBIDR_EL1 is not trapped */
> +	{ SPE_UNTRAPPED_REG(PMSCR_EL1) },
> +	{ SPE_UNTRAPPED_REG(PMSNEVFR_EL1) },
> +	{ SPE_UNTRAPPED_REG(PMSICR_EL1) },
> +	{ SPE_UNTRAPPED_REG(PMSIRR_EL1) },
> +	{ SPE_UNTRAPPED_REG(PMSFCR_EL1) },
> +	{ SPE_UNTRAPPED_REG(PMSEVFR_EL1) },
> +	{ SPE_UNTRAPPED_REG(PMSLATFR_EL1) },
> +	{ SYS_DESC(SYS_PMSIDR_EL1), .access = undef_access },
> +	{ SPE_SYS_REG(PMBLIMITR_EL1) },
> +	{ SPE_SYS_REG(PMBPTR_EL1) },
> +	{ SPE_SYS_REG(PMBSR_EL1) },
> +	{ SPE_UNTRAPPED_REG(PMSDSFR_EL1) },
> +	/* PMBIDR_EL1 is not trapped and read-only */
>
>  	{ PMU_SYS_REG(PMINTENSET_EL1),
>  	  .access = access_pminten, .reg = PMINTENSET_EL1,
> --
> 2.43.0
>
>

--
Cheers, Lorenzo

