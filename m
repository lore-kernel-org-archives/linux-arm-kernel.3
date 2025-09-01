Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2260ACA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evWNLDxoIMakaSVwQ6RW7eiTaRyquDIws1xqtj7Wyhs=; b=yzKUHtWboig+7VarUOduMzPs5d
	85nNB/X4V06+Y/8dCTeHsBq00/bMU9XZ/RSjmZ+YT8DmG9iABeBbZ7sLfFMhjiODSJb5X1Wtv9rJe
	oNZ3V8cAVcbXlPFDnj2R8gpNffWyt5cYY6wwe3oXWABRCYTElP2TiwhTead+a1uafSqphZ+/06p4O
	60Y3goE0soG2FfK8l7DRsmCRcTfwkDVqe+yTT+d97std1wfSBN0qTy1/8dMInzZXQqsZI/iJMUtSb
	XHz/v2UERJ+eZWA1RnA01KLPXSGozHCO17mfBoa1fJfhu3WNTF33aoWLyL0CaCXL/I4sh8R+7lq+8
	eov6K+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnL-0000000EIMt-1Uqo;
	Mon, 01 Sep 2025 23:18:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB0W-0000000DliB-2KsV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:20:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD95F601E9;
	Mon,  1 Sep 2025 20:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADC5C4CEF8;
	Mon,  1 Sep 2025 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758003;
	bh=B4da0sr/1oBe4AmbJczL0wIT7JYsT0YINmNYebZKB44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GLje4ObURs0AGgQcFtcHhk6kCFuQNIYlyP3AEmiI73Sq7Aebso3Dz380GNUscTJB6
	 KZzZCGDWwcAPPug+EFZ2FzGj81KzB9UV6/Ln8lop6aB6oziE3tX0egzOHzW26/QFsR
	 IImlAUrPHz2ovBLNF0EaHih23PpyFmCJOVqrKSkw3lvct3gHeRjCW3EaR1zszkoqDB
	 7lVmqgoZYRH13bXXBKG3jr4qy314DlGwuvSeVTxVdr1F82fZ7T63ZBb68doQu00LRU
	 /jm2iANXWDd5Z9EsNepYkeoFPC6qK2u8B9KSGaRNlmfaPaPBKNLqKfAfqXY3l1BBBW
	 KlS7/CF3nMzWw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 2/6] lib/crypto: tests: Migrate Curve25519 self-test to KUnit
Date: Mon,  1 Sep 2025 13:18:11 -0700
Message-ID: <20250901201815.594177-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901201815.594177-1-ebiggers@kernel.org>
References: <20250901201815.594177-1-ebiggers@kernel.org>
MIME-Version: 1.0
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

Move the Curve25519 test from an ad-hoc self-test to a KUnit test.

Generally keep the same test logic for now, just translated to KUnit.
There's one exception, which is that I dropped the incomplete test of
curve25519_generic().  The approach I'm taking to cover the different
implementations with the KUnit tests is to just rely on booting kernels
in QEMU with different '-cpu' options, rather than try to make the tests
(incompletely) test multiple implementations on one CPU.  This way, both
the test and the library API are simpler.

This commit makes the file lib/crypto/curve25519.c no longer needed, as
its only purpose was to call the self-test.  However, keep it for now,
since a later commit will add code to it again.

Temporarily omit the default value of CRYPTO_SELFTESTS that the other
lib/crypto/ KUnit tests have.  It would cause a recursive kconfig
dependency, since the Curve25519 code is still entangled with CRYPTO.  A
later commit will fix that.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/curve25519.h                   |  2 -
 lib/crypto/Makefile                           |  1 -
 lib/crypto/curve25519.c                       |  3 -
 lib/crypto/tests/Kconfig                      |  9 +++
 lib/crypto/tests/Makefile                     |  1 +
 .../curve25519_kunit.c}                       | 71 +++++++++++--------
 6 files changed, 51 insertions(+), 36 deletions(-)
 rename lib/crypto/{curve25519-selftest.c => tests/curve25519_kunit.c} (97%)

diff --git a/include/crypto/curve25519.h b/include/crypto/curve25519.h
index ece6a9b5fafc8..4e6dc840b1592 100644
--- a/include/crypto/curve25519.h
+++ b/include/crypto/curve25519.h
@@ -26,12 +26,10 @@ void curve25519_arch(u8 out[CURVE25519_KEY_SIZE],
 		     const u8 point[CURVE25519_KEY_SIZE]);
 
 void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
 			  const u8 secret[CURVE25519_KEY_SIZE]);
 
