Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E45FCF5396
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUqhFqL+Zg6XvavgGcWGzdRxe6SAMlyCd/batBn/A/8=; b=E3plZIqP2+5UuMGh0dtPIZeh7e
	qeKVbGdIKBTIbNOCPWfi1d1eIoKR0ovpSV0uTcVZVetPD2mS53mDaF1KJnLlCVk7DOmer8nC4YSQQ
	TxWugu4WKI+Nky0W5gvL6jOoZpdlHvWVSBeUJ1KRCZQTriqaDJBDCdFG6l8QZCdCV0hMfwDu6Atuz
	JvHNmXHXFmVI8m9SDNkEVqGhNMbbr7bizgUv0AbYXryHMKiY506ArjKr9DDzgH86wHqdYDwQEli4+
	KFsMgVSZLuvxtGPJjNZqNdFBGYf1IanJbup723GJ50xtVHwb4wV8/RXqKSr5YG1IbRX6qSjajOOUd
	fRRKRQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3chv-0000000EodY-1Gje;
	Wed, 23 Oct 2024 14:51:31 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ceI-0000000EnZk-3Oxv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:47:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20caea61132so54058135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 07:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729694865; x=1730299665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUqhFqL+Zg6XvavgGcWGzdRxe6SAMlyCd/batBn/A/8=;
        b=KKa6yWRJCoxKyuoSM0VAzk3/OZ+074kVtrWsdnSn+EhfMbQwu0UHQljGY3JcQ6kwuG
         DSqYKcAGLzoG2lgONQoPfxhOoBREQRq4w1zWBoAjWpV6Uzkd3oxjtguCUyd/QQd2Z5sL
         uDD6VZ7zj5D7/2C/IlHGx7qITvzSt6YulvdjAwIsRzFJ5DmkTeMyThqLmwNoXFUu1uKZ
         fh4TJreRD6hpCq8/xxpYcqluYM+BtWIDVPE931nw11gbie6wkV8z69f+HVP0EgAb+yLs
         d1Nw5IpwXLPX1cfxEJswukG/wcnOMVaY1A/2tsbJ5iaDIZ3rwl/4PrrCBnyvzEPaWSWC
         PAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729694865; x=1730299665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUqhFqL+Zg6XvavgGcWGzdRxe6SAMlyCd/batBn/A/8=;
        b=LtLNYv3a/4BJaetlzbna8NdTqyf2VX9VAqbS70avYhfOEvxZuLsXPbzLdiNnb5uje/
         +ukFj2czBmQm9Wf4YK77dYjMxp7hsajznzMZJfPZt+7pFKLUG2u7mYrvSt05232Q59wc
         cQstO9q4YjnHqKi3n9jiWQrCjYsz3wRGrp90YMrLxbOMiFBLstUeTyJYcMJRhFzE+84l
         LQ+m8b5LicAb0uhfXUKmK/dEzKIqsGocz37Dzxu3G76fePUCNOjtAlo0ezqkwpRVxivb
         xV8I0gWcPU50RoayA8umW6brNOzU5Msi7Lj6KITilCoHoV7oASN1u8WRFCqsu1YcW1GF
         GiuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsagl/hBQJbr2NPn9zLeMOHt8UI7tnYSVbtjQM31NuBzdV1SU9F4YIb23XCm8mTS6gq8/KCyv8/fzZO0lOTU0i@lists.infradead.org
X-Gm-Message-State: AOJu0YzNEzijf+NYewdex8s1OSm2mMdCC4ruA13wBxh9khYRmJWMuh8U
	iTiZK/1nM5XbgSZtduJ2AsFXHIAnTSaAPTiZ/E/vUc5yCIsWVy1w
X-Google-Smtp-Source: AGHT+IFrOeQe/TaOIUf37oS9/kPD1q9KCCPzPv9f2hTZnTNLqUg1SZo5nQm+mzGCGEJmuC13zVMRVA==
X-Received: by 2002:a17:902:ea0f:b0:206:c486:4c4c with SMTP id d9443c01a7336-20fab2da20cmr33057325ad.57.1729694864996;
        Wed, 23 Oct 2024 07:47:44 -0700 (PDT)
