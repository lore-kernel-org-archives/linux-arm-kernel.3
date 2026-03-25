Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE57109C039
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2B1YCXKJIH6M1U0QHATXM1XJOCuNZBnc9hLtljff/w=; b=DTv5idx2GmqeCAnGQbL7UBxq1l
	mcjtNG7F52VfDS04j7yy2oZ3NirB4vVNIo+QSXQ4mwuXNFWFlQzbiJzx/UYdpGjiMnyzMklebbqhw
	MVjxeSpdG781G3MDmMRLRMSF68x7XuDo/Wbmm+s4lnv+1ETstUwkKrxD3s/yWK9MILJduq/+4VCm6
	V9Wne/jFk1N/5yNQlbCyMgBAE8lQsBV5HbkOn4xW9G/U7REnYPBUT1X7i5NhBke9TeGtOaFUxvWmj
	uDGf2sFxAsPXJy+r/LcUiPBc1EZd2bwhp/VYdAxyL2Tc8+RB5D09sxTjxD5OqPBO1Ol73hoO3PTRs
	aEqf2uOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RBN-00000003ujm-1fFC;
	Wed, 25 Mar 2026 16:34:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RBK-00000003uj7-2MwW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 16:34:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F9C71F02;
	Wed, 25 Mar 2026 09:34:02 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4F923F915;
	Wed, 25 Mar 2026 09:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774456448; bh=Uzh2VRzviP7yTPZpv9Thn4meE6ETj/ysuIr/VejhzOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=veRuyfiNHKtiJfNHSrxSI0R4IJgwC7Rpr3qLlHzXYbTxAkJM7dF4ySwn/3AlT1Q8M
	 UyjGD63OXuacn+Xn10VVWof9ySUcrelMANe07EuqguASnXKa5wpprVkdO7esea0gRo
	 fCI0ggXcu/dmKP4759MGhcSi4F6WIdoboFm7WYLU=
Date: Wed, 25 Mar 2026 16:34:02 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>, Yabin Cui <yabinc@google.com>
Subject: Re: [PATCH v2 2/3] KVM: arm64: Disable SPE Profiling Buffer when
 running in guest context
Message-ID: <acQOekvkIUxj3jYU@raptor>
References: <20260227212136.7660-1-will@kernel.org>
 <20260227212136.7660-3-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227212136.7660-3-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_093410_681233_1A10EDDE 
X-CRM114-Status: GOOD (  33.94  )
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

Hi Will,

The patch looks good to me:

Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>

Also tested the series for about 24h on an Orion O6 board with SPE enabled by
profiling two host processes spread across all CPUs with SPE, and at the same
time profiling a virtual machine with the VCPUs simiarly spread across the CPUs
with SPE:

Tested-by: Alexandru Elisei <alexandru.elisei@arm.com>

Thanks,
Alex

