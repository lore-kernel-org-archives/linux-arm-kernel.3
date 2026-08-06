Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13315C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 23:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yK7VBLLiEyYXFN6c5UBfVy/7xge4jYybX2MxxbDVCdM=; b=UPh7BXy9PeVMx2qQnWuLtIrkjW
	mr/g8SnmXd+9OkqXMsO32OzLQeSsoJMfs6OniV+VyQntyRvi3lRmSdF5HHrE8Y7vmOjn9TJcWGbbi
	ECtnKEenvzB1g87mMHBcWwBw+bSxOPKVjpHe/SaKHu9ZmPdQ0OHEOLP3ykAWp8hB5fxR873uvWz1f
	6g3gSfhB49ztlMfDIJ/0LEmQ10iINEIp7U3YwxhlP/vsPI1Au73igHVjO+QMuATqL+uqS0rr2SLhN
	ATEOVCK1UO5D0Ntp4gGVHajiVZ7v2oDj2lHTAz3i4rJsFMlUj1IQm+R2UgAYkx75DYWQ06cDdU8ye
	8JrTPq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7Ex-00000006pjJ-3CgG;
	Thu, 06 Aug 2026 23:11:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws7Ev-00000006pix-3ThA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 23:11:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cf27856f9cso35013885ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 16:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786057865; cv=none;
        d=google.com; s=arc-20260327;
        b=q1TY2j8eTC1dZ55u4OOo/ih/sK5xxAqrhfV53m6qTRfeigU4KpObh6aUdbSeq3JtWf
         fHkhDdaz2dR3H6GNFzL7mwuLgA2RBwyvLbHydk2mwazO64CYDgewcG7UpkC16Pu7QXED
         K1QjIc/RzF//P2n+92E958ygOkCTvsLe9fEkROhhR7FJTxjrkWqjPEuF60bvdA1Rpm0y
         Vy1gbeSfxH1lzHgB1RnydOmX5h+pB7tPgH1uNf9u8DU6uHNF/ULGa8ZAQCemKt7KDU3u
         uObd5OSkJ1Ru575Q1i4qJAoHW7lu+bKY529JI9hAH2QHwnQ3Nk9eX8H1eRrYtFDof5IF
         VCtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=yK7VBLLiEyYXFN6c5UBfVy/7xge4jYybX2MxxbDVCdM=;
        fh=XvvpxwWgBtkjmHmHoN/VGYFNjeau5iApOrm2lwxXNQs=;
        b=GTnBqkjKhFluj6slqSScrVVnuryUltwDdC6Ju6KW+92JRFfS8BRV+p3ObWWgvzgDKt
         O+XwzpM16srhPLtkWYM5yjmXqbsfojPZ1Lz5Yj1iKstG3xjQdHKlCEGBlfBaT/ahUOEa
         oN81PBBEgaTPa2Y3Wgg+5LG62pwUtlxGf3rx+sUSHOIA1bvGDyVo39MLg1W0c1lKfLCw
         1afnmC1lFpDvtqhenHmERGay5s3ZAu2GRB1Nwm7ERK+5t1GR7DRMf67ngq0bpRRk2PH9
         htHpkTwqGZOQiO/QGztEwRRjd5CvE0wPXXlTnVuK9QdP1FdpiRF+G8MJSs2AzwspI9bU
         9Auw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786057865; x=1786662665; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yK7VBLLiEyYXFN6c5UBfVy/7xge4jYybX2MxxbDVCdM=;
        b=ushcgDLr597LjxtQWh9Sdidi989nBji8Z0yycj9Ci5Ay7ToTVqrKw0Z4uVKPdnTG65
         5FRGJzd3ioavh0Xz0SyMNJ5lCbsnwhb7fVbQg1v05FeygAObFgG8Lk+NMEVJO7qZVc/x
         CwrnTkjKxzmugeoeX7GvZyc77RBuT23fz4eq740BZ11XEVuz/+FQRvVKnBHXMTMqDyAD
         qU5q1JvChS3ALle9QmefpFKovduKJ4dyRjRtabHx/xnBi1TnsbEfGsbDrZ/btDtugZEf
         LfVSVdBYxaJ55UuaA9iQhC+QZ6omNou6wSYrhYnc6SB0sI0ZNsGRLAjOsvAIpu/fY566
         u2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786057865; x=1786662665;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yK7VBLLiEyYXFN6c5UBfVy/7xge4jYybX2MxxbDVCdM=;
        b=B44hDmsN3e/OCn4LzWrSnFOE6zH/L9uLXZj47pPca3r+rF+H8ZB16mD/v6arioRAIY
         TyWAgNxjG+mqEFPVlWNpIkUETmvRmEonB3j6mrgjYd7DhuF4780JT8FAd+S9RSWaBCl8
         oU/BTP/dRcqCkY3h2UpaJkZpqxqW8SKMcKY5/oTVzbPpM7t+Ef8LkVtiZhgb6P3GZoVD
         8iNdnPMi7S/q9OvSNvsM1kGQUotC2l2LQaR8Wp1gAT8DIH2vSv4FSIBop1/ypl5rxOC+
         ur8YHVV1dizPcBaekFIIeswTvuWPvNplPDFI22rfjm4xK+MCG2EE6WGOQLGHa68XeQmd
         NoFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbpxZ9dtu4twfEqroQOzRWdqS5IWTICBNncw+lKY+c3mqOuixmRWefL7pPqAGtDoeMVmYG6Q4ozrqxijxKVhxj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb6EFKStB3yJd5NS88qbCon7IkZq4xWMLdO/bf/dEOD0qPuHBi
	2adPAZKQ63YHO5whv8em74jx1ZHNome5/n/kGcu81B7Om+BMIt3RJzovuPFo08C7g9O8r8U4jE/
	5ZHl+FpznK0Z5uSVjQr8wOE0mlkpKr5OODnSLUDVH
