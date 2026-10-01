Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D432ACA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RQ6A9H9zmYcR12FE7rJxiFuAniJqyW14LcDrumbshw=; b=KBhjgKKWiKuIKTIhiGeVwb3Sea
	S6W9mcgLRdyK8ieREREGBwGLHalOtHsHkLIiaSom6TmU9PcbgRdWEZG4HZbs8bOO9w390ebIx5Gt7
	9s1NcRn2BdWGqpBBZHT/p+ZfyIyERPPoh6hrxtSRTepSk2LbxqK8nfU02zyKRYJ578QdJbwEAD6qj
	RzNTo9rm2t0hslqa5zXgAVyQz2PxcDxXLLlTQzhtV4SwRTfBiu4A1o2VV4d81De0S+UpShNkKOfeg
	U+fRR7UP8exyV7kYh+H6nYuHJnN6G1eTaRrAd11KOb3XfYA7kZOHpIVhUISEkwKeq428q/u6DUx8q
	3UsoO4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJcS-00000009hZB-2vSn;
	Thu, 01 Oct 2026 16:26:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJcP-00000009hYq-2V02
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:26:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CA9140184;
	Thu,  1 Oct 2026 16:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8371F000FF;
	Thu,  1 Oct 2026 16:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790872008;
	bh=1RQ6A9H9zmYcR12FE7rJxiFuAniJqyW14LcDrumbshw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FTVTZ2xhitb5tzoc9cZ1wx9CA0ppwSqT+39G0llCzD3lv5uaWQO+2X1p3NTspAaMT
	 JPhanSmuoLLxmSOU4ezAyF3uwd5DdK+jsh2LJ0T1UUP3qUvOITwPza5wK1wuNc/oub
	 0y3w1Np/JFcL91qPpzXJArkSnTARrcLIIigF4z6+c86ADLLcfmXM3gtuKgk5Rcmepo
	 rQ0FLk0a7E6wksQHzUPnRQQ/8uU9K9UPBc08F573OM/dkRCWoHgUngapbg3T5t8jFd
	 zrYONIdTQh6P9VKXaCffwcgRcmXl7jrnE/m+5n39WDPHa1pO4EB52QD7wThy9hnVYe
	 3419sS2GkntSA==
Date: Thu, 1 Oct 2026 17:26:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 08/15] KVM: arm64: Enforce EXLOCK for SPSR and ELR
Message-ID: <ar5thpZI5GiCfVRR@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-8-3556644cd927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930-arm64-gcs-v21-8-3556644cd927@kernel.org>
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

On Wed, Sep 30, 2026 at 10:48:18PM +0100, Mark Brown wrote:
> As per I_CFFNS and the pseudocode for the SPSR_ELx and ELR_ELx registers
> a GCS exception with ExType 1 is generated for attempts to write to
> those registers when both GCSCR_ELx.EXLOCKEN and PSTATE.EXLOCK are set.

From [4] I see I_CFFNS is defined as:

"When an MSR instruction would write to the relevant ELR_ELx or SPSR_ELx
for the current Exception level ELy, the Effective value of
GCSCR_ELy.EXLOCKEN and PSTATE.EXLOCK may prevent the write."

So the lock applies to writes to the current EL's own ELR/SPSR rather than
to any ELR_ELx/SPSR_ELx the current EL can write to?

> Ensure that this is enforced for guests if access to these registers
> from the guest is handled by the hypervisor.
>
> Reviewed-by: Leonardo Bras <leo.bras@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_emulate.h |  8 +++++++
>  arch/arm64/kvm/sys_regs.c            | 42 ++++++++++++++++++++++++++++++++----
>  2 files changed, 46 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 0cd91b3d6c82..e47ab38327de 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -81,6 +81,14 @@ int kvm_inject_nested_irq(struct kvm_vcpu *vcpu);
>  int kvm_inject_nested_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr);
>  int kvm_inject_nested_serror(struct kvm_vcpu *vcpu, u64 esr);
>
> +static inline void kvm_inject_exlock(struct kvm_vcpu *vcpu)
> +{
> +	u64 esr = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_GCS) | ESR_ELx_IL |
> +		  FIELD_PREP(ESR_ELx_ExType_MASK, ESR_ELx_ExType_EXLOCK);
> +
> +	kvm_inject_sync(vcpu, esr);
> +}
> +
>  static inline void kvm_inject_nested_sve_trap(struct kvm_vcpu *vcpu)
>  {
>  	u64 esr = FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SVE) |
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 823460106de8..faecf4657ec5 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2866,14 +2866,42 @@ static bool access_sp_el1(struct kvm_vcpu *vcpu,
>  	return true;
>  }
>
> +static inline bool sysregs_exlocked(struct kvm_vcpu *vcpu)

