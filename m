Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A762CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 04:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znXOl92cKWRXStU3wZw0RHz8Ba4MQSLizFOSrZ3smeQ=; b=hvnj27m5Vzntn4+1Wg2Ag5ywhA
	+fdTUXxTLCqfuN873bCas7+QLRR8UFUXjV73J9UxxxoQqndEE2iTNESdyjOehcdGBek4Sqk1DjgXl
	gwL3R2Dgg9vJTzbje6up+GY0FCUG6SvVWppAx7bjpoPFK9jmErSVq+UDEP+/X7iNmg5JNSDu1RHEX
	queGgPbpJrOr/XYWzSHFucY4+o8+jLWiSQGo77vUWzzMPy3G+H9rZoqpQ1Dhn62MfmE9HFVeP0INk
	QaclCQEnRQiB4SnIX+4K2bnnbvdin1rJLZbtwWz/MLW8GeOuNJVY9YHZ9ugmjtfqBYB0eU1OxKHC+
	FP4ImHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC90c-00000008C7o-29Vv;
	Fri, 24 Oct 2025 04:02:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC90T-00000008C47-2a2P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 04:02:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B9AF1D13;
	Thu, 23 Oct 2025 21:02:17 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E5213F59E;
	Thu, 23 Oct 2025 21:02:23 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ben.horgan@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: [PATCH V2 2/2] arm64/mm: Add remaining TLBI_XXX_MASK macros
Date: Fri, 24 Oct 2025 05:02:07 +0100
Message-Id: <20251024040207.137480-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20251024040207.137480-1-anshuman.khandual@arm.com>
References: <20251024040207.137480-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_210226_515245_E95FE635 
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

Add remaining TLBI_XXX_MASK macros and replace current open encoded fields.
While here replace hard coded page size based shifts but with derived ones
via ilog2() thus adding some required context.

TLBI_TTL_MASK has been split into separate TLBI_TTL_MASK and TLBI_TG_MASK
as appropriate because currently it simultaneously contains both page size
and translation table level information. KVM on arm64 has been updated to
accommodate these changes to TLBI_TTL_MASK.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kvmarm@lists.linux.dev
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++++++--------
 arch/arm64/kvm/nested.c           |  8 +++++---
 2 files changed, 23 insertions(+), 11 deletions(-)

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
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index f04cda40545b..614629179333 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -540,7 +540,7 @@ unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
 	unsigned long max_size;
 	u8 ttl;
 
-	ttl = FIELD_GET(TLBI_TTL_MASK, val);
+	ttl = FIELD_GET(TLBI_TTL_MASK, val) | FIELD_GET(TLBI_TG_MASK, val) << 2;
 
 	if (!ttl || !kvm_has_feat(kvm, ID_AA64MMFR2_EL1, TTL, IMP)) {
 		/* No TTL, check the shadow S2 for a hint */
@@ -963,7 +963,8 @@ static void compute_s1_tlbi_range(struct kvm_vcpu *vcpu, u32 inst, u64 val,
 	case OP_TLBI_VALE1ISNXS:
 	case OP_TLBI_VALE1OSNXS:
 		scope->type = TLBI_VA;
-		scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val));
+		scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val) |
+					  FIELD_GET(TLBI_TG_MASK, val) << 2);
 		if (!scope->size)
 			scope->size = SZ_1G;
 		scope->va = tlbi_va_s1_to_va(val) & ~(scope->size - 1);
@@ -991,7 +992,8 @@ static void compute_s1_tlbi_range(struct kvm_vcpu *vcpu, u32 inst, u64 val,
 	case OP_TLBI_VAALE1ISNXS:
 	case OP_TLBI_VAALE1OSNXS:
 		scope->type = TLBI_VAA;
-		scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val));
+		scope->size = ttl_to_size(FIELD_GET(TLBI_TTL_MASK, val) |
+					  FIELD_GET(TLBI_TG_MASK, val) << 2);
 		if (!scope->size)
 			scope->size = SZ_1G;
 		scope->va = tlbi_va_s1_to_va(val) & ~(scope->size - 1);
-- 
2.30.2


