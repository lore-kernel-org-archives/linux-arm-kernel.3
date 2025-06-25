Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0128C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 07:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kt4sp2VhnIWEOeMcH73t899orOG4QC4oYu9cxkK9Ix8=; b=n78OMI0dXTzKqi6k2hW4ki6/Aj
	YYCt9pf9GalqH5drWCIkS/FWjUgw897348LBo+JHSssuI16HKhG5xdR5BOrdR7ShKJp89O7Glkf7g
	OdiVO6MCgXekEeB0DGY0EXVmrwZk3CJcFLy7RpmM2EKeuyMK3IhObSlq9ymhC3+yWZjKZ/eJrRnhm
	DKs9ZlVw8nIR756u21VONzDZEtQf8XOCrGsm6dLNWCqlSW3v5/WkFEF/ZOwOzxdkxtQMfwjo53z1a
	XE25XygmSzMurocXGSyRhrFQgOM+q4dSq1RRaSeQl4qG4SOqTA+UFyofX4os7r2nXhun3LEvsd1e1
	z4YLuSvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKJP-00000007m3t-41vv;
	Wed, 25 Jun 2025 07:12:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKH6-00000007lJ8-2JrC;
	Wed, 25 Jun 2025 07:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E38D8A51207;
	Wed, 25 Jun 2025 07:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC29C4AF09;
	Wed, 25 Jun 2025 07:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835427;
	bh=oP/HTNYTl9LXpDk4PHssqzdxrIaWg9Dc4X7a2efoHe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=grOdLOtZgoIKmEWCLoLH/9c0vB0aNmsNV3SxcH0BZP5ljLtkHnx2+AKoNSsaq9vrv
	 DUs8v9tEITVzaIhBG2hZl5pFHjoAU65Vwvo8XLLJNUhLYdlK9SUpvu0gRKUh3lVnmx
	 xe7B9ojnICi0YfGfAQLPYVUBhPYUYbz115fGEy9isHKdHCYMvqY4oW6SNKWv4FJRs2
	 WjGEQ1c2vJ3eCDQIKmq8N+TBXe4uIfevRVsKQTU4aigzoOA6WXabW0iVDnRucYJXPc
	 sldN4RMVz138oOya4ugf0A3vVhvZXhzWJ6hACVLHuujYIZAQvxI5l26FaziMpipYfV
	 E4hbrlgSnTpIg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 01/18] libceph: Rename hmac_sha256() to ceph_hmac_sha256()
Date: Wed, 25 Jun 2025 00:08:02 -0700
Message-ID: <20250625070819.1496119-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_001028_655893_9CFA1F9D 
X-CRM114-Status: GOOD (  11.87  )
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

Rename hmac_sha256() to ceph_hmac_sha256(), to avoid a naming conflict
with the upcoming hmac_sha256() library function.

This code will be able to use the HMAC-SHA256 library, but that's left
for a later commit.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 net/ceph/messenger_v2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/ceph/messenger_v2.c b/net/ceph/messenger_v2.c
index bd608ffa06279..5483b4eed94e1 100644
--- a/net/ceph/messenger_v2.c
+++ b/net/ceph/messenger_v2.c
@@ -791,12 +791,12 @@ static int setup_crypto(struct ceph_connection *con,
 	       con_secret + CEPH_GCM_KEY_LEN + CEPH_GCM_IV_LEN,
 	       CEPH_GCM_IV_LEN);
 	return 0;  /* auth_x, secure mode */
 }
 
-static int hmac_sha256(struct ceph_connection *con, const struct kvec *kvecs,
-		       int kvec_cnt, u8 *hmac)
+static int ceph_hmac_sha256(struct ceph_connection *con,
+			    const struct kvec *kvecs, int kvec_cnt, u8 *hmac)
 {
 	SHASH_DESC_ON_STACK(desc, con->v2.hmac_tfm);  /* tfm arg is ignored */
 	int ret;
 	int i;
 
@@ -1460,12 +1460,12 @@ static int prepare_auth_signature(struct ceph_connection *con)
 	buf = alloc_conn_buf(con, head_onwire_len(SHA256_DIGEST_SIZE,
 						  con_secure(con)));
 	if (!buf)
 		return -ENOMEM;
 
-	ret = hmac_sha256(con, con->v2.in_sign_kvecs, con->v2.in_sign_kvec_cnt,
-			  CTRL_BODY(buf));
+	ret = ceph_hmac_sha256(con, con->v2.in_sign_kvecs,
+			       con->v2.in_sign_kvec_cnt, CTRL_BODY(buf));
 	if (ret)
 		return ret;
 
 	return prepare_control(con, FRAME_TAG_AUTH_SIGNATURE, buf,
 			       SHA256_DIGEST_SIZE);
@@ -2458,12 +2458,12 @@ static int process_auth_signature(struct ceph_connection *con,
 	if (con->state != CEPH_CON_S_V2_AUTH_SIGNATURE) {
 		con->error_msg = "protocol error, unexpected auth_signature";
 		return -EINVAL;
 	}
 
-	ret = hmac_sha256(con, con->v2.out_sign_kvecs,
-			  con->v2.out_sign_kvec_cnt, hmac);
+	ret = ceph_hmac_sha256(con, con->v2.out_sign_kvecs,
+			       con->v2.out_sign_kvec_cnt, hmac);
 	if (ret)
 		return ret;
 
 	ceph_decode_need(&p, end, SHA256_DIGEST_SIZE, bad);
 	if (crypto_memneq(p, hmac, SHA256_DIGEST_SIZE)) {
-- 
2.50.0


