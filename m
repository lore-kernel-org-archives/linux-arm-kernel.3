Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF76C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o4MUyC8GXuqYFaFQAtIZpjWk0DNleuRZNoaaPcf8cSI=; b=KLUWKwHNOsres2ZQ+16uZTfAqM
	+QCYnpFjLDFuZZi8I/relk97LvFn2VNgDCW3oW1HJJljc1rv8+XGOe5cD+HBqd0lkaUq52q8uU8q2
	8yri5I6QxKMRRXUiS4vi+/wtW36Jrzu8dvuDKH/fKky4v0uyltvRvLDiEoF6TnW9i4Cx4quuICPdT
	s2PpTTHAv15MCR6qIYW4kgPuDcfzwxinRuy+9t0avUYlOp8WVgdx6F7qrPhkZT3GtcL5SG/AolwYA
	Yu2D7aPTrSgsxgZgALzXtvyf3G0jMuDHB7P/mPBb/s/b6Iy2uoS7Hn00Om0gSIHfe8086DiFtjATU
	+5LDT2mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLZZ-0000000CdQf-46iv;
	Fri, 07 Mar 2025 00:28:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLXv-0000000Cd4C-38gM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:26:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE362169E;
	Thu,  6 Mar 2025 16:26:47 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38A423F673;
	Thu,  6 Mar 2025 16:26:33 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/14] clk: sunxi-ng: add A523 clock support
Date: Fri,  7 Mar 2025 00:26:14 +0000
Message-ID: <20250307002628.10684-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_162635_879350_8C148767 
X-CRM114-Status: GOOD (  32.35  )
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

Hi,

this is the fourth drop of the series introducing basic clock support for
the Allwinner A523 family of SoCs, comprising A523, A527, T527, H728. [1]
This times just a small rename of a macro name, and fixing the DT
binding, where the separate patches for the two CCUs got merged into
one. For a more detailed changelog, see below.

*************
Please note that the clock numbers changed compared to v1 and v2, (but
not against v3) so DTs from that older era cannot be used anymore with
this driver: you have to update the DTB. Just copying the binding header
and recompiling the DTB should do the trick, since the symbols stayed
mostly the same, at least as far they are used in the basic DTs we use
today.
*************

The SoCs contain *four* CCU components, aside from the usual main clock
device and the PRCM clock (in the always-on-domain), there is an MCU
clock and a CPU clock. This series just adds support for the first two,
the other two don't seem to be required for the basic functionality.

The clock tree of each SoC has always been individual, even though the
main clock *types* mostly remain the same. This time we see three slight
variations: There is an MP clock without the P (shift) part, there is one
with two dividers instead of one divider and one shift field, and certain
clocks require an "update" bit to be set to apply any changes.
The first three patches add support for these new clock types.

Patch 04 adds the DT binding description for the two CCUs, along with all
the clock numbers already defined in the binding headers.
Since the main CCU is massive, and contains a lot of detail, I decided
to split this driver up into 9 patches, simply to help review. I tried
to group them somewhat logically, although this is rather arbitrary, and
just to make each individual patch smaller. I am happy to squash them
all back into one patch once they have been reviewed, for the final
merge. The PRCM CCU is comparably small, so I kept this in one patch.

Interestingly the Allwinner BSP has switched to using the existing sunxi
CCU framework for modelling the clocks (they had their own way before), so
we could theoretically use their code. However when I started working on
this more than a year ago, their files had a GPL-3.0-only license header,
which, according to my research, makes them incompatible for mainline
inclusion. I thus started from "scratch" (adjusting the D1 driver, really).
Meanwhile they seem to have changed the license, and a quick comparison
turned up some differences, some of which seem to be bugs on their, some
on my side, probably. I hope having such a "reference" helps the mainline
code quality, as people can help the review by comparing code.

Given the level of detail required in CCU drivers, I am certain there are
still some bugs in there, also many things that can be improved. But after
starring and editing this for weeks, I feel like it's time for the
community to have a look, so please help with the review, and also test.

Based on v6.14-rc1.

Cheers,
Andre

[1] https://linux-sunxi.org/A523#Family_of_sun55iw3

