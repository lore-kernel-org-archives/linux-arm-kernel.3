Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84463C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMERds1aQrUorYxnjOG7U3TBg9X08veCZQ/DwuVV+W8=; b=Jm70+NbGUq80wX8qa8oY9eiWqE
	UAT4Mdb+TqQRsbmDZhpgJBm+96GwgtMKwx90/EdOe0bPwZUQhBGB+EO1ZRjBr07tLPyAWT65JtVmZ
	2l34kGL9DLXUWQdcr7nCXpgEnhv7s09vsUtWnYXE5J7YSilA47w523OpqH2I3fFUToK/M/YcyD6Ca
	LxyqU8ZP93t/9CQYO0Vap8krn/H8pOYMJBZzfbEzUiSJ+D96y7R4hcfoQWWa/Di8kz7AnUMAN9nF+
	AQlp+6wMwb9bqMmL8L0OqQZ1RxTYxCY95VJwLYuoR1xxomfbt4gsWFJOrmcoXF/WplekuwUHWVOiB
	pyDIMInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATlA-0000000FY5F-2ADp;
	Sat, 26 Sep 2026 14:52:16 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATl7-0000000FY3U-2mXN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 14:52:15 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790434329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pMERds1aQrUorYxnjOG7U3TBg9X08veCZQ/DwuVV+W8=;
	b=xFl6egS/phrUrCgkYxRPqLQxfqS5RP3ZKrYS1/5OajXWDTiAb7N1l5MP69vR5jHB9KsSFz
	cTWg8UIMCWGQy26ugxRqy3MUfeu+B0jIqmlZKqqBhOl7gjxRDduPd+92qAftJ+Cn49LKLD
	EFc3CWQEWdKDYA5n8oijwhmX2MaMavc=
Date: Sat, 26 Sep 2026 16:51:46 +0200
Subject: [PATCH v2 2/2] pinctrl: apple: Add t8140-pinctrl support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-apple-pinctrl-t8140-v2-2-620bd11cd2a1@cyberchaos.dev>
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
In-Reply-To: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_075213_942009_5103FC20 
X-CRM114-Status: GOOD (  16.32  )
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

Ensure the regmap does not attempt to read REG_GPIOx of any of the pins
marked with gpio-reserved-ranges. For this purpose, move the regmap_init
just before the first regmap_read, at which point the valid_mask has
been populated from the gpio-reserved-ranges device tree property.
With this, make the driver accept the new t8140 base compatible as with
this modifications the driver can now be loaded on this SoC without
crashing.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 6305b96aaa73..6b26a23d283c 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -66,6 +66,13 @@ struct apple_gpio_pinctrl {
 #define REG_GPIOx_DRIVE_STRENGTH1 GENMASK(23, 22)
 #define REG_IRQ(g, x)        (0x800 + 0x40 * (g) + 4 * ((x) >> 5))
 
+static bool apple_gpio_readable_register(struct device *dev, unsigned int reg)
+{
+	struct apple_gpio_pinctrl *pctl = dev_get_drvdata(dev);
+
+	return gpiochip_line_is_valid(&pctl->gpio_chip, reg / 4);
+}
+
 static const struct regmap_config regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -75,6 +82,7 @@ static const struct regmap_config regmap_config = {
 	.num_reg_defaults_raw = 512,
 	.use_relaxed_mmio = true,
 	.use_raw_spinlock = true,
+	.readable_reg = apple_gpio_readable_register,
 };
 
 /* No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register. */
@@ -90,6 +98,13 @@ static u32 apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
 	int ret;
 	u32 val;
 
+	if (!pctl->map)	{
+		pctl->map = devm_regmap_init_mmio(pctl->dev, pctl->base, &regmap_config);
+		if (IS_ERR(pctl->map))
+			return dev_err_probe(pctl->dev, PTR_ERR(pctl->map),
+					"Failed to create regmap\n");
+	}
+
 	ret = regmap_read(pctl->map, REG_GPIO(pin), &val);
 	if (ret)
 		return 0;
@@ -475,11 +490,6 @@ static int apple_gpio_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pctl->base))
 		return PTR_ERR(pctl->base);
 
-	pctl->map = devm_regmap_init_mmio(&pdev->dev, pctl->base, &regmap_config);
-	if (IS_ERR(pctl->map))
-		return dev_err_probe(&pdev->dev, PTR_ERR(pctl->map),
-				     "Failed to create regmap\n");
-
 	for (i = 0; i < npins; i++) {
 		pins[i].number = i;
 		pins[i].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "PIN%u", i);
@@ -522,6 +532,7 @@ static int apple_gpio_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id apple_gpio_pinctrl_of_match[] = {
+	{ .compatible = "apple,t8140-pinctrl", },
 	{ .compatible = "apple,t8103-pinctrl", },
 	{ .compatible = "apple,pinctrl", },
 	{ }

-- 
2.55.0


