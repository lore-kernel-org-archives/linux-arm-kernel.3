Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA49E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WC1L2UtewK8135KsXcUAB8GET0MQBNUWgUR1IT1j4gQ=; b=XKCVvejdG5doy8rutrK2eVPRoi
	B2bBQVGAdKv2eFlyoTOwHOIrat56DHzwOqkyaJo/WhEO91tqW+kYLyzcO4ZAts63ikhwtctJNqaGi
	O4vz7ELa0CjIFxlJdTkvchSLQmGMa/IiQiRse/cinlr6VNiC2+qZeamH2lkaYk7g4oHvzWNvpfn3Q
	+ydrfEtVDscx2SRcaxnzl4Su9SF6AmM1Tr7K1uYs8Z3TFz7XlvsLXyYwR7cw8shBwJOj6Kyg7ovzx
	GRnOVy0xGCQiaCpANvJ2KBCqgLoTM+k/tPP3NdtIDYrbUUC7u4MzbCAVDLK1w8SZU6tXlhMJloQxY
	/CGl9ovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImeR-0000000CCl2-3o9B;
	Wed, 04 Dec 2024 10:30:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImdQ-0000000CCWC-48m6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:29:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4E08FA40F05;
	Wed,  4 Dec 2024 10:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338F8C4CED1;
	Wed,  4 Dec 2024 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308171;
	bh=5RmLLYfxIYfiiXZeAs59BD7aRTdabSYHES1clzll0uU=;
	h=From:To:Cc:Subject:Date:From;
	b=IrtL7KoFF1I0VYo7gfuVoBC+Rt4Lffy3fo29tGVmve/yw9Mk428wwypyzHd6F3ias
	 h8NkQKwgA75+ZQkmrjn0mItzskwlI0NLzyceG6Gzm2VTij3coHJXECLu2LgryFjzv8
	 OSkhYpmD8NaAlAv5Jx/aFV/OJwpGDMJo1aT631BQ0fy6C+on3C2lKkFhNM5hwFeBYk
	 hH/qzi8sVf6FZT6vuNSe+GbMgurk8/IHsImLonqf6JxkHjVGZGLAFfhP+ghTL4LLtF
	 kijtGV9cRxxhn6Rks+mA7q6tjupKZuLEbdLBgDqcb4ray0JDXqkxvoYlAJ0752oS72
	 1pcWwwvzU44Ug==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andrew Lunn <andrew@lunn.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH 00/15] ARM: platform and feature deprecation
Date: Wed,  4 Dec 2024 11:28:49 +0100
Message-Id: <20241204102904.1863796-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_022933_166708_E974294B 
X-CRM114-Status: GOOD (  19.36  )
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

From: Arnd Bergmann <arnd@arndb.de>

This is attempt to bring the source code to the state that we discussed
this summer[1], regarding a timeline for deprecating and removing
features:

 - DEPRECATED_PARAM_STRUCT and ARCH_S3C64XX were meant to be
   removed by now, but get an extension

 - all board files except for OMAP1 and S3C get an tentative
   end-of-life date in either 2025 or early 2026.

 - IWMMXT is scheduled for removal in 2026

 - ARMv6/ARM1136r0 (not ARMv6K/ARM1136r1/ARM1176) is scheduled
   for removal in 2026, along with the OMAP24xx and i.MX31 SoCs
   using it

 - OABI, OABI-compat and NWFPE are confined to StrongARM based
   builds and scheduled for removal once StrongARM is gone.

Regarding actually removing the code, I would plan for linux-6.15 (June
2025), removing both the board files and any drivers that have either
become newly unused or were missed in a previous machine removal series.
For the 2026 removals, I would plan on the release after the next LTS
kernel, most likely 6.19.

The timeline for the three StrongARM platforms is missing feedback from
Russell, who is listed as maintainer for two of them and last confirmed
using all three roughly five years ago[2]. I put those patches last
in the series so they can be dropped if Russell still plans to run
kernels after 6.12-LTS on one or more of these.

      Arnd

[1] https://lore.kernel.org/linux-arm-kernel/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/
[2] https://lore.kernel.org/linux-arm-kernel/20210109174357.GB1551@shell.armlinux.org.uk/

