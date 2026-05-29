Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F1FCD6E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwwWx+36ZO5AyFG8PbXK1ZtkzsCWR7UH7LxbrRw2oLU=; b=g2YvQ7Q/hJCeIWEGJdSpQrbTFU
	GEPQY+YauTgGkkGP/nThE0JKJDFE4xG9h0iTXviq1esIpFMjVquo50rbQovgtwQ7I4ptBGr03Pp/2
	2rKO1JDEhBpEvSWWiBjPXbRlYI9/+5Z9P5CJlyukPtnoDkVJ81ft32syYpLslGT2h3fDkVi3LsQew
	LEsPMDtoMke9QE42AzkK8bQ9JLbW3XT5tnngwQMqyt/dabeS+BnJqHgOg5rGoK0MXq04y2g2oMZf8
	Ju8iYkIbdccD5A8o+3w6LIB4omAB9pVNW73XzSpHq4YdNDO7zj5PG1F9iqI1gAA1MpfMOgDzj9dym
	/cJMOvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjP-00000007bpi-2Kff;
	Fri, 29 May 2026 15:02:39 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyjD-00000007bg3-10sn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:02:28 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-49051422d55so69832925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780066943; x=1780671743; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KwwWx+36ZO5AyFG8PbXK1ZtkzsCWR7UH7LxbrRw2oLU=;
        b=wD7aDT6/Wf7rIu2CJuAGNAtp94Ye6/gKboXuelhwNQmv3+SX2fw2yiVUXIC32XG823
         2uXv1RVyqR4N7fGi54ij5QoMlasp9XMSnYNJRRXdKUPG2YT2eQ5skoxSU0zS80CvdHUa
         ZSN84nFDWmvUDbh02Za8XrBCfeMOTUWmITVCpL5Tm4FbK/fsUw1ww4vxXsHBFBSteTiP
         zTNL1XyAniBJSJyfkCPNa8yoLDvsZAV3Lv2RjTyD1QxYDaf2m/oOQcvRm8i9W9gVr+vR
         IQVf4i6+rBX3TBFQfRrIOwBb3kdfA55K4wuc++oDTY8UsX8rWJwARZxbBzlkKkr1zZOX
         aTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066943; x=1780671743;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwwWx+36ZO5AyFG8PbXK1ZtkzsCWR7UH7LxbrRw2oLU=;
        b=C8tVEYHmllinpDBLjSiuDplXD7qYHlETxBiMYVUHOk+4watIV2zi10UEBJHivUCU2x
         PTWxTlKxVHr+pD5ij95b2Cwn9DAIHQWZjd9/PXl5Gj9HU1dhQoiLMBUVfmnBob+z/Rtj
         qp9IR+fDLKVhxuk7sSqohx+L5HG7FwqEETaZ60XPoI0coTjkalG/conMXfEAiMFiDzk1
         fCSh0jSKSwOB843IDkqdyTUPphktA2Ewvgf3kSBKVJYyX2olfxIItLp6nDnDiuSzW9km
         wUcsVYXBcprlRB92yR3xptnraqbcpdAIsQoi8TywwtknOrI3A0Wo0+sUKY3KMgkeEI3a
         kG+g==
X-Gm-Message-State: AOJu0Yx84PgHtr7dWlpLD3W+A5Fj+sAK2C6iguVLjorH/RzUew47tmrR
	hUMDih09QwajOVI1tDp2B6uGoFm5DB9LSKaCwOg8z9R265mnNkMJTH9N8Y6fLJbPhaFp8X9yce6
	bTm06yjCYo78TeBcrNuMijxP3rP8hWtq5E+04w5m26VVqs1QSjh7tGi5E5fnsjQ3l6/fUz73bge
	X28ZPkkOhvJdn6VlWFuuNM6qu0zrL+V6TPZ7ST2LLhpjtM
X-Received: from wmbiv7.prod.google.com ([2002:a05:600c:5487:b0:48f:de29:3f52])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:2313:b0:490:6237:5213
 with SMTP id 5b1f17b1804b1-4909c0af69cmr42420765e9.23.1780066943345; Fri, 29
 May 2026 08:02:23 -0700 (PDT)
Date: Fri, 29 May 2026 17:01:56 +0200
In-Reply-To: <20260529150150.1670604-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260529150150.1670604-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700; i=ardb@kernel.org;
 h=from:subject; bh=JEV2e9VnURwytUBvbY/jPf+EEXewGZ41iq/e9jE9rQo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtyVap1rG3Fm6CS7u4UZS4lT7Z9HxxXNudcEuL6naq74
 afp7KCOUhYGMS4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMJGPCgx/uKQ8e8xyJPt5JLP2
 bi5SltRnOvLycG3KFEeBXT7tu08rMTKsXffM79eljW7bhWbvntV0WFru9cWYiprdF6/MlLIvbk5 kAAA=
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150150.1670604-22-ardb+git@google.com>
Subject: [PATCH v7 05/15] arm64: mm: Preserve non-contiguous descriptors when
 mapping DRAM
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>, 
	Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_080227_393797_38141A28 
X-CRM114-Status: GOOD (  16.02  )
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
2.54.0.823.g6e5bcc1fc9-goog