On Fri, Feb 27, 2026 at 09:21:34PM +0000, Will Deacon wrote:
> The nVHE world-switch code relies on zeroing PMSCR_EL1 to disable
> profiling data generation in guest context when SPE is in use by the
> host.
> 
> Unfortunately, this may leave PMBLIMITR_EL1.E set and consequently we
> can end up running in guest/hypervisor context with the Profiling Buffer
> enabled. The current "known issues" document for Rev M.a of the Arm ARM
> states that this can lead to speculative, out-of-context translations:
> 
>   | 2.18 D23136:
>   |
>   | When the Profiling Buffer is enabled, profiling is not stopped, and
>   | Discard mode is not enabled, the Statistical Profiling Unit might
>   | cause speculative translations for the owning translation regime,
>   | including when the owning translation regime is out-of-context.
> 
> In a similar fashion to TRBE, ensure that the Profiling Buffer is
> disabled during the nVHE world switch before we start messing with the
> stage-2 MMU and trap configuration.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Alexandru Elisei <alexandru.elisei@arm.com>
> Fixes: f85279b4bd48 ("arm64: KVM: Save/restore the host SPE state when entering/leaving a VM")
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h  |  1 +
>  arch/arm64/kvm/hyp/nvhe/debug-sr.c | 33 ++++++++++++++++++++----------
>  arch/arm64/kvm/hyp/nvhe/switch.c   |  2 +-
>  3 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 1532ad2b2ec2..d527c77977dd 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -768,6 +768,7 @@ struct kvm_host_data {
>  		struct kvm_guest_debug_arch regs;
>  		/* Statistical profiling extension */
>  		u64 pmscr_el1;
> +		u64 pmblimitr_el1;
>  		/* Self-hosted trace */
>  		u64 trfcr_el1;
>  		u64 trblimitr_el1;
> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> index 3dbdee1148d3..75158a9cd06a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
> @@ -14,20 +14,20 @@
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
>  
> -static void __debug_save_spe(u64 *pmscr_el1)
> +static void __debug_save_spe(void)
>  {
> -	u64 reg;
> +	u64 *pmscr_el1, *pmblimitr_el1;
>  
> -	/* Clear pmscr in case of early return */
> -	*pmscr_el1 = 0;
> +	pmscr_el1 = host_data_ptr(host_debug_state.pmscr_el1);
> +	pmblimitr_el1 = host_data_ptr(host_debug_state.pmblimitr_el1);
>  
>  	/*
>  	 * At this point, we know that this CPU implements
>  	 * SPE and is available to the host.
>  	 * Check if the host is actually using it ?
>  	 */
> -	reg = read_sysreg_s(SYS_PMBLIMITR_EL1);
> -	if (!(reg & BIT(PMBLIMITR_EL1_E_SHIFT)))
> +	*pmblimitr_el1 = read_sysreg_s(SYS_PMBLIMITR_EL1);
> +	if (!(*pmblimitr_el1 & BIT(PMBLIMITR_EL1_E_SHIFT)))
>  		return;
>  
>  	/* Yes; save the control register and disable data generation */
> @@ -37,18 +37,29 @@ static void __debug_save_spe(u64 *pmscr_el1)
>  
>  	/* Now drain all buffered data to memory */
>  	psb_csync();
> +	dsb(nsh);
> +
> +	/* And disable the profiling buffer */
> +	write_sysreg_s(0, SYS_PMBLIMITR_EL1);
> +	isb();
>  }
>  
> -static void __debug_restore_spe(u64 pmscr_el1)
> +static void __debug_restore_spe(void)
>  {
> -	if (!pmscr_el1)
> +	u64 pmblimitr_el1 = *host_data_ptr(host_debug_state.pmblimitr_el1);
> +
> +	if (!(pmblimitr_el1 & BIT(PMBLIMITR_EL1_E_SHIFT)))
>  		return;
>  
>  	/* The host page table is installed, but not yet synchronised */
>  	isb();
>  
> +	/* Re-enable the profiling buffer. */
> +	write_sysreg_s(pmblimitr_el1, SYS_PMBLIMITR_EL1);
> +	isb();
> +
>  	/* Re-enable data generation */
> -	write_sysreg_el1(pmscr_el1, SYS_PMSCR);
> +	write_sysreg_el1(*host_data_ptr(host_debug_state.pmscr_el1), SYS_PMSCR);
>  }
>  
>  static void __trace_do_switch(u64 *saved_trfcr, u64 new_trfcr)
> @@ -177,7 +188,7 @@ void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
>  {
>  	/* Disable and flush SPE data generation */
>  	if (host_data_test_flag(HAS_SPE))
> -		__debug_save_spe(host_data_ptr(host_debug_state.pmscr_el1));
> +		__debug_save_spe();
>  
>  	/* Disable BRBE branch records */
>  	if (host_data_test_flag(HAS_BRBE))
> @@ -195,7 +206,7 @@ void __debug_switch_to_guest(struct kvm_vcpu *vcpu)
>  void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
>  {
>  	if (host_data_test_flag(HAS_SPE))
> -		__debug_restore_spe(*host_data_ptr(host_debug_state.pmscr_el1));
> +		__debug_restore_spe();
>  	if (host_data_test_flag(HAS_BRBE))
>  		__debug_restore_brbe(*host_data_ptr(host_debug_state.brbcr_el1));
>  	if (__trace_needs_switch())
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index f00688e69d88..9b6e87dac3b9 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -278,7 +278,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
>  	 * We're about to restore some new MMU state. Make sure
>  	 * ongoing page-table walks that have started before we
>  	 * trapped to EL2 have completed. This also synchronises the
> -	 * above disabling of BRBE and SPE.
> +	 * above disabling of BRBE.
>  	 *
>  	 * See DDI0487I.a D8.1.5 "Out-of-context translation regimes",
>  	 * rule R_LFHQG and subsequent information statements.
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 

