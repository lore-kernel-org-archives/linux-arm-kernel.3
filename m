Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA889D637DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 00:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdW8TaqZm9Uk8YuulFx/2R4Wls0pc7OAfaibV/UT5wM=; b=cxR2ISqnLRHsVkYJIKk+STodXT
	i26c6haG2dIPwsrgccjK8xNv3/Ye4mLLFBdqz3Q9KHi4wxhu1BfACPyWKArzWoby+K/dnhc0Eqapu
	9JO93qU5LYSqLDf40sx23r6JPLrfKH6zgoXTvfto9AmcN6+mAfVtpG8HfCclfMbPV8idkO6z7E2DU
	3t55LnK+w1TZX/72I/BJReDH5POhExcOD1Glz6gdxFkancPgvWcz/ixAZroMQRkxCMAdmMOXiUgVP
	dmBziWOo540y8kGSNlgGFF9t/OmBJAfuphaxLtFihaS7F9PjYY3SIbbkD+F36vKX9/0Aizt2/1KHE
	Cj/VPcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVfZG-00000005zwL-0ydJ;
	Wed, 17 Dec 2025 00:39:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVfZD-00000005zvy-3YUx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 00:39:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F05354433A;
	Wed, 17 Dec 2025 00:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704D2C4CEF1;
	Wed, 17 Dec 2025 00:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765931938;
	bh=CgBzMRy5n84/JhVTOPnlB/AAjJQet/ZrLpftEd0Ve4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nk2XeqmGc3QP1eIkHBAG3gOL682U+01tvpTpArKsPII4Pu5aHUXUQGtTwGThMNmjC
	 gjvqoKc8X3qH4z1F/cYw9NSfpDyqom2M4LZ8wsF8QUTHU+ZG08r5jzKCjZeZdRiEX4
	 nwpBltVtbgR3QhfJ1HinDq/UwHAdSpFtF29lWuv2oXte8WcBC3d+F+FpBik9QMla82
	 UHE10uDaT5KIW71AUAzhT0BR1HOiMo9I6qZURnDwtC2bGjaTBFsn3vJ6orcfoXgdC6
	 w70+idWQFgUkXOfUHN6PZgWhIcujetZLxOU7R+us1o8SACY32HHgBfuGR9Jp/TCaPn
	 t+Wtc+HcNiyNA==
Date: Tue, 16 Dec 2025 16:38:56 -0800
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
Subject: Re: [PATCH v5 14/24] KVM: arm64: Write fast path PMU register
 handlers
Message-ID: <aUH7oC41XaEMsXf_@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-15-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-15-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_163859_931490_610E752B 
X-CRM114-Status: GOOD (  22.86  )
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

