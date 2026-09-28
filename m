Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7604ECA5FA4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6s7TcQLiDAVUqK9xqyJD7OqTbOBJcpTyEcdem8epSWc=; b=l0/wd4kvsZkIm3tUaM2DHSWt4V
	2thblFmElI5bLs1kPGS42o1Grqpi8qJAMZcCJvGbPGvtgmkarCD5RWuqMrWZVe+BbPdC8Pq4s210d
	K1vBhIGSI7r2S3is3B/ifB0XoGyODk6ZDQPo3qZXtAjxXDgZxSlMhMmMz45LJPt4MccRLfkEQgK3b
	Aqe6X4CyBVZnSlIvLMq7q+F5sK+I6LBi/jBX/P+oEcduCLKPaEmPebSXb2S+Z4fUlAO386p+Rv4ll
	vXV2lZzySYUlKWCmRgelWzDRzkX1irs2DLRm/6C+yTcuSBlwLB2Lekp7rlqGbTuR69pzm+igI/kTh
	Zu9sfxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB84t-00000000HuA-0jmi;
	Mon, 28 Sep 2026 09:55:19 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB84n-00000000Hql-3U8P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:55:16 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48880800a34so1092904f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790589311; x=1791194111; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6s7TcQLiDAVUqK9xqyJD7OqTbOBJcpTyEcdem8epSWc=;
        b=iIL8tciI7OCQdwdCU7Yl+jPORfjkorbA9CY7+dP02rztLqTgJmlf1OcuX+W0mgEXYR
         olYmOjnDK1W1pFSAJWsVeuEOY+hheYTuA5AOTAmMJaNizrtmivu60eR07R08AfTsBQqm
         hoCRi/FPPWknebfKzMhGJ6/Md8KzgpqLAdBazNid1PhKvtT0F7YCST4f2Xm/5yclucDe
         F43OYOymH+yMdu+KdgmfYk+H9IkWtUetQx1K+z9M6vdzquoFhzVFI0Qm4Kv00ny38Pwo
         EBENOHeVjew0/INWs3L1xB3Ae4n2OyYtwUMlXxay4rqDr2bvngFHl9O150SsORtFfYER
         tgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589311; x=1791194111;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6s7TcQLiDAVUqK9xqyJD7OqTbOBJcpTyEcdem8epSWc=;
        b=aoiM9oTfnyGwKunYLWWCXooCvfhmoAlPApt2S21ChCsYUhcS1ZdiespqwA8YPbqmmi
         w7NCcUoGIP7au3iZKl1acFw9tjDlPl8DfAqQaWVLh9q8Fv2vmSoKIdvaSBZJpCw9xMuB
         UZbB0LqYlYWOg+2i13D0aRq9WQcULMSjn2z+WYd93uBMQQPp0sYM30tpYp7wcpgYhiAj
         LPpzLIMWv6V5xPOjAMJUhijtFxTay7m2GUNrVaG0wfRK0BpKzTxlBcSl1AJ8lzRyBwSv
         FhYUzRq0MT2S4HdNsLmglYzH0zjp8Pv614sds50dlsYFI1ibB714xKdVCGU4m7yuAI+J
         biCg==
X-Forwarded-Encrypted: i=1; AKwUvBwgdSO7nKmw8YDErSigH9YiXaIZxH6WV240g4gKgpBf0YQ5YmZsaXzIdIT/0rxAYGtPYB3843Svp/YhmrTBMjw+@lists.infradead.org
X-Gm-Message-State: AFuF++kLP0KlvE/oLXaAWWzdnUmJxAeF9hGSL8jLFXyQFBvaMz0wp8IL
	jitgtE0rsSb7F8rS+KuT/fItw6g5F090amP0Rk7dMj9nqgzLNQhi4UFAdRaGO/G+CzTL+V9yt3o
	M+YZfCi5Si7eh8+EjAy4Ssw==
X-Received: from wmgb3.prod.google.com ([2002:a05:600c:1503:b0:49f:fec8:8e56])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548e:b0:49f:ddc0:6e8f with SMTP id 5b1f17b1804b1-49fe66c86a2mr210815735e9.5.1790589307514;
 Mon, 28 Sep 2026 02:55:07 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:54:52 +0100
In-Reply-To: <20260928095454.3255918-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260928095454.3255918-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928095454.3255918-4-vdonnefort@google.com>
Subject: [PATCH v2 3/4] KVM: arm64: Use kvm_s2_fault_vma_info in gmem_abort()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_025513_901528_0628D750 
X-CRM114-Status: GOOD (  17.10  )
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

From: Fuad Tabba <fuad.tabba@linux.dev>

