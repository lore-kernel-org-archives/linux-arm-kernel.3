Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B6BEFB7FC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 05:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/ybvBATGWJE9Rw+0QGta2Q9ZHlI9+0HCCQxMbYIjyM=; b=oNvkUyRVZ1ARI4nv/IGSsZMvP6
	ca+6nrzpAs+ARwEXqEJI+EYZ4w9qmut8i8i2sWqz6XCZU/L4yBbEyPw+CKUbJ75edEuE+8soP1eDa
	BrBmmnBQjI+Lx8pNkp6hpAl4pNErfxM0Av2utUY+Nw9LCdkEcEQcxAeWunS1fLDU837rHclogphG2
	fVh6WQBR/xDhDOtnZtd2B8Q8fYvbZtFyKeqkb8fOx2Mu2yc2RDLLr70lj/Wl5Lf7yQOSTcQIwZX/e
	i+Hukf0Z84LrxV+nB+PJRF5NlDYhojcgK6cqFda9OuBwHVuK5CRDSIDjAfwwMI6jXJWLNeld2UnBO
	kPWnnHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukjS-00000001Som-04vW;
	Tue, 24 Feb 2026 05:13:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vukjP-00000001Smb-28w8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 05:13:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7F0B497;
	Mon, 23 Feb 2026 21:13:04 -0800 (PST)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.18.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D52463F7BD;
	Mon, 23 Feb 2026 21:13:06 -0800 (PST)
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
Subject: [RFC V1 09/16] arm64/mm: Route all pgtable reads via ptdesc_get()
Date: Tue, 24 Feb 2026 10:41:46 +0530
Message-ID: <20260224051153.3150613-10-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224051153.3150613-1-anshuman.khandual@arm.com>
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_211311_606872_64708E8B 
X-CRM114-Status: GOOD (  10.37  )
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

Define arm64 platform specific implementations for new pXdp_get() helpers.
These resolve into READ_ONCE(), thus ensuring required single copy atomic
semantics for the page table entry reads.

In future this infrastructure can be used for D128 to maintain single copy
atomicity semantics with inline asm blocks.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 257af1c3015d..804ef49aea88 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -84,6 +84,32 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	arch_flush_lazy_mmu_mode();
 }
 
+#define ptdesc_get(x)		READ_ONCE(x)
+
+#define pmdp_get pmdp_get
+static inline pmd_t pmdp_get(pmd_t *pmdp)
+{
+	return ptdesc_get(*pmdp);
+}
+
+#define pudp_get pudp_get
+static inline pud_t pudp_get(pud_t *pudp)
+{
+	return ptdesc_get(*pudp);
+}
+
+#define p4dp_get p4dp_get
+static inline p4d_t p4dp_get(p4d_t *p4dp)
+{
+	return ptdesc_get(*p4dp);
+}
+
+#define pgdp_get pgdp_get
+static inline pgd_t pgdp_get(pgd_t *pgdp)
+{
+	return ptdesc_get(*pgdp);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 
@@ -384,7 +410,7 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
 
 static inline pte_t __ptep_get(pte_t *ptep)
 {
-	return READ_ONCE(*ptep);
+	return ptdesc_get(*ptep);
 }
 
 extern void __sync_icache_dcache(pte_t pteval);
-- 
2.43.0


