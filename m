Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C227ACCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 05:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNjDvBxH6qCXm3JdlFVuJYrYdRBxk51ptC1XMJ2Gxg4=; b=yK25Y6MHrDQBy9vfoljPma2JlY
	KvAVuZIl6b7wdqp7SQ4CI3Lnduqh1GDrKHddsj1VMBVhYLUuLtCqv1V/GoAdaM9CGaQgBRJDLGyVv
	j4raWO25xdgGhZW42NH6qP2etjk3tQfcnSq2Pl6qIwlI0Zqo3pmEmp5jkGShEO0UWt/qCyz2il7fj
	10daMnPfFEJ/5fDa4SKQu5Swxl479tr4u2PnXv4PwlwzTX8ZVyUa1CCRRQbyhlp2tWDnIZZlNz+vq
	I0EE8QBhsF/J7HIyHuSVzgFtXbZ1reLOji1aOCvqyOjrYHr2bwLrnMrr/dYJRCn8KPCUi9PkaiaBb
	ezPIwMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgl-0000000C2oG-2Dku;
	Sun, 26 Oct 2025 05:53:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgf-0000000C2jh-41Ed
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 05:53:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D38DA60249;
	Sun, 26 Oct 2025 05:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E20C4CEF7;
	Sun, 26 Oct 2025 05:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761457983;
	bh=rqo1U7wEhsUB8CdH4qk8hnOmmNikMjvUrW83FPZiVAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nVTq6Mmi474WJoE5Nj8BFZshsSmt1hahi/B3fYgTDipMpnXO3uXdegxKIf8GWTlWY
	 9tHTh2KfdMvnAPdMgyCKweIVaFM/efr+s0yc4Sh930Et2Kk3L98m6HpxgOZQgRnLJi
	 F5XVycbAWvsgG71nnZAKDz43xkcFTX2c3XgzrT/YjH1fTdHGhaY4weHZIVVrDfOf2z
	 /65ke7kp3/BLU4AvTS/W8tp7wiJNnq+wpM1RJQUB8xlr4tIPKL8FI4XDRzsgWCFuJ7
	 BoKqSWY3Elv2R1/UnpJVZCIlwWZ6nFZxCo78HPchNRXJBKRWMyFD59LkefTnyeaY5n
	 k/AoxxuoVLSVw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/15] crypto: s390/sha3 - Rename conflicting functions
Date: Sat, 25 Oct 2025 22:50:18 -0700
Message-ID: <20251026055032.1413733-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251026055032.1413733-1-ebiggers@kernel.org>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
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

From: David Howells <dhowells@redhat.com>

Rename the s390 sha3_*_init() functions to have an "s390_" prefix to
avoid a name conflict with the upcoming SHA-3 library functions.

Note: this code will be superseded later.  This commit simply keeps the
kernel building for the initial introduction of the library.

Signed-off-by: David Howells <dhowells@redhat.com>
[EB: dropped unnecessary rename of import and export functions, and
     improved commit message]
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/s390/crypto/sha3_256_s390.c | 10 +++++-----
 arch/s390/crypto/sha3_512_s390.c | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/s390/crypto/sha3_256_s390.c b/arch/s390/crypto/sha3_256_s390.c
index 03bb4f4bab701..7415d56649a52 100644
--- a/arch/s390/crypto/sha3_256_s390.c
+++ b/arch/s390/crypto/sha3_256_s390.c
@@ -17,11 +17,11 @@
 #include <linux/module.h>
 #include <linux/string.h>
 
 #include "sha.h"
 
-static int sha3_256_init(struct shash_desc *desc)
+static int s390_sha3_256_init(struct shash_desc *desc)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 
 	sctx->first_message_part = test_facility(86);
 	if (!sctx->first_message_part)
@@ -77,11 +77,11 @@ static int sha3_224_import(struct shash_desc *desc, const void *in)
 	return 0;
 }
 
 static struct shash_alg sha3_256_alg = {
 	.digestsize	=	SHA3_256_DIGEST_SIZE,	   /* = 32 */
-	.init		=	sha3_256_init,
+	.init		=	s390_sha3_256_init,
 	.update		=	s390_sha_update_blocks,
 	.finup		=	s390_sha_finup,
 	.export		=	sha3_256_export,
 	.import		=	sha3_256_import,
 	.descsize	=	S390_SHA_CTX_SIZE,
@@ -94,22 +94,22 @@ static struct shash_alg sha3_256_alg = {
 		.cra_blocksize	 =	SHA3_256_BLOCK_SIZE,
 		.cra_module	 =	THIS_MODULE,
 	}
 };
 
-static int sha3_224_init(struct shash_desc *desc)
+static int s390_sha3_224_init(struct shash_desc *desc)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 
-	sha3_256_init(desc);
+	s390_sha3_256_init(desc);
 	sctx->func = CPACF_KIMD_SHA3_224;
 	return 0;
 }
 
 static struct shash_alg sha3_224_alg = {
 	.digestsize	=	SHA3_224_DIGEST_SIZE,
-	.init		=	sha3_224_init,
+	.init		=	s390_sha3_224_init,
 	.update		=	s390_sha_update_blocks,
 	.finup		=	s390_sha_finup,
 	.export		=	sha3_256_export, /* same as for 256 */
 	.import		=	sha3_224_import, /* function code different! */
 	.descsize	=	S390_SHA_CTX_SIZE,
diff --git a/arch/s390/crypto/sha3_512_s390.c b/arch/s390/crypto/sha3_512_s390.c
index a5c9690eecb19..ff6ee55844005 100644
--- a/arch/s390/crypto/sha3_512_s390.c
+++ b/arch/s390/crypto/sha3_512_s390.c
@@ -16,11 +16,11 @@
 #include <linux/module.h>
 #include <linux/string.h>
 
 #include "sha.h"
 
-static int sha3_512_init(struct shash_desc *desc)
+static int s390_sha3_512_init(struct shash_desc *desc)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 
 	sctx->first_message_part = test_facility(86);
 	if (!sctx->first_message_part)
@@ -76,11 +76,11 @@ static int sha3_384_import(struct shash_desc *desc, const void *in)
 	return 0;
 }
 
 static struct shash_alg sha3_512_alg = {
 	.digestsize	=	SHA3_512_DIGEST_SIZE,
-	.init		=	sha3_512_init,
+	.init		=	s390_sha3_512_init,
 	.update		=	s390_sha_update_blocks,
 	.finup		=	s390_sha_finup,
 	.export		=	sha3_512_export,
 	.import		=	sha3_512_import,
 	.descsize	=	S390_SHA_CTX_SIZE,
@@ -95,22 +95,22 @@ static struct shash_alg sha3_512_alg = {
 	}
 };
 
 MODULE_ALIAS_CRYPTO("sha3-512");
 
-static int sha3_384_init(struct shash_desc *desc)
+static int s390_sha3_384_init(struct shash_desc *desc)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 
-	sha3_512_init(desc);
+	s390_sha3_512_init(desc);
 	sctx->func = CPACF_KIMD_SHA3_384;
 	return 0;
 }
 
 static struct shash_alg sha3_384_alg = {
 	.digestsize	=	SHA3_384_DIGEST_SIZE,
-	.init		=	sha3_384_init,
+	.init		=	s390_sha3_384_init,
 	.update		=	s390_sha_update_blocks,
 	.finup		=	s390_sha_finup,
 	.export		=	sha3_512_export, /* same as for 512 */
 	.import		=	sha3_384_import, /* function code different! */
 	.descsize	=	S390_SHA_CTX_SIZE,
-- 
2.51.1.dirty


