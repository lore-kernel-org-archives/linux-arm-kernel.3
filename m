Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1147C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 09:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kDikvsdMYoBh9+d7XLGt2RYJcuAPps9Xjx/TmVaf2Js=; b=vqg9Kte2t4MmkHov1CwS9K+PM2
	m8f9pK3HU0R6Vnv/lBg6Xj8aNnF3pdNc80kI4UqPdSA6YkQhA9RxcJwni1Djjtc/NiRaS/0flIAmv
	semLcq98I+LfdQpUFPK5IruwYRWIl5kje4Cds8CaWCwTEzjwQjH69sXhqvZjdnhF/72HJnWVK6HzG
	Q7NyN2dD98UMfyfpJZR5xragdphj/TirJ1sm6pSxUT8+GApc2MIhiAQ3Ac3cKQRfQs1M5RGv71GUj
	zpFY/KAYPKpvvTaly/WG9pcK6LVqjUUy922T61s7YeHwSOAxpehbesbusxWsWNJAmbuJL6UDKFxGE
	LqHMXvCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLCS-0000000CtHS-1hCw;
	Fri, 21 Aug 2026 09:06:08 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxLCQ-0000000CtH4-11AZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 09:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1787303166; x=1818839166;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kDikvsdMYoBh9+d7XLGt2RYJcuAPps9Xjx/TmVaf2Js=;
  b=NcRiTJtf7OrTro02mDWo+9cqA0yBDPtK2mBkwI+yqHL+0jwH6CSJ8IyQ
   URLzLup3E2HD+bZJYCDSCMJRmUwCDwvtpRwQMAkqRMkwhRbnDOI1M24sF
   xh85JWjKClybhf8+T6A6L3SgepukCQZ9EEJHYwJAfOV1lq5E9R/tozhI2
   9gsvQqDl9bnjXqSN9vz54GrxniMU1+B7VSyW1nuX79QBcpCCXcbZtu83L
   uPzFbK4C70kaqjXxBMzBvGtSyIPC6p4cy7MzWUyQ7xIzvCx35vbbgfJy/
   9RJog5LMKchyK3K0CS2wtVbhABE0PeJk/r/ut1kVRh5FZDhqWatMBiAlJ
   g==;
X-CSE-ConnectionGUID: osgsXeJ8R1WCH3BBfegUfg==
X-CSE-MsgGUID: LJFy35O7Q6msC9DYR1OT8g==
X-IronPort-AV: E=Sophos;i="6.25,234,1779148800"; 
   d="scan'208";a="26569210"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 09:05:59 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:3958]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.103:2525] with esmtp (Farcaster)
 id e5a5d0b5-0376-458c-a3d6-00551f3acdaa; Fri, 21 Aug 2026 09:05:59 +0000 (UTC)
X-Farcaster-Flow-ID: e5a5d0b5-0376-458c-a3d6-00551f3acdaa
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Fri, 21 Aug 2026 09:05:59 +0000
Received: from dev-dsk-doebel-1a-7b355d76.us-east-1.amazon.com (10.169.119.5)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Fri, 21 Aug 2026 09:05:58 +0000
From: Bjoern Doebel <doebel@amazon.de>
To: <stable@vger.kernel.org>
CC: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
	<oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>,
	<kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Sean
 Christopherson" <seanjc@google.com>, Bjoern Doebel <doebel@amazon.de>
Subject: [PATCH 5.10.y] KVM: arm64: Retry fault if vma_lookup() results become invalid
Date: Fri, 21 Aug 2026 09:05:38 +0000
Message-ID: <20260821090538.3493280-1-doebel@amazon.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.119.5]
X-ClientProxiedBy: EX19D040UWA002.ant.amazon.com (10.13.139.113) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_020606_356600_17ED4CD3 
X-CRM114-Status: GOOD (  19.94  )
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

From: David Matlack <dmatlack@google.com>

commit 13ec9308a85702af7c31f3638a2720863848a7f2 upstream.

