Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67633C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NB1J3hVZLGBcKEFzRbrkKSyu3nClV6Zj2pFFC1qb/tE=; b=17s+b7RHTGSCs4xnisYAA6PIY9
	pHGKSewAMsSq3Qop5Ieh2D8B77FtzBBJ//6xMIzxyNwwoUbJKafFUGuE0wUqVJB6oBkIlgDFMLMkI
	++MMk/4eEoqysnCpvwQTeTREmc/Y/WH+u7w0+IzfD5AACYWqjuu/ITNneYHWYE/qKp16l2kZw2oEk
	+lxNAf54LZrg41CD3hoHl8JtbYWkQmxhSyKpe4x0AHYvOaWtFoM0TVMkt49I+Go0gKle+eySGzjUi
	g/wxQ6R84nGIiSifqODFOSvdcCTapv6zWSOjoipQs/CrvLE7rck2qF28zpu8QliaxzyIOfMErK8ft
	ZXPBHT2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93VG-000000064Yb-2F2B;
	Tue, 22 Sep 2026 16:37:58 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93VD-000000064XW-3PSb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:37:57 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e8185e037so25504685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 09:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790095074; x=1790699874; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NB1J3hVZLGBcKEFzRbrkKSyu3nClV6Zj2pFFC1qb/tE=;
        b=f7xol1QXGKX25BaJyIqMYlHiRV/E9wjAZmcZR5JH10TOFus+lDwR/BEOe1jjlnN2Q2
         0WkS5IIFlY0/ip4AHi9qH5Fqv7giRhIWYa7VQYTJ0Y1KvFG5HAwzYksjSJgfk8tJ9TdY
         p0deefNBerl6aaEgBF/y1oox54htYjBELX73M1AI50EtflnXY4Qp7XouVnVZZnRSuSOz
         uwqB/4K3rrYDQu/C+d2sh4AgyTY4if9dv06B0oHZ7f8g6vIJIFaDdfXrPlL8deaoDq6u
         MGYsVSdNnzgpDZdtbbhtO9SIY76iJGCmwBerAnJ7LBYgZs3GKTfP9cu81nB6jgS2JDYL
         lxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790095074; x=1790699874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NB1J3hVZLGBcKEFzRbrkKSyu3nClV6Zj2pFFC1qb/tE=;
        b=GCQJlWkgh3gx44tb3Xu/xoW3bWYxdNQPKRI1G0GhH4a6w2aUR1W5Q2gfQMJyUu5ptJ
         +6KXfxONEP01/pG+WRQu8zAcVmsonYb2XYQDsFEkISv5PyVkuuHpGx2SgYUVZS8IzC2P
         pb/1zgPZ6WgOHtUgHkrxABae02DxGSJ356oogUFF1CtCsm0LWpqKMGejW7wQ80rcgsNq
         wIR4uUY0X/BkuD2b2JAtAEQaJ0T7K047aWociXVb8BlADLGhfviGPGcUhO62OM8RoxQm
         xuvRDC/AugQ2F/7Y1TWHWC+dfWseAZTqgOhYSVqZshvlYmS3MoPn3YEYmtOmrajxIPsc
         NXqw==
X-Forwarded-Encrypted: i=1; AKwUvByaXdajudA/t8SOa4TRyJk8Bf8FRl7NH/SPMv++oEmUW1Gp6jS9QblT5wHuNI/HFJH81l1gpLBgly5frUgh9WPd@lists.infradead.org
X-Gm-Message-State: AFuF++mOlmTfSpuipZFtgNBnChbPo66uZ4KhSO7/ECMmhFLF0yRFMKZV
	4kSX2K8lIjh71Hbga0GYZkL2ZhrmTZcoKHR0ogibM3/PIxC1L06damM0LP9Q30bXJg==
