Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A57C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnwZ0cT1VSP253hz9gmCiW8/GwJgIh7mpYiKx6W5pXA=; b=d62xCaenabQWlD90gyV52pcUgy
	S3ZmT9B6L/5vrMll0+Q7pb0aCwY7H692aGFHcutr3UtBe/5pqyMvrfEA5kLpy8EtEw3Ohzuf23Rxw
	B82mjbTBKUc7CvFnngcUf9xnGfGmcmvCAqboQSty+drxG+UaTSdfAiD2fbJ4AP3oNiRQQJ/HtCarn
	Hq00VLXs7cT9SeuQeEsSpR+wC0S39tV0qS/nLBlG1yuRUurZmJn1XYn5ukneSbJg41PWcU22EHQ/Z
	6l9ZP7MIBgdHJBHIMVzf/JVvvYZzmczOHvxvFrcVO25G8Hbg/+8aTV1nAoaW5Tyx0yOH3pyL9pp19
	yEXDnTnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Eg-00000005R1w-3UgZ;
	Tue, 22 Sep 2026 13:08:38 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Eb-00000005QyX-1ETU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:08:34 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49e735659b7so33293965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082510; x=1790687310; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnwZ0cT1VSP253hz9gmCiW8/GwJgIh7mpYiKx6W5pXA=;
        b=FcueZUSMQQ8Xq/c9VRksfofBjkbHjRYbKhNJDRvLtjA9S5AS7kdswcDY7LndIA71La
         oXdotvexn5ApMzjl1iSU1fLCRPeocw1qzBcGBcyVROx8BGO62J0tbEU9OEL8jeo32uAe
         jxIUp9FK1NkgeD7CAZPjfu1LEWFyBvCLvgmHqXW+xjQVHapIEGmhlzx0WNUidv7ZKanh
         JmClzdWsJllC/3bXrpPjnWA0/NwhIjFHgH3u8Txm0IDXYMQtovjgYek4p4GA9sW3RloE
         ge3W4ncGN+qogPZXGRNyn/UpJC2xfdi6RLk+5gRqDEKTKHpCPtDsLUavR4ar5UqcCM1K
         7s8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082510; x=1790687310;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RnwZ0cT1VSP253hz9gmCiW8/GwJgIh7mpYiKx6W5pXA=;
        b=iwKqghD0WS0DtpGC2NJS85kxeDjeUGtBI4clBCNQ0YWPLdm2cLOLZ6CeiHJRYHzoHL
         bVZYA6qPrSDJg3uKpKN1UvBlYdE+qiBYEsfsn8Sa9Pdo7zJaoPiDxMVxEky0F+/yWmJV
         uFNAPlfo6UzCcjLUaJNjXiPm96IdDZWwN0h/Bn7ls06bflLr8fDXemLdsjNbEtqoMP0V
         7iLdX70hZa8mCkbvQNTAxH85VHHF7h2p1k9NVMA4t/OEUGTIVpAZPrZvBySD1giW+5q7
         NerS2pq9Lq+KoO2TkcfwQ8kxOsXLeaOjgBJJWb5gBmCsRZVVWtlcCsEu9WDnm4XokFM9
         bdIg==
X-Forwarded-Encrypted: i=1; AKwUvBx8GF90dLFOyMvPYQeE20kZCF7KciESRJRmVA29Gf+qZb2MYM5JmB/ewdMLL9U0EyhELYcplj6LpY1+Q4nyhd22@lists.infradead.org
X-Gm-Message-State: AFuF++mKdren+N/q2MwCQW8/ihE0N5EryUMIC4KXAU+ASRIHfIpG5/M7
	l/vEaMz9mwssAuogYZCoy/FujUi8om5Nbbl1VcVldCQlpEmWbo3+EqcckIRHX0eXv+KdPgFHtrc
	G4KoBzMp9Nw4wp3pxIWQ5lA==
X-Received: from wmix7-n2.prod.google.com ([2002:a05:600c:e547:20b0:49e:602d:8036])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:314a:b0:49f:ce73:7aa with SMTP id 5b1f17b1804b1-49fce730865mr141981295e9.35.1790082510224;
 Tue, 22 Sep 2026 06:08:30 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:08:19 +0100
In-Reply-To: <20260922130821.1666713-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260922130821.1666713-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922130821.1666713-5-vdonnefort@google.com>
Subject: [PATCH v1 4/6] KVM: arm64: Move gmem_abort()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_060833_366997_F5EA7155 
X-CRM114-Status: GOOD (  17.77  )
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

Move gmem_abort() below get_canonical_gfn() so that the next patch can
use it without a forward declaration.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/mmu.c | 170 +++++++++++++++++++++----------------------
 1 file changed, 85 insertions(+), 85 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 242f63066252..5aac624b0442 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1606,91 +1606,6 @@ static enum kvm_pgtable_prot adjust_nested_exec_perms(struct kvm *kvm,
 	return prot;
 }
 
