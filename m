Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE88ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 05:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=de1QhoX+ma3xTylSfmo3Lx8SryrFi2py9hcfMXmY464=; b=cDGOP7iXOWvGZqSRgvMM0CjQD4
	vDt8lNw87MGktHm7rTKXIS2EAfFXu0ysx84Y0c1p3UnMxhAFDAEcJyfJlfhh56VFPMX+mbobk6JWX
	lVQx4s8F5AknFSaIKcNV8U+Kk+AI750nQMYeW1coTwKEw9ddWXuQ/vq1mENn/+GdQKO7qx3/OjYgF
	cjy+CQ8JhB5yekSVZk3wVB78nlRvo9+l8NiOkk0+0rbbQ9Q+kvPwpSrBWIsu/kJm18eYGCWz6cqR7
	4I9uJ3oERt1wCr4TXvddWsk5ioU1r7g7IN1Y/BxqnrBuUkglvk6TT18aQoec5FcRcLyZjj2OBH26E
	ehMXzeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgm-0000000C2pE-1rXO;
	Sun, 26 Oct 2025 05:53:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgg-0000000C2k5-3Ml2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 05:53:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78D4944C3B;
	Sun, 26 Oct 2025 05:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA00C116C6;
	Sun, 26 Oct 2025 05:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761457986;
	bh=emlkY+5nNYi2ijHBbHH5c1+/nTs6+mI5TfOU5NxkBH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M/HDHsbI8X4Ka6VopNPe2FePuOltDSqHCT7iRjQTHzAntSOa3ktqhNOaVG4ORtJrN
	 JJinlHRql8sJ2ZUmE6kSRGdJ7X/k0wqgCasH10F4v1Te63aQVGpZnVtN0L/FiKd454
	 oNcpIkrSxJrBM9Q6uQJYwAiEpUxO5pHK2yBCG0yqpvvdzHDrSIXcIo0Q8n38hkEcoq
	 uv3U3ZgyGclFqOy5WWCwAfohpB2TRuCdJptorIZAuJqk0CwmIFtKC5goTttmNhNcBM
	 rz9DgLySiS15sGVFeJ2ILXK07YyjrxA7R6Gg6Ag2ZmrgG2mz7gnHJ08/GAfLU85yaJ
	 jZjPkbNjWt+5w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/15] lib/crypto: sha3: Add FIPS cryptographic algorithm self-test
Date: Sat, 25 Oct 2025 22:50:24 -0700
Message-ID: <20251026055032.1413733-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251026055032.1413733-1-ebiggers@kernel.org>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_225306_900444_BDD502A4 
X-CRM114-Status: GOOD (  16.28  )
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

Since the SHA-3 algorithms are FIPS-approved, add the boot-time
self-test which is apparently required.  This closely follows the
corresponding SHA-1, SHA-256, and SHA-512 tests.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 Documentation/crypto/sha3.rst       |  5 +++++
 lib/crypto/fips.h                   |  7 +++++++
 lib/crypto/sha3.c                   | 17 ++++++++++++++++-
 scripts/crypto/gen-fips-testvecs.py |  4 ++++
 4 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/crypto/sha3.rst b/Documentation/crypto/sha3.rst
index f8c484feaa291..37640f295118b 100644
--- a/Documentation/crypto/sha3.rst
+++ b/Documentation/crypto/sha3.rst
@@ -110,10 +110,15 @@ Once all the desired output has been extracted, zeroize the context::
 Testing
 =======
 
 To test the SHA-3 code, use sha3_kunit (CONFIG_CRYPTO_LIB_SHA3_KUNIT_TEST).
 
+Since the SHA-3 algorithms are FIPS-approved, when the kernel is booted in FIPS
+mode the SHA-3 library also performs a simple self-test.  This is purely to meet
+a FIPS requirement.  Normal testing done by kernel developers and integrators
+should use the much more comprehensive KUnit test suite instead.
+
 
 References
 ==========
 
 .. [1] https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
