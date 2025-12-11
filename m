Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ED1D41D57
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 15:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgU9YWRzmdSyKlVfuXelZdV8geLfnxP2mG9KV0K02Q4=; b=mEJ9VJDMCvSnV0THwCnrSrZRuP
	DZ1b84rDa0qKWHIaOaIcZhwm0P+W7t+DHglsnnO7UvmbcrOzMj4ek78Gus0RLcoOL/JhFo4XvH1pU
	LaQZZ9yJLaCPrHgcMSFvC+ovQ5NYU5vXRk1jlxRw3BHG2fzHO9gcmzdG1zW8mJeYY2G1GopeEtenI
	IPPdSuOXD/fcqKCJrD3xeeuAUBij7BWzkU8JTGhN3dm38pBtnGzUe7hJqIqSF+UD8Bar/k7/y/X+c
	j5K2h7b7wlo3CXe8fy238xCdwuYGuGrYLq9dvvxPeHwlmiZDtn0kxZ+MqY8xI5ksAe0YP179exRTS
	WT7BceBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTiRh-0000000GlUS-2awm;
	Thu, 11 Dec 2025 15:19:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTiRf-0000000GlTL-0SL4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 15:19:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA8A11688;
	Thu, 11 Dec 2025 07:18:55 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25BE33F740;
	Thu, 11 Dec 2025 07:19:01 -0800 (PST)
Date: Thu, 11 Dec 2025 15:18:51 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 6/6] KVM: arm64: Honor UX/PX attributes for EL2 S1
 mappings
Message-ID: <20251211151810.GA867614@e124191.cambridge.arm.com>
References: <20251210173024.561160-1-maz@kernel.org>
 <20251210173024.561160-7-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210173024.561160-7-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_071907_262912_C3A132EA 
X-CRM114-Status: GOOD (  18.46  )
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

On Wed, Dec 10, 2025 at 05:30:24PM +0000, Marc Zyngier wrote:
> Now that we potentially have two bits to deal with when setting
> execution permissions, make sure we correctly handle them when both
> when building the page tables and when reading back from them.
> 
> Reported-by: Alexandru Elisei <alexandru.elisei@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_pgtable.h | 12 +++---------
>  arch/arm64/kvm/hyp/pgtable.c         | 24 +++++++++++++++++++++---
>  2 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index be68b89692065..095e6b73740a6 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -87,15 +87,9 @@ typedef u64 kvm_pte_t;
>  
>  #define KVM_PTE_LEAF_ATTR_HI_SW		GENMASK(58, 55)
>  
> -#define __KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
> -#define __KVM_PTE_LEAF_ATTR_HI_S1_UXN	BIT(54)
> -#define __KVM_PTE_LEAF_ATTR_HI_S1_PXN	BIT(53)
> -
> -#define KVM_PTE_LEAF_ATTR_HI_S1_XN					\
> -	({ cpus_have_final_cap(ARM64_KVM_HVHE) ?			\
> -			(__KVM_PTE_LEAF_ATTR_HI_S1_UXN |		\
> -			 __KVM_PTE_LEAF_ATTR_HI_S1_PXN) :		\
> -			__KVM_PTE_LEAF_ATTR_HI_S1_XN; })
> +#define KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
> +#define KVM_PTE_LEAF_ATTR_HI_S1_UXN	BIT(54)
> +#define KVM_PTE_LEAF_ATTR_HI_S1_PXN	BIT(53)
>  
>  #define KVM_PTE_LEAF_ATTR_HI_S2_XN	GENMASK(54, 53)
>  
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index e0bd6a0172729..97c0835d25590 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -342,6 +342,9 @@ static int hyp_set_prot_attr(enum kvm_pgtable_prot prot, kvm_pte_t *ptep)
>  	if (!(prot & KVM_PGTABLE_PROT_R))
>  		return -EINVAL;
>  
> +	if (!cpus_have_final_cap(ARM64_KVM_HVHE))
> +		prot &= ~KVM_PGTABLE_PROT_UX;

Trying to understand this part. We don't consider KVM_PGTABLE_PROT_UX below
when !HVHE, and we don't set it in kvm_pgtable_hyp_pte_prot() when !HVHE
either, so can it ever actually be set?

Otherwise LGTM!

Thanks,
Joey

> +
>  	if (prot & KVM_PGTABLE_PROT_X) {
>  		if (prot & KVM_PGTABLE_PROT_W)
>  			return -EINVAL;
> @@ -351,8 +354,16 @@ static int hyp_set_prot_attr(enum kvm_pgtable_prot prot, kvm_pte_t *ptep)
>  
>  		if (system_supports_bti_kernel())
>  			attr |= KVM_PTE_LEAF_ATTR_HI_S1_GP;
> +	}
> +
> +	if (cpus_have_final_cap(ARM64_KVM_HVHE)) {
> +		if (!(prot & KVM_PGTABLE_PROT_PX))
> +			attr |= KVM_PTE_LEAF_ATTR_HI_S1_PXN;
> +		if (!(prot & KVM_PGTABLE_PROT_UX))
> +			attr |= KVM_PTE_LEAF_ATTR_HI_S1_UXN;
>  	} else {
> -		attr |= KVM_PTE_LEAF_ATTR_HI_S1_XN;
> +		if (!(prot & KVM_PGTABLE_PROT_PX))
> +			attr |= KVM_PTE_LEAF_ATTR_HI_S1_XN;
>  	}
>  
>  	attr |= FIELD_PREP(KVM_PTE_LEAF_ATTR_LO_S1_AP, ap);
> @@ -373,8 +384,15 @@ enum kvm_pgtable_prot kvm_pgtable_hyp_pte_prot(kvm_pte_t pte)
>  	if (!kvm_pte_valid(pte))
>  		return prot;
>  
> -	if (!(pte & KVM_PTE_LEAF_ATTR_HI_S1_XN))
> -		prot |= KVM_PGTABLE_PROT_X;
> +	if (cpus_have_final_cap(ARM64_KVM_HVHE)) {
> +		if (!(pte & KVM_PTE_LEAF_ATTR_HI_S1_PXN))
> +			prot |= KVM_PGTABLE_PROT_PX;
> +		if (!(pte & KVM_PTE_LEAF_ATTR_HI_S1_UXN))
> +			prot |= KVM_PGTABLE_PROT_UX;
> +	} else {
> +		if (!(pte & KVM_PTE_LEAF_ATTR_HI_S1_XN))
> +			prot |= KVM_PGTABLE_PROT_PX;
> +	}
>  
>  	ap = FIELD_GET(KVM_PTE_LEAF_ATTR_LO_S1_AP, pte);
>  	if (ap == KVM_PTE_LEAF_ATTR_LO_S1_AP_RO)
> -- 
> 2.47.3
> 

