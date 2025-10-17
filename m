Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE08CCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gS6I9+pn+T6EshQ8kERlfqfUoiq0QQuAAxssnEC3ucQ=; b=3fGc37zXzYyijSUT0T1oYqG68e
	V6WVZEorHxOQpkgcHI+8+lNWpM6YKKfRP6BUY6alZpy3GFuYbKjcc0I5BrMy6KtckMF1q/Z8VqG6/
	LWgboZyjU35tR7wZyFBBNKB3dUlDCRhwGUykkmWRWputL5r4X1tWhI3IU5wB44CABzYRoKGUm1y1k
	re9JOW6slZiNPZLyScEVqV/7JQO+oYCAn+50ZbC/GhB0HIFQmpXV/nHev3gZlIGyZ8qtHwFTlfdgu
	rZduJpURuHvAP6uJ6Xk38iq5PL4WFSKouFjvynb35TKPzZX1z8BIXBvQcgydgWrwB6+OVw1lZe4yZ
	1K2AaxqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lgH-000000087Hd-31hP;
	Fri, 17 Oct 2025 14:43:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lgF-000000087Fw-3PAR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 14:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gS6I9+pn+T6EshQ8kERlfqfUoiq0QQuAAxssnEC3ucQ=;
	b=J2rpfYlhaJC4Mv4sJw71YrW5fJlD+s91jurU6yYGBnJwVGqDAqjciA84T+FniibshK1oIm
	VU0iUNjLF0rd3csc9Eeuv9Gp7Rf3X/efY/PiBOryLT0BZMP4e0KzbI3RhJYe8Ua3159FLA
	7B5FC4JzjI8OvbvT99OL6uS7k2e4E3I=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-cfP8s2VKNh2HBKTK5s2deQ-1; Fri,
 17 Oct 2025 10:43:37 -0400
X-MC-Unique: cfP8s2VKNh2HBKTK5s2deQ-1
X-Mimecast-MFC-AGG-ID: cfP8s2VKNh2HBKTK5s2deQ_1760712214
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 500951956095;
	Fri, 17 Oct 2025 14:43:33 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7FD431800452;
	Fri, 17 Oct 2025 14:43:27 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 02/17] arm64/sha3: Rename conflicting functions
Date: Fri, 17 Oct 2025 15:42:46 +0100
Message-ID: <20251017144311.817771-3-dhowells@redhat.com>
In-Reply-To: <20251017144311.817771-1-dhowells@redhat.com>
References: <20251017144311.817771-1-dhowells@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_074343_919579_F0684007 
X-CRM114-Status: GOOD (  13.44  )
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

Rename the arm64 sha3_* functions to have an "arm64_" prefix to avoid
conflict with generic code.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Jason A. Donenfeld <Jason@zx2c4.com>
cc: Ard Biesheuvel <ardb@kernel.org>
cc: Catalin Marinas <catalin.marinas@arm.com>
cc: Will Deacon <will@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: Stephan Mueller <smueller@chronox.de>
cc: linux-crypto@vger.kernel.org
cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/crypto/sha3-ce-glue.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/crypto/sha3-ce-glue.c b/arch/arm64/crypto/sha3-ce-glue.c
index b4f1001046c9..426d8044535a 100644
--- a/arch/arm64/crypto/sha3-ce-glue.c
+++ b/arch/arm64/crypto/sha3-ce-glue.c
@@ -31,7 +31,7 @@ MODULE_ALIAS_CRYPTO("sha3-512");
 asmlinkage int sha3_ce_transform(u64 *st, const u8 *data, int blocks,
 				 int md_len);
 
-static int sha3_update(struct shash_desc *desc, const u8 *data,
+static int arm64_sha3_update(struct shash_desc *desc, const u8 *data,
 		       unsigned int len)
 {
 	struct sha3_state *sctx = shash_desc_ctx(desc);
@@ -55,8 +55,8 @@ static int sha3_update(struct shash_desc *desc, const u8 *data,
 	return len;
 }
 
-static int sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
-		      u8 *out)
+static int arm64_sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
+			    u8 *out)
 {
 	struct sha3_state *sctx = shash_desc_ctx(desc);
 	struct crypto_shash *tfm = desc->tfm;
@@ -90,8 +90,8 @@ static int sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
 static struct shash_alg algs[] = { {
 	.digestsize		= SHA3_224_DIGEST_SIZE,
 	.init			= crypto_sha3_init,
-	.update			= sha3_update,
-	.finup			= sha3_finup,
+	.update			= arm64_sha3_update,
+	.finup			= arm64_sha3_finup,
 	.descsize		= SHA3_STATE_SIZE,
 	.base.cra_name		= "sha3-224",
 	.base.cra_driver_name	= "sha3-224-ce",
@@ -102,8 +102,8 @@ static struct shash_alg algs[] = { {
 }, {
 	.digestsize		= SHA3_256_DIGEST_SIZE,
 	.init			= crypto_sha3_init,
-	.update			= sha3_update,
-	.finup			= sha3_finup,
+	.update			= arm64_sha3_update,
+	.finup			= arm64_sha3_finup,
 	.descsize		= SHA3_STATE_SIZE,
 	.base.cra_name		= "sha3-256",
 	.base.cra_driver_name	= "sha3-256-ce",
@@ -114,8 +114,8 @@ static struct shash_alg algs[] = { {
 }, {
 	.digestsize		= SHA3_384_DIGEST_SIZE,
 	.init			= crypto_sha3_init,
-	.update			= sha3_update,
-	.finup			= sha3_finup,
+	.update			= arm64_sha3_update,
+	.finup			= arm64_sha3_finup,
 	.descsize		= SHA3_STATE_SIZE,
 	.base.cra_name		= "sha3-384",
 	.base.cra_driver_name	= "sha3-384-ce",
@@ -126,8 +126,8 @@ static struct shash_alg algs[] = { {
 }, {
 	.digestsize		= SHA3_512_DIGEST_SIZE,
 	.init			= crypto_sha3_init,
-	.update			= sha3_update,
-	.finup			= sha3_finup,
+	.update			= arm64_sha3_update,
+	.finup			= arm64_sha3_finup,
 	.descsize		= SHA3_STATE_SIZE,
 	.base.cra_name		= "sha3-512",
 	.base.cra_driver_name	= "sha3-512-ce",


