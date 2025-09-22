Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5B4CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D42mDx7XES4dJT5DCpqob2SIIqhWq10lpNC2IIru3f8=; b=rSzP6qKq2ExwF0H0/XwrBxbILG
	MZuYbPuKMk7bM70omx5PKhXt0To2YisOxU3W72AhxnOZamljO4Mhu2D4YI/b7msHChkjTAD2ztjSJ
	pM67WV/IRcJZmOUsCWyKgcXw5j2iDZ/6cADlqaAYSgn9fNWnKbm00azoe1k9FDQwCf2VR3qJn6tww
	YpIaB/uiApqLgXjBm9OfRNd0uoewu+9K5r2v5Cqc7QmrV685HeR78OlUo4aX6gQ3h3yEu/nJQS49Z
	p67TjK9NQoSRgQnnCbww02x6uERhT6TIpMpwh0JNpJDw9ti26O0X6P+fMcmRxci10D1JHp76oLhmu
	Nf1gwanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hM3-0000000AdS6-3loC;
	Mon, 22 Sep 2025 14:17:23 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hM0-0000000AdQC-2UnC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 14:17:22 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-36c0b946cb5so5325361fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758550638; x=1759155438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D42mDx7XES4dJT5DCpqob2SIIqhWq10lpNC2IIru3f8=;
        b=K2hG47nwl8Fe/cQdnt3Nh5xin4TE7+eJ0n1bNVlNgTYjYOQfqx2b6FfdXqNRFfFFB2
         TGox/oSlX0R/HUy+4G6GD8x0JBrVbijLTW+W3cV9DZCO4rsuq/oc/g6LSH3ZtccegEzZ
         sEF7Jicw4ojMkH80qtmWmhVOdvu47BHKbeawp9fDOsNIs1/mtU7NnQaL9NWodMN8pfoE
         Z/ou70sLEu8thXLWoGOgyPwEHjX5LgRuBpdxBfX0wIECrbcj2YqFPg/v8AHhXrm+Y0Fg
         5CKy6yZZr7ZGUY4mEgStEdGkq6n8zJX4RQ002lZebzOtdCbACwTLFmBSXnCTkecJC5wB
         /OMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758550638; x=1759155438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D42mDx7XES4dJT5DCpqob2SIIqhWq10lpNC2IIru3f8=;
        b=HLyTBxzAV50QHQn7ccgelEriBSO62Vuwsewi8iYuIGJZwTVUpHFvmniEYTFo+4dgVr
         PMfzfZyTScvh/16DXEHrQlhQkizQqkj7L/I841UArycTy4I3d5RdZ2z8b1WJp2nICtuI
         QppGE2abcwfF5Gk7UbSNTPibapROZ7E3X1Wg5+b0AWqZitWgXuRyGSvnFL8f35PQpn7s
         O/XZOajyHXN8QBbHmEOlTq1p4SVCgrkeopNlqakg4eyIfBNnCIZnpd09xSWVRIAOoQtS
         o+7O2bfz3dzZGBCty5o0GhXax73LxZWevY3RLn8xFDYX+SMPX+k/EqayyYluBakuGMSR
         OVQA==
X-Forwarded-Encrypted: i=1; AJvYcCWf/Ag2O31szo5m1dfwbXRm8z/6Ck/a8ggTTXOTMBGPwlXOI25W8lNJJMkygflq6fya7LWQe+hzGo4WvITBZyA4@lists.infradead.org
X-Gm-Message-State: AOJu0YwXVpFP1me6QNd0ANXhYWnjrPxbKmhMdRWCXECR1d2B4pUBWTl2
	3DAfCQWnzat5JS7BVOTJVs0iKYLcqq9LoeBerLjjtTXP6+zvkS65YJsxuCqggvLSOG/bf23CqHG
	Pr6p27L2PLy78DIKLbtKCDSMBDNgxS3BM0yPuRSCXnA==
X-Gm-Gg: ASbGncujEZtykYs9aulFo8xImxsykst03Ni/PvbUuXu6f1zVlxj+2RVWlicgP0ds4BB
	vQznpfEJIIGyTN9nKVz+Gka3rNViOf3IVfruFFDEBUYytxmZl699bWnlkBg4hDlP2yHLRAC++Qo
	mvKMdLz7UvouPYzJMfnY5pgOGEQDPSGoC0wPKF/WqshV/0clKYoWRtKPXV/rdZNFM0JNMUAiuxY
	gkFQXpE30eOml+W7VLnPN48P1o5Pj2GiCg62A==
