Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCD7CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 16:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9jXSUCXwLqMfz03x3rWaIwLOnreZZae42JwqWFDgZo=; b=wjAcMGdRSqMR36rDFsEU65+huE
	aLbcmzKPIku270amPSbuKhUuKjBIgmI3LOrIOTmsVwXX6C/JABU162ap3uzc9u+4ZSdN9g7+KUKOV
	t+knF3Xs30Wc0ToGEeoxvlNWeNWHIgW6p0ER3exv6DHQHBw6LgMnIJ6NMe4VvmP4r9F9CAqH+iHx7
	U9KKsJXRzbdz3ez6M0I6ZpH/J8ZIXtoWAIyQKwAQirie2ezVGO8VTNGJWbNvteFg23V/tZX5heDZM
	ix+cQflqBnWOsYKtjZVJlKbu/5Aj3PSSxb1Afu55Y6f6eBL9AFVOFwBfVoAdtaeBSHrO3XUE7mleV
	I7OdIsJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacIK-00000002mx4-2Z4t;
	Fri, 19 Jun 2026 16:42:16 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacIH-00000002mwM-3MDE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 16:42:15 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-51765531803so337831cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 09:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781887331; cv=none;
        d=google.com; s=arc-20260327;
        b=ECFMizL0avGZ5nlhQl6iE21NM7hKdO2crmwyXm9GiBeX2rXOJ6Y0NsIygNAT/+/IeQ
         x2jjXIJUxmwfZ7KgGcjbYwWccsG82Y2SUgggCL46boXtdPa29DAARnyO2s++wGeIRMCa
         qJfeV3XNaaLAJvNph+xaHa/iQUtXDw3Bh4LjLZ/MWoRX0x4EC1sVLFFGW+0dL7cMQ8VK
         pYPwvQB1Rh/Hi0felvjtIIULsQp5URJQ+QEJ20fOtCB8Bk8laSjnbav3rq5A7WkngOXi
         YVuC3YqByYDwofYTW+7Ta4EREURrCgJsAIrvaX+CB4Q/pqt5VlclkdbiOpSRfcl0BweS
         67JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W9jXSUCXwLqMfz03x3rWaIwLOnreZZae42JwqWFDgZo=;
        fh=ZTq//PwPDDNJN/+vddTAIfEn6zNT1SRpp7zO7VD0FTg=;
        b=J/eZ1Etj/C8cbPLFEu8c/Q5A9W7cAHUVteQq2XymVwf1qpb9m61ETZCzEKG9I27AnR
         xNdpLwXw0MJJwKNiupw1Yrxu+sGRUScFoSMONx+M8v7RnYqPueUYBgG4MyKrPlPRsbrc
         0PyOowHp/qK91yB+0Ki382lgaEBK1wrrkTdhB44hr0TqI7rQpXhXOz7eY9Oy9ZE/U2JD
         Uk/4i9kLW5Jzbe+3p7xzrQZHvzqusuRSUYRbK2xiOEYejaFVMMSQkgq6uoDLB83HJO/X
         9NC3Y0v+fV8FFJoT0KhZcCxgltnCOlwuclxNYGcgaGhqT7gwBRRgzsVvqWGE//q8YyyS
         75ag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781887331; x=1782492131; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9jXSUCXwLqMfz03x3rWaIwLOnreZZae42JwqWFDgZo=;
        b=L92gkJm6bwIU4xWrnPg33MyYWIHMUYpDqFLrNvr35eIlTf2rHM1psmlcedHl9KBzIv
         4nHlWqMH0zFyCQkl6oKouvxugHhtGnl4VkxV6cKVc7IBFr2Wm46gMXjEnDfnF3hEwDvD
         2tRGMXDA/sZa5koeRvLLJpCXG8aZsJYUY3Y6e7/jZcHOPgFipEHDyDVH3sUWpGCNnLKI
         vRIRmL8YRWEl2SWM6b1TVL/xNzmbwdxLjA43wl2DUv8S6XAspLiFC3z1Trwhz6muwOFG
         PlBpmgeQXrrAFcCjdQCd61givxjXTgc/uArBuGpzzuhweKkm5yRhCxHgQK+Ye8r+blrW
         dwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887331; x=1782492131;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W9jXSUCXwLqMfz03x3rWaIwLOnreZZae42JwqWFDgZo=;
        b=HLjBvraL7sm8ECQS6YOXIyz+fzfEcVXI3Zo3qGnNzqHv+0sGXi2fpeCXDBF9whs958
         GPrN6KuWZNqBkpT5owt7bLHFC4/njNNMLM9JIBRou0RIAO2toAfUtXnvjQ3pmBhoDV8K
         e50tDB5kn0BS41NvjwiyR7Q2xKEUSdjK2kLDH6XNfqRQ8WwN3iOO5NEMybFNbHIY+9w3
         yV3Fxa/AsRpH0rkQSGbo6sLpvX70bwiA1eGNatXSo/6toMu7EIopHvVmXRRGtcGu96MC
         OyOmWmJRp3PIXljw6aZSE/QG1WCs80ovlhf+N/iQe5oY0KU+vsLjSxCkV+BIkLadFLDP
         ppKA==
