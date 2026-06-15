Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261ADCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RKAlB+YaRvxl+nRljsm0vU9jlQ7EuTV00J5KLHppO0=; b=tUJWQbJ/BL8t5AplpkepPVCoMH
	R9461tfF349X+6wumfPMlBqUaW/kdJvpwWhEUWksSDNEa6xw8axwVea4mlGGxpdsuN/YiX5JEfmwM
	q1QF3y3xgevt2XDtErlHERH32fSxJ1+Ml7jc1qkSNe4kCd0n7EU0LwL6BiJoewj4PAR8K52VDHZ1X
	yikI0rpGcBTmSVzZ8EFWPyr3z3HxlDz41rs3E2iMV+6Doi6mZRZfin5Whgnhd2dmAtehPybvoCrnZ
	URTLQ9DjHuWqERRZMK2dH6znjtKQNAzp772TeP6Px0cLWJDhWb5zQsnv07mMCzD7IMolF9JoNj2TQ
	+aMH+4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7dg-0000000EKr0-0KO6;
	Mon, 15 Jun 2026 13:46:08 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7dd-0000000EKqW-0YQ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:46:07 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-5177d1ff061so85571cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 06:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781531164; cv=none;
        d=google.com; s=arc-20240605;
        b=efJO0R23vcn2Cwr+7adlzxPuAEAOINnGwxtiwbZ5Vv1MP145ep7r8s5r+4NDKs0JMU
         S8bFyI6t+y0iMeb8VuK7ZPZvlpnvw0oxttnuM02eU53vkA0XMvnwfB6I7BY0J8KlQ0Co
         6g8DjMEcZL55wQdLDR93+ehcvtpBlN7jqEXtB7IsrgmbTdzqZ1JVNdw2ddQ6/VMU0PNC
         ShtAReiQKoGO1EKqoZWLMUuij0gaObRQwoRxg1OPCqo6oGXjR9skHkjFJ54j6MgA5FQu
         2zymA5c1m/tjXnvW+qZeCTo1bOT49yWcjODm3oUVJr6j7VSklcYyGkofUDqtkILpNUMA
         yH+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/RKAlB+YaRvxl+nRljsm0vU9jlQ7EuTV00J5KLHppO0=;
        fh=JVCCc8nQmU8DtllI9sccjNkWD+B/jkRLm1/wo3RBCzc=;
        b=IXb4O+FyNhs6F2rvRf+pCEThXmmVbtwmnedHQS2whWQ6qKwtBKU/XLV/+oIMYimsQO
         4pVT3eHRePFf0bkbdjPFNPNe+xDZ9V3WMDPMUNBMxDAhimGuGNcSg8RZXQ68UkXgqJSZ
         8B7mwBu4unRycO6fsUv0JC2ExB34fNxacz6ZKcBK6+7fn6Hdcy5h+Cwx2fAxo+AcTDpU
         X+YGMA8IV0d8eh8LOZxueF9fWRjtIXMxMNtLyzDAvntBx9T8/6P8SaBL6HfZMx40QK2s
         ozlBZT3vpRLfPTCiU0hgbHJFXWNzEDbiPQ6GCz5e5HIs9h0BE5rlvSkH+wJ54Qqu3AGt
         Up/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781531164; x=1782135964; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/RKAlB+YaRvxl+nRljsm0vU9jlQ7EuTV00J5KLHppO0=;
        b=QVzsEwqB7zpXonIrcEymovrdEt/umI5I3q/EV9bCxIdtPcsHln2vcFtz9mhZDlHazh
         TqfBeAADwKtvyV+FmN9j/o7Y7ws+IZntJhutjsjx5UOk3U1/GQBj3Hav99gvpODgmHVs
         NG8bfgYZc6rDHeMWFpcZsHfYAQpjrKUQH0DIndbOSIdk2fbge/0Q8X/57O4mAQdhFIV5
         g8et5OE3U0soAeYWMRTEIEOheip+KaKMqeG8ThbwRvSXMBh2U3reBCDDbj2S+cZNEbgb
         /5V/9BxheZV8e5NNQX0yGxTcMAdHqzQmeVYKcX60PW3OP4B37ZZzHwW9XzcrwmoSwv9I
         VGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781531164; x=1782135964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RKAlB+YaRvxl+nRljsm0vU9jlQ7EuTV00J5KLHppO0=;
        b=cWXIS3I375+cwyOKbCTjrhDpEAGOZMlAuMp4Gf+8Sc99ZzONGZP+vM8ePGLX0Dc6je
         4MpDLSUvp1UcJ0dksZinmtSzmEkKEzPebApBb/vUVkChMnSCLXS211lv+SRNW52s4jI/
         /X2iYYc4xc+BzXJols3+Fy4uuSaNK4A0fc1ZQmjOxVLWzrlJyAkTleMrjJgwUsKMJHK6
         DoK+TCY7TqA9Nk2xkeNAfpzSEe90KaRcYN0jx+PBHX7POYFEqQG7KmACXJ1bUtW3f5X0
         g/Ooe5Jg7urcmjLhAECOZlaNEPRQBDGskofYCbvCERUH8+UMdixC5kCni3JqCV0yaB50
         5JAg==
