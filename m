Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A6A10ED65E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lpGVX/QCmQJUj33QJcU41GXVAqHMjHSyUsmEQf/VZk=; b=NFQ7uzzSPyp37cx0sF5Dzdt7ip
	sg/F8AF8Emxr5fNb7+rNX0DC7fzNgXo9cUE1dgeaSnxPfeei23YQCgstMM8Sz3b5D4J4C4V395rbz
	AWBw/ujUQMSXf2EoeO5X23Ql3iYEmHp+gASbCbqqw1G8q66wil2u0M4ECH3FqxJCdsyI5AP48VShj
	otnCtkAnJXfsRyAhD1GGp491eq0dyr7GJDbUpXyh1XBPMPmGYNgbOjHTyLmgVjAVCeKW0/vqaCpj+
	xrtuQU7z2EZUmHCwGN2EY+To6j+hlHc0U0Vw73NV4B4S9XihAAaTiiocKKboSnx/s21g+/PHu/GPB
	GUL1hhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65PQ-00000007EDs-3Wry;
	Fri, 27 Mar 2026 11:31:24 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65PK-00000007E99-2l3I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:31:20 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-486fb29a8b8so18418865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 04:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774611077; x=1775215877; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6lpGVX/QCmQJUj33QJcU41GXVAqHMjHSyUsmEQf/VZk=;
        b=eDgtth9X2O97NtXgQtNqDq+W6p0p6Tw9ekyfGK7FJ/qm5WoOUisRF8U7OW2BUEDXYJ
         g8T8zwgmaGd7EoznwbjMEsIpB0HcxtC65d0dBlELwHPv3DFbvf6AOfTBFUIJgw4/SSHQ
         qcXnxWKjLU61PDc37MeSx3w8X8OuxoY5N9qWFlDJEkqB1anUoSM5BGRQhY0XptW5aRFe
         whKvoqQTZk43IukUhWb9Gx5TPm3WsFnq+0Dq0j1EkV5mQtsZUCeZMeBzK2Foz5MMkbu8
         GaWTMBa6L28wZnUr7AQ+/LRJvQw2f/SG4CSRHDI/Yz9KX4+FfnsWgR5MZY/N0NlyCd3S
         GvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611077; x=1775215877;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6lpGVX/QCmQJUj33QJcU41GXVAqHMjHSyUsmEQf/VZk=;
        b=lIJE0XTVg/MTtq+HLYtQd7ZiLYgWW+DxJ6M2bzmX15PxrlhEhQb/FAVBKDyyS1utjM
         rvVX34Vb5VjXXvNbPCCVWTtA0xn2+i1FrLKlDJ/r/uL1qNu0dCiNKt1NuMCpfWCp3U8i
         gizIsAQ1MerHmpZ7qArF8ivdAOahNGMOcafXQST0JxhC7sDgdbL/LT5liSc/fDMKuH7P
         LDLoEdQELPcm4xuxKIdrWF4y29LvW/F5BlLaI0ngtHB3QfVgDsj31ZXHtcAOaHY7+JgD
         wfc6r95yr1b46NCgW5NvOCcADUCbpaLkKtQ5aD4hx2jGvl6SQdsATTWwgPGXxjgAHyGQ
         MNdg==
X-Gm-Message-State: AOJu0Yx16tQcZje0Tp79id4J4dZYcRBp976VQeajxDk9IaXmFtRJNBx+
	n7kAUGWRA+g2qJVxudgzHAnJwksBH7sFg9h8loA52HxduCk8lE+5pqKDUhLmqz0HGIJ7fXAIGQ=
	=
X-Received: from wmej1.prod.google.com ([2002:a05:600c:42c1:b0:485:2f7d:fb25])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3f0a:b0:485:4eaf:eb54
 with SMTP id 5b1f17b1804b1-48727ec733dmr31154955e9.20.1774611076504; Fri, 27
 Mar 2026 04:31:16 -0700 (PDT)
