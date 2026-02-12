Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1AAEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mZB1WcfRURl1NcN5j/zBmZKULSQQ7Ft3fi8Tri1zvI=; b=3GgInUFimDUR1/ODwu/MOKtxm8
	0EDUKCLsGORwyUuES9zYiu3FC+EwXRkc1ZkjIPxk+i759PmpAB8ZOEe5f7Xw2AL6ZeN/1geNXClMQ
	sxiK0wu1Wf338BGjGTg8ni3xxCBbseRfaXQZA9qoz9CJMBowbAy/lmQTD+ex7we7Vbkk7BS89sOMd
	TQcjcUutrCUPU0gaYt9E7psIKrQsc5Q6Fc6w55Aik/Z+ce491YOEZS4FOyPOwAHXwKvDg1OfESA6+
	8aGVjI9z0+ItfUHEBVZ5gpBl3C52ZyyjVThXPsNS6IXgGAy+bkFbr8dYjPnhw01gIwEN/n5xUFOEb
	g7MNgbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMtc-00000001Q8u-2hzt;
	Thu, 12 Feb 2026 02:57:38 +0000
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.35.192.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMtY-00000001Q6Y-3x5F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865052; x=1802401052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6mZB1WcfRURl1NcN5j/zBmZKULSQQ7Ft3fi8Tri1zvI=;
  b=MYSmmfYWar0vKI/P6vigTKNQvL+6vk866lk6YFSWmJxJ9PCzeXp+iSzj
   3GVv/QEkLUp9iyxc4FFIeDIAHErX9qp6NeBJu1jZW0uZUronSrv3NLwq0
   O06BpiGFfxuhnMfxsMwWSxgpR5jzRdi6vkC8xXnMuNAprlwJDeZ7jTtPW
   bVsF6+2hja1QeOU5pSOMggqCerv1cGxoW+UM5KKTL3TnLjfwH7brWkBmP
   /Q8TTDuvpT+szAUTBqeljP9v9EV3fVH+nGf7dP+jrgckz+XdgD3mYDeru
   gZt2591Z3amx+ehh6ngt71oLPIfSlISZ//AS04P9P+j9tZxo7taD6s+w8
   g==;
X-CSE-ConnectionGUID: BqX0gePGTJudzGElxnabjA==
X-CSE-MsgGUID: 6WPbF4kLR9SYsCNREFdO2g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12698314"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:57:32 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:7294]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 0fecf047-527b-44d3-8e73-64782cdfa27c; Thu, 12 Feb 2026 02:57:32 +0000 (UTC)
X-Farcaster-Flow-ID: 0fecf047-527b-44d3-8e73-64782cdfa27c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:57:32 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:57:31 +0000
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
Subject: [PATCH 039/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ECDSA and CONFIG_CRYPTO_ECC crypto
Date: Thu, 12 Feb 2026 02:46:15 +0000
Message-ID: <20260212024725.11264-40-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D045UWA002.ant.amazon.com (10.13.139.12) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185733_075597_395AA861 
X-CRM114-Status: GOOD (  18.86  )
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
CONFIG_CRYPTO_ECDSA- and CONFIG_CRYPTO_ECC-related crypto to convert
them into pluggable interface.

This patch is partially based on work by Vegard Nossum, with
modifications. Unlike the original, we do not include
DEFINE_CRYPTO_API since only one copy of the crypto symbols is
kept, either in the crypto module or in the main kernel, and we ensure
such wrapper do not have impact on crypto already chosen built as
module.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile               |  4 +-
 crypto/ecdsa.c                |  4 +-
 crypto/fips140/fips140-api.c  | 33 +++++++++++++
 include/crypto/ecc_curve.h    |  9 +++-
 include/crypto/internal/ecc.h | 91 ++++++++++++++++++++++-------------
 5 files changed, 102 insertions(+), 39 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 7b1188d5d953..2e3704e67e14 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -60,7 +60,7 @@ ecdsa_generic-y += ecdsa.o
 ecdsa_generic-y += ecdsa-x962.o
 ecdsa_generic-y += ecdsa-p1363.o
 ecdsa_generic-y += ecdsasignature.asn1.o
-obj-$(CONFIG_CRYPTO_ECDSA) += ecdsa_generic.o
+crypto-objs-$(CONFIG_CRYPTO_ECDSA) += ecdsa_generic.o
 
 obj-$(CONFIG_CRYPTO_MLDSA) += mldsa.o
 
@@ -178,7 +178,7 @@ obj-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
 obj-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
 obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
 obj-$(CONFIG_CRYPTO_ZSTD) += zstd.o
-obj-$(CONFIG_CRYPTO_ECC) += ecc.o
+crypto-objs-$(CONFIG_CRYPTO_ECC) += ecc.o
 obj-$(CONFIG_CRYPTO_ESSIV) += essiv.o
 
 ecdh_generic-y += ecdh.o
diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index ce8e4364842f..64903419e6db 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -334,8 +334,8 @@ static void __exit ecdsa_exit(void)
 	crypto_unregister_sig(&ecdsa_nist_p521);
 }
 
