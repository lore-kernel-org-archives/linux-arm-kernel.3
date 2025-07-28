Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB53BC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 06:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JjSYGmuLm2Hp4MqcZuZg1hPjsmb4clQ4mOoZCeNonbs=; b=Xxh5jd1qVFcNfQdsJsGLtGIcNc
	0H2qpmO/gNS342KmvLqiGnTdO7plw8MLJztbQqEi5HR7vgj0FsSIqDmYIBkg6trPIiMzlb5FZ62pe
	0+7YXxpMVkszhwM7QLDxcq7gyxD948SX+jt3fjDQX+64xZenDfuS/0d7eC1BB3WXHAv+f0LpbZ8jw
	mm4EfB6HFNbG0JoynqTDKGBBaqJJzfJoXj8fMyOrECCVCMjLjBlM/MZVkXO1tZQJOQMlIL+N1jKqW
	K6wE7SIEHe2fv9BKC8hCenfTQWggweeiFhh6CFco5QOULnd3IyU196S9KmD2zPbzAj0l87Hhvrot+
	+mVvk2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHTR-0000000Dm9P-0HXL;
	Mon, 28 Jul 2025 06:36:37 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGzp-0000000Dj3m-1AoW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 06:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753682760; x=1785218760;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JjSYGmuLm2Hp4MqcZuZg1hPjsmb4clQ4mOoZCeNonbs=;
  b=LofuU/VHfvpWfdBITg/nqOQ+DigA1bAXSXHiOkAVyWIu50QFHGYDumye
   QnEdecu14vRW6ekWqaUe9vwakkfkbiST66GfK2eaZ29frdO6s0hiUdmnl
   us0WO4RVyCp68YtVemJu6ZM9KfX5zzm/Hie6+oZqcJJGnP0xwLtwgbKul
   lGaiq2Sa/XFQAg+ixRtFGE9Y0weiWCAQIm+dJSLil4YYnfTlY66wrjXZW
   QRB2UoY2FV9DuuOgm+zemyQ62+CNt2QRjRk8VyjJiLI/wzOPro8T8To5Q
   v5DiAy6X9TWtNiDLbQtuDCFCt6OzCVCqaLYfBVV8OHlkPzG7A0dlqfxGk
   Q==;
X-CSE-ConnectionGUID: LuVdxQooQWywzzukvPuoDg==
X-CSE-MsgGUID: tSUhUxs7SjGmYTS1cQrlpA==
X-IronPort-AV: E=Sophos;i="6.16,339,1744063200"; 
   d="scan'208";a="45440332"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Jul 2025 08:05:51 +0200
X-CheckPoint: {68871340-A-BB1FFBB0-EB2CC75E}
X-MAIL-CPID: 154A4088696352CA20E2E8C7001DE7E1_2
X-Control-Analysis: str=0001.0A002106.6887134A.008B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A938E16568B;
	Mon, 28 Jul 2025 08:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753682747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JjSYGmuLm2Hp4MqcZuZg1hPjsmb4clQ4mOoZCeNonbs=;
	b=oh9g3DYI0g2Ihh111neIBiKYeOBcsinYlR9XMSILJwIObcOmA5eB3dYyvC8wwLQxrDbq5q
	TDue0UOUfjc6qvBGVcpfGQgRoOaUUuApM6qp8u3XV0kbAO2WWKa/Ojo1jsb5kvPSaGyTZ3
	FqEyJ8MZSkrwvEnl8RTD+2BwN/dKWwhzXWOKWJ5TNOi/onxB89OGjv/hZg0yeZtHolvYXD
	Rm3GkSeNmxHLodTJx4tZ9b9IJvZ2tLmKuSV7Y+bUeJMOUTYdByPimye8d5m/OL0u9VR9sc
	7jW5b8QXdC8A2WhFUr0LOs9IlmSmltBoUsvoUGHO6adfBJxN35gDfR9m6C3v0g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/1] gpio: stmpe: Allow to compile as a module
Date: Mon, 28 Jul 2025 08:05:43 +0200
Message-ID: <20250728060544.18169-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_230601_804941_21CFDF20 
X-CRM114-Status: GOOD (  13.92  )
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

Add the necessary boilerplate to also make this driver modular.
Keep the subsys_initcall to not change registration order for built-in.
Also add OF match table for module autoloading.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Do not touch subsys_initcall
* Add module_exit instead
* Adjust commit message

 drivers/gpio/Kconfig      |  2 +-
 drivers/gpio/gpio-stmpe.c | 20 ++++++++++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 500d839f65ee8..0621832d045fa 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1559,7 +1559,7 @@ config GPIO_SL28CPLD
 	  called gpio-sl28cpld.
 
 config GPIO_STMPE
-	bool "STMPE GPIOs"
+	tristate "STMPE GPIOs"
 	depends on MFD_STMPE
 	depends on OF_GPIO
 	select GPIOLIB_IRQCHIP
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 0a270156e0bea..97d6c4f98eaf7 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -534,10 +534,16 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(dev, &stmpe_gpio->chip, stmpe_gpio);
 }
 
+static const struct of_device_id stmpe_gpio_of_matches[] = {
+	{ .compatible = "st,stmpe-gpio", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, stmpe_gpio_of_matches);
+
 static struct platform_driver stmpe_gpio_driver = {
 	.driver = {
-		.suppress_bind_attrs	= true,
-		.name			= "stmpe-gpio",
+		.name = "stmpe-gpio",
+		.of_match_table = stmpe_gpio_of_matches,
 	},
 	.probe		= stmpe_gpio_probe,
 };
@@ -547,3 +553,13 @@ static int __init stmpe_gpio_init(void)
 	return platform_driver_register(&stmpe_gpio_driver);
 }
 subsys_initcall(stmpe_gpio_init);
+
+static void __exit stmpe_gpio_exit(void)
+{
+	platform_driver_unregister(&stmpe_gpio_driver);
+}
+module_exit(stmpe_gpio_exit);
+
+MODULE_DESCRIPTION("STMPE expander GPIO");
+MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0


