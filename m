Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F13CD6E41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVtRZrGktzRjCdUnH3kN7Vy8R0F1sW5LmttIAYz/k8A=; b=2kggnBPhJrn27iTmetndhh5P2n
	xeLjXjav/u/uDZkmAhdXb53NVKVrlOOWkIU+GcI/0Z8fLSNNP/4dp/WZia0Virf/90NMIw7SLHa8L
	7RzC8lrT00Go2RsQVMd7JS3pT7jvzcqMtEjHjrCf+HE1wfjhAs06gJU2J4U8eRyWy2m2rbKyt2P5m
	hA0j1E0xvmK4OTgYHsBxrh+/soMnhcLi+/RwAr4ejeqQ2jG6GoiiKZBaqqwuXV3MJpWnN3fX+f2uT
	np+jLGlI++VF4QWvfGCdtD4tQN2LmZBjUtTKbblayjIeas6ExGuJFS+wXbl8X1jrkLXdzUg2QkvVw
	v3+GrHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw40-00000002mrK-1qJX;
	Tue, 26 May 2026 17:59:36 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRw3t-00000002ml1-2qvS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:59:30 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-6884ab142c6so4019157a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779818367; x=1780423167; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cVtRZrGktzRjCdUnH3kN7Vy8R0F1sW5LmttIAYz/k8A=;
        b=ljrAGTfKGpFJqImAYmlsxdM4Y+w08WyN+ajAaeSZ2pZSLQBdBo/W3TR8Cxh5anWBup
         2WojBmk+uYxi7LgoFaN/zwrFKGzVPzt6PenD4kuGjycaYYYEpRSekYh1PYl5auLVQpVM
         0msIMneFfFayJ7wAx+5j1ViBjXjfTecbWjCNy4+nLrcI4hpzcVy+bDP7cCOBjXnYH+P4
         Svasazs4ZehMYyHl7PQ90b+FWt/f+wN8pl5BGIAVo6IK+jtzBi+GjnkC9LhHfIAX6AqN
         zkRj7tSTF3N38az5lBSPYyV1zd8RtZS6eK0AdVaIuzHPwMWzJh2ssNfBCGkEyWODegC5
         GOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818367; x=1780423167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVtRZrGktzRjCdUnH3kN7Vy8R0F1sW5LmttIAYz/k8A=;
        b=LklOO4x/lnNpH3Q4FSVDmrl1IWPY74GRQYVBX4wwX4bYxvm/Dsr1Ekc6oNjBJa08c1
         lgkNPvdny1MFKm1dPIwNups0euNuQ1qBnunGo9ewsxAybx7aFTbGiJ6Hdvmyt6N1tISY
         T1XbOd+RTqacueb80dypBiZlMcGkjrDQ5dI9F7+jnZLF4Z6wES03nSXlW+60cP+51k+d
         w94pX88pRqY+hC18JCV5V3FW0PNzVLmvlM0KbBAqTUTv5hiMvDNPh3tSOFx/KS4zfGmI
         q21DQBRT5UZDbpMDzam73DWNeB7wUlgVI0rF/T5WDM/b1/ILiThYDF/wKS829EIXe2Qb
         zD2g==
X-Gm-Message-State: AOJu0Yy0OKsWz1FSQcJn2iEBXWsXzzyfOEEXg1jRRq3ysG0olmLQhxiv
	yYIVbGFyW4LYH3YsbNn+0YruEnsBrL/WIKjlIUQY/YnVSE36YlK5GOlZt2q5piUhIRfh6PMrXXW
	tK5pJiGenr83oqtOwS27/6zC9lwLffL/xYRrA7f3FyBPWOrf11GUaS6MC0qrPK18RyHQPu9zmMo
	O7MvH7+NKGt2DT1q/XMEXitwE/8ss14w1QUc0Fb1jefMOw
