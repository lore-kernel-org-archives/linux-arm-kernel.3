Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634A2CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3krBd1Av13C4zrCndwKnVgU8OIvOPDTh7R6zvOPGFpQ=; b=ikkIGqE5DDD0TAIWWgf76CQcPD
	byhMJemShgajxrbYHLBz4dAxLABqKXWu7jevBHwr1TaQEeWMumcGOhtF8gyfiWxmgFRrxQQsJTYDZ
	BWVm8zEuZxUPEcSuvGtx5lsmmEwGa472IeVL2DXniELyaqIFG5ZPUdFAGU7ZR6rR8ywDvf4AQBJDh
	zq1yhqxbsrVkmF8l3hc7Cphhn8+iFtm+sDPYFHa7IEaGAwMzMmB60oQC+ojc6SI4rpNX3qUz7EUrY
	E8TO4hIYn2EiiASKdNL8ebhrfu1LiryCToH1vBqCdHSTQPtUkH03PyLzSOULG3Wb1op0lYdOMlWcl
	pcPLQlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZARO-0000000Eb25-3jFU;
	Mon, 15 Jun 2026 16:45:38 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZARK-0000000Eb14-27zD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 16:45:37 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5177d1ff061so2051cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 09:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781541933; cv=none;
        d=google.com; s=arc-20240605;
        b=ZBmWcXC5H9YFqh8vYJcozUGdkj8q4W+3rP4jHX5YI7ppl//kbEKbJISt832toZYotF
         bbV/zSWmWBqTj1LQCL0QeirA17me7bPn5JLxPWHAt53E8s7LkA3qBXNetKB6+hSi8ASK
         QprR+Kf/zhI81i4JHmmZUOVz1EIb+GG84VFb/7IYZzOeezk2FfjTCFy7lxzPSS2jJwkc
         2LTVN3UiBfsJvpMJcT6TIFVURp6Zak+nz36/8SkW7LHcMkkD82XqxegPGYXw0Owxzb4Z
         uPtTTIomgDAe7fGnPXdGV6kMfF8de4O0F5IGRENqGjyml2O7CRWc+f/mBBWpQcdhdZWD
         dnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3krBd1Av13C4zrCndwKnVgU8OIvOPDTh7R6zvOPGFpQ=;
        fh=1adbXp8iYcGhF07Wo+eLGBvawnxDfzHGfFTA2TCGcUU=;
        b=it2p2j6j98okEub7evDpOj+bHavNJBaNiefcrtskSXJ0HKFbVrRBjQBy1JOEmxDqGN
         jFffy7nW8J5/1TzdLX1WZEXrbCdpMhzvGktV0zBFlurLt7FsjKt0M3q+9OZuD3GDzPCB
         SjaO+EyEhR3WQ1TBI7tgSH8MmW0txAbDkdoR5hxC5WfrvCwHc2ipQfDSVVNl/cn0NuIK
         DEqNbmxVGylW7dMtVuJEgJH7/lE/XOD4mT2rqmbmmxb2Mcd7MIPSKtF6Zn2QJ6J3f69N
         7r6+FF+S80R6E7c3vKIjBbogtP1ro+MKIJZVp+KgKYwaqua1PVlI77+pLe7MmpBHBRf+
         h1qg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781541933; x=1782146733; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3krBd1Av13C4zrCndwKnVgU8OIvOPDTh7R6zvOPGFpQ=;
        b=B1qkbAi/0aMpWHl4Oui7a3mb31hDHCeO5ihnj1cNoygP46L+3B8gPmwnmIsBrSx77u
         vZtTSwis1/LtOIFgcassjWpZywKFFf9JwaPpyO49/P02l9fWib1/7OBqQsbuiNkZm/PM
         DUGhNgCXTpD1zXQz5Uea/XY2rHL14XD4AIcLrmagzFeNO1OIwNR3yruIfTixZSvWvJyi
         UmEjjQ7IOvgnE7AuqyjSf9bu2znRp4Qh6a/zq8azJ7UsI3otwbl++527LwNY55W1rcjV
         HmixST1ENEG06My1OzPBXglLytxAPxkl03B1kAwmGnCammRwWemlyBHE7YETdlutEmT8
         br2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541933; x=1782146733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3krBd1Av13C4zrCndwKnVgU8OIvOPDTh7R6zvOPGFpQ=;
        b=EKFbNBK5TKSK6FhGWFlEf0qljxPrwojkV4Sx66PxcWbxoc5VIfrKVxCsuEKttOwO+p
         lleSEX/H2l7v4MsZUL/U7L5E/bJB8cOO6SPyDWw4zH7bRoyUlst6qPD83bbvtBmLULgp
         FlbrdXQb0JIOkvGst95MaNuyqCAEGOS15b3Rkwz1CNK6VD3YQxjOM/UMVf1DyXNxLgiA
         BMYfYJ/jyNWcrnv1CyI+epje8UTIr7Jb/LItuF6yyaPKbvASzTC43sBZSqB+GdzJVwLO
         03z3y8B5SFvMlOMpX80/SwEt2UCM3FTVMALsGSlOV1sBSX/yfGidWeoz9wi+YJjQRCk9
         cigw==