Date: Fri, 27 Mar 2026 12:30:52 +0100
In-Reply-To: <20260327113047.4043492-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260327113047.4043492-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6962; i=ardb@kernel.org;
 h=from:subject; bh=jQxXgoeTfEfEV6TdnBWqYTOjj0B+qysu4R1Bj4bXvm0=;
 b=kA0DAAoWMG4JVi59LVwByyZiAGnGam2isQG2Eu8szjpLuEHSYkgaDSsdEEBpiP9XG1vHwI5pr
 4h1BAAWCgAdFiEEEJv97rnLkRp9Q5odMG4JVi59LVwFAmnGam0ACgkQMG4JVi59LVxWLQEAhsm1
 9x13Cv7LfiIl3A9yCpEMUfgJ4sggvT118mK3FCAA/izZrlF7RQau6pVt3F4WSaQNTl9xjdPIOyr qRCu4qbEH
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260327113047.4043492-11-ardb+git@google.com>
Subject: [PATCH 4/5] xor/arm64: Use shared NEON intrinsics implementation from
 32-bit ARM
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-raid@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043118_790705_B41D091D 
X-CRM114-Status: GOOD (  14.04  )
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

Tweak the arm64 code so that the pure NEON intrinsics implementation of
XOR is shared between arm64 and ARM.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/raid/xor/arm64/xor-neon.c | 170 +-------------------
 lib/raid/xor/arm64/xor-neon.h |   3 +
 lib/raid/xor/arm64/xor_arch.h |   4 +-
 3 files changed, 5 insertions(+), 172 deletions(-)

diff --git a/lib/raid/xor/arm64/xor-neon.c b/lib/raid/xor/arm64/xor-neon.c
index 97ef3cb92496..43fa5236fd41 100644
--- a/lib/raid/xor/arm64/xor-neon.c
+++ b/lib/raid/xor/arm64/xor-neon.c
@@ -1,179 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/*
- * Authors: Jackie Liu <liuyun01@kylinos.cn>
- * Copyright (C) 2018,Tianjin KYLIN Information Technology Co., Ltd.
- */
 
 #include <linux/cache.h>
 #include <asm/neon-intrinsics.h>
 #include "xor_impl.h"
-#include "xor_arch.h"
 #include "xor-neon.h"
 
