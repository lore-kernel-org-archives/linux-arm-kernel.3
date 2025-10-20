Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C80ACCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqT/LKw/7tNEbEGMECMmsC8+bRlnkfk//hxi6ie0Kxo=; b=2qNM1YZcNB+mAzVhnVwP5SF7+A
	WGizqMrd41wcgHk3xhLcSUPYG3/euxuRA16JaF89Bg+Jr96pcTab/N2uGtB9qg3roBWS2QmAsTrs7
	F/uTZAWdQ0zT3cT6RhoLd7lpkevZz36vHfyaacf8tqTdr4mgFOYLxZbKICVQIALf0OyZBdvbLWIfv
	XlI/l0JLGmXt7RUNLUqa1RurOQHEKkuVpleB3MqfFMwYXssK3GQ8dw78MoA4hqtQhwieqaHHfA7Tv
	RwvBVdthY1zZAMBSPh/FuTYwfvN+U4ffniMJQaDdu8WKhdZlf5bjzKC8WWAJ5bqGLY7HaaDvVuS+h
	wrXCto2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAeA3-0000000BZlu-19q0;
	Mon, 20 Oct 2025 00:54:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9k-0000000BZXj-278y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 00:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0223B60477;
	Mon, 20 Oct 2025 00:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FB4C116C6;
	Mon, 20 Oct 2025 00:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760921615;
	bh=3ORQ9KVdJyyMj/gc8QaYuJQuZsbtFtyURkNerD2o3uc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oit5HcfNshrDSHmVtH2/S/JLASBzI/Ti9cISjcCNnHc0K2pLTZdIR6fE3rYorCHej
	 Gmd04rN/u71NvIzZYDXIk++NB69tceE4IS7mShbKhrBOLtZHcpOdGUTck4J5oLdQ9p
	 lpnw0LdnIzk1JSekGDXjKb4yf6MO7qiJBJvrQFlASLbLIpt68bP/oC6m6at7lVP3qB
	 6hQbY2Rb89WT38+go/KYUS7yCW+xety/MFf8ddQw0hz6YJhcNl0869T+umw6XWXHl6
	 CixfqdyCd8099VjnSNoO5X8GyOSzQtytnCziqKW+gx/SmSebt+XRESHpxseeEi4X7w
	 7XDhQQ6PXT+yA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 09/17] lib/crypto: sha3: Consistently use EXPORT_SYMBOL_GPL
Date: Sun, 19 Oct 2025 17:50:30 -0700
Message-ID: <20251020005038.661542-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020005038.661542-1-ebiggers@kernel.org>
References: <20251020005038.661542-1-ebiggers@kernel.org>
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

Consistently use EXPORT_SYMBOL_GPL in sha3.c, instead of a mix of
EXPORT_SYMBOL and EXPORT_SYMBOL_GPL.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha3.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/crypto/sha3.c b/lib/crypto/sha3.c
index 8f08e7b8f4521..f8167037138c7 100644
--- a/lib/crypto/sha3.c
+++ b/lib/crypto/sha3.c
@@ -329,11 +329,11 @@ void sha3_224(const u8 *in, size_t in_len, u8 out[SHA3_224_DIGEST_SIZE])
 
 	sha3_224_init(&ctx);
 	sha3_224_update(&ctx, in, in_len);
 	sha3_224_final(&ctx, out);
 }
-EXPORT_SYMBOL(sha3_224);
+EXPORT_SYMBOL_GPL(sha3_224);
 
 /**
  * sha3_256() - Convenience wrapper to digest a simple buffer as SHA3-256
  * @in: The data to be digested
  * @in_len: The amount of data to be digested in bytes
@@ -350,11 +350,11 @@ void sha3_256(const u8 *in, size_t in_len, u8 out[SHA3_256_DIGEST_SIZE])
 
 	sha3_256_init(&ctx);
 	sha3_256_update(&ctx, in, in_len);
 	sha3_256_final(&ctx, out);
 }
-EXPORT_SYMBOL(sha3_256);
+EXPORT_SYMBOL_GPL(sha3_256);
 
 /**
  * sha3_384() - Convenience wrapper to digest a simple buffer as SHA3-384
  * @in: The data to be digested
  * @in_len: The amount of data to be digested in bytes
@@ -371,11 +371,11 @@ void sha3_384(const u8 *in, size_t in_len, u8 out[SHA3_384_DIGEST_SIZE])
 
 	sha3_384_init(&ctx);
 	sha3_384_update(&ctx, in, in_len);
 	sha3_384_final(&ctx, out);
 }
-EXPORT_SYMBOL(sha3_384);
+EXPORT_SYMBOL_GPL(sha3_384);
 
 /**
  * sha3_512() - Convenience wrapper to digest a simple buffer as SHA3-512
  * @in: The data to be digested in bytes
  * @in_len: The amount of data to be digested in bytes
@@ -392,11 +392,11 @@ void sha3_512(const u8 *in, size_t in_len, u8 out[SHA3_512_DIGEST_SIZE])
 
 	sha3_512_init(&ctx);
 	sha3_512_update(&ctx, in, in_len);
 	sha3_512_final(&ctx, out);
 }
-EXPORT_SYMBOL(sha3_512);
+EXPORT_SYMBOL_GPL(sha3_512);
 
 /**
  * shake128() - Convenience wrapper to apply SHAKE128 to a simple buffer
  * @in: The input data to be used
  * @in_len: The amount of input data in bytes
@@ -416,11 +416,11 @@ void shake128(const u8 *in, size_t in_len, u8 *out, size_t out_len)
 	shake128_init(&ctx);
 	shake128_update(&ctx, in, in_len);
 	shake128_squeeze(&ctx, out, out_len);
 	shake128_clear(&ctx);
 }
-EXPORT_SYMBOL(shake128);
+EXPORT_SYMBOL_GPL(shake128);
 
 /**
  * shake256() - Convenience wrapper to apply SHAKE256 to a simple buffer
  * @in: The input data to be used
  * @in_len: The amount of input data in bytes
@@ -440,11 +440,11 @@ void shake256(const u8 *in, size_t in_len, u8 *out, size_t out_len)
 	shake256_init(&ctx);
 	shake256_update(&ctx, in, in_len);
 	shake256_squeeze(&ctx, out, out_len);
 	shake256_clear(&ctx);
 }
-EXPORT_SYMBOL(shake256);
+EXPORT_SYMBOL_GPL(shake256);
 
 /*
  * Do a quick test using SHAKE256 and a 200 byte digest.
  */
 static const u8 sha3_sample[] __initconst =
-- 
2.51.1.dirty


