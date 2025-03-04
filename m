Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0499BC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 01:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U1k9kS7NNsCuSdRIwgtSYCpqOsL+o1YfkYJt7cvWK+o=; b=UBnfDa6tmJGkvQNICpanMcUTQ0
	KzHQqNKWnjq3339HjrNcZkQhz1JqtAmr198cMKBpFCjaCi/C+oplcTBg0r2uCE4xEVYaFgIMREQzA
	DTf6uO7e/34BBVm4+p74ZIH5T0YpCYekhnBHaAsUASvvSmtRoFSZ+QsMB1HO/3xDaITkCc9x0swGO
	73bEhP9sZyke62Cm/tSyJIKJ/NEyhNdjE7BDRcddvFztEgjAnoNjHrlV5aMfzgMSU6x4oBeLt3ZvP
	8oL8d1gXxS7iB6rJoWVzkIfCCI4NbWP22JcT6zl8jJ7U5Xlif7GuQ4grV/mS3zZxRVSFpcXCwn33j
	qLr+760A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHBP-00000002mzp-1MOe;
	Tue, 04 Mar 2025 01:34:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpH7I-00000002lzW-1Xrb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 01:30:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AAA9FEC;
	Mon,  3 Mar 2025 17:30:47 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 877753F673;
	Mon,  3 Mar 2025 17:30:31 -0800 (PST)
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
Subject: [PATCH v3 00/15] clk: sunxi-ng: add A523 clock support
Date: Tue,  4 Mar 2025 01:27:50 +0000
Message-ID: <20250304012805.28594-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_173040_499070_22195336 
X-CRM114-Status: GOOD (  31.58  )
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

this is the third drop of the series introducing basic clock support for
the Allwinner A523 family of SoCs, comprising A523, A527, T527, H728. [1]
This fixes the issues Jernej found in his extensive and gratefully
received review, many thanks for that, also to the other reviewers! 
Those changes affect only details, but the rework caused more changes:
the clock definition helper macros got reworked, and the binding turned
out to be wrong, as it ignored the change in the source clock names
(instead just accommodated their changed number). Shoehorning the
differing names into the existing binding document turned out to be
quite hard to follow, so I moved that into a separate yaml file.
For a more detailed changelog, see below.

*************
Please note that the clock numbers changed compared to v1 and v2, so DTs
from that era cannot be used anymore with this driver: you have to update
the DTB. Just copying the binding header and recompiling the DTB should do
the trick, since the symbols stayed mostly the same, at least as far they
are used in the basic DTs we use today.
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

Patch 04 and 05 add the DT binding description for the two CCUs, along
with all the clock numbers already defined in the binding headers.
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

Andre Przywara (15):
  clk: sunxi-ng: mp: introduce dual-divider clock
  clk: sunxi-ng: mp: provide wrappers for setting feature flags
  clk: sunxi-ng: Add support for update bit
  dt-bindings: clk: sunxi-ng: document Allwinner A523 CCU
  dt-bindings: clk: sunxi-ng: add compatible for the A523 PRCM-CCU
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

 .../clock/allwinner,sun55i-a523-ccu.yaml      |   96 +
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
 17 files changed, 2517 insertions(+), 15 deletions(-)
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


