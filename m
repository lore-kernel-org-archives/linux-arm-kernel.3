Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12ABD2E9C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 08:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdRnYA4Dp/HKDbLf8iEX384rtZ3sORsc5iDaybCR36k=; b=lYKa1A/pUxGXR6yWdOzx1uW55V
	Lf2y6QYxbh49/i+h5eFc6K/ja/Jtfq6XLZo7QScpLqJEOzBaPZmcmGLlK+3kBzFo9NK5CcqSYriAv
	ngHbabRZmFykCjLKQgZerXfIzU3mvZxIdIzZBr1oAQ4G7uAbRt4T8PX/KMyVe2Q1F4IIcrGPItxc/
	WVkzOdn0Ep9V67KYuRS8tUCtElU/6WjpNkY1ZYYXHMzm7aK0ZXqquqijxI2ncNOLJC3s6FOmmW68m
	iV0fNa9Y1xM6DVdB23fwCTWkeNOFznjaC1ncphkyCqxlZ1fO20QONcUzeEAmHrW65X1kp8uzBG6SP
	BHdzvyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPxa-0000000GpzI-2svR;
	Mon, 11 Nov 2024 08:39:46 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPtw-0000000GpNB-1xru
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 08:36:02 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e30cf121024so7090656276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 00:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731314157; x=1731918957; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jdRnYA4Dp/HKDbLf8iEX384rtZ3sORsc5iDaybCR36k=;
        b=3EqZuKTZrTa/ckJVMI2VkFkqSNRnasVbdHWhHMn+P8YQcDqXME/Oa0pg+Gr4+XiEHg
         oCNtiWVcsrPPV/BJ0BqjNniTo2ZHh7wU8LVFnaeUTs5B9j9FJOgFn76GL4rGlJjDJspx
         Nxn1U+itR4dk3Ns3aykK/XG7vWQuCnYEEi7KpGLSCB4zJe9DHjnV7Exi9muXKSc3Ro6D
         ajWrqkHYqzFYdNoiQ2ERLSaHGNE1H7D3HJFiRxDOsvAPMU/mP4ss/dpPTenD46IpWVun
         18jH+VKy9gwmt4SBvT9oCL1PEIu5c6ZN8gAKwR0vxEY4gXKhZbiBYytNpaQTBoPWOvlx
         781w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731314157; x=1731918957;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdRnYA4Dp/HKDbLf8iEX384rtZ3sORsc5iDaybCR36k=;
        b=UxPTvAJkRfASbDiSRwCIDICDj0Xe2ucwatfSsASwAbVDxLWddtx7SxaJwuPvzoMg+4
         8UE08gT/nqJaK5/5Vq+jTc0OcLSDkMn8tx0skxpp1TWIUIYMyrODCcTINm4LmoN+4kji
         uaUTHacIjp1aGyIxzwI6AJtDBhUSC4PDeTYkrw5i/uXESgQYmgONcuiiOQDSG/cQXMGS
         N5h/vHUflH0awsfnpg8+7jRe2gWGWPPkrqAkdLlyTwZ3Rcq2e1JtvvdFT2Oyy1EmRnaz
         Ao+FaH1f9KPxpErboVLCBAID90155VKWxLWSLFrWnqhojcZMNDn7b0LoBvkTqThRF49O
         zH8g==
X-Gm-Message-State: AOJu0Yz3RnXD2ngWt1tWr7GKLa8tGXKzhZUgicSG+fUGfvlSf1AK3IQW
	cjYCBq++HlVVcYRFmJw4T4zyBH72jyVJI+5BgSj6psZNfksIAsEWL5CZIswvOb/lOH0ju8Cw+0+
	FDQccRb+KbjgwAgo6qjeyDXi+INMlfLXj4MUpfVAWmnlwhs+lWyqzxaF/jmh4ECM+ixZn0gfzce
	UEbaNdeojYWwkgEmbF5zKc0CsnNdop1FL5swKpbl4+
X-Google-Smtp-Source: AGHT+IEhAd1ZYt2KUoU4K2QDCIjo6LctpoeG1kVqzvVn0qTYE0SJcqJsrkLHh8WG4AcoXgHHmsa2YvUF
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:c7cf:0:b0:e28:fb8b:9155 with SMTP id
 3f1490d57ef6-e337f8e8d9fmr19018276.9.1731314156955; Mon, 11 Nov 2024 00:35:56
 -0800 (PST)
Date: Mon, 11 Nov 2024 09:35:45 +0100
In-Reply-To: <20241111083544.1845845-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241111083544.1845845-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3161; i=ardb@kernel.org;
 h=from:subject; bh=TQ6skMuf6HwA53KOOzLH55jf3veEJQFpWOO2ik/HsBo=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JId3w4MN7c/r4xb+212w9/UK9/v7xGy5zfjLLhXUusGL9v
 Ce78nhsRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI7Q0M/zPSfD9stF61bcvv
 gOLaRwocrAs92kUdV719F//36YSD+ycyMrRekNqwdgurp5Z8d5mbiXmHVsPsopc2D7Jall/YM29 OCiMA
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241111083544.1845845-9-ardb+git@google.com>
Subject: [PATCH 1/6] arm64/mm: Reduce PA space to 48 bits when LPA2 is not enabled
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <keescook@chromium.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003600_535986_021D78AF 
X-CRM114-Status: GOOD (  14.56  )
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

Currently, LPA2 support implies support for up to 52 bits of physical
addressing, and this is reflected in global definitions such as
PHYS_MASK_SHIFT and MAX_PHYSMEM_BITS.

This is potentially problematic, given that LPA2 support is modeled as a
CPU feature which can be overridden, and with LPA2 support turned off,
attempting to map physical regions with address bits [51:48] set (which
may exist on LPA2 capable systems booting with arm64.nolva) will result
in corrupted mappings with a truncated output address and bogus
shareability attributes.

This means that the accepted physical address range in the mapping
routines should be at most 48 bits wide when LPA2 is supported but not
enabled.

Fixes: 352b0395b505 ("arm64: Enable 52-bit virtual addressing for 4k and 16k granule configs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable-hwdef.h | 6 ------
 arch/arm64/include/asm/pgtable-prot.h  | 7 +++++++
 arch/arm64/include/asm/sparsemem.h     | 4 +++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index fd330c1db289..a970def932aa 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -218,12 +218,6 @@
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
index 8a8acc220371..035e0ca74e88 100644
--- a/arch/arm64/include/asm/sparsemem.h
+++ b/arch/arm64/include/asm/sparsemem.h
@@ -5,7 +5,9 @@
 #ifndef __ASM_SPARSEMEM_H
 #define __ASM_SPARSEMEM_H
 
-#define MAX_PHYSMEM_BITS	CONFIG_ARM64_PA_BITS
+#include <asm/pgtable-prot.h>
+
+#define MAX_PHYSMEM_BITS	PHYS_MASK_SHIFT
 
 /*
  * Section size must be at least 512MB for 64K base
-- 
2.47.0.277.g8800431eea-goog


