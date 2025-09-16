Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BAACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C2ElPcuDb7GDFL0BugWYkt/VrkTvpyOiSK2rgTU3LY4=; b=e92DMD66hbWaPN
	o05sf0lKqXisERwg0iIy16awL5hkiSCfAEIg7G8vkdYAuNp25gtSubuiWfjVmGuySAes1hcxkH/JB
	lSnTFxLRVNhtqAyQRFyQVRheVxAAal7ebHrDiDyXoLbpw1Kh3xLcjBBuqo2jUA/eHRaGacUJ5mBIA
	o/ianH+uvjx4vDMEY/n+mxQe5A5b1B4LAQAUyzh5KwV0gqSB0721awJtoJvOVyi3EsGy54ZQ3DCt8
	z3Ycb7sGPG0+U+n11DQZJW1QV0+UdzRwkpVr990jOJwGAmxemJMNPxbmXGnO1H34P6qaADrBiyl8f
	/1i44xyxjOX7HCfldy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc2r-00000008z3n-24NA;
	Tue, 16 Sep 2025 20:12:57 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc2p-00000008z2K-1yca;
	Tue, 16 Sep 2025 20:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1758053274; bh=C2ElPcuDb7GDFL0BugWYkt/
	VrkTvpyOiSK2rgTU3LY4=; b=F1QIsViWv9H3CNrLHTcx/s1Ozszeb+qquwpUtz++nUQnnY6bKj
	ezdrbyXwPCKt+xtaMuGTe5+K0ey5SqiF5BlYXt7t1B8Iyn/vODdS2aiQmj9kcDw0RkVdG+7r9yk
	ka6cAn9xuFU5FRdBq1RmJRGlNEZYDkX1G4QBjBsYnbv10X4QvoiCF1SWspzqtK6e7f+E3Ti2YEK
	jduCIW5omXXNcBa9eYSlk54eX3tsgOpoceX+dPIMwr6u4GeSsGRsY1kdJUJd8t4QCJw2JVulNZH
	rMBC+jjvhZFDB9ZOo3fl3ZRqrq+u0eIbvAfwVgtJhxlYZ7PWkmvXU5wW04RWYutBiRQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1758053274; bh=C2ElPcuDb7GDFL0BugWYkt/
	VrkTvpyOiSK2rgTU3LY4=; b=zj2OQhKMLYaBsfr6zNxJpu0ngi64yyfXN8RIj98ciWChz/axPh
	lXebYFA6fUg6+OUOvjJquJpVfpIWTYIY4aCA==;
From: Dang Huynh <dang.huynh@mainlining.org>
Subject: [PATCH 00/25] RDA8810PL Clock, RTC and MMC driver
Date: Wed, 17 Sep 2025 03:07:17 +0700
Message-Id: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHXDyWgC/x3MQQqAIBBA0avErBPUsrKrRAvJqQbCYgQJxLsnL
 d/i/wwRmTDC3GRgTBTpDhWqbWA7XThQkK8GLbWRVg2CvZsmJZ9LeKaEHIV1Ro+qN3roDNTuYdz
 p/Z/LWsoHMTLSk2MAAAA=
X-Change-ID: 20250916-rda8810pl-drivers-9a5271452635
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_131255_650639_FFCF53E7 
X-CRM114-Status: GOOD (  10.94  )
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

This patch series aims to add support for Clock/Reset, Real-Time Clock and
SDMMC on the RDA Micro RDA8810PL platform.

It also adds Intelligent Flow Controller (IOW, a DMA controller) which is
important for working with this MMC IP.

Tested on the Orange Pi 2G-IOT.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
Dang Huynh (25):
      ARM: dts: unisoc: rda8810pl: Add label to GPIO nodes
      drivers: gpio: rda: Make IRQ optional
      dt-bindings: gpio: rda: Make interrupts optional
      rtc: Add timestamp for the end of 2127
      dt-bindings: rtc: Add RDA Micro RDA8810PL RTC
      rtc: Add driver for RDA Micro SoC
      ARM: dts: unisoc: rda8810pl: Enable Real-Time Clock
      ARM: dts: unisoc: rda8810pl: Enable ARM PMU
      dt-bindings: clock: Add RDA Micro RDA8810PL clock/reset controller
      drivers: clk: Add Clock and Reset Driver for RDA Micro RDA8810PL SoC
      dts: unisoc: rda8810pl: Enable clock/reset driver
      dts: unisoc: rda8810pl: Add OPP for CPU and define L2 cache
      dts: unisoc: orangepi: Disable UART with no users
      dt-bindings: power: reset: Add RDA Micro Modem Reset
      power: reset: Add basic power reset driver for RDA8810PL
      dts: unisoc: rda8810pl: Enable modem reset
      drivers: gpio: rda: Make direction register unreadable
      dt-bindings: dma: Add RDA IFC DMA
      dmaengine: Add RDA IFC driver
      dts: unisoc: rda8810pl: Enable IFC
      dt-bindings: mmc: Add RDA SDMMC controller
      mmc: host: Add RDA Micro SD/MMC driver
      dts: unisoc: rda8810pl: Add SDMMC controllers
      dts: unisoc: orangepi-2g: Enable SD Card
      dts: unisoc: orangepi-i96: Enable SD Card

 .../bindings/clock/rda,8810pl-apsyscon.yaml        |  44 ++
 Documentation/devicetree/bindings/dma/rda,ifc.yaml |  42 +
 .../devicetree/bindings/gpio/gpio-rda.yaml         |   3 -
 Documentation/devicetree/bindings/mmc/rda,mmc.yaml |  91 +++
 .../bindings/power/reset/rda,md-reset.yaml         |  36 +
 .../devicetree/bindings/rtc/rda,8810pl-rtc.yaml    |  30 +
 MAINTAINERS                                        |  30 +
 .../boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts  |  24 +-
 .../arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts |  24 +-
 arch/arm/boot/dts/unisoc/rda8810pl.dtsi            | 115 ++-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/rda/Kconfig                            |  14 +
 drivers/clk/rda/Makefile                           |   2 +
 drivers/clk/rda/clk-rda8810.c                      | 770 +++++++++++++++++++
 drivers/dma/Kconfig                                |  10 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/rda-ifc.c                              | 450 +++++++++++
 drivers/gpio/gpio-rda.c                            |   4 +-
 drivers/mmc/host/Kconfig                           |  12 +
 drivers/mmc/host/Makefile                          |   1 +
 drivers/mmc/host/rda-mmc.c                         | 853 +++++++++++++++++++++
 drivers/power/reset/Kconfig                        |   9 +
 drivers/power/reset/Makefile                       |   1 +
 drivers/power/reset/rda-reboot.c                   |  58 ++
 drivers/rtc/Kconfig                                |  11 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-rda.c                              | 356 +++++++++
 include/dt-bindings/clock/rda,8810pl-apclk.h       |  79 ++
 include/dt-bindings/dma/rda-ifc.h                  |  28 +
 include/linux/rtc.h                                |   1 +
 31 files changed, 3079 insertions(+), 23 deletions(-)
---
base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
change-id: 20250916-rda8810pl-drivers-9a5271452635

Best regards,
-- 
Dang Huynh <dang.huynh@mainlining.org>

