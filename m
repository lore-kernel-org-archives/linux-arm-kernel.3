Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA58C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fhZO9CCgyPTpV3ZQrTdwjnuLM+E9OikVfMuSHmZTx2M=; b=3OOARyYfnV5Gj0RyytmcWyD9HY
	kYTCfNK/B0orrfFGJOcjomCsHcMkLuDAklnjgflPSrd6bsWLeTo5pqonXB3OdIRiVMi6zdHBlc7G2
	gL/cSuxCxD1l7Z7Ne+6dCPjvYgKu2LShSKkqUpxtHGMSqdciiuT+fr2GMCHcGEaXbSI9nmbse1+jB
	ETGQ2l3SQpgz4GfcuxYIlWLnjyqPCUtiXA0EmC6ZXwVoouuVYHSXi/m0nyLcafTWRtogNTX3dGbro
	5yIWy9P+gFVVFM9yuv0K0waJXcPBdBkcIEMoXj09lEJqF3TeWMj3Kmwp6QJ+C8lOE+aRx2e8jPntU
	27gLutiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC0g-0000000Ejhe-2gp8;
	Mon, 29 Jun 2026 13:26:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weC0f-0000000EjhH-0QZG;
	Mon, 29 Jun 2026 13:26:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D85BE600AA;
	Mon, 29 Jun 2026 13:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F74D1F000E9;
	Mon, 29 Jun 2026 13:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739607;
	bh=fhZO9CCgyPTpV3ZQrTdwjnuLM+E9OikVfMuSHmZTx2M=;
	h=From:To:Cc:Subject:Date;
	b=KD4wn8FGWGE30eCOOOA+dBSAHZGgiXwZF29kfKE4F2uQuFsP5YxhKF+kJLGZQW+xN
	 c1FQZuucS/z/TV0fUUP3z4XSiOfaV3yT+/2dhnHni5ghGczyBnpiiVQ4ssE+H6KI6m
	 MB5KQA2l+xKim04AISyQhaPf4EpWJZCa1m2px2f9EeLMQklyKDL02qd8dJNCvthmg8
	 6PFfsK+SnbxyFSGpVQU5s9PrLcj+ipaSFtc1VHy+j8TWTBJDs/nEBBWvwVfu9LYai2
	 5NMag8oZZwUnP9IBEXZ+74fbYASdIvn/nsUwGvCqlg0YWSzWL9DSAQY7zE04B/0xQI
	 Auc5QmUPHo7UQ==
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
Subject: [PATCH 00/13] treewide: replace linux/gpio.h
Date: Mon, 29 Jun 2026 15:26:20 +0200
Message-Id: <20260629132633.1300009-1-arnd@kernel.org>
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

The final patch here obviously needs to wait for all the others
to get merged first.

      Arnd

