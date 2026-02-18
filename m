Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4265E9A04B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2yv6gsrcUobvLTrIrMEXKyqODCq1uTmT4BdR4d+dzo=; b=L+5h3ZcNCVcAPhM5nvHeKu08K8
	am0SkSeuPmPCIMftOlRqzyo29EpfGdVn6+Tqqzyz10knmsDiHrsa5etRBuQma7gtwpxU7SbotJU0J
	LhxTyfFuG9USmChFpumyOpmdOBp0KHCXVNUyXoo4HuUTKEMjohFQMiuJ4XiqUze+lKmgAAgNT0EOX
	QaVYfT+2PDs51PXSDMr2I+OdeUFnFW5Mg+DsKGbmcqXW9CDiGXLs2CLO9wYnFMfNXTPvCegNf80Di
	uQzYQVR1AhxrCf4glmLRaxO0nm/gJBGolv7cTVYdauhBRQr6dTqKLGULkcvip5ChR64MPHqQebWqG
	JNAKS/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspEH-0000000ASYT-3Ufv;
	Wed, 18 Feb 2026 21:37:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspEA-0000000ASTS-3Je8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 21:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BD5741B19;
	Wed, 18 Feb 2026 21:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9A2C2BCB6;
	Wed, 18 Feb 2026 21:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771450618;
	bh=ZYqIlQtwnbFetuVQNGe0mxtg3leOUfnKsQb3/hSGeAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g5y8ewUh5ElMc0r4CQ+/6110CWS7emGEDkYxi9P4CD+n9254VvFfIV7kNufM30hwW
	 DYWnPg/aakMF7QE5EbTc764kRKkbqoNWnTXXhvxFBTzDQc3r/S3/LSCEzWj8zxx/cP
	 42DvyGaBxVtDmkIXQ8Hj4n5zS/mq9DIMeiuDdnbFBo42tE2S3POe8vSu0TsUIz+Ygl
	 aJtEbzrsmsPaEEI6l+BNklX7CFr0/D4CDGtYixL5J/TZmXnTwGe8K3r9fdMXjHuDrg
	 q8gyv0iQVwjgObGvyPC4FVQjRPiLMJFyRBxL4ST0gX37y3v1WI80zhrdWMn4bcfQ7+
	 lL2Nhl8W9eMzg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 12/15] ksmbd: Use AES-CMAC library for SMB3 signature calculation
Date: Wed, 18 Feb 2026 13:34:58 -0800
Message-ID: <20260218213501.136844-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218213501.136844-1-ebiggers@kernel.org>
References: <20260218213501.136844-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_133658_868796_F6534313 
X-CRM114-Status: GOOD (  21.24  )
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

Now that AES-CMAC has a library API, convert ksmbd_sign_smb3_pdu() to
use it instead of a "cmac(aes)" crypto_shash.

The result is simpler and faster code.  With the library there's no need
to dynamically allocate memory, no need to handle errors, and the
AES-CMAC code is accessed directly without inefficient indirect calls
and other unnecessary API overhead.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/smb/server/Kconfig      |  2 +-
 fs/smb/server/auth.c       | 51 +++++++++------------------------
 fs/smb/server/auth.h       |  4 +--
 fs/smb/server/crypto_ctx.c | 58 --------------------------------------
 fs/smb/server/crypto_ctx.h | 12 --------
 fs/smb/server/server.c     |  1 -
 fs/smb/server/smb2pdu.c    |  8 ++----
 7 files changed, 19 insertions(+), 117 deletions(-)

diff --git a/fs/smb/server/Kconfig b/fs/smb/server/Kconfig
index 12594879cb64..eae3728cff54 100644
--- a/fs/smb/server/Kconfig
+++ b/fs/smb/server/Kconfig
@@ -6,17 +6,17 @@ config SMB_SERVER
 	select NLS
 	select NLS_UTF8
 	select NLS_UCS2_UTILS
 	select CRYPTO
 	select CRYPTO_ECB
+	select CRYPTO_LIB_AES_CBC_MACS
 	select CRYPTO_LIB_ARC4
 	select CRYPTO_LIB_DES
 	select CRYPTO_LIB_MD5
 	select CRYPTO_LIB_SHA256
 	select CRYPTO_LIB_SHA512
 	select CRYPTO_LIB_UTILS
