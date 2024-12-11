Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F58CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 22:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/KzRWTJadwWCVUk7N2YfOToWkwn9QKq+OJpoZVM3jQo=; b=shmcjdbBIcgDMXJ5ku5cCP1W3O
	zyi5KHGwjnrmYQkpv2JMKgSyG70k2OD28b38ogW9YW+mPXdCEmUO8sZpHLlAOWpMR4pKVk2ju3vfP
	SPsog0hEEwtdegOMl4Eaov83fmMsVSN+g5n/6VCLznLRx5+QhYmMWDIQVXLBsy7PivevL+2Q9dPr+
	qG4pkKZGBiytYhragLXNgeSjpUqXif/LXKYcAxmDVF41aMg33dFov5n6YHr1kFd8jkenzzUDstbGz
	vIDOpk8swvG483hPHnAbLV+/BvdgooezZTwAxRqdyGCGWHqQO9Kn8teVUX6rgiPBhG9yfdCKdK3wV
	HfiuiTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUnb-0000000GGAw-1W40;
	Wed, 11 Dec 2024 22:03:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUmW-0000000GFvC-2haa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 22:02:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 27E965C56D6;
	Wed, 11 Dec 2024 22:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1E7C4CEDD;
	Wed, 11 Dec 2024 22:02:01 +0000 (UTC)
Date: Wed, 11 Dec 2024 22:01:59 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: ankita@nvidia.com
Cc: jgg@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com,
	lpieralisi@kernel.org, aniketa@nvidia.com, cjia@nvidia.com,
	kwankhede@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
	acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
	danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com,
	udhoke@nvidia.com, dnigam@nvidia.com, alex.williamson@redhat.com,
	sebastianene@google.com, coltonlewis@google.com,
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
Message-ID: <Z1oL1yZtdvGUIW9h@arm.com>
References: <20241118131958.4609-1-ankita@nvidia.com>
 <20241118131958.4609-2-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118131958.4609-2-ankita@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_140208_771745_6C5A6750 
X-CRM114-Status: GOOD (  61.41  )
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

Hi Ankit,

On Mon, Nov 18, 2024 at 01:19:58PM +0000, ankita@nvidia.com wrote:
> Currently KVM determines if a VMA is pointing at IO memory by checking
> pfn_is_map_memory(). However, the MM already gives us a way to tell what
> kind of memory it is by inspecting the VMA.
> 
> This patch solves the problems where it is possible for the kernel to
> have VMAs pointing at cachable memory without causing
> pfn_is_map_memory() to be true, eg DAX memremap cases and CXL/pre-CXL
> devices. This memory is now properly marked as cachable in KVM.
> 
> The pfn_is_map_memory() is restrictive and allows only for the memory
> that is added to the kernel to be marked as cacheable. In most cases
> the code needs to know if there is a struct page, or if the memory is
> in the kernel map and pfn_valid() is an appropriate API for this.
> Extend the umbrella with pfn_valid() to include memory with no struct
> pages for consideration to be mapped cacheable in stage 2. A !pfn_valid()
> implies that the memory is unsafe to be mapped as cacheable.

