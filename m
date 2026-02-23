Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72572EC110C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ACKCF7Sx4cJxzVQ7Qf86A89fhl8f5q32Mam+sZ5AZeU=; b=yccZ/26qGJfPWJchLYBZCab3QW
	v3fO3IdP7R6a9+E3MqaAQ/CZSD/0MPwSoU7Zn1s2u/GyU0zQiHXgtkHJHRby5Yc/NHJxJ/ZIOYW3o
	P8Itm+wRY9th8R6xG59M9WP4ljcoa5bCiGIwrblRgtjsLnD2JZSQmnF3kGPAfpkFUj0s/WHyH2cQz
	BCmZ/6TJl+MffqU/zZm4mO0C8OIOYh9/tbsqN6CVMDTW5jPAbouo9TPrpKbvKY8fQxvSp2kv37qYQ
	L/T4Ulgk25libumipcHz49QbTXRBQ5K7KU6bKNDmBZiX0yzEgQs7IBAM1Fn+ePWEOG88iWJMLwpsw
	HRhvWH3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZFz-00000000iZ4-3pnV;
	Mon, 23 Feb 2026 16:58:03 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZFx-00000000iYY-1Nit
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:58:02 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771865877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ACKCF7Sx4cJxzVQ7Qf86A89fhl8f5q32Mam+sZ5AZeU=;
	b=Vb8deNEsJm+92Oqi0KPQJHpOekHoFOL0aPQg4vei7EfRHwqMJR02F+GKBKn1haGgzdmBBK
	Zkr0bkyuT3iJLiIZSMNGfh3sGqDB/gZazrobqOQYzQDWSHU10LMgOUapLRzGrc6Tnm4Bjz
	wDdTt8Tn3sxiTOU4r4Uv4VaC+jiB3mQ=
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
Subject: [PATCH] crypto: atmel-i2c - Replace hard-coded bus clock rate with constant
Date: Mon, 23 Feb 2026 17:57:37 +0100
Message-ID: <20260223165737.342015-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_085801_654997_0A9CE34A 
X-CRM114-Status: UNSURE (   9.09  )
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

Replace 1000000L with I2C_MAX_FAST_MODE_PLUS_FREQ.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index ba9d3f593601..316a0ad53cf6 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -370,7 +370,7 @@ int atmel_i2c_probe(struct i2c_client *client)
 		}
 	}
 
-	if (bus_clk_rate > 1000000L) {
+	if (bus_clk_rate > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 		dev_err(dev, "%u exceeds maximum supported clock frequency (1MHz)\n",
 			bus_clk_rate);
 		return -EINVAL;
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


