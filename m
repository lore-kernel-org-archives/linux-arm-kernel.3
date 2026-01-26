Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8288AD74EF7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7QZsFTSOh849rOV6LRsDiE1RAQq4Vm6P1yBesuKlE0=; b=S4LyVqty+1BCGk5a8Z9rmIvO7b
	r/6U04B0d0Ei5tzj3+bRXihfpn4vpRjics9LR5H4rbUUuda71TjH+lP1GfLlkWNtg0owkkdGYDrDV
	B+SgbjM4P7djC8W4E+eNPt2NSg8O6QsemgJ7WzOpfFFCOQmhrsKMwAlrrLbBLXERqvRrsiC8vzClG
	iAuk3gMH4k2a3PLWmRwkGeKtWdPvjvinFrxeKMCuMkBq8TrVKt+thlFKqyuo0jOlaOejdcL89cLMa
	brTo83mLFQHj5Q1lVgfknyRxFLMJR8yUEb1jriB0J1XNDgafc+6jtUeJC3tBt4odNOUCuESQzEZ0/
	6YvV6hmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsr-0000000CC5b-1aEO;
	Mon, 26 Jan 2026 09:27:45 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIsk-0000000CBzz-0eim
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:27:39 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477c49f273fso46038465e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419656; x=1770024456; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7QZsFTSOh849rOV6LRsDiE1RAQq4Vm6P1yBesuKlE0=;
        b=elmg3xPrYLw/803W2odLl+3+kAaN2X3m4HXHHUVIPr6Wgj+mowv5ljqTInUvuWh9GG
         CHL1smDvhAd4ZuyClDZrmRIw6Tb6myiB8lLIKF0TFuxkFrmt7K25JX7MHr7Q+DB/kMNi
         xVVJ0QqoRSEresHWnB92J9fU5GbNwkIh7ZRLrt8xLBCJ4LefUTwjIufBBMX8UHaJG0WP
         FeOHzfor6XhduVcBBMtWW0R7llDyncKT2tB8oS91rJDv9rtIfDdHhMvCZ6ouFkUCSgdP
         QGGXQfTM9dkBznZLmxZhGblh4MZvapDjLof5wmX5EUgc3DVNtjis5oUaJZr43Mr+Jz0q
         +pKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419656; x=1770024456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7QZsFTSOh849rOV6LRsDiE1RAQq4Vm6P1yBesuKlE0=;
        b=ex+GOLxWBGWHLcTKsWKMApMJuS92CkhVrMe8VHWyEYzIrMewh16PaXOIxCV3mRd2ES
         TDG97IbriliPyUIpFz4T3vAjIMW2J/Ud7J1+OvKzZvWWZ7q3upP7VR/A1T3XH+AWbK/1
         2cae482lpbaQVB8y8yAJgauPWTnnmjsCn8AKanzo4wAx5ecItOOfh/P5pF8b62DyuQtl
         pDuBgDaE5j+3dFfm1GxcglrHigbdeJSPOppRVrDqVvGr6bAqZXineyEisb8hTXyVC0cn
         8J1hBYcoflFn58kMOKwyVnGlA4oaL+ToePSmeBjRSauS7Gr9LtA8lmfr1TgflZBwLMcL
         f7yQ==
X-Gm-Message-State: AOJu0YwMbpAVw61nACWhfdVXi/bdCkWT6TSSWr7+teVH89Zck9GELgBt
	iJMk/ydnS9Rx8rngNw1BSmdhLQYqZnmJcbtiq3vHDu/3AgnvX9eMTkcf5METJ+CVzPKDpDSwIA=
	=
X-Received: from wmba22.prod.google.com ([2002:a05:600c:6dd6:b0:477:988a:7675])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f43:b0:477:a54a:acba
 with SMTP id 5b1f17b1804b1-4805cf5f2b9mr73678575e9.17.1769419656035; Mon, 26
 Jan 2026 01:27:36 -0800 (PST)
Date: Mon, 26 Jan 2026 10:26:36 +0100
In-Reply-To: <20260126092630.1800589-12-ardb+git@google.com>
Mime-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2647; i=ardb@kernel.org;
 h=from:subject; bh=gTtNtodtCpnKfAIP/yDCxL7y5gOaP+fLKD5+ODcsG54=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIbPc2DP4c6/cvLuKPOWa81fyz1g4a51h+fLeU3u7soOsT
 nnqbnnfUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYS7cbwP99754VFqcZznjJ1
 Xu8xP5ztEZb8nnMu44t3UrWSFo//lzEybHsbpvN4084X24Xl5myK0lpz6udkN5MTqXyGJY8/3xR y4QMA
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126092630.1800589-17-ardb+git@google.com>
Subject: [PATCH v2 05/10] arm64: mm: Preserve non-contiguous descriptors when
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
X-CRM114-CacheID: sfid-20260126_012738_398851_8C04AE15 
X-CRM114-Status: GOOD (  14.79  )
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

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 4 ++++
 arch/arm64/mm/mmu.c              | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 64d5f1d9cce9..cb2c4525e49a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -224,6 +224,10 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
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
index 28cc3cda042c..d7faa98f427c 100644
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
2.52.0.457.g6b5491de43-goog