X-Forwarded-Encrypted: i=1; AFNElJ9Cw3lD5Mmq0UWdzLgtQ84zKkcoA6370Mb7hbC+YhuQyGFhLi3SqLIS9u2HNy9byOhUW5xVLhh/M1mHQEEjxpYy@lists.infradead.org
X-Gm-Message-State: AOJu0YzCUg5VrHgx1BHQBvo9jKM26Epqq/IhZ1kdlOjoNIHZ0D52oDGa
	97t9U7vnu647oyYNjJL1FWinkLlJxAC9lSkvJ5fFaThCNQRryTr8uAiIsnL88LkuVhFEpVu+zCZ
	xDh41ic3RaBoCloJl6djFG2hhfIGFJMJvOJowWg2W
X-Gm-Gg: Acq92OGeJIYlML3dLa53VIhqCrJ/Hkfunc8xoLqJIErxU8WI0c1xPgyG/ImmC0iEGjJ
	PQqt+7KZ4c1ffVYUQdOxeMzKxco7i0opsmUVVSSu2W8pJKw0nr6n8EUWgaCbSIGLR06lVUWKIIk
	E0WVbV0Wq0Ja709BHtEDGYH9rClSD6v3IaUA0xczqqcCMDjbYqO1YTK7u0y+TCBj1uM1Ru3/Kzo
	20AGTbra1i/jrEfb4q3+v7MREpZryxWuUhns9t3Zn5l6rjzQh8kCOp22AfwVf5v1RTTiQQo9mWJ
	bVbtFh15
X-Received: by 2002:a05:622a:4a8e:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-5198e56ccdemr563981cf.5.1781541932277; Mon, 15 Jun 2026
 09:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com> <20260612065925.755562-12-tabba@google.com>
 <ajAncPp3nOGcWD1U@google.com>
In-Reply-To: <ajAncPp3nOGcWD1U@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Jun 2026 17:44:55 +0100
X-Gm-Features: AVVi8CfTSYIzqCKnssnDztP6oKs3xPOt3CjdkdvwnsXEforHJwvYbHgF5IGB21A
Message-ID: <CA+EHjTy=U4Nv1e3iS_39+yWsaRs+7nw+R9JLGZ+E9maqmiJfPw@mail.gmail.com>
Subject: Re: [PATCH v1 11/11] KVM: arm64: Implement lazy vCPU state sync for
 non-protected guests
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
X-CRM114-CacheID: sfid-20260615_094536_488374_A424F39D 
X-CRM114-Status: GOOD (  44.22  )
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

