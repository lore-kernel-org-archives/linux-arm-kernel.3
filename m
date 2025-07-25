Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298EDC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 05:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iuVSHOikXhu/wYVbuNONjAFSRY2ql17gzgRLIzRC3Ng=; b=WkGrX5dTrWTzOe1jklHS96S2Rh
	G/9/MKW43/PpYteC2fu3lcnj8x0MHxI+XuVFJRUDhV8Cyyx2jdcF6j7FBLjioIgst3VIXEUWPK+6G
	6WBCRTk646RU1xBW9wWWfW/qUL/zTcAkAEJeoXzBGVKoOvh87gaPbGfQONcncrD0LKC4HuKvGVGjH
	RI9uZhkNDb8b6qjiYTCTx+kfZrhgrjppUzA+TifQc5rygUvbh3bimj3kytvKtq5T7MUwdiQfmDK0o
	v+dWopJ7/FkQ837b6/M55F1mYngQqRZL7QB0qyv7Oqb8heh2tryjZGmIcAj6t6CzAJcbiQeQvxg2q
	ZZjBr6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBOg-000000097Jc-2guN;
	Fri, 25 Jul 2025 05:55:10 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBMA-0000000976F-3c2i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 05:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753422754; x=1784958754;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iuVSHOikXhu/wYVbuNONjAFSRY2ql17gzgRLIzRC3Ng=;
  b=NhWuRQi4l5IC01BjxHH1Uyru4uyZkFLmzKFsKxYFpa3hLQe5Is3ZUo4B
   wQ59Xm056WHv3CaGLamFCarMnFUFeWm4vh0xf/hU/pZ7XITO6KvYcc8t/
   WD11AM+TE0eyIRSa5PEHsAi0UQSKylzSXJsII00ZIwk5MPwTd07b5L3Px
   ZM2mek2YsGFmLRqYLuuRObdnnBDmCSagVygXsnQd3MO0ok6OYmrqeGd6V
   m6Ps8AdZn6C1npFFaUCV6g+yY8geJbvaOCGm1bY7igZhDIEhXU5sExXOv
   oB2FRCiB/QpLOTYlU6P4nOVSTF0A+mZ40WdHQ1V9whumEov1+tsWfS8S4
   w==;
X-CSE-ConnectionGUID: CnGdkg3lRoyewLU0Ay8xYw==
X-CSE-MsgGUID: 1gFfGMw+QYmLb3/VB/qSIw==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45412473"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 07:52:29 +0200
X-CheckPoint: {68831B9C-2D-4FC15ADB-CD71293B}
X-MAIL-CPID: 1D1F9231A91F7DBFBC957FFF256F8A75_0
X-Control-Analysis: str=0001.0A002103.68831BC0.0008,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5047C1682BB;
	Fri, 25 Jul 2025 07:52:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753422744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iuVSHOikXhu/wYVbuNONjAFSRY2ql17gzgRLIzRC3Ng=;
	b=oyzKEkx25B9P597urr/TQ4CGH0UThu7GbikqokVj9ixGHld5Sl+b1OgdtBB3sibD42o1EQ
	jTcdrSyJJEtMNTgoL3/DXrMVMjZ8eU2v3rq8RomCd/bCTeXs4wrJFD01qcQ5sDdKNF3Uql
	870iPX/fQoStQFzarajnlqh3tt4kxhhAsuwfekVfT00Tfq9gGrY6jMp/ACw/QB6rbmP9Gj
	9wawEB+ZJQiFh8z1inVKvzSaj+c59NVH2CENc6SsNriYhoVEo3Li2j3agO1ovmRGpUInI7
	oXr6/5ynsVBeoLQ9tdrF/11SFSYRa2AAlDRqzQb9sMl2PSIYkMCGY/VQ7m/+Tg==
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
Subject: [PATCH 1/1] gpio: stmpe: Allow to compile as a module
Date: Fri, 25 Jul 2025 07:52:20 +0200
Message-ID: <20250725055221.258501-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_225235_401329_B5A6593E 
X-CRM114-Status: GOOD (  13.09  )
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
This follows commit a2b8191ab695a ("pwm: stmpe: Allow to compile as a
module") which does the same for pwm. Also add OF match table for module
autoloading.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpio/Kconfig      |  2 +-
 drivers/gpio/gpio-stmpe.c | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 9 deletions(-)

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
index 0a270156e0bea..db9f4cd1e8615 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -534,16 +534,19 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
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
-	.probe		= stmpe_gpio_probe,
 };
+module_platform_driver_probe(stmpe_gpio_driver, stmpe_gpio_probe);
 
-static int __init stmpe_gpio_init(void)
-{
-	return platform_driver_register(&stmpe_gpio_driver);
-}
-subsys_initcall(stmpe_gpio_init);
+MODULE_DESCRIPTION("STMPE expander GPIO");
+MODULE_LICENSE("GPL");
-- 
2.43.0