X-Forwarded-Encrypted: i=1; AFNElJ/+SSaJvH/0x79FPMJV1oxYAxwyy3YrPwrK9SXtO7r2Fhi7cGaAj4IqSxJuXPUAl7QV6220eeKzqfiu0l+e2PI1@lists.infradead.org
X-Gm-Message-State: AOJu0YzmtUt8TXwDlE4b8kQiwRfHsn8VEfoRoC0rDde11kDTvhw8C1+I
	LMhQ9FOEIUafCuOKYqsVyXrlyVLW61wDijODKgxx6+b3Kj66yu1ERcvSxfB6TUx7tWm/UwAAAuN
	M6WOAPmQuzm9Dl8DmVR/qTX79PZAWBxU7FAX8EmZO
X-Gm-Gg: AfdE7ck4OPaoK2VezoBi1iWaB+fz0rAOxXPnOwllp+5JQ9XVPdrDknqclslHt8XHzDa
	UM2nFEA+OwLoKqAvPULO1Uea3FoyPsLyLncstyFBEn80VtMHLqGXqyWlJxUrxqv/0Rwch0PEJ9Z
	mYQkSXgFl8/dr1+Wq+76DzFlkCe7xJtPPL4xC9+5LpLo/HX1vyJtsQS6uVg2TLaDDhvwgAyDYQU
	4leTH8wlw2ASE6aWAyLqbc+iTIEnK6fLhP6UTmhaIbz9YQeR0IzFEmxMBk+nfLrldr0xph7Eg==
X-Received: by 2002:a05:622a:2489:b0:519:56a8:2693 with SMTP id
 d75a77b69052e-519e4a7350amr9673821cf.24.1781887330415; Fri, 19 Jun 2026
 09:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260619070719.812227-1-tabba@google.com> <20260619070719.812227-9-tabba@google.com>
 <ajVAV5ct0xdLn1KX@google.com>
In-Reply-To: <ajVAV5ct0xdLn1KX@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 17:41:00 +0100
X-Gm-Features: AVVi8CeugYeoJkxJ2s1vDW8ayydzdG5A6SaipfjAzjFSd_ia6mU672oeVjPkVZw
Message-ID: <CA+EHjTz13obYHAZYCW+zpH1RB953FseP9koXydeoLqmn6UONHQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] KVM: arm64: Implement lazy vCPU state sync for
 non-protected guests
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Quentin Perret <qperret@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_094213_873111_02EE0E0C 
X-CRM114-Status: GOOD (  40.04  )
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

