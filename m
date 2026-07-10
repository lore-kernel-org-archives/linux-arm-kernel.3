Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002A2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwNxowD5uuBbhjfQk+9zd0mBet8xw7la0skrKYseTfw=; b=icdqK3eLeemqOpiZ3xz5SPzCCH
	HOrqaIfHTbAKh3ey5vU3SXTY6Jm410u9YjYirhG+V4/3zM9DzZ9tZBuLlHvQxVuLRJ5/n3AU8834c
	7w6ut/WNmDRZiBUW53GK72GkfuQFuWQUy2TtAu/5JKhtapOJTTAh/+iVif0LsZ5OiXa1ZS/5PTcL6
	HWzh2ntL8Ub3xEWTM/d26SNg/85ZmPabpOwk6fAfJWcftV8oQt+cajUAb8CXVxINA/uXtTMKk9757
	FuxB5nNz9eyYbKXRvM9QfK78tPvJwnnCUqp5THpDNBozmuK3bB2ZJQaUCU7amKdEtk54qzU7Ypx1h
	w6dCTGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIeM-00000005nzR-3gjy;
	Fri, 10 Jul 2026 21:20:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIeL-00000005ny3-3r2y;
	Fri, 10 Jul 2026 21:20:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A5D68408C5;
	Fri, 10 Jul 2026 21:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3D41F00A3D;
	Fri, 10 Jul 2026 21:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718445;
	bh=gwNxowD5uuBbhjfQk+9zd0mBet8xw7la0skrKYseTfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cLmFhLaiRrcNordDtbE/B2zTJwgf56UolNlWFNT94HtKr2hawMbTe+iAe38lmeORw
	 oSRw70qr+UZ3P7HefDzX/FJasfLiVhArCLyf86IEdoEsriQ9QqPkG+6JHtg1oA9bQn
	 2vQEKoGWP+3w5qm238rRiLkXcaqIu42K/MM5EeYDW82fOFNkVB7XB+/E8HhHI0zPgF
	 RSc9V5bQgj+4h39Un9sa0H9cX3FzaEY9loGrKHLgmcVbGjnqbZTMSJFH35X7LohZOA
	 WN7raLBTns+wJI3Nhz7bLoVPPKKyOvCQY7YIvC6QtNdxq0KkHAyOeIso5mgICK8YPZ
	 Qy3PeLkuRYcSA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 06/10] ASoC: replace linux/gpio.h inclusions
Date: Fri, 10 Jul 2026 23:19:51 +0200
Message-Id: <20260710211954.1373336-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710211954.1373336-1-arnd@kernel.org>
References: <20260710211954.1373336-1-arnd@kernel.org>
MIME-Version: 1.0
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

From: Arnd Bergmann <arnd@arndb.de>

linux/gpio.h is going away,s o use linux/gpio/consumer.h instead.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/cs42l84.c | 1 -
 sound/soc/codecs/cx2072x.c | 2 +-
 sound/soc/codecs/dmic.c    | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..f2448b4c11fc 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -16,7 +16,6 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 83c6cbd40804..0dd35fa86cc5 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -11,7 +11,7 @@
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
diff --git a/sound/soc/codecs/dmic.c b/sound/soc/codecs/dmic.c
index 61e1bf1b3c9e..cbed11136935 100644
--- a/sound/soc/codecs/dmic.c
+++ b/sound/soc/codecs/dmic.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
-- 
2.39.5


