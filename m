Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D47BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiMIaDHfHeDsg88B3aZLP5knyXdv30ZMibI6w8aJ4Hk=; b=MrEEg+EI0EB1VIp4z+bl1YXg5m
	QY2xX2Q5Q2z93NKbeZ5E313WjixQUFsYEx4MItTRVOaGHUHtNfUtGqnbn0wAlsBB+uqUKRclO8SZ3
	Z/KlrYa3yUGn6w3373fcQlJdxg3zUxr0bUrn6q+aFvCPvfea+YkkUpZHsS+DAoscCWa/ltWYtedmH
	UuBO6BAHFD46INjCRnGPcZh46cnoaU+a9F7YGJPmVAeJo6s+OcvR7zWMghtdEMJiQ2YK+vlpUybIT
	k6rZkRU4TXMCeeGkTEbigsI6aojFQrVnTKPCGo4F4ZAsgCoyaLLrmv0ItK5MpVl1gRdz/KzZaXAOQ
	z2s9Wulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIeU-00000005o8V-0g30;
	Fri, 10 Jul 2026 21:20:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIeS-00000005o66-3MpU;
	Fri, 10 Jul 2026 21:20:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F9156136D;
	Fri, 10 Jul 2026 21:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080DC1F000E9;
	Fri, 10 Jul 2026 21:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718452;
	bh=WiMIaDHfHeDsg88B3aZLP5knyXdv30ZMibI6w8aJ4Hk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m53mzAigYaO7ux+1bIOsaBGC8FpVnAoEKRZ7fa1oFXWLTRJqbHc9lZ7sOosOgski2
	 0gg8s4qWmhM1jR3HG8R1C8HyDoPokk/RkZ81iMZQnZBQrb+hyCKhgLJHXqpnLk4nDU
	 G8xyD5MVOSYGOKRTGFSXwKc9KVQjJaXjm/UhRoXkafmibn2cSLeagOY3gcrPZRcvev
	 Kg6AiP49Q+5gO0lGcU21Jp92VA5f/SHowubVX0797WfEB7ofMJk7C0iQvLB5lPyLJY
	 iX0bNtcGIBz+PS6nvtfzP7HEuYOW+6FBNuVTX/sZpAWzX/Ml88cK6TVNctrk5aDeo3
	 o07276wuF19gw==
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
Subject: [PATCH v2 07/10] pcmcia: replace linux/gpio.h inclusions
Date: Fri, 10 Jul 2026 23:19:52 +0200
Message-Id: <20260710211954.1373336-8-arnd@kernel.org>
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

The pcmcia drivers all use the legacy interfaces, so convert to
include linux/gpio/legacy.h instead.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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


