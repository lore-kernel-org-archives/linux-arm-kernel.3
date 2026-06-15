Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26094CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hEU/mEFDrh3dSsoqaYUHBuwISR49/xEjyPfvReMD4U=; b=sGyhYZu1cpnoTn3Hm2jB4Ys+PJ
	8ECgrUh73ezM9oYieANWItLqEeSY7q2cLOUDvBA2g/Z8+OXV4DhFs9i8j16KP4JMNPHhNMut6xZbt
	APImpKawh2eHLHZxZ+8hMZzvdP4H9MfvR+I5lmT+I2VgyqUm+dsIo5jMvMFFpY1wn0+5jcz/6Ndgr
	ZlNZejkHzaIE45l/57x0FWW0Y6lRSjtcwzJeqG4BjaoKpwAbABoD1RqU2oIutQ8bop2u/+zqDSM4k
	a00Zz/uUTC29kJYCwpzFzanUXDyAWcmpr09gh8hjVbHfExm6hvFoAG6dpuyWPBk3nFlYPxGgNe7vF
	Yk0UEnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZA7t-0000000EZWx-3BQl;
	Mon, 15 Jun 2026 16:25:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZA7r-0000000EZWG-1LPE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 16:25:28 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so28091675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 09:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781540725; x=1782145525; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+hEU/mEFDrh3dSsoqaYUHBuwISR49/xEjyPfvReMD4U=;
        b=WB2q5hqMEJQcOsilbIbURyrm7qpTgifWoGx+trqWL1LOGwkZe4wLgdFo5duqtZ4kDM
         K8PeHRcSPi/LlIiFyyeQVbVX/T7A2dgB9V+mfuW0JGtNdsQWVorQo0mWm6IVfiWodHgH
         Ohvt0eHVQ8MN5D9liAr22lPEo2CJjcJ8DICynEKegyBKGIbLY8TrN3jE348KQkb9Ow3L
         Ad3hZ+OIiCnoG7S9XCTANIeXu6VglpJJ0U9CN2L5LaFtRVLFl92RxWyrQK5rhVRzF0kT
         2E1SEFDTKwBciNQkywlyuyomlVi74fw1jUMJ2p3Bif03CFMiGHPt09hJAjvczNwmVRPn
         VpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781540725; x=1782145525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hEU/mEFDrh3dSsoqaYUHBuwISR49/xEjyPfvReMD4U=;
        b=nxMF0o/XDgJq11+WWtAjRIzIFU1GyapLtcby4TEhzA9ZbMfhLENgzWER7iyMqtmwxd
         Zkxw9raGhBkpH433O0WAZdbaP+GhoXktpHqp8BS1LQb3kkQitiASJwGmhMvpIPrmH5le
         ud+V69lSppPmij7taBnK90vjLodkyd9+Qn1aQoCTghTFM28pmYHe5R3FmdSGZEdqm/FY
         /2chxmtWK1zj+S+7CUSswEIOBq4+sZQ/hYr1o9KzNNaky6JxgdMhMAXtaamkadQruOdz
         HanlgIwvo7MUh7DNmP8qurJr0EaOvqz+BEOQupLzC0tzETXdIKQmRU+z35lQiB6kv15Q
         94hg==
X-Forwarded-Encrypted: i=1; AFNElJ8iF1yMfBt2SB+7+c8riuvUdKOeTrZsn6PYS8tGXSaQbMo6Op2v4wtD7KmUbNphQTkeSn8mheFZQEffgxLp95lX@lists.infradead.org
X-Gm-Message-State: AOJu0YyIMyMyj8GsWIDRJWqJ6iMs7KSt7gaziG2qoV3XxKloWiD9JgAR
	e41Qbmv41ce5JlnpbyL1aN58dO8PXglm5LCBIVoyK4BzyvCWTbn26ZDfu92X8AHQLg==
X-Gm-Gg: Acq92OHIwrkM9ZABapkj0TeUoGcV4EIHE6z6g3quStrvf6iYqJd3XOgiavYCZkXFiAf
	DRw5QSNIdswuN9jdFIeUUabKyCveju+Pk0PZxwInX2+cYJnQVYblGtDqFEdHsPNeS9sRf5TILAS
	N1VKCRgJeap2zRYrjjzJBNWQG3a17qHyHLJ6VSeDVsb+ZjLPaLEGHzy0Gt4wSvyJ6fYuyBQNJhG
	aHGHb9aG55X7a/fCJX531vP1tfykaakB+NkdFMCSW6IelZpKdpzDr5CDqQwIyISeSTXFiNDc0yZ
	r8W7OgNtJcOS5cqTYxApYSETPpc22QsVXMVCix/8BToWsYcok4o64myNzlEpqF12zw0U46cHhWE
	G4REPeVhzs8z8Cl3+yoYXVMsfSi32dRXgktC4RRrqwGQ9LXtbidifBc1G8vMfiKso46CdUWCcE8
	LkMF0/aiQMZSXC9lS+JAlhMzBEXpof4ULJEJmvztZ8Z26L12qYk3wEu1lmJ8magrNeCniVIEnB8
	P/fWw==