X-Gm-Gg: AYBFou2X6kiFAljnCstkMBkJ/mX47uCv685fRnKHkvwW0WH+RzjW2eK5TwMeKKvTWze
	65vAuCdbckKQlylgKlxHj6RCwjEeQmvrBs1+JFX8ASpLiXy6WppbPzcULRTc6o0FZ+70n6vVijd
	VfCPJJsoUZnEpWMY/2SsZ/10D6fANcPAkir+AyvEx+E4lNepqgsKkilm5QiLJJMApiud/+nVfLL
	0erEASivPXaPJOGRbZS8e50RngM1At4ea5oh0P2ZxkUPaSpNPzALHc73Es/UBm8dRNYAJPdDhNt
	c9zMBb66gAf4+G19LLKmAFhi4lCnlZ1hituy1AJ74oBu/LKerTceKoj7WUkS6cJzGxSwhTxVprM
	z+jDkqkO/HAY0d515T1CGzMqGAD/59SjSMd2Ebf/ISz5eVOHhDb6OEpTCCxhFZal2WuaVGfudpN
	5UTTfXIoubsNEznGBmG2DriMgMwmawYDsYd2/UQcF3VNPn6UfISOs+W85ci1HG9dLS39yVW8yG4
	RjrO4yV/n8y8eRtoKI8PlWvYduWXG115AsVNPV5ikU=
X-Received: by 2002:a05:600c:1989:b0:49c:e42b:a4ac with SMTP id 5b1f17b1804b1-49fc5714d14mr215915795e9.11.1790095073306;
        Tue, 22 Sep 2026 09:37:53 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1ccb90sm2616575e9.6.2026.09.22.09.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:37:52 -0700 (PDT)
Date: Tue, 22 Sep 2026 17:37:49 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com,
	tabba@google.com
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
Message-ID: <arKu3SkgM9kftBEv@google.com>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
 <20260914113338.159227-11-fuad.tabba@linux.dev>
 <arKuPQ-w5EFXo-n8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKuPQ-w5EFXo-n8@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_093755_906906_105B02EB 
X-CRM114-Status: GOOD (  44.20  )
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

