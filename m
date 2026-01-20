Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572D8D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sjdXwo1evm+KXL7WYk1Hdt9L00R40tyG0G67Zg86Eqg=; b=dh00W3SoaIXL+k5HlaCPVFYeQ8
	yVmcRGQTNe6c2PEXYArhy6kIBStBEDnAzw3++QEgOkeVyFTHlt60f4ugvHI0bBTV94O48dHVT3tPh
	kfqTKJjuuOdNyPLjfnl7hJAUitDZbfX4PjWdVWUe+Xw3euvl/h/rUDhUXP5bc0Y0yiskCXn+Q2kaD
	erSWDdg0326GWNG4Kfuv+6CIne5IYapv0uDPZoWB/7oKbr3y7SDT5UDPhvwBsxoUs7GIzuzd8f0se
	qeCEj2kHg37jsDpenZwJramC03HbDQ6i6bqPkeNK0aPGaLpPoxvcmvN/yr8KLM3zrIk8bhLouMRJv
	1CiTeCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsL-00000003zpT-3b3z;
	Tue, 20 Jan 2026 14:38:33 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCsI-00000003zns-0FRr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:38:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23162148AD37;
	Tue, 20 Jan 2026 15:38:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768919904; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=sjdXwo1evm+KXL7WYk1Hdt9L00R40tyG0G67Zg86Eqg=;
	b=IeTIO0+Ur/7LJ2nVH0dfN7hdErWOXwGkNUMHqc6TdINkp6LqxFRFgHCNcE+rc2Fk/fX6ob
	ZsjJuKpdULOBu/NaR+VU8eQN9CSi9dPm9hK9e+xWAyZApETFsEN4MOSM5NsA6QZuTuSc6N
	T22H3fuMCDV+jvkYsQv6pUAYbjXdWxx6VMwz+DAeD9Zx4imBOMoeg1WJHVyFJhyf9LioPR
	rpWvRIWvHTV9FCr2kswuETa+KEt8dvVOvbNW/ipXDmLW1E17Ib2lISN7WxnVKqXn59rauW
	woC5i/OJQxHUZ04w4wQDlgkODLlni4IVxTmeJ9AS0mzfHlTH/hl9FR4IKU12AQ==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 00/19] Microchip OTPC driver on SAM9X60 exposing UIDxR as additional nvmem device
Date: Tue, 20 Jan 2026 15:37:21 +0100
Message-ID: <20260120143759.904013-1-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_063830_560895_73BCED74 
X-CRM114-Status: GOOD (  27.37  )
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

Hei hei,

on a custom sam9x60 based board we want to access a unique ID of the
SoC.  Microchip sam-ba has a command 'readuniqueid' which returns the
content of the OTPC Product UID x Registers in that case.

(On different boards with a SAMA5D2 sam-ba and we use the Serial Number
x Register for that purpose.  In the linux kernel those are exposed
through nvmem by the atmel soc driver.  Those registers are not present
in the SAM9X60 series, but only for SAMA5D2/SAMA5D4 AFAIK.  Neither of
those uses /sys/devices/socX for exposing the serial number.)

There is a driver for the OTPC of the SAMA7G5 and after comparing
register layouts it seems that one is almost identical to the one used
by SAM9X60.  Currently that driver has no support for the UIDx
registers, but I suppose it would be the right place to implement it,
because the registers are within the OTPC register address offsets.

When developing and testing it became clear the OTPC needs explicit
enabling of certain clocks in the otpc driver.  So the patch series
starts with some rework of clock bindings and clock drivers, along with
referencing that in SoC dtsi files.

The five patches for the otpc driver start with two patches with some
unrelated fixups for that driver. Following are more patches dealing
with sam9x60 support for the driver and the necessary clock enablement.
The last patch for the otpc driver adds an additional nvmem device for
the UIDx registers, fullfilling the initial goal of mine.

