Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4AFC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 11:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NNqyxgyK0nsgvQIxHIvNEn3WYoXCL9lVWy5TTd0G+sE=; b=W7Nt1n31d3+SuO0j/ocb51kowK
	H7WGR/kBAJqOWZgNcMAIB+92+9ltuu+jf5TlR7m0XOxOHboKC+Ovqv+NsMKTIDi/jw36gcYsZPT2W
	KVC0ciuyk7cjn7f3f3qSVcY8ECFWTeioW0R1zPrinBJ8Qz7N3X5AymEtyrLZ267HPNBupjZ8AEywj
	BgujFQ29CWdcvbrcrC2faUHTH/0eGIRSte3bL93jD+ecXw5U3N87z3CLJpUDwWHzbte/tqX4giTqf
	HDbgVwh/N8g/Ife6ZdyvZob+flyV2DmIW/lVuEJ6gb6V58Dy6/uT6/4+bqNjHclRYn4xz8u4qIcKW
	5BxjC6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiNc-0000000Gbzr-1usD;
	Tue, 29 Jul 2025 11:20:24 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiL6-0000000GbkM-1IOl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 11:17:49 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54b10594812so5537778e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 04:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753787866; x=1754392666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNqyxgyK0nsgvQIxHIvNEn3WYoXCL9lVWy5TTd0G+sE=;
        b=wl8qslsiVjyJpeQgrJvnpFVLLl8pJfjeennC6RPLE+z/79MDXMZerc6/7aqVHDrp8o
         2otfY5sMHLzSxJYLLP8NQ2W3gvet5boqFrupr1IpeLaVbnLKQ1/TJJGBr/duVn7Wpn1r
         C22MPVyNymQXGl9NVTqPvU15WuNShk9Au3jgKrwD5LkwaG+RGDhz6TrpMVtx7Zrvnu3q
         zzGZwnSXs6hpoeHod2QeUcG1D047ahh3C3/Ppc4VKdH2b7mhXg/AsMlrsAZCTgmmbvaz
         CIVcEmkjOTsRKvOahz54sgJFew7zvYRb7rF2bL//hu5abnY4Ydw/gPRTb2Ypn8ev8LtD
         TqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753787866; x=1754392666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNqyxgyK0nsgvQIxHIvNEn3WYoXCL9lVWy5TTd0G+sE=;
        b=gzV7E9/eOd7YM27PcNPFLBsUBWOfaC5y/HSaj8M0OAYxhVkC2aoZGRmvvxReueQg+E
         AgAjzX0q/4sGWfA7nZuVbDFlG9xdQgpxaqCDMsZUTACjRkPCtgXiH1fFFZ4ELAFmlqtq
         Qar1BsJEFAlJc46abZ3YXwghH66bNSeOVlPDUhCmcWX/rOozHaDLy5pC7vrMkc0HTMjj
         0INpvTBo4hDiv6O9KyMBYw2uE3mJpLAv32r2CndShk8F8P1mrtAEnoSpH08cK4LxtY/Q
         RF96sxC/mE2R4PMubsnTHGgOjMevDjiKbKtfMym610BFmGMYRIRxC11m/Gqr9gtR7kwg
         Ppcw==
X-Forwarded-Encrypted: i=1; AJvYcCVtCci+bZDy5h1dbjO2rrf8HXUJ/smgNjF923Rl1gienujQqbONKZ79wft+atec2sJ+dqGA4T1mJ7sfgPC+aZhR@lists.infradead.org
X-Gm-Message-State: AOJu0YwfQrx3m8cAnd6SNmbAQMn9MXhT6ZObO+rKa7ByB8exmK1rHpf5
	zP+BSw5unIk5yzFId1EE8qE1m2PoFuF7pWkLuI91s+yU5qF29/IhfZAM9AkVBj2+3VA=
X-Gm-Gg: ASbGncs2UMqkM74YjNroB4URo6k7+PWGU8iczcN+skqyV1AooxJwo2ikswF13Z0k+tM
	bUyRkuUFu6OAxqnkQ7Y2++FiS3b4lC1LWbuN6VFLXdw1ziHMlx8dyqD5I8hgs+SxH4FBcZH+n0s
	GAoYPSUWdZwA0aqTlv6ghpbCab+OpVDgNjjNmqwgpMmVoDM932ioeczmSmKTVkAT7qWzGw1GD0l
	eQXq/Qotzot2IZfjeNvVLPxZEMXBdlJkqz4LZ5N23wH5eYnLsq8ikrPBHZivC8SX4vrb6BYSkZx
	8ZhwtulGtkIXE11bxS5Axgui/r7p/8l25/wnrgpQV391c+qV/ni5BhNd9iXTVuxBIVY5EnIyeFP
	M8lR+UlEuG5bqDEcRdGu+TrHAoMq6A4TKizG8Je4J7pJqnml5cyKhWNWWmaRriQcDORvFBsd9
