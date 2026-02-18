Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11264E9A04D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8CXpgDglZfw7CyIvgoVDiQfjvenuAwx7/PEhA7fEsc=; b=ao7nmVecu4N532PaohcmOwUxDJ
	fQjlSw1hOmvKQh6y0QSrYSaVNPTkp8MjtNPJ2GxtJxo5QJBWqFVEY8+lf/bYnmXUY63mPbhoMpwp/
	uZlKFDNKjtgjwCE68ulbJTcBxOFmEZLabp8x+RjbQVtT06OD6tYJOKn33vjS/XP7whpd9Ak3BZShg
	XHHTmqH4CC7kbmlVNpD7nw/2ydEJv/lk/x9SLq+h3df3VAI7FacEXkFzMxxoDro4+NWNSdEmStLuC
	VCB9t7EeYc1yCPmNK1u6kksYzWCDbyr/H8DmrHYUPK81aFAXtRJonMKxkEnQgtClO7nIByg5Oin+g
	T31YU8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspEG-0000000ASWN-2IAK;
	Wed, 18 Feb 2026 21:37:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspE6-0000000ASPB-3Zyh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 21:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA8274376C;
	Wed, 18 Feb 2026 21:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D2CC2BCB2;
	Wed, 18 Feb 2026 21:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771450614;
	bh=RfXKwO9L3mlz5kqOurMbNRJCV4vYWaJHp6x9x+hkRPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Su8jtnhsciBt1sckGun8RAAdjFMXTLnvoRdF+ZZ7Tf+YPetiXSfdMtWA+QCrq/xuZ
	 LC+tZUeX5QgxkAU1DH9WFTtxMlERcAAtnUJwHX8FpeXH9lx/jmbjWTbjl3ooJ98GFd
	 NkvmtcEfxgccMdgMGT4QwVMtCQvvxh3sHqP41VWdfhD6g+QpIzYSyGbKRvfPuX+AFs
	 i+ny6LvBf9MroUEPF8hCY5B1qpRdzypyCee0GTJ2phCjowvtvZaBl/Ox1dd991a22j
	 YabktEmIWGaQVTKjgRCGGUqVbTdhWXQ1IPRxinbAfHwrnFlg4FVLKiLYhgy3wSlbID
	 oeGNcXA04Nsww==
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
Subject: [PATCH 08/15] smb: client: Use AES-CMAC library for SMB3 signature calculation
Date: Wed, 18 Feb 2026 13:34:54 -0800
Message-ID: <20260218213501.136844-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218213501.136844-1-ebiggers@kernel.org>
References: <20260218213501.136844-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_133654_936032_62AFF803 
X-CRM114-Status: GOOD (  23.41  )
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

Convert smb3_calc_signature() to use the AES-CMAC library instead of a
"cmac(aes)" crypto_shash.

The result is simpler and faster code.  With the library there's no need
to allocate memory, no need to handle errors except for key preparation,
and the AES-CMAC code is accessed directly without inefficient indirect
calls and other unnecessary API overhead.

For now a "cmac(aes)" crypto_shash is still being allocated in
'struct cifs_secmech'.  Later commits will remove that, simplifying the
code even further.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/smb/client/Kconfig         |  1 +
 fs/smb/client/cifsencrypt.c   | 60 ++++++++++++-----------------------
 fs/smb/client/cifsglob.h      |  2 +-
 fs/smb/client/smb2transport.c | 41 +++++-------------------
 4 files changed, 30 insertions(+), 74 deletions(-)

diff --git a/fs/smb/client/Kconfig b/fs/smb/client/Kconfig
index 17bd368574e9..64afd302202f 100644
--- a/fs/smb/client/Kconfig
+++ b/fs/smb/client/Kconfig
@@ -9,10 +9,11 @@ config CIFS
 	select CRYPTO_AEAD2
 	select CRYPTO_CCM
 	select CRYPTO_GCM
 	select CRYPTO_ECB
 	select CRYPTO_AES
+	select CRYPTO_LIB_AES_CBC_MACS
 	select CRYPTO_LIB_ARC4
 	select CRYPTO_LIB_MD5
 	select CRYPTO_LIB_SHA256
 	select CRYPTO_LIB_SHA512
 	select KEYS
