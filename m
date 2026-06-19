Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB49CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFtqEUJwr/FxLj+oB4yh/uuwM4uyDihUAVSs/6dx5t0=; b=cCwLAJucpd1aHREy06bmEbk/k5
	3kd/lTgj2mtWnmU+IgMHpglV1LkGY9MtR79cM/kunqCugT4L6qEcR9t7Y7Z7OjQ8Bn0NdWqZbTD1n
	/cN1tbwgIcZTLZfvscVfxCxhGyIpy9lbboa3cmpvJN9n+XkKv8vNfiypHAREM1zT2oKupxQCLtiEF
	CKqfBZrauQiss6oZGTynfxp0kXIfkfgpcTnLdMqNJt6CKuKl12NhTDa1TT2nh43w4ZtoSVPL9nQmC
	bS3K3nf50gs32hZ13zt6Uj9fKwY0WnlhiYiluJtzAQ40digJpRsf3kjR4OTtiUkwRjBkQz90nrf4K
	fJmDSHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZHk-00000002U92-39Qi;
	Fri, 19 Jun 2026 13:29:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZHi-00000002U8g-1ZLh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:29:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490ac357c55so20555485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781875764; x=1782480564; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DFtqEUJwr/FxLj+oB4yh/uuwM4uyDihUAVSs/6dx5t0=;
        b=ScWshhhrC9Hp5ngPmzPFXU4VOZdWwZtDVQffxkiokF5t3i9zFuOGGUUX2A61C7G/nk
         XAQ5/QVX8y+wAKWyL9XuOLf58YNSn+4FkrPICs4B4r6nPe/NdYOViAZdxy07fFoaGV0i
         V34MumyB9t5ZdbN5t4K5zmQJNNkaOz7shhzIIjcjQAB3TFyWvJg8YzOleb6zLhAHtOUE
         8Ae0axfkXbb0z8BYuN0DK71isPIWtLgbdig9Mxo5NL8D95nOANsErOPtnNbin1NrC5KF
         MmPdigKBRTzCOB/0PESf5eQiabpcWDordTseDJXzHF4pgnYozVXd5GM/+VOMJKkD7Yhs
         Jv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781875764; x=1782480564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFtqEUJwr/FxLj+oB4yh/uuwM4uyDihUAVSs/6dx5t0=;
        b=IJ7Q/yd1RFfAPb2KKLgCIN5dx0ul9WBITywDbfx94axWx4VI8l9C065M7vNiYz5uYd
         HqrnU27qTxGXSuSJlQExwGpygKZrb7eQedS2Wt2CAj0buPuGv0rpPLbbuTAlS3r7QUUA
         KSER8JI7/f+QeptepksW1DfIfG+i2t7V6E2kwPyN8Y4NNmNsCMqjOz0PJ5vTqkmXrfFW
         5mXEuXCP4ExSaSpp81CyprG9YhUX8Ts/a3bDR5+XPVXSO15Y3PXPn+jnHh4MQd2nIQbH
         Hp42CO2xD+kY8UaetjB8VX8oZqS+hwA3v41CFxY5t6U7MaJAkdieSZ8Fgivz9P4sq0Yz
         Q+qA==
X-Forwarded-Encrypted: i=1; AFNElJ/6jj4xRB2Fo6Lemw0hTiw0RVid5vrPi1UQEeieFjQfI43k6Rc15vMx7yRILAgovi7WWurKWZ1IFMMxVpUYbKpc@lists.infradead.org
X-Gm-Message-State: AOJu0YzDxjEDg0tHhH3LVE7DAFFjQDHTD2i+VTLc+D/F0siEIXpVyhhU
	Fvg2/GNLuOIttaB+qG1ShDOmEkmFpbcTVDSmVCL2rPhcVB95KWcyFo2UAnEljiGL3Q==
X-Gm-Gg: AfdE7ckt/j7Psy5lfdI3N41lxidpwy/IdLL5T+aewnAUg/FgzML4JVfEnXXvDBmzHmK
	iSg5dqUWy1u1geLacMjEv/LETbKd9lJHRoqJ1s3denXfCiFi+xtiz+ADFUwLK0c+OMmAAw61k7u
	OaIMqEUC4ErqA3ILZFZEW1SmQMGK1DevLXbjIthbTUVma0KmJU2K9ACPW7Ey2bOCOsR28sLcaZr
	3jxK5lyexd6h0pjQyeWvtsPU2rShX7GaiHqp0wmiFQrr8Yv5u/CPx+clBh6W45v93LwbUpkrd6i
	Kyo6ksYEUxc19wlJxPnj38VPYgXD6rK8p2UX+EGjaup/fIZ9XFVqugcOPf9kpunTUHKj3lEVGIj
	Xtq+F4TTpG8kEoqAZ7BmnDDIiezGZmUQifBgCXJ4jTSMCrqFRoXra/IQzJDYeOaY+n5JtQ9vwY6
	f/Fd2//m/IcdL02kaUVMNbIZnujjhMAeAZAGDwInxTBborhj85TTpii07T
X-Received: by 2002:a05:600c:203:b0:490:c7dd:7cc2 with SMTP id 5b1f17b1804b1-49240e61101mr42977915e9.24.1781875763891;
        Fri, 19 Jun 2026 06:29:23 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650c11693dsm8318152f8f.37.2026.06.19.06.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:29:22 -0700 (PDT)
Date: Fri, 19 Jun 2026 14:29:18 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: Re: [PATCH v2 3/8] KVM: arm64: Factor out reusable vCPU reset helpers
Message-ID: <ajVELlJ4hMnXVFMR@google.com>
References: <20260619070719.812227-1-tabba@google.com>
 <20260619070719.812227-4-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619070719.812227-4-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_062926_452622_BAA3D9B6 
X-CRM114-Status: GOOD (  28.75  )
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

On Fri, Jun 19, 2026 at 08:07:14AM +0100, Fuad Tabba wrote:
> Pull the reusable pieces out of kvm_reset_vcpu(): expose the reset
> PSTATE values in kvm_arm.h, and split the core register reset and the
> PSCI-driven reset into kvm_reset_vcpu_core() and kvm_reset_vcpu_psci().
> A follow-up series reuses these to reset protected vCPUs at EL2.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/include/asm/kvm_arm.h     | 12 ++++++
>  arch/arm64/include/asm/kvm_emulate.h | 57 ++++++++++++++++++++++++++
>  arch/arm64/kvm/reset.c               | 60 ++--------------------------
>  3 files changed, 72 insertions(+), 57 deletions(-)
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
> index 80b30fead3d1..2385d8855fcf 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -704,4 +704,61 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
>  			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
>  	}
>  }
> +
> +/* Reset a vcpu's core registers. */
> +static inline void kvm_reset_vcpu_core(struct kvm_vcpu *vcpu)
> +{
> +	u32 pstate;
> +
> +	if (vcpu_el1_is_32bit(vcpu))
> +		pstate = VCPU_RESET_PSTATE_SVC;
> +	else if (vcpu_has_nv(vcpu))
> +		pstate = VCPU_RESET_PSTATE_EL2;
> +	else
> +		pstate = VCPU_RESET_PSTATE_EL1;
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
> index b963fd975aac..10eb7249aa9e 100644
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
>  	spin_lock(&vcpu->arch.mp_state_lock);
>  	reset_state = vcpu->arch.reset_state;
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
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
> 

