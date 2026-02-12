Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB51EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8KYDc4Z2byfMiZ9JB3lOnS3gxLXx2Z6b9/hT138U2E=; b=nt/n4wFrAfUA4mvkuURWbSJ1mD
	6mP3Tf+rUMPj4C0FKFMsmAIf62qoauTdgzZXYoiLcfNaLl3w1JUDxkVaEUgkwMfyWyMO7ThLgJJ7z
	uv0/zV67CBWfs/gJC71Zm9LKVhDglFCYDBJL+R+4nTmAzvfZkehJz2jWCwHNLnVIQ05+l2Rn9pi3k
	3imstuEo+c48xWuZbNpuknoh9qT8rIG2hE0QEbYs0BLE5Dw9kgdCN+oriGROZaix6GSeuV49npDXD
	NK15j3v5OifgBDMoSIKIAkF0cAd8yT4tKi6A202fyoPLWvMiCoewFa3b1AIYihqtj4yjtGmrnHV5H
	ljKJgKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMqr-00000001OwR-0SbM;
	Thu, 12 Feb 2026 02:54:45 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMqn-00000001OvC-49aL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864881; x=1802400881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E8KYDc4Z2byfMiZ9JB3lOnS3gxLXx2Z6b9/hT138U2E=;
  b=b/S0PxlV78b5G5RCOxrBynhJA0sKMmU+phONFxrXqs2kfar+a9KlXXP0
   t3WlwT1l9uNzvwQCzs+AOqNQdkZnDVopxkLq4aYs0ubZtBYw5vWAf+wR8
   8lcUT0JCvi7zbe37kqspAzY3hxf69/W9K1QZOd0SYXNvWwiQAdVeoNlhi
   wO1fOccB2JObCQUupP9YZO+2pn4z4tQDsM++ebruDw7NfgtF0AZyB9rCw
   GDmPMtQ//HZSdIxHzwvuDO7V7u6NzrsvE04/+8DHKK8ruQZJw/ZITvXEn
   2MXa+BMlhOXX6Fcq5cdvnmWiZMUs5rfQFeQdc+HEIbQhJjDCEf/trSY8y
   g==;
