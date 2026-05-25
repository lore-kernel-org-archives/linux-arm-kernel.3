Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846C4CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JBpTnc6Vg1sT2IJHGJXZ56PItXX8oc35dSxpvsG5u9w=; b=39uMpp+RpR523zjerohCCrdPxS
	QTxSaLKV4bhR39k4LwED/H7rkQ1zH7zHpKtVpM9Se8befsn/h5e8RQ+XyO8sb49lrH62Gzw5yINGd
	7lEdFAvg+UJKlEIsyoAmcpwAP+bEm+GFt0bF4aAFKFqZBn8i+R4wQFmuSH8gkMeTNw9aYX/rhuSt6
	tidw1YJe2Z4TO2fLL8ptoXByGX9HurPZmIBrjuErHDCOckcHAk9ylaWNd6UqUHAgaWJBd1/zFgybe
	TZomYQbvOEuPhVwY4a5r4p7ShYfAWs9UPH9xHcm3Snd+PstM+U1UCyN5op5WmExLDMkgw+ApeB/ox
	EN1oidzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRdG-0000000Gotw-14FL;
	Mon, 25 May 2026 09:29:58 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRdD-0000000Gorw-3QOl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:29:57 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779701381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JBpTnc6Vg1sT2IJHGJXZ56PItXX8oc35dSxpvsG5u9w=;
	b=Hq9jdm3/aj/81csrO6lBPgm49lR7+GttRiZj2coI7HJ18Kb8i1vcG9DmjHlxSEDAnRgYWy
	F2iRPFCiJCEKnp1KQn8mp+a8aOTsdbu9TvYG5p6Am5wrnqAYRuNsYkryFHqKTxCcuGlMbi
	2bXc/tQVbTKwuHOJ+YfoA9i3B9wG+VA=
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
Subject: [PATCH] crypto: atmel-tdes - use min3 to simplify sg_copy and crypt_start
Date: Mon, 25 May 2026 11:29:27 +0200
Message-ID: <20260525092927.818586-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=thorsten.blum@linux.dev; h=from:subject; bh=SEl/cCMi3V88T8oWrb1dqIYukSYT2552y/KDghxa6vs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkiYuWqAqqlv9oj3eQXnbRuZShblu91X+mIw1+7y62xK 959FXXoKGVhEONikBVTZHkw68cM39Kayk0mETth5rAygQxh4OIUgIksMGb4Z8RTOnffp8jUS4pv n+2of7IkuDHdbOZ2Ho4b8ltnrvx9O4yR4ZbNhq1Lz+hfumI13W3Fl13Jpyz2zp6i8GS7n4T1Jfv TBUwA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_022956_068920_2AB36408 
X-CRM114-Status: UNSURE (   9.23  )
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

Replace multiple min() and min_t() calls with min3() to simplify the
code. Using min3() instead of min_t() in atmel_tdes_crypt_start() is
safe since the values are all unsigned and compatible.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-tdes.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 643e507f9c02..834c6d3e1b06 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -143,8 +143,7 @@ static int atmel_tdes_sg_copy(struct scatterlist **sg, size_t *offset,
 	size_t count, off = 0;
 
 	while (buflen && total) {
-		count = min((*sg)->length - *offset, total);
-		count = min(count, buflen);
+		count = min3((*sg)->length - *offset, total, buflen);
 
 		if (!count)
 			return off;
@@ -469,8 +468,8 @@ static int atmel_tdes_crypt_start(struct atmel_tdes_dev *dd)
 
 
 	if (fast)  {
-		count = min_t(size_t, dd->total, sg_dma_len(dd->in_sg));
-		count = min_t(size_t, count, sg_dma_len(dd->out_sg));
+		count = min3(sg_dma_len(dd->in_sg), sg_dma_len(dd->out_sg),
+			     dd->total);
 
 		err = dma_map_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
 		if (!err) {

