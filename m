Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5E6C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJ4maxiAXobdPO+NS6v/OujD2A0IbSgp/KMy9aEd41M=; b=IBkfTDd1vy4zYnPPCcrRDW04BO
	+n3TWMRvGoJMgA4jFdi+2vHjAaawBho2WM9DWWEY26ASNl//eNbo5nSyb9gLkYSoBWfiTW3jaVDfW
	TLeh1sCyZNa8jknPONCVrgs0MmEzIQMDf+Ju8tI6MiR+PwunOJqiPc2ed1HHMsGHBOGOkujZ7Mr2j
	VoxMMT/fixQVXzUy37B65fsaffK7mP/hiQFjsBQH4CK3upQ8yLtXKYTC2yHbPvdPvLePkJAk638Jz
	siaY9qa2tWjiIYvNdnLN/oKjuhSrz5gR/0xErWpE7w8jFjBRAjDEvon1pT5mAwUXenGQMfPA6iYeZ
	BvkvHhZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC0t-0000000Ejor-2AVm;
	Mon, 29 Jun 2026 13:27:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC0s-0000000Ejnx-0IPf;
	Mon, 29 Jun 2026 13:27:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A423E42B71;
	Mon, 29 Jun 2026 13:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BAC1F000E9;
	Mon, 29 Jun 2026 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739621;
	bh=gJ4maxiAXobdPO+NS6v/OujD2A0IbSgp/KMy9aEd41M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W6BP/j9N3GBFGPNigPrWAIbO/5nFDLZKX/6xwWXCjCmGhCj6ArmnL8YaJPj9gS5wF
	 aGTzjEE20dtij3g3R+fUalNIcOfpKF2XbWBnq3dYuE6JYCS0w07Tqt87yunavUwBOT
	 W7G/QPhzqgqU9vmTJl/qfELGhqSD0syCs863CqZk6RaFACSODBgl5VObZNTNmB/YeW
	 7YOElEXVRTbynXC+mNchNlK6pipG/cMpc1sfSf1bpbY4wr0G2gDaPt32O7l0GIVDA1
	 18KsNmI9TxTvS3iwOH1d7qnESZR9uheZvkXM93Rr9VcL+qoICw5cmRG+nXk52msfOU
	 ep2bttKM+1R7A==
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
Subject: [PATCH 02/13] m68k/coldfire: replace linux/gpio.h inclusions
Date: Mon, 29 Jun 2026 15:26:22 +0200
Message-Id: <20260629132633.1300009-3-arnd@kernel.org>
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
linux/gpio/legacy.h for coldfire.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/coldfire/device.c     | 2 +-
 arch/m68k/include/asm/mcfgpio.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
index 1420bae0964f..9a0258acd998 100644
--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -12,7 +12,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/spi/spi.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/fec.h>
 #include <linux/dmaengine.h>
 #include <asm/traps.h>
diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
index 7103cfa4edb6..29726aa40eb6 100644
--- a/arch/m68k/include/asm/mcfgpio.h
+++ b/arch/m68k/include/asm/mcfgpio.h
@@ -16,7 +16,7 @@ int __mcfgpio_request(unsigned gpio);
 void __mcfgpio_free(unsigned gpio);
 
 #ifdef CONFIG_GPIOLIB
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #else
 
 /* our alternate 'gpiolib' functions */
-- 
2.39.5


