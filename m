Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181EFC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 06:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eQcVc8m4pHheQNVrHz0HjPKBmGEh25AttjDsh3mi2ys=; b=cB/ucR4Y8LZeKYH2NQ+xCKacB6
	xsaBqvGiUzyb910aP9NKr5S3T6FRtnxA1Q1jwEaE8tfkmu5U0quyUpRt4hSVqiPOn35mAfKIvQVob
	WHLEnlgPl4lqsySHmPgmRud+Tf56A3NyGydhbWjGXYfsRulikDk+JfmQDJfAzChHUefTKjF2w4SYQ
	Qi9CRm0bAAL0uHCY0ekZKBj3iTVcU5YN7RhPGSdjGfTe69bw5P0PAXJhx73GeM6wFxyFBFIrsqvNx
	hbP4WaTFULJOHFS7fB8Okgb1WdDpB5BRiOyK+fiFKmd9wiUT76VMPMExtiLuOZVR3lYR8jtjGpXcq
	CVowwECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSTF-0000000HCGJ-1FEI;
	Thu, 15 May 2025 06:53:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSBL-0000000HA6m-1iUO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 06:35:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49B50113E;
	Wed, 14 May 2025 23:34:48 -0700 (PDT)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.40.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 156673F673;
	Wed, 14 May 2025 23:34:55 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: david@redhat.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	mark.rutland@arm.com,
	yang@os.amperecomputing.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dev Jain <dev.jain@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: Check pxd_leaf() instead of !pxd_table() while tearing down page tables
Date: Thu, 15 May 2025 12:04:50 +0530
Message-Id: <20250515063450.86629-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_233503_494728_F39DA4BC 
X-CRM114-Status: GOOD (  10.58  )
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

Commit 9c006972c3fe removes the pxd_present() checks because the caller
checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
checks pud_present(); pud_free_pmd_page() recurses on each pmd through
pmd_free_pte_page(), wherein the pmd may be none. Thus it is possible to
hit a warning in the latter, since pmd_none => !pmd_table(). Thus, enforce
these checks again through pxd_leaf().
This problem was found by code inspection.
The patch is based on 6.15-rc6.

Fixes: 9c006972c3fe (arm64: mmu: drop pXd_present() checks from pXd_free_pYd_table())
Cc: <stable@vger.kernel.org>
Reported-by: Ryan Roberts <ryan.roberts@arm.com> 
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index ea6695d53fb9..3d6789413a9b 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1255,7 +1255,7 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 
 	pmd = READ_ONCE(*pmdp);
 
-	if (!pmd_table(pmd)) {
+	if (pmd_leaf(pmd)) {
 		VM_WARN_ON(1);
 		return 1;
 	}
@@ -1276,7 +1276,7 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
 
 	pud = READ_ONCE(*pudp);
 
-	if (!pud_table(pud)) {
+	if (pud_leaf(pud)) {
 		VM_WARN_ON(1);
 		return 1;
 	}
-- 
2.30.2