X-CSE-ConnectionGUID: 62t1pyqUTY6MDYH1hlYHMw==
X-CSE-MsgGUID: yv5f9D8bTWKhOZaek0wDeA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12913258"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:54:41 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:4655]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id ef16ff3d-0724-4e53-8d9c-1ef810d3f5c8; Thu, 12 Feb 2026 02:54:41 +0000 (UTC)
X-Farcaster-Flow-ID: ef16ff3d-0724-4e53-8d9c-1ef810d3f5c8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:54:41 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:54:40 +0000
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
Subject: [PATCH 028/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_RNG2 crypto
Date: Thu, 12 Feb 2026 02:46:04 +0000
Message-ID: <20260212024725.11264-29-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D032UWB003.ant.amazon.com (10.13.139.165) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185442_095125_21731D0B 
X-CRM114-Status: GOOD (  15.14  )
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
CONFIG_CRYPTO_RNG2-related crypto to convert them into pluggable
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
 crypto/Makefile               |  2 +-
 crypto/fips140/fips140-api.c  | 23 ++++++++++++++++++++++-
 include/crypto/internal/rng.h | 21 ++++++++++++++++-----
 include/crypto/rng.h          | 18 +++++++++++++-----
 4 files changed, 52 insertions(+), 12 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 647797922678..4c87e141c961 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -162,7 +162,7 @@ obj-$(CONFIG_CRYPTO_LZ4) += lz4.o
 obj-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
 obj-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
 obj-$(CONFIG_CRYPTO_842) += 842.o
-obj-$(CONFIG_CRYPTO_RNG2) += rng.o
+crypto-objs-$(CONFIG_CRYPTO_RNG2) += rng.o
 obj-$(CONFIG_CRYPTO_DRBG) += drbg.o
 obj-$(CONFIG_CRYPTO_JITTERENTROPY) += jitterentropy_rng.o
 CFLAGS_jitterentropy.o = -O0
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 3cfe147b984c..20afa1c21cf0 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -391,4 +391,25 @@ DEFINE_CRYPTO_VAR_STUB(md5_zero_message_hash);
 
 DEFINE_CRYPTO_API_STUB(crypto_authenc_extractkeys);
 
-#endif
\ No newline at end of file
+#endif
+/*
+ * crypto/rng.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_RNG2)
+
+#include <crypto/rng.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_get_default_rng);
+DEFINE_CRYPTO_API_STUB(crypto_put_default_rng);
+DEFINE_CRYPTO_API_STUB(crypto_alloc_rng);
+DEFINE_CRYPTO_API_STUB(crypto_rng_reset);
+
+#include <crypto/internal/rng.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_register_rng);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_rng);
+DEFINE_CRYPTO_API_STUB(crypto_register_rngs);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_rngs);
+DEFINE_CRYPTO_API_STUB(crypto_del_default_rng);
+
+#endif
diff --git a/include/crypto/internal/rng.h b/include/crypto/internal/rng.h
index e0711b6a597f..b281d8eb9405 100644
--- a/include/crypto/internal/rng.h
+++ b/include/crypto/internal/rng.h
@@ -9,16 +9,27 @@
 #ifndef _CRYPTO_INTERNAL_RNG_H
 #define _CRYPTO_INTERNAL_RNG_H
 
+#include <crypto/api.h>
 #include <crypto/algapi.h>
 #include <crypto/rng.h>
 
-int crypto_register_rng(struct rng_alg *alg);
-void crypto_unregister_rng(struct rng_alg *alg);
-int crypto_register_rngs(struct rng_alg *algs, int count);
-void crypto_unregister_rngs(struct rng_alg *algs, int count);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RNG2, crypto_register_rng, int,
+	(struct rng_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RNG2, crypto_unregister_rng, void,
+	(struct rng_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RNG2, crypto_register_rngs, int,
+	(struct rng_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RNG2, crypto_unregister_rngs, void,
+	(struct rng_alg *algs, int count),
+	(algs, count));
 
 #if defined(CONFIG_CRYPTO_RNG) || defined(CONFIG_CRYPTO_RNG_MODULE)
-int crypto_del_default_rng(void);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RNG2, crypto_del_default_rng, int,
+	(void),
+	());
 #else
 static inline int crypto_del_default_rng(void)
 {
diff --git a/include/crypto/rng.h b/include/crypto/rng.h
index d451b54b322a..89a78f4a6e37 100644
--- a/include/crypto/rng.h
+++ b/include/crypto/rng.h
@@ -9,6 +9,7 @@
 #ifndef _CRYPTO_RNG_H
 #define _CRYPTO_RNG_H
 
+#include <crypto/api.h>
 #include <linux/atomic.h>
 #include <linux/container_of.h>
 #include <linux/crypto.h>
@@ -59,8 +60,12 @@ struct crypto_rng {
 
 extern struct crypto_rng *crypto_default_rng;
 
-int crypto_get_default_rng(void);
-void crypto_put_default_rng(void);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RNG2, crypto_get_default_rng, int,
+	(void),
+	());
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RNG2, crypto_put_default_rng, void,
+	(void),
+	());
 
 /**
  * DOC: Random number generator API
@@ -89,7 +94,9 @@ void crypto_put_default_rng(void);
  * Return: allocated cipher handle in case of success; IS_ERR() is true in case
  *	   of an error, PTR_ERR() returns the error code.
  */
-struct crypto_rng *crypto_alloc_rng(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RNG2, crypto_alloc_rng, struct crypto_rng *,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
 
 static inline struct crypto_tfm *crypto_rng_tfm(struct crypto_rng *tfm)
 {
@@ -177,8 +184,9 @@ static inline int crypto_rng_get_bytes(struct crypto_rng *tfm,
  *
  * Return: 0 if the setting of the key was successful; < 0 if an error occurred
  */
-int crypto_rng_reset(struct crypto_rng *tfm, const u8 *seed,
-		     unsigned int slen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RNG2, crypto_rng_reset, int,
+	(struct crypto_rng *tfm, const u8 *seed, unsigned int slen),
+	(tfm, seed, slen));
 
 /**
  * crypto_rng_seedsize() - obtain seed size of RNG
-- 
2.47.3


