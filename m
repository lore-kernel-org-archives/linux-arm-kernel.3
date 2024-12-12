Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFB8E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5ZKk0Wwh72I5+qHQFJrjFIMAClWf3DTZqY1eWQVK8g=; b=CD/jaOWR1ByQnVI/V2N88lcd/L
	RcyUeY90Q3HR6hlK1FKEQWeqVVhtWT3tSb3LAuj386qkiRJTbgfWtoVbUmSt4TDDxTlg/qzfJC45k
	5mKhV/Go8ia98h+yUehT3G66p91B51oQC/7pi/pZF7FO+d7SWPzVseWI9FLfTBFZpsVI913mmk3CL
	uHdYq9arCv+MSPvOVixQGYyIn8I0of2Nh23McpQbCtbAYKm1DYHlpmZSCsQahgh3/x9nyDc8YiW1j
	eEmNHKgFhvnC9jKViZ4wy36Zm5GX2dpUFpZJMBoodFhYiVSHluVndM0vM4InuD4HGOk3MmO1UpRL/
	mCwoxuuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmrX-000000019oN-40p6;
	Thu, 12 Dec 2024 17:20:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmSf-0000000141D-1zS4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:54:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D6A11762;
	Thu, 12 Dec 2024 08:55:16 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 793573F58B;
	Thu, 12 Dec 2024 08:54:45 -0800 (PST)
Date: Thu, 12 Dec 2024 16:54:40 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v6 32/43] arm64: rme: Enable PMU support with a realm
 guest
Message-ID: <20241212165440.GA1479329@e124191.cambridge.arm.com>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-33-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212155610.76522-33-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_085449_603310_4EFE2DD1 
X-CRM114-Status: GOOD (  29.69  )
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

