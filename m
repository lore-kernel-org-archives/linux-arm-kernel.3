Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D201C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 23:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjL/m5wOHohCbMSwBZiIlGCXY+r/VfCy4XSHShezJwU=; b=c2k1DLTplrxvbki3/I5K7Xzssq
	4bdgtKjKMQnIIttfcXOKeA0qp84/HH/U+M+m3vchQm28yOM6OzTcHFH47fnaZN/wtdZcDVEfql7Fc
	HUDu4YeJj9l9THBzWtXckAuL8QNZA2GFrWFBC9nIlCC53IMH4OOIP/paI0PdVZ/AwTuX5ZwFpFaMl
	xO6d9Z4rZu+Cdj4JbDuRJ+bZJfocnxoeudaSAMzJRTM1ooxCVLGOJ9SjoZ0uGTUzIOhv2u9axvaHs
	E5N1iy2tPxC42wFUuLgiKlpe79JMwWwB1B08+oKi4JkYlLJOMrc+bSfXLqxrG3qbM264utMn+ZIPy
	/EbBXkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajj3-0000000H9aS-3VS9;
	Sat, 12 Jul 2025 23:33:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajbq-0000000H7VC-21td
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09D395C5563;
	Sat, 12 Jul 2025 23:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0C1C4CEEF;
	Sat, 12 Jul 2025 23:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362781;
	bh=7FCBsAJrrnnuA4T7D71YIVEm2XZIVKTGyQn5RJhvcdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AESXCqC0z6pOQ9CUMUWhaUwDe7++NcZw3AkLl0Yfi0I7+dpBw5r3npCKV7bLhWYBP
	 xaqjcxQ18FNqMMPZ78UZNtsR7pL7zZSAClydv+Nd7OeiLFyi7h8wZnzEfyiTvREzLE
	 s6GzQO7R7wVH1ysDJveWRNmIZqa5oCW0DT8MDtQ08U1ghX0K8+Yg+PpsnHcoCMJSSs
	 g8dmb32IhNUuXJnbhoiSiYajsRhlpebCwJAzut4xyIcwp5IJL2MaPCyiPxDOBxPRKO
	 uVX2GN4FX8bPqJ16M4wrOL2SlllBXxZBhyhIMx2Aej4zsc7M7X8Kc5ExmIKzuG99gj
	 RwTgzg1CKVUAA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 03/26] lib/crypto: sha1: Add SHA-1 library functions
Date: Sat, 12 Jul 2025 16:22:54 -0700
Message-ID: <20250712232329.818226-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_162622_604093_417C766D 
X-CRM114-Status: GOOD (  23.01  )
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

Add a library interface for SHA-1, following the SHA-2 one.  As was the
case with SHA-2, this will be useful for various in-kernel users.  The
crypto_shash interface will be reimplemented on top of it as well.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha1.h |  60 +++++++++++++++++++++++
 lib/crypto/Kconfig    |   7 +++
 lib/crypto/Makefile   |   9 +++-
 lib/crypto/sha1.c     | 110 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 183 insertions(+), 3 deletions(-)

