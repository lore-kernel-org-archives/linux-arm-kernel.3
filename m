Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F2A10F931B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 02:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B06qFP/QpLCoUMyz8ZYAjD7oGklZbfsyd2tZV+e8sSQ=; b=MWqYtBGvQxZuFvu+zBSwFFAdLv
	afpAwIGB2PBQ8Y/PnYqN/TMm1n2NIFFd5RlEsqeciPGSp5YJQB+L2pCTTFQRJd0dSgoRHGY1BJKtR
	M4eJDhUlt1ew1IrlK7tmbny5P8VKYx9GpkYMxPVPCPjBJFHpg7UbWHUCO23BG2eSsDejfIB/HMavD
	XTxaqCC9gEtQr6j+cQneNSYmnegoGGyoqv2BEKK3UcVekUWHvXwz25iWPq1XonTcP0RLsS0fmRlIU
	fmqxr8AQDGw34A/fMrueB4e4m0Zvz5Q8tHXoa1t5bZe0g0ZfvYDoDp8wLROMTJsBjE7Eoag93xMFU
	X56NjULw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lZ0-0000000DrJU-3dje;
	Wed, 01 Apr 2026 02:44:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7lYy-0000000DrJ5-1qnb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 02:44:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 845452381;
	Tue, 31 Mar 2026 19:44:05 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32DFA3F7D8;
	Tue, 31 Mar 2026 19:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775011451; bh=OZ9GWFPOx6d9+f9Pyu8AMsXa/guTZJZFoyAk6GfCE3A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I4J46Laxvl7qB8oETrFxRVxqRrWyY4ZlCeiB4qF3HKlxjhiUwPIaj/XPCCrwLAKbQ
	 bgwCSuRS5dOHTTmzknCQulet6FkWzTYpNiw5oDAlHkT+d0t7KurTIoSXKQVdhIgZEs
	 C6pPdTfEn67tbyZX+1KhYduw3AjKYD8F/zk/yTRU=
Message-ID: <09757aa7-7016-43e5-88c5-b3ff34fed732@arm.com>
Date: Wed, 1 Apr 2026 08:14:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/30] KVM: arm64: Make fault_ipa immutable
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-16-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-16-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_194412_599939_0B9EBEDD 
X-CRM114-Status: GOOD (  24.98  )
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



On 27/03/26 5:06 PM, Marc Zyngier wrote:
> Updating fault_ipa is conceptually annoying, as it changes something
> that is a property of the fault itself.
> 
> Stop doing so and instead use fault->gfn as the sole piece of state
> that can be used to represent the faulting IPA.
> 
> At the same time, introduce get_canonical_gfn() for the couple of case
> we're we are concerned with the memslot-related IPA and not the faulting
> one.
> 
> Tested-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/arm64/kvm/mmu.c | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 67e5e867e01dc..496bf5903ed3d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1400,10 +1400,10 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
>   */
>  static long
>  transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
> -			    unsigned long hva, kvm_pfn_t *pfnp,
> -			    phys_addr_t *ipap)
> +			    unsigned long hva, kvm_pfn_t *pfnp, gfn_t *gfnp)
>  {
>  	kvm_pfn_t pfn = *pfnp;
> +	gfn_t gfn = *gfnp;
>  
>  	/*
>  	 * Make sure the adjustment is done only for THP pages. Also make
> @@ -1419,7 +1419,8 @@ transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
>  		if (sz < PMD_SIZE)
>  			return PAGE_SIZE;
>  
> -		*ipap &= PMD_MASK;
> +		gfn &= ~(PTRS_PER_PMD - 1);
> +		*gfnp = gfn;
>  		pfn &= ~(PTRS_PER_PMD - 1);
>  		*pfnp = pfn;
>  
> @@ -1735,7 +1736,6 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>  {
>  	struct vm_area_struct *vma;
>  	struct kvm *kvm = fault->vcpu->kvm;
> -	phys_addr_t ipa;
>  
>  	mmap_read_lock(current->mm);
>  	vma = vma_lookup(current->mm, fault->hva);
> @@ -1753,9 +1753,7 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>  	 * mapping size to ensure we find the right PFN and lay down the
>  	 * mapping in the right place.
>  	 */
> -	fault->fault_ipa = ALIGN_DOWN(fault->fault_ipa, fault->vma_pagesize);
> -	ipa = fault->nested ? kvm_s2_trans_output(fault->nested) : fault->fault_ipa;
> -	fault->gfn = ALIGN_DOWN(ipa, fault->vma_pagesize) >> PAGE_SHIFT;
> +	fault->gfn = ALIGN_DOWN(fault->fault_ipa, fault->vma_pagesize) >> PAGE_SHIFT;
>  
>  	fault->mte_allowed = kvm_vma_mte_allowed(vma);
>  
> @@ -1777,6 +1775,17 @@ static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
>  	return 0;
>  }
>  
> +static gfn_t get_canonical_gfn(struct kvm_s2_fault *fault)
> +{
> +	phys_addr_t ipa;
> +
> +	if (!fault->nested)
> +		return fault->gfn;
> +
> +	ipa = kvm_s2_trans_output(fault->nested);
> +	return ALIGN_DOWN(ipa, fault->vma_pagesize) >> PAGE_SHIFT;
> +}
> +
>  static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
>  {
>  	int ret;
> @@ -1785,7 +1794,7 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
>  	if (ret)
>  		return ret;
>  
> -	fault->pfn = __kvm_faultin_pfn(fault->memslot, fault->gfn,
> +	fault->pfn = __kvm_faultin_pfn(fault->memslot, get_canonical_gfn(fault),
>  				       fault->write_fault ? FOLL_WRITE : 0,
>  				       &fault->writable, &fault->page);
>  	if (unlikely(is_error_noslot_pfn(fault->pfn))) {
> @@ -1885,6 +1894,11 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
>  	return 0;
>  }
>  
> +static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
> +{
> +	return gfn_to_gpa(fault->gfn);
> +}
> +
>  static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>  {
>  	struct kvm *kvm = fault->vcpu->kvm;
> @@ -1909,7 +1923,7 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>  		} else {
>  			fault->vma_pagesize = transparent_hugepage_adjust(kvm, fault->memslot,
>  									  fault->hva, &fault->pfn,
> -									  &fault->fault_ipa);
> +									  &fault->gfn);
>  
>  			if (fault->vma_pagesize < 0) {
>  				ret = fault->vma_pagesize;
> @@ -1932,10 +1946,10 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>  		 * PTE, which will be preserved.
>  		 */
>  		fault->prot &= ~KVM_NV_GUEST_MAP_SZ;
> -		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault->fault_ipa,
> +		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, get_ipa(fault),
>  								 fault->prot, flags);
>  	} else {
> -		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault->fault_ipa, fault->vma_pagesize,
> +		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, get_ipa(fault), fault->vma_pagesize,
>  							 __pfn_to_phys(fault->pfn), fault->prot,
>  							 memcache, flags);
>  	}
> @@ -1946,7 +1960,7 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
>  
>  	/* Mark the page dirty only if the fault is handled successfully */
>  	if (fault->writable && !ret)
> -		mark_page_dirty_in_slot(kvm, fault->memslot, fault->gfn);
> +		mark_page_dirty_in_slot(kvm, fault->memslot, get_canonical_gfn(fault));
>  
>  	if (ret != -EAGAIN)
>  		return ret;


