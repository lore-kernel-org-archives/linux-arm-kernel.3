Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166E4D3B9A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 21:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3xx04ZxpKti3223noQiLvgLbyCe2bDZ7ycjsyVEY40=; b=fUm5nNjqGQa0pohxV5Z2TsjnOq
	QNy72y3AVoSnAjiVvpogmicrPeuL9DZbQwIykIKWyw9H+5teZ4M4gLNrhIlC8Hh/bq+202KKkdnK2
	+6Qd8QE+nt4Zno2Amz4JzrBPLx0EpW1adq/vyIfgLxcxWcJU5GDcx0NRgTC+y9YGUGXPGaEpWByxd
	uC7Fe+k6AcDJEXnpSa5Ruyjok7qbF38fJhvaEP/YwboqlKjIKnfFLlSmhHL2GX2nzLJYOGAMsd9b+
	Wcba2p03P0q2MphQZpZR0VS9gkvJWjeda+cVU79evNeFT1dGEhuEMXurYG0BCTNa1yXtGLjz6xbBV
	2nQgDxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT5gi-0000000Eq6p-1DCw;
	Tue, 09 Dec 2025 21:56:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT5gg-0000000Eq6j-0pDC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 21:56:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D0DA6017B;
	Tue,  9 Dec 2025 21:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F660C4CEF5;
	Tue,  9 Dec 2025 21:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765317360;
	bh=YWdg18cjyZlaQzsCfCOFgUy7Fvj4xZJkrt8yESfMLOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZuFFE37H9sfww/rNV+snhfh4JmK/7dF1PrqhKsKmfprhpKmSUuWmK+vqt3vTGUbZp
	 yVQBwmoZ6Qt4oz5/SDsze5y9RfpYvXIHOZ2H3iv1BpUSvAZkAEY5ZjCsyxvd6tHHEV
	 3pHZWHvz32XelRvYnWPct9Yr1YhvVGblc9mjM7cV7HpkVgDQi3b2saQhOB7m/lTT/u
	 um+QK9IV6GwXfroEsB55yXddyo666Q+lBhg0NGm4EJS7384iBOY2/zedhqB8+9m8Vf
	 r7EqUwXlDaeoT1TerxaJeL0HkJBDVYsbGKf8SpWgLD8w9yiG0hqBkK4kZz/shq7avc
	 fFy4eg8BDIrSQ==
Date: Tue, 9 Dec 2025 13:55:59 -0800
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
Subject: Re: [PATCH v5 17/24] KVM: arm64: Context swap Partitioned PMU guest
 registers
Message-ID: <aTia74R74upcsMEA@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-18-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-18-coltonlewis@google.com>
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

On Tue, Dec 09, 2025 at 08:51:14PM +0000, Colton Lewis wrote:
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
> +	u64 mask;
> +	u8 i;
> +	u64 val;
> +

Assert that preemption is disabled.

> +	/*
> +	 * If we aren't using FGT then we are trapping everything
> +	 * anyway, so no need to bother with the swap.
> +	 */
> +	if (!kvm_vcpu_pmu_use_fgt(vcpu))
> +		return;

Uhh... Then how do events count in this case?

The absence of FEAT_FGT shouldn't affect the residence of the guest PMU
context. We just need to handle the extra traps, ideally by reading the
PMU registers directly as a fast path exit handler.

> +	pmu = vcpu->kvm->arch.arm_pmu;
> +
> +	for (i = 0; i < pmu->hpmn_max; i++) {
> +		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
> +		write_pmevcntrn(i, val);
> +	}
> +
> +	val = __vcpu_sys_reg(vcpu, PMCCNTR_EL0);
> +	write_pmccntr(val);
> +
> +	val = __vcpu_sys_reg(vcpu, PMUSERENR_EL0);
> +	write_pmuserenr(val);

What about the host's value for PMUSERENR?

> +	val = __vcpu_sys_reg(vcpu, PMSELR_EL0);
> +	write_pmselr(val);

PMSELR_EL0 needs to be switched late, e.g. at sysreg_restore_guest_state_vhe().
Even though the host doesn't currently use the selector-based accessor,
I'd prefer we not load things that'd affect the host context until we're
about to enter the guest.

> +	/* Save only the stateful writable bits. */
> +	val = __vcpu_sys_reg(vcpu, PMCR_EL0);
> +	mask = ARMV8_PMU_PMCR_MASK &
> +		~(ARMV8_PMU_PMCR_P | ARMV8_PMU_PMCR_C);
> +	write_pmcr(val & mask);
> +
> +	/*
> +	 * When handling these:
> +	 * 1. Apply only the bits for guest counters (indicated by mask)
> +	 * 2. Use the different registers for set and clear
> +	 */
> +	mask = kvm_pmu_guest_counter_mask(pmu);
> +
> +	val = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
> +	write_pmcntenset(val & mask);
> +	write_pmcntenclr(~val & mask);
> +
> +	val = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
> +	write_pmintenset(val & mask);
> +	write_pmintenclr(~val & mask);

Is this safe? What happens if we put the PMU into an overflow condition?

> +}
> +
> +/**
> + * kvm_pmu_put() - Put untrapped PMU registers
> + * @vcpu: Pointer to struct kvm_vcpu
> + *
> + * Put all untrapped PMU registers from the VCPU into the PCPU. Mask
> + * to only bits belonging to guest-reserved counters and leave
> + * host-reserved counters alone in bitmask registers.
> + */
> +void kvm_pmu_put(struct kvm_vcpu *vcpu)
> +{
> +	struct arm_pmu *pmu;
> +	u64 mask;
> +	u8 i;
> +	u64 val;
> +
> +	/*
> +	 * If we aren't using FGT then we are trapping everything
> +	 * anyway, so no need to bother with the swap.
> +	 */
> +	if (!kvm_vcpu_pmu_use_fgt(vcpu))
> +		return;
> +
> +	pmu = vcpu->kvm->arch.arm_pmu;
> +
> +	for (i = 0; i < pmu->hpmn_max; i++) {
> +		val = read_pmevcntrn(i);
> +		__vcpu_assign_sys_reg(vcpu, PMEVCNTR0_EL0 + i, val);
> +	}
> +
> +	val = read_pmccntr();
> +	__vcpu_assign_sys_reg(vcpu, PMCCNTR_EL0, val);
> +
> +	val = read_pmuserenr();
> +	__vcpu_assign_sys_reg(vcpu, PMUSERENR_EL0, val);
> +
> +	val = read_pmselr();
> +	__vcpu_assign_sys_reg(vcpu, PMSELR_EL0, val);
> +
> +	val = read_pmcr();
> +	__vcpu_assign_sys_reg(vcpu, PMCR_EL0, val);
> +
> +	/* Mask these to only save the guest relevant bits. */
> +	mask = kvm_pmu_guest_counter_mask(pmu);
> +
> +	val = read_pmcntenset();
> +	__vcpu_assign_sys_reg(vcpu, PMCNTENSET_EL0, val & mask);
> +
> +	val = read_pmintenset();
> +	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);

What if the PMU is in an overflow state at this point?

Thanks,
Oliver

