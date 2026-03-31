Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B921061B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 03:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAPUMzo5ixNc6sJLG0+bTFfgyUdonyk3aangi9NhJVM=; b=b7CVxVmiFrx3PF/2CqUeQ97hJG
	WLO4Vh09L8/QIktVUKRKJJUhhuqa+cm6EbUy2tIdvoIjZHzfUNpr262PH9Xm5ZO3rO+VnYfCzPC51
	6KePx05tRfhdhMsuJK2NG8VvLHc3xnsrXwinnZwdI9nos93MZNxdL1nN+n2sWd88K5S9h263f5HFJ
	9wDfFzGX2UkMBnFcuWgNEQquACRZ2uvkgA/iY9qBOtSWwP6Q63aWc7y+9xb4nWOPnseT2d5ZgQj2O
	rB0Ne84jbrCKUPJLpK/ArWGxbUgnXak2TO2TAqix/3lRZjXUAmbJGAGMTzMFQz5C/yYqGh+frCFxj
	TXUvKEJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Pou-0000000CEXO-0605;
	Tue, 31 Mar 2026 03:31:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Poq-0000000CEWh-3YQ3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 03:31:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CCDE1BCA;
	Mon, 30 Mar 2026 20:31:00 -0700 (PDT)
Received: from [10.57.18.211] (unknown [10.57.18.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0D3A3F641;
	Mon, 30 Mar 2026 20:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774927866; bh=xWAz2vfxxyrbPfnyEcrbzm08uOYTH60HDJlet3HGVt8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vq9yU+LwH8v+2F1F3o0fefBH1/kUCb8hMfrZE4Q8g4kFfT7nkyFx53XkMPZz7K4Gz
	 iCDO+Im3XfdX/V46EpxEGIjyu6IP55FeRLbN4EEkUJ0CQvd6mdZapIzTb7uFpR+tEg
	 olOu+UbvkDZtmQzgHzrEgR3OHrGiuZONCwJjMLIk=
Message-ID: <40b94374-b171-4f72-bb8b-d215fee630c6@arm.com>
Date: Tue, 31 Mar 2026 09:00:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/30] KVM: arm64: Extract stage-2 permission logic in
 user_mem_abort()
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>
References: <20260327113618.4051534-1-maz@kernel.org>
 <20260327113618.4051534-6-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260327113618.4051534-6-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_203109_130567_A6E89A94 
X-CRM114-Status: GOOD (  33.49  )
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



On 27/03/26 5:05 PM, Marc Zyngier wrote:
> From: Fuad Tabba <tabba@google.com>
> 
> Extract the logic that computes the stage-2 protections and checks for
> various permission faults (e.g., execution faults on non-cacheable
> memory) into a new helper function, kvm_s2_fault_compute_prot(). This
> helper also handles injecting atomic/exclusive faults back into the
> guest when necessary.
> 
> This refactoring step separates the permission computation from the
> mapping logic, making the main fault handler flow clearer.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  arch/arm64/kvm/mmu.c | 163 +++++++++++++++++++++++--------------------
>  1 file changed, 87 insertions(+), 76 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1f2c2200ccd8d..d1ffdce18631a 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1809,6 +1809,89 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
>  	return 1;
>  }
>  
> +static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
> +{
> +	struct kvm *kvm = fault->vcpu->kvm;
> +
> +	/*
> +	 * Check if this is non-struct page memory PFN, and cannot support
> +	 * CMOs. It could potentially be unsafe to access as cacheable.
> +	 */
> +	if (fault->vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(fault->pfn)) {
> +		if (fault->is_vma_cacheable) {
> +			/*
> +			 * Whilst the VMA owner expects cacheable mapping to this
> +			 * PFN, hardware also has to support the FWB and CACHE DIC
> +			 * features.
> +			 *
> +			 * ARM64 KVM relies on kernel VA mapping to the PFN to
> +			 * perform cache maintenance as the CMO instructions work on
> +			 * virtual addresses. VM_PFNMAP region are not necessarily
> +			 * mapped to a KVA and hence the presence of hardware features
> +			 * S2FWB and CACHE DIC are mandatory to avoid the need for
> +			 * cache maintenance.
> +			 */
> +			if (!kvm_supports_cacheable_pfnmap())
> +				return -EFAULT;
> +		} else {
> +			/*
> +			 * If the page was identified as device early by looking at
> +			 * the VMA flags, vma_pagesize is already representing the
> +			 * largest quantity we can map.  If instead it was mapped
> +			 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
> +			 * and must not be upgraded.
> +			 *
> +			 * In both cases, we don't let transparent_hugepage_adjust()
> +			 * change things at the last minute.
> +			 */
> +			fault->s2_force_noncacheable = true;
> +		}
> +	} else if (fault->logging_active && !fault->write_fault) {
> +		/*
> +		 * Only actually map the page as writable if this was a write
> +		 * fault.
> +		 */
> +		fault->writable = false;
> +	}
> +
> +	if (fault->exec_fault && fault->s2_force_noncacheable)
> +		return -ENOEXEC;
> +
> +	/*
> +	 * Guest performs atomic/exclusive operations on memory with unsupported
> +	 * attributes (e.g. ld64b/st64b on normal memory when no FEAT_LS64WB)
> +	 * and trigger the exception here. Since the memslot is valid, inject
> +	 * the fault back to the guest.
> +	 */
> +	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(fault->vcpu))) {
> +		kvm_inject_dabt_excl_atomic(fault->vcpu, kvm_vcpu_get_hfar(fault->vcpu));
> +		return 1;
> +	}
> +
> +	if (fault->nested)
> +		adjust_nested_fault_perms(fault->nested, &fault->prot, &fault->writable);
> +
> +	if (fault->writable)
> +		fault->prot |= KVM_PGTABLE_PROT_W;
> +
> +	if (fault->exec_fault)
> +		fault->prot |= KVM_PGTABLE_PROT_X;
> +
> +	if (fault->s2_force_noncacheable) {
> +		if (fault->vfio_allow_any_uc)
> +			fault->prot |= KVM_PGTABLE_PROT_NORMAL_NC;
> +		else
> +			fault->prot |= KVM_PGTABLE_PROT_DEVICE;
> +	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC)) {
> +		fault->prot |= KVM_PGTABLE_PROT_X;
> +	}
> +
> +	if (fault->nested)
> +		adjust_nested_exec_perms(kvm, fault->nested, &fault->prot);
> +
> +	return 0;
> +}
> +
>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  			  struct kvm_s2_trans *nested,
>  			  struct kvm_memory_slot *memslot, unsigned long hva,
> @@ -1863,68 +1946,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  
>  	ret = 0;
>  
> -	/*
> -	 * Check if this is non-struct page memory PFN, and cannot support
> -	 * CMOs. It could potentially be unsafe to access as cacheable.
> -	 */
> -	if (fault->vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(fault->pfn)) {
> -		if (fault->is_vma_cacheable) {
> -			/*
> -			 * Whilst the VMA owner expects cacheable mapping to this
> -			 * PFN, hardware also has to support the FWB and CACHE DIC
> -			 * features.
> -			 *
> -			 * ARM64 KVM relies on kernel VA mapping to the PFN to
> -			 * perform cache maintenance as the CMO instructions work on
> -			 * virtual addresses. VM_PFNMAP region are not necessarily
> -			 * mapped to a KVA and hence the presence of hardware features
> -			 * S2FWB and CACHE DIC are mandatory to avoid the need for
> -			 * cache maintenance.
> -			 */
> -			if (!kvm_supports_cacheable_pfnmap())
> -				ret = -EFAULT;
> -		} else {
> -			/*
> -			 * If the page was identified as device early by looking at
> -			 * the VMA flags, fault->vma_pagesize is already representing the
> -			 * largest quantity we can map.  If instead it was mapped
> -			 * via __kvm_faultin_pfn(), fault->vma_pagesize is set to PAGE_SIZE
> -			 * and must not be upgraded.
> -			 *
> -			 * In both cases, we don't let transparent_hugepage_adjust()
> -			 * change things at the last minute.
> -			 */
> -			fault->s2_force_noncacheable = true;
> -		}
> -	} else if (fault->logging_active && !fault->write_fault) {
> -		/*
> -		 * Only actually map the page as fault->writable if this was a write
> -		 * fault.
> -		 */
> -		fault->writable = false;
> +	ret = kvm_s2_fault_compute_prot(fault);
> +	if (ret == 1) {
> +		ret = 1; /* fault injected */
> +		goto out_put_page;
>  	}
> -
> -	if (fault->exec_fault && fault->s2_force_noncacheable)
> -		ret = -ENOEXEC;
> -
>  	if (ret)
>  		goto out_put_page;
>  
> -	/*
> -	 * Guest performs atomic/exclusive operations on memory with unsupported
> -	 * attributes (e.g. ld64b/st64b on normal memory when no FEAT_LS64WB)
> -	 * and trigger the exception here. Since the fault->memslot is valid, inject
> -	 * the fault back to the guest.
> -	 */
> -	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(fault->vcpu))) {
> -		kvm_inject_dabt_excl_atomic(fault->vcpu, kvm_vcpu_get_hfar(fault->vcpu));
> -		ret = 1;
> -		goto out_put_page;
> -	}
> -
> -	if (fault->nested)
> -		adjust_nested_fault_perms(fault->nested, &fault->prot, &fault->writable);
> -
>  	kvm_fault_lock(kvm);
>  	pgt = fault->vcpu->arch.hw_mmu->pgt;
>  	if (mmu_invalidate_retry(kvm, fault->mmu_seq)) {
> @@ -1961,24 +1990,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  		}
>  	}
>  
> -	if (fault->writable)
> -		fault->prot |= KVM_PGTABLE_PROT_W;
> -
> -	if (fault->exec_fault)
> -		fault->prot |= KVM_PGTABLE_PROT_X;
> -
> -	if (fault->s2_force_noncacheable) {
> -		if (fault->vfio_allow_any_uc)
> -			fault->prot |= KVM_PGTABLE_PROT_NORMAL_NC;
> -		else
> -			fault->prot |= KVM_PGTABLE_PROT_DEVICE;
> -	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC)) {
> -		fault->prot |= KVM_PGTABLE_PROT_X;
> -	}
> -
> -	if (fault->nested)
> -		adjust_nested_exec_perms(kvm, fault->nested, &fault->prot);
> -
>  	/*
>  	 * Under the premise of getting a FSC_PERM fault, we just need to relax
>  	 * permissions only if fault->vma_pagesize equals fault->fault_granule. Otherwise,


