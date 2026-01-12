Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A10DD277CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wpyWG3e1lDsQa8sLwu/fUKiN93/d565uvAwmbrDv3I=; b=cTWHt4N1Zh/lB8xOzABUDfDxid
	fOhCGdqH2JnaIjY+UYvHLhY6fi33bk7OEWHzi6WD32eZo7OXBbA0XaIXa1/Zwu5V3S1sxKew+gGod
	+Og4Mu5PVy/dS6Nyxz+23Jhy8SJ4I8lnqPNuCbwHsJy1Nlo03m8M+cIizb2VpJgjfEwo0ofMbRzjv
	snApnmlJKJnWw0uLRr4HeVAA6n1vu+5qCrnvsh/TF634JJU72lEir9O3jWb0afRfki0w/Cj1FtR53
	M8s3hjlWAdinAOLsAA7vgeOZaXvay35crGaPPiDs31h2AG/NAa9CJIB2hJWI5naW4tq1dQE5tAAh8
	pg8cQQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfF2P-00000005A09-3kvG;
	Mon, 12 Jan 2026 10:20:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfF2M-000000059z1-2auX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 10:20:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3CEA6013B;
	Mon, 12 Jan 2026 10:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7033C19422;
	Mon, 12 Jan 2026 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768213237;
	bh=WWnghgC0Jz0OiXbwN46EbbbgdFAgu7nudgNQGDSyg2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p6avkOZ2I6hEdqO+JR71SqQYzwv9B8Nxy5CNrsJ/YEU9Ox+o00ghswhpZydPTMJW8
	 /hDgX8L719HlmNfPwlQZdmTuLYVJ1j/dyKaatqgSQQJSXHrUFajGrsdQG1fam9djQx
	 mNhwldSgMUrKTPWhv93V+OfYAOwVeNdSAIrjyl8c30cL4dV8bg1yRLUQGYY2aGNYdi
	 fjf2G/sK7Fj8Lz1sH52YERjCd+SXirxXaINrwwkq2k8wq9QbC15TU9CBScj8GsV1Pa
	 JBjOSaWohIoHkEnFtzhvgtH3PTWCCNm6S6wcPA1BdrZ28k8KcbGmnazjYaEj8F+WsG
	 QRgH9WTlgWKDg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 11:20:31 +0100
Subject: [PATCH v2 1/2] pinctrl: apple: Use unsigned int instead of
 unsigned
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-apple-req-gpio-func-v2-1-fbb91114e630@kernel.org>
References: <20260112-apple-req-gpio-func-v2-0-fbb91114e630@kernel.org>
In-Reply-To: <20260112-apple-req-gpio-func-v2-0-fbb91114e630@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
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

It is discouraged to use the ambiguous "unsigned" type, use
explicit unsigned int in the driver.

Reviewed-by: Sven Peter <sven@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index e1a7bc8cf765..a4161d59ab9f 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -102,9 +102,9 @@ static u32 apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
 static int apple_gpio_dt_node_to_map(struct pinctrl_dev *pctldev,
 				     struct device_node *node,
 				     struct pinctrl_map **map,
-				     unsigned *num_maps)
+				     unsigned int *num_maps)
 {
-	unsigned reserved_maps;
+	unsigned int reserved_maps;
 	struct apple_gpio_pinctrl *pctl;
 	u32 pinfunc, pin, func;
 	int num_pins, i, ret;
@@ -170,8 +170,8 @@ static const struct pinctrl_ops apple_gpio_pinctrl_ops = {
 
 /* Pin multiplexer functions */
 
-static int apple_gpio_pinmux_set(struct pinctrl_dev *pctldev, unsigned func,
-				 unsigned group)
+static int apple_gpio_pinmux_set(struct pinctrl_dev *pctldev, unsigned int func,
+				 unsigned int group)
 {
 	struct apple_gpio_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -202,7 +202,7 @@ static int apple_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int apple_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int apple_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
 	unsigned int reg = apple_gpio_get_reg(pctl, offset);

-- 
2.52.0


