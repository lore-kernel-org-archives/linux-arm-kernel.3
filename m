Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F92D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=008RIx5L0bRyfXgeGCleWk9iDvAxmUaY7E4jqAHt8/I=; b=ZVCvQNGvrGryRGK4/0XWd7SFIM
	vNnENNua5owteZw14z6wEmnuRXuKhi2u0z1QSETa0/8dwbR92yFL/bBoWPbXN/3owVNd9rM5SUc7T
	u6k4JtfFpGlgf0f12rSooi2vpWDm7d67FrR/sXJEg7Bli9DckTGVoh/uVEig0vmC2IKxbx3zdkq+Q
	Mj1pPeOrEYbyrvAh3xppfG9KLka3KnvYFm8BMTvkZRZVSx46uXFw+3AdCTKtxc+b1xKX8syiHeTPN
	CE7tlSgzIMFLoDxr66n7e3DBr85SkbMvdFWjt4G5mBTFZ6Va7++9cXAzmnx1ao1PY3/trKnd7CD+r
	tGT8MwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsb1-000000004Dm-1kiC;
	Thu, 08 Jan 2026 16:10:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsay-000000004Co-3Szl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:10:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27899497;
	Thu,  8 Jan 2026 08:10:34 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 491613F5A1;
	Thu,  8 Jan 2026 08:10:38 -0800 (PST)
Date: Thu, 8 Jan 2026 16:10:31 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH v2 19/36] KVM: arm64: gic-v5: Check for pending PPIs
Message-ID: <20260108161031.GA223579@e124191.cambridge.arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
 <20251219155222.1383109-20-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219155222.1383109-20-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_081044_947030_320B08BF 
X-CRM114-Status: GOOD (  34.97  )
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

Small nit,

