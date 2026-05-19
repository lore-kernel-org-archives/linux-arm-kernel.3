Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30527CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CS1BtfvkhqK/WG7QMDSO/xvMHjZnFGS59EcNSZDS0Dk=; b=d7Zsjxpsp6Q/krNx5LB4VCLq90
	ShyXqntM8r75YmZWhotyCQ5TTX+VaLGz0np/cSmO9Y3WHUGyOwfSCCFBnc1x4ZT0pOFuuur1/5VDc
	r1sKbkQPD4zT066UmnBiP1oZMTOH7lvhuJ4qG1eYbzEf06M73R91PS8N+Yc/8upQLpKnbMfEnJ/tA
	3iGXCuLiD4g5QcAdQXusBTTi6BjoRqoS1fLC9K8CmAP5QbAvQArvWLXuGCLYx6J3PlZtKl8vn/zBq
	t7rcddspdlmx+AOHJLYThUwmaJS1thzEWaJEV0O+Rj+xR2Yx8eMQwLBo2uKy7JfKW+GI6gdfJABEN
	qNczzGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDN-00000001yfx-0h1k;
	Tue, 19 May 2026 15:18:37 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMDD-00000001yW8-0RES
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:18:28 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-44d83e45febso3256596f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203905; x=1779808705; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CS1BtfvkhqK/WG7QMDSO/xvMHjZnFGS59EcNSZDS0Dk=;
        b=gz63f+wAFzcZk7Nx4DUsFiMk2lyUVUyRrZ3jj4vvip4E0a8wrnfquMOgrp+EFOJ4X7
         o0cOrNajaPF3SHSUT0IxuebM5plPLhszerQdpMYwIDtG516VU8601Hy7hK9UAmXBrZo2
         kXfQG2hKAAjgCOvXb1f0cMWr3LesDt94jBMhoStT5s39fI9IGFw/rHPpEnJ5BRFfrEaP
         Hl20+YUDDsKREPGOoqquDgohlL3ae/r+d2j+eLftHXFygjaivmMKErNJ3l617+DhXlAL
         5narO9pSMKrjWAo3Mox6QD4QAXbYW6ERcvaU3yo9AgR2HhX3Upr+N0hCr4tPh2Zgv5Zc
         DUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203905; x=1779808705;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CS1BtfvkhqK/WG7QMDSO/xvMHjZnFGS59EcNSZDS0Dk=;
        b=BvwTa7hFdwgY/Qaf+D/QwcVd0mkPZQt5J9pEQTeLnzD+9B+GnIjy7G6wNJkV0m0P5l
         yPzCn8Jjc313QBRLxvCj0VcwP7FPjN9cvcq9KPHRm7mfXuEPtrwjbDBHkF6jnc0G+Sgj
         wc5SoAT2Kp7/IgWChVplOtLhvoMzdcyzelduaWskABy7xJ7qukDYqfnoh1JkiE5yv8Nj
         TNaZVEkZ79+cRLp6MYUzpT/leXjqK3paxOTnz+/fwPrZWUFsThfu5UfxHjLdWbFPpIvN
         omwzL/suiOhT36BOaQWTxM88bU6nVq6Qr1O890iLAMF/E1bBQmLoT0Jjiy+anuWv/NSf
         Mm3Q==
X-Gm-Message-State: AOJu0YxPfGP8z6H8vo2BiVKJ70gYZt6d83V9MK7fOF11YvXitDBViIAI
	YNhvCq585Xj1FUx4SkFiLnLXV8VWdvCCRPUfOazpxGBOBHTepjVyoV+C7iImq+Vr29O6JW/WEX/
	IRu48PTbmbWO6IFuiHgiwiLEvunCRQkRHi/fQlB+wxoOYQgHvb+BPRFHcD8+8XZ5J3cnZH/y8J6
	d7gm8NOPAEY20T+FzYEvrpNSSfe4Alfe7hU3TJphWZW4kb
X-Received: from wrbhg12.prod.google.com ([2002:a05:6000:1e4c:b0:43d:7480:5bfc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2885:b0:44b:5a37:36c4
 with SMTP id ffacd0b85a97d-45d941b198fmr40017031f8f.26.1779203900883; Tue, 19
 May 2026 08:18:20 -0700 (PDT)
Date: Tue, 19 May 2026 17:16:21 +0200
In-Reply-To: <20260519151616.2557018-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260519151616.2557018-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2697; i=ardb@kernel.org;
 h=from:subject; bh=suqWUpRPoN3mdRoFNlLmQlr8b1d/8QdQDtjxwFffruk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIYun7vhPi2CHG4Vsp5Yef6FSIcbLk+jJoX4rguX5KsV15
 tJ3GHk7SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwERu5DMy9C7UkCzh3eQ0N8Zg
 EeM83iu5V5tysvp+HHm5smhdUXqWOyPD3pP9D/9fkf3xM3Jr+f7UbV8D2Y/5b+u9ur+madPEK3o nOQE=
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519151616.2557018-19-ardb+git@google.com>
Subject: [PATCH v5 04/13] arm64: mm: Preserve non-contiguous descriptors when
 mapping DRAM
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081827_169078_93B9AE18 
X-CRM114-Status: GOOD (  14.94  )
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

Instead of blindly overwriting existing live entries with the contiguous
bit cleared when mapping DRAM regions, check whether the contiguous
region in question starts with a descriptor that has the valid bit set
and the contiguous bit cleared, and in that case, leave the contiguous
bit unset on the entire region. This permits the logic of mapping the
kernel's linear alias to be simplified in a subsequent patch.

Note that not setting the contiguous bit on any of the descriptors in
the contiguous region can only result in an invalid configuration if it
was already invalid to begin with.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 4 ++++
 arch/arm64/mm/mmu.c              | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

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
index bd2764f02a7d..4c6ef0d35714 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -224,7 +224,8 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 		/* use a contiguous mapping if the range is suitably aligned */
 		if ((((addr | next | phys) & ~CONT_PTE_MASK) == 0) &&
-		    (flags & NO_CONT_MAPPINGS) == 0)
+		    (flags & NO_CONT_MAPPINGS) == 0 &&
+		    !pte_valid_noncont(__ptep_get(ptep)))
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
 		init_pte(ptep, addr, next, phys, __prot);
@@ -324,7 +325,8 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 
 		/* use a contiguous mapping if the range is suitably aligned */
 		if ((((addr | next | phys) & ~CONT_PMD_MASK) == 0) &&
-		    (flags & NO_CONT_MAPPINGS) == 0)
+		    (flags & NO_CONT_MAPPINGS) == 0 &&
+		    !pte_valid_noncont(pmd_pte(READ_ONCE(*pmdp))))
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
 		ret = init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
-- 
2.54.0.563.g4f69b47b94-goog