X-Received: by 2002:a05:600d:8492:b0:490:4973:91a0 with SMTP id 5b1f17b1804b1-490ec4d728dmr134122765e9.10.1781540724614;
        Mon, 15 Jun 2026 09:25:24 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa891acsm3867895e9.9.2026.06.15.09.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:25:23 -0700 (PDT)
Date: Mon, 15 Jun 2026 17:25:20 +0100
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
Subject: Re: [PATCH v1 11/11] KVM: arm64: Implement lazy vCPU state sync for
 non-protected guests
Message-ID: <ajAncPp3nOGcWD1U@google.com>
References: <20260612065925.755562-1-tabba@google.com>
 <20260612065925.755562-12-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612065925.755562-12-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_092527_440199_C2DBA0F4 
X-CRM114-Status: GOOD (  41.08  )
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

On Fri, Jun 12, 2026 at 07:59:25AM +0100, tabba@google.com wrote:
> pKVM copies a non-protected guest's register context between the host
> and the hypervisor on every world switch, even when the host never
> inspects it. Defer the copy: on entry, flush the host context into the
> hyp vCPU only when the host marked it dirty (PKVM_HOST_STATE_DIRTY); on
> exit, leave it in the hyp vCPU and copy it back only when the host needs
> it, via a __pkvm_vcpu_sync_state hypercall on trap handling or at vcpu
> put. A protected guest's context is copied as before, since lazy sync
> only helps where the host is trusted to see the guest's registers.
> 
> The PC is the exception: it is copied back on every exit so the
> kvm_exit tracepoint reports the guest's real exit PC rather than the
> value left by the previous sync.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/include/asm/kvm_asm.h   |  1 +
>  arch/arm64/include/asm/kvm_host.h  |  2 +
>  arch/arm64/kvm/arm.c               |  7 +++
>  arch/arm64/kvm/handle_exit.c       | 22 ++++++++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 88 ++++++++++++++++++++++++++++--
>  5 files changed, 115 insertions(+), 5 deletions(-)
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
> index a49042bfa801..1ef660774adc 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1113,6 +1113,8 @@ struct kvm_vcpu_arch {
>  /* SError pending for nested guest */
>  #define NESTED_SERROR_PENDING	__vcpu_single_flag(sflags, BIT(8))
>  
> +/* pKVM host vcpu state is dirty, needs resync (nVHE-only) */

nit: with hVHE, I guess we can just drop that nVHE-only? 

> +#define PKVM_HOST_STATE_DIRTY	__vcpu_single_flag(iflags, BIT(4))
>  
>  /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
>  #define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index c9f36932c980..a5c54e37778b 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -734,6 +734,10 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
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
> @@ -961,6 +965,9 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
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
> index 54aedf93c78b..dccc3786548b 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -422,6 +422,21 @@ static int handle_trap_exceptions(struct kvm_vcpu *vcpu)
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
> +		preempt_disable();

nit: since we are introducing guard() with that series, this one could be
guard(preempt)().

> +		if (!(vcpu_get_flag(vcpu, PKVM_HOST_STATE_DIRTY))) {
> +			kvm_call_hyp_nvhe(__pkvm_vcpu_sync_state);
> +			vcpu_set_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> +		}
> +		preempt_enable();
> +	}
> +
>  	/*
>  	 * See ARM ARM B1.14.1: "Hyp traps on instructions
>  	 * that fail their condition code check"
> @@ -489,6 +504,13 @@ int handle_exit(struct kvm_vcpu *vcpu, int exception_index)
>  /* For exit types that need handling before we can be preempted */
>  void handle_exit_early(struct kvm_vcpu *vcpu, int exception_index)
>  {
> +	/*
> +	 * We just exited, so the state is clean from a hypervisor
> +	 * perspective.
> +	 */
> +	if (is_protected_kvm_enabled())
> +		vcpu_clear_flag(vcpu, PKVM_HOST_STATE_DIRTY);
> +
>  	if (ARM_SERROR_PENDING(exception_index)) {
>  		if (this_cpu_has_cap(ARM64_HAS_RAS_EXTN)) {
>  			u64 disr = kvm_vcpu_get_disr(vcpu);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 23e644c24a03..02383b372258 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -139,6 +139,49 @@ static void sync_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
>  		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
>  }
>  
> +
> +static void __copy_vcpu_state(const struct kvm_vcpu *from_vcpu,
> +			      struct kvm_vcpu *to_vcpu)
> +{
> +	int i;
> +
> +	to_vcpu->arch.ctxt.regs		= from_vcpu->arch.ctxt.regs;
> +	to_vcpu->arch.ctxt.spsr_abt	= from_vcpu->arch.ctxt.spsr_abt;
> +	to_vcpu->arch.ctxt.spsr_und	= from_vcpu->arch.ctxt.spsr_und;
> +	to_vcpu->arch.ctxt.spsr_irq	= from_vcpu->arch.ctxt.spsr_irq;
> +	to_vcpu->arch.ctxt.spsr_fiq	= from_vcpu->arch.ctxt.spsr_fiq;
> +	to_vcpu->arch.ctxt.fp_regs	= from_vcpu->arch.ctxt.fp_regs;
> +
> +	/*
> +	 * Copy the sysregs, but don't mess with the timer state which
> +	 * is directly handled by EL1 and is expected to be preserved.
> +	 * enum vcpu_sysreg is sparse: VNCR-mapped registers take values
> +	 * derived from their VNCR page offset, so the timer registers do
> +	 * not form a contiguous numeric range and must be skipped by name.
> +	 */
> +	for (i = 1; i < NR_SYS_REGS; i++) {
> +		switch (i) {
> +		case CNTVOFF_EL2:
> +		case CNTV_CVAL_EL0:
> +		case CNTV_CTL_EL0:
> +		case CNTP_CVAL_EL0:
> +		case CNTP_CTL_EL0:
> +			continue;
> +		}
> +		to_vcpu->arch.ctxt.sys_regs[i] = from_vcpu->arch.ctxt.sys_regs[i];
> +	}
> +}
> +
> +static void __sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	__copy_vcpu_state(&hyp_vcpu->vcpu, hyp_vcpu->host_vcpu);
> +}
> +
> +static void __flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	__copy_vcpu_state(hyp_vcpu->host_vcpu, &hyp_vcpu->vcpu);
> +}

