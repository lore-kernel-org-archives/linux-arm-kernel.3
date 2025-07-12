Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AC0C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 00:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLl0ya5eXGc1QzUphNtDcQRNvmr9D8SInxfRd+Jb+pA=; b=SjedTToSDFANDRku6l3oGt5UEz
	ZcRrJqLK78MycfA15sy+d+dPJpIkTvNr1hQWzUUGSzP3r49jwPSH8PGVSW70cJS+xXrYP+h/jq6mg
	2vLUAyZyRDz1mENUdi2+oGw1BScoJLcajKnRuWjVLu7lByUKMa4p/TU4v/EY62BgsWTVMNuFQfLfC
	wgzEe+zL7NegK3d4yz/XQQzQkf8Av5AJ398DzPjR5Q2p+qCtsYdJhGzngU3YDCojFoqgBKbmZ2VeS
	pM5SHE+rwbAuT2TtejH9c/CldCe7sOR0IRKxQQ44q08sQ1diYakUE1El1rhCsgWKBIDu447mIPlal
	KGLqRzqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uakKv-0000000HBr4-07PO;
	Sun, 13 Jul 2025 00:12:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajbz-0000000H7g9-3yqu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C2586114D;
	Sat, 12 Jul 2025 23:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87F5C4CEF8;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362791;
	bh=rfJ72uWvvK+whDF9VjkI5SYPfCKh27VtzjmWTwXhIJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=adPuDNFTOjCINdd++ewChJOGNbvpvPCdKMgJfTgRQVWFOLKuAr3v2d13HC1FITvPY
	 gL08rEFOe6I2qF2+ngmp0urjV0YUz6HmCSL1V8p3M1gV9CyYQMgLkCJS+O+7bq/Pd/
	 ELxAGoNm19hqjcz2MxC3qh2PLrusWwnTLczFTZqnDSGLkcEJvnUS8MeuaBWVioD+9M
	 Ek1NkQVcy8IFlqynbsqyE5FOtX0PqYijraDbs8A7GLcrL32Zrb9sK1oM6D6Bhe1T2G
	 AEDIb2+J1IXfEmKx8lL4J44Lyw1N73Qnd6JzBQB9Ltysfp/U2VnrpBGKTh7PN2Vof2
	 BtNUAszxW2+rQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 23/26] ppp: mppe: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:14 -0700
Message-ID: <20250712232329.818226-24-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
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

Use the SHA-1 library instead of crypto_shash.  This is simpler and
faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/net/ppp/Kconfig    |   3 +-
 drivers/net/ppp/ppp_mppe.c | 109 +++++++------------------------------
 2 files changed, 20 insertions(+), 92 deletions(-)

diff --git a/drivers/net/ppp/Kconfig b/drivers/net/ppp/Kconfig
index 8c9ed1889d1af..a1806b4b84beb 100644
--- a/drivers/net/ppp/Kconfig
+++ b/drivers/net/ppp/Kconfig
@@ -83,13 +83,12 @@ config PPP_FILTER
 	  If unsure, say N.
 
 config PPP_MPPE
 	tristate "PPP MPPE compression (encryption)"
 	depends on PPP
-	select CRYPTO
-	select CRYPTO_SHA1
 	select CRYPTO_LIB_ARC4
+	select CRYPTO_LIB_SHA1
 	help
 	  Support for the MPPE Encryption protocol, as employed by the
 	  Microsoft Point-to-Point Tunneling Protocol.
 
 	  See http://pptpclient.sourceforge.net/ for information on
diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
index bcc1eaedf58fb..126908549f9c7 100644
--- a/drivers/net/ppp/ppp_mppe.c
+++ b/drivers/net/ppp/ppp_mppe.c
@@ -41,11 +41,11 @@
  *                    MOD_DEC_USAGE_COUNT/MOD_INC_USAGE_COUNT which are
  *                    deprecated in 2.6
  */
 
 #include <crypto/arc4.h>
