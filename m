Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F24C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WLGW09LnZSqYVDwzaVkwBn6CEBapAxlFThv6OXq+CBw=; b=H92p5RRnacpgQgSf52gDHsiEDK
	0qW886BBYTejx5GLV8JOPNbuz2l74xpqcbykTsbhekYTtBXFXaxEDeCxhYP/xOV50T4OgafLyMCyS
	zbqVL/vdswE9GfQ7QQyAM2PtjWsrmhIFpZ0UylBGqizfG5KJ9NVuosTY9+7atVeengxbImySn7jfq
	zLF51zMiaA3wezx/b/hy254Zl+9T8ap7CEl9NPoqI29LNCMzZeeVdvjgulCX6m9sAml3MYE4QP+2R
	AZkc30d84yFHWuDh/QCX+lsKJadff81oe55wSMHkrribhcut8ommTaW6U3hsQd3NTV9WpT+fp2R/e
	MQgWKcVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgks3-0000000Cpep-0UIM;
	Mon, 06 Jul 2026 15:04:31 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgks0-0000000Cpdf-2X8f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:04:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783350264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WLGW09LnZSqYVDwzaVkwBn6CEBapAxlFThv6OXq+CBw=;
	b=sdQE8Eoa5wacO+0yAruFzmI8tmzkx9scFMszeEm7a6R1mp7Wi3KMj4Ovn5mcA3U0tPWGa/
	7eRpYeCpkUstJdt77qOmytnC0mrtXyiK62XYWNgBUOBqW/60RlGrk2JX+8phYjUJhVDmma
	of93cnt1JfeFmrSihH5twGv66Oclems=
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
Subject: [PATCH 1/4] crypto: atmel-tdes - simplify fast path in crypt_start
Date: Mon,  6 Jul 2026 17:04:05 +0200
Message-ID: <20260706150404.382209-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597; i=thorsten.blum@linux.dev; h=from:subject; bh=jaN5zpYZLFMe2vpwb1ZAOmwVYIY0XjcWc/CpoBvBlD8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFneh5+sO2mmss1f6IQ969ru8Ju2qSp3N309xMW2xqXm/ cFdXWG7O0pZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAidhsY/vtMEov9/erqsWTj EgnhtlmRqyobfT34Fq2crroque7mHE2Gf6afV+874qi8mnFF664r4Q4L/F888Zo4b4VG9LHQH/u k1vEDAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_080429_079991_E965FAD6 
X-CRM114-Status: GOOD (  10.14  )
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

Fold all fast path conditions into a single boolean expression and drop
any redundant checks.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-tdes.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index d380f6741a2c..d9cc4f657481 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -451,25 +451,19 @@ static int atmel_tdes_crypt_dma(struct atmel_tdes_dev *dd,
 
 static int atmel_tdes_crypt_start(struct atmel_tdes_dev *dd)
 {
-	int err, fast = 0, in, out;
+	bool fast;
+	int err;
 	size_t count;
 	dma_addr_t addr_in, addr_out;
 
-	if ((!dd->in_offset) && (!dd->out_offset)) {
-		/* check for alignment */
-		in = IS_ALIGNED((u32)dd->in_sg->offset, sizeof(u32)) &&
-			IS_ALIGNED(dd->in_sg->length, dd->ctx->block_size);
-		out = IS_ALIGNED((u32)dd->out_sg->offset, sizeof(u32)) &&
-			IS_ALIGNED(dd->out_sg->length, dd->ctx->block_size);
-		fast = in && out;
-
-		if (dd->in_sg->length != dd->out_sg->length)
-			fast = 0;
-	}
-
+	fast = !dd->in_offset && !dd->out_offset &&
+		dd->in_sg->length == dd->out_sg->length &&
+		IS_ALIGNED(dd->in_sg->offset, sizeof(u32)) &&
+		IS_ALIGNED(dd->out_sg->offset, sizeof(u32)) &&
+		IS_ALIGNED(dd->in_sg->length, dd->ctx->block_size);
 
-	if (fast)  {
-		count = min_t(size_t, dd->total, dd->in_sg->length);
+	if (fast) {
+		count = min(dd->total, dd->in_sg->length);
 
 		err = dma_map_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
 		if (!err) {

