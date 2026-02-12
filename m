Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4210BEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXhuhgn4LhG1nenObyftggQvuPDsBve5odR969siNLw=; b=QJQpDfTLgzKYlZTuf80uGhlij1
	2X7xEWiZYCPFxwlx8UiWMs2pLuyCuLm1h7mocUwXFJLY+gzTwyjyqGiAS0CGjKvQYnkQxAIy0PKnm
	wDFmzGEXKlQCmuOH14k54XGzPqseeWu3u6alM1bVZmC0U0Vp89mmisln6VT6+e6b2Ef17NQvLvT0W
	AbJ8sbG1nb4VGPvpJxeLM4YqSrKILtmJASMs6TnfrzCAFJ0J7yX9uVP7Hc+QNZpB9vHaJF9fv7HnB
	cZDIvX5sg4kftJhBSbAhqhzzMMrw/NgQ1FA5e0cOktwvKfyZqDsL2Lgi9wcI8L1KdX6UwcfICSLre
	/ORHNVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMyu-00000001SLB-2YyJ;
	Thu, 12 Feb 2026 03:03:04 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMyq-00000001SJi-12XA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865380; x=1802401380;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CXhuhgn4LhG1nenObyftggQvuPDsBve5odR969siNLw=;
  b=odKYy1xW1PUhY6/9r2Z9qS2Xv2xhgQDYx4S1NIO+O7uvPz+LKWefGbt6
   TeRVuxwUgStpaRyLU1841jRJIF2Z3eIzS8pZuXKQbMQJokTg7FxcPKl91
   aQLoh1DdtTeKGHQpaNSk2HUizLGE6GxyDyVC8ZMECBMXVp3E0gMz8kHDI
   Lh1lPJN6XKTcI9SwSGrDyT+GlS2V48Ml8Eh+tpUhseg3e1Vgi6AqHYJ5c
   6soBrx9Lf0Jfnwgnl7QolxZY0VCziPVhbt4LKzJCXMqBxr8l34lCO0Djj
   hfSdcYTNgNG/2fKytaWK6IU/YFP9TvDI9rUa54wSPJL/LFeUblp337ymx
   w==;
X-CSE-ConnectionGUID: zYZMISnLR2yYuApwrcj1zQ==
X-CSE-MsgGUID: SVWKBc4xQheaXLf7zDrCPg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12913756"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:02:59 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:31552]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id da137e97-4179-46b9-b2c0-f964e01be049; Thu, 12 Feb 2026 03:02:58 +0000 (UTC)
X-Farcaster-Flow-ID: da137e97-4179-46b9-b2c0-f964e01be049
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:02:58 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:02:57 +0000
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
Subject: [PATCH 060/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CRYPTD crypto
Date: Thu, 12 Feb 2026 02:46:36 +0000
Message-ID: <20260212024725.11264-61-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D044UWB002.ant.amazon.com (10.13.139.188) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190300_339954_449A7100 
X-CRM114-Status: GOOD (  14.57  )
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
CONFIG_CRYPTO_CRYPTD-related crypto to convert them into pluggable
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
 crypto/Makefile              |  2 +-
 crypto/cryptd.c              |  4 +--
 crypto/fips140/fips140-api.c | 22 ++++++++++++++
 include/crypto/cryptd.h      | 56 +++++++++++++++++++++++++-----------
 4 files changed, 65 insertions(+), 19 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index b371a8788d39..f029e0decaa1 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -125,7 +125,7 @@ endif
 CFLAGS_aegis128-neon-inner.o += -isystem $(shell $(CC) -print-file-name=include)
 
 crypto-objs-$(CONFIG_CRYPTO_PCRYPT) += pcrypt.o
-obj-$(CONFIG_CRYPTO_CRYPTD) += cryptd.o
+crypto-objs-$(CONFIG_CRYPTO_CRYPTD) += cryptd.o
 obj-$(CONFIG_CRYPTO_DES) += des_generic.o
 obj-$(CONFIG_CRYPTO_FCRYPT) += fcrypt.o
 obj-$(CONFIG_CRYPTO_BLOWFISH) += blowfish_generic.o
diff --git a/crypto/cryptd.c b/crypto/cryptd.c
index cd38f4676176..8b1ba67d752c 100644
--- a/crypto/cryptd.c
+++ b/crypto/cryptd.c
@@ -1145,8 +1145,8 @@ static void __exit cryptd_exit(void)
 	crypto_unregister_template(&cryptd_tmpl);
 }
 