Received: from localhost.localdomain ([43.129.202.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0c0e09sm58444105ad.139.2024.10.23.07.47.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Oct 2024 07:47:44 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: kexybiscuit@aosc.io
Cc: aospan@netup.ru,
	conor.dooley@microchip.com,
	ddrokosov@sberdevices.ru,
	dmaengine@vger.kernel.org,
	dushistov@mail.ru,
	fancer.lancer@gmail.com,
	geert@linux-m68k.org,
	gregkh@linuxfoundation.org,
	hoan@os.amperecomputing.com,
	ink@jurassic.park.msu.ru,
	jeffbai@aosc.io,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com,
	netdev@vger.kernel.org,
	nikita@trvn.ru,
	ntb@lists.linux.dev,
	patches@lists.linux.dev,
	richard.henderson@linaro.org,
	s.shtylyov@omp.ru,
	serjk@netup.ru,
	shc_work@mail.ru,
	torvalds@linux-foundation.org,
	tsbogend@alpha.franken.de,
	v.georgiev@metrotek.ru,
	wangyuli@uniontech.com,
	wsa+renesas@sang-engineering.com,
	xeb@mail.ru,
	Lance Yang <ioworker0@gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various compliance requirements."
Date: Wed, 23 Oct 2024 22:47:14 +0800
Message-ID: <20241023144716.69132-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023080935.2945-2-kexybiscuit@aosc.io>
References: <20241023080935.2945-2-kexybiscuit@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_074746_886871_C0040EB9 
X-CRM114-Status: GOOD (  23.37  )
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

On Wed, Oct 23, 2024 at 4:19 PM Kexy Biscuit <kexybiscuit@aosc.io> wrote:
>
> This reverts commit 6e90b675cf942e50c70e8394dfb5862975c3b3b2.
>
> An absolutely no-one-ever-reviewed patch, not even by the maintainers who
> got removed themselves - at least not on the mailing list. Then the patch
> just got slipped into an unrelated subsystem pull request, and got pulled
> by Torvalds with not even a comment.
>
> What about the next time? Who next would be removed from the MAINTAINERS
> file, the kernel.org infrastructure? What if the compliance requires
> another XZ backdoor to be developed without further explanation? Is the
> kernel development process still done in public?
>
> Are the "compliance requirements" documented on docs.kernel.org? Who are
> responsible for them? Are all that are responsible employees of
> The Linux Foundation, which is regulated by the U.S. legislature?
>
> Fixes: 6e90b675cf94 ("MAINTAINERS: Remove some entries due to various compliance requirements.")
> Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>

OMG, I cannot believe this is true :(
Please keep all discussions on at least one of the mailling lists.

Acked-by: Lance Yang <ioworker0@gmail.com>

Thanks,
Lance

> ---
> Please keep all discussions on at least one of the mailing lists.
>
>  MAINTAINERS | 178 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9659a5a7fb3..501aa5c0887e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -258,6 +258,12 @@ L: linux-acenic@sunsite.dk
>  S:     Maintained
>  F:     drivers/net/ethernet/alteon/acenic*
>
> +ACER ASPIRE 1 EMBEDDED CONTROLLER DRIVER
> +M:     Nikita Travkin <nikita@trvn.ru>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/platform/acer,aspire1-ec.yaml
> +F:     drivers/platform/arm64/acer-aspire1-ec.c
> +
>  ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER
>  M:     Peter Kaestle <peter@piie.net>
>  L:     platform-driver-x86@vger.kernel.org
> @@ -882,6 +888,7 @@ F:  drivers/staging/media/sunxi/cedrus/
>
>  ALPHA PORT
>  M:     Richard Henderson <richard.henderson@linaro.org>
> +M:     Ivan Kokshaysky <ink@jurassic.park.msu.ru>
>  M:     Matt Turner <mattst88@gmail.com>
>  L:     linux-alpha@vger.kernel.org
>  S:     Odd Fixes
> @@ -2256,6 +2263,12 @@ L:       linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:     Maintained
>  F:     arch/arm/mach-ep93xx/ts72xx.c
>
> +ARM/CIRRUS LOGIC CLPS711X ARM ARCHITECTURE
> +M:     Alexander Shiyan <shc_work@mail.ru>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:     Odd Fixes
> +N:     clps711x
> +
>  ARM/CIRRUS LOGIC EP93XX ARM ARCHITECTURE
>  M:     Hartley Sweeten <hsweeten@visionengravers.com>
>  M:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
> @@ -3802,6 +3815,14 @@ F:       drivers/video/backlight/
>  F:     include/linux/backlight.h
>  F:     include/linux/pwm_backlight.h
>
> +BAIKAL-T1 PVT HARDWARE MONITOR DRIVER
> +M:     Serge Semin <fancer.lancer@gmail.com>
> +L:     linux-hwmon@vger.kernel.org
> +S:     Supported
> +F:     Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml
> +F:     Documentation/hwmon/bt1-pvt.rst
> +F:     drivers/hwmon/bt1-pvt.[ch]
> +
>  BARCO P50 GPIO DRIVER
>  M:     Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
>  M:     Peter Korsgaard <peter.korsgaard@barco.com>
> @@ -6455,6 +6476,7 @@ F:        drivers/mtd/nand/raw/denali*
>
>  DESIGNWARE EDMA CORE IP DRIVER
>  M:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +R:     Serge Semin <fancer.lancer@gmail.com>
>  L:     dmaengine@vger.kernel.org
>  S:     Maintained
>  F:     drivers/dma/dw-edma/
> @@ -9737,6 +9759,14 @@ F:       drivers/gpio/gpiolib-cdev.c
>  F:     include/uapi/linux/gpio.h
>  F:     tools/gpio/
>
> +GRE DEMULTIPLEXER DRIVER
> +M:     Dmitry Kozlov <xeb@mail.ru>
> +L:     netdev@vger.kernel.org
> +S:     Maintained
> +F:     include/net/gre.h
> +F:     net/ipv4/gre_demux.c
> +F:     net/ipv4/gre_offload.c
> +
>  GRETH 10/100/1G Ethernet MAC device driver
>  M:     Andreas Larsson <andreas@gaisler.com>
>  L:     netdev@vger.kernel.org
> @@ -12929,6 +12959,12 @@ S:     Maintained
>  F:     drivers/ata/pata_arasan_cf.c
>  F:     include/linux/pata_arasan_cf_data.h
>
> +LIBATA PATA DRIVERS
> +R:     Sergey Shtylyov <s.shtylyov@omp.ru>
> +L:     linux-ide@vger.kernel.org
> +F:     drivers/ata/ata_*.c
> +F:     drivers/ata/pata_*.c
> +
>  LIBATA PATA FARADAY FTIDE010 AND GEMINI SATA BRIDGE DRIVERS
>  M:     Linus Walleij <linus.walleij@linaro.org>
>  L:     linux-ide@vger.kernel.org
> @@ -12945,6 +12981,15 @@ F:     drivers/ata/ahci_platform.c
>  F:     drivers/ata/libahci_platform.c
>  F:     include/linux/ahci_platform.h
>
> +LIBATA SATA AHCI SYNOPSYS DWC CONTROLLER DRIVER
> +M:     Serge Semin <fancer.lancer@gmail.com>
> +L:     linux-ide@vger.kernel.org
> +S:     Maintained
> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata.git
> +F:     Documentation/devicetree/bindings/ata/baikal,bt1-ahci.yaml
> +F:     Documentation/devicetree/bindings/ata/snps,dwc-ahci.yaml
> +F:     drivers/ata/ahci_dwc.c
> +
>  LIBATA SATA PROMISE TX2/TX4 CONTROLLER DRIVER
>  M:     Mikael Pettersson <mikpelinux@gmail.com>
>  L:     linux-ide@vger.kernel.org
> @@ -14140,6 +14185,16 @@ S:     Maintained
>  T:     git git://linuxtv.org/media_tree.git
>  F:     drivers/media/platform/nxp/imx-pxp.[ch]
>
> +MEDIA DRIVERS FOR ASCOT2E
> +M:     Sergey Kozlov <serjk@netup.ru>
> +M:     Abylay Ospan <aospan@netup.ru>
> +L:     linux-media@vger.kernel.org
> +S:     Supported
> +W:     https://linuxtv.org
> +W:     http://netup.tv/
> +T:     git git://linuxtv.org/media_tree.git
> +F:     drivers/media/dvb-frontends/ascot2e*
> +
>  MEDIA DRIVERS FOR CXD2099AR CI CONTROLLERS
>  M:     Jasmin Jessich <jasmin@anw.at>
>  L:     linux-media@vger.kernel.org
> @@ -14148,6 +14203,16 @@ W:     https://linuxtv.org
>  T:     git git://linuxtv.org/media_tree.git
>  F:     drivers/media/dvb-frontends/cxd2099*
>
> +MEDIA DRIVERS FOR CXD2841ER
> +M:     Sergey Kozlov <serjk@netup.ru>
> +M:     Abylay Ospan <aospan@netup.ru>
> +L:     linux-media@vger.kernel.org
> +S:     Supported
> +W:     https://linuxtv.org
> +W:     http://netup.tv/
> +T:     git git://linuxtv.org/media_tree.git
> +F:     drivers/media/dvb-frontends/cxd2841er*
> +
>  MEDIA DRIVERS FOR CXD2880
>  M:     Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
>  L:     linux-media@vger.kernel.org
> @@ -14192,6 +14257,35 @@ F:     drivers/media/platform/nxp/imx-mipi-csis.c
>  F:     drivers/media/platform/nxp/imx7-media-csi.c
>  F:     drivers/media/platform/nxp/imx8mq-mipi-csi2.c
>
> +MEDIA DRIVERS FOR HELENE
> +M:     Abylay Ospan <aospan@netup.ru>
> +L:     linux-media@vger.kernel.org
> +S:     Supported
> +W:     https://linuxtv.org
> +W:     http://netup.tv/
> +T:     git git://linuxtv.org/media_tree.git
> +F:     drivers/media/dvb-frontends/helene*
> +
> +MEDIA DRIVERS FOR HORUS3A
> +M:     Sergey Kozlov <serjk@netup.ru>
> +M:     Abylay Ospan <aospan@netup.ru>
> +L:     linux-media@vger.kernel.org
> +S:     Supported
> +W:     https://linuxtv.org
> +W:     http://netup.tv/
> +T:     git git://linuxtv.org/media_tree.git
> +F:     drivers/media/dvb-frontends/horus3a*
> +
> +MEDIA DRIVERS FOR LNBH25
> +M:     Sergey Kozlov <serjk@netup.ru>
> +M:     Abylay Ospan <aospan@netup.ru>
> +L:     linux-media@vger.kernel.org
> +S:     Supported
> +W:     https://linuxtv.org
> +W:     http://netup.tv/
> +T:     git git://linuxtv.org/media_tree.git
> +F:     drivers/media/dvb-frontends/lnbh25*
> +
>  MEDIA DRIVERS FOR MXL5XX TUNER DEMODULATORS
>  L:     linux-media@vger.kernel.org
>  S:     Orphan
> @@ -14199,6 +14293,16 @@ W:     https://linuxtv.org
>  T:     git git://linuxtv.org/media_tree.git
>  F:     drivers/media/dvb-frontends/mxl5xx*
>
> +MEDIA DRIVERS FOR NETUP PCI UNIVERSAL DVB devices
> +M:     Sergey Kozlov <serjk@netup.ru>
> +M:     Abylay Ospan <aospan@netup.ru>
> +L:     linux-media@vger.kernel.org
> +S:     Supported
> +W:     https://linuxtv.org
> +W:     http://netup.tv/
> +T:     git git://linuxtv.org/media_tree.git
> +F:     drivers/media/pci/netup_unidvb/*
> +
>  MEDIA DRIVERS FOR NVIDIA TEGRA - VDE
>  M:     Dmitry Osipenko <digetx@gmail.com>
>  L:     linux-media@vger.kernel.org
> @@ -14842,6 +14946,13 @@ F:     drivers/mtd/
>  F:     include/linux/mtd/
>  F:     include/uapi/mtd/
>
> +MEMSENSING MICROSYSTEMS MSA311 DRIVER
> +M:     Dmitry Rokosov <ddrokosov@sberdevices.ru>
> +L:     linux-iio@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/iio/accel/memsensing,msa311.yaml
> +F:     drivers/iio/accel/msa311.c
> +
>  MEN A21 WATCHDOG DRIVER
>  M:     Johannes Thumshirn <morbidrsa@gmail.com>
>  L:     linux-watchdog@vger.kernel.org
> @@ -15175,6 +15286,7 @@ F:      drivers/tty/serial/8250/8250_pci1xxxx.c
>
>  MICROCHIP POLARFIRE FPGA DRIVERS
>  M:     Conor Dooley <conor.dooley@microchip.com>
> +R:     Vladimir Georgiev <v.georgiev@metrotek.ru>
>  L:     linux-fpga@vger.kernel.org
>  S:     Supported
>  F:     Documentation/devicetree/bindings/fpga/microchip,mpf-spi-fpga-mgr.yaml
> @@ -15429,6 +15541,17 @@ F:     arch/mips/
>  F:     drivers/platform/mips/
>  F:     include/dt-bindings/mips/
>
> +MIPS BAIKAL-T1 PLATFORM
> +M:     Serge Semin <fancer.lancer@gmail.com>
> +L:     linux-mips@vger.kernel.org
> +S:     Supported
> +F:     Documentation/devicetree/bindings/bus/baikal,bt1-*.yaml
> +F:     Documentation/devicetree/bindings/clock/baikal,bt1-*.yaml
> +F:     drivers/bus/bt1-*.c
> +F:     drivers/clk/baikal-t1/
> +F:     drivers/memory/bt1-l2-ctl.c
> +F:     drivers/mtd/maps/physmap-bt1-rom.[ch]
> +
>  MIPS BOSTON DEVELOPMENT BOARD
>  M:     Paul Burton <paulburton@kernel.org>
>  L:     linux-mips@vger.kernel.org
> @@ -15441,6 +15564,7 @@ F:      include/dt-bindings/clock/boston-clock.h
>
>  MIPS CORE DRIVERS
>  M:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> +M:     Serge Semin <fancer.lancer@gmail.com>
>  L:     linux-mips@vger.kernel.org
>  S:     Supported
>  F:     drivers/bus/mips_cdmm.c
> @@ -16408,6 +16532,12 @@ F:     include/linux/ntb.h
>  F:     include/linux/ntb_transport.h
>  F:     tools/testing/selftests/ntb/
>
> +NTB IDT DRIVER
> +M:     Serge Semin <fancer.lancer@gmail.com>
> +L:     ntb@lists.linux.dev
> +S:     Supported
> +F:     drivers/ntb/hw/idt/
> +
>  NTB INTEL DRIVER
>  M:     Dave Jiang <dave.jiang@intel.com>
>  L:     ntb@lists.linux.dev
> @@ -18428,6 +18558,13 @@ F:     drivers/pps/
>  F:     include/linux/pps*.h
>  F:     include/uapi/linux/pps.h
>
> +PPTP DRIVER
> +M:     Dmitry Kozlov <xeb@mail.ru>
> +L:     netdev@vger.kernel.org
> +S:     Maintained
> +W:     http://sourceforge.net/projects/accel-pptp
> +F:     drivers/net/ppp/pptp.c
> +
>  PRESSURE STALL INFORMATION (PSI)
>  M:     Johannes Weiner <hannes@cmpxchg.org>
>  M:     Suren Baghdasaryan <surenb@google.com>
> @@ -19518,6 +19655,15 @@ S:     Supported
>  F:     Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
>  F:     drivers/i2c/busses/i2c-emev2.c
>
> +RENESAS ETHERNET AVB DRIVER
> +R:     Sergey Shtylyov <s.shtylyov@omp.ru>
> +L:     netdev@vger.kernel.org
> +L:     linux-renesas-soc@vger.kernel.org
> +F:     Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> +F:     drivers/net/ethernet/renesas/Kconfig
> +F:     drivers/net/ethernet/renesas/Makefile
> +F:     drivers/net/ethernet/renesas/ravb*
> +
>  RENESAS ETHERNET SWITCH DRIVER
>  R:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  L:     netdev@vger.kernel.org
> @@ -19567,6 +19713,14 @@ F:     Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
>  F:     drivers/i2c/busses/i2c-rcar.c
>  F:     drivers/i2c/busses/i2c-sh_mobile.c
>
> +RENESAS R-CAR SATA DRIVER
> +R:     Sergey Shtylyov <s.shtylyov@omp.ru>
> +L:     linux-ide@vger.kernel.org
> +L:     linux-renesas-soc@vger.kernel.org
> +S:     Supported
> +F:     Documentation/devicetree/bindings/ata/renesas,rcar-sata.yaml
> +F:     drivers/ata/sata_rcar.c
> +
>  RENESAS R-CAR THERMAL DRIVERS
>  M:     Niklas Söderlund <niklas.soderlund@ragnatech.se>
>  L:     linux-renesas-soc@vger.kernel.org
> @@ -19642,6 +19796,16 @@ S:     Supported
>  F:     Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
>  F:     drivers/i2c/busses/i2c-rzv2m.c
>
> +RENESAS SUPERH ETHERNET DRIVER
> +R:     Sergey Shtylyov <s.shtylyov@omp.ru>
> +L:     netdev@vger.kernel.org
> +L:     linux-renesas-soc@vger.kernel.org
> +F:     Documentation/devicetree/bindings/net/renesas,ether.yaml
> +F:     drivers/net/ethernet/renesas/Kconfig
> +F:     drivers/net/ethernet/renesas/Makefile
> +F:     drivers/net/ethernet/renesas/sh_eth*
> +F:     include/linux/sh_eth.h
> +
>  RENESAS USB PHY DRIVER
>  M:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  L:     linux-renesas-soc@vger.kernel.org
> @@ -22295,11 +22459,19 @@ F:    drivers/tty/serial/8250/8250_lpss.c
>
>  SYNOPSYS DESIGNWARE APB GPIO DRIVER
>  M:     Hoan Tran <hoan@os.amperecomputing.com>
> +M:     Serge Semin <fancer.lancer@gmail.com>
>  L:     linux-gpio@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
>  F:     drivers/gpio/gpio-dwapb.c
>
> +SYNOPSYS DESIGNWARE APB SSI DRIVER
> +M:     Serge Semin <fancer.lancer@gmail.com>
> +L:     linux-spi@vger.kernel.org
> +S:     Supported
> +F:     Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +F:     drivers/spi/spi-dw*
> +
>  SYNOPSYS DESIGNWARE AXI DMAC DRIVER
>  M:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
>  S:     Maintained
> @@ -23609,6 +23781,12 @@ L:     linux-input@vger.kernel.org
>  S:     Maintained
>  F:     drivers/hid/hid-udraw-ps3.c
>
> +UFS FILESYSTEM
> +M:     Evgeniy Dushistov <dushistov@mail.ru>
> +S:     Maintained
> +F:     Documentation/admin-guide/ufs.rst
> +F:     fs/ufs/
> +
>  UHID USERSPACE HID IO DRIVER
>  M:     David Rheinsberg <david@readahead.eu>
>  L:     linux-input@vger.kernel.org
> --
> 2.47.0
>
>

-- 
2.45.2


