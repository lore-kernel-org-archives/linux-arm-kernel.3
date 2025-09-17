Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E386ECA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uqXvajj0JpxJzX1GYL3l07zgiC5liPK9R0p5vaF4/4=; b=jse4syFIynhkacD55vzjI+eo0K
	qngG0elxND179d/NI/SjFdjC+//JTjAqGDCeeP9OadqXWdDuERa+5cpclBBFwOf/6uAexQzzlxu53
	VNKhPnCPgdhOabcgoLy5Yl6+GODp9msmU6SCRk7o1VKG1Zne+LHmldOpMR75uUvzm3FRF5hzdC1XU
	qhbAvi+oUOoGEewuelZtH6dYl2n9QrSiBrhlHQ/QpkvgoZ/AAv11vDfHm/wIzftJA/B7UNQTQbcFs
	ke2j5nKjIOkhr17gKAxVyIrYdzRYcQIlvugV9HXg6MhFEE2ez2EpS6N9avD5ow6piLxhD1BQxYvOd
	bHKaoPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp0l-0000000AtTm-0rTY;
	Wed, 17 Sep 2025 10:03:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp0k-0000000AtTZ-0UyH;
	Wed, 17 Sep 2025 10:03:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E1A8601DE;
	Wed, 17 Sep 2025 10:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429F6C4CEF0;
	Wed, 17 Sep 2025 10:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758103417;
	bh=nNlilHjh09UBY7rPl6XW3+rKwLzxl/XA9okrB109O1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9Y0nfADZvNHly1cC+7nuDT0d/oTq9ziRK04kv1w1BF/BHhB5Xn0fiBbI0/UEecCV
	 Jgfp0Qr3MqeK4/IlBzjJBUmHnx5pt1iVtl+Of1wkezd6WDc+IA/jvJ55WlzYfsS8nU
	 GlOvOEc5T+rMEM1daFnDSK5IiYY4xJjJYth9BdXysxjB3CLYozkCtQecbSEQIlO86I
	 TlfVla0IwqYaoS6wTPwZxzKj9uyGujA4XWYEuhUot/r6Hdefu7hbiz2HhoSqrPqgNf
	 yf5mgQmqWgUVN5yPotT6+fV64FGqGLfxWPfsp136Spi+UEUH80ZpjCppqgefz6djDH
	 z9q04unFly53w==
Date: Wed, 17 Sep 2025 15:33:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: dang.huynh@mainlining.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 00/25] RDA8810PL Clock, RTC and MMC driver
Message-ID: <lnfervvwctvemjdmyue2aohlsqpfd5gsuzjho3u6mtdtewl4vr@saqnionh72am>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
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

On Wed, Sep 17, 2025 at 03:24:57AM GMT, Dang Huynh via B4 Relay wrote:
> This patch series aims to add support for Clock/Reset, Real-Time Clock and
> SDMMC on the RDA Micro RDA8810PL platform.
> 
> It also adds Intelligent Flow Controller (IOW, a DMA controller) which is
> important for working with this MMC IP.
> 
> Tested on the Orange Pi 2G-IOT.
> 

Thanks for work! Is it possible to split this patchset logically to ease
reviewing and also merging? It currently touches different subsystems and has 25
patches.

You could easily split this into different series adding Clock/Reset, RTC, IFC,
SDMMC and other misc patches in one series.

- Mani

> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
> Dang Huynh (25):
>       ARM: dts: unisoc: rda8810pl: Add label to GPIO nodes
>       drivers: gpio: rda: Make IRQ optional
>       dt-bindings: gpio: rda: Make interrupts optional
>       rtc: Add timestamp for the end of 2127
>       dt-bindings: rtc: Add RDA Micro RDA8810PL RTC
>       rtc: Add driver for RDA Micro SoC
>       ARM: dts: unisoc: rda8810pl: Enable Real-Time Clock
>       ARM: dts: unisoc: rda8810pl: Enable ARM PMU
>       dt-bindings: clock: Add RDA Micro RDA8810PL clock/reset controller
>       drivers: clk: Add Clock and Reset Driver for RDA Micro RDA8810PL SoC
>       dts: unisoc: rda8810pl: Enable clock/reset driver
>       dts: unisoc: rda8810pl: Add OPP for CPU and define L2 cache
>       dts: unisoc: orangepi: Disable UART with no users
>       dt-bindings: power: reset: Add RDA Micro Modem Reset
>       power: reset: Add basic power reset driver for RDA8810PL
>       dts: unisoc: rda8810pl: Enable modem reset
>       drivers: gpio: rda: Make direction register unreadable
>       dt-bindings: dma: Add RDA IFC DMA
>       dmaengine: Add RDA IFC driver
>       dts: unisoc: rda8810pl: Enable IFC
>       dt-bindings: mmc: Add RDA SDMMC controller
>       mmc: host: Add RDA Micro SD/MMC driver
>       dts: unisoc: rda8810pl: Add SDMMC controllers
>       dts: unisoc: orangepi-2g: Enable SD Card
>       dts: unisoc: orangepi-i96: Enable SD Card
> 
>  .../bindings/clock/rda,8810pl-apsyscon.yaml        |  44 ++
>  Documentation/devicetree/bindings/dma/rda,ifc.yaml |  42 +
>  .../devicetree/bindings/gpio/gpio-rda.yaml         |   3 -
>  Documentation/devicetree/bindings/mmc/rda,mmc.yaml |  91 +++
>  .../bindings/power/reset/rda,md-reset.yaml         |  36 +
>  .../devicetree/bindings/rtc/rda,8810pl-rtc.yaml    |  30 +
>  MAINTAINERS                                        |  30 +
>  .../boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts  |  24 +-
>  .../arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts |  24 +-
>  arch/arm/boot/dts/unisoc/rda8810pl.dtsi            | 115 ++-
>  drivers/clk/Kconfig                                |   1 +
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/rda/Kconfig                            |  14 +
>  drivers/clk/rda/Makefile                           |   2 +
>  drivers/clk/rda/clk-rda8810.c                      | 770 +++++++++++++++++++
>  drivers/dma/Kconfig                                |  10 +
>  drivers/dma/Makefile                               |   1 +
>  drivers/dma/rda-ifc.c                              | 450 +++++++++++
>  drivers/gpio/gpio-rda.c                            |   4 +-
>  drivers/mmc/host/Kconfig                           |  12 +
>  drivers/mmc/host/Makefile                          |   1 +
>  drivers/mmc/host/rda-mmc.c                         | 853 +++++++++++++++++++++
>  drivers/power/reset/Kconfig                        |   9 +
>  drivers/power/reset/Makefile                       |   1 +
>  drivers/power/reset/rda-reboot.c                   |  58 ++
>  drivers/rtc/Kconfig                                |  11 +
>  drivers/rtc/Makefile                               |   1 +
>  drivers/rtc/rtc-rda.c                              | 356 +++++++++
>  include/dt-bindings/clock/rda,8810pl-apclk.h       |  79 ++
>  include/dt-bindings/dma/rda-ifc.h                  |  28 +
>  include/linux/rtc.h                                |   1 +
>  31 files changed, 3079 insertions(+), 23 deletions(-)
> ---
> base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
> change-id: 20250916-rda8810pl-drivers-9a5271452635
> 
> Best regards,
> -- 
> Dang Huynh <dang.huynh@mainlining.org>
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

