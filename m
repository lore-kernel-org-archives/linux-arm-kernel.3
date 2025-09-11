Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A76FCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 17:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6vhWhoLwBDiAKgYIPaYuelUhAx0iYJB8EF9WMebZoXs=; b=AwZLLs5tmNO0oxK5T/ZjVWcV20
	6IWkEUyQK7fD3MP4a4lELP+dPbG2LhGr1PYrtthD20uuGvHuxJSN0EoMSz7I36J6umnRXHFnsPaKp
	lFj9+EAJ4+Z//3kJE8MYcgulUo2G7r6B/egJCF9xbw6R94G5MvCGYe/acfekgHKta67+oYe4n/QDU
	nKSOYum2Ynl7rJF0BxWMxKpA1MjKcS9SCPJEyqmwdWXbC29mzDkkKvTpNzc60dsB2C6sAEGSoIGEr
	eA6vGh/ib88DuoVAzUPCWPI10BnMsMo9ZC7zzHoFPBEDUWN3pAh3gOEzmZ0u7CA7pj7X3EHt8gQvk
	1HRgIsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlO8-00000004XkI-0AHu;
	Thu, 11 Sep 2025 17:47:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlO7-00000004XjB-03S5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 17:47:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30CBB601D6;
	Thu, 11 Sep 2025 17:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF892C4CEF0;
	Thu, 11 Sep 2025 17:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757612833;
	bh=oaKCNu1HF5irjj2VLGgmBQ3NkJiDvAYpfZnXM+otFg8=;
	h=From:To:Cc:Subject:Date:From;
	b=OQLC+z74ZpongU6i4YQkD1W9RX24SDvIFBQAKIdz/HxDI1QMPjybvcLk4KeH0t0rF
	 W1Pd6wwVHr4wceqiIh/SL9uYMN/X6onHspCCvNJ7PjuLF9vaRaL22pvrB4pbq5yIL9
	 h1F2OqacHBUp5e2KYggoukjTY1W6VzHJO3tagaSIX5GkSmPjoNDZrqZ89AkONcnQwM
	 8GxShsOwSG1AiR0cMK5K19chv9po/GkW2nW93ksaSWJMp01Dc1C1V/HDLoCuiXE4jz
	 eEtXpcQW1uag5zwwTdJlZKJnJiLhNFVJ6l24Dk3/Ii8bEsMj3DCDxzPGXPkZSKqxgS
	 xC29Pw4Rknu5Q==
Received: by wens.tw (Postfix, from userid 1000)
	id BD1D25FBFA; Fri, 12 Sep 2025 01:47:11 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] arm64: allwinner: a523: Enable MCU PRCM and NPU
Date: Fri, 12 Sep 2025 01:47:03 +0800
Message-Id: <20250911174710.3149589-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Chen-Yu Tsai <wens@csie.org>

Hi folks,

This is v2 of my A523 MCU PRCM and NPU support series.

Changes since v1:
- Dropped dual divider clock rate read-back fix that is already merged
- DT binding
  - Moved "r-ahb" clock to the end of the list and added "r-apb0" clock
- Add NPU clk
  - Move .num to after list of clks
- MCU CCU clk driver
  - Added comment for "fixed" dividers in audio PLL clock
  - Corrected variable names for audio PLL divider clocks
  - Added comment for the reversed order of some of the DSP clock's
    parents when compared to the manual
  - Added comments for clocks and resets only found in the BSP driver
  - Corrected register offset for i2s3-asrc and bus-mcu-pwm0 clocks
  - Made "r-ahb" and new "r-apb0" external bus clocks the parents of the
    bus gate clocks, with comments if guessed which one applies
  - Moved .num_clks to after the list of clocks, making it obvious that
    the value needs to be added if more clocks are added to the list
- MCU CCU DT node
  - Enlarged MCU PRCM register range to 0x200
  - Moved "r-ahb" clock to the end of the list and added "r-apb0" clock
- Link to v1
  https://lore.kernel.org/all/20250830170901.1996227-1-wens@kernel.org/


The MCU PRCM is a Power, Reset & Clock Management block that has some
clock and reset controls for the MCU, DSP and some peripherals that the
MCU could use.

The NPU is a Vivante IP block. It is clocked from the NPU PLL from the
main clock unit, but the bus clock and reset controls lie in the MCU
PRCM.

Patch 1 adds the missing NPU module clock to the main clock control
unit's binding.

Patch 2 adds the binding for the MCU PRCM clock control unit

Patch 3 adds the missing NPU module clock.

Patch 4 adds support for power-of-two dividers to the sunxi-ng clk
library.

Patch 5 adds a new driver for the A523 MCU PRCM CCU.

Patch 6 adds a device node for the MCU PRCM CCU.

Patch 7 adds a device node for the NPU.

The NPU was only lightly tested: the driver correctly probes and detects
a model GC9000, revision 9003.

Please have a look. All patches will be merged through the sunxi tree.


Thanks
ChenYu


Chen-Yu Tsai (7):
  dt-bindings: clock: sun55i-a523-ccu: Add missing NPU module clock
  dt-bindings: clock: sun55i-a523-ccu: Add A523 MCU CCU clock controller
  clk: sunxi-ng: sun55i-a523-ccu: Add missing NPU module clock
  clk: sunxi-ng: div: support power-of-two dividers
  clk: sunxi-ng: add support for the A523/T527 MCU CCU
  arm64: dts: allwinner: a523: Add MCU PRCM CCU node
  arm64: dts: allwinner: a523: Add NPU device node

 .../clock/allwinner,sun55i-a523-ccu.yaml      |  37 +-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  39 ++
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c    | 469 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  21 +-
 drivers/clk/sunxi-ng/ccu-sun55i-a523.h        |  14 -
 drivers/clk/sunxi-ng/ccu_div.h                |  18 +
 include/dt-bindings/clock/sun55i-a523-ccu.h   |   1 +
 .../dt-bindings/clock/sun55i-a523-mcu-ccu.h   |  54 ++
 .../dt-bindings/reset/sun55i-a523-mcu-ccu.h   |  30 ++
 11 files changed, 671 insertions(+), 19 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c
 delete mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-mcu-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-mcu-ccu.h

-- 
2.39.5


