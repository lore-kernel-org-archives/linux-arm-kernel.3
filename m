Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84830C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttX//dzrhR9sMSF/SSGtobxX0kA46zEbXIpY5XaZ9N4=; b=XSbkAb4juQnEjCVtjCR59Sjxce
	Q+w/yJjgMtMHupSfAh+bz460g0hFznzSUtzhH5l3eSGu8mw1+yS+JAsOP74+oQvCOzO9/ChEgX11L
	AaO8u+LO3EX/km9qaUh2dM/OenHIC2ebSnKZ5Qp4bZVg/7yM3TczGJ9PXBqspJeIpk0O3j/8wS7Zs
	ObabZ3x26t9qwu2CA3V3SiobignRD4o28OLn62594Gx7mOPVSAVpFLy4T5lO8v/58IuUeBHLB2x3b
	eCOWMKPAJX7B8NgN7qfzJMnBITYBKwy549T4GrZfEbeh21QELebtBcHQt1sKdta6cH17mkPqxA945
	bq62xBSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDH2-00000009twh-1BuK;
	Tue, 21 Jul 2026 16:24:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDH0-00000009tuX-2SaT;
	Tue, 21 Jul 2026 16:24:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5845041AC5;
	Tue, 21 Jul 2026 16:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC241F00A3D;
	Tue, 21 Jul 2026 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651090;
	bh=ttX//dzrhR9sMSF/SSGtobxX0kA46zEbXIpY5XaZ9N4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gJmSLh0p2zdn+TUWP5ffCXLjps1IY4pdY2MSOyC8/W+aqm3nsNU1U4iTihlhrvBfa
	 Q+mS6sw0lO9mOetPMFTsC9dtXtC+igugk3tV3KUzXcEwQ3X4QI6fHv+juQ4w7aGN0T
	 6Px8rlP17Ve+8eSsv4CW4eS0U4mcadHN/jXWfIC0dyhff3ZJLuUNrRa6uIJZHrAFd0
	 nO6yCipEiqmY+g1A97wEKDQ84Iad1bsmvztr7/jT6rGQyglKtI15OsZ1wyr0KZv5tg
	 s6ZFygHv5zMyo254wbSw+EqReu5y/kry5UxoS4XSbiqQL4PE3YknAVR4TX4v4odaNL
	 L75H13AxOl1Jg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:33 +0300
Subject: [PATCH RFC 10/18] x86/mm/pat: move the large page size calculation
 to should_split_large_page
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-10-2c1fc62306b3@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
To: linux-mm@kvack.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <jackmanb@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16-dev
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

The calculation of large page size and mask and the update to
cpa->numpages use generic helpers and can be reused by common code.

The upcoming changes that will make should_split_large_page() available
in common code and __should_split_large_page() will become the basis of x86
specific implementation.

In preparation to moving core parts of change_page_attr() to common
code, move the generic calculations from __should_split_large_page() to
should_split_large_page().

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index ef206ba6e254..56676d4cf510 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -58,6 +58,8 @@ struct cpa_data {
  */
 struct cpa_split_data {
 	unsigned long	address;
+	unsigned long	psize;
+	unsigned long	pmask;
 	pte_t		*kpte;
 	struct ptdesc	*ptdesc;
 	enum pgtable_level level;
@@ -884,10 +886,12 @@ static pgprot_t pgprot_clear_protnone_bits(pgprot_t prot)
 static int __should_split_large_page(struct cpa_data *cpa,
 				     struct cpa_split_data *sd)
 {
-	unsigned long numpages, pmask, psize, lpaddr, pfn, old_pfn;
 	pgprot_t old_prot, new_prot, req_prot, chk_prot;
+	unsigned long numpages, lpaddr, pfn, old_pfn;
 	enum pgtable_level level = sd->level;
 	unsigned long address = sd->address;
+	unsigned long psize = sd->psize;
+	unsigned long pmask = sd->pmask;
 	pte_t *kpte = sd->kpte;
 	bool nx = sd->nx;
 	bool rw = sd->rw;
@@ -908,18 +912,6 @@ static int __should_split_large_page(struct cpa_data *cpa,
 		return -EINVAL;
 	}
 
-	psize = pgtable_level_size(level);
-	pmask = pgtable_level_mask(level);
-
-	/*
-	 * Calculate the number of pages, which fit into this large
-	 * page starting at address:
-	 */
-	lpaddr = (address + psize) & pmask;
-	numpages = (lpaddr - address) >> PAGE_SHIFT;
-	if (numpages < cpa->numpages)
-		cpa->numpages = numpages;
-
 	/*
 	 * We are safe now. Check whether the new pgprot is the same:
 	 * Convert protection attributes to 4k-format, as cpa->mask* are set
@@ -1026,9 +1018,25 @@ static int __should_split_large_page(struct cpa_data *cpa,
 static int should_split_large_page(struct cpa_data *cpa,
 				   struct cpa_split_data *sd)
 {
+	enum pgtable_level level = sd->level;
+	unsigned long address = sd->address;
+	unsigned long numpages, lpaddr;
+
 	if (cpa->force_split)
 		return 1;
 
+	sd->psize = pgtable_level_size(level);
+	sd->pmask = pgtable_level_mask(level);
+
+	/*
+	 * Calculate the number of pages, which fit into this large
+	 * page starting at address:
+	 */
+	lpaddr = (address + sd->psize) & sd->pmask;
+	numpages = (lpaddr - address) >> PAGE_SHIFT;
+	if (numpages < cpa->numpages)
+		cpa->numpages = numpages;
+
 	return __should_split_large_page(cpa, sd);
 }
 

-- 
2.53.0


