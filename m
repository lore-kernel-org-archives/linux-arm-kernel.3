Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03ACFC55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWJpQyl/g2RqJgCgTY6pf6J8qG4fWAUjdjE8mT7VVHo=; b=pWInmGq19LEnfo+cjP6AF1fjnb
	PxpyUCl5nqcp+XW3NmVtpP7s6Z71kyfT55r3/hUmM05MwlKrjbjtTQDp3nTOGMO/+v7x9vYR4Bw3G
	u4vgWSkIblB6FVdYe/NHiRiQG+QnZgXg0NNqGlKT/QjjJ7K9bwppB2LLpy+73uKlMSq+wKPIls9lx
	jfDapjH9ybsjrHQDqdDGojxEiOqJ89rpfadAL9viLhrA60tROrTOBMNwmvKxdAuZic4/k8YNClxbM
	iaEjjiD6eSuvusDGszBtmbyi2ljAv4CjP4kzUQ09mNc88CIaYlfKgtKiHqZftsZ+43pLV5I0egMIX
	hPC0xUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdm-0000000GnXQ-0k6x;
	Mon, 03 Aug 2026 10:11:26 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdi-0000000GnLh-2y4E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:24 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49545071724so20267115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751880; x=1786356680; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWJpQyl/g2RqJgCgTY6pf6J8qG4fWAUjdjE8mT7VVHo=;
        b=LDpizsZyW/z8D0SOJUJh2QRMTRr0/9arkTTfepqDzFm9tPSyjUstD6tNX3h4rW0+6o
         JV6kGz0h1sMDGYmLG0uTmwXPHm8rSCzgCEOPYNlsAEmAGz3xnAd0sDjXOoE17P2770/Q
         DnS3UnqgssUdR043HKXOWr1NMPGc4uZ3m4uzWryP7S5gZLwLoa0D/VKPAwwPO3AEmjGB
         sVLtrxkUQhPD231FsBWELFubvWzPdatqiQgxI9P9misYoY0NMQvFBTcaZleweHJr5718
         /VgD1u0iMdjleMiFEJBG1ambyVKdBOVnmX7FO+EX2SKfAzpzL+SruW+BcUJY8hKRbY4R
         chIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751880; x=1786356680;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWJpQyl/g2RqJgCgTY6pf6J8qG4fWAUjdjE8mT7VVHo=;
        b=StD9bNg6D4sqJExM5CroUWQZH1xiH+P/zMKwX8lJ1UKPQXAA0IVS165QZoQmrEKw5d
         NNfUeGy4RhB6FI/t9FnRyea23Pl4Xx2irN6c+EWSoaZ1fqS3ZzKvKWTQmvBFqSPx+WbY
         z1BimBQm1vp+ytwLOHjF/U2Ri3Bk2h4ioNtySraZQ+5lu0WMkz4g5oBugnMxm9e3yhGj
         Wvi3sZJFSobzL+2gRY0cip99dA+35fitqpF+DGQiUqQiXesEfHUcf1w2v+4A2N658YMv
         gSFU1V2CyEIcxKy8qiC+awIYyT0ZraSlNEXC1jmNVRedJ6jeLdN2KIoOh+NsZIOzvgIO
         QikQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxnYQftg8gB6kh9t7IdVd3+G/Aiy57bp7JvvHNqlcFtwkqEKVwM1CE1jsj9edozGQ2CPhCxn0xQJ7dKKEV1qL+@lists.infradead.org
X-Gm-Message-State: AOJu0YygVwtCDJO2xK2YywLaaBMHwVWwhaZdo+1FF9BXmQ1W811t7iZy
	ohGwrTTbRYeAs40H5EZVtrEeapbx+f+qJN/kyh6027Vbz8OkCFUg/Ent7gp0oqTBGRnxp6jq+uh
	d3kIRMR8WD/8CLoc/xCx4zw==
