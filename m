Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3DCCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6oJG3VT3p7c40ieV9zR6J1LoJP9uSbSF4TseeoYjhr4=; b=DZ4io3O2LQVufezcfx0OM9//FC
	KX+czZZ6sK8HesclGLJFlc1t8oHPPfxDVWDl6v2XnDw1QVX5NurZ9QZvgOgGSnwO13B7YQbpQ6DfD
	VzzhtnIxYEVeg4yVvagWwXpptCRXbJ3LGC/low8k0HSwC/roTO2yhQoEgkFXGRggeigfmSCb1U5hm
	Lf5Wo2qWZtV7OgTfR0clGQ4hD2zkMy520fBaJvIlx78PZmDrGNWg0eShpKOIcThMwiB5FmS/HHtcw
	Hzn9g1p0v9CWpmUeAYWFRSy5gkrS7qWTGZcjTWWJfRcLMnYpQghYWm1/GJC0wrUC2eFWyxbdWH+E7
	1YuLUkZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRPx-00000002SWc-0ZMR;
	Tue, 29 Sep 2026 06:34:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRPv-00000002SWN-3sHq;
	Tue, 29 Sep 2026 06:34:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50BD84160D;
	Tue, 29 Sep 2026 06:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CA21F000FF;
	Tue, 29 Sep 2026 06:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663659;
	bh=6oJG3VT3p7c40ieV9zR6J1LoJP9uSbSF4TseeoYjhr4=;
	h=From:To:Cc:Subject:Date;
	b=CIVeX+oK9XYnlEWr2yt+GsuzjnGEMR7TYO5hwhInVHyFv9y6MM2LmJ5MiWhL+XI9Q
	 jpciIUkgutKjPZ4+Dk8L6ZIioFty8mzAwZ9auuf//+CF0dBaBRAQ286ln7qYGBRnqb
	 T4SY/d0iosiw6WmfhA3cmzoWj7aVKjKVowRBNSN8QN4rPh/GEMtAU0/gVRskdo8WgZ
	 82eJO32MhsoFcSq2BJl/7dnY2B5OanaBT7Zkg6z4P2Sly/QsvmnfYeDScKIrE08qQ4
	 KsCCB2mlkrFwT95UVtXZXaWdb0RpQ/GKPQ0lHg8h82KEDRalfzBS+0IzHHis5+UtgD
	 dEiAxPVQVVYMA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/20] arm64: add Synaptics SL261X SoCs and RDK boards
Date: Tue, 29 Sep 2026 14:13:57 +0800
Message-ID: <20260929061417.20733-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
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

Add initial support for the Synaptics SL261X SoCs and corresponding
RDK boards.

The SL261X SoCs include five pin-to-pin compatible SoCs: SL2611, SL2613,
SL2615, SL2617, and SL2619.

Only reset, pinctrl, clk/pll, uart, gpio, i2c, spi, i3c are included in
this series. The support for Ethernet, USB, SDHCI, CAN, DMAC, XSPI will
be submitted after this series is merged.


