Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FC1F8FA98
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oFHuw3+I03R3MnNbIeu0XOl9L3y6D9yBZAe8TOwhVQ=; b=HoMg6Sb9amELkF/9s5UqErr/kQ
	YuRuy7XfC8Xb2xWOKUMakRimJMepp4XupeegniOcDFMdNNdwnADdlx3ocaRVLRLA2n7j1fLWdEDER
	gPxzJ6CFxI0G5hP2kYsu5D+ZqzV7eS/yEuJMzkUdovROKXo9+KXx1TX5SujRP1phxBwPt/xh0Gg2r
	uF1nae+tOmOSKaiOa8v/Lo6d14OC69DyZ/GrYFvWvMe+qJIGiABzOrwSl3dcDObNaWbSEMGq87GYq
	x5hhahuBqNZslDCb4T7+aCVEFwaZev7tJXqKbYU5iKlEG02/3NMsr/ZuZ/XLZY/V88jAsOE1LHaWr
	IaK35eeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDQU-00000008rYk-2mQX;
	Tue, 21 Apr 2026 15:54:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDQR-00000008rWY-2e8R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:54:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F8FC25DE;
	Tue, 21 Apr 2026 08:54:04 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D17EC3FAF5;
	Tue, 21 Apr 2026 08:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776786850; bh=LvqhrbKiq/fGBGfHat+bmUAmEfK1RD4ZtKiX8JXqP38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5k2Jr0Mzr9Gtyk2bK/COPi8z3TDIgxhGOBa2MmTgTTG9sp+cwuHRLErLohLKFklB
	 TlKZid0mUMq6IbeP8s6QHWn4F64+BFzPMRW+8uzTEMtJcUM/5GAQic+lTroDhS8qOD
	 uCkM6tDezin5LNKVeEJyeydYJN2g/3AuSKrIqMPg=
Date: Tue, 21 Apr 2026 16:54:06 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: Re: [PATCH 05/18] KVM: arm64: vgic: Constify struct irq_ops usage
Message-ID: <20260421155406.GB3862683@e124191.cambridge.arm.com>
References: <20260415115559.2227718-1-maz@kernel.org>
 <20260415115559.2227718-6-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415115559.2227718-6-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_085411_759354_F78E6862 
X-CRM114-Status: GOOD (  25.99  )
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

