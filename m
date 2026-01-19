Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58152D29C54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ym722zRutqMIhlTTOhfO7FLVsdF7PkJKEyWvnEgdRGg=; b=l7z4/wdDyNqVOn6SLX7l0DTBVs
	er5ciw9zkX9/a7Ng8saFcFOHi0kpQE90YB+ho0/fDjxZExz9/mzE1pgfDpGv4ouiAHmJ+/pT5Udaq
	yGGHCjkasIGD+UcqjfizRiYBbN/NohNr6VQdMPBgpyevvG04rTmjyxL0cp5heE8s/IUE8scPZ4nbz
	W8djGLDoOFPDgJn2qraZbXIbKNISn5xwvI1Ssl9hzuc5Ri8Bo53T2rMNmkGBPgr9tx7zeojxG4zQP
	QEEkuGz8hcYexXO6Qt4Xno6z8H55FgY6OTBvOc+xqgHuqw6jTUf3B9gI9ecTGsDlJRBWcgvVJzdlC
	h0ffBraw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxc-00000002cm1-0sVO;
	Mon, 19 Jan 2026 17:22:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxP-00000002cc4-3kpG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 17:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ym722zRutqMIhlTTOhfO7FLVsdF7PkJKEyWvnEgdRGg=; b=PVoMiKBwmGp1fpYKRGLTvz0FmD
	I4ZwBExNJEwU5Y6JsNvrdotH+o4IWJyGzp+Fj3DXcBYMdP0W0GjrNOw8ThkR0rdLW6CW77+ISd30b
	uUp3KmYDx/pjP5XB4h+8evwNO13fq3LlSSv485r/ZLgLBSmhr+sy9hqyxiRvroUW3GqXjEGG3KhV8
	TNqZkQPj2eMIjgoV5Wjj02aw2yFbdy6aOS9U6zn03gmgeeDz2LMzD8y0PUffrSmxGdsc9klBBuWCp
	5o/baNCGY/jFsrx25ducFG/7cx+Wok2hSpVp6RIGCvd3Bow1Rf1SHvY+ccq6Y4GE/bLLQtUmovxXL
	+Lpf6pVQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxM-0000000Cfh2-3swG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:22:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EDF21682;
	Mon, 19 Jan 2026 09:22:17 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77E653F632;
	Mon, 19 Jan 2026 09:22:22 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Linu Cherian <Linu.Cherian@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH v2 05/13] arm64: mm: Inline __TLBI_VADDR_RANGE() into __tlbi_range()
Date: Mon, 19 Jan 2026 17:21:52 +0000
Message-ID: <20260119172202.1681510-6-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119172202.1681510-1-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_172225_327169_D1AA4B06 
X-CRM114-Status: GOOD (  12.30  )
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

From: Will Deacon <will@kernel.org>

The __TLBI_VADDR_RANGE() macro is only used in one place and isn't
something that's generally useful outside of the low-level range
invalidation gubbins.

Inline __TLBI_VADDR_RANGE() into the __tlbi_range() function so that the
macro can be removed entirely.

Signed-off-by: Will Deacon <will@kernel.org>
Reviewed-by: Linu Cherian <linu.cherian@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 32 +++++++++++++------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 7453b6c7bd00..5f6a169c08d7 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -194,19 +194,6 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
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
@@ -487,8 +474,19 @@ static __always_inline void ripas2e1is(u64 arg)
 	__tlbi(ripas2e1is, arg);
 }
 
-static __always_inline void __tlbi_range(tlbi_op op, u64 arg)
+static __always_inline void __tlbi_range(tlbi_op op, u64 addr,
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
 	op(arg);
 }
 
@@ -499,8 +497,6 @@ do {									\
 	typeof(pages) __flush_pages = pages;				\
 	int num = 0;							\
 	int scale = 3;							\
-	int shift = lpa2 ? 16 : PAGE_SHIFT;				\
-	unsigned long addr;						\
 									\
 	while (__flush_pages > 0) {					\
 		if (!system_supports_tlb_range() ||			\
@@ -514,9 +510,7 @@ do {									\
 									\
 		num = __TLBI_RANGE_NUM(__flush_pages, scale);		\
 		if (num >= 0) {						\
-			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
-						scale, num, tlb_level);	\
-			__tlbi_range(r##op, addr);			\
+			__tlbi_range(r##op, __flush_start, asid, scale, num, tlb_level, lpa2); \
 			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
 			__flush_pages -= __TLBI_RANGE_PAGES(num, scale);\
 		}							\
-- 
2.43.0


