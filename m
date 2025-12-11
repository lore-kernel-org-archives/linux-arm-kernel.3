Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205FED3E784
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 01:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGmPDR/c9rn3fSX9r1NtPt+Nhis12DLr63rQoJx1w+s=; b=319Se24NZRYNZMPemFMnY04BYT
	P+GgeGvSjvjvaS0DtvN9LUCxNj8XyIMT8ZO4MRPkQ8I+pztMMEvd8/UuBi6FjVoQpNuTCjr/BMeKi
	qyFfZ5blzDKNzrs4fYAolXbiXxs4wJBz9vGOcAGgQosTF8SP8q5kUqLDo5T+uqyEYYPIETzmx5OzX
	cWDJsJFsQCCZhna3lWmadqEwbUAt/sNlJZGRcAgdE9LaJ3VHhK8T+WxuwjBXcWo+h3Z1lUCVX+uqH
	EfVZQlq3Al1nXH0g53ChJwFwAnD1OjS+e3mHMMMMmLMBH6G6uUlWPj5qewnFstZmDtfF3VmQEGmo1
	4VGrbWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMU-0000000G3ce-1v4l;
	Thu, 11 Dec 2025 01:20:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMS-0000000G3bL-3cpx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 01:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B95C6014E;
	Thu, 11 Dec 2025 01:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEE1C4CEF7;
	Thu, 11 Dec 2025 01:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765416051;
	bh=Mt0okajc2BNMEQ0JbXrBJGsKVTUdYHEAPI3w7kq/was=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QD4RAsdwf8VyCs1ovST49geUWITQhk6L2/eTaueloq7cUw7dV+fd6FIBaLLad+1le
	 pd6bKlTTfh5ruBgTMXqW422DfIYFVeUSq+KKx0WN2UDX8ZFPiXUYYg2U8grnpeTE+F
	 vwLdpmm6f1p/FoDw1NHHodDZGgj4Av/KoyeLrDpmgVPAZlaawb5gLigh3yeCvWRGWL
	 1zwJc+NVpOa3cfDhPQc/EfFnY0oaQH9yV6MC/eht1qRpQHzwTDtmYQ3UQWhGiNhbqG
	 Ts/ErccBJ7BSi8lOTazHQd4k/7skhWo10garv7kPi26T1LTqIHp3cmjw/EhlV3qpaF
	 5tr9ghLGHDXwQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 01/12] lib/crypto: nh: Add NH library
Date: Wed, 10 Dec 2025 17:18:33 -0800
Message-ID: <20251211011846.8179-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211011846.8179-1-ebiggers@kernel.org>
References: <20251211011846.8179-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add support for the NH "almost-universal hash function" to lib/crypto/,
specifically the variant of NH used in Adiantum.

This will replace the need for the "nhpoly1305" crypto_shash algorithm.
All the implementations of "nhpoly1305" use architecture-optimized code
only for the NH stage; they just use the generic C Poly1305 code for the
Poly1305 stage.  We can achieve the same result in a simpler way using
an (architecture-optimized) nh() function combined with code in
crypto/adiantum.c that passes the results to the Poly1305 library.

This commit begins this cleanup by adding the nh() function.  The code
is derived from crypto/nhpoly1305.c and include/crypto/nhpoly1305.h.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/nh.h | 52 ++++++++++++++++++++++++++++
 lib/crypto/Kconfig  | 10 ++++++
 lib/crypto/Makefile |  8 +++++
 lib/crypto/nh.c     | 82 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 152 insertions(+)
 create mode 100644 include/crypto/nh.h
 create mode 100644 lib/crypto/nh.c

