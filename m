Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE2DCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 19:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R53fvkhVV3Xb41exbqKd9pNYy6kbhmJHJF04rxfH12A=; b=xKNrkIk2dIMxClMlqvkhd5d3PI
	tGtoGDvV60WnNv8h658F1hE5Wz2T0zj3THoESkMw8g0d1U+GnN60eL4jghxPa6VSJu7UjqgFxhlYb
	L8DyfdXYq1eArSlqhV3s12lTbMribBemH4P6k3Dns/m2UOV9gp/dX/qdvrkSZRtSHGeNhJRn/2mR9
	FVFCXpjXloc7ikezoBpe6oYMRnbGYd4jOQd+cF/KDKO4B3zKX3/IoGDq5GsPv8mrcNC5kNEqpU6nq
	Vxhg/xgskUB4Lzt+fwCl+e95ubaJ8/SaXn57qH9rWBNzzWCY4icVkpP+ASSYPWdjFdeR1hWFQ2oW0
	g175UfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4tG-00000006kxA-27Jb;
	Fri, 29 Aug 2025 19:36:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us18Q-00000006DGU-070q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:35:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 390C91BD0;
	Fri, 29 Aug 2025 08:35:17 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6828E3F738;
	Fri, 29 Aug 2025 08:35:24 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 1/2] arm64: tlbflush: Move invocation of __flush_tlb_range_op() to a macro
Date: Fri, 29 Aug 2025 16:35:07 +0100
Message-ID: <20250829153510.2401161-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250829153510.2401161-1-ryan.roberts@arm.com>
References: <20250829153510.2401161-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_083526_104923_7DA2D4C0 
X-CRM114-Status: GOOD (  12.08  )
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

__flush_tlb_range_op() is a pre-processor macro that takes the TLBI
operation as a string, and builds the instruction from it. This prevents
passing the TLBI operation around as a variable. __flush_tlb_range_op()
also takes 7 other arguments.

Adding extra invocations for different TLB operations means duplicating
the whole thing, but those 7 extra arguments are the same each time.

Add an enum for the TLBI operations that __flush_tlb_range() uses, and a
macro to pass the operation name as a string to __flush_tlb_range_op(),
and the rest of the arguments using __VA_ARGS_.

The result is easier to add new TLBI operations to, and to modify any of
the other arguments as they only appear once.

Suggested-by: James Morse <james.morse@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 18a5dc0c9a54..f66b8c4696d0 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -11,6 +11,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/bitfield.h>
+#include <linux/build_bug.h>
 #include <linux/mm_types.h>
 #include <linux/sched.h>
 #include <linux/mmu_notifier.h>
@@ -433,12 +434,32 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long start,
 	return false;
 }
 
+enum tlbi_op {
+	TLBI_VALE1IS,
+	TLBI_VAE1IS,
+};
+
+#define flush_tlb_range_op(op, ...)					\
+do {									\
+	switch (op) {							\
+	case TLBI_VALE1IS:						\
+		__flush_tlb_range_op(vale1is, __VA_ARGS__);		\
+		break;							\
+	case TLBI_VAE1IS:						\
+		__flush_tlb_range_op(vae1is, __VA_ARGS__);		\
+		break;							\
+	default:							\
+		BUILD_BUG_ON_MSG(1, "Unknown TLBI op");			\
+	}								\
+} while (0)
+
 static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 				     unsigned long start, unsigned long end,
 				     unsigned long stride, bool last_level,
 				     int tlb_level)
 {
 	unsigned long asid, pages;
+	enum tlbi_op tlbi_op;
 
 	start = round_down(start, stride);
 	end = round_up(end, stride);
@@ -452,12 +473,9 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 	dsb(ishst);
 	asid = ASID(mm);
 
-	if (last_level)
-		__flush_tlb_range_op(vale1is, start, pages, stride, asid,
-				     tlb_level, true, lpa2_is_enabled());
-	else
-		__flush_tlb_range_op(vae1is, start, pages, stride, asid,
-				     tlb_level, true, lpa2_is_enabled());
+	tlbi_op = last_level ? TLBI_VALE1IS : TLBI_VAE1IS;
+	flush_tlb_range_op(tlbi_op, start, pages, stride, asid, tlb_level,
+			   true, lpa2_is_enabled());
 
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
-- 
2.43.0


