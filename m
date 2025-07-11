Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A37C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wkfa5pAJKxIqPlBx+fWFvWr54MX+QpMRkraYtSKtrTw=; b=JtVmTz6h4u6k4U8POiCmG/+15B
	0DT9O5VNfpTjTZAITne2+YI8AjqVKlwCxwNQXSaCEuJ2bZuNnycuLp2s+LRnWVo4lczuY9hI7Z0Vf
	35lJmJctCGwJc7KHBmF6W0xObTlv2vx/YqGBdx5eVMOflITWNmPOpuDA/NFSElXKAGwyJIWwaIDCU
	ECOmxlgD0qt//EswV6xcjQ0VG3way/iPvgnV/3O9SV2e0RM7ecKYQm4HYZ+VZE3dS9c+JjcV+zIFk
	ZEhhQwoLZ9119AZtdI5XD7Wbx597MCiuteufppLEvW8kgfCbYwNuTz9C0F4YxXfCRIjpfdiwj46DS
	wqOlL27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHXz-0000000FOzF-3pN8;
	Fri, 11 Jul 2025 17:28:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGRq-0000000FGIH-1yyl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:18:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E18AC61443;
	Fri, 11 Jul 2025 16:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A8AC4CEEF;
	Fri, 11 Jul 2025 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752250685;
	bh=dlETiSCP0bE/7Eo8LNeRjL0vHF3yV9EuAqXo0Nii9Qo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gUUS7ykYexH4zJ5LeQzrknTtSpvDTGSrjRCCI3ivPvxM00SmGnWwhhvuHWCGpkXT9
	 gt0hJzVqbFvq5jJt7orVDYOtf5INnTQKdfDvPshlFZ98vgfC6TbjPzuB0PBlpiuEW5
	 vlJseJ8qKce72EIX9QuzcGs2zn0QybPYFhidA1fNQAyDJYWNym6hZQwpRwfoNBddyg
	 FCkxwyVGD6yhLGX5Cctw1oizVqPJ+36kchYXqKd/Ou4NQafNI6z1Y4Dxu43XQtq88a
	 JGgYX9NbtwPXMaRInCfT0//2bLgSpQIrzjVCvPMFJwDAUz8DwVfaagxMbG6vJoUO0p
	 6VNKKoKwp5yfQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 10/10] arm64: mm: Re-implement the __flush_tlb_range_op macro in C
Date: Fri, 11 Jul 2025 17:17:32 +0100
Message-Id: <20250711161732.384-11-will@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711161732.384-1-will@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The __flush_tlb_range_op() macro is horrible and has been a previous
source of bugs thanks to multiple expansions of its arguments (see
commit f7edb07ad7c6 ("Fix mmu notifiers for range-based invalidates")).

Rewrite the thing in C.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 63 +++++++++++++++++--------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 2541863721af..ee69efdc12ab 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -376,12 +376,12 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 /*
  * __flush_tlb_range_op - Perform TLBI operation upon a range
  *
- * @op:	TLBI instruction that operates on a range (has 'r' prefix)
+ * @op:		TLBI instruction that operates on a range
  * @start:	The start address of the range
  * @pages:	Range as the number of pages from 'start'
  * @stride:	Flush granularity
  * @asid:	The ASID of the task (0 for IPA instructions)
- * @tlb_level:	Translation Table level hint, if known
+ * @level:	Translation Table level hint, if known
  * @lpa2:	If 'true', the lpa2 scheme is used as set out below
  *
  * When the CPU does not support TLB range operations, flush the TLB
@@ -439,33 +439,38 @@ static __always_inline void __tlbi_range(const enum tlbi_op op, u64 addr,
 #undef ___GEN_TLBI_OP_CASE
 #undef __GEN_TLBI_OP_CASE
 
-#define __flush_tlb_range_op(op, start, pages, stride,			\
-				asid, tlb_level, lpa2)			\
-do {									\
-	typeof(start) __flush_start = start;				\
-	typeof(pages) __flush_pages = pages;				\
-	int num = 0;							\
-	int scale = 3;							\
-									\
-	while (__flush_pages > 0) {					\
-		if (!system_supports_tlb_range() ||			\
-		    __flush_pages == 1 ||				\
-		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
-			__tlbi_level_asid(op, __flush_start, tlb_level, asid);	\
-			__flush_start += stride;			\
-			__flush_pages -= stride >> PAGE_SHIFT;		\
-			continue;					\
-		}							\
-									\
-		num = __TLBI_RANGE_NUM(__flush_pages, scale);		\
-		if (num >= 0) {						\
-			__tlbi_range(op, __flush_start, asid, scale, num, tlb_level, lpa2); \
-			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
-			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
-		}							\
-		scale--;						\
-	}								\
-} while (0)
+static __always_inline void __flush_tlb_range_op(const enum tlbi_op op,
+						 u64 start, size_t pages,
+						 u64 stride, u16 asid,
+						 u32 level, bool lpa2)
+{
+	u64 addr = start, end = start + pages * PAGE_SIZE;
+	int scale = 3;
+
+	while (addr != end) {
+		int num;
+
+		pages = (end - addr) >> PAGE_SHIFT;
+
+		if (!system_supports_tlb_range() || pages == 1)
+			goto invalidate_one;
+
+		if (lpa2 && !IS_ALIGNED(addr, SZ_64K))
+			goto invalidate_one;
+
+		num = __TLBI_RANGE_NUM(pages, scale);
+		if (num >= 0) {
+			__tlbi_range(op, addr, asid, scale, num, level, lpa2);
+			addr += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT;
+		}
+
+		scale--;
+		continue;
+invalidate_one:
+		__tlbi_level_asid(op, addr, level, asid);
+		addr += stride;
+	}
+}
 
 #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
 	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled());
-- 
2.50.0.727.gbf7dc18ff4-goog


