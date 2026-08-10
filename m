Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69206C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vqj916x7IWEPwY8/O5oc6WAr80znZJ+nk/7CTdbfDAQ=; b=ewXR2q1BGAynF4c8T8SGisffb8
	Dda9PMfy1EUjTGhC29KaCDGkVbBQ+zBLm2bZSvpKfVKRYlUYv1H6cHHvGLH+Rf5OIc9a326ieMEKl
	J5IkPpv+Zs4XpPGl5QOj840ROqo3wS/iY5u15wnY8DRBsz4AYgh3zRRtN0kKdptWMybSjS/WGK27d
	RUtE4XYJfVppiVN9RCSpWxTuOh2SlcoyYqh1dYfqK7Dm50rUzzCh6cj+AUSkiF7UtPFnsbUWL8t4v
	O1adSM7JOIMCYe0FWz13nrgHkuVn1T62w/YYyl9xntuoO41HfiaHgmvM7GFOJur0D4vvjG1jhhDep
	XeVzkSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMLB-0000000BOzH-2iBd;
	Mon, 10 Aug 2026 09:30:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtML9-0000000BOyL-3y7Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 09:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786354239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vqj916x7IWEPwY8/O5oc6WAr80znZJ+nk/7CTdbfDAQ=;
	b=PbWhtjyUo7w95JqNYTjZaQD0ZVnKE9tJLo3xeeZBhJ/G762MBiIoBWBMs8dcZLpzzGYgt4
	QY9uI+Ew2C4GKbEn9EnoLkDp3tmEmh7YaKhEvEIKdPrAtHhoocJAzWXwiJFyDfcdgs1F87
	NWHOlvSgY+rfHttd5rMgJTubZC5XJrM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-357-1bpIgU8CMXGcJ8ZkQtFrtw-1; Mon,
 10 Aug 2026 05:30:35 -0400
X-MC-Unique: 1bpIgU8CMXGcJ8ZkQtFrtw-1
X-Mimecast-MFC-AGG-ID: 1bpIgU8CMXGcJ8ZkQtFrtw_1786354233
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 715B71800115;
	Mon, 10 Aug 2026 09:30:33 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 13DE33001D38;
	Mon, 10 Aug 2026 09:30:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-crypto@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	linux-kernel@vger.kernel.org,
	Antoine Tenart <atenart@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 05/10] crypto: arm/aes-neonbs - clear the crypto_aes_ctx when done
Date: Mon, 10 Aug 2026 11:30:00 +0200
Message-ID: <20260810093009.608090-6-thuth@redhat.com>
In-Reply-To: <20260810093009.608090-1-thuth@redhat.com>
References: <20260810093009.608090-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Srg8dxzjyJME9C1UUrYh6V_P6v4oWbyMcc0RNMZRdeg_1786354233
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_023040_049018_AC15237F 
X-CRM114-Status: GOOD (  12.61  )
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

Clear the crypto_aes_ctx structure via __cleanup(aes_zeroize_ctx) when
we're done with it to avoid that key data could leak on the stack.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arm/crypto/aes-neonbs-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/crypto/aes-neonbs-glue.c b/arch/arm/crypto/aes-neonbs-glue.c
index c49ddafc54f34..f0c8bfd2ac8fc 100644
--- a/arch/arm/crypto/aes-neonbs-glue.c
+++ b/arch/arm/crypto/aes-neonbs-glue.c
@@ -60,7 +60,7 @@ static int aesbs_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 			unsigned int key_len)
 {
 	struct aesbs_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct crypto_aes_ctx rk;
+	struct crypto_aes_ctx rk __cleanup(aes_zeroize_ctx);
 	int err;
 
 	err = aes_expandkey(&rk, in_key, key_len);
-- 
2.55.0


