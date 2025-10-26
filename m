Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0174CCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 05:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kT0TKdsmMTovlY/K154/fcd1GAzLVwXD+1VDHohXKMU=; b=ciUt7GTUx3EwZM+LRUzQIK6271
	6YmWSVr88tKt+J9enGgSclOp9Zn9iYvtN7j0/4lWYdQzceHYhc7hxWyO31omskyMzQS2U/gDkROba
	NnE4wQLLFrid3VGCfelovaexwetMyzvaCIVYNxwM2or4Ngna6Y4fdlYrewrN4lOl/E/zKU+94rYYy
	ORedGsKVyb2fDj3plgnEB3szZE6dXOpN06gMTviiXMTuTCBGn9SHQRyhGKV54oHr1CsQ7K/RnLpE8
	j+xuzNgqCYxPXxvGPfhqffQDFzg+DWE15EhVi2QUWDVamDaaVNxCuQQuRBH0pEi4NQTBQqqbN/j3h
	CeIaTfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgn-0000000C2pp-0Lr5;
	Sun, 26 Oct 2025 05:53:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgj-0000000C2mP-0nIZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 05:53:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9552360330;
	Sun, 26 Oct 2025 05:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E41C4AF0B;
	Sun, 26 Oct 2025 05:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761457988;
	bh=TbVLbaUPq3TI8tu/I7Jnha1NiyG1jt55JtZfnYEOEf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VzIzVp/98BzPaqHpgDXy9lQcQUD53jo9sL7ZNoHHIu2yiWxxWDvWMQohZSuBT20il
	 oICPtpc0wRBUgfldpYr23cY5Xg2JLjRi7z+yy4c/RKLNyPIfGtqZQq1JNBPe8OMKVJ
	 XYBZFFXliuGCsJykRNPn/Mzv5W4Sodla4EOmohhJ2ZTJgsUWDFPm5CT+EzWfNYqIFG
	 prh6Qdqz/COR2oh6fY0Jff+Hdo71h74/WNC+VBmSzyfGJA5joMC+Ws0fcgaJAjg9ck
	 0w4fSYweNEqoud+Kb/BiVCKP9p5Ql4cEDmZO4gpjTijkIa8FCdgsafazfWPToHUg/7
	 IEzljMhGNvZwg==
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
Subject: [PATCH v2 11/15] lib/crypto: sha3: Support arch overrides of one-shot digest functions
Date: Sat, 25 Oct 2025 22:50:28 -0700
Message-ID: <20251026055032.1413733-12-ebiggers@kernel.org>
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

Add support for architecture-specific overrides of sha3_224(),
sha3_256(), sha3_384(), and sha3_512().  This will be used to implement
these functions more efficiently on s390 than is possible via the usual
init + update + final flow.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha3.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/lib/crypto/sha3.c b/lib/crypto/sha3.c
index 6c94b4ebd0fd1..a598138d47a59 100644
--- a/lib/crypto/sha3.c
+++ b/lib/crypto/sha3.c
@@ -278,44 +278,81 @@ void shake_squeeze(struct shake_ctx *shake_ctx, u8 *out, size_t out_len)
 	}
 	ctx->squeeze_offset = squeeze_offset;
 }
 EXPORT_SYMBOL_GPL(shake_squeeze);
 
+#ifndef sha3_224_arch
+static inline bool sha3_224_arch(const u8 *in, size_t in_len,
+				 u8 out[SHA3_224_DIGEST_SIZE])
+{
+	return false;
+}
+#endif
+#ifndef sha3_256_arch
+static inline bool sha3_256_arch(const u8 *in, size_t in_len,
+				 u8 out[SHA3_256_DIGEST_SIZE])
+{
+	return false;
+}
+#endif
+#ifndef sha3_384_arch
+static inline bool sha3_384_arch(const u8 *in, size_t in_len,
+				 u8 out[SHA3_384_DIGEST_SIZE])
+{
+	return false;
+}
+#endif
+#ifndef sha3_512_arch
+static inline bool sha3_512_arch(const u8 *in, size_t in_len,
+				 u8 out[SHA3_512_DIGEST_SIZE])
+{
+	return false;
+}
+#endif
+
 void sha3_224(const u8 *in, size_t in_len, u8 out[SHA3_224_DIGEST_SIZE])
 {
 	struct sha3_ctx ctx;
 
+	if (sha3_224_arch(in, in_len, out))
+		return;
 	sha3_224_init(&ctx);
 	sha3_update(&ctx, in, in_len);
 	sha3_final(&ctx, out);
 }
 EXPORT_SYMBOL_GPL(sha3_224);
 
 void sha3_256(const u8 *in, size_t in_len, u8 out[SHA3_256_DIGEST_SIZE])
 {
 	struct sha3_ctx ctx;
 
+	if (sha3_256_arch(in, in_len, out))
+		return;
 	sha3_256_init(&ctx);
 	sha3_update(&ctx, in, in_len);
 	sha3_final(&ctx, out);
 }
 EXPORT_SYMBOL_GPL(sha3_256);
 
 void sha3_384(const u8 *in, size_t in_len, u8 out[SHA3_384_DIGEST_SIZE])
 {
 	struct sha3_ctx ctx;
 
+	if (sha3_384_arch(in, in_len, out))
+		return;
 	sha3_384_init(&ctx);
 	sha3_update(&ctx, in, in_len);
 	sha3_final(&ctx, out);
 }
 EXPORT_SYMBOL_GPL(sha3_384);
 
 void sha3_512(const u8 *in, size_t in_len, u8 out[SHA3_512_DIGEST_SIZE])
 {
 	struct sha3_ctx ctx;
 
+	if (sha3_512_arch(in, in_len, out))
+		return;
 	sha3_512_init(&ctx);
 	sha3_update(&ctx, in, in_len);
 	sha3_final(&ctx, out);
 }
 EXPORT_SYMBOL_GPL(sha3_512);
-- 
2.51.1.dirty


