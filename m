Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C1BD2D0E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 12:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilF2ZOrLLtpoOD0QRTJYX0kwYoZy8XYNtU6FcWKd3Ck=; b=wf8ityLxHjq7QqH8a4UfplHWZO
	9f3OaVuC8YjgmBam9oKgz5yArlcaDD9a/NcEk1tD6pL0LApCNmmKWnMkFR/SWc1n9AIKM+PzzZ9zO
	Gn2O1Btarq17wxHucOFnmZgOiZTYpMbcTG83msvKqPD6bcCICbcQWnV8X9KNw8tNz2u7TSt7am7pP
	uLsen0vObVq1FiPSKBTa327QE0TU+2MQKCEfNqO52jfHfmlY/q3A1ETJYMDCH8bXOAJbYAeo2Ked3
	krlZPb8foF80OO5vHQ4yc5+Jdz8pjhkOZqzYQ0CTGFKJkLYKCtwYM0yQWmhUUGi+FjA/PHftOBQuF
	9jgvM/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdEw-000000073VP-2EVv;
	Tue, 13 Jan 2026 12:11:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdEt-000000073Uo-3sfP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 12:11:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B2AD497;
	Tue, 13 Jan 2026 04:11:01 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5956B3F59E;
	Tue, 13 Jan 2026 04:11:06 -0800 (PST)
Date: Tue, 13 Jan 2026 12:11:00 +0000
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
	Timothy Hayes <Timothy.Hayes@arm.com>,
	"jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v3 27/36] KVM: arm64: gic-v5: Mandate architected PPI for
 PMU emulation on GICv5
Message-ID: <20260113121100.GA801634@e124191.cambridge.arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
 <20260109170400.1585048-28-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109170400.1585048-28-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_041112_042050_DF120315 
X-CRM114-Status: GOOD (  26.28  )
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

On Fri, Jan 09, 2026 at 05:04:47PM +0000, Sascha Bischoff wrote:
> Make it mandatory to use the architected PPI when running a GICv5
> guest. Attempts to set anything other than the architected PPI (23)
> are rejected.
> 
> Additionally, KVM_ARM_VCPU_PMU_V3_INIT is relaxed to no longer require
> KVM_ARM_VCPU_PMU_V3_IRQ to be called for GICv5-based guests. In this
> case, the architectued PPI is automatically used.
> 
> Documentation is bumped accordingly.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  Documentation/virt/kvm/devices/vcpu.rst |  5 +++--
>  arch/arm64/kvm/pmu-emul.c               | 13 +++++++++++--
>  include/kvm/arm_pmu.h                   |  5 ++++-
>  3 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
> index 60bf205cb3730..5e38058200105 100644
> --- a/Documentation/virt/kvm/devices/vcpu.rst
> +++ b/Documentation/virt/kvm/devices/vcpu.rst
> @@ -37,7 +37,8 @@ Returns:
>  A value describing the PMUv3 (Performance Monitor Unit v3) overflow interrupt
>  number for this vcpu. This interrupt could be a PPI or SPI, but the interrupt
>  type must be same for each vcpu. As a PPI, the interrupt number is the same for
> -all vcpus, while as an SPI it must be a separate number per vcpu.
> +all vcpus, while as an SPI it must be a separate number per vcpu. For
> +GICv5-based guests, the architected PPI (23) must be used.
>  
>  1.2 ATTRIBUTE: KVM_ARM_VCPU_PMU_V3_INIT
>  ---------------------------------------
> @@ -50,7 +51,7 @@ Returns:
>  	 -EEXIST  Interrupt number already used
>  	 -ENODEV  PMUv3 not supported or GIC not initialized
>  	 -ENXIO   PMUv3 not supported, missing VCPU feature or interrupt
> -		  number not set
> +		  number not set (non-GICv5 guests, only)
>  	 -EBUSY   PMUv3 already initialized
>  	 =======  ======================================================
>  
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index afc838ea2503e..ba7f22b636040 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -962,8 +962,13 @@ static int kvm_arm_pmu_v3_init(struct kvm_vcpu *vcpu)
>  		if (!vgic_initialized(vcpu->kvm))
>  			return -ENODEV;
>  
> -		if (!kvm_arm_pmu_irq_initialized(vcpu))
> -			return -ENXIO;
> +		if (!kvm_arm_pmu_irq_initialized(vcpu)) {
> +			if (!vgic_is_v5(vcpu->kvm))
> +				return -ENXIO;
> +
> +			/* Use the architected irq number for GICv5. */
> +			vcpu->arch.pmu.irq_num = KVM_ARMV8_PMU_GICV5_IRQ;
> +		}
>  
>  		ret = kvm_vgic_set_owner(vcpu, vcpu->arch.pmu.irq_num,
>  					 &vcpu->arch.pmu);
> @@ -988,6 +993,10 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int irq)
>  	unsigned long i;
>  	struct kvm_vcpu *vcpu;
>  
> +	/* On GICv5, the PMUIRQ is architecturally mandated to be PPI 23 */
> +	if (vgic_is_v5(kvm) && irq != KVM_ARMV8_PMU_GICV5_IRQ)
> +		return false;
> +
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
>  		if (!kvm_arm_pmu_irq_initialized(vcpu))
>  			continue;
> diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
> index 96754b51b4116..0a36a3d5c8944 100644
> --- a/include/kvm/arm_pmu.h
> +++ b/include/kvm/arm_pmu.h
> @@ -12,6 +12,9 @@
>  
>  #define KVM_ARMV8_PMU_MAX_COUNTERS	32
>  
> +/* PPI #23 - architecturally specified for GICv5 */
> +#define KVM_ARMV8_PMU_GICV5_IRQ		0x20000017
> +
>  #if IS_ENABLED(CONFIG_HW_PERF_EVENTS) && IS_ENABLED(CONFIG_KVM)
>  struct kvm_pmc {
>  	u8 idx;	/* index into the pmu->pmc array */
> @@ -38,7 +41,7 @@ struct arm_pmu_entry {
>  };
>  
>  bool kvm_supports_guest_pmuv3(void);
> -#define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
> +#define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num != 0)
>  u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
>  void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
>  void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
> -- 
> 2.34.1

