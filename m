Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AFBC44536
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js+8Q33VygYQF2f+rI8d1hZYY9K88zAKgM98T6HPJCQ=; b=ATuGmyCisT7tdmNfv6oKqCdwwP
	FCCcBJmvKJBnNRRm0vUVtzr4Rwx/kcnOaAk/CdAM8anx7puCoRH+IaR82bIer3TPOCMDV9A1MHAV/
	1LDxurFqIInifoSpKqSljYsJ9HgW+uWCjTZn0y9rqP/s1eG/WeyYxCsiBrxdDMlCmahw+9PP4XNTd
	6hg7kGTzrHRxiPtmh6QaEl9OuCsX9E4N/yvCdB2qdpKZtCZcT4EBfZUQrsclYE8tP6D4HFqeTqnV9
	aYb1QpJyz/GawLBLO3vKS2U0A+K3fqTuH4xKjUP+5+SzGKrgLcUdJ11ICIRxAje26cQP6rWDC2BMA
	5WZEAk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDHN-00000009uSK-1PLT;
	Tue, 21 Jul 2026 16:25:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDHM-00000009uPF-0ELp;
	Tue, 21 Jul 2026 16:25:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6228060A59;
	Tue, 21 Jul 2026 16:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87D31F00A3A;
	Tue, 21 Jul 2026 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651111;
	bh=Js+8Q33VygYQF2f+rI8d1hZYY9K88zAKgM98T6HPJCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=knGmISKmG/BpTGf3mdF+taH3r3WgwshVgHqiOn1OH7w8ZYPlLuFE1bw2SEYXNLgFT
	 ZyhqpGWWKo19TQ3MPPpXN+GZPwI0a6+0Nci6x9wHqb6uUW6JiWzba+ApDnZJf8ebDl
	 Jl6wIGrMr3jcCsZgsR04vjHPe49jvu/tZiS3IgvaIi/vR5zFqNBHxbiHhI+58vmGN/
	 J7a7AySwjBFN3RDHpaRdeuwiD6tZomFKQmhbp5v/q4xpv6bwFW1vKs98kH77A4iB2q
	 v+XGDbzsk5M2bG4ybuFIGo6+igguIhVbekdTaiDHY+xnY7pWGwk9KZ9DHSXNrCfNom
	 WPO73fe4BpyCg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:36 +0300
Subject: [PATCH RFC 13/18] mm/set_memory: read page table entries with
 pXdp_get()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-13-2c1fc62306b3@kernel.org>
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

As a preparation for enabling generic set_memory support in riscv,
replace direct dereferences of the page table pointers with pXdp_get()
accessors.

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/set_memory.c | 56 ++++++++++++++++++++++++++++++--------------------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/mm/set_memory.c b/mm/set_memory.c
index d2846804e4e6..1a7e63512981 100644
--- a/mm/set_memory.c
+++ b/mm/set_memory.c
@@ -51,58 +51,62 @@ unsigned long cpa_addr(struct cpa_data *cpa, unsigned long idx)
  * the level of the entry, and the effective NX and RW bits of all
  * page table levels.
  */
-pte_t *lookup_address_in_pgd_attr(pgd_t *pgd, unsigned long address,
+pte_t *lookup_address_in_pgd_attr(pgd_t *pgdp, unsigned long address,
 				  unsigned int *level, bool *nx, bool *rw)
 {
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
+	pgd_t pgd = pgdp_get(pgdp);
+	p4d_t *p4dp, p4d;
+	pud_t *pudp, pud;
+	pmd_t *pmdp, pmd;
 
 	*level = PGTABLE_LEVEL_PGD;
 	*nx = false;
 	*rw = true;
 
-	if (pgd_none(*pgd))
+	if (pgd_none(pgd))
 		return NULL;
 
 	*level = PGTABLE_LEVEL_P4D;
-	*nx |= !pgd_exec(*pgd);
-	*rw &= !!(pgd_write(*pgd));
+	*nx |= !pgd_exec(pgd);
+	*rw &= !!(pgd_write(pgd));
 
-	p4d = p4d_offset(pgd, address);
-	if (p4d_none(*p4d))
+	p4dp = p4d_offset(pgdp, address);
+	p4d = p4dp_get(p4dp);
+	if (p4d_none(p4d))
 		return NULL;
 
-	if (p4d_leaf(*p4d) || !p4d_present(*p4d))
-		return (pte_t *)p4d;
+	if (p4d_leaf(p4d) || !p4d_present(p4d))
+		return (pte_t *)p4dp;
 
 	*level = PGTABLE_LEVEL_PUD;
-	*nx |= !p4d_exec(*p4d);
-	*rw &= !!(p4d_write(*p4d));
+	*nx |= !p4d_exec(p4d);
+	*rw &= !!(p4d_write(p4d));
 
-	pud = pud_offset(p4d, address);
-	if (pud_none(*pud))
+	pudp = pud_offset(p4dp, address);
+	pud = pudp_get(pudp);
+	if (pud_none(pud))
 		return NULL;
 
-	if (pud_leaf(*pud) || !pud_present(*pud))
-		return (pte_t *)pud;
+	if (pud_leaf(pud) || !pud_present(pud))
+		return (pte_t *)pudp;
 
 	*level = PGTABLE_LEVEL_PMD;
-	*nx |= !pud_exec(*pud);
-	*rw &= !!(pud_write(*pud));
+	*nx |= !pud_exec(pud);
+	*rw &= !!(pud_write(pud));
 
-	pmd = pmd_offset(pud, address);
-	if (pmd_none(*pmd))
+	pmdp = pmd_offset(pudp, address);
+	pmd = pmdp_get(pmdp);
+	if (pmd_none(pmd))
 		return NULL;
 
-	if (pmd_leaf(*pmd) || !pmd_present(*pmd))
-		return (pte_t *)pmd;
+	if (pmd_leaf(pmd) || !pmd_present(pmd))
+		return (pte_t *)pmdp;
 
 	*level = PGTABLE_LEVEL_PTE;
-	*nx |= !pmd_exec(*pmd);
-	*rw &= !!(pmd_write(*pmd));
+	*nx |= !pmd_exec(pmd);
+	*rw &= !!(pmd_write(pmd));
 
-	return pte_offset_kernel(pmd, address);
+	return pte_offset_kernel(pmdp, address);
 }
 
 /*

-- 
2.53.0