Arnd Bergmann (15):
  ARM: use CONFIG_AEABI by default everywhere
  ARM: limit OABI support to StrongARM CPUs
  ARM: rework ARM11 CPU selection logic
  ARM: deprecate support for ARM1136r0
  ARM: turn CONFIG_ATAGS off by default
  ARM: update DEPRECATED_PARAM_STRUCT removal timeline
  ARM: s3c64xx: extend deprecation schedule
  ARM: update FPE_NWFPE help text
  ARM: mark IWMMXT as deprecated
  ARM: deprecate ARCH_DOVE
  ARM: PXA: deprecate remaining board file support
  ARM: orion5x: mark all board files as deprecated
  ARM: mark mach-sa1100 as deprecated
  ARM: mark RiscPC as deprecated
  ARM: mark footbridge as deprecated

 arch/arm/Kconfig                        | 72 +++++++++++++------------
 arch/arm/Kconfig.platforms              |  2 +-
 arch/arm/configs/am200epdkit_defconfig  |  3 +-
 arch/arm/configs/aspeed_g4_defconfig    |  2 -
 arch/arm/configs/aspeed_g5_defconfig    |  1 -
 arch/arm/configs/assabet_defconfig      |  3 ++
 arch/arm/configs/at91_dt_defconfig      |  2 -
 arch/arm/configs/axm55xx_defconfig      |  2 -
 arch/arm/configs/bcm2835_defconfig      |  1 -
 arch/arm/configs/clps711x_defconfig     |  1 -
 arch/arm/configs/collie_defconfig       |  2 +-
 arch/arm/configs/davinci_all_defconfig  |  1 -
 arch/arm/configs/dove_defconfig         |  2 +-
 arch/arm/configs/ep93xx_defconfig       |  1 -
 arch/arm/configs/footbridge_defconfig   |  2 +
 arch/arm/configs/gemini_defconfig       |  1 -
 arch/arm/configs/h3600_defconfig        |  3 +-
 arch/arm/configs/hisi_defconfig         |  1 -
 arch/arm/configs/imx_v4_v5_defconfig    |  1 -
 arch/arm/configs/integrator_defconfig   |  2 -
 arch/arm/configs/ixp4xx_defconfig       |  1 -
 arch/arm/configs/jornada720_defconfig   |  3 +-
 arch/arm/configs/keystone_defconfig     |  1 -
 arch/arm/configs/lpc32xx_defconfig      |  1 -
 arch/arm/configs/mmp2_defconfig         |  1 -
 arch/arm/configs/moxart_defconfig       |  2 -
 arch/arm/configs/mps2_defconfig         |  1 -
 arch/arm/configs/multi_v4t_defconfig    |  2 -
 arch/arm/configs/multi_v5_defconfig     | 10 ----
 arch/arm/configs/mv78xx0_defconfig      |  3 +-
 arch/arm/configs/mvebu_v5_defconfig     | 11 ----
 arch/arm/configs/mxs_defconfig          |  1 -
 arch/arm/configs/neponset_defconfig     |  3 ++
 arch/arm/configs/netwinder_defconfig    |  3 ++
 arch/arm/configs/nhk8815_defconfig      |  1 -
 arch/arm/configs/omap1_defconfig        |  3 +-
 arch/arm/configs/orion5x_defconfig      | 11 ----
 arch/arm/configs/pxa168_defconfig       |  2 -
 arch/arm/configs/pxa3xx_defconfig       |  2 -
 arch/arm/configs/pxa910_defconfig       |  2 -
 arch/arm/configs/pxa_defconfig          |  5 --
 arch/arm/configs/rpc_defconfig          |  3 ++
 arch/arm/configs/s3c6400_defconfig      |  2 +
 arch/arm/configs/sama5_defconfig        |  1 -
 arch/arm/configs/sama7_defconfig        |  1 -
 arch/arm/configs/spear13xx_defconfig    |  1 -
 arch/arm/configs/spitz_defconfig        |  2 +-
 arch/arm/configs/stm32_defconfig        |  1 -
 arch/arm/configs/versatile_defconfig    |  2 -
 arch/arm/configs/vt8500_v6_v7_defconfig |  1 -
 arch/arm/configs/wpcm450_defconfig      |  2 -
 arch/arm/mach-dove/Kconfig              |  8 ++-
 arch/arm/mach-footbridge/Kconfig        |  7 ++-
 arch/arm/mach-imx/Kconfig               |  8 ++-
 arch/arm/mach-omap2/Kconfig             | 17 ++++--
 arch/arm/mach-orion5x/Kconfig           | 47 ++++++++++++----
 arch/arm/mach-pxa/Kconfig               | 10 +++-
 arch/arm/mach-rpc/Kconfig               |  5 +-
 arch/arm/mach-s3c/Kconfig.s3c64xx       | 15 ++++--
 arch/arm/mach-sa1100/Kconfig            |  5 +-
 arch/arm/mach-versatile/Kconfig         | 15 +++---
 arch/arm/mm/Kconfig                     | 26 ++++++++-
 62 files changed, 194 insertions(+), 159 deletions(-)

-- 
2.39.5

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: "Jeremy J. Peper" <jeremy@jeremypeper.com>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-arm-kernel@lists.infradead.org

