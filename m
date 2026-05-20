Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2A6CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QS0tE1jq32RPknCxarjuiggmHwCM4gop6dVAw2uUqDw=; b=pK8gXHo6TL/tmqOndJHFK2r+23
	UPLlNqkFrI3ckFC4JCejIop3IUYoevsOtBgcYYJA0xeDmJ9/OQbA1ZMZJPQZl7ICW3/dhZ7KuBw0u
	IBIjpZU8eeG1YNBjm6eXxJzp8S7DSVmX5iOsbJm7uXTTm4+10qqqqHqJp+OzWsHt1lb/sROMoaFrh
	ifll4XlbvjLo/xrx0CZUr1Qf55kbUfrNV2lPLLCMh+HHaYK+xnG3XdKYYI6CVIsHokuXiYgGZ6SQA
	Y9lC0LhMgm2YEVozbSTsmUwo1wffbD83yzG2uFj/NCAckd8OwySDIfiGnssCY3AoLAT9ufOFf5nwp
	ck0UHM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlon-00000005TBq-3iOG;
	Wed, 20 May 2026 18:38:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPloZ-00000005Spf-3S13
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 18:38:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A699560235;
	Wed, 20 May 2026 18:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98C11F00894;
	Wed, 20 May 2026 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779302322;
	bh=QS0tE1jq32RPknCxarjuiggmHwCM4gop6dVAw2uUqDw=;
	h=From:To:Cc:Subject:Date;
	b=SYem8I5RC86MwvWdXWsQ6Bgp8A0iXFMrU82tSaGTwlAWevRvRw1mI4fgTiw71nwGG
	 TpYCkhihg/FcTxYWvLebVRpcmccAb0QIlJ3Erhm9eoYNL6hgSPDhwpiMfthUWOs+N7
	 uDOqvOlJsj2qn4Mk9FgQR4RHeTbdGZgKjUqsRfrhRpKCLo4wVyWkBbRw7XKIDZNWN3
	 xb+Su0YEq8Wc0mkirG4tIO7DN2LSICbOX1+H4BSK/0RdNlDIcIh6ctwgOUK3qvD3Ui
	 o3sIJMY3PRuZCc3JVv1k5+w+a6JkVb3X+rJGutoWUld3hRXgrt8cUvFy8ei5dLVjx9
	 qD/v5u29/g+eA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 00/10] gpiolib: fence off legacy interfaces
Date: Wed, 20 May 2026 20:38:05 +0200
Message-Id: <20260520183815.2510387-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

This is an update of all the patches that are still required before
we can actually turn off CONFIG_GPIOLIB_LEGACY for most platforms
in the final patch of this series.

I originally posted this as a series in
https://lore.kernel.org/all/20250808151822.536879-1-arnd@kernel.org/

I added more patches for the p54spi driver that I had originally
sent separately and submitted the remaining ones separately to
the subsystem maintainers, with about two thirds getting picked
up so far.

If possible, please apply the patches to the respective
architecture (mips, sh, x86, soc/omap) or subsystem
(wireless, net-next, led, input) trees.

      Arnd

Arnd Bergmann (10):
  [v2] [net-next] net: dsa: b53: hide legacy gpiolib usage on non-mips
  [v3] input: gpio-keys: make legacy gpiolib optional
  [v2] x86/olpc: select GPIOLIB_LEGACY
  [v2] sh: select legacy gpiolib interface
  [v2] mips: select legacy gpiolib interfaces where used
  [v4] leds: gpio: make legacy gpiolib interface optional
  [v6 net-next] dt-bindings: net: add st,stlc4560/p54spi binding
  [v6 net-next] p54spi: convert to devicetree
  [v6 omap] ARM: dts: omap2: add stlc4560 spi-wireless node
  gpiolib: turn off legacy interface by default

Cc: Christian Lamparter <chunkeey@googlemail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-leds@vger.kernel.org
Cc: netdev@vger.kernel.org

 .../bindings/net/wireless/st,stlc4560.yaml    | 61 +++++++++++++++++
 MAINTAINERS                                   |  1 +
 arch/arm/boot/dts/ti/omap/omap2.dtsi          |  4 ++
 .../dts/ti/omap/omap2420-n8x0-common.dtsi     | 12 ++++
 arch/arm/mach-omap2/board-n8x0.c              | 18 -----
 arch/mips/Kconfig                             |  5 ++
 arch/mips/alchemy/Kconfig                     |  1 -
 arch/mips/txx9/Kconfig                        |  1 +
 arch/sh/Kconfig                               |  1 +
 arch/sh/boards/Kconfig                        |  8 +++
 arch/sh/boards/mach-highlander/Kconfig        |  1 +
 arch/sh/boards/mach-rsk/Kconfig               |  3 +
 arch/x86/Kconfig                              |  1 +
 drivers/gpio/Kconfig                          |  9 ++-
 drivers/input/keyboard/gpio_keys.c            |  7 +-
 drivers/input/keyboard/gpio_keys_polled.c     |  2 +
 drivers/leds/leds-gpio.c                      | 51 +++++++++-----
 drivers/mfd/rohm-bd71828.c                    |  1 -
 drivers/mfd/rohm-bd718x7.c                    |  1 -
 drivers/net/dsa/b53/b53_common.c              | 17 ++---
 drivers/net/dsa/b53/b53_priv.h                | 25 +++++--
 drivers/net/wireless/intersil/p54/p54spi.c    | 67 +++++++------------
 drivers/net/wireless/intersil/p54/p54spi.h    |  3 +
 include/linux/gpio_keys.h                     |  2 +
 include/linux/leds.h                          |  2 +
 sound/pci/Kconfig                             |  1 +
 26 files changed, 201 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml

-- 
2.39.5


