Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE8FCD6E77
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CasHJuCvieisWqL8kBoseI3vU+9nQuNqwVDXJ6YMA3Y=; b=pqQQP2cjWz8DvOba6K4SrP84a0
	7swnrgxA67Dw8SIfwI11y4XKylUwyqVPNaBHdkF4K73vBz4OSMv55LcfkU1g6bqNzeQAsiqt+FHLh
	xKfPrhtQpkg4tbrNJ653UYDMx01OA74Q4Ov9fMc7t/LmZVDk8JOZ4hxAPZiRHrWya/yOlPkExbLrf
	Tnlq8/Etdr7TkKbx14dWvFvO+Ip4nL0PBMYIT7dkdF9doqWDO9D8acojW4P78laOfB79MnP4ns7iH
	htevY+UnXzdUGyEBMG6Vr+NTcoEFTy8XQDs7zMOIcC5CtVI5x0XvdDSxZSF5mLypeUTLf/QM+Hxwv
	FUXJrBug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9k9-0000000Gxze-2DXq;
	Thu, 04 Jun 2026 15:12:25 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9k6-0000000GxxM-0qix
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:12:23 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-460153ce644so575880f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 08:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780585940; x=1781190740; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CasHJuCvieisWqL8kBoseI3vU+9nQuNqwVDXJ6YMA3Y=;
        b=IihIIQ/nmOy7xL8UnWE9hgdlq+1gdTusMYNr3Pf3LBtM/tgEBAy/7m9zz1j9JDtw7m
         m4NftqInazo8OWgbmeXUNhnjukAEovOva0ByW1NieZnwMtpuT/o3Z3sy9OdaTOQeXpvy
         PKfrBLBj8JWPpQHCBiB5U/QB/tjlvzj+3kuzl847gGwrzP3TVYXgJT6tWkh7JDp89qaY
         Vs0zTWuo2JD0VbumTaJI9sWw0+f8LwLgxlcBzD1czpxisdq4pJMb1pEzZ86/Z5J4RwgV
         uzMSFn21Ua8CClXbg9s5/E/rowlJE6xj9kOoxc6i2oOXbHhL1hBxnKHZhtU2BqzO/f+I
         RFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585940; x=1781190740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CasHJuCvieisWqL8kBoseI3vU+9nQuNqwVDXJ6YMA3Y=;
        b=iyv/nLxhCHyA6iuaQ53t05Z0EwZTsYPoBjVNVrNCYP6KXHLLc6qwToP9AgvDgKpRFE
         rZnja4qpipUmqrXnDa+xJmJbbueBJ6cb8wNuBtIo+NvgXUeG5YpWCDqe3gIz5n7B7BmR
         C//9zhmikehsS+tKltzVaVEwFl8iIjXilvcKqYiLawfMLfC9Bo5jb3opx5ovxEvPw9n0
         +C3GSbcYn76gtMIbH7uRnAt9YmoVxRlpUGtldlI+SOAyTa8xXkhKZVKZtzwnIz/D8SQy
         DxpgcdjGo2daa9zRCitseO7LNZTghnxNassAwoyprqGAaD3P1FoQ8SKRUcr9DycU9Ts7
         wJxA==
X-Gm-Message-State: AOJu0YxCOlB4eWJXCu7jmbua4U0vYHM3xxt0fVo8SHxfXwD9bgIjHEci
	DmxnmZvlgkWTpq6ZUmXcaEPkrKQ12MaPPt6tpBA5iWn0zeyOr6Jdjc+40BTKLIXaNcAaqOlHDsw
	i+QGTuTT5dyYN9yGnZdDej7wglElPkZ+L351LfRLAQ/ntwsYp9n+H+kE8WZp/jjoNTlfIIClQPh
	TuBllxKDsM7uVmfOzInDc3rhpRSx8B/gmUdkh9LoaWyzJa
X-Received: from wmdd20.prod.google.com ([2002:a05:600c:a214:b0:490:bfa7:ad27])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c0dc:b0:490:6869:ef13
 with SMTP id 5b1f17b1804b1-490b5ecce34mr98325645e9.14.1780585939840; Thu, 04
 Jun 2026 08:12:19 -0700 (PDT)
Date: Thu,  4 Jun 2026 17:11:55 +0200
In-Reply-To: <20260604151151.150377-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260604151151.150377-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=ardb@kernel.org;
 h=from:subject; bh=5MfAD19ZZ8C7D6B6Oy/cwSyuECR6YirB5JgWa4RaF1A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtx6t5nXSbvtmssWHykqergKUuNdIPnnZdr+ryTDS53S
 7jGn33bUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZi1sbIsL7hgJ21icadQ4wl
 sxnry3xtJ/07HvBR97lbm9TvPofDdxkZGrY625Vtydmry5tzLfeG1mlt6aTZH8/6z3E2iPt4uDi NDQA=
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260604151151.150377-10-ardb+git@google.com>
Subject: [PATCH v2 3/5] arm64: Avoid double evaluation of __ptep_get()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_081222_258873_F91DB093 
X-CRM114-Status: GOOD (  13.69  )
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

Sashiko warns that the new pte_valid_noncont() macro is used in a manner
where the argument (which performs a READ_ONCE() of the descriptor) is
evaluated twice.

Drop the macro that we just added, and move the check into the newly
added users.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h |  4 ----
 arch/arm64/mm/mmu.c              | 14 ++++++++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 491ba0a6492d..c9e4e00a9af2 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -181,10 +181,6 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
  * Returns true if the pte is valid and has the contiguous bit set.
  */
 #define pte_valid_cont(pte)	(pte_valid(pte) && pte_cont(pte))
-/*
- * Returns true if the pte is valid and has the contiguous bit cleared.
- */
-#define pte_valid_noncont(pte)	(pte_valid(pte) && !pte_cont(pte))
 /*
  * Could the pte be present in the TLB? We must check mm_tlb_flush_pending
  * so that we don't erroneously return false for pages that have been
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index be51f6cac86f..d68e691c093a 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -186,9 +186,12 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 
 static bool pte_range_has_valid_noncont(pte_t *ptep)
 {
-	for (int i = 0; i < CONT_PTES; i++)
-		if (pte_valid_noncont(__ptep_get(&ptep[i])))
+	for (int i = 0; i < CONT_PTES; i++) {
+		pte_t pte = __ptep_get(&ptep[i]);
+
+		if (pte_valid(pte) && !pte_cont(pte))
 			return true;
+	}
 	return false;
 }
 
@@ -291,9 +294,12 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 
 static bool pmd_range_has_valid_noncont(pmd_t *pmdp)
 {
-	for (int i = 0; i < CONT_PMDS; i++)
-		if (pte_valid_noncont(pmd_pte(READ_ONCE(pmdp[i]))))
+	for (int i = 0; i < CONT_PMDS; i++) {
+		pte_t pte = pmd_pte(READ_ONCE(pmdp[i]));
+
+		if (pte_valid(pte) && !pte_cont(pte))
 			return true;
+	}
 	return false;
 }
 
-- 
2.54.0.1032.g2f8565e1d1-goog


