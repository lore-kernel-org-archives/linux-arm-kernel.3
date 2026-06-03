Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B522ACD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TL4hLQqtTeIYj6fVsZXeAVFV7Zv0bhA39dqz5T4VWsY=; b=ukz+UsSuG/8d3wMzuiaA0OtiAe
	YH7/5J7MyfDU33cWjHOBxRGqQVumEYieWyRUXXl41L/14toMoGyECdXtdfGo91JYk110IeuEZBVgB
	+5OIZh34o4V3c5Nu6NRxzLl4xmGMiuGQIaVQRYW0/yF3xBxWmj7jchpoiH2rRO5HYnZR+Y7oGjK4o
	k1iIxWMjnDrcghBcsU6CGkQAXQswDY8sTjGJf/XonR0Q7SOStSPupazXxAlqVR4WIrvAiQ54v9jSi
	orK9JEQrp8GLOkxB+Psslbyhe0jJA/H0xhFicuZALcQsPX0Aa9xzMWfe2YSVFLCUPwiP+pruzJ1xX
	y/L+qShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoBh-0000000FUbe-2fSN;
	Wed, 03 Jun 2026 16:11:25 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoBf-0000000FUa1-1IvA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 16:11:24 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490a786f987so36909985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 09:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780503081; x=1781107881; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TL4hLQqtTeIYj6fVsZXeAVFV7Zv0bhA39dqz5T4VWsY=;
        b=rFwgo9AOnGhO9jduAxPhWqUI1H7DXgcdK9NfRg6kk2JBjPdJ9YRlSu8KqM7WMd8oTH
         TiaBsGkIcCA3CWzN2Bc0dAJ0i2Wbsqz+u92tNAqQ12ZgIdARXNFSsMBhz1syWuyqAka9
         untsEsZYsuh/mLnAvjOPbQOMACNCRyBd2koD49rocpfdXwR9tHK2+OrK7SS0gsTKSSUj
         A6tz90ZTniTNpEVSrb618uaX9PVChxR2TvYRDYw0jchx4b/xMIEipA/WqknlTI6zJr7n
         76AORohglpPyCxgbpvXxsE1jrcOixPcT4jDqc4M06AjBRD+TxNJc4EsIHOXtllh68pGc
         5BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780503081; x=1781107881;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TL4hLQqtTeIYj6fVsZXeAVFV7Zv0bhA39dqz5T4VWsY=;
        b=miRGwxgnUCFnM8DQKQChc5+mMCK990Ff7p284txekUPWGGDJk3alEBzmqVyQDvPDpg
         xIYZUmY/+sPX2GlUGTV/KTqwVAP7N4HFjf3E+f2kiDgh7eMJlQSqneEAn/WJau6rOcgP
         w0B6XYs2p2Q5N/eEoRtT+tEMTpZ/vV1RZ9QwlKIS9gvRfXdjtVbjptF0H6C8+GRZox6m
         vIuLekMcrdizS3v9iy6b5ITNGD0i/7OIrWM+fIkAbOVGSG2qIGtmTrDwFvcKidas8gdH
         R0+Hys2jjHzMFfkB2/9YBnbLqh7xRRglvmCH1fa/r6eZ1EzMJmkQcr+i0QwX/HaOICBu
         W3EQ==
X-Gm-Message-State: AOJu0Yz7oG9LZmEznysK46qoJVNbYSVXx4NTUsqCjmE3PmBb6JUmi09W
	BDLoBSWP2J2w5KsGGBNgKumVPOtSgiKwaEYQkh8aVrw6SMGPcSIvlbRhGsfeJT/zD3PdnsN28ft
	SiJgIG7Sjo62cQfbxVb/y9M5s26FTHjjHNPY5FJNa39NW8GZ9l1w7MaMCTbhLb5VUCmIX30JFKe
	2SruMX0EoIB/ivUTcdGsAbuH6+3qQPNM+AY76Gws96kQ/W
X-Received: from wmoz18.prod.google.com ([2002:a05:600c:792:b0:490:b58a:2c80])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:820a:b0:490:9782:3eb8
 with SMTP id 5b1f17b1804b1-490b5fd7378mr70201975e9.25.1780503080726; Wed, 03
 Jun 2026 09:11:20 -0700 (PDT)
Date: Wed,  3 Jun 2026 18:09:52 +0200
In-Reply-To: <20260603160949.3372482-6-ardb+git@google.com>
Mime-Version: 1.0
References: <20260603160949.3372482-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222; i=ardb@kernel.org;
 h=from:subject; bh=klTYuM9nrZaRSnTcs7Uaq38kYQvUy5mIsHZz1sf0jcw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUsh8KL6g/daO9pnK2+X3DhXPXKbsllExfMJs+ocW2KSW
 Y0fh0zoKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOximD4p7Hz1NRnV46F1Zft
 DDxXyWkZcXf2ml3G5jNyAwOueKik6zAyHJklGVT4TXPNy8qLuzxbxG89qbH06y1pzigNu5+XEP2 THQA=
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260603160949.3372482-8-ardb+git@google.com>
Subject: [PATCH 2/4] arm64: Avoid double evaluation of __ptep_get()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	maz@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091123_367345_95350DDE 
X-CRM114-Status: GOOD (  13.82  )
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
2.54.0.1013.g208068f2d8-goog


