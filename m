Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1810EFF60DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqBesCV1iVGFjs/+MQv4dUKUK6pO8mTUu//mtGexVyc=; b=jjJv2xX2NKrTFu3ZvtAZIHKRdG
	BADAsZkBilZZq5tHS+RTEhQZlTjLmgZD9Z4uDSYgMcrIwTOA+ev7Qijz2SVVHWf5Tek5huucPk+kS
	jqJLDNM0uUc08Ih0TLQ+74NbwYNKc2uU6FgFx9n1wCZEiRvMyFtHbAgqgv2SLbRucJciN72kJVsM6
	W6EtG1JG3A9K1tWUDbl4SfSNuV2b7YXORbSMLSDyAM+RzBjROF14yViIBai59UBpAyIMKtNyeQJxI
	SodLEwPsi2UmKguBF6bPjwKR8EmVbccjrwps2edkEf/zN6RiGm5RWP651lAA/hyhVCDtDy6MUQm04
	3YBJaBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TrO-0000000CWS9-42A5;
	Tue, 31 Mar 2026 07:50:02 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TrJ-0000000CWOW-1bw7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:49:58 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-486fc42c83aso44313655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 00:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774943395; x=1775548195; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tqBesCV1iVGFjs/+MQv4dUKUK6pO8mTUu//mtGexVyc=;
        b=nOsGsNEK1DgPnslCrOhjNqeMEpEsJgffe3EeBpgGbpOEiTL1MKqYd4mhyuT8BwDR6L
         ZtAGQ7da1FG9pUYhL837Mt9ZvVs4dsHqJWEns1OJbaSvodCr0/8V6wJh0q8t3XkcWt+q
         k3GDggfq9/DO32+Ff3oqVP7Y29F1OZ0U7+Yjgt+LpwbFy/QKtmmC/RCDhmmVf9bN1uxv
         MycX6Puit5bpwuVdm0K6e5wE3ARw0otMwcuXQGaQbT1CDOm7bYFGW2YIVJG908GUio/l
         Mpg1gQoqaOZaiwOCQNN/f+pw1OBnfHr0IWQ7Gz/5WS2RXUTEkVbLrIu4dlhBMoSfftng
         RsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943395; x=1775548195;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tqBesCV1iVGFjs/+MQv4dUKUK6pO8mTUu//mtGexVyc=;
        b=CvMb/IwfS7wTqCGUnrdvQZI2mhV4G4jHr26JAa1n7xaPVRPZTEW/nYpW50SRqpydQU
         KlCWce5DNgenzcf7KSQKR/D4Y3r6hvdom7WSC7QT+lCcfYQjZC/5dgmLrq4+Q21u2QfL
         nX9soXlKHhBAx5M0U6twkiZ6i0bOcu4l/2wj8OjBppO/eHvDs6uWOrP9W/Hw94kSST3h
         9Im5k7sVTSLxcMwswHH3CO6pBzSBgguVQ8kJgP03AuQDj8yUXOzAZvqEsEKWsWjxO/O7
         lbZbw0CODNvWIYb6tiClir4TXQ33wvnz8wu3lKr7LxXqS3UaRjRRJgbi5Xzr2XzpihHd
         GEVw==
X-Gm-Message-State: AOJu0YwljaC6peFeuogN2ZXceBVKIybnjx7ViTEoGFedXUA/EpYQOjK6
	pXn582X/Id02Gg0kn0Y88nZ7E5y7Rk2J5EQ6ZaQso7P8TUjyzC5xzorlfClTmErMBB6WDyl68A=
	=
X-Received: from wmph38.prod.google.com ([2002:a05:600c:49a6:b0:486:fe68:2045])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:621b:b0:483:9139:4c1d
 with SMTP id 5b1f17b1804b1-48727d87f18mr281347235e9.14.1774943394851; Tue, 31
 Mar 2026 00:49:54 -0700 (PDT)
Date: Tue, 31 Mar 2026 09:49:43 +0200
In-Reply-To: <20260331074940.55502-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260331074940.55502-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=8240; i=ardb@kernel.org;
 h=from:subject; bh=2HOdmXCw5GMomfEjnLJM2NrjzlJj2ghqB/RAm4StiJM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN0zczuu1Vxe435Xjm832Ey3SfZ8uqB3+9+bLxgnXt1j
 fDP/5VlHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiilsZGW7wGG97EF578yXP
 pCdu14velHx3Pih5am/YzBXW1y1Zjh9nZDjnnr5gfbQkx/7juq5zvJekB9mGbuOe83PXErPrSip 7ozgB
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331074940.55502-10-ardb+git@google.com>
Subject: [PATCH v2 3/5] xor/arm: Replace vectorized implementation with
 arm64's intrinsics
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-raid@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_004957_461939_746312F4 
X-CRM114-Status: GOOD (  22.69  )
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

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/raid/xor/arm/xor-neon.c | 183 ++++++++++++++++++--
 lib/raid/xor/arm/xor-neon.h |   7 +
 lib/raid/xor/arm/xor_arch.h |   7 +-
 lib/raid/xor/xor-8regs.c    |   2 -
 4 files changed, 174 insertions(+), 25 deletions(-)

diff --git a/lib/raid/xor/arm/xor-neon.c b/lib/raid/xor/arm/xor-neon.c
index 23147e3a7904..a3e2b4af8d36 100644
--- a/lib/raid/xor/arm/xor-neon.c
+++ b/lib/raid/xor/arm/xor-neon.c
@@ -1,26 +1,175 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2013 Linaro Ltd <ard.biesheuvel@linaro.org>
+ * Authors: Jackie Liu <liuyun01@kylinos.cn>
+ * Copyright (C) 2018,Tianjin KYLIN Information Technology Co., Ltd.
  */
 
 #include "xor_impl.h"
-#include "xor_arch.h"
+#include "xor-neon.h"
 
-#ifndef __ARM_NEON__
-#error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
-#endif
+#include <asm/neon-intrinsics.h>
 
-/*
- * Pull in the reference implementations while instructing GCC (through
- * -ftree-vectorize) to attempt to exploit implicit parallelism and emit
- * NEON instructions. Clang does this by default at O2 so no pragma is
- * needed.
- */
-#ifdef CONFIG_CC_IS_GCC
-#pragma GCC optimize "tree-vectorize"
-#endif
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
 
-#define NO_TEMPLATE
-#include "../xor-8regs.c"
+		dp1 += 8;
+		dp2 += 8;
+		dp3 += 8;
+		dp4 += 8;
+		dp5 += 8;
+	} while (--lines > 0);
+}
 
-__DO_XOR_BLOCKS(neon_inner, xor_8regs_2, xor_8regs_3, xor_8regs_4, xor_8regs_5);
+__DO_XOR_BLOCKS(neon_inner, __xor_neon_2, __xor_neon_3, __xor_neon_4,
+		__xor_neon_5);
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
-- 
2.53.0.1018.g2bb0e51243-goog


