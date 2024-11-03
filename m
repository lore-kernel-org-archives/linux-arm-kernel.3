Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DAAD11195
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 22:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT68VJg2Ax+gMpOGHi4H3PWPYTj8DTpPT3IZ5CLlAgo=; b=f29ByCQiEOwr0YNy0N91qXlNlV
	7bc6HeZxrm3yW7ixTOUdC+jnP8GJtghuU11guickLEb5MAKRLjrXmQwOFybNL5iJTcIzCg5GPhj8/
	NHN/AiO0U+s0FPhbiHRuenny1RHJmRJC1DoWUzqWFxLyklB6X1NxS+yVU7/xcGLVsNO2uwiblyj1A
	cL7wi7y0KatwD0wlEJxpzJYqGW1PYtJX7fyUqxUCY7wVzxURl6uusRkH7IbMiSW6o1KWsnPhKQScx
	qI1MmLKyc0EN+TxbIUDy6hutPfuLfb4gy9pMuQq710Gwr+KfT7DkdUhl/sqRJoP+JW7s3YuaDbe3x
	34fx1XFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7jWs-0000000CD7q-3DsH;
	Sun, 03 Nov 2024 22:57:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7j9P-0000000C8VG-1Bo0;
	Sun, 03 Nov 2024 22:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gT68VJg2Ax+gMpOGHi4H3PWPYTj8DTpPT3IZ5CLlAgo=; b=hbylznTuPoGdDKTBBGlcrpDGha
	PTaOF8VCG44ZRBQUzo8ibrj+kgxwC95DlVFgHLvaWMQcWxsuAyW1chNUKFzI1MYwnaWK3nFkionkt
	dunzsE5W4q/7OkCGlXa8LUTVWHl2X7QerUeCDuHaJvdB4qlsMVX1wNsajUhcz2cKyJsN4aUJhZFsQ
	eY9nEO5OlJyJIHT9TuPgdphrLUSLegpk7lrmin9QlYPIaor0gENof1Jtqyz3CnORgx6OwUuqgmSpB
	2umNngT+os8xUjVzS+J4f+8upV8ZP1/MEu+MpJuMXzry+nQvCExtYw/onXBc7zo403WERwk4ZWiAx
	xXKTg+4w==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7j9J-0000000BCF4-0ahR;
	Sun, 03 Nov 2024 22:32:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C6895C4C2F;
	Sun,  3 Nov 2024 22:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788B7C4CED6;
	Sun,  3 Nov 2024 22:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730673151;
	bh=hmjPSLT23tUvD2mhqpKoKr7fMC5StQtNq+9niGNg1xs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tpo5PFXj/m4NE6etEzQOOpPtYejpQ6IyEVf/EeYCb8tkKb0CbNlzB9cqqtXVtKsb4
	 ZpQGhkvVcl/tUEerW2a8LKa2qXGHFXzplvZXn6uMuBrTjz9ciJlXFNVtrcU/h9frd0
	 86FQ8VL7p1lQ3XyzZiPYABO0V8f1lYjXdBVP9qRed5zCEAT40rOPTRuj5I7ykuqKUo
	 of8Q3GNyp0aJT4rBPpEy6mhQgfIQpHMeXXQQcIktnre8ZBm3I0BiW3Y3dCPReAUzrl
	 gp02hfbdFL8Jobk4i3Tfl80tx19I0JOVpan1dsfVTjxNCPJFs7wOT50Jd4u1rxnmio
	 IwxnJCXPSY/4g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 14/18] lib/crc32: make crc32c() go directly to lib
Date: Sun,  3 Nov 2024 14:31:50 -0800
Message-ID: <20241103223154.136127-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103223154.136127-1-ebiggers@kernel.org>
References: <20241103223154.136127-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_223247_637565_9EFDD0BA 
X-CRM114-Status: GOOD (  18.45  )
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

From: Eric Biggers <ebiggers@google.com>

Now that the lower level __crc32c_le() library function is optimized for
each architecture, make crc32c() just call that instead of taking an
inefficient and error-prone detour through the shash API.

Note: a future cleanup should make crc32c_le() be the actual library
function instead of __crc32c_le().  That will require updating callers
of __crc32c_le() to use crc32c_le() instead, and updating callers of
crc32c_le() that expect a 'const void *' arg to expect 'const u8 *'
instead.  Similarly, a future cleanup should remove LIBCRC32C by making
everyone who is selecting it just select CRC32 directly instead.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/crc32c.h |  7 ++--
 lib/Kconfig            | 10 ++----
 lib/Makefile           |  1 -
 lib/libcrc32c.c        | 74 ------------------------------------------
 4 files changed, 8 insertions(+), 84 deletions(-)
 delete mode 100644 lib/libcrc32c.c

diff --git a/include/linux/crc32c.h b/include/linux/crc32c.h
index 357ae4611a45..47eb78003c26 100644
--- a/include/linux/crc32c.h
+++ b/include/linux/crc32c.h
@@ -1,12 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _LINUX_CRC32C_H
 #define _LINUX_CRC32C_H
 
