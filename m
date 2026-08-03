Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4496DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sNlUdtZv1U92AaYRcfJDdfYbwR3SmucTbtny3HUIZ2o=; b=NiE1DJdhhgHSxWvyYXuZGYyV8M
	v4BBJFcSUiXKrluSTFUZqOPFe3aEi0MWjyptEMOtknhZrszYfAgIdpwTaXb5iXB2Eqi/+fkkU5auq
	0FfDGb4cMJlYMcC6F+elwc2N5Wo7V/SPu9V9x4jU23NoNlPw7tg83BuIFMBZRtny6PB0d3nn39NKa
	PKcj+hVkGvExK511frSYCG31PdEL2LZKqXzUii9TnrJt8ImjuHHNGyvMEAX9BkzcMMMd3qt/xw/V2
	zQ8Zq3bWhCqQjdhfMUS0HYm0HBbUzajwwUOp5kYx2yYaSutvqNZIt9Ue/Isj9LyYGtnBkO03LE1F8
	0CsPn25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnJk-0000000GXDe-17Fh;
	Mon, 03 Aug 2026 07:42:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnJh-0000000GXCm-2GAe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:42:34 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so1544250f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742951; x=1786347751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sNlUdtZv1U92AaYRcfJDdfYbwR3SmucTbtny3HUIZ2o=;
        b=STJIJWMkeJc47dg/woZcVt9raEit26iU7Umy+5EOv90VumtbvEG4LWIl4g6zmnOA17
         +97Cop/j2wjLn65TMM+lQTsDIbh0dr0wLbkpVjYBc/XMZMaNjVL6FXCe9VbN4zCL4CDI
         tmtUfqK95VbFzHS3SpX661DtTBmE/XKnwpvx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742951; x=1786347751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNlUdtZv1U92AaYRcfJDdfYbwR3SmucTbtny3HUIZ2o=;
        b=AO6ZEW/fFjxCg1+2AzJdEkZUbM7LrPmIAPe0o5ovTkOYAHBQR0GAEIC5eQD2LSaB1J
         8DEh3kCwuFo3uLnmRWup2OCI1UU18Z7LONMILONkYgEGRQZlGEyuw7gnnzVfVDr6TpFp
         8Y8ALGdAZx4WkV4FgSnqVYikc7Mx5yhMgu4ILyQpvpz0Lc3J8TzOG0Wltr92Nig/OoQf
         Gva0Sc78qE1/cWnXZoaHV2TgWVtTRYLzkPcNCrLNLzIKB9zCAGFzTcEFJ6qx5anmtRJI
         I+mt6ThGio4DPmenU4tUpcmU0RkBmG3w78Whp0Juf3Op4fqibvbdyBXEfvptOWT8hvzO
         +Vwg==
X-Forwarded-Encrypted: i=1; AHgh+RohfSDzs+mSsAhUE+1DKicURDdMzUF5vyy83qcoFNSL4LIN0vT5dFk4lEVCeQlOHngYUQyLxj3SD9My7iIh4CZw@lists.infradead.org
X-Gm-Message-State: AOJu0YywFX+fF4VV9QBoanNpA+/A2W1Hi8Ek/tm4nr7dPEYmV6nqP16i
	me7Ayevve4MnbE+NkDrQh+RrZobih51ZPwD0MAxppE6Ze67zoBXOgCbyj8iQveCjSiE=
X-Gm-Gg: AR+sD10uovafo8N6Gtvwv3p7alQCcdYDNxafgfMmS4UrqOLt6k8EC0n+imN4hzyMGZ7
	xDXG7U0jsqGXynVC6sM2MxQ7cMmSeNsq2PXZNEWw03nBW5btN1SOH4NbCtsINr2aW0TUGlqG9o+
	ovRBELbGEuwitBWAdRYdEFO4o8FaLyTALRV8VaCKxF7MshWDPELCYhexCANKBTE0mpfFJQbbMTi
	05gtthrY31oterlPRwBQayleSEx4tb85fjQ63ciNjHJXCFxZ/V1jAkc8OeOtz8hWVD5/ZcKoJSn
	vm55+YsGx8q7gIfcteTy5XlQ1OqOxwCIg8hMgoJspxpcFvYJzlTPK9LvWnIjgN+LXpmRWUItl12
	Y/KFMRFeF2SbQsm18WEzHxvseaj2TfVfKyU5hLcvtFcjE3wf7WkmlI/JFA/vdKXFEDkuBdfCPWv
	/CXs8Du7ZD9Ki+yHktPXtP1igKwHnPT1nTThqjNRhS/XonrGhq6kLOK8EuxnLWV04pB0RRZv/Ai
	C+5/5jCuC5FFsp6IwJpVcngTKyh1jJn1+18MAhjb2sLUViPEP3/baMiQYs6dqz/EAVLLQzUSb4u
	ZKaJ0gKwbY4+LXzuflioS9+Q0ZhkujuAY2k27obbNBJ8KEQxvCAfGTwS/ZHDAPXBhXLm0E8y+hF
	OldJ7h8zOsqc=
X-Received: by 2002:a05:6000:29c2:b0:474:530:9d with SMTP id ffacd0b85a97d-47fd72b03e1mr15197737f8f.13.1785742951187;
        Mon, 03 Aug 2026 00:42:31 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
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
Date: Mon,  3 Aug 2026 09:25:55 +0200
Message-ID: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004233_643847_ED78A9CB 
X-CRM114-Status: GOOD (  15.73  )
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
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
branch: stm32mp257d-microgea

-- 
2.43.0