-#include <crypto/hash.h>
+#include <crypto/sha1.h>
 #include <linux/err.h>
 #include <linux/fips.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -53,11 +53,10 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/ppp_defs.h>
 #include <linux/ppp-comp.h>
-#include <linux/scatterlist.h>
 #include <linux/unaligned.h>
 
 #include "ppp_mppe.h"
 
 MODULE_AUTHOR("Frank Cusack <fcusack@fcusack.com>");
@@ -65,35 +64,19 @@ MODULE_DESCRIPTION("Point-to-Point Protocol Microsoft Point-to-Point Encryption
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
 MODULE_VERSION("1.0.2");
 
 #define SHA1_PAD_SIZE 40
-
-/*
- * kernel crypto API needs its arguments to be in kmalloc'd memory, not in the module
- * static data area.  That means sha_pad needs to be kmalloc'd.
- */
-
-struct sha_pad {
-	unsigned char sha_pad1[SHA1_PAD_SIZE];
-	unsigned char sha_pad2[SHA1_PAD_SIZE];
-};
-static struct sha_pad *sha_pad;
-
-static inline void sha_pad_init(struct sha_pad *shapad)
-{
-	memset(shapad->sha_pad1, 0x00, sizeof(shapad->sha_pad1));
-	memset(shapad->sha_pad2, 0xF2, sizeof(shapad->sha_pad2));
-}
+static const u8 sha_pad1[SHA1_PAD_SIZE] = { 0 };
+static const u8 sha_pad2[SHA1_PAD_SIZE] = { [0 ... SHA1_PAD_SIZE - 1] = 0xF2 };
 
 /*
  * State for an MPPE (de)compressor.
  */
 struct ppp_mppe_state {
 	struct arc4_ctx arc4;
-	struct shash_desc *sha1;
-	unsigned char *sha1_digest;
+	unsigned char sha1_digest[SHA1_DIGEST_SIZE];
 	unsigned char master_key[MPPE_MAX_KEY_LEN];
 	unsigned char session_key[MPPE_MAX_KEY_LEN];
 	unsigned keylen;	/* key length in bytes             */
 	/* NB: 128-bit == 16, 40-bit == 8! */
 	/* If we want to support 56-bit,   */
@@ -128,28 +111,27 @@ struct ppp_mppe_state {
  * Key Derivation, from RFC 3078, RFC 3079.
  * Equivalent to Get_Key() for MS-CHAP as described in RFC 3079.
  */
 static void get_new_key_from_sha(struct ppp_mppe_state * state)
 {
-	crypto_shash_init(state->sha1);
-	crypto_shash_update(state->sha1, state->master_key,
-			    state->keylen);
-	crypto_shash_update(state->sha1, sha_pad->sha_pad1,
-			    sizeof(sha_pad->sha_pad1));
-	crypto_shash_update(state->sha1, state->session_key,
-			    state->keylen);
-	crypto_shash_update(state->sha1, sha_pad->sha_pad2,
-			    sizeof(sha_pad->sha_pad2));
-	crypto_shash_final(state->sha1, state->sha1_digest);
+	struct sha1_ctx ctx;
+
+	sha1_init(&ctx);
+	sha1_update(&ctx, state->master_key, state->keylen);
+	sha1_update(&ctx, sha_pad1, sizeof(sha_pad1));
+	sha1_update(&ctx, state->session_key, state->keylen);
+	sha1_update(&ctx, sha_pad2, sizeof(sha_pad2));
+	sha1_final(&ctx, state->sha1_digest);
 }
 
 /*
  * Perform the MPPE rekey algorithm, from RFC 3078, sec. 7.3.
  * Well, not what's written there, but rather what they meant.
  */
 static void mppe_rekey(struct ppp_mppe_state * state, int initial_key)
 {
+	static_assert(SHA1_DIGEST_SIZE >= MPPE_MAX_KEY_LEN);
 	get_new_key_from_sha(state);
 	if (!initial_key) {
 		arc4_setkey(&state->arc4, state->sha1_digest, state->keylen);
 		arc4_crypt(&state->arc4, state->session_key, state->sha1_digest,
 			   state->keylen);
@@ -169,43 +151,19 @@ static void mppe_rekey(struct ppp_mppe_state * state, int initial_key)
  * Allocate space for a (de)compressor.
  */
 static void *mppe_alloc(unsigned char *options, int optlen)
 {
 	struct ppp_mppe_state *state;
-	struct crypto_shash *shash;
-	unsigned int digestsize;
 
 	if (optlen != CILEN_MPPE + sizeof(state->master_key) ||
 	    options[0] != CI_MPPE || options[1] != CILEN_MPPE ||
 	    fips_enabled)
-		goto out;
+		return NULL;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state == NULL)
-		goto out;
-
-
-	shash = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(shash))
-		goto out_free;
-
-	state->sha1 = kmalloc(sizeof(*state->sha1) +
-				     crypto_shash_descsize(shash),
-			      GFP_KERNEL);
-	if (!state->sha1) {
-		crypto_free_shash(shash);
-		goto out_free;
-	}
-	state->sha1->tfm = shash;
-
-	digestsize = crypto_shash_digestsize(shash);
-	if (digestsize < MPPE_MAX_KEY_LEN)
-		goto out_free;
-
-	state->sha1_digest = kmalloc(digestsize, GFP_KERNEL);
-	if (!state->sha1_digest)
-		goto out_free;
+		return NULL;
 
 	/* Save keys. */
 	memcpy(state->master_key, &options[CILEN_MPPE],
 	       sizeof(state->master_key));
 	memcpy(state->session_key, state->master_key,
@@ -215,34 +173,20 @@ static void *mppe_alloc(unsigned char *options, int optlen)
 	 * We defer initial key generation until mppe_init(), as mppe_alloc()
 	 * is called frequently during negotiation.
 	 */
 
 	return (void *)state;
-
-out_free:
-	kfree(state->sha1_digest);
-	if (state->sha1) {
-		crypto_free_shash(state->sha1->tfm);
-		kfree_sensitive(state->sha1);
-	}
-	kfree(state);
-out:
-	return NULL;
 }
 
 /*
  * Deallocate space for a (de)compressor.
  */
 static void mppe_free(void *arg)
 {
 	struct ppp_mppe_state *state = (struct ppp_mppe_state *) arg;
-	if (state) {
-		kfree(state->sha1_digest);
-		crypto_free_shash(state->sha1->tfm);
-		kfree_sensitive(state->sha1);
-		kfree_sensitive(state);
-	}
+
+	kfree_sensitive(state);
 }
 
 /*
  * Initialize (de)compressor state.
  */
@@ -647,42 +591,27 @@ static struct compressor ppp_mppe = {
 	.decomp_stat    = mppe_comp_stats,
 	.owner          = THIS_MODULE,
 	.comp_extra     = MPPE_PAD,
 };
 
-/*
- * ppp_mppe_init()
- *
- * Prior to allowing load, try to load the arc4 and sha1 crypto
- * libraries.  The actual use will be allocated later, but
- * this way the module will fail to insmod if they aren't available.
- */
-
 static int __init ppp_mppe_init(void)
 {
 	int answer;
-	if (fips_enabled || !crypto_has_ahash("sha1", 0, CRYPTO_ALG_ASYNC))
-		return -ENODEV;
 
-	sha_pad = kmalloc(sizeof(struct sha_pad), GFP_KERNEL);
-	if (!sha_pad)
-		return -ENOMEM;
-	sha_pad_init(sha_pad);
+	if (fips_enabled)
+		return -ENODEV;
 
 	answer = ppp_register_compressor(&ppp_mppe);
 
 	if (answer == 0)
 		printk(KERN_INFO "PPP MPPE Compression module registered\n");
-	else
-		kfree(sha_pad);
 
 	return answer;
 }
 
 static void __exit ppp_mppe_cleanup(void)
 {
 	ppp_unregister_compressor(&ppp_mppe);
-	kfree(sha_pad);
 }
 
 module_init(ppp_mppe_init);
 module_exit(ppp_mppe_cleanup);
-- 
2.50.1