-module_init(cryptd_init);
-module_exit(cryptd_exit);
+crypto_module_init(cryptd_init);
+crypto_module_exit(cryptd_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Software async crypto daemon");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 3c6dfcac5db5..1452439319cc 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -622,3 +622,25 @@ DEFINE_CRYPTO_API_STUB(ecc_point_is_zero);
 DEFINE_CRYPTO_API_STUB(ecc_point_mult_shamir);
 
 #endif
+/*
+ * crypto/cryptd.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_CRYPTD)
+
+#include <crypto/cryptd.h>
+
+DEFINE_CRYPTO_API_STUB(cryptd_alloc_skcipher);
+DEFINE_CRYPTO_API_STUB(cryptd_skcipher_child);
+DEFINE_CRYPTO_API_STUB(cryptd_skcipher_queued);
+DEFINE_CRYPTO_API_STUB(cryptd_free_skcipher);
+DEFINE_CRYPTO_API_STUB(cryptd_alloc_ahash);
+DEFINE_CRYPTO_API_STUB(cryptd_ahash_child);
+DEFINE_CRYPTO_API_STUB(cryptd_shash_desc);
+DEFINE_CRYPTO_API_STUB(cryptd_ahash_queued);
+DEFINE_CRYPTO_API_STUB(cryptd_free_ahash);
+DEFINE_CRYPTO_API_STUB(cryptd_alloc_aead);
+DEFINE_CRYPTO_API_STUB(cryptd_aead_child);
+DEFINE_CRYPTO_API_STUB(cryptd_aead_queued);
+DEFINE_CRYPTO_API_STUB(cryptd_free_aead);
+
+#endif
diff --git a/include/crypto/cryptd.h b/include/crypto/cryptd.h
index 796d986e58e1..35b4d06e41f5 100644
--- a/include/crypto/cryptd.h
+++ b/include/crypto/cryptd.h
@@ -13,6 +13,7 @@
 #ifndef _CRYPTO_CRYPT_H
 #define _CRYPTO_CRYPT_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 
 #include <crypto/aead.h>
@@ -24,12 +25,19 @@ struct cryptd_skcipher {
 };
 
 /* alg_name should be algorithm to be cryptd-ed */
-struct cryptd_skcipher *cryptd_alloc_skcipher(const char *alg_name,
-					      u32 type, u32 mask);
-struct crypto_skcipher *cryptd_skcipher_child(struct cryptd_skcipher *tfm);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_alloc_skcipher, struct cryptd_skcipher *,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_skcipher_child, struct crypto_skcipher *,
+	(struct cryptd_skcipher *tfm),
+	(tfm));
 /* Must be called without moving CPUs. */
-bool cryptd_skcipher_queued(struct cryptd_skcipher *tfm);
-void cryptd_free_skcipher(struct cryptd_skcipher *tfm);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_skcipher_queued, bool,
+	(struct cryptd_skcipher *tfm),
+	(tfm));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_free_skcipher, void,
+	(struct cryptd_skcipher *tfm),
+	(tfm));
 
 struct cryptd_ahash {
 	struct crypto_ahash base;
@@ -42,13 +50,22 @@ static inline struct cryptd_ahash *__cryptd_ahash_cast(
 }
 
 /* alg_name should be algorithm to be cryptd-ed */
-struct cryptd_ahash *cryptd_alloc_ahash(const char *alg_name,
-					u32 type, u32 mask);
-struct crypto_shash *cryptd_ahash_child(struct cryptd_ahash *tfm);
-struct shash_desc *cryptd_shash_desc(struct ahash_request *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_alloc_ahash, struct cryptd_ahash *,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_ahash_child, struct crypto_shash *,
+	(struct cryptd_ahash *tfm),
+	(tfm));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_shash_desc, struct shash_desc *,
+	(struct ahash_request *req),
+	(req));
 /* Must be called without moving CPUs. */
-bool cryptd_ahash_queued(struct cryptd_ahash *tfm);
-void cryptd_free_ahash(struct cryptd_ahash *tfm);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_ahash_queued, bool,
+	(struct cryptd_ahash *tfm),
+	(tfm));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_free_ahash, void,
+	(struct cryptd_ahash *tfm),
+	(tfm));
 
 struct cryptd_aead {
 	struct crypto_aead base;
@@ -60,13 +77,20 @@ static inline struct cryptd_aead *__cryptd_aead_cast(
 	return (struct cryptd_aead *)tfm;
 }
 
-struct cryptd_aead *cryptd_alloc_aead(const char *alg_name,
-					  u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_alloc_aead, struct cryptd_aead *,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
 
-struct crypto_aead *cryptd_aead_child(struct cryptd_aead *tfm);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_aead_child, struct crypto_aead *,
+	(struct cryptd_aead *tfm),
+	(tfm));
 /* Must be called without moving CPUs. */
-bool cryptd_aead_queued(struct cryptd_aead *tfm);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_aead_queued, bool,
+	(struct cryptd_aead *tfm),
+	(tfm));
 
-void cryptd_free_aead(struct cryptd_aead *tfm);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CRYPTD, cryptd_free_aead, void,
+	(struct cryptd_aead *tfm),
+	(tfm));
 
 #endif
-- 
2.47.3