On Thu, Dec 12, 2024 at 03:55:57PM +0000, Steven Price wrote:
> Use the PMU registers from the RmiRecExit structure to identify when an
> overflow interrupt is due and inject it into the guest. Also hook up the
> configuration option for enabling the PMU within the guest.
> 
> When entering a realm guest with a PMU interrupt pending, it is
> necessary to disable the physical interrupt. Otherwise when the RMM
> restores the PMU state the physical interrupt will trigger causing an
> immediate exit back to the host. The guest is expected to acknowledge
> the interrupt causing a host exit (to update the GIC state) which gives
> the opportunity to re-enable the physical interrupt before the next PMU
> event.
> 
> Number of PMU counters is configured by the VMM by writing to PMCR.N.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v2:
>  * Add a macro kvm_pmu_get_irq_level() to avoid compile issues when PMU
>    support is disabled.
> ---
>  arch/arm64/kvm/arm.c      | 11 +++++++++++
>  arch/arm64/kvm/guest.c    |  7 +++++++
>  arch/arm64/kvm/pmu-emul.c |  3 +++
>  arch/arm64/kvm/rme.c      |  8 ++++++++
>  arch/arm64/kvm/sys_regs.c |  2 +-
>  include/kvm/arm_pmu.h     |  4 ++++
>  6 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 6f7f96ab781d..ae3596a25272 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -15,6 +15,7 @@
>  #include <linux/vmalloc.h>
>  #include <linux/fs.h>
>  #include <linux/mman.h>
> +#include <linux/perf/arm_pmu.h>
>  #include <linux/sched.h>
>  #include <linux/kvm.h>
>  #include <linux/kvm_irqfd.h>
> @@ -1209,6 +1210,8 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  	run->exit_reason = KVM_EXIT_UNKNOWN;
>  	run->flags = 0;
>  	while (ret > 0) {
> +		bool pmu_stopped = false;
> +
>  		/*
>  		 * Check conditions before entering the guest
>  		 */
> @@ -1240,6 +1243,11 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  
>  		kvm_pmu_flush_hwstate(vcpu);
>  
> +		if (vcpu_is_rec(vcpu) && kvm_pmu_get_irq_level(vcpu)) {
> +			pmu_stopped = true;
> +			arm_pmu_set_phys_irq(false);
> +		}
> +
>  		local_irq_disable();
>  
>  		kvm_vgic_flush_hwstate(vcpu);
> @@ -1342,6 +1350,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  
>  		preempt_enable();
>  
> +		if (pmu_stopped)
> +			arm_pmu_set_phys_irq(true);
> +
>  		/*
>  		 * The ARMv8 architecture doesn't give the hypervisor
>  		 * a mechanism to prevent a guest from dropping to AArch32 EL0
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 920e0fd73698..b4e3839f6076 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -804,6 +804,8 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  	return kvm_arm_sys_reg_get_reg(vcpu, reg);
>  }
>  
> +#define KVM_REG_ARM_PMCR_EL0		ARM64_SYS_REG(3, 3, 9, 12, 0)

There's already SYS_PMCR_EL0 defined, so it seems this is not needed?

> +
>  /*
>   * The RMI ABI only enables setting some GPRs and PC. The selection of GPRs
>   * that are available depends on the Realm state and the reason for the last
> @@ -818,6 +820,11 @@ static bool validate_realm_set_reg(struct kvm_vcpu *vcpu,
>  		u64 off = core_reg_offset_from_id(reg->id);
>  
>  		return kvm_realm_validate_core_reg(off);
> +	} else {
> +		switch (reg->id) {
> +		case KVM_REG_ARM_PMCR_EL0:
> +			return true;
> +		}
>  	}
>  
>  	return false;
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index 456102bc0b55..5628b573ca41 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -397,6 +397,9 @@ static bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
>  {
>  	u64 reg = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
>  
> +	if (vcpu_is_rec(vcpu))
> +		return vcpu->arch.rec.run->exit.pmu_ovf_status;
> +
>  	reg &= __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
>  
>  	/*
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 27a479feb907..e562e77c1f94 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -303,6 +303,11 @@ static int realm_create_rd(struct kvm *kvm)
>  	params->rtt_base = kvm->arch.mmu.pgd_phys;
>  	params->vmid = realm->vmid;
>  
> +	if (kvm->arch.arm_pmu) {
> +		params->pmu_num_ctrs = kvm->arch.pmcr_n;
> +		params->flags |= RMI_REALM_PARAM_FLAG_PMU;
> +	}
> +
>  	params_phys = virt_to_phys(params);
>  
>  	if (rmi_realm_create(rd_phys, params_phys)) {
> @@ -1370,6 +1375,9 @@ int kvm_create_rec(struct kvm_vcpu *vcpu)
>  	if (!vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2))
>  		return -EINVAL;
>  
> +	if (vcpu->kvm->arch.arm_pmu && !kvm_vcpu_has_pmu(vcpu))
> +		return -EINVAL;
> +
>  	BUILD_BUG_ON(sizeof(*params) > PAGE_SIZE);
>  	BUILD_BUG_ON(sizeof(*rec->run) > PAGE_SIZE);
>  
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 83c6b4a07ef5..a4713609e230 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1324,7 +1324,7 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
>  	 * implements. Ignore this error to maintain compatibility
>  	 * with the existing KVM behavior.
>  	 */
> -	if (!kvm_vm_has_ran_once(kvm) &&
> +	if (!kvm_vm_has_ran_once(kvm) && !kvm_realm_is_created(kvm) &&
>  	    new_n <= kvm_arm_pmu_get_max_counters(kvm))
>  		kvm->arch.pmcr_n = new_n;
>  
> diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
> index e61dd7dd2286..30625a6fd143 100644
> --- a/include/kvm/arm_pmu.h
> +++ b/include/kvm/arm_pmu.h
> @@ -77,6 +77,8 @@ void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
>  void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
>  void kvm_vcpu_pmu_resync_el0(void);
>  
> +#define kvm_pmu_get_irq_level(vcpu) ((vcpu)->arch.pmu.irq_level)
> +
>  #define kvm_vcpu_has_pmu(vcpu)					\
>  	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
>  
> @@ -164,6 +166,8 @@ static inline u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
>  	return 0;
>  }
>  
> +#define kvm_pmu_get_irq_level(vcpu) (false)
> +
>  #define kvm_vcpu_has_pmu(vcpu)		({ false; })
>  static inline void kvm_pmu_update_vcpu_events(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu) {}

Thanks,
Joey

