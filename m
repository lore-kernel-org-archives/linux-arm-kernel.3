Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4207CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCEIFZWCMkwJMWbVqlDWyZlTIMgi6fNyMxoZ4+ugv34=; b=C4IHSaM7NGGo8IiCBYeHi8ZK4W
	QNCWQULd84tgwsuxfYAd6hMu3/Sjn+F1s8A43W6maxd8Mg5UKfZvfoxdsyMjN4fEo1T5BpIhXHN3i
	mn35Q/3VnZHHep8C6idzIW+LNDSx3K1Na5YVHnWL8D5yAugJQZCufxTc6Av8cHI6PZzoa3p9dfeaA
	ATfb/O7ZRtu2LpeobEvjkjor01hAeMlJIlNyxuJ1kY3c5bVki5czIpqTb2ZZLBzM7fM7z/ojd7Xm6
	69ovuE1FwGi4Y3fbMARBLGflqg/UHkiFrQNNPPNzUQh6aZwFcXxPkncLgtrTwmlv1kITZJbuk/X8p
	ExZK6kJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5jK-00000001t6b-1M3u;
	Wed, 13 May 2026 09:18:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5jH-00000001t5x-0naH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:18:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CA2E43F44;
	Wed, 13 May 2026 09:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA97C2BCB7;
	Wed, 13 May 2026 09:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778663888;
	bh=tK30HCaThkEdQqkifcwhGwd2vRsand6ahOgGAzNGZsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E32QtEsJ0lDRBSHnWJPUJHAeQ/WB4fwv2ObrZbpQs6suTi2LH2OvMZAvetLDjeT8Y
	 uI+UqkwPnQlmCI51uG8zoJdreaUqda5hR2v6tMtUhlX8dPKF3+QmuMq5afa8vWScXv
	 PHwrZ85CYCJTY363j7w5o5d4TPEqeLDs7YoLsoV0lwIiwS7TvuGo0r99p4iC8c2pH9
	 c3s0xhCNDco03N7MGmRnY0/NpC0PXPtxfGjvDVE0qK2O6uNCsqBh+sO1x6OzT0IMTe
	 y7kFrwgRKtDlOHW1w/s81n9+Ry8lLR2nmu8mc2PK1yEuogWAXtcQP79SgvnT1Q0Qel
	 riO6VF9SH9ZUQ==
Date: Wed, 13 May 2026 02:18:06 -0700
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
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
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 10/20] KVM: arm64: Context swap Partitioned PMU guest
 registers
Message-ID: <agRBzkVcR-qZZdx2@kernel.org>
References: <20260504211813.1804997-1-coltonlewis@google.com>
 <20260504211813.1804997-11-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504211813.1804997-11-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_021811_270474_6D9D9E33 
X-CRM114-Status: GOOD (  17.68  )
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

On Mon, May 04, 2026 at 09:18:03PM +0000, Colton Lewis wrote:
> +
> +/**
> + * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Compute the bitmask that selects the host-reserved counters in the
> + * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
> + * in HPMN..N
> + *
> + * Return: Bitmask
> + */
> +u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
> +{
> +	u8 nr_counters = *host_data_ptr(nr_event_counters);
> +
> +	if (kvm_pmu_is_partitioned(pmu))
> +		return GENMASK(nr_counters - 1, pmu->max_guest_counters);
> +
> +	return ARMV8_PMU_CNT_MASK_ALL;
> +}
> +
> +/**
> + * kvm_pmu_guest_counter_mask() - Compute bitmask of guest-reserved counters
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Compute the bitmask that selects the guest-reserved counters in the
> + * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
> + * in 0..HPMN and the cycle and instruction counters.
> + *
> + * Return: Bitmask
> + */
> +u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
> +{
> +	if (kvm_pmu_is_partitioned(pmu))
> +		return ARMV8_PMU_CNT_MASK_C | GENMASK(pmu->max_guest_counters - 1, 0);
> +
> +	return 0;
> +}
> +
> +/**
> + * kvm_pmu_load() - Load untrapped PMU registers
> + * @vcpu: Pointer to struct kvm_vcpu
> + *
> + * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
> + * to only bits belonging to guest-reserved counters and leave
> + * host-reserved counters alone in bitmask registers.
> + */
> +void kvm_pmu_load(struct kvm_vcpu *vcpu)
> +{
> +	struct arm_pmu *pmu;
> +	unsigned long guest_counters;
> +	u64 mask;
> +	u8 i;
> +	u64 val;
> +
> +	/*
> +	 * If we aren't guest-owned then we know the guest isn't using
> +	 * the PMU anyway, so no need to bother with the swap.
> +	 */
> +	if (!kvm_vcpu_pmu_is_partitioned(vcpu))
> +		return;
> +
> +	preempt_disable();
> +
> +	pmu = vcpu->kvm->arch.arm_pmu;
> +	guest_counters = kvm_pmu_guest_counter_mask(pmu);
> +
> +	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
> +		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
> +
> +		if (i == ARMV8_PMU_CYCLE_IDX) {
> +			write_sysreg(val, pmccntr_el0);
> +		} else {
> +			write_sysreg(i, pmselr_el0);
> +			write_sysreg(val, pmxevcntr_el0);

This is wrong, you would need an intervening ISB. It'd be better to
avoid the ISB altogether and just use {read,write}_pmevcntrn().

Thanks,
Oliver

