Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D7AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRJYXoqWCiZ6ApNEThTWgx3+Cj7z8E/TIwsvi5Pcnyo=; b=1kbJ+03Rke3x7l1Ph82DxzNDVR
	laRiW/+yoIo827hrPUogb2NEssBjGSpSkrX8EkMUZSokyECudWpEtEBOvdO4eSWmuOv1ArLktRBYu
	1xzypITlxEZKOYvYix3s+HRbnnzxJiclQhZpHs6tGOCQAVXTuk3OojcQG1O2v8by0LLxaTKdaC/x8
	OiBaAtjVSm/hnhqXOJvJmBD9f22hUHJQheDV2X6TC4ZUl21YdH2JXtd5NhT3PZ3Do8DBoNvpo55mG
	g0qVE93QWic2ZWSm1pV4dVqwBcm3kyfnbdDRo5mYOxitfPdhFpjJnhb9kdxfNSPeKuWUCHF6PY/nB
	0Y+SVB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC1Z-0000000EkSE-2Pve;
	Mon, 29 Jun 2026 13:27:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC1X-0000000EkQD-3nrx;
	Mon, 29 Jun 2026 13:27:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9563940561;
	Mon, 29 Jun 2026 13:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D0B1F000E9;
	Mon, 29 Jun 2026 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739663;
	bh=sRJYXoqWCiZ6ApNEThTWgx3+Cj7z8E/TIwsvi5Pcnyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n0ckMEDNYI3vfl11sh6myJdKtsPmw6j/S+5oU1JiNgB7S0rDcWyAhd6ptFauFBHmT
	 VqqmKk6bmTDwYN3/oD1x4iDxEeiSf4J/cbiRVWMkip/xETGZrP8vpzxUvsQYYWa5Te
	 Y5u6PwYaFoZRi6cCY5bq26SEvwgitBbAlRa55Wky/V4hEspwQYbQDGjIPP2B/XXQ4q
	 TBUHZR+5sZKDYq4dtVxS/7Q9atYdco29CCSA7f1+14EG1u1Cgd3rHHlD3rf9nP54EA
	 VN/iRji/EQD/uTEHZ6uGzg1lLTuMU42tJSMT2sb8RuLMFI3yLP5XbsvIvHY0hPwOae
	 0Q1U9yakmt6fg==
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
Subject: [PATCH 08/13] pcmcia: replace linux/gpio.h inclusions
Date: Mon, 29 Jun 2026 15:26:28 +0200
Message-Id: <20260629132633.1300009-9-arnd@kernel.org>
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

The pcmcia drivers all use the legacy interfaces, so convert to
include linux/gpio/legacy.h instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pcmcia/bcm63xx_pcmcia.c | 2 +-
 drivers/pcmcia/db1xxx_ss.c      | 2 +-
 drivers/pcmcia/sa1100_h3600.c   | 2 +-
 drivers/pcmcia/soc_common.c     | 2 +-
 drivers/pcmcia/xxs1500_ss.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pcmcia/bcm63xx_pcmcia.c b/drivers/pcmcia/bcm63xx_pcmcia.c
index 724fd6ee0fd0..1612b5d76975 100644
--- a/drivers/pcmcia/bcm63xx_pcmcia.c
+++ b/drivers/pcmcia/bcm63xx_pcmcia.c
@@ -14,7 +14,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 
 #include <bcm63xx_regs.h>
 #include <bcm63xx_io.h>
diff --git a/drivers/pcmcia/db1xxx_ss.c b/drivers/pcmcia/db1xxx_ss.c
index 7b896d7dbc9f..410d24762f13 100644
--- a/drivers/pcmcia/db1xxx_ss.c
+++ b/drivers/pcmcia/db1xxx_ss.c
@@ -23,7 +23,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/interrupt.h>
 #include <linux/pm.h>
 #include <linux/module.h>
diff --git a/drivers/pcmcia/sa1100_h3600.c b/drivers/pcmcia/sa1100_h3600.c
index 10cb99c20a7f..6c52d90795eb 100644
--- a/drivers/pcmcia/sa1100_h3600.c
+++ b/drivers/pcmcia/sa1100_h3600.c
@@ -11,7 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 
 #include <mach/hardware.h>
 #include <asm/irq.h>
diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index 87aa3f667117..23585e3968e9 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -32,8 +32,8 @@
 
 
 #include <linux/cpufreq.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/legacy.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
diff --git a/drivers/pcmcia/xxs1500_ss.c b/drivers/pcmcia/xxs1500_ss.c
index 8a8aae1843b5..ba1bd0f9d9f8 100644
--- a/drivers/pcmcia/xxs1500_ss.c
+++ b/drivers/pcmcia/xxs1500_ss.c
@@ -7,7 +7,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
-- 
2.39.5