diff --git a/include/crypto/nh.h b/include/crypto/nh.h
new file mode 100644
index 000000000000..465e85bf203f
--- /dev/null
+++ b/include/crypto/nh.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * NH hash function for Adiantum
+ */
+
+#ifndef _CRYPTO_NH_H
+#define _CRYPTO_NH_H
+
+#include <linux/types.h>
+
+/* NH parameterization: */
+
+/* Endianness: little */
+/* Word size: 32 bits (works well on NEON, SSE2, AVX2) */
+
+/* Stride: 2 words (optimal on ARM32 NEON; works okay on other CPUs too) */
+#define NH_PAIR_STRIDE		2
+#define NH_MESSAGE_UNIT		(NH_PAIR_STRIDE * 2 * sizeof(u32))
+
+/* Num passes (Toeplitz iteration count): 4, to give ε = 2^{-128} */
+#define NH_NUM_PASSES		4
+#define NH_HASH_BYTES		(NH_NUM_PASSES * sizeof(u64))
+
+/* Max message size: 1024 bytes (32x compression factor) */
+#define NH_NUM_STRIDES		64
+#define NH_MESSAGE_WORDS	(NH_PAIR_STRIDE * 2 * NH_NUM_STRIDES)
+#define NH_MESSAGE_BYTES	(NH_MESSAGE_WORDS * sizeof(u32))
+#define NH_KEY_WORDS		(NH_MESSAGE_WORDS + \
+				 NH_PAIR_STRIDE * 2 * (NH_NUM_PASSES - 1))
+#define NH_KEY_BYTES		(NH_KEY_WORDS * sizeof(u32))
+
+/**
+ * nh() - NH hash function for Adiantum
+ * @key: The key.  @message_len + 48 bytes of it are used.  This is NH_KEY_BYTES
+ *	 if @message_len has its maximum length of NH_MESSAGE_BYTES.
+ * @message: The message
+ * @message_len: The message length in bytes.  Must be a multiple of 16
+ *		 (NH_MESSAGE_UNIT) and at most 1024 (NH_MESSAGE_BYTES).
+ * @hash: (output) The resulting hash value
+ *
+ * Note: the pseudocode for NH in the Adiantum paper iterates over 1024-byte
+ * segments of the message, computes a 32-byte hash for each, and returns all
+ * the hashes concatenated together.  In contrast, this function just hashes one
+ * segment and returns one hash.  It's the caller's responsibility to call this
+ * function for each 1024-byte segment and collect all the hashes.
+ *
+ * Context: Any context.
+ */
+void nh(const u32 *key, const u8 *message, size_t message_len,
+	__le64 hash[NH_NUM_PASSES]);
+
+#endif /* _CRYPTO_NH_H */
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index ee6ab129d0cf..f14c9f5974d8 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -106,10 +106,20 @@ config CRYPTO_LIB_MLDSA
 	select CRYPTO_LIB_SHA3
 	help
 	  The ML-DSA library functions.  Select this if your module uses any of
 	  the functions from <crypto/mldsa.h>.
 
+config CRYPTO_LIB_NH
+	tristate
+	help
+	  Implementation of the NH almost-universal hash function, specifically
+	  the variant of NH used in Adiantum.
+
+config CRYPTO_LIB_NH_ARCH
+	bool
+	depends on CRYPTO_LIB_NH && !UML
+
 config CRYPTO_LIB_POLY1305
 	tristate
 	help
 	  The Poly1305 library functions.  Select this if your module uses any
 	  of the functions from <crypto/poly1305.h>.
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index a0578105266f..929b84568809 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -129,10 +129,18 @@ endif # CONFIG_CRYPTO_LIB_MD5_ARCH
 obj-$(CONFIG_CRYPTO_LIB_MLDSA) += libmldsa.o
 libmldsa-y := mldsa.o
 
 ################################################################################
 
