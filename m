Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9CDC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 11:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbO6l2Hod3VJKctnuNiTk+c6cfYwzvNCJ0kw8EHgSI0=; b=XHqJ8fhd+fE4TwoLMXGCdVK4Ns
	H3ocb/AAjTVjb8YNFafBnHKCYCTjeg8BoOPuWtTRaTEdrZBTu2Dtd9RI9m7PmZlNzeU3nn8iGz32B
	+pe4ZqAapnFPoUMpM93Y94+AaddJNSa0ejnQ6NBiyE8Sq0TN2vyVtTu2v81oxx1syfkAuUWkHrweD
	39Cy/4PJTZ+ibbxpZ5BEp4Feb+YswuWDg0lo0eImzFGSAAR78kCtpKYHGZoWQZQytt3w0hM97helG
	2S4lbayDF5tW+jKGmWdn6tKTjP3B3u/+aSPV7KPidkjwJMmST0CsaPTpu72iC1oCaDa8QtrMe5EvP
	6nJ1vzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARhs-0000000FFDP-2b8M;
	Thu, 01 May 2025 11:03:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uARfw-0000000FEwL-3gyH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:01:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2237106F;
	Thu,  1 May 2025 04:01:47 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DFF63F5A1;
	Thu,  1 May 2025 04:01:53 -0700 (PDT)
Date: Thu, 1 May 2025 12:01:50 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 17/42] KVM: arm64: Handle trapping of FEAT_LS64*
 instructions
Message-ID: <20250501110150.GH1859293@e124191.cambridge.arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-18-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426122836.3341523-18-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_040157_004206_FE4141E2 
X-CRM114-Status: GOOD (  24.58  )
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

On Sat, Apr 26, 2025 at 01:28:11PM +0100, Marc Zyngier wrote:
> We generally don't expect FEAT_LS64* instructions to trap, unless
> they are trapped by a guest hypervisor.
> 
> Otherwise, this is just the guest playing tricks on us by using
> an instruction that isn't advertised, which we handle with a well
> deserved UNDEF.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/handle_exit.c | 56 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index b73dc26bc44b4..636c14ed2bb82 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -298,6 +298,61 @@ static int handle_svc(struct kvm_vcpu *vcpu)
>  	return 1;
>  }
>  
> +static int handle_other(struct kvm_vcpu *vcpu)
> +{
> +	bool is_l2 = vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu);
> +	u64 hcrx = __vcpu_sys_reg(vcpu, HCRX_EL2);
> +	u64 esr = kvm_vcpu_get_esr(vcpu);
> +	u64 iss = ESR_ELx_ISS(esr);
> +	struct kvm *kvm = vcpu->kvm;
> +	bool allowed, fwd = false;
> +
> +	/*
> +	 * We only trap for two reasons:
> +	 *
> +	 * - the feature is disabled, and the only outcome is to
> +	 *   generate an UNDEF.
> +	 *
> +	 * - the feature is enabled, but a NV guest wants to trap the
> +	 *   feature used my its L2 guest. We forward the exception in
> +	 *   this case.
> +	 *
> +	 * What we don't expect is to end-up here if the guest is
> +	 * expected be be able to directly use the feature, hence the
> +	 * WARN_ON below.
> +	 */
> +	switch (iss) {
> +	case ESR_ELx_ISS_OTHER_ST64BV:
> +		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V);
> +		if (is_l2)
> +			fwd = !(hcrx & HCRX_EL2_EnASR);
> +		break;
> +	case ESR_ELx_ISS_OTHER_ST64BV0:
> +		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA);
> +		if (is_l2)
> +			fwd = !(hcrx & HCRX_EL2_EnAS0);
> +		break;
> +	case ESR_ELx_ISS_OTHER_LDST64B:
> +		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64);
> +		if (is_l2)
> +			fwd = !(hcrx & HCRX_EL2_EnALS);
> +		break;
> +	default:
> +		/* Clearly, we're missing something. */
> +		WARN_ON_ONCE(1);
> +		allowed = false;
> +	}
> +
> +	WARN_ON_ONCE(allowed && !fwd);
> +
> +	if (allowed && fwd)
> +		kvm_inject_nested_sync(vcpu, esr);
> +	else
> +		kvm_inject_undefined(vcpu);
> +
> +	return 1;
> +}
> +
>  static exit_handle_fn arm_exit_handlers[] = {
>  	[0 ... ESR_ELx_EC_MAX]	= kvm_handle_unknown_ec,
>  	[ESR_ELx_EC_WFx]	= kvm_handle_wfx,
> @@ -307,6 +362,7 @@ static exit_handle_fn arm_exit_handlers[] = {
>  	[ESR_ELx_EC_CP14_LS]	= kvm_handle_cp14_load_store,
>  	[ESR_ELx_EC_CP10_ID]	= kvm_handle_cp10_id,
>  	[ESR_ELx_EC_CP14_64]	= kvm_handle_cp14_64,
> +	[ESR_ELx_EC_OTHER]	= handle_other,
>  	[ESR_ELx_EC_HVC32]	= handle_hvc,
>  	[ESR_ELx_EC_SMC32]	= handle_smc,
>  	[ESR_ELx_EC_HVC64]	= handle_hvc,
> -- 
> 2.39.2
> 

