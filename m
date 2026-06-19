Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A04CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKbHPj4zwl3NIknOENY+4gxJ80U+03HOl4ELuQvS/cA=; b=4tK6KTH/UPUQblJiOtR76hqjZd
	Ea73IxBDYYlWx6UAyZkRwoN7VaTUzmmGkLSMbQI/PxWyJ9PSJn+42eWUTALYg2UllfZsP0u1Lfp1o
	XHIxuiUUaQGlYHJKyfu/wJXfTEN7ArZQ55O42GJ7SPUvxk4Ii5JP6dDRoeBJdsM3dsMrfDajj6yph
	Us8Iv59RViOZleXYuZ6M5eV98HqOfomMONo5tsIozzR9wZuWX4LGQ4B/WP8vcpgo+B4K8lskD1Tnr
	aTWueKQTFgrkGTQB4DfX+m0I+NSdRgBuFHqhUG1PtO7ueAeFRzWYzOx8B2i+87r+zSm7eEv6yDGy3
	yvC9qYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZ1s-00000002SjV-2XoB;
	Fri, 19 Jun 2026 13:13:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZ1q-00000002Sin-21gj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:13:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso15942695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781874781; x=1782479581; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fKbHPj4zwl3NIknOENY+4gxJ80U+03HOl4ELuQvS/cA=;
        b=gnlxjc7Vx3DL4FXCsUKygws2lDBfvjRddO3GInokxBr40+TlguHdNPvzpv4DrGpUH1
         MCv27y+TKR0RR4DXqFMcWQRTNsHTAr3TqAuvPT5ig83DYvlkX6j9aX0iVpqqiqop7pp3
         5Qxa1Znr0ezrFng+sBdsXGGVEcrTlmxp1jLZxH/rTgLZFVILiPxXefhfNMOjB8gCyhvW
         Fja5gKEt48CC8FvnGM58ptD6wxwj76skWQ3BccfdRWIeIjcJIASfxN/HYPiL3xvZ8KOZ
         4USu3IpM13FpDMlX3zuukUPCzgB87cNrmG98lktOdKeXpgs+oIcPsHyCR4Q5Zuf1kA0s
         zWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874781; x=1782479581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKbHPj4zwl3NIknOENY+4gxJ80U+03HOl4ELuQvS/cA=;
        b=V8djNr1YXojapHyeJqwvoHZW55nsVIPw80/G0H8VFsUjTICgXj8zvXN1CLkqW70wxH
         mFQuhxCJS8Q4UDf7zN/pUVZlkqvsjsDC7pa9Lap3XSUs1KYrVMhTuBa6q9CM6fKN0SPS
         +c8qAL5ts97r7dm//Xne3/Bu+MuaBSO2/jeGfmm0QS7hJPxCC2xVGA8QdWAHN0EaUqYi
         YfQIVcd8H92ERamzMn/0H/k+Yf5/ecPCYR6MC/I5ykmih7s6edIarDoN4I6KtH53+5fl
         wUaV418fcZkJbGmgrSCMtcRcPHu9maqSPnGc6mexY76L7OlJZAKSzuVsMjgo0aQX4Mp4
         QCBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UuEb57KbKYy55LiuFvF5lIHNY+lSDRzXZ6LfNh9wc7RsPWMoJuegFQrMfhlyb+hE62qh/7B15hrtOnmnyHHS1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0lDpdS3CCcq2mXq9Gsms4YV1eQPltWrI/Rg4wnDAZvcmGeZMa
	g7IhAtkWvLhKy5lRHKN5Aa233QRwoDMHacetzdj/Uw2CM8Ex2/6aUkcFhvPnNfPssw==
X-Gm-Gg: AfdE7ckJLTW8UmJqeEiVpJNMXICY8aBkPCLvcawZrwxuA5Jnm4acYfKbr7M9xU6jWqF
	KDeyEYQprmPDu0cxXURnqFhQHisK4pFlsk1GAiKv27vBBkiyEm9Sj9T/69dXslEg1wbtl7oEGi9
	Aja7SrLvJYe/mH0A0REJtTs5cEDKyn+b7iEKCz2WLANgcIPaP23ElN7gIhFVHVWaO92KuYEfG1T
	JmhPoAAn1WGmX0UvQNLV74PqIkxZ1Eh5ZGFJM361fg3IksH4plRJNwAvGe2/5SYRxLhprTShHGB
	mcJ+aKUZKIWVCxpZsDGsBLvtejc4MCdr3ds5KuD/wiHoM0pAxGozRPdHhZEyTN7oAQzagZEEJA2
	B6itPiHc5B6OVWktRNpzOzdq8DaBwEXrxQSGR4v0LDEU1Pondqsc+HgVy8fUYcWZK8HsbCUO6NZ
	QRCka6tmzTl9yzAJYBRYhEWU8rHXJ2tGr3/4fjmNSh2jJZWA45ECKRM2GTt8rjjP5FSR0=
X-Received: by 2002:a05:600c:46ce:b0:492:3767:6973 with SMTP id 5b1f17b1804b1-49240a34552mr41494475e9.9.1781874780106;
        Fri, 19 Jun 2026 06:13:00 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm55381415e9.2.2026.06.19.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:12:59 -0700 (PDT)
Date: Fri, 19 Jun 2026 14:12:55 +0100
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
Subject: Re: [PATCH v2 8/8] KVM: arm64: Implement lazy vCPU state sync for
 non-protected guests
Message-ID: <ajVAV5ct0xdLn1KX@google.com>
References: <20260619070719.812227-1-tabba@google.com>
 <20260619070719.812227-9-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619070719.812227-9-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_061302_588434_599C5345 
X-CRM114-Status: GOOD (  32.70  )
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

