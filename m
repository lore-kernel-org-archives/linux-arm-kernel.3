Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EBCCE8E96
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dBVUZ+tOL8pDm6F24c4swN6cqB/PKxPAdkirXZhMAwo=; b=0xMCp0KrZLYNXUxqK6vwTkSLYi
	enGDZ/sZ/IssIMp7WvTJp4yfAdrfStkuROXbKmPGxWvGIQkPyP+ZALFQPgTXMuQNL+3glWLOU/mlU
	5KMC7TRr8R9A0lmEYP0/qmc4ZsQ4yHha5O66rpxM03K+G8QltGIQTlLsNmIG/L9/CNNfPGIpHeeOz
	6i+HbGDJI5uUKHR6gFYcEZ+xbl0uoHnVssnBYxcOmh9TjZkvRCnAhhssEmEELtcXXc82cWRDlsq4/
	ytvVaJsFMdP7BXoimJX7uJjROlMVbkt/DYEe8B7zNSlrslGu7DapPl0wBUAaT5IxEV67pgKnDRFuA
	exBFHEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41N0-00000001EGG-30eh;
	Thu, 24 Oct 2024 17:11:34 +0000
Received: from thales.epochal.quest ([2607:5300:205:200::3a30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41LF-00000001Dlm-13CI;
	Thu, 24 Oct 2024 17:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1729789781;
	bh=s7xzMFvJ4Cag5AvnrOIpgkj1EGCgsWQbCxPj4HldfhU=;
	h=From:To:Cc:Subject:Date:From;
	b=XV3L7CAWsqfMo1+ztn5WJZFeVtrIN2TalAaxLuOyWtU0K6CierjqNvMA7qIxXIygT
	 /3edWKT7iFdUrQQeitM9eKoXXPz/1+YTBxLPnE6AGmGSbguryxK+m0ao7t0RhgVlwh
	 djaT0WBOlfhLbDGAah2KRenKKJG7MWaW+MpcVAnNOYI2XKCGNV6CbxajODgBEAG4Xs
	 g4fxBfMffN8VuFIi84Bj0lRJswbnM1rjyhSluGgSpPmzeflhMOTqDQ7CYKEAj0KpYz
	 QInLLVqWJP39DHxkarJgZmFkAZRuO0LAtXUr5gOQyGBVstgjUdtd27JnkYOmSXCRSM
	 vbs5ewMt05EeQ==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	Andre Przywara <andre.przywara@arm.com>,
	Parthiban <parthiban@linumiz.com>,
	Yangtao Li <frank@allwinnertech.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 00/13] sunxi: A100/A133 second stage support
Date: Thu, 24 Oct 2024 14:05:18 -0300
Message-ID: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_100945_388618_EF0CED3E 
X-CRM114-Status: GOOD (  16.87  )
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

Hello! This is my first submission, so please be gentle :)

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
followed by patches 3-8, which implement support for the USB host and OTG
peripherals. Patches 9 and 10 add MMC nodes, rounding out what originally
made up the first patch series; support for these already exists from
earlier patches. Patches 11-13 finish the job of the second original
series and this series, implementing OPP and enabling DVFS on these SoCs.

This series is also available on GitHub [3].

A sincere thanks to Andre for encouraging me to submit these patches,
Parthiban for testing this tree on his board, and to the linux-sunxi
community and its resources for pointing me to these abandoned series in
the first place [4].

[1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=380887&archive=both&state=*
[2] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=396055&archive=both&state=*
[3] https://github.com/BrokenR3C0RD/linux-a100/compare/c2ee9f59..allwinner-a100
[4] https://linux-sunxi.org/Linux_mainlining_effort#Work_In_Progress

Cody Eksal (4):
  dt-bindings: phy: sun50i-a64: add a100 compatible
  dt-bindings: usb: Add A100 compatible string
  dt-bindings: usb: sunxi-musb: Add A100 compatible string
  dt-bindings: opp: h6: Add A100 operating points

Shuosheng Huang (2):
  cpufreq: sun50i: add a100 cpufreq support
  arm64: dts: allwinner: a100: Add CPU Operating Performance Points
    table

Yangtao Li (7):
  arm64: dts: allwinner: A100: Add PMU mode
  arm64: dts: allwinner: a100: add watchdog node
  phy: sun4i-usb: add support for A100 USB PHY
  arm64: dts: allwinner: a100: add usb related nodes
  arm64: allwinner: A100: enable EHCI, OHCI and USB PHY nodes in Perf1
  arm64: allwinner: a100: Add MMC related nodes
  arm64: dts: allwinner: a100: perf1: Add eMMC and MMC node

 .../allwinner,sun50i-h6-operating-points.yaml |   1 +
 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |   1 +
 .../usb/allwinner,sun4i-a10-musb.yaml         |   1 +
 .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
 .../allwinner/sun50i-a100-allwinner-perf1.dts |  59 ++++++
 .../dts/allwinner/sun50i-a100-cpu-opp.dtsi    |  90 ++++++++
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 193 +++++++++++++++++-
 drivers/cpufreq/sun50i-cpufreq-nvmem.c        |  28 +++
 drivers/phy/allwinner/phy-sun4i-usb.c         |  11 +
 10 files changed, 383 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi


base-commit: c2ee9f594da826bea183ed14f2cc029c719bf4da
-- 
2.47.0


