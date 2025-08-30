Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A574CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kDx62LBnChHjtNkTDL7NQt8lduif//sDr7HGVvJarkc=; b=eF609u3Jlo1WBWZPWUzolU5h4V
	UK0rKA5bvcoQ4nv51cx0ZIluIR+l+qi6X1cEUpsXDKQpMjMEPpeiKj61Ohbt6bqkLKKxpBiri5X+m
	kGaYmXHYboMGzsP0usgpwTSy7L4gY5/0tYybYRHEubRjpJPVKESpKh/x3/CLNjLotFUZsToUdE4se
	bTVt9f5+SEjsFK1HzBmJm9GPATemZwBEHArBEb6zv89gDKU/pNOjfK3lkUKwNzvzneBXp1+gt2uy9
	xIuO6FagxWHcv+KTW3sVhkZCO29wB+4mWoccm4+box1qhdV2b5x4EYZYKlWPLp9LtXFFksfKFHMmZ
	LGXAMscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPKP-00000008EPx-1KAV;
	Sat, 30 Aug 2025 17:25:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP4r-00000008CUN-0mLY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 17:09:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34EC9601A7;
	Sat, 30 Aug 2025 17:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4497C4AF09;
	Sat, 30 Aug 2025 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756573759;
	bh=Ga5zxO8ZZi+LW2SUjQleCojdx++Hf4rCOMhtGWIYz9Q=;
	h=From:To:Cc:Subject:Date:From;
	b=bQ2FDKUqku3BPMUozZpMqtcXYNpl952VOteqh2Kz7kyy5GaCFNg6Anu3FSIx6GLge
	 e6jMuRn0bQ9pcJnNkXi18aV+xpp/w0A+0tBPPCJao2mP1M9w2Gjyg/UoAECXoT+tuy
	 UAnfu7PHDQ3y85TXVjdTHOxw1SfEA0Iih5p9R3sYbAkl3PDBM7ppmqA5ka3AuOap64
	 kPKEuzoW2XRfhYgmQPRpN1ZyAX56gPs6N0sJDNXNk23I9o3w13JUglKufd7/PQhC2a
	 ioj0IR11U99jqDCnA3O1tBVYPszz0kHXA3r3nnCxrVs5PAffxn5a421VzhUTx1odVX
	 /WXp5e6KJslSw==
Received: by wens.tw (Postfix, from userid 1000)
	id 0C00C5FCC4; Sun, 31 Aug 2025 01:09:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] arm64: allwinner: a523: Enable MCU PRCM and NPU
Date: Sun, 31 Aug 2025 01:08:53 +0800
Message-Id: <20250830170901.1996227-1-wens@kernel.org>
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

This series adds support for the MCU PRCM and the NPU.

The MCU PRCM is a Power, Reset & Clock Management block that has some
clock and reset controls for the MCU, DSP and some peripherals that the
MCU could use.

The NPU is a Vivante IP block. It is clocked from the NPU PLL from the
main clock unit, but the bus clock and reset controls lie in the MCU
PRCM.

Patch 1 adds the missing NPU module clock to the main clock control
unit's binding.

Patch 2 adds the binding for the MCU PRCM clock control unit

Patch 3 fixes clock rate readback for the new dual-divider type added
with the A523 family.

Patch 4 adds the missing NPU module clock.

Patch 5 adds support for power-of-two dividers to the sunxi-ng clk
library.

Patch 6 adds a new driver for the A523 MCU PRCM CCU.

Patch 7 adds a device node for the MCU PRCM CCU.

Patch 8 adds a device node for the NPU.

The NPU was only lightly tested: the driver correctly probes and detects
a model GC9000, revision 9003.

Please have a look. All patches will be merged through the sunxi tree.


Thanks
ChenYu


Chen-Yu Tsai (8):
  dt-bindings: clock: sun55i-a523-ccu: Add missing NPU module clock
  dt-bindings: clock: sun55i-a523-ccu: Add A523 MCU CCU clock controller
  clk: sunxi-ng: mp: Fix dual-divider clock rate readback
  clk: sunxi-ng: sun55i-a523-ccu: Add missing NPU module clock
  clk: sunxi-ng: div: support power-of-two dividers
  clk: sunxi-ng: add support for the A523/T527 MCU CCU
  arm64: dts: allwinner: a523: Add MCU PRCM CCU node
  arm64: dts: allwinner: a523: Add NPU device node

 .../clock/allwinner,sun55i-a523-ccu.yaml      |  35 +-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  37 ++
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c    | 447 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  21 +-
 drivers/clk/sunxi-ng/ccu-sun55i-a523.h        |  14 -
 drivers/clk/sunxi-ng/ccu_div.h                |  18 +
 drivers/clk/sunxi-ng/ccu_mp.c                 |   2 +-
 include/dt-bindings/clock/sun55i-a523-ccu.h   |   1 +
 .../dt-bindings/clock/sun55i-a523-mcu-ccu.h   |  54 +++
 .../dt-bindings/reset/sun55i-a523-mcu-ccu.h   |  30 ++
 12 files changed, 646 insertions(+), 20 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c
 delete mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-mcu-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-mcu-ccu.h

-- 
2.39.5


