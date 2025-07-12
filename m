Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23110C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 00:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TMsLZO1bpTAJZJK7qrcR2GqkeUprp3/YrV3Ia6Gi5I=; b=ASAUCCvS/0xqrBTm2f9HAO0oew
	4b7C5oA6x6g/Mjlz0Wo+zxBZqiTB4M4LI3QvURldR0Yhc1ngw1CIlAzXUnuDs0qblc+j/hTbdOl5Z
	rzDM67t3XrbfR7tacdiy2wrbkm5+ApzpWT3QgHqN8THuenRI3gSHqUHzE4cJxhpzaFG1Qh/meJlyi
	B2BBGZLGL85tQ8ZTIWV8W9tSTlMSEgFOstR7ZtwBQw8CiYN5S5oPuAUsutFD/x3noidSpg8Evycsd
	qx0yDMx0GIgbFBcUA5eAfgyMb1iNq9/Rmf/U5f26eWmPTTQ1cKPPrkE2Wncb3HAbs+zgK5biubMV/
	8HY3QEOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uakBS-0000000HBEA-4AVf;
	Sun, 13 Jul 2025 00:03:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uajby-0000000H7ef-2Has
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 23:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE48461132;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5734BC4CEF5;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362789;
	bh=KDQk7Ir1m956D0f1p9m7xAyJlDKZMG/Uv5S3nHotAXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WtGAriuOY7k91SmjWU1Jatz3UxR2BoHMvt2+41ewmLk75abevvy+rjaJDEKA9dayT
	 4HnruTxiMdXn9C2lbXUTYijPl6AGxeUiVHGzv2Mci1g3kf1n8j8iqK/Gw4UhDfA1OM
	 LEGQqPAvwRxD68ZByGUo/zfUhFtcAtZjF5EdvVBpUtFrWQZfMdAZzLC+bqW3uQZhM0
	 78Q9KCitYCnlEFnRK/ju2eh+jLK5DHwcHu4G++4VwfzzEeTmEfmKN7aI+ajzvGYgYp
	 L16hAYEY2uFqQu6UpZuTAuo837yuo7jq8gjxWFDQqb9fzhSIEx19EAKXI/j3/CqaeY
	 kvMR31cHKCF7g==
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
Subject: [PATCH 20/26] lib/digsig: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:11 -0700
Message-ID: <20250712232329.818226-21-ebiggers@kernel.org>
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

Use the SHA-1 library functions instead of crypto_shash.  This is
simpler and faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/Kconfig  |  3 +--
 lib/digsig.c | 46 ++++++----------------------------------------
 2 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/lib/Kconfig b/lib/Kconfig
index 37db228f70a99..670c19800c26c 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -561,12 +561,11 @@ config MPILIB
 	  which is used by IMA/EVM digital signature extension.
 
 config SIGNATURE
 	tristate
 	depends on KEYS
-	select CRYPTO
-	select CRYPTO_SHA1
+	select CRYPTO_LIB_SHA1
 	select MPILIB
 	help
 	  Digital signature verification. Currently only RSA is supported.
 	  Implementation is done using GnuPG MPI library
 
diff --git a/lib/digsig.c b/lib/digsig.c
index 04b5e55ed95f5..5ddcc52f76863 100644
--- a/lib/digsig.c
+++ b/lib/digsig.c
@@ -16,19 +16,15 @@
 
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/key.h>
-#include <linux/crypto.h>
-#include <crypto/hash.h>
 #include <crypto/sha1.h>
 #include <keys/user-type.h>
 #include <linux/mpi.h>
 #include <linux/digsig.h>
 
-static struct crypto_shash *shash;
-
 static const char *pkcs_1_v1_5_decode_emsa(const unsigned char *msg,
 						unsigned long  msglen,
 						unsigned long  modulus_bitlen,
 						unsigned long *outlen)
 {
@@ -197,16 +193,16 @@ static int digsig_verify_rsa(struct key *key,
  *
  */
 int digsig_verify(struct key *keyring, const char *sig, int siglen,
 						const char *data, int datalen)
 {
-	int err = -ENOMEM;
 	struct signature_hdr *sh = (struct signature_hdr *)sig;
-	struct shash_desc *desc = NULL;
+	struct sha1_ctx ctx;
 	unsigned char hash[SHA1_DIGEST_SIZE];
 	struct key *key;
 	char name[20];
+	int err;
 
 	if (siglen < sizeof(*sh) + 2)
 		return -EINVAL;
 
 	if (sh->algo != PUBKEY_ALGO_RSA)
@@ -229,51 +225,21 @@ int digsig_verify(struct key *keyring, const char *sig, int siglen,
 	if (IS_ERR(key)) {
 		pr_err("key not found, id: %s\n", name);
 		return PTR_ERR(key);
 	}
 
-	desc = kzalloc(sizeof(*desc) + crypto_shash_descsize(shash),
-		       GFP_KERNEL);
-	if (!desc)
-		goto err;
-
-	desc->tfm = shash;
-
-	crypto_shash_init(desc);
-	crypto_shash_update(desc, data, datalen);
-	crypto_shash_update(desc, sig, sizeof(*sh));
-	crypto_shash_final(desc, hash);
-
-	kfree(desc);
+	sha1_init(&ctx);
+	sha1_update(&ctx, data, datalen);
+	sha1_update(&ctx, sig, sizeof(*sh));
+	sha1_final(&ctx, hash);
 
 	/* pass signature mpis address */
 	err = digsig_verify_rsa(key, sig + sizeof(*sh), siglen - sizeof(*sh),
 			     hash, sizeof(hash));
 
-err:
 	key_put(key);
 
 	return err ? -EINVAL : 0;
 }
 EXPORT_SYMBOL_GPL(digsig_verify);
 
-static int __init digsig_init(void)
-{
-	shash = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(shash)) {
-		pr_err("shash allocation failed\n");
-		return  PTR_ERR(shash);
-	}
-
-	return 0;
-
-}
-
-static void __exit digsig_cleanup(void)
-{
-	crypto_free_shash(shash);
-}
-
-module_init(digsig_init);
-module_exit(digsig_cleanup);
-
 MODULE_LICENSE("GPL");
-- 
2.50.1


