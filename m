Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D3BCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQ58z3upk1eY3VciKlccEDc0f38MFbh+NQoVw05fFOc=; b=FKXV+uH/cKW6tZHVFloV/u82pw
	087IQgSkPGseCqb1NYf4LsdQOqTvOfOSJgrEWdubT0taX3XwTO40hOb8INKpJWl+3oe7G3u9m8v/6
	IOQoV8HU/6jEmyhkUON/Xd/PpOoyzJZYzGBNhoIj32sd80UxQI7SB/DNoyxZE5UiDPkuBkjR8IfKp
	Ak+ZCPczs+4gJcL7r/oQxb6gPTpMgzDlkI5t//w7N9dWSPWeT3cf73gdk8mk2Y0gZH4ESrDt0ATLY
	2mhVyNSCC1628dgt0ygjXQp2dQxLcr7kO44QpfQgHXdaPJuTgAXpch7u0EhpKtyAtuEucNavidef3
	4psB9c1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7An-0000000EH72-3B2O;
	Mon, 15 Jun 2026 13:16:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7Ak-0000000EH5m-2Sce
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:16:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso24933975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 06:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781529373; x=1782134173; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ58z3upk1eY3VciKlccEDc0f38MFbh+NQoVw05fFOc=;
        b=FWxMacLPptAF8jhIX5Fr4Kqj1iXZTG97M2EzNLQahYdtq01PeBbQQ8qaxzEkBKcoJ8
         WMpyf36Awgsz7p1RTwvVhYUmnhcNdC4hLZX/W4M1i49fB4zxzcbtxwt55Kvez+Hj92+N
         sboYcJdUkzvEuUJ33SiYKQSVb2RKFzxZblYIm358nNWdQ9e9XDLiBjhMWSNnDJYm0ehz
         X86fSL6NMQayoA7VPd8lBiCMKiP8OG2jTusT80asxYwNAs/0buBguIykofDw4x13gNGc
         DA6Rb3jm21K+Z4Q5AFnZLerp0vAh8oVzaZGo6iyP71BF16QHMfTo+viM49dhMHYmGlVq
         EfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529373; x=1782134173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQ58z3upk1eY3VciKlccEDc0f38MFbh+NQoVw05fFOc=;
        b=USEbTvIzBL8uS5H9+hIakQgsW4cgAsiyK5JhLA0xSTkx6Psj4202zNbNsJPufFgOsm
         3txzfezLB0EhLrYwnaqANXXaBtLIDGt54SUx9QyGqUnTg4Tu7V5MPN8gmKtYg8plO0Z1
         wx0WOAoMQpNCtFpBhl1D66c3QLuEBeOSxrfN+PRt3g4OxRyu21O2ChaHZVVWkIQuxkLR
         Zp0ac3tew3r2ib0DtUIZBp129nIvdiqLN7JvJIJXd6mSs98sj6cIM25Q4TMu1rNe7PgC
         Wf9eZb/tcGGMUXOv/CddpfyZ2YFTHd+TWc5O6pbdwk0aj2eKU4fa7UEGih9tQ3/QISWL
         PT8g==
X-Forwarded-Encrypted: i=1; AFNElJ9NDe7kHZPUGI0BY/O1ImYf7tbkHPxEtBgy2Rtl/a8kDJ0iWAXu2yuTACnhWfzR+izigMprO+Sb2YzyHzSoYBN0@lists.infradead.org
X-Gm-Message-State: AOJu0YyIghtDywCLJ4F0ffWAnIu6RSf6HZciAuDGjb+5uYlbR0kWF0FX
	o/2Spcg0J7YeeNt45K1htI2w1Ag8hMger8qWmefDnnzmct40On+29EHVteG1mFx13Q==
X-Gm-Gg: Acq92OE1ajnSY8TW1GjnQdKh5zXbumgWa8w8kTvatfGMffgIhTOowE2NBsuUs/FGJDz
	86gsWCkvPde3DAjsdnO2Xzq/F/+LO4VnBslKUj7mUcb3fDtgVfi7h30wYygfBx8Ip6K3PBLNTh/
	FNG9T8FisshXkAtKtnuIXnLGXqg8Gc6FBjJfe//e04rs5qGi8ChBTX+AsUJi4R4a1ga7wCaM4KZ
	bwJSJpqvR+kFg69kyEp3F9PIedyx+/JsStD4Uhj19T/C01eJLxJYmBYwBTZRBi7T17pUXSZwXXP
	loJj2CNh0yqryOLZpMqG0jPFOLZjbFIScEIwy6sLt9QDwoAoWhTwzdOYIiqlanwRbT0kzja11pK
	SjpZAyRMZAIvW7aV43s04kOCHgyfNq+nq5JUw21RUYyE5Kot5gSEbEtPWimCouUvUo7sRwQRonp
	nqpI1tu5z3sQNnv9daYmrkc4NlElFRkJVLECf4W2yAuTnR5UT4QuzCUfrTc0FbuQAAofI=
