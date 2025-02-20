Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82E0C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjnuJArb3xqoSuqthvGgBPvGOHIW6dTgvj7IA3bdsZY=; b=XiyagBWYMUBxynAk8MEvTij0RF
	akm2fW5g6odKArrNm+RA1g8OrGDhNos3GFD3pjy4GjFZOhc+5cGeCTB5NwX0QZhSNJvfToDs56jrm
	xygp2UgEgQF322rHFycc7HOd4w5Vw7u8HjYEifwLHZmQgEs1g1qpnF/u9byMMLZgUijbr5DnEqydv
	xMKFo6QhCckqzJodoTl/RDoYPxtyYP2lPDlqUonk++iyFZ/5PDbwvhvUQSXS3bh5vey658NcvcDy5
	F0ZnJ9LjlTU8fSpGPPW4URDz37NJJOAj6gBs1s11mslBmREgCCOKQ0tHe40MrfDMGObpLkaVvgj4L
	5au12dxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7DY-00000001Dg3-1t4C;
	Thu, 20 Feb 2025 14:07:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl79H-00000001Cbh-3tsQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:03:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C35C16F3;
	Thu, 20 Feb 2025 06:03:48 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD0A23F59E;
	Thu, 20 Feb 2025 06:03:28 -0800 (PST)
Date: Thu, 20 Feb 2025 14:03:23 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	gankulkarni@os.amperecomputing.com
Subject: Re: [PATCH v2 01/14] arm64: cpufeature: Handle NV_frac as a synonym
 of NV2
Message-ID: <20250220140323.GA2562076@e124191.cambridge.arm.com>
References: <20250220134907.554085-1-maz@kernel.org>
 <20250220134907.554085-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220134907.554085-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_060332_010113_87EB32F5 
X-CRM114-Status: GOOD (  20.92  )
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

On Thu, Feb 20, 2025 at 01:48:54PM +0000, Marc Zyngier wrote:
> With ARMv9.5, an implementation supporting Nested Virtualization
> is allowed to only support NV2, and to avoid supporting the old
> (and useless) ARMv8.3 variant.
> 
> This is indicated by ID_AA64MMFR2_EL1.NV being 0 (as if NV wasn't
> implemented) and ID_AA64MMDR4_EL1.NV_frac being 1 (indicating that

typo: ID_AA64MMDR4_EL1 -> ID_AA64MMFR4_EL1

> NV2 is actually supported).
> 
> Given that KVM only deals with NV2 and refuses to use the old NV,
> detecting NV2 or NV_frac is what we need to enable it.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kernel/cpufeature.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index d561cf3b8ac7b..2c198cd4f9405 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -497,6 +497,7 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr3[] = {
>  
>  static const struct arm64_ftr_bits ftr_id_aa64mmfr4[] = {
>  	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR4_EL1_E2H0_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR4_EL1_NV_frac_SHIFT, 4, 0),
>  	ARM64_FTR_END,
>  };
>  
> @@ -2162,7 +2163,7 @@ static bool has_nested_virt_support(const struct arm64_cpu_capabilities *cap,
>  	if (kvm_get_mode() != KVM_MODE_NV)
>  		return false;
>  
> -	if (!has_cpuid_feature(cap, scope)) {
> +	if (!cpucap_multi_entry_cap_matches(cap, scope)) {
>  		pr_warn("unavailable: %s\n", cap->desc);
>  		return false;
>  	}
> @@ -2519,7 +2520,17 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.capability = ARM64_HAS_NESTED_VIRT,
>  		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
>  		.matches = has_nested_virt_support,
> -		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, NV, NV2)
> +		.match_list = (const struct arm64_cpu_capabilities []){
> +			{
> +				.matches = has_cpuid_feature,
> +				ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, NV, NV2)
> +			},
> +			{
> +				.matches = has_cpuid_feature,
> +				ARM64_CPUID_FIELDS(ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY)
> +			},
> +			{ /* Sentinel */ }
> +		},
>  	},
>  	{
>  		.capability = ARM64_HAS_32BIT_EL0_DO_NOT_USE,
> -- 
> 2.39.2
> 

