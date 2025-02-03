Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B8AC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YD39c9y8enC2fcImw6MdESSa4z3mlST3DgnRcl8B9ro=; b=iblopLM/h/GXjGKEwcjfIwV7tS
	B+pzNCIRuKJEFSRlh0djU+0r9AXiNAYnkAU3+nqSlnQRe+mdCK5gTXGRiUVJ5pStGg85g31dWsyuB
	COm1chi2RRDHI0TKLdJHNs0f+ICPTKYKTsgvUFO4FUDqCLmNkxgwSO4PLQ56RiiVp5K6Bns1Bm2HI
	p29CeOPXfi7aIF6O6VXPi28T1U2JoemvtM2Cd/BecbA5lMnlxXYXlsfAQg5Ep8WvkE0UIuf5Cukjt
	BL9mT3zHRKkIghpiliMzCfELHHu36AajmUXOekGQLK7ILglmcsVZKhhBdzN+Uwq6j1YCKKUOXuU9d
	fZ+nkl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesdw-0000000EyWV-49J7;
	Mon, 03 Feb 2025 09:21:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesZ9-0000000Exkm-3IW3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:16:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A2611063;
	Mon,  3 Feb 2025 01:16:51 -0800 (PST)
Received: from [10.162.16.79] (unknown [10.162.16.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78A813F5A1;
	Mon,  3 Feb 2025 01:16:22 -0800 (PST)
Message-ID: <533b2899-8805-4e57-afc2-d92ffeba6a7b@arm.com>
Date: Mon, 3 Feb 2025 14:46:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 10/11] KVM: arm64: nvhe: Disable branch generation in
 nVHE guests
To: "Rob Herring (Arm)" <robh@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-10-1c1300802385@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250202-arm-brbe-v19-v19-10-1c1300802385@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_011627_918557_48D8D5F1 
X-CRM114-Status: GOOD (  30.90  )
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



On 2/3/25 06:13, Rob Herring (Arm) wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> While BRBE can record branches within guests, the host recording
> branches in guests is not supported by perf. Therefore, BRBE needs to be
> disabled on guest entry and restored on exit.
> 
> For nVHE, this requires explicit handling for guests. Before
> entering a guest, save the BRBE state and disable the it. When
> returning to the host, restore the state.
> 
> For VHE, it is not necessary. We initialize
> BRBCR_EL1.{E1BRE,E0BRE}=={0,0} at boot time, and HCR_EL2.TGE==1 while
> running in the host. We configure BRBCR_EL2.{E2BRE,E0HBRE} to enable
> branch recording in the host. When entering the guest, we set
> HCR_EL2.TGE==0 which means BRBCR_EL1 is used instead of BRBCR_EL2.
> Consequently for VHE, BRBE recording is disabled at EL1 and EL0 when
> running a guest.
> 
> Should recording in guests (by the host) ever be desired, the perf ABI
> will need to be extended to distinguish guest addresses (struct
> perf_branch_entry.priv) for starters. BRBE records would also need to be
> invalidated on guest entry/exit as guest/host EL1 and EL0 records can't
> be distinguished.
> 
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v19:
>  - Rework due to v6.14 debug flag changes
>  - Redo commit message
> ---
>  arch/arm64/include/asm/kvm_host.h  |  2 ++
>  arch/arm64/kvm/debug.c             |  4 ++++
>  arch/arm64/kvm/hyp/nvhe/debug-sr.c | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 7cfa024de4e3..4fc246a1ee6b 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -619,6 +619,7 @@ struct kvm_host_data {
>  #define KVM_HOST_DATA_FLAG_HOST_SME_ENABLED		3
>  #define KVM_HOST_DATA_FLAG_TRBE_ENABLED			4
>  #define KVM_HOST_DATA_FLAG_EL1_TRACING_CONFIGURED	5
> +#define KVM_HOST_DATA_FLAG_HAS_BRBE			6

Although there is some variation in these feature names above, but seems
like KVM_HOST_DATA_FLAG_HAS_BRBE is an appropriate one for BRBE handling.

>  	unsigned long flags;
>  
>  	struct kvm_cpu_context host_ctxt;
> @@ -662,6 +663,7 @@ struct kvm_host_data {
>  		u64 trfcr_el1;
>  		/* Values of trap registers for the host before guest entry. */
>  		u64 mdcr_el2;
> +		u64 brbcr_el1;
>  	} host_debug_state;
>  
>  	/* Guest trace filter value */
> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
> index 0e4c805e7e89..bc6015108a68 100644
> --- a/arch/arm64/kvm/debug.c
> +++ b/arch/arm64/kvm/debug.c
> @@ -81,6 +81,10 @@ void kvm_init_host_debug_data(void)
>  	    !(read_sysreg_s(SYS_PMBIDR_EL1) & PMBIDR_EL1_P))
>  		host_data_set_flag(HAS_SPE);
>  
> +	/* Check if we have BRBE implemented and available at the host */
> +	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_BRBE_SHIFT))
> +		host_data_set_flag(HAS_BRBE);
> +
>  	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_TraceFilt_SHIFT)) {
>  		/* Force disable trace in protected mode in case of no TRBE */
>  		if (is_protected_kvm_enabled())
> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> index 2f4a4f5036bb..2a1c0f49792b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> @@ -92,12 +92,42 @@ static void __trace_switch_to_host(void)
>  			  *host_data_ptr(host_debug_state.trfcr_el1));
>  }
>  
> +static void __debug_save_brbe(u64 *brbcr_el1)
> +{
> +	*brbcr_el1 = 0;
> +
> +	/* Check if the BRBE is enabled */
> +	if (!(read_sysreg_el1(SYS_BRBCR) & (BRBCR_ELx_E0BRE | BRBCR_ELx_ExBRE)))
> +		return;
> +
> +	/*
> +	 * Prohibit branch record generation while we are in guest.
> +	 * Since access to BRBCR_EL1 is trapped, the guest can't
> +	 * modify the filtering set by the host.
> +	 */
> +	*brbcr_el1 = read_sysreg_el1(SYS_BRBCR);
> +	write_sysreg_el1(0, SYS_BRBCR);
> +}
> +
> +static void __debug_restore_brbe(u64 brbcr_el1)
> +{
> +	if (!brbcr_el1)
> +		return;
> +
> +	/* Restore BRBE controls */
> +	write_sysreg_el1(brbcr_el1, SYS_BRBCR);
> +}
> +
>  void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
>  {
>  	/* Disable and flush SPE data generation */
>  	if (host_data_test_flag(HAS_SPE))
>  		__debug_save_spe(host_data_ptr(host_debug_state.pmscr_el1));
>  
> +	/* Disable BRBE branch records */
> +	if (host_data_test_flag(HAS_BRBE))
> +		__debug_save_brbe(host_data_ptr(host_debug_state.brbcr_el1));
> +
>  	if (__trace_needs_switch())
>  		__trace_switch_to_guest();
>  }
> @@ -111,6 +141,8 @@ void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
>  {
>  	if (host_data_test_flag(HAS_SPE))
>  		__debug_restore_spe(*host_data_ptr(host_debug_state.pmscr_el1));
> +	if (host_data_test_flag(HAS_BRBE))
> +		__debug_restore_brbe(*host_data_ptr(host_debug_state.brbcr_el1));
>  	if (__trace_needs_switch())
>  		__trace_switch_to_host();
>  }
> 

LGTM

