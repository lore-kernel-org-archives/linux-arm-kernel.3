Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48625C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 19:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9gC5taMqXomgmy+wOk5yz1bjdGDKNxGCUXt71gAiH4=; b=r8DNiRCpVKHMsWKrpjIDCWyQMo
	9eFHcN5FRG8wPb3wu3adsN9xIMhamIq2Atkp9791KHOivuLtvNxn6ON4F9ZrvxZ4D813c47asx5fN
	jwlFVbGGGDGosp3iiArCl2XZ8i3G70HoU/eO9QXG+vNjb2h9+lJVLN+O1xTE4h9KTXiHppL2CkJ9Y
	ryEZeeY1QUSlbhzAfHBPTAK3EWnh+HtFEPBEz4v29AkI7v2qQZVOmEOsV35leYLl3J+XSrVZ5LpPB
	1PKbGx65rKLDyRYIQh3gP+1nh6c1SzdtZbBlhnM1mYX+xWNEfMNH4DpDLwd+CUXJX5phAKOWVjhXY
	XKNZ9Lkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukSLj-00000003VdA-0S7E;
	Fri, 08 Aug 2025 19:01:55 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukSHK-00000003UwE-1lK5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 18:57:23 +0000
Date: Fri, 8 Aug 2025 11:57:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754679439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9gC5taMqXomgmy+wOk5yz1bjdGDKNxGCUXt71gAiH4=;
	b=emNgH+sIj0mFo5p9JAsb8YN8WYz1XkWrwxgJ3MjbFju6vfIA8kpe7Qv0hNCwlSlKo0tSj4
	1sbNZ7gDTJULykI/9IVsFYDPo75mzyEAAv6CHsishC96RmhvxW+Ap7upRPJ/ytjkXAowlr
	dpQn3U63ulOI5PR6J96U9XsK4KfzJ0I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: Split kvm_pgtable_stage2_destroy()
Message-ID: <aJZIiW5B3cleCxuo@linux.dev>
References: <20250724235144.2428795-1-rananta@google.com>
 <20250724235144.2428795-2-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724235144.2428795-2-rananta@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_115722_757599_47046B5C 
X-CRM114-Status: GOOD (  21.02  )
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

On Thu, Jul 24, 2025 at 11:51:43PM +0000, Raghavendra Rao Ananta wrote:
> Split kvm_pgtable_stage2_destroy() into two:
>   - kvm_pgtable_stage2_destroy_range(), that performs the
>     page-table walk and free the entries over a range of addresses.
>   - kvm_pgtable_stage2_destroy_pgd(), that frees the PGD.
> 
> This refactoring enables subsequent patches to free large page-tables
> in chunks, calling cond_resched() between each chunk, to yield the CPU
> as necessary.
> 
> Direct callers of kvm_pgtable_stage2_destroy() will continue to walk
> the entire range of the VM as before, ensuring no functional changes.
> 
> Also, add equivalent pkvm_pgtable_stage2_*() stubs to maintain 1:1
> mapping of the page-table functions.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>


Here's the other half of my fixups

From 7d3e948357d0d2568afc136906e1b973ed39deeb Mon Sep 17 00:00:00 2001
From: Oliver Upton <oliver.upton@linux.dev>
Date: Fri, 8 Aug 2025 11:35:43 -0700
Subject: [PATCH 2/4] fixup! KVM: arm64: Split kvm_pgtable_stage2_destroy()

---
 arch/arm64/include/asm/kvm_pgtable.h  |  4 ++--
 arch/arm64/kvm/hyp/nvhe/mem_protect.c |  2 +-
 arch/arm64/kvm/hyp/pgtable.c          |  2 +-
 arch/arm64/kvm/mmu.c                  | 12 ++++++++++--
 arch/arm64/kvm/pkvm.c                 | 12 ++++--------
 5 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 20aea58eca18..fdae4685b9ac 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -562,13 +562,13 @@ void kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 void kvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt);
 
 /**
- * kvm_pgtable_stage2_destroy() - Destroy an unused guest stage-2 page-table.
+ * __kvm_pgtable_stage2_destroy() - Destroy an unused guest stage-2 page-table.
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  *
  * The page-table is assumed to be unreachable by any hardware walkers prior
  * to freeing and therefore no TLB invalidation is performed.
  */
-void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt);
+void __kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt);
 
 /**
  * kvm_pgtable_stage2_free_unlinked() - Free an unlinked stage-2 paging structure.
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 95d7534c9679..5eb8d6e29ac4 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -297,7 +297,7 @@ void reclaim_pgtable_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
 
 	/* Dump all pgtable pages in the hyp_pool */
 	guest_lock_component(vm);
-	kvm_pgtable_stage2_destroy(&vm->pgt);
+	__kvm_pgtable_stage2_destroy(&vm->pgt);
 	vm->kvm.arch.mmu.pgd_phys = 0ULL;
 	guest_unlock_component(vm);
 
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 7fad791cf40b..aa735ffe8d49 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1577,7 +1577,7 @@ void kvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
 	pgt->pgd = NULL;
 }
 
-void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+void __kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
 {
 	kvm_pgtable_stage2_destroy_range(pgt, 0, BIT(pgt->ia_bits));
 	kvm_pgtable_stage2_destroy_pgd(pgt);
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9a45daf817bf..6330a02c8418 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -904,6 +904,14 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
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
@@ -980,7 +988,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	return 0;
 
 out_destroy_pgtable:
-	KVM_PGT_FN(kvm_pgtable_stage2_destroy)(pgt);
+	kvm_stage2_destroy(pgt);
 out_free_pgtable:
 	kfree(pgt);
 	return err;
@@ -1077,7 +1085,7 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	write_unlock(&kvm->mmu_lock);
 
 	if (pgt) {
-		KVM_PGT_FN(kvm_pgtable_stage2_destroy)(pgt);
+		kvm_stage2_destroy(pgt);
 		kfree(pgt);
 	}
 }
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index bf737717ccb4..3be208449bd7 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -316,11 +316,6 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 	return 0;
 }
 
-void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
-{
-	__pkvm_pgtable_stage2_unmap(pgt, 0, ~(0ULL));
-}
-
 int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			   u64 phys, enum kvm_pgtable_prot prot,
 			   void *mc, enum kvm_pgtable_walk_flags flags)
@@ -452,12 +447,13 @@ int pkvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 }
 
 void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
-					u64 addr, u64 size)
+				       u64 addr, u64 size)
 {
-	WARN_ON_ONCE(1);
+	__pkvm_pgtable_stage2_unmap(pgt, addr, size);
 }
 
 void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
 {
-	WARN_ON_ONCE(1);
+	/* Expected to be called after all pKVM mappings have been released. */
+	WARN_ON_ONCE(!RB_EMPTY_ROOT(&pgt->pkvm_mappings.rb_root));
 }
-- 
2.39.5

