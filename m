Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA9DEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+d/q68ttGeE7lM1oZfm19x8dCUE5Ou5tHSCTukLsihE=; b=aAZgzAfEpVhkkhCuzwP4nvf2fL
	TV8mmTqns4MFzXf9mmcb3bMaGLIzJY/OOeNFTmm05VgSq7yNNh6XNLDo0n9mi4xpCV0VuWAm1okUu
	AU3kE1W+1YM2FfU8jMBud3FLKVgHyq3Vln3A/NfAzR3HP3efM4K+rAeOTVYwaz9mfccFw0wk1Htpe
	weBvIXn3LBzJRRzlPNNg5ekHIp/uwjn5z8iWbY1tpHnmAtxmcxgN8zjXrsuE3oWfWWb0IlbzNohws
	iBQ+NCypy7bid/cOcVoZEBXFahMjRMoRG+G/dzDaZRrAiWYcTTMP1DbH7QZa12flbNninwII9/mC4
	XhTTVuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMm5-00000001N1Y-32Ih;
	Thu, 12 Feb 2026 02:49:49 +0000
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.245.243.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMm3-00000001N0J-2DqK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864587; x=1802400587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+d/q68ttGeE7lM1oZfm19x8dCUE5Ou5tHSCTukLsihE=;
  b=Qnbj9vCDqtB6KDreMMXHPgE9uJKJt4hPIjwNpV4wiX3d7WUh7IqMzZgo
   DLAa8m7iStTRNpc6avZAdkNlfIxB7FTVkOAxeazQnsAhRDuCEuMypgIVH
   L2oerze+AQBim07z4DckHvCVjDP2tXxkyGA6WDBBvRj2X1O/Fc0uKrln6
   EW1IsKI+gsmj5UgVdef2XxS/MpdZxIBjafyyh/6FCuAGuGONcckWKepQ3
   MdxEWPNafsnK4jWDp7noUiX0DFdLHNBwuxScba4wZK+oMg+tAsG8+bf+Q
   /UKUlca3RgKK/XsKJVU/Mzt/mC3+19YSJ4zNJkiOKrD2/YeVPJeIBuTuF
   Q==;