X-Google-Smtp-Source: AGHT+IGssqGSc/l4qTALfsZmnWpz0MEgV6jXLRfV5IBNiy/NKNIKDaCf0ufZ7BJYRZwGjpYZkZDx3g==
X-Received: by 2002:a05:6512:23a2:b0:554:f76a:baba with SMTP id 2adb3069b0e04-55b5f3d5c73mr4808104e87.3.1753787865739;
        Tue, 29 Jul 2025 04:17:45 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6316db49sm1652507e87.3.2025.07.29.04.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 04:17:45 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain/cpuidle-psci updates for v6.17
Date: Tue, 29 Jul 2025 13:17:33 +0200
Message-ID: <20250729111743.14723-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_041748_383334_E3A5676D 
X-CRM114-Status: GOOD (  20.36  )
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

Hi Linus,

Here's the pull-request with pmdomain and cpuidle-psci updates for v6.17.

FYI, this time we have made quite some changes in the pmdomain provider core
(aka genpd), which affects a couple of provider drivers that are sprinkled
across a few more subsystems than usual.

More details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 621a88dbfe9006c318a0cafbd12e677ccfe006e7:

  cpuidle: psci: Fix cpuhotplug routine with PREEMPT_RT=y (2025-07-14 13:09:04 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.17

for you to fetch changes up to 05e35bd07d56780f0a5119973995b97a16843579:

  pmdomain: qcom: rpmhpd: Add Glymur RPMh Power Domains (2025-07-23 12:12:16 +0200)

----------------------------------------------------------------
pmdomain core:
 - Leave powered-on genpds on until ->sync_state() or late_initcall_sync
 - Export a common ->sync_state() helper for genpd providers
 - Add generic ->sync_state() support
 - Add a bus/driver for genpd provider-devices
 - Introduce dev_pm_genpd_is_on() for consumers

pmdomain providers:
 - cpuidle-psci: Drop redundant ->sync_state() support
 - cpuidle-riscv-sbi: Drop redundant ->sync_state() support
 - imx: Set ISI panic write for imx8m-blk-ctrl
 - qcom: Add support for Glymur and Milos RPMh power-domains
 - qcom: Use of_genpd_sync_state() for power-domains
 - rockchip: Add support for the RK3528 variant
 - samsung: Fix splash-screen handover by enforcing a ->sync_state()
 - sunxi: Add support for Allwinner A523's PCK600 power-controller
 - tegra: Opt-out from genpd's common ->sync_state() support for pmc
 - thead: Instantiate a GPU power sequencer via the auxiliary bus
 - renesas: Move init to postcore_initcalls
 - xilinx: Move ->sync_state() support to firmware driver
 - xilinx: Use of_genpd_sync_state() for power-domains

pmdomain consumers:
 - remoteproc: imx_rproc: Fixup the detect/attach procedure for pre-booted cores

----------------------------------------------------------------
Chen-Yu Tsai (4):
      dt-bindings: power: Add A523 PPU and PCK600 power controllers
      pmdomain: sunxi: sun20i-ppu: add A523 support
      pmdomain: sunxi: add driver for Allwinner A523's PCK-600 power controller
      pmdomain: sunxi: sun20i-ppu: change to tristate and enable for ARCH_SUNXI

Christophe JAILLET (1):
      pmdomain: amlogic: Constify struct meson_secure_pwrc_domain_data

Guillaume La Roque (1):
      pmdomain: ti: Select PM_GENERIC_DOMAINS

Hiago De Franco (3):
      pmdomain: core: introduce dev_pm_genpd_is_on()
      remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
      remoteproc: imx_rproc: detect and attach to pre-booted remote cores

Jonas Karlman (3):
      dt-bindings: power: rockchip: Add support for RK3528
      dt-bindings: rockchip: pmu: Add compatible for RK3528
      pmdomain: rockchip: Add support for RK3528

Kamal Wadhwa (2):
      dt-bindings: power: rpmpd: Add Glymur power domains
      pmdomain: qcom: rpmhpd: Add Glymur RPMh Power Domains

Krzysztof Hałasa (1):
      imx8m-blk-ctrl: set ISI panic write hurry level

Kuninori Morimoto (2):
      pmdomain: renesas: use menu for Renesas
      pmdomain: renesas: sort Renesas Kconfig configs

Luca Weiss (2):
      dt-bindings: power: qcom,rpmpd: document the Milos RPMh Power Domains
      pmdomain: qcom: rpmhpd: Add Milos power domains

Lukas Bulwahn (1):
      pmdomain: arm: scmi_pm_domain: remove code clutter

Michal Wilczynski (2):
      dt-bindings: firmware: thead,th1520: Add resets for GPU clkgen
      pmdomain: thead: Instantiate GPU power sequencer via auxiliary bus

Saravana Kannan (1):
      driver core: Add dev_set_drv_sync_state()

Sven Peter (1):
      pmdomain: apple: Drop default ARCH_APPLE in Kconfig

Ulf Hansson (31):
      pmdomain: core: Use of_fwnode_handle()
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: renesas: rcar-sysc: Add genpd OF provider at postcore_initcall
      pmdomain: renesas: rmobile-sysc: Move init to postcore_initcall
      pmdomain: renesas: rcar-gen4-sysc: Move init to postcore_initcall
      pmdomain: core: Prevent registering devices before the bus
      pmdomain: core: Add a bus and a driver for genpd providers
      pmdomain: core: Add the genpd->dev to the genpd provider bus
      pmdomain: core: Export a common ->sync_state() helper for genpd providers
      pmdomain: core: Prepare to add the common ->sync_state() support
      soc/tegra: pmc: Opt-out from genpd's common ->sync_state() support
      cpuidle: psci: Opt-out from genpd's common ->sync_state() support
      cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
      pmdomain: qcom: rpmpd: Use of_genpd_sync_state()
      pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
      firmware/pmdomain: xilinx: Move ->sync_state() support to firmware driver
      firmware: xilinx: Don't share zynqmp_pm_init_finalize()
      firmware: xilinx: Use of_genpd_sync_state()
      driver core: Export get_dev_from_fwnode()
      pmdomain: core: Add common ->sync_state() support for genpd providers
      pmdomain: core: Default to use of_genpd_sync_state() for genpd providers
      pmdomain: core: Leave powered-on genpds on until late_initcall_sync
      pmdomain: core: Leave powered-on genpds on until sync_state
      cpuidle: psci: Drop redundant sync_state support
      cpuidle: riscv-sbi: Drop redundant sync_state support
      pmdomain: samsung: Fix splash-screen handover by enforcing a sync_state
      pmdomain: Merge branch fixes into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch dt into next

 .../devicetree/bindings/arm/rockchip/pmu.yaml      |   2 +
 .../bindings/firmware/thead,th1520-aon.yaml        |   7 +
 .../bindings/power/allwinner,sun20i-d1-ppu.yaml    |   4 +-
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   2 +
 .../bindings/power/rockchip,power-controller.yaml  |   1 +
 drivers/base/core.c                                |   8 +-
 drivers/cpuidle/cpuidle-psci-domain.c              |  14 --
 drivers/cpuidle/cpuidle-riscv-sbi.c                |  14 --
 drivers/firmware/xilinx/zynqmp.c                   |  18 +-
 drivers/pmdomain/amlogic/meson-secure-pwrc.c       |  12 +-
 drivers/pmdomain/apple/Kconfig                     |   1 -
 drivers/pmdomain/arm/scmi_pm_domain.c              |  12 +-
 drivers/pmdomain/core.c                            | 254 +++++++++++++++++++--
 drivers/pmdomain/imx/imx8m-blk-ctrl.c              |  10 +
 drivers/pmdomain/qcom/rpmhpd.c                     |  47 ++++
 drivers/pmdomain/qcom/rpmpd.c                      |   2 +
 drivers/pmdomain/renesas/Kconfig                   | 124 +++++-----
 drivers/pmdomain/renesas/rcar-gen4-sysc.c          |   2 +-
 drivers/pmdomain/renesas/rcar-sysc.c               |  19 +-
 drivers/pmdomain/renesas/rmobile-sysc.c            |   3 +-
 drivers/pmdomain/rockchip/pm-domains.c             |  27 +++
 drivers/pmdomain/samsung/exynos-pm-domains.c       |   9 +
 drivers/pmdomain/sunxi/Kconfig                     |  19 +-
 drivers/pmdomain/sunxi/Makefile                    |   1 +
 drivers/pmdomain/sunxi/sun20i-ppu.c                |  17 ++
 drivers/pmdomain/sunxi/sun55i-pck600.c             | 234 +++++++++++++++++++
 drivers/pmdomain/thead/Kconfig                     |   1 +
 drivers/pmdomain/thead/th1520-pm-domains.c         |  51 +++++
 drivers/pmdomain/ti/Kconfig                        |   2 +-
 drivers/pmdomain/xilinx/zynqmp-pm-domains.c        |  16 --
 drivers/remoteproc/imx_rproc.c                     |  45 +++-
 drivers/soc/tegra/pmc.c                            |  26 ++-
 .../power/allwinner,sun55i-a523-pck-600.h          |  15 ++
 .../dt-bindings/power/allwinner,sun55i-a523-ppu.h  |  12 +
 include/dt-bindings/power/rockchip,rk3528-power.h  |  19 ++
 include/linux/device.h                             |  13 ++
 include/linux/firmware/xlnx-zynqmp.h               |   6 -
 include/linux/pm_domain.h                          |  23 ++
 38 files changed, 918 insertions(+), 174 deletions(-)
 create mode 100644 drivers/pmdomain/sunxi/sun55i-pck600.c
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck-600.h
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h
 create mode 100644 include/dt-bindings/power/rockchip,rk3528-power.h

