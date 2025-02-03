Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE72C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 10:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7RWiBc91Kcnb6ZXaxAa5m0a+mqmeQb+Ok8r2YCJNYY=; b=a2oHOmfWdlw4ZBUIz+oSTPgLXG
	Qyx8puMDHkaAjn1m6sALx3kbYUDNaRPb5H5qYGXU9VZBszzDDOzxLs56B8gLijflQiYPxdaEa8Cgp
	SCWPQ6bliBg/vPkQRUGWK7I5H6LNWU3eCmjGSMLldVy3ahFb4aXUsIWi1Hc0AHQCl+iCa9X0ul5dt
	jmDfqbRU7DAd+mgA3f6anxUtOD1OQWERwQB5/SXd+rSvMFTsE/D7y3P0zWeNBp4JzjRE37y/LW519
	vF2LEGUJJvUFO2pgV/kwaK5nWb4jYv+pOIM+hJnghUQ6LGinvF26K1IsEKddNJkbHjOD+LhF8SfEH
	et9AYZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetmh-0000000F8JI-1FGA;
	Mon, 03 Feb 2025 10:34:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetZ2-0000000F67b-1GZw
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s7RWiBc91Kcnb6ZXaxAa5m0a+mqmeQb+Ok8r2YCJNYY=; b=bxH/zlb5TL1cooMzrMmxclLE2C
	73Zb00vkUsHlVXw3zN/TLcxtCX42xeHJYJnpYMjZaHopVbXtBL/95uLlIkPcGioNRQL8WmJZiQfNu
	cKQ1rwpoVbzJ9QMCTD4MuvFyoBM5QGtcYnACKm1UTJ6vP6BJZbCRU7gUPrSkYlIvrychBo2KTD6X3
	qZfgKMRPbIizOM4/66MwszKkCtMHo+dTiPo2RpXuSxKISOrMvrXza8KreEWo0vAx3teSm7gMlqqNq
	sOFhoJQTihl0BF6GXX5FfVkX8+ECKEINoWdi4vRWaZfm3QBK9JYrlhyMxzCSIwqm5KjdItNlWHELi
	AOVNXq9w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetYz-0000000G3Wx-0jzu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:20:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB9A711FB;
	Mon,  3 Feb 2025 02:20:44 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9E8C3F63F;
	Mon,  3 Feb 2025 02:20:16 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH v3 10/15] mm: Allow __pagetable_ctor() to fail
Date: Mon,  3 Feb 2025 10:18:34 +0000
Message-ID: <20250203101839.1223008-11-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203101839.1223008-1-kevin.brodsky@arm.com>
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102021_629222_ACF1922A 
X-CRM114-Status: GOOD (  11.46  )
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

In preparation for adding construction hooks (that may fail) to
__pagetable_ctor(), make __pagetable_ctor() return a bool,
propagate it to pagetable_*_ctor() and handle failure in
the generic {pud,p4d,pgd}_alloc.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/asm-generic/pgalloc.h | 15 ++++++++++++---
 include/linux/mm.h            | 21 ++++++++++-----------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 892ece4558a2..9962f7454d0c 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -173,7 +173,10 @@ static inline pud_t *__pud_alloc_one_noprof(struct mm_struct *mm, unsigned long
 	if (!ptdesc)
 		return NULL;
 
-	pagetable_pud_ctor(ptdesc);
+	if (!pagetable_pud_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
+		return NULL;
+	}
 	return ptdesc_address(ptdesc);
 }
 #define __pud_alloc_one(...)	alloc_hooks(__pud_alloc_one_noprof(__VA_ARGS__))
@@ -227,7 +230,10 @@ static inline p4d_t *__p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long
 	if (!ptdesc)
 		return NULL;
 
-	pagetable_p4d_ctor(ptdesc);
+	if (!pagetable_p4d_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
+		return NULL;
+	}
 	return ptdesc_address(ptdesc);
 }
 #define __p4d_alloc_one(...)	alloc_hooks(__p4d_alloc_one_noprof(__VA_ARGS__))
@@ -271,7 +277,10 @@ static inline pgd_t *__pgd_alloc_noprof(struct mm_struct *mm, unsigned int order
 	if (!ptdesc)
 		return NULL;
 
-	pagetable_pgd_ctor(ptdesc);
+	if (!pagetable_pgd_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
+		return NULL;
+	}
 	return ptdesc_address(ptdesc);
 }
 #define __pgd_alloc(...)	alloc_hooks(__pgd_alloc_noprof(__VA_ARGS__))
diff --git a/include/linux/mm.h b/include/linux/mm.h
index c3998b78f6a5..721e779647f3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2992,12 +2992,13 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void ptlock_free(struct ptdesc *ptdesc) {}
 #endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
 
-static inline void __pagetable_ctor(struct ptdesc *ptdesc)
+static inline bool __pagetable_ctor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
 
 	__folio_set_pgtable(folio);
 	lruvec_stat_add_folio(folio, NR_PAGETABLE);
+	return true;
 }
 
 static inline void pagetable_dtor(struct ptdesc *ptdesc)
@@ -3019,8 +3020,7 @@ static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
 	if (!ptlock_init(ptdesc))
 		return false;
-	__pagetable_ctor(ptdesc);
-	return true;
+	return __pagetable_ctor(ptdesc);
 }
 
 pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp);
@@ -3126,8 +3126,7 @@ static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
 	if (!pmd_ptlock_init(ptdesc))
 		return false;
 	ptdesc_pmd_pts_init(ptdesc);
-	__pagetable_ctor(ptdesc);
-	return true;
+	return __pagetable_ctor(ptdesc);
 }
 
 /*
@@ -3149,19 +3148,19 @@ static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
 	return ptl;
 }
 
-static inline void pagetable_pud_ctor(struct ptdesc *ptdesc)
+static inline bool pagetable_pud_ctor(struct ptdesc *ptdesc)
 {
-	__pagetable_ctor(ptdesc);
+	return __pagetable_ctor(ptdesc);
 }
 
-static inline void pagetable_p4d_ctor(struct ptdesc *ptdesc)
+static inline bool pagetable_p4d_ctor(struct ptdesc *ptdesc)
 {
-	__pagetable_ctor(ptdesc);
+	return __pagetable_ctor(ptdesc);
 }
 
-static inline void pagetable_pgd_ctor(struct ptdesc *ptdesc)
+static inline bool pagetable_pgd_ctor(struct ptdesc *ptdesc)
 {
-	__pagetable_ctor(ptdesc);
+	return __pagetable_ctor(ptdesc);
 }
 
 extern void __init pagecache_init(void);
-- 
2.47.0


