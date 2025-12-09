Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319A9D3B7F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 21:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uX+H894nYTB0x938G90GSxqvruR3fBiHLpMtElO/XTA=; b=exwF7pMVX0VqVzzbzQr84Az3r0
	K+JucgeuB5sBtfs8JJB6bmzfThTThRqcyO9aU9fu2UZyk3v8kEUk9+efFfeB9bplhG5AmcBzp8WVt
	mzAGNUXSYpzJuZS5hgpsypQ6YpKGieP1mkb4WQhVR/vZVoMDWbMFaNa8PzQStuhL6jhkBVBBCRGhT
	kjWMtri0la8Yrc5Kv6l3oXijPnLN9PPmHgrERJFs0CxW+XHO46H3jJK3LBqDWRQJU7u4kYrRg7AFS
	5T8rClRQvYAusLrahv/HDBXRzSY2kMLY/rGZi3zkQDHq7a92c0Vr1k8WGPLUhsgUiRvBZf8lZQbwt
	Nq9wVmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4wT-0000000Eo2y-1CnS;
	Tue, 09 Dec 2025 21:08:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4wS-0000000Eo2r-2wAX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 21:08:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 335D16015A;
	Tue,  9 Dec 2025 21:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4EFC4CEF5;
	Tue,  9 Dec 2025 21:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765314494;
	bh=DqNP2ZCx6Exn3ynjV4hjZkY7WNN/Z9M7pZg9j1AEmV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcJKGa4grfV5rmRdbJ+05xu9XobUVOs1q4rjQGrhAuF8dsjIA8V9sGSMWRvhme6G9
	 OW7OVrhB2fcwSa0S9f0BuIls+G6fdtmpHcKWKfZa0UGWnfKEmsEHy0GK65Oj14m9sC
	 2E06h09rOq/PcVLYyqKW2HfrbrmcPb3RGIiQYMuaSu3QGCZeqptcs17Gz4HHB9l2aF
	 DVLsN05fDKG82bKLjUcHB80RL9LrbqtHv57rwD+z5m/b1Vttnipx3edbA/lCJvYgwR
	 RD5RUzbB5cNbXsCQItAe5ghU7v+Lgw7tWY62G/ppYqffIy/ddaXpeWpC0YAT90VrIo
	 jSMG9q7P1DnzQ==
Date: Tue, 9 Dec 2025 13:08:13 -0800
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 10/24] KVM: arm64: Set up FGT for Partitioned PMU
Message-ID: <aTiPvS49uMOJEBrf@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-11-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-11-coltonlewis@google.com>
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

Hi Colton,

On Tue, Dec 09, 2025 at 08:51:07PM +0000, Colton Lewis wrote:
> In order to gain the best performance benefit from partitioning the
> PMU, utilize fine grain traps (FEAT_FGT and FEAT_FGT2) to avoid
> trapping common PMU register accesses by the guest to remove that
> overhead.
> 
> Untrapped:
> * PMCR_EL0
> * PMUSERENR_EL0
> * PMSELR_EL0
> * PMCCNTR_EL0
> * PMCNTEN_EL0
> * PMINTEN_EL1
> * PMEVCNTRn_EL0
> 
> These are safe to untrap because writing MDCR_EL2.HPMN as this series
> will do limits the effect of writes to any of these registers to the
> partition of counters 0..HPMN-1. Reads from these registers will not
> leak information from between guests as all these registers are
> context swapped by a later patch in this series. Reads from these
> registers also do not leak any information about the host's hardware
> beyond what is promised by PMUv3.
> 
> Trapped:
> * PMOVS_EL0
> * PMEVTYPERn_EL0
> * PMCCFILTR_EL0
> * PMICNTR_EL0
> * PMICFILTR_EL0
> * PMCEIDn_EL0
> * PMMIR_EL1
> 
> PMOVS remains trapped so KVM can track overflow IRQs that will need to
> be injected into the guest.
> 
> PMICNTR and PMIFILTR remain trapped because KVM is not handling them
> yet.
> 
> PMEVTYPERn remains trapped so KVM can limit which events guests can
> count, such as disallowing counting at EL2. PMCCFILTR and PMCIFILTR
> are special cases of the same.
> 
> PMCEIDn and PMMIR remain trapped because they can leak information
> specific to the host hardware implementation.
> 
> NOTE: This patch temporarily forces kvm_vcpu_pmu_is_partitioned() to
> be false to prevent partial feature activation for easier debugging.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm64/include/asm/kvm_pmu.h | 33 ++++++++++++++++++++++
>  arch/arm64/kvm/config.c          | 34 ++++++++++++++++++++--
>  arch/arm64/kvm/pmu-direct.c      | 48 ++++++++++++++++++++++++++++++++
>  3 files changed, 112 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
> index 8887f39c25e60..7297a697a4a62 100644
> --- a/arch/arm64/include/asm/kvm_pmu.h
> +++ b/arch/arm64/include/asm/kvm_pmu.h
> @@ -96,6 +96,23 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
>  void kvm_pmu_host_counters_enable(void);
>  void kvm_pmu_host_counters_disable(void);
>  
> +#if !defined(__KVM_NVHE_HYPERVISOR__)
> +bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
> +bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
> +#else
> +static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
> +{
> +	return false;
> +}
> +
> +static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
> +{
> +	return false;
> +}
> +#endif
> +u64 kvm_pmu_fgt_bits(void);
> +u64 kvm_pmu_fgt2_bits(void);
> +
>  /*
>   * Updates the vcpu's view of the pmu events for this cpu.
>   * Must be called before every vcpu run after disabling interrupts, to ensure
> @@ -135,6 +152,22 @@ static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
>  {
>  	return 0;
>  }
> +static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
> +{
> +	return false;
> +}
> +static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
> +{
> +	return false;
> +}
> +static inline u64 kvm_pmu_fgt_bits(void)
> +{
> +	return 0;
> +}
> +static inline u64 kvm_pmu_fgt2_bits(void)
> +{
> +	return 0;
> +}
>  static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
>  					     u64 select_idx, u64 val) {}
>  static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 24bb3f36e9d59..064dc6aa06f76 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/kvm_host.h>
>  #include <asm/kvm_emulate.h>
> +#include <asm/kvm_pmu.h>
>  #include <asm/kvm_nested.h>
>  #include <asm/sysreg.h>
>  
> @@ -1489,12 +1490,39 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
>  		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
>  }
>  
> +static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
> +{
> +	__compute_fgt(vcpu, HDFGRTR_EL2);
> +
> +	if (kvm_vcpu_pmu_use_fgt(vcpu))
> +		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= kvm_pmu_fgt_bits();

Couple of suggestions. I'd rather see this conditioned on
kvm_vcpu_pmu_is_partitioned() and get rid of the FGT predicate. After
all, kvm_vcpu_load_fgt() already checks for the presence of FEAT_FGT
first.

Additionally, I'd prefer that the trap configuration is inline instead
of done in a helper in some other file. Centralizing the FGT
configuration here was very much intentional.

The other reason for doing this is kvm_pmu_fgt_bits() assumes a
'positive' trap polarity, even though there are several cases where FGTs
have a 'negative' priority (i.e. 0 => trap).

Thanks,
Oliver

