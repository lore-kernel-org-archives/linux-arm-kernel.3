Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC107C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 17:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8qT6W+9XIBDEh2wbbkzKqysWN3rqlOAw3WfBG922vk=; b=cImhTVy9B+H6Tg/I0F//3lnOj4
	h9AgbbH5foVu46hv5yzjqRmqXDFiwdoKKfgupSGX3RN0Q46r0hYU5YO64uNJrVfKAC1HzMmN091SR
	Gka3jyw3BEx81MpUhfs4uUAnIR+nV3BstN+LcoFZ2J4dSni5Bh5leGxHX/SEIaOW6AfeiPf+dYW+K
	n3c9mD/KqW5gy1z2zDaCqQaKlQl0jgDt5hqgduKpWoN06H2QoOaPQSFiPfXXXVO42pSF/yX/+J70c
	1jM5Tg1Ii50z7jD2xaGvxfdFhCtqjYAax8Wu3EGd0CALq0oyD717DaF3DZZ8zzM1aGKWoijO9uS9N
	j+qP90CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SBB-000000074el-1e6Q;
	Mon, 28 Apr 2025 17:22:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Rrr-000000070yC-0rpK;
	Mon, 28 Apr 2025 17:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6DEDA4B51D;
	Mon, 28 Apr 2025 16:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F35C4CEEE;
	Mon, 28 Apr 2025 17:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859726;
	bh=E4ZzeBfk2GgJquy2SDIZkSeNX8NfXIoZAmTNK3XNeXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nag0WVQ8E1TihrQTSEoFR0DZgEIeqxXwyV4+iqc41yTiRiDzs5/2T7qkhTZmHaBIe
	 3NpNYnemnWcQOCXagA5m6zVEi7yUaK7qNITYrJvmQFRS87Igf4LlFVCkGoqoGOGCVG
	 rsFgw3ex79z6SbNqm4v8+b5mBZMqZ9O4OXQBeaDADtRT7kk2/LXqD81qq3/EBLuNs4
	 Xf+BQasDscoPMcUxBho7bRSlGZgBqQCEuwezVvdvBqukAt516lxDSngixk8QEtC60Q
	 hSwIdPcr5osF5Xfc1HTMgM8PDAUDpsO71gwKURmbiK0loWyPcYwTVOaYNJujt2ACtq
	 ABI2T4XgqEKSw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v4 13/13] crypto: lib/sha256 - improve function prototypes
Date: Mon, 28 Apr 2025 10:00:38 -0700
Message-ID: <20250428170040.423825-14-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428170040.423825-1-ebiggers@kernel.org>
References: <20250428170040.423825-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_100207_372245_9C2A0444 
X-CRM114-Status: GOOD (  11.22  )
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

From: Eric Biggers <ebiggers@google.com>

Follow best practices by changing the length parameters to size_t and
explicitly specifying the length of the output digest arrays.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/crypto/sha2.h | 8 ++++----
 lib/crypto/sha256.c   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 444484d1b1cfa..7dfc560daa2c7 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -93,13 +93,13 @@ static inline void sha256_init(struct sha256_state *sctx)
 	sctx->state[5] = SHA256_H5;
 	sctx->state[6] = SHA256_H6;
 	sctx->state[7] = SHA256_H7;
 	sctx->count = 0;
 }
-void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len);
-void sha256_final(struct sha256_state *sctx, u8 *out);
-void sha256(const u8 *data, unsigned int len, u8 *out);
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
+void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
 static inline void sha224_init(struct sha256_state *sctx)
 {
 	sctx->state[0] = SHA224_H0;
 	sctx->state[1] = SHA224_H1;
@@ -110,8 +110,8 @@ static inline void sha224_init(struct sha256_state *sctx)
 	sctx->state[6] = SHA224_H6;
 	sctx->state[7] = SHA224_H7;
 	sctx->count = 0;
 }
 /* Simply use sha256_update as it is equivalent to sha224_update. */
-void sha224_final(struct sha256_state *sctx, u8 *out);
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
 
 #endif /* _CRYPTO_SHA2_H */
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 4b19cf977ef1b..563f09c9f3815 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -68,11 +68,11 @@ static inline void __sha256_update(struct sha256_state *sctx, const u8 *data,
 	}
 	if (len)
 		memcpy(&sctx->buf[partial], data, len);
 }
 
-void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len)
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len)
 {
 	__sha256_update(sctx, data, len, false);
 }
 EXPORT_SYMBOL(sha256_update);
 
@@ -99,23 +99,23 @@ static inline void __sha256_final(struct sha256_state *sctx, u8 *out,
 		put_unaligned_be32(sctx->state[i / 4], out + i);
 
 	memzero_explicit(sctx, sizeof(*sctx));
 }
 
-void sha256_final(struct sha256_state *sctx, u8 *out)
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA256_DIGEST_SIZE, false);
 }
 EXPORT_SYMBOL(sha256_final);
 
-void sha224_final(struct sha256_state *sctx, u8 *out)
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA224_DIGEST_SIZE, false);
 }
 EXPORT_SYMBOL(sha224_final);
 
-void sha256(const u8 *data, unsigned int len, u8 *out)
+void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
 	sha256_init(&sctx);
 	sha256_update(&sctx, data, len);
-- 
2.49.0


