Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7C0E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmqiRvWjxIr5khdEiIxCO705f6i8d7d4l+YN455JJdo=; b=zaJkU2LxuYs9P1f1secySU2kIo
	NgFWUM0bIiplJ001aVNf9Xdwgt8zjPrnGdtlwas64QVbdl0J0YqVw1YyDlakxgeU4fVJusqEs53IK
	/bDDn4Rrb3Haru7d7g6CoEq8VTWpvhJoFUVeNcZvQFGZw8I6ivuNUg7mTzXjBeYLx6+vm+4GSU3OF
	jPi5eqMiZgSKmWVuFGYTmUqq7B3j5GOz7CYy8zakfGfSxY1PE/OMrLLZ/dp7UJK4VW6+ZVog3rbi5
	jgUxjw/+wWwLXh6GxyIzPoHTYIaFQ62R4JASx6pBVgGthZ5O02mM6AXCcVhWA1LgnohBFzat/0jsO
	jX7kwA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeNH-000000088VC-3JvV;
	Mon, 09 Dec 2024 14:04:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeK1-000000087hV-0wRl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:01:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE48E113E;
	Mon,  9 Dec 2024 06:01:40 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C9033F720;
	Mon,  9 Dec 2024 06:01:11 -0800 (PST)
Date: Mon, 9 Dec 2024 14:01:08 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] arm64/sysreg: Get rid of CPACR_ELx SysregFields
Message-ID: <Z1b4JKEXEK9PkZEu@J2N7QTR9R3.cambridge.arm.com>
References: <20241207190740.2607673-1-maz@kernel.org>
 <20241207190740.2607673-5-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241207190740.2607673-5-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_060113_357482_8F8A78B9 
X-CRM114-Status: GOOD (  27.27  )
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

On Sat, Dec 07, 2024 at 07:07:40PM +0000, Marc Zyngier wrote:
> There is no such thing as CPACR_ELx in the architecture.
> What we have is CPACR_EL1, for which CPTR_EL12 is an accessor.
> 
> Rename CPACR_ELx_* to CPACR_EL1_*, and fix the bit of code using
> these names.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