On Fri, Jun 19, 2026 at 08:07:19AM +0100, Fuad Tabba wrote:
> pKVM copies a non-protected guest's register context between the host
> and the hypervisor on every world switch, even when the host never
> inspects it. Defer the copy: on entry, flush the host context into the
> hyp vCPU only when the host marked it dirty (PKVM_HOST_STATE_DIRTY); on
> exit, leave it in the hyp vCPU and copy it back only when the host needs
> it, via a __pkvm_vcpu_sync_state hypercall on trap handling or at vcpu
> put. A protected guest's context is copied as before, since lazy sync
> only helps where the host is trusted to see the guest's registers.
> 
> PC and PSTATE are the exception: they are copied back on every exit so
> the kvm_exit tracepoint reports the guest's real exit PC, and the run
> loop's vcpu_mode_is_bad_32bit() and SError-masking checks evaluate the
> guest's current PSTATE rather than the value left by the previous sync.
> 
> handle_exit_early() can also inject an SError, which writes the guest
> context (ESR_EL1) outside the trap-handling path. For a non-protected
> guest it therefore syncs the context from the hyp vCPU and marks it
> dirty, as handle_trap_exceptions() does, so the injection reaches the
> hyp vCPU on re-entry rather than being dropped.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/include/asm/kvm_asm.h   |  1 +
>  arch/arm64/include/asm/kvm_host.h  |  2 +
>  arch/arm64/kvm/arm.c               |  7 +++
>  arch/arm64/kvm/handle_exit.c       | 30 +++++++++++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 86 ++++++++++++++++++++++++++++--
>  5 files changed, 121 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 043495f7fc78..6e1135b3ded4 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -113,6 +113,7 @@ enum __kvm_host_smccc_func {
>  	__KVM_HOST_SMCCC_FUNC___pkvm_finalize_teardown_vm,
>  	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
>  	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
> +	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_sync_state,
>  	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
>  
>  	MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 2faa60df847d..caa39ee5125f 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1068,6 +1068,8 @@ struct kvm_vcpu_arch {
>  #define INCREMENT_PC		__vcpu_single_flag(iflags, BIT(1))
>  /* Target EL/MODE (not a single flag, but let's abuse the macro) */
>  #define EXCEPT_MASK		__vcpu_single_flag(iflags, GENMASK(3, 1))
> +/* Host-set: the hyp flushes the non-protected vCPU state in on entry */
> +#define PKVM_HOST_STATE_DIRTY	__vcpu_single_flag(iflags, BIT(4))
>  
>  /* Helpers to encode exceptions with minimum fuss */
>  #define __EXCEPT_MASK_VAL	unpack_vcpu_flag(EXCEPT_MASK)
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 3732ee9eb0d4..4e89558d8027 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -733,6 +733,10 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  	if (is_protected_kvm_enabled()) {
>  		kvm_call_hyp(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
>  		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
> +
> +		/* __pkvm_vcpu_put implies a sync of the state */
> +		if (!kvm_vm_is_protected(vcpu->kvm))
> +			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
>  	}
>  
>  	kvm_vcpu_put_debug(vcpu);
> @@ -964,6 +968,9 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
>  		return ret;
>  
>  	if (is_protected_kvm_enabled()) {
> +		/* Start with the vcpu in a dirty state */
> +		if (!kvm_vm_is_protected(vcpu->kvm))
> +			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
>  		ret = pkvm_create_hyp_vm(kvm);
>  		if (ret)
>  			return ret;
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index 54aedf93c78b..8963621bcdd1 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -422,6 +422,20 @@ static int handle_trap_exceptions(struct kvm_vcpu *vcpu)
>  {
>  	int handled;
>  
> +	/*
> +	 * If we run a non-protected VM when protection is enabled
> +	 * system-wide, resync the state from the hypervisor and mark
> +	 * it as dirty on the host side if it wasn't dirty already
> +	 * (which could happen if preemption has taken place).
> +	 */
> +	if (is_protected_kvm_enabled() && !kvm_vm_is_protected(vcpu->kvm)) {
> +		guard(preempt)();
> +		if (!(vcpu_get_flag(vcpu, PKVM_HOST_STATE_DIRTY))) {
> +			kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
> +			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> +		}
> +	}
> +

Could we remove this update here and let handle_exit_early() do the sync
regardless of the SError injection? One of the main point of handle_exit_early()
is to do things under !prempt().


>  	/*
>  	 * See ARM ARM B1.14.1: "Hyp traps on instructions
>  	 * that fail their condition code check"
> @@ -489,6 +503,22 @@ int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
>  /* For exit types that need handling before we can be preempted */
>  void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index)
>  {
> +	bool inject_serror = ARM_SERROR_PENDING(exception_index) ||
> +		ARM_EXCEPTION_CODE(exception_index) == ARM_EXCEPTION_EL1_SERROR;
> +
> +	/*
> +	 * An SError injected below writes the host ctxt; for a non-protected
> +	 * guest, sync from the hyp vCPU and keep it dirty so it isn't dropped.
> +	 */
> +	if (is_protected_kvm_enabled()) {

Should we test !kvm_vm_is_protected(vcpu->kvm) here, as the
PKVM_HOST_STATE_DIRTY is only updated for p-guests everywhere else?

> +		vcpu_clear_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> +
> +		if (inject_serror && !kvm_vm_is_protected(vcpu->kvm)) {
> +			kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
> +			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> +		}
> +	}
> +
>  	if (ARM_SERROR_PENDING(exception_index)) {
>  		if (this_cpu_has_cap(ARM64_HAS_RAS_EXTN)) {
>  			u64 disr = kvm_vcpu_get_disr(vcpu);

[...]

