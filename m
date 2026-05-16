Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9AECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 23:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uWVGWR9P+fisLqZv1EK+PltibUkbLcactFYAeNMlwf4=; b=Exc8ueTimfMFuaJ8GDEl9aSocA
	6WU9QD3959wnkspPgND7SC9BtZUOox6Uo5nBs2qviUyJKvgw32rjQThyFE87Po0GpQ9cIF2AYPpMj
	2EY7iuv8XHkHP1nE6rhiKO9GdVfiFv5RUfYZ4G4q6cLn/yXJ5ssg2AHBUWHVxwNvtbymTIUCmR/eL
	FC1JnswjSIwGC84IVkwAQ+ijSdHRhRTgUs3bTauPPlahkGNKG9h0J0opvqv0vwQJ5XjO4l+yPNByb
	JWW57yk/QJWIOkChc/YIR+xXDQPxkYBXLy7AqN/VqjnxohTMGlPtjkyTt9mSoiILgtqe7hBFKN0ax
	hgmzhCJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOOei-0000000Biz1-3U10;
	Sat, 16 May 2026 23:42:52 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOOeg-0000000Biy0-1UWm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 23:42:51 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778974960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uWVGWR9P+fisLqZv1EK+PltibUkbLcactFYAeNMlwf4=;
	b=EhiIEw+6YRlo7L/FrKufECtfndt7JZ73ZWWheOiWzMQDt/MMVPdJgyJK5i3l8wldIdMRvo
	tGqseuTVwdxny+BUkFO6eTxYWyYr5LC2GT6fqkO7sKqd09SKHfAWGzCe7sczgRnKpxkmgq
	ga2GQCXrGftFZrgr7JAiXfmXwhgso6c=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-sha - use memcpy_and_pad to simplify hmac_setup
Date: Sun, 17 May 2026 01:42:12 +0200
Message-ID: <20260516234211.1131137-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=795; i=thorsten.blum@linux.dev; h=from:subject; bh=HWgEXqdF6aYXWTxdFkGRqPYwNVxZP11iFJK7joXrAao=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmcDJcTo4/NWVN/RV3jSrvmzvcnT9af4jjTKzM3V/MLn 0Ftg0NVRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEwk6zUjw5NXMzu8F/G1vFHq 3H2l9rRfWIEUS0RSVsoleyZl2/pL9xj+J1lZH2n5EFZSsvif0aTay05bTllFrdddrCJW4l1Qtbq eFwA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_164250_541647_168740D2 
X-CRM114-Status: UNSURE (   8.38  )
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

Use memcpy_and_pad() instead of memcpy() followed by memset() to
simplify atmel_sha_hmac_setup().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-sha.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 1f1341a16c42..f60c7c8cf912 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -1731,8 +1731,7 @@ static int atmel_sha_hmac_setup(struct atmel_sha_dev *dd,
 		return atmel_sha_hmac_prehash_key(dd, key, keylen);
 
 	/* Prepare ipad. */
-	memcpy((u8 *)hmac->ipad, key, keylen);
-	memset((u8 *)hmac->ipad + keylen, 0, bs - keylen);
+	memcpy_and_pad(hmac->ipad, bs, key, keylen, 0);
 	return atmel_sha_hmac_compute_ipad_hash(dd);
 }
 

