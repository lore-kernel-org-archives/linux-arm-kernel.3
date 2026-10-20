Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E22606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G1OnnA9n;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KAny9+RY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WWk7zExmFICqSLgFYRdnOfnAX1UA+1LzUHxktArr0A=; b=G1OnnA9n3ZUISznQt5Q4unWojJ
	JRZdOkZTnvplc76sWEqRykCs3wh/3irWaIcUEa4NyzB4q3JdakpVZLzfYdUcp2tW4kALv4O+hE3xo
	UcqaQAEYIHcvNcoEa2FO7rjJUf6bJFrZcGhSs9xd82bPYJGCaxY8TwcVjWxR+EMZfEosztM9y3fAo
	YpgEK8S1gBUHyM2G0nk1DHXpCekh4EfcU/t1BulDjDn9lwGgKMuUoK4tonihZxf7mIcOwr12Ov02x
	S4TP8WktRTc40/SN8TJMe/iJ2wVfbseVReajNryddjd0cDvYkRDeDQaVPfELh75wLjf7v4x1ozbFX
	CtSKEIrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDW2-0000000AKen-394V;
	Tue, 20 Oct 2026 17:20:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDW1-0000000AKeQ-2aZf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 17:20:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B00006022C;
	Tue, 20 Oct 2026 17:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2D51F000C9;
	Tue, 20 Oct 2026 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792516844;
	bh=6WWk7zExmFICqSLgFYRdnOfnAX1UA+1LzUHxktArr0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KAny9+RYL3Bjeb2mO44a1DmHjw5+oGJtZavst+KtM/yvA1XeMdgFf3bk6UL5KVh+P
	 1I8S6GaqWuXL8Un8uzuTijsxfTPN2YhPmtDXJNFntGZsRaXLO6wtVyd41QOtYOGfE3
	 DPTZSKa9l5SlKTfbLLVmDokn5amCYcHczoUjzfGt2L3Uyy37nkRW3J/FhkwA3HpxpG
	 aGmdXDp18uRFtMDOMDDhO12qmoLrthj/KgtRm3RlSyU6VmZBQP9KXQYj2NKwGS1cL5
	 p11g45R+3sO/Aeb4+glyJU+LCXXl9ZLUNj23hri92cY95iFyeu7QdrrZJpBX2srtW+
	 +6cYTtWtGJAOA==
Date: Tue, 20 Oct 2026 18:20:29 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFC PATCH v7 12/28] KVM: arm64: Add SPE VCPU device attribute
 to set the interrupt number
Message-ID: <ateEKZC3pjL6Sjrq@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-13-alexandru.elisei@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-13-alexandru.elisei@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Sep 03, 2026 at 05:06:07PM +0100, Alexandru Elisei wrote:
> From: Sudeep Holla <sudeep.holla@arm.com>
>
> Add KVM_ARM_VCPU_SPE_CTRL(KVM_ARM_VCPU_SPE_IRQ) to allow the user to set
> the interrupt number for the buffer management interrupt.

I know this is a bit of a theme of the review :P but feels a little short.