X-Received: by 2002:a05:600c:a06:b0:492:2c87:3d4b with SMTP id 5b1f17b1804b1-4922c87404amr32991675e9.12.1781529371744;
        Mon, 15 Jun 2026 06:16:11 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203d2449sm238175265e9.14.2026.06.15.06.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 06:16:10 -0700 (PDT)
Date: Mon, 15 Jun 2026 14:16:06 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: tabba@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Per Larsen <perlarsen@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/11] KVM: arm64: Factor out reusable vCPU reset
 helpers
Message-ID: <ai_7FupwNYrudRZZ@google.com>
References: <20260612065925.755562-1-tabba@google.com>
 <20260612065925.755562-7-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612065925.755562-7-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_061614_707375_2EF8360C 
X-CRM114-Status: GOOD (  30.22  )
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

On Fri, Jun 12, 2026 at 07:59:20AM +0100, tabba@google.com wrote:
> Pull the reusable pieces out of kvm_reset_vcpu(): expose the reset
> PSTATE values in kvm_arm.h, and split the core register reset and the
> PSCI-driven reset into kvm_reset_vcpu_core() and kvm_reset_vcpu_psci().
> A follow-up series reuses these to reset protected vCPUs at EL2.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/include/asm/kvm_arm.h     | 12 ++++++
>  arch/arm64/include/asm/kvm_emulate.h | 58 +++++++++++++++++++++++++++
>  arch/arm64/kvm/reset.c               | 60 ++--------------------------
>  3 files changed, 73 insertions(+), 57 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> index 3f9233b5a130..aba4ec09acd2 100644
> --- a/arch/arm64/include/asm/kvm_arm.h
> +++ b/arch/arm64/include/asm/kvm_arm.h
> @@ -348,4 +348,16 @@
>  	{ PSR_AA32_MODE_UND,	"32-bit UND" },	\
>  	{ PSR_AA32_MODE_SYS,	"32-bit SYS" }
>  
> +/*
> + * ARMv8 Reset Values
> + */
> +#define VCPU_RESET_PSTATE_EL1	(PSR_MODE_EL1h | PSR_A_BIT | PSR_I_BIT | \
> +				 PSR_F_BIT | PSR_D_BIT)
> +
> +#define VCPU_RESET_PSTATE_EL2	(PSR_MODE_EL2h | PSR_A_BIT | PSR_I_BIT | \
> +				 PSR_F_BIT | PSR_D_BIT)
> +
> +#define VCPU_RESET_PSTATE_SVC	(PSR_AA32_MODE_SVC | PSR_AA32_A_BIT | \
> +				 PSR_AA32_I_BIT | PSR_AA32_F_BIT)
> +
>  #endif /* __ARM64_KVM_ARM_H__ */
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index aed9fc0b717b..8436e71c402d 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -704,4 +704,62 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
>  			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
>  	}
>  }
> +
> +/* Reset a vcpu's core registers. */
> +static inline void kvm_reset_vcpu_core(struct kvm_vcpu *vcpu)
> +{
> +	u32 pstate;
> +
> +	if (vcpu_el1_is_32bit(vcpu)) {
> +		pstate = VCPU_RESET_PSTATE_SVC;
> +	} else if (vcpu_has_nv(vcpu)) {
> +		pstate = VCPU_RESET_PSTATE_EL2;
> +	} else {
> +		pstate = VCPU_RESET_PSTATE_EL1;
> +	}

nit: no brackes here, actually there were none before.

> +
> +	/* Reset core registers */
> +	memset(vcpu_gp_regs(vcpu), 0, sizeof(*vcpu_gp_regs(vcpu)));
> +	memset(&vcpu->arch.ctxt.fp_regs, 0, sizeof(vcpu->arch.ctxt.fp_regs));
> +	vcpu->arch.ctxt.spsr_abt = 0;
> +	vcpu->arch.ctxt.spsr_und = 0;
> +	vcpu->arch.ctxt.spsr_irq = 0;
> +	vcpu->arch.ctxt.spsr_fiq = 0;
> +	vcpu_gp_regs(vcpu)->pstate = pstate;
> +}
> +
> +/* PSCI reset handling for a vcpu. */
> +static inline void kvm_reset_vcpu_psci(struct kvm_vcpu *vcpu,
> +				       struct vcpu_reset_state *reset_state)
> +{
> +	unsigned long target_pc = reset_state->pc;
> +
> +	/* Gracefully handle Thumb2 entry point */
> +	if (vcpu_mode_is_32bit(vcpu) && (target_pc & 1)) {
> +		target_pc &= ~1UL;
> +		vcpu_set_thumb(vcpu);
> +	}
> +
> +	/* Propagate caller endianness */
> +	if (reset_state->be)
> +		kvm_vcpu_set_be(vcpu);
> +
> +	*vcpu_pc(vcpu) = target_pc;
> +
> +	/*
> +	 * We may come from a state where either a PC update was
> +	 * pending (SMC call resulting in PC being increpented to
> +	 * skip the SMC) or a pending exception. Make sure we get
> +	 * rid of all that, as this cannot be valid out of reset.
> +	 *
> +	 * Note that clearing the exception mask also clears PC
> +	 * updates, but that's an implementation detail, and we
> +	 * really want to make it explicit.
> +	 */
> +	vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
> +	vcpu_clear_flag(vcpu, EXCEPT_MASK);
> +	vcpu_clear_flag(vcpu, INCREMENT_PC);
> +	vcpu_set_reg(vcpu, 0, reset_state->r0);
> +}
> +
>  #endif /* __ARM64_KVM_EMULATE_H__ */
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index 60969d90bdd3..e22d0be9e57c 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -34,18 +34,6 @@
>  static u32 __ro_after_init kvm_ipa_limit;
>  unsigned int __ro_after_init kvm_host_sve_max_vl;
>  
> -/*
> - * ARMv8 Reset Values
> - */
> -#define VCPU_RESET_PSTATE_EL1	(PSR_MODE_EL1h | PSR_A_BIT | PSR_I_BIT | \
> -				 PSR_F_BIT | PSR_D_BIT)
> -
> -#define VCPU_RESET_PSTATE_EL2	(PSR_MODE_EL2h | PSR_A_BIT | PSR_I_BIT | \
> -				 PSR_F_BIT | PSR_D_BIT)
> -
> -#define VCPU_RESET_PSTATE_SVC	(PSR_AA32_MODE_SVC | PSR_AA32_A_BIT | \
> -				 PSR_AA32_I_BIT | PSR_AA32_F_BIT)
> -
>  unsigned int __ro_after_init kvm_sve_max_vl;
>  
>  int __init kvm_arm_init_sve(void)
> @@ -191,7 +179,6 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>  {
>  	struct vcpu_reset_state reset_state;
>  	bool loaded;
> -	u32 pstate;
>  
>  	scoped_guard(spinlock, &vcpu->arch.mp_state_lock) {
>  		reset_state = vcpu->arch.reset_state;
> @@ -210,21 +197,8 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>  		kvm_vcpu_reset_sve(vcpu);
>  	}
>  
> -	if (vcpu_el1_is_32bit(vcpu))
> -		pstate = VCPU_RESET_PSTATE_SVC;
> -	else if (vcpu_has_nv(vcpu))
> -		pstate = VCPU_RESET_PSTATE_EL2;
> -	else
> -		pstate = VCPU_RESET_PSTATE_EL1;
> -
>  	/* Reset core registers */
> -	memset(vcpu_gp_regs(vcpu), 0, sizeof(*vcpu_gp_regs(vcpu)));
> -	memset(&vcpu->arch.ctxt.fp_regs, 0, sizeof(vcpu->arch.ctxt.fp_regs));
> -	vcpu->arch.ctxt.spsr_abt = 0;
> -	vcpu->arch.ctxt.spsr_und = 0;
> -	vcpu->arch.ctxt.spsr_irq = 0;
> -	vcpu->arch.ctxt.spsr_fiq = 0;
> -	vcpu_gp_regs(vcpu)->pstate = pstate;
> +	kvm_reset_vcpu_core(vcpu);
>  
>  	/* Reset system registers */
>  	kvm_reset_sys_regs(vcpu);
> @@ -233,36 +207,8 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
>  	 * Additional reset state handling that PSCI may have imposed on us.
>  	 * Must be done after all the sys_reg reset.
>  	 */
> -	if (reset_state.reset) {
> -		unsigned long target_pc = reset_state.pc;
> -
> -		/* Gracefully handle Thumb2 entry point */
> -		if (vcpu_mode_is_32bit(vcpu) && (target_pc & 1)) {
> -			target_pc &= ~1UL;
> -			vcpu_set_thumb(vcpu);
> -		}
> -
> -		/* Propagate caller endianness */
> -		if (reset_state.be)
> -			kvm_vcpu_set_be(vcpu);
> -
> -		*vcpu_pc(vcpu) = target_pc;
> -
> -		/*
> -		 * We may come from a state where either a PC update was
> -		 * pending (SMC call resulting in PC being increpented to
> -		 * skip the SMC) or a pending exception. Make sure we get
> -		 * rid of all that, as this cannot be valid out of reset.
> -		 *
> -		 * Note that clearing the exception mask also clears PC
> -		 * updates, but that's an implementation detail, and we
> -		 * really want to make it explicit.
> -		 */
> -		vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
> -		vcpu_clear_flag(vcpu, EXCEPT_MASK);
> -		vcpu_clear_flag(vcpu, INCREMENT_PC);
> -		vcpu_set_reg(vcpu, 0, reset_state.r0);
> -	}
> +	if (reset_state.reset)
> +		kvm_reset_vcpu_psci(vcpu, &reset_state);
>  
>  	/* Reset timer */
>  	kvm_timer_vcpu_reset(vcpu);
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

