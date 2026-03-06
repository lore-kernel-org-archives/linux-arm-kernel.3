Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FBAF0183E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dq2CFWg/s/4LGPe7PH75WI1RwQG3qN/TUDsxF12q5kw=; b=vsjQjfNzFiY79PNcIHXn9RiAF0
	EA+8jBhgEafOYi7Nqp9PsPanAz9gv2zZvDSL10zBjWYIkXwNWFobgCRkGntXLlunroFBWAXz1pgQV
	AS6e7Y9AmjzQO+22qNUClnffyNgOe2RCsm0NgpuLAcJDPG0t2qCJ0bJbpxDxWwjAhwavtI/jrPawX
	wBqH3R6OwvhDMaRosNA4qSw+Sl3qm0OlterFLk3HrrweOEq7Li62EF+E9B/WCfWvAwmUNzBAxbSKe
	DGbzTz9w1mTmV2v7xw4tNciRw5Uh1fCfphJkDi8/wT0uoHev4jnbON4qGz7HtfshI//zOhX3JWM6U
	n0+vP40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlR-00000003qDO-0Gdb;
	Fri, 06 Mar 2026 14:02:49 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlM-00000003q5a-1yQV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:46 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-483a24db6ecso117033365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805762; x=1773410562; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dq2CFWg/s/4LGPe7PH75WI1RwQG3qN/TUDsxF12q5kw=;
        b=3DvJB/mkNJ+5B1pFAWQCkRSfXINjDTWqjW9FtIMljZP5zKH6wCEU4ho6o+lrSX+F8A
         SIr5wQEuHzYNFlVf7rI0HL5IJtPRjHwz1P/zUdzyjxvJRcZOaWE1JKdLx/9PVtja5MJZ
         qyem6+B0UZ/f2tGQG5R6Vm/Gr+X4BPYkt/lA/mj0yx/PrjUowHMRW3l5/Q3bq95dB8S3
         kp8PV3sr5tL4ZHwz44Ijv1ZWCMsfmhTRadBT/nfhWOCIZkyCUTlI0rgcQP5Ko1yOPVr+
         9n3IlqY+qyhqdH513bGREG6KOExMUS5oHJv8QrJh3xhqq1yL+nd6kQyANXf4uNJbdSAC
         ebSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805762; x=1773410562;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dq2CFWg/s/4LGPe7PH75WI1RwQG3qN/TUDsxF12q5kw=;
        b=CS/1pqvSQAApwwdfQRNYcfpscJPSmJV/j8LQpiWK7ihweAZ2KttDtaPHjN2zg46yRX
         tXwlWm+TXOg6roxJOUyNTGyHu9sa4OOeBas1F8O28NRcroXMBi5RtKXnRbjoieDbkyj8
         B3/bTr5Qb4IfwtV8QHgo6RTIfinOZM43k5HDikVruSWICtJz+Mb0upKLZL4h6SPDPWXg
         MJBzx1kwTnp0Us0+E2VMrDK0q3eiyD4FIWJNFX1ycRB997lYf/prDbDTEHYnv+3oCrhS
         k/vnQgcDmZRIKdqaamfU/gbxOR/c0b4szYKJNlQjpQn4lmmeA/y45h8ONV1aBjn1Oj0g
         YBEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlynjowizsu+RME8SovjeKEtw6uHHP8EzRfsgd62InUpMneJNX2ZQKDfzR/cZu9LGj8s+NaRZtAdTV71vUCU6c@lists.infradead.org
X-Gm-Message-State: AOJu0YwwJimfAeq5g9pRFd25WLi4SKNLUiYqd1QmxSAXvQFzLMZOYpUl
	T3SZiaKnfMqAPVfaeHTx3eQJUvAREgh7odBxeSMQYscR2Ym7SjtKcxnfy8lFgad2j/0IB/OrJRY
	zeQ==
