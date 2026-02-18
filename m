Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE9BE9A04F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6/7U2W+SLBH7vb3mBdRkvcgN42WcvefOi5t5IhqBbg=; b=Ux3If+a6U5Clt6QNy5LZKnUtha
	P5uHhpsibxCr9MHuCZ55tA+cWLbwo4myeF7FjUg6YFe4W9iYQwgTlJOmrlSWYoXqa+rgMmGsf/v59
	WZ8UTbmi2Xtjg08EiOu0Hodwia7OWsOr8C40gnP8zr+qEGGeQHsPlEjxjRd8BjiTS68WMBcqyDBdm
	uRHIUWjsNyconCVwAJ9JW9BkkLM+S8Kihzhw2vAHh0jV1/SnOUG/L3Yy2yBzHJ2dcbmU43o+K4RmF
	xMMah90Zk2ONgqbtCAqvVkZsu4I4cVMpCeW4s4j4xVDTS1kW+hGA0UnGIXIGHEyOvjyMkm0FM0WWv
	68qFt6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspEH-0000000ASXX-0kTA;
	Wed, 18 Feb 2026 21:37:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspE8-0000000ASPe-265y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 21:36:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6501B41B19;
	Wed, 18 Feb 2026 21:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F24C19421;
	Wed, 18 Feb 2026 21:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771450616;
	bh=LoZhuuxzNWOyrPmwe9ku8/14QhyJ8CKzIMFUQopSDgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c0vKBFRDl5TZsypRiZLNxLu+gyGyL/z7hDpq+OPPeKBKVI4VkdjUN6evSVA+WExM4
	 M5wEqlOBLmYXFkedkv22ojxpcmNWsKHhqYotwkXWhivyLdyWuXh6DpmlslLgzNfSFt
	 aV8XJw8qfD0RbGBKHO9BKzaNODK7LY0h6V+UNcn9Tj2d5U6gSQ5CAdSDgN7fKUG1yA
	 trftxnltQKqv2rFNPbkRjJNBq7qw4hrLp4KfWkfkachUqZ+60bmF1+6jsHlBZNnen9
	 DSHxYzddUtracdqj55ayRleE2P3sNmGU0zojugQw/semrjOQZHbAjbmF9g8ZNX4pwt
	 GpjaoIQ5XEixA==
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
Subject: [PATCH 10/15] smb: client: Make generate_key() return void
Date: Wed, 18 Feb 2026 13:34:56 -0800
Message-ID: <20260218213501.136844-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218213501.136844-1-ebiggers@kernel.org>
References: <20260218213501.136844-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_133656_579887_E67E3A85 
X-CRM114-Status: GOOD (  13.21  )
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

Since the crypto library API is now being used instead of crypto_shash,
generate_key() can no longer fail.  Make it return void and simplify the
callers accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/smb/client/smb2transport.c | 45 +++++++++++++----------------------
 1 file changed, 16 insertions(+), 29 deletions(-)

diff --git a/fs/smb/client/smb2transport.c b/fs/smb/client/smb2transport.c
index 716e58d1b1c9..0176185a1efc 100644
--- a/fs/smb/client/smb2transport.c
+++ b/fs/smb/client/smb2transport.c
@@ -249,12 +249,12 @@ smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server,
 		memcpy(shdr->Signature, smb2_signature, SMB2_SIGNATURE_SIZE);
 
 	return rc;
 }
 
