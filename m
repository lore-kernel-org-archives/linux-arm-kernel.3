Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C337C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3plug0lpgCKrfv29ZibOjCkE+S+2rGS3Cp9/6Aa2Hw=; b=SCKByPnMTWDRN/3RxyEk1xyeip
	xAXyahxknK/HTE/gvAJUS/zD+bzjT9ihm0xO0NFDGCxyUwbTxjQxwaBPtdL7rrN8idGTq18UXM7E3
	rLlGejp+s1gIuuuQKvqu5C7JREDdvaXPNEo1jxTWx4MfMHxkQrzrgpW9r0N0UoNIwfER3waN39XHy
	JymY/EbPY5Lwm3uNIzXSWb+PufAST6qWd8YTp8cdvjK1VMVivI3RDHEMNkwKifA8vLOjrXZ1y8Jk6
	WDhV9eSekoyddJVjUBUkrnhGVdQxHYWSgv/ulSuMhoJ2sUkjsZ79YDi55eKz1pAhJLG8B/BMtJj3E
	8vLPX6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDGh-00000009tXR-1nF1;
	Tue, 21 Jul 2026 16:24:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDGg-00000009tWN-0VIG;
	Tue, 21 Jul 2026 16:24:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9E4A43D98;
	Tue, 21 Jul 2026 16:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF361F00A3A;
	Tue, 21 Jul 2026 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651069;
	bh=N3plug0lpgCKrfv29ZibOjCkE+S+2rGS3Cp9/6Aa2Hw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JhVsU+dw1uwxmH+EE0axkr86r9H4Da8cc7CfnWCI4wWPzlF5gUGtel5DmYZ9NErCS
	 XCKTR6iq7tkNHolyed9vXfwK3qbIarzEac15Db3nrnBnAG4uRipAWCZkqSJzfxRXF9
	 RcLT4nTwwlotjyOqY+NRUMsWXiwXX8py7JLCE9CYhay2srofX1xLhpmO7N8VDLJDIB
	 Vg2DnuMbWSwC+kAoJpfiIiq1LniqN/W9Wdr5VH0LjFr3rE24wGTjUnarOu7LxSybaX
	 m2pvdkDDd1Qr1gwirFPPNEW6TO3uzcNKIXQjoIqkG2nqlKt19gnHV3wZcVJCxLkt0M
	 GaSPW60FCIAEg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:30 +0300
Subject: [PATCH RFC 07/18] x86/mm/pat: introduce cpa_handle_large_page()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-7-2c1fc62306b3@kernel.org>
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

Currently should_split_large_page() and split_large_page() duplicate
some of the operations, like PTE lookup inside the lock including
detection of NX and RW bits and large page size calculation.

This duplication can be avoided if the split parameters are passed
between these two functions in a structure and the page table allocation
and locking order is slightly reorganized.

As the first step in this refactoring, introduce cpa_handle_large_page()
helper that wraps should_split_large_page() and split_large_page().

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/set_memory.c | 54 ++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 2a087dcedf84..a9d270e986ff 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1191,6 +1191,35 @@ static int split_large_page(struct cpa_data *cpa, pte_t *kpte,
 	return 0;
 }
 
+static int cpa_handle_large_page(struct cpa_data *cpa, pte_t *kpte,
+				  unsigned long address)
+{
+	int do_split, err;
+
+	/*
+	 * Check, whether we can keep the large page intact
+	 * and just change the pte:
+	 */
+	do_split = should_split_large_page(kpte, address, cpa);
+	/*
+	 * When the range fits into the existing large page, no split is
+	 * required.
+	 * should_split_large_page() updated the large page attributes and
+	 * cpa->numpages and cpa->pfn.
+	 */
+	if (do_split <= 0)
+		return do_split;
+
+	/*
+	 * We have to split the large page:
+	 */
+	err = split_large_page(cpa, kpte, address);
+	if (err)
+		return err;
+
+	return do_split;
+}
+
 static int collapse_pmd_page(pmd_t *pmd, unsigned long addr,
 			     struct list_head *pgtables)
 {
@@ -1790,7 +1819,7 @@ static int __cpa_process_fault(struct cpa_data *cpa, unsigned long vaddr,
 static int __change_page_attr(struct cpa_data *cpa, int primary)
 {
 	unsigned long address;
-	int do_split, err;
+	int split_res;
 	unsigned int level;
 	pte_t *kpte, old_pte;
 	bool nx, rw;
@@ -1842,27 +1871,12 @@ static int __change_page_attr(struct cpa_data *cpa, int primary)
 		return 0;
 	}
 
-	/*
-	 * Check, whether we can keep the large page intact
-	 * and just change the pte:
-	 */
-	do_split = should_split_large_page(kpte, address, cpa);
-	/*
-	 * When the range fits into the existing large page,
-	 * return. cp->numpages and cpa->tlbflush have been updated in
-	 * try_large_page:
-	 */
-	if (do_split <= 0)
-		return do_split;
-
-	/*
-	 * We have to split the large page:
-	 */
-	err = split_large_page(cpa, kpte, address);
-	if (!err)
+	/* Update large page or split it */
+	split_res = cpa_handle_large_page(cpa, kpte, address);
+	if (split_res > 0)
 		goto repeat;
 
-	return err;
+	return split_res;
 }
 
 static int __change_page_attr_set_clr(struct cpa_data *cpa, int primary);

-- 
2.53.0


