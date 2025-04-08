Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079A1C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dDgWlNxtleZVCX3MWpmcRMjX6SMpusMABcu8Cw32FM=; b=Gq/vNPSVB/skMMl1F8ectpAUYb
	g6WIoa7KmngvDl30Pe6lcIEHKlu+1Yf5zzXgK+TQrjL5KSPqT+yP5N9KiXPP4DtfJYCVY4NhVBTul
	ZQAs0JpmmCXJxixTYoB2uwrurdjZoXqYQMUdyMWIbdh8MTgH6rk5UX6jZxV3MVB6vDi3nlHjWQ0yh
	4c7y0A7cq99S9paz9o15i4fhp3myxQrdk+RIcaEm4P1pBhkuiTDWT+fIwV6RE4+6T2kNW6W6pCJf2
	0sO6GWAIglsCMBhMdjtGQdbKN+p6aD4enCivey5wNzHvp862sq5yDsHnGL970L7I9e64SUMl1VFnI
	aUcpWd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26Br-00000003f21-1Q52;
	Tue, 08 Apr 2025 10:28:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25dw-00000003WV4-1DPL;
	Tue, 08 Apr 2025 09:53:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE8B616A3;
	Tue,  8 Apr 2025 02:53:20 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F7EA3F6A8;
	Tue,  8 Apr 2025 02:53:15 -0700 (PDT)
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
Subject: [PATCH v2 02/12] x86: pgtable: Always use pte_free_kernel()
Date: Tue,  8 Apr 2025 10:52:12 +0100
Message-ID: <20250408095222.860601-3-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250408095222.860601-1-kevin.brodsky@arm.com>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025320_373080_A7C66AF6 
X-CRM114-Status: GOOD (  12.04  )
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

Page table pages are normally freed using the appropriate helper for
the given page table level. On x86, pud_free_pmd_page() and
pmd_free_pte_page() are an exception to the rule: they call
free_page() directly.

Constructor/destructor calls are about to be introduced for kernel
PTEs. To avoid missing dtor calls in those helpers, free the PTE
pages using pte_free_kernel() instead of free_page().

While at it also use pmd_free() instead of calling pagetable_dtor()
explicitly at the PMD level.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/x86/mm/pgtable.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 7930f234c5f6..1dee9bdbeea5 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -809,14 +809,13 @@ int pud_free_pmd_page(pud_t *pud, unsigned long addr)
 	for (i = 0; i < PTRS_PER_PMD; i++) {
 		if (!pmd_none(pmd_sv[i])) {
 			pte = (pte_t *)pmd_page_vaddr(pmd_sv[i]);
-			free_page((unsigned long)pte);
+			pte_free_kernel(&init_mm, pte);
 		}
 	}
 
 	free_page((unsigned long)pmd_sv);
 
-	pagetable_dtor(virt_to_ptdesc(pmd));
-	free_page((unsigned long)pmd);
+	pmd_free(&init_mm, pmd);
 
 	return 1;
 }
@@ -839,7 +838,7 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 	/* INVLPG to clear all paging-structure caches */
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE-1);
 
-	free_page((unsigned long)pte);
+	pte_free_kernel(&init_mm, pte);
 
 	return 1;
 }
-- 
2.47.0


