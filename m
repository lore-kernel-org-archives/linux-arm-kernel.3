Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855B2C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlKToSvBEFSPLKLKXZShMG6gUEw7CnMhATxHiMXR5Uc=; b=ayHh+4QzUaTaGk1Gyhy7kW9mwv
	2iHG3PR1zpPojViTpEeJLZSxeNttfgcRT2xem9WKbmP93QeJk3FSfxVk3r9NtTDy3Wd35GqwLU6cn
	/uQAijnzA1kHX8JOWXSQALEOUsCbKTMdu2TonMMTulKShtUth28kQnei2MxtxLmBEpe8z4HoszWkk
	9MfhMk7Ne1NTpTaz/zGa38kmvcYF0F4yuVlRKlL7pU2eg91ijickgCRiBLnz5SB8I44BqWu+I7T/m
	DzVYDFXqrSd4/IH8vy84QnCYe/o6mJO8Esb9oVX8TaWcjWMjf1CMTcpYe0EO+MvdT7d1ihtd9qL64
	pUP6GFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwN1-0000000Ap1D-2iG9;
	Wed, 18 Jun 2025 17:14:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuzh-0000000Ada7-1RzR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 15:46:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7C714401E;
	Wed, 18 Jun 2025 15:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CFAC4CEE7;
	Wed, 18 Jun 2025 15:46:25 +0000 (UTC)
Date: Wed, 18 Jun 2025 16:46:23 +0100
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
Subject: Re: [PATCH v7 2/5] KVM: arm64: Block cacheable PFNMAP mapping
Message-ID: <aFLfT_c4Fcxt8euY@arm.com>
References: <20250618065541.50049-1-ankita@nvidia.com>
 <20250618065541.50049-3-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618065541.50049-3-ankita@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_084633_420261_BD6E005C 
X-CRM114-Status: GOOD (  19.94  )
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

On Wed, Jun 18, 2025 at 06:55:38AM +0000, ankita@nvidia.com wrote:
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 3d77a278fc4f..d6e0d5f46b45 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1470,6 +1470,22 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
>  	return vma->vm_flags & VM_MTE_ALLOWED;
>  }
>  
> +/*
> + * Determine the memory region cacheability from VMA's pgprot. This
> + * is used to set the stage 2 PTEs.
> + */
> +static bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
> +{
> +	switch (FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(vma->vm_page_prot))) {
> +	case MT_NORMAL_NC:
> +	case MT_DEVICE_nGnRnE:
> +	case MT_DEVICE_nGnRE:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  			  struct kvm_s2_trans *nested,
>  			  struct kvm_memory_slot *memslot, unsigned long hva,
> @@ -1477,7 +1493,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  {
>  	int ret = 0;
>  	bool write_fault, writable, force_pte = false;
> -	bool exec_fault, mte_allowed;
> +	bool exec_fault, mte_allowed, is_vma_cacheable = false;

Nit: do we need to initialise is_vma_cacheable here? It did not seem
used until the kvm_vma_is_cacheable() call. Anyway, it's harmless.

>  	bool disable_cmo = false, vfio_allow_any_uc = false;
>  	unsigned long mmu_seq;
>  	phys_addr_t ipa = fault_ipa;
> @@ -1619,6 +1635,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  
>  	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
>  
> +	is_vma_cacheable = kvm_vma_is_cacheable(vma);
> +
>  	/* Don't use the VMA after the unlock -- it may have vanished */
>  	vma = NULL;
>  
> @@ -1643,6 +1661,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		return -EFAULT;
>  
>  	if (!kvm_can_use_cmo_pfn(pfn)) {
> +		if (is_vma_cacheable)
> +			return -EINVAL;
> +
>  		/*
>  		 * If the page was identified as device early by looking at
>  		 * the VMA flags, vma_pagesize is already representing the

This block also sets 'disable_cmo' (originally 'device') to true.

> @@ -1726,6 +1747,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		prot |= KVM_PGTABLE_PROT_X;
>  
>  	if (disable_cmo) {
> +		if (is_vma_cacheable) {
> +			ret = -EINVAL;
> +			goto out_unlock;
> +		}

so, is there anything else changing 'disable_cmo' up to this point? If
not, I'd drop the second is_vma_cacheable check.

-- 
Catalin