X-Forwarded-Encrypted: i=1; AFNElJ8/XBFdD7MIgc4M775UNuXMByzVEe2r4UutvSkpBK3SaJo2Kk9TI3WH7DgJmQhg0oUKv94TmGwtp9a2CKEMR9P6@lists.infradead.org
X-Gm-Message-State: AOJu0YzLibstqkxPBhdAZLbHJHtKI09VzjPA1pg78v7jKeqkbIrwgYXQ
	FabIprRe6/j4MQN6aPytuN3JyW4WGIGqhe7HVmyLZD9yYuy5iJUvmzkhW0Gbqis1zmL2aAn411u
	TLrnvIBLUDi1Jatsx1DpLQJoiAzCh7Vq141nIB35z
X-Gm-Gg: Acq92OHOINMOqf0vECGfgwIdwyAZTycCTlzRdg9l8nGYMoVBSEiIhHuwUhoi1W3Ddrw
	lcKB3qn46z3Z9lMhv3aTK1pxG4GfLZvuJxF2HqAjBs0SW+ksOfiD2c3e7iBo6e+mLRYO520Vmq6
	G5YeHzpUj1wpzMDHMwjEx3AHUucl5CwZqOXK1tpfmZpjvArw/qO7NrEQSHr/DNwf/bjHuYroGIm
	qJ2WdUE6OMFQFafxR3hWIrfw++ED/zRYlWjukmJ1F/6Q7vATbvNoMN6SoSgJVNZiDB/tyCz0NHo
	gg2Ws3SX
X-Received: by 2002:ac8:5f8a:0:b0:516:4f62:85e8 with SMTP id
 d75a77b69052e-5198750abeemr1738961cf.19.1781531162997; Mon, 15 Jun 2026
 06:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com> <20260612065925.755562-7-tabba@google.com>
 <ai_7FupwNYrudRZZ@google.com>
In-Reply-To: <ai_7FupwNYrudRZZ@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Jun 2026 14:45:26 +0100
X-Gm-Features: AVVi8CcBOTp5hYc_iBrEzUZ8L0F0F3uPeIwH6JYDOoas1UfKjcpvzwA29hjvFhE
Message-ID: <CA+EHjTxZ6WG3ugDq94q5PBuYXQf9b8tpVPpi1ro+wqPUozYEUA@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] KVM: arm64: Factor out reusable vCPU reset helpers
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Per Larsen <perlarsen@google.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_064606_321855_35CB335F 
X-CRM114-Status: GOOD (  33.10  )
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

