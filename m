Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1581CEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T59ZDYjkqB8iSHZod5Lepzkdortdas46hB/HXJuxoxE=; b=siNMJW06uOmJhkomGy65We8l/r
	poL4EuFW+tl/RZz5mubQNtfk8yH0DDryuAgrH0FuF6P8KLpHMhMTOdcdej+qJdUO/rL4GgEIQJLnO
	NpJUEmdcMyofBthpK0rzBeocmDYOq2RhauZ1TYJzAy66HeDfRszR7Sxvrp5IukF5ROe6fe5OtGmJ5
	pmwkFbP/ws5hCExtpC57oKH/pn58fauUhK1y44WkmxePHGj266lP7OfTP+qcTVlSmIjThwLE50xe8
	q3naeLVDAKRLUt5Yjg30m38z+9MeL5ZX5WB1YnPo3Q76kDNRYNgH8I+zx1S43jAY5RdCIZQjWO65E
	nTfiLRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMkb-00000001MNk-3LzP;
	Thu, 12 Feb 2026 02:48:17 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMkY-00000001MMX-0yDu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864494; x=1802400494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T59ZDYjkqB8iSHZod5Lepzkdortdas46hB/HXJuxoxE=;
  b=EonPZQfpYaGievAZk85lcP7mo5bnmhxAHwwNA8gDapyUiAG1P3VpE5lD
   L+Vs2jCwyp50SZ7T16FDZr6537zXGH9xRd+ClOXmZjpB3mkb/d04sMnoV
   ftysYuvNns/WN/o/oZzEG7Yg5kOX9r0o5ksdEnT/SPm4hHYqBAXDiGmfo
   nQqP91IHhPMpPo9GVbquDo+FXTMQlENbdumFY27imN1fhYtKuxIbSD2FS
   i5bDZ+IG4qzi6Qr4MDlq+GtimweHEB0T6jqz9GlyrO3rbZTZs2+zp9+dr
   PA6/ANk5zwdlkWaMK56HuM40M0tLLUTfDMMUGyyyamnzUqoIy/Oe/b36J
   Q==;
