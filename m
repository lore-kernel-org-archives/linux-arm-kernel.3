Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5290FEB48F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 10:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I45cYCySq4DITv5hSNSApr8kPzBDBWNX7/ycIqTH6V0=; b=VK66Ovvf683etZtV0TjI6NZZwE
	NWKeC2PA8hMgdPrudixtQRa02+5K+jtSnsrR6M8j/U81wIwY2/ijy5715Xq58lmlVwlDElz/1q/XM
	h6YdZ4c18f1I8iy5I5tO9iw3Gxe2/z3HwUqPOF6ScLLb9Zt4YuXhA5rmMWSq9eolNFAJzZQttHI+k
	rbnxQYdeiLi3u5avF/jHc0gbw7sw/e7uoTI/PV0l3cTzUb1rgE3zruuOXbb1CXUBckZ+hQLkxVjwy
	lfwN626vqkfMiPPpwJMBRDJFEUXMryy0/YOdNqUZmgNa/ZbcSBFccgLjqLIrm3d9oCv/knegC1Wvf
	fkOqeWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqU4j-00000001wov-1REG;
	Thu, 12 Feb 2026 10:37:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqU4g-00000001woQ-2fpC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 10:37:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3CE8339;
	Thu, 12 Feb 2026 02:37:19 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 286023F632;
	Thu, 12 Feb 2026 02:37:22 -0800 (PST)
Date: Thu, 12 Feb 2026 10:37:19 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 14/35] KVM: arm64: Handle aborts from protected VMs
Message-ID: <aY2tX6V0pCqwGth5@raptor>
References: <20260119124629.2563-1-will@kernel.org>
 <20260119124629.2563-15-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119124629.2563-15-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_023730_777080_AAA5CD7D 
X-CRM114-Status: GOOD (  32.77  )
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

Hi Will,

On Mon, Jan 19, 2026 at 12:46:07PM +0000, Will Deacon wrote:
> Introduce a new abort handler for resolving stage-2 page faults from
> protected VMs by pinning and donating anonymous memory. This is
> considerably simpler than the infamous user_mem_abort() as we only have
> to deal with translation faults at the pte level.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/mmu.c | 89 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 81 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index a23a4b7f108c..b21a5bf3d104 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1641,6 +1641,74 @@ static int gmem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	return ret != -EAGAIN ? ret : 0;
>  }
>  
> +static int pkvm_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> +		struct kvm_memory_slot *memslot, unsigned long hva)
> +{
> +	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
> +	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> +	struct mm_struct *mm = current->mm;
> +	struct kvm *kvm = vcpu->kvm;
> +	void *hyp_memcache;
> +	struct page *page;
> +	int ret;
> +
> +	ret = prepare_mmu_memcache(vcpu, true, &hyp_memcache);
> +	if (ret)
> +		return -ENOMEM;
> +
> +	ret = account_locked_vm(mm, 1, true);
> +	if (ret)
> +		return ret;
> +
> +	mmap_read_lock(mm);
> +	ret = pin_user_pages(hva, 1, flags, &page);
> +	mmap_read_unlock(mm);

If the page is part of a large folio, the entire folio gets pinned here, not
just the page returned by pin_user_pages(). Do you reckon that should be
considered when calling account_locked_vm()?

> +
> +	if (ret == -EHWPOISON) {
> +		kvm_send_hwpoison_signal(hva, PAGE_SHIFT);
> +		ret = 0;
> +		goto dec_account;
> +	} else if (ret != 1) {
> +		ret = -EFAULT;
> +		goto dec_account;
> +	} else if (!folio_test_swapbacked(page_folio(page))) {
> +		/*
> +		 * We really can't deal with page-cache pages returned by GUP
> +		 * because (a) we may trigger writeback of a page for which we
> +		 * no longer have access and (b) page_mkclean() won't find the
> +		 * stage-2 mapping in the rmap so we can get out-of-whack with
> +		 * the filesystem when marking the page dirty during unpinning
> +		 * (see cc5095747edf ("ext4: don't BUG if someone dirty pages
> +		 * without asking ext4 first")).

I've been trying to wrap my head around this. Would you mind providing a few
more hints about what the issue is? I'm sure the approach is correct, it's
likely just me not being familiar with the code.

> +		 *
> +		 * Ideally we'd just restrict ourselves to anonymous pages, but
> +		 * we also want to allow memfd (i.e. shmem) pages, so check for
> +		 * pages backed by swap in the knowledge that the GUP pin will
> +		 * prevent try_to_unmap() from succeeding.
> +		 */
> +		ret = -EIO;
> +		goto unpin;
> +	}
> +
> +	write_lock(&kvm->mmu_lock);
> +	ret = pkvm_pgtable_stage2_map(pgt, fault_ipa, PAGE_SIZE,
> +				      page_to_phys(page), KVM_PGTABLE_PROT_RWX,
> +				      hyp_memcache, 0);
> +	write_unlock(&kvm->mmu_lock);
> +	if (ret) {
> +		if (ret == -EAGAIN)
> +			ret = 0;
> +		goto unpin;
> +	}

This looks correct to me, there's no need to check for the notifier sequence
number if the MMU notifiers are ignored. And concurrent faults on the same page
are handled by treating -EAGAIN as success.

> +
> +	return 0;
> +unpin:
> +	unpin_user_pages(&page, 1);
> +dec_account:
> +	account_locked_vm(mm, 1, false);
> +	return ret;
> +}
> +
>  static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  			  struct kvm_s2_trans *nested,
>  			  struct kvm_memory_slot *memslot, unsigned long hva,
> @@ -2190,15 +2258,20 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  		goto out_unlock;
>  	}
>  
> -	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> -			!write_fault && !kvm_vcpu_trap_is_exec_fault(vcpu));
> +	if (kvm_vm_is_protected(vcpu->kvm)) {
> +		ret = pkvm_mem_abort(vcpu, fault_ipa, memslot, hva);

I guess the reason this comes after handling an access fault is because you want
the WARN_ON() to trigger in pkvm_pgtable_stage2_mkyoung().

Thanks,
Alex

> +	} else {
> +		VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
> +				!write_fault &&
> +				!kvm_vcpu_trap_is_exec_fault(vcpu));
>  
> -	if (kvm_slot_has_gmem(memslot))
> -		ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
> -				 esr_fsc_is_permission_fault(esr));
> -	else
> -		ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
> -				     esr_fsc_is_permission_fault(esr));
> +		if (kvm_slot_has_gmem(memslot))
> +			ret = gmem_abort(vcpu, fault_ipa, nested, memslot,
> +					 esr_fsc_is_permission_fault(esr));
> +		else
> +			ret = user_mem_abort(vcpu, fault_ipa, nested, memslot, hva,
> +					     esr_fsc_is_permission_fault(esr));
> +	}
>  	if (ret == 0)
>  		ret = 1;
>  out:
> -- 
> 2.52.0.457.g6b5491de43-goog
> 
> 