-module_init(ecdsa_init);
-module_exit(ecdsa_exit);
+crypto_module_init(ecdsa_init);
+crypto_module_exit(ecdsa_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Stefan Berger <stefanb@linux.ibm.com>");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 0b1794340b77..3c6dfcac5db5 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -589,3 +589,36 @@ DEFINE_CRYPTO_API_STUB(crypto_dh_encode_key);
 DEFINE_CRYPTO_API_STUB(crypto_dh_decode_key);
 
 #endif
+/*
+ * crypto/ecc.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ECC)
+
+#include <crypto/ecc_curve.h>
+
+DEFINE_CRYPTO_API_STUB(ecc_get_curve);
+DEFINE_CRYPTO_API_STUB(ecc_get_curve25519);
+
+#include <crypto/internal/ecc.h>
+
+DEFINE_CRYPTO_API_STUB(ecc_digits_from_bytes);
+DEFINE_CRYPTO_API_STUB(ecc_is_key_valid);
+DEFINE_CRYPTO_API_STUB(ecc_gen_privkey);
+DEFINE_CRYPTO_API_STUB(ecc_make_pub_key);
+DEFINE_CRYPTO_API_STUB(crypto_ecdh_shared_secret);
+DEFINE_CRYPTO_API_STUB(ecc_is_pubkey_valid_partial);
+DEFINE_CRYPTO_API_STUB(ecc_is_pubkey_valid_full);
+DEFINE_CRYPTO_API_STUB(vli_is_zero);
+DEFINE_CRYPTO_API_STUB(vli_cmp);
+DEFINE_CRYPTO_API_STUB(vli_sub);
+DEFINE_CRYPTO_API_STUB(vli_from_be64);
+DEFINE_CRYPTO_API_STUB(vli_from_le64);
+DEFINE_CRYPTO_API_STUB(vli_mod_inv);
+DEFINE_CRYPTO_API_STUB(vli_mod_mult_slow);
+DEFINE_CRYPTO_API_STUB(vli_num_bits);
+DEFINE_CRYPTO_API_STUB(ecc_alloc_point);
+DEFINE_CRYPTO_API_STUB(ecc_free_point);
+DEFINE_CRYPTO_API_STUB(ecc_point_is_zero);
+DEFINE_CRYPTO_API_STUB(ecc_point_mult_shamir);
+
+#endif
diff --git a/include/crypto/ecc_curve.h b/include/crypto/ecc_curve.h
index 7d90c5e82266..f0804215de69 100644
--- a/include/crypto/ecc_curve.h
+++ b/include/crypto/ecc_curve.h
@@ -4,6 +4,7 @@
 #ifndef _CRYTO_ECC_CURVE_H
 #define _CRYTO_ECC_CURVE_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 
 /**
@@ -50,13 +51,17 @@ struct ecc_curve {
  *
  * Returns curve if get curve succssful, NULL otherwise
  */
-const struct ecc_curve *ecc_get_curve(unsigned int curve_id);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, ecc_get_curve, const struct ecc_curve *,
+	(unsigned int curve_id),
+	(curve_id));
 
 /**
  * ecc_get_curve25519() - get curve25519 curve;
  *
  * Returns curve25519
  */
-const struct ecc_curve *ecc_get_curve25519(void);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, ecc_get_curve25519, const struct ecc_curve *,
+	(void),
+	());
 
 #endif
diff --git a/include/crypto/internal/ecc.h b/include/crypto/internal/ecc.h
index 57cd75242141..0325d4edf82a 100644
--- a/include/crypto/internal/ecc.h
+++ b/include/crypto/internal/ecc.h
@@ -26,6 +26,7 @@
 #ifndef _CRYPTO_ECC_H
 #define _CRYPTO_ECC_H
 
+#include <crypto/api.h>
 #include <crypto/ecc_curve.h>
 #include <linux/unaligned.h>
 
@@ -79,8 +80,9 @@ static inline void ecc_swap_digits(const void *in, u64 *out, unsigned int ndigit
  * The first byte in the input byte array is expected to hold the most
  * significant bits of the large integer.
  */
-void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
-			   u64 *out, unsigned int ndigits);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, ecc_digits_from_bytes, void,
+	(const u8 *in, unsigned int nbytes, u64 *out, unsigned int ndigits),
+	(in, nbytes, out, ndigits));
 
 /**
  * ecc_is_key_valid() - Validate a given ECDH private key
@@ -92,8 +94,9 @@ void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
  *
  * Returns 0 if the key is acceptable, a negative value otherwise
  */