-static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
-{
-	bool write_fault, exec_fault;
-	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
-	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
-	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
-	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
-	unsigned long mmu_seq;
-	struct page *page;
-	struct kvm *kvm = s2fd->vcpu->kvm;
-	void *memcache = NULL;
-	kvm_pfn_t pfn;
-	gfn_t gfn;
-	int ret;
-
-	if (!perm_fault) {
-		memcache = get_mmu_memcache(s2fd->vcpu);
-		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
-		if (ret)
-			return ret;
-	}
-
-	if (s2fd->nested)
-		gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
-	else
-		gfn = s2fd->fault_ipa >> PAGE_SHIFT;
-
-	write_fault = kvm_is_write_fault(s2fd->vcpu);
-	exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu);
-
-	VM_WARN_ON_ONCE(write_fault && exec_fault);
-
-	mmu_seq = kvm->mmu_invalidate_seq;
-	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
-	smp_rmb();
-
-	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL);
-	if (ret) {
-		kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
-					      write_fault, exec_fault, false);
-		return ret;
-	}
-
-	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))
-		prot |= KVM_PGTABLE_PROT_W;
-
-	if (s2fd->nested)
-		prot = adjust_nested_fault_perms(s2fd->nested, prot);
-
-	if (exec_fault || cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
-		prot |= KVM_PGTABLE_PROT_X;
-
-	if (s2fd->nested)
-		prot = adjust_nested_exec_perms(kvm, s2fd->nested, prot);
-
-	kvm_fault_lock(kvm);
-	if (mmu_invalidate_retry(kvm, mmu_seq)) {
-		ret = -EAGAIN;
-		goto out_unlock;
-	}
-
-	if (perm_fault) {
-		/*
-		 * Drop the SW bits in favour of those stored in the
-		 * PTE, which will be preserved.
-		 */
-		prot &= ~KVM_NV_GUEST_MAP_SZ;
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, s2fd->fault_ipa,
-								 prot, flags);
-	} else {
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
-							 __pfn_to_phys(pfn), prot,
-							 memcache, flags);
-	}
-
-out_unlock:
-	kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);
-	kvm_fault_unlock(kvm);
-
-	if ((prot & KVM_PGTABLE_PROT_W) && !ret)
-		mark_page_dirty_in_slot(kvm, s2fd->memslot, gfn);
-
-	return ret != -EAGAIN ? ret : 0;
-}
-
 struct kvm_s2_fault_vma_info {
 	unsigned long	mmu_seq;
 	long		vma_pagesize;
@@ -2031,6 +1946,91 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 	return 0;
 }
 
+static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
+{
+	bool write_fault, exec_fault;
+	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
+	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
+	struct kvm_pgtable *pgt = s2fd->vcpu->arch.hw_mmu->pgt;
+	unsigned long mmu_seq;
+	struct page *page;
+	struct kvm *kvm = s2fd->vcpu->kvm;
+	void *memcache = NULL;
+	kvm_pfn_t pfn;
+	gfn_t gfn;
+	int ret;
+
+	if (!perm_fault) {
+		memcache = get_mmu_memcache(s2fd->vcpu);
+		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
+		if (ret)
+			return ret;
+	}
+
+	if (s2fd->nested)
+		gfn = kvm_s2_trans_output(s2fd->nested) >> PAGE_SHIFT;
+	else
+		gfn = s2fd->fault_ipa >> PAGE_SHIFT;
+
+	write_fault = kvm_is_write_fault(s2fd->vcpu);
+	exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu);
+
+	VM_WARN_ON_ONCE(write_fault && exec_fault);
+
+	mmu_seq = kvm->mmu_invalidate_seq;
+	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
+	smp_rmb();
+
+	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL);
+	if (ret) {
+		kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
+					      write_fault, exec_fault, false);
+		return ret;
+	}
+
+	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))
+		prot |= KVM_PGTABLE_PROT_W;
+
+	if (s2fd->nested)
+		prot = adjust_nested_fault_perms(s2fd->nested, prot);
+
+	if (exec_fault || cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
+		prot |= KVM_PGTABLE_PROT_X;
+
+	if (s2fd->nested)
+		prot = adjust_nested_exec_perms(kvm, s2fd->nested, prot);
+
+	kvm_fault_lock(kvm);
+	if (mmu_invalidate_retry(kvm, mmu_seq)) {
+		ret = -EAGAIN;
+		goto out_unlock;
+	}
+
+	if (perm_fault) {
+		/*
+		 * Drop the SW bits in favour of those stored in the
+		 * PTE, which will be preserved.
+		 */
+		prot &= ~KVM_NV_GUEST_MAP_SZ;
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, s2fd->fault_ipa,
+								 prot, flags);
+	} else {
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, s2fd->fault_ipa, PAGE_SIZE,
+							 __pfn_to_phys(pfn), prot,
+							 memcache, flags);
+	}
+
+out_unlock:
+	kvm_release_faultin_page(kvm, page, !!ret, prot & KVM_PGTABLE_PROT_W);
+	kvm_fault_unlock(kvm);
+
+	if ((prot & KVM_PGTABLE_PROT_W) && !ret)
+		mark_page_dirty_in_slot(kvm, s2fd->memslot, gfn);
+
+	return ret != -EAGAIN ? ret : 0;
+}
+
 static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
-- 
2.55.0.1082.g2b9226bbc0-goog