nit: Could that be flush/sync_hyp_vcpu_state? as everything this is called
"state" and we already have flush_debug_state() below ?

> +
>  static void flush_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
>  {
>  	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> @@ -168,7 +211,17 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  	fpsimd_sve_flush();
>  	flush_debug_state(hyp_vcpu);
>  
> -	hyp_vcpu->vcpu.arch.ctxt	= host_vcpu->arch.ctxt;
> +	/*
> +	 * If we deal with a non-protected guest and the state is potentially
> +	 * dirty (from a host perspective), copy the state back into the hyp
> +	 * vcpu.
> +	 */
> +	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> +		if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
> +			__flush_hyp_vcpu(hyp_vcpu);
> +	} else {
> +		hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
> +	}
>  
>  	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
>  	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
> @@ -191,9 +244,11 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  	fpsimd_sve_sync(&hyp_vcpu->vcpu);
>  	sync_debug_state(hyp_vcpu);
>  
> -	host_vcpu->arch.ctxt		= hyp_vcpu->vcpu.arch.ctxt;
> -
> -	host_vcpu->arch.hcr_el2		= hyp_vcpu->vcpu.arch.hcr_el2;
> +	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> +		host_vcpu->arch.ctxt = hyp_vcpu->vcpu.arch.ctxt;
> +	else
> +		/* Keep the PC current for the kvm_exit tracepoint (lazy ctxt sync). */
> +		host_vcpu->arch.ctxt.regs.pc = hyp_vcpu->vcpu.arch.ctxt.regs.pc;
>  
>  	host_vcpu->arch.fault		= hyp_vcpu->vcpu.arch.fault;
>  
> @@ -227,8 +282,30 @@ static void handle___pkvm_vcpu_put(struct kvm_cpu_context *host_ctxt)
>  {
>  	struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
>  
> -	if (hyp_vcpu)
> +	if (hyp_vcpu) {
> +		struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> +
> +		if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu) &&
> +		    !vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY)) {
> +			__sync_hyp_vcpu(hyp_vcpu);
> +		}
> +
>  		pkvm_put_hyp_vcpu(hyp_vcpu);
> +	}
> +}
> +
> +static void handle___pkvm_vcpu_sync_state(struct kvm_cpu_context *host_ctxt)
> +{
> +	struct pkvm_hyp_vcpu *hyp_vcpu;
> +
> +	if (!is_protected_kvm_enabled())
> +		return;

Since "KVM: arm64: Remove is_protected_kvm_enabled() checks from hypercalls" we
got rid of those is_protected_kvm_enabled() for pKVM-only HVCs. (also, it is
declared in the pKVM-only section of the HVCs)

> +
> +	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> +	if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> +		return;
> +
> +	__sync_hyp_vcpu(hyp_vcpu);
>  }
>  
>  static struct kvm_vcpu *__get_host_hyp_vcpus(struct kvm_vcpu *arg,
> @@ -859,6 +936,7 @@ static const hcall_t host_hcall[] = {
>  	HANDLE_FUNC(__pkvm_finalize_teardown_vm),
>  	HANDLE_FUNC(__pkvm_vcpu_load),
>  	HANDLE_FUNC(__pkvm_vcpu_put),
> +	HANDLE_FUNC(__pkvm_vcpu_sync_state),
>  	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
>  };
>  
> -- 
> 2.54.0.1136.gdb2ca164c4-goog
> 

