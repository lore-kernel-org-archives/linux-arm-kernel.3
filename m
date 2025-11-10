Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE6BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxV0Bv9e0M/3aXxevVPMy47RYEU13Dm8RyI5inKduGU=; b=QYiRpEKekWRgB3XybHjLcYSlMM
	L2oTbHH4+00pn5wWsfQ5dhF9m7lh1aClFBvnjouAlMyWiSNS1nMSEe6kslDAg/YcU0s57DmHLH+e2
	84GSEaJNmDK+yaujfhxJcI87WKVTvaYb/bDuhg3n7cxXDPaO7X8d2rNAcbKNPuzWs2i68h0kJPR4Q
	6dpqLcvK1arL1gLTl092/ordU51Eptf6iZgGxDLoyEKb5QOw1t6bLAex1NB2zk/XP0e0/C8geE3L8
	e7mmbBe9vRzupyCsA/FJsXqhBRrbtUPtJdvxXIzpHCJNuxXwRhSIoyVJZTr4P9+6omJlmPyXeyL8H
	egDVQIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINmP-000000052WV-0HPT;
	Mon, 10 Nov 2025 09:01:41 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINmH-000000052Sq-2eWc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762765288; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=vxV0Bv9e0M/3aXxevVPMy47RYEU13Dm8RyI5inKduGU=;
	b=ciiF6eL9leDqeewxY0xCdFJTQV8iW2VtAUMN3qceW/0kLS9OBw/1/lO3gGG3YrFqpffPfIQDzr1r6MFiLtgnJDLWJz7oelGlMxukbhbc27bPGfbjGcUf1r80QCXpo0bIlPsmjGHBiXpN9V/TyMzn6A3i7WnxWKChnFdCL8dT+Wo=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0Ws1SfV-_1762765281 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 10 Nov 2025 17:01:21 +0800
Date: Mon, 10 Nov 2025 17:01:21 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 12/45] KVM: arm64: GICv3: Extract LR folding primitive
Message-ID: <3tb7ekdzl5f4rs24bla63vw22awejhbn7ngvttid7v7bzaer2m@62bxshf7uj34>
References: <20251109171619.1507205-1-maz@kernel.org>
 <20251109171619.1507205-13-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109171619.1507205-13-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_010134_258954_252FD253 
X-CRM114-Status: GOOD (  26.46  )
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

On Sun, Nov 09, 2025 at 05:15:46PM +0800, Marc Zyngier wrote:
> As we are going to need to handle deactivation for interrupts that
> are not in the LRs, split vgic_v3_fold_lr_state() into a helper
> that deals with a single interrupt, and the function that loops
> over the used LRs.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/vgic/vgic-v3.c | 88 +++++++++++++++++------------------
>  1 file changed, 43 insertions(+), 45 deletions(-)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
> index 3ede79e381513..0fccfe9e3e8dd 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3.c
> @@ -33,78 +33,76 @@ static bool lr_signals_eoi_mi(u64 lr_val)
>  	       !(lr_val & ICH_LR_HW);
>  }
>
> -void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
> +static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
>  {
> -	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
> -	struct vgic_v3_cpu_if *cpuif = &vgic_cpu->vgic_v3;
> -	u32 model = vcpu->kvm->arch.vgic.vgic_model;
> -	int lr;
> -
> -	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
> -
> -	cpuif->vgic_hcr &= ~ICH_HCR_EL2_UIE;
> -
> -	for (lr = 0; lr < cpuif->used_lrs; lr++) {
> -		u64 val = cpuif->vgic_lr[lr];
> -		u32 intid, cpuid;
> -		struct vgic_irq *irq;
> -		bool is_v2_sgi = false;
> -		bool deactivated;
> -
> -		cpuid = val & GICH_LR_PHYSID_CPUID;
> -		cpuid >>= GICH_LR_PHYSID_CPUID_SHIFT;
> -
> -		if (model == KVM_DEV_TYPE_ARM_VGIC_V3) {
> -			intid = val & ICH_LR_VIRTUAL_ID_MASK;
> -		} else {
> -			intid = val & GICH_LR_VIRTUALID;
> -			is_v2_sgi = vgic_irq_is_sgi(intid);
> -		}
> +	struct vgic_irq *irq;
> +	bool is_v2_sgi = false;
> +	bool deactivated;
> +	u32 intid;
>
> -		/* Notify fds when the guest EOI'ed a level-triggered IRQ */
> -		if (lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid))
> -			kvm_notify_acked_irq(vcpu->kvm, 0,
> -					     intid - VGIC_NR_PRIVATE_IRQS);
> +	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3) {
> +		intid = val & ICH_LR_VIRTUAL_ID_MASK;
> +	} else {
> +		intid = val & GICH_LR_VIRTUALID;
> +		is_v2_sgi = vgic_irq_is_sgi(intid);
> +	}
>
> -		irq = vgic_get_vcpu_irq(vcpu, intid);
> -		if (!irq)	/* An LPI could have been unmapped. */
> -			continue;
> +	irq = vgic_get_vcpu_irq(vcpu, intid);
> +	if (!irq)	/* An LPI could have been unmapped. */
> +		return;
>
> -		raw_spin_lock(&irq->irq_lock);
> +	/* Notify fds when the guest EOI'ed a level-triggered IRQ */
> +	if (lr_signals_eoi_mi(val) && vgic_valid_spi(vcpu->kvm, intid))
> +		kvm_notify_acked_irq(vcpu->kvm, 0,
> +				     intid - VGIC_NR_PRIVATE_IRQS);