On Fri, 19 Jun 2026 at 14:13, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Fri, Jun 19, 2026 at 08:07:19AM +0100, Fuad Tabba wrote:
> > pKVM copies a non-protected guest's register context between the host
> > and the hypervisor on every world switch, even when the host never
> > inspects it. Defer the copy: on entry, flush the host context into the
> > hyp vCPU only when the host marked it dirty (PKVM_HOST_STATE_DIRTY); on
> > exit, leave it in the hyp vCPU and copy it back only when the host needs
> > it, via a __pkvm_vcpu_sync_state hypercall on trap handling or at vcpu
> > put. A protected guest's context is copied as before, since lazy sync
> > only helps where the host is trusted to see the guest's registers.
> >
> > PC and PSTATE are the exception: they are copied back on every exit so
> > the kvm_exit tracepoint reports the guest's real exit PC, and the run
> > loop's vcpu_mode_is_bad_32bit() and SError-masking checks evaluate the
> > guest's current PSTATE rather than the value left by the previous sync.
> >
> > handle_exit_early() can also inject an SError, which writes the guest
> > context (ESR_EL1) outside the trap-handling path. For a non-protected
> > guest it therefore syncs the context from the hyp vCPU and marks it
> > dirty, as handle_trap_exceptions() does, so the injection reaches the
> > hyp vCPU on re-entry rather than being dropped.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_asm.h   |  1 +
> >  arch/arm64/include/asm/kvm_host.h  |  2 +
> >  arch/arm64/kvm/arm.c               |  7 +++
> >  arch/arm64/kvm/handle_exit.c       | 30 +++++++++++
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 86 ++++++++++++++++++++++++++++--
> >  5 files changed, 121 insertions(+), 5 deletions(-)
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
> > index 2faa60df847d..caa39ee5125f 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1068,6 +1068,8 @@ struct kvm_vcpu_arch {
> >  #define INCREMENT_PC         __vcpu_single_flag(iflags, BIT(1))
> >  /* Target EL/MODE (not a single flag, but let's abuse the macro) */
> >  #define EXCEPT_MASK          __vcpu_single_flag(iflags, GENMASK(3, 1))
> > +/* Host-set: the hyp flushes the non-protected vCPU state in on entry */
> > +#define PKVM_HOST_STATE_DIRTY        __vcpu_single_flag(iflags, BIT(4))
> >
> >  /* Helpers to encode exceptions with minimum fuss */
> >  #define __EXCEPT_MASK_VAL    unpack_vcpu_flag(EXCEPT_MASK)
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 3732ee9eb0d4..4e89558d8027 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -733,6 +733,10 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
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
> > @@ -964,6 +968,9 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
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
> > index 54aedf93c78b..8963621bcdd1 100644
> > --- a/arch/arm64/kvm/handle_exit.c
> > +++ b/arch/arm64/kvm/handle_exit.c
> > @@ -422,6 +422,20 @@ static int handle_trap_exceptions(struct kvm_vcpu *vcpu)
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
> > +             guard(preempt)();
> > +             if (!(vcpu_get_flag(vcpu, PKVM_HOST_STATE_DIRTY))) {
> > +                     kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
> > +                     vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> > +             }
> > +     }
> > +
>
> Could we remove this update here and let handle_exit_early() do the sync
> regardless of the SError injection? One of the main point of handle_exit_early()
> is to do things under !prempt().

Agreed on the move: handle_exit_early() is already preempt-off, so the
guard() goes away. Not on every exit though. handle_exit_early() runs
on every exit, and sync_hyp_vcpu() only copies PC/PSTATE/fault back
for a non-protected guest; the GPRs and sysregs cross solely via
__pkvm_vcpu_sync_state. Syncing unconditionally would pull the full
context back on plain IRQ exits, which is the copy this patch avoids.
So I will gate it on trap-or-SError and drop the
handle_trap_exceptions() block.

>
>
> >       /*
> >        * See ARM ARM B1.14.1: "Hyp traps on instructions
> >        * that fail their condition code check"
> > @@ -489,6 +503,22 @@ int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
> >  /* For exit types that need handling before we can be preempted */
> >  void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index)
> >  {
> > +     bool inject_serror = ARM_SERROR_PENDING(exception_index) ||
> > +             ARM_EXCEPTION_CODE(exception_index) == ARM_EXCEPTION_EL1_SERROR;
> > +
> > +     /*
> > +      * An SError injected below writes the host ctxt; for a non-protected
> > +      * guest, sync from the hyp vCPU and keep it dirty so it isn't dropped.
> > +      */
> > +     if (is_protected_kvm_enabled()) {
>
> Should we test !kvm_vm_is_protected(vcpu->kvm) here, as the
> PKVM_HOST_STATE_DIRTY is only updated for p-guests everywhere else?

Yes. The flag is only ever set for non-protected guests, so clearing it
for a protected one is a no-op, but gating it matches the invariant.

Both fold into one block in handle_exit_early():

      if (is_protected_kvm_enabled() && !kvm_vm_is_protected(vcpu->kvm)) {
              if (inject_serror ||
                  ARM_EXCEPTION_CODE(exception_index) == ARM_EXCEPTION_TRAP) {
                      kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
                      vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
              } else {
                      vcpu_clear_flag(vcpu, PKVM_HOST_STATE_DIRTY);
              }
      }

I will fold this into the next respin.

Thanks for the reviews!
/fuad

>
> > +             vcpu_clear_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> > +
> > +             if (inject_serror && !kvm_vm_is_protected(vcpu->kvm)) {
> > +                     kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
> > +                     vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> > +             }
> > +     }
> > +
> >       if (ARM_SERROR_PENDING(exception_index)) {
> >               if (this_cpu_has_cap(ARM64_HAS_RAS_EXTN)) {
> >                       u64 disr = kvm_vcpu_get_disr(vcpu);
>
> [...]