X-CSE-ConnectionGUID: fN6jCD9MTmWXOPeD1/A/Mw==
X-CSE-MsgGUID: q+49R8ukRNS/RH3/ogYAsg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12803116"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:48:13 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:25691]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id e07e0737-9ebf-4bae-bde8-051b46464ed5; Thu, 12 Feb 2026 02:48:13 +0000 (UTC)
X-Farcaster-Flow-ID: e07e0737-9ebf-4bae-bde8-051b46464ed5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:48:13 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:48:12 +0000
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
Subject: [PATCH 003/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AEAD2 crypto
Date: Thu, 12 Feb 2026 02:45:39 +0000
Message-ID: <20260212024725.11264-4-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D032UWA003.ant.amazon.com (10.13.139.37) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184814_327002_37E817AE 
X-CRM114-Status: GOOD (  15.88  )
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
CONFIG_CRYPTO_AEAD2-related crypto to convert them into pluggable
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
 crypto/fips140/fips140-api.c   | 26 ++++++++++++++++++++++++++
 include/crypto/aead.h          | 30 ++++++++++++++++++++++--------
 include/crypto/internal/aead.h | 28 +++++++++++++++++++---------
 4 files changed, 68 insertions(+), 18 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index da5a7a4aa59b..9aa52ddebb05 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -15,7 +15,7 @@ crypto_algapi-$(CONFIG_PROC_FS) += proc.o
 crypto_algapi-y := algapi.o scatterwalk.o $(crypto_algapi-y)
 crypto-objs-$(CONFIG_CRYPTO_ALGAPI2) += crypto_algapi.o
 
-obj-$(CONFIG_CRYPTO_AEAD2) += aead.o
+crypto-objs-$(CONFIG_CRYPTO_AEAD2) += aead.o
 obj-$(CONFIG_CRYPTO_GENIV) += geniv.o
 
 crypto_skcipher-y += lskcipher.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 8a0e1d28615c..eb02a56cb8b3 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -103,4 +103,30 @@ DEFINE_CRYPTO_API_STUB(crypto_remove_final);
 DEFINE_CRYPTO_API_STUB(crypto_alg_extsize);
 DEFINE_CRYPTO_API_STUB(crypto_type_has_alg);
 
+#endif
+
+/*
+ * crypto/aead.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_AEAD2)
+
+#include <crypto/aead.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_alloc_aead);
+DEFINE_CRYPTO_API_STUB(crypto_alloc_sync_aead);
+DEFINE_CRYPTO_API_STUB(crypto_has_aead);
+DEFINE_CRYPTO_API_STUB(crypto_aead_setkey);
+DEFINE_CRYPTO_API_STUB(crypto_aead_setauthsize);
+DEFINE_CRYPTO_API_STUB(crypto_aead_encrypt);
+DEFINE_CRYPTO_API_STUB(crypto_aead_decrypt);
+
+#include <crypto/internal/aead.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_grab_aead);
+DEFINE_CRYPTO_API_STUB(crypto_register_aead);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_aead);
+DEFINE_CRYPTO_API_STUB(crypto_register_aeads);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_aeads);
+DEFINE_CRYPTO_API_STUB(aead_register_instance);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/aead.h b/include/crypto/aead.h
index 8e66a1fa9c78..2d3e2bde5c1d 100644
--- a/include/crypto/aead.h
+++ b/include/crypto/aead.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_AEAD_H
 #define _CRYPTO_AEAD_H
 
+#include <crypto/api.h>
 #include <linux/atomic.h>
 #include <linux/container_of.h>
 #include <linux/crypto.h>
@@ -193,9 +194,13 @@ static inline struct crypto_aead *__crypto_aead_cast(struct crypto_tfm *tfm)
  * Return: allocated cipher handle in case of success; IS_ERR() is true in case
  *	   of an error, PTR_ERR() returns the error code.
  */
-struct crypto_aead *crypto_alloc_aead(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_alloc_aead, struct crypto_aead *,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
 
-struct crypto_sync_aead *crypto_alloc_sync_aead(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_alloc_sync_aead, struct crypto_sync_aead *,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
 
 static inline struct crypto_tfm *crypto_aead_tfm(struct crypto_aead *tfm)
 {
@@ -233,7 +238,9 @@ static inline void crypto_free_sync_aead(struct crypto_sync_aead *tfm)
  * Return: true when the aead is known to the kernel crypto API; false
  *	   otherwise
  */
-int crypto_has_aead(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_has_aead, int,
+	(const char *alg_name, u32 type, u32 mask),
+	(alg_name, type, mask));
 
 static inline const char *crypto_aead_driver_name(struct crypto_aead *tfm)
 {
@@ -378,8 +385,9 @@ static inline void crypto_sync_aead_clear_flags(struct crypto_sync_aead *tfm, u3
  *
  * Return: 0 if the setting of the key was successful; < 0 if an error occurred
  */
-int crypto_aead_setkey(struct crypto_aead *tfm,
-		       const u8 *key, unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_aead_setkey, int,
+	(struct crypto_aead *tfm, const u8 *key, unsigned int keylen),
+	(tfm, key, keylen));
 
 static inline int crypto_sync_aead_setkey(struct crypto_sync_aead *tfm,
 					 const u8 *key, unsigned int keylen)
@@ -397,7 +405,9 @@ static inline int crypto_sync_aead_setkey(struct crypto_sync_aead *tfm,
  *
  * Return: 0 if the setting of the key was successful; < 0 if an error occurred
  */
-int crypto_aead_setauthsize(struct crypto_aead *tfm, unsigned int authsize);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_aead_setauthsize, int,
+	(struct crypto_aead *tfm, unsigned int authsize),
+	(tfm, authsize));
 
 static inline int crypto_sync_aead_setauthsize(struct crypto_sync_aead *tfm,
 					       unsigned int authsize)
@@ -436,7 +446,9 @@ static inline struct crypto_sync_aead *crypto_sync_aead_reqtfm(struct aead_reque
  *
  * Return: 0 if the cipher operation was successful; < 0 if an error occurred
  */
-int crypto_aead_encrypt(struct aead_request *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_aead_encrypt, int,
+	(struct aead_request *req),
+	(req));
 
 /**
  * crypto_aead_decrypt() - decrypt ciphertext
@@ -460,7 +472,9 @@ int crypto_aead_encrypt(struct aead_request *req);
  *	   integrity of the ciphertext or the associated data was violated);
  *	   < 0 if an error occurred.
  */
-int crypto_aead_decrypt(struct aead_request *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_aead_decrypt, int,
+	(struct aead_request *req),
+	(req));
 
 /**
  * DOC: Asynchronous AEAD Request Handle
diff --git a/include/crypto/internal/aead.h b/include/crypto/internal/aead.h
index 28a95eb3182d..773e6dbb34d6 100644
--- a/include/crypto/internal/aead.h
+++ b/include/crypto/internal/aead.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_INTERNAL_AEAD_H
 #define _CRYPTO_INTERNAL_AEAD_H
 
+#include <crypto/api.h>
 #include <crypto/aead.h>
 #include <crypto/algapi.h>
 #include <linux/stddef.h>
@@ -96,9 +97,9 @@ static inline struct aead_request *aead_request_cast(
 	return container_of(req, struct aead_request, base);
 }
 
-int crypto_grab_aead(struct crypto_aead_spawn *spawn,
-		     struct crypto_instance *inst,
-		     const char *name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_grab_aead, int,
+	(struct crypto_aead_spawn *spawn, struct crypto_instance *inst, const char *name, u32 type, u32 mask),
+	(spawn, inst, name, type, mask));
 
 static inline void crypto_drop_aead(struct crypto_aead_spawn *spawn)
 {
@@ -157,12 +158,21 @@ static inline unsigned int crypto_aead_chunksize(struct crypto_aead *tfm)
 	return crypto_aead_alg_chunksize(crypto_aead_alg(tfm));
 }
 
-int crypto_register_aead(struct aead_alg *alg);
-void crypto_unregister_aead(struct aead_alg *alg);
-int crypto_register_aeads(struct aead_alg *algs, int count);
-void crypto_unregister_aeads(struct aead_alg *algs, int count);
-int aead_register_instance(struct crypto_template *tmpl,
-			   struct aead_instance *inst);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_register_aead, int,
+	(struct aead_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_unregister_aead, void,
+	(struct aead_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_register_aeads, int,
+	(struct aead_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, crypto_unregister_aeads, void,
+	(struct aead_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AEAD2, aead_register_instance, int,
+	(struct crypto_template *tmpl, struct aead_instance *inst),
+	(tmpl, inst));
 
 #endif	/* _CRYPTO_INTERNAL_AEAD_H */
 
-- 
2.47.3


