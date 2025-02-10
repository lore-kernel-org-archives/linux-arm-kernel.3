Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64A9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOcYg4xLzinXROvIPIR5xsQLZpAtozt5q5hAITBaMhs=; b=qzExnU98rwJYQakOeMufJVH3kZ
	5WLGCBOqC6OV/RtcX+Xn+LaZAzcCF4hIouIvYnJFBCRRQrGIHSEEoBImJWTHHax+PrbYrqODOcGzU
	7oDNh3XMqwbhWo5C8orJRZpkVuedxD9jbXztQiJWDT+4HammOAyJ/aqxDOmUgXWMlsTb4kYKXr4Wo
	0CglcV/EwtlStS/US2PAtB0WBhdk1mhvaPe3D0hmfAV4ui4yW1VrGFP2qzgMpvNL/qbOBEf/D1M82
	n/3NoiHa+i6Kls+lrdVO+ZVk/klPdn48Swv6jBUMRcFUThoDFEBMgkCg8w1x4hn9IdTKovB98CXps
	sTP+3RNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thOO4-0000000GXZE-39lM;
	Mon, 10 Feb 2025 07:39:24 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thOMg-0000000GXOX-1EjB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 07:37:59 +0000
Date: Sun, 9 Feb 2025 23:37:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739173074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOcYg4xLzinXROvIPIR5xsQLZpAtozt5q5hAITBaMhs=;
	b=vE+uFLICHjimFS+ICMuI/HAxyfSAu4mZ77bZ828qh8f1L3qfRfmo59IMZeBXvGqrssiFNy
	fCDND8KVpd50CISMkA7uHWCg7qYodaAjGO7IKKFCD9XIxPUn6IH9CRdkFsXbLsLOLX8lhP
	OfDwEiCmz/G8voMwdIN56pm3FuFnd8I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v2 4/4] KVM: arm64: Make guests see only counters
 they can access
Message-ID: <Z6msyUG0HWM2EImQ@linux.dev>
References: <20250208020111.2068239-1-coltonlewis@google.com>
 <20250208020111.2068239-5-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208020111.2068239-5-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_233758_685876_8835FC4A 
X-CRM114-Status: GOOD (  24.64  )
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

On Sat, Feb 08, 2025 at 02:01:11AM +0000, Colton Lewis wrote:
> The ARM architecture specifies that when MDCR_EL2.HPMN is set, EL1 and
> EL0, which includes KVM guests, should read that value for PMCR.N.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  arch/arm64/kvm/debug.c                                  | 3 +--
>  arch/arm64/kvm/pmu-emul.c                               | 8 +++++++-
>  tools/testing/selftests/kvm/arm64/vpmu_counter_access.c | 2 +-
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
> index 0e4c805e7e89..7c04db00bf6c 100644
> --- a/arch/arm64/kvm/debug.c
> +++ b/arch/arm64/kvm/debug.c
> @@ -36,8 +36,7 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
>  	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
>  	 * to disable guest access to the profiling and trace buffers
>  	 */
> -	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
> -					 *host_data_ptr(nr_event_counters));
> +	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, read_mdcr());

Please avoid unnecessary accesses to MDCR_EL2 at all costs. This is a
guaranteed trap to EL2 with nested virt.

>  	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
>  				MDCR_EL2_TPMS |
>  				MDCR_EL2_TTRF |
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index 6c5950b9ceac..052ce8c721fe 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -993,12 +993,18 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int irq)
>  u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
>  {
>  	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
> +	u8 limit;
> +
> +	if (arm_pmu->partitioned)
> +		limit = arm_pmu->hpmn - 1;
> +	else
> +		limit = ARMV8_PMU_MAX_GENERAL_COUNTERS;
>  
>  	/*
>  	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
>  	 * Ignore those and return only the general-purpose counters.
>  	 */
> -	return bitmap_weight(arm_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS);
> +	return bitmap_weight(arm_pmu->cntr_mask, limit);
>  }

This isn't necessary and is likely to regress the existing behavior.

When the architecture says the lower ELs should see PMCR_EL0.N have the
same value as MDCR_EL2.HPMN, what it really means is direct reads from
hardware will return the value.

So my expectation would be that a VM using the partitioned PMU
implementation would never reach any of the *emulated* PMU handlers, as
we would've disabled the associated traps.

The partitioned PMU will not replace the emulated vPMU implementation in
KVM, so it'd be good to refactor what we have today to make room for
your work. I think that'd be along the lines of:

 - Shared code for event filter enforcement and handling of the vPMU
   overflow IRQ.

 - Emulated PMU implementation that provides trap handlers for all PMUv3
   registers and backs into host perf

 - Partitioned PMU implementation that doesn't rely on traps and instead
   saves / restores a portion of the PMU that contains the guest
   context.

These should be done in separate files, i.e. I do not want to see a
bunch of inline handling to cope with emulated v. partitioned PMUs.

>  static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
> diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> index f16b3b27e32e..b5bc18b7528d 100644
> --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> @@ -609,7 +609,7 @@ static void run_pmregs_validity_test(uint64_t pmcr_n)
>   */
>  static void run_error_test(uint64_t pmcr_n)
>  {
> -	pr_debug("Error test with pmcr_n %lu (larger than the host)\n", pmcr_n);
> +	pr_debug("Error test with pmcr_n %lu (larger than the host allows)\n", pmcr_n);

NBD for an RFC, but in the future please do selftests changes in a
separate patch.

-- 
Thanks,
Oliver

