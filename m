Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FA3E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vplc+E9xxyBBHDPTbBG8FWhVR40FGpUWPQCz5RKvbic=; b=OAPhub7Oxsi9OM901zGmqt5g2W
	2lHD0jrXugtvIXhblNy4JIGNcKZ4k3vJnr4hJm24fMwEtyP3I4Af36+3WOwnSPQeSHntzGfGpU7zE
	XuXHnkh0AUqCUkZsPBn54/5F68J+6szScLKbbMZdSM50R6Ie+OD7V1PFYZC5Wxjuvi6MxnkRzIKBi
	XTba3KQgPWdiIzzsxwbhzHnD4IQpCvLI/b5dkoc5yWVrQ9i1VQCkhdLxzgBqUVXVlPSdo+kxstsGO
	nrhOC3/v2sRsSu9ssmh15nrBdn0nXKt6IsRDBP9mjg575G9zGZ6EvOb6Wr+8zUaiGs/zIrJSaLR+J
	g4emSfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspEF-0000000ASVI-3cmM;
	Wed, 18 Feb 2026 21:37:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspE6-0000000ASQC-3Tjt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 21:36:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F1C66185F;
	Wed, 18 Feb 2026 21:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BBBCC2BC86;
	Wed, 18 Feb 2026 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771450614;
	bh=rAp5p3HDmh8Bp7UNW6r+uRPuPyK59EaigYeIc+rCLB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bS8mXGBZIZm7D0xIRb2dfANtTBm2nMQJn6ZJn7qSQafN8cLWnn0Tj4h0VgxNQmDFf
	 2zlPR/kUlg3EUQfA87QF3iw4xHUotS7vyUwK4Jzwua2Rzc/Stfkx6codz/EwHcw338
	 xoq5em8nIQnw9Nw0mHlnIE+SUx4U5hbuGRJxM7+k/tLlnsTVuBGBtE74MfMJqGqeTb
	 4d6ch0xmQPfPHj6odH2o+0FK/dZs4Yb75iBZOL2Q8WfXY++UMA/7GVcKP9XhWJG7zN
	 SauD09ZbBVfcBZCmwC8nyVrjJQ0MegCrEzksJtgY0Fz8tXfPq9BLYaLStNBWJVwLBl
	 RhYga15fgJqXA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 07/15] lib/crypto: aes: Add FIPS self-test for CMAC
Date: Wed, 18 Feb 2026 13:34:53 -0800
Message-ID: <20260218213501.136844-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218213501.136844-1-ebiggers@kernel.org>
References: <20260218213501.136844-1-ebiggers@kernel.org>
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

Add a FIPS cryptographic algorithm self-test for AES-CMAC to fulfill the
self-test requirement when this code is built into a FIPS 140
cryptographic module.  This provides parity with the traditional crypto
API, which uses crypto/testmgr.c to meet the FIPS self-test requirement.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/aes.c                    | 35 ++++++++++++++++++++++++++---
 lib/crypto/fips.h                   |  5 +++++
 scripts/crypto/gen-fips-testvecs.py | 10 +++++++++
 3 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
index 39deae6105c0..ca733f15b2a8 100644
--- a/lib/crypto/aes.c
+++ b/lib/crypto/aes.c
@@ -10,10 +10,11 @@
 #include <linux/cache.h>
 #include <linux/crypto.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/unaligned.h>
+#include "fips.h"
 
 static const u8 ____cacheline_aligned aes_sbox[] = {
 	0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5,
 	0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
 	0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0,
@@ -706,25 +707,53 @@ void aes_cbcmac_final(struct aes_cbcmac_ctx *ctx, u8 out[AES_BLOCK_SIZE])
 	else
 		memcpy(out, ctx->h, AES_BLOCK_SIZE);
 	memzero_explicit(ctx, sizeof(*ctx));
 }
 EXPORT_SYMBOL_NS_GPL(aes_cbcmac_final, "CRYPTO_INTERNAL");
-#endif /* CONFIG_CRYPTO_LIB_AES_CBC_MACS */
 
