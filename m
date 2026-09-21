Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414BEC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 04:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cd4yiDs/SdyTtGPM7marJ1V5CVHzXfcbmCSx6q8NqUE=; b=2x0wpLAawKe5lQ6XywjxnsC23Q
	Sk7E8NVY6UNIIrmdHcsxcadPJxnBsmeCDBmerXy9hws7A+FcY1n+jZ0qjLn0xS6P+FLcbibSPBqTX
	NUPzP4yZwTOEibQboZ/KgK8lnm5TGyL0psAgmk3e07gWkWE8UaQKBmxAGRr0lBYKuTwtggJcL97or
	sW0i2m3y2KnsgDagqqX8s3Sm+R4X+d4Lo/qzIh6i9MwJzLvbvZhHuk77s7NFVxlsNZ/iyAcjWAZth
	8bgl1X/5zCo2ex/WkTceUfgsWxElteVamLoi1z7tNlkqVN619TINxG7usOlFIMtLQy2NdKlxau1pn
	EosI7Qgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8VZ6-00000000ob2-3ZGY;
	Mon, 21 Sep 2026 04:23:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8VYz-00000000oVD-2zUC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 04:23:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8B0B44A51;
	Mon, 21 Sep 2026 04:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96AF6C2BCFF;
	Mon, 21 Sep 2026 04:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789964612;
	bh=gVLLIDHjbMni5VoIW3Uu4KnGYFcqhuw0LoFOcrTkdTk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ODAkMBuq2GfUqTIyZBWh0GWwOaZOrNxpxlReyt6RQyuiBRamlFvboU4jccE3gdMmp
	 BVpIzf0MhmiOlQ5naICb1EJ9bC124SKk1WJhc9EKjLV5zETM1EFb2G/1j87cSBwabl
	 b7QxryX9I/5pD7VMZmEGl+2UlFUt4Ch/RzosZaA8b69+6zXTmi8D+Ymxcmx41HJMKw
	 YstOGx3NtXmKBpdiycfX01NpdiEVqUG8q8OAlTQ/drYntByeCSB7XvMnBD9qgBo2ca
	 mYjoQ1G4g8lgdsnu/VQVkHHwqdaRx53f2wykqY00FQBGb2+t7BG3JsG72NsU0ITQk1
	 cDvHHdy5Zc1hg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF10C982F4;
	Mon, 21 Sep 2026 04:23:32 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Mon, 21 Sep 2026 12:23:28 +0800
Subject: [PATCH v8 09/18] gpiolib: regmap: add gpio_regmap_get_chip()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-cv75-v5-v8-9-282ff5d98dda@ambarella.com>
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Long Zhao <zl020895@163.com>, Lee Jones <lee@kernel.org>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789964608; l=1405;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=cRhJj4Cmnrf+otvC27C8iAwNmJZQbquKFDy2qboyeNQ=;
 b=xlZYvrKjnFVcFpLds0vUYl/6sFDK38Bbl7y59QeayQws2YyeCYevlQXKOrV6SeYTdNPcO+CRG
 ztc9eLhtP9cDwNJ4nu/511CwNb1JR0ZD1va34zcQZLolhyIHV2lMqhM
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Let drivers that implement a custom irqchip retrieve the gpio_chip
after registration.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-regmap.c  | 6 ++++++
 include/linux/gpio/regmap.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index fbd4c753525a..21e0993b89e2 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -295,6 +295,12 @@ void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
 }
 EXPORT_SYMBOL_GPL(gpio_regmap_get_drvdata);
 
+struct gpio_chip *gpio_regmap_get_chip(struct gpio_regmap *gpio)
+{
+	return &gpio->gpio_chip;
+}
+EXPORT_SYMBOL_GPL(gpio_regmap_get_chip);
+
 /**
  * gpio_regmap_register() - Register a generic regmap GPIO controller
  * @config: configuration for gpio_regmap
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index d7ffc12b00a2..6bc00b9775a5 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -128,5 +128,6 @@ void gpio_regmap_unregister(struct gpio_regmap *gpio);
 struct gpio_regmap *devm_gpio_regmap_register(struct device *dev,
 					      const struct gpio_regmap_config *config);
 void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio);
+struct gpio_chip *gpio_regmap_get_chip(struct gpio_regmap *gpio);
 
 #endif /* _LINUX_GPIO_REGMAP_H */

-- 
2.34.1