X-Received: from edgg7.prod.google.com ([2002:a05:6402:1ec7:b0:687:a46:a91a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3891:b0:683:1cc8:84b0
 with SMTP id 4fb4d7f45d1cf-6889c41ece7mr9857461a12.1.1779818366685; Tue, 26
 May 2026 10:59:26 -0700 (PDT)
Date: Tue, 26 May 2026 19:58:52 +0200
In-Reply-To: <20260526175846.2694125-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260526175846.2694125-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700; i=ardb@kernel.org;
 h=from:subject; bh=z6XqclO2VktRYngIWmFbVHfouJpd6sLXvnE8xwKtYlk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUv0flxH4ekTmyZ0HhJ9JL0wwCSxxnH9nteLX//dwO4dq
 58gueBoRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhI3R2G36zF1sq/DnmIFKhu
 n6+5tapE4TVTQeM123nvlwhbO97ZVc/wV4jD64xshEfNl9JbBTcNtzWsVTgTNfuZcwu3tFeOvPJ UZgA=
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260526175846.2694125-22-ardb+git@google.com>
Subject: [PATCH v6 05/15] arm64: mm: Preserve non-contiguous descriptors when
 mapping DRAM
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_105929_778394_B1216FBF 
X-CRM114-Status: GOOD (  16.51  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Instead of blindly overwriting existing live entries regardless of the
value of their contiguous bit when mapping DRAM regions at
contiguous-hint granularity, check whether the contiguous region in
question contains any valid descriptors that have the contiguous bit
cleared, and in that case, leave the contiguous bit unset on the entire
region. This permits the logic of mapping the kernel's linear alias to
be simplified in a subsequent patch.

Note that this can only result in a misprogrammed contiguous bit (as per
ARM ARM RNGLXZ) if the region in question already contains a mix of
valid contiguous and valid non-contiguous descriptors, in which case it
was already misprogrammed to begin with.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h |  4 ++++
 arch/arm64/mm/mmu.c              | 22 ++++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4dfa42b7d053..a1c5894332d9 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -181,6 +181,10 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
  * Returns true if the pte is valid and has the contiguous bit set.
  */
 #define pte_valid_cont(pte)	(pte_valid(pte) && pte_cont(pte))
+/*
+ * Returns true if the pte is valid and has the contiguous bit cleared.
+ */
+#define pte_valid_noncont(pte)	(pte_valid(pte) && !pte_cont(pte))
 /*
  * Could the pte be present in the TLB? We must check mm_tlb_flush_pending
  * so that we don't erroneously return false for pages that have been
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 5c827fa3cd38..6b42d724bd1b 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -187,6 +187,14 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 	} while (ptep++, addr += PAGE_SIZE, addr != end);
 }
 
+static bool pte_range_has_valid_noncont(pte_t *ptep)
+{
+	for (int i = 0; i < CONT_PTES; i++)
+		if (pte_valid_noncont(__ptep_get(&ptep[i])))
+			return true;
+	return false;
+}
+
 static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 			       unsigned long end, phys_addr_t phys,
 			       pgprot_t prot,
@@ -224,7 +232,8 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 		/* use a contiguous mapping if the range is suitably aligned */
 		if ((((addr | next | phys) & ~CONT_PTE_MASK) == 0) &&
-		    (flags & NO_CONT_MAPPINGS) == 0)
+		    (flags & NO_CONT_MAPPINGS) == 0 &&
+		    !pte_range_has_valid_noncont(ptep))
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
 		init_pte(ptep, addr, next, phys, __prot);
@@ -283,6 +292,14 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 	return 0;
 }
 
+static bool pmd_range_has_valid_noncont(pmd_t *pmdp)
+{
+	for (int i = 0; i < CONT_PMDS; i++)
+		if (pte_valid_noncont(pmd_pte(READ_ONCE(pmdp[i]))))
+			return true;
+	return false;
+}
+
 static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 			       unsigned long end, phys_addr_t phys,
 			       pgprot_t prot,
@@ -324,7 +341,8 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 
 		/* use a contiguous mapping if the range is suitably aligned */
 		if ((((addr | next | phys) & ~CONT_PMD_MASK) == 0) &&
-		    (flags & NO_CONT_MAPPINGS) == 0)
+		    (flags & NO_CONT_MAPPINGS) == 0 &&
+		    !pmd_range_has_valid_noncont(pmdp))
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
 		ret = init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
-- 
2.54.0.794.g4f17f83d09-goog


