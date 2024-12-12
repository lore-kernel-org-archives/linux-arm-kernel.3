Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410B4E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1eR/nZYWDy7JnUFA+IXxK3QIAKZs/ki75z6WryhmEE=; b=45jbliquIyLjNJaPs1dE00sVvo
	fAs4c4mD9WpoEmFitF/qEqT0bkBc5sTbfr1A4eQUfr15lCLsziEUJpj8DNok9dQFGGYex3WH4NMoJ
	wXCfZiJdzZBzUilyMUetzuWojh9eIxu3GKky4DJKImBg7oKEiXbom3vqh3t5zNMJ48Xey3rxUX5yW
	X9Hcbyz6oLssx0wmMNoVANoh3BuhzhFy7xp/rONiYt6pZFNT4T5NMy1JYEELA5x+tBzc4+RBeqkqk
	mbC5oj0PQ2EmB6SjQyuJxRbO45Z4QmUME6Uw3cNxdlbgfL2wM2KQjkC7njIgv1kAk1cbYakNTuaI2
	OxHpoOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeSH-0000000HHae-02rh;
	Thu, 12 Dec 2024 08:21:53 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLePV-0000000HGiU-3wG7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 08:19:02 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361eb83f46so2860365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 00:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733991539; x=1734596339; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o1eR/nZYWDy7JnUFA+IXxK3QIAKZs/ki75z6WryhmEE=;
        b=y1TzEsh6i/WPS8bZB/wO6sNRt1tDMidjxWCvG2c3kcO5S3FUYNa7ANX5/gICbmkQtH
         PKXoLeWQpRU00u69Ku79pv1vwTM31zdY97x00uYSwYwCP/pVb41pnB8jDnBY06VqMhIV
         alSxi6JwDrUXSQhGblASKXTpkBthjmDMxp/Pnggx8Dz6ELyeVWwyYSeepOuzc0t/zwrL
         1XGjMXULVhOYdhVHZEXhOvABhO2UqtSIO5hoHPHwn+b+0RIxNwbEIdcXLOO2jNC4o/mJ
         aZvnkYCl5wK8GzgDVRx+LGgsSdC3+nA4WOteE5APT6+k9exRzJluwoh1m0HdDamYgeKs
         kGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733991539; x=1734596339;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1eR/nZYWDy7JnUFA+IXxK3QIAKZs/ki75z6WryhmEE=;
        b=fI856UE8lc8FAmG/eR2cKXMH7fI4rwpTSccJmfnTPsT3zkTuYWE46vvqBbHlrfRq0x
         PjOFDOL99ds3Yjh7+M9pRpAIkjdx7vZEH27CRrV4xzvujkOOtkqyfEm8F2Ykml6UoKEU
         O1ogthjTLsboGKUUdOgE26Wi9uirveYiqiRPvdtU/J7JfoPdn2zsszktRXAuuKU/62NT
         /Uj1HXTNKL9NQJWSeT6yfFPTB1P6lghO4M9zjpbuRS2JlwDfkZsXCnTZK5d3XnSvZZd0
         bxNVw+9rf2fLIyWKwJu7N/7dV5UgzL4xE9sPbTMrGjlOzRMTROMDhsD4L2Et9jXkjhPS
         2q+Q==
X-Gm-Message-State: AOJu0YxQXvyDgnZY9Vv0wsN7xfnGX5l1LUNEP8pegvWjt0RoUlThi8Ix
	5S+o7QA7T9axfSTfRH0J+z4vyhRi8rdfmHi8fz1m5JpafnaklyAXKrPvvf2PBWHTBh6qFQd6rXI
	8GbWakO46lrKgp1PWJBO4NdB2K+CBWxfiU1AXTkcP3Cr1rgm4aSRvdjnQKHIYB7rU//9q2dRvtC
	Trv/hBgcWU3eD1WhGMlJXkZirUtasqTh5AnKVRew+M
