Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DD4CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFOpvpsT1MnunRLl4T+BHRi0vN/i3KJyyI1xXmPrPlw=; b=nl+hLuuA/SI/iMiktcpmn63APL
	K3RWShK+5mZc827lTTp2Wr/aG1Ie8J0UoyofXq6mRCKqZQL4AcTYT1adXfDAVxWM0qiG0guEzPSeY
	0ayuoyf+WNUZGfK+I+FAa/kPVjyf4gvpaw/o/anZDsIlSZdNmnbdj6lClW5hqufEK5cj4g2UWnyQl
	Puf4rXkZzAHGPv+9Myik3w221zSdZpAKV8/U4V3VpPHEl2R/mwPqqJUYXfnIQSoX/yHU2nQ4L85Tj
	WL3Uo3bUCFfGcdW2pDd9tqA5Mnlpn2jbQ5WR88y7j6daDc5wDt4vO1XreG1loXgb2rEYghu2dMKr6
	GNt9u6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKPg-00000001app-04rx;
	Fri, 22 Aug 2025 05:34:08 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCPI-00000000bfy-2gU2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:01:14 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b4741e1cde6so1126871a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810071; x=1756414871; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WFOpvpsT1MnunRLl4T+BHRi0vN/i3KJyyI1xXmPrPlw=;
        b=om/+iK1AKKsKvpXOunVBmYv0xqT6T07A18J8HxkIgrPJp+F9R8IHttIsd+oaOqYqao
         Y0YKsvTmS/N/W2WO9L7PGJZBbwOYjEPaAuih/YyWFQe8l4miSznvSXrziOUH24CxyLD3
         z8dTU5Twvhk1+zYyLBnLH4OBcdLLVzT08KiNJhPG4AwHjmt7f6+YoK1OkqQ/VO8cAZnn
         7nhsb035k+KuIVFJeDsEExC2Jq7ZMAiYyZjcQ6/GXEmJQ6ZPQMmxQD+E1jGm9+gmE4fF
         oJgGHtxgK2wgr1JfmN9uy+ggIJ9TthG9hYK/RYRf+W0t4VAFymk+xIK8JU21DLZFoKCS
         K/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810071; x=1756414871;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFOpvpsT1MnunRLl4T+BHRi0vN/i3KJyyI1xXmPrPlw=;
        b=awAryPrzCniEnXrgy/XBTj4zslb5CUBHNBu1bsSlbBHAdYSxpHyqRXQJ2A+CCFJOq2
         Ex36MC0BwbgqhDQ7WRwy328GZDL/p3yK2H8c9xZH2zKfC2eo452yfvz2P0rSvOF0ZSpa
         qXv83ndBV0dBrjDZmkJHw0zBdiFLsCjGlMqyp4Ec1LGl0fhtGlTiqWoiNEYXZXTr06xH
         B4z8wGoZbnlzsRYynLcE1KKV0w1KmktiS5AP202UWgG4uCQ03UBlG1AgbHvi3R+eAJzA
         vRsQbAuMbQRFFSRLMGHs6WJVPgmrLeVyUy6NAveFEhSKyGYofmLQt2IkpMFoTfBqteXJ
         eRww==
X-Gm-Message-State: AOJu0YzJGidQ6CnrFRIzrPjQ7RmbZ7/FrGs/IEA2lUl5Hz1SlSfRE1cB
	7hehGZnl1TZaxpgPxN8UKoaUZwWCKNxpf1CY4fi8/zNk9z0nBAe6JgS0M8kfBrs7Yx/mBkCW25x
	81oLFZQ==
X-Google-Smtp-Source: AGHT+IH2D5yvxXbQMYKp9CQ1/YsbKvTYEoUYMROb+eewLnOLV2mjTAu7kJckUk9DqMy3wtdy3hZnzxFFxu8=
X-Received: from pghz18.prod.google.com ([2002:a63:e112:0:b0:b42:8a4c:7b14])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2446:b0:240:1fb6:d335
 with SMTP id adf61e73a8af0-24340db0419mr735886637.37.1755810071501; Thu, 21
 Aug 2025 14:01:11 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:41 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-16-seanjc@google.com>