-	select CRYPTO_CMAC
 	select CRYPTO_AEAD2
 	select CRYPTO_CCM
 	select CRYPTO_GCM
 	select ASN1
 	select OID_REGISTRY
diff --git a/fs/smb/server/auth.c b/fs/smb/server/auth.c
index a69e8694605a..05234e5bd16e 100644
--- a/fs/smb/server/auth.c
+++ b/fs/smb/server/auth.c
@@ -9,12 +9,12 @@
 #include <linux/uaccess.h>
 #include <linux/backing-dev.h>
 #include <linux/writeback.h>
 #include <linux/uio.h>
 #include <linux/xattr.h>
-#include <crypto/hash.h>
 #include <crypto/aead.h>
+#include <crypto/aes-cbc-macs.h>
 #include <crypto/md5.h>
 #include <crypto/sha2.h>
 #include <crypto/utils.h>
 #include <linux/random.h>
 #include <linux/scatterlist.h>
@@ -488,50 +488,25 @@ void ksmbd_sign_smb2_pdu(struct ksmbd_conn *conn, char *key, struct kvec *iov,
  * @iov:        buffer iov array
  * @n_vec:	number of iovecs
  * @sig:	signature value generated for client request packet
  *
  */
-int ksmbd_sign_smb3_pdu(struct ksmbd_conn *conn, char *key, struct kvec *iov,
-			int n_vec, char *sig)
+void ksmbd_sign_smb3_pdu(struct ksmbd_conn *conn, char *key, struct kvec *iov,
+			 int n_vec, char *sig)
 {
-	struct ksmbd_crypto_ctx *ctx;
-	int rc, i;
-
-	ctx = ksmbd_crypto_ctx_find_cmacaes();
-	if (!ctx) {
-		ksmbd_debug(AUTH, "could not crypto alloc cmac\n");
-		return -ENOMEM;
-	}
-
-	rc = crypto_shash_setkey(CRYPTO_CMACAES_TFM(ctx),
-				 key,
-				 SMB2_CMACAES_SIZE);
-	if (rc)
-		goto out;
-
-	rc = crypto_shash_init(CRYPTO_CMACAES(ctx));
-	if (rc) {
-		ksmbd_debug(AUTH, "cmaces init error %d\n", rc);
-		goto out;
-	}
+	struct aes_cmac_key cmac_key;
+	struct aes_cmac_ctx cmac_ctx;
+	int i;
 
-	for (i = 0; i < n_vec; i++) {
-		rc = crypto_shash_update(CRYPTO_CMACAES(ctx),
-					 iov[i].iov_base,
-					 iov[i].iov_len);
-		if (rc) {
-			ksmbd_debug(AUTH, "cmaces update error %d\n", rc);
-			goto out;
-		}
-	}
+	/* This cannot fail, since we always pass a valid key length. */
+	static_assert(SMB2_CMACAES_SIZE == AES_KEYSIZE_128);
+	aes_cmac_preparekey(&cmac_key, key, SMB2_CMACAES_SIZE);
 
-	rc = crypto_shash_final(CRYPTO_CMACAES(ctx), sig);
-	if (rc)
-		ksmbd_debug(AUTH, "cmaces generation error %d\n", rc);
-out:
-	ksmbd_release_crypto_ctx(ctx);
-	return rc;
+	aes_cmac_init(&cmac_ctx, &cmac_key);
+	for (i = 0; i < n_vec; i++)
+		aes_cmac_update(&cmac_ctx, iov[i].iov_base, iov[i].iov_len);
+	aes_cmac_final(&cmac_ctx, sig);
 }
 
 struct derivation {
 	struct kvec label;
 	struct kvec context;
diff --git a/fs/smb/server/auth.h b/fs/smb/server/auth.h
index 6d351d61b0e5..5767aabc63c9 100644
--- a/fs/smb/server/auth.h
+++ b/fs/smb/server/auth.h
@@ -52,12 +52,12 @@ ksmbd_build_ntlmssp_challenge_blob(struct challenge_message *chgblob,
 				   struct ksmbd_conn *conn);
 int ksmbd_krb5_authenticate(struct ksmbd_session *sess, char *in_blob,
 			    int in_len,	char *out_blob, int *out_len);
 void ksmbd_sign_smb2_pdu(struct ksmbd_conn *conn, char *key, struct kvec *iov,
 			 int n_vec, char *sig);
-int ksmbd_sign_smb3_pdu(struct ksmbd_conn *conn, char *key, struct kvec *iov,
-			int n_vec, char *sig);
+void ksmbd_sign_smb3_pdu(struct ksmbd_conn *conn, char *key, struct kvec *iov,
+			 int n_vec, char *sig);
 int ksmbd_gen_smb30_signingkey(struct ksmbd_session *sess,
 			       struct ksmbd_conn *conn);
 int ksmbd_gen_smb311_signingkey(struct ksmbd_session *sess,
 				struct ksmbd_conn *conn);
 void ksmbd_gen_smb30_encryptionkey(struct ksmbd_conn *conn,
diff --git a/fs/smb/server/crypto_ctx.c b/fs/smb/server/crypto_ctx.c
index fe29d186baf6..1cb0ea2042b5 100644
--- a/fs/smb/server/crypto_ctx.c
+++ b/fs/smb/server/crypto_ctx.c
@@ -26,18 +26,10 @@ static inline void free_aead(struct crypto_aead *aead)
 {
 	if (aead)
 		crypto_free_aead(aead);
 }
 
-static void free_shash(struct shash_desc *shash)
-{
-	if (shash) {
-		crypto_free_shash(shash->tfm);
-		kfree(shash);
-	}
-}
-
 static struct crypto_aead *alloc_aead(int id)
 {
 	struct crypto_aead *tfm = NULL;
 
 	switch (id) {
@@ -58,41 +50,14 @@ static struct crypto_aead *alloc_aead(int id)
 	}
 
 	return tfm;
 }
 
-static struct shash_desc *alloc_shash_desc(int id)
-{
-	struct crypto_shash *tfm = NULL;
-	struct shash_desc *shash;
-
-	switch (id) {
-	case CRYPTO_SHASH_CMACAES:
-		tfm = crypto_alloc_shash("cmac(aes)", 0, 0);
-		break;
-	default:
-		return NULL;
-	}
-
-	if (IS_ERR(tfm))
-		return NULL;
-
-	shash = kzalloc(sizeof(*shash) + crypto_shash_descsize(tfm),
-			KSMBD_DEFAULT_GFP);
-	if (!shash)
-		crypto_free_shash(tfm);
-	else
-		shash->tfm = tfm;
-	return shash;
-}
-
 static void ctx_free(struct ksmbd_crypto_ctx *ctx)
 {
 	int i;
 
-	for (i = 0; i < CRYPTO_SHASH_MAX; i++)
-		free_shash(ctx->desc[i]);
 	for (i = 0; i < CRYPTO_AEAD_MAX; i++)
 		free_aead(ctx->ccmaes[i]);
 	kfree(ctx);
 }
 
@@ -151,33 +116,10 @@ void ksmbd_release_crypto_ctx(struct ksmbd_crypto_ctx *ctx)
 	ctx_list.avail_ctx--;
 	spin_unlock(&ctx_list.ctx_lock);
 	ctx_free(ctx);
 }
 
-static struct ksmbd_crypto_ctx *____crypto_shash_ctx_find(int id)
-{
-	struct ksmbd_crypto_ctx *ctx;
-
-	if (id >= CRYPTO_SHASH_MAX)
-		return NULL;
-
-	ctx = ksmbd_find_crypto_ctx();
-	if (ctx->desc[id])
-		return ctx;
-
-	ctx->desc[id] = alloc_shash_desc(id);
-	if (ctx->desc[id])
-		return ctx;
-	ksmbd_release_crypto_ctx(ctx);
-	return NULL;
-}
-
-struct ksmbd_crypto_ctx *ksmbd_crypto_ctx_find_cmacaes(void)
-{
-	return ____crypto_shash_ctx_find(CRYPTO_SHASH_CMACAES);
-}
-
 static struct ksmbd_crypto_ctx *____crypto_aead_ctx_find(int id)
 {
 	struct ksmbd_crypto_ctx *ctx;
 
 	if (id >= CRYPTO_AEAD_MAX)
diff --git a/fs/smb/server/crypto_ctx.h b/fs/smb/server/crypto_ctx.h
index b9476ed520ae..02d2893665a4 100644
--- a/fs/smb/server/crypto_ctx.h
+++ b/fs/smb/server/crypto_ctx.h
@@ -4,18 +4,12 @@
  */
 
 #ifndef __CRYPTO_CTX_H__
 #define __CRYPTO_CTX_H__
 
-#include <crypto/hash.h>
 #include <crypto/aead.h>
 
-enum {
-	CRYPTO_SHASH_CMACAES	= 0,
-	CRYPTO_SHASH_MAX,
-};
-
 enum {
 	CRYPTO_AEAD_AES_GCM = 16,
 	CRYPTO_AEAD_AES_CCM,
 	CRYPTO_AEAD_MAX,
 };
@@ -26,23 +20,17 @@ enum {
 };
 
 struct ksmbd_crypto_ctx {
 	struct list_head		list;
 
-	struct shash_desc		*desc[CRYPTO_SHASH_MAX];
 	struct crypto_aead		*ccmaes[CRYPTO_AEAD_MAX];
 };
 
-#define CRYPTO_CMACAES(c)	((c)->desc[CRYPTO_SHASH_CMACAES])
-
-#define CRYPTO_CMACAES_TFM(c)	((c)->desc[CRYPTO_SHASH_CMACAES]->tfm)
-
 #define CRYPTO_GCM(c)		((c)->ccmaes[CRYPTO_AEAD_AES_GCM])
 #define CRYPTO_CCM(c)		((c)->ccmaes[CRYPTO_AEAD_AES_CCM])
 
 void ksmbd_release_crypto_ctx(struct ksmbd_crypto_ctx *ctx);
-struct ksmbd_crypto_ctx *ksmbd_crypto_ctx_find_cmacaes(void);
 struct ksmbd_crypto_ctx *ksmbd_crypto_ctx_find_gcm(void);
 struct ksmbd_crypto_ctx *ksmbd_crypto_ctx_find_ccm(void);
 void ksmbd_crypto_destroy(void);
 int ksmbd_crypto_create(void);
 
diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index c2c074346da1..cc15d9d8468f 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -631,11 +631,10 @@ MODULE_AUTHOR("Namjae Jeon <linkinjeon@kernel.org>");
 MODULE_DESCRIPTION("Linux kernel CIFS/SMB SERVER");
 MODULE_LICENSE("GPL");
 MODULE_SOFTDEP("pre: ecb");
 MODULE_SOFTDEP("pre: nls");
 MODULE_SOFTDEP("pre: aes");
-MODULE_SOFTDEP("pre: cmac");
 MODULE_SOFTDEP("pre: aead2");
 MODULE_SOFTDEP("pre: ccm");
 MODULE_SOFTDEP("pre: gcm");
 module_init(ksmbd_server_init)
 module_exit(ksmbd_server_exit)
diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 7a88cf3bd29e..02bfe15edcab 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -8964,12 +8964,11 @@ int smb3_check_sign_req(struct ksmbd_work *work)
 	memcpy(signature_req, hdr->Signature, SMB2_SIGNATURE_SIZE);
 	memset(hdr->Signature, 0, SMB2_SIGNATURE_SIZE);
 	iov[0].iov_base = (char *)&hdr->ProtocolId;
 	iov[0].iov_len = len;
 
-	if (ksmbd_sign_smb3_pdu(conn, signing_key, iov, 1, signature))
-		return 0;
+	ksmbd_sign_smb3_pdu(conn, signing_key, iov, 1, signature);
 
 	if (crypto_memneq(signature, signature_req, SMB2_SIGNATURE_SIZE)) {
 		pr_err("bad smb2 signature\n");
 		return 0;
 	}
@@ -9016,13 +9015,12 @@ void smb3_set_sign_rsp(struct ksmbd_work *work)
 		n_vec++;
 	} else {
 		iov = &work->iov[work->iov_idx];
 	}
 
-	if (!ksmbd_sign_smb3_pdu(conn, signing_key, iov, n_vec,
-				 signature))
-		memcpy(hdr->Signature, signature, SMB2_SIGNATURE_SIZE);
+	ksmbd_sign_smb3_pdu(conn, signing_key, iov, n_vec, signature);
+	memcpy(hdr->Signature, signature, SMB2_SIGNATURE_SIZE);
 }
 
 /**
  * smb3_preauth_hash_rsp() - handler for computing preauth hash on response
  * @work:   smb work containing response buffer
-- 
2.53.0


