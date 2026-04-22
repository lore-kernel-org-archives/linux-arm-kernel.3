Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F276CFA1FD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 17:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9+uPwKSNKLYb3W9ffceEBxvlYoKeT76XqlWpSy/VgI=; b=cQQ6NuWFc8FJq41x/QECYNRcOw
	4U2mtqnht7SxBCqw75+/wQmB6Ru89mLoIqUTiLAu1ShzMbVyBn/Fplw9p/QrFy/0mcWQMcLRvmjMf
	f3mwv9Pw5SqAXd+ytcKHCRrSqpyS32Vt+7l6aM7uwBePxP5TGS3k041t/8mV4crpVkE0tomY6pHNd
	NZ8ZH7291OltuSW0Gm/3vhr7Y2bYDDG12rQGo/3GWwSegrAIl2j3anQViQff0j8h3GRM9of/+FZku
	O4YIfMShLp8RMDn/yFpku3f7xYFf174I7NNIwJknp1TjjSo7LZWPLglAP2WPafhRcFRgqp4dAz9+l
	G4ClC9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCY-0000000AYXb-18ac;
	Wed, 22 Apr 2026 17:17:26 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFbCS-0000000AYT0-3dD8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 17:17:23 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4411a1f9601so3092063f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 10:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776878239; x=1777483039; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9+uPwKSNKLYb3W9ffceEBxvlYoKeT76XqlWpSy/VgI=;
        b=ORJxL6oyuYywLEMPk+cG6TQixhULnKvL+RdvNYTpJt/QwryNg58YB6j4pKrNntQaYX
         MCYLxyufM+85LiNOcGvk0v4HqzX4s9EC7rcrgdDtN+54Nry4Dsh7wQoXWXiopONCpfVP
         x0O5fpzHvBSUTqymWIdP0I0rdmMYxTjC0uYlaDMF9Zuj6HfI7GlJtyzGuakkWZLqzgb2
         1Qg+6NaQf5m3ykA3Tw6Cv94Aq4ly+VtcwAQbzDd2tM4OvwSbo5mP1srpmWG1lnREtkXG
         Y6l9YCDcIQJ6fYGo3jnQHGwhWc21m5DEMq+Ulrwi34MhZCWzWnZMAXbgGu6y3yK8dBVi
         ivnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776878239; x=1777483039;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9+uPwKSNKLYb3W9ffceEBxvlYoKeT76XqlWpSy/VgI=;
        b=O5iTnuQv+98za7yu30TL8+Ta7UDERQvAed4xvu2TtXW1CM6AtWSPZb4gHYjByrEbLt
         elo3JJCDDKIbzErZzP9HgkZzwd1rbrY7bkKR42og8mdh99o6CSf3w/f5rDAd733m851F
         fkEm0/dHuV8PtvgrlX/UqSaeUoQRqv2Y8vMHgiW92KHZQaiaeaBl5e2CnP5DHFEeIt/3
         Z8DpYh77h9yr7fgROoMK9NFdbXuKxDNaqEY359mI7MiDmF3P1lXafFtYOjn4xadf1no5
         ypvxyhC9vgUjJRgpneNmU93ehzVZR3tIxuAPyrTaO3CnPn2RtZgQ2gWxFCY5CiC4AOrj
         UDuQ==
X-Gm-Message-State: AOJu0YxS5Fy+xESFZ5d7sr+pY34Kwj1NhPsHSe6LDwdC65E/B+ZkRrhj
	A/HIgjgxENHPPW4N+c44r/Nq2bC/kTTPqKLVExROIV2hMroX8K13r6nfzaxgPxwqGMzs0KsR0zf
	L7PoPw57b8CkkHdI7gBNDIJ1h6DOTNcf93aSkW0+BXK4f7V2iuWAZXtaYsn4oaVPOiXkzACcTHT
	tlwFmrqBQUZJO03f8Z0NNW+E9vAktVtR/FkR8s6SRQsAnu
