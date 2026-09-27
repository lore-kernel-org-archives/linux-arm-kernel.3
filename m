Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312CBC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 15:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iq7QY59go/yg3a2RnQSLtv6/NhXKFuv9l2HYC5eUWJQ=; b=GndP8v9F1he61RjGh+ADyRjL+H
	Powo8geGoGEpbY0pcItnwHYfUxjzuiIMJO533lajFi1iU6b6WtoI10w4JYZrjUNz49+I9cfMMtZZl
	w6L4kA0TqQJNnlFeBOW0VR+5PCey0p3cR8cP8w/KFVkGFvNQhTrVpyrsqDW3P9v0X6L3mNiokOB24
	1KcrYUL2iJHfy9OuUxaDms+STcOpVI7TE2O2rO99u1F3aWOKTXP1jNonP14UsR3onOfpcWDfIfr82
	sMGxbRdy+JRJ4poNCJzN5p40ZNhTITUrX6cVfCL5if9EKuc750NtujzDTR2vO5zHQLt4lk9Y90yYz
	ORpE9SIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqWu-0000000GUUS-3wF9;
	Sun, 27 Sep 2026 15:11:04 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqWr-0000000GUU0-2bZq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 15:11:02 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843796e373so1260827f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 08:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521859; x=1791126659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iq7QY59go/yg3a2RnQSLtv6/NhXKFuv9l2HYC5eUWJQ=;
        b=Jq7/tVTz4LtzZxqKUOAt+SQ2TTF2xp8s7NtMUPOCxhAuJVcmrT5ehU31ZYgIg9gg3T
         FYhdTOLZYgqnL/8HAtdhBt8aOfSJ9H19uTll5PjSR912qeClw+le/SikLN9vNF1me20J
         kj+z3EULM2DoUUZ7uxydNz1KMYfW4Kr4nr/MzxYamCIDcHmzLZVHQ4j1tLowRBeUieiQ
         IlogTMoNVSMkFIBS7HUZsTk/68hFKMYE5in8OvYB+UXF9Wx5HlnRQ9MH3IYiEcf9LK89
         qXY9xlHYBgrKtnLNM6cooxhrXoTcs77a34gTAHz/ZwfjOrweAyX2sUfhuiYxvGkATeK0
         cu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521859; x=1791126659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iq7QY59go/yg3a2RnQSLtv6/NhXKFuv9l2HYC5eUWJQ=;
        b=Q+UcBLaos4rYmJoqxEHPYV4Fkugf9rrLJRfGzsUuxVdWogxHaPvXmFYECeOpOQJKYS
         N6zRb2IXr1bfCb+N1mAVSQCnlNR2Z1ZurhBO9EDyljL7WsfGvjzniahO95qFX5Bkljhh
         +CEFsZHpz69AnfF9GWh6LtBD9579EqBiz47JLjRskKVUtkq1agjcCvcAebVqGABBzmv/
         KG9gNZH0VuchXQxBnFDouO57rm6cvtkMGlTOLtSnyR43Kpl7ZjMIa8reYrXT/ewLWhWy
         CIgs21mwXW5rfvEquFhwJ4noI1LaMPJqm1tcS8RxU0iMMRFNm34NsLlD3Zo7Ng+kwMnu
         H6tg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ4GQbmOUBypiDWkhwXLQcdCHkJ3wRO9c6sVGlCw7k9lX3NFLsqOuR+flj4/LyypxgNdfXtq280/G7JtS7rM2X@lists.infradead.org
X-Gm-Message-State: AFq9FYIUOsc/mq1eSx2j1Au8gGYaVZzBW44pJ9AWP4FPfqaMLt+cmfbW
	oo1rlvP62HhUIjr/naaZdAM6yFPBlktvLB16M6paE7Z5divmzU7DloP/
X-Gm-Gg: AYBFou1EgxpYRJHkS7GPillfmxlPl6u3ACSkCpmMr+eLbV97l8Yh8LVHA09cku5oIF5
	BBumvJCzWuTkubzW0C0DZ9BorVYyiNVJaEPfO8s3+gqv/SNstGHietGUNiBoYs0fiTcBqV//wl1
	mVApqjG5fpB1LR59DytgSD0YM8v+n7LkOVyFeoXb6JkxRvzKJDuLCOCKDx+QOJog/UOIa8T1qhP
	svx63sWLg12H47BQeRLGz6U4d14lVwV7+0Op3C7Q6i8BPomCrKmRWcaG+zRbQm/Qb6JcWkMXLc+
	UFh488M0IVvoWTDsUt2eNTDfX/eauQoGoopuToN2Yxgz0M8uIlRPVkN4eQ+GLwV9mlmhAvheMVE
	zEwnVE8smxL7U86VC2zn/bBRPGTiU2GScUJV3RsFz2BpGy9XuSnBLND+7vS6UC6xRzB/rdVUp+1
	+KdrQfTlfFv+DQsZO9WGlR0UHO9ROtm/A3KBm4zDUvNq1MS3Ncv6c/COeNp2hH99zohaVUSzreR
	n0UhgcsddTLz4Hlb7ZMg3Qv1PRpDzRNUfhbwkya/zA=
X-Received: by 2002:a05:6000:402a:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-4888bc1a693mr4386678f8f.39.1790521859115;
        Sun, 27 Sep 2026 08:10:59 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:10:58 -0700 (PDT)
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
	linux-mmc@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 00/11] ARM: sunxi: add Allwinner B288 and the PocketBook Verse
Date: Sun, 27 Sep 2026 16:10:05 +0100
Message-ID: <20260927151016.186493-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_081101_701842_0A9915A5 
X-CRM114-Status: GOOD (  12.81  )
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
I2C, MMC and NMI compatibles, the SoC .dtsi, and one board: the
PocketBook Verse (PB629), a 6" reader.

The B288 is closest to the A64: most of its PLLs are bit-identical.
The clock and pin descriptions come from Allwinner's BSP, cross-checked
against ccu-sun50i-a64.c. Tested on a PB629, boots to userspace.

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
  dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
  dt-bindings: interrupt-controller: add Allwinner B288 NMI
  dt-bindings: arm: sunxi: add PocketBook Verse
  ARM: sunxi: add B288 and the PocketBook Verse board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |   1 +
 .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
 .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |   2 +
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  23 +
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |   2 +
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-b288-pocketbook-verse.dts | 122 ++++
 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 304 ++++++++
 arch/arm/mach-sunxi/sunxi.c                   |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 660 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 drivers/pinctrl/sunxi/Kconfig                 |  10 +
 drivers/pinctrl/sunxi/Makefile                |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c    |  53 ++
 drivers/rtc/rtc-sun6i.c                       |   1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  88 +++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
 21 files changed, 1337 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

-- 
2.53.0