-#ifdef aes_mod_init_arch
+/*
+ * FIPS cryptographic algorithm self-test for AES-CMAC.  As per the FIPS 140-3
+ * Implementation Guidance, a cryptographic algorithm self-test for at least one
+ * of AES-GCM, AES-CCM, AES-CMAC, or AES-GMAC is required if any of those modes
+ * is implemented.  This fulfills that requirement via AES-CMAC.
+ *
+ * This is just for FIPS.  The full tests are in the KUnit test suite.
+ */
+static void __init aes_cmac_fips_test(void)
+{
+	struct aes_cmac_key key;
+	u8 mac[AES_BLOCK_SIZE];
+
+	if (aes_cmac_preparekey(&key, fips_test_key, sizeof(fips_test_key)) !=
+	    0)
+		panic("aes: CMAC FIPS self-test failed (preparekey)\n");
+	aes_cmac(&key, fips_test_data, sizeof(fips_test_data), mac);
+	if (memcmp(fips_test_aes_cmac_value, mac, sizeof(mac)) != 0)
+		panic("aes: CMAC FIPS self-test failed (wrong MAC)\n");
+	memzero_explicit(&key, sizeof(key));
+}
+#else /* CONFIG_CRYPTO_LIB_AES_CBC_MACS */
+static inline void aes_cmac_fips_test(void)
+{
+}
+#endif /* !CONFIG_CRYPTO_LIB_AES_CBC_MACS */
+
 static int __init aes_mod_init(void)
 {
+#ifdef aes_mod_init_arch
 	aes_mod_init_arch();
+#endif
+	if (fips_enabled)
+		aes_cmac_fips_test();
 	return 0;
 }
 subsys_initcall(aes_mod_init);
 
 static void __exit aes_mod_exit(void)
 {
 }
 module_exit(aes_mod_exit);
-#endif
 
 MODULE_DESCRIPTION("AES block cipher");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_AUTHOR("Eric Biggers <ebiggers@kernel.org>");
 MODULE_LICENSE("GPL v2");
diff --git a/lib/crypto/fips.h b/lib/crypto/fips.h
index 023410c2e0db..9fc49747db64 100644
--- a/lib/crypto/fips.h
+++ b/lib/crypto/fips.h
@@ -41,5 +41,10 @@ static const u8 fips_test_sha3_256_value[] __initconst __maybe_unused = {
 	0x77, 0xc4, 0x8b, 0x69, 0x70, 0x5f, 0x0a, 0xb1,
 	0xb1, 0xa5, 0x82, 0x0a, 0x22, 0x2b, 0x49, 0x31,
 	0xba, 0x9b, 0xb6, 0xaa, 0x32, 0xa7, 0x97, 0x00,
 	0x98, 0xdb, 0xff, 0xe7, 0xc6, 0xde, 0xb5, 0x82,
 };
+
+static const u8 fips_test_aes_cmac_value[] __initconst __maybe_unused = {
+	0xc5, 0x88, 0x28, 0x55, 0xd7, 0x2c, 0x00, 0xb6,
+	0x6a, 0xa7, 0xfc, 0x82, 0x90, 0x81, 0xcf, 0x18,
+};
diff --git a/scripts/crypto/gen-fips-testvecs.py b/scripts/crypto/gen-fips-testvecs.py
index db873f88619a..9f18bcb97412 100755
--- a/scripts/crypto/gen-fips-testvecs.py
+++ b/scripts/crypto/gen-fips-testvecs.py
@@ -1,12 +1,16 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
 # Script that generates lib/crypto/fips.h
 #
+# Requires that python-cryptography be installed.
+#
 # Copyright 2025 Google LLC
 
+import cryptography.hazmat.primitives.ciphers
+import cryptography.hazmat.primitives.cmac
 import hashlib
 import hmac
 
 fips_test_data = b"fips test data\0\0"
 fips_test_key = b"fips test key\0\0\0"
@@ -32,5 +36,11 @@ for alg in 'sha1', 'sha256', 'sha512':
     ctx.update(fips_test_data)
     print_static_u8_array_definition(f'fips_test_hmac_{alg}_value', ctx.digest())
 
 print_static_u8_array_definition(f'fips_test_sha3_256_value',
                                  hashlib.sha3_256(fips_test_data).digest())
+
+aes = cryptography.hazmat.primitives.ciphers.algorithms.AES(fips_test_key)
+aes_cmac = cryptography.hazmat.primitives.cmac.CMAC(aes)
+aes_cmac.update(fips_test_data)
+print_static_u8_array_definition('fips_test_aes_cmac_value',
+                                 aes_cmac.finalize())
-- 
2.53.0


