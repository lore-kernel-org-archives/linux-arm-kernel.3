Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98628C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=agk6Lq9Q7fhqJWnKZOxx+JzowUA5NVdPlMIz6yfgy2s=; b=UivQX9u0xb1G3clUraKycBidNb
	MZTXT82OjzisG9OuQZXrA9/AC2vhd6/Tw0LkE0K/YWJ249VOE9CbwPy2nhnG9IZtw1pAGOSOHGR2i
	gKDc9IFcS0pGLppT8Cut/Ha1wjtjej9F5gCJmSj15j/XeiqX/MPtZBy6Nu2xza9NBwndIktFtkIi0
	VzcZS8pLUUvMA2d+X9kUoe/7N7elrXLEChvdmy9/KUTPuzbfnzTfj0NedSA0QyVIpBrIIemZ+tbaW
	WDfjw2W6JlNCBIwB6laZXS5z189NFGhZbiwnsFHl5fgcr2hLqqTqkNvpnOFqoQEuBmiFHwxmDuQbo
	r8ETN/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIdk-00000005nN5-41x0;
	Fri, 10 Jul 2026 21:20:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIdj-00000005nMZ-2yGJ;
	Fri, 10 Jul 2026 21:20:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C18F40A64;
	Fri, 10 Jul 2026 21:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CA51F000E9;
	Fri, 10 Jul 2026 21:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718407;
	bh=agk6Lq9Q7fhqJWnKZOxx+JzowUA5NVdPlMIz6yfgy2s=;
	h=From:To:Cc:Subject:Date;
	b=Je40zX7QlpMeFEPJVqCFBAV+vhEbKCArebze1sibQKk68QkYbo5IXzDFLjZN4MDFs
	 yPiia0yZyhPOfiFyDjEpkb9DOy1lnXc7C3Y+Rc4B/0ujUEO3jQx8zUiDfhbEAlKgSM
	 uYw89aNGq3fhRC845RxWxZ/uTPkbCLr1iHKz/xc1EOMmOIYOXY3xQi1koaOIsdG8GE
	 yXxHisf8/ajQb0ZmXIcvR5U+Qw/WM9SA0WVx/uCpxtJPqIkyvTroDqFv4hRnRBlw1d
	 mTSqK1nbv+SmOuXHkNM3hNrlDoZAT6gwt4MXVj8hkjGmGZ726g/u8FFWX/yCrF8RlU
	 +7z7k2VTdnYYQ==
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
	linux-sound@vger.kernel.org
Subject: [PATCH v2 00/10] treewide: replace linux/gpio.h
Date: Fri, 10 Jul 2026 23:19:45 +0200
Message-Id: <20260710211954.1373336-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The linux/gpio.h header used to be the global definition for the gpio
interfaces, with 1100 users back in linux-3.17. In linux-7.2, only about
130 of those remain, so this series cleans out the rest.

In each subsystem, we can replace the header either with
linux/gpio/consumer.h for users of the modern gpio descriptor interface,
or linux/gpio/legacy.h for the few remaining users of the old number
based interface.

All patches in this series can get applied independently, so my
preference would be for each subsystem maintainer to apply these
directly, with the rest going into the gpio tree at some point.

I've uploaded this to 

   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/ config-gpio-legacy-for-7.3

      Arnd