Subject: [RFC PATCH 15/16] KVM: arm64: Extract mmap_lock-protected code to
 helper for user mem aborts
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140112_681863_EA550EE8 
X-CRM114-Status: GOOD (  20.25  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Factor out the mmap_lock-protected portion of user_mem_abort() to a new
helper, partly to make user_mem_abort() easier to follow, but mostly so
that the scope of the mmap_lock-protected code is more explicitly bounded.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 96 ++++++++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index fec3a6aeabd0..ea326d66f027 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1466,47 +1466,10 @@ static bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
 	}
 }
 
-static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
+static int kvm_gather_fault_vma_info(struct kvm_vcpu *vcpu,
+				     struct kvm_page_fault *fault)
 {
-	int ret = 0;
-	bool writable;
-	struct kvm *kvm = vcpu->kvm;
 	struct vm_area_struct *vma;
-	void *memcache;
-	bool logging_active = memslot_is_logging(fault->slot);
-	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
-	struct kvm_pgtable *pgt;
-	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
-
-	VM_BUG_ON(fault->write && fault->exec);
-
-	if (fault->is_perm && !fault->write && !fault->exec) {
-		kvm_err("Unexpected L2 read permission error\n");
-		return -EFAULT;
-	}
-
-	if (!is_protected_kvm_enabled())
-		memcache = &vcpu->arch.mmu_page_cache;
-	else
-		memcache = &vcpu->arch.pkvm_memcache;
-
-	/*
-	 * Permission faults just need to update the existing leaf entry,
-	 * and so normally don't require allocations from the memcache. The
-	 * only exception to this is when dirty logging is enabled at runtime
-	 * and a write fault needs to collapse a block entry into a table.
-	 */
-	if (!fault->is_perm || (logging_active && fault->write)) {
-		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
-
-		if (!is_protected_kvm_enabled())
-			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
-		else
-			ret = topup_hyp_memcache(memcache, min_pages);
-
-		if (ret)
-			return ret;
-	}
 
 	/*
 	 * Let's check if we will get back a huge page backed by hugetlbfs, or
@@ -1520,11 +1483,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		return -EFAULT;
 	}
 
-	/*
-	 * logging_active is guaranteed to never be true for VM_PFNMAP
-	 * memslots.
-	 */
-	if (logging_active) {
+	/* Logging is guaranteed to never be active for VM_PFNMAP memslots. */
+	if (memslot_is_logging(fault->slot)) {
 		fault->force_pte = true;
 		fault->vma.pageshift = PAGE_SHIFT;
 	} else {
@@ -1613,6 +1573,54 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	fault->mmu_seq = vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
+	return 0;
+}
+
+static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
+{
+	int ret = 0;
+	bool writable;
+	struct kvm *kvm = vcpu->kvm;
+	void *memcache;
+	bool logging_active = memslot_is_logging(fault->slot);
+	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
+	struct kvm_pgtable *pgt;
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
+
+	VM_BUG_ON(fault->write && fault->exec);
+
+	if (fault->is_perm && !fault->write && !fault->exec) {
+		kvm_err("Unexpected L2 read permission error\n");
+		return -EFAULT;
+	}
+
+	if (!is_protected_kvm_enabled())
+		memcache = &vcpu->arch.mmu_page_cache;
+	else
+		memcache = &vcpu->arch.pkvm_memcache;
+
+	/*
+	 * Permission faults just need to update the existing leaf entry,
+	 * and so normally don't require allocations from the memcache. The
+	 * only exception to this is when dirty logging is enabled at runtime
+	 * and a write fault needs to collapse a block entry into a table.
+	 */
+	if (!fault->is_perm || (logging_active && fault->write)) {
+		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
+
+		if (!is_protected_kvm_enabled())
+			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
+		else
+			ret = topup_hyp_memcache(memcache, min_pages);
+
+		if (ret)
+			return ret;
+	}
+
+	ret = kvm_gather_fault_vma_info(vcpu, fault);
+	if (ret)
+		return ret;
+
 	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn,
 				       fault->write ? FOLL_WRITE : 0,
 				       &writable, &fault->page);
-- 
2.51.0.261.g7ce5a0a67e-goog


