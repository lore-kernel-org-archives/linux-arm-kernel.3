Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8685E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=868ek3X6u4wRrG0oHFhQmnPTH1x/NJzHXmqaE0ZFvxc=; b=l4/K22rWS1NpYPqhRNr48s14Ei
	3PUxjmrOF5namSEFPBGFnQF4FvIcCXfQQHBwJZoyc+Wn0fl9bZojGOUNW+ObuFO7lgkG35QR7J4vx
	LgDPJYsv3cF/Facfs/WYb1v03aksfTit5XzIKmdr76wr4pvJ9fUrhRREfW0aofT+pmc7oOIcd4i/X
	G6dUA31c2EhOlrjGLrwaqK6gGSrr0XquYoI7q1+gwP8XeFi+LtdJiJlnZY2Y0YKmP4mI+afqPHRNm
	zodS+a/oKNSd3frTqhfiG+QWmACg0ySaB9bWyQqocyJvob62DrIhd453OzNX/+GRtIWgEi2u1nLQ8
	rxNc5gdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDPx-0000000GSAV-1yEg;
	Thu, 05 Dec 2024 15:05:25 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDNx-0000000GRgj-0R1W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 15:03:22 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-434a0d30c06so10973035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 07:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733410999; x=1734015799; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=868ek3X6u4wRrG0oHFhQmnPTH1x/NJzHXmqaE0ZFvxc=;
        b=minVbAUrk1RPP7EaUK9r/R4q7vIPlS62Z0gYGnByK2c3b3nTyUCalZd1E9XRS05GK4
         xNxkZqnIhWnf7otwgi41KZxeZ9QGX1vOgHqAI8V4yA10CXF89uly2NrS1oy3Cin8ut9b
         oowPmSdeRTzAF1T6KQFx1lssVEaqClzI/jFxIhkV29K7CXULnMJnmRdkeSOGg0Vp9dUL
         We1+oznMYthyS06tlfmb7aGN3XK6rZ5cj1ze1ROHblQqQdgV/MAl0H27puPVz4aK+V+6
         pgSCpLok3HE2Cpd1XMlutJexVGUQl0D8xRiGI9oUBgE9a3xGB5oG/Iy8k+q5LQL11bhl
         qQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733410999; x=1734015799;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=868ek3X6u4wRrG0oHFhQmnPTH1x/NJzHXmqaE0ZFvxc=;
        b=af0MlSM2INhHXAbQi+Mk5PLMWQgSLDGR57pNe5DBN8ukyOgLIO90sOiFW620ic3i6e
         Pm6JxjpHWJJH39qu0N2+r8GQ2ZrS7vLlsKDhjbsoIbC25rnB/gHMuQZlxOQWWHrEp54G
         Y5RoowoURe03A6Z6kdhydKnUXYKsfjJeuuqHaqiyMDhEDMwplgqe9z9lnXAgJgwRoq0i
         q7Pkwd9XVPAD6+bK8nFA7UJhO9HErgJ+5t/os5h0doQAp/VoX5RbBEYKUMohUCu2Jq3A
         ohuABUY1C34C45N18ndHQiC+paBXdSMN/IhQIfM8O9vohKdOc5PZPY9Zlev0XKYpdk8e
         c0YQ==
X-Gm-Message-State: AOJu0Yw3aIB9QiZfA9bsklkea/zRdx5H7Jya2kOUAxITs7TlR0qIp+TT
	rxK0mALj3HFZSeVb0aQ2bqQd4/UiEa6/fPzq5+qTweh8vfYdZgIvskYTh0sRRgFBNv1POjT/D50
	MIivAeuGPua7ht2+nbJ4yPr8g/NarWZV6Mf9dtexzvAJvfa/zyKqtPD5knySzYKt5faw/rIQ5Xm
	j/ZpojQ2zOOup2/mVmkoDOKzMOo5mIQm/M/0jqkUAj
X-Google-Smtp-Source: AGHT+IEG8OdMIDHFN7BUBJAGkuap4dQ3axovj/9FC8JwI5LK95PEfR5lpTW79KuGQFQy/XnCwcquwtPB
X-Received: from wmgp6.prod.google.com ([2002:a05:600c:2046:b0:431:4a1d:9d5a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45c7:b0:434:9fca:d6c3
 with SMTP id 5b1f17b1804b1-434d927b20emr27344225e9.9.1733410999429; Thu, 05
 Dec 2024 07:03:19 -0800 (PST)
Date: Thu,  5 Dec 2024 16:02:31 +0100
In-Reply-To: <20241205150229.3510177-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20241205150229.3510177-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3266; i=ardb@kernel.org;
 h=from:subject; bh=ho24jy35KD5ehFP+fzUCJpH+Gg46J3THWKKypOQTSx0=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIT3wQEfwrFkhzsd2ntqTcPtRdv+2yreNh1y+9XlrvdiSO
 y1lvqZpRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhIiCDD/6wVApcSX55aF+ik
 vHSG+oEpuW8+XP+pxmdfp1H0v7HzrjojQ2dLf2C4mEjmxTXJ96+d7/p/uXi2xYGkGbEtep9bEnw v8gAA
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241205150229.3510177-9-ardb+git@google.com>
Subject: [PATCH v2 1/6] arm64/mm: Reduce PA space to 48 bits when LPA2 is not enabled
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>, 
	Quentin Perret <qperret@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_070321_141359_8B74247D 
X-CRM114-Status: GOOD (  15.14  )
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
 arch/arm64/include/asm/sparsemem.h     | 4 +++-
 3 files changed, 10 insertions(+), 7 deletions(-)

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
2.47.0.338.g60cca15819-goog


