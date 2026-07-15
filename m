Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A2CC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s7/O6qGB81uqhgF81zXc/vEeCCHddKD/wXemIEHEACg=; b=zwM4FtV2K7xgUBMZDGj6Ja1n3O
	Vi6+LSdVSRGsAgbKTH7FCzrA+GcR9H/5umnOCS7J7pIHBSvCPsjpsnVuvj9LhfGWhtNJXIRergbKi
	mRpDwj5CEOG0kQa/X3/vMOFVC+QNOWipmTk4Qmfqs0B6XYU0izITWeKcd9/6DGj2QXy0XbVEO+WND
	uaMerTkhvkjVgD6Honx9WHIp91KmEyICLAvost10jhx6SVT7RuwOKoo5Qb8JjsfDkY6g/QBDiGFLU
	AtRUBu5zvjShFe1nZ1KmqKlVzTINPR2MbzebXiiDj0fy58cW9NdGBSAISafvbD5Gey0CaxSAPTemu
	mAkEg8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0Z-0000000DsGk-3j1P;
	Wed, 15 Jul 2026 06:22:15 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0Y-0000000DsGB-00xw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:15 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-69c5eb6dfd3so6357785a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096531; x=1784701331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7/O6qGB81uqhgF81zXc/vEeCCHddKD/wXemIEHEACg=;
        b=Z7oZQljil9KpwAip/8RCiX3jzKMSY6PPj8MCCuBHP1YSix0psiEY6n6Cu3YBpzMhtn
         S/wzvoxz+vyOMTPp4VdSkoWdIfYsH2RbyO62xusI09a4/spnoJDRml1Dbj3dWliA8loX
         paoMuEcnubsyGLkvpe/AO8pggQl7Lbg2MLCbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096531; x=1784701331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7/O6qGB81uqhgF81zXc/vEeCCHddKD/wXemIEHEACg=;
        b=UewCzzPEWTQyPotCgMFY355YzIJSQ3KJxOHuXrfZbb30eNT9uF+6lLOoKk1cAhpM0D
         EG7mNwsWLKVL893lAR9H/GtxQV4GzG0p7tUyIY48u2YhdaLYb04SVAD96h+ANEb1xuRg
         Ztij9Wh8lAwCwAfpdxFeefOHNUNSFyOzzDLa4xfTjTIUH3C3uLMG2P9JKFuVM5o6gaM3
         t+G5Hc353DETrz+zasvSd/LaobYXdURxOUtaIk2OmPRCZKo+zC3rbT+Q3SKxATngkIEw
         s1QgveCdE890aPGZivcw89xOXBdczX42sqVr52GbW2Ny6sEQSqPPha0yV0lyh27bo02/
         4JuA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3kshYVcndKIkcpiD7b9lMQfxsian6+/Usu0o1QU/SxXZd1a06lghQIIk3osV4AWDCU1+zm9ksLFx/VTSM1sd6@lists.infradead.org
X-Gm-Message-State: AOJu0YxZbqm7Vkze56ULhNbYAzlUcVzkBTekvU7kEwysOlm8VuH5eaTB
	PDUGv0LfiqnQ6Vy2y+sJ7HrP8LwzicF+q5CgzEarxp9HhLU/H2XhoofbMLI1tqosvgg=
X-Gm-Gg: AfdE7cnUP2mLBOBWSxiFl1dtH7bZDtaRfC/YSwN9A5zN8XLcVokTqHESUQkvQp3ZRc2
	mYz6ljD0cO9DX5A3Ilj0IiS+5KRg1VOVhCPb7KsCo4/UqcFPrS8Rdn4ORAWJG9/hLbWI3pemfct
	1tFaXeGhzPs0C7R/eOwmB1EN5ohYiOiH506jQ0dvuSgof4S4snSNMQkMw9B6Q0UXipummchwIUa
	uKiV6GAh0iGTyN5bHwjBRgMlVZ70rd3/YLqjR8ExKCrKlpxSfvoqD4TpoHBwFJYkbjcfrlg5qYf
	td/dE2JTOFDJvLd707Auj5NDtBYVtE0l4ZPjR1I+ixhGd+gWC58FPFUqYFw6pTYoOt/FIcKbvh1
	LFfQg8XilyJvaa/sJR267xmkP83NiHduW+Uzwp1QmMY/3sHrrwKEhSHUH9DuLBbaL3KRd3KdSjZ
	L+89wd28hVSWmbgDOo8eR6c1Xi7Lpwb1Bz/0liMGRphYgwCz1bNKtC7g4pxLPOl9AOFkm+FWcKP
	ftVFaFeYg2s