diff --git a/fs/smb/client/cifsencrypt.c b/fs/smb/client/cifsencrypt.c
index 50b7ec39053c..f39894113821 100644
--- a/fs/smb/client/cifsencrypt.c
+++ b/fs/smb/client/cifsencrypt.c
@@ -20,66 +20,49 @@
 #include <linux/random.h>
 #include <linux/highmem.h>
 #include <linux/fips.h>
 #include <linux/iov_iter.h>
 #include <crypto/aead.h>
+#include <crypto/aes-cbc-macs.h>
 #include <crypto/arc4.h>
 #include <crypto/md5.h>
 #include <crypto/sha2.h>
 
-static int cifs_sig_update(struct cifs_calc_sig_ctx *ctx,
-			   const u8 *data, size_t len)
+static size_t cifs_sig_step(void *iter_base, size_t progress, size_t len,
+			    void *priv, void *priv2)
 {
-	if (ctx->md5) {
-		md5_update(ctx->md5, data, len);
-		return 0;
-	}
-	if (ctx->hmac) {
-		hmac_sha256_update(ctx->hmac, data, len);
-		return 0;
-	}
-	return crypto_shash_update(ctx->shash, data, len);
+	struct cifs_calc_sig_ctx *ctx = priv;
+
+	if (ctx->md5)
+		md5_update(ctx->md5, iter_base, len);
+	else if (ctx->hmac)
+		hmac_sha256_update(ctx->hmac, iter_base, len);
+	else
+		aes_cmac_update(ctx->cmac, iter_base, len);
+	return 0; /* Return value is length *not* processed, i.e. 0. */
 }
 
