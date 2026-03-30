Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134A71061B06
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7t86A+MFgLU7iz5H18VUjnEfVSNV7QCLDr1QEdN7wE=; b=Sf/OfSThCoxdDfPdIOx+XvhAy5
	UWcFfUy/KfLoHNekcPeBze0R+LyGWmC1enxwkNGRYGwnFxr2hOVg9VE+5g/YupDYocHtusXJCUIVC
	ZhyENYLra5NipEsGcgN/A5wI9pIGlKd3sR/fGOSpviodPI8PCOL6F1M0pzLLG3mxfZeZnBDE/xEXg
	3JRh13nhaffRTj2EfvAV85aV41BZXk9feDrBmJOUspFeq+6w9UZSgEAAU8XeZpGPtjR7gDzqkImFi
	4cXt1GQ1a380fHb7k1uW2eDdElwl2arYcC06a9Iobkf9VNNbrs67p/SodTUoUk4jeYQ00R43bXR6m
	PV+OD7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DtN-0000000BSB6-2i3l;
	Mon, 30 Mar 2026 14:47:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dt9-0000000BS5R-3Kk9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:46:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 413C243CAE;
	Mon, 30 Mar 2026 14:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA329C19423;
	Mon, 30 Mar 2026 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882007;
	bh=IgBoKSALuAo6iW9gXWXETgLj0vEk1rAPv2EwB03g89w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mpsndG0rAidpFh5a02zMA4rxDw1dwwz3BhGt0znGMgQ2cpvzvcfmWf1pW/yl4GvXG
	 Ugn2X61oGQwh883xYhQ+3SnsXzaDMYoUVZsNPALHwsqUMQs0qxr3wYZHaJ1yrdwdc/
	 Nq23ffPr3jH0dGftnYdh5/824d0LaFrRoqX5Q99RdHpBw/PZKb7Q8Yu7tqkgJT1qk/
	 Yigc8VD6HO+6KLhNPM1nZtq7MHqPNIATSqSgq+KLrn+vy0ZAqxGnGz4OUdzYyKB4Ce
	 cUnna6IDnVbe1CINyrv8MElqDmWkn7xGePTQOThYsksqySBUM9TIGskX1Mzi+XfMrT
	 knuxOQNX1Gr1A==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Demian Shulhan <demyansh@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 3/5] ARM: Add a neon-intrinsics.h header like on arm64
Date: Mon, 30 Mar 2026 16:46:34 +0200
Message-ID: <20260330144630.33026-10-ardb@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330144630.33026-7-ardb@kernel.org>
References: <20260330144630.33026-7-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3550; i=ardb@kernel.org; h=from:subject; bh=IgBoKSALuAo6iW9gXWXETgLj0vEk1rAPv2EwB03g89w=; b=owGbwMvMwCn83sBh/rljoYmMp9WSGDJP9RwXUtzy7ll+28aPjy+d+fGTx0d248zlL7cLhV5ff fvtqRM3T3ZMZWEQ5mSQFVNk2amc0/3aRfSdvkJlDswcViaQIQxcnAIwEWYfxoZlvQrNznbcQfPK Dq2dUyrz51nqjNUfrjoGyu3V2Pa/+XTkiV/BfJOj6tW6+sUPn/Hn4GBsOPunaIfA0U6HUG67Zu6 asyKZ99dzrGKclTXxz79Zj3dKhTyU+Dfj4sZVcnqpLa+mpcQUAgA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_074647_873089_83F2DC28 
X-CRM114-Status: GOOD (  17.66  )
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

Add a header asm/neon-intrinsics.h similar to the one that arm64 has.
This makes it possible for NEON intrinsics code to be shared seamlessly
between ARM and arm64.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 Documentation/arch/arm/kernel_mode_neon.rst |  4 +-
 arch/arm/include/asm/neon-intrinsics.h      | 64 ++++++++++++++++++++
 2 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/kernel_mode_neon.rst b/Documentation/arch/arm/kernel_mode_neon.rst
index 9bfb71a2a9b9..1efb6d35b7bd 100644
--- a/Documentation/arch/arm/kernel_mode_neon.rst
+++ b/Documentation/arch/arm/kernel_mode_neon.rst
@@ -121,4 +121,6 @@ observe the following in addition to the rules above:
 * Compile the unit containing the NEON intrinsics with '-ffreestanding' so GCC
   uses its builtin version of <stdint.h> (this is a C99 header which the kernel
   does not supply);
-* Include <arm_neon.h> last, or at least after <linux/types.h>
+* Do not include <arm_neon.h> directly: instead, include <asm/neon-intrinsics.h>,
+  which tweaks some macro definitions so that system headers can be included
+  safely.
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


