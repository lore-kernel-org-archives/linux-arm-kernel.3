Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1958C5518E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqzqzXsKLyD/JykJa41z6gjBOK5AcAPVYWltBpH9JdQ=; b=PjvE7/Ff7RsX+PAp0/Z4ZFsIsw
	TrcdukmnXofV/9zDZBrM8r5mEg7KTodqmLgxZBI++IPKumkKC+vJAfMsZWO1/BIIOMswEdHVwiR4v
	z54OIXuio5nDewlQyW3wG7kyJdch1XF8A4HaD94tZfGjs8akAzjyl287uGW67qqDc6eMckNsd8xEu
	sRZNI7xeM8q0GJ75tLY9NOo2uo6LrDg9huJkKOayMuptd+Si9OpZfI1//xgWkHH6/xRZ/aLHk0Kev
	7o6Gn91SJyj9XyWJThU0UNKsNAmYv0nU8FYX4ggLMdfg700psZqlMqAboESn+mxBx49ZGYiDX1gfX
	r1z/Db9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpGO-0000000GkVd-2dQ9;
	Mon, 03 Aug 2026 09:47:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpGM-0000000GkTH-0UCw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785750433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kqzqzXsKLyD/JykJa41z6gjBOK5AcAPVYWltBpH9JdQ=;
	b=fClZvlEm8emcPRq5YMQH67yBKOL9oQP3o2/5ZS8Pl9H/3MS0DvDDC/h9xZh+bE2u2IcSG9
	U57ws2Ib8qh8my/0tKvfnOc+UzccwfIepmZmotsB0FRY9D+l1d2aOBQN+yq9BQPs/iR5BR
	K6W7nzQAPVKfF7kP+c/wsAMStBG48MU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-451-GnM8WsrJNJayiuqXF46ESw-1; Mon,
 03 Aug 2026 05:45:15 -0400
X-MC-Unique: GnM8WsrJNJayiuqXF46ESw-1
X-Mimecast-MFC-AGG-ID: GnM8WsrJNJayiuqXF46ESw_1785750314
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E9A741800473;
	Mon,  3 Aug 2026 09:45:13 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.213])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C07931956087;
	Mon,  3 Aug 2026 09:45:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Simo Sorce <simo@redhat.com>
Subject: [PATCH v2 7/9] crypto: arm64/aes-neonbs - clear the crypto_aes_ctx when done
Date: Mon,  3 Aug 2026 11:44:26 +0200
Message-ID: <20260803094432.70505-8-thuth@redhat.com>
In-Reply-To: <20260803094432.70505-1-thuth@redhat.com>
References: <20260803094432.70505-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: PQe0aU_95AcTS9FtcaFigMuuisU-CBoMDNVVpSHngDA_1785750314
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_024714_227346_7230854C 
X-CRM114-Status: GOOD (  12.98  )
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

Clear the crypto_aes_ctx structure via __cleanup(aes_clear_ctx) when
we're done with it to avoid that key data could leak on the stack.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arm64/crypto/aes-neonbs-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/crypto/aes-neonbs-glue.c b/arch/arm64/crypto/aes-neonbs-glue.c
index 5bcbac9798931..4c0f1bbd03fee 100644
--- a/arch/arm64/crypto/aes-neonbs-glue.c
+++ b/arch/arm64/crypto/aes-neonbs-glue.c
@@ -247,7 +247,7 @@ static int aesbs_xts_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 			    unsigned int key_len)
 {
 	struct aesbs_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct crypto_aes_ctx rk;
+	struct crypto_aes_ctx rk __cleanup(aes_clear_ctx);
 	int err;
 
 	err = xts_verify_key(tfm, in_key, key_len);
-- 
2.55.0


