Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71815EDF023
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrfzSoQbYKEAHAMOMCrXzmBVp7QZGA3rOkELb9z5dlA=; b=0QXEakSlXpYqve+Czut7zrUsTR
	dv+E5z9eLNZ6B757SVg1HCAARBe+Jxbrp95z2Hbke9lZGuEQKMB7nzADvzlUmXqn8FNAMZ37624Dw
	GzJjy8/9HtQftGCP/FQeTIZC4qIbZtW/6JGYzLIpL8OKM3rjljPd7Z0R7Z/SLVYTDTb4HpNJI8WSV
	Ab9GMoPBbD0jELhrDw3Bcb/YO1F7ovbcnz7mqwMuNGxVykzyAkqgWZ8t0qS+cXbhaVFozrzisF2Ug
	1uVUxbH6U7aXMjfHgz8AFs41L9WjqUBvJrwRk0h1MeNQ8T833jmfkZY9aD9mwILyCxtahsnLFZLwi
	4yRYLNYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNA9-00000001X1B-01k2;
	Thu, 12 Feb 2026 03:14:41 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNA6-00000001X06-37pA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866078; x=1802402078;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NrfzSoQbYKEAHAMOMCrXzmBVp7QZGA3rOkELb9z5dlA=;
  b=qf2EOveIHxu4QYDrIIbgnK81fvhhW9LWcUMEqnxfwAnmQvmkrIrHEFDx
   t5PbtXznpzKbvgw2JKh2fV24n6BLpO+GZkYspuM6+pe2ZE01VVEyqEPKJ
   wW7ViWxEm237GcDEZarQ8V0xjXLZBb1VQnqg89VOzB8m0LZh3+/zQqu4m
   FzYggFP8oZmv+PIR9MG289Da5wVQmWGSOCR8uKZADhEZciGMn4ub6voMJ
   +Y5oEcI4nk+HYL9INo/9RFkEaeoDfT4ypQsCv7FAyWv6KgqHb8iicsiuc
   hgzhHfwj+ZkOrru7+aVMuWiI586bFegZZAPiU6zt1nbwcUWXI/NjF/ZOx
   A==;
X-CSE-ConnectionGUID: 9cF7UqbnSaKFuEwjqwxQsg==
X-CSE-MsgGUID: CNc4b7kbSeykPI4ft9DKHA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12697508"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:14:37 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:30549]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 0b32ee96-44a4-46d9-9e91-9f26a16eca2d; Thu, 12 Feb 2026 03:14:37 +0000 (UTC)
X-Farcaster-Flow-ID: 0b32ee96-44a4-46d9-9e91-9f26a16eca2d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:14:37 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:14:37 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Luis Chamberlain
	<mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-modules@vger.kernel.org>
Subject: [PATCH 105/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SIMD crypto
Date: Thu, 12 Feb 2026 02:47:21 +0000
Message-ID: <20260212024725.11264-106-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D035UWB001.ant.amazon.com (10.13.138.33) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191438_844798_417D3826 
X-CRM114-Status: GOOD (  14.01  )
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

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_SIMD-related crypto to convert them into pluggable
interface.

This patch is partially based on work by Vegard Nossum, with
modifications. Unlike the original, we do not include
DEFINE_CRYPTO_API since only one copy of the crypto symbols is
kept, either in the crypto module or in the main kernel, and we ensure
such wrapper do not have impact on crypto already chosen built as
module.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile                |  2 +-
 crypto/fips140/fips140-api.c   | 15 +++++++++++++++
 include/crypto/internal/simd.h | 33 ++++++++++++++++++++-------------
 3 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index c1088b10f49a..7403364c9afa 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -200,7 +200,7 @@ crypto-objs-$(CONFIG_XOR_BLOCKS) += xor.o
 obj-$(CONFIG_ASYNC_CORE) += async_tx/
 obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys/
 crypto_simd-y := simd.o
-obj-$(CONFIG_CRYPTO_SIMD) += crypto_simd.o
+crypto-objs-$(CONFIG_CRYPTO_SIMD) += crypto_simd.o
 
 #
 # Key derivation function
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 74eae8815067..126ecd09ae07 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -913,4 +913,19 @@ DEFINE_CRYPTO_API_STUB(crypto_ecdh_decode_key);
 
 DEFINE_CRYPTO_API_STUB(verify_pefile_signature);
 
+#endif
+/*
+ * crypto/simd.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SIMD)
+
+#include <crypto/internal/simd.h>
+
+DEFINE_CRYPTO_API_STUB(simd_skcipher_create_compat);
+DEFINE_CRYPTO_API_STUB(simd_skcipher_free);
+DEFINE_CRYPTO_API_STUB(simd_register_skciphers_compat);
+DEFINE_CRYPTO_API_STUB(simd_unregister_skciphers);
+DEFINE_CRYPTO_API_STUB(simd_register_aeads_compat);
+DEFINE_CRYPTO_API_STUB(simd_unregister_aeads);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/internal/simd.h b/include/crypto/internal/simd.h
index 9e338e7aafbd..be84d67f3ceb 100644
--- a/include/crypto/internal/simd.h
+++ b/include/crypto/internal/simd.h
@@ -6,6 +6,8 @@
 #ifndef _CRYPTO_INTERNAL_SIMD_H
 #define _CRYPTO_INTERNAL_SIMD_H
 
+#include <crypto/api.h>
+
 #include <asm/simd.h>
 #include <linux/percpu.h>
 #include <linux/types.h>
@@ -15,28 +17,33 @@
 struct simd_skcipher_alg;
 struct skcipher_alg;
 
-struct simd_skcipher_alg *simd_skcipher_create_compat(struct skcipher_alg *ialg,
-						      const char *algname,
-						      const char *drvname,
-						      const char *basename);
-void simd_skcipher_free(struct simd_skcipher_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIMD, simd_skcipher_create_compat, struct simd_skcipher_alg *,
+	(struct skcipher_alg *ialg, const char *algname, const char *drvname, const char *basename),
+	(ialg, algname, drvname, basename));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIMD, simd_skcipher_free, void,
+	(struct simd_skcipher_alg *alg),
+	(alg));
 
-int simd_register_skciphers_compat(struct skcipher_alg *algs, int count,
-				   struct simd_skcipher_alg **simd_algs);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIMD, simd_register_skciphers_compat, int,
+	(struct skcipher_alg *algs, int count, struct simd_skcipher_alg **simd_algs),
+	(algs, count, simd_algs));
 
-void simd_unregister_skciphers(struct skcipher_alg *algs, int count,
-			       struct simd_skcipher_alg **simd_algs);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIMD, simd_unregister_skciphers, void,
+	(struct skcipher_alg *algs, int count, struct simd_skcipher_alg **simd_algs),
+	(algs, count, simd_algs));
 
 /* AEAD support */
 
 struct simd_aead_alg;
 struct aead_alg;
 
-int simd_register_aeads_compat(struct aead_alg *algs, int count,
-			       struct simd_aead_alg **simd_algs);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIMD, simd_register_aeads_compat, int,
+	(struct aead_alg *algs, int count, struct simd_aead_alg **simd_algs),
+	(algs, count, simd_algs));
 
-void simd_unregister_aeads(struct aead_alg *algs, int count,
-			   struct simd_aead_alg **simd_algs);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIMD, simd_unregister_aeads, void,
+	(struct aead_alg *algs, int count, struct simd_aead_alg **simd_algs),
+	(algs, count, simd_algs));
 
 /*
  * crypto_simd_usable() - is it allowed at this time to use SIMD instructions or
-- 
2.47.3


