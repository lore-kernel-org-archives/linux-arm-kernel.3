Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6577CD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXPIHoC6dhQxYOxBacC2HRb5Z1DiryyTwf/00/NWMZQ=; b=imtTszv/pE1NAoJSAts3aXRwv4
	VAgPKnzeRlkdQKnx+0ygpwKirYP43nvrrLAQnDJzwm4mzfRtN+mL+DWjBLJPp5zs/XfNPphZVBP3k
	lBwAhjUKE0Q4htU/jGqYDr0yjSWvzNgjGhSE0/5D5pNjyYPOAmHi2npQL+aFMwJDNA3smY+8aBF0v
	vl4tETtEl13GoDYO20VWPvMxB2/EPHDobBdqhG7s04iOwquFqv5tDIFxKFqyu2pkmkom9HKGrIkpY
	biAHCFpTsT2AtNed0zFJXnr5w36NCdlnScQ63k41lARvz+NytscueyZA6zAY2kxfucj8CPue6gklY
	WHYYjfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9k9-0000000Gxzu-2hVM;
	Thu, 04 Jun 2026 15:12:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9k7-0000000GxyL-1UGV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Jun 2026 15:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bXPIHoC6dhQxYOxBacC2HRb5Z1DiryyTwf/00/NWMZQ=; b=J0F4L9reEwZeIVmYq514HJTYij
	FIodbxb/IiuzTvEF/Ih3sESDGZtV7rXKKjT61llZjhY66ygngM/7YGwOrWY4RdETqrGZNt4Lh+dLm
	yl7+mvgOb75a2DkcBhjTNFm+eLMhAUtwnzeWZNRD/RkzKoyOygdqyJsT31pA/MiFaPM3clq03wFkP
	f8Q2+8rjmsLU12a6qS11pCG4wh7O1LRAyzVEJJeyKtutgn5dbZGYuB8/SKJiiGYn/TzqlQ7EfkDVs
	Ww38VfmSXYfTtHzUlvdXHerXzT1uY7JzxBWhdbnUW/0L+oe39/+Hysln+bOJiK+0J+0ptcmps/iEu
	gOnILtnw==;
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV9k4-0000000EUbc-2T7S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:12:22 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b3f53c81so4030835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 08:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780585938; x=1781190738; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bXPIHoC6dhQxYOxBacC2HRb5Z1DiryyTwf/00/NWMZQ=;
        b=Y+rx8hNJt9BCfNTU89tvtCwqLAgO5I5fsxPGddxTaqFOf0uNIDmPIceMIKnVQS4zFm
         amq5xRf7RfDDE2Z/6F9gTHjQyHysPns0ufhdbZ00t1cpi1yYnHGX4un4fTXe2hc1VzwK
         TsAN2SKF2nKC2XB+TBltvPCqYvYcf376uozrhdWFEzi7PCsOlMBrR1eKzi0xMD6KEh7y
         a8q2r+NKqD/EoBQqTgdGKcMIFVGnO2DQLmoUeXxgJ5hi4WPSfyHILXzVRd9h2VAsT1im
         nxrPuVO+D5ianp8JfFiAwJ84wL3XeEi/bPUJLmBQy1WhqUMtj/o6cjV+PTY/Y2KuqueR
         bH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585938; x=1781190738;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bXPIHoC6dhQxYOxBacC2HRb5Z1DiryyTwf/00/NWMZQ=;
        b=pRKRlrWUNLUeMs1Ap0jaKOgm9dhw4eMDIgteGXLvlXqBTX2XQ2sowrp7ZxJPG/pVN0
         MV66DeynHRZYI8+FFHTl/ULrprLfj/EJ7GquvId2WMQiyc4bDhcdBaFGU6uvYXkGUr3Z
         HXDsKRav5KTdM+QTCgkyTErGVsGHxesFO1Rkk2JDHx1Uq1jrwMgoqXpBxjWwU1c3lZSo
         h1dZNuTDwtFoFF+SsM/9R0CC1HytIL5jKbF/CafnTN59D3ESzjE72hCUv+Hv0ecsGFrO
         qNeDEU0/W0EqRfaQMu8sf4zprU6o2VCY8Bya4wQcSqvOuybhxIsVUX3hgGH9NnVPj9AZ
         l4sw==