On Fri, Dec 19, 2025 at 03:52:42PM +0000, Sascha Bischoff wrote:
> This change allows KVM to check for pending PPI interrupts. This has
> two main components:
> 
> First of all, the effective priority mask is calculated.  This is a
> combination of the priority mask in the VPEs ICC_PCR_EL1.PRIORITY and
> the currently running priority as determined from the VPE's
> ICH_APR_EL1. If an interrupt's prioirity is greater than or equal to
> the effective priority mask, it can be signalled. Otherwise, it
> cannot.
> 
> Secondly, any Enabled and Pending PPIs must be checked against this
> compound priority mask. The reqires the PPI priorities to by synced
> back to the KVM shadow state - this is skipped in general operation as
> it isn't required and is rather expensive. If any Enabled and Pending
> PPIs are of sufficient priority to be signalled, then there are
> pending PPIs. Else, there are not.  This ensures that a VPE is not
> woken when it cannot actually process the pending interrupts.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/vgic/vgic-v5.c | 121 ++++++++++++++++++++++++++++++++++
>  arch/arm64/kvm/vgic/vgic.c    |   5 +-
>  arch/arm64/kvm/vgic/vgic.h    |   1 +
>  3 files changed, 126 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
> index cb3dd872d16a6..c7ecc4f40b1e5 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5.c
> +++ b/arch/arm64/kvm/vgic/vgic-v5.c
> @@ -56,6 +56,31 @@ int vgic_v5_probe(const struct gic_kvm_info *info)
>  	return 0;
>  }
>  
> +static u32 vgic_v5_get_effective_priority_mask(struct kvm_vcpu *vcpu)
> +{
> +	struct vgic_v5_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v5;
> +	u32 highest_ap, priority_mask;
> +
> +	/*
> +	 * Counting the number of trailing zeros gives the current
> +	 * active priority. Explicitly use the 32-bit version here as
> +	 * we have 32 priorities. 0x20 then means that there are no
> +	 * active priorities.
> +	 */
> +	highest_ap = cpu_if->vgic_apr ? __builtin_ctz(cpu_if->vgic_apr) : 32;
> +
> +	/*
> +	 * An interrupt is of sufficient priority if it is equal to or
> +	 * greater than the priority mask. Add 1 to the priority mask
> +	 * (i.e., lower priority) to match the APR logic before taking
> +	 * the min. This gives us the lowest priority that is masked.
> +	 */
> +	priority_mask = FIELD_GET(FEAT_GCIE_ICH_VMCR_EL2_VPMR, cpu_if->vgic_vmcr);
> +	priority_mask = min(highest_ap, priority_mask + 1);
> +
> +	return priority_mask;
> +}
> +
>  static bool vgic_v5_ppi_set_pending_state(struct kvm_vcpu *vcpu,
>  					  struct vgic_irq *irq)
>  {
> @@ -131,6 +156,102 @@ void vgic_v5_set_ppi_ops(struct vgic_irq *irq)
>  	}
>  }
>  
> +
> +/*
> + * Sync back the PPI priorities to the vgic_irq shadow state
> + */
> +static void vgic_v5_sync_ppi_priorities(struct kvm_vcpu *vcpu)
> +{
> +	struct vgic_v5_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v5;
> +	int i, reg;
> +
> +	/* We have 16 PPI Priority regs */
> +	for (reg = 0; reg < 16; reg++) {
> +		const unsigned long priorityr = cpu_if->vgic_ppi_priorityr[reg];
> +
> +		for (i = 0; i < 8; ++i) {
> +			struct vgic_irq *irq;
> +			u32 intid;
> +			u8 priority;
> +
> +			priority = (priorityr >> (i * 8)) & 0x1f;
> +
> +			intid = FIELD_PREP(GICV5_HWIRQ_TYPE, GICV5_HWIRQ_TYPE_PPI);
> +			intid |= FIELD_PREP(GICV5_HWIRQ_ID, reg * 8 + i);
> +
> +			irq = vgic_get_vcpu_irq(vcpu, intid);
> +
> +			scoped_guard(raw_spinlock, &irq->irq_lock)
> +				irq->priority = priority;
> +
> +			vgic_put_irq(vcpu->kvm, irq);
> +		}
> +	}
> +}
> +
> +bool vgic_v5_has_pending_ppi(struct kvm_vcpu *vcpu)
> +{
> +	struct vgic_v5_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v5;
> +	int i, reg;
> +	unsigned int priority_mask;
> +
> +	/* If no pending bits are set, exit early */
> +	if (likely(!cpu_if->vgic_ppi_pendr[0] && !cpu_if->vgic_ppi_pendr[1]))
> +		return false;
> +
> +	priority_mask = vgic_v5_get_effective_priority_mask(vcpu);
> +
> +	/* If the combined priority mask is 0, nothing can be signalled! */
> +	if (!priority_mask)
> +		return false;
> +
> +	/* The shadow priority is only updated on demand, sync it across first */
> +	vgic_v5_sync_ppi_priorities(vcpu);
> +
> +	for (reg = 0; reg < 2; reg++) {
> +		unsigned long possible_bits;
> +		const unsigned long enabler = cpu_if->vgic_ich_ppi_enabler_exit[reg];
> +		const unsigned long pendr = cpu_if->vgic_ppi_pendr_exit[reg];
> +		bool has_pending = false;
> +
> +		/* Check all interrupts that are enabled and pending */
> +		possible_bits = enabler & pendr;
> +
> +		/*
> +		 * Optimisation: pending and enabled with no active priorities
> +		 */
> +		if (possible_bits && priority_mask > 0x1f)
> +			return true;
> +
> +		for_each_set_bit(i, &possible_bits, 64) {
> +			struct vgic_irq *irq;
> +			u32 intid;
> +
> +			intid = FIELD_PREP(GICV5_HWIRQ_TYPE, GICV5_HWIRQ_TYPE_PPI);
> +			intid |= FIELD_PREP(GICV5_HWIRQ_ID, reg * 64 + i);
> +
> +			irq = vgic_get_vcpu_irq(vcpu, intid);
> +
> +			scoped_guard(raw_spinlock, &irq->irq_lock) {
> +				/*
> +				 * We know that the interrupt is
> +				 * enabled and pending, so only check
> +				 * the priority.
> +				 */
> +				if (irq->priority <= priority_mask)
> +					has_pending = true;
> +			}
> +
> +			vgic_put_irq(vcpu->kvm, irq);
> +
> +			if (has_pending)
> +				return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  /*
>   * Detect any PPIs state changes, and propagate the state with KVM's
>   * shadow structures.
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index cb5d43b34462b..dfec6ed7936ed 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -1180,9 +1180,12 @@ int kvm_vgic_vcpu_pending_irq(struct kvm_vcpu *vcpu)
>  	unsigned long flags;
>  	struct vgic_vmcr vmcr;
>  
> -	if (!vcpu->kvm->arch.vgic.enabled)
> +	if (!vcpu->kvm->arch.vgic.enabled && !vgic_is_v5(vcpu->kvm))
>  		return false;
>  
> +	if (vcpu->kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V5)

        if (vgic_is_v5(vcpu->kvm))

Otherwise:

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> +		return vgic_v5_has_pending_ppi(vcpu);
> +
>  	if (vcpu->arch.vgic_cpu.vgic_v3.its_vpe.pending_last)
>  		return true;
>  
> diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
> index 978d7f8426361..65c031da83e78 100644
> --- a/arch/arm64/kvm/vgic/vgic.h
> +++ b/arch/arm64/kvm/vgic/vgic.h
> @@ -388,6 +388,7 @@ int vgic_v5_probe(const struct gic_kvm_info *info);
>  void vgic_v5_get_implemented_ppis(void);
>  void vgic_v5_set_ppi_ops(struct vgic_irq *irq);
>  int vgic_v5_set_ppi_dvi(struct kvm_vcpu *vcpu, u32 irq, bool dvi);
> +bool vgic_v5_has_pending_ppi(struct kvm_vcpu *vcpu);
>  void vgic_v5_flush_ppi_state(struct kvm_vcpu *vcpu);
>  void vgic_v5_fold_ppi_state(struct kvm_vcpu *vcpu);
>  void vgic_v5_load(struct kvm_vcpu *vcpu);
> -- 
> 2.34.1

