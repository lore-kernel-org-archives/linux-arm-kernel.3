Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7A6C2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVchaga48/tJEyPGmS9gUewrXvyfa7XPkG6JRIj5qsI=; b=CiR7FtUQpCXwKeT/HDTIkfp9io
	c1i6uQyLJbrwimhg9rFlYrr3e+9Hw+UwWhDPX8pFLVZTqekqSc3cYPyEKFRwvM8Lk4/LetPR0IMEO
	+/64CUZSoOjS3j2sArQecsUBkCAcP1rteONxbRbpayLWXgDt3LiWN0uIsQLK/4+/mfizWRDwDh1fF
	tIzXVpzzfxvBkWpkE+SzRCc0hlRUOCc71T2hgq8WZaouXXAJN1XBA85SLzqvs7z9NfQP/YzfXEy+7
	XtJ2K7niZ9RSkQ+Nl+dJe29wJuPDcDcT8LP9gn36tbvtpkK1VTTsqdmuHYOVxZFfSxkXdE3/WRoWw
	ndnF0Alg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvd-0000000Aj2Q-3nTf;
	Mon, 05 Jan 2026 05:14:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvb-0000000Aj1D-3wQI;
	Mon, 05 Jan 2026 05:14:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B3A044123;
	Mon,  5 Jan 2026 05:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A769FC2BCB1;
	Mon,  5 Jan 2026 05:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590091;
	bh=LgDbklGtIZFHjM4cuU4zrZQcyIE2hb0ascSpMxwTuKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ijd+I7op5lmUKmk5siN9yLBtx/9k6AgkTruGEiLPcRGwEnQMxlLCxqX8pywV5GfoN
	 tsBAnhPaMBaFTSP28NAe1luTRwpp2pepivmaJuj0U3w+9l8tt4BoMZon1eDSPWJB/3
	 ixqKtW8L6wJNKC6zKnVH2XGD1Z7xpH2r9lqNLJaF8E3YC+ZE63dSTUP00KZnr6xOk/
	 NAtoHW7Uew++VxBJ2sTNG1FMLDxVg+Xrvb1C2h9ttJ1kMRrZWuu7+Iip6dnqGcRe1T
	 XviKWGaNVEUdpOmcKj0/MhKJk2lIzVOli5+z36mLRKHUUDgb/+WCYf9f34Ddkdec22
	 hvdBT5uSXtmZg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 01/36] crypto: powerpc/aes - Rename struct aes_key
Date: Sun,  4 Jan 2026 21:12:34 -0800
Message-ID: <20260105051311.1607207-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_211452_025830_E9277E0E 
X-CRM114-Status: GOOD (  11.42  )
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

Rename struct aes_key in aesp8-ppc.h and aes-gcm-p10-glue.c to
p8_aes_key and p10_aes_key, respectively.  This frees up the name to use
in the library API in <crypto/aes.h>.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/powerpc/crypto/aes-gcm-p10-glue.c |  4 ++--
 arch/powerpc/crypto/aes.c              |  4 ++--
 arch/powerpc/crypto/aes_cbc.c          |  4 ++--
 arch/powerpc/crypto/aes_ctr.c          |  2 +-
 arch/powerpc/crypto/aes_xts.c          |  6 +++---
 arch/powerpc/crypto/aesp8-ppc.h        | 23 ++++++++++++-----------
 6 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c b/arch/powerpc/crypto/aes-gcm-p10-glue.c
