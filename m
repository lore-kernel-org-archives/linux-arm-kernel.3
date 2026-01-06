Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E297CE9D42
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Se8ucvbIidApWvweN64ijANn/v44sSxT0EaDQI6wrDo=; b=fRO/n4pO3d887h1rmblZGqb/BI
	QIiz10SK4lHsK00WAEku9ZKlvMoZa1L2nepf3/mokiaTLMdRt7DoLlO1TaiR11uwd5j5J6YnOOLAD
	bfxyZYPqR7bQh0nNdwUk+J0jyuIAUblwSi1HkigemSFU5cPu1Ql1nxSWvIOPzJgb1SR3v4l6qlzqh
	WlABol0wpSU3BCLp3JP9jyW2+BJIMJNvrUdwS/PHvsouclESYIED8Lx0SF+ncNjvtK6ry+Tm1Thhy
	hIXwEU96j518BH58Xsrb92ATvZObJH6jwqjVQq0Mq8G0i6lqVg4h9lVNdhBJOMjpOXKjkbjq5mt1U
	1fqHqYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8PO-0000000DL09-2xqQ;
	Tue, 06 Jan 2026 14:51:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8PJ-0000000DKzX-3KFX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:51:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF9FA497;
	Tue,  6 Jan 2026 06:51:27 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7AD13F6A8;
	Tue,  6 Jan 2026 06:51:32 -0800 (PST)
Date: Tue, 6 Jan 2026 14:51:26 +0000
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
Subject: Re: [PATCH v2 07/36] KVM: arm64: gic: Introduce interrupt type
 helpers
Message-ID: <20260106145126.GA1982@e124191.cambridge.arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
 <20251219155222.1383109-8-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219155222.1383109-8-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_065137_930891_A7248C49 
X-CRM114-Status: GOOD (  31.46  )
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

Hello from 2026!

