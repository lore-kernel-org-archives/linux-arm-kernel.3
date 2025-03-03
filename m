Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB70C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 04:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1tFEXL7X+ZeXxAdCVleBIOKMiIQ0DK8zTD3aSp+0pG4=; b=GC47tbLr4//w29CFE4XgtA2sOm
	kwpTaAzIDza/1659e3uodRyZ8yPTfaVRRnxyEzWe4PGPrg65y3ntt/J5tSLPOeFSIhyVlbuoS5PW3
	JT+wtzwJhGJIjoaGpuL3wf5/MGR9ae6oPOu7fLAg+pNi7apx8wkRPoQtbw9h4On9URLe7XTboewmc
	1A2wfYl9w0notIQAYrQZja+en9RvfMM8Iio2gK+XQe+AQdx+nifS0Ny49drYWYg1VLfy+Q64il8FY
	pLCoApKS+Gtr0tNmABW4c3dxNIi8w8EPqyfxKzB4liT67ogiQlY2aaL0wOxCooYw0PO9v8qPMVHEF
	9nLkjn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxI1-0000000H9BA-1IXh;
	Mon, 03 Mar 2025 04:20:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toxGR-0000000H967-006G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 04:18:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA83F113E;
	Sun,  2 Mar 2025 20:18:57 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.40.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9D953F66E;
	Sun,  2 Mar 2025 20:18:40 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Create level specific section mappings in map_range()
Date: Mon,  3 Mar 2025 09:48:34 +0530
Message-Id: <20250303041834.2796751-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_201847_083207_FF30CE08 
X-CRM114-Status: GOOD (  11.52  )
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

Currently PMD section mapping mask i.e PMD_TYPE_SECT is used while creating
section mapping at all page table levels except the last level. This works
fine as the section mapping masks are exactly the same (0x1UL) for all page
table levels.

This will change in the future with D128 page tables that have unique skip
level values (SKL) required for creating section mapping at different page
table levels. Hence use page table level specific section mapping macros
instead of the common PMD_TYPE_SECT.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on 6.14-rc5

PGD_TYPE_SECT for level -1 section map handling has been added for 4K
base pages with 52 bit VA configuration that has 5 page table levels.
In such cases (CONFIG_PGTABLE_LEVELS = 5) early_map_kernel() can call
map_range() eventually with -1 (i.e 4 - CONFIG_PGTABLE_LEVELS) as the
root_level.

 arch/arm64/include/asm/pgtable-hwdef.h |  1 +
 arch/arm64/kernel/pi/map_range.c       | 23 +++++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index a9136cc551cc..fd0a82e8878c 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -99,6 +99,7 @@
 #define PGD_TYPE_TABLE		(_AT(pgdval_t, 3) << 0)
 #define PGD_TABLE_BIT		(_AT(pgdval_t, 1) << 1)
 #define PGD_TYPE_MASK		(_AT(pgdval_t, 3) << 0)
+#define PGD_TYPE_SECT		(_AT(pgdval_t, 1) << 0)
 #define PGD_TABLE_AF		(_AT(pgdval_t, 1) << 10)	/* Ignored if no FEAT_HAFT */
 #define PGD_TABLE_PXN		(_AT(pgdval_t, 1) << 59)
 #define PGD_TABLE_UXN		(_AT(pgdval_t, 1) << 60)
diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
index 2b69e3beeef8..9ea869f5745f 100644
--- a/arch/arm64/kernel/pi/map_range.c
+++ b/arch/arm64/kernel/pi/map_range.c
@@ -44,8 +44,27 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
 	 * Set the right block/page bits for this level unless we are
 	 * clearing the mapping
 	 */
-	if (protval)
-		protval |= (level < 3) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
+	if (protval) {
+		switch (level) {
+		case 3:
+			protval |= PTE_TYPE_PAGE;
+			break;
+		case 2:
+			protval |= PMD_TYPE_SECT;
+			break;
+		case 1:
+			protval |= PUD_TYPE_SECT;
+			break;
+		case 0:
+			protval |= P4D_TYPE_SECT;
+			break;
+		case -1:
+			protval |= PGD_TYPE_SECT;
+			break;
+		default:
+			break;
+		}
+	}
 
 	while (start < end) {
 		u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
-- 
2.30.2


