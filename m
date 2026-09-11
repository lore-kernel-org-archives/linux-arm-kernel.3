Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF390C88E5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rScGuJuSO3ZHRVhTtYzpAHUJbBJSFdkIzxRCkOokAS0=; b=A2gc4T9Y0jRbfMxAU23Mpv0QO7
	eBQxwEm4NupXThVlMho9fX5f6RJmUIwKWOubJDLttnx16Pi8BthCJSKNpE2nuDQGSySRTegBcjN/D
	aBz7irWz7B+RaI9AMoir1aS+nofv76FcJDDvc6jBcyHSuOY/BTQIyYbGppi+Ek8BRvHrtgvmVWzHQ
	uoB9j9oF5F1fsfTK3JaaufUkvrJh5Z5Rf8aHpy+bOw31Q06urdw1KHmxrO/r2EEUX/kSTPu54+M/j
	ceh1p1BJQ5neYtkT3+D3K6ep5aF6hWlULdcmQDiXlZThIfvXD3qWU4Hubi08hL3MRtS9nzR9AqNoj
	dD7MW4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fT-0000000GoUi-2Bhn;
	Fri, 11 Sep 2026 13:51:51 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fB-0000000Go7N-1o1x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:34 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49e635a6002so7405615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134688; x=1789739488; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rScGuJuSO3ZHRVhTtYzpAHUJbBJSFdkIzxRCkOokAS0=;
        b=sSTTrPupbmpmUwYnpWOc7VdYJ9Ewl4Fp3WJEC24644npkjN9hYbUKH2PnBVU/Z0LQt
         ptICTKkOeBAQ+1noKP7JMTAeYpZbKPp6j9NVxVphMma9H1uQ7hdSLlLmathTIuH71ARX
         SvDUDnSHfCKptpaN9320AqUq3mANHkiuCMz4Q+zWMYugkp+Hd6AbnLu/UmS4Xr8CrFdC
         uK8v/B4+Xzwe9hlphESAAumOmeqMmyQYYbHWxiiV4ANHOzSBuSejVa2j8tcWyUZHFkvb
         z4gmuyzyl7adZieVELIK53nG90nEOqk/U2nHofw+eOW7p7niLye+vjG16Xnh5iZRANr0
         3UWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134688; x=1789739488;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rScGuJuSO3ZHRVhTtYzpAHUJbBJSFdkIzxRCkOokAS0=;
        b=gdyh+NFTl5ZJgth1FQSMgF8JeZ4X8CrJ6w5aD9PAjWTDthnAlWhiOjFrazeXCE6cuA
         LnzLuqR7lK2+yw7Ax6rg2eeV9DZD8G1jFhZ1a4z4dGbW4RHRCEkaIVM82leyYsFQU4+A
         LL97Mk5uHWLMiZmv49DePa7y2S0V5KHPDIhL71YrqG0fSKjS2eBRb1kDYwkMQ1hXYvv8
         FHvRimV2EDPcBX4Uk75mqDcAhEgF0BeA9wq3jOmQS62xhy4hRhipW+abXhlguRFDd0Q9
         ghySGizbOE6GReCbKJIPU0+Yj7r3rn3PGKBD50vlx4cSch24lZVCrR+3itAnSuppZ0Ai
         vMJg==
X-Forwarded-Encrypted: i=1; AKwUvBwHepOv4v+cNQzswnwAue5dbOhIYPrXNRe0YjVyYj3KeO2PiPcioymIq3jB/pNUg6ZreYJlKwId3OOn/ttJnd8z@lists.infradead.org
X-Gm-Message-State: AFuF++lQGrv3N06K6rfAxpo4Wg9xKy0NQP9hVTM66SqT/nZ0I9n2BrpG
	JzB8cuy5naR3CoYMv6TLkDW03smAM66KUGVhXLkK3LdQIK6p7pd1DErphWW8RG+317i0Nnp6X8c
	mKy7Hakouqf16Dr5RrqbSjA==
X-Received: from wmoz7.prod.google.com ([2002:a05:600c:787:b0:49d:2665:3786])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d08:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49e619c6178mr56309445e9.23.1789134687852;
 Fri, 11 Sep 2026 06:51:27 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:53 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-23-vdonnefort@google.com>
