Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD75CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLtN3cPdZNxLNq3OdBF4FnsM4y1zIM67HF3kle83rV8=; b=qtmmEwgnd5QL+mj+EdguRUWbQm
	2t4tadZwH6ZcV8lh93YI7iqKyXdY7NpOOzTWJvlstdIaDgyLa03JT483phBWRQEArTmgfZIQAWdn/
	gZhAXg5HPvnZEqCjBmFk8XeDbKDbKEGDqYHRd4WiU+N98YX/i3oxOdVnc5aOLIBMM5k5Z2wsKrf0O
	H08jBx+ZQV246l7sGTeqqGEeamT6tzkJIfSz3N3b+p91cFIAkyaoSx6grfuUWwUhu9qNnwQJpGlxj
	80vTprj8clOhJutBqDJ/Ro7xn791ibHRjo3o4lJdiK2KnOg+eAd3za3oZ3vkUB2yBZ27L/2duRg0o
	8v9dorog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycGr-000000093Aj-3GdC;
	Tue, 16 Sep 2025 20:27:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycGp-0000000938s-1W4b
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Sep 2025 20:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZLtN3cPdZNxLNq3OdBF4FnsM4y1zIM67HF3kle83rV8=; b=Rsz0FWtj/25UHtp6QCXtUTpqUd
	z82JYSpoDW/ZRhNaXoHAnd3/sp4CVwqZD+OOjQm/bAJ92JD//Dr+8bHXgp9kt4yad30sdce4NfDdI
	eJ276W0U0JYXvEQKMAavKCiuUs3ourf/CdjO7updl3SaaJOJnDRZbMTVMAo2H/HK2j3RGawKKY/5G
	Uq4tEGRF5PspcWqFpY2RE42NhKx3UFZXUrcQKIQyFrhSAcccq1RWNKFAfhBZfwQPjeoDwNRPDdL13
	GgmL92qdV5ZWzEDPZxuJvdPAw7pMyV+fNDda/n6Iq4FL+0CSfA7iND578c9jJRq27knpXRPhvXU6I
	6pPyyJYQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycGe-00000007Gf6-0XOS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 20:27:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 70F371A0E0D;
	Tue, 16 Sep 2025 20:26:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3B13E6061E;
	Tue, 16 Sep 2025 20:26:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5A88102F17AC;
	Tue, 16 Sep 2025 22:26:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758054417; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ZLtN3cPdZNxLNq3OdBF4FnsM4y1zIM67HF3kle83rV8=;
	b=d31EIRoXxAl9Pl1rTvDkK1blpoHuz0hNFNNj8fJdgyYnRcMDDHz6dXu3nPzw+G3Qo97bvW
	3hWJMNmEs3YMHBYXzj2IEUxugPSKISdiBMtMSK0f5xamHoc1tX+a0IEwd/x2g07OHxJPEn
	lxQMd8I6jpB+2EbvVPHs+G5w/4MPISBjIIExMwjImrcwzgXnBczv6RDJ/Ky1da5wyj2mei
	cmhCU+l5TmXbm/GR4ElBfsJ0/8YNbrtjM1XSo9YbzTqSKxjygZrfKHcbsihuzWigbHO8hJ
	1LkM4pCg+lSraI1LuT89alkSK+DfBR9t2fc/FDg+aeBoxYamhNyvK+y8Jrlsiw==
Date: Tue, 16 Sep 2025 22:26:49 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 00/25] RDA8810PL Clock, RTC and MMC driver
Message-ID: <2025091620264900a32db6@mail.local>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_212718_893348_40AE15EA 
X-CRM114-Status: GOOD (  18.20  )
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

Hello,

On 17/09/2025 03:07:17+0700, Dang Huynh wrote:
> This patch series aims to add support for Clock/Reset, Real-Time Clock and
> SDMMC on the RDA Micro RDA8810PL platform.
> 

What are the dependencies between the various drivers? Ho< do you expect
the patches to be merged?

If the RTC patches are independent, please send them separately.

> It also adds Intelligent Flow Controller (IOW, a DMA controller) which is
> important for working with this MMC IP.
> 
> Tested on the Orange Pi 2G-IOT.
> 
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

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