-int ecc_is_key_valid(unsigned int curve_id, unsigned int ndigits,
-		     const u64 *private_key, unsigned int private_key_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, ecc_is_key_valid, int,
+	(unsigned int curve_id, unsigned int ndigits, const u64 *private_key, unsigned int private_key_len),
+	(curve_id, ndigits, private_key, private_key_len));
 
 /**
  * ecc_gen_privkey() -  Generates an ECC private key.
@@ -107,8 +110,9 @@ int ecc_is_key_valid(unsigned int curve_id, unsigned int ndigits,
  * Returns 0 if the private key was generated successfully, a negative value
  * if an error occurred.
  */
-int ecc_gen_privkey(unsigned int curve_id, unsigned int ndigits,
-		    u64 *private_key);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, ecc_gen_privkey, int,
+	(unsigned int curve_id, unsigned int ndigits, u64 *private_key),
+	(curve_id, ndigits, private_key));
 
 /**
  * ecc_make_pub_key() - Compute an ECC public key
@@ -121,8 +125,9 @@ int ecc_gen_privkey(unsigned int curve_id, unsigned int ndigits,
  * Returns 0 if the public key was generated successfully, a negative value
  * if an error occurred.
  */
-int ecc_make_pub_key(const unsigned int curve_id, unsigned int ndigits,
-		     const u64 *private_key, u64 *public_key);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, ecc_make_pub_key, int,
+	(const unsigned int curve_id, unsigned int ndigits, const u64 *private_key, u64 *public_key),
+	(curve_id, ndigits, private_key, public_key));
 
 /**
  * crypto_ecdh_shared_secret() - Compute a shared secret
@@ -139,9 +144,9 @@ int ecc_make_pub_key(const unsigned int curve_id, unsigned int ndigits,
  * Returns 0 if the shared secret was generated successfully, a negative value
  * if an error occurred.
  */
-int crypto_ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
-			      const u64 *private_key, const u64 *public_key,
-			      u64 *secret);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, crypto_ecdh_shared_secret, int,
+	(unsigned int curve_id, unsigned int ndigits, const u64 *private_key, const u64 *public_key, u64 *secret),
+	(curve_id, ndigits, private_key, public_key, secret));
 
 /**
  * ecc_is_pubkey_valid_partial() - Partial public key validation
@@ -157,8 +162,9 @@ int crypto_ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
  *
  * Return: 0 if validation is successful, -EINVAL if validation is failed.
  */
-int ecc_is_pubkey_valid_partial(const struct ecc_curve *curve,
-				struct ecc_point *pk);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, ecc_is_pubkey_valid_partial, int,
+	(const struct ecc_curve *curve, struct ecc_point *pk),
+	(curve, pk));
 
 /**
  * ecc_is_pubkey_valid_full() - Full public key validation
@@ -171,8 +177,9 @@ int ecc_is_pubkey_valid_partial(const struct ecc_curve *curve,
  *
  * Return: 0 if validation is successful, -EINVAL if validation is failed.
  */
-int ecc_is_pubkey_valid_full(const struct ecc_curve *curve,
-			     struct ecc_point *pk);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, ecc_is_pubkey_valid_full, int,
+	(const struct ecc_curve *curve, struct ecc_point *pk),
+	(curve, pk));
 
 /**
  * vli_is_zero() - Determine is vli is zero
@@ -180,7 +187,9 @@ int ecc_is_pubkey_valid_full(const struct ecc_curve *curve,
  * @vli:		vli to check.
  * @ndigits:		length of the @vli
  */
-bool vli_is_zero(const u64 *vli, unsigned int ndigits);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, vli_is_zero, bool,
+	(const u64 *vli, unsigned int ndigits),
+	(vli, ndigits));
 
 /**
  * vli_cmp() - compare left and right vlis
@@ -192,7 +201,9 @@ bool vli_is_zero(const u64 *vli, unsigned int ndigits);
  * Returns sign of @left - @right, i.e. -1 if @left < @right,
  * 0 if @left == @right, 1 if @left > @right.
  */
-int vli_cmp(const u64 *left, const u64 *right, unsigned int ndigits);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, vli_cmp, int,
+	(const u64 *left, const u64 *right, unsigned int ndigits),
+	(left, right, ndigits));
 
 /**
  * vli_sub() - Subtracts right from left
@@ -206,8 +217,9 @@ int vli_cmp(const u64 *left, const u64 *right, unsigned int ndigits);
  *
  * Return: carry bit.
  */
