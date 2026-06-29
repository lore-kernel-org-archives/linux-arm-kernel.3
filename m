Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4E0C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVU/cQLnaenh7G2gzskwzWByJ5M8lYz7G2KTZBNaXl0=; b=hHU03g2AElXHLmwifHijSBtGaq
	sfs1kR94gyQ1cW14xmgHBbw3ycsL8RfGUiR/hvBLiSt7uLvY/D5TNrJ9ClRJGVfr+SksK554Mmqol
	gm82qvS63H3ivLb4wWXvC5AHcaPFqWdiPJSMftB59V2W8zp0oek+XY1peFAzeyHp2BWQHx45Bm2Ls
	pE8AVlM9+0YhT78qVYLkZuOVe/dx0Vp8azW1RrESG1uuSeRX0YkZde8ucWOslsH38OzWpOpiz9Qda
	SIL+VgaVjdpQoKcRCZzQ0+063w4QscIKyLuP7mnlQ/rqekyqpkK2goe6yXfUM2P/1kYqjBiH88IKg
	z9YsLFog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC1T-0000000EkLR-0tdu;
	Mon, 29 Jun 2026 13:27:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC1R-0000000EkJi-1NFr;
	Mon, 29 Jun 2026 13:27:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE5C760008;
	Mon, 29 Jun 2026 13:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7A51F00A3A;
	Mon, 29 Jun 2026 13:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739656;
	bh=qVU/cQLnaenh7G2gzskwzWByJ5M8lYz7G2KTZBNaXl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W3XxLeAX94oAJwi6KccusZYNep78lyadH1eGcnGUUrL8zeW/m5ri9nxkqGDZRVcob
	 uG/2mwq0oEhrUpgvYlMUhA3Hn5e6ilprAecYZlavcYxGt6RxCLr6ZNWbi0lLGO7M8w
	 c6SLMjx6ofeUljl4HXzXKp883719e6wAMUAfKDx8R9PQuEFLSobHJ8ut89AIBVSa39
	 6N7miTIf1RiXSvruCB9D4e6uyU8ULFKrNz4Tnr1co4c9L3Vk1jsaW2gNYufFcgpvl4
	 WaJhLoivp0gvakiWmOrUevc7Ne1ZfGmIknu6R8MWz6qBGSe8WltGzyUuzHPzJ1TdF+
	 7naoLS346ECgg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
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
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 07/13] ASoC: replace linux/gpio.h inclusions
Date: Mon, 29 Jun 2026 15:26:27 +0200
Message-Id: <20260629132633.1300009-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org>
References: <20260629132633.1300009-1-arnd@kernel.org>
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

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/cs42l84.c | 2 +-
 sound/soc/codecs/cx2072x.c | 2 +-
 sound/soc/codecs/dmic.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..36c3abc21fed 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -16,7 +16,7 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
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
index 61e1bf1b3c9e..8b05d6f9b429 100644
--- a/sound/soc/codecs/dmic.c
+++ b/sound/soc/codecs/dmic.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
-- 
2.39.5


