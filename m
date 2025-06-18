Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B5AC73C66
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3J4jMs0jSaiBQ9/qhRHY6iQInhpdKw6MVP5XiWtVK8=; b=jkIHQZdnVc/V1oOqR5BgN1gdhf
	HN2FaGeiYK2bdKGjbYOh6iu/J5BppQ8EalNzkeHx9ErH0U4QLQxEVIZ8OoBHc7DLcAa31/oab6lkz
	9x+MBhjFgVXbddd0r9AOZlqED6mU3258D6OxonSGqE+3Y3HPrrheWMfArH/faejD+DPxuyWon+xNN
	aQxr5xoGdUZ0Zn5EumFQlKwctePmG+eyPGbmgmI44+iuqFeBfr5QQIUv7RbsQnDWN+hq8szvcnIkF
	AoFvrbq0T7IEoqyZdsq8xkWI5f8I/GQ+XbiTbudW2ZyyFfFvl0gnNJuKH+SKqhH0W+rtAq8BYoogH
	rqS4hDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyCH-0000000B9rT-2DRP;
	Wed, 18 Jun 2025 19:11:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvk3-0000000AjsN-0FLF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 16:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 258AD6113B;
	Wed, 18 Jun 2025 16:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF032C4CEE7;
	Wed, 18 Jun 2025 16:34:18 +0000 (UTC)
Date: Wed, 18 Jun 2025 17:34:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com,
	lpieralisi@kernel.org, david@redhat.com, ddutile@redhat.com,
	seanjc@google.com, aniketa@nvidia.com, cjia@nvidia.com,
	kwankhede@nvidia.com, kjaju@nvidia.com, targupta@nvidia.com,
	vsethi@nvidia.com, acurrid@nvidia.com, apopple@nvidia.com,
	jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com,
	mochs@nvidia.com, udhoke@nvidia.com, dnigam@nvidia.com,
	alex.williamson@redhat.com, sebastianene@google.com,
	coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
	ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
	linux-mm@kvack.org, tabba@google.com, qperret@google.com,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
Subject: Re: [PATCH v7 4/5] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
Message-ID: <aFLqiAyXZLoOTepi@arm.com>
References: <20250618065541.50049-1-ankita@nvidia.com>
 <20250618065541.50049-5-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618065541.50049-5-ankita@nvidia.com>
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

On Wed, Jun 18, 2025 at 06:55:40AM +0000, ankita@nvidia.com wrote:
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index a71b77df7c96..6a3955e07b5e 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1660,6 +1660,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  
>  	is_vma_cacheable = kvm_vma_is_cacheable(vma);
>  
> +	/* Reject COW VM_PFNMAP */
> +	if ((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags))
> +		return -EINVAL;

It may help to add a comment here why this needs to be rejected. I
forgot the details but tracked it down to an email from David a few
months ago:

https://lore.kernel.org/all/a2d95399-62ad-46d3-9e48-6fa90fd2c2f3@redhat.com/

> +
>  	/* Don't use the VMA after the unlock -- it may have vanished */
>  	vma = NULL;
>  
> @@ -1684,9 +1688,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		return -EFAULT;
>  
>  	if (!kvm_can_use_cmo_pfn(pfn)) {
> -		if (is_vma_cacheable)
> -			return -EINVAL;
> -
>  		/*
>  		 * If the page was identified as device early by looking at
>  		 * the VMA flags, vma_pagesize is already representing the
> @@ -1696,8 +1697,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		 *
>  		 * In both cases, we don't let transparent_hugepage_adjust()
>  		 * change things at the last minute.
> +		 *
> +		 * Do not set device as the device memory is cacheable. Note
> +		 * that such mapping is safe as the KVM S2 will have the same
> +		 * Normal memory type as the VMA has in the S1.
>  		 */
> -		disable_cmo = true;
> +		if (!is_vma_cacheable)
> +			disable_cmo = true;

I'm tempted to stick to the 'device' variable name. Or something like
s2_noncacheable. As I commented, it's not just about disabling CMOs.

>  	} else if (logging_active && !write_fault) {
>  		/*
>  		 * Only actually map the page as writable if this was a write
> @@ -1784,6 +1790,19 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		prot |= KVM_PGTABLE_PROT_X;
>  	}
>  
> +	/*
> +	 *  When FWB is unsupported KVM needs to do cache flushes
> +	 *  (via dcache_clean_inval_poc()) of the underlying memory. This is
> +	 *  only possible if the memory is already mapped into the kernel map.
> +	 *
> +	 *  Outright reject as the cacheable device memory is not present in
> +	 *  the kernel map and not suitable for cache management.
> +	 */
> +	if (is_vma_cacheable && !kvm_arch_supports_cacheable_pfnmap()) {
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}

I'm missing the full context around this hunk but, judging by
indentation, does it also reject any cacheable vma even if it is not
PFNMAP on pre-FWB hardware?

-- 
Catalin

