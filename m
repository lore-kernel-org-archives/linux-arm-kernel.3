Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5D6E9A04E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 21:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1u0mqz+3GnKKaRXout24Ytd7cvzcGqEIwASnFEFZWTo=; b=BwOOOMVG1VLzqrO4f6cNqOekBR
	WvgxwkMKJapUHtfgZl2dOVEraj4wzhigm4rNU7imnmPfcaMTnFYSdYtoTR3oqxeQJfPlCrh78mJMQ
	RXd47WvMa+0WD/W34gD9rbdylezZY2LDbiT6BOV2I5Qi6IdTMgRJQ3PZaQS6TIyyswVr7ecWDFbC/
	datP963v7+3hsouw1sadsf6EzCglzqvADTsjNUtwXjZ16v4ZSiRWNq6KriDjwS5yDJrwCqoKncQK2
	12OfBE6HzSk9sdM0MWeGYtHna4aQRMWTplzlLF16ZVdVtAF0V2aosVGQXwUUrsiWnSoo03BMXeMPJ
	6f3hIQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspEH-0000000ASY7-27cu;
	Wed, 18 Feb 2026 21:37:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vspEA-0000000AST7-07Oe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 21:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA9454376C;
	Wed, 18 Feb 2026 21:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE83AC2BCAF;
	Wed, 18 Feb 2026 21:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771450617;
	bh=yUsqjSnPbDX/S+rnsu/6yIO+0mII4wRuFeRbW6zNwMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kmNioAndIDtJqj5zX9UyQqC8ga+DPfMLGWcDMmKgmWKPeQ6Q/tAv1kutYsfIc/rdO
	 LQc6vHbw6C4wUcfk79joquORCE6pT+BwnMNBpRz35c1b2dIWQU+mUHBoeUUpHHchyi
	 vCFdheo5Gr2gOFWWh91VetqLe8BHP3ojSeB/m9Pa9pCjP7cYfZiv2M9q0O7EXkoV98
	 wmhrjyLDJijMQwri+QwicxPTllfq3HVOV4byCCYumyD6TD5KbOUoeNAzTmRzBOEBsw
	 fsl7PXcZvEXEnGPr1/zMWgIe9cTmfaW5UkU/BVNVmge+NzCT6vQT5nTuvpKkpoQSZs
	 J1hK43sD4g2ZQ==
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
Subject: [PATCH 11/15] smb: client: Drop 'allocate_crypto' arg from smb*_calc_signature()
Date: Wed, 18 Feb 2026 13:34:57 -0800
Message-ID: <20260218213501.136844-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218213501.136844-1-ebiggers@kernel.org>
References: <20260218213501.136844-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_133658_105378_41C941E6 
X-CRM114-Status: GOOD (  10.75  )
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
all structs for MAC computation are now just fixed-size structs
allocated on the stack; no dynamic allocations are ever required.
Besides being much more efficient, this also means that the
'allocate_crypto' argument to smb2_calc_signature() and
smb3_calc_signature() is no longer used.  Remove this unused argument.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/smb/client/smb2transport.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/smb/client/smb2transport.c b/fs/smb/client/smb2transport.c
index 0176185a1efc..41009039b4cb 100644
--- a/fs/smb/client/smb2transport.c
+++ b/fs/smb/client/smb2transport.c
@@ -202,12 +202,11 @@ smb2_find_smb_tcon(struct TCP_Server_Info *server, __u64 ses_id, __u32  tid)
 
 	return tcon;
 }
 
 static int
-smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server,
-		    bool allocate_crypto)
+smb2_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 {
 	int rc;
 	unsigned char smb2_signature[SMB2_HMACSHA256_SIZE];
 	struct kvec *iov = rqst->rq_iov;
 	struct smb2_hdr *shdr = (struct smb2_hdr *)iov[0].iov_base;
@@ -438,12 +437,11 @@ generate_smb311signingkey(struct cifs_ses *ses,
 
 	return generate_smb3signingkey(ses, server, &triplet);
 }
 
 static int
-smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server,
-		    bool allocate_crypto)
+smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 {
 	int rc;
 	unsigned char smb3_signature[SMB2_CMACAES_SIZE];
 	struct kvec *iov = rqst->rq_iov;
 	struct smb2_hdr *shdr = (struct smb2_hdr *)iov[0].iov_base;
@@ -451,11 +449,11 @@ smb3_calc_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server,
 	struct aes_cmac_ctx cmac_ctx;
 	struct smb_rqst drqst;
 	u8 key[SMB3_SIGN_KEY_SIZE];
 
 	if (server->vals->protocol_id <= SMB21_PROT_ID)
-		return smb2_calc_signature(rqst, server, allocate_crypto);
+		return smb2_calc_signature(rqst, server);
 
 	rc = smb3_get_sign_key(le64_to_cpu(shdr->SessionId), server, key);
 	if (unlikely(rc)) {
 		cifs_server_dbg(FYI, "%s: Could not get signing key\n", __func__);
 		return rc;
@@ -522,11 +520,11 @@ smb2_sign_rqst(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 	if (!is_binding && !server->session_estab) {
 		strscpy(shdr->Signature, "BSRSPYL");
 		return 0;
 	}
 
-	return smb3_calc_signature(rqst, server, false);
+	return smb3_calc_signature(rqst, server);
 }
 
 int
 smb2_verify_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 {
@@ -558,11 +556,11 @@ smb2_verify_signature(struct smb_rqst *rqst, struct TCP_Server_Info *server)
 	 */
 	memcpy(server_response_sig, shdr->Signature, SMB2_SIGNATURE_SIZE);
 
 	memset(shdr->Signature, 0, SMB2_SIGNATURE_SIZE);
 
-	rc = smb3_calc_signature(rqst, server, true);
+	rc = smb3_calc_signature(rqst, server);
 
 	if (rc)
 		return rc;
 
 	if (crypto_memneq(server_response_sig, shdr->Signature,
-- 
2.53.0