v2: dropped two already applied patches,
    removed duplicate includes,
    dropped final patch to remove linux/gpio.h as it now depends
    on patches in linux-next

 arch/arm/mach-davinci/da850.c                       | 2 +-
 arch/arm/mach-dove/mpp.c                            | 2 +-
 arch/arm/mach-mv78xx0/buffalo-wxl-setup.c           | 2 +-
 arch/arm/mach-mv78xx0/irq.c                         | 2 +-
 arch/arm/mach-mv78xx0/mpp.c                         | 2 +-
 arch/arm/mach-mvebu/pm.c                            | 2 +-
 arch/arm/mach-mxs/mach-mxs.c                        | 2 +-
 arch/arm/mach-orion5x/board-d2net.c                 | 2 +-
 arch/arm/mach-orion5x/board-rd88f5182.c             | 2 +-
 arch/arm/mach-orion5x/dns323-setup.c                | 2 +-
 arch/arm/mach-orion5x/irq.c                         | 2 +-
 arch/arm/mach-orion5x/kurobox_pro-setup.c           | 2 +-
 arch/arm/mach-orion5x/mv2120-setup.c                | 2 +-
 arch/arm/mach-orion5x/net2big-setup.c               | 2 +-
 arch/arm/mach-orion5x/terastation_pro2-setup.c      | 2 +-
 arch/arm/mach-orion5x/ts209-setup.c                 | 2 +-
 arch/arm/mach-orion5x/ts409-setup.c                 | 2 +-
 arch/arm/mach-pxa/am200epd.c                        | 2 +-
 arch/arm/mach-pxa/am300epd.c                        | 2 +-
 arch/arm/mach-pxa/generic.c                         | 2 +-
 arch/arm/mach-pxa/gumstix.c                         | 2 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c                      | 2 +-
 arch/arm/mach-pxa/pxa25x.c                          | 2 +-
 arch/arm/mach-pxa/pxa27x.c                          | 2 +-
 arch/arm/mach-pxa/reset.c                           | 2 +-
 arch/arm/mach-pxa/sharpsl_pm.c                      | 2 +-
 arch/arm/mach-pxa/spitz.c                           | 2 +-
 arch/arm/mach-pxa/spitz_pm.c                        | 2 +-
 arch/arm/mach-s3c/dev-audio-s3c64xx.c               | 2 +-
 arch/arm/mach-s3c/devs.c                            | 2 +-
 arch/arm/mach-s3c/mach-crag6410.c                   | 2 +-
 arch/arm/mach-s3c/pm-gpio.c                         | 2 +-
 arch/arm/mach-s3c/pm-s3c64xx.c                      | 2 +-
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c          | 2 +-
 arch/arm/mach-s3c/setup-i2c0-s3c64xx.c              | 2 +-
 arch/arm/mach-s3c/setup-i2c1-s3c64xx.c              | 2 +-
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c            | 2 +-
 arch/arm/mach-s3c/setup-sdhci-gpio-s3c64xx.c        | 2 +-
 arch/arm/mach-s3c/setup-spi-s3c64xx.c               | 2 +-
 arch/arm/mach-sa1100/collie.c                       | 2 +-
 arch/arm/mach-sa1100/generic.c                      | 2 +-
 arch/arm/mach-sa1100/h3600.c                        | 2 +-
 arch/arm/mach-sa1100/h3xxx.c                        | 2 +-
 arch/arm/plat-orion/mpp.c                           | 2 +-
 arch/m68k/coldfire/device.c                         | 2 +-
 arch/m68k/include/asm/mcfgpio.h                     | 2 +-
 arch/mips/alchemy/board-xxs1500.c                   | 2 +-
 arch/mips/alchemy/devboards/db1000.c                | 2 +-
 arch/mips/alchemy/devboards/db1200.c                | 2 +-
 arch/mips/alchemy/devboards/db1550.c                | 2 +-
 arch/mips/bcm47xx/workarounds.c                     | 2 +-
 arch/mips/bcm63xx/boards/board_bcm963xx.c           | 1 +
 arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h | 2 +-
 arch/mips/txx9/rbtx4927/setup.c                     | 2 +-
 arch/sh/boards/board-magicpanelr2.c                 | 2 +-
 arch/sh/boards/board-sh7757lcr.c                    | 2 +-
 arch/sh/boards/board-urquell.c                      | 2 +-
 arch/sh/boards/mach-ap325rxa/setup.c                | 2 +-
 arch/sh/boards/mach-ecovec24/setup.c                | 2 +-
 arch/sh/boards/mach-highlander/pinmux-r7785rp.c     | 2 +-
 arch/sh/boards/mach-kfr2r09/lcd_wqvga.c             | 2 +-
 arch/sh/boards/mach-kfr2r09/setup.c                 | 2 +-
 arch/sh/boards/mach-migor/lcd_qvga.c                | 2 +-
 arch/sh/boards/mach-migor/setup.c                   | 2 +-
 arch/sh/boards/mach-rsk/devices-rsk7203.c           | 2 +-
 arch/sh/boards/mach-rsk/devices-rsk7269.c           | 1 -
 arch/sh/boards/mach-se/7724/setup.c                 | 2 +-
 arch/sh/include/mach-common/mach/magicpanelr2.h     | 2 --
 arch/sh/kernel/cpu/sh4a/setup-shx3.c                | 2 +-
 drivers/gpib/gpio/gpib_bitbang.c                    | 1 -
 drivers/input/keyboard/matrix_keypad.c              | 1 -
 drivers/mfd/aat2870-core.c                          | 2 +-
 drivers/mfd/arizona-irq.c                           | 2 +-
 drivers/mfd/lp3943.c                                | 2 +-
 drivers/mfd/sm501.c                                 | 2 +-
 drivers/mfd/tps6105x.c                              | 2 +-
 drivers/mfd/tps65911-comparator.c                   | 2 +-
 drivers/mfd/wm8994-irq.c                            | 2 +-
 drivers/pcmcia/bcm63xx_pcmcia.c                     | 2 +-
 drivers/pcmcia/db1xxx_ss.c                          | 2 +-
 drivers/pcmcia/sa1100_h3600.c                       | 2 +-
 drivers/pcmcia/soc_common.c                         | 2 +-
 drivers/pcmcia/xxs1500_ss.c                         | 2 +-
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c           | 1 -
 drivers/phy/rockchip/phy-rockchip-usbdp.c           | 2 +-
 drivers/phy/ti/phy-j721e-wiz.c                      | 1 -
 include/linux/mfd/lp3943.h                          | 2 +-
 include/linux/mfd/ti-lmu.h                          | 1 -
 include/linux/mfd/tps65910.h                        | 2 +-
 include/linux/mfd/ucb1x00.h                         | 2 +-
 sound/soc/codecs/cs42l84.c                          | 1 -
 sound/soc/codecs/cx2072x.c                          | 2 +-
 sound/soc/codecs/dmic.c                             | 1 -
 93 files changed, 84 insertions(+), 93 deletions(-)

-- 
2.39.5

Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: "Rafał Miłecki" <zajec5@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-phy@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-sound@vger.kernel.org

