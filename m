Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031BACA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=58Hpz3IL7+FBFo99aVZrTh8mHeTaosnWqfT/ede3fC0=; b=0NPiVhG/TDw2HxYKa6dWxZl5Zt
	fTVMkEoe66PySO6msHc4Vn6qKwFf73yUKtO6JvqCLjYMxEiE+MekQUC5LfniIxweR41Mg1EPCh+3g
	MCJNFZOYXDRTnfGVnxIFIB+liSzHprk5IaVnGKt8OASu/O1zJrVlDuKXm/wUUsBME17uFNr8FM7ix
	dx1hQXjF3CXwL6ATfMAXBHYdi0k6qVInvCAXt3P0+Et6Qlqy5Ijrwsu1NaNAu5lNN9jO7tRaaM/2c
	n5lCxNFZblMQpDkJYoLMi59UJW4QdqfltVp5dyGQ4WI/F1sVIvVQDH9IUXQrorttdF7Iux+zVCRst
	t0p8Jziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCxU-0000000AAIy-0kOm;
	Mon, 12 Oct 2026 10:08:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCxS-0000000AAHx-0JRG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:08:39 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso940531f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799716; x=1792404516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=58Hpz3IL7+FBFo99aVZrTh8mHeTaosnWqfT/ede3fC0=;
        b=Bc3cLnBAEFij2vGgIfEYQx11+0XJrpJlHqRWJ7zw6ZbDH0wlcxBRV17JU5NjixcbVg
         ELxPZ0aj6Ui6iFDiFMWiX/64nv2K/Fwi59IJ+qtJdRo2693c2YkBxmqrmGsltbhLeVpG
         hSal6hKjFN7kBtGFYrHNcC++/MBFvdktpnVBTGBRuCB8YpKbunhei4Nb+U1WZWYrUBRF
         gmYgQBExi0AdXeJA9sFDJACa9F2icjBfpAY8Oo0dXQe9LdfwE61fd5aaBCg6jTwAeybW
         5VhkR6jsYbisanT5++cipZkD5do5pUbGcSdqosW2lGrrwcVTXw3B2xSQJfrNeCv6aC0R
         XqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799716; x=1792404516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58Hpz3IL7+FBFo99aVZrTh8mHeTaosnWqfT/ede3fC0=;
        b=2Q+MqTKNp1jLGLCP2c1HbUCjdxF4S14HFLvg4v3HwVlFJUc+Eo2EHmIY8WcPgTT83+
         c+Jk2CXIg6vcCq9wWrY+t/HYYS/CZootPjhwKbDj468OohRKdOr+4nHGY9D5ejuLxYXK
         ob2gs5lEaam1rVBbNfO5gHg/wWSaPOYq5/hbONMJOAGc46dA3Cv8HdkhwYLLwHa6TXia
         1FVFJnOkIYi8D+pw01jImtSnpxH8/oyAqPuN+/rILFLQWAAM0lxnfL/2vU584ctQ9MFt
         NLtU6u53/kAUBRJggS6yuq84fEXFzHaTPRNM7zMZFIXumUPywH2cMgrm4DE3vlmEEG1s
         PojA==
X-Forwarded-Encrypted: i=1; AKwUvBzhDKV0mjDYF7T2169CCxTxBxopBLhzSRmGu5SCjETjCY333X3JSIe6agn958ldE1E9mAh6w/s0k/QWLxzB5Txi@lists.infradead.org
X-Gm-Message-State: AFq9FYKWjEflB0fiQXDV06PtfCO2Rvqn7yBfEBfgftcPeJxIBeYqguUa
	2wQLzKVQYSwdiUvEt8IKLuCVAt8ak8EStrLvEuQpimsud0J73CFlHv3c