+obj-$(CONFIG_CRYPTO_LIB_NH) += libnh.o
+libnh-y := nh.o
+ifeq ($(CONFIG_CRYPTO_LIB_NH_ARCH),y)
+CFLAGS_nh.o += -I$(src)/$(SRCARCH)
+endif
+
+################################################################################
+
 obj-$(CONFIG_CRYPTO_LIB_POLY1305) += libpoly1305.o
 libpoly1305-y := poly1305.o
 ifeq ($(CONFIG_ARCH_SUPPORTS_INT128),y)
 libpoly1305-$(CONFIG_CRYPTO_LIB_POLY1305_GENERIC) += poly1305-donna64.o
 else
diff --git a/lib/crypto/nh.c b/lib/crypto/nh.c
new file mode 100644
index 000000000000..e1d0095b5289
--- /dev/null
+++ b/lib/crypto/nh.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2018 Google LLC
+ */
+
+/*
+ * Implementation of the NH almost-universal hash function, specifically the
+ * variant of NH used in Adiantum.  This is *not* a cryptographic hash function.
+ *
+ * Reference: section 6.3 of "Adiantum: length-preserving encryption for
+ * entry-level processors" (https://eprint.iacr.org/2018/720.pdf).
+ */
+
+#include <crypto/nh.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/unaligned.h>
+
+#ifdef CONFIG_CRYPTO_LIB_NH_ARCH
+#include "nh.h" /* $(SRCARCH)/nh.h */
+#else
+static bool nh_arch(const u32 *key, const u8 *message, size_t message_len,
+		    __le64 hash[NH_NUM_PASSES])
+{
+	return false;
+}
+#endif
+
+void nh(const u32 *key, const u8 *message, size_t message_len,
+	__le64 hash[NH_NUM_PASSES])
+{
+	u64 sums[4] = { 0, 0, 0, 0 };
+
+	if (nh_arch(key, message, message_len, hash))
+		return;
+
+	static_assert(NH_PAIR_STRIDE == 2);
+	static_assert(NH_NUM_PASSES == 4);
+
+	while (message_len) {
+		u32 m0 = get_unaligned_le32(message + 0);
+		u32 m1 = get_unaligned_le32(message + 4);
+		u32 m2 = get_unaligned_le32(message + 8);
+		u32 m3 = get_unaligned_le32(message + 12);
+
+		sums[0] += (u64)(u32)(m0 + key[0]) * (u32)(m2 + key[2]);
+		sums[1] += (u64)(u32)(m0 + key[4]) * (u32)(m2 + key[6]);
+		sums[2] += (u64)(u32)(m0 + key[8]) * (u32)(m2 + key[10]);
+		sums[3] += (u64)(u32)(m0 + key[12]) * (u32)(m2 + key[14]);
+		sums[0] += (u64)(u32)(m1 + key[1]) * (u32)(m3 + key[3]);
+		sums[1] += (u64)(u32)(m1 + key[5]) * (u32)(m3 + key[7]);
+		sums[2] += (u64)(u32)(m1 + key[9]) * (u32)(m3 + key[11]);
+		sums[3] += (u64)(u32)(m1 + key[13]) * (u32)(m3 + key[15]);
+		key += NH_MESSAGE_UNIT / sizeof(key[0]);
+		message += NH_MESSAGE_UNIT;
+		message_len -= NH_MESSAGE_UNIT;
+	}
+
+	hash[0] = cpu_to_le64(sums[0]);
+	hash[1] = cpu_to_le64(sums[1]);
+	hash[2] = cpu_to_le64(sums[2]);
+	hash[3] = cpu_to_le64(sums[3]);
+}
+EXPORT_SYMBOL_GPL(nh);
+
+#ifdef nh_mod_init_arch
+static int __init nh_mod_init(void)
+{
+	nh_mod_init_arch();
+	return 0;
+}
+subsys_initcall(nh_mod_init);
+
+static void __exit nh_mod_exit(void)
+{
+}
+module_exit(nh_mod_exit);
+#endif
+
+MODULE_DESCRIPTION("NH almost-universal hash function");
+MODULE_LICENSE("GPL");
-- 
2.52.0


