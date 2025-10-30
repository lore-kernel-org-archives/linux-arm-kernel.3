Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFD3CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRb8iyLYUYV5ktNTUz4FTNRhUwwlT0ql17sex8D3XGk=; b=1Mu8suniO1DNupfRjnSQSpYF3D
	++7Jvynct2JsXcNb0tFBNYLHCHiYXnoxbzCAIIjJ6jAlMFTZgmROHgotLzU9AeSzry/lL67OzTesX
	Oqjyi55vjHvZw0Bj1kI7deLSnXymBKIkGbWyAogvQJawsMiBhY0lQBQ6yj9UvQlwM3dBXSU0bHOdJ
	t/ErJwbYkFcJqa6vcXGHqwMjMY0IAl9B0jrhdpeVa0X8dnvfgwGp8/WebTFoLJTz5/kIe9dJOS9YW
	IUJ0cJ3jbYzO4BtFgUspsm38St9ZysVtzlfv8Np+bWrUq/ajonQPvdU4J2agQxI/93vDUT3cRf4XZ
	Jz/km8Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYgQ-00000004i9a-3lR3;
	Thu, 30 Oct 2025 19:51:42 +0000
Received: from vs10.datenmanufaktur-hosting.net ([213.160.73.65] helo=vs81.iboxed.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYgN-00000004i6y-2tCV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:51:41 +0000
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59UJvBPJ020215;
	Thu, 30 Oct 2025 19:57:11 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59UJvBeG020212;
	Thu, 30 Oct 2025 19:57:11 GMT
From: Alexander Kurz <akurz@blala.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Dr . David Alan Gilbert" <linux@treblig.org>,
        Job Sava <jsava@criticallink.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v6 3/6] Input: mc13783-pwrbutton: convert pdata members to array
Date: Thu, 30 Oct 2025 19:56:51 +0000
Message-Id: <20251030195654.20142-4-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251030195654.20142-1-akurz@blala.de>
References: <20251030195654.20142-1-akurz@blala.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_125140_108966_D918739D 
X-CRM114-Status: GOOD (  14.45  )
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

As preparation for the extension of support for all three mc13xxx
variants, convert the members of mc13xxx_buttons_platform_data to
arrays to allow index access within the next commit.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/input/misc/mc13783-pwrbutton.c | 42 +++++++++++++-------------
 include/linux/mfd/mc13xxx.h            |  8 ++---
 2 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index 20f68aab6edf..2ee115d77b1c 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -108,24 +108,24 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	reg |= (pdata->b1on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
-	reg |= (pdata->b2on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
-	reg |= (pdata->b3on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
+	reg |= (pdata->b_on_flags[0] & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
+	reg |= (pdata->b_on_flags[1] & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
+	reg |= (pdata->b_on_flags[2] & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
 
 	priv->pwr = pwr;
 	priv->mc13783 = mc13783;
 
 	mc13xxx_lock(mc13783);
 
-	if (pdata->b1on_flags & MC13783_BUTTON_ENABLE) {
-		priv->keymap[0] = pdata->b1on_key;
-		if (pdata->b1on_key != KEY_RESERVED)
-			__set_bit(pdata->b1on_key, pwr->keybit);
+	if (pdata->b_on_flags[0] & MC13783_BUTTON_ENABLE) {
+		priv->keymap[0] = pdata->b_on_key[0];
+		if (pdata->b_on_key[0] != KEY_RESERVED)
+			__set_bit(pdata->b_on_key[0], pwr->keybit);
 
-		if (pdata->b1on_flags & MC13783_BUTTON_POL_INVERT)
+		if (pdata->b_on_flags[0] & MC13783_BUTTON_POL_INVERT)
 			priv->flags |= MC13783_PWRB_B1_POL_INVERT;
 
-		if (pdata->b1on_flags & MC13783_BUTTON_RESET_EN)
+		if (pdata->b_on_flags[0] & MC13783_BUTTON_RESET_EN)
 			reg |= MC13783_POWER_CONTROL_2_ON1BRSTEN;
 
 		irq = platform_get_irq_byname(pdev, "b1on");
@@ -144,15 +144,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		priv->irq[0] = irq;
 	}
 
-	if (pdata->b2on_flags & MC13783_BUTTON_ENABLE) {
-		priv->keymap[1] = pdata->b2on_key;
-		if (pdata->b2on_key != KEY_RESERVED)
-			__set_bit(pdata->b2on_key, pwr->keybit);
+	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE) {
+		priv->keymap[1] = pdata->b_on_key[1];
+		if (pdata->b_on_key[1] != KEY_RESERVED)
+			__set_bit(pdata->b_on_key[1], pwr->keybit);
 
-		if (pdata->b2on_flags & MC13783_BUTTON_POL_INVERT)
+		if (pdata->b_on_flags[1] & MC13783_BUTTON_POL_INVERT)
 			priv->flags |= MC13783_PWRB_B2_POL_INVERT;
 
-		if (pdata->b2on_flags & MC13783_BUTTON_RESET_EN)
+		if (pdata->b_on_flags[1] & MC13783_BUTTON_RESET_EN)
 			reg |= MC13783_POWER_CONTROL_2_ON2BRSTEN;
 
 		irq = platform_get_irq_byname(pdev, "b2on");
@@ -171,15 +171,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
 		priv->irq[1] = irq;
 	}
 
-	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE) {
-		priv->keymap[2] = pdata->b3on_key;
-		if (pdata->b3on_key != KEY_RESERVED)
-			__set_bit(pdata->b3on_key, pwr->keybit);
+	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE) {
+		priv->keymap[2] = pdata->b_on_key[2];
+		if (pdata->b_on_key[2] != KEY_RESERVED)
+			__set_bit(pdata->b_on_key[2], pwr->keybit);
 
-		if (pdata->b3on_flags & MC13783_BUTTON_POL_INVERT)
+		if (pdata->b_on_flags[2] & MC13783_BUTTON_POL_INVERT)
 			priv->flags |= MC13783_PWRB_B3_POL_INVERT;
 
-		if (pdata->b3on_flags & MC13783_BUTTON_RESET_EN)
+		if (pdata->b_on_flags[2] & MC13783_BUTTON_RESET_EN)
 			reg |= MC13783_POWER_CONTROL_2_ON3BRSTEN;
 
 		irq = platform_get_irq_byname(pdev, "b3on");
diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
index dd46fe424a80..4437ab80fcf8 100644
--- a/include/linux/mfd/mc13xxx.h
+++ b/include/linux/mfd/mc13xxx.h
@@ -181,12 +181,8 @@ struct mc13xxx_leds_platform_data {
 #define MC13783_BUTTON_RESET_EN		(1 << 4)
 
 struct mc13xxx_buttons_platform_data {
-	int b1on_flags;
-	unsigned short b1on_key;
-	int b2on_flags;
-	unsigned short b2on_key;
-	int b3on_flags;
-	unsigned short b3on_key;
+	int b_on_flags[3];
+	unsigned int b_on_key[3];
 };
 
 #define MC13783_TS_ATO_FIRST	false
-- 
2.39.5


