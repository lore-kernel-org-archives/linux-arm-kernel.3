Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070FEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+q/1JwU2m6fh2CWGbngu0nd469Mg+2mngxCCKUUaMU=; b=km5aczqT9grYd3/4s0BSgb05o7
	hfp+z+WgpeG8ApJgX9xjIv1uqu3ZzN+6X8y3TXE/B13WS70lpwVyC82/f9IhqoHbwCM/UDpP+uyHK
	QUwGKvqaZaAsNVleWWndbz//d6eOn1J2JtlApiwaogefr5Pudvx118Wxr4zWsnrt8iznTypxWbZN8
	J9Toupo3FR9z7N6/XF/eK11BUrnRINSjOJlGFQE0oxY6BU2vidDGtP/KaifiHnt93nu0dA4M85nQU
	CatNmuFrivT9X8dksUPkucm6DOd6h3qp+rGLrblGmEmBDHs+dvliKzKYPT8dztzlqy9vZJqVfrooU
	Cc55eY7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUGy-00000005EGw-3g7Q;
	Tue, 04 Mar 2025 15:33:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTpU-000000057WI-0qjC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:05:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9595EFEC;
	Tue,  4 Mar 2025 07:05:21 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F7FE3F66E;
	Tue,  4 Mar 2025 07:05:05 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/11] arm64/mm: Hoist barriers out of set_ptes_anysz() loop
Date: Tue,  4 Mar 2025 15:04:36 +0000
Message-ID: <20250304150444.3788920-7-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304150444.3788920-1-ryan.roberts@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_070508_307443_D3C5B40C 
X-CRM114-Status: GOOD (  13.22  )
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

set_ptes_anysz() previously called __set_pte() for each PTE in the
range, which would conditionally issue a DSB and ISB to make the new PTE
value immediately visible to the table walker if the new PTE was valid
and for kernel space.

We can do better than this; let's hoist those barriers out of the loop
so that they are only issued once at the end of the loop. We then reduce
the cost by the number of PTEs in the range.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e255a36380dc..1898c3069c43 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -317,13 +317,11 @@ static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
 	WRITE_ONCE(*ptep, pte);
 }
 
-static inline void __set_pte(pte_t *ptep, pte_t pte)
+static inline void __set_pte_complete(pte_t pte)
 {
-	__set_pte_nosync(ptep, pte);
-
 	/*
 	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
-	 * or update_mmu_cache() have the necessary barriers.
+	 * has the necessary barriers.
 	 */
 	if (pte_valid_not_user(pte)) {
 		dsb(ishst);
@@ -331,6 +329,12 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
 	}
 }
 
+static inline void __set_pte(pte_t *ptep, pte_t pte)
+{
+	__set_pte_nosync(ptep, pte);
+	__set_pte_complete(pte);
+}
+
 static inline pte_t __ptep_get(pte_t *ptep)
 {
 	return READ_ONCE(*ptep);
@@ -647,12 +651,14 @@ static inline void set_ptes_anysz(struct mm_struct *mm, pte_t *ptep, pte_t pte,
 
 	for (;;) {
 		__check_safe_pte_update(mm, ptep, pte);
-		__set_pte(ptep, pte);
+		__set_pte_nosync(ptep, pte);
 		if (--nr == 0)
 			break;
 		ptep++;
 		pte = pte_advance_pfn(pte, stride);
 	}
+
+	__set_pte_complete(pte);
 }
 
 static inline void __set_ptes(struct mm_struct *mm,
-- 
2.43.0


