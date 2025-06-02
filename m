Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8834C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 22:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyAngPhIQbmFxpOkTVU6v6SdO9Gi9CMJI3HF9w1IXag=; b=gVLIT3TgXH9uMkUnsld1c13v8O
	kHLKiNfsWSMV2IqMCVgEm8Dc4hcVpE3vrnKsmNkhnabj0La69J2iOw8I0ILKOtJFsoE6yfN4MEAa+
	yrxB55WAZyWC30syEqxXJM/+jeQgkCrOzC1A8KESxPqm3alIIcEvEdp9UqCdyvoXVVAfGUAyUwUTL
	7+SAz9ehysuIgt0NQxK6zo1wuxXFdsXNpLz078B+WkuAajDIv34ULv8dcipY+I6yEuUKpAH1N0pdN
	bkqBpkPWue+0WKf9BMdi4mDQdGYH2k03qQi//EU7Le77R3TMWOxxQGeG1L3u5gEcPcooxQnYGb3k3
	N+Ekwk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDgP-00000009Dbr-2WXq;
	Mon, 02 Jun 2025 22:31:05 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDeB-00000009DGa-1qO0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 22:28:48 +0000
Date: Mon, 2 Jun 2025 15:28:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748903323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JyAngPhIQbmFxpOkTVU6v6SdO9Gi9CMJI3HF9w1IXag=;
	b=dLkDnC/krH+92XTW3f77z4XEc02c1hJe+EH6+S9Z68FVr0z1NxsEAVDVlaC67uXYBNARf5
	tCEutPsJK9/pSDzJbkCAypP2Z3TdXW7P4ubIClxG9UPWTzvQZlOid6b344V0BZ0Uk0J01N
	GU5QSzmYCVMCnAdtrS7dnQRq/qWpdrU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 06/17] KVM: arm64: Introduce method to partition the PMU
Message-ID: <aD4llDZwb_sC_Ptj@linux.dev>
References: <20250602192702.2125115-1-coltonlewis@google.com>
 <20250602192702.2125115-7-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602192702.2125115-7-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_152847_690862_F38087FF 
X-CRM114-Status: GOOD (  22.79  )
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

On Mon, Jun 02, 2025 at 07:26:51PM +0000, Colton Lewis wrote:
>  static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
>  {
> +	u8 hpmn = vcpu->kvm->arch.arm_pmu->hpmn;
> +
>  	preempt_disable();
>  
>  	/*
>  	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
>  	 * to disable guest access to the profiling and trace buffers
>  	 */
> -	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
> -					 *host_data_ptr(nr_event_counters));
> -	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
> +	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, hpmn);
> +	vcpu->arch.mdcr_el2 |= (MDCR_EL2_HPMD |
> +				MDCR_EL2_TPM |

This isn't safe, as there's no guarantee that kvm_arch::arm_pmu is
pointing that the PMU for this CPU. KVM needs to derive HPMN from some
per-CPU state, not anything tied to the VM/vCPU.

> +/**
> + * kvm_pmu_partition() - Partition the PMU
> + * @pmu: Pointer to pmu being partitioned
> + * @host_counters: Number of host counters to reserve
> + *
> + * Partition the given PMU by taking a number of host counters to
> + * reserve and, if it is a valid reservation, recording the
> + * corresponding HPMN value in the hpmn field of the PMU and clearing
> + * the guest-reserved counters from the counter mask.
> + *
> + * Passing 0 for @host_counters has the effect of disabling partitioning.
> + *
> + * Return: 0 on success, -ERROR otherwise
> + */
> +int kvm_pmu_partition(struct arm_pmu *pmu, u8 host_counters)
> +{
> +	u8 nr_counters;
> +	u8 hpmn;
> +
> +	if (!kvm_pmu_reservation_is_valid(host_counters))
> +		return -EINVAL;
> +
> +	nr_counters = *host_data_ptr(nr_event_counters);
> +	hpmn = kvm_pmu_hpmn(host_counters);
> +
> +	if (hpmn < nr_counters) {
> +		pmu->hpmn = hpmn;
> +		/* Inform host driver of available counters */
> +		bitmap_clear(pmu->cntr_mask, 0, hpmn);
> +		bitmap_set(pmu->cntr_mask, hpmn, nr_counters);
> +		clear_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
> +		if (pmuv3_has_icntr())
> +			clear_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
> +
> +		kvm_debug("Partitioned PMU with HPMN %u", hpmn);
> +	} else {
> +		pmu->hpmn = nr_counters;
> +		bitmap_set(pmu->cntr_mask, 0, nr_counters);
> +		set_bit(ARMV8_PMU_CYCLE_IDX, pmu->cntr_mask);
> +		if (pmuv3_has_icntr())
> +			set_bit(ARMV8_PMU_INSTR_IDX, pmu->cntr_mask);
> +
> +		kvm_debug("Unpartitioned PMU");
> +	}
> +
> +	return 0;
> +}

Hmm... Just in terms of code organization I'm not sure I like having KVM
twiddling with *host* support for PMUv3. Feels like the ARM PMU driver
should own partitioning and KVM just takes what it can get.

> @@ -239,6 +245,13 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
>  	if (!pmuv3_implemented(kvm_arm_pmu_get_pmuver_limit()))
>  		return;
>  
> +	if (reserved_host_counters) {
> +		if (kvm_pmu_partition_supported())
> +			WARN_ON(kvm_pmu_partition(pmu, reserved_host_counters));
> +		else
> +			kvm_err("PMU Partition is not supported");
> +	}
> +

Hasn't the ARM PMU been registered with perf at this point? Surely the
driver wouldn't be very pleased with us ripping counters out from under
its feet.

Thanks,
Oliver