X-Gm-Message-State: AOJu0YxW+P9YIywS/Sr62URXBJzeuHSg7uMBenUQN+WqcXtdSvWzWmh9
	ZdrHgXRqV7lURfgTF2Hl4ND0CFOfF4b/9XMVK7ec6uMKJTfcytnZ3EFLXe+HSfj+Wz97tEA3wmU
	N5nbMvDkipdLFAtkwR7yq5sb5hoyXY9X5qQuCxZFzPEJgi9VKiYV9+klP2M/yKlIeDFGsTKODRa
	I1oqUretSAcKi7RVoXq+CqB4Xaf7LAHm5p1HDtqfPJ+XO9
X-Received: from wmqy18.prod.google.com ([2002:a05:600c:3652:b0:490:b027:8bb9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:630f:b0:490:b025:f324
 with SMTP id 5b1f17b1804b1-490b60e41a8mr143581645e9.32.1780585938337; Thu, 04
 Jun 2026 08:12:18 -0700 (PDT)
Date: Thu,  4 Jun 2026 17:11:54 +0200
In-Reply-To: <20260604151151.150377-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260604151151.150377-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2917; i=ardb@kernel.org;
 h=from:subject; bh=+nQFwh3CCsb7IAFs5SOeV7aCtFUyymbKVrG/Mwiho9M=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtx6m7dg9qWn6/VJZ78s+l3vpXFFt7VC30979V9nqc9P
 1tdomhLRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiIw0dGhrM7xP2fXFe4euWa
 //b3O56+//xxnfLj+G9zPq77arNLWpSd4b9Xz73Vdi+21bFqc1b76n67W/NR6slK4eM/Y+W2nsr 4eoQXAA==
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260604151151.150377-9-ardb+git@google.com>
Subject: [PATCH v2 2/5] kasan: Move generic KASAN page tables out of BSS too
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_161220_710447_05BB1175 
X-CRM114-Status: GOOD (  13.11  )
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

Make sure that all KASAN page tables are emitted into the .pgtbl section
(provided that the arch has one - otherwise, fall back to page aligned
BSS)

This is needed because BSS itself is no longer accessible via the linear
map on arm64.

Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: kasan-dev@googlegroups.com
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/linkage.h |  4 ++++
 mm/kasan/init.c         | 10 +++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/linux/linkage.h b/include/linux/linkage.h
index b11660b706c5..53fe1f48fd28 100644
--- a/include/linux/linkage.h
+++ b/include/linux/linkage.h
@@ -39,6 +39,10 @@
 #define __page_aligned_data	__section(".data..page_aligned") __aligned(PAGE_SIZE)
 #define __page_aligned_bss	__section(".bss..page_aligned") __aligned(PAGE_SIZE)
 
+#ifndef __bss_pgtbl
+#define __bss_pgtbl		__page_aligned_bss
+#endif
+
 /*
  * For assembly routines.
  *
diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index 9c880f607c6a..66a883887987 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -26,10 +26,10 @@
  *   - Latter it reused it as zero shadow to cover large ranges of memory
  *     that allowed to access, but not handled by kasan (vmalloc/vmemmap ...).
  */
-unsigned char kasan_early_shadow_page[PAGE_SIZE] __page_aligned_bss;
+unsigned char kasan_early_shadow_page[PAGE_SIZE] __bss_pgtbl;
 
 #if CONFIG_PGTABLE_LEVELS > 4
-p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D] __page_aligned_bss;
+p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D] __bss_pgtbl;
 static inline bool kasan_p4d_table(pgd_t pgd)
 {
 	return pgd_page(pgd) == virt_to_page(lm_alias(kasan_early_shadow_p4d));
@@ -41,7 +41,7 @@ static inline bool kasan_p4d_table(pgd_t pgd)
 }
 #endif
 #if CONFIG_PGTABLE_LEVELS > 3
-pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD] __page_aligned_bss;
+pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD] __bss_pgtbl;
 static inline bool kasan_pud_table(p4d_t p4d)
 {
 	return p4d_page(p4d) == virt_to_page(lm_alias(kasan_early_shadow_pud));
@@ -53,7 +53,7 @@ static inline bool kasan_pud_table(p4d_t p4d)
 }
 #endif
 #if CONFIG_PGTABLE_LEVELS > 2
-pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD] __page_aligned_bss;
+pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD] __bss_pgtbl;
 static inline bool kasan_pmd_table(pud_t pud)
 {
 	return pud_page(pud) == virt_to_page(lm_alias(kasan_early_shadow_pmd));
@@ -65,7 +65,7 @@ static inline bool kasan_pmd_table(pud_t pud)
 }
 #endif
 pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE + PTE_HWTABLE_PTRS]
-	__page_aligned_bss;
+	__bss_pgtbl;
 
 static inline bool kasan_pte_table(pmd_t pmd)
 {
-- 
2.54.0.1032.g2f8565e1d1-goog