Please note that a pfn_valid() does not imply the memory is in the
linear map, only that there's a struct page. Some cache maintenance you
do later in the patch may fail. kvm_is_device_pfn() was changed by
commit 873ba463914c ("arm64: decouple check whether pfn is in linear map
from pfn_valid()"), see the log for some explanation.

> Moreover take account of the mapping type in the VMA to make a decision
> on the mapping. The VMA's pgprot is tested to determine the memory type
> with the following mapping:
>  pgprot_noncached    MT_DEVICE_nGnRnE   device (or Normal_NC)
>  pgprot_writecombine MT_NORMAL_NC       device (or Normal_NC)
>  pgprot_device       MT_DEVICE_nGnRE    device (or Normal_NC)
>  pgprot_tagged       MT_NORMAL_TAGGED   RAM / Normal
>  -                   MT_NORMAL          RAM / Normal
> 
> Also take care of the following two cases that prevents the memory to
> be safely mapped as cacheable:
> 1. The VMA pgprot have VM_IO set alongwith MT_NORMAL or
>    MT_NORMAL_TAGGED. Although unexpected and wrong, presence of such
>    configuration cannot be ruled out.
> 2. Configurations where VM_MTE_ALLOWED is not set and KVM_CAP_ARM_MTE
>    is enabled. Otherwise a malicious guest can enable MTE at stage 1
>    without the hypervisor being able to tell. This could cause external
>    aborts.

A first point I'd make - we can simplify this a bit and only allow such
configuration if FWB is present. Do you have a platform without FWB that
needs such feature?

Another reason for the above is my second point - I don't like relying
on the user mapping memory type for this (at some point we may have
device pass-through without a VMM mapping). Can we use something like a
new VM_FORCE_CACHED flag instead? There's precedent for this with
VM_ALLOW_ANY_UNCACHED.

> Introduce a new variable noncacheable to represent whether the memory
> should not be mapped as cacheable. The noncacheable as false implies
> the memory is safe to be mapped cacheable. Use this to handle the
> aforementioned potentially unsafe cases for cacheable mapping.
> 
> Note when FWB is not enabled, the kernel expects to trivially do
> cache management by flushing the memory by linearly converting a
> kvm_pte to phys_addr to a KVA, see kvm_flush_dcache_to_poc(). This is
> only possibile for struct page backed memory. Do not allow non-struct
> page memory to be cachable without FWB.

I want to be sure we actually have a real case for this for the !FWB
case. One issue is that it introduces a mismatch between the VMM and the
guest mappings I'd rather not have to have to deal with. Another is that
we can't guarantee it is mapped in the kernel linear map, pfn_valid()
does not imply this (I'll say this a few times through this patch).

> The device memory such as on the Grace Hopper systems is interchangeable
> with DDR memory and retains its properties. Allow executable faults
> on the memory determined as Normal cacheable.

As Will said, please introduce the exec handling separately, it will be
easier to follow the patches.

The exec fault would require cache maintenance in certain conditions
(depending on CTR_EL0.{DIC,IDC}). Since you introduce some conditions on
pfn_valid() w.r.t. D-cache maintenance, I assume we have similar
restrictions for I/D cache coherency.

> @@ -1430,6 +1425,23 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
>  	return vma->vm_flags & VM_MTE_ALLOWED;
>  }
>  
> +/*
> + * Determine the memory region cacheability from VMA's pgprot. This
> + * is used to set the stage 2 PTEs.
> + */
> +static unsigned long mapping_type(pgprot_t page_prot)
> +{
> +	return FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(page_prot));
> +}
> +
> +/*
> + * Determine if the mapping type is normal cacheable.
> + */
> +static bool mapping_type_normal_cacheable(unsigned long mt)
> +{
> +	return (mt == MT_NORMAL || mt == MT_NORMAL_TAGGED);
> +}

Personally I'd not use this at all, maybe at most as a safety check and
warn but I'd rather have an opt-in from the host driver (which could
also ensure that the user mapping is cached).

