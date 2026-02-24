Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C95AEFB7FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 05:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOfJKZ9DGB+oMBxnGCCCl/YVTRiM1fzTpfqUHgJRSGs=; b=YdCW7AqOJfLhaxxU53Z8cY0Pui
	UEifUoUCGadwejWlGIKt0sy/aCrxTAV0L869K2/RLh0dmGhQ2NpmjCKWPInqPby6ibKEp1Wh+uukc
	8D0mHNwWeItS6W9big42dJ9atTn/PVfI29uje3HLUAzPKYn/k9zN14xt8f+2pcxB59kyl9EydKpET
	uWsXhx0K9eZwLOnY3OmD+JWjb84gUav0IV+OJWHiyHKkkySnyvFF2SCOpG2EqycIzxrdudAHptX0D
	OVYY0nHZM6sZBQGeuxN84ypJKCHekyiZsNhrU3YkeQbg3ydqTGBgvicfIYytorrLo/CKdXtz2wTN+
	ljJ3KULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukjy-00000001TKS-1wUP;
	Tue, 24 Feb 2026 05:13:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukjt-00000001TEQ-0EUa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 05:13:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B1881570;
	Mon, 23 Feb 2026 21:13:33 -0800 (PST)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.18.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 98A843F7BD;
	Mon, 23 Feb 2026 21:13:35 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC V1 15/16] arm64/mm: Add macros __tlb_asid_level and __tlb_range
Date: Tue, 24 Feb 2026 10:41:52 +0530
Message-ID: <20260224051153.3150613-16-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224051153.3150613-1-anshuman.khandual@arm.com>
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_211341_189145_B95BA061 
X-CRM114-Status: GOOD (  13.71  )
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

From: Linu Cherian <linu.cherian@arm.com>

Existing __tlb_level macro uses encoded arguments for TLBI instructions
which is not compatible with TLBIP instructions required with FEAT_D128
both for level hint and range based operations.

Add two new macros __tlb_asid_level and __tlb_range that will work both
with existing TLBI and upcoming TLBIP instructions. __tlb_asid_level is
used for non range operations with level hints, where as __tlb_range is
used for range operations with level hints. Subsequently update the macro
__flush_tlb_range_op as required.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Linu Cherian <linu.cherian@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 47 ++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index a2d65d7d6aae..9c93ffbcc1e0 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -54,6 +54,8 @@
 		__tlbi(op, (arg) | USER_ASID_FLAG);				\
 } while (0)
 
+#define TLBI_ASID_MASK		GENMASK_ULL(63, 48)
+
 /* This macro creates a properly formatted VA operand for the TLBI */
 #define __TLBI_VADDR(addr, asid)				\
 	({							\
@@ -102,6 +104,8 @@ static inline unsigned long get_trans_granule(void)
  * in asm/stage2_pgtable.h.
  */
 #define TLBI_TTL_MASK		GENMASK_ULL(47, 44)
+#define TLBI_TG_MASK		GENMASK_ULL(47, 46)
+#define TLBI_LVL_MASK		GENMASK_ULL(45, 44)
 
 #define TLBI_TTL_UNKNOWN	INT_MAX
 
@@ -124,6 +128,15 @@ static inline unsigned long get_trans_granule(void)
 		__tlbi_level(op, (arg | USER_ASID_FLAG), level);	\
 } while (0)
 
+#define __tlb_asid_level(op, addr, asid, level, tlb_user) do {		\
+	u64 arg1;							\
+									\
+	arg1 = __TLBI_VADDR(addr, asid);				\
+	__tlbi_level(op, arg1, level);					\
+	if (tlb_user)							\
+		__tlbi_user_level(op, arg1, level);			\
+} while (0)
+
 /*
  * This macro creates a properly formatted VA operand for the TLB RANGE. The
  * value bit assignments are:
@@ -149,11 +162,10 @@ static inline unsigned long get_trans_granule(void)
 #define TLBIR_TTL_MASK		GENMASK_ULL(38, 37)
 #define TLBIR_BADDR_MASK	GENMASK_ULL(36,  0)
 
-#define __TLBI_VADDR_RANGE(baddr, asid, scale, num, ttl)		\
+#define __TLB_RANGE_ARGS(asid, scale, num, ttl)			\
 	({								\
 		unsigned long __ta = 0;					\
 		unsigned long __ttl = (ttl >= 1 && ttl <= 3) ? ttl : 0;	\
-		__ta |= FIELD_PREP(TLBIR_BADDR_MASK, baddr);		\
 		__ta |= FIELD_PREP(TLBIR_TTL_MASK, __ttl);		\
 		__ta |= FIELD_PREP(TLBIR_NUM_MASK, num);		\
 		__ta |= FIELD_PREP(TLBIR_SCALE_MASK, scale);		\
@@ -162,6 +174,13 @@ static inline unsigned long get_trans_granule(void)
 		__ta;							\
 	})
 
+#define __TLBI_VADDR_RANGE(baddr, args)					\
+	({								\
+		unsigned long __ta = args;				\
+		__ta |= FIELD_PREP(TLBIR_BADDR_MASK, baddr);		\
+		__ta;							\
+	})
+
 /* These macros are used by the TLBI RANGE feature. */
 #define __TLBI_RANGE_PAGES(num, scale)	\
 	((unsigned long)((num) + 1) << (5 * (scale) + 1))
@@ -181,6 +200,16 @@ static inline unsigned long get_trans_granule(void)
 		(__pages >> (5 * (scale) + 1)) - 1;			\
 	})
 
+#define __tlb_range(op, addr, lpa2, range_args, tlb_user) do {		\
+	u64 arg1;							\
+	int shift = lpa2 ? 16 : PAGE_SHIFT;				\
+									\
+	arg1 = __TLBI_VADDR_RANGE((addr) >> shift,  range_args);	\
+	__tlbi(r##op, arg1);						\
+	if (tlb_user)							\
+		__tlbi_user(r##op, arg1);				\
+} while (0)
+
 /*
  *	TLB Invalidation
  *	================
@@ -423,17 +452,12 @@ do {									\
 	typeof(pages) __flush_pages = pages;				\
 	int num = 0;							\
 	int scale = 3;							\
-	int shift = lpa2 ? 16 : PAGE_SHIFT;				\
-	unsigned long addr;						\
 									\
 	while (__flush_pages > 0) {					\
 		if (!system_supports_tlb_range() ||			\
 		    __flush_pages == 1 ||				\
 		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
-			addr = __TLBI_VADDR(__flush_start, asid);	\
-			__tlbi_level(op, addr, tlb_level);		\
-			if (tlbi_user)					\
-				__tlbi_user_level(op, addr, tlb_level);	\
+			__tlb_asid_level(op, __flush_start, asid, tlb_level, tlbi_user);	\
 			__flush_start += stride;			\
 			__flush_pages -= stride >> PAGE_SHIFT;		\
 			continue;					\
@@ -441,11 +465,8 @@ do {									\
 									\
 		num = __TLBI_RANGE_NUM(__flush_pages, scale);		\
 		if (num >= 0) {						\
-			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
-						scale, num, tlb_level);	\
-			__tlbi(r##op, addr);				\
-			if (tlbi_user)					\
-				__tlbi_user(r##op, addr);		\
+			u64 args = __TLB_RANGE_ARGS(asid, scale, num, tlb_level);	\
+			__tlb_range(op, __flush_start, lpa2, args, tlbi_user); \
 			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
 			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
 		}							\
-- 
2.43.0