gmem_abort() maps at s2fd->fault_ipa, which HPFAR_EL2 holds at 4K
granularity whatever the page size. The generic page-table code aligns
it, but pkvm_pgtable_stage2_map() looks up existing mappings over
[addr, addr + size), so on a pKVM host with pages larger than 4K a
guest_memfd-backed guest that faults past the first 4K of a page can
find its neighbour's mapping, get -EAGAIN and take the same fault
forever.

The memory fault exit reports s2fd->fault_ipa too, which for a nested
guest's fault is the nested IPA rather than the canonical one
kvm_gmem_get_pfn() failed on.

Take the addresses from kvm_s2_fault_vma_info instead, as
user_mem_abort() does, and report the canonical gfn in the memory fault
exit. kvm_s2_fault_get_vma_info() itself isn't called: a guest_memfd
memslot's userspace_addr doesn't need to be backed by a VMA.

Fixes: a7b57e0995927 ("KVM: arm64: Handle guest_memfd-backed guest page faults")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260913175105.A57AC1F000FF@smtp.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/mmu.c | 67 ++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index dc55b0792e34..5c89b6684b02 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1615,6 +1615,24 @@ static enum kvm_pgtable_prot adjust_nested_exec_perms(struct kvm *kvm,
 	return prot;
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
+static gfn_t get_canonical_gfn(const struct kvm_s2_fault_desc *s2fd,
+			       const struct kvm_s2_fault_vma_info *s2vi);
+
 static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	bool write_fault, exec_fault;
@@ -1622,12 +1640,10 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
-	unsigned long mmu_seq;
-	struct page *page;
+	struct kvm_s2_fault_vma_info s2vi = {};
 	struct kvm *kvm = s2fd->vcpu->kvm;
 	void *memcache = NULL;
-	kvm_pfn_t pfn;
-	gfn_t gfn;
+	gfn_t canonical_gfn;
 	int ret;
 
 	if (!perm_fault) {
@@ -1637,24 +1653,23 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 			return ret;
 	}
 
-	if (s2fd->nested)
-		gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
-	else
-		gfn = s2fd->fault_ipa >> PAGE_SHIFT;
+	s2vi.vma_pagesize = PAGE_SIZE;
+	s2vi.gfn = ALIGN_DOWN(s2fd->fault_ipa, s2vi.vma_pagesize) >> PAGE_SHIFT;
+	canonical_gfn = get_canonical_gfn(s2fd, &s2vi);
 
 	write_fault = kvm_is_write_fault(s2fd->vcpu);
 	exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu);
 
 	VM_WARN_ON_ONCE(write_fault && exec_fault);
 
-	mmu_seq = kvm->mmu_invalidate_seq;
+	s2vi.mmu_seq = kvm->mmu_invalidate_seq;
 	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
 	smp_rmb();
 
-	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL);
+	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, canonical_gfn, &s2vi.pfn, &s2vi.page, NULL);
 	if (ret) {
-		kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
-					      write_fault, exec_fault, false);
+		kvm_prepare_memory_fault_exit(s2fd->vcpu, gfn_to_gpa(canonical_gfn),
+					      s2vi.vma_pagesize, write_fault, exec_fault, false);
 		return ret;
 	}
 
@@ -1671,7 +1686,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 		prot = adjust_nested_exec_perms(kvm, s2fd->nested, prot);
 
 	kvm_fault_lock(kvm);
-	if (mmu_invalidate_retry(kvm, mmu_seq)) {
+	if (mmu_invalidate_retry(kvm, s2vi.mmu_seq)) {
 		ret = -EAGAIN;
 		goto out_unlock;
 	}
@@ -1682,39 +1697,25 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 		 * PTE, which will be preserved.
 		 */
 		prot &= ~KVM_NV_GUEST_MAP_SZ;
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, s2fd->fault_ipa,
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(s2vi.gfn),
 								 prot, flags);
 	} else {
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
-							 __pfn_to_phys(pfn), prot,
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(s2vi.gfn),
+							 s2vi.vma_pagesize,
+							 __pfn_to_phys(s2vi.pfn), prot,
 							 memcache, flags);
 	}
 
 out_unlock:
-	kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);
+	kvm_release_faultin_page(kvm, s2vi.page, !!ret, prot & KVM_PGTABLE_PROT_W);
 	kvm_fault_unlock(kvm);
 
 	if ((prot & KVM_PGTABLE_PROT_W) && !ret)
-		mark_page_dirty_in_slot(kvm, s2fd->memslot, gfn);
+		mark_page_dirty_in_slot(kvm, s2fd->memslot, canonical_gfn);
 
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
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


