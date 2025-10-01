Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EC8CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gS6I9+pn+T6EshQ8kERlfqfUoiq0QQuAAxssnEC3ucQ=; b=vhTgbgJUFSqu0DQUTENABcbe79
	YIUks+5Pwd2anZWNzUUnlreX2iMcvDzrfnbuewJhMwllBo4IwVc+xbdqfWPPvteA8vtadQ0YRarRf
	iMQjAgP3d/ITvOH2i/j2F+7AC82J6Oy4GiiEYO3j+QA0xKJMpgs6Ye/Pniym8vgcX4fshhMiQJmCH
	exlzz+Q7HdkSS8lfoEycyKOO8i1irstlZQr050RzsEe6lAXEhKcwBhpF6dn8xbgXYBgL+cs5BAquC
	qKWPJxJctiK20ulZeVZ1RSVQ47zV7PLdOoWdlfweHA67BFwh+zPuEWmJFskUtIDq05Up0FupZzdr8
	TpsJ5tLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wa0-00000007yF0-3fYg;
	Wed, 01 Oct 2025 13:09:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wZx-00000007yDX-1jUT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759324148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gS6I9+pn+T6EshQ8kERlfqfUoiq0QQuAAxssnEC3ucQ=;
	b=DuNSMeXlj0leyPZsWi0/FkZDG0VukbFoj5i+thZ9j8zYRYkuyuQlUVOFU/6HzDgDn7kxtU
	oGk18XNYMk8FTVafKZ9sV4C9kKMYatYNRfljxeTOi5kGofoUorTGWcw3bDX3NMFRWTjGlv
	eqdWMEycEg+v5Pih0xabosSjKW2sPhg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-354-9ISZppLGP6KdkYM6WRj1Ow-1; Wed,
 01 Oct 2025 09:09:05 -0400
X-MC-Unique: 9ISZppLGP6KdkYM6WRj1Ow-1
X-Mimecast-MFC-AGG-ID: 9ISZppLGP6KdkYM6WRj1Ow_1759324143
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F16D118002C4;
	Wed,  1 Oct 2025 13:09:02 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B7C9195608E;
	Wed,  1 Oct 2025 13:08:59 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/5] arm64/sha3: Rename conflicting functions
Date: Wed,  1 Oct 2025 14:08:41 +0100
Message-ID: <20251001130846.2284946-3-dhowells@redhat.com>
In-Reply-To: <20251001130846.2284946-1-dhowells@redhat.com>
References: <20251001130846.2284946-1-dhowells@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_060909_520079_BEA270AE 
X-CRM114-Status: GOOD (  14.57  )
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


