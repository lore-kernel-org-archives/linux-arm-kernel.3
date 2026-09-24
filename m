Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6B4C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hj0UVsfYiWhPlWaYB8MRXXhCW6m4U+4Gy8c6vjRO9Ts=; b=m8Lj+nUPapOeqNFrj81r5/f1Yx
	aUvY7oYO+TOdNm0EUVQq1gUozsWQtJyt+oLoKzg+1oMAI8SlRj/dgDKCGyI2XeEptVcRr/ZO63L2C
	JlanAm6Sr/yGJWnqPsv65ox5p/nuIJCqG7PoE2DKi3RjfWoxSH5YF1OxcKt7+Y1z68rmLgu2i775P
	kAsQlqfWWUTUlYBzOR85+3KvY6sZ+E5HQjjkQ13l4zXSKmi4n6XYNsrh4b6lbVEG7cURWlRvTWmP3
	voJ0011osFWXvcHERGVOQix2VftKKzXJdTWcfsfV6YFiGRKAby3pKPM/ZqVwIV7rMBmid5Z17dy2+
	P4r6m1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mdv-0000000Be2k-0lgV;
	Thu, 24 Sep 2026 16:49:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mds-0000000Be1r-2vXf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:49:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49e73611928so6886565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 09:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268591; x=1790873391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hj0UVsfYiWhPlWaYB8MRXXhCW6m4U+4Gy8c6vjRO9Ts=;
        b=b5D5cWo23hpHoqvRkajliM4SmD7oNGuhhrcKrlT63h0Oo64MgJDLcN6hoN5mgQEQ3Z
         9qtkQ8ZNemWVhBdClwB7RFFdkvZ7hRUBfPYUDO6J+IB+kuJnM+ywKBoUp+6ZAkjWJiwP
         RbMWyvHnqf1Y2dDeCC+EGENgbHvBUyF5ei6HifHQqo63eZmzb/mrGkb5DvnMj8mtvTSR
         DuNfrRsP8Q16NeJcRklJddtvOCGp1PqjBmLmd++Q65XkR+OTT3tLLwGyD5CaBWK2YCK2
         OyL7xmXZnNPoHy9Fe9zddVOPMsq1kLjfXUONQ7QrI7p6ndaYSUb5w+bP9OLo8LKpNaiT
         B59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268591; x=1790873391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hj0UVsfYiWhPlWaYB8MRXXhCW6m4U+4Gy8c6vjRO9Ts=;
        b=oHjr4r5pANvB7FTre55y3jphRUHsWK0mOldRzG6V/PezRjAr7v9NkL+FN+cpJKpqeD
         eLHfcssqOURAWkUqxF9NleopLrfQ4WRUG5G9mdGyG5vXXJdRy6sknkXwNvIKdGhGReHP
         9fuVHB63UmMJBb95GXxc7x9iXeFc/llQ8iQXoiwKBk6I8u762uEDRqd74uCsoTMyhyJE
         24XwARMGL8ejBfl0Sb6ZQaZZcWpqY3YsFRS6c+T7MGNJUnn1PrysjqQIe+uha0X8atL4
         VSnvssS3svtaYYoiY4AZ3EL0C9kSbQasYQS/RYh2XjnfeKLuj+JD/IfcrWT0e9OnEP7O
         Dx3w==
X-Gm-Message-State: AFuF++lHmf4iS7yMT0YW1pgtZXCmmrRoklpHFsLJ9rsNotX0lQVuJ5HU
	hqAVwlTjBYGr4anRmjWxLAbNpAxFoLwu14U0Btz5X3wC5Aj91kL/I+2rBr3nlr+1hLDlux/K1N/
	k8fORaEQ=
X-Gm-Gg: AYBFou2x3o8wezyYsS+VGqGwxKJrXDVdgVcnXI9vDjDFeEK8mByA1oAX/awTKJxPeeP
	c99Or9EL0w03OkVoAvgO9Je61FAcFND22oKYM19CUXHsf20hUt0Jj+cAxIKJCaehm0ss6VQE9aV
	Qdo0VIuXZgt6B6qtqVXoBmTeoAnXcm1Hxek2XJv3FaFGvTXbdbvFE0ImoMwPTaPo4In962rzebS
	lj0+ZZ4yCqkLcZKKsMP02/LAG7ip10itntkqGox9PrZvlEBpO50DTZf10vEnVN7ZxSnCI77+4Fn
	pJ46y79IqIhOELumKsbWe3u/FMFi3m7eOVk6u9awPGaCXfL/4Hm7akoK9pqy5aLjQxrFLdZSn4G
	VQbIhQyju+8t3Vqy3Ppa0GTQqxND9PBwAcKgIobBj3npDFujbDALKztc4hjXiP3HBpR5SakzexV
	KeaAHQ26WCRQMwg+nNt6aUAWAUoUz8+lUDXyAevQ+RYbPEHDHwouyZBZrQV0/FxodvJqBaGMCZs
	jYyNNFUioBXtY2K9XOAcd6RhcGwNQpSHyxOqAWQNAjOGdY=
X-Received: by 2002:a7b:c314:0:b0:49f:bb49:9cca with SMTP id 5b1f17b1804b1-49fe66cf67amr42471505e9.5.1790268590783;
        Thu, 24 Sep 2026 09:49:50 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:49:44 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 0/6] arm: sunplus: add Tibbo LTPP3G2 board support
Date: Thu, 24 Sep 2026 18:49:16 +0200
Message-ID: <20260924164922.117236-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_094952_774368_67A6867A 
X-CRM114-Status: GOOD (  16.56  )
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
 - Patch 4: enable SMP via PSCI 0.2 (SMC) on the SP7021.
 - Patch 5: add the board DTS for the LTPP3G2, covering eMMC, a bit-banged
             I2C bus, PWM, watchdog, and two GPIO LEDs.
 - Patch 6: update sp7021_defconfig to enable the drivers used by the
             LTPP3G2 and correct a few defaults.

Tested on LTPP3G2 hardware on linux-next-20260916.

Changes in v5:
 - fix a problem reported by sashiko-bot:
   - update patch 3's commit message to explain the removal of emac_pins
     and sdcard_pins (unused board-specific nodes not belonging in the
     SoC DTSI) and the move of emmc_pins to the board DTS

Changes in v4:
 - fix problems reported by sashiko-bot
   - fix PSCI method: use smc (confirmed by boot log: "SMC Calling Convention v1.0")
   - move board-specific mmc0 properties (bus-width, non-removable, etc.)
     from the SoC DTSI to the LTPP3G2 board DTS
 - fix similar problems, i.e. nodes that don't belong in the DTSI
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


