Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A94C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 18:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQEweAiTXl7uCYmBR+Y/7n2oQdebFZHZYTNv96/JjXY=; b=Acji9tlvYPctIi23pFwv8rUT/w
	3O6VZN9cDlex8LW2UWHi6u+tYduIZlZCACCk++lOaXWe9b9eu/JwZvC7gS2wkyocLeG+gIcNtkHaM
	zcYnUdoySFzqodwZoQh8QDywYSfnZvO3qQlgXd3xzvWahKclRpJlIIXskmN+m51H/6zKrxtj2Wl+k
	NxNXkfbNu0XbMjkkv0UHknIz3UUuO+O4IsSFuQy006J27kstga0CifwVl8+66RqeC7cPtGUyYlndQ
	wT0dUQrmJ4sDjRVN9kvP/9fMzfZpc9z+4LqksufuMqb95uPMG95tnlV9womzhdQ8cYgFKBMzGapD1
	4l17F8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukSJC-00000003VDC-32pf;
	Fri, 08 Aug 2025 18:59:18 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukSGf-00000003Us5-2eyS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 18:56:43 +0000
Date: Fri, 8 Aug 2025 11:56:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754679398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QQEweAiTXl7uCYmBR+Y/7n2oQdebFZHZYTNv96/JjXY=;
	b=gAw17mz4oym/aoBhLbPmslP80ZAYkNfurE+ctVswd2okrrijXyrbToCAVNrAAe8fdhfyzj
	imtF5PVuDWTUpkJCeACSS2BvlIGjH1LG9ampjXkJMrYpTanhieeCrPPoxznQXRLHVuKFIq
	mtuUzh5uO+R121iAWR5z4IHVfd1reB4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Destroy the stage-2 page-table
 periodically
Message-ID: <aJZIXGDWxD1U0axK@linux.dev>
References: <20250724235144.2428795-1-rananta@google.com>
 <20250724235144.2428795-3-rananta@google.com>
 <aIjwalITY6CAj7TO@linux.dev>
 <CAJHc60wBNTP9SSt_skEXXv9N+tF_1RoV6vcQQx4hWphJF6EmkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJHc60wBNTP9SSt_skEXXv9N+tF_1RoV6vcQQx4hWphJF6EmkQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_115642_052503_C78717DF 
X-CRM114-Status: GOOD (  28.13  )
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

On Thu, Aug 07, 2025 at 11:58:01AM -0700, Raghavendra Rao Ananta wrote:
> Hi Oliver,
> 
> >
> > Protected mode is affected by the same problem, potentially even worse
> > due to the overheads of calling into EL2. Both protected and
> > non-protected flows should use stage2_destroy_range().
> >
> I experimented with this (see diff below), and it looks like it takes
> significantly longer to finish the destruction even for a very small
> VM. For instance, it takes ~140 seconds on an Ampere Altra machine.
> This is probably because we run cond_resched() for every breakup in
> the entire sweep of the possible address range, 0 to  ~(0ULL), even
> though there are no actual mappings there, and we context switch out
> more often.

This seems more like an issue with the upper bound on a pKVM walk rather
than a problem with the suggestion. The information in pgt->ia_bits is
actually derived from the VTCR value of the owning MMU.

Even though we never use the VTCR value in hardware, pKVM MMUs have a
valid VTCR value that encodes the size of the IPA space and we use that
in the common stage-2 abort path.

I'm attaching some fixups that I have on top of your series that'd allow
the resched logic to remain common, like it is in other MMU flows.

From 421468dcaa4692208c3f708682b058cfc072a984 Mon Sep 17 00:00:00 2001
From: Oliver Upton <oliver.upton@linux.dev>
Date: Fri, 8 Aug 2025 11:43:12 -0700
Subject: [PATCH 4/4] fixup! KVM: arm64: Destroy the stage-2 page-table
 periodically

---
 arch/arm64/kvm/mmu.c | 60 ++++++++++++++++++--------------------------
 1 file changed, 25 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index b82412323054..fc93cc256bd8 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -383,40 +383,6 @@ static void stage2_flush_vm(struct kvm *kvm)
 	srcu_read_unlock(&kvm->srcu, idx);
 }
 
-/*
- * Assume that @pgt is valid and unlinked from the KVM MMU to free the
- * page-table without taking the kvm_mmu_lock and without performing any
- * TLB invalidations.
- *
- * Also, the range of addresses can be large enough to cause need_resched
- * warnings, for instance on CONFIG_PREEMPT_NONE kernels. Hence, invoke
- * cond_resched() periodically to prevent hogging the CPU for a long time
- * and schedule something else, if required.
- */
-static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
-			      phys_addr_t end)
-{
-	u64 next;
-
-	do {
-		next = stage2_range_addr_end(addr, end);
-		kvm_pgtable_stage2_destroy_range(pgt, addr, next - addr);
-
-		if (next != end)
-			cond_resched();
-	} while (addr = next, addr != end);
-}
-
-static void kvm_destroy_stage2_pgt(struct kvm_pgtable *pgt)
-{
-	if (!is_protected_kvm_enabled()) {
-		stage2_destroy_range(pgt, 0, BIT(pgt->ia_bits));
-		kvm_pgtable_stage2_destroy_pgd(pgt);
-	} else {
-		pkvm_pgtable_stage2_destroy(pgt);
-	}
-}
-
 /**
  * free_hyp_pgds - free Hyp-mode page tables
  */
@@ -938,11 +904,35 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
 	return 0;
 }
 
+/*
+ * Assume that @pgt is valid and unlinked from the KVM MMU to free the
+ * page-table without taking the kvm_mmu_lock and without performing any
+ * TLB invalidations.
+ *
+ * Also, the range of addresses can be large enough to cause need_resched
+ * warnings, for instance on CONFIG_PREEMPT_NONE kernels. Hence, invoke
+ * cond_resched() periodically to prevent hogging the CPU for a long time
+ * and schedule something else, if required.
+ */
+static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
+				 phys_addr_t end)
+{
+	u64 next;
+
+	do {
+		next = stage2_range_addr_end(addr, end);
+		KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr, next - addr);
+
+		if (next != end)
+			cond_resched();
+	} while (addr = next, addr != end);
+}
+
 static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
 {
 	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
 
-	KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, 0, BIT(ia_bits));
+	stage2_destroy_range(pgt, 0, BIT(ia_bits));
 	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
 }
 
-- 
2.39.5

