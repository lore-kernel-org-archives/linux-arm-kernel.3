Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F95EC54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvMqV51cBHSguh2r74rgEuq+XYeSa3cXfMffQ4C1g60=; b=sAphckTOCn0rwHsdSCK9rXeL2y
	NgrDMDkGO18EBJvE+j/UG4w+BGKM45zTBFNy3gRJWUowoDmDBWvdVYLr4B9v7mxoWSOvFbzRAIZCS
	vdP2LqpVvTaHI6M6pks7aEvjgy1O/7cAtrdNvuYji+OOoG1hivEeHhl//WaeEnSUegnFHtvwLvuk7
	4xxZAcOEveooIAulsv3d6pIlD4xXGxxzCREK2588N2LTqVzLGeuRLClTil1kM7uS8KPS3KaboDCey
	J/CJHXUlGhSbF4YHiWgZAhI8bKrkAW7XUifDS2jtU9mdF9QOdZOzUmmJDqQtKbPH7LayWLywn9ifK
	5wmvFEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3MC-00000007tW8-3sXN;
	Wed, 29 Jul 2026 12:25:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3Lv-00000007tJ3-0KCW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 12:25:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DC6C168F;
	Wed, 29 Jul 2026 05:25:34 -0700 (PDT)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 95A1C3F66F;
	Wed, 29 Jul 2026 05:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785327938; bh=hgq5q6IdHAI1vFAWZ1TN3HzUB0raxqZRsSM7ujOjO3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kJ1yqX7VastS3h2ZZnSmsdTqyk49SgzRf0JFdXsKNIxEvAogdwxu0n/YzJamBUrBb
	 Rri0fhBJMSfQ5Eo2do2/O+3BPAfykcnXOxlqzkjfTnudXdvdVni0Z09tMEBzJk4Ymv
	 G7qmJCt3m9EzcAzF/ZtVRiEYU2zPYZ/jEUme79OI=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/17] arm64/mm: Route all pgtable writes via ptval_set()
Date: Wed, 29 Jul 2026 17:54:42 +0530
Message-ID: <20260729122452.3797443-8-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729122452.3797443-1-anshuman.khandual@arm.com>
References: <20260729122452.3797443-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_052539_195395_6059CF33 
X-CRM114-Status: GOOD (  12.18  )
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

Currently ptval_set() is defined as WRITE_ONCE() but this will change for
D128 pgtable builds, for which WRITE_ONCE() is not sufficient for single
copy atomicity.

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
 arch/arm64/include/asm/pgtable.h | 11 ++++++-----
 arch/arm64/mm/mmu.c              |  4 ++--
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 030ec3582a0d..1106977e0ef0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -85,6 +85,7 @@ static inline void arch_leave_lazy_mmu_mode(void)
 }
 
 #define ptval_get(x)		READ_ONCE(x)
+#define ptval_set(x, val)	WRITE_ONCE(x, val)
 
 #define pmdp_get pmdp_get
 static inline pmd_t pmdp_get(pmd_t *pmdp)
@@ -385,7 +386,7 @@ static inline pte_t pte_clear_uffd_wp(pte_t pte)
 
 static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
 {
-	WRITE_ONCE(*ptep, pte);
+	ptval_set(*ptep, pte);
 }
 
 static inline void __set_pte_complete(pte_t pte)
@@ -856,7 +857,7 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 	}
 #endif /* __PAGETABLE_PMD_FOLDED */
 
-	WRITE_ONCE(*pmdp, pmd);
+	ptval_set(*pmdp, pmd);
 
 	if (pmd_valid(pmd))
 		queue_pte_barriers();
@@ -921,7 +922,7 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
 		return;
 	}
 
-	WRITE_ONCE(*pudp, pud);
+	ptval_set(*pudp, pud);
 
 	if (pud_valid(pud))
 		queue_pte_barriers();
@@ -1003,7 +1004,7 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 		return;
 	}
 
-	WRITE_ONCE(*p4dp, p4d);
+	ptval_set(*p4dp, p4d);
 	queue_pte_barriers();
 }
 
@@ -1131,7 +1132,7 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 		return;
 	}
 
-	WRITE_ONCE(*pgdp, pgd);
+	ptval_set(*pgdp, pgd);
 	queue_pte_barriers();
 }
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index d5b6eb544216..1127917c554b 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -76,7 +76,7 @@ void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
 	 * writable in the kernel mapping.
 	 */
 	if (rodata_is_rw) {
-		WRITE_ONCE(*pgdp, pgd);
+		ptval_set(*pgdp, pgd);
 		dsb(ishst);
 		isb();
 		return;
@@ -84,7 +84,7 @@ void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
 
 	spin_lock(&swapper_pgdir_lock);
 	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
-	WRITE_ONCE(*fixmap_pgdp, pgd);
+	ptval_set(*fixmap_pgdp, pgd);
 	/*
 	 * We need dsb(ishst) here to ensure the page-table-walker sees
 	 * our new entry before set_p?d() returns. The fixmap's
-- 
2.43.0


