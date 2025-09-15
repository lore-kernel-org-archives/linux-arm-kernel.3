Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96757CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 15:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fPVxuyd8w99IkglfUjmc7TPDgqFfDRBitAATD96XN7E=; b=2mJ8JWufG+3rsZqnJageME4kEo
	yGUykRCvT0PLxjkSywbVH6rVuATXFfx0HVpEIjcZk9znBlIF9dxEUWlbrYGHy6sHPTyF6E3m1AhOU
	pB7dc/+Di1FxNGcXWkpeNeluIY2GKtZPoHsIJMOIpYGz+0moWGFDuPKUO7kf/9Hj40M09gVlXw5Tp
	RZA9umW7O915qduXST+7tKgaemgFirIKKrhIp8nG62NhcQLIkvoGvxdVZMBKxKlrabiYW2oYQsTrR
	M8np+Zo7X7RcORFk9/aWD6ynsjtR+mfVT4FdIBkFtYQwEp27fmDUoFdxagkk3cKZtIdpHFGlSliAs
	ieigHxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBW3-0000000515h-1BXK;
	Mon, 15 Sep 2025 15:53:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBW0-0000000515G-1x8j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 15:53:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 499F71424;
	Mon, 15 Sep 2025 08:53:05 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 470753F673;
	Mon, 15 Sep 2025 08:53:11 -0700 (PDT)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Peter Collingbourne <pcc@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH] KVM: arm64: Update stale comment for sanitise_mte_tags()
Date: Mon, 15 Sep 2025 16:52:34 +0100
Message-ID: <20250915155234.196288-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_085316_544612_F210BC43 
X-CRM114-Status: GOOD (  13.93  )
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

Commit c911f0d46879 ("KVM: arm64: permit all VM_MTE_ALLOWED mappings
with MTE enabled") allowed VM_SHARED VMAs in a VM with MTE enabled, so
remove the comment to the contrary.

Commit d77e59a8fccd ("arm64: mte: Lock a page for MTE tag initialisation")
removed the race that can lead to tags being zeroed more than once when
multiple threads attempt initialisation at the same time, so remove the
comment about mmap_lock too. Note that sanitise_mte_tags() was never called
with the mmap_lock held from user_mem_abort() and the race was prevented by
kvm->mmu_lock.

However, the function still requires to have the kvm->mmu_lock held to
ensure that the memory remains mapped in the userspace process while the
tags are zeroed. Document this in a comment.

CC: Peter Collingbourne <pcc@google.com>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Steven Price <steven.price@arm.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/mmu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 86f3d80daf37..33f4c923be70 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1459,11 +1459,8 @@ static int get_vma_page_shift(struct vm_area_struct *vma, unsigned long hva)
  * able to see the page's tags and therefore they must be initialised first. If
  * PG_mte_tagged is set, tags have already been initialised.
  *
- * The race in the test/set of the PG_mte_tagged flag is handled by:
- * - preventing VM_SHARED mappings in a memslot with MTE preventing two VMs
- *   racing to santise the same page
- * - mmap_lock protects between a VM faulting a page in and the VMM performing
- *   an mprotect() to add VM_MTE
+ * Must be called with kvm->mmu_lock held to ensure the memory remains mapped
+ * while the tags are zeroed.
  */
 static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
 			      unsigned long size)

base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
-- 
2.51.0


