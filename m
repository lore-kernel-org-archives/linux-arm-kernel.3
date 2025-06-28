Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F3CC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PT8ZTtr0kmtripMbDTNXo1GcIawffufDPAMZzsfFoOs=; b=V+AKDPscsM7vCBGqKQUiWD6CzU
	rhVy9o5zB9BK/JcZtbErG0FkEhOw6xFWk8IwJl0JU6zUS8V+vXjvRzjueu/x6Q2TSBRYwDPdIaZkB
	fk9H5Pm+jDY5AZXrgIZ5oJ/jt+nrPEfL9D9xsU8BSLMUGBp1ybF8DRU08diR7JNMp5jsuzJMmx7og
	VxxNggpH3d8l8IuN3m90mu9rF+irsVZCBQ9nQB5t+mjFtwdL3yBovHgoVjssc8RdDTWFAk5KTj/uY
	b5fFD5Q/VNnwhy2WPhI5CDsC2gvwMDlCpEvAPKXCwzw/luHqCb2NMSTs/2oX1C6KpgXNjjSNn0DLN
	C2lpjOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYGC-0000000H0TU-2Z3n;
	Sat, 28 Jun 2025 16:18:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVYDt-0000000H08Q-3OkF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 16:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6AC56143E;
	Sat, 28 Jun 2025 16:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF27CC4CEF0;
	Sat, 28 Jun 2025 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751127372;
	bh=xwBJtYb4XftTQnUvPPzT8bBayvc42wCvVRgKR/Qg5G0=;
	h=From:To:Cc:Subject:Date:From;
	b=BN5ULZp8kAML7kYEpIYJykHXQhUWu6Q8XEiqfn+8HlvpEZKR4uJDUKkKnP07He1GJ
	 /HlYMXKxXJaD3h2VYQr6lr+qSUlQfru7v4KKVZSD7hRmuhKDLaP6Il03wpebzxi+ra
	 g16OKnUCUQjAER0olQLqCymhOZUowh/y3jWOOXVf/kbOYjM6P0ikTEGt/V9bCa8qK6
	 jWbf4/Muqf0shyUe9b4T02BCfJoH2GO9WIY9ESry06apQrhLthY0/zAOVZFGBE6wXf
	 JGsB0QLDzu6T3qFfg4VU1YsArBWOsIS9BvSl1A4uLcrtIpDmuJZLCRJZ6GbzI2QyKb
	 OspL4fAsSs9lQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 2504A5FE35; Sun, 29 Jun 2025 00:16:09 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v3 0/5] arm64: allwinner: t527: Add OrangePi 4A board
Date: Sun, 29 Jun 2025 00:16:03 +0800
Message-Id: <20250628161608.3072968-1-wens@kernel.org>
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

Hi everyone,

This is v3 of my OrangePi 4A series.

Changes since v2:
- Actually include cpusldo regulator name change and axp323 aldo1/dldo1
  comments
- Fix indentation of comment in usb_otg block
- Link to v2:
  https://lore.kernel.org/all/20250625131652.1667345-1-wens@kernel.org/

Changes since v1:
- Fixed regulator names for bldo3 and bldo4
- Dropped labels for aldo1, bldo3, and bldo4, which are not really used
- Added voltage constraints to aldo2, based on specifications from
  schematic
- Appended "-usb-0v9" to cpusldo's regulator name
- Added comments to explain how axp323 aldo1 and dldo1 are tied together
- Link to v1:
  https://lore.kernel.org/all/20250619173007.3367034-1-wens@kernel.org/

This series adds support for the OrangePi 4A board. This is a Raspberry
Pi model B form factor development board based on the Allwinner T527
SoC.

The board has the following features:
- Allwinner T527 SoC
- AXP717B + AXP323 PMICs
- Up to 4GB LPDDR4 DRAM
- micro SD slot
- optional eMMC module
- M.2 slot for PCIe 2.0 x1
- 16 MB SPI-NOR flash
- 4x USB 2.0 type-A ports (one can be used in gadget mode)
- 1x Gigabit ethernet w/ Motorcomm PHY (through yet to be supported GMAC200)
- 3.5mm audio jack via internal audio codec
- HDMI 2.0 output
- eDP, MIPI CSI (2-lane and 4-lane) and MIPI DSI (4-lane) connectors
- USB type-C port purely for power
- AP6256 (Broadcom BCM4345) WiFi 5.0 + BT 5.0
- unsoldered headers for ADC and an additional USB 2.0 host port
- 40-pin GPIO header

Patch 1 adds a new entry to the list of board compatibles.

Patch 2 and 3 are minor cleanups.

Patch 4 adds pins for UART1, which is used for BT on the board.

Patch 5 adds a dts file for the new board.


Please take a look. I will take all the patches through the sunxi tree.


Thanks
ChenYu


Chen-Yu Tsai (5):
  dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
  arm64: dts: allwinner: a523: Move mmc nodes to correct position
  arm64: dts: allwinner: a523: Move rgmii0 pins to correct location
  arm64: dts: allwinner: a523: Add UART1 pins
  arm64: dts: allwinner: t527: Add OrangePi 4A board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 160 ++++----
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 385 ++++++++++++++++++
 4 files changed, 478 insertions(+), 73 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts

-- 
2.39.5


