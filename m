Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198FBC83F20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxZURMaAzFVYOU6+JIIBfFL/Hfvu7gIC1XYZhe9DgqI=; b=GxaJJ668NCr2zXq9xuRXlAZoTj
	4DpOO3Y5jIG7q1JUmjQRdwZ0KKxLV/bihgLyhyGb0e+91rjm9bbXCExOe9gyJJcFYkXankTSuf7OL
	vkYX0pnrcd5eYTtO3xiFGE87lGLx36vaXwtIuvBHWuT4W2jUP6eGHMHZWgUojAPstlQ5/VaaXVudP
	fHR080rPj5fDZ1LwohVW1scH4SZT4QrGPWUeXDEI/LwCRin4awrxBd7+s1P01N3e/8va+jLBPYEaj
	kLQ7FzrMk6RuIdBzgq9wXYc8m+pasI9tvRhfZSt/zwYBexDuWd4vs39fo+m6WrPktasn6sAOYiVD8
	xUnBw/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHTN-0000000FOQX-27OQ;
	Fri, 11 Jul 2025 17:23:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGRl-0000000FGGU-2brP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:18:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 146C76144A;
	Fri, 11 Jul 2025 16:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AC8C4CEED;
	Fri, 11 Jul 2025 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752250680;
	bh=buXKCURD0rDg9LCeJR6ajdKTgsrB7TdGsFPHuLOxDsM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pK+Ugg/ROm1qkMd7IQzB6dWQZbn/qW5fG74SQ6NyZHiYOBAjT8B6TB7oEI8/XPysF
	 Y46suYS74Kyqm88XLKPHlOta0+rbDOjtiyV4oPyOuxH4VBNhWu8mZIbM+DYfxDSitA
	 Fg4bbtpMosIb+YB1qCgAeOInjmsfJEL4DZmg0i3DYxxXc3Phjf36cr1w2FLqNQayNn
	 89Qfc3uYCIQJtaXNWDIfv/8eV7uZUiiP38f58VzBoBYtGPYRwnmdisAXWhUZXZpTXO
	 NDuQPkpM/S+FV836EOWXeJ19qS6oDPZcDsBOjWEbhHXLq+Nwne6ZqhCQwYHhrfSWwc
	 TRAsmm4j8HUNw==
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
Subject: [PATCH 08/10] arm64: mm: Inline __TLBI_VADDR_RANGE() into __tlbi_range()
Date: Fri, 11 Jul 2025 17:17:30 +0100
Message-Id: <20250711161732.384-9-will@kernel.org>
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

The __TLBI_VADDR_RANGE() macro is only used in one place and isn't
something that's generally useful outside of the low-level range
invalidation gubbins.

Inline __TLBI_VADDR_RANGE() into the __tlbi_range() function so that the
macro can be removed entirely.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 32 +++++++++++++------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 434b9fdb340a..8618a85d5cd3 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -185,19 +185,6 @@ static inline void __tlbi_level(const enum tlbi_op op, u64 addr, u32 level)
 #define TLBIR_TTL_MASK		GENMASK_ULL(38, 37)
 #define TLBIR_BADDR_MASK	GENMASK_ULL(36,  0)
 
-#define __TLBI_VADDR_RANGE(baddr, asid, scale, num, ttl)		\
-	({								\
-		unsigned long __ta = 0;					\
-		unsigned long __ttl = (ttl >= 1 && ttl <= 3) ? ttl : 0;	\
-		__ta |= FIELD_PREP(TLBIR_BADDR_MASK, baddr);		\
-		__ta |= FIELD_PREP(TLBIR_TTL_MASK, __ttl);		\
-		__ta |= FIELD_PREP(TLBIR_NUM_MASK, num);		\
-		__ta |= FIELD_PREP(TLBIR_SCALE_MASK, scale);		\
-		__ta |= FIELD_PREP(TLBIR_TG_MASK, get_trans_granule());	\
-		__ta |= FIELD_PREP(TLBIR_ASID_MASK, asid);		\
-		__ta;							\
-	})
-
 /* These macros are used by the TLBI RANGE feature. */
 #define __TLBI_RANGE_PAGES(num, scale)	\
 	((unsigned long)((num) + 1) << (5 * (scale) + 1))
@@ -426,8 +413,19 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 		__tlbi_user(r ## op, arg);				\
 		break
 
-static __always_inline void __tlbi_range(const enum tlbi_op op, u64 arg)
+static __always_inline void __tlbi_range(const enum tlbi_op op, u64 addr,
+					 u16 asid, int scale, int num,
+					 u32 level, bool lpa2)
 {
+	u64 arg = 0;
+
+	arg |= FIELD_PREP(TLBIR_BADDR_MASK, addr >> (lpa2 ? 16 : PAGE_SHIFT));
+	arg |= FIELD_PREP(TLBIR_TTL_MASK, level > 3 ? 0 : level);
+	arg |= FIELD_PREP(TLBIR_NUM_MASK, num);
+	arg |= FIELD_PREP(TLBIR_SCALE_MASK, scale);
+	arg |= FIELD_PREP(TLBIR_TG_MASK, get_trans_granule());
+	arg |= FIELD_PREP(TLBIR_ASID_MASK, asid);
+
 	switch (op) {
 	__GEN_TLBI_OP_ASID_CASE(vae1is);
 	__GEN_TLBI_OP_ASID_CASE(vale1is);
@@ -448,8 +446,6 @@ do {									\
 	typeof(pages) __flush_pages = pages;				\
 	int num = 0;							\
 	int scale = 3;							\
-	int shift = lpa2 ? 16 : PAGE_SHIFT;				\
-	unsigned long addr;						\
 									\
 	while (__flush_pages > 0) {					\
 		if (!system_supports_tlb_range() ||			\
@@ -463,9 +459,7 @@ do {									\
 									\
 		num = __TLBI_RANGE_NUM(__flush_pages, scale);		\
 		if (num >= 0) {						\
-			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
-						scale, num, tlb_level);	\
-			__tlbi_range(op, addr);				\
+			__tlbi_range(op, __flush_start, asid, scale, num, tlb_level, lpa2); \
 			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
 			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
 		}							\
-- 
2.50.0.727.gbf7dc18ff4-goog