So if this returns true, an EXLOCKException is raised, otherwise SPSR_EL1
is set (based on caller below).

From [0] the pseudocode for MSR SPSR_EL1, <Xt> is:

elsif PSTATE.EL == EL2 then
    if IsFeatureImplemented(FEAT_GCS) && GetCurrentEXLOCKEN() && !Halted() && PSTATE.EXLOCK == '1' && ELIsInHost(EL2) then
        EXLOCKException();
    elsif ELIsInHost(EL2) then
        SPSR_EL2() = X{64}(t);
    else
        SPSR_EL1() = X{64}(t);
    end;

Reading [2] and [3], ELIsInHost(EL2) is equivalent to vcpu_el2_e2h_is_set(),
but the code doesn't check this anywhere?

The calling function only ever writes to SPSR_EL1, which implies
!ELIsInHost() (I guess because if it is true the writes are just done
directly to registers?)

But if that's always false, then an exception can never be raised due to
the first condition being false, and then the whole thing collapses to
SPSR_EL1() = X{64}(t).

So PSTATE.EL == EL2 is ~ I gather to is_hyp_ctxt() (guest's view of its own
EL) and thus this would be equivalent to:

if (is_hyp_ctxt())
	return false;

Wouldn't it?

But for the PSTATE.EL == EL1 branch (what the hardware runs for a vEL2
guest), also from [0]:

    if IsFeatureImplemented(FEAT_GCS) && GetCurrentEXLOCKEN() && !Halted() && PSTATE.EXLOCK == '1' && !(EffectiveHCR_EL2_NVx() IN {'x11'}) then
        EXLOCKException();
    elsif IsFeatureImplemented(FEAT_S1POE2) && EffectiveHCR_EL2_NVx() IN {'x11'} && FGDTState.nH == '1' then
        AArch64_FGDTSystemAccessTrap(EL1, 0x18);
    elsif EffectiveHCR_EL2_NVx() == '011' then
        AArch64_SystemAccessTrap(EL2, 0x18);
    elsif EffectiveHCR_EL2_NVx() IN {'111'} then
        NVMem(0x160) = X{64}(t);
    else
        SPSR_EL1() = X{64}(t);
    end;

EffectiveHCR_EL2_NVx() (see [5]) obtains the nested virt configuration
based on HCR flags.

In __compute_hcr():

static u64 __compute_hcr(struct kvm_vcpu *vcpu)
{
	...

	if (is_hyp_ctxt(vcpu)) {
		...
		hcr |= HCR_NV | HCR_NV2 | HCR_AT | HCR_TTLB;
		if (!vcpu_el2_e2h_is_set(vcpu))
			hcr |= HCR_NV1;
		...
	}
	...
}

So for a vEL2 guest this is either '101' (guest E2H=1), or '111' (guest E2H=0).

So that leaves us with:

    if IsFeatureImplemented(FEAT_GCS) && GetCurrentEXLOCKEN() && !Halted() && PSTATE.EXLOCK == '1' && !(EffectiveHCR_EL2_NVx() IN {'x11'}) then
        EXLOCKException();
    elsif EffectiveHCR_EL2_NVx() IN {'111'} then
        NVMem(0x160) = X{64}(t);
    else
        SPSR_EL1() = X{64}(t);

And from include/asm/vncr_mapping.h:

#define VNCR_SPSR_EL1           0x160

So that's the VNCR write that the hardware does.

So for '101' the hardware does the EXLOCK check and the write
itself, for '111' the check is skipped and the write goes to the VNCR page.

In both cases, nothing traps to KVM (only '011', NV1 without NV2 would -
but KVM never configures that as it requires NV2).

So... TL;DR is, shouldn't this function look like:

static inline bool sysregs_exlocked(struct kvm_vcpu *vcpu)
{
	if (!kvm_has_gcs(vcpu->kvm))
		return false;

	if (!(vcpu->arch.ctxt.regs.pstate & PSR_EXLOCK_BIT))
		return false;

	if (is_hyp_ctxt(vcpu))
		return false;

	return vcpu_read_sys_reg(vcpu, GCSCR_EL1) & GCSCR_ELx_EXLOCKEN;
}