On Mon, 15 Jun 2026 at 14:16, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Fri, Jun 12, 2026 at 07:59:20AM +0100, tabba@google.com wrote:
> > Pull the reusable pieces out of kvm_reset_vcpu(): expose the reset
> > PSTATE values in kvm_arm.h, and split the core register reset and the
> > PSCI-driven reset into kvm_reset_vcpu_core() and kvm_reset_vcpu_psci().
> > A follow-up series reuses these to reset protected vCPUs at EL2.
> >
> > No functional change intended.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_arm.h     | 12 ++++++
> >  arch/arm64/include/asm/kvm_emulate.h | 58 +++++++++++++++++++++++++++
> >  arch/arm64/kvm/reset.c               | 60 ++--------------------------
> >  3 files changed, 73 insertions(+), 57 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> > index 3f9233b5a130..aba4ec09acd2 100644
> > --- a/arch/arm64/include/asm/kvm_arm.h
> > +++ b/arch/arm64/include/asm/kvm_arm.h
> > @@ -348,4 +348,16 @@
> >       { PSR_AA32_MODE_UND,    "32-bit UND" }, \
> >       { PSR_AA32_MODE_SYS,    "32-bit SYS" }
> >
> > +/*
> > + * ARMv8 Reset Values
> > + */
> > +#define VCPU_RESET_PSTATE_EL1        (PSR_MODE_EL1h | PSR_A_BIT | PSR_I_BIT | \
> > +                              PSR_F_BIT | PSR_D_BIT)
> > +
> > +#define VCPU_RESET_PSTATE_EL2        (PSR_MODE_EL2h | PSR_A_BIT | PSR_I_BIT | \
> > +                              PSR_F_BIT | PSR_D_BIT)
> > +
> > +#define VCPU_RESET_PSTATE_SVC        (PSR_AA32_MODE_SVC | PSR_AA32_A_BIT | \
> > +                              PSR_AA32_I_BIT | PSR_AA32_F_BIT)
> > +
> >  #endif /* __ARM64_KVM_ARM_H__ */
> > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> > index aed9fc0b717b..8436e71c402d 100644
> > --- a/arch/arm64/include/asm/kvm_emulate.h
> > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > @@ -704,4 +704,62 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
> >                       vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
> >       }
> >  }
> > +
> > +/* Reset a vcpu's core registers. */
> > +static inline void kvm_reset_vcpu_core(struct kvm_vcpu *vcpu)
> > +{
> > +     u32 pstate;
> > +
> > +     if (vcpu_el1_is_32bit(vcpu)) {
> > +             pstate = VCPU_RESET_PSTATE_SVC;
> > +     } else if (vcpu_has_nv(vcpu)) {
> > +             pstate = VCPU_RESET_PSTATE_EL2;
> > +     } else {
> > +             pstate = VCPU_RESET_PSTATE_EL1;
> > +     }
>
> nit: no brackes here, actually there were none before.

Ack.
/fuad

>
> > +
> > +     /* Reset core registers */
> > +     memset(vcpu_gp_regs(vcpu), 0, sizeof(*vcpu_gp_regs(vcpu)));
> > +     memset(&vcpu->arch.ctxt.fp_regs, 0, sizeof(vcpu->arch.ctxt.fp_regs));
> > +     vcpu->arch.ctxt.spsr_abt = 0;
> > +     vcpu->arch.ctxt.spsr_und = 0;
> > +     vcpu->arch.ctxt.spsr_irq = 0;
> > +     vcpu->arch.ctxt.spsr_fiq = 0;
> > +     vcpu_gp_regs(vcpu)->pstate = pstate;
> > +}
> > +
> > +/* PSCI reset handling for a vcpu. */
> > +static inline void kvm_reset_vcpu_psci(struct kvm_vcpu *vcpu,
> > +                                    struct vcpu_reset_state *reset_state)
> > +{
> > +     unsigned long target_pc = reset_state->pc;
> > +
> > +     /* Gracefully handle Thumb2 entry point */
> > +     if (vcpu_mode_is_32bit(vcpu) && (target_pc & 1)) {
> > +             target_pc &= ~1UL;
> > +             vcpu_set_thumb(vcpu);
> > +     }
> > +
> > +     /* Propagate caller endianness */
> > +     if (reset_state->be)
> > +             kvm_vcpu_set_be(vcpu);
> > +
> > +     *vcpu_pc(vcpu) = target_pc;
> > +
> > +     /*
> > +      * We may come from a state where either a PC update was
> > +      * pending (SMC call resulting in PC being increpented to
> > +      * skip the SMC) or a pending exception. Make sure we get
> > +      * rid of all that, as this cannot be valid out of reset.
> > +      *
> > +      * Note that clearing the exception mask also clears PC
> > +      * updates, but that's an implementation detail, and we
> > +      * really want to make it explicit.
> > +      */
> > +     vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
> > +     vcpu_clear_flag(vcpu, EXCEPT_MASK);
> > +     vcpu_clear_flag(vcpu, INCREMENT_PC);
> > +     vcpu_set_reg(vcpu, 0, reset_state->r0);
> > +}
> > +
> >  #endif /* __ARM64_KVM_EMULATE_H__ */
> > diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> > index 60969d90bdd3..e22d0be9e57c 100644
> > --- a/arch/arm64/kvm/reset.c
> > +++ b/arch/arm64/kvm/reset.c
> > @@ -34,18 +34,6 @@
> >  static u32 __ro_after_init kvm_ipa_limit;
> >  unsigned int __ro_after_init kvm_host_sve_max_vl;
> >
> > -/*
> > - * ARMv8 Reset Values
> > - */
> > -#define VCPU_RESET_PSTATE_EL1        (PSR_MODE_EL1h | PSR_A_BIT | PSR_I_BIT | \
> > -                              PSR_F_BIT | PSR_D_BIT)
> > -
> > -#define VCPU_RESET_PSTATE_EL2        (PSR_MODE_EL2h | PSR_A_BIT | PSR_I_BIT | \
> > -                              PSR_F_BIT | PSR_D_BIT)
> > -
> > -#define VCPU_RESET_PSTATE_SVC        (PSR_AA32_MODE_SVC | PSR_AA32_A_BIT | \
> > -                              PSR_AA32_I_BIT | PSR_AA32_F_BIT)
> > -
> >  unsigned int __ro_after_init kvm_sve_max_vl;
> >
> >  int __init kvm_arm_init_sve(void)
> > @@ -191,7 +179,6 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
> >  {
> >       struct vcpu_reset_state reset_state;
> >       bool loaded;
> > -     u32 pstate;
> >
> >       scoped_guard(spinlock, &vcpu->arch.mp_state_lock) {
> >               reset_state = vcpu->arch.reset_state;
> > @@ -210,21 +197,8 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
> >               kvm_vcpu_reset_sve(vcpu);
> >       }
> >
> > -     if (vcpu_el1_is_32bit(vcpu))
> > -             pstate = VCPU_RESET_PSTATE_SVC;
> > -     else if (vcpu_has_nv(vcpu))
> > -             pstate = VCPU_RESET_PSTATE_EL2;
> > -     else
> > -             pstate = VCPU_RESET_PSTATE_EL1;
> > -
> >       /* Reset core registers */
> > -     memset(vcpu_gp_regs(vcpu), 0, sizeof(*vcpu_gp_regs(vcpu)));
> > -     memset(&vcpu->arch.ctxt.fp_regs, 0, sizeof(vcpu->arch.ctxt.fp_regs));
> > -     vcpu->arch.ctxt.spsr_abt = 0;
> > -     vcpu->arch.ctxt.spsr_und = 0;
> > -     vcpu->arch.ctxt.spsr_irq = 0;
> > -     vcpu->arch.ctxt.spsr_fiq = 0;
> > -     vcpu_gp_regs(vcpu)->pstate = pstate;
> > +     kvm_reset_vcpu_core(vcpu);
> >
> >       /* Reset system registers */
> >       kvm_reset_sys_regs(vcpu);
> > @@ -233,36 +207,8 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
> >        * Additional reset state handling that PSCI may have imposed on us.
> >        * Must be done after all the sys_reg reset.
> >        */
> > -     if (reset_state.reset) {
> > -             unsigned long target_pc = reset_state.pc;
> > -
> > -             /* Gracefully handle Thumb2 entry point */
> > -             if (vcpu_mode_is_32bit(vcpu) && (target_pc & 1)) {
> > -                     target_pc &= ~1UL;
> > -                     vcpu_set_thumb(vcpu);
> > -             }
> > -
> > -             /* Propagate caller endianness */
> > -             if (reset_state.be)
> > -                     kvm_vcpu_set_be(vcpu);
> > -
> > -             *vcpu_pc(vcpu) = target_pc;
> > -
> > -             /*
> > -              * We may come from a state where either a PC update was
> > -              * pending (SMC call resulting in PC being increpented to
> > -              * skip the SMC) or a pending exception. Make sure we get
> > -              * rid of all that, as this cannot be valid out of reset.
> > -              *
> > -              * Note that clearing the exception mask also clears PC
> > -              * updates, but that's an implementation detail, and we
> > -              * really want to make it explicit.
> > -              */
> > -             vcpu_clear_flag(vcpu, PENDING_EXCEPTION);
> > -             vcpu_clear_flag(vcpu, EXCEPT_MASK);
> > -             vcpu_clear_flag(vcpu, INCREMENT_PC);
> > -             vcpu_set_reg(vcpu, 0, reset_state.r0);
> > -     }
> > +     if (reset_state.reset)
> > +             kvm_reset_vcpu_psci(vcpu, &reset_state);
> >
> >       /* Reset timer */
> >       kvm_timer_vcpu_reset(vcpu);
> > --
> > 2.54.0.1136.gdb2ca164c4-goog
> >