Be good to see why you want to do this, broadly what you are changing
(shouldn't duplicate stuff you can see from the diff but something like '

>
> [ Alexandru E: Split from "KVM: arm64: Add a new VCPU device control group
>                for SPE" ]
>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

I guess similar comment to before - is this a significant change? If so
then probably best to go Co-developed-by route, otherwise not a big deal.

> ---
>  Documentation/virt/kvm/devices/vcpu.rst | 22 +++++++
>  arch/arm64/include/asm/kvm_host.h       |  2 +
>  arch/arm64/include/asm/kvm_spe.h        | 11 ++++
>  arch/arm64/include/uapi/asm/kvm.h       |  1 +
>  arch/arm64/kvm/guest.c                  |  2 +
>  arch/arm64/kvm/spe.c                    | 82 +++++++++++++++++++++++++
>  6 files changed, 120 insertions(+)
>
> diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
> index e0a7fa35dfd2..d30b2f7fec9a 100644
> --- a/Documentation/virt/kvm/devices/vcpu.rst
> +++ b/Documentation/virt/kvm/devices/vcpu.rst
> @@ -307,3 +307,25 @@ From the destination VMM process:
>  ===============================
>
>  :Architectures: ARM64
> +
> +5.1 ATTRIBUTE: KVM_ARM_VCPU_SPE_IRQ
> +-----------------------------------
> +
> +:Parameters: in kvm_device_attr.addr the address for the Profiling Buffer
> +             management interrupt number as a pointer to an int
> +
> +Returns:

Was going to say maybe it should be ':Returns:' but actually the doc seems
super inconsistent on this... :P so it doesn't really matter.

> +
> +	 =======  ==========================================================
> +	 -EFAULT  Error accessing the buffer management interrupt number
> +	 -EINVAL  Invalid interrupt number or not using an in-kernel irqchip
> +	 -ENODEV  KVM_ARM_VCPU_HAS_SPE VCPU feature not set

Seems like a typo, should be KVM_ARM_VCPU_SPE_IRQ right?

> +	 -ENXIO   SPE not supported or not properly configured
> +	 =======  ==========================================================
> +
> +Required.
> +
> +Specifies the Profiling Buffer management interrupt number. The interrupt number
> +must be a PPI and the interrupt number must be the same for each VCPU. Arm
> +recommends 21 as the interrupt number. SPE virtualization requires an in-kernel
> +vGIC implementation.
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 27fe0cd5b2d7..e7332bd82bf3 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -27,6 +27,7 @@
>  #include <asm/fpsimd.h>
>  #include <asm/kvm.h>
>  #include <asm/kvm_asm.h>
> +#include <asm/kvm_spe.h>
>  #include <asm/vncr_mapping.h>
>
>  #define __KVM_HAVE_ARCH_INTC_INITIALIZED
> @@ -918,6 +919,7 @@ struct kvm_vcpu_arch {
>  	struct vgic_cpu vgic_cpu;
>  	struct arch_timer_cpu timer_cpu;
>  	struct kvm_pmu pmu;
> +	struct kvm_vcpu_spe vcpu_spe;
>
>  	/* vcpu power state */
>  	struct kvm_mp_state mp_state;
> diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
> index 1327064d0984..8ded2d821bff 100644
> --- a/arch/arm64/include/asm/kvm_spe.h
> +++ b/arch/arm64/include/asm/kvm_spe.h
> @@ -6,7 +6,15 @@
>  #ifndef __ARM64_KVM_SPE_H__
>  #define __ARM64_KVM_SPE_H__
>
> +struct kvm;
> +struct kvm_vcpu;
> +struct kvm_device_attr;
> +
>  #ifdef CONFIG_KVM_ARM_SPE
> +struct kvm_vcpu_spe {
> +	int irq_num;		/* Buffer management interrupt number */
> +};

I guess this struct will be expanded over time?

> +
>  bool kvm_supports_spe(void);
>
>  #define vcpu_has_spe(vcpu)					\
> @@ -16,6 +24,9 @@ int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>  int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>  int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
>  #else

NIT, and probably applicable to a previous patch, but useful to put /*
CONFIG_KVM_ARM_SPE */ there, certainly useful as things grow.

> +struct kvm_vcpu_spe {
> +};
> +

OK good this covers off the !CONFIG_KVM_ARM_SPE case.

>  static __always_inline bool kvm_supports_spe(void)
>  {
>  	return false;
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index e8a68e34be63..b9e5019181eb 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -447,6 +447,7 @@ enum {
>  #define KVM_ARM_VCPU_PVTIME_CTRL	2
>  #define   KVM_ARM_VCPU_PVTIME_IPA	0
>  #define KVM_ARM_VCPU_SPE_CTRL		3
> +#define   KVM_ARM_VCPU_SPE_IRQ		0
>
>  /* KVM_IRQ_LINE irq field index values */
>  #define KVM_ARM_IRQ_VCPU2_SHIFT		28
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 56c5f937fcdb..f953b235b458 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -920,7 +920,9 @@ int kvm_arm_vcpu_arch_set_attr(struct kvm_vcpu *vcpu,
>  		ret = kvm_arm_pvtime_set_attr(vcpu, attr);
>  		break;
>  	case KVM_ARM_VCPU_SPE_CTRL:
> +		mutex_lock(&vcpu->kvm->arch.config_lock);
>  		ret = kvm_spe_set_attr(vcpu, attr);
> +		mutex_unlock(&vcpu->kvm->arch.config_lock);
>  		break;
>  	default:
>  		ret = -ENXIO;
> diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
> index fe45ad4c703a..dd5f80318ba4 100644
> --- a/arch/arm64/kvm/spe.c
> +++ b/arch/arm64/kvm/spe.c
> @@ -59,17 +59,99 @@ bool kvm_supports_spe(void)
>  	return !list_empty(&spe_pmus);
>  }
>
> +static bool kvm_spe_irq_is_valid(struct kvm *kvm, int irq)
> +{
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vcpu_spe *vcpu_spe;
> +	unsigned long i;
> +

Maybe worth a small comment:

	/* Every vCPU must have either the same or no IRQ set. */

> +	kvm_for_each_vcpu(i, vcpu, kvm) {
> +		vcpu_spe = &vcpu->arch.vcpu_spe;
> +
> +		if (!vcpu_spe->irq_num)
> +			continue;
> +
> +		if (vcpu_spe->irq_num != irq)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +

>  int kvm_spe_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>  {
> +	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
> +	struct kvm *kvm = vcpu->kvm;
> +
> +	lockdep_assert_held(&kvm->arch.config_lock);
> +
> +	if (!vcpu_has_spe(vcpu))
> +		return -ENODEV;
> +
> +	switch (attr->attr) {
> +	case KVM_ARM_VCPU_SPE_IRQ: {
> +		int __user *uaddr = (int __user *)(long)attr->addr;
> +		int irq;
> +
> +		if (!irqchip_in_kernel(kvm))
> +			return -EINVAL;
> +
> +		if (get_user(irq, uaddr))
> +			return -EFAULT;
> +
> +		if (!irq_is_ppi(kvm, irq))
> +			return -EINVAL;
> +
> +		if (!kvm_spe_irq_is_valid(kvm, irq))
> +			return -EINVAL;

What about changing the IRQ for vcpu? kvm_spe_irq_is_valid() will abort
even if only the current vCPU has an IRQ set.

Also what about the case of setting the current vCPU's IRQ to the same
value? Should that be -EBUSY?

PMU seems to do something like that, so maybe worth doing that for
consistency? Not exactly a huge thing, that though!

Also looking at PMU there's:

	/* On GICv5, the PMUIRQ is architecturally mandated to be PPI 23 */
	if (vgic_is_v5(kvm) && irq != KVM_ARMV8_PMU_GICV5_IRQ)
		return false;

Is that something you have to worry about for SPE?


> +
> +		vcpu_spe->irq_num = irq;
> +		return 0;
> +	}
> +	}
> +
>  	return -ENXIO;
>  }
>
>  int kvm_spe_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>  {
> +	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
> +	struct kvm *kvm = vcpu->kvm;
> +
> +	if (!vcpu_has_spe(vcpu))
> +		return -ENODEV;
> +
> +	switch (attr->attr) {
> +	case KVM_ARM_VCPU_SPE_IRQ: {
> +		int __user *uaddr = (int __user *)(long)attr->addr;
> +		int irq;
> +
> +		if (!irqchip_in_kernel(kvm))
> +			return -EINVAL;
> +
> +		if (!vcpu_spe->irq_num)
> +			return -ENXIO;
> +
> +		irq = vcpu_spe->irq_num;
> +		if (put_user(irq, uaddr))
> +			return -EFAULT;
> +
> +		return 0;
> +	}
> +	}
> +
>  	return -ENXIO;
>  }
>
>  int kvm_spe_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>  {
> +	if (!vcpu_has_spe(vcpu))
> +		return -ENODEV;
> +
> +	switch(attr->attr) {
> +	case KVM_ARM_VCPU_SPE_IRQ:
> +		return 0;
> +	}
> +
>  	return -ENXIO;
>  }
> --
> 2.43.0
>
>

--
Cheers, Lorenzo

