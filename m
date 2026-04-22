Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2190EFA1FDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1KAxfG6BFXtsRWghQ1pcNf8ys+JfrNCOwRGJsq7foU=; b=QSRTm59pU3FZ/JXSHvaAeWTvAa
	t2WV0F1jr9rM+sKZ6yeaCgwdTlf8YWIWV+uVu7QU2tV8mxCBIVBOoeRJbml2LAweBCVzg70YC167J
	CrsaPWltiicMSH3pdWcSy/ZAxNcUY0OJSliz/xdLFgptF91jq7q1zzyDINGv7NEG7klWqI0m3QXuD
	AjdmVxqNFkLToOuDI8XeWORS482j54eYa6EdReEfW4RPI4V+/cP1ApMh7hcqdo5Omir0Qjr12uZIQ
	7Cc2lWK9Ly8zKTzFCEQ9iW7Uh90ZnXmGLA5sr3umXJBuli0fndpbI8UZWnrGy+zNrwS9+5xpLarIc
	SI0ZHu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCp-0000000AYjO-3lQZ;
	Wed, 22 Apr 2026 17:17:43 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCY-0000000AYWv-37Kr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:17:29 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43d77286244so3770068f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 10:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776878244; x=1777483044; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w1KAxfG6BFXtsRWghQ1pcNf8ys+JfrNCOwRGJsq7foU=;
        b=Kf/c26sPDI9xaVQqxqW+gg+pfB1MrDEfNJ29DcZ4tyQSV9q0o+42YDGsPTRLYfK6m+
         CIWpUWC/QXf8ueKzP0aBU9K1EUPf73C92LwJP1DQDsjg2cwF28b6CEuMJssZRP6zua5M
         jywm2tD1v9a23CHLRhPu8TpIpl64h1eK2I4u+c4NphNQOSjtsmZRaIWX0vTxDHcbevAR
         FfTvGBuHCPMAW2KrEgsbpw8nrXqlpS/21OxkEjqCQcmYK5G+IRvV1qdfqrJt6HDtppAy
         nBRPybeD3C/cJ0jvevNrUN9M0x/IX7aVJKpschJZp1uqmVM9N8t/P69SMa0RhNIgTTuV
         xuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776878244; x=1777483044;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1KAxfG6BFXtsRWghQ1pcNf8ys+JfrNCOwRGJsq7foU=;
        b=WIPro6HiV3Ohs0VyHwkaPS2i41y8aDzWBDkgKo4Ha9BOsW3I+sAIya5Wo7uVv+dbRN
         jpMKj9+po5j4cJ4mYPaghlF6QqMWSCNZfj8fx75quC6HbrbouNEMl4SSjmqdNqRzQT4j
         IDtXeRFJKCk+gnVMEBdQZU4gvJP1XmcpvaHPUgjwWUcst4MYV5UlJsicPYbleE3nuxD7
         B3gvWn/aFik/f2qZyvZ5r9dMGlPY3Bh09yYkVEH/dND7tA5rsFRieWvqf0V4n1dYpt9r
         QMRVGmOUtKUrz3hi0I/y9Asiis7aTLlFc00FWLOToSDnD0c1eiMePu/uv0iTz+kTzodA
         qXDw==
X-Gm-Message-State: AOJu0YxBe5NndmTeQZnW3JrIUdkczJXUsbYAHXwfo+MI/YDLzB6G7BuU
	i6RpxqYsA8rCbE77EO9XjOuANuLFcq+zh8fAZWigqYIZytU/5+xbIbT07d3oQ8NEUCGOIDyhYQS
	eMUGLNXBPcOwhtdqSUpEOsFYNq+cuMRb+w/y5n8+NYIwMlZAzi1J0+Gg0lyqQrW0pvdxEhBIixH
	YpfV7KBd+T8RfXK0lmDaVJhvxeu4LpBpvH0s2wiKPboxo0
X-Received: from wrmy2.prod.google.com ([2002:adf:e6c2:0:b0:43d:780a:6fbd])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1785:b0:43c:fc5c:a9fe
 with SMTP id ffacd0b85a97d-43fe3dbf4e7mr36040481f8f.20.1776878244159; Wed, 22
 Apr 2026 10:17:24 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:17:04 +0200
In-Reply-To: <20260422171655.3437334-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20260422171655.3437334-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2395; i=ardb@kernel.org;
 h=from:subject; bh=koeyEC8RTAmtOu/HBUQeDz+lw7UQyz/6JF7WLaYxDho=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfMl0xQzr0KxmdZfvl+P5DSYP6tiwby57XVLbdaKvFJYd
 TqAx5i7o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEwk6Ssjwx2t741yoiGzA79V
 zeB3urdbxE9y8gYlxXWrAoTv+nRN5mRkeGwV3VUkElTDfrf232l2DlXJ7kYRmd57Vp+fq1xdz/a DBwA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260422171655.3437334-18-ardb+git@google.com>
Subject: [PATCH 8/8] ARM: Remove hacked-up asm/types.h header
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_101728_179502_9685AE8D 
X-CRM114-Status: GOOD (  16.62  )
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

ARM has a special version of asm/types.h which contains overrides for
certain #define's related to the C types used to back C99 types such as
uint32_t and uintptr_t.

This is only needed when pulling in system headers such as stdint.h
during the build, and this only happens when using NEON intrinsics,
for which there is now a dedicated header file.

So drop this header entirely, and revert to the asm-generic one.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/include/uapi/asm/types.h | 41 --------------------
 1 file changed, 41 deletions(-)

diff --git a/arch/arm/include/uapi/asm/types.h b/arch/arm/include/uapi/asm/types.h
deleted file mode 100644
index 1a667bc26510..000000000000
--- a/arch/arm/include/uapi/asm/types.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_ASM_TYPES_H
-#define _UAPI_ASM_TYPES_H
-
-#include <asm-generic/int-ll64.h>
-
-/*
- * The C99 types uintXX_t that are usually defined in 'stdint.h' are not as
- * unambiguous on ARM as you would expect. For the types below, there is a
- * difference on ARM between GCC built for bare metal ARM, GCC built for glibc
- * and the kernel itself, which results in build errors if you try to build with
- * -ffreestanding and include 'stdint.h' (such as when you include 'arm_neon.h'
- * in order to use NEON intrinsics)
- *
- * As the typedefs for these types in 'stdint.h' are based on builtin defines
- * supplied by GCC, we can tweak these to align with the kernel's idea of those
- * types, so 'linux/types.h' and 'stdint.h' can be safely included from the same
- * source file (provided that -ffreestanding is used).
- *
- *                    int32_t         uint32_t               uintptr_t
- * bare metal GCC     long            unsigned long          unsigned int
- * glibc GCC          int             unsigned int           unsigned int
- * kernel             int             unsigned int           unsigned long
- */
-
-#ifdef __INT32_TYPE__
-#undef __INT32_TYPE__
-#define __INT32_TYPE__		int
-#endif
-
-#ifdef __UINT32_TYPE__
-#undef __UINT32_TYPE__
-#define __UINT32_TYPE__	unsigned int
-#endif
-
-#ifdef __UINTPTR_TYPE__
-#undef __UINTPTR_TYPE__
-#define __UINTPTR_TYPE__	unsigned long
-#endif
-
-#endif /* _UAPI_ASM_TYPES_H */
-- 
2.54.0.rc1.555.g9c883467ad-goog


