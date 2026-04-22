Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FCFF9EDCE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nd246UkITVeNFIx63TZSR5xMjnzNPb0r/jogwcva4hw=; b=RUQHBo08flP8fmwM3jBmO3MYaj
	YYsLBCLv0JDbJ0+iuHkLOJKq3G08DP22c0+IvWCeW6BOEJCrJu0b/f+r+t+J3laABrSDaDwP4mVOX
	q/r1Nmko0UrxNHM46u9KCzgm3lE21S0vWdA5ULYxZLmCrGb/v3VFQqFYgk18riODX6JqSKEiAkHeq
	OxAJDxE17uFxBWrHBoKfkfmxxHvUzdtllASL190xzOoDPdBgUkQpprmhXHCEXDKygRY03pW/JEH+b
	XXxISPd6AF4nLcEiIgt8wncWpWknbOheRe3zDPSxHZsI+a1CZhnfX81EvnVZXeCME7ha7JIiNFVrK
	3yXsWNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXej-0000000AJ8p-1l4U;
	Wed, 22 Apr 2026 13:30:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXeg-0000000AJ8T-3xIC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:30:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DACF1E2F;
	Wed, 22 Apr 2026 06:30:06 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 030603FBD2;
	Wed, 22 Apr 2026 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776864611; bh=DUpWNFJ1TvX3SBpvJvziXL2crEAYAXKm1hnh+0i3m0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1dCrSQDW+doQB0+W6AS8hdDAQO1TCbUTegR6J6d82jdg13FBczBscbamEiXI10OG
	 OnrQAWbDyc7PZ6OwFaWm7cnL+koAiKepBv1d7fyXcO9SbaTju8AlRCnMc3E1MEknSY
	 zGjI0kD2NPSfK2x2hF/EvmFaAqC7h14oa/WiIbm8=
Date: Wed, 22 Apr 2026 14:30:05 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 1/4] KVM: arm64: timer: Repaint
 kvm_timer_{should,irq_can}_fire() to kvm_timer_{pending,enabled}()
Message-ID: <20260422133005.GB3980015@e124191.cambridge.arm.com>
References: <20260422100210.3008156-1-maz@kernel.org>
 <20260422100210.3008156-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422100210.3008156-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_063015_063776_8B99381C 
X-CRM114-Status: GOOD (  27.08  )
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

