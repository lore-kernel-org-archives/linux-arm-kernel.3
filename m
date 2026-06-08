Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980FBCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8d17gntFj9cyOcdFrgQoUlzT+noL9BgQQAWn2N+JpH4=; b=lMQ/KPywPlidDJBp4Jp1hIsEjs
	fEwilyjjlfi4lt4WK41nkZWSUjdoCfTvoLZT7iTR3GIYIp/MowoxBo+kersR6fkTQRdK0uNrk8Kq1
	aBRopsLSBMulZOipk2asEOXBVbOHMZFLzMEfy6LfMnPKUxRGrJB2hUnClOsM3msbJ4nINVhFgqBbz
	O2KHdw6u1BO4F6a5f8TzZyg8gcHVeeFdRMHqzT9FT15mo4ORTcptR+HW5wkD1s2b4Utdy5UrPxRTV
	+k5u/BVZKcTotmogtgluZIsrROKD7NMoWlz8l99laqOJBHPoZ+uxpUizEB6RHtt9kHhN8e0VhgQuI
	we6ZZJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWas2-00000003jIG-2yaW;
	Mon, 08 Jun 2026 14:22:30 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWas0-00000003jGO-0wyX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:29 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-bec3ffb95dbso678608166b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928546; x=1781533346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8d17gntFj9cyOcdFrgQoUlzT+noL9BgQQAWn2N+JpH4=;
        b=d5XXrC2dXzHR6hE+ggfaZSncPz0zzKSXW4ihlKR4joB+i5rivGFFjDbKk9VBUS09BT
         hnQvfaM7rF1ygbL+v+1MZhk3x5T9H4XbAHPA50WQDKcF2I6eHB/BUqGR35/+Hnc5gnNt
         GjyweN7BKOapNeBPRBL3WnGbPioef6oQ6mxqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928546; x=1781533346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8d17gntFj9cyOcdFrgQoUlzT+noL9BgQQAWn2N+JpH4=;
        b=SrfQ22jTQkK0Xhvu2HQdIj4cztlTukdtOyVrAZ22TDaOHToep05Xu9LWHleknHksdC
         u0NFe1VvSE7StURSdmyjaGn+U9Hb/naOH+8E7thakhjXowTjwLjZVOJIaykJCogBWYvv
         2y0Q6M0KSKfHfxG6ZbJzDL6WlDKgHMHVBAQGqgF2ZXlSxYTBNvhUSin318aNXoU+Z0uC
         qoq7PViO5wWUVTqmd8oJluA2e9LCRXxOuPow+CdKOoonIbSoCv3nAZ6/IopeJZh5lBZQ
         ZtSQb43TRLnSk8XKuqHUznXupFgRnx9sae4zxbo+lgOXyifrNJM0JE2BAQf5m9D21ZY0
         4yVw==
X-Forwarded-Encrypted: i=1; AFNElJ9UxBGsF+1BBvyU0JNmxTiAFyGg+jLaElb8gJ6tjd0wTG5mghth5sZYUWdjILAteWXgt++K40615U7yXbYiGd4U@lists.infradead.org
X-Gm-Message-State: AOJu0YyFGj2FwmS5oF61HSDOjJNdrqfDnGn+jzIbkULWT5rbnbBEX7lY
	N6OGA/SIIKB+C9OHxYyBoyCyawrRSPDfKV2VSS3FKsmRp8/aY4rVkpbFHPQ+XEs2IEA=
X-Gm-Gg: Acq92OF0ortgczGKHtBl4ZPgrp+YmL9w4FOTXvg1CXBIYDtVRIRxhUU93nJmQg+rWcN
	VJ/WXIUmMQJi34gZTaMto/3Zzl4olfzddyV3Ib5UXgKZXmYQYiVL7nU3QAuJi7hSP1PuvFM1/VM
	/Ua3+Vz6MVXb78uIAGPT1YS6ZE1L0BG2RyQ8Pj57jPCNnKnNJEE/3MAvu7Uf2pR6C8B7x+YVENQ
	b6lXOxOmisp94eqtkvYv1z/3BHkBatMGGkpLm/r+7/ce4S0xQkmDXmkAgQsQk20hUQIN2pEXZyC
	86wo7b5s+OF5/D5nq6162vNSv1q41llxvY2iJJHXd5cqqjQIJKdZdnMLW59s5h3bV/DfE8s2BcC
	5z0KrdPM04PG+nChVEQBS+vL0rE4eDJ7i0+4N5/jqz+NiDRfiHAmo8lt6rxcoDSCaE/nlptAcbI
	AX9EMyE+eoXLs798RXQZo0agphaX5+wo48MV/Gteo1JVO5BnEYRWQt/nEb2NFx/Obg1+C9gu1ID
	k8+mW9DVzgX547/z3rCEXU8gNkEjcfrYRbifwou37zQBB4p/iMcgNTONBM=
X-Received: by 2002:a17:907:8b93:b0:bd5:2859:ed0a with SMTP id a640c23a62f3a-bf373306ce1mr774111666b.42.1780928545606;
        Mon, 08 Jun 2026 07:22:25 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v5 00/16] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Mon,  8 Jun 2026 16:20:17 +0200
Message-ID: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072228_302903_156622A7 
X-CRM114-Status: GOOD (  14.53  )
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

-- 
2.43.0

base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
branch: stm32mp257d-microgea