X-Google-Smtp-Source: AGHT+IGFCr+ILtDVl2I89l402u827GSiQNpyuMXKvIlTJVWCnPRqtE/rGoww4lT3RPPpvSl62IgYuB0T
X-Received: from wmbjl17.prod.google.com ([2002:a05:600c:6a91:b0:434:f1d0:7dc9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3acf:b0:434:f8a0:9dd8
 with SMTP id 5b1f17b1804b1-4361c345006mr43908945e9.1.1733991539243; Thu, 12
 Dec 2024 00:18:59 -0800 (PST)
Date: Thu, 12 Dec 2024 09:18:43 +0100
In-Reply-To: <20241212081841.2168124-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241212081841.2168124-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3310; i=ardb@kernel.org;
 h=from:subject; bh=6f63k+zdnDPwoV97pZOXKmLYrRvOc+ffRW8gf6CiYQc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT1qTrKo0a3oN1wHTtdf0f30szBTp23N+v4dx//IP2pct
 76saO2UjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjAR0Q+MDPfPvVh+Tmqatu21
 lEWKL1c0BX40+O93iFvmyIV32WHP6nkZGeYtYw8WiPs7dbfhv+4oo5aJWVEfv7yODYy2tFBMnl5 RwgsA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212081841.2168124-9-ardb+git@google.com>
Subject: [PATCH v3 1/6] arm64/mm: Reduce PA space to 48 bits when LPA2 is not enabled
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_001901_976998_AFCD9CE4 
X-CRM114-Status: GOOD (  15.68  )
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

Currently, LPA2 kernel support implies support for up to 52 bits of
physical addressing, and this is reflected in global definitions such as
PHYS_MASK_SHIFT and MAX_PHYSMEM_BITS.

This is potentially problematic, given that LPA2 hardware support is
modeled as a CPU feature which can be overridden, and with LPA2 hardware
support turned off, attempting to map physical regions with address bits
[51:48] set (which may exist on LPA2 capable systems booting with
arm64.nolva) will result in corrupted mappings with a truncated output
address and bogus shareability attributes.

This means that the accepted physical address range in the mapping
routines should be at most 48 bits wide when LPA2 support is configured
but not enabled at runtime.

Fixes: 352b0395b505 ("arm64: Enable 52-bit virtual addressing for 4k and 16k granule configs")
Cc: <stable@vger.kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable-hwdef.h | 6 ------
 arch/arm64/include/asm/pgtable-prot.h  | 7 +++++++
 arch/arm64/include/asm/sparsemem.h     | 5 ++++-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index c78a988cca93..a9136cc551cc 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -222,12 +222,6 @@
  */
 #define S1_TABLE_AP		(_AT(pmdval_t, 3) << 61)
 
-/*
- * Highest possible physical address supported.
- */
-#define PHYS_MASK_SHIFT		(CONFIG_ARM64_PA_BITS)
-#define PHYS_MASK		((UL(1) << PHYS_MASK_SHIFT) - 1)
-
 #define TTBR_CNP_BIT		(UL(1) << 0)
 
 /*
diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 9f9cf13bbd95..a95f1f77bb39 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -81,6 +81,7 @@ extern unsigned long prot_ns_shared;
 #define lpa2_is_enabled()	false
 #define PTE_MAYBE_SHARED	PTE_SHARED
 #define PMD_MAYBE_SHARED	PMD_SECT_S
+#define PHYS_MASK_SHIFT		(CONFIG_ARM64_PA_BITS)
 #else
 static inline bool __pure lpa2_is_enabled(void)
 {
@@ -89,8 +90,14 @@ static inline bool __pure lpa2_is_enabled(void)
 
 #define PTE_MAYBE_SHARED	(lpa2_is_enabled() ? 0 : PTE_SHARED)
 #define PMD_MAYBE_SHARED	(lpa2_is_enabled() ? 0 : PMD_SECT_S)
+#define PHYS_MASK_SHIFT		(lpa2_is_enabled() ? CONFIG_ARM64_PA_BITS : 48)
 #endif
 
+/*
+ * Highest possible physical address supported.
+ */
+#define PHYS_MASK		((UL(1) << PHYS_MASK_SHIFT) - 1)
+
 /*
  * If we have userspace only BTI we don't want to mark kernel pages
  * guarded even if the system does support BTI.
diff --git a/arch/arm64/include/asm/sparsemem.h b/arch/arm64/include/asm/sparsemem.h
index 8a8acc220371..84783efdc9d1 100644
--- a/arch/arm64/include/asm/sparsemem.h
+++ b/arch/arm64/include/asm/sparsemem.h
@@ -5,7 +5,10 @@
 #ifndef __ASM_SPARSEMEM_H
 #define __ASM_SPARSEMEM_H
 
-#define MAX_PHYSMEM_BITS	CONFIG_ARM64_PA_BITS
+#include <asm/pgtable-prot.h>
+
+#define MAX_PHYSMEM_BITS		PHYS_MASK_SHIFT
+#define MAX_POSSIBLE_PHYSMEM_BITS	(52)
 
 /*
  * Section size must be at least 512MB for 64K base
-- 
2.47.1.613.gc27f4b7a9f-goog


