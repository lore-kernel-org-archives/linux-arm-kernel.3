Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AD9E68956
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PCgGVe0ksTAUflgpZ+sGb6ya0p0TA6itmU7yZLKAq88=; b=rBLnu51e7wqq8rfajDEEz8LaNl
	WOpEKVcpPGd1hKKD/iO0gVDCW90EYjiB0R4+uJxx776ULwHejHdhSjOl6YZp0E308PXfU0EAClNqu
	kEWXcKAJWviCRnUXzTRYO/M1+x/qaBBk4c58uAQPoWVotHaz9uCI5blywx3zJSFrOtaivfRW2l1JO
	cVBySAMWwPYAUMhrOxro0QGIJfkllkUhxU29c2HKhPubj4FqLdFwJqEs05V5f0YFhKbwLoAQQiF9P
	t/zySAmSOuyrK6ev662BsalnYJThWXR3mGhSjpriEtYb0tTfo+upMuyPtZWeeVVGTddlFJpOyaUYI
	BYKnNGnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PLd-00000002m1Q-3qUU;
	Thu, 31 Oct 2024 07:12:02 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PDK-00000002kSC-1CmY;
	Thu, 31 Oct 2024 07:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730358201;
	bh=8BCyeg5IzkuYMXudvFriGegtayHWd0iTD7AKHmg9Xqs=;
	h=From:To:Cc:Subject:Date:From;
	b=C95dSwTBaCseH3f5sJn3+wOaaokpEUVDX9BuzGLPjcJJt/7UjcMv+2g3uB/R//bjg
	 Z4zS0OYvHol4CJkT/fYjO1YhPu+ht2CxehmbQV4hmAsit6iv50inWTzHbn3YlZgSnb
	 ZNw5pUr3ALY40xqMzu8pOnh52KuNAAsqvYJnp4wKT9uWew4GmWkUgx++C6xldbp/Z4
	 2OkSx//jd3yF0cDySi1h38cWVyRZLr8myTA4yq+gX2xiyJs+VafVWWbj8XeKh/j0aq
	 WgmcdX4ci7bG7E1qcHB+M1DSI3s4lLJkc/ASJUKdcMvOQeVpc2GWfFc5ieqeqGGRsp
	 G5hiNgw48kPpA==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 00/13] sunxi: A100/A133 second stage support
Date: Thu, 31 Oct 2024 04:02:13 -0300
Message-ID: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_000326_491108_C31F80D7 
X-CRM114-Status: GOOD (  18.50  )
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

Hello again!

This is V2 of this series [5], with some changes that were requested and
others that were made after testing on more devices. Thank you for all of
your feedback! A changelog is available below.

==================
Back in 2020, two Allwinner employees, Yangtao Li and Shuosheng Huang, each
submitted a patch series for the A100 series of SoCs; [1] intended to add
support for the watchdog, ARM PMU, DMA, USB, and (e)MMC controller, and [2]
implemented DVFS support. Some patches from the first series landed, but
the rest were seemingly abandoned.

Although references to the A100 have been removed by Allwinner, it is
believed that the A133 and A133 Plus, which are still available, are simply
better binned variants of the A100; no other differences have been noted
thus far, and the drivers for the A100 work on the A133 without any
additional modifications. There has been a resurgence of interest in the
A133; patches to allow mainline U-Boot to run on these devices are
currently in progress.

I have rebased the patches that failed to land, applying the feedback
provided by maintainers at the time. Some DT binding patches were added, as
there were a few cases where compatibles were used without being
documented. Minor reworks were necessary to apply certain patches, as the
drivers they modified have matured over time.

Patches 1 and 2 add PMU and watchdog nodes to the device tree. This is
followed by patches 3-7, which implement support for the USB host and OTG
peripherals. Patches 8-10 add MMC nodes, rounding out what originally
made up the first patch series; support for these already exists from
earlier patches, though patch 7 fixes an issue with the clock definitions
preventing the MMC controller from initializing. Patches 11-13 finish the
job of the second original series and this series, implementing OPP and
enabling DVFS on these SoCs.

This series is also available on GitHub [3].

A sincere thanks to Andre for encouraging me to submit these patches,
Parthiban for testing this tree on his board, and to the linux-sunxi
community and its resources for pointing me to these abandoned series in
the first place [4].

[1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=380887&archive=both&state=*
[2] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=396055&archive=both&state=*
[3] https://github.com/BrokenR3C0RD/linux-a100/compare/c2ee9f59..allwinner-a100
[4] https://linux-sunxi.org/Linux_mainlining_effort#Work_In_Progress
[5] https://lore.kernel.org/all/20241024170540.2721307-1-masterr3c0rd@epochal.quest/

Changelog - V2:
 - Change name of opp table to match bindings and pass CHECK_DTBS
 - Drop "phy: sun4i-usb: add support for A100 USB PHY" in favor of
   falling back to "allwinner,sun20i-d1-usb-phy".
 - Add "allwinner,sun50i-a100" to the cpufreq-dt-platform blacklist
 - Update dt-bindings changes to keep intended ordering of compatibles
 - Update regs that were too small in the usbphy bindings
 - Add patch to remove CLK_SET_RATE_NO_REPARENT from the MMC drivers.
 - Fix error in the description of "arm64: dts: allwinner: a100: add usb
   related nodes"
 - Add acks and reviews from Andre and Rob


Cody Eksal (5):
  dt-bindings: phy: sun50i-a64: add a100 compatible
  dt-bindings: usb: Add A100 compatible string
  dt-bindings: usb: sunxi-musb: Add A100 compatible string
  clk: sunxi-ng: a100: enable MMC clock reparenting
  dt-bindings: opp: h6: Add A100 operating points

Shuosheng Huang (2):
  cpufreq: sun50i: add a100 cpufreq support
  arm64: dts: allwinner: a100: Add CPU Operating Performance Points
    table

Yangtao Li (6):
  arm64: dts: allwinner: A100: Add PMU mode
  arm64: dts: allwinner: a100: add watchdog node
  arm64: dts: allwinner: a100: add usb related nodes
  arm64: allwinner: A100: enable EHCI, OHCI and USB PHY nodes in Perf1
  arm64: allwinner: a100: Add MMC related nodes
  arm64: dts: allwinner: a100: perf1: Add eMMC and MMC node

 .../allwinner,sun50i-h6-operating-points.yaml |   1 +
 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  10 +-
 .../usb/allwinner,sun4i-a10-musb.yaml         |   1 +
 .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
 .../allwinner/sun50i-a100-allwinner-perf1.dts |  60 ++++++
 .../dts/allwinner/sun50i-a100-cpu-opp.dtsi    |  90 ++++++++
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 193 +++++++++++++++++-
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c        |   6 +-
 drivers/cpufreq/cpufreq-dt-platdev.c          |   1 +
 drivers/cpufreq/sun50i-cpufreq-nvmem.c        |  28 +++
 11 files changed, 383 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi


base-commit: 0fc810ae3ae110f9e2fcccce80fc8c8d62f97907
-- 
2.47.0