?

> +{
> +	u64 gcscr;
> +
> +	if (!kvm_has_gcs(vcpu->kvm))
> +		return false;
> +
> +	if (!(vcpu->arch.ctxt.regs.pstate & PSR_EXLOCK_BIT))
> +		return false;
> +
> +	/*
> +	 * Note that the EXLOCKEN for the running EL is checked
> +	 * regardless of the register written to.
> +	 */

This seems to contradict [4] - the register written to is what decides
whether the lock applies?

> +	if (is_hyp_ctxt(vcpu))
> +		gcscr = vcpu_read_sys_reg(vcpu, GCSCR_EL2);
> +	else
> +		gcscr = vcpu_read_sys_reg(vcpu, GCSCR_EL1);

GetCurrentEXLOCKEN() is defined in [1] as:

    ...
    case PSTATE.EL of
	...
        when EL1 =>
            return GCSCR_EL1().EXLOCKEN == ‘1’;
        when EL2 =>
            return GCSCR_EL2().EXLOCKEN == ‘1’;
	...
    end;

And is_hyp_ctxt() -> PSTATE.EL == 2, else -> PSTATE.EL == 1 so this matches up with:

> +
> +	return gcscr & GCSCR_ELx_EXLOCKEN;

Where this is the .EXLOCKEN == '1' bit.

> +}
> +
>  static bool access_elr(struct kvm_vcpu *vcpu,
>  		       struct sys_reg_params *p,
>  		       const struct sys_reg_desc *r)
>  {
> -	if (p->is_write)
> +	if (p->is_write) {
> +		if (sysregs_exlocked(vcpu)) {
> +			kvm_inject_exlock(vcpu);
> +			return false;
> +		}
> +

(I assume ELR mirrors SPSR but I haven't checked).

>  		vcpu_write_sys_reg(vcpu, p->regval, ELR_EL1);
> -	else
> +	} else {
>  		p->regval = vcpu_read_sys_reg(vcpu, ELR_EL1);
> +	}
>
>  	return true;
>  }
> @@ -2882,10 +2910,16 @@ static bool access_spsr(struct kvm_vcpu *vcpu,
>  			struct sys_reg_params *p,
>  			const struct sys_reg_desc *r)
>  {
> -	if (p->is_write)
> +	if (p->is_write) {
> +		if (sysregs_exlocked(vcpu)) {
> +			kvm_inject_exlock(vcpu);
> +			return false;
> +		}
> +
>  		__vcpu_assign_sys_reg(vcpu, SPSR_EL1, p->regval);
> -	else
> +	} else {
>  		p->regval = __vcpu_sys_reg(vcpu, SPSR_EL1);
> +	}
>
>  	return true;
>  }
>
> --
> 2.47.3
>
>

[0]:https://support.arm.com/documentation/111107/2026-09/AArch64-Registers/SPSR-EL1--Saved-Program-Status-Register--EL1-?lang=en
[1]:https://support.arm.com/documentation/ddi0487/md/-Part-J-Architectural-Pseudocode/-Chapter-J1-A-profile-Architecture-Pseudocode/-J1-2-Pseudocode-for-AArch64-operation/-J1-2-267-GetCurrentEXLOCKEN
[2]:https://support.arm.com/documentation/ddi0487/md/-Part-J-Architectural-Pseudocode/-Chapter-J1-A-profile-Architecture-Pseudocode/-J1-4-Shared-pseudocode/-J1-4-552-ELIsInHost?lang=en
[3]:https://support.arm.com/documentation/ddi0487/md/-Part-J-Architectural-Pseudocode/-Chapter-J1-A-profile-Architecture-Pseudocode/-J1-4-Shared-pseudocode/-J1-4-558-EffectiveHCR-EL2-E2H?lang=en
[4]:https://support.arm.com/documentation/ddi0487/md/-Part-D-The-AArch64-System-Level-Architecture/-Chapter-D11-The-Guarded-Control-Stack/-D11-4-Exception-returns/-D11-4-1-Pushing-and-popping-exception-return-state?lang=en
[5]:https://support.arm.com/documentation/ddi0487/md/-Part-J-Architectural-Pseudocode/-Chapter-J1-A-profile-Architecture-Pseudocode/-J1-4-Shared-pseudocode/-J1-4-559-EffectiveHCR-EL2-NVx?lang=en

--
Cheers, Lorenzo