X-Gm-Gg: AR+sD13mIVDReIY5kqQgOnazJZA6SbbtemB5AAwlEJUhfSQ3kwwCivuf3/iQ75gXbJ1
	Gac5mSW+RWZhGFIPfsNsDz8lqi2udZ3etncMsOfqBMof14NQgWvGQ8Afot/a+mwBPnElN8iMS1m
	PJuT0nk+Vi2T66xKdycnR8Sae4BsrrefBDh/qpT2lUen5mWamw6byd/fF8d+dnxhuABzBWZ88rk
	puR16751kyVzWl/3vJaMFMRuxqqGKImiZhocCW/i/gkl4Ex894qN0Foyv0XOW7bJBTFl1WG5wH6
	xEWGo3M+tQgOFrGF+gU6qXRHO/Q10dqgon3jl5289ifmlQzAv3oPTqTLuzeEZTlBG2ZIhtdW5V6
	QIu0/x2oy45YrxMIwxOHDUYGLegOz5K9vxhA=
X-Received: by 2002:a05:6a20:7350:b0:3c3:f371:1ea9 with SMTP id
 adf61e73a8af0-3cb85df12fbmr20744921637.10.1786057863909; Thu, 06 Aug 2026
 16:11:03 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Aug 2026 16:11:02 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Aug 2026 16:11:02 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260803134403.80630-30-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com> <20260803134403.80630-30-steven.price@arm.com>
MIME-Version: 1.0
Date: Thu, 6 Aug 2026 16:11:02 -0700
X-Gm-Features: AUfX_mzcxBku8HfloGVS7GeuKAhZNlklDoZe3BX8N-NxsuAYB3pCOeCzhnyuF-M
Message-ID: <CAEvNRgFB7xkjFgd38K92orLtvOQVngEYsPRky=DWpZ30BTnNDw@mail.gmail.com>
Subject: Re: [PATCH v16 29/45] KVM: arm64: CCA: Support runtime faulting of memory
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_161105_925402_68392FDE 
X-CRM114-Status: GOOD (  41.21  )
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

Steven Price <steven.price@arm.com> writes:

