Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3230ECA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 20:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K7axOho0K/uDLrMIbHkmVZuTbDKVS4ybpfgzmkJPTMs=; b=WK7ZzBQ+SCkd2/2sDY+ZSYEbr9
	H/+iDpp9YTl1XhITGjVd2fmaBq3qIJvN+JzGgSRw01p0WZzscZ6Nr/p6DPEjWl+lK01JckoUmzOKF
	HkPl+7WVb1/2BYvn/KUEAQLCIuQczqRSLHUAAK3kiH9jrsPP5qua4xOvew42p22aG6aPlYSSUc7gq
	ybx+bux+YKXsQ/ALwr1HX7Zy8UpJN+7iHyXwv1I6pqcJyP2QosB/m3wD63WKeZgryZ+Kv2Smo7/Zw
	NsUpgZAB8psbIJ40cp2bHXfpPeee1C1eKBv1WuaxLDEhJ+oSsMGmoyNHzJeACFlXrjTz0D9xv2qSj
	RucqYsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpHo-0000000H7nO-1Zx0;
	Mon, 05 Oct 2026 20:27:48 +0000
Received: from mail-ej2-x0e.google.com ([2a00:1450:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDpHl-0000000H7ms-2aR1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 20:27:47 +0000
Received: by mail-ej2-x0e.google.com with SMTP id a640c23a62f3a-c2e7c1d9202so277626766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 13:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232063; x=1791836863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K7axOho0K/uDLrMIbHkmVZuTbDKVS4ybpfgzmkJPTMs=;
        b=DWa05mxRnaUaCq4YgxprtIu8okZ3o/ocOyKMYfQ36B8CF9G/D823532VR+nn2v9RYi
         FljBeicBHK9jIL853V44iMfp44kiDIviiPTCTgYHyzxW+FEOmnEy3xEScoqtde1V9EKF
         NIMbzvaT1tBdOF3WgOD1OjFnido/DY51D8NFCqDMgR02hkOlS3ZoB6EGNKbhGMP/vsZv
         q5EN3+TW7EugqHbKGjacPOLXttJWkdHbSQ8NDJFizU9VYjMXpvlVrvLosYJ8gxqxF4eH
         BmWSI2UIHRja/UK+0z32ORLdJRqo7mbBxr+KQSuI4Hkqdzm011QEkL0FwnlvFr6QVfXF
         D1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232063; x=1791836863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7axOho0K/uDLrMIbHkmVZuTbDKVS4ybpfgzmkJPTMs=;
        b=bt+bvy41a6PeiPD+gepWSZ3/pY7s1NDHYEQbCUjPeioGsQ6gX8hNv0SUBEhdYVbzRu
         NpvEuFibp3kSEDiaHSNxddqLDs7nWZ3Ei+F9OYBZiMVZuvlYQ9ZKpeBUOv+E6KyT5x3o
         HVNiyhkcSmltuwwLwtBDTTLrz4Ln5Uu3E9ogk485cw6goS90ZFH83mLBKmbDvHc+RhAf
         WNtHSEO7LpnwR9vqeqC7jyywz3A3KATWTLl5ZpTBYdIwp5rqk1PwZyD2A9A5mDu2uhDa
         qaCOTVeLBWgfD1ZzdCEtnM6cHt1p6U+lz0Z9itwNxfy6ff6ZAyjdYAHq1qWzFE4/S5rq
         FXjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbbUvbrXb+7JQ69t5mu1jLM/Q/XuRm8LBK1pMauShsJ3W6e+Yf9prAAfVWrAdbIGX4P56An0afVBm98SpDe6gZ@lists.infradead.org
X-Gm-Message-State: AFuF++nxMcBBp5fZZEhr4Ruvy7kTzuRqLHo+JobB2yL5rRX8dZMQvK8Y
	RDlPA0S4VcIvA/WMfJyNhjitQvlPDo6jqhlJpmmkaoQICsyMMNh2RE9D
X-Gm-Gg: AYBFou3EMU57z54vdfrk4wMMy+NqMYoebpHRwNUNuKY2fs9XA+JruZAyFITjxdJVEpa
	GJjxyp8Jg9ccaRVXH2hTiboV1Nhw/EBAXml5at1QwVzY9tefZ96E8BKLmPjaa6ySrQsQMmHwH3V
	a/s67MlnxYjposRyhTzBsXyEqigHa5w/dDeTAlPo8tHFomLuzY1wQ02YjxrcuLlAmT6LBdKFEqo
	GFdruwB4OYXjOCF+htFOXMvNN23VcBrEChikwYDXjuXo3i8Usfl7i3w5FlnxS5vCR5fKAIsJ0Ok
	utSDH/5EsioPMe5sgGHLV46s0YvGzx7Xw2Wr8M83xC1kRj7w+84X5SyoeJOnWWB28OIArVSDjT3
	45d2uFecoNdczz10e7QhOykCo+zrsfNQJGxrVyjFMCrO5i+ukuIf5jb3P7l8eiaS+ZRXG1L/3VN
	7z2B0kRpqbPDWSRGlE0wnFl+O+GjGTTTY38AxRA6URow13Jpvw+i3IY2pW7qFZLNBBluM2V+oji
	hkNr1nRkjw6ZllQnILymRdbGmSUuIi4fiyxZwBRI+M=
X-Received: by 2002:a17:907:6e94:b0:c29:8d4:7c03 with SMTP id a640c23a62f3a-c2e4af4330amr1014256666b.26.1791232062936;
        Mon, 05 Oct 2026 13:27:42 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:27:42 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v3 00/11] ARM: sunxi: add Allwinner B288 and the PocketBook Verse
Date: Mon,  5 Oct 2026 21:27:20 +0100
Message-ID: <20261005202731.153971-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_132745_676919_8CF1C4F4 
X-CRM114-Status: GOOD (  14.28  )
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
 .../allwinner/sun8i-b288-pocketbook-verse.dts | 114 ++++
 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 290 ++++++++
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 644 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c    |  49 ++
 drivers/rtc/rtc-sun6i.c                       |   1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 +++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 20 files changed, 1287 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

-- 
2.52.0


