Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4F0C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4BJHpUuMHIcGkru8O+ar1GYYsPK8fYRSzg/ibliPX7k=; b=kyjVl9WsFZCcoJEecSd9U+iqbk
	BB137ZarVbGKk/M5fh56yB4na+tEojfrPcjIsO9fpU/t+1nszKUJG9SJ866bj0OiAqKJu9EWltBn1
	AC1aWB3Vo3tUYPhcJeUTM5NJiMfiGoFvdVuWTA7ZRP5t4MYwBdP0rGNJA57x83RHpTpnKKh2OxBve
	5+8alrqSIoAOUrrMYxAIqEUE1nc1MbUGWif8+W2f40E1bhIzaRoKiu3xI31eA4dxrh7WaZEGAHKUX
	rvdbCLFfgbce2NwKZOKmGq/ls1ipTt/go6sB7m5e4/79Cwt3x8dC6ad90pxIO9yqbseI+e2iRFXdH
	9gGrjtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNr-0000000BPNg-2dtG;
	Thu, 24 Sep 2026 15:29:15 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNk-0000000BPGm-1yf0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:29:10 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b91369d18so15473215e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263745; x=1790868545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4BJHpUuMHIcGkru8O+ar1GYYsPK8fYRSzg/ibliPX7k=;
        b=xOYKA5s0hxVQadZbCESwws0ymb8GiVTpf96GCHkj4kPQdQ09RnHmfwepMzxhl0YaCG
         rJjBHR5Yb7EIGVNYClYrO8id0dvq7XxEgwH6HgZi9mV0kTD5twqPiHTfM/n6wz8qHBfS
         1TIxHakDhwtVAQbBglNPFcGggI1gTpFZK0ALtsSDna6O9spodedO6bKyi8M+OXsaMLgH
         sQfxtrqLs5cBZBKthbjApqwVjH7QoF3DsTciE8AA5gUmENN3cqj6cZDazmVoQffX9pq2
         SNqAYUQ+7nBcy8YL6QzYg6D1IDI/v4NEz6T7iPsWPt5FqiAHOMm4D/QAbOQ4lKlAISvI
         zzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263745; x=1790868545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BJHpUuMHIcGkru8O+ar1GYYsPK8fYRSzg/ibliPX7k=;
        b=jyGFVAHAYYJFpPMaccZIi9h0JT9bWppYwsklKb2CxsT2Z/RQVHqDFQYwrwiEAztE7H
         bcEc5YAhe5bJS92NyugwWUDtLUD29g9pGrfPhhQVy1uQGj6NFeosyzJ8fW1ggIRTseD5
         TRRdaob8MXw/gtXYueGFnfdgjOy4Xcgrz6KUJvyo3u+aHcbBcKv3cFmtwLn4kuimw+f3
         Uzr1Uy35lUZWMlU931OS0BX4L2BfM8GvfM3kMskwrIK836qwbuR3bqdY3Btez4ffbbjD
         onx6ihac9TpuyeJBXZJcNvjpY7nSsVNa4hFwRwoDTj2t7AcW68KM/p+d1dT1SOHMA3SN
         4KVw==
X-Gm-Message-State: AFuF++lAnwsqSvEUi/oAoCwHTunXbWNqWflrg5SoDesV3gZcwnobpfzW
	fI52L7V9VR8Zx9MZ+p9CjKmkHFNjKqjB/o8gcGIdJxksCEttJ8aonLXP6XSWnTwpDD8y9XApfAw
	InVC5G8c=
X-Gm-Gg: AYBFou0RP8ZOTxlsykLqdFN4e+4UCGGAaM1N9bVpjGdPCPivakPvjSUyzlEicxHp0Jo
	5dwAFb2pCh3MxPxQTs+WkDSoFqDZ9dloPC54woeWejWrt52IBO8gkBfD2YyYOYrG/kKHZPO0Bfb
	ameSHYQxWKrXJlyY6UnuqD76Xf0y0cpQFs0pn9GSVT+b8tjYKjpukB+7zHfbOT6pUTPY59quKdQ
	QX4v9Q2TpYEFqKKEmqpiIl/TrM5NOcL3yHBinox1jANbkweaidf1zJM8FTz7YjeO3RrGbb07gkF
	ItfoZiv3TNFsyoJ6EisdJv5meOsqyC4rA2ByHDzOCfzqqur6yqvb3RXRR78NG9zZdAqoMZh//j7
	309BhDKJ8NJxReNRBVodDkK6zcWiOpXJ+apy4g7mG5EloETjh3Cr6Lpce5KbvFAS72FaeS2g9BT
	zQrl6o1fzhfOOp17CYEI/Ep8d6fsdQmLqH3HAmluIreu+T//yWcLnkZWwVuMgKv28b6Ljhthp4m
	O1egbbfn1QNPVthGx/nPB9WUBnAIp+K+qI1V94Pg6OenToS5kdAT0EnSg==