X-Received: from wmbjw16.prod.google.com ([2002:a05:600c:5750:b0:480:4a03:7b6f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:474f:b0:477:af8d:203a
 with SMTP id 5b1f17b1804b1-48526964c79mr37178325e9.27.1772805761667; Fri, 06
 Mar 2026 06:02:41 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:25 +0000
In-Reply-To: <20260306140232.2193802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-7-tabba@google.com>
Subject: [PATCH v1 06/13] KVM: arm64: Extract page table mapping in user_mem_abort()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060244_587587_FEF47A91 
X-CRM114-Status: GOOD (  20.75  )
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

Extract the code responsible for locking the KVM MMU and mapping the PFN
into the stage-2 page tables into a new helper, kvm_s2_fault_map().

This helper manages the kvm_fault_lock, checks for MMU invalidation
retries, attempts to adjust for transparent huge pages (THP), handles
MTE sanitization if needed, and finally maps or relaxes permissions on
the stage-2 entries.

With this change, the main user_mem_abort() function is now a sequential
dispatcher that delegates to specialized helper functions.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 128 +++++++++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 60 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index b328299cc0f5..833a7f769467 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1892,68 +1892,13 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
 	return 0;
 }
 
-static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
-			  struct kvm_s2_trans *nested,
-			  struct kvm_memory_slot *memslot, unsigned long hva,
-			  bool fault_is_perm)
+static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
 {
-	int ret = 0;
-	struct kvm_s2_fault fault_data = {
-		.vcpu = vcpu,
-		.fault_ipa = fault_ipa,
-		.nested = nested,
-		.memslot = memslot,
-		.hva = hva,
-		.fault_is_perm = fault_is_perm,
-		.ipa = fault_ipa,
-		.logging_active = memslot_is_logging(memslot),
-		.force_pte = memslot_is_logging(memslot),
-		.s2_force_noncacheable = false,
-		.vfio_allow_any_uc = false,
-		.prot = KVM_PGTABLE_PROT_R,
-	};
-	struct kvm_s2_fault *fault = &fault_data;
-	struct kvm *kvm = vcpu->kvm;
-	void *memcache;
+	struct kvm *kvm = fault->vcpu->kvm;
 	struct kvm_pgtable *pgt;
+	int ret;
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 
-	if (fault->fault_is_perm)
-		fault->fault_granule = kvm_vcpu_trap_get_perm_fault_granule(fault->vcpu);
-	fault->write_fault = kvm_is_write_fault(fault->vcpu);
-	fault->exec_fault = kvm_vcpu_trap_is_exec_fault(fault->vcpu);
-	VM_WARN_ON_ONCE(fault->write_fault && fault->exec_fault);
-
-	/*
-	 * Permission faults just need to update the existing leaf entry,
-	 * and so normally don't require allocations from the memcache. The
-	 * only exception to this is when dirty logging is enabled at runtime
-	 * and a write fault needs to collapse a block entry into a table.
-	 */
-	fault->topup_memcache = !fault->fault_is_perm ||
-				(fault->logging_active && fault->write_fault);
-	ret = prepare_mmu_memcache(fault->vcpu, fault->topup_memcache, &memcache);
-	if (ret)
-		return ret;
-
-	/*
-	 * Let's check if we will get back a huge fault->page backed by hugetlbfs, or
-	 * get block mapping for device MMIO region.
-	 */
-	ret = kvm_s2_fault_pin_pfn(fault);
-	if (ret != 1)
-		return ret;
-
-	ret = 0;
-
-	ret = kvm_s2_fault_compute_prot(fault);
-	if (ret == 1) {
-		ret = 1; /* fault injected */
-		goto out_put_page;
-	}
-	if (ret)
-		goto out_put_page;
-
 	kvm_fault_lock(kvm);
 	pgt = fault->vcpu->arch.hw_mmu->pgt;
 	if (mmu_invalidate_retry(kvm, fault->mmu_seq)) {
@@ -2001,8 +1946,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		 * PTE, which will be preserved.
 		 */
 		fault->prot &= ~KVM_NV_GUEST_MAP_SZ;
-		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault->fault_ipa, fault->prot,
-								 flags);
+		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault->fault_ipa,
+								 fault->prot, flags);
 	} else {
 		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault->fault_ipa, fault->vma_pagesize,
 							 __pfn_to_phys(fault->pfn), fault->prot,
@@ -2018,6 +1963,69 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		mark_page_dirty_in_slot(kvm, fault->memslot, fault->gfn);
 
 	return ret != -EAGAIN ? ret : 0;
+}
+
+static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
+			  struct kvm_s2_trans *nested,
+			  struct kvm_memory_slot *memslot, unsigned long hva,
+			  bool fault_is_perm)
+{
+	int ret = 0;
+	struct kvm_s2_fault fault_data = {
+		.vcpu = vcpu,
+		.fault_ipa = fault_ipa,
+		.nested = nested,
+		.memslot = memslot,
+		.hva = hva,
+		.fault_is_perm = fault_is_perm,
+		.ipa = fault_ipa,
+		.logging_active = memslot_is_logging(memslot),
+		.force_pte = memslot_is_logging(memslot),
+		.s2_force_noncacheable = false,
+		.vfio_allow_any_uc = false,
+		.prot = KVM_PGTABLE_PROT_R,
+	};
+	struct kvm_s2_fault *fault = &fault_data;
+	void *memcache;
+
+	if (fault->fault_is_perm)
+		fault->fault_granule = kvm_vcpu_trap_get_perm_fault_granule(fault->vcpu);
+	fault->write_fault = kvm_is_write_fault(fault->vcpu);
+	fault->exec_fault = kvm_vcpu_trap_is_exec_fault(fault->vcpu);
+	VM_WARN_ON_ONCE(fault->write_fault && fault->exec_fault);
+
+	/*
+	 * Permission faults just need to update the existing leaf entry,
+	 * and so normally don't require allocations from the memcache. The
+	 * only exception to this is when dirty logging is enabled at runtime
+	 * and a write fault needs to collapse a block entry into a table.
+	 */
+	fault->topup_memcache = !fault->fault_is_perm ||
+				(fault->logging_active && fault->write_fault);
+	ret = prepare_mmu_memcache(fault->vcpu, fault->topup_memcache, &memcache);
+	if (ret)
+		return ret;
+
+	/*
+	 * Let's check if we will get back a huge fault->page backed by hugetlbfs, or
+	 * get block mapping for device MMIO region.
+	 */
+	ret = kvm_s2_fault_pin_pfn(fault);
+	if (ret != 1)
+		return ret;
+
+	ret = 0;
+
+	ret = kvm_s2_fault_compute_prot(fault);
+	if (ret == 1) {
+		ret = 1; /* fault injected */
+		goto out_put_page;
+	}
+	if (ret)
+		goto out_put_page;
+
+	ret = kvm_s2_fault_map(fault, memcache);
+	return ret;
 
 out_put_page:
 	kvm_release_page_unused(fault->page);
-- 
2.53.0.473.g4a7958ca14-goog