On Fri, Dec 19, 2025 at 03:52:38PM +0000, Sascha Bischoff wrote:
> GICv5 has moved from using interrupt ranges for different interrupt
> types to using some of the upper bits of the interrupt ID to denote
> the interrupt type. This is not compatible with older GICs (which rely
> on ranges of interrupts to determine the type), and hence a set of
> helpers is introduced. These helpers take a struct kvm*, and use the
> vgic model to determine how to interpret the interrupt ID.
> 
> Helpers are introduced for PPIs, SPIs, and LPIs. Additionally, a
> helper is introduced to determine if an interrupt is private - SGIs
> and PPIs for older GICs, and PPIs only for GICv5.
> 
> The helpers are plumbed into the core vgic code, as well as the Arch
> Timer and PMU code.
> 
> There should be no functional changes as part of this change.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/arch_timer.c           |  2 +-
>  arch/arm64/kvm/pmu-emul.c             |  7 ++-
>  arch/arm64/kvm/vgic/vgic-kvm-device.c |  2 +-
>  arch/arm64/kvm/vgic/vgic.c            | 14 ++---
>  include/kvm/arm_vgic.h                | 82 +++++++++++++++++++++++++--
>  5 files changed, 91 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 99a07972068d1..6f033f6644219 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -1598,7 +1598,7 @@ int kvm_arm_timer_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>  	if (get_user(irq, uaddr))
>  		return -EFAULT;
>  
> -	if (!(irq_is_ppi(irq)))
> +	if (!(irq_is_ppi(vcpu->kvm, irq)))
>  		return -EINVAL;
>  
>  	mutex_lock(&vcpu->kvm->arch.config_lock);
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index b03dbda7f1ab9..afc838ea2503e 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -939,7 +939,8 @@ int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
>  		 * number against the dimensions of the vgic and make sure
>  		 * it's valid.
>  		 */
> -		if (!irq_is_ppi(irq) && !vgic_valid_spi(vcpu->kvm, irq))
> +		if (!irq_is_ppi(vcpu->kvm, irq) &&
> +		    !vgic_valid_spi(vcpu->kvm, irq))
>  			return -EINVAL;
>  	} else if (kvm_arm_pmu_irq_initialized(vcpu)) {
>  		   return -EINVAL;
> @@ -991,7 +992,7 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int irq)
>  		if (!kvm_arm_pmu_irq_initialized(vcpu))
>  			continue;
>  
> -		if (irq_is_ppi(irq)) {
> +		if (irq_is_ppi(vcpu->kvm, irq)) {
>  			if (vcpu->arch.pmu.irq_num != irq)
>  				return false;
>  		} else {
> @@ -1142,7 +1143,7 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>  			return -EFAULT;
>  
>  		/* The PMU overflow interrupt can be a PPI or a valid SPI. */
> -		if (!(irq_is_ppi(irq) || irq_is_spi(irq)))
> +		if (!(irq_is_ppi(vcpu->kvm, irq) || irq_is_spi(vcpu->kvm, irq)))
>  			return -EINVAL;
>  
>  		if (!pmu_irq_is_valid(kvm, irq))
> diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
> index 3d1a776b716d7..b12ba99a423e5 100644
> --- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
> +++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
> @@ -639,7 +639,7 @@ static int vgic_v3_set_attr(struct kvm_device *dev,
>  		if (vgic_initialized(dev->kvm))
>  			return -EBUSY;
>  
> -		if (!irq_is_ppi(val))
> +		if (!irq_is_ppi(dev->kvm, val))
>  			return -EINVAL;
>  
>  		dev->kvm->arch.vgic.mi_intid = val;
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index 430aa98888fda..2c0e8803342e2 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -94,7 +94,7 @@ struct vgic_irq *vgic_get_irq(struct kvm *kvm, u32 intid)
>  	}
>  
>  	/* LPIs */
> -	if (intid >= VGIC_MIN_LPI)
> +	if (irq_is_lpi(kvm, intid))
>  		return vgic_get_lpi(kvm, intid);
>  
>  	return NULL;
> @@ -123,7 +123,7 @@ static void vgic_release_lpi_locked(struct vgic_dist *dist, struct vgic_irq *irq
>  
>  static __must_check bool __vgic_put_irq(struct kvm *kvm, struct vgic_irq *irq)
>  {
> -	if (irq->intid < VGIC_MIN_LPI)
> +	if (!irq_is_lpi(kvm, irq->intid))
>  		return false;
>  
>  	return refcount_dec_and_test(&irq->refcount);
> @@ -148,7 +148,7 @@ void vgic_put_irq(struct kvm *kvm, struct vgic_irq *irq)
>  	 * Acquire/release it early on lockdep kernels to make locking issues
>  	 * in rare release paths a bit more obvious.
>  	 */
> -	if (IS_ENABLED(CONFIG_LOCKDEP) && irq->intid >= VGIC_MIN_LPI) {
> +	if (IS_ENABLED(CONFIG_LOCKDEP) && irq_is_lpi(kvm, irq->intid)) {
>  		guard(spinlock_irqsave)(&dist->lpi_xa.xa_lock);
>  	}
>  
> @@ -186,7 +186,7 @@ void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu)
>  	raw_spin_lock_irqsave(&vgic_cpu->ap_list_lock, flags);
>  
>  	list_for_each_entry_safe(irq, tmp, &vgic_cpu->ap_list_head, ap_list) {
> -		if (irq->intid >= VGIC_MIN_LPI) {
> +		if (irq_is_lpi(vcpu->kvm, irq->intid)) {
>  			raw_spin_lock(&irq->irq_lock);
>  			list_del(&irq->ap_list);
>  			irq->vcpu = NULL;
> @@ -521,12 +521,12 @@ int kvm_vgic_inject_irq(struct kvm *kvm, struct kvm_vcpu *vcpu,
>  	if (ret)
>  		return ret;
>  
> -	if (!vcpu && intid < VGIC_NR_PRIVATE_IRQS)
> +	if (!vcpu && irq_is_private(kvm, intid))
>  		return -EINVAL;
>  
>  	trace_vgic_update_irq_pending(vcpu ? vcpu->vcpu_idx : 0, intid, level);
>  
> -	if (intid < VGIC_NR_PRIVATE_IRQS)
> +	if (irq_is_private(kvm, intid))
>  		irq = vgic_get_vcpu_irq(vcpu, intid);
>  	else
>  		irq = vgic_get_irq(kvm, intid);
> @@ -685,7 +685,7 @@ int kvm_vgic_set_owner(struct kvm_vcpu *vcpu, unsigned int intid, void *owner)
>  		return -EAGAIN;
>  
>  	/* SGIs and LPIs cannot be wired up to any device */
> -	if (!irq_is_ppi(intid) && !vgic_valid_spi(vcpu->kvm, intid))
> +	if (!irq_is_ppi(vcpu->kvm, intid) && !vgic_valid_spi(vcpu->kvm, intid))
>  		return -EINVAL;
>  
>  	irq = vgic_get_vcpu_irq(vcpu, intid);
> diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
> index b261fb3968d03..6778f676eaf08 100644
> --- a/include/kvm/arm_vgic.h
> +++ b/include/kvm/arm_vgic.h
> @@ -19,6 +19,7 @@
>  #include <linux/jump_label.h>
>  
>  #include <linux/irqchip/arm-gic-v4.h>
> +#include <linux/irqchip/arm-gic-v5.h>
>  
>  #define VGIC_V3_MAX_CPUS	512
>  #define VGIC_V2_MAX_CPUS	8
> @@ -31,9 +32,78 @@
>  #define VGIC_MIN_LPI		8192
>  #define KVM_IRQCHIP_NUM_PINS	(1020 - 32)
>  
> -#define irq_is_ppi(irq) ((irq) >= VGIC_NR_SGIS && (irq) < VGIC_NR_PRIVATE_IRQS)
> -#define irq_is_spi(irq) ((irq) >= VGIC_NR_PRIVATE_IRQS && \
> -			 (irq) <= VGIC_MAX_SPI)
> +#define is_v5_type(t, i)	(FIELD_GET(GICV5_HWIRQ_TYPE, (i)) == (t))
> +
> +#define __irq_is_sgi(t, i)						\
> +	({								\
> +		bool __ret;						\
> +									\
> +		switch (t) {						\
> +		case KVM_DEV_TYPE_ARM_VGIC_V5:				\
> +			__ret = false;					\
> +			break;						\
> +		default:						\
> +			__ret  = (i) < VGIC_NR_SGIS;			\
> +		}							\
> +									\
> +		__ret;							\
> +	})
> +
> +#define __irq_is_ppi(t, i)						\
> +	({								\
> +		bool __ret;						\
> +									\
> +		switch (t) {						\
> +		case KVM_DEV_TYPE_ARM_VGIC_V5:				\
> +			__ret = is_v5_type(GICV5_HWIRQ_TYPE_PPI, (i));	\
> +			break;						\
> +		default:						\
> +			__ret  = (i) >= VGIC_NR_SGIS;			\
> +			__ret &= (i) < VGIC_NR_PRIVATE_IRQS;		\
> +		}							\
> +									\
> +		__ret;							\
> +	})
> +
> +#define __irq_is_spi(t, i)						\
> +	({								\
> +		bool __ret;						\
> +									\
> +		switch (t) {						\
> +		case KVM_DEV_TYPE_ARM_VGIC_V5:				\
> +			__ret = is_v5_type(GICV5_HWIRQ_TYPE_SPI, (i));	\
> +			break;						\
> +		default:						\
> +			__ret  = (i) <= VGIC_MAX_SPI;			\
> +			__ret &= (i) >= VGIC_NR_PRIVATE_IRQS;		\
> +		}							\
> +									\
> +		__ret;							\
> +	})
> +
> +#define __irq_is_lpi(t, i)						\
> +	({								\
> +		bool __ret;						\
> +									\
> +		switch (t) {						\
> +		case KVM_DEV_TYPE_ARM_VGIC_V5:				\
> +			__ret = is_v5_type(GICV5_HWIRQ_TYPE_LPI, (i));	\
> +			break;						\
> +		default:						\
> +			__ret  = (i) >= 8192;				\
> +		}							\
> +									\
> +		__ret;							\
> +	})
> +
> +#define irq_is_sgi(k, i) __irq_is_sgi((k)->arch.vgic.vgic_model, i)
> +#define irq_is_ppi(k, i) __irq_is_ppi((k)->arch.vgic.vgic_model, i)
> +#define irq_is_spi(k, i) __irq_is_spi((k)->arch.vgic.vgic_model, i)
> +#define irq_is_lpi(k, i) __irq_is_lpi((k)->arch.vgic.vgic_model, i)
> +
> +#define irq_is_private(k, i) (irq_is_ppi(k, i) || irq_is_sgi(k, i))
> +
> +#define vgic_is_v5(k) ((k)->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V5)
>  
>  enum vgic_type {
>  	VGIC_V2,		/* Good ol' GICv2 */
> @@ -418,8 +488,12 @@ u64 vgic_v3_get_misr(struct kvm_vcpu *vcpu);
>  
>  #define irqchip_in_kernel(k)	(!!((k)->arch.vgic.in_kernel))
>  #define vgic_initialized(k)	((k)->arch.vgic.initialized)
> -#define vgic_valid_spi(k, i)	(((i) >= VGIC_NR_PRIVATE_IRQS) && \
> +#define vgic_valid_nv5_spi(k, i)	(((i) >= VGIC_NR_PRIVATE_IRQS) && \
>  			((i) < (k)->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS))
> +#define vgic_valid_v5_spi(k, i)	(irq_is_spi(k, i) && \
> +				 (FIELD_GET(GICV5_HWIRQ_ID, i) < (k)->arch.vgic.nr_spis))
> +#define vgic_valid_spi(k, i) (vgic_is_v5(k) ?				\
> +			      vgic_valid_v5_spi(k, i) : vgic_valid_nv5_spi(k, i))
>  
>  bool kvm_vcpu_has_pending_irqs(struct kvm_vcpu *vcpu);
>  void kvm_vgic_sync_hwstate(struct kvm_vcpu *vcpu);

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

