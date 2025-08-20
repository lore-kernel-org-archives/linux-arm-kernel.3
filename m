Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD4FCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWAJht+0s/guAhpHqYXPso1akQHfmjOy8KfjWfGKDJM=; b=SGAATAFN1saC4n5fNFra/BMgvt
	65+3ITJu43u4lv02cMhDvNwFVA6BKMJqIQRtLCxZMq6oN11XsqdhmdJttc66lPyOTCcuiFSxaMbuu
	UL93kY/CfsHCngecWsy+GpKDkfkqpFodMMRXE0+8bPIacdVEr85u3hj9oZhhc5nDL4YRK7OnHxNvT
	FX1OYivOnH7gUU65HwfqlezWaLOTKuDXeAZokmagsnSlxzvyBuc5Pskz7Z6vM2pJadiS/p1LFD6Lf
	E29YgbZeKpixm1xkJRIIeN0AumizBIV7Rp80UQtqxppN+bwevrArs0iRQLJ2THO2mk25OQPlhfDVp
	5yEfduVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoplX-0000000EtdW-45fF;
	Wed, 20 Aug 2025 20:50:39 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolaK-0000000ENnx-0EyN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 16:22:49 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-88432e64477so724927239f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755706967; x=1756311767; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dWAJht+0s/guAhpHqYXPso1akQHfmjOy8KfjWfGKDJM=;
        b=zQQkZsO5+6hkPXo2KT25pzO9sB+4RH1QNFUPXWzUcUZ5yqqkCkz707bqocIoNWE8Tt
         MZEd3WoDcUzxR8kYfU5S7t+0hE0AsdKYYdD3vNBnWmXaVSbCouLSQy+GmrInXuZFP7G1
         KW3yndI/7okYJvRUatDltOyS/hgisJrhENG6+RFVJjGBxW6imgSrVDKZ0CzRobkAhPjs
         vVSFYpLmO+qAk56nW1S9wKGGlU5b5tAztOAS7AWjHhYtJ6wZknUAH66+obpfEc7oLqEw
         ddx62AJtyqmt/9kuhs0IeWJlEUciv2HXuy4qlN8R1aTqZP8+gkQ+BIopWOE8BQqe9PAm
         S8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755706967; x=1756311767;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWAJht+0s/guAhpHqYXPso1akQHfmjOy8KfjWfGKDJM=;
        b=qh09uTrDjISe63sH0IIGf4UuISxzAYPE9AoPq5VWMcDa9+jcaTnES2C43khpI34QYH
         BrhOEzTI7jCN4ZVjhTINM0yj1rksBCO3ss+mlevrWvvqDvpTDBIeTcS3enfKv0eJjIxv
         d1pveW5974Pq/G0Vw3Gb60NH0kKwEQJNZRSjMkcJd0pt159TWqUhu8KQZZ8AZTfDxK6h
         AyAJ0GRFa9fj3IVSuPT7IKQbHkoxdAM0biBnuMEM8T9wLT0u8O2mw0e8/FppFAZ0Yay2
         f95InD4aTAJDS8Pfz3Wk2tOXsdtJ1HpBaBmPycVHvfkDDhy65EuefTI8n582g2mbhkAD
         aD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVssvm+/fVuWOvjhh5j39vNSGIhldj1FmvfKzwSCaWxENhkHauCGX+qu82w/oyNEsDTLkfbLuHl8ZN1GTnW2iK@lists.infradead.org
X-Gm-Message-State: AOJu0YzNQFkmw7FAxo0JKZf5iEBvWb9Jf1em+/3WuNhn10an+CjgFc5d
	nrejCh8tdodZ4JskaveE2iwn1R50LYZI6Ww5g+HyBR3dyhiTq8/Up1A9KSCq1H/b1O22bz2SeQ8
	2Ch6J88yXGw==
X-Google-Smtp-Source: AGHT+IGr91NNpYqJGSQuJm4ghXc/RFMzXTzX9dbp2NGvcmWuajHz8+Psx6HTRNeVlGvCz79RD8rPG9bKd7E9
X-Received: from iobeu2.prod.google.com ([2002:a05:6602:4c82:b0:881:7069:9679])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:3402:b0:87c:72f3:d5d7
 with SMTP id ca18e2360f4ac-88471b0adadmr748916839f.13.1755706966799; Wed, 20
 Aug 2025 09:22:46 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:22:41 +0000
In-Reply-To: <20250820162242.2624752-1-rananta@google.com>
Mime-Version: 1.0
References: <20250820162242.2624752-1-rananta@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250820162242.2624752-2-rananta@google.com>
Subject: [PATCH v2 1/2] KVM: arm64: Split kvm_pgtable_stage2_destroy()
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_092248_103143_13E44BDF 
X-CRM114-Status: GOOD (  18.99  )
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

Split kvm_pgtable_stage2_destroy() into two:
  - kvm_pgtable_stage2_destroy_range(), that performs the
    page-table walk and free the entries over a range of addresses.
  - kvm_pgtable_stage2_destroy_pgd(), that frees the PGD.

This refactoring enables subsequent patches to free large page-tables
in chunks, calling cond_resched() between each chunk, to yield the
CPU as necessary.

Existing callers of kvm_pgtable_stage2_destroy(), that probably cannot
take advantage of this (such as nVMHE), will continue to function as is.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Suggested-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/kvm_pgtable.h | 30 ++++++++++++++++++++++++++++
 arch/arm64/include/asm/kvm_pkvm.h    |  4 +++-
 arch/arm64/kvm/hyp/pgtable.c         | 25 +++++++++++++++++++----
 arch/arm64/kvm/mmu.c                 | 12 +++++++++--
 arch/arm64/kvm/pkvm.c                | 11 ++++++++--
 5 files changed, 73 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 2888b5d03757..1246216616b5 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -355,6 +355,11 @@ static inline kvm_pte_t *kvm_dereference_pteref(struct kvm_pgtable_walker *walke
 	return pteref;
 }
 