X-Received: by 2002:a17:907:608f:b0:c12:d42:96b0 with SMTP id a640c23a62f3a-c1667aa9699mr327593566b.47.1784096531463;
        Tue, 14 Jul 2026 23:22:11 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Sven Peter <sven@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 00/16] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Wed, 15 Jul 2026 08:20:17 +0200
Message-ID: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232214_077751_0AF2616C 
X-CRM114-Status: GOOD (  15.57  )
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

This series adds initial support for the Engicam MicroGEA-STM32MP257-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly.

Changes in v7:
- Add Reviewed-by tag of Olivier Moysan to patch 10/16 "arm64: dts: st: add
  sai1 pins for stm32mp25"
- Switch CONFIG_I2C_STM32F7 and CONFIG_SPI_STM32 to modules in
  arch/arm64/configs/defconfig.

Changes in v6:
- Update arch/arm64/configs/defconfig to match the current upstream defconfig
  after merge window changes (no functional changes).

Changes in v5:
- Add patch 2/16 arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
- Add patch 3/16 arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
- Increase slew-rate to <1> of ltdc pins to support the 27 MHz pixel clock
  and prevent timing violations.
- Change SDMMC2_CK pin bias from pull-up to bias-disable to avoid signal
  integrity issues on the clock line
- Fix touchscreen resolution to 480x854
- Fix SPI1 CS0 polarity to GPIO_ACTIVE_LOW

Changes in v4:
- Drop inclusion of stm32mp25xf.dtsi from stm32mp257-engicam-microgea.dtsi

Changes in v3:
- Add power-domains property in the SDMMC2 node.
- Drop patch "arm64: defconfig: cleanup the defconfig"

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"
- Add resets property to dts CAN node. Suggested by Sashiko.
- Drop the clocks property from the sai1 node in stm32mp257-engicam-microgea-rmm.dts
  to avoid overriding the peripheral bus clock reference defined in the base
  SoC device tree. Suggested by Sashiko.
- Reference the existing labeled nodes directly at the root level using
  &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
  redefining the entire node structure and redeclaring the labels. Suggested by Sashiko.
- Drop the #clock-cells property from sai1a and remove the reference to sai1a from
  the clocks array in sai1b, relying strictly on the st,sync property to handle
  internal synchronization.

Dario Binacchi (16):
  dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
  arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
  arm64: dts: st: add SDMMC2 support on stm32mp25
  arm64: dts: st: add CAN1 support on stm32mp25
  arm64: dts: st: add i2c1 pins for stm32mp25
  arm64: dts: st: add ltdc pins for stm32mp25
  arm64: dts: st: add can1 pins for stm32mp25
  arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
  arm64: dts: st: add sai1 pins for stm32mp25
  arm64: dts: st: add sdmmc2 pins for stm32mp25
  arm64: dts: st: add spi1 pins for stm32mp25
  arm64: dts: st: add usart1 pins for stm32mp25
  arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
  arm64: dts: st: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: defconfig: enable configs for Engicam  MicroGEA-STM32MP257-RMM

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +
 arch/arm64/boot/dts/st/Makefile               |   1 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |   1 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  17 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  16 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  63 ++++
 arch/arm64/configs/defconfig                  |   4 +
 9 files changed, 756 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

---
base-commit: 58717b2a1365d06c8c64b72aa948541b53fe31eb
branch: stm32mp257d-microgea

-- 
2.43.0