The fds notifiy happens before checking irq's mapping before
this patch, and now in reversal order w/ above change. It's
fine for vLPI, and for vSPI no necessary call
kvm_notify_acked_irq() if the it has been remapped, no
gsi<->pin mapping there. Is above understanding correct ?

>
> +	scoped_guard(raw_spinlock, &irq->irq_lock) {
>  		/* Always preserve the active bit for !LPIs, note deactivation */
>  		if (irq->intid >= VGIC_MIN_LPI)
>  			val &= ~ICH_LR_ACTIVE_BIT;
>  		deactivated = irq->active && !(val & ICH_LR_ACTIVE_BIT);
>  		irq->active = !!(val & ICH_LR_ACTIVE_BIT);
>
> -		if (irq->active && is_v2_sgi)
> -			irq->active_source = cpuid;
> -
>  		/* Edge is the only case where we preserve the pending bit */
>  		if (irq->config == VGIC_CONFIG_EDGE &&
> -		    (val & ICH_LR_PENDING_BIT)) {
> +		    (val & ICH_LR_PENDING_BIT))
>  			irq->pending_latch = true;
>
> -			if (is_v2_sgi)
> -				irq->source |= (1 << cpuid);
> -		}
> -
>  		/*
>  		 * Clear soft pending state when level irqs have been acked.
>  		 */
>  		if (irq->config == VGIC_CONFIG_LEVEL && !(val & ICH_LR_STATE))
>  			irq->pending_latch = false;
>
> +		if (is_v2_sgi) {
> +			u8 cpuid = FIELD_GET(GICH_LR_PHYSID_CPUID, val);
> +
> +			if (irq->active)
> +				irq->active_source = cpuid;
> +
> +			if (val & ICH_LR_PENDING_BIT)
> +				irq->source |= BIT(cpuid);
> +		}
> +
>  		/* Handle resampling for mapped interrupts if required */
>  		vgic_irq_handle_resampling(irq, deactivated, val & ICH_LR_PENDING_BIT);
>
>  		irq->on_lr = false;
> -
> -		raw_spin_unlock(&irq->irq_lock);
> -		vgic_put_irq(vcpu->kvm, irq);
>  	}
>
> +	vgic_put_irq(vcpu->kvm, irq);
> +}
> +
> +void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
> +{
> +	struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic_cpu;
> +	struct vgic_v3_cpu_if *cpuif = &vgic_cpu->vgic_v3;
> +
> +	DEBUG_SPINLOCK_BUG_ON(!irqs_disabled());
> +
> +	for (int lr = 0; lr < cpuif->used_lrs; lr++)
> +		vgic_v3_fold_lr(vcpu, cpuif->vgic_lr[lr]);
> +
>  	cpuif->used_lrs = 0;
>  }
>
> --
> 2.47.3