On Wed, Apr 22, 2026 at 11:02:07AM +0100, Marc Zyngier wrote:
> kvm_timer_should_fire() seems to date back to a time where the author
> of the timer code didn't seem to have made the word "pending" part of
> their vocabulary.
> 
> Having since slightly improved on that front, let's rename this predicate
> to kvm_timer_pending(), which clearly indicates whether the timer
> interrupt is pending or not.
> 
> Similarly, kvm_timer_irq_can_fire() is renamed to kvm_timer_enabled().
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Minor comment below.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/arch_timer.c | 49 ++++++++++++++++++-------------------
>  1 file changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index cbea4d9ee9552..22e79ecb34bc4 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -39,10 +39,9 @@ static const u8 default_ppi[] = {
>  	[TIMER_HVTIMER] = 28,
>  };
>  
> -static bool kvm_timer_irq_can_fire(struct arch_timer_context *timer_ctx);
>  static void kvm_timer_update_irq(struct kvm_vcpu *vcpu, bool new_level,
>  				 struct arch_timer_context *timer_ctx);
> -static bool kvm_timer_should_fire(struct arch_timer_context *timer_ctx);
> +static bool kvm_timer_pending(struct arch_timer_context *timer_ctx);
>  static void kvm_arm_timer_write(struct kvm_vcpu *vcpu,
>  				struct arch_timer_context *timer,
>  				enum kvm_arch_timer_regs treg,
> @@ -224,7 +223,7 @@ static irqreturn_t kvm_arch_timer_handler(int irq, void *dev_id)
>  	else
>  		ctx = map.direct_ptimer;
>  
> -	if (kvm_timer_should_fire(ctx))
> +	if (kvm_timer_pending(ctx))
>  		kvm_timer_update_irq(vcpu, true, ctx);
>  
>  	if (userspace_irqchip(vcpu->kvm) &&
> @@ -257,7 +256,7 @@ static u64 kvm_timer_compute_delta(struct arch_timer_context *timer_ctx)
>  	return kvm_counter_compute_delta(timer_ctx, timer_get_cval(timer_ctx));
>  }
>  
> -static bool kvm_timer_irq_can_fire(struct arch_timer_context *timer_ctx)
> +static bool kvm_timer_enabled(struct arch_timer_context *timer_ctx)
>  {
>  	WARN_ON(timer_ctx && timer_ctx->loaded);
>  	return timer_ctx &&
> @@ -294,7 +293,7 @@ static u64 kvm_timer_earliest_exp(struct kvm_vcpu *vcpu)
>  		struct arch_timer_context *ctx = &vcpu->arch.timer_cpu.timers[i];
>  
>  		WARN(ctx->loaded, "timer %d loaded\n", i);
> -		if (kvm_timer_irq_can_fire(ctx))
> +		if (kvm_timer_enabled(ctx))
>  			min_delta = min(min_delta, kvm_timer_compute_delta(ctx));
>  	}
>  
> @@ -358,7 +357,7 @@ static enum hrtimer_restart kvm_hrtimer_expire(struct hrtimer *hrt)
>  	return HRTIMER_NORESTART;
>  }
>  
> -static bool kvm_timer_should_fire(struct arch_timer_context *timer_ctx)
> +static bool kvm_timer_pending(struct arch_timer_context *timer_ctx)
>  {
>  	enum kvm_arch_timers index;
>  	u64 cval, now;
> @@ -391,7 +390,7 @@ static bool kvm_timer_should_fire(struct arch_timer_context *timer_ctx)
>  		       !(cnt_ctl & ARCH_TIMER_CTRL_IT_MASK);
>  	}
>  
> -	if (!kvm_timer_irq_can_fire(timer_ctx))
> +	if (!kvm_timer_enabled(timer_ctx))
>  		return false;
>  
>  	cval = timer_get_cval(timer_ctx);
> @@ -417,9 +416,9 @@ void kvm_timer_update_run(struct kvm_vcpu *vcpu)
>  	/* Populate the device bitmap with the timer states */
>  	regs->device_irq_level &= ~(KVM_ARM_DEV_EL1_VTIMER |
>  				    KVM_ARM_DEV_EL1_PTIMER);
> -	if (kvm_timer_should_fire(vtimer))
> +	if (kvm_timer_pending(vtimer))
>  		regs->device_irq_level |= KVM_ARM_DEV_EL1_VTIMER;
> -	if (kvm_timer_should_fire(ptimer))
> +	if (kvm_timer_pending(ptimer))
>  		regs->device_irq_level |= KVM_ARM_DEV_EL1_PTIMER;
>  }
>  
> @@ -473,21 +472,21 @@ static void kvm_timer_update_irq(struct kvm_vcpu *vcpu, bool new_level,
>  /* Only called for a fully emulated timer */
>  static void timer_emulate(struct arch_timer_context *ctx)
>  {
> -	bool should_fire = kvm_timer_should_fire(ctx);
> +	bool pending = kvm_timer_pending(ctx);
>  
> -	trace_kvm_timer_emulate(ctx, should_fire);
> +	trace_kvm_timer_emulate(ctx, pending);
>  
> -	if (should_fire != ctx->irq.level)
> -		kvm_timer_update_irq(timer_context_to_vcpu(ctx), should_fire, ctx);
> +	if (pending != ctx->irq.level)
> +		kvm_timer_update_irq(timer_context_to_vcpu(ctx), pending, ctx);
>  
> -	kvm_timer_update_status(ctx, should_fire);
> +	kvm_timer_update_status(ctx, pending);
>  
>  	/*
>  	 * If the timer can fire now, we don't need to have a soft timer
>  	 * scheduled for the future.  If the timer cannot fire at all,
>  	 * then we also don't need a soft timer.
>  	 */

Could update this comment to use pending/enabled now?

> -	if (should_fire || !kvm_timer_irq_can_fire(ctx))
> +	if (pending || !kvm_timer_enabled(ctx))
>  		return;
>  
>  	soft_timer_start(&ctx->hrtimer, kvm_timer_compute_delta(ctx));
> @@ -594,10 +593,10 @@ static void kvm_timer_blocking(struct kvm_vcpu *vcpu)
>  	 * If no timers are capable of raising interrupts (disabled or
>  	 * masked), then there's no more work for us to do.
>  	 */
> -	if (!kvm_timer_irq_can_fire(map.direct_vtimer) &&
> -	    !kvm_timer_irq_can_fire(map.direct_ptimer) &&
> -	    !kvm_timer_irq_can_fire(map.emul_vtimer) &&
> -	    !kvm_timer_irq_can_fire(map.emul_ptimer) &&
> +	if (!kvm_timer_enabled(map.direct_vtimer) &&
> +	    !kvm_timer_enabled(map.direct_ptimer) &&
> +	    !kvm_timer_enabled(map.emul_vtimer) &&
> +	    !kvm_timer_enabled(map.emul_ptimer) &&
>  	    !vcpu_has_wfit_active(vcpu))
>  		return;
>  
> @@ -685,7 +684,7 @@ static void kvm_timer_vcpu_load_gic(struct arch_timer_context *ctx)
>  	 * this point and the register restoration, we'll take the
>  	 * interrupt anyway.
>  	 */
> -	kvm_timer_update_irq(vcpu, kvm_timer_should_fire(ctx), ctx);
> +	kvm_timer_update_irq(vcpu, kvm_timer_pending(ctx), ctx);
>  
>  	if (irqchip_in_kernel(vcpu->kvm))
>  		phys_active = kvm_vgic_map_is_active(vcpu, timer_irq(ctx));
> @@ -706,7 +705,7 @@ static void kvm_timer_vcpu_load_nogic(struct kvm_vcpu *vcpu)
>  	 * this point and the register restoration, we'll take the
>  	 * interrupt anyway.
>  	 */
> -	kvm_timer_update_irq(vcpu, kvm_timer_should_fire(vtimer), vtimer);
> +	kvm_timer_update_irq(vcpu, kvm_timer_pending(vtimer), vtimer);
>  
>  	/*
>  	 * When using a userspace irqchip with the architected timers and a
> @@ -917,8 +916,8 @@ bool kvm_timer_should_notify_user(struct kvm_vcpu *vcpu)
>  	vlevel = sregs->device_irq_level & KVM_ARM_DEV_EL1_VTIMER;
>  	plevel = sregs->device_irq_level & KVM_ARM_DEV_EL1_PTIMER;
>  
> -	return kvm_timer_should_fire(vtimer) != vlevel ||
> -	       kvm_timer_should_fire(ptimer) != plevel;
> +	return kvm_timer_pending(vtimer) != vlevel ||
> +	       kvm_timer_pending(ptimer) != plevel;
>  }
>  
>  void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
> @@ -1006,7 +1005,7 @@ static void unmask_vtimer_irq_user(struct kvm_vcpu *vcpu)
>  {
>  	struct arch_timer_context *vtimer = vcpu_vtimer(vcpu);
>  
> -	if (!kvm_timer_should_fire(vtimer)) {
> +	if (!kvm_timer_pending(vtimer)) {
>  		kvm_timer_update_irq(vcpu, false, vtimer);
>  		if (static_branch_likely(&has_gic_active_state))
>  			set_timer_irq_phys_active(vtimer, false);
> @@ -1579,7 +1578,7 @@ static bool kvm_arch_timer_get_input_level(int vintid)
>  
>  		ctx = vcpu_get_timer(vcpu, i);
>  		if (timer_irq(ctx) == vintid)
> -			return kvm_timer_should_fire(ctx);
> +			return kvm_timer_pending(ctx);
>  	}
>  
>  	/* A timer IRQ has fired, but no matching timer was found? */
> -- 
> 2.47.3
> 

