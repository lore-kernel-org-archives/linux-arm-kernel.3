Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D98610ED64A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=seTWwXkopHCFQH4qNJ5KGWFEAy5p+6D4jhEUPgOpMvo=; b=u0QexAjSGf4LC3sAWZkGtugxk+
	UfR8ATYMVcZezji2Gw8GoAgh73vkNYI45wU+EO9kSHR0RLdWCFVhDbiukSWsgHceujOELX56YBNsk
	v3YmcQmVbkTwkt48YCsHavxQR4YJr+80r7d93CXQbasmcBGlZshKuBDjSKJjlKmQ942jAmVNpThN1
	QeGyhRzVhCVxIgs9OfOxXl+PFBy79SkFOWWuHhtr5UvDWN2gqbyeG1rmy0DaT9Y+yBgTrj1QevwDS
	rdLrJSMEeJGd2PSAVe+tRISM6mEs54f7xWaXyqfR00JO7WoTIq5QUN4SfVAlEUCx8e6AaJJrtXN/T
	Pelcewpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65PQ-00000007ECp-02A6;
	Fri, 27 Mar 2026 11:31:24 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65PI-00000007E7T-0uNU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:31:17 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-6681cd18f53so2074160a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 04:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774611073; x=1775215873; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=seTWwXkopHCFQH4qNJ5KGWFEAy5p+6D4jhEUPgOpMvo=;
        b=A4qSwjzquVL5v1LPV94pQQstf3rHcygW9r20uVDEk2PumA7Dmp7D/1k6RVPah7dkZv
         1Tf8jlrSMnu3y9SAShEx9vw8ebTwScUa825SjfJLMByOl8fWJGPNlQSHDLDCGrVVrmfQ
         CPS5vlS7PVF6fVSgxXVXnve1uINt8ATMv4mgb28zm2uEtY9nkwTxm4eamyVgcmTzpaVG
         fmYs716Xs+PWWtZ2SrEW/WaFIdfitl/hz0IIklWH7KFwh3VKG31AGfhl9JkDCYza62jc
         g2RE+BAEMCQc5XFIA5ixHCalVZm7+Z0oEC03I002okP6tYV5kR056/kEN07D/t/JPlK6
         dB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611073; x=1775215873;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=seTWwXkopHCFQH4qNJ5KGWFEAy5p+6D4jhEUPgOpMvo=;
        b=PldziBgWFh9MpQqqDswabSglnKTeVYY5LIhRvpv4PelkoO7HhKEmb3HTVrNs9EpfVo
         RZtopC96u2h3T/Fo9bacupo9/7EowpEbK4pefOoFB0qEVYOAsBeR83FV3+BwAnA1KRXB
         6A00I5DeQJwCIzo3qNG3KPJ7rBZstTHdpNwBrLMo7hYM6EMeL2tX3KlC0+FZbGx5PZK6
         gBEkKe1xfjekP5iGHckPfHbgMXkCSZVBR9PjgBWV/sNfk/JgFRIeuN4EfBxBHpT+moFd
         nypDlJCM//6nnyErjDRgDllY0/5LtDSP0I/ha6/l1YDeGzthInDYuqTlqdoCv6dZYOZ1
         v3mQ==
X-Gm-Message-State: AOJu0YwYoeXxnAOaRdwMbesYttxGaJaV5rVqN9yCUA5DcRUhV5f53xF0
	+be8SleShGxkY79FhyVbqdXEvNJjnYO3dbtpotKiyA/XGBq83lEzfJQ6Xgx8hzqbpYsfEi66fQ=
	=
X-Received: from edf13.prod.google.com ([2002:a05:6402:21cd:b0:65c:72cb:9cb6])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4403:b0:66a:7888:eb25
 with SMTP id 4fb4d7f45d1cf-66b28b565e5mr1539633a12.14.1774611073181; Fri, 27
 Mar 2026 04:31:13 -0700 (PDT)
Date: Fri, 27 Mar 2026 12:30:49 +0100
In-Reply-To: <20260327113047.4043492-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260327113047.4043492-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2728; i=ardb@kernel.org;
 h=from:subject; bh=pWCvbcZutt7tsEk4C4u4+maMWpN4r9I10BVKJhnTMSU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfNYVuaEiz1G8vFRB9b5u280vOp8ffOl8KC/3TP2tPQz5
 QUIXhPrKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNJF2f4n7Asa8a/xeF/madr
 v1uZN+2g8/Z7c87EyEit0qy/f8RocirD/6wDV3o2P/LwmVPy54Vx/Z2wX5uaY79ubfq9r8/JJ+d dHCMA
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260327113047.4043492-8-ardb+git@google.com>
Subject: [PATCH 1/5] ARM: Add a neon-intrinsics.h header like on arm64
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-raid@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043116_278691_A85EF425 
X-CRM114-Status: GOOD (  16.35  )
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

Add a header asm/neon-intrinsics.h similar to the one that arm64 has.
This makes it possible for NEON intrinsics code to be shared seamlessly
between ARM and arm64.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/include/asm/neon-intrinsics.h | 64 ++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/include/asm/neon-intrinsics.h b/arch/arm/include/asm/neon-intrinsics.h
new file mode 100644
index 000000000000..3fe0b5ab9659
--- /dev/null
+++ b/arch/arm/include/asm/neon-intrinsics.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_NEON_INTRINSICS_H
+#define __ASM_NEON_INTRINSICS_H
+
+#ifndef __ARM_NEON__
+#error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
+#endif
+
+#include <asm-generic/int-ll64.h>
+
+/*
+ * The C99 types uintXX_t that are usually defined in 'stdint.h' are not as
+ * unambiguous on ARM as you would expect. For the types below, there is a
+ * difference on ARM between GCC built for bare metal ARM, GCC built for glibc
+ * and the kernel itself, which results in build errors if you try to build
+ * with -ffreestanding and include 'stdint.h' (such as when you include
+ * 'arm_neon.h' in order to use NEON intrinsics)
+ *
+ * As the typedefs for these types in 'stdint.h' are based on builtin defines
+ * supplied by GCC, we can tweak these to align with the kernel's idea of those
+ * types, so 'linux/types.h' and 'stdint.h' can be safely included from the
+ * same source file (provided that -ffreestanding is used).
+ *
+ *                    int32_t     uint32_t          intptr_t     uintptr_t
+ * bare metal GCC     long        unsigned long     int          unsigned int
+ * glibc GCC          int         unsigned int      int          unsigned int
+ * kernel             int         unsigned int      long         unsigned long
+ */
+
+#ifdef __INT32_TYPE__
+#undef __INT32_TYPE__
+#define __INT32_TYPE__		int
+#endif
+
+#ifdef __UINT32_TYPE__
+#undef __UINT32_TYPE__
+#define __UINT32_TYPE__		unsigned int
+#endif
+
+#ifdef __INTPTR_TYPE__
+#undef __INTPTR_TYPE__
+#define __INTPTR_TYPE__		long
+#endif
+
+#ifdef __UINTPTR_TYPE__
+#undef __UINTPTR_TYPE__
+#define __UINTPTR_TYPE__	unsigned long
+#endif
+
+/*
+ * genksyms chokes on the ARM NEON instrinsics system header, but we
+ * don't export anything it defines anyway, so just disregard when
+ * genksyms execute.
+ */
+#ifndef __GENKSYMS__
+#include <arm_neon.h>
+#endif
+
+#ifdef CONFIG_CC_IS_CLANG
+#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
+#endif
+
+#endif /* __ASM_NEON_INTRINSICS_H */
-- 
2.53.0.1018.g2bb0e51243-goog