Jisheng Zhang (20):
  dt-bindings: serial: snps-dw-apb-uart: Add Synaptics sl261x uart
  dt-bindings: i2c: dw: Add Synaptics sl261x i2c
  spi: dt-bindings: snps,dw-apb-ssi: Add Synaptics sl261x spi
  dt-bindings: i3c: dw: support up to two reset lines
  i3c: dw: switch to array-based exclusive reset control
  dt-bindings: i3c: Add Synaptics sl261x i3c
  arm64: kconfig: let ARCH_BERLIN cover Synaptics arm64 SoCs
  dt-bindings: reset: add Synaptics SL261X SoCs
  reset: add Synaptics SL261x reset support
  pinctrl: berlin: use u16 instead of u8 for the offset
  pinctrl: berlin: enable module build support
  pinctrl: berlin: add optional pinconf support
  dt-bindings: pinctrl: berlin: Support Synaptics SL261X SoCs
  pinctrl: berlin: support Synaptics SL261X SoCs
  dt-bindings: clock: add Synaptics SL261X clock
  clk: berlin: add Synaptics SL261X SoC clocks and plls
  dt-bindings: mfd: Add Synaptics SL261x global block binding
  regulator: dt-bindings: sy8827n: support standard properties
  dt-bindings: arm: berlin: Add Synaptics SL261X SoC and RDK board
  arm64: dts: synaptics: Add Synaptics SL261X SoC and RDK board

 .../bindings/arm/marvell,berlin.yaml          |  20 +
 .../bindings/clock/syna,sl261x-clk.yaml       |  92 +++
 .../bindings/i2c/snps,designware-i2c.yaml     |   1 +
 .../bindings/i3c/snps,dw-i3c-master.yaml      |   6 +-
 .../bindings/mfd/syna,sl261x-gbl.yaml         | 208 +++++
 .../pinctrl/marvell,berlin2-soc-pinctrl.yaml  |  10 +-
 .../bindings/regulator/silergy,sy8827n.yaml   |   5 +-
 .../bindings/reset/syna,sl261x-reset.yaml     |  40 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |  12 +-
 .../bindings/spi/snps,dw-apb-ssi.yaml         |   1 +
 arch/arm64/Kconfig.platforms                  |   4 +-
 arch/arm64/boot/dts/synaptics/Makefile        |   5 +
 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2611.dtsi     | 490 ++++++++++++
 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2613.dtsi     |  12 +
 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2615.dtsi     |  46 ++
 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2617.dtsi     |  46 ++
 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +
 arch/arm64/boot/dts/synaptics/sl2619.dtsi     |  44 ++
 .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/berlin/Kconfig                    |  25 +
 drivers/clk/berlin/Makefile                   |   4 +
 drivers/clk/berlin/sl-clk.c                   | 279 +++++++
 drivers/clk/berlin/sl-clk.h                   |  31 +
 drivers/clk/berlin/sl-sysmgr-clk.c            | 250 ++++++
 drivers/clk/berlin/sl-sysmgr-clk.h            |  44 ++
 drivers/clk/berlin/sl261x-clks.c              | 385 +++++++++
 drivers/clk/berlin/sl261x-pll.c               | 145 ++++
 drivers/clk/berlin/sl261x-pll.h               |  14 +
 drivers/i3c/master/dw-i3c-master.c            |  24 +-
 drivers/i3c/master/dw-i3c-master.h            |   2 +-
 drivers/pinctrl/berlin/Kconfig                |   7 +
 drivers/pinctrl/berlin/Makefile               |   1 +
 drivers/pinctrl/berlin/berlin.c               | 259 +++++-
 drivers/pinctrl/berlin/berlin.h               |  17 +-
 drivers/pinctrl/berlin/pinctrl-sl261x.c       | 745 ++++++++++++++++++
 drivers/reset/Kconfig                         |   6 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-sl261x.c                  | 224 ++++++
 include/dt-bindings/clock/syna,sl261x.h       | 131 +++
 include/dt-bindings/reset/syna,sl261x-reset.h |  80 ++
 45 files changed, 3899 insertions(+), 33 deletions(-)
 create mode 100755 Documentation/devicetree/bindings/clock/syna,sl261x-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/syna,sl261x-gbl.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/syna,sl261x-reset.yaml
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2611.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2613.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2615.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2617.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
 create mode 100644 arch/arm64/boot/dts/synaptics/sl2619.dtsi
 create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
 create mode 100644 drivers/clk/berlin/Kconfig
 create mode 100644 drivers/clk/berlin/sl-clk.c
 create mode 100644 drivers/clk/berlin/sl-clk.h
 create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.c
 create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.h
 create mode 100644 drivers/clk/berlin/sl261x-clks.c
 create mode 100644 drivers/clk/berlin/sl261x-pll.c
 create mode 100644 drivers/clk/berlin/sl261x-pll.h
 create mode 100644 drivers/pinctrl/berlin/pinctrl-sl261x.c
 create mode 100644 drivers/reset/reset-sl261x.c
 create mode 100644 include/dt-bindings/clock/syna,sl261x.h
 create mode 100644 include/dt-bindings/reset/syna,sl261x-reset.h

-- 
2.53.0