Changelog v3 .. v4:
- rename new update bit flag to just CCU_FEATURE_UPDATE_BIT
- merge the two DT binding patches into one
- describe each CCU in its own "if" clause in the DT binding
- fix DT example in DT binding
- add one tag

Changelog v2 .. v3:
- rename PLL_DDR0 to PLL_DDR
- move bogus macro definition from PLL patch to an earlier patch
- adding CLK_SET_RATE_PARENT flags where needed (GPU, eDP, ...)
- remove CLK_SET_RATE_PARENT from clocks with only fixed parents
- add support for clocks with the "update" bit (BIT(27))
- flags IOMMU, MBUS and DRAM clocks as needing "update" bit
- remove leftover comment about missing mux
- fix TCON_TV parent list
- add TCON_LCD2 clock
- export PLL_GPU
- describe MBUS clock properly (was copy&pasted wrongly from D1)
- change MMC clocks to use better macro
- mark SPI and CSI clocks as being dual-divider clocks
- fix wrong DSP parent clock (480 instead of 400 MHz)
- properly implement fanout clocks (describe both dividers)
- fix MBUS gate clocks and add two new ones
- rename dpss clock to display0 and add display1 clocks
- drop non-existing bus_dsp_cfg_clk
- mark r_timer clocks as having no divider
- fix r_pwm mux width
- move DT bindings into separate yaml file
- describe different source clock sets correctly
- add review tags
- remove Chen-Yu's and Conor's tags from changed patches

Changelog v1 .. v2:
- rebase onto v6.14-rc1
- split main CCU definition patch into 9 smaller patches
- rename RST_BUS_VO1_TCONLCD0 to RST_BUS_TCON_LCD2
- insert CLK_PLL_VIDEO3_xx clocks
- add clock for 2nd EMAC
- fix ISP clock definition
- remove BSP comments from clocks now documented in the T527 manual
- add Conor's binding ACKs (with thanks!)

Andre Przywara (14):
  clk: sunxi-ng: mp: introduce dual-divider clock
  clk: sunxi-ng: mp: provide wrappers for setting feature flags
  clk: sunxi-ng: Add support for update bit
  dt-bindings: clk: sunxi-ng: document two Allwinner A523 CCUs
  clk: sunxi-ng: Add support for the A523/T527 CCU PLLs
  clk: sunxi-ng: a523: Add support for bus clocks
  clk: sunxi-ng: a523: add video mod clocks
  clk: sunxi-ng: a523: add system mod clocks
  clk: sunxi-ng: a523: add interface mod clocks
  clk: sunxi-ng: a523: add USB mod clocks
  clk: sunxi-ng: a523: remaining mod clocks
  clk: sunxi-ng: a523: add bus clock gates
  clk: sunxi-ng: a523: add reset lines
  clk: sunxi-ng: add support for the A523/T527 PRCM CCU

 .../clock/allwinner,sun55i-a523-ccu.yaml      |  103 +
 drivers/clk/sunxi-ng/Kconfig                  |   10 +
 drivers/clk/sunxi-ng/Makefile                 |    4 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c      |  248 +++
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h      |   14 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        | 1685 +++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.h        |   14 +
 drivers/clk/sunxi-ng/ccu_common.h             |    5 +
 drivers/clk/sunxi-ng/ccu_div.c                |    2 +
 drivers/clk/sunxi-ng/ccu_gate.c               |    4 +
 drivers/clk/sunxi-ng/ccu_mp.c                 |   51 +-
 drivers/clk/sunxi-ng/ccu_mp.h                 |   58 +-
 drivers/clk/sunxi-ng/ccu_mux.c                |    2 +
 include/dt-bindings/clock/sun55i-a523-ccu.h   |  189 ++
 include/dt-bindings/clock/sun55i-a523-r-ccu.h |   37 +
 include/dt-bindings/reset/sun55i-a523-ccu.h   |   88 +
 include/dt-bindings/reset/sun55i-a523-r-ccu.h |   25 +
 17 files changed, 2524 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-ccu.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-r-ccu.h

-- 
2.46.3