Read mmu_invalidate_seq before dropping the mmap_lock so that KVM can
detect if the results of vma_lookup() (e.g. vma_shift) become stale
before it acquires kvm->mmu_lock. This fixes a theoretical bug where a
VMA could be changed by userspace after vma_lookup() and before KVM
reads the mmu_invalidate_seq, causing KVM to install page table entries
based on a (possibly) no-longer-valid vma_shift.

Re-order the MMU cache top-up to earlier in user_mem_abort() so that it
is not done after KVM has read mmu_invalidate_seq (i.e. so as to avoid
inducing spurious fault retries).

This bug has existed since KVM/ARM's inception. It's unlikely that any
sane userspace currently modifies VMAs in such a way as to trigger this
race. And even with directed testing I was unable to reproduce it. But a
sufficiently motivated host userspace might be able to exploit this
race.

Fixes: 94f8e6418d39 ("KVM: ARM: Handle guest faults in KVM")
Cc: stable@vger.kernel.org
Reported-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20230313235454.2964067-1-dmatlack@google.com
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
[doebel: adjust to contextual and naming differences in 5.10]
Signed-off-by: Bjoern Doebel <doebel@amazon.de>
---
The fix is already present in every newer supported stable tree, so
5.10.y is the only one left without it:

  5.15.y  00f74003edf5 (backport)
  6.1.y   e1562cc202c9 (backport)
  6.6.y   and later contain the mainline commit 13ec9308a857 itself

Tested using the Amazon Linux kernel test suite.

 arch/arm64/kvm/mmu.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 26068456ec0f3..2cda74acada2e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -769,6 +769,19 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		return -EFAULT;
 	}
 
+	/*
+	 * Permission faults just need to update the existing leaf entry,
+	 * and so normally don't require allocations from the memcache. The
+	 * only exception to this is when dirty logging is enabled at runtime
+	 * and a write fault needs to collapse a block entry into a table.
+	 */
+	if (fault_status != FSC_PERM || (logging_active && write_fault)) {
+		ret = kvm_mmu_topup_memory_cache(memcache,
+						 kvm_mmu_cache_min_pages(kvm));
+		if (ret)
+			return ret;
+	}
+
 	/* Let's check if we will get back a huge page backed by hugetlbfs */
 	mmap_read_lock(current->mm);
 	vma = find_vma_intersection(current->mm, hva, hva + 1);
@@ -818,32 +831,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		fault_ipa &= ~(vma_pagesize - 1);
 
 	gfn = fault_ipa >> PAGE_SHIFT;
-	mmap_read_unlock(current->mm);
 
 	/*
-	 * Permission faults just need to update the existing leaf entry,
-	 * and so normally don't require allocations from the memcache. The
-	 * only exception to this is when dirty logging is enabled at runtime
-	 * and a write fault needs to collapse a block entry into a table.
+	 * Read mmu_notifier_seq so that KVM can detect if the results of
+	 * find_vma_intersection() or gfn_to_pfn_prot() become stale prior to
+	 * acquiring kvm->mmu_lock.
+	 *
+	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
+	 * with the smp_wmb() in kvm_mmu_notifier_invalidate_range_end().
 	 */
-	if (fault_status != FSC_PERM || (logging_active && write_fault)) {
-		ret = kvm_mmu_topup_memory_cache(memcache,
-						 kvm_mmu_cache_min_pages(kvm));
-		if (ret)
-			return ret;
-	}
-
 	mmu_seq = vcpu->kvm->mmu_notifier_seq;
-	/*
-	 * Ensure the read of mmu_notifier_seq happens before we call
-	 * gfn_to_pfn_prot (which calls get_user_pages), so that we don't risk
-	 * the page we just got a reference to gets unmapped before we have a
-	 * chance to grab the mmu_lock, which ensure that if the page gets
-	 * unmapped afterwards, the call to kvm_unmap_hva will take it away
-	 * from us again properly. This smp_rmb() interacts with the smp_wmb()
-	 * in kvm_mmu_notifier_invalidate_<page|range_end>.
-	 */
-	smp_rmb();
+	mmap_read_unlock(current->mm);
 
 	pfn = gfn_to_pfn_prot(kvm, gfn, write_fault, &writable);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
-- 
2.51.0


