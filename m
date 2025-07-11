Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE64C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YOxtHKXt9a7hct+Cn85HNLPLpxsE1/DpoHK+PRaghs=; b=G9hqS7e5rIw1o38Ze+6rxJhUrw
	BrvAgUtbhVaIT9hJHrYNxEj0WU1/6yIqSY6iM7QTH5nj3iITGWzfyVnQtZJT93bhcgB4cHDeGA8B4
	mGT30PWq07Odoq7YqOwsYMxIwlY/rVlABDji8gtZ6sA5Jq57pBZ9jkRhszNXMxW1/n6qO9WSpxp/C
	Vc15iMCnJpvz0d+1uVDYle5rcS0inzgCTOeXX+fa+nQZ6nwXGLaIM8Bbb31xZwn6kT0ADquqOXC5k
	OHneN0HPmHJ4AJtGjYaonFPJHdMsL4XGshbUuYn9ufru+rQotrOfdSg387E1MyyfPLu18qwOIP7u2
	ZOOrAQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaH9T-0000000FMFc-1ytV;
	Fri, 11 Jul 2025 17:03:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGRZ-0000000FGCx-1UOp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:17:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E43A65C71FF;
	Fri, 11 Jul 2025 16:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9494C4CEF6;
	Fri, 11 Jul 2025 16:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752250668;
	bh=omASSf5AodAZJuWCX0tb4hiAUdVWa3UIK9zu/g/yffM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Re+Ll/b20qk+1VLbHfZ5OgRv+ruiurQeg34El3ijBhRwVEuLWOzCvdykuUxfM5ZBz
	 jTntl/TgmN96C2gaTttrPyIJNq0WeKoWLArhVnfPg55PzxH0HdKFmIMY7RZobP3rSG
	 nchrEZc+GzmEe8lyrGGXd1SCqKNZZketyEosEYXL4Ak/RBhJjpCUWHcsJj6NQF3wlG
	 IyWd5cQjZJIwFb0vlTURT5D5fsLVLnVqg5FKIK3vDopE16AYmRG3nkRGA/awhxnYAW
	 KddjqQU4qYmWvEITZCztmNASX02ty/ZgBGK4xldyubNezUMbOkMbyGxe0B1ER1nU3C
	 GEL4T+GhNpXLQ==
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
Subject: [PATCH 03/10] arm64: mm: Implicitly invalidate user ASID based on TLBI operation
Date: Fri, 11 Jul 2025 17:17:25 +0100
Message-Id: <20250711161732.384-4-will@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711161732.384-1-will@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_091749_472293_0049E6CC 
X-CRM114-Status: GOOD (  13.48  )
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

When kpti is enabled, separate ASIDs are used for userspace and
kernelspace, requiring ASID-qualified TLB invalidation by virtual
address to invalidate both of them.