Subject: [PATCH v2 22/22] KVM: arm64: Stage-2 huge mappings for protected VMs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065133_539968_6BF70767 
X-CRM114-Status: GOOD (  20.09  )
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

Enable PMD-sized stage-2 block mappings for protected VMs. This is
possible whenever the stage-1 mapping allows it, that is, if it is
itself backed by THPs.

When a THP is found, an entire PMD_SIZE mapping is donated to the guest.
This mapping can only be broken down via the HVC
__pkvm_host_split_guest() which the hypervisor can request with
PKVM_HYP_REQ_SPLIT.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/mmu.c  | 119 +++++++++++++++++++++++++++---------------
 arch/arm64/kvm/pkvm.c |  21 ++++----
 2 files changed, 89 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9ba86450fe4a..218df096c72e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1690,52 +1690,26 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 	return ret != -EAGAIN ? ret : 0;
 }
 
-struct kvm_s2_fault_vma_info {
-	unsigned long	mmu_seq;
-	long		vma_pagesize;
-	vm_flags_t	vm_flags;
-	unsigned long	max_map_size;
-	struct page	*page;
-	kvm_pfn_t	pfn;
-	gfn_t		gfn;
-	bool		device;
-	bool		mte_allowed;
-	bool		is_vma_cacheable;
-	bool		map_writable;
-	bool		map_non_cacheable;
-};
-
-static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+static int pkvm_pin_user_pages(const struct kvm_s2_fault_desc *s2fd, struct page **__page,
+			       unsigned long *__size, kvm_pfn_t *__pfn, gfn_t *__gfn)
 {
 	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
 	struct kvm_vcpu *vcpu = s2fd->vcpu;
-	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
 	struct mm_struct *mm = current->mm;
 	struct kvm *kvm = vcpu->kvm;
-	void *hyp_memcache;
 	struct page *page;
-	int ret;
+	kvm_pfn_t pfn;
+	gfn_t gfn;
+	long ret;
 
-	hyp_memcache = get_mmu_memcache(vcpu);
-	ret = topup_mmu_memcache(vcpu, hyp_memcache);
-	if (ret)
-		return -ENOMEM;
+	guard(mmap_read_lock)(mm);
 
-	ret = account_locked_vm(mm, 1, true);
-	if (ret)
-		return ret;
-
-	mmap_read_lock(mm);
 	ret = pin_user_pages(s2fd->hva, 1, flags, &page);
-	mmap_read_unlock(mm);
-
 	if (ret == -EHWPOISON) {
 		kvm_send_hwpoison_signal(s2fd->hva, PAGE_SHIFT);
-		ret = 0;
-		goto dec_account;
+		return 0;
 	} else if (ret != 1) {
-		ret = -EFAULT;
-		goto dec_account;
+		return -EFAULT;
 	} else if (!folio_test_swapbacked(page_folio(page))) {
 		/*
 		 * We really can't deal with page-cache pages returned by GUP
@@ -1751,29 +1725,90 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		 * pages backed by swap in the knowledge that the GUP pin will
 		 * prevent try_to_unmap() from succeeding.
 		 */
-		ret = -EIO;
-		goto unpin;
+		unpin_user_page(page);
+		return -EIO;
 	}
 
+	pfn = page_to_pfn(page);
+	gfn = gpa_to_gfn(s2fd->fault_ipa);
+
+	ret = transparent_hugepage_adjust(kvm, s2fd->memslot, s2fd->hva, &pfn, &gfn);
+	if (ret < 0) {
+		unpin_user_page(page);
+		return ret;
+	} else if (ret == PMD_SIZE && WARN_ON_ONCE(folio_size(page_folio(page)) < PMD_SIZE)) {
+		unpin_user_page(page);
+		return -EINVAL;
+	}
+
+	*__page = page;
+	*__size = ret;
+	*__pfn = pfn;
+	*__gfn = gfn;
+
+	return 0;
+}
+
+static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+{
+	struct kvm_vcpu *vcpu = s2fd->vcpu;
+	struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
+	struct mm_struct *mm = current->mm;
+	struct kvm *kvm = vcpu->kvm;
+	unsigned long size;
+	void *hyp_memcache;
+	struct page *page;
+	kvm_pfn_t pfn;
+	gfn_t gfn;
+	int ret;
+
+	hyp_memcache = get_mmu_memcache(vcpu);
+	ret = topup_mmu_memcache(vcpu, hyp_memcache);
+	if (ret)
+		return -ENOMEM;
+
+	ret = pkvm_pin_user_pages(s2fd, &page, &size, &pfn, &gfn);
+	if (ret)
+		return ret;
+
+	ret = account_locked_vm(mm, size / PAGE_SIZE, true);
+	if (ret)
+		goto unpin;
+
 	write_lock(&kvm->mmu_lock);
-	ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
-				      page_to_phys(page), KVM_PGTABLE_PROT_RWX,
-				      hyp_memcache, 0);
+	ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(gfn), size, __pfn_to_phys(pfn),
+				      KVM_PGTABLE_PROT_RWX, hyp_memcache, 0);
 	write_unlock(&kvm->mmu_lock);
 	if (ret) {
 		if (ret == -EAGAIN)
 			ret = 0;
+
+		account_locked_vm(mm, size / PAGE_SIZE, false);
 		goto unpin;
 	}
 
 	return 0;