-bool curve25519_selftest(void);
-
 static inline
 bool __must_check curve25519(u8 mypublic[CURVE25519_KEY_SIZE],
 			     const u8 secret[CURVE25519_KEY_SIZE],
 			     const u8 basepoint[CURVE25519_KEY_SIZE])
 {
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index ad27c5bf99e11..6c3be971ace09 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -85,11 +85,10 @@ ifeq ($(call clang-min-version, 180000),)
 KASAN_SANITIZE_curve25519-hacl64.o := n
 endif
 
 obj-$(CONFIG_CRYPTO_LIB_CURVE25519)		+= libcurve25519.o
 libcurve25519-y					+= curve25519.o
-libcurve25519-$(CONFIG_CRYPTO_SELFTESTS)	+= curve25519-selftest.o
 
 obj-$(CONFIG_CRYPTO_LIB_DES)			+= libdes.o
 libdes-y					:= des.o
 
 ################################################################################
diff --git a/lib/crypto/curve25519.c b/lib/crypto/curve25519.c
index 6850b76a80c9e..25f16777865bf 100644
--- a/lib/crypto/curve25519.c
+++ b/lib/crypto/curve25519.c
@@ -13,13 +13,10 @@
 #include <linux/module.h>
 #include <linux/init.h>
 
 static int __init curve25519_init(void)
 {
-	if (IS_ENABLED(CONFIG_CRYPTO_SELFTESTS) &&
-	    WARN_ON(!curve25519_selftest()))
-		return -ENODEV;
 	return 0;
 }
 
 static void __exit curve25519_exit(void)
 {
diff --git a/lib/crypto/tests/Kconfig b/lib/crypto/tests/Kconfig
index fd341aa12f157..7e4e66f30a7a6 100644
--- a/lib/crypto/tests/Kconfig
+++ b/lib/crypto/tests/Kconfig
@@ -8,10 +8,19 @@ config CRYPTO_LIB_BLAKE2S_KUNIT_TEST
 	# No need to select CRYPTO_LIB_BLAKE2S here, as that option doesn't
 	# exist; the BLAKE2s code is always built-in for the /dev/random driver.
 	help
 	  KUnit tests for the BLAKE2s cryptographic hash function.
 
+config CRYPTO_LIB_CURVE25519_KUNIT_TEST
+	tristate "KUnit tests for Curve25519" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	select CRYPTO_LIB_BENCHMARK_VISIBLE
+	select CRYPTO_LIB_CURVE25519
+	help
+	  KUnit tests for Curve25519.
+
 config CRYPTO_LIB_MD5_KUNIT_TEST
 	tristate "KUnit tests for MD5" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
 	select CRYPTO_LIB_BENCHMARK_VISIBLE
diff --git a/lib/crypto/tests/Makefile b/lib/crypto/tests/Makefile
index be7de929af2cc..a71fad19922ba 100644
--- a/lib/crypto/tests/Makefile
+++ b/lib/crypto/tests/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
 obj-$(CONFIG_CRYPTO_LIB_BLAKE2S_KUNIT_TEST) += blake2s_kunit.o
+obj-$(CONFIG_CRYPTO_LIB_CURVE25519_KUNIT_TEST) += curve25519_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_MD5_KUNIT_TEST) += md5_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_POLY1305_KUNIT_TEST) += poly1305_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA1_KUNIT_TEST) += sha1_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA256_KUNIT_TEST) += sha224_kunit.o sha256_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA512_KUNIT_TEST) += sha384_kunit.o sha512_kunit.o
diff --git a/lib/crypto/curve25519-selftest.c b/lib/crypto/tests/curve25519_kunit.c
similarity index 97%
rename from lib/crypto/curve25519-selftest.c
rename to lib/crypto/tests/curve25519_kunit.c
index c85e85381e788..585f7ad3ed5f7 100644
--- a/lib/crypto/curve25519-selftest.c
+++ b/lib/crypto/tests/curve25519_kunit.c
@@ -2,18 +2,19 @@
 /*
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
 
 #include <crypto/curve25519.h>
+#include <kunit/test.h>
 
 struct curve25519_test_vector {
 	u8 private[CURVE25519_KEY_SIZE];
 	u8 public[CURVE25519_KEY_SIZE];
 	u8 result[CURVE25519_KEY_SIZE];
 	bool valid;
 };
-static const struct curve25519_test_vector curve25519_test_vectors[] __initconst = {
+static const struct curve25519_test_vector curve25519_test_vectors[] = {
 	{
 		.private = { 0x77, 0x07, 0x6d, 0x0a, 0x73, 0x18, 0xa5, 0x7d,
 			     0x3c, 0x16, 0xc1, 0x72, 0x51, 0xb2, 0x66, 0x45,
 			     0xdf, 0x4c, 0x2f, 0x87, 0xeb, 0xc0, 0x99, 0x2a,
 			     0xb1, 0x77, 0xfb, 0xa5, 0x1d, 0xb9, 0x2c, 0x2a },
@@ -1278,44 +1279,54 @@ static const struct curve25519_test_vector curve25519_test_vectors[] __initconst
 			    0xd9, 0x8b, 0xb9, 0x1b, 0x3e, 0x0b, 0xe0, 0x35 },
 		.valid = true
 	}
 };
 
-bool __init curve25519_selftest(void)
+static void test_curve25519(struct kunit *test)
 {
-	bool success = true, ret, ret2;
-	size_t i = 0, j;
-	u8 in[CURVE25519_KEY_SIZE];
-	u8 out[CURVE25519_KEY_SIZE], out2[CURVE25519_KEY_SIZE],
-	   out3[CURVE25519_KEY_SIZE];
+	for (size_t i = 0; i < ARRAY_SIZE(curve25519_test_vectors); ++i) {
+		const struct curve25519_test_vector *vec =
+			&curve25519_test_vectors[i];
+		u8 out[CURVE25519_KEY_SIZE];
+		bool ret;
 
-	for (i = 0; i < ARRAY_SIZE(curve25519_test_vectors); ++i) {
 		memset(out, 0, CURVE25519_KEY_SIZE);
-		ret = curve25519(out, curve25519_test_vectors[i].private,
-				 curve25519_test_vectors[i].public);
-		if (ret != curve25519_test_vectors[i].valid ||
-		    memcmp(out, curve25519_test_vectors[i].result,
-			   CURVE25519_KEY_SIZE)) {
-			pr_err("curve25519 self-test %zu: FAIL\n", i + 1);
-			success = false;
-		}
+		ret = curve25519(out, vec->private, vec->public);
+		KUNIT_EXPECT_EQ_MSG(test, ret, vec->valid,
+				    "Wrong return value with test vector %zu\n",
+				    i);
+		KUNIT_EXPECT_MEMEQ_MSG(test, out, vec->result,
+				       CURVE25519_KEY_SIZE,
+				       "Wrong output with test vector %zu\n",
+				       i);
 	}
+}
+
+static void test_curve25519_basepoint(struct kunit *test)
+{
+	for (size_t i = 0; i < 5; ++i) {
+		u8 in[CURVE25519_KEY_SIZE];
+		u8 out[CURVE25519_KEY_SIZE];
+		u8 out2[CURVE25519_KEY_SIZE];
+		bool ret, ret2;
 
-	for (i = 0; i < 5; ++i) {
 		get_random_bytes(in, sizeof(in));
 		ret = curve25519_generate_public(out, in);
 		ret2 = curve25519(out2, in, (u8[CURVE25519_KEY_SIZE]){ 9 });
-		curve25519_generic(out3, in, (u8[CURVE25519_KEY_SIZE]){ 9 });
-		if (ret != ret2 ||
-		    memcmp(out, out2, CURVE25519_KEY_SIZE) ||
-		    memcmp(out, out3, CURVE25519_KEY_SIZE)) {
-			pr_err("curve25519 basepoint self-test %zu: FAIL: input - 0x",
-			       i + 1);
-			for (j = CURVE25519_KEY_SIZE; j-- > 0;)
-				printk(KERN_CONT "%02x", in[j]);
-			printk(KERN_CONT "\n");
-			success = false;
-		}
+		KUNIT_EXPECT_EQ_MSG(test, ret, ret2,
+				    "in=%*phN", CURVE25519_KEY_SIZE, in);
+		KUNIT_EXPECT_MEMEQ_MSG(test, out, out2, CURVE25519_KEY_SIZE,
+				       "in=%*phN", CURVE25519_KEY_SIZE, in);
 	}
-
-	return success;
 }
+
+static struct kunit_case curve25519_test_cases[] = {
+	KUNIT_CASE(test_curve25519),
+	KUNIT_CASE(test_curve25519_basepoint),
+	{},
+};
+
+static struct kunit_suite curve25519_test_suite = {
+	.name = "curve25519",
+	.test_cases = curve25519_test_cases,
+};
+kunit_test_suite(curve25519_test_suite);
-- 
2.50.1


