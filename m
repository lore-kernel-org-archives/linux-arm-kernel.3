Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1134C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhR2Iq+beAhq3GZKKAxztcVBqkxIucxufOP5/zFYWuY=; b=HsBQdMcZKewjjup7cX+1F5TN6Y
	RuieGPjHujA7g3FNw+dcx43L3wh5f0ukIlTwLPFS0yRakS5/Y+m0Qnbh3XlYwa9XX1PtA19NnF6gF
	bDJdXIgFIGMk38NkotHYNIdqr31jYHdQppDJAwUkg7eDglZwoxF5K3VTDTZBMXPbDdPUDW9MM1E8t
	VoHylzHknvC1bEkl9BSO4RpWabazz4VRRI6sqky2K1jUy/rEwpCvwO5mYYot/7Ot1X6veIZ6FBEEb
	xLVshJgd4KMncUgO5YdMO9zFqXEkA58HxfCqj0C1NkEYfdoy2Xyq2NxLQRuaEiJfkTRpmBvjO2CqX
	M8wGz+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27Lp-00000003snZ-0eg5;
	Tue, 08 Apr 2025 11:42:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25eF-00000003Wef-0Ieb;
	Tue, 08 Apr 2025 09:53:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 861E82309;
	Tue,  8 Apr 2025 02:53:39 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4566F3F6A8;
	Tue,  8 Apr 2025 02:53:34 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 06/12] sparc64: mm: Call ctor/dtor for kernel PTEs
Date: Tue,  8 Apr 2025 10:52:16 +0100
Message-ID: <20250408095222.860601-7-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250408095222.860601-1-kevin.brodsky@arm.com>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025339_144426_5AE8919F 
X-CRM114-Status: GOOD (  12.42  )
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

The generic implementation of pte_{alloc_one,free}_kernel now calls
the [cd]tor, without initialising the ptlock needlessly as
pagetable_pte_ctor() skips it for init_mm.

Align sparc64 with the generic implementation by ensuring
pagetable_pte_[cd]tor() are called for kernel PTEs. As a result
the kernel and user alloc/free functions have the same
implementation, and since pgtable_t is defined as pte_t *, we can
have both call a common helper.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/sparc/mm/init_64.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 5c8eabda1d17..25ae4c897aae 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2878,18 +2878,7 @@ void __flush_tlb_all(void)
 			     : : "r" (pstate));
 }
 
-pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
-{
-	struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	pte_t *pte = NULL;
-
-	if (page)
-		pte = (pte_t *) page_address(page);
-
-	return pte;
-}
-
-pgtable_t pte_alloc_one(struct mm_struct *mm)
+static pte_t *__pte_alloc_one(struct mm_struct *mm)
 {
 	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);
 
@@ -2902,9 +2891,14 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 	return ptdesc_address(ptdesc);
 }
 
-void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
+pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 {
-	free_page((unsigned long)pte);
+	return __pte_alloc_one(mm);
+}
+
+pgtable_t pte_alloc_one(struct mm_struct *mm)
+{
+	return __pte_alloc_one(mm);
 }
 
 static void __pte_free(pgtable_t pte)
@@ -2915,6 +2909,11 @@ static void __pte_free(pgtable_t pte)
 	pagetable_free(ptdesc);
 }
 
+void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
+{
+	__pte_free(pte);
+}
+
 void pte_free(struct mm_struct *mm, pgtable_t pte)
 {
 	__pte_free(pte);
-- 
2.47.0