-#include <linux/types.h>
+#include <linux/crc32.h>
 
-extern u32 crc32c(u32 crc, const void *address, unsigned int length);
+static inline u32 crc32c(u32 crc, const void *address, unsigned int length)
+{
+	return __crc32c_le(crc, address, length);
+}
 
 /* This macro exists for backwards-compatibility. */
 #define crc32c_le crc32c
 
 #endif	/* _LINUX_CRC32C_H */
diff --git a/lib/Kconfig b/lib/Kconfig
index 07afcf214f35..b894ee64ff95 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -296,18 +296,14 @@ config CRC7
 	  the kernel tree does. Such modules that use library CRC7
 	  functions require M here.
 
 config LIBCRC32C
 	tristate "CRC32c (Castagnoli, et al) Cyclic Redundancy-Check"
-	select CRYPTO
-	select CRYPTO_CRC32C
+	select CRC32
 	help
-	  This option is provided for the case where no in-kernel-tree
-	  modules require CRC32c functions, but a module built outside the
-	  kernel tree does. Such modules that use library CRC32c functions
-	  require M here.  See Castagnoli93.
-	  Module will be libcrc32c.
+	  This option just selects CRC32 and is provided for compatibility
+	  purposes until the users are updated to select CRC32 directly.
 
 config CRC8
 	tristate "CRC8 function"
 	help
 	  This option provides CRC8 function. Drivers may select this
diff --git a/lib/Makefile b/lib/Makefile
index 773adf88af41..15646679aee2 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -161,11 +161,10 @@ obj-$(CONFIG_CRC_ITU_T)	+= crc-itu-t.o
 obj-$(CONFIG_CRC32)	+= crc32.o
 obj-$(CONFIG_CRC64)     += crc64.o
 obj-$(CONFIG_CRC32_SELFTEST)	+= crc32test.o
 obj-$(CONFIG_CRC4)	+= crc4.o
 obj-$(CONFIG_CRC7)	+= crc7.o
-obj-$(CONFIG_LIBCRC32C)	+= libcrc32c.o
 obj-$(CONFIG_CRC8)	+= crc8.o
 obj-$(CONFIG_CRC64_ROCKSOFT) += crc64-rocksoft.o
 obj-$(CONFIG_XXHASH)	+= xxhash.o
 obj-$(CONFIG_GENERIC_ALLOCATOR) += genalloc.o
 
diff --git a/lib/libcrc32c.c b/lib/libcrc32c.c
deleted file mode 100644
index 649e687413a0..000000000000
--- a/lib/libcrc32c.c
+++ /dev/null
@@ -1,74 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* 
- * CRC32C
- *@Article{castagnoli-crc,
- * author =       { Guy Castagnoli and Stefan Braeuer and Martin Herrman},
- * title =        {{Optimization of Cyclic Redundancy-Check Codes with 24
- *                 and 32 Parity Bits}},
- * journal =      IEEE Transactions on Communication,
- * year =         {1993},
- * volume =       {41},
- * number =       {6},
- * pages =        {},
- * month =        {June},
- *}
- * Used by the iSCSI driver, possibly others, and derived from
- * the iscsi-crc.c module of the linux-iscsi driver at
- * http://linux-iscsi.sourceforge.net.
- *
- * Following the example of lib/crc32, this function is intended to be
- * flexible and useful for all users.  Modules that currently have their
- * own crc32c, but hopefully may be able to use this one are:
- *  net/sctp (please add all your doco to here if you change to
- *            use this one!)
- *  <endoflist>
- *
- * Copyright (c) 2004 Cisco Systems, Inc.
- */
-
-#include <crypto/hash.h>
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/crc32c.h>
-
-static struct crypto_shash *tfm;
-
-u32 crc32c(u32 crc, const void *address, unsigned int length)
-{
-	SHASH_DESC_ON_STACK(shash, tfm);
-	u32 ret, *ctx = (u32 *)shash_desc_ctx(shash);
-	int err;
-
-	shash->tfm = tfm;
-	*ctx = crc;
-
-	err = crypto_shash_update(shash, address, length);
-	BUG_ON(err);
-
-	ret = *ctx;
-	barrier_data(ctx);
-	return ret;
-}
-
-EXPORT_SYMBOL(crc32c);
-
-static int __init libcrc32c_mod_init(void)
-{
-	tfm = crypto_alloc_shash("crc32c", 0, 0);
-	return PTR_ERR_OR_ZERO(tfm);
-}
-
-static void __exit libcrc32c_mod_fini(void)
-{
-	crypto_free_shash(tfm);
-}
-
-module_init(libcrc32c_mod_init);
-module_exit(libcrc32c_mod_fini);
-
-MODULE_AUTHOR("Clay Haapala <chaapala@cisco.com>");
-MODULE_DESCRIPTION("CRC32c (Castagnoli) calculations");
-MODULE_LICENSE("GPL");
-MODULE_SOFTDEP("pre: crc32c");
-- 
2.47.0