X-Google-Smtp-Source: AGHT+IGS2AjVg06y9Gl4ZoVygRe0txj+WZLEO+s0iRtEWqABbE+tNtV+p0mvb++GTiupjPDEskTHy6Yf/wVmcolsOo4=
X-Received: by 2002:a2e:be07:0:b0:36a:97e5:c4a5 with SMTP id
 38308e7fff4ca-36a97e5c8d3mr17177811fa.39.1758550638057; Mon, 22 Sep 2025
 07:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
In-Reply-To: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Sep 2025 16:17:05 +0200
X-Gm-Features: AS18NWBBtPPpfa65LcAbGVqvkVRIVUyroOGhaWLkgkmXpHaSdWCO_RUkKb2djeo
Message-ID: <CAMRc=Mc4hO1LDumxAfkB1W6miTJXR1NUVAKBVarkwiF2yGvSLA@mail.gmail.com>
Subject: Re: [PATCH 00/10] RDA8810PL SD/MMC support
To: dang.huynh@mainlining.org
Cc: Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_071720_763236_22296C2C 
X-CRM114-Status: GOOD (  19.61  )
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

On Thu, Sep 18, 2025 at 8:49=E2=80=AFPM Dang Huynh via B4 Relay
<devnull+dang.huynh.mainlining.org@kernel.org> wrote:
>
> This patch series aims to add SDMMC driver and various drivers required
> for SDMMC controller to function.
>
> This also fixed a bug where all the GPIO switched from INPUT to OUTPUT
> after the GPIO driver probed or by reading the GPIO debugfs.
>
> This patch series is a split from [1] to ease the maintainers.
>

This is still targeting at least 4 subsystems and isn't making the
merging any easier. Are there any build-time dependencies here? If
not, then split it further into small chunks targeting individual
subsystems and the relevant ARM SoC tree.

Bartosz

> Tested on Orange Pi 2G-IOT using a Buildroot environment.
>
> [1]: https://lore.kernel.org/all/20250917-rda8810pl-drivers-v1-0-9ca9184c=
a977@mainlining.org/
>
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
> Dang Huynh (10):
>       dt-bindings: gpio: rda: Make interrupts optional
>       dt-bindings: clock: Add RDA Micro RDA8810PL clock/reset controller
>       dt-bindings: dma: Add RDA IFC DMA
>       dt-bindings: mmc: Add RDA SDMMC controller
>       gpio: rda: Make IRQ optional
>       gpio: rda: Make direction register unreadable
>       clk: Add Clock and Reset Driver for RDA Micro RDA8810PL SoC
>       dmaengine: Add RDA IFC driver
>       mmc: host: Add RDA Micro SD/MMC driver
>       ARM: dts: unisoc: rda8810pl: Add SDMMC controllers
>
>  .../bindings/clock/rda,8810pl-apsyscon.yaml        |  43 ++
>  Documentation/devicetree/bindings/dma/rda,ifc.yaml |  45 ++
>  .../devicetree/bindings/gpio/gpio-rda.yaml         |   3 -
>  Documentation/devicetree/bindings/mmc/rda,mmc.yaml |  92 +++
>  MAINTAINERS                                        |  18 +
>  .../boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts  |  20 +
>  .../arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts |  20 +
>  arch/arm/boot/dts/unisoc/rda8810pl.dtsi            |  47 +-
>  drivers/clk/Kconfig                                |   1 +
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/rda/Kconfig                            |  14 +
>  drivers/clk/rda/Makefile                           |   2 +
>  drivers/clk/rda/clk-rda8810.c                      | 769 +++++++++++++++=
++++
>  drivers/dma/Kconfig                                |  10 +
>  drivers/dma/Makefile                               |   1 +
>  drivers/dma/rda-ifc.c                              | 450 +++++++++++
>  drivers/gpio/gpio-rda.c                            |   4 +-
>  drivers/mmc/host/Kconfig                           |  12 +
>  drivers/mmc/host/Makefile                          |   1 +
>  drivers/mmc/host/rda-mmc.c                         | 853 +++++++++++++++=
++++++
>  include/dt-bindings/clock/rda,8810pl-apclk.h       |  70 ++
>  include/dt-bindings/dma/rda-ifc.h                  |  28 +
>  22 files changed, 2495 insertions(+), 9 deletions(-)
> ---
> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> change-id: 20250918-rda8810pl-mmc-3f33b83c313d
>
> Best regards,
> --
> Dang Huynh <dang.huynh@mainlining.org>
>
>