X-Gm-Gg: AYBFou2KYf6jp6s960MjgIeW2z2MQIv26IKu/zTmd6XNfraO6bcHgpWmsFJuX+wRd0u
	TpWQRX84j1Y3EmVGRvnF2nj1LMfKzAHT9RX6sy0LV3G6ks+yY+S51fv25ZGFHK80vfh4ViLEXu2
	BRqN7vX+eExlGvNdC0MH/hoOiwoBck25rNWItvx6/V2xloiOLFzzNH03Kvn8aUiSiprw0BFrd0c
	DJeusPPyK2EdbJ0aheBUBqt0PIirE/b8doPu1Sy3rNLVccvJGBDaEYFxF6JxOGQLpMWTOpZa3bT
	a4PcXPMawg/2JFvk+DL+YoOWKLUe3pjfb4LTiZ3PCvKIiuxSLSKRlS8j7zM60n86MfExsgDVrYI
	7BfU+o7lNWujviYpcsr1/af/jAcqBosDiy3UIPXPdC5SD1/azWJPcPvChygW60EHPiMeWXjwjcR
	RnT8Ji84es+nkEy4XkBzKRiJmoLO12YXJgogVEAowEFGdUdCw6OYngdI5sGjq6i09J+BLx16ghs
	c3OE15I7QRs1Czlxt4hDqHYi5V12oHX
X-Received: by 2002:a05:600c:64c8:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a18e4c41b0mr155420775e9.21.1791799713755;
        Mon, 12 Oct 2026 03:08:33 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:08:33 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v4 00/11] ARM: sunxi: add Allwinner B288 and the PocketBook Verse
Date: Mon, 12 Oct 2026 11:08:05 +0100
Message-ID: <20261012100816.331033-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_030838_139266_B6887AA1 
X-CRM114-Status: GOOD (  15.35  )
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

The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
readers. This series adds the CCU and pin controller drivers, the RTC,
I2C, NMI and watchdog compatibles, the SoC .dtsi, and one board: the
PocketBook Verse (PB629), a 6" reader.

The B288 is closest to the A64: most of its PLLs are bit-identical.
The clock and pin descriptions come from Allwinner's BSP, cross-checked
against ccu-sun50i-a64.c. Tested on a PB629, boots to userspace.

The pin controller relies on "pinctrl: sunxi: dt: number the IRQ banks
from the first one that has IRQs" for correct PIO interrupt mapping.

Changes since v3:
  - CCU: reference parents with clk_parent_data and clk_hw pointers,
    as newer sunxi-ng drivers do; add the audio PLL's sigma-delta
    settings, as on the A64; fix the PLL_24M rate and parent the PLLs
    to it.
  - RTC: register the 32 kHz clocks, reusing the A23 data (Sashiko).
  - DTS: take osc32k from the RTC, as on the A64.
  - DTS: allow the eMMC up to 150 MHz, as on the A523.

Changes since v2:
  - Drop the MMC binding patch, applied by Ulf.
  - Rebase onto sunxi/for-next.
  - Constrain the RTC clock outputs and pinctrl interrupts in the
    bindings (Sashiko).
  - Add a B288 watchdog compatible (Andre).
  - DTS: drop the memory node, the arch timer workaround and the
    sunxi.c entry; add disable-wp and the eMMC 1.8V modes; DLDO1 no
    longer always-on; mainline pin function names (Andre).

Changes since v1:
  - Add this cover letter.
  - Drop both new bindings; add the compatibles to the existing
    allwinner,sun4i-a10-{ccu,pinctrl}.yaml instead.
  - Rewrite the pinctrl driver in the DT-provided pinmux style.

Pablo Mazzini (11):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add Allwinner B288 CCU driver
  dt-bindings: pinctrl: sun4i-a10: add Allwinner B288
  pinctrl: sunxi: add Allwinner B288 pin controller driver
  dt-bindings: rtc: sun6i-a31: add Allwinner B288
  rtc: sun6i: add Allwinner B288 compatible
  dt-bindings: i2c: mv64xxx: add Allwinner B288
  dt-bindings: interrupt-controller: add Allwinner B288 NMI
  dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
  dt-bindings: arm: sunxi: add PocketBook Verse
  ARM: dts: allwinner: add B288 and the PocketBook Verse

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |   1 +
 .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  22 +
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |   3 +
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   1 +
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-b288-pocketbook-verse.dts | 114 +++
 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 292 +++++++
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 749 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c    |  49 ++
 drivers/rtc/rtc-sun6i.c                       |   5 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 ++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 20 files changed, 1398 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

-- 
2.52.0