index 85f4fd4b1bdc..f3417436d3f7 100644
--- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
+++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
@@ -42,11 +42,11 @@ asmlinkage void aes_p10_gcm_decrypt(const u8 *in, u8 *out, size_t len,
 asmlinkage void gcm_init_htable(unsigned char htable[], unsigned char Xi[]);
 asmlinkage void gcm_ghash_p10(unsigned char *Xi, unsigned char *Htable,
 			      unsigned char *aad, unsigned int alen);
 asmlinkage void gcm_update(u8 *iv, void *Xi);
 
-struct aes_key {
+struct p10_aes_key {
 	u8 key[AES_MAX_KEYLENGTH];
 	u64 rounds;
 };
 
 struct gcm_ctx {
@@ -61,11 +61,11 @@ struct Hash_ctx {
 	u8 H[16];	/* subkey */
 	u8 Htable[256];	/* Xi, Hash table(offset 32) */
 };
 
 struct p10_aes_gcm_ctx {
-	struct aes_key enc_key;
+	struct p10_aes_key enc_key;
 	u8 nonce[RFC4106_NONCE_SIZE];
 };
 
 static void vsx_begin(void)
 {
diff --git a/arch/powerpc/crypto/aes.c b/arch/powerpc/crypto/aes.c
index 3f1e5e894902..b7192ee719fc 100644
--- a/arch/powerpc/crypto/aes.c
+++ b/arch/powerpc/crypto/aes.c
@@ -19,12 +19,12 @@
 
 #include "aesp8-ppc.h"
 
 struct p8_aes_ctx {
 	struct crypto_cipher *fallback;
-	struct aes_key enc_key;
-	struct aes_key dec_key;
+	struct p8_aes_key enc_key;
+	struct p8_aes_key dec_key;
 };
 
 static int p8_aes_init(struct crypto_tfm *tfm)
 {
 	const char *alg = crypto_tfm_alg_name(tfm);
diff --git a/arch/powerpc/crypto/aes_cbc.c b/arch/powerpc/crypto/aes_cbc.c
index 5f2a4f375eef..4a9f285f0970 100644
--- a/arch/powerpc/crypto/aes_cbc.c
+++ b/arch/powerpc/crypto/aes_cbc.c
@@ -19,12 +19,12 @@
 
 #include "aesp8-ppc.h"
 
 struct p8_aes_cbc_ctx {
 	struct crypto_skcipher *fallback;
-	struct aes_key enc_key;
-	struct aes_key dec_key;
+	struct p8_aes_key enc_key;
+	struct p8_aes_key dec_key;
 };
 
 static int p8_aes_cbc_init(struct crypto_skcipher *tfm)
 {
 	struct p8_aes_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
diff --git a/arch/powerpc/crypto/aes_ctr.c b/arch/powerpc/crypto/aes_ctr.c
index e27c4036e711..7dbd06f442db 100644
--- a/arch/powerpc/crypto/aes_ctr.c
+++ b/arch/powerpc/crypto/aes_ctr.c
@@ -19,11 +19,11 @@
 
 #include "aesp8-ppc.h"
 
 struct p8_aes_ctr_ctx {
 	struct crypto_skcipher *fallback;
-	struct aes_key enc_key;
+	struct p8_aes_key enc_key;
 };
 
 static int p8_aes_ctr_init(struct crypto_skcipher *tfm)
 {
 	struct p8_aes_ctr_ctx *ctx = crypto_skcipher_ctx(tfm);
diff --git a/arch/powerpc/crypto/aes_xts.c b/arch/powerpc/crypto/aes_xts.c
index 9440e771cede..b4c760e465ea 100644
--- a/arch/powerpc/crypto/aes_xts.c
+++ b/arch/powerpc/crypto/aes_xts.c
@@ -20,13 +20,13 @@
 
 #include "aesp8-ppc.h"
 
 struct p8_aes_xts_ctx {
 	struct crypto_skcipher *fallback;
-	struct aes_key enc_key;
-	struct aes_key dec_key;
-	struct aes_key tweak_key;
+	struct p8_aes_key enc_key;
+	struct p8_aes_key dec_key;
+	struct p8_aes_key tweak_key;
 };
 
 static int p8_aes_xts_init(struct crypto_skcipher *tfm)
 {
 	struct p8_aes_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
diff --git a/arch/powerpc/crypto/aesp8-ppc.h b/arch/powerpc/crypto/aesp8-ppc.h
index 5764d4438388..0bea010128cb 100644
--- a/arch/powerpc/crypto/aesp8-ppc.h
+++ b/arch/powerpc/crypto/aesp8-ppc.h
@@ -1,10 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #include <linux/types.h>
 #include <crypto/aes.h>
 
-struct aes_key {
+struct p8_aes_key {
 	u8 key[AES_MAX_KEYLENGTH];
 	int rounds;
 };
 
 extern struct shash_alg p8_ghash_alg;
@@ -12,19 +12,20 @@ extern struct crypto_alg p8_aes_alg;
 extern struct skcipher_alg p8_aes_cbc_alg;
 extern struct skcipher_alg p8_aes_ctr_alg;
 extern struct skcipher_alg p8_aes_xts_alg;
 
 int aes_p8_set_encrypt_key(const u8 *userKey, const int bits,
-			   struct aes_key *key);
+			   struct p8_aes_key *key);
 int aes_p8_set_decrypt_key(const u8 *userKey, const int bits,
-			   struct aes_key *key);
-void aes_p8_encrypt(const u8 *in, u8 *out, const struct aes_key *key);
-void aes_p8_decrypt(const u8 *in, u8 *out, const struct aes_key *key);
+			   struct p8_aes_key *key);
+void aes_p8_encrypt(const u8 *in, u8 *out, const struct p8_aes_key *key);
+void aes_p8_decrypt(const u8 *in, u8 *out, const struct p8_aes_key *key);
 void aes_p8_cbc_encrypt(const u8 *in, u8 *out, size_t len,
-			const struct aes_key *key, u8 *iv, const int enc);
-void aes_p8_ctr32_encrypt_blocks(const u8 *in, u8 *out,
-				 size_t len, const struct aes_key *key,
-				 const u8 *iv);
+			const struct p8_aes_key *key, u8 *iv, const int enc);
+void aes_p8_ctr32_encrypt_blocks(const u8 *in, u8 *out, size_t len,
+				 const struct p8_aes_key *key, const u8 *iv);
 void aes_p8_xts_encrypt(const u8 *in, u8 *out, size_t len,
-			const struct aes_key *key1, const struct aes_key *key2, u8 *iv);
+			const struct p8_aes_key *key1,
+			const struct p8_aes_key *key2, u8 *iv);
 void aes_p8_xts_decrypt(const u8 *in, u8 *out, size_t len,
-			const struct aes_key *key1, const struct aes_key *key2, u8 *iv);
+			const struct p8_aes_key *key1,
+			const struct p8_aes_key *key2, u8 *iv);

base-commit: e78a3142fa5875126e477fdfe329b0aeb1b0693f
-- 
2.52.0