-static int cifs_sig_final(struct cifs_calc_sig_ctx *ctx, u8 *out)
+static void cifs_sig_final(struct cifs_calc_sig_ctx *ctx, u8 *out)
 {
-	if (ctx->md5) {
+	if (ctx->md5)
 		md5_final(ctx->md5, out);
-		return 0;
-	}
-	if (ctx->hmac) {
+	else if (ctx->hmac)
 		hmac_sha256_final(ctx->hmac, out);
-		return 0;
-	}
-	return crypto_shash_final(ctx->shash, out);
-}
-
-static size_t cifs_sig_step(void *iter_base, size_t progress, size_t len,
-			    void *priv, void *priv2)
-{
-	struct cifs_calc_sig_ctx *ctx = priv;
-	int ret, *pret = priv2;
-
-	ret = cifs_sig_update(ctx, iter_base, len);
-	if (ret < 0) {
-		*pret = ret;
-		return len;
-	}
-	return 0;
+	else
+		aes_cmac_final(ctx->cmac, out);
 }
 
 /*
  * Pass the data from an iterator into a hash.
  */
 static int cifs_sig_iter(const struct iov_iter *iter, size_t maxsize,
 			 struct cifs_calc_sig_ctx *ctx)
 {
 	struct iov_iter tmp_iter = *iter;
 	size_t did;
-	int err;
 
-	did = iterate_and_advance_kernel(&tmp_iter, maxsize, ctx, &err,
+	did = iterate_and_advance_kernel(&tmp_iter, maxsize, ctx, NULL,
 					 cifs_sig_step);
 	if (did != maxsize)
 		return smb_EIO2(smb_eio_trace_sig_iter, did, maxsize);
 	return 0;
 }
@@ -106,15 +89,12 @@ int __cifs_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server,
 
 	rc = cifs_sig_iter(&rqst->rq_iter, iov_iter_count(&rqst->rq_iter), ctx);
 	if (rc < 0)
 		return rc;
 
-	rc = cifs_sig_final(ctx, signature);
-	if (rc)
-		cifs_dbg(VFS, "%s: Could not generate hash\n", __func__);
-
-	return rc;
+	cifs_sig_final(ctx, signature);
+	return 0;
 }
 
 /* Build a proper attribute value/target info pairs blob.
  * Fill in netbios and dns domain name and workstation name
  * and client time (total five av pairs and + one end of fields indicator.
diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 080ea601c209..2ff43bd35c5f 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -2285,11 +2285,11 @@ static inline void mid_execute_callback(struct TCP_Server_Info *server,
 	  FILE_SUPPORTS_REPARSE_POINTS))
 
 struct cifs_calc_sig_ctx {
 	struct md5_ctx *md5;
 	struct hmac_sha256_ctx *hmac;
-	struct shash_desc *shash;
+	struct aes_cmac_ctx *cmac;
 };
 
 #define CIFS_RECONN_DELAY_SECS	30
 #define CIFS_MAX_RECONN_DELAY	(4 * CIFS_RECONN_DELAY_SECS)
 
diff --git a/fs/smb/client/smb2transport.c b/fs/smb/client/smb2transport.c
index 81be2b226e26..b233e0cd9152 100644
--- a/fs/smb/client/smb2transport.c
+++ b/fs/smb/client/smb2transport.c
@@ -17,10 +17,11 @@
 #include <linux/uaccess.h>
 #include <asm/processor.h>
 #include <linux/mempool.h>
 #include <linux/highmem.h>
 #include <crypto/aead.h>
+#include <crypto/aes-cbc-macs.h>
 #include <crypto/sha2.h>
 #include <crypto/utils.h>
 #include "cifsglob.h"
 #include "cifsproto.h"
 #include "smb2proto.h"
@@ -472,11 +473,12 @@ smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server,
 {
 	int rc;
 	unsigned char smb3_signature[SMB2_CMACAES_SIZE];
 	struct kvec *iov = rqst->rq_iov;
 	struct smb2_hdr *shdr = (struct smb2_hdr *)iov[0].iov_base;
-	struct shash_desc *shash = NULL;
+	struct aes_cmac_key cmac_key;
+	struct aes_cmac_ctx cmac_ctx;
 	struct smb_rqst drqst;
 	u8 key[SMB3_SIGN_KEY_SIZE];
 
 	if (server->vals->protocol_id <= SMB21_PROT_ID)
 		return smb2_calc_signature(rqst, server, allocate_crypto);
@@ -485,67 +487,40 @@ smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server,
 	if (unlikely(rc)) {
 		cifs_server_dbg(FYI, "%s: Could not get signing key\n", __func__);
 		return rc;
 	}
 
-	if (allocate_crypto) {
-		rc = cifs_alloc_hash("cmac(aes)", &shash);
-		if (rc)
-			return rc;
-	} else {
-		shash = server->secmech.aes_cmac;
-	}
-
 	memset(smb3_signature, 0x0, SMB2_CMACAES_SIZE);
 	memset(shdr->Signature, 0x0, SMB2_SIGNATURE_SIZE);
 
-	rc = crypto_shash_setkey(shash->tfm, key, SMB2_CMACAES_SIZE);
+	rc = aes_cmac_preparekey(&cmac_key, key, SMB2_CMACAES_SIZE);
 	if (rc) {
 		cifs_server_dbg(VFS, "%s: Could not set key for cmac aes\n", __func__);
-		goto out;
+		return rc;
 	}
 
-	/*
-	 * we already allocate aes_cmac when we init smb3 signing key,
-	 * so unlike smb2 case we do not have to check here if secmech are
-	 * initialized
-	 */
-	rc = crypto_shash_init(shash);
-	if (rc) {
-		cifs_server_dbg(VFS, "%s: Could not init cmac aes\n", __func__);
-		goto out;
-	}
+	aes_cmac_init(&cmac_ctx, &cmac_key);
 
 	/*
 	 * For SMB2+, __cifs_calc_signature() expects to sign only the actual
 	 * data, that is, iov[0] should not contain a rfc1002 length.
 	 *
 	 * Sign the rfc1002 length prior to passing the data (iov[1-N]) down to
 	 * __cifs_calc_signature().
 	 */
 	drqst = *rqst;
 	if (drqst.rq_nvec >= 2 && iov[0].iov_len == 4) {
-		rc = crypto_shash_update(shash, iov[0].iov_base,
-					 iov[0].iov_len);
-		if (rc) {
-			cifs_server_dbg(VFS, "%s: Could not update with payload\n",
-				 __func__);
-			goto out;
-		}
+		aes_cmac_update(&cmac_ctx, iov[0].iov_base, iov[0].iov_len);
 		drqst.rq_iov++;
 		drqst.rq_nvec--;
 	}
 
 	rc = __cifs_calc_signature(
 		&drqst, server, smb3_signature,
-		&(struct cifs_calc_sig_ctx){ .shash = shash });
+		&(struct cifs_calc_sig_ctx){ .cmac = &cmac_ctx });
 	if (!rc)
 		memcpy(shdr->Signature, smb3_signature, SMB2_SIGNATURE_SIZE);
-
-out:
-	if (allocate_crypto)
-		cifs_free_hash(&shash);
 	return rc;
 }
 
 /* must be called with server->srv_mutex held */
 static int
-- 
2.53.0


