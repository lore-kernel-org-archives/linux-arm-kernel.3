Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E967BC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=on3iHI9famPM1ZUoBiNVwNQrUJ05QTammhZ6dhBlT3s=; b=p9dbvv5W4H8SFEygonpXJuXK5a
	ozKgqus2R/kNn1oUDPOa7HULEhUJsbU2HF+zFgBo12n+AUyd3MX1HNeUAa1ULVTEiW0U/ZhQNcjya
	4u7wBsfysytsZuYaQK7imHFa0JzWhLDzVC/bWQH+cm3kmaq9o3ctY+IHMv+13GnC3lm7TkG8JkY7c
	7pXACy9mw9bo7NDsw+pz3SVx1s+z5HEJPpafg6I0CXHcQNTUkaoDmWtTp+t4vm2acWpywJcZKM0f9
	fsv53HR0SxGviN7V5947X7blLkF0CmM2+YjuYlzSBOTD4hXJj+q1u1vAsNSJtcsQp4EOwETK2MnrV
	HFC7eiJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCivt-0000000GOmD-0MMr;
	Wed, 07 May 2025 17:51:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiZB-0000000GLDt-3L0I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 17:28:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYz-0001Ey-DN; Wed, 07 May 2025 19:28:09 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYy-001axT-1v;
	Wed, 07 May 2025 19:28:08 +0200
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uCiYz-000ING-00;
	Wed, 07 May 2025 19:28:08 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Wed, 07 May 2025 19:28:01 +0200
Subject: [PATCH 1/2] gpio: TODO: add item about GPIO drivers reading struct
 gpio_chip::base
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-gpio-chip-base-readback-v1-1-ade56e38480b@pengutronix.de>
References: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
In-Reply-To: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 linux-gpio@vger.kernel.org, kernel@pengutronix.de, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_102821_840611_A57CE6B4 
X-CRM114-Status: GOOD (  14.25  )
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

drivers/pinctrl/pinctrl-at91.c uses struct gpio_chip::base to find out
which bit to set in a register:

  dev_dbg(npct->dev, "enable pin %u as GPIO\n", offset);

  mask = 1 << (offset - chip->base);

This adds a non-obvious dependency on the global numberspace from the
GPIO driver itself, even if all consumers use the descriptor API.

More such instances may exist and will need to be fixed in the quest for
removal of the global numberspace, so add a reminder about it to the
TODO list.

Link: https://lore.kernel.org/all/1d00c056-3d61-4c22-bedd-3bae0bf1ddc4@pengutronix.de/
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/gpio/TODO | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 4b70cbaa1caacdcc04044039782e86a7a44135c1..4a8b349f2483a91883c74b07a43efb1462dbd377 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -44,6 +44,13 @@ Work items:
   to a machine description such as device tree, ACPI or fwnode that
   implicitly does not use global GPIO numbers.
 
+- Fix drivers to not read back struct gpio_chip::base. Some drivers do
+  that and would be broken by attempts to poison it or make it dynamic.
+  Example in AT91 pinctrl driver:
+  https://lore.kernel.org/all/1d00c056-3d61-4c22-bedd-3bae0bf1ddc4@pengutronix.de/
+  This particular driver is also DT-only, so with the above fixed, the
+  base can be made dynamic (set to -1) if CONFIG_GPIO_SYSFS is disabled.
+
 - When this work is complete (will require some of the items in the
   following ongoing work as well) we can delete the old global
   numberspace accessors from <linux/gpio.h> and eventually delete

-- 
2.39.5