> +
>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  			  struct kvm_s2_trans *nested,
>  			  struct kvm_memory_slot *memslot, unsigned long hva,
> @@ -1438,8 +1450,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	int ret = 0;
>  	bool write_fault, writable, force_pte = false;
>  	bool exec_fault, mte_allowed;
> -	bool device = false, vfio_allow_any_uc = false;
> +	bool noncacheable = false, vfio_allow_any_uc = false;
>  	unsigned long mmu_seq;
> +	unsigned long mt;
>  	phys_addr_t ipa = fault_ipa;
>  	struct kvm *kvm = vcpu->kvm;
>  	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
> @@ -1568,6 +1581,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  
>  	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
>  
> +	mt = mapping_type(vma->vm_page_prot);
> +
> +	/*
> +	 * Check for potentially ineligible or unsafe conditions for
> +	 * cacheable mappings.
> +	 */
> +	if (vma->vm_flags & VM_IO)
> +		noncacheable = true;
> +	else if (!mte_allowed && kvm_has_mte(kvm))
> +		noncacheable = true;
> +
>  	/* Don't use the VMA after the unlock -- it may have vanished */
>  	vma = NULL;
>  
> @@ -1591,19 +1615,15 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	if (is_error_noslot_pfn(pfn))
>  		return -EFAULT;
>  
> -	if (kvm_is_device_pfn(pfn)) {
> -		/*
> -		 * If the page was identified as device early by looking at
> -		 * the VMA flags, vma_pagesize is already representing the
> -		 * largest quantity we can map.  If instead it was mapped
> -		 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
> -		 * and must not be upgraded.
> -		 *
> -		 * In both cases, we don't let transparent_hugepage_adjust()
> -		 * change things at the last minute.
> -		 */
> -		device = true;
> -	} else if (logging_active && !write_fault) {
> +	/*
> +	 * pfn_valid() indicates to the code if there is a struct page, or
> +	 * if the memory is in the kernel map. Any memory region otherwise
> +	 * is unsafe to be cacheable.
> +	 */
> +	if (!pfn_valid(pfn))
> +		noncacheable = true;

The assumptions here are wrong. pfn_valid() does not imply the memory is
in the kernel map.

> +
> +	if (!noncacheable && logging_active && !write_fault) {
>  		/*
>  		 * Only actually map the page as writable if this was a write
>  		 * fault.
> @@ -1611,7 +1631,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		writable = false;
>  	}
>  
> -	if (exec_fault && device)
> +	/*
> +	 * Do not allow exec fault; unless the memory is determined safely
> +	 * to be Normal cacheable.
> +	 */
> +	if (exec_fault && (noncacheable || !mapping_type_normal_cacheable(mt)))
>  		return -ENOEXEC;
>  
>  	/*
> @@ -1641,10 +1665,19 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	}
>  
>  	/*
> +	 * If the page was identified as device early by looking at
> +	 * the VMA flags, vma_pagesize is already representing the
> +	 * largest quantity we can map.  If instead it was mapped
> +	 * via gfn_to_pfn_prot(), vma_pagesize is set to PAGE_SIZE
> +	 * and must not be upgraded.
> +	 *
> +	 * In both cases, we don't let transparent_hugepage_adjust()
> +	 * change things at the last minute.
> +	 *
>  	 * If we are not forced to use page mapping, check if we are
>  	 * backed by a THP and thus use block mapping if possible.
>  	 */
> -	if (vma_pagesize == PAGE_SIZE && !(force_pte || device)) {
> +	if (vma_pagesize == PAGE_SIZE && !(force_pte || noncacheable)) {
>  		if (fault_is_perm && fault_granule > PAGE_SIZE)
>  			vma_pagesize = fault_granule;
>  		else
> @@ -1658,7 +1691,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		}
>  	}
>  
> -	if (!fault_is_perm && !device && kvm_has_mte(kvm)) {
> +	if (!fault_is_perm && !noncacheable && kvm_has_mte(kvm)) {
>  		/* Check the VMM hasn't introduced a new disallowed VMA */
>  		if (mte_allowed) {
>  			sanitise_mte_tags(kvm, pfn, vma_pagesize);
> @@ -1674,7 +1707,15 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	if (exec_fault)
>  		prot |= KVM_PGTABLE_PROT_X;
>  
> -	if (device) {
> +	/*
> +	 * If any of the following pgprot modifiers are applied on the pgprot,
> +	 * consider as device memory and map in Stage 2 as device or
> +	 * Normal noncached:
> +	 * pgprot_noncached
> +	 * pgprot_writecombine
> +	 * pgprot_device
> +	 */
> +	if (!mapping_type_normal_cacheable(mt)) {
>  		if (vfio_allow_any_uc)
>  			prot |= KVM_PGTABLE_PROT_NORMAL_NC;
>  		else
> @@ -1684,6 +1725,20 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		prot |= KVM_PGTABLE_PROT_X;
>  	}

I'd leave the device check in place, maybe rename it to something else
to distinguish from linear map memory (e.g. !pfn_is_map_memory()) and
only deal with the attributes for this device pfn which could be Device,
Normal-NC or Normal-WB depending on the presence of some VM_* flags.
Deny execution in the first patch, introduce it subsequently.

> +	/*
> +	 *  When FWB is unsupported KVM needs to do cache flushes
> +	 *  (via dcache_clean_inval_poc()) of the underlying memory. This is
> +	 *  only possible if the memory is already mapped into the kernel map
> +	 *  at the usual spot.
> +	 *
> +	 *  Validate that there is a struct page for the PFN which maps
> +	 *  to the KVA that the flushing code expects.
> +	 */
> +	if (!stage2_has_fwb(pgt) && !(pfn_valid(pfn))) {
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}

Cache maintenance relies on memory being mapped. That's what
memblock_is_map_memory() gives us. Hotplugged memory ends up in memblock
as arm64 selects ARCH_KEEP_MEMBLOCK.

> +
>  	/*
>  	 * Under the premise of getting a FSC_PERM fault, we just need to relax
>  	 * permissions only if vma_pagesize equals fault_granule. Otherwise,
> -- 
> 2.34.1
> 

-- 
Catalin