-static int generate_key(struct cifs_ses *ses, struct kvec label,
-			struct kvec context, __u8 *key, unsigned int key_size)
+static void generate_key(struct cifs_ses *ses, struct kvec label,
+			 struct kvec context, __u8 *key, unsigned int key_size)
 {
 	unsigned char zero = 0x0;
 	__u8 i[4] = {0, 0, 0, 1};
 	__u8 L128[4] = {0, 0, 0, 128};
 	__u8 L256[4] = {0, 0, 1, 0};
@@ -279,11 +279,10 @@ static int generate_key(struct cifs_ses *ses, struct kvec label,
 		hmac_sha256_update(&hmac_ctx, L128, 4);
 	}
 	hmac_sha256_final(&hmac_ctx, prfhash);
 
 	memcpy(key, prfhash, key_size);
-	return 0;
 }
 
 struct derivation {
 	struct kvec label;
 	struct kvec context;
@@ -298,11 +297,10 @@ struct derivation_triplet {
 static int
 generate_smb3signingkey(struct cifs_ses *ses,
 			struct TCP_Server_Info *server,
 			const struct derivation_triplet *ptriplet)
 {
-	int rc;
 	bool is_binding = false;
 	int chan_index = 0;
 
 	spin_lock(&ses->ses_lock);
 	spin_lock(&ses->chan_lock);
@@ -329,42 +327,31 @@ generate_smb3signingkey(struct cifs_ses *ses,
 	 * key and store it in the channel as to not overwrite the
 	 * master connection signing key stored in the session
 	 */
 
 	if (is_binding) {
-		rc = generate_key(ses, ptriplet->signing.label,
-				  ptriplet->signing.context,
-				  ses->chans[chan_index].signkey,
-				  SMB3_SIGN_KEY_SIZE);
-		if (rc)
-			return rc;
+		generate_key(ses, ptriplet->signing.label,
+			     ptriplet->signing.context,
+			     ses->chans[chan_index].signkey,
+			     SMB3_SIGN_KEY_SIZE);
 	} else {
-		rc = generate_key(ses, ptriplet->signing.label,
-				  ptriplet->signing.context,
-				  ses->smb3signingkey,
-				  SMB3_SIGN_KEY_SIZE);
-		if (rc)
-			return rc;
+		generate_key(ses, ptriplet->signing.label,
+			     ptriplet->signing.context,
+			     ses->smb3signingkey, SMB3_SIGN_KEY_SIZE);
 
 		/* safe to access primary channel, since it will never go away */
 		spin_lock(&ses->chan_lock);
 		memcpy(ses->chans[chan_index].signkey, ses->smb3signingkey,
 		       SMB3_SIGN_KEY_SIZE);
 		spin_unlock(&ses->chan_lock);
 
-		rc = generate_key(ses, ptriplet->encryption.label,
-				  ptriplet->encryption.context,
-				  ses->smb3encryptionkey,
-				  SMB3_ENC_DEC_KEY_SIZE);
-		if (rc)
-			return rc;
-		rc = generate_key(ses, ptriplet->decryption.label,
-				  ptriplet->decryption.context,
-				  ses->smb3decryptionkey,
-				  SMB3_ENC_DEC_KEY_SIZE);
-		if (rc)
-			return rc;
+		generate_key(ses, ptriplet->encryption.label,
+			     ptriplet->encryption.context,
+			     ses->smb3encryptionkey, SMB3_ENC_DEC_KEY_SIZE);
+		generate_key(ses, ptriplet->decryption.label,
+			     ptriplet->decryption.context,
+			     ses->smb3decryptionkey, SMB3_ENC_DEC_KEY_SIZE);
 	}
 
 #ifdef CONFIG_CIFS_DEBUG_DUMP_KEYS
 	cifs_dbg(VFS, "%s: dumping generated AES session keys\n", __func__);
 	/*
@@ -389,11 +376,11 @@ generate_smb3signingkey(struct cifs_ses *ses,
 				SMB3_GCM128_CRYPTKEY_SIZE, ses->smb3encryptionkey);
 		cifs_dbg(VFS, "ServerOut Key %*ph\n",
 				SMB3_GCM128_CRYPTKEY_SIZE, ses->smb3decryptionkey);
 	}
 #endif
-	return rc;
+	return 0;
 }
 
 int
 generate_smb30signingkey(struct cifs_ses *ses,
 			 struct TCP_Server_Info *server)
-- 
2.53.0