Output of sam-ba:

    adahl@ada-pc /opt/sam-ba_v3.9.1 % ./sam-ba -p serial -d sam9x60:0:1 -t 5 -a readuniqueid
    SAM-BA Command Line Interface Tool v3.9.1 (linux - x86_64-little_endian-lp64)
    Copyright 2025 Microchip Technology
    Opening serial port 'ttyACM0' (USB)
    Connection opened.
    Launch readuniqueid
    Executing Applet at @0x300000
    UID[0] = 0x36465356
    UID[1] = 0x10340637
    UID[2] = 0x6036f6f0
    UID[3] = 0x27b483c8
    Execution time: 150 ms
    Connection closed.

New Linux nvmem device content (little-endian):

    root@DistroKit:~ hexdump -C /sys/bus/nvmem/devices/mchp-uid0/nvmem
    00000000  56 53 46 36 37 06 34 10  f0 f6 36 60 c8 83 b4 27  |VSF67.4...6`...'|
    00000010

I tested the series at runtime only on SAM9X60, not on SAMA7G5 or the
other SoCs affected, because I only have sam9x60 hardware for testing.
If someone could test on SAM9X7, SAMA7G5, and SAMA7D65, that would be
highly appreciated.

Series is build time tested for sam9, sama5, and sama7.

Last question: Should the UID be added to the device entropy pool with
add_device_randomness() as done in the SAMA5D2 sfr driver?

For detailed patch changelog see each patch, general changelog below.

Greets
Alex

(series based on v6.19-rc6)

v3:
- Reordered patch series (thanks Claudiu)
- Collected review tags plus minor commit message fixes (e.g. tag order)
- Removed clock-names from dt bindings, led to confusion on review,
  and not used by the driver anyways (always enables all clocks)
- Removed redundant example from dt bindings docs
- Extended the per SoC splitup of the PMC definitions to the whole at91 family
- Add patch for a small after splitup fixup of the sama7d65 clock driver
- Add patch for removing old preprocessor definitions

v2:
- Removed patch adding bad OPTC conditions warnings on probe
- Removed patch adding more register definitions (the one register
  definition required was moved to the last patch adding the nvmem for
  UID registers)
- Added multiple new patches handling the dt-bindings issues
- Extend the possibility to enable the main rc oscillator to all at91
  SoCs with an OTPC
- Added patches to reference and enable the OTPC peripheral clock on all
  capable SoCs
- Reordered patches
- Reworded commit messages
- Squashed patches with dts changes for sam9x60
- Fixed bot warnings
- Link: https://lore.kernel.org/all/20250210164506.495747-1-ada@thorsis.com/T/#u

v1:
- Link: https://lore.kernel.org/all/20240821105943.230281-1-ada@thorsis.com/T/#u

(I sent an RFC patch on this topic earlier in 2024, you'll find the
link below as a reference to the discussion.  The patch itself was
trivial and not meant for applying as is anyways, so I decided to not
write a full changelog from RFC to v1.)

RFC:
- Link: https://lore.kernel.org/all/20240412140802.1571935-1-ada@thorsis.com/T/#u

Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

Alexander Dahl (19):
  MAINTAINERS: Add sam9/sama to (AT91) SoC support
  dt-bindings: clock: at91: Split up per SoC partially
  dt-bindings: clock: at91: Allow referencing main rc oscillator in DT
  clk: at91: Use new PMC bindings
  clk: at91: sama7d65: Use highest PMC definition as max index
  clk: at91: Allow enabling main_rc_osc through DT
  clk: at91: Add peripheral id for OTPC
  dt-bindings: nvmem: microchip-otpc: Add compatible for SAM9X60
  dt-bindings: nvmem: microchip-otpc: Add required clocks
  nvmem: microchip-otpc: Avoid reading a write-only register
  nvmem: microchip-otpc: Fix swapped 'sleep' and 'timeout' parameters
  nvmem: microchip-otpc: Add SAM9X60 support
  nvmem: microchip-otpc: Enable necessary clocks
  nvmem: microchip-otpc: Expose UID registers as 2nd nvmem device
  ARM: dts: microchip: Use new PMC bindings
  ARM: dts: microchip: sama7g5: Add OTPC clocks
  ARM: dts: microchip: sam9x60: Add OTPC node
  ARM: dts: microchip: sam9x60_curiosity: Enable OTP Controller
  dt-bindings: clock: at91: Remove old PMC definitions

 .../nvmem/microchip,sama7g5-otpc.yaml         | 12 ++++-
 .../reset/atmel,at91sam9260-reset.yaml        |  3 +-
 MAINTAINERS                                   |  1 +
 .../dts/microchip/at91-sam9x60_curiosity.dts  |  4 ++
 arch/arm/boot/dts/microchip/at91rm9200.dtsi   |  3 +-
 arch/arm/boot/dts/microchip/at91sam9260.dtsi  | 19 +++----
 arch/arm/boot/dts/microchip/at91sam9261.dtsi  |  7 +--
 arch/arm/boot/dts/microchip/at91sam9263.dtsi  |  9 ++--
 arch/arm/boot/dts/microchip/at91sam9g45.dtsi  | 11 ++--
 arch/arm/boot/dts/microchip/at91sam9n12.dtsi  |  7 +--
 arch/arm/boot/dts/microchip/at91sam9rl.dtsi   |  9 ++--
 arch/arm/boot/dts/microchip/at91sam9x5.dtsi   | 11 ++--
 arch/arm/boot/dts/microchip/sam9x60.dtsi      | 23 +++++---
 arch/arm/boot/dts/microchip/sam9x7.dtsi       | 13 ++---
 arch/arm/boot/dts/microchip/sama5d2.dtsi      | 25 ++++-----
 arch/arm/boot/dts/microchip/sama5d3.dtsi      |  9 ++--
 arch/arm/boot/dts/microchip/sama5d4.dtsi      |  9 ++--
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 15 +++---
 arch/arm/boot/dts/microchip/sama7g5.dtsi      | 24 +++++----
 drivers/clk/at91/at91rm9200.c                 | 12 ++---
 drivers/clk/at91/at91sam9260.c                | 14 ++---
 drivers/clk/at91/at91sam9g45.c                | 12 ++---
 drivers/clk/at91/at91sam9n12.c                | 12 ++---
 drivers/clk/at91/at91sam9rl.c                 | 12 ++---
 drivers/clk/at91/at91sam9x5.c                 | 12 ++---
 drivers/clk/at91/sam9x60.c                    | 16 +++---
 drivers/clk/at91/sam9x7.c                     | 24 +++++----
 drivers/clk/at91/sama5d2.c                    | 22 ++++----
 drivers/clk/at91/sama5d3.c                    | 10 ++--
 drivers/clk/at91/sama5d4.c                    | 12 ++---
 drivers/clk/at91/sama7d65.c                   | 44 +++++++--------
 drivers/clk/at91/sama7g5.c                    | 30 ++++++-----
 drivers/nvmem/microchip-otpc.c                | 53 ++++++++++++++++---
 include/dt-bindings/clock/at91.h              | 32 -----------
 .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 15 ++++++
 .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 ++++++
 .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 15 ++++++
 .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 15 ++++++
 .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 15 ++++++
 .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 15 ++++++
 include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 +++++++
 include/dt-bindings/clock/atmel,sama5d3-pmc.h | 14 +++++
 include/dt-bindings/clock/atmel,sama5d4-pmc.h | 15 ++++++
 .../dt-bindings/clock/microchip,sam9x60-pmc.h | 16 ++++++
 .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 20 +++++++
 .../clock/microchip,sama7d65-pmc.h            | 25 +++++++++
 .../dt-bindings/clock/microchip,sama7g5-pmc.h | 20 +++++++
 47 files changed, 514 insertions(+), 238 deletions(-)
 create mode 100644 include/dt-bindings/clock/atmel,at91rm9200-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9260-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,sama5d2-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,sama5d3-pmc.h
 create mode 100644 include/dt-bindings/clock/atmel,sama5d4-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h


base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
-- 
2.47.3