X-Received: by 2002:a05:600c:8b86:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-49fe6701ed1mr48662085e9.34.1790263745003;
        Thu, 24 Sep 2026 08:29:05 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:04 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 0/6] arm: sunplus: add Tibbo LTPP3G2 board support
Date: Thu, 24 Sep 2026 17:28:38 +0200
Message-ID: <20260924152844.81705-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082908_682254_6261702B 
X-CRM114-Status: GOOD (  15.81  )
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

The Tibbo LTPP3G2 is a board based on the Sunplus SP7021 SoC:
https://tibbo.com/store/tps/ltpp3g2.html
It is the platform that underpins Tibbo's industrial IoT products.

This series adds board support to linux-next:

 - Patch 1: vendor prefix for Tibbo Technology.
 - Patch 2: document tibbo,ltpp3g2 compatible string in the SP7021
             board binding.
 - Patch 3: add device tree nodes for SP7021 peripherals that have
             drivers (PWM, watchdog, eMMC), plus a label on the
             gpio-leds node so board DTS files can override it.
             Also: move memory@0 to the DTSI (512MB is fixed in the
             SP7021 package), and remove unused board-specific pinmux
             nodes (emac_pins, sdcard_pins) from the DTSI.
 - Patch 4: enable SMP via PSCI 0.2 (HVC) on the SP7021.
 - Patch 5: add the board DTS for the LTPP3G2, covering eMMC, a bit-banged
             I2C bus, PWM, watchdog, and two GPIO LEDs.
 - Patch 6: update sp7021_defconfig to enable the drivers used by the
             LTPP3G2 and correct a few defaults.

Tested on LTPP3G2 hardware on linux-next-20260916.

Changes in v4:
 - fix problems reported by sashiko-bot
   - fix PSCI method: use smc (confirmed by boot log: "SMC Calling Convention v1.0")
   - move board-specific mmc0 properties (bus-width, non-removable, etc.)
     from the SoC DTSI to the LTPP3G2 board DTS
 - fix similar problems, i.e. nodes that don't belong in the DTSI or DTS
   - move emmc_pins pinmux node from the SoC DTSI to the board DTS
   - remove unused emac_pins and sdcard_pins from the SoC DTSI
   - move memory@0 to the SoC DTSI (512MB is fixed in the SP7021 package)

Changes in v3:
 - fix problems noted by Krzysztof Kozlowski
   - put the Tibbo vendor prefix in correct alphabetical order
   - remove bootargs from chosen
   - name DTS nodes correctly
 - fix problems reported by sashiko-bot
   - add tibbo,ltpp3g2 compatible string to sunplus,sp7021.yaml
   - rename i2c_tps to i2c
   - rename system-led to led-0
   - rename sg-led to led-1
   - add the missing pinmux node: pins_uart3
   - fix pins_i2ctps: use SPPCTL_PCTL_L_OU1|ODR, not L_OUT|ONV|ODR
   - fix pins_btuart: remove SPPCTL_PCTL_L_ONV from BT UART RTS
 - don't disable CONFIG_SMP, instead enable CONFIG_ARM_PSCI
   and add psci to sunplus-sp7021-achip.dtsi
 - increase i2c-gpio,delay-us from 1 to 5

Changes in v2:
 - fix issues spotted by sashiko-bot.

Andrew Gaylard (6):
  dt-bindings: vendor-prefixes: Add Tibbo
  dt-bindings: arm: sunplus: add Tibbo LTPP3G2 board compatible string
  arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
  arm: sunplus: enable SMP via PSCI on SP7021
  arm: dts: sunplus: add Tibbo LTPP3G2 board
  configs: sp7021: fix defaults and enable existing device drivers

 .../bindings/arm/sunplus,sp7021.yaml          |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/sunplus/Makefile            |   5 +-
 .../dts/sunplus/sunplus-sp7021-achip.dtsi     |   9 +
 .../dts/sunplus/sunplus-sp7021-demo-v3.dts    |   4 -
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 193 ++++++++++++++++++
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi |  74 +++----
 arch/arm/configs/sp7021_defconfig             |  32 +++
 9 files changed, 278 insertions(+), 49 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

-- 
2.53.0


