Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C875CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yOM1PN5czx7scwUKwUhx6A2SYy7dvS5ZXaKI/E17uTQ=; b=0MlwE1y4YEWHvr3hFV6Y+CpAIq
	nQ1k8CaJZbxJclZd3C8jiFT9apXTygdu0nsc5OtJ4Z+FUPi0dDF91ai4Qm/f5fg+fhGc92r1FXcQF
	yAAgX6CDLOkPlrKL/6FvwEm+zoABM+JJtsmxfXAFyemNC67derbmuPhIj4z/aKigPcJOr9uy2QpWe
	Dl9pC1ZsXY7DXtWCCJobXxFbQKuvHf8R56/5N/aJlp8ugskI1mvWHuxQPysY2upq05JKcKPMVw2+m
	DtzcD9R7/fm6GTGIt2r50hIKf4++03l9GNB2IVri2qE09jy9GNZ1rqpVyPGC9Jxfw7PNLpwAmH6Jb
	sI0/DnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2YM-0000000Fchw-1v3c;
	Tue, 21 Oct 2025 02:56:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2YJ-0000000Fcgj-3oyc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 02:56:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D39371063;
	Mon, 20 Oct 2025 19:56:36 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 852D03F59E;
	Mon, 20 Oct 2025 19:56:43 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-s390@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	virtualization@lists.linux.dev
Subject: [PATCH] mm: Make INVALID_PHYS_ADDR a generic macro
Date: Tue, 21 Oct 2025 03:56:38 +0100
Message-Id: <20251021025638.2420216-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_195647_985763_3C2F5604 
X-CRM114-Status: GOOD (  11.32  )
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

INVALID_PHYS_ADDR has very similar definitions across the code base. Hence
just move that inside header <liux/mm.h> for more generic usage. Also drop
the now redundant ones which are no longer required.

Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: iommu@lists.linux.dev
Cc: linux-s390@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: virtualization@lists.linux.dev
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/mmu.c                  | 2 --
 arch/s390/boot/vmem.c                | 1 -
 drivers/vdpa/vdpa_user/iova_domain.h | 2 --
 include/linux/mm.h                   | 2 ++
 kernel/dma/swiotlb.c                 | 2 --
 5 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e80bb623ef53..1da02d908c30 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -470,8 +470,6 @@ static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 	mutex_unlock(&fixmap_lock);
 }
 
-#define INVALID_PHYS_ADDR	(-1ULL)
-
 static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
 				       enum pgtable_type pgtable_type)
 {
diff --git a/arch/s390/boot/vmem.c b/arch/s390/boot/vmem.c
index cea3de4dce8c..fbe64ffdfb96 100644
--- a/arch/s390/boot/vmem.c
+++ b/arch/s390/boot/vmem.c
@@ -16,7 +16,6 @@
 #include "decompressor.h"
 #include "boot.h"
 
-#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
 struct ctlreg __bootdata_preserved(s390_invalid_asce);
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/vdpa/vdpa_user/iova_domain.h b/drivers/vdpa/vdpa_user/iova_domain.h
index 775cad5238f3..a923971a64f5 100644
--- a/drivers/vdpa/vdpa_user/iova_domain.h
+++ b/drivers/vdpa/vdpa_user/iova_domain.h
@@ -17,8 +17,6 @@
 
 #define IOVA_START_PFN 1
 
-#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
-
 #define BOUNCE_MAP_SHIFT	12
 #define BOUNCE_MAP_SIZE	(1 << BOUNCE_MAP_SHIFT)
 #define BOUNCE_MAP_MASK	(~(BOUNCE_MAP_SIZE - 1))
diff --git a/include/linux/mm.h b/include/linux/mm.h
index d16b33bacc32..543a5f780874 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -105,6 +105,8 @@ extern int mmap_rnd_compat_bits __read_mostly;
 # endif
 #endif
 
+#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
+
 #include <asm/page.h>
 #include <asm/processor.h>
 
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 0d37da3d95b6..a547c7693135 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -61,8 +61,6 @@
  */
 #define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
 
-#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
-
 /**
  * struct io_tlb_slot - IO TLB slot descriptor
  * @orig_addr:	The original address corresponding to a mapped entry.
-- 
2.30.2


