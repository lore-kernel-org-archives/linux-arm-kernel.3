Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DE3C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJx0i07CwXuFGqbhsxqRsci+9AwrhLjTRKyXGDwSAJU=; b=G18Pd1u+YtnZ9DTNUAHX3Mu8Bv
	ZNCLsrgC87CL2usweQ8v52+8Sfgq8Q9tdkC5R6QbEigENDNqVNn2z/+tKGkUdc9QkltxWl/wD8dW/
	4dirpTDM2O50WwDlLFecYVWwDzfQ/5ex3ZzJqdr99Ni9ivIa5s8FhcXw5yUSfQaNmxCPVAkIdVNml
	/cHXOTj2EKrULPbBlm/K7hJyNe5+yXYLkzG/lQfDAuYkidZ+BTq3tGEPXYkLH9cNemKi9xjREqBDX
	pVoh7hGEzHim6lA7wLYA6jHIl8RiJ/jR10xdf12cISwVbPQcWb+cMfyv0xx9k6SpThTBtejQ6b8rR
	yU0fuJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWI8R-000000033KQ-3FAH;
	Mon, 30 Jun 2025 17:17:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH4N-00000002plM-3sO2;
	Mon, 30 Jun 2025 16:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C36D613AA;
	Mon, 30 Jun 2025 16:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4A6C4CEF2;
	Mon, 30 Jun 2025 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299763;
	bh=6di/lemdUUuURN063IywyRZhcwaKdCBZPfLQhM19GXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUEz13trRmGOF1EnTtptvIlzO1jaL21f4T0TLFxkW98FzmMLj6qDaW0ODvpbNWxVx
	 tfzJ5ASzjGW+jCVRJoRjoHWBYInTKNgLLwpEMauVZBla27IPaaN+Sguq8bUNybwcZ4
	 m+N6TBi5X7Aay6IJ+JyWUd5O6u3c4w4eAXAtYJv0zGGmEokWNCcro5PhDuNp1zwNIV
	 7GOiv6OLqYq9c2mtptz2nJBsjhusfEek4rvPdyXbAKJYVSSGkIMS15fAWfrnJ7CW2r
	 CftvB1tqiZa/uHE5fCme+6m0uY6xzuSfr5q5bF9mchP3IO8KvUpNaXsOLzSyGIIoJR
	 H3sy/rJqdx/Hw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 05/14] lib/crypto: sha256: Add sha224() and sha224_update()
Date: Mon, 30 Jun 2025 09:06:36 -0700
Message-ID: <20250630160645.3198-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
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

Add a one-shot SHA-224 computation function sha224(), for consistency
with sha256(), sha384(), and sha512() which all already exist.

Similarly, add sha224_update().  While for now it's identical to
sha256_update(), omitting it makes the API harder to use since users
have to "know" which functions are the same between SHA-224 and SHA-256.
Also, this is a prerequisite for using different context types for each.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 10 ++++++++--
 lib/crypto/sha256.c   | 10 ++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index bb181b7996cdc..e31da0743a522 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -112,22 +112,28 @@ struct sha512_state {
 	u64 state[SHA512_DIGEST_SIZE / 8];
 	u64 count[2];
 	u8 buf[SHA512_BLOCK_SIZE];
 };
 
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
+
 static inline void sha224_init(struct sha256_state *sctx)
 {
 	sha224_block_init(&sctx->ctx);
 }
-/* Simply use sha256_update as it is equivalent to sha224_update. */
+static inline void sha224_update(struct sha256_state *sctx,
+				 const u8 *data, size_t len)
+{
+	sha256_update(sctx, data, len);
+}
 void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
+void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE]);
 
 static inline void sha256_init(struct sha256_state *sctx)
 {
 	sha256_block_init(&sctx->ctx);
 }
-void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
 void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
 /* State for the SHA-512 (and SHA-384) compression function */
 struct sha512_block_state {
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 573ccecbf48bf..ccaae70880166 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -68,10 +68,20 @@ void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha256_final);
 
+void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE])
+{
+	struct sha256_state sctx;
+
+	sha224_init(&sctx);
+	sha224_update(&sctx, data, len);
+	sha224_final(&sctx, out);
+}
+EXPORT_SYMBOL(sha224);
+
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
 	sha256_init(&sctx);
-- 
2.50.0