On Wed, Apr 15, 2026 at 12:55:46PM +0100, Marc Zyngier wrote:
> vgic-v5 has introduced much more prevalent usage of the struct
> irq_ops mechanism.
> 
> In the process, it becomes evident that suffers from two related
> problems:
> 
> - it contains flags, rather than only callbacks
> - it is mutable, because we need to update the above flags
> 
> Swap the flags for a helper retrieving the flags, and make all
> irq_ops const, something that is slightly satisfying.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/arch_timer.c   | 14 +++++++++-----
>  arch/arm64/kvm/vgic/vgic-v5.c |  2 +-
>  arch/arm64/kvm/vgic/vgic.c    |  2 +-
>  include/kvm/arm_vgic.h        |  9 +++++----
>  4 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index cbea4d9ee9552..f003df76fdda7 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -52,11 +52,17 @@ static u64 kvm_arm_timer_read(struct kvm_vcpu *vcpu,
>  			      enum kvm_arch_timer_regs treg);
>  static bool kvm_arch_timer_get_input_level(int vintid);
>  
> -static struct irq_ops arch_timer_irq_ops = {
> +static unsigned long kvm_arch_timer_get_irq_flags(void)
> +{
> +	return kvm_vgic_global_state.no_hw_deactivation ? VGIC_IRQ_SW_RESAMPLE : 0;
> +}
> +
> +static const struct irq_ops arch_timer_irq_ops = {
> +	.get_flags	 = kvm_arch_timer_get_irq_flags,
>  	.get_input_level = kvm_arch_timer_get_input_level,
>  };
>  
> -static struct irq_ops arch_timer_irq_ops_vgic_v5 = {
> +static const struct irq_ops arch_timer_irq_ops_vgic_v5 = {
>  	.get_input_level = kvm_arch_timer_get_input_level,
>  	.queue_irq_unlock = vgic_v5_ppi_queue_irq_unlock,
>  	.set_direct_injection = vgic_v5_set_ppi_dvi,
> @@ -1392,8 +1398,6 @@ static int kvm_irq_init(struct arch_timer_kvm_info *info)
>  			return -ENOMEM;
>  		}
>  
> -		if (kvm_vgic_global_state.no_hw_deactivation)
> -			arch_timer_irq_ops.flags |= VGIC_IRQ_SW_RESAMPLE;
>  		WARN_ON(irq_domain_push_irq(domain, host_vtimer_irq,
>  					    (void *)TIMER_VTIMER));
>  	}
> @@ -1591,8 +1595,8 @@ static bool kvm_arch_timer_get_input_level(int vintid)
>  int kvm_timer_enable(struct kvm_vcpu *vcpu)
>  {
>  	struct arch_timer_cpu *timer = vcpu_timer(vcpu);
> +	const struct irq_ops *ops;
>  	struct timer_map map;
> -	struct irq_ops *ops;
>  	int ret;
>  
>  	if (timer->enabled)
> diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
> index 0101ec3f55283..757484d2493b2 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5.c
> +++ b/arch/arm64/kvm/vgic/vgic-v5.c
> @@ -285,7 +285,7 @@ void vgic_v5_set_ppi_dvi(struct kvm_vcpu *vcpu, struct vgic_irq *irq, bool dvi)
>  	__assign_bit(ppi, cpu_if->vgic_ppi_dvir, dvi);
>  }
>  
> -static struct irq_ops vgic_v5_ppi_irq_ops = {
> +static const struct irq_ops vgic_v5_ppi_irq_ops = {
>  	.queue_irq_unlock = vgic_v5_ppi_queue_irq_unlock,
>  	.set_direct_injection = vgic_v5_set_ppi_dvi,
>  };
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index 1e9fe8764584d..3ac6d49bc4876 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -573,7 +573,7 @@ int kvm_vgic_inject_irq(struct kvm *kvm, struct kvm_vcpu *vcpu,
>  }
>  
>  void kvm_vgic_set_irq_ops(struct kvm_vcpu *vcpu, u32 vintid,
> -			  struct irq_ops *ops)
> +			  const struct irq_ops *ops)
>  {
>  	struct vgic_irq *irq = vgic_get_vcpu_irq(vcpu, vintid);
>  
> diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
> index ea793479ab254..fe49fb56dc3c9 100644
> --- a/include/kvm/arm_vgic.h
> +++ b/include/kvm/arm_vgic.h
> @@ -205,7 +205,7 @@ struct vgic_irq;
>   */
>  struct irq_ops {
>  	/* Per interrupt flags for special-cased interrupts */
> -	unsigned long flags;
> +	unsigned long (*get_flags)(void);
>  
>  #define VGIC_IRQ_SW_RESAMPLE	BIT(0)	/* Clear the active state for resampling */
>  
> @@ -271,7 +271,7 @@ struct vgic_irq {
>  	u8 priority;
>  	u8 group;			/* 0 == group 0, 1 == group 1 */
>  
> -	struct irq_ops *ops;
> +	const struct irq_ops *ops;
>  
>  	void *owner;			/* Opaque pointer to reserve an interrupt
>  					   for in-kernel devices. */
> @@ -279,7 +279,8 @@ struct vgic_irq {
>  
>  static inline bool vgic_irq_needs_resampling(struct vgic_irq *irq)
>  {
> -	return irq->ops && (irq->ops->flags & VGIC_IRQ_SW_RESAMPLE);
> +	return irq->ops && irq->ops->get_flags &&
> +	       (irq->ops->get_flags() & VGIC_IRQ_SW_RESAMPLE);
>  }
>  
>  struct vgic_register_region;
> @@ -557,7 +558,7 @@ void kvm_vgic_init_cpu_hardware(void);
>  int kvm_vgic_inject_irq(struct kvm *kvm, struct kvm_vcpu *vcpu,
>  			unsigned int intid, bool level, void *owner);
>  void kvm_vgic_set_irq_ops(struct kvm_vcpu *vcpu, u32 vintid,
> -			  struct irq_ops *ops);
> +			  const struct irq_ops *ops);
>  void kvm_vgic_clear_irq_ops(struct kvm_vcpu *vcpu, u32 vintid);
>  int kvm_vgic_map_phys_irq(struct kvm_vcpu *vcpu, unsigned int host_irq,
>  			  u32 vintid);
> -- 
> 2.47.3
> 