On Mon, 15 Jun 2026 at 17:25, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Fri, Jun 12, 2026 at 07:59:25AM +0100, tabba@google.com wrote:
> > pKVM copies a non-protected guest's register context between the host
> > and the hypervisor on every world switch, even when the host never
> > inspects it. Defer the copy: on entry, flush the host context into the
> > hyp vCPU only when the host marked it dirty (PKVM_HOST_STATE_DIRTY); on
> > exit, leave it in the hyp vCPU and copy it back only when the host needs
> > it, via a __pkvm_vcpu_sync_state hypercall on trap handling or at vcpu
> > put. A protected guest's context is copied as before, since lazy sync
> > only helps where the host is trusted to see the guest's registers.
> >
> > The PC is the exception: it is copied back on every exit so the
> > kvm_exit tracepoint reports the guest's real exit PC rather than the
> > value left by the previous sync.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_asm.h   |  1 +
> >  arch/arm64/include/asm/kvm_host.h  |  2 +
> >  arch/arm64/kvm/arm.c               |  7 +++
> >  arch/arm64/kvm/handle_exit.c       | 22 ++++++++
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 88 ++++++++++++++++++++++++++++--
> >  5 files changed, 115 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > index 043495f7fc78..6e1135b3ded4 100644
> > --- a/arch/arm64/include/asm/kvm_asm.h
> > +++ b/arch/arm64/include/asm/kvm_asm.h
> > @@ -113,6 +113,7 @@ enum __kvm_host_smccc_func {
> >       __KVM_HOST_SMCCC_FUNC___pkvm_finalize_teardown_vm,
> >       __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
> >       __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
> > +     __KVM_HOST_SMCCC_FUNC___pkvm_vcpu_sync_state,
> >       __KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
> >
> >       MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index a49042bfa801..1ef660774adc 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1113,6 +1113,8 @@ struct kvm_vcpu_arch {
> >  /* SError pending for nested guest */
> >  #define NESTED_SERROR_PENDING        __vcpu_single_flag(sflags, BIT(8))
> >
> > +/* pKVM host vcpu state is dirty, needs resync (nVHE-only) */
>
> nit: with hVHE, I guess we can just drop that nVHE-only?

Ack.


>
> > +#define PKVM_HOST_STATE_DIRTY        __vcpu_single_flag(iflags, BIT(4))
> >
> >  /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
> >  #define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +   \
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index c9f36932c980..a5c54e37778b 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -734,6 +734,10 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
> >       if (is_protected_kvm_enabled()) {
> >               kvm_call_hyp(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
> >               kvm_call_hyp_nvhe(__pkvm_vcpu_put);
> > +
> > +             /* __pkvm_vcpu_put implies a sync of the state */
> > +             if (!kvm_vm_is_protected(vcpu->kvm))
> > +                     vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> >       }
> >
> >       kvm_vcpu_put_debug(vcpu);
> > @@ -961,6 +965,9 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
> >               return ret;
> >
> >       if (is_protected_kvm_enabled()) {
> > +             /* Start with the vcpu in a dirty state */
> > +             if (!kvm_vm_is_protected(vcpu->kvm))
> > +                     vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> >               ret = pkvm_create_hyp_vm(kvm);
> >               if (ret)
> >                       return ret;
> > diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> > index 54aedf93c78b..dccc3786548b 100644
> > --- a/arch/arm64/kvm/handle_exit.c
> > +++ b/arch/arm64/kvm/handle_exit.c
> > @@ -422,6 +422,21 @@ static int handle_trap_exceptions(struct kvm_vcpu *vcpu)
> >  {
> >       int handled;
> >
> > +     /*
> > +      * If we run a non-protected VM when protection is enabled
> > +      * system-wide, resync the state from the hypervisor and mark
> > +      * it as dirty on the host side if it wasn't dirty already
> > +      * (which could happen if preemption has taken place).
> > +      */
> > +     if (is_protected_kvm_enabled() && !kvm_vm_is_protected(vcpu->kvm)) {
> > +             preempt_disable();
>
> nit: since we are introducing guard() with that series, this one could be
> guard(preempt)().

Nice one :) Done.


>
> > +             if (!(vcpu_get_flag(vcpu, PKVM_HOST_STATE_DIRTY))) {
> > +                     kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
> > +                     vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> > +             }
> > +             preempt_enable();
> > +     }
> > +
> >       /*
> >        * See ARM ARM B1.14.1: "Hyp traps on instructions
> >        * that fail their condition code check"
> > @@ -489,6 +504,13 @@ int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
> >  /* For exit types that need handling before we can be preempted */
> >  void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index)
> >  {
> > +     /*
> > +      * We just exited, so the state is clean from a hypervisor
> > +      * perspective.
> > +      */
> > +     if (is_protected_kvm_enabled())
> > +             vcpu_clear_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> > +
> >       if (ARM_SERROR_PENDING(exception_index)) {
> >               if (this_cpu_has_cap(ARM64_HAS_RAS_EXTN)) {
> >                       u64 disr = kvm_vcpu_get_disr(vcpu);
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 23e644c24a03..02383b372258 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -139,6 +139,49 @@ static void sync_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
> >               host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
> >  }
> >
> > +
> > +static void __copy_vcpu_state(const struct kvm_vcpu *from_vcpu,
> > +                           struct kvm_vcpu *to_vcpu)
> > +{
> > +     int i;
> > +
> > +     to_vcpu->arch.ctxt.regs         = from_vcpu->arch.ctxt.regs;
> > +     to_vcpu->arch.ctxt.spsr_abt     = from_vcpu->arch.ctxt.spsr_abt;
> > +     to_vcpu->arch.ctxt.spsr_und     = from_vcpu->arch.ctxt.spsr_und;
> > +     to_vcpu->arch.ctxt.spsr_irq     = from_vcpu->arch.ctxt.spsr_irq;
> > +     to_vcpu->arch.ctxt.spsr_fiq     = from_vcpu->arch.ctxt.spsr_fiq;
> > +     to_vcpu->arch.ctxt.fp_regs      = from_vcpu->arch.ctxt.fp_regs;
> > +
> > +     /*
> > +      * Copy the sysregs, but don't mess with the timer state which
> > +      * is directly handled by EL1 and is expected to be preserved.
> > +      * enum vcpu_sysreg is sparse: VNCR-mapped registers take values
> > +      * derived from their VNCR page offset, so the timer registers do
> > +      * not form a contiguous numeric range and must be skipped by name.
> > +      */
> > +     for (i = 1; i < NR_SYS_REGS; i++) {
> > +             switch (i) {
> > +             case CNTVOFF_EL2:
> > +             case CNTV_CVAL_EL0:
> > +             case CNTV_CTL_EL0:
> > +             case CNTP_CVAL_EL0:
> > +             case CNTP_CTL_EL0:
> > +                     continue;
> > +             }
> > +             to_vcpu->arch.ctxt.sys_regs[i] = from_vcpu->arch.ctxt.sys_regs[i];
> > +     }
> > +}
> > +
> > +static void __sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +     __copy_vcpu_state(&hyp_vcpu->vcpu, hyp_vcpu->host_vcpu);
> > +}
> > +
> > +static void __flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +     __copy_vcpu_state(hyp_vcpu->host_vcpu, &hyp_vcpu->vcpu);
> > +}
>
> nit: Could that be flush/sync_hyp_vcpu_state? as everything this is called
> "state" and we already have flush_debug_state() below ?

Good point, renamed to flush_hyp_vcpu_state()/sync_hyp_vcpu_state().

>
> > +
> >  static void flush_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
> >  {
> >       struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> > @@ -168,7 +211,17 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >       fpsimd_sve_flush();
> >       flush_debug_state(hyp_vcpu);
> >
> > -     hyp_vcpu->vcpu.arch.ctxt        = host_vcpu->arch.ctxt;
> > +     /*
> > +      * If we deal with a non-protected guest and the state is potentially
> > +      * dirty (from a host perspective), copy the state back into the hyp
> > +      * vcpu.
> > +      */
> > +     if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> > +             if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
> > +                     __flush_hyp_vcpu(hyp_vcpu);
> > +     } else {
> > +             hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
> > +     }
> >
> >       hyp_vcpu->vcpu.arch.mdcr_el2    = host_vcpu->arch.mdcr_el2;
> >       hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
> > @@ -191,9 +244,11 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >       fpsimd_sve_sync(&hyp_vcpu->vcpu);
> >       sync_debug_state(hyp_vcpu);
> >
> > -     host_vcpu->arch.ctxt            = hyp_vcpu->vcpu.arch.ctxt;
> > -
> > -     host_vcpu->arch.hcr_el2         = hyp_vcpu->vcpu.arch.hcr_el2;
> > +     if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +             host_vcpu->arch.ctxt = hyp_vcpu->vcpu.arch.ctxt;
> > +     else
> > +             /* Keep the PC current for the kvm_exit tracepoint (lazy ctxt sync). */
> > +             host_vcpu->arch.ctxt.regs.pc = hyp_vcpu->vcpu.arch.ctxt.regs.pc;
> >
> >       host_vcpu->arch.fault           = hyp_vcpu->vcpu.arch.fault;
> >
> > @@ -227,8 +282,30 @@ static void handle___pkvm_vcpu_put(struct kvm_cpu_context *host_ctxt)
> >  {
> >       struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> >
> > -     if (hyp_vcpu)
> > +     if (hyp_vcpu) {
> > +             struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> > +
> > +             if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu) &&
> > +                 !vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY)) {
> > +                     __sync_hyp_vcpu(hyp_vcpu);
> > +             }
> > +
> >               pkvm_put_hyp_vcpu(hyp_vcpu);
> > +     }
> > +}
> > +
> > +static void handle___pkvm_vcpu_sync_state(struct kvm_cpu_context *host_ctxt)
> > +{
> > +     struct pkvm_hyp_vcpu *hyp_vcpu;
> > +
> > +     if (!is_protected_kvm_enabled())
> > +             return;
>
> Since "KVM: arm64: Remove is_protected_kvm_enabled() checks from hypercalls" we
> got rid of those is_protected_kvm_enabled() for pKVM-only HVCs. (also, it is
> declared in the pKVM-only section of the HVCs)

Dropped.

Thanks a lot for the reviews!
/fuad
>
> > +
> > +     hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> > +     if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +             return;
> > +
> > +     __sync_hyp_vcpu(hyp_vcpu);
> >  }
> >
> >  static struct kvm_vcpu *__get_host_hyp_vcpus(struct kvm_vcpu *arg,
> > @@ -859,6 +936,7 @@ static const hcall_t host_hcall[] = {
> >       HANDLE_FUNC(__pkvm_finalize_teardown_vm),
> >       HANDLE_FUNC(__pkvm_vcpu_load),
> >       HANDLE_FUNC(__pkvm_vcpu_put),
> > +     HANDLE_FUNC(__pkvm_vcpu_sync_state),
> >       HANDLE_FUNC(__pkvm_tlb_flush_vmid),
> >  };
> >
> > --
> > 2.54.0.1136.gdb2ca164c4-goog
> >