-static void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2)
-{
-	uint64_t *dp1 = (uint64_t *)p1;
-	uint64_t *dp2 = (uint64_t *)p2;
-
-	register uint64x2_t v0, v1, v2, v3;
-	long lines = bytes / (sizeof(uint64x2_t) * 4);
-
-	do {
-		/* p1 ^= p2 */
-		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
-		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
-		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
-		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
-
-		/* store */
-		vst1q_u64(dp1 +  0, v0);
-		vst1q_u64(dp1 +  2, v1);
-		vst1q_u64(dp1 +  4, v2);
-		vst1q_u64(dp1 +  6, v3);
-
-		dp1 += 8;
-		dp2 += 8;
-	} while (--lines > 0);
-}
-
-static void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3)
-{
-	uint64_t *dp1 = (uint64_t *)p1;
-	uint64_t *dp2 = (uint64_t *)p2;
-	uint64_t *dp3 = (uint64_t *)p3;
-
-	register uint64x2_t v0, v1, v2, v3;
-	long lines = bytes / (sizeof(uint64x2_t) * 4);
-
-	do {
-		/* p1 ^= p2 */
-		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
-		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
-		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
-		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
-
-		/* p1 ^= p3 */
-		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
-		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
-		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
-		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
-
-		/* store */
-		vst1q_u64(dp1 +  0, v0);
-		vst1q_u64(dp1 +  2, v1);
-		vst1q_u64(dp1 +  4, v2);
-		vst1q_u64(dp1 +  6, v3);
-
-		dp1 += 8;
-		dp2 += 8;
-		dp3 += 8;
-	} while (--lines > 0);
-}
-
-static void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3,
-		const unsigned long * __restrict p4)
-{
-	uint64_t *dp1 = (uint64_t *)p1;
-	uint64_t *dp2 = (uint64_t *)p2;
-	uint64_t *dp3 = (uint64_t *)p3;
-	uint64_t *dp4 = (uint64_t *)p4;
-
-	register uint64x2_t v0, v1, v2, v3;
-	long lines = bytes / (sizeof(uint64x2_t) * 4);
-
-	do {
-		/* p1 ^= p2 */
-		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
-		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
-		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
-		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
-
-		/* p1 ^= p3 */
-		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
-		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
-		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
-		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
-
-		/* p1 ^= p4 */
-		v0 = veorq_u64(v0, vld1q_u64(dp4 +  0));
-		v1 = veorq_u64(v1, vld1q_u64(dp4 +  2));
-		v2 = veorq_u64(v2, vld1q_u64(dp4 +  4));
-		v3 = veorq_u64(v3, vld1q_u64(dp4 +  6));
-
-		/* store */
-		vst1q_u64(dp1 +  0, v0);
-		vst1q_u64(dp1 +  2, v1);
-		vst1q_u64(dp1 +  4, v2);
-		vst1q_u64(dp1 +  6, v3);
-
-		dp1 += 8;
-		dp2 += 8;
-		dp3 += 8;
-		dp4 += 8;
-	} while (--lines > 0);
-}
-
-static void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3,
-		const unsigned long * __restrict p4,
-		const unsigned long * __restrict p5)
-{
-	uint64_t *dp1 = (uint64_t *)p1;
-	uint64_t *dp2 = (uint64_t *)p2;
-	uint64_t *dp3 = (uint64_t *)p3;
-	uint64_t *dp4 = (uint64_t *)p4;
-	uint64_t *dp5 = (uint64_t *)p5;
-
-	register uint64x2_t v0, v1, v2, v3;
-	long lines = bytes / (sizeof(uint64x2_t) * 4);
-
-	do {
-		/* p1 ^= p2 */
-		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
-		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
-		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
-		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
-
-		/* p1 ^= p3 */
-		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
-		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
-		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
-		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
-
-		/* p1 ^= p4 */
-		v0 = veorq_u64(v0, vld1q_u64(dp4 +  0));
-		v1 = veorq_u64(v1, vld1q_u64(dp4 +  2));
-		v2 = veorq_u64(v2, vld1q_u64(dp4 +  4));
-		v3 = veorq_u64(v3, vld1q_u64(dp4 +  6));
-
-		/* p1 ^= p5 */
-		v0 = veorq_u64(v0, vld1q_u64(dp5 +  0));
-		v1 = veorq_u64(v1, vld1q_u64(dp5 +  2));
-		v2 = veorq_u64(v2, vld1q_u64(dp5 +  4));
-		v3 = veorq_u64(v3, vld1q_u64(dp5 +  6));
-
-		/* store */
-		vst1q_u64(dp1 +  0, v0);
-		vst1q_u64(dp1 +  2, v1);
-		vst1q_u64(dp1 +  4, v2);
-		vst1q_u64(dp1 +  6, v3);
-
-		dp1 += 8;
-		dp2 += 8;
-		dp3 += 8;
-		dp4 += 8;
-		dp5 += 8;
-	} while (--lines > 0);
-}
-
-__DO_XOR_BLOCKS(neon_inner, __xor_neon_2, __xor_neon_3, __xor_neon_4,
-		__xor_neon_5);
+#include "../arm/xor-neon.c"
 
 static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
 {
diff --git a/lib/raid/xor/arm64/xor-neon.h b/lib/raid/xor/arm64/xor-neon.h
index 514699ba8f5f..d49e7a7f0e14 100644
--- a/lib/raid/xor/arm64/xor-neon.h
+++ b/lib/raid/xor/arm64/xor-neon.h
@@ -1,5 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+extern struct xor_block_template xor_block_neon;
+extern struct xor_block_template xor_block_eor3;
+
 void xor_gen_neon_inner(void *dest, void **srcs, unsigned int src_cnt,
 		unsigned int bytes);
 void xor_gen_eor3_inner(void *dest, void **srcs, unsigned int src_cnt,
diff --git a/lib/raid/xor/arm64/xor_arch.h b/lib/raid/xor/arm64/xor_arch.h
index 5dbb40319501..7c9d16324c33 100644
--- a/lib/raid/xor/arm64/xor_arch.h
+++ b/lib/raid/xor/arm64/xor_arch.h
@@ -4,9 +4,7 @@
  * Copyright (C) 2018,Tianjin KYLIN Information Technology Co., Ltd.
  */
 #include <asm/simd.h>
-
-extern struct xor_block_template xor_block_neon;
-extern struct xor_block_template xor_block_eor3;
+#include "xor-neon.h"
 
 static __always_inline void __init arch_xor_init(void)
 {
-- 
2.53.0.1018.g2bb0e51243-goog


