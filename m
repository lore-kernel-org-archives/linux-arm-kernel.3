Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A655C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HHEz/+ubk2A0Vj5bhm9eyEa2NH6WNZdZF0TFxwHEsMY=; b=UzXP+PtJPmxBKn5gzDgm8Ihukb
	lVo/XnV5twMLz/nuypQ9sGF3ghyjDPZ4iPiPIA6kus4r7kJ8gGC0jNZbs7NKRctw88Baq4x7X1Sy3
	nxAZK3cgODvbMXrrzPqLl4PNvQtYMCg3zzSXbPIATs7wbkxY2TBilfLea04jcwftacdofQwNAwIyL
	ZFmJsVK6Bv6G9QX8a2wtJ3nGNahh5VmQ+E84eiNEVmdfuONwvUKl7Q/KulFZOb7JsNaKyB2d9+tYu
	WYawGEXY1sgbJyO6s4YaOryAWbjjZ4WOn551Ly40PxGBpBbNheuSTOTd5DBbK0rDYZBZha8G3X9vl
	JJmfX9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Au8-00000006mmF-0Z0W;
	Tue, 22 Apr 2025 10:31:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ANZ-00000006etG-1les
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 09:57:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6E1F614AB;
	Tue, 22 Apr 2025 09:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B2DC4CEE9;
	Tue, 22 Apr 2025 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745315844;
	bh=t1U5iu98UOVrBT4ZBbp17ocR2D+pzk83ZqkZJHQyekw=;
	h=From:To:Cc:Subject:Date:From;
	b=oRY1KBfXD6XpEip2QJIKF9vcSvOYFSGYWB0yBS2TWWN5XoySex5XlxZQCPTgqSV/F
	 ygHLWy89V2pRzcET2vZhQSkH4AzcEz+Wgyv25q9Hu5x254EpYG3RdSnq01Qhfqu5Fu
	 Hg5ywdrncFxOLNJ5Nxk+11e9H0mRkJrVr6zOebhcrfGLxOoFT6vt0MkDGX+UehGJU9
	 URsZlrh0Si+X4AQdnCX0qGjPvHkZXPozCyQcJJ1rFLVD4cL2o9j6ZvOrrPfcF9JmS2
	 ih6c+DOzJleOp6+LRk7lkUmlJok5QtjmwdLw99V3ycWVCrZyooXKY2ydUFB92V/BDt
	 yjEmO4PBxHDGQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-sha204a - Set hwrng quality to lowest possible
Date: Tue, 22 Apr 2025 11:57:18 +0200
Message-ID: <20250422095718.17360-1-kabel@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

According to the review by Bill Cox [1], the Atmel SHA204A random number
generator produces random numbers with very low entropy.

Set the lowest possible entropy for this chip just to be safe.

[1] https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.html

Fixes: da001fb651b00e1d ("crypto: atmel-i2c - add support for SHA204A random number generator")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/crypto/atmel-sha204a.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 75bebec2c757..0fcf4a39de27 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -163,6 +163,12 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 	i2c_priv->hwrng.name = dev_name(&client->dev);
 	i2c_priv->hwrng.read = atmel_sha204a_rng_read;
 
+	/*
+	 * According to review by Bill Cox [1], this HWRNG has very low entropy.
+	 * [1] https://www.metzdowd.com/pipermail/cryptography/2014-December/023858.html
+	 */
+	i2c_priv->hwrng.quality = 1;
+
 	ret = devm_hwrng_register(&client->dev, &i2c_priv->hwrng);
 	if (ret)
 		dev_warn(&client->dev, "failed to register RNG (%d)\n", ret);
-- 
2.49.0


