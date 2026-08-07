Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA1EC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFuj09l13bDJWP8ROOQNO6DWGBJe5ddETVvR3frCMgU=; b=H2broTM6G9HxfjOFWAUWkaQYpB
	5jR9diqnWBIDCbaO/s2gH971KYXKHWbqGdiEEG4Fi+76stk8UWovKcO/MvdZE7cA90K+mE0zPwbSQ
	czE+q58dqTw6nrVVBKjsJKu4dz3NZLnixL1qUB24d5S1Nn5jHAtF2IRnc4T1eGxEh3+y8BdQGnBUl
	gZl/HrwZYljMaD6xvgVxo8M9cziGExkVzpxoK89TAsxfEf2zDCTZ9b4QdGPkkl9poRjWD7sNwVWvI
	kJQs2ysoS5C5JoJq+DR46HBbXnKkd3pLmbVMmnNXM71d5Uco7+IVuNCHzeL6oojUSxVF+eeI3qysn
	xCtQPqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEgA-00000007Ctn-2nJU;
	Fri, 07 Aug 2026 07:07:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsEg8-00000007Csl-0Cg2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786086459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rFuj09l13bDJWP8ROOQNO6DWGBJe5ddETVvR3frCMgU=;
	b=LedCy/+XjLQFhyWSB4o+xS/pYa/YsGFLg4mY6MHinsG3o3v6KSgFhEDNUzRzWiKziCld1J
	w1hKtcpR9gKgD2htydWG9jEqZPszL0RIOvMoGXUwzobo4Qh3yopwuw5na6LzSr3lU763+Z
	Yw8M/Em5hsZfbsuKAmTKtV5rOE55vAA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-306-nXN2oDJ3M8CXiPfpwlk0eA-1; Fri,
 07 Aug 2026 03:07:08 -0400
X-MC-Unique: nXN2oDJ3M8CXiPfpwlk0eA-1
X-Mimecast-MFC-AGG-ID: nXN2oDJ3M8CXiPfpwlk0eA_1786086427
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09EF31800471;
	Fri,  7 Aug 2026 07:07:06 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A279C1956094;
	Fri,  7 Aug 2026 07:07:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-crypto@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 02/10] crypto: aspeed - clear the crypto_aes_ctx when done
Date: Fri,  7 Aug 2026 09:06:29 +0200
Message-ID: <20260807070651.228713-3-thuth@redhat.com>
In-Reply-To: <20260807070651.228713-1-thuth@redhat.com>
References: <20260807070651.228713-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 4JqHaRvAmI3codJ0wZEEtld847VoQXWURA0M9XZl5dk_1786086427
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_000740_153996_97A016F2 
X-CRM114-Status: GOOD (  11.42  )
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

From: Thomas Huth <thuth@redhat.com>

Declare the gen_aes_key with __cleanup(aes_zeroize_ctx) to avoid that
its contents could be leaking via the stack when the function returns.
And since it is only required in one branch of the if-statement there,
move it to that block, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 drivers/crypto/aspeed/aspeed-hace-crypto.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-hace-crypto.c b/drivers/crypto/aspeed/aspeed-hace-crypto.c
index fa201dae1f81b..e7d3f611df05c 100644
--- a/drivers/crypto/aspeed/aspeed-hace-crypto.c
+++ b/drivers/crypto/aspeed/aspeed-hace-crypto.c
@@ -576,7 +576,6 @@ static int aspeed_aes_setkey(struct crypto_skcipher *cipher, const u8 *key,
 {
 	struct aspeed_cipher_ctx *ctx = crypto_skcipher_ctx(cipher);
 	struct aspeed_hace_dev *hace_dev = ctx->hace_dev;
-	struct crypto_aes_ctx gen_aes_key;
 
 	CIPHER_DBG(hace_dev, "keylen: %d bits\n", (keylen * 8));
 
@@ -585,9 +584,9 @@ static int aspeed_aes_setkey(struct crypto_skcipher *cipher, const u8 *key,
 		return -EINVAL;
 
 	if (ctx->hace_dev->version == AST2500_VERSION) {
+		struct crypto_aes_ctx gen_aes_key __cleanup(aes_zeroize_ctx);
 		aes_expandkey(&gen_aes_key, key, keylen);
 		memcpy(ctx->key, gen_aes_key.key_enc, AES_MAX_KEYLENGTH);
-
 	} else {
 		memcpy(ctx->key, key, keylen);
 	}
-- 
2.55.0