+
 unpin:
-	unpin_user_pages(&page, 1);
-dec_account:
-	account_locked_vm(mm, 1, false);
+	unpin_user_page(page);
 	return ret;
 }
 
+struct kvm_s2_fault_vma_info {
+	unsigned long	mmu_seq;
+	long		vma_pagesize;
+	vm_flags_t	vm_flags;
+	unsigned long	max_map_size;
+	struct page	*page;
+	kvm_pfn_t	pfn;
+	gfn_t		gfn;
+	bool		device;
+	bool		mte_allowed;
+	bool		is_vma_cacheable;
+	bool		map_writable;
+	bool		map_non_cacheable;
+};
+
 static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 				     struct kvm_s2_fault_vma_info *s2vi,
 				     struct vm_area_struct *vma)
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 2840053ef2f4..6a4f35067642 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -446,9 +446,8 @@ static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64
 			continue;
 
 		page = pfn_to_page(mapping->pfn);
-		WARN_ON_ONCE(mapping->nr_pages != 1);
 		unpin_user_pages_dirty_lock(&page, 1, true);
-		account_locked_vm(kvm->mm, 1, false);
+		account_locked_vm(kvm->mm, mapping->nr_pages, false);
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
 		kfree(mapping);
 	}
@@ -513,17 +512,23 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 end = addr + size;
 	int ret;
 
+	if (WARN_ON_ONCE(size != PAGE_SIZE && size != PMD_SIZE))
+		return -EINVAL;
+
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, end - 1);
 
 	if (kvm_vm_is_protected(kvm)) {
-		/* Protected VMs are mapped using RWX page-granular mappings */
-		if (WARN_ON_ONCE(size != PAGE_SIZE))
-			return -EINVAL;
-
 		if (WARN_ON_ONCE(prot != KVM_PGTABLE_PROT_RWX))
 			return -EINVAL;
 
+		/*
+		 * If a huge mapping overlaps an existing PAGE_SIZE one,
+		 * then the VMM has played games with the stage-1. Abort.
+		 */
+		if (WARN_ON_ONCE(mapping && mapping->nr_pages == 1 && size > PAGE_SIZE))
+			return -EFAULT;
+
 		/*
 		 * We either raced with another vCPU or the guest PTE
 		 * has been poisoned by an erroneous host access.
@@ -533,10 +538,8 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			return ret ? -EFAULT : -EAGAIN;
 		}
 
-		ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn, size / PAGE_SIZE);
 	} else {
-		if (WARN_ON_ONCE(size != PAGE_SIZE && size != PMD_SIZE))
-			return -EINVAL;
 
 		/*
 		 * We either raced with another vCPU or we're changing between
-- 
2.55.0.1007.g17ff1f9808-goog


