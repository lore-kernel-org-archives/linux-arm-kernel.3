Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CCFCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 05:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AK8YkHR29QLQKiTAxqmiVOXP+FN0CZfu4Jx2DSPbmQs=; b=THyhMP9oWa3cvRS7DgaioMhpr0
	DDPycUvV3mRC2HHonnO0GRaxaG4JSMiGKtUPHZEOgEngqxtyii9YCF+Xbs24Y+IZIOXigXyNESo3K
	gjDnvZaLWJGST5F7nHMoDUvfUBOU1zh4cqNmYxv0M3T0+MV6VzbXw82HEjifK7adFc5l1kspOksTS
	riYbcVe1TCChrCstPI4jESta4vnDBoa+I0le3Cw0HpNLBgOepccGhYc4lj+9QJAoEsF1Z+NABcX/Z
	5LxJ4JKVRyDYLRXATBKhIFTPacFPrMXX72ztAXYYaXdxPLD4jZX2VebWtW17pgIwiqrios5fvErkJ
	h/tN1IxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB4nZ-0000000Fq9b-4A7I;
	Tue, 21 Oct 2025 05:20:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB4nU-0000000Fq7y-2HQg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 05:20:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 045AD19F0;
	Mon, 20 Oct 2025 22:20:28 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D754D3F59E;
	Mon, 20 Oct 2025 22:20:34 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64/mm: Add remaining TLBI_XXX_MASK macros
Date: Tue, 21 Oct 2025 06:20:22 +0100
Message-Id: <20251021052022.2898275-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20251021052022.2898275-1-anshuman.khandual@arm.com>
References: <20251021052022.2898275-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_222036_625345_1A325F8A 
X-CRM114-Status: GOOD (  11.74  )
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

Add remaining TLBI_XXX_MASK macros and replace current open encoded fields.
While here replace hard coded page size based shifts but with derived ones
via ilog2() thus adding some required context.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 131096094f5b..cf75fc2a06c3 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -57,9 +57,10 @@
 /* This macro creates a properly formatted VA operand for the TLBI */
 #define __TLBI_VADDR(addr, asid)				\
 	({							\
-		unsigned long __ta = (addr) >> 12;		\
-		__ta &= GENMASK_ULL(43, 0);			\
-		__ta |= (unsigned long)(asid) << 48;		\
+		unsigned long __ta = (addr) >> ilog2(SZ_4K);	\
+		__ta &= TLBI_BADDR_MASK;			\
+		__ta &= ~TLBI_ASID_MASK;			\
+		__ta |= FIELD_PREP(TLBI_ASID_MASK, asid);	\
 		__ta;						\
 	})
 
@@ -100,8 +101,17 @@ static inline unsigned long get_trans_granule(void)
  *
  * For Stage-2 invalidation, use the level values provided to that effect
  * in asm/stage2_pgtable.h.
+ *
+ * +----------+------+-------+--------------------------------------+
+ * |   ASID   |  TG  |  TTL  |                 BADDR                |
+ * +-----------------+-------+--------------------------------------+
+ * |63      48|47  46|45   44|43                                   0|
+ * +----------+------+-------+--------------------------------------+
  */
-#define TLBI_TTL_MASK		GENMASK_ULL(47, 44)
+#define TLBI_ASID_MASK		GENMASK_ULL(63, 48)
+#define TLBI_TG_MASK		GENMASK_ULL(47, 46)
+#define TLBI_TTL_MASK		GENMASK_ULL(45, 44)
+#define TLBI_BADDR_MASK		GENMASK_ULL(43, 0)
 
 #define TLBI_TTL_UNKNOWN	INT_MAX
 
@@ -110,10 +120,10 @@ static inline unsigned long get_trans_granule(void)
 									\
 	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) &&	\
 	    level >= 0 && level <= 3) {					\
-		u64 ttl = level;					\
-		ttl |= get_trans_granule() << 2;			\
+		arg &= ~TLBI_TG_MASK;					\
+		arg |= FIELD_PREP(TLBI_TG_MASK, get_trans_granule());	\
 		arg &= ~TLBI_TTL_MASK;					\
-		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);			\
+		arg |= FIELD_PREP(TLBI_TTL_MASK, level);		\
 	}								\
 									\
 	__tlbi(op, arg);						\
@@ -383,7 +393,7 @@ do {									\
 	typeof(pages) __flush_pages = pages;				\
 	int num = 0;							\
 	int scale = 3;							\
-	int shift = lpa2 ? 16 : PAGE_SHIFT;				\
+	int shift = lpa2 ? ilog2(SZ_64K) : PAGE_SHIFT;			\
 	unsigned long addr;						\
 									\
 	while (__flush_pages > 0) {					\
-- 
2.30.2


