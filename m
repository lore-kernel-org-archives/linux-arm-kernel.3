Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFF3CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 21:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iMx8HlLpT41Aijq5Ei7QZP47cZW2EVlhOZ9kuaWFBQo=; b=o4RZVGjG/rZUA3NexicXdupQ1X
	VTJE+9mfDPTINkZDpE7i3xJQ8WdBEKaTCvlD3jL60klPYlBer+g2gr/9fpBrrqQsYC4yepVARm54W
	aLkQyZn6+MoyNzbN4vTgHuBFDvIexFAnA9xQuHIlPJxjP9jSHDj7mKG/YAWjrQ0sO9CrFkmAWNdLl
	2WtG/72eEy0c22K5hIWODHyvvk2jyMUln1YMj5aNaxvK+RvCTOqxmepMYUWXog3n1L39KdjfsVdwv
	7CO1E2lGQiMWz5cEf3ODaovtjxTGdyLj+fXAqUce9+KsW6qzCifArYsrdzq/XOQjlU4Z088Opq5LZ
	BnFtCPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfXw-00000004cRP-3Hfg;
	Tue, 29 Sep 2026 21:39:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfXu-00000004cR3-32ly
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 21:39:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70A5D40A30;
	Tue, 29 Sep 2026 21:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509D01F000FF;
	Tue, 29 Sep 2026 21:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790717970;
	bh=iMx8HlLpT41Aijq5Ei7QZP47cZW2EVlhOZ9kuaWFBQo=;
	h=From:To:Cc:Subject:Date;
	b=B05jVogInhfRIXWsxxYUeUJSzofHlwV6HCI+RTgMWfCOuvIteCL6C3eZDTuqwp3xj
	 yiGw06JJX08zBdkrXUIvBgGSEMWMJFIg1YUdTy2X55rs2rVYNScnytW6h/PIlxvqO3
	 d7kOXkqOab5l1dfBbJJV3xfNJrdk9biJ5m9I10S8b+/3RjVgFhAOljx1SD4fU1ok8G
	 B3vlwyW4tEWkK/t06bIjinB32JnnWGcmnIq/v7DDW3zBpgs7HC7GKFfsf1Y6P6yIWl
	 uVPDmAstjjEVNNFtSp1/0ZzoYHDExG7cmEVl5mLPSK9x632GKOaGgIFF6KDRlvikMO
	 nssuwV62x2dWw==
From: Thorsten Blum <blum@kernel.org>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thorsten Blum <blum@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwrng: atmel - use HZ_PER_MHZ in atmel_trng_init()
Date: Tue, 29 Sep 2026 23:37:50 +0200
Message-ID: <20260929213751.103658-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=blum@kernel.org; h=from:subject; bh=3rcAUys/sxfu6RZEzaJsDobT9wbVC6AePxK7n/KkZG4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFl79Nebb+q7uYk9vrIu5dLhcBkuZ/lv3erb7za/eeguY vv96vOQjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZiIyE6Gfwa5hXPyP0pVsWav z7m3KNy9e23EtWkr3Y91BLBzc2gX9DIynFnPejRAbUrwti8J3+omqJ/7HLGrU63GtGpLpttDv3P 53AA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
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

Combine and inline the rate check to simplify the code. Drop the local
rate variable and use HZ_PER_MHZ instead of the hard-coded frequency.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/char/hw_random/atmel-rng.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
index 06e79d516743..fe444196e6b3 100644
--- a/drivers/char/hw_random/atmel-rng.c
+++ b/drivers/char/hw_random/atmel-rng.c
@@ -17,6 +17,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/units.h>
 
 #define TRNG_CR		0x00
 #define TRNG_MR		0x04
@@ -85,20 +86,14 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
 
 static int atmel_trng_init(struct atmel_trng *trng)
 {
-	unsigned long rate;
 	int ret;
 
 	ret = clk_prepare_enable(trng->clk);
 	if (ret)
 		return ret;
 
-	if (trng->has_half_rate) {
-		rate = clk_get_rate(trng->clk);
-
-		/* if peripheral clk is above 100MHz, set HALFR */
-		if (rate > 100000000)
-			writel(TRNG_HALFR, trng->base + TRNG_MR);
-	}
+	if (trng->has_half_rate && clk_get_rate(trng->clk) > 100 * HZ_PER_MHZ)
+		writel(TRNG_HALFR, trng->base + TRNG_MR);
 
 	writel(TRNG_KEY | 1, trng->base + TRNG_CR);
 