Arnd Bergmann (13):
  ARM: replace linux/gpio.h inclusions
  m68k/coldfire: replace linux/gpio.h inclusions
  mips: replace linux/gpio.h inclusions
  sh: replace linux/gpio.h inclusions
  mfd: replace linux/gpio.h inclusions
  [net-next] net: replace linux/gpio.h inclusions
  ASoC: replace linux/gpio.h inclusions
  pcmcia: replace linux/gpio.h inclusions
  phy: replace linux/gpio.h inclusions
  media: replace linux/gpio.h inclusions
  Input: matrix_keyboard - replace linux/gpio.h inclusion
  gpib: gpio: replace linux/gpio.h inclusion
  gpiolib: remove linux/gpio.h

 MAINTAINERS                                   |  1 -
 arch/arm/mach-davinci/da850.c                 |  2 +-
 arch/arm/mach-dove/mpp.c                      |  2 +-
 arch/arm/mach-mv78xx0/buffalo-wxl-setup.c     |  2 +-
 arch/arm/mach-mv78xx0/irq.c                   |  2 +-
 arch/arm/mach-mv78xx0/mpp.c                   |  2 +-
 arch/arm/mach-mvebu/pm.c                      |  2 +-
 arch/arm/mach-mxs/mach-mxs.c                  |  2 +-
 arch/arm/mach-orion5x/board-d2net.c           |  2 +-
 arch/arm/mach-orion5x/board-rd88f5182.c       |  2 +-
 arch/arm/mach-orion5x/dns323-setup.c          |  2 +-
 arch/arm/mach-orion5x/irq.c                   |  2 +-
 arch/arm/mach-orion5x/kurobox_pro-setup.c     |  2 +-
 arch/arm/mach-orion5x/mv2120-setup.c          |  2 +-
 arch/arm/mach-orion5x/net2big-setup.c         |  2 +-
 .../arm/mach-orion5x/terastation_pro2-setup.c |  2 +-
 arch/arm/mach-orion5x/ts209-setup.c           |  2 +-
 arch/arm/mach-orion5x/ts409-setup.c           |  2 +-
 arch/arm/mach-pxa/am200epd.c                  |  2 +-
 arch/arm/mach-pxa/am300epd.c                  |  2 +-
 arch/arm/mach-pxa/generic.c                   |  2 +-
 arch/arm/mach-pxa/gumstix.c                   |  2 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c                |  2 +-
 arch/arm/mach-pxa/pxa25x.c                    |  2 +-
 arch/arm/mach-pxa/pxa27x.c                    |  2 +-
 arch/arm/mach-pxa/reset.c                     |  2 +-
 arch/arm/mach-pxa/sharpsl_pm.c                |  2 +-
 arch/arm/mach-pxa/spitz.c                     |  2 +-
 arch/arm/mach-pxa/spitz_pm.c                  |  2 +-
 arch/arm/mach-s3c/dev-audio-s3c64xx.c         |  2 +-
 arch/arm/mach-s3c/devs.c                      |  2 +-
 arch/arm/mach-s3c/mach-crag6410.c             |  2 +-
 arch/arm/mach-s3c/pm-gpio.c                   |  2 +-
 arch/arm/mach-s3c/pm-s3c64xx.c                |  2 +-
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c    |  2 +-
 arch/arm/mach-s3c/setup-i2c0-s3c64xx.c        |  2 +-
 arch/arm/mach-s3c/setup-i2c1-s3c64xx.c        |  2 +-
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c      |  2 +-
 arch/arm/mach-s3c/setup-sdhci-gpio-s3c64xx.c  |  2 +-
 arch/arm/mach-s3c/setup-spi-s3c64xx.c         |  2 +-
 arch/arm/mach-sa1100/collie.c                 |  2 +-
 arch/arm/mach-sa1100/generic.c                |  2 +-
 arch/arm/mach-sa1100/h3600.c                  |  2 +-
 arch/arm/mach-sa1100/h3xxx.c                  |  2 +-
 arch/arm/plat-orion/mpp.c                     |  2 +-
 arch/m68k/coldfire/device.c                   |  2 +-
 arch/m68k/include/asm/mcfgpio.h               |  2 +-
 arch/mips/alchemy/board-xxs1500.c             |  2 +-
 arch/mips/alchemy/devboards/db1000.c          |  2 +-
 arch/mips/alchemy/devboards/db1200.c          |  2 +-
 arch/mips/alchemy/devboards/db1550.c          |  2 +-
 arch/mips/bcm47xx/workarounds.c               |  2 +-
 arch/mips/bcm63xx/boards/board_bcm963xx.c     |  1 +
 .../include/asm/mach-bcm63xx/board_bcm963xx.h |  2 +-
 arch/mips/txx9/rbtx4927/setup.c               |  2 +-
 arch/sh/boards/board-magicpanelr2.c           |  2 +-
 arch/sh/boards/board-sh7757lcr.c              |  2 +-
 arch/sh/boards/board-urquell.c                |  2 +-
 arch/sh/boards/mach-ap325rxa/setup.c          |  2 +-
 arch/sh/boards/mach-ecovec24/setup.c          |  2 +-
 .../boards/mach-highlander/pinmux-r7785rp.c   |  2 +-
 arch/sh/boards/mach-kfr2r09/lcd_wqvga.c       |  2 +-
 arch/sh/boards/mach-kfr2r09/setup.c           |  2 +-
 arch/sh/boards/mach-migor/lcd_qvga.c          |  2 +-
 arch/sh/boards/mach-migor/setup.c             |  2 +-
 arch/sh/boards/mach-rsk/devices-rsk7203.c     |  2 +-
 arch/sh/boards/mach-rsk/devices-rsk7269.c     |  1 -
 arch/sh/boards/mach-se/7724/setup.c           |  2 +-
 .../include/mach-common/mach/magicpanelr2.h   |  2 --
 arch/sh/kernel/cpu/sh4a/setup-shx3.c          |  2 +-
 drivers/gpib/gpio/gpib_bitbang.c              |  2 +-
 drivers/gpio/TODO                             |  4 +---
 drivers/gpio/gpiolib-cdev.c                   |  2 +-
 drivers/gpio/gpiolib-legacy.c                 |  3 +--
 drivers/gpio/gpiolib.c                        |  2 +-
 drivers/input/keyboard/matrix_keypad.c        |  2 +-
 drivers/media/pci/ddbridge/ddbridge.h         |  2 +-
 .../platform/samsung/s3c-camif/camif-core.c   |  2 +-
 drivers/media/usb/em28xx/em28xx-dvb.c         |  2 +-
 drivers/mfd/aat2870-core.c                    |  2 +-
 drivers/mfd/arizona-irq.c                     |  2 +-
 drivers/mfd/lp3943.c                          |  2 +-
 drivers/mfd/si476x-cmd.c                      |  2 +-
 drivers/mfd/si476x-i2c.c                      |  2 +-
 drivers/mfd/sm501.c                           |  2 +-
 drivers/mfd/tps6105x.c                        |  2 +-
 drivers/mfd/tps65911-comparator.c             |  2 +-
 drivers/mfd/wm8994-irq.c                      |  2 +-
 drivers/net/dsa/b53/b53_priv.h                |  3 ++-
 drivers/net/dsa/microchip/ksz8.c              |  2 +-
 drivers/net/ethernet/allwinner/sun4i-emac.c   |  2 +-
 .../net/ethernet/apm/xgene/xgene_enet_main.c  |  2 +-
 .../ethernet/oki-semi/pch_gbe/pch_gbe_main.c  |  2 +-
 drivers/net/phy/mdio_device.c                 |  2 +-
 drivers/pcmcia/bcm63xx_pcmcia.c               |  2 +-
 drivers/pcmcia/db1xxx_ss.c                    |  2 +-
 drivers/pcmcia/sa1100_h3600.c                 |  2 +-
 drivers/pcmcia/soc_common.c                   |  2 +-
 drivers/pcmcia/xxs1500_ss.c                   |  2 +-
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c     |  2 +-
 drivers/phy/rockchip/phy-rockchip-usbdp.c     |  2 +-
 drivers/phy/ti/phy-j721e-wiz.c                |  2 +-
 include/linux/gpio.h                          | 22 -------------------
 include/linux/mfd/lp3943.h                    |  2 +-
 include/linux/mfd/ti-lmu.h                    |  2 +-
 include/linux/mfd/tps65910.h                  |  2 +-
 include/linux/mfd/ucb1x00.h                   |  2 +-
 sound/soc/codecs/cs42l84.c                    |  2 +-
 sound/soc/codecs/cx2072x.c                    |  2 +-
 sound/soc/codecs/dmic.c                       |  2 +-
 110 files changed, 107 insertions(+), 134 deletions(-)
 delete mode 100644 include/linux/gpio.h

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
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
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
Cc: linux-media@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-phy@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-sound@vger.kernel.org

