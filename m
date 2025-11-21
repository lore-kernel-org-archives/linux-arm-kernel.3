Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE30CFA76D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2WAZz77GYS5XXRDMP8uF9dTvcXQiXR9By/YNb2N8mMs=; b=U9WctBFUs3asu9yMZgwtbcbpi6
	BJuiyfeeApJ6CSe0dMZP5ysXKIGDQRdedmIoLWo6hWamrZS6BWbObhpOV5P46t/fnH8Y/lkPUBpMZ
	cyn+g7WPupV+11+lSv5gOHvZ2KMlfaJDCORD+CssrKAMeRwi0UOHqjploAnvB4PNFLMAYal6fyaGL
	uTC8vrg2m4WS2kRjlF+UQGC5ah+9rAR6TCPHYHnKHlbCAex9DLPQ3CiU+4LggnKtLl9rcoWmLbVpU
	QLXHT8/VcfCYPvMygrKv1C0UHPTpKd5UTPX3pNaWZqbz0UTxL0VBEt7Jwd3CLq9K/mQhXYzfXRAMR
	2Bniq+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMOrl-00000008GPx-3qW3;
	Fri, 21 Nov 2025 10:59:49 +0000
Received: from [114.94.151.114] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMOri-00000008GOx-3IUb;
	Fri, 21 Nov 2025 10:59:47 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.61; Fri, 21 Nov 2025
 18:59:39 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	"Dmitry Rokosov" <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v5 0/5] add support for T7 family clock controller
Date: Fri, 21 Nov 2025 18:59:29 +0800
Message-ID: <20251121105934.1759745-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.11.121]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_025946_828711_7CFA0DA5 
X-CRM114-Status: GOOD (  10.76  )
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

It introduces three clock controllers:
- SCMI clock controller: these clocks are managed by the SCP and handled through SCMI.
- PLL clock controller.
- peripheral clock controller.

Changes v5 since v4 at [4]:
- rename rtc and cec dualdiv clocks
- rename dsp clocks
- rename anakin clocks
- rename fdiv2_divn to 25m and fix its parent
- add flag for T7_COMP_GATE
- use T7_COMP_SEL/DIV/GATE to define glitch clocks
- add CLK_SET_RATE_NO_REPARENT for t7_eth_rmii_sel and rtc
- move module_platform_driver after clock driver

Changes v4 since v3 at [3]:
- drop amlogic_t7_pll_probe, use meson_clkc_mmio_probe instead
- add CLK_DIVIDER_MAX_AT_ZERO for pcie_pll_od clk
- add frac for hifi_dco_pll_dco
- add l_detect for mclk_pll_dco
- drop v3 5/6 patch, and use MESON_PCLK
- drop SPI_PWM_CLK_XX macro and use MESON_COMP_XX
- drop the register's prefix

Changes v3 since v2 at [2]:
- update T7 PLL YAML
- add 't7_' prefix for t7 clock name and variable in t7-pll.c and t7-peripherals.c
- correct v1 patch link
- add new macro MESON_PCLK_V2
- update the driver,header,yaml file license

Changes v2 since v1 at [1]:
- add CLK_MESON import
- add const for clkc_regmap_config in PLL driver
- fix eth_rmii_sel parent
- update T7 PLL YAML file

[1]: https://lore.kernel.org/all/20241231060047.2298871-1-jian.hu@amlogic.com
[2]: https://lore.kernel.org/all/20250108094025.2664201-1-jian.hu@amlogic.com
[3]: https://lore.kernel.org/all/20250509074825.1933254-1-jian.hu@amlogic.com
[4]: https://lore.kernel.org/all/20251030094345.2571222-1-jian.hu@amlogic.com
Jian Hu (5):
  dt-bindings: clock: add Amlogic T7 PLL clock controller
  dt-bindings: clock: add Amlogic T7 SCMI clock controller
  dt-bindings: clock: add Amlogic T7 peripherals clock controller
  clk: meson: t7: add support for the T7 SoC PLL clock
  clk: meson: t7: add t7 clock peripherals controller driver

 .../clock/amlogic,t7-peripherals-clkc.yaml    |  116 ++
 .../bindings/clock/amlogic,t7-pll-clkc.yaml   |  114 ++
 drivers/clk/meson/Kconfig                     |   27 +
 drivers/clk/meson/Makefile                    |    2 +
 drivers/clk/meson/t7-peripherals.c            | 1266 +++++++++++++++++
 drivers/clk/meson/t7-pll.c                    | 1068 ++++++++++++++
 .../clock/amlogic,t7-peripherals-clkc.h       |  228 +++
 .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |   56 +
 include/dt-bindings/clock/amlogic,t7-scmi.h   |   47 +
 9 files changed, 2924 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/t7-peripherals.c
 create mode 100644 drivers/clk/meson/t7-pll.c
 create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h

-- 
2.47.1