-u64 vli_sub(u64 *result, const u64 *left, const u64 *right,
-	    unsigned int ndigits);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, vli_sub, u64,
+	(u64 *result, const u64 *left, const u64 *right, unsigned int ndigits),
+	(result, left, right, ndigits));
 
 /**
  * vli_from_be64() - Load vli from big-endian u64 array
@@ -216,7 +228,9 @@ u64 vli_sub(u64 *result, const u64 *left, const u64 *right,
  * @src:		source array of u64 BE values
  * @ndigits:		length of both vli and array
  */
-void vli_from_be64(u64 *dest, const void *src, unsigned int ndigits);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, vli_from_be64, void,
+	(u64 *dest, const void *src, unsigned int ndigits),
+	(dest, src, ndigits));
 
 /**
  * vli_from_le64() - Load vli from little-endian u64 array
@@ -225,7 +239,9 @@ void vli_from_be64(u64 *dest, const void *src, unsigned int ndigits);
  * @src:		source array of u64 LE values
  * @ndigits:		length of both vli and array
  */
-void vli_from_le64(u64 *dest, const void *src, unsigned int ndigits);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, vli_from_le64, void,
+	(u64 *dest, const void *src, unsigned int ndigits),
+	(dest, src, ndigits));
 
 /**
  * vli_mod_inv() - Modular inversion
@@ -235,8 +251,9 @@ void vli_from_le64(u64 *dest, const void *src, unsigned int ndigits);
  * @mod:		modulus
  * @ndigits:		length of all vlis
  */
-void vli_mod_inv(u64 *result, const u64 *input, const u64 *mod,
-		 unsigned int ndigits);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, vli_mod_inv, void,
+	(u64 *result, const u64 *input, const u64 *mod, unsigned int ndigits),
+	(result, input, mod, ndigits));
 
 /**
  * vli_mod_mult_slow() - Modular multiplication
@@ -249,8 +266,9 @@ void vli_mod_inv(u64 *result, const u64 *input, const u64 *mod,
  *
  * Note: Assumes that mod is big enough curve order.
  */
-void vli_mod_mult_slow(u64 *result, const u64 *left, const u64 *right,
-		       const u64 *mod, unsigned int ndigits);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, vli_mod_mult_slow, void,
+	(u64 *result, const u64 *left, const u64 *right, const u64 *mod, unsigned int ndigits),
+	(result, left, right, mod, ndigits));
 
 /**
  * vli_num_bits() - Counts the number of bits required for vli.
@@ -260,7 +278,9 @@ void vli_mod_mult_slow(u64 *result, const u64 *left, const u64 *right,
  *
  * Return: The number of bits required to represent @vli.
  */
-unsigned int vli_num_bits(const u64 *vli, unsigned int ndigits);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, vli_num_bits, unsigned int,
+	(const u64 *vli, unsigned int ndigits),
+	(vli, ndigits));
 
 /**
  * ecc_aloc_point() - Allocate ECC point.
@@ -269,14 +289,18 @@ unsigned int vli_num_bits(const u64 *vli, unsigned int ndigits);
  *
  * Return: Pointer to the allocated point or NULL if allocation failed.
  */
-struct ecc_point *ecc_alloc_point(unsigned int ndigits);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, ecc_alloc_point, struct ecc_point *,
+	(unsigned int ndigits),
+	(ndigits));
 
 /**
  * ecc_free_point() - Free ECC point.
  *
  * @p:			The point to free.
  */
-void ecc_free_point(struct ecc_point *p);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, ecc_free_point, void,
+	(struct ecc_point *p),
+	(p));
 
 /**
  * ecc_point_is_zero() - Check if point is zero.
@@ -285,7 +309,9 @@ void ecc_free_point(struct ecc_point *p);
  *
  * Return: true if point is the point at infinity, false otherwise.
  */
-bool ecc_point_is_zero(const struct ecc_point *point);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, ecc_point_is_zero, bool,
+	(const struct ecc_point *point),
+	(point));
 
 /**
  * ecc_point_mult_shamir() - Add two points multiplied by scalars
@@ -300,10 +326,9 @@ bool ecc_point_is_zero(const struct ecc_point *point);
  * Returns result = x * p + x * q over the curve.
  * This works faster than two multiplications and addition.
  */
-void ecc_point_mult_shamir(const struct ecc_point *result,
-			   const u64 *x, const struct ecc_point *p,
-			   const u64 *y, const struct ecc_point *q,
-			   const struct ecc_curve *curve);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECC, ecc_point_mult_shamir, void,
+	(const struct ecc_point *result, const u64 *x, const struct ecc_point *p, const u64 *y, const struct ecc_point *q, const struct ecc_curve *curve),
+	(result, x, p, y, q, curve));
 
 extern struct crypto_template ecdsa_x962_tmpl;
 extern struct crypto_template ecdsa_p1363_tmpl;
-- 
2.47.3


