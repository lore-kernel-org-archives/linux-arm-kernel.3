Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40592FED9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tydXIH5YEQhTUN7oZNskI6+2QUs/BiEYvjpK012Fw20=; b=LgfCPkCjZvpa6CnJ4CnFFNJJpO
	VzF6H8ATR1xwcirI7a5aToLHd0WFqiE9k+5KNt2PFs89r7on9ZMHe/gHgCw2EhC4evfeEKX9Z9LI6
	wWsX4eCdFHS6lYM4ZTDWFWP1zFxOaMIcXnhUDQ7rjLo05BUwkv/PcDs5Y/uVpJgBdlPE+cbnAI9KT
	fGBo4w9qja+L6UoMzjehjjEo/32Fs7f5008XqLRUrY2De2RLuY1mbTqnOTPHk88rkHozQIA/yLJyL
	HSdlkahhwYhBjUEgonBr8uYfTj94SpuP3G5G9VPuCz66KSW90K13A79kaBCmbpo0iHQr3SWmWwnWR
	xE8taSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2W12-00000006gdh-0zDA;
	Tue, 17 Mar 2026 15:07:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2W10-00000006gcs-00fx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 15:07:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F34A91477;
	Tue, 17 Mar 2026 08:07:16 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CAC43F778;
	Tue, 17 Mar 2026 08:07:21 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:07:16 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, vdonnefort@google.com
Subject: Re: [PATCH v1 01/13] KVM: arm64: Extract VMA size resolution in
 user_mem_abort()
Message-ID: <20260317150716.GA3808327@e124191.cambridge.arm.com>
References: <20260306140232.2193802-1-tabba@google.com>
 <20260306140232.2193802-2-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306140232.2193802-2-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_080726_132393_9A6E312E 
X-CRM114-Status: GOOD (  23.88  )
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

On Fri, Mar 06, 2026 at 02:02:20PM +0000, Fuad Tabba wrote:
> As part of an effort to refactor user_mem_abort() into smaller, more
> focused helper functions, extract the logic responsible for determining
> the VMA shift and page size into a new static helper,
> kvm_s2_resolve_vma_size().
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 130 ++++++++++++++++++++++++-------------------
>  1 file changed, 73 insertions(+), 57 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 17d64a1e11e5..f8064b2d3204 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1639,6 +1639,77 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	return ret != -EAGAIN ? ret : 0;
>  }
>  
> +static short kvm_s2_resolve_vma_size(struct vm_area_struct *vma,
> +				     unsigned long hva,
> +				     struct kvm_memory_slot *memslot,
> +				     struct kvm_s2_trans *nested,
> +				     bool *force_pte, phys_addr_t *ipa)
> +{
> +	short vma_shift;
> +	long vma_pagesize;
> +
> +	if (*force_pte)
> +		vma_shift = PAGE_SHIFT;
> +	else
> +		vma_shift = get_vma_page_shift(vma, hva);
> +
> +	switch (vma_shift) {
> +#ifndef __PAGETABLE_PMD_FOLDED
> +	case PUD_SHIFT:
> +		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
> +			break;
> +		fallthrough;
> +#endif
> +	case CONT_PMD_SHIFT:
> +		vma_shift = PMD_SHIFT;
> +		fallthrough;
> +	case PMD_SHIFT:
> +		if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE))
> +			break;
> +		fallthrough;
> +	case CONT_PTE_SHIFT:
> +		vma_shift = PAGE_SHIFT;
> +		*force_pte = true;
> +		fallthrough;
> +	case PAGE_SHIFT:
> +		break;
> +	default:
> +		WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
> +	}
> +
> +	vma_pagesize = 1UL << vma_shift;
> +
> +	if (nested) {
> +		unsigned long max_map_size;
> +
> +		max_map_size = *force_pte ? PAGE_SIZE : PUD_SIZE;
> +
> +		*ipa = kvm_s2_trans_output(nested);
> +
> +		/*
> +		 * If we're about to create a shadow stage 2 entry, then we
> +		 * can only create a block mapping if the guest stage 2 page
> +		 * table uses at least as big a mapping.
> +		 */
> +		max_map_size = min(kvm_s2_trans_size(nested), max_map_size);
> +
> +		/*
> +		 * Be careful that if the mapping size falls between
> +		 * two host sizes, take the smallest of the two.
> +		 */
> +		if (max_map_size >= PMD_SIZE && max_map_size < PUD_SIZE)
> +			max_map_size = PMD_SIZE;
> +		else if (max_map_size >= PAGE_SIZE && max_map_size < PMD_SIZE)
> +			max_map_size = PAGE_SIZE;
> +
> +		*force_pte = (max_map_size == PAGE_SIZE);
> +		vma_pagesize = min_t(long, vma_pagesize, max_map_size);
> +		vma_shift = __ffs(vma_pagesize);
> +	}
> +
> +	return vma_shift;
> +}
> +
>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  			  struct kvm_s2_trans *nested,
>  			  struct kvm_memory_slot *memslot, unsigned long hva,
> @@ -1695,65 +1766,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		return -EFAULT;
>  	}
>  
> -	if (force_pte)
> -		vma_shift = PAGE_SHIFT;
> -	else
> -		vma_shift = get_vma_page_shift(vma, hva);
> -
> -	switch (vma_shift) {
> -#ifndef __PAGETABLE_PMD_FOLDED
> -	case PUD_SHIFT:
> -		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
> -			break;
> -		fallthrough;
> -#endif
> -	case CONT_PMD_SHIFT:
> -		vma_shift = PMD_SHIFT;
> -		fallthrough;
> -	case PMD_SHIFT:
> -		if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE))
> -			break;
> -		fallthrough;
> -	case CONT_PTE_SHIFT:
> -		vma_shift = PAGE_SHIFT;
> -		force_pte = true;
> -		fallthrough;
> -	case PAGE_SHIFT:
> -		break;
> -	default:
> -		WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
> -	}
> -
> +	vma_shift = kvm_s2_resolve_vma_size(vma, hva, memslot, nested,
> +					    &force_pte, &ipa);
>  	vma_pagesize = 1UL << vma_shift;
>  
> -	if (nested) {
> -		unsigned long max_map_size;
> -
> -		max_map_size = force_pte ? PAGE_SIZE : PUD_SIZE;
> -
> -		ipa = kvm_s2_trans_output(nested);
> -
> -		/*
> -		 * If we're about to create a shadow stage 2 entry, then we
> -		 * can only create a block mapping if the guest stage 2 page
> -		 * table uses at least as big a mapping.
> -		 */
> -		max_map_size = min(kvm_s2_trans_size(nested), max_map_size);
> -
> -		/*
> -		 * Be careful that if the mapping size falls between
> -		 * two host sizes, take the smallest of the two.
> -		 */
> -		if (max_map_size >= PMD_SIZE && max_map_size < PUD_SIZE)
> -			max_map_size = PMD_SIZE;
> -		else if (max_map_size >= PAGE_SIZE && max_map_size < PMD_SIZE)
> -			max_map_size = PAGE_SIZE;
> -
> -		force_pte = (max_map_size == PAGE_SIZE);
> -		vma_pagesize = min_t(long, vma_pagesize, max_map_size);
> -		vma_shift = __ffs(vma_pagesize);
> -	}
> -
>  	/*
>  	 * Both the canonical IPA and fault IPA must be aligned to the
>  	 * mapping size to ensure we find the right PFN and lay down the
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 