X-Received: from wmpo6.prod.google.com ([2002:a05:600c:3386:b0:495:7ebf:e5b1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3507:b0:496:cb48:5eb8 with SMTP id 5b1f17b1804b1-4980c6747fdmr128650365e9.15.1785751879451;
 Mon, 03 Aug 2026 03:11:19 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:09:04 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-21-vdonnefort@google.com>
Subject: [PATCH 20/20] KVM: arm64: Stage-2 huge mappings for protected VMs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031122_855566_256DCF2A 
X-CRM114-Status: GOOD (  16.54  )
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
possible whenever the stage-1 mapping allows it, that is if it itself
backed by THPs.

When a THP is found, an entire PMD_SIZE mapping is donated to the guest.
This mapping can only be broken down via the HVC
__pkvm_host_split_guest() which the hypervisor can request with
PKVM_HYP_REQ_SPLIT.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6c941aaa10c6..46820240d233 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1690,21 +1690,6 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
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
 static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
@@ -1714,6 +1699,9 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	struct kvm *kvm = vcpu->kvm;
 	void *hyp_memcache;
 	struct page *page;
+	long page_size;
+	kvm_pfn_t pfn;
+	gfn_t gfn;
 	int ret;
 
 	hyp_memcache = get_mmu_memcache(vcpu);
@@ -1721,21 +1709,15 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	if (ret)
 		return -ENOMEM;
 
-	ret = account_locked_vm(mm, 1, true);
-	if (ret)
-		return ret;
-
 	mmap_read_lock(mm);
 	ret = pin_user_pages(s2fd->hva, 1, flags, &page);
 	mmap_read_unlock(mm);
 
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
@@ -1755,25 +1737,59 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		goto unpin;
 	}
 
+	pfn = page_to_pfn(page);
+	gfn = gpa_to_gfn(s2fd->fault_ipa);
+
+	page_size = transparent_hugepage_adjust(kvm, s2fd->memslot, s2fd->hva, &pfn, &gfn);
+	if (page_size < 0) {
+		ret = page_size;
+		goto unpin;
+	} else if (page_size == PMD_SIZE) {
+		if (WARN_ON(!folio_test_large(page_folio(page)))) {
+			ret = -EINVAL;
+			goto unpin;
+		}
+	}
+
+	ret = account_locked_vm(mm, page_size / PAGE_SIZE, true);
+	if (ret)
+		goto unpin;
+
 	write_lock(&kvm->mmu_lock);
-	ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
-				      page_to_phys(page), KVM_PGTABLE_PROT_RWX,
+	ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(gfn), page_size,
+				      __pfn_to_phys(pfn), KVM_PGTABLE_PROT_RWX,
 				      hyp_memcache, 0);
 	write_unlock(&kvm->mmu_lock);
 	if (ret) {
 		if (ret == -EAGAIN)
 			ret = 0;
-		goto unpin;
+		goto dec_account;
 	}
 
 	return 0;
+
+dec_account:
+	account_locked_vm(mm, page_size / PAGE_SIZE, false);
 unpin:
 	unpin_user_pages(&page, 1);
-dec_account:
-	account_locked_vm(mm, 1, false);
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
index 089b77cf2f6a..0b591c44998d 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -454,9 +454,8 @@ static int __pkvm_pgtable_stage2_reclaim(struct kvm_pgtable *pgt, u64 start, u64
 			continue;
 
 		page = pfn_to_page(mapping->pfn);
-		WARN_ON_ONCE(mapping->nr_pages != 1);
 		unpin_user_pages_dirty_lock(&page, 1, true);
-		account_locked_vm(kvm->mm, 1, false);
+		account_locked_vm(kvm->mm, mapping->nr_pages, false);
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
 		kfree(mapping);
 	}
@@ -521,14 +520,13 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
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
 
@@ -541,10 +539,8 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
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
2.55.0.508.g3f0d502094-goog