diff --git a/include/crypto/sha1.h b/include/crypto/sha1.h
index d853d3b931699..387f6123a05e8 100644
--- a/include/crypto/sha1.h
+++ b/include/crypto/sha1.h
@@ -34,6 +34,66 @@ struct sha1_state {
 #define SHA1_DIGEST_WORDS	(SHA1_DIGEST_SIZE / 4)
 #define SHA1_WORKSPACE_WORDS	16
 void sha1_init_raw(__u32 *buf);
 void sha1_transform(__u32 *digest, const char *data, __u32 *W);
 
+/* State for the SHA-1 compression function */
+struct sha1_block_state {
+	u32 h[SHA1_DIGEST_SIZE / 4];
+};
+
+/**
+ * struct sha1_ctx - Context for hashing a message with SHA-1
+ * @state: the compression function state
+ * @bytecount: number of bytes processed so far
+ * @buf: partial block buffer; bytecount % SHA1_BLOCK_SIZE bytes are valid
+ */
+struct sha1_ctx {
+	struct sha1_block_state state;
+	u64 bytecount;
+	u8 buf[SHA1_BLOCK_SIZE];
+};
+
+/**
+ * sha1_init() - Initialize a SHA-1 context for a new message
+ * @ctx: the context to initialize
+ *
+ * If you don't need incremental computation, consider sha1() instead.
+ *
+ * Context: Any context.
+ */
+void sha1_init(struct sha1_ctx *ctx);
+
+/**
+ * sha1_update() - Update a SHA-1 context with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+void sha1_update(struct sha1_ctx *ctx, const u8 *data, size_t len);
+
+/**
+ * sha1_final() - Finish computing a SHA-1 message digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: (output) the resulting SHA-1 message digest
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void sha1_final(struct sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE]);
+
+/**
+ * sha1() - Compute SHA-1 message digest in one shot
+ * @data: the message data
+ * @len: the data length in bytes
+ * @out: (output) the resulting SHA-1 message digest
+ *
+ * Context: Any context.
+ */
+void sha1(const u8 *data, size_t len, u8 out[SHA1_DIGEST_SIZE]);
+
 #endif /* _CRYPTO_SHA1_H */
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index c2a28a50ac576..ff54c9a631f86 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -137,10 +137,17 @@ config CRYPTO_LIB_CHACHA20POLY1305
 	select CRYPTO_LIB_POLY1305
 	select CRYPTO_LIB_UTILS
 
 config CRYPTO_LIB_SHA1
 	tristate
+	help
+	  The SHA-1 library functions.  Select this if your module uses any of
+	  the functions from <crypto/sha1.h>.
+
+config CRYPTO_LIB_SHA1_ARCH
+	bool
+	depends on CRYPTO_LIB_SHA1 && !UML
 
 config CRYPTO_LIB_SHA256
 	tristate
 	help
 	  Enable the SHA-256 library interface. This interface may be fulfilled
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 8aaec39b85608..c96abfc4b9d3b 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -65,12 +65,17 @@ libpoly1305-y					+= poly1305.o
 obj-$(CONFIG_CRYPTO_LIB_POLY1305_GENERIC)	+= libpoly1305-generic.o
 libpoly1305-generic-y				:= poly1305-donna32.o
 libpoly1305-generic-$(CONFIG_ARCH_SUPPORTS_INT128) := poly1305-donna64.o
 libpoly1305-generic-y				+= poly1305-generic.o
 
-obj-$(CONFIG_CRYPTO_LIB_SHA1)			+= libsha1.o
-libsha1-y					:= sha1.o
+################################################################################
+
+obj-$(CONFIG_CRYPTO_LIB_SHA1) += libsha1.o
+libsha1-y := sha1.o
+ifeq ($(CONFIG_CRYPTO_LIB_SHA1_ARCH),y)
+CFLAGS_sha1.o += -I$(src)/$(SRCARCH)
+endif # CONFIG_CRYPTO_LIB_SHA1_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_SHA256) += libsha256.o
 libsha256-y := sha256.o
diff --git a/lib/crypto/sha1.c b/lib/crypto/sha1.c
index 813ad96daa25a..7c0763cbf9f1e 100644
--- a/lib/crypto/sha1.c
+++ b/lib/crypto/sha1.c
@@ -12,10 +12,14 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/unaligned.h>
 
+static const struct sha1_block_state sha1_iv = {
+	.h = { SHA1_H0, SHA1_H1, SHA1_H2, SHA1_H3, SHA1_H4 },
+};
+
 /*
  * If you have 32 registers or more, the compiler can (and should)
  * try to change the array[] accesses into registers. However, on
  * machines with less than ~25 registers, that won't really work,
  * and at least gcc will make an unholy mess of it.
@@ -135,7 +139,111 @@ void sha1_init_raw(__u32 *buf)
 	buf[3] = 0x10325476;
 	buf[4] = 0xc3d2e1f0;
 }
 EXPORT_SYMBOL(sha1_init_raw);
 
-MODULE_DESCRIPTION("SHA-1 Algorithm");
+static void __maybe_unused sha1_blocks_generic(struct sha1_block_state *state,
+					       const u8 *data, size_t nblocks)
+{
+	u32 workspace[SHA1_WORKSPACE_WORDS];
+
+	do {
+		sha1_transform(state->h, data, workspace);
+		data += SHA1_BLOCK_SIZE;
+	} while (--nblocks);
+
+	memzero_explicit(workspace, sizeof(workspace));
+}
+
+#ifdef CONFIG_CRYPTO_LIB_SHA1_ARCH
+#include "sha1.h" /* $(SRCARCH)/sha1.h */
+#else
+#define sha1_blocks sha1_blocks_generic
+#endif
+
+void sha1_init(struct sha1_ctx *ctx)
+{
+	ctx->state = sha1_iv;
+	ctx->bytecount = 0;
+}
+EXPORT_SYMBOL_GPL(sha1_init);
+
+void sha1_update(struct sha1_ctx *ctx, const u8 *data, size_t len)
+{
+	size_t partial = ctx->bytecount % SHA1_BLOCK_SIZE;
+
+	ctx->bytecount += len;
+
+	if (partial + len >= SHA1_BLOCK_SIZE) {
+		size_t nblocks;
+
+		if (partial) {
+			size_t l = SHA1_BLOCK_SIZE - partial;
+
+			memcpy(&ctx->buf[partial], data, l);
+			data += l;
+			len -= l;
+
+			sha1_blocks(&ctx->state, ctx->buf, 1);
+		}
+
+		nblocks = len / SHA1_BLOCK_SIZE;
+		len %= SHA1_BLOCK_SIZE;
+
+		if (nblocks) {
+			sha1_blocks(&ctx->state, data, nblocks);
+			data += nblocks * SHA1_BLOCK_SIZE;
+		}
+		partial = 0;
+	}
+	if (len)
+		memcpy(&ctx->buf[partial], data, len);
+}
+EXPORT_SYMBOL_GPL(sha1_update);
+
+void sha1_final(struct sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
+{
+	u64 bitcount = ctx->bytecount << 3;
+	size_t partial = ctx->bytecount % SHA1_BLOCK_SIZE;
+
+	ctx->buf[partial++] = 0x80;
+	if (partial > SHA1_BLOCK_SIZE - 8) {
+		memset(&ctx->buf[partial], 0, SHA1_BLOCK_SIZE - partial);
+		sha1_blocks(&ctx->state, ctx->buf, 1);
+		partial = 0;
+	}
+	memset(&ctx->buf[partial], 0, SHA1_BLOCK_SIZE - 8 - partial);
+	*(__be64 *)&ctx->buf[SHA1_BLOCK_SIZE - 8] = cpu_to_be64(bitcount);
+	sha1_blocks(&ctx->state, ctx->buf, 1);
+
+	for (size_t i = 0; i < SHA1_DIGEST_SIZE; i += 4)
+		put_unaligned_be32(ctx->state.h[i / 4], out + i);
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+EXPORT_SYMBOL_GPL(sha1_final);
+
+void sha1(const u8 *data, size_t len, u8 out[SHA1_DIGEST_SIZE])
+{
+	struct sha1_ctx ctx;
+
+	sha1_init(&ctx);
+	sha1_update(&ctx, data, len);
+	sha1_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(sha1);
+
+#ifdef sha1_mod_init_arch
+static int __init sha1_mod_init(void)
+{
+	sha1_mod_init_arch();
+	return 0;
+}
+subsys_initcall(sha1_mod_init);
+
+static void __exit sha1_mod_exit(void)
+{
+}
+module_exit(sha1_mod_exit);
+#endif
+
+MODULE_DESCRIPTION("SHA-1 library functions");
 MODULE_LICENSE("GPL");
-- 
2.50.1