On Tue, Dec 09, 2025 at 08:51:11PM +0000, Colton Lewis wrote:
> diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
> index 3e25c0313263c..41ec6730ebc62 100644
> --- a/arch/arm64/include/asm/arm_pmuv3.h
> +++ b/arch/arm64/include/asm/arm_pmuv3.h
> @@ -39,6 +39,16 @@ static inline unsigned long read_pmevtypern(int n)
>  	return 0;
>  }
>  
> +static inline void write_pmxevcntr(u64 val)
> +{
> +	write_sysreg(val, pmxevcntr_el0);
> +}
> +
> +static inline u64 read_pmxevcntr(void)
> +{
> +	return read_sysreg(pmxevcntr_el0);
> +}
> +
>  static inline unsigned long read_pmmir(void)
>  {
>  	return read_cpuid(PMMIR_EL1);
> @@ -105,21 +115,41 @@ static inline void write_pmcntenset(u64 val)
>  	write_sysreg(val, pmcntenset_el0);
>  }
>  
> +static inline u64 read_pmcntenset(void)
> +{
> +	return read_sysreg(pmcntenset_el0);
> +}
> +
>  static inline void write_pmcntenclr(u64 val)
>  {
>  	write_sysreg(val, pmcntenclr_el0);
>  }
>  
> +static inline u64 read_pmcntenclr(void)
> +{
> +	return read_sysreg(pmcntenclr_el0);
> +}
> +
>  static inline void write_pmintenset(u64 val)
>  {
>  	write_sysreg(val, pmintenset_el1);
>  }
>  
> +static inline u64 read_pmintenset(void)
> +{
> +	return read_sysreg(pmintenset_el1);
> +}
> +
>  static inline void write_pmintenclr(u64 val)
>  {
>  	write_sysreg(val, pmintenclr_el1);
>  }
>  
> +static inline u64 read_pmintenclr(void)
> +{
> +	return read_sysreg(pmintenclr_el1);
> +}
> +
>  static inline void write_pmccfiltr(u64 val)
>  {
>  	write_sysreg(val, pmccfiltr_el0);
> @@ -160,11 +190,16 @@ static inline u64 read_pmovsclr(void)
>  	return read_sysreg(pmovsclr_el0);
>  }
>  
> -static inline void write_pmuserenr(u32 val)
> +static inline void write_pmuserenr(u64 val)
>  {
>  	write_sysreg(val, pmuserenr_el0);
>  }
>  
> +static inline u64 read_pmuserenr(void)
> +{
> +	return read_sysreg(pmuserenr_el0);
> +}
> +
>  static inline void write_pmuacr(u64 val)
>  {
>  	write_sysreg_s(val, SYS_PMUACR_EL1);

I wouldn't bother with adding accessors to the PMUv3 driver header, this
gets a bit confusing when the 32-bit counterpart lacks matching definitions.
Additionally, the part of KVM you're modifying is very much an
"internal" part meant to run in a not-quite-kernel context.

Considering this, I'd prefer KVM directly accessed the PMU registers to
avoid the possibility of taking some instrumented codepath in the
future.

> +	if (!kvm_vcpu_pmu_is_partitioned(vcpu)
> +	    || pmu_access_el0_disabled(vcpu))

Always put operators on the preceding line for line continuations.

Also, don't call pmu_access_el0_disabled() from here. It can potentially
do a full emulated exception entry even though the vCPU is in an
extremely inconsistent state (i.e. haven't returned to kernel context
yet). Isn't the current value for PMUSERENR_EL0 on the CPU instead of in
the vCPU's saved context anyway?

The fast-path accessors really need to be *just* accessors, reading
state from the CPU in the unfortunate situation that a TPM trap has been
forced upon us.

> +	case SYS_PMXEVCNTR_EL0:
> +		idx = FIELD_GET(PMSELR_EL0_SEL, read_pmselr());
> +
> +		if (pmu_access_event_counter_el0_disabled(vcpu))
> +			return false;
> +
> +		if (!pmu_counter_idx_valid(vcpu, idx))
> +			return false;
> +
> +		ret = handle_pmu_reg(vcpu, &p, PMEVCNTR0_EL0 + idx, rt, val,
> +				     &read_pmxevcntr, &write_pmxevcntr);
> +		break;

It is a bit odd to handle the muxing for finding the in-memory value yet
using the selector-based register for hardware.

> +	case SYS_PMEVCNTRn_EL0(0) ... SYS_PMEVCNTRn_EL0(30):
> +		idx = ((p.CRm & 3) << 3) | (p.Op2 & 7);
> +
> +		if (pmu_access_event_counter_el0_disabled(vcpu))
> +			return false;
> +
> +		if (!pmu_counter_idx_valid(vcpu, idx))
> +			return false;
> +
> +		if (p.is_write) {
> +			write_pmevcntrn(idx, val);
> +			__vcpu_assign_sys_reg(vcpu, PMEVCNTR0_EL0 + idx, val);
> +		} else {
> +			vcpu_set_reg(vcpu, rt, read_pmevcntrn(idx));
> +		}
> +
> +		ret = true;
> +		break;

Can't both of these cases share a helper once you've worked out the
index? Same for PMEVTYPERn_EL0.

> +	default:
> +		ret = false;
> +	}
> +
> +	if (ret)
> +		__kvm_skip_instr(vcpu);
> +
> +	return ret;
> +}
> +
>  static inline bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
>  {
>  	if (cpus_have_final_cap(ARM64_WORKAROUND_CAVIUM_TX2_219_TVM) &&
> @@ -785,6 +983,9 @@ static inline bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
>  	if (kvm_handle_cntxct(vcpu))
>  		return true;
>  
> +	if (kvm_hyp_handle_pmu_regs(vcpu))
> +		return true;
> +

Since the whole partitioned PMU feature is constrained to VHE-only you
should call this from kvm_hyp_handle_sysreg_vhe().

> +
> +bool check_pmu_access_disabled(struct kvm_vcpu *vcpu, u64 flags)
> +{
> +	u64 reg = __vcpu_sys_reg(vcpu, PMUSERENR_EL0);
> +	bool enabled = (reg & flags) || vcpu_mode_priv(vcpu);
> +
> +	if (!enabled)
> +		kvm_inject_undefined(vcpu);
> +
> +	return !enabled;
> +}
> +
> +bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu)
> +{
> +	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_EN);
> +}
> +
> +bool pmu_counter_idx_valid(struct kvm_vcpu *vcpu, u64 idx)
> +{
> +	u64 pmcr, val;
> +
> +	pmcr = kvm_vcpu_read_pmcr(vcpu);
> +	val = FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
> +	if (idx >= val && idx != ARMV8_PMU_CYCLE_IDX) {
> +		kvm_inject_undefined(vcpu);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +bool pmu_access_cycle_counter_el0_disabled(struct kvm_vcpu *vcpu)
> +{
> +	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_CR | ARMV8_PMU_USERENR_EN);
> +}
> +
> +bool pmu_access_event_counter_el0_disabled(struct kvm_vcpu *vcpu)
> +{
> +	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_ER | ARMV8_PMU_USERENR_EN);
> +}

Refactorings need to happen in a separate patch.

Thanks,
Oliver

