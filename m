Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC0DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 15:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vPclOmUNheg1XBz4ByN5Al3ukEcDCJ2VrveslAG1Kc=; b=CvlPBYvUvqfq7wdHY9KJRodTzc
	7C0r/cPG+joOs8iSNmSSOpM6z/Q32jluUanSW7lXTvyHbRIAuAYuIp5h7qu6gJ2MtVggy5BXbsY5i
	Zky5LavFDyVrfcpyZm0vxkEhPxMrPJ6cTLl/k2wy8EokrEVVfCsnDsrwGeJtGN7Wx8/skO6IBizJc
	5EiCeKpxA0yONZC4c0Jt8bQP6CFndIAZqDbgbRYKO7bVeMu+dI+WXcZl6nKEboCoqhVYbM3koMr5e
	4/nr7gsnUhfDmDQXd9Q50gfCInAPVg8bQ2rhYg62jJu+1wGbpsa37LKGsRQ03SBta8uvSkBMGtgND
	tETREZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDBJ-00000005BXw-0l6U;
	Fri, 10 Jul 2026 15:30:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDBH-00000005BXR-0SoG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 15:30:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D27C16F2;
	Fri, 10 Jul 2026 08:30:16 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.2.213.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AAED3F85F;
	Fri, 10 Jul 2026 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783697420; bh=Ag7+DBXl7OEnGjBxRTghPcWKH9PGPpNN3QZJrGROt90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQsX+7zLQ8kUuPEVd4ee263MXQndYnIn7/W/2CE8NyeLwYu0ht2C+h98fTNQsfWen
	 dOjZO6gNQxpJj8k+J5tPKWK6DG9NPgyBUdyF8LBScwN1gy/IMR/w2k9DBWS2QmKVE0
	 QSYWaM6vzFBQ1ItWhINHs5E8/AreAaWNkdfkGTms=
Date: Fri, 10 Jul 2026 16:30:16 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 18/28] KVM: arm64: Add kvm_has_nv{2,3}() predicates
Message-ID: <20260710153016.GF12293@e124191.cambridge.arm.com>
References: <20260702160248.1377250-1-maz@kernel.org>
 <20260702160248.1377250-19-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702160248.1377250-19-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_083023_431226_1552B28C 
X-CRM114-Status: GOOD (  16.25  )
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

Question,

On Thu, Jul 02, 2026 at 05:02:38PM +0100, Marc Zyngier wrote:
> Add a new set of predicates indicating whether VM is capable of
> NV2, NV3, and is in a nested NV3 context.
> 
> This is going to become useful as we start dealing with a mix of
> behaviours (NV2, NV3, NV2 on NV3...).
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_emulate.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 9831166695186..c562d8171d5e1 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -266,6 +266,26 @@ static inline bool vserror_state_is_nested(struct kvm_vcpu *vcpu)
>  	       (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TMEA);
>  }
>  
> +static inline bool kvm_has_nv2(struct kvm *kvm)
> +{
> +	return (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT) &&
> +		kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY));

Should this also check ID_AA64MMFR2_EL1.NV=0b10? (aka NV2, not just NV2_ONLY)

> +}
> +
> +static inline bool kvm_has_nv3(struct kvm *kvm)
> +{
> +	return (cpus_have_final_cap(ARM64_HAS_NESTED_VIRT) &&
> +		cpus_have_final_cap(ARM64_HAS_NV3) &&
> +		kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV3));
> +}
> +
> +static inline bool is_nested_nv3_ctxt(struct kvm_vcpu *vcpu)
> +{
> +	return (has_vhe() && kvm_has_nv3(vcpu->kvm) && is_nested_ctxt(vcpu) &&
> +		(__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_EL2_NV) &&
> +		(__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_NVTGE));
> +}
> +
>  /*
>   * The layout of SPSR for an AArch32 state is different when observed from an
>   * AArch64 SPSR_ELx or an AArch32 SPSR_*. This function generates the AArch32

Thanks,
Joey