Push the logic for invalidating the two ASIDs down into the low-level
__tlbi_level_op() function based on the TLBI operation and remove the
burden from the caller to handle the kpti-specific behaviour.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 45 ++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 4408aeebf4d5..08e509f37b28 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -115,17 +115,25 @@ enum tlbi_op {
 
 #define TLBI_TTL_UNKNOWN	INT_MAX
 
-#define __GEN_TLBI_OP_CASE(op)						\
+#define ___GEN_TLBI_OP_CASE(op)						\
 	case op:							\
-		__tlbi(op, arg);					\
+		__tlbi(op, arg)
+
+#define __GEN_TLBI_OP_ASID_CASE(op)					\
+	___GEN_TLBI_OP_CASE(op);					\
+		__tlbi_user(op, arg);					\
+		break
+
+#define __GEN_TLBI_OP_CASE(op)						\
+	___GEN_TLBI_OP_CASE(op);					\
 		break
 
 static __always_inline void __tlbi_level_op(const enum tlbi_op op, u64 arg)
 {
 	switch (op) {
-	__GEN_TLBI_OP_CASE(vae1is);
+	__GEN_TLBI_OP_ASID_CASE(vae1is);
 	__GEN_TLBI_OP_CASE(vae2is);
-	__GEN_TLBI_OP_CASE(vale1is);
+	__GEN_TLBI_OP_ASID_CASE(vale1is);
 	__GEN_TLBI_OP_CASE(vale2is);
 	__GEN_TLBI_OP_CASE(vaale1is);
 	__GEN_TLBI_OP_CASE(ipas2e1);
@@ -134,7 +142,8 @@ static __always_inline void __tlbi_level_op(const enum tlbi_op op, u64 arg)
 		BUILD_BUG();
 	}
 }
-#undef __GEN_TLBI_OP_CASE
+#undef __GEN_TLBI_OP_ASID_CASE
+#undef ___GEN_TLBI_OP_CASE
 
 #define __tlbi_level(op, addr, level) do {				\
 	u64 arg = addr;							\
@@ -150,11 +159,6 @@ static __always_inline void __tlbi_level_op(const enum tlbi_op op, u64 arg)
 	__tlbi_level_op(op, arg);					\
 } while(0)
 
-#define __tlbi_user_level(op, arg, level) do {				\
-	if (arm64_kernel_unmapped_at_el0())				\
-		__tlbi_level(op, (arg | USER_ASID_FLAG), level);	\
-} while (0)
-
 /*
  * This macro creates a properly formatted VA operand for the TLB RANGE. The
  * value bit assignments are:
@@ -418,22 +422,28 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
  *    operations can only span an even number of pages. We save this for last to
  *    ensure 64KB start alignment is maintained for the LPA2 case.
  */
-#define __GEN_TLBI_OP_CASE(op)						\
+#define ___GEN_TLBI_OP_CASE(op)						\
 	case op:							\
-		__tlbi(r ## op, arg);					\
+		__tlbi(r ## op, arg)
+
+#define __GEN_TLBI_OP_ASID_CASE(op)					\
+	___GEN_TLBI_OP_CASE(op);					\
+		__tlbi_user(r ## op, arg);				\
 		break
 
 static __always_inline void __tlbi_range(const enum tlbi_op op, u64 arg)
 {
 	switch (op) {
-	__GEN_TLBI_OP_CASE(vae1is);
-	__GEN_TLBI_OP_CASE(vale1is);
+	__GEN_TLBI_OP_ASID_CASE(vae1is);
+	__GEN_TLBI_OP_ASID_CASE(vale1is);
 	__GEN_TLBI_OP_CASE(vaale1is);
 	__GEN_TLBI_OP_CASE(ipas2e1is);
 	default:
 		BUILD_BUG();
 	}
 }
+#undef __GEN_TLBI_OP_ASID_CASE
+#undef ___GEN_TLBI_OP_CASE
 #undef __GEN_TLBI_OP_CASE
 
 #define __flush_tlb_range_op(op, start, pages, stride,			\
@@ -452,8 +462,6 @@ do {									\
 		    (lpa2 && __flush_start != ALIGN(__flush_start, SZ_64K))) {	\
 			addr = __TLBI_VADDR(__flush_start, asid);	\
 			__tlbi_level(op, addr, tlb_level);		\
-			if (tlbi_user)					\
-				__tlbi_user_level(op, addr, tlb_level);	\
 			__flush_start += stride;			\
 			__flush_pages -= stride >> PAGE_SHIFT;		\
 			continue;					\
@@ -464,8 +472,6 @@ do {									\
 			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
 						scale, num, tlb_level);	\
 			__tlbi_range(op, addr);				\
-			if (tlbi_user)					\
-				__tlbi_user(r##op, addr);		\
 			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
 			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
 		}							\
@@ -584,6 +590,7 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 {
 	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
 }
-#endif
 
+#undef __tlbi_user
+#endif
 #endif
-- 
2.50.0.727.gbf7dc18ff4-goog


