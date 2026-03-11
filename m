Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE39106286C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1zXXtJLw22kU7ibsV83dH9zcIzG6mbgyF5sMgd5go/g=; b=nrpcLDeWUeU5+v+XrqSfzXYIrO
	vX6+kK3LhAQSDGqnISzi6YFrcW6VvYTQngCzzdE5a1LIlkoEntgFYf/eHi1+CgqERApy98SibnAa7
	m7/Kw745PfN02xPQ1pjXd3KOaeSqZsMDC2SKwyq/5Pkoh9B0+fwYNcfEBpVzY5adFwD20yo8gBM2O
	F/KLpOqC4d0YYkO6toTJdockN+dOZtLDY6cCz6H6NP0xcDCsCc8/tSigC5Ra0254SD7D2dnPss29Q
	V1siLKQn+L/WdnBQ2cmaxJQeP7jACf2Uft6GFN2NBR9nqmXSqq13t2U6Y43ZfWwdR007ZZqb+vQCI
	IlaWJCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Hvm-0000000BVCb-2s4F;
	Wed, 11 Mar 2026 11:40:50 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Hvj-0000000BVC9-0LN9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 11:40:48 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773229243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1zXXtJLw22kU7ibsV83dH9zcIzG6mbgyF5sMgd5go/g=;
	b=kRXZfNl1szwVPMCTGKbs/5CaKEkHTvPoFzmBWlDxaKf7dvja8EpCnYPLVoaj1JQl8l6yU4
	ZlaDy9YhF10wpDdQW35InXYhp3KewVpodh9t6MTayjwpzjIKRasouEtn5qVCIm9oLEsosi
	hWdSFIq6mdCoCECNx1KjRM0j/i7s88A=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-aes - guard unregister on error in atmel_aes_register_algs
Date: Wed, 11 Mar 2026 12:39:28 +0100
Message-ID: <20260311113927.305633-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=thorsten.blum@linux.dev; h=from:subject; bh=0W2qDs9Pda2VTMqqyy80DUZU1WSJA8HR8VKSER3/HQU=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJkbQ/JrCwuzvH+HfX+2UEixtn8FP9vv89f2pXZcb0q4a 9o+XeJpRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzEVYrhr7jYsz1GvwVYLspc 8z4Q7Sb2U+DqzjOHN97ZPnFhh8X1+SoMv5hEyrS0L5qeK/zp/3tyWdHGjRpmMyZ0r9165J4Ox0y /Yj4A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_044047_796190_54588DEA 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

Ensure the device supports XTS and GCM with 'has_xts' and 'has_gcm'
before unregistering algorithms when XTS or authenc registration fails,
which would trigger a WARN in crypto_unregister_alg().

Currently, with the capabilities defined in atmel_aes_get_cap(), this
bug cannot happen because all devices that support XTS and authenc also
support GCM, but the error handling should still be correct regardless
of hardware capabilities.

Fixes: d52db5188a87 ("crypto: atmel-aes - add support to the XTS mode")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-aes.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index bc0c40f10944..64960eeeb17b 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -2270,10 +2270,12 @@ static int atmel_aes_register_algs(struct atmel_aes_dev *dd)
 	/* i = ARRAY_SIZE(aes_authenc_algs); */
 err_aes_authenc_alg:
 	crypto_unregister_aeads(aes_authenc_algs, i);
-	crypto_unregister_skcipher(&aes_xts_alg);
+	if (dd->caps.has_xts)
+		crypto_unregister_skcipher(&aes_xts_alg);
 #endif
 err_aes_xts_alg:
-	crypto_unregister_aead(&aes_gcm_alg);
+	if (dd->caps.has_gcm)
+		crypto_unregister_aead(&aes_gcm_alg);
 err_aes_gcm_alg:
 	i = ARRAY_SIZE(aes_algs);
 err_aes_algs:

