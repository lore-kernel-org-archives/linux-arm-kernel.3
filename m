Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6AA10ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmZT00Ychy/3NTwgfmTOB1a8Ndd9LgN+eWkq4LgHQdg=; b=1jvTSD4Ek8NXzTJVaKAVxLFAWb
	b/tDCT2O3DhzfuE/Rq0teuhO/9hEN4sYN5YSsl1yUKjHdu+cW7oZzL6QvNng2FnqiHrERaB3Hl9t7
	8jxLYhjjQTMpqIBNrhm55I47O3sdUwUfKXc+R1o05dMLpQ4NgK2bHyNcb1Vl11yCXl6nxYuhl1awh
	jr5vkXpRQ3NgO82RnIpZMrjGYu2EIPgJK2LRqCR8bBxGc7zDoy4b/LIZVvtz6zFfsa0duIjSgDdq2
	kANdvbFKN/aP+M8Ms5NvudFJIPcbbCIgB6LWm/YFmBDON2ACagPHWAZ5djADaKBrJ78qH4TJo5SPh
	Arj4zwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Pg-00000007ELm-3aQJ;
	Fri, 27 Mar 2026 11:31:40 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65PM-00000007E9t-1lGl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:31:23 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-486fa35b005so23237765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774611078; x=1775215878; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CmZT00Ychy/3NTwgfmTOB1a8Ndd9LgN+eWkq4LgHQdg=;
        b=MpaeylptqjZh35nqIxVpovWTOz2K67XQT8+2/YJq/gP1Fj1FI+lGZElNYEBF/1isqE
         ZxpUkZdHNetntXaxsaegsjNHYFMvkQl5pax/P7kMDnDjcm6uO5J+IdMRDzZzMDjAQIi0
         cAZOxgi0hP9IlgVYTkVNFihsTvpDcudsAA06qHtNMaoOc6le3BHEKvbscNNIJ8O4vuix
         02Gw75mXhk6NmSMAc+f58ZgZV4w64TckdcurPnyDaRWieO1x0eWHmIRUZlAkQFPcp7vZ
         7dnkCgtH03tnWdOrZ8WXVsX3Xbs4lMM9BDIOgy1Z0HkmniKI7l4+bm1G0Gb+l3UPl+jz
         hF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611078; x=1775215878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmZT00Ychy/3NTwgfmTOB1a8Ndd9LgN+eWkq4LgHQdg=;
        b=pGrfHMfTciDnPV36CjprF8o94AzMu14Ii5g1rjsM7vP3Wz3y/apzRPXstrNwYZgREz
         AaWEK8j7e4sNPfAwJIoNoT0ERuw9VZJ/TmjEctpMeUm1Ka1c2zuZWjFMs/QD1sVr+B5/
         VXSTbMY7HUAoP1o4lxUazdSzSDtoZPahYDsAsSeBcxWkq8W6jwJJbJdswkXq4Pu8MtgZ
         WoqnWFxSWdz7YEizTGH7/cuJoptvUFSRMuNMstEZV7CH+4V1g54TxaOZMHExxUX+zexS
         4Z5YI039coYR4jNXPHP6Wqidq+CBSWYUtaF6VbXRzG2XXkvpIn9/h3LMESiWKboBFysa
         x1DQ==
X-Gm-Message-State: AOJu0YyeWp/tFZdLFpe1Leab1T97GkY/OT6HbuqAtDkUQfvBdLsL65V3
	Wd4nbXnKo74+8zKFnlbPkzRh/LJ41a1DSiYMor6vib+N3CIvFDQty4NXPF+wEYEkw6xe/O29+g=
	=
X-Received: from wrjp8.prod.google.com ([2002:adf:cc88:0:b0:43b:4e32:c2a8])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a108:b0:485:4388:348b
 with SMTP id 5b1f17b1804b1-48727c81d77mr30248765e9.0.1774611077786; Fri, 27
 Mar 2026 04:31:17 -0700 (PDT)
Date: Fri, 27 Mar 2026 12:30:53 +0100
In-Reply-To: <20260327113047.4043492-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260327113047.4043492-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2411; i=ardb@kernel.org;
 h=from:subject; bh=CP6n0AwzEy3EVDh+0vOJC9hg0Vq3wbja3Fi94y7uAGs=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfNYVp60psKV4x+/8rY9vl6vut9UO6DV4ekjDTXNHplb2
 38HXLrcUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZifpKRYe0yydXrfL+ebZwj
 p9zl8TZXTMp/jVXaBxGZ2P3TPZzbHzIyXPq8N3jfz9+bZ19Z8J/z1T2nTYI1hWs09DaH520IK9a cyQYA
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260327113047.4043492-12-ardb+git@google.com>
Subject: [PATCH 5/5] ARM: Remove hacked-up asm/types.h header
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-raid@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043120_537649_175B5EA9 
X-CRM114-Status: GOOD (  15.88  )
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
during the build, and this only happens when using NEON intrinsics, now
that the compiler vectorized version of XOR has been replaced.

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
2.53.0.1018.g2bb0e51243-goog