On Tue, Sep 22, 2026 at 05:35:09PM +0100, Vincent Donnefort wrote:
> On Mon, Sep 14, 2026 at 12:33:30PM +0100, Fuad Tabba wrote:
> > EL2 implements PSCI 1.1 for protected VMs: CPU_ON, CPU_OFF,
> > PSCI_VERSION and PSCI_FEATURES are decided at EL2 (CPU_ON and CPU_OFF
> > still exit to the host, which only schedules or parks the target),
> > AFFINITY_INFO, CPU_SUSPEND and the platform power operations are
> > forwarded to the host, and anything else returns NOT_SUPPORTED,
> > including the TRNG calls and the functions above 1.1, SYSTEM_OFF2
> > among them, that the host handled for a protected guest until now.
> > TRNG for protected guests is a follow-up. AFFINITY_INFO stays
> > with the host, which returns OFF only once it has parked the target:
> > the host is what a guest polls to see a CPU_OFF complete before it
> > issues the next CPU_ON, as Linux does on hotplug.
> > 
> > Three consequences follow:
> > 
> >   - A protected VM has one primary vCPU, the first whose hyp vCPU is
> >     created with mp_state RUNNABLE. A second one, or an mp_state other
> >     than RUNNABLE or STOPPED, fails that vCPU's first KVM_RUN with
> >     -EINVAL.
> > 
> >   - CPU_ON finds its target among the hyp vCPUs, which exist from the
> >     target's first KVM_RUN; before that the guest gets
> >     INVALID_PARAMETERS.
> > 
> >   - A vCPU EL2 holds powered off doesn't run: handle___kvm_vcpu_run()
> >     returns ARM_EXCEPTION_IL, reported as KVM_EXIT_FAIL_ENTRY. Its
> >     existing bail-outs return the same code instead of an -EINVAL that
> >     handle_exit() didn't recognise, for every hyp vCPU.
> > 
> > Non-protected VMs keep power_state ON and accept any mp_state.
> > 
> > Each protected vCPU is OFF, ON_PENDING or ON. CPU_ON moves the target
> > to ON_PENDING, and the target's next run resets it and moves it to ON.
> > The racing transitions are cmpxchg, and the reset state is published
> > with a release/acquire pair, documented at each site. CPU_OFF publishes
> > OFF with a release, so the target's clear of reset_state.reset is
> > ordered before it and a CPU_ON that then wins on OFF republishes after
> > the clear. Rolling a CPU_ON the host failed back to OFF needs the
> > host's return value, which the per-EC marshalling patch delivers along
> > with the rollback. Until then such a target stays ON_PENDING, and the
> > reset has no observable effect: flush_hyp_vcpu() copies the host's
> > context in on every entry until that patch removes the copy, so the
> > target enters on the host's values rather than the ones EL2 reset.
> > 
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  14 ++
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  25 ++-
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c         | 283 ++++++++++++++++++++++++-
> >  3 files changed, 311 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > index a04b7c04d5135..63b368baf0e72 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > @@ -29,6 +29,12 @@ struct pkvm_hyp_vcpu {
> >  
> >  	/* The previous exit's ARM_EXCEPTION_* code. */
> >  	u32 exit_code;
> > +
> > +	/*
> > +	 * PSCI_0_2_AFFINITY_LEVEL_{OFF, ON_PENDING, ON}. A non-protected
> > +	 * vCPU is always ON.
> > +	 */
> > +	int power_state;
> >  };
> >  
> >  /*
> > @@ -46,6 +52,12 @@ struct pkvm_hyp_vm {
> >  	struct hyp_pool pool;
> >  	hyp_spinlock_t lock;
> >  
> > +	/*
> > +	 * The vCPU initialised RUNNABLE: claimed under vm_table_lock,
> > +	 * released only if its own init fails.
> > +	 */
> > +	struct pkvm_hyp_vcpu *primary_vcpu;
> > +
> >  	/* Array of the hyp vCPU structures for this VM. */
> >  	struct pkvm_hyp_vcpu *vcpus[];
> >  };
> > @@ -98,4 +110,6 @@ void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
> >  void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu);
> >  int kvm_check_pvm_sysreg_table(void);
> >  
> > +int pkvm_reset_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu);
> > +struct pkvm_hyp_vcpu *pkvm_mpidr_to_hyp_vcpu(struct pkvm_hyp_vm *vm, u64 mpidr);
> >  #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 9cc8ef16897c1..da8ab636063cf 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -8,6 +8,7 @@
> >  #include <hyp/switch.h>
> >  
> >  #include <linux/irqchip/arm-gic-v3.h>
> > +#include <uapi/linux/psci.h>
> >  
> >  #include <asm/pgtable-types.h>
> >  #include <asm/kvm_asm.h>
> > @@ -456,14 +457,12 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
> >  {
> >  	struct pkvm_hyp_vcpu *hyp_vcpu;
> >  	struct kvm_vcpu *host_vcpu;
> > -	int ret;
> > +	int ret = ARM_EXCEPTION_IL;
> >  
> >  	host_vcpu = get_host_hyp_vcpus(host_ctxt, 1, &hyp_vcpu);
> >  
> > -	if (!host_vcpu) {
> > -		ret = -EINVAL;
> > +	if (!host_vcpu)
> >  		goto out;
> > -	}
> >  
> >  	if (unlikely(hyp_vcpu)) {
> >  		/*
> > @@ -472,8 +471,22 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
> >  		 * loading a vcpu. Therefore, if SME features enabled the host
> >  		 * is misbehaving.
> >  		 */
> > -		if (unlikely(system_supports_sme() && read_sysreg_s(SYS_SVCR))) {
> > -			ret = -EINVAL;
> > +		if (unlikely(system_supports_sme() && read_sysreg_s(SYS_SVCR)))
> > +			goto out;
> > +
> > +		/*
> > +		 * ON has a single writer, pkvm_reset_vcpu() on this CPU, so
> > +		 * READ_ONCE suffices. ON_PENDING takes the reset; -ECANCELED
> > +		 * is a rollback that raced it.
> > +		 */
> > +		switch (READ_ONCE(hyp_vcpu->power_state)) {
> > +		case PSCI_0_2_AFFINITY_LEVEL_ON:
> > +			break;
> > +		case PSCI_0_2_AFFINITY_LEVEL_ON_PENDING:
> > +			if (pkvm_reset_vcpu(hyp_vcpu))
> > +				goto out;
> > +			break;
> > +		default:
> >  			goto out;
> >  		}
> >  
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 855cb77c8bba1..d970cba12ca47 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -5,6 +5,7 @@
> >   */
> >  
> >  #include <kvm/arm_hypercalls.h>
> > +#include <kvm/arm_psci.h>
> >  
> >  #include <linux/kvm_host.h>
> >  #include <linux/mm.h>
> > @@ -433,6 +434,40 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
> >  		   allowed_features, KVM_VCPU_MAX_FEATURES);
> >  }
> >  
> > +static int pkvm_vcpu_init_psci(struct pkvm_hyp_vcpu *hyp_vcpu, u32 mp_state)
> > +{
> > +	struct vcpu_reset_state *reset_state = &hyp_vcpu->vcpu.arch.reset_state;
> > +	struct pkvm_hyp_vm *hyp_vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> > +	struct kvm_vcpu *host_vcpu;
> > +
> > +	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> > +		/* The host manages a non-protected vCPU: always ON at EL2. */
> > +		hyp_vcpu->power_state = PSCI_0_2_AFFINITY_LEVEL_ON;
> > +		return 0;
> > +	}
> > +
> > +	if (mp_state != KVM_MP_STATE_RUNNABLE && mp_state != KVM_MP_STATE_STOPPED)
> > +		return -EINVAL;
> > +
> > +	if (mp_state == KVM_MP_STATE_STOPPED) {
> > +		reset_state->reset = false;
> > +		hyp_vcpu->power_state = PSCI_0_2_AFFINITY_LEVEL_OFF;
> > +		return 0;
> > +	}
> > +
> > +	hyp_assert_lock_held(&vm_table_lock);
> > +	if (hyp_vm->primary_vcpu)
> > +		return -EINVAL;
> > +	hyp_vm->primary_vcpu = hyp_vcpu;
> > +
> > +	host_vcpu = hyp_vcpu->host_vcpu;
> > +	reset_state->pc = READ_ONCE(host_vcpu->arch.ctxt.regs.pc);
> > +	reset_state->r0 = READ_ONCE(host_vcpu->arch.ctxt.regs.regs[0]);
> > +	reset_state->reset = true;
> > +	hyp_vcpu->power_state = PSCI_0_2_AFFINITY_LEVEL_ON_PENDING;
> > +	return 0;
> > +}
> > +
> >  static void unpin_host_vcpu(struct kvm_vcpu *host_vcpu)
> >  {
> >  	if (host_vcpu)
> > @@ -447,6 +482,9 @@ static void unpin_host_sve_state(struct pkvm_hyp_vcpu *hyp_vcpu)
> >  		return;
> >  
> >  	sve_state = hyp_vcpu->vcpu.arch.sve_state;
> > +	if (!sve_state)
> > +		return;
> > +
> >  	hyp_unpin_shared_mem(sve_state,
> >  			     sve_state + vcpu_sve_state_size(&hyp_vcpu->vcpu));
> >  }
> > @@ -559,10 +597,12 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
> >  			      struct kvm_vcpu *host_vcpu)
> >  {
> >  	int ret = 0;
> > +	u32 mp_state;
> >  
> >  	if (hyp_pin_shared_mem(host_vcpu, host_vcpu + 1))
> >  		return -EBUSY;
> >  
> > +	mp_state = READ_ONCE(host_vcpu->arch.mp_state.mp_state);
> >  	hyp_vcpu->host_vcpu = host_vcpu;
> >  
> >  	hyp_vcpu->vcpu.kvm = &hyp_vm->kvm;
> > @@ -571,7 +611,6 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
> >  
> >  	hyp_vcpu->vcpu.arch.hw_mmu = &hyp_vm->kvm.arch.mmu;
> >  	hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
> > -	hyp_vcpu->vcpu.arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
> >  
> >  	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> >  		/*
> > @@ -601,9 +640,12 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
> >  
> >  	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> >  		kvm_reset_pvm_sys_regs(&hyp_vcpu->vcpu);
> > +	ret = pkvm_vcpu_init_psci(hyp_vcpu, mp_state);
> >  done:
> > -	if (ret)
> > +	if (ret) {
> >  		unpin_host_vcpu(host_vcpu);
> > +		unpin_host_sve_state(hyp_vcpu);
> > +	}
> 
> Was it planned for a different commit of the series?

Ha no it wasn't, you're calling unpin_host_sve_state() unconditionally. 

> 
> >  	return ret;
> >  }
> >

[...]