> At runtime if the realm guest accesses memory which hasn't yet been
> mapped then KVM needs to either populate the region or fault the guest.
>
> For memory in the lower (protected) region of IPA a fresh page is
> provided to the RMM which will zero the contents. For memory in the
> upper (shared) region of IPA, the memory from the memslot is mapped
> into the realm VM non secure.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v15:
>  * Handle negative error codes.
> Changes since v13:
>  * Numerous changes due to rebasing.
>  * Fix addr_range_desc() to encode the correct block size.
> Changes since v12:
>  * Switch to RMM v2.0 range based APIs.
> Changes since v11:
>  * Adapt to upstream changes.
> Changes since v10:
>  * RME->RMI renaming.
>  * Adapt to upstream gmem changes.
> Changes since v9:
>  * Fix call to kvm_stage2_unmap_range() in kvm_free_stage2_pgd() to set
>    may_block to avoid stall warnings.
>  * Minor coding style fixes.
> Changes since v8:
>  * Propagate the may_block flag.
>  * Minor comments and coding style changes.
> Changes since v7:
>  * Remove redundant WARN_ONs for realm_create_rtt_levels() - it will
>    internally WARN when necessary.
> Changes since v6:
>  * Handle PAGE_SIZE being larger than RMM granule size.
>  * Some minor renaming following review comments.
> Changes since v5:
>  * Reduce use of struct page in preparation for supporting the RMM
>    having a different page size to the host.
>  * Handle a race when delegating a page where another CPU has faulted on
>    a the same page (and already delegated the physical page) but not yet
>    mapped it. In this case simply return to the guest to either use the
>    mapping from the other CPU (or refault if the race is lost).
>  * The changes to populate_par_region() are moved into the previous
>    patch where they belong.
> Changes since v4:
>  * Code cleanup following review feedback.
>  * Drop the PTE_SHARED bit when creating unprotected page table entries.
>    This is now set by the RMM and the host has no control of it and the
>    spec requires the bit to be set to zero.
> Changes since v2:
>  * Avoid leaking memory if failing to map it in the realm.
>  * Correctly mask RTT based on LPA2 flag (see rtt_get_phys()).
>  * Adapt to changes in previous patches.
> ---
>  arch/arm64/include/asm/kvm_emulate.h |   8 +
>  arch/arm64/include/asm/kvm_rmi.h     |   5 +
>  arch/arm64/kvm/mmu.c                 |  97 ++++++++----
>  arch/arm64/kvm/rmi.c                 | 220 +++++++++++++++++++++++++++
>  4 files changed, 304 insertions(+), 26 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 2e69fe494716..8b6f9d26b5d8 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -712,6 +712,14 @@ static inline bool kvm_realm_is_created(struct kvm *kvm)
>  	return kvm_is_realm(kvm) && kvm_realm_state(kvm) != REALM_STATE_NONE;
>  }
>
> +static inline gpa_t kvm_gpa_from_fault(struct kvm *kvm, phys_addr_t ipa)
> +{
> +	if (!kvm_is_realm(kvm))
> +		return ipa;
> +
> +	return ipa & ~BIT(kvm->arch.realm.ia_bits - 1);
> +}
> +
>  static inline bool vcpu_is_rec(const struct kvm_vcpu *vcpu)
>  {
>  	return kvm_is_realm(vcpu->kvm);
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index 03f8bd2d13a2..967c0a6e8e9c 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -6,6 +6,7 @@
>  #ifndef __ASM_KVM_RMI_H
>  #define __ASM_KVM_RMI_H
>
> +#include <asm/kvm_pgtable.h>
>  #include <linux/arm-smccc-rmi.h>
>
>  /**
> @@ -117,6 +118,10 @@ void kvm_realm_unmap_range(struct kvm *kvm,
>  			   unsigned long size,
>  			   bool unmap_private,
>  			   bool may_block);
> +int realm_map_ipa(struct kvm *kvm, phys_addr_t ipa,
> +		  kvm_pfn_t pfn, unsigned long map_size,
> +		  enum kvm_pgtable_prot prot,
> +		  struct kvm_mmu_memory_cache *memcache);
>
>  static inline bool kvm_realm_is_private_address(struct realm *realm,
>  						unsigned long addr)
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index dcc2ab08d0e4..79119cb136b0 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -334,8 +334,15 @@ static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64
>
>  	lockdep_assert_held_write(&kvm->mmu_lock);
>  	WARN_ON(size & ~PAGE_MASK);
> -	WARN_ON(stage2_apply_range(mmu, start, end, KVM_PGT_FN(kvm_pgtable_stage2_unmap),
> -				   may_block));
> +
> +	if (kvm_is_realm(kvm)) {
> +		kvm_realm_unmap_range(kvm, start, size, !only_shared,
> +				      may_block);
> +	} else {
> +		WARN_ON(stage2_apply_range(mmu, start, end,
> +					   KVM_PGT_FN(kvm_pgtable_stage2_unmap),
> +					   may_block));
> +	}
>  }
>
>  void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
> @@ -358,7 +365,10 @@ static void stage2_flush_memslot(struct kvm *kvm,
>  	phys_addr_t addr = memslot->base_gfn << PAGE_SHIFT;
>  	phys_addr_t end = addr + PAGE_SIZE * memslot->npages;
>
> -	kvm_stage2_flush_range(&kvm->arch.mmu, addr, end);
> +	if (kvm_is_realm(kvm))
> +		kvm_realm_unmap_range(kvm, addr, end - addr, false, true);
> +	else
> +		kvm_stage2_flush_range(&kvm->arch.mmu, addr, end);
>  }
>
>  /**
> @@ -1137,6 +1147,10 @@ void stage2_unmap_vm(struct kvm *kvm)
>  	struct kvm_memory_slot *memslot;
>  	int idx, bkt;
>
> +	/* For realms this is handled by the RMM so nothing to do here */
> +	if (kvm_is_realm(kvm))
> +		return;
> +
>  	idx = srcu_read_lock(&kvm->srcu);
>  	mmap_read_lock(current->mm);
>  	write_lock(&kvm->mmu_lock);
> @@ -1641,18 +1655,20 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>  	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
>  	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
>  	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
> -	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
> +	struct kvm_vcpu *vcpu = s2fd->vcpu;
> +	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
> +	gpa_t gpa = kvm_gpa_from_fault(vcpu->kvm, s2fd->fault_ipa);
>  	unsigned long mmu_seq;
>  	struct page *page;
> -	struct kvm *kvm = s2fd->vcpu->kvm;
> +	struct kvm *kvm = vcpu->kvm;
>  	void *memcache = NULL;
>  	kvm_pfn_t pfn;
>  	gfn_t gfn;
>  	int ret;
>
>  	if (!perm_fault) {
> -		memcache = get_mmu_memcache(s2fd->vcpu);
> -		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
> +		memcache = get_mmu_memcache(vcpu);
> +		ret = topup_mmu_memcache(vcpu, memcache);
>  		if (ret)
>  			return ret;
>  	}
> @@ -1660,10 +1676,10 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>  	if (s2fd->nested)
>  		gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
>  	else
> -		gfn = s2fd->fault_ipa >> PAGE_SHIFT;
> +		gfn = gpa >> PAGE_SHIFT;

I've seen a gpa_to_gfn(), not sure if it works for ARM or works here.

>
> -	write_fault = kvm_is_write_fault(s2fd->vcpu);
> -	exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu);
> +	write_fault = kvm_is_write_fault(vcpu);
> +	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
>
>  	VM_WARN_ON_ONCE(write_fault && exec_fault);
>
> @@ -1673,7 +1689,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>
>  	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL);
>  	if (ret) {
> -		kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
> +		kvm_prepare_memory_fault_exit(vcpu, gpa, PAGE_SIZE,
>  					      write_fault, exec_fault, false);
>  		return ret;
>  	}
> @@ -1693,7 +1709,14 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>  	kvm_fault_lock(kvm);
>  	if (mmu_invalidate_retry(kvm, mmu_seq)) {
>  		ret = -EAGAIN;
> -		goto out_unlock;
> +		goto out_release_page;
> +	}
> +
> +	if (kvm_is_realm(kvm)) {
> +		prot &= ~KVM_PGTABLE_PROT_X;
> +		ret = realm_map_ipa(kvm, s2fd->fault_ipa, pfn,
> +				    PAGE_SIZE, prot, memcache);
> +		goto out_release_page;
>  	}
>
>  	if (perm_fault) {
> @@ -1710,7 +1733,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>  							 memcache, flags);
>  	}
>
> -out_unlock:
> +out_release_page:
>  	kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);
>  	kvm_fault_unlock(kvm);
>
> @@ -1896,7 +1919,7 @@ static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
>  	 * mapping size to ensure we find the right PFN and lay down the
>  	 * mapping in the right place.
>  	 */
> -	s2vi->gfn = ALIGN_DOWN(s2fd->fault_ipa, s2vi->vma_pagesize) >> PAGE_SHIFT;
> +	s2vi->gfn = kvm_gpa_from_fault(kvm, ALIGN_DOWN(s2fd->fault_ipa, s2vi->vma_pagesize)) >> PAGE_SHIFT;
>
>  	s2vi->mte_allowed = kvm_vma_mte_allowed(vma);
>
> @@ -2092,12 +2115,15 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  	if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
>  		sanitise_mte_tags(kvm, pfn, mapping_size);
>
> -	/*
> -	 * Under the premise of getting a FSC_PERM fault, we just need to relax
> -	 * permissions only if mapping_size equals perm_fault_granule. Otherwise,
> -	 * kvm_pgtable_stage2_map() should be called to change block size.
> -	 */
> -	if (mapping_size == perm_fault_granule) {
> +	if (kvm_is_realm(kvm)) {
> +		ret = realm_map_ipa(kvm, s2fd->fault_ipa, pfn, mapping_size,
> +				    prot, memcache);
> +	} else if (mapping_size == perm_fault_granule) {
> +		/*
> +		 * Under the premise of getting a FSC_PERM fault, we just need to relax
> +		 * permissions only if mapping_size equals perm_fault_granule. Otherwise,
> +		 * kvm_pgtable_stage2_map() should be called to change block size.
> +		 */
>  		/*
>  		 * Drop the SW bits in favour of those stored in the
>  		 * PTE, which will be preserved.
> @@ -2263,6 +2289,13 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>  	return 0;
>  }
>
> +static bool shared_ipa_fault(struct kvm *kvm, phys_addr_t fault_ipa)
> +{
> +	gpa_t gpa = kvm_gpa_from_fault(kvm, fault_ipa);
> +
> +	return (gpa != fault_ipa);

If I understood the intent here I think checking kvm->arch.realm.ia_bits
is more obvious. It'd be actually checking if the address is private or
shared rather than going through kvm_gpa_from_fault() indirectly.

Also perhaps define private_ipa_fault() would be better instead of
defining shared and then checking !shared below.

Actually there's already kvm_realm_is_private_address(), perhaps that
can be reused.

> +}
> +
>  /**
>   * kvm_handle_guest_abort - handles all 2nd stage aborts
>   * @vcpu:	the VCPU pointer
> @@ -2373,8 +2406,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  		nested = &nested_trans;
>  	}
>
> -	gfn = ipa >> PAGE_SHIFT;
> +	gfn = kvm_gpa_from_fault(vcpu->kvm, ipa) >> PAGE_SHIFT;
>  	memslot = gfn_to_memslot(vcpu->kvm, gfn);
> +
>  	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
>  	write_fault = kvm_is_write_fault(vcpu);
>  	if (kvm_is_error_hva(hva) || (write_fault && !writable)) {
> @@ -2417,7 +2451,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  		 * of the page size.
>  		 */
>  		ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(vcpu));
> -		ret = io_mem_abort(vcpu, ipa);
> +		ret = io_mem_abort(vcpu, kvm_gpa_from_fault(vcpu->kvm, ipa));
>  		goto out_unlock;
>  	}
>
> @@ -2445,7 +2479,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  				!write_fault &&
>  				!kvm_vcpu_trap_is_exec_fault(vcpu));
>
> -		if (kvm_slot_has_gmem(memslot))
> +		if (kvm_slot_has_gmem(memslot) &&
> +		    (kvm_memslot_is_gmem_only(memslot) ||
> +		     !shared_ipa_fault(vcpu->kvm, fault_ipa)))
>  			ret = gmem_abort(&s2fd);
>  		else
>  			ret = user_mem_abort(&s2fd);
> @@ -2482,6 +2518,10 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
>  		return false;
>
> +	/* We don't support aging for Realms */
> +	if (kvm_is_realm(kvm))
> +		return true;
> +
>  	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
>  						   range->start << PAGE_SHIFT,
>  						   size, true);
> @@ -2498,6 +2538,10 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
>  		return false;
>
> +	/* We don't support aging for Realms */
> +	if (kvm_is_realm(kvm))
> +		return true;
> +
>  	return KVM_PGT_FN(kvm_pgtable_stage2_test_clear_young)(kvm->arch.mmu.pgt,
>  						   range->start << PAGE_SHIFT,
>  						   size, false);

