Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB0E606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X1kbfKvT;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=QkAhBhz/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eVHDswoPhzo1WiGdAgB2ZLB/LxaWyJeyzOshUqsJp0A=; b=X1kbfKvTAcXqd3+HqN1cNMT4R1
	rXMO4ZRr/QcX31RvrG0WYb0VI6nMES7nufsveSiAs6gctQiZzGmeStb3nkFKO1VFpejeBBxOMVh0p
	3u6soReMVxcgzXaNlWj1Wb/cspoQxfMAxXN0vzisoqH6qHwfIFWom/l1CVFl0Tue5kZuPdsBHq1Kb
	TzSgBaNW2ncwmSKd0TgBekbkGEAFA0ifosCwpEUMTutiTYt82dVmSsHjC49hcBwpmD/unCZOdr0C+
	jVXtvpsMj9f8eN9aXdJ1mkYmhoaHWoSg3KWnYy92idrSpFDvhEGIGINUBEeqtSjDVwHKGAfg8M7ix
	q+tZfGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJy-00000008Zmz-3bGS;
	Thu, 05 Nov 2026 11:07:54 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJd-00000008ZOs-0Aqc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:07:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5DC6149662B;
	Thu, 05 Nov 2026 12:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793876872; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=eVHDswoPhzo1WiGdAgB2ZLB/LxaWyJeyzOshUqsJp0A=;
	b=QkAhBhz/O+t6iP3QuLawHO+m+CKIq6+ynQnL9bhrxicPOmJ9JRmemVhJf9AMvZ7+n+53dG
	4cfTeZR0WWjefujMRBkrM89mGAxgumhc5/eu3V0apmHAAfW8MIx+ZyzzKaqBrCt50FPyGZ
	+XVn/xzzzOv5LXhgar2MIyl9mpzHl+jgAzZ8o3i5chFbjJRWxIHRpfQ1NDtqdRER6Bx2jQ
	Onh16Wlvh/uOTDqQPWGodcZPkCLCVUdQt+NIG1jb8raS8gQaOtuweurEmlBLp3s94Oz2fd
	D7jVZBGYyMo8B6EMoatt/5Z5l65/1SSTaMoTPx9legWsmRbLj1bHgD5I6GZEVg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 00/16] Microchip OTPC driver on SAM9X60 exposing UIDxR as additional nvmem device
Date: Thu,  5 Nov 2026 12:06:36 +0100
Message-ID: <20261105110715.2486432-1-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030733_644643_2C47DE5B 
X-CRM114-Status: GOOD (  29.69  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hei hei,

after sitting on my todo list since February, I rebased on top of
v7.4-rc1, addressed all review comments, and now this is v4 of the
series.  Motivation and changelog below:

On a custom sam9x60 based board we want to access a unique ID of the
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

The four patches for the otpc driver start with two patches with some
unrelated fixups for that driver.  It follows a patch dealing the
necessary clock enablement.  The last patch for the otpc driver adds an
additional nvmem device for the UIDx registers, fullfilling the initial
goal of mine.

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

(series based on v7.4-rc1)

v4:
- "re-added" more indexes related to actual hardware to the split-up
  definitions in bindings, adapt other patches to this (Claudiu)
- dropped patch 5 ("clk: at91: sama7d65: Use highest PMC definition as
  max index"), that was a drive-by patch for sama7d65 which is not my
  department, and the discussion implied lots of extra work for a SoC
  not used here
- reword some commit messages (Claudiu)
- dropped patch 8 ("dt-bindings: nvmem: microchip-otpc: Add compatible
  for SAM9X60") and 12 ("nvmem: microchip-otpc: Add SAM9X60 support"),
  no need for a new compatible unless driver needs different behaviour,
  use sama7g5 compatible for sam9x60 as well, adapt other patches
  accordingly (Claudiu)

v3:
- Reordered patch series (thanks Claudiu)
- Collected review tags plus minor commit message fixes (e.g. tag order)
- Removed clock-names from dt bindings, led to confusion on review,
  and not used by the driver anyways (always enables all clocks)
- Removed redundant example from dt bindings docs
- Extended the per SoC splitup of the PMC definitions to the whole at91 family
- Add patch for a small after splitup fixup of the sama7d65 clock driver
- Add patch for removing old preprocessor definitions
- Link: https://lore.kernel.org/all/20260120143759.904013-1-ada@thorsis.com/

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
- Link: https://lore.kernel.org/all/20250210164506.495747-1-ada@thorsis.com/

v1:
- Link: https://lore.kernel.org/all/20240821105943.230281-1-ada@thorsis.com/

(I sent an RFC patch on this topic earlier in 2024, you'll find the
link below as a reference to the discussion.  The patch itself was
trivial and not meant for applying as is anyways, so I decided to not
write a full changelog from RFC to v1.)

RFC:
- Link: https://lore.kernel.org/all/20240412140802.1571935-1-ada@thorsis.com/

Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

Alexander Dahl (16):
  MAINTAINERS: Add sam9/sama to (AT91) SoC support
  dt-bindings: clock: at91: Split up per SoC partially
  dt-bindings: clock: at91: Allow referencing main rc oscillator in DT
  clk: at91: Use new per SoC PMC clock index definitions
  clk: at91: Allow enabling main_rc_osc through DT
  clk: at91: Add peripheral clock id for OTPC
  dt-bindings: nvmem: microchip-otpc: Add required clocks
  nvmem: microchip-otpc: Avoid reading a write-only register
  nvmem: microchip-otpc: Fix swapped 'sleep' and 'timeout' parameters
  nvmem: microchip-otpc: Enable necessary clocks
  nvmem: microchip-otpc: Expose UID registers as 2nd nvmem device
  ARM: dts: microchip: Use new per SoC PMC bindings
  ARM: dts: microchip: sama7g5: Add OTPC clocks
  ARM: dts: microchip: sam9x60: Add OTPC node
  ARM: dts: microchip: sam9x60_curiosity: Enable OTP Controller
  dt-bindings: clock: at91: Remove old PMC definitions

 .../nvmem/microchip,sama7g5-otpc.yaml         |  9 ++++
 .../reset/atmel,at91sam9260-reset.yaml        |  3 +-
 .../bindings/usb/atmel,at91sam9rl-udc.yaml    |  3 +-
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
 drivers/clk/at91/sama7d65.c                   | 40 +++++++-------
 drivers/clk/at91/sama7g5.c                    | 30 ++++++-----
 drivers/nvmem/microchip-otpc.c                | 53 ++++++++++++++++---
 include/dt-bindings/clock/at91.h              | 32 -----------
 .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 16 ++++++
 .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 ++++++
 .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 16 ++++++
 .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 16 ++++++
 .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 16 ++++++
 .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 16 ++++++
 include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 +++++++
 include/dt-bindings/clock/atmel,sama5d3-pmc.h | 16 ++++++
 include/dt-bindings/clock/atmel,sama5d4-pmc.h | 17 ++++++
 .../dt-bindings/clock/microchip,sam9x60-pmc.h | 16 ++++++
 .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 20 +++++++
 .../clock/microchip,sama7d65-pmc.h            | 27 ++++++++++
 .../dt-bindings/clock/microchip,sama7g5-pmc.h | 24 +++++++++
 48 files changed, 528 insertions(+), 235 deletions(-)
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


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