X-CSE-ConnectionGUID: AiS+7J7iSXOAkQrDzhcVnw==
X-CSE-MsgGUID: u57J0P5iQh2zaQs5kM1QHg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12454754"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:49:46 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:14629]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id c544cd6d-e6e3-4708-aba7-e7edad8494b9; Thu, 12 Feb 2026 02:49:46 +0000 (UTC)
X-Farcaster-Flow-ID: c544cd6d-e6e3-4708-aba7-e7edad8494b9
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:49:46 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:49:45 +0000
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
Subject: [PATCH 009/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AKCIPHER2 crypto
Date: Thu, 12 Feb 2026 02:45:45 +0000
Message-ID: <20260212024725.11264-10-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D041UWA001.ant.amazon.com (10.13.139.124) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184947_635452_778FF1F2 
X-CRM114-Status: GOOD (  15.77  )
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
CONFIG_CRYPTO_AKCIPHER2-related crypto to convert them into pluggable
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
 crypto/Makefile                    |  2 +-
 crypto/fips140/fips140-api.c       | 18 ++++++++++++++++++
 include/crypto/akcipher.h          | 12 ++++--------
 include/crypto/internal/akcipher.h | 12 +++++-------
 4 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 210e4aa3dbac..7d55be467108 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -33,7 +33,7 @@ crypto_hash-y += ahash.o
 crypto_hash-y += shash.o
 crypto-objs-$(CONFIG_CRYPTO_HASH2) += crypto_hash.o
 
-obj-$(CONFIG_CRYPTO_AKCIPHER2) += akcipher.o
+crypto-objs-$(CONFIG_CRYPTO_AKCIPHER2) += akcipher.o
 obj-$(CONFIG_CRYPTO_SIG2) += sig.o
 obj-$(CONFIG_CRYPTO_KPP2) += kpp.o
 obj-$(CONFIG_CRYPTO_HKDF) += hkdf.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index e1c2f709ad3b..8d4d07060d86 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -252,4 +252,22 @@ DEFINE_CRYPTO_API_STUB(crypto_unregister_shashes);
 DEFINE_CRYPTO_API_STUB(shash_register_instance);
 DEFINE_CRYPTO_API_STUB(shash_free_singlespawn_instance);
 
+#endif
+
+/*
+ * crypto/akcipher.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_AKCIPHER2)
+
+#include <crypto/akcipher.h>
+#include <crypto/internal/akcipher.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_grab_akcipher);
+DEFINE_CRYPTO_API_STUB(crypto_alloc_akcipher);
+DEFINE_CRYPTO_API_STUB(crypto_register_akcipher);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_akcipher);
+DEFINE_CRYPTO_API_STUB(akcipher_register_instance);
+DEFINE_CRYPTO_API_STUB(crypto_akcipher_sync_encrypt);
+DEFINE_CRYPTO_API_STUB(crypto_akcipher_sync_decrypt);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/akcipher.h b/include/crypto/akcipher.h
index cdf7da74bf2f..a48cf468521e 100644
--- a/include/crypto/akcipher.h
+++ b/include/crypto/akcipher.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_AKCIPHER_H
 #define _CRYPTO_AKCIPHER_H
 
+#include <crypto/api.h>
 #include <linux/atomic.h>
 #include <linux/crypto.h>
 
@@ -116,8 +117,7 @@ struct akcipher_alg {
  * Return: allocated handle in case of success; IS_ERR() is true in case
  *	   of an error, PTR_ERR() returns the error code.
  */
-struct crypto_akcipher *crypto_alloc_akcipher(const char *alg_name, u32 type,
-					      u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AKCIPHER2, crypto_alloc_akcipher, struct crypto_akcipher *, (const char *alg_name, u32 type, u32 mask), (alg_name, type, mask));
 
 static inline struct crypto_tfm *crypto_akcipher_tfm(
 	struct crypto_akcipher *tfm)
@@ -310,9 +310,7 @@ static inline int crypto_akcipher_decrypt(struct akcipher_request *req)
  *
  * Return: zero on success; error code in case of error
  */
-int crypto_akcipher_sync_encrypt(struct crypto_akcipher *tfm,
-				 const void *src, unsigned int slen,
-				 void *dst, unsigned int dlen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AKCIPHER2, crypto_akcipher_sync_encrypt, int, (struct crypto_akcipher *tfm, const void *src, unsigned int slen, void *dst, unsigned int dlen), (tfm, src, slen, dst, dlen));
 
 /**
  * crypto_akcipher_sync_decrypt() - Invoke public key decrypt operation
@@ -328,9 +326,7 @@ int crypto_akcipher_sync_encrypt(struct crypto_akcipher *tfm,
  *
  * Return: Output length on success; error code in case of error
  */
-int crypto_akcipher_sync_decrypt(struct crypto_akcipher *tfm,
-				 const void *src, unsigned int slen,
-				 void *dst, unsigned int dlen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AKCIPHER2, crypto_akcipher_sync_decrypt, int, (struct crypto_akcipher *tfm, const void *src, unsigned int slen, void *dst, unsigned int dlen), (tfm, src, slen, dst, dlen));
 
 /**
  * crypto_akcipher_set_pub_key() - Invoke set public key operation
diff --git a/include/crypto/internal/akcipher.h b/include/crypto/internal/akcipher.h
index 14ee62bc52b6..5b690a82d58e 100644
--- a/include/crypto/internal/akcipher.h
+++ b/include/crypto/internal/akcipher.h
@@ -7,6 +7,7 @@
  */
 #ifndef _CRYPTO_AKCIPHER_INT_H
 #define _CRYPTO_AKCIPHER_INT_H
+#include <crypto/api.h>
 #include <crypto/akcipher.h>
 #include <crypto/algapi.h>
 
@@ -100,9 +101,7 @@ static inline void *akcipher_instance_ctx(struct akcipher_instance *inst)
 	return crypto_instance_ctx(akcipher_crypto_instance(inst));
 }
 
-int crypto_grab_akcipher(struct crypto_akcipher_spawn *spawn,
-			 struct crypto_instance *inst,
-			 const char *name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AKCIPHER2, crypto_grab_akcipher, int, (struct crypto_akcipher_spawn *spawn, struct crypto_instance *inst, const char *name, u32 type, u32 mask), (spawn, inst, name, type, mask));
 
 static inline struct crypto_akcipher *crypto_spawn_akcipher(
 		struct crypto_akcipher_spawn *spawn)
@@ -130,7 +129,7 @@ static inline struct akcipher_alg *crypto_spawn_akcipher_alg(
  *
  * Return: zero on success; error code in case of error
  */
-int crypto_register_akcipher(struct akcipher_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AKCIPHER2, crypto_register_akcipher, int, (struct akcipher_alg *alg), (alg));
 
 /**
  * crypto_unregister_akcipher() -- Unregister public key algorithm
@@ -139,7 +138,7 @@ int crypto_register_akcipher(struct akcipher_alg *alg);
  *
  * @alg:	algorithm definition
  */
-void crypto_unregister_akcipher(struct akcipher_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AKCIPHER2, crypto_unregister_akcipher, void, (struct akcipher_alg *alg), (alg));
 
 /**
  * akcipher_register_instance() -- Unregister public key template instance
@@ -150,6 +149,5 @@ void crypto_unregister_akcipher(struct akcipher_alg *alg);
  * @tmpl:	the template from which the algorithm was created
  * @inst:	the template instance
  */
-int akcipher_register_instance(struct crypto_template *tmpl,
-		struct akcipher_instance *inst);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AKCIPHER2, akcipher_register_instance, int, (struct crypto_template *tmpl, struct akcipher_instance *inst), (tmpl, inst));
 #endif
-- 
2.47.3


