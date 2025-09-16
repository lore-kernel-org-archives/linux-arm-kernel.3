Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C812CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C2ElPcuDb7GDFL0BugWYkt/VrkTvpyOiSK2rgTU3LY4=; b=kA8wZzGZV0NVuS+vBF2bq29DSy
	f5lqczS1K58NPZAqSW5fu2WesPtrdVkdY0rIih/q3xRJaT3+QnlUcx/AmoLXLoBROlHv72U021ChF
	M6AudD1qK9I3C/oAt8Mh0QIivDQbqaWG/bYkGYlY6bNc2UeSL5cVueFuC0gBBdw3xR8g665TC5diF
	DuhDD1/+Ez1HyHILSHa8TTnleFV5q+zPmoSHwo4CbbwbHzxOQh3lcGiD+8a/F35jABpTAENlpekZn
	83vABafNpaUVLXqlCn4cdyKwfecgrO/RQ8hOsWcFuyAjqdGylwwBbfp3XW/OImIoU/XzRUkbXPvi6
	olGAQzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEx-000000090kT-20qO;
	Tue, 16 Sep 2025 20:25:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEw-000000090iH-0yqI;
	Tue, 16 Sep 2025 20:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A46F601DD;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC192C4CEF7;
	Tue, 16 Sep 2025 20:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054325;
	bh=QGD8kRGBo4syZf/wQP0MSt3nT94Hk5NSzVk+3pfI8QQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Bc/QtC1jTVGH93BHR0pPdFgnDWDiNw3YTMnrSYbNo5hzlhrYakGO1MUHm7c9t+0So
	 ztRNowvJb/dEQgN01xDy/8axTbgwBjY4MTcgvysVORMpR4pDfdBQNXAaZz5oO+QfqT
	 QUCysrVApvuz7qQ94K+Wk8t+qg3iynCibdG+TwwGV30GlvczfNFpFObHGfbTr2nDKQ
	 H6tcPcxlgloeSlIOqmQ5xdrKhKoEqnQiPLp+PQrXHwNEWT8MV3f+v0vxVk2kzJ5dyp
	 XPpV8tnYMJr7sKnPvmKh0knnUuzMSmkSjD6bMGB2vBXOpN/UVSa6rU6X++NSHnQ8zP
	 YByqX4+RF81tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56EBCAC598;
	Tue, 16 Sep 2025 20:25:24 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Subject: [PATCH 00/25] RDA8810PL Clock, RTC and MMC driver
Date: Wed, 17 Sep 2025 03:24:57 +0700
Message-Id: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJnHyWgC/x3MQQqAIBBA0avErBPUsrKrRAvJqQbCYgQJxLsnL
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=3886;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=QGD8kRGBo4syZf/wQP0MSt3nT94Hk5NSzVk+3pfI8QQ=;
 b=9zchpSAFwjr+IQK2dMLrZvsWvEJuMCoEzZv1nMsFWfTxwY7t6r94fNp29tagymUqPmbGLtAjS
 obpQLZLCJPKAv4jwBuj4UgTE75ucWgSclNMjDGj95eHLrisstZxh3Pc
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
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
Reply-To: dang.huynh@mainlining.org
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



