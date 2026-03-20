Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AF71098795
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neRKNeSqpvJnLheaedaHzSD+GAHs81oovoUYepc/lXo=; b=JC3QVoOCJHkjwoXeYpqviKQyy0
	c945qqRrZPpMikUXzDTb0A4vhGSCMEJJbPwcYuU4W1cvjZee50Xnz8DiB+Q5uMZBuyBmcSw9CQ3ny
	QRFdXOfS1RmPo1WTi1AEz9jnOzRzzz7q+SWWwXCDIXnTOdLkzIqPDjycjqG97gG8wDFmEg60OQ2Jz
	dQY9VfXwYR55ZXOpxr8i+KtvXj5aet/cA9Xn3yQ60Zub8nva/xFyM9z49GM3rTIyQcyNDXdAQMjRX
	ItArIADMfzoLKG83Ir3rFVAH9PWSGHFLc78TRLZL3JicpATwljC36grXgFeo1XrwATBvaMg7mP+3Z
	t/bqkZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKf-0000000CyZt-1RTH;
	Fri, 20 Mar 2026 15:00:13 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bKW-0000000CyOX-2lic
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:00:05 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-485c45885e6so30905135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774018801; x=1774623601; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=neRKNeSqpvJnLheaedaHzSD+GAHs81oovoUYepc/lXo=;
        b=L6pz2YfEV/6NyU8bRN/K9So0o8epCGLiSHKznAjn+0OTmNDHL3/qBx6dKQbpmw1Qur
         AVqtbfx7yeWQJfEV7zulOX/aucsfn7+CPD4N6nF8XxBD/oekZA72qP22DISLOl8Uihyu
         c160Xxxf1HlfL0EkDHKvA0YmmDKWSoz6f1n9+LrJ2mklaSi48MTEsO488nQH7iy/6zBL
         MVb4jjiiZyZkDxyg0zjw60khW89QAl79DfWr15pfCyNsv/t1OZbgFxWZCVP2Jf89AU2R
         dk2f5hRyH/O7VmjyurydtF0SQLT1xRb1aOWxIYmoY6dqhIaYRNGtk2xw7QM1wmPD4w/G
         8jHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018801; x=1774623601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=neRKNeSqpvJnLheaedaHzSD+GAHs81oovoUYepc/lXo=;
        b=ifRoo68o74L5kzQPIXKvzyKzBQg+fr3ysSEyN2ziAmrmAkgVRyf1eQQzXHi2wtz/YB
         oqWKRMq7iWuMGmrgMdgMsscN9ddCDtz7qi4vUpDNxfc9AVhqtCKHC5aD/rOFUwxD2eHJ
         DAfm0+935Q3eh28q+zC1yUWKiP+14SFz6pQ6Umx3HeShs+Vw3ZACBJyylitkjZYh9auD
         uVKBehC5TpYjKdlbDQ6evPTqMVIw8Y61+Ux5ybKdrOMCo3ZZakamcqdDhvHnxLsjO2sR
         Jo6F+loCrhmrqoAAlnlfokun4OR73MzwsFcBIhO/E5r+XJjj/L13qR4dzT5m9dvYRlPe
         Iytg==
X-Gm-Message-State: AOJu0Yytf7CtY6mf9lZuaD1/jIFTXk3kVYXTpVwBEfUdYBD98KTI+9zS
	1sqsTeG+rLaTcdAFM9Rbre7GXnYZN2UHsFj0TRFRfEe6WQ6EgDQeZ2+KUs1rdHTUZgM7u1HdXw=
	=
X-Received: from wmlf18.prod.google.com ([2002:a7b:c8d2:0:b0:483:7a98:f072])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c48f:b0:485:b6dd:5066
 with SMTP id 5b1f17b1804b1-486febb6014mr50607075e9.7.1774018800895; Fri, 20
 Mar 2026 08:00:00 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:59:38 +0100
In-Reply-To: <20260320145934.2349881-15-ardb+git@google.com>
Mime-Version: 1.0
References: <20260320145934.2349881-15-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2697; i=ardb@kernel.org;
 h=from:subject; bh=TuswSFvpHM3Mr71nHK8iSkeQ2cBVxUsQsRsYd8yRYuI=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIXNvwu1QGc17/9r21omerLN+XHuGaVdo3enIhfHzJrH+i
 Or3aT3YUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYi6sTIcHtC4bWNE784v+yf
 /Pguw5T9ay//LWk3CFO9K+rmvuEK60ZGhoXzPlp/tZjoyPd26e7G850npbKnlJ10WfX05sOIqul HbzIAAA==
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320145934.2349881-18-ardb+git@google.com>
Subject: [PATCH v3 03/13] arm64: mm: Preserve non-contiguous descriptors when
 mapping DRAM
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_080004_719404_E365BEA2 
X-CRM114-Status: GOOD (  13.66  )
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
index b3e58735c49b..dc007043d86b 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -187,6 +187,10 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
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
index 9927b55022d8..7f7d63009440 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -230,7 +230,8 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 		/* use a contiguous mapping if the range is suitably aligned */
 		if ((((addr | next | phys) & ~CONT_PTE_MASK) == 0) &&
-		    (flags & NO_CONT_MAPPINGS) == 0)
+		    (flags & NO_CONT_MAPPINGS) == 0 &&
+		    !pte_valid_noncont(__ptep_get(ptep)))
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
 		init_pte(ptep, addr, next, phys, __prot);
@@ -330,7 +331,8 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 
 		/* use a contiguous mapping if the range is suitably aligned */
 		if ((((addr | next | phys) & ~CONT_PMD_MASK) == 0) &&
-		    (flags & NO_CONT_MAPPINGS) == 0)
+		    (flags & NO_CONT_MAPPINGS) == 0 &&
+		    !pte_valid_noncont(pmd_pte(READ_ONCE(*pmdp))))
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
 		ret = init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
-- 
2.53.0.959.g497ff81fa9-goog