These sound like they should be in a separate patch since it's to do
with aging and not faulting.

> @@ -2677,10 +2721,11 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>  		return -EFAULT;
>
>  	/*
> -	 * Only support guest_memfd backed memslots with mappable memory, since
> -	 * there aren't any CoCo VMs that support only private memory on arm64.
> +	 * Only support guest_memfd backed memslots with mappable memory,
> +	 * unless the guest is a CCA realm guest.
>  	 */
> -	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
> +	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new) &&
> +	    !kvm_is_realm(kvm))
>  		return -EINVAL;
>
>  	hva = new->userspace_addr;
> diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> index 4f362fd21477..3ef185bc8210 100644
> --- a/arch/arm64/kvm/rmi.c
> +++ b/arch/arm64/kvm/rmi.c
> @@ -649,6 +649,226 @@ static int realm_data_map_init(struct kvm *kvm, unsigned long ipa,
>  	return ret <= 0 ? ret : -ENXIO;
>  }
>
>
> [...snip...]
>
> +static int realm_map_protected(struct kvm *kvm,
> +			       unsigned long ipa,
> +			       kvm_pfn_t pfn,
> +			       unsigned long map_size,
> +			       struct kvm_mmu_memory_cache *memcache)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +	phys_addr_t phys = __pfn_to_phys(pfn);
> +	phys_addr_t base_phys = phys;
> +	phys_addr_t rd = virt_to_phys(realm->rd);
> +	phys_addr_t delegated_phys;
> +	unsigned long base_ipa = ipa;
> +	unsigned long ipa_top;
> +	long ret = 0;
> +
> +	if (WARN_ON(!IS_ALIGNED(map_size, PAGE_SIZE) ||
> +		    !IS_ALIGNED(ipa, map_size)))
> +		return -EINVAL;
> +
> +	if (rmi_delegate_range(phys, map_size, &delegated_phys)) {
> +		if (delegated_phys == phys) {
> +			/*
> +			 * It's likely we raced with another VCPU on the same
> +			 * fault. Assume the other VCPU has handled the fault
> +			 * and return to the guest.
> +			 */
> +			return 0;
> +		}
> +		/* Partial delegation - map as much as we can */
> +		map_size = delegated_phys - phys;
> +	}
> +
> +	ipa_top = ipa + map_size;
> +
> +	while (ipa < ipa_top) {
> +		unsigned long flags = RMI_ADDR_TYPE_SINGLE;
> +		unsigned long range_desc = addr_range_desc(phys, ipa_top - ipa,
> +							   RMI_OP_MEM_DELEGATED);
> +		unsigned long out_top;
> +
> +		ret = rmi_rtt_data_map(rd, ipa, ipa_top, flags, range_desc,
> +				       &out_top);
> +		if (ret < 0)
> +			goto err_undelegate;
> +
> +		if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
> +			/* Create missing RTTs and retry */
> +			int level = RMI_RETURN_INDEX(ret);
> +
> +			if (WARN_ON(level >= KVM_PGTABLE_LAST_LEVEL))
> +				goto err_undelegate;
> +			ret = realm_create_rtt_levels(realm, ipa, level,
> +						      level + 1,
> +						      memcache);
> +			if (ret)
> +				goto err_undelegate;
> +
> +			continue;
> +		}
> +
> +		if (WARN_ON(ret))
> +			goto err_undelegate;
> +
> +		phys += out_top - ipa;
> +		ipa = out_top;
> +	}
> +
> +	return 0;
> +
> +err_undelegate:
> +	realm_unmap_private_range(kvm, base_ipa, ipa, true);
> +	if (WARN_ON(rmi_undelegate_range(base_phys, map_size))) {
> +		/* Page can't be returned to NS world so is lost */
> +		get_page(phys_to_page(base_phys));

Please see my comment on the other patch about taking a refcount. This
will interfere with conversions.

> +	}
> +	return ret < 0 ? ret : -ENXIO;
> +}
> +
>
> [...snip...]
>