+static inline kvm_pte_t *kvm_dereference_pteref_raw(kvm_pteref_t pteref)
+{
+	return pteref;
+}
+
 static inline int kvm_pgtable_walk_begin(struct kvm_pgtable_walker *walker)
 {
 	/*
@@ -384,6 +389,11 @@ static inline kvm_pte_t *kvm_dereference_pteref(struct kvm_pgtable_walker *walke
 	return rcu_dereference_check(pteref, !(walker->flags & KVM_PGTABLE_WALK_SHARED));
 }
 
+static inline kvm_pte_t *kvm_dereference_pteref_raw(kvm_pteref_t pteref)
+{
+	return rcu_dereference_raw(pteref);
+}
+
 static inline int kvm_pgtable_walk_begin(struct kvm_pgtable_walker *walker)
 {
 	if (walker->flags & KVM_PGTABLE_WALK_SHARED)
@@ -551,6 +561,26 @@ static inline int kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2
  */
 void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt);
 
+/**
+ * kvm_pgtable_stage2_destroy_range() - Destroy the unlinked range of addresses.
+ * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
+ * @addr:      Intermediate physical address at which to place the mapping.
+ * @size:      Size of the mapping.
+ *
+ * The page-table is assumed to be unreachable by any hardware walkers prior
+ * to freeing and therefore no TLB invalidation is performed.
+ */
+void kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+					u64 addr, u64 size);
+
+/**
+ * kvm_pgtable_stage2_destroy_pgd() - Destroy the PGD of guest stage-2 page-table.
+ * @pgt:       Page-table structure initialised by kvm_pgtable_stage2_init*().
+ *
+ * It is assumed that the rest of the page-table is freed before this operation.
+ */
+void kvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt);
+
 /**
  * kvm_pgtable_stage2_free_unlinked() - Free an unlinked stage-2 paging structure.
  * @mm_ops:	Memory management callbacks.
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index ea58282f59bb..35f9d9478004 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -179,7 +179,9 @@ struct pkvm_mapping {
 
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			     struct kvm_pgtable_mm_ops *mm_ops);
-void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt);
+void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+					u64 addr, u64 size);
+void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt);
 int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size, u64 phys,
 			    enum kvm_pgtable_prot prot, void *mc,
 			    enum kvm_pgtable_walk_flags flags);
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index c351b4abd5db..c36f282a175d 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1551,21 +1551,38 @@ static int stage2_free_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
-void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+void kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+				       u64 addr, u64 size)
 {
-	size_t pgd_sz;
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_free_walker,
 		.flags	= KVM_PGTABLE_WALK_LEAF |
 			  KVM_PGTABLE_WALK_TABLE_POST,
 	};
 
-	WARN_ON(kvm_pgtable_walk(pgt, 0, BIT(pgt->ia_bits), &walker));
+	WARN_ON(kvm_pgtable_walk(pgt, addr, size, &walker));
+}
+
+void kvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
+{
+	size_t pgd_sz;
+
 	pgd_sz = kvm_pgd_pages(pgt->ia_bits, pgt->start_level) * PAGE_SIZE;
-	pgt->mm_ops->free_pages_exact(kvm_dereference_pteref(&walker, pgt->pgd), pgd_sz);
+
+	/*
+	 * Since the pgtable is unlinked at this point, and not shared with
+	 * other walkers, safely deference pgd with kvm_dereference_pteref_raw()
+	 */
+	pgt->mm_ops->free_pages_exact(kvm_dereference_pteref_raw(pgt->pgd), pgd_sz);
 	pgt->pgd = NULL;
 }
 
+void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+{
+	kvm_pgtable_stage2_destroy_range(pgt, 0, BIT(pgt->ia_bits));
+	kvm_pgtable_stage2_destroy_pgd(pgt);
+}
+
 void kvm_pgtable_stage2_free_unlinked(struct kvm_pgtable_mm_ops *mm_ops, void *pgtable, s8 level)
 {
 	kvm_pteref_t ptep = (kvm_pteref_t)pgtable;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1c78864767c5..e41fc7bcee24 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -903,6 +903,14 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
 	return 0;
 }
 
+static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
+{
+	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
+
+	KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, 0, BIT(ia_bits));
+	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
+}
+
 /**
  * kvm_init_stage2_mmu - Initialise a S2 MMU structure
  * @kvm:	The pointer to the KVM structure
@@ -979,7 +987,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	return 0;
 
 out_destroy_pgtable:
-	KVM_PGT_FN(kvm_pgtable_stage2_destroy)(pgt);
+	kvm_stage2_destroy(pgt);
 out_free_pgtable:
 	kfree(pgt);
 	return err;
@@ -1076,7 +1084,7 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	write_unlock(&kvm->mmu_lock);
 
 	if (pgt) {
-		KVM_PGT_FN(kvm_pgtable_stage2_destroy)(pgt);
+		kvm_stage2_destroy(pgt);
 		kfree(pgt);
 	}
 }
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index fcd70bfe44fb..61827cf6fea4 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -316,9 +316,16 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 	return 0;
 }
 
-void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+					u64 addr, u64 size)
 {
-	__pkvm_pgtable_stage2_unmap(pgt, 0, ~(0ULL));
+	__pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
+}
+
+void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
+{
+	/* Expected to be called after all pKVM mappings have been released. */
+	WARN_ON_ONCE(!RB_EMPTY_ROOT(&pgt->pkvm_mappings.rb_root));
 }
 
 int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


