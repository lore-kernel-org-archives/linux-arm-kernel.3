Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEDDCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 00:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwLnAPoabjV7BcvZXxgm7SlWZ1NEPkWR4iLT/ZnCXdk=; b=XkrAGjGOAnKowraamGSF60OknL
	9KWtfzWdBxmCwXQWtS2MDnGx0uT1DGkezWJeRgsoiUUFBGlSyy5f/FDSNLv29jd+oYflGuCvrxGg0
	ZAUDHm7+mrztfod3WzA4aRl9nMUFaJWCBkPiGMQy2LO+G7aZyuHqlzZgG6y0ypPpdIshKl+J/RgCa
	LMoDAALVTZo4KUic3ynFRdyfwje5xLZ0OwuW5O4Yt7A7b4xA7MucwdRht/cAqS7IRlrZ/8KxgR5xd
	w/sgui/hU/RESR2YIoGFOF6YItOfeP1rDY/NanbPZBR7jGpuuox+6wZvB8MT3cUJr88LfkbS0FolE
	upQRs2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9f-0000000BZT0-3e7C;
	Mon, 20 Oct 2025 00:53:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9W-0000000BZNS-31L7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 00:53:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6014F45BAF;
	Mon, 20 Oct 2025 00:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3551C4AF09;
	Mon, 20 Oct 2025 00:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760921612;
	bh=Y9Gh5NX+Xkq+eNV4N4mdP/PaI0Z1KJcE1oP/YqXj9K4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NBOZRs3E1gzSfg8V/39IG+n9ZwkE5r4um/mONt1VG59Z72gZiYvq58iD3U056ONN/
	 LwL4JQiL/xjwShE9dXDUeVVnBtzcldXunITVcYU7JHlEnq3e5gfhkCTcW0XRCDqeU9
	 3KWzvkRHwhRJgNEdHkIuAUIlw2vDAJx/LEOH6ll6Yt5vihODVzZ10/EQoHCUbLfhrT
	 2a6yW9jP9qh7CdRObBczszygoV2l8BLngr9suXD7wCO2Etb5xjftdzzgWa0trwrZ1Q
	 BS710aDApMwShoFhhbz5sCc1JglsWK+VXhd4oftKW/pvzVNFMv1qdC35132kgxboJ6
	 u9DBQ7edEzpmg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Holger Dengler <dengler@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>
Subject: [PATCH 01/17] s390/sha3: Rename conflicting functions
Date: Sun, 19 Oct 2025 17:50:22 -0700
Message-ID: <20251020005038.661542-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020005038.661542-1-ebiggers@kernel.org>
References: <20251020005038.661542-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_175335_562147_C44D3625 
X-CRM114-Status: GOOD (  15.15  )
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

Rename the s390 sha3_* functions to have an "s390_" prefix to avoid
conflict with generic code.

Signed-off-by: David Howells <dhowells@redhat.com>
Acked-By: Harald Freudenberger <freude@linux.ibm.com>
cc: Eric Biggers <ebiggers@kernel.org>
cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
cc: Ard Biesheuvel <ardb@kernel.org>
cc: Holger Dengler <dengler@linux.ibm.com>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: Stephan Mueller <smueller@chronox.de>
cc: linux-crypto@vger.kernel.org
cc: linux-s390@vger.kernel.org
Link: https://lore.kernel.org/r/20251017144311.817771-2-dhowells@redhat.com
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/s390/crypto/sha3_256_s390.c | 26 +++++++++++++-------------
 arch/s390/crypto/sha3_512_s390.c | 26 +++++++++++++-------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/s390/crypto/sha3_256_s390.c b/arch/s390/crypto/sha3_256_s390.c
index 03bb4f4bab701..fd5ecae60a572 100644
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
@@ -30,11 +30,11 @@ static int sha3_256_init(struct shash_desc *desc)
 	sctx->func = CPACF_KIMD_SHA3_256;
 
 	return 0;
 }
 
-static int sha3_256_export(struct shash_desc *desc, void *out)
+static int s390_sha3_256_export(struct shash_desc *desc, void *out)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 	union {
 		u8 *u8;
 		u64 *u64;
@@ -48,11 +48,11 @@ static int sha3_256_export(struct shash_desc *desc, void *out)
 	for (i = 0; i < SHA3_STATE_SIZE / 8; i++)
 		put_unaligned(le64_to_cpu(sctx->sha3.state[i]), p.u64++);
 	return 0;
 }
 
-static int sha3_256_import(struct shash_desc *desc, const void *in)
+static int s390_sha3_256_import(struct shash_desc *desc, const void *in)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 	union {
 		const u8 *u8;
 		const u64 *u64;
@@ -66,26 +66,26 @@ static int sha3_256_import(struct shash_desc *desc, const void *in)
 	sctx->func = CPACF_KIMD_SHA3_256;
 
 	return 0;
 }
 
