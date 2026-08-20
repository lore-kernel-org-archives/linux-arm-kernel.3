Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666F4C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+QAAVwKn0uZ96Zg6BVsqfTiffVReTiQDqzxexuCpBls=; b=WVfEaxvd+/kDsSqI2NWjPIzT0q
	bIPal1KMwpn95PsvNrw9nHAn0GWmHdyiNyKs2vZ9LyiyUQWEiEIlyW/hVl6bArh5Rk3VlZUIBHHiY
	OaOc3XyR14H6clecOkBjOwVkVma65AlHOZ7d5DKhMc9OsQbSkh4FITnHONHXassIX4jCV6clcGl9w
	mzhU16C/OmvfaWG5/T7rkqWClNH/euRaT2kHN/PjlyupliDtzbGAqN7QUEZTHeA7JcgTIqNfw2KCY
	duvghvQtypotbUw+AJo+rMa30aG7FuPpnjLnmVx91hqbMh6RBtns797LcKXw9kv7JK1WAKK4pY/2D
	cUrwmqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyta-0000000BEoe-3AGD;
	Thu, 20 Aug 2026 09:17:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwytY-0000000BEno-0wLE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4815bce4652so1325940f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217426; x=1787822226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QAAVwKn0uZ96Zg6BVsqfTiffVReTiQDqzxexuCpBls=;
        b=qld9MNZIcQb+xPGWjdRMGf5a6LXf9debtDVZIMcHXLSxecMulWTwZqUaeRQM4CDtwh
         tJZCSaKKdG5Y1WT7y7DCiwCKvI12VlbbnzsVmqHhZRSTjORZyhdXith/h52cU43ILhx9
         x2KEX9uatYbwwuWSnlcPzmWYlEElZMt1zCQsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217426; x=1787822226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QAAVwKn0uZ96Zg6BVsqfTiffVReTiQDqzxexuCpBls=;
        b=PgN7PUp/kiEQCMhR1iWjZipeem/e518mztO2ypbHpr/d6DhWCEvnaGye0XyArI09YI
         lhFOfsQmGoiFN2gJWmt53gyYczfM24gP8n0qiPtev3LhUQjrJFtQB/rPNyyMjqxhu/4b
         D50aRlU4sxFM2ef34YBcaQ/VrDgvKCiaWw0xwyptNXUb//3xAlh84u5kzrcLE/AKkE0G
         nXBStbXHa+DTywEJ5BtQrx7W7duSYyIJhsTMJi2sqCH4H6spG67iY15JjZZdwDq6I6gN
         krENI6IuInn4eGV6sm5i8ejyn3Ntv67Oaq8VC8X3lZX7Jgsg5VjyV7Wnl0Rhudzb8fd9
         j8dA==
X-Forwarded-Encrypted: i=1; AHgh+RrL/04nmYFuiYbev59qYiCwx5hHPhw7sjzveT7/VKpY0jZDvq34pVwHG2xU9uBlDSSLybfooRP9dVmHTasEbhDc@lists.infradead.org
X-Gm-Message-State: AFuF++kAgXQZQi71Ny6Jyl50rdH+fhLzUAv8PqahheRw+cgFIGVmgQyj
	3QZmtNiVqPGRFj3BKb1D8w/nD0EsANufWJWCMTDIBzFLcbuYrcVzUqWbdqQkoUYyaaA=
X-Gm-Gg: AR+sD10CNQcrGz6tLrrP+7zEQzQvL/0ElZZMdPG8d/Qnx6D7NUDYy95Xu23BiyBdi4C
	D0NDN3NFRYAYQ4Q82SvsD8j1HRo8oN8QK2e+AJ7OC21ECDeDH5a9oSBxKK4iBI1em+xlcv5W+mf
	MKZRKmJGKbG176egdbSYXZ6d1iBFWaPqh2Csc+Ltjb17tR33yZTCekAXKpkx6OVI6w0rR+DhO3j
	0qWbNjoJBmPEpWqCfJXGxja8LRT6w39RZPwP+h8eSXH5NBFehZAujCG9/0evIhXyVo95CTNtqxa
	yAwx1+Re+/X0IgD5ChWjR9thkjIhBgKOza38K3mqLC5B1yqQ6Dtoo4/6dDpXCGKwVU93ek3rtRo
	FT33VAsE2BTuQw9dRhir0HT7T7g4qCD/GaQRw0YwTzx/BwlSdmPAawT5hNXmn8XX/axB1l+TxPs
	gk0vsWPLAj4IYbxmkArxhL7SkChE8y6AM2GNUlbGkpUYaPgdnlbxEyCjK+TJifgyPGo98EaBx4g
	unDKuZ13AHk6h/NVDK2BFtJRwBmGnlGA52v2qCwChRyRoenl4R/cpgkzN9Bhx/xc9XLdMw5iFCm
	1h3iwsRucRptspE6K6g5h0i9SR9o4VZd1B8FeQAEO+2H4pRgso7+CnI8so0/aw==
X-Received: by 2002:a05:6000:2c10:b0:47f:cb39:10c4 with SMTP id ffacd0b85a97d-482b1fd9f1emr18196475f8f.12.1787217426164;
        Thu, 20 Aug 2026 02:17:06 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
	devicetree@vger.kernel.org
Subject: [PATCH v8 00/16] arm64: support Engicam MicroGEA-STM32MP257D-RMM board
Date: Thu, 20 Aug 2026 11:12:08 +0200
Message-ID: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021708_299137_5500A085 
X-CRM114-Status: GOOD (  15.83  )
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

This series adds initial support for the Engicam MicroGEA-STM32MP257D-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly.

Changes in v8:
- Add the "d" letter to the board name (DT file name, model and
  compatible) as done for the other STM32 boards.

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
  dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257D-RMM
    board
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
  arm64: dts: st: support Engicam MicroGEA-STM32MP257D-RMM board
  arm64: defconfig: enable configs for Engicam MicroGEA-STM32MP257D-RMM

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +
 arch/arm64/boot/dts/st/Makefile               |   1 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi        |   1 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  17 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  16 +
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  63 ++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 319 +++++++++++++++++
 arch/arm64/configs/defconfig                  |   4 +
 9 files changed, 756 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dts

---
base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
branch: stm32mp257d-microgea

-- 
2.43.0