X-Received: from wrwr10.prod.google.com ([2002:a5d:694a:0:b0:43e:a71f:849f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2008:b0:43b:4982:fc73
 with SMTP id ffacd0b85a97d-43fe3e08fc2mr37639574f8f.25.1776878238486; Wed, 22
 Apr 2026 10:17:18 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:16:58 +0200
In-Reply-To: <20260422171655.3437334-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20260422171655.3437334-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=10227; i=ardb@kernel.org;
 h=from:subject; bh=Ojh4OmPZmfcMNEZdyrN7ZZ0r/3BF8mHa1u3W350SFfk=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfMlU3eUXZ3awbt+yc/+OOQ93TJh+mzeBymanHMt9RkUg
 r7o7sjoKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPZzcLIsLC5PPWEWfPO3QuC
 az5b/TdzmHnYznbL95o5vN0niy8tiWZkeLhS2vSOQvrk67wPHs/Sr7Fn0f7aFzR3T6/52okurGX V7AA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260422171655.3437334-12-ardb+git@google.com>
Subject: [PATCH 2/8] xor/arm: Replace vectorized implementation with arm64's intrinsics
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_101720_973030_A257887D 
X-CRM114-Status: GOOD (  21.88  )
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

Drop the XOR implementation generated by the vectorizer: this has always
been a bit of a hack, and now that arm64 has an intrinsics version that
works on ARM too, let's use that instead.

So copy the part of the arm64 code that can be shared (so not the EOR3
version). The arm64 code will be updated in a subsequent patch to share
this implementation.

Performance (QEMU mach-virt VM running on Synquacer [Cortex-A53 @ 1 GHz]

Before:

[    3.519687] xor: measuring software checksum speed
[    3.521725]    neon            :  1660 MB/sec
[    3.524733]    32regs          :  1105 MB/sec
[    3.527751]    8regs           :  1098 MB/sec
[    3.529911]    arm4regs        :  1540 MB/sec

After:

[    3.517654] xor: measuring software checksum speed
[    3.519454]    neon            :  1896 MB/sec
[    3.522499]    32regs          :  1090 MB/sec
[    3.525560]    8regs           :  1083 MB/sec
[    3.527700]    arm4regs        :  1556 MB/sec

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/raid/xor/Makefile       |   6 +-
 lib/raid/xor/arm/xor-neon.c |  26 ---
 lib/raid/xor/arm/xor-neon.h |   7 +
 lib/raid/xor/arm/xor_arch.h |   7 +-
 lib/raid/xor/xor-8regs.c    |   2 -
 lib/raid/xor/xor-neon.c     | 175 ++++++++++++++++++++
 6 files changed, 186 insertions(+), 37 deletions(-)

diff --git a/lib/raid/xor/Makefile b/lib/raid/xor/Makefile
index 4d633dfd5b90..d78400f2427a 100644
--- a/lib/raid/xor/Makefile
+++ b/lib/raid/xor/Makefile
@@ -17,7 +17,7 @@ endif
 xor-$(CONFIG_ALPHA)		+= alpha/xor.o
 xor-$(CONFIG_ARM)		+= arm/xor.o
 ifeq ($(CONFIG_ARM),y)
-xor-$(CONFIG_KERNEL_MODE_NEON)	+= arm/xor-neon.o arm/xor-neon-glue.o
+xor-$(CONFIG_KERNEL_MODE_NEON)	+= xor-neon.o arm/xor-neon-glue.o
 endif
 xor-$(CONFIG_ARM64)		+= arm64/xor-neon.o arm64/xor-neon-glue.o
 xor-$(CONFIG_CPU_HAS_LSX)	+= loongarch/xor_simd.o
@@ -31,8 +31,8 @@ xor-$(CONFIG_X86_32)		+= x86/xor-avx.o x86/xor-sse.o x86/xor-mmx.o
 xor-$(CONFIG_X86_64)		+= x86/xor-avx.o x86/xor-sse.o
 obj-y				+= tests/
 
-CFLAGS_arm/xor-neon.o		+= $(CC_FLAGS_FPU)
-CFLAGS_REMOVE_arm/xor-neon.o	+= $(CC_FLAGS_NO_FPU)
+CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU) -I$(src)/$(SRCARCH)
+CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 
 CFLAGS_arm64/xor-neon.o		+= $(CC_FLAGS_FPU)
 CFLAGS_REMOVE_arm64/xor-neon.o	+= $(CC_FLAGS_NO_FPU)
diff --git a/lib/raid/xor/arm/xor-neon.c b/lib/raid/xor/arm/xor-neon.c
deleted file mode 100644
index 23147e3a7904..000000000000
--- a/lib/raid/xor/arm/xor-neon.c
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2013 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#include "xor_impl.h"
-#include "xor_arch.h"
-
-#ifndef __ARM_NEON__
-#error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
-#endif
-
-/*
- * Pull in the reference implementations while instructing GCC (through
- * -ftree-vectorize) to attempt to exploit implicit parallelism and emit
- * NEON instructions. Clang does this by default at O2 so no pragma is
- * needed.
- */
-#ifdef CONFIG_CC_IS_GCC
-#pragma GCC optimize "tree-vectorize"
-#endif
-
-#define NO_TEMPLATE
-#include "../xor-8regs.c"
-
-__DO_XOR_BLOCKS(neon_inner, xor_8regs_2, xor_8regs_3, xor_8regs_4, xor_8regs_5);
diff --git a/lib/raid/xor/arm/xor-neon.h b/lib/raid/xor/arm/xor-neon.h
new file mode 100644
index 000000000000..406e0356f05b
--- /dev/null
+++ b/lib/raid/xor/arm/xor-neon.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+extern struct xor_block_template xor_block_arm4regs;
+extern struct xor_block_template xor_block_neon;
+
+void xor_gen_neon_inner(void *dest, void **srcs, unsigned int src_cnt,
+		unsigned int bytes);
diff --git a/lib/raid/xor/arm/xor_arch.h b/lib/raid/xor/arm/xor_arch.h
index 775ff835df65..f1ddb64fe62a 100644
--- a/lib/raid/xor/arm/xor_arch.h
+++ b/lib/raid/xor/arm/xor_arch.h
@@ -3,12 +3,7 @@
  *  Copyright (C) 2001 Russell King
  */
 #include <asm/neon.h>
-
-extern struct xor_block_template xor_block_arm4regs;
-extern struct xor_block_template xor_block_neon;
-
-void xor_gen_neon_inner(void *dest, void **srcs, unsigned int src_cnt,
-		unsigned int bytes);
+#include "xor-neon.h"
 
 static __always_inline void __init arch_xor_init(void)
 {
diff --git a/lib/raid/xor/xor-8regs.c b/lib/raid/xor/xor-8regs.c
index 1edaed8acffe..46b3c8bdc27f 100644
--- a/lib/raid/xor/xor-8regs.c
+++ b/lib/raid/xor/xor-8regs.c
@@ -93,11 +93,9 @@ xor_8regs_5(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-#ifndef NO_TEMPLATE
 DO_XOR_BLOCKS(8regs, xor_8regs_2, xor_8regs_3, xor_8regs_4, xor_8regs_5);
 
 struct xor_block_template xor_block_8regs = {
 	.name		= "8regs",
 	.xor_gen	= xor_gen_8regs,
 };
-#endif /* NO_TEMPLATE */
diff --git a/lib/raid/xor/xor-neon.c b/lib/raid/xor/xor-neon.c
new file mode 100644
index 000000000000..a3e2b4af8d36
--- /dev/null
+++ b/lib/raid/xor/xor-neon.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Authors: Jackie Liu <liuyun01@kylinos.cn>
+ * Copyright (C) 2018,Tianjin KYLIN Information Technology Co., Ltd.
+ */
+
+#include "xor_impl.h"
+#include "xor-neon.h"
+
+#include <asm/neon-intrinsics.h>
+
+static void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2)
+{
+	uint64_t *dp1 = (uint64_t *)p1;
+	uint64_t *dp2 = (uint64_t *)p2;
+
+	register uint64x2_t v0, v1, v2, v3;
+	long lines = bytes / (sizeof(uint64x2_t) * 4);
+
+	do {
+		/* p1 ^= p2 */
+		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
+		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
+		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
+		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
+
+		/* store */
+		vst1q_u64(dp1 +  0, v0);
+		vst1q_u64(dp1 +  2, v1);
+		vst1q_u64(dp1 +  4, v2);
+		vst1q_u64(dp1 +  6, v3);
+
+		dp1 += 8;
+		dp2 += 8;
+	} while (--lines > 0);
+}
+
+static void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3)
+{
+	uint64_t *dp1 = (uint64_t *)p1;
+	uint64_t *dp2 = (uint64_t *)p2;
+	uint64_t *dp3 = (uint64_t *)p3;
+
+	register uint64x2_t v0, v1, v2, v3;
+	long lines = bytes / (sizeof(uint64x2_t) * 4);
+
+	do {
+		/* p1 ^= p2 */
+		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
+		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
+		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
+		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
+
+		/* p1 ^= p3 */
+		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
+		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
+		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
+		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
+
+		/* store */
+		vst1q_u64(dp1 +  0, v0);
+		vst1q_u64(dp1 +  2, v1);
+		vst1q_u64(dp1 +  4, v2);
+		vst1q_u64(dp1 +  6, v3);
+
+		dp1 += 8;
+		dp2 += 8;
+		dp3 += 8;
+	} while (--lines > 0);
+}
+
+static void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4)
+{
+	uint64_t *dp1 = (uint64_t *)p1;
+	uint64_t *dp2 = (uint64_t *)p2;
+	uint64_t *dp3 = (uint64_t *)p3;
+	uint64_t *dp4 = (uint64_t *)p4;
+
+	register uint64x2_t v0, v1, v2, v3;
+	long lines = bytes / (sizeof(uint64x2_t) * 4);
+
+	do {
+		/* p1 ^= p2 */
+		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
+		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
+		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
+		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
+
+		/* p1 ^= p3 */
+		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
+		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
+		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
+		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
+
+		/* p1 ^= p4 */
+		v0 = veorq_u64(v0, vld1q_u64(dp4 +  0));
+		v1 = veorq_u64(v1, vld1q_u64(dp4 +  2));
+		v2 = veorq_u64(v2, vld1q_u64(dp4 +  4));
+		v3 = veorq_u64(v3, vld1q_u64(dp4 +  6));
+
+		/* store */
+		vst1q_u64(dp1 +  0, v0);
+		vst1q_u64(dp1 +  2, v1);
+		vst1q_u64(dp1 +  4, v2);
+		vst1q_u64(dp1 +  6, v3);
+
+		dp1 += 8;
+		dp2 += 8;
+		dp3 += 8;
+		dp4 += 8;
+	} while (--lines > 0);
+}
+
+static void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
+		const unsigned long * __restrict p2,
+		const unsigned long * __restrict p3,
+		const unsigned long * __restrict p4,
+		const unsigned long * __restrict p5)
+{
+	uint64_t *dp1 = (uint64_t *)p1;
+	uint64_t *dp2 = (uint64_t *)p2;
+	uint64_t *dp3 = (uint64_t *)p3;
+	uint64_t *dp4 = (uint64_t *)p4;
+	uint64_t *dp5 = (uint64_t *)p5;
+
+	register uint64x2_t v0, v1, v2, v3;
+	long lines = bytes / (sizeof(uint64x2_t) * 4);
+
+	do {
+		/* p1 ^= p2 */
+		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
+		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
+		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
+		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
+
+		/* p1 ^= p3 */
+		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
+		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
+		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
+		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
+
+		/* p1 ^= p4 */
+		v0 = veorq_u64(v0, vld1q_u64(dp4 +  0));
+		v1 = veorq_u64(v1, vld1q_u64(dp4 +  2));
+		v2 = veorq_u64(v2, vld1q_u64(dp4 +  4));
+		v3 = veorq_u64(v3, vld1q_u64(dp4 +  6));
+
+		/* p1 ^= p5 */
+		v0 = veorq_u64(v0, vld1q_u64(dp5 +  0));
+		v1 = veorq_u64(v1, vld1q_u64(dp5 +  2));
+		v2 = veorq_u64(v2, vld1q_u64(dp5 +  4));
+		v3 = veorq_u64(v3, vld1q_u64(dp5 +  6));
+
+		/* store */
+		vst1q_u64(dp1 +  0, v0);
+		vst1q_u64(dp1 +  2, v1);
+		vst1q_u64(dp1 +  4, v2);
+		vst1q_u64(dp1 +  6, v3);
+
+		dp1 += 8;
+		dp2 += 8;
+		dp3 += 8;
+		dp4 += 8;
+		dp5 += 8;
+	} while (--lines > 0);
+}
+
+__DO_XOR_BLOCKS(neon_inner, __xor_neon_2, __xor_neon_3, __xor_neon_4,
+		__xor_neon_5);
-- 
2.54.0.rc1.555.g9c883467ad-goog