diff --git a/lib/crypto/fips.h b/lib/crypto/fips.h
index 78a1bdd33a151..023410c2e0dbc 100644
--- a/lib/crypto/fips.h
+++ b/lib/crypto/fips.h
@@ -34,5 +34,12 @@ static const u8 fips_test_hmac_sha512_value[] __initconst __maybe_unused = {
 	0x92, 0x7e, 0x3c, 0xbd, 0xb1, 0x3c, 0x49, 0x98,
 	0x44, 0x9c, 0x8f, 0xee, 0x3f, 0x02, 0x71, 0x51,
 	0x57, 0x0b, 0x15, 0x38, 0x95, 0xd8, 0xa3, 0x81,
 	0xba, 0xb3, 0x15, 0x37, 0x5c, 0x6d, 0x57, 0x2b,
 };
+
+static const u8 fips_test_sha3_256_value[] __initconst __maybe_unused = {
+	0x77, 0xc4, 0x8b, 0x69, 0x70, 0x5f, 0x0a, 0xb1,
+	0xb1, 0xa5, 0x82, 0x0a, 0x22, 0x2b, 0x49, 0x31,
+	0xba, 0x9b, 0xb6, 0xaa, 0x32, 0xa7, 0x97, 0x00,
+	0x98, 0xdb, 0xff, 0xe7, 0xc6, 0xde, 0xb5, 0x82,
+};
diff --git a/lib/crypto/sha3.c b/lib/crypto/sha3.c
index ee7a2ca92b2c5..6c94b4ebd0fd1 100644
--- a/lib/crypto/sha3.c
+++ b/lib/crypto/sha3.c
@@ -15,10 +15,11 @@
 #include <crypto/utils.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/unaligned.h>
+#include "fips.h"
 
 /*
  * On some 32-bit architectures, such as h8300, GCC ends up using over 1 KB of
  * stack if the round calculation gets inlined into the loop in
  * sha3_keccakf_generic().  On the other hand, on 64-bit architectures with
@@ -339,14 +340,28 @@ void shake256(const u8 *in, size_t in_len, u8 *out, size_t out_len)
 	shake_squeeze(&ctx, out, out_len);
 	shake_zeroize_ctx(&ctx);
 }
 EXPORT_SYMBOL_GPL(shake256);
 
-#ifdef sha3_mod_init_arch
+#if defined(sha3_mod_init_arch) || defined(CONFIG_CRYPTO_FIPS)
 static int __init sha3_mod_init(void)
 {
+#ifdef sha3_mod_init_arch
 	sha3_mod_init_arch();
+#endif
+	if (fips_enabled) {
+		/*
+		 * FIPS cryptographic algorithm self-test.  As per the FIPS
+		 * Implementation Guidance, testing any SHA-3 algorithm
+		 * satisfies the test requirement for all of them.
+		 */
+		u8 hash[SHA3_256_DIGEST_SIZE];
+
+		sha3_256(fips_test_data, sizeof(fips_test_data), hash);
+		if (memcmp(fips_test_sha3_256_value, hash, sizeof(hash)) != 0)
+			panic("sha3: FIPS self-test failed\n");
+	}
 	return 0;
 }
 subsys_initcall(sha3_mod_init);
 
 static void __exit sha3_mod_exit(void)
diff --git a/scripts/crypto/gen-fips-testvecs.py b/scripts/crypto/gen-fips-testvecs.py
index 2956f88b764ae..db873f88619ac 100755
--- a/scripts/crypto/gen-fips-testvecs.py
+++ b/scripts/crypto/gen-fips-testvecs.py
@@ -3,10 +3,11 @@
 #
 # Script that generates lib/crypto/fips.h
 #
 # Copyright 2025 Google LLC
 
+import hashlib
 import hmac
 
 fips_test_data = b"fips test data\0\0"
 fips_test_key = b"fips test key\0\0\0"
 
@@ -28,5 +29,8 @@ print_static_u8_array_definition("fips_test_key", fips_test_key)
 
 for alg in 'sha1', 'sha256', 'sha512':
     ctx = hmac.new(fips_test_key, digestmod=alg)
     ctx.update(fips_test_data)
     print_static_u8_array_definition(f'fips_test_hmac_{alg}_value', ctx.digest())
+
+print_static_u8_array_definition(f'fips_test_sha3_256_value',
+                                 hashlib.sha3_256(fips_test_data).digest())
-- 
2.51.1.dirty


