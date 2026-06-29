Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B37AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZjvdwSdJ07ba044RbmZ4lMBBWJONpd196bqsB07784=; b=ug1yXsCZkWarmMX6vPZz6nyq2u
	wBlEmlERzxb5jNRTT6n4GKy9P48rFBQt0Kn0uWt5mQhBoVqI9Koh/QwYzNTI+fQyKVDIYEykESkN4
	5Qj3JNMffW/c7HXMpVJu1BstzXuCDltYz1YoGas7j9DcErG6kUWosFNbV1RlV1z4qVNHPL/J1pQS2
	8vfPHvmrbGhSZy0fKGRn3msvHV4SmYPNZj+sINCXrHTV6733clOzAlhSXF62LwZhrAgDFG8WFc/pV
	P1Hm2GXbtv4x+H7AQiaP7xE8cx9NFSgexJHzWzOgLzCZXBxf/WuVo3c5cr2KSD8jtuaw6KGS3Hza2
	1PfvSO9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC1n-0000000Ekfk-0jMk;
	Mon, 29 Jun 2026 13:27:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC1l-0000000Eke6-3zbd;
	Mon, 29 Jun 2026 13:27:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6F3941B4D;
	Mon, 29 Jun 2026 13:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4591F000E9;
	Mon, 29 Jun 2026 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739677;
	bh=0ZjvdwSdJ07ba044RbmZ4lMBBWJONpd196bqsB07784=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TZSmSeEL8sgvKsxzLVBT5TAIjiq50BaPGDH7s6aEVKHGJRfuuPn4I/iMdFZDjO53s
	 jqFhtjgdtyqoLwVzS4xubyYSELpN36RhrBRpwJo8DQkOgWrrOPC+z26qkMypse9F5k
	 JeSFvd8+QvoAjI4e1Adm9VOXH218T6FSYJ+f0PJr+Un77+NcEmdFFDtWjbIW0XjWJL
	 HqFuYsCmeYlDnygLpo1DE4N4k7c710ECsxCTB4zSt8LxG2F8o5RGv1WoM63YONijSy
	 V9+fsbUjy3dn8OowicDs5tvTDj4qE5Ymu09oumTTMON9uiDZ6FQY5x//Ts+fT2oR8n
	 KW1WQ8U7hPrhg==
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
Subject: [PATCH 10/13] media: replace linux/gpio.h inclusions
Date: Mon, 29 Jun 2026 15:26:30 +0200
Message-Id: <20260629132633.1300009-11-arnd@kernel.org>
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

linux/gpio.h should no longer be used, convert these instead to
either linux/gpio/consumer.h or linux/gpio/legacy.h as needed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/pci/ddbridge/ddbridge.h                 | 2 +-
 drivers/media/platform/samsung/s3c-camif/camif-core.c | 2 +-
 drivers/media/usb/em28xx/em28xx-dvb.c                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/ddbridge/ddbridge.h b/drivers/media/pci/ddbridge/ddbridge.h
index f01ecdb0b627..cf50898f9a92 100644
--- a/drivers/media/pci/ddbridge/ddbridge.h
+++ b/drivers/media/pci/ddbridge/ddbridge.h
@@ -14,7 +14,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dvb/ca.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index 221e3c447f36..c3d059224844 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -12,7 +12,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/errno.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index 938f1980d448..8482fc4045ea 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -29,7 +29,7 @@
 #include <media/dmxdev.h>
 #include <media/tuner.h>
 #include "tuner-simple.h"
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 
 #include "lgdt330x.h"
 #include "lgdt3305.h"
-- 
2.39.5