-static int sha3_224_import(struct shash_desc *desc, const void *in)
+static int s390_sha3_224_import(struct shash_desc *desc, const void *in)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 
-	sha3_256_import(desc, in);
+	s390_sha3_256_import(desc, in);
 	sctx->func = CPACF_KIMD_SHA3_224;
 	return 0;
 }
 
 static struct shash_alg sha3_256_alg = {
 	.digestsize	=	SHA3_256_DIGEST_SIZE,	   /* = 32 */
-	.init		=	sha3_256_init,
+	.init		=	s390_sha3_256_init,
 	.update		=	s390_sha_update_blocks,
 	.finup		=	s390_sha_finup,
-	.export		=	sha3_256_export,
-	.import		=	sha3_256_import,
+	.export		=	s390_sha3_256_export,
+	.import		=	s390_sha3_256_import,
 	.descsize	=	S390_SHA_CTX_SIZE,
 	.statesize	=	SHA3_STATE_SIZE,
 	.base		=	{
 		.cra_name	 =	"sha3-256",
 		.cra_driver_name =	"sha3-256-s390",
@@ -94,26 +94,26 @@ static struct shash_alg sha3_256_alg = {
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
-	.export		=	sha3_256_export, /* same as for 256 */
-	.import		=	sha3_224_import, /* function code different! */
+	.export		=	s390_sha3_256_export, /* same as for 256 */
+	.import		=	s390_sha3_224_import, /* function code different! */
 	.descsize	=	S390_SHA_CTX_SIZE,
 	.statesize	=	SHA3_STATE_SIZE,
 	.base		=	{
 		.cra_name	 =	"sha3-224",
 		.cra_driver_name =	"sha3-224-s390",
diff --git a/arch/s390/crypto/sha3_512_s390.c b/arch/s390/crypto/sha3_512_s390.c
index a5c9690eecb19..f4b52a3a04339 100644
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
@@ -29,11 +29,11 @@ static int sha3_512_init(struct shash_desc *desc)
 	sctx->func = CPACF_KIMD_SHA3_512;
 
 	return 0;
 }
 
-static int sha3_512_export(struct shash_desc *desc, void *out)
+static int s390_sha3_512_export(struct shash_desc *desc, void *out)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 	union {
 		u8 *u8;
 		u64 *u64;
@@ -47,11 +47,11 @@ static int sha3_512_export(struct shash_desc *desc, void *out)
 	for (i = 0; i < SHA3_STATE_SIZE / 8; i++)
 		put_unaligned(le64_to_cpu(sctx->sha3.state[i]), p.u64++);
 	return 0;
 }
 
-static int sha3_512_import(struct shash_desc *desc, const void *in)
+static int s390_sha3_512_import(struct shash_desc *desc, const void *in)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 	union {
 		const u8 *u8;
 		const u64 *u64;
@@ -65,26 +65,26 @@ static int sha3_512_import(struct shash_desc *desc, const void *in)
 	sctx->func = CPACF_KIMD_SHA3_512;
 
 	return 0;
 }
 
-static int sha3_384_import(struct shash_desc *desc, const void *in)
+static int s390_sha3_384_import(struct shash_desc *desc, const void *in)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 
-	sha3_512_import(desc, in);
+	s390_sha3_512_import(desc, in);
 	sctx->func = CPACF_KIMD_SHA3_384;
 	return 0;
 }
 
 static struct shash_alg sha3_512_alg = {
 	.digestsize	=	SHA3_512_DIGEST_SIZE,
-	.init		=	sha3_512_init,
+	.init		=	s390_sha3_512_init,
 	.update		=	s390_sha_update_blocks,
 	.finup		=	s390_sha_finup,
-	.export		=	sha3_512_export,
-	.import		=	sha3_512_import,
+	.export		=	s390_sha3_512_export,
+	.import		=	s390_sha3_512_import,
 	.descsize	=	S390_SHA_CTX_SIZE,
 	.statesize	=	SHA3_STATE_SIZE,
 	.base		=	{
 		.cra_name	 =	"sha3-512",
 		.cra_driver_name =	"sha3-512-s390",
@@ -95,26 +95,26 @@ static struct shash_alg sha3_512_alg = {
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
-	.export		=	sha3_512_export, /* same as for 512 */
-	.import		=	sha3_384_import, /* function code different! */
+	.export		=	s390_sha3_512_export, /* same as for 512 */
+	.import		=	s390_sha3_384_import, /* function code different! */
 	.descsize	=	S390_SHA_CTX_SIZE,
 	.statesize	=	SHA3_STATE_SIZE,
 	.base		=	{
 		.cra_name	 =	"sha3-384",
 		.cra_driver_name =	"sha3-384-s390",
-- 
2.51.1.dirty