I ahven't look at this in great detail, but conceptaully it makes sense
to me, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/el2_setup.h      |  6 ++--
>  arch/arm64/include/asm/kvm_arm.h        |  2 --
>  arch/arm64/include/asm/kvm_emulate.h    | 40 ++++++++++++-------------
>  arch/arm64/include/asm/kvm_nested.h     |  8 ++---
>  arch/arm64/kernel/cpufeature.c          |  2 +-
>  arch/arm64/kvm/emulate-nested.c         |  2 +-
>  arch/arm64/kvm/fpsimd.c                 |  2 +-
>  arch/arm64/kvm/hyp/include/hyp/switch.h |  4 +--
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  4 +--
>  arch/arm64/kvm/hyp/nvhe/pkvm.c          |  2 +-
>  arch/arm64/kvm/hyp/nvhe/switch.c        |  6 ++--
>  arch/arm64/kvm/hyp/vhe/switch.c         | 16 +++++-----
>  arch/arm64/tools/sysreg                 |  6 +---
>  13 files changed, 47 insertions(+), 53 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 85ef966c08cd2..cc39c57df7873 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -154,7 +154,7 @@
>  /* Coprocessor traps */
>  .macro __init_el2_cptr
>  	__check_hvhe .LnVHE_\@, x1
> -	mov	x0, #CPACR_ELx_FPEN
> +	mov	x0, #CPACR_EL1_FPEN
>  	msr	cpacr_el1, x0
>  	b	.Lskip_set_cptr_\@
>  .LnVHE_\@:
> @@ -332,7 +332,7 @@
>  
>  	// (h)VHE case
>  	mrs	x0, cpacr_el1			// Disable SVE traps
> -	orr	x0, x0, #CPACR_ELx_ZEN
> +	orr	x0, x0, #CPACR_EL1_ZEN
>  	msr	cpacr_el1, x0
>  	b	.Lskip_set_cptr_\@
>  
> @@ -353,7 +353,7 @@
>  
>  	// (h)VHE case
>  	mrs	x0, cpacr_el1			// Disable SME traps
> -	orr	x0, x0, #CPACR_ELx_SMEN
> +	orr	x0, x0, #CPACR_EL1_SMEN
>  	msr	cpacr_el1, x0
>  	b	.Lskip_set_cptr_sme_\@
>  
> diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> index 3e0f0de1d2da8..43e365fbff0b2 100644
> --- a/arch/arm64/include/asm/kvm_arm.h
> +++ b/arch/arm64/include/asm/kvm_arm.h
> @@ -391,8 +391,6 @@
>  	ECN(SOFTSTP_CUR), ECN(WATCHPT_LOW), ECN(WATCHPT_CUR), \
>  	ECN(BKPT32), ECN(VECTOR32), ECN(BRK64), ECN(ERET)
>  
> -#define CPACR_EL1_TTA		(1 << 28)
> -
>  #define kvm_mode_names				\
>  	{ PSR_MODE_EL0t,	"EL0t" },	\
>  	{ PSR_MODE_EL1t,	"EL1t" },	\
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index cf811009a33c9..4f1d99725f6b3 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -556,13 +556,13 @@ static __always_inline void kvm_incr_pc(struct kvm_vcpu *vcpu)
>  	({								\
>  		u64 cptr = 0;						\
>  									\
> -		if ((set) & CPACR_ELx_FPEN)				\
> +		if ((set) & CPACR_EL1_FPEN)				\
>  			cptr |= CPTR_EL2_TFP;				\
> -		if ((set) & CPACR_ELx_ZEN)				\
> +		if ((set) & CPACR_EL1_ZEN)				\
>  			cptr |= CPTR_EL2_TZ;				\
> -		if ((set) & CPACR_ELx_SMEN)				\
> +		if ((set) & CPACR_EL1_SMEN)				\
>  			cptr |= CPTR_EL2_TSM;				\
> -		if ((clr) & CPACR_ELx_TTA)				\
> +		if ((clr) & CPACR_EL1_TTA)				\
>  			cptr |= CPTR_EL2_TTA;				\
>  		if ((clr) & CPTR_EL2_TAM)				\
>  			cptr |= CPTR_EL2_TAM;				\
> @@ -576,13 +576,13 @@ static __always_inline void kvm_incr_pc(struct kvm_vcpu *vcpu)
>  	({								\
>  		u64 cptr = 0;						\
>  									\
> -		if ((clr) & CPACR_ELx_FPEN)				\
> +		if ((clr) & CPACR_EL1_FPEN)				\
>  			cptr |= CPTR_EL2_TFP;				\
> -		if ((clr) & CPACR_ELx_ZEN)				\
> +		if ((clr) & CPACR_EL1_ZEN)				\
>  			cptr |= CPTR_EL2_TZ;				\
> -		if ((clr) & CPACR_ELx_SMEN)				\
> +		if ((clr) & CPACR_EL1_SMEN)				\
>  			cptr |= CPTR_EL2_TSM;				\
> -		if ((set) & CPACR_ELx_TTA)				\
> +		if ((set) & CPACR_EL1_TTA)				\
>  			cptr |= CPTR_EL2_TTA;				\
>  		if ((set) & CPTR_EL2_TAM)				\
>  			cptr |= CPTR_EL2_TAM;				\
> @@ -595,13 +595,13 @@ static __always_inline void kvm_incr_pc(struct kvm_vcpu *vcpu)
>  #define cpacr_clear_set(clr, set)					\
>  	do {								\
>  		BUILD_BUG_ON((set) & CPTR_VHE_EL2_RES0);		\
> -		BUILD_BUG_ON((clr) & CPACR_ELx_E0POE);			\
> -		__build_check_all_or_none((clr), CPACR_ELx_FPEN);	\
> -		__build_check_all_or_none((set), CPACR_ELx_FPEN);	\
> -		__build_check_all_or_none((clr), CPACR_ELx_ZEN);	\
> -		__build_check_all_or_none((set), CPACR_ELx_ZEN);	\
> -		__build_check_all_or_none((clr), CPACR_ELx_SMEN);	\
> -		__build_check_all_or_none((set), CPACR_ELx_SMEN);	\
> +		BUILD_BUG_ON((clr) & CPACR_EL1_E0POE);			\
> +		__build_check_all_or_none((clr), CPACR_EL1_FPEN);	\
> +		__build_check_all_or_none((set), CPACR_EL1_FPEN);	\
> +		__build_check_all_or_none((clr), CPACR_EL1_ZEN);	\
> +		__build_check_all_or_none((set), CPACR_EL1_ZEN);	\
> +		__build_check_all_or_none((clr), CPACR_EL1_SMEN);	\
> +		__build_check_all_or_none((set), CPACR_EL1_SMEN);	\
>  									\
>  		if (has_vhe() || has_hvhe())				\
>  			sysreg_clear_set(cpacr_el1, clr, set);		\
> @@ -624,16 +624,16 @@ static __always_inline u64 kvm_get_reset_cptr_el2(struct kvm_vcpu *vcpu)
>  	u64 val;
>  
>  	if (has_vhe()) {
> -		val = (CPACR_ELx_FPEN | CPACR_EL1_ZEN_EL1EN);
> +		val = (CPACR_EL1_FPEN | CPACR_EL1_ZEN_EL1EN);
>  		if (cpus_have_final_cap(ARM64_SME))
>  			val |= CPACR_EL1_SMEN_EL1EN;
>  	} else if (has_hvhe()) {
> -		val = CPACR_ELx_FPEN;
> +		val = CPACR_EL1_FPEN;
>  
>  		if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
> -			val |= CPACR_ELx_ZEN;
> +			val |= CPACR_EL1_ZEN;
>  		if (cpus_have_final_cap(ARM64_SME))
> -			val |= CPACR_ELx_SMEN;
> +			val |= CPACR_EL1_SMEN;
>  	} else {
>  		val = CPTR_NVHE_EL2_RES1;
>  
> @@ -685,7 +685,7 @@ static inline bool ____cptr_xen_trap_enabled(const struct kvm_vcpu *vcpu,
>  #define __guest_hyp_cptr_xen_trap_enabled(vcpu, xen)				\
>  	(!vcpu_has_nv(vcpu) ? false :						\
>  	 ____cptr_xen_trap_enabled(vcpu,					\
> -				   SYS_FIELD_GET(CPACR_ELx, xen,		\
> +				   SYS_FIELD_GET(CPACR_EL1, xen,		\
>  						 vcpu_sanitised_cptr_el2(vcpu))))
>  
>  static inline bool guest_hyp_fpsimd_traps_enabled(const struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
> index 233e655227164..6cd08198bf195 100644
> --- a/arch/arm64/include/asm/kvm_nested.h
> +++ b/arch/arm64/include/asm/kvm_nested.h
> @@ -33,14 +33,14 @@ static inline u64 translate_tcr_el2_to_tcr_el1(u64 tcr)
>  
>  static inline u64 translate_cptr_el2_to_cpacr_el1(u64 cptr_el2)
>  {
> -	u64 cpacr_el1 = CPACR_ELx_RES1;
> +	u64 cpacr_el1 = CPACR_EL1_RES1;
>  
>  	if (cptr_el2 & CPTR_EL2_TTA)
> -		cpacr_el1 |= CPACR_ELx_TTA;
> +		cpacr_el1 |= CPACR_EL1_TTA;
>  	if (!(cptr_el2 & CPTR_EL2_TFP))
> -		cpacr_el1 |= CPACR_ELx_FPEN;
> +		cpacr_el1 |= CPACR_EL1_FPEN;
>  	if (!(cptr_el2 & CPTR_EL2_TZ))
> -		cpacr_el1 |= CPACR_ELx_ZEN;
> +		cpacr_el1 |= CPACR_EL1_ZEN;
>  
>  	cpacr_el1 |= cptr_el2 & (CPTR_EL2_TCPAC | CPTR_EL2_TAM);
>  
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 7712df48758e9..6e220da3a495b 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2377,7 +2377,7 @@ static void cpu_enable_mops(const struct arm64_cpu_capabilities *__unused)
>  static void cpu_enable_poe(const struct arm64_cpu_capabilities *__unused)
>  {
>  	sysreg_clear_set(REG_TCR2_EL1, 0, TCR2_EL1_E0POE);
> -	sysreg_clear_set(CPACR_EL1, 0, CPACR_ELx_E0POE);
> +	sysreg_clear_set(CPACR_EL1, 0, CPACR_EL1_E0POE);
>  }
>  #endif
>  
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 1ffbfd1c3cf2e..f1b7287e1f3c3 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -494,7 +494,7 @@ static enum trap_behaviour check_cptr_tta(struct kvm_vcpu *vcpu)
>  	if (!vcpu_el2_e2h_is_set(vcpu))
>  		val = translate_cptr_el2_to_cpacr_el1(val);
>  
> -	if (val & CPACR_ELx_TTA)
> +	if (val & CPACR_EL1_TTA)
>  		return BEHAVE_FORWARD_RW;
>  
>  	return BEHAVE_HANDLE_LOCALLY;
> diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
> index ea5484ce1f3ba..98718bd65bf15 100644
> --- a/arch/arm64/kvm/fpsimd.c
> +++ b/arch/arm64/kvm/fpsimd.c
> @@ -169,7 +169,7 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
>  	if (has_vhe() && system_supports_sme()) {
>  		/* Also restore EL0 state seen on entry */
>  		if (vcpu_get_flag(vcpu, HOST_SME_ENABLED))
> -			sysreg_clear_set(CPACR_EL1, 0, CPACR_ELx_SMEN);
> +			sysreg_clear_set(CPACR_EL1, 0, CPACR_EL1_SMEN);
>  		else
>  			sysreg_clear_set(CPACR_EL1,
>  					 CPACR_EL1_SMEN_EL0EN,
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 34f53707892df..abfa6ad92e91e 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -419,9 +419,9 @@ static bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
>  
>  	/* First disable enough traps to allow us to update the registers */
>  	if (sve_guest || (is_protected_kvm_enabled() && system_supports_sve()))
> -		cpacr_clear_set(0, CPACR_ELx_FPEN | CPACR_ELx_ZEN);
> +		cpacr_clear_set(0, CPACR_EL1_FPEN | CPACR_EL1_ZEN);
>  	else
> -		cpacr_clear_set(0, CPACR_ELx_FPEN);
> +		cpacr_clear_set(0, CPACR_EL1_FPEN);
>  	isb();
>  
>  	/* Write out the host state if it's in the registers */
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 6aa0b13d86e58..6c90ef6736d63 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -68,7 +68,7 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
>  	if (!guest_owns_fp_regs())
>  		return;
>  
> -	cpacr_clear_set(0, CPACR_ELx_FPEN | CPACR_ELx_ZEN);
> +	cpacr_clear_set(0, CPACR_EL1_FPEN | CPACR_EL1_ZEN);
>  	isb();
>  
>  	if (vcpu_has_sve(vcpu))
> @@ -481,7 +481,7 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
>  		handle_host_smc(host_ctxt);
>  		break;
>  	case ESR_ELx_EC_SVE:
> -		cpacr_clear_set(0, CPACR_ELx_ZEN);
> +		cpacr_clear_set(0, CPACR_EL1_ZEN);
>  		isb();
>  		sve_cond_update_zcr_vq(sve_vq_from_vl(kvm_host_sve_max_vl) - 1,
>  				       SYS_ZCR_EL2);
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 01616c39a8107..a6638c4ecd32d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -68,7 +68,7 @@ static void pvm_init_traps_aa64pfr0(struct kvm_vcpu *vcpu)
>  	/* Trap SVE */
>  	if (!FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_SVE), feature_ids)) {
>  		if (has_hvhe())
> -			cptr_clear |= CPACR_ELx_ZEN;
> +			cptr_clear |= CPACR_EL1_ZEN;
>  		else
>  			cptr_set |= CPTR_EL2_TZ;
>  	}
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index cc69106734ca7..0f6b01b3da5cf 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -48,14 +48,14 @@ static void __activate_traps(struct kvm_vcpu *vcpu)
>  	val |= has_hvhe() ? CPACR_EL1_TTA : CPTR_EL2_TTA;
>  	if (cpus_have_final_cap(ARM64_SME)) {
>  		if (has_hvhe())
> -			val &= ~CPACR_ELx_SMEN;
> +			val &= ~CPACR_EL1_SMEN;
>  		else
>  			val |= CPTR_EL2_TSM;
>  	}
>  
>  	if (!guest_owns_fp_regs()) {
>  		if (has_hvhe())
> -			val &= ~(CPACR_ELx_FPEN | CPACR_ELx_ZEN);
> +			val &= ~(CPACR_EL1_FPEN | CPACR_EL1_ZEN);
>  		else
>  			val |= CPTR_EL2_TFP | CPTR_EL2_TZ;
>  
> @@ -192,7 +192,7 @@ static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu)
>  
>  		/* Re-enable SVE traps if not supported for the guest vcpu. */
>  		if (!vcpu_has_sve(vcpu))
> -			cpacr_clear_set(CPACR_ELx_ZEN, 0);
> +			cpacr_clear_set(CPACR_EL1_ZEN, 0);
>  
>  	} else {
>  		__fpsimd_save_state(*host_data_ptr(fpsimd_state));
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index 80581b1c39959..59d992455793d 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -77,12 +77,12 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
>  	 * VHE (HCR.E2H == 1) which allows us to use here the CPTR_EL2.TAM
>  	 * shift value for trapping the AMU accesses.
>  	 */
> -	u64 val = CPACR_ELx_TTA | CPTR_EL2_TAM;
> +	u64 val = CPACR_EL1_TTA | CPTR_EL2_TAM;
>  
>  	if (guest_owns_fp_regs()) {
> -		val |= CPACR_ELx_FPEN;
> +		val |= CPACR_EL1_FPEN;
>  		if (vcpu_has_sve(vcpu))
> -			val |= CPACR_ELx_ZEN;
> +			val |= CPACR_EL1_ZEN;
>  	} else {
>  		__activate_traps_fpsimd32(vcpu);
>  	}
> @@ -122,13 +122,13 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
>  	 * hypervisor has traps enabled to dispel any illusion of something more
>  	 * complicated taking place.
>  	 */
> -	if (!(SYS_FIELD_GET(CPACR_ELx, FPEN, cptr) & BIT(0)))
> -		val &= ~CPACR_ELx_FPEN;
> -	if (!(SYS_FIELD_GET(CPACR_ELx, ZEN, cptr) & BIT(0)))
> -		val &= ~CPACR_ELx_ZEN;
> +	if (!(SYS_FIELD_GET(CPACR_EL1, FPEN, cptr) & BIT(0)))
> +		val &= ~CPACR_EL1_FPEN;
> +	if (!(SYS_FIELD_GET(CPACR_EL1, ZEN, cptr) & BIT(0)))
> +		val &= ~CPACR_EL1_ZEN;
>  
>  	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S2POE, IMP))
> -		val |= cptr & CPACR_ELx_E0POE;
> +		val |= cptr & CPACR_EL1_E0POE;
>  
>  	val |= cptr & CPTR_EL2_TCPAC;
>  
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index ad2f6265f7948..4e575c1b266f7 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1985,7 +1985,7 @@ Field	1	A
>  Field	0	M
>  EndSysreg
>  
> -SysregFields	CPACR_ELx
> +Sysreg	CPACR_EL1	3	0	1	0	2
>  Res0	63:30
>  Field	29	E0POE
>  Field	28	TTA
> @@ -1996,10 +1996,6 @@ Field	21:20	FPEN
>  Res0	19:18
>  Field	17:16	ZEN
>  Res0	15:0
> -EndSysregFields
> -
> -Sysreg	CPACR_EL1	3	0	1	0	2
> -Fields	CPACR_ELx
>  EndSysreg
>  
>  Sysreg	SMPRI_EL1	3	0	1	2	4
> -- 
> 2.39.2
> 

