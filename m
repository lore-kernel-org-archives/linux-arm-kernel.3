Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFF9CC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wCfjDkPuVi/KiVzZBkJiMV+SmGsikrZ8mJA+CXJhKz4=; b=2SknI8ygZf/3+wfxtecmRRC7b6
	QGar9r1z5uqK91q26J+LsaUKYqvhuIJT7Vuq1dsuWH3i5NmrqbSiXG0eUmfRQ4oSLSU+NwkxcmvKN
	MglX4QAwd352DNAy6G+XdmmhxQ7fpJiAGHi+K+PVZcjITORzUOwkYxTm1r5r2gmhVbmXEah3KrWWk
	YcnBjIvjnGz9euzRrH7N6XxtTY8QuIipAHVa7R+L/VTwyLryV3M4Rj4KYrbeCFuTUZRlfwkFVV5YO
	vO7khgTnJErMSnBT3SmNXrIyZSLtgV6RnczD7SdklGtp8ujyF7quZJMYGzcuzm3D0v/k8eqysKSmU
	kRB76C/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtK8-0000000Ej9D-4Adp;
	Wed, 14 Oct 2026 07:22:52 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtK7-0000000Ej8F-0OHf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:22:52 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48870973bddso2221908f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962569; x=1792567369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wCfjDkPuVi/KiVzZBkJiMV+SmGsikrZ8mJA+CXJhKz4=;
        b=rzDYXsPK3zv9LxxPng95Fw0vX2aSs5zDZV4gq2PNCvBr1mFnqCFJpIzaVhNVTniHjR
         H8N952TNATWnyDu4GDWyWuWR/lgDySYTT3JpdKywNHGKprNOj5FrAeDfD05BgX9UNjs0
         T4IqNNOa0G3DLwcTRs2p5iOS60DsFPH/lXbxslZqvNsk0NAq38fRczhLTTa9IwY/106K
         bgatiTdoo2973iqKJYqfXcdsVrlS8zTb6jqLo0ZE5hEgWOmrq2aPE/ililuUtztFsI/j
         1JtZkO00UrPyekc0dMuB16NoPmvhoNFbcjKDcobEUMQV9cLNkveNW7jqy932IXEizNT1
         nIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962569; x=1792567369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCfjDkPuVi/KiVzZBkJiMV+SmGsikrZ8mJA+CXJhKz4=;
        b=17rJnGkC0Yxb3v+q4AAjq7BOqUpigfvp+7bxavPug535wvrKKoiLJVnJCl2NgwQupP
         lTelmruOEXUSOl+NswWLvjq59mRZRU/z6/KJJJZ4pAhzxKPZXa4U/zCTKvpbcqXELnZs
         imY6ggO9FPUa68zX5kFA+vewfK12DJ+E9FEFL5qqzy+5TXyhT/Dl2gCNBUesM18nY+oi
         78YYF+7YBJX6CB67KRaV0oFxyJG/DpUWgGsO8VK25+PPOqqnRj51bEEO5H7mbUGPeme3
         ffI4tBXWneOQmfEMGqyNiqtoIfbQjQ4xKLQW1gyjPeYmQfTZsKdrsIiP3UAvcGUgJuii
         N6/w==
X-Gm-Message-State: AFq9FYJKzlPaXhQJRyX0btcrttXYYOY1RGC496El6149FDEipP0A6FS2
	KkWGbLlaXAE0CHu3W3XO43OkublJCzFeCsnpGnAvC6uBpdlw0CGQDKVd4XBcrXUbZlbhEg==
X-Gm-Gg: AYBFou2I6OmBALbgW69agRd7r+VqryhPSXZdqqLaYKqXadIorddDrJATzah4S+zWWtA
	hXEEuKQKv41LEbgsMDMyZE/erWZvZPEFkWlh0bvIhkp5hB+tyfI3Xnq5uHwLDVrnD8oS8plQl9F
	9x7gk8M76bQfyGUgyC6wP+zyNl9ssmvOsAbVOdPKNTItXLhFZOMImXGMpKyWQ6Ci/ZaQup2VW57
	xPC7b/QORudzDY0PJiwGCICFQfnJlEMpuuGyhwvVQJoEwOevZTxxB4M+AYwPxU/uTpHo5MHd6ev
	JdA/lkv78bejx09r6L86eELS1tOdDNlw3VFOgWfy3kmxkpB7usWQ+k5AZiSf4NHVhgc705Re1Lq
	+ZDUbLr5zesd1MvutMGbZULvE1o4Q2nP1doA3QKzJRiiM24rG5JcDCJBvFNxHjD5RvRT4HG/j03
	JYYd2PziPOCd+CVbpGcSHk10t0jR8rmj456V3pCfOW8kfUuojIAh6Olp/j9NRYDU67/ax7W6CVG
	KKRL0Ag9zWF+eWwWIUscTOT8xeTjNg3UpEBsokRss2JPoGOFf/5uLw/1CNK/8XGzVWzXSN6up0L
	N4pY6oByo1NgH9FudWRK7gO/El3uUBSen6T0RvRjGu/ROqmNMTZPPl2j1KWz3w==
X-Received: by 2002:a5d:5f92:0:b0:488:7f61:de0e with SMTP id ffacd0b85a97d-48db948839bmr33401464f8f.21.1791962569164;
        Wed, 14 Oct 2026 00:22:49 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:22:48 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Wed, 14 Oct 2026 08:20:40 +0100
Message-ID: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002251_182695_3EAB9AC4 
X-CRM114-Status: GOOD (  17.12  )
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

This series introduces mainline Linux support for the Sanechips (ZTE)
ZX279128S SoC and the ZTE ZXHN H3600 Wi-Fi 6 router.

The ZX279128S is a dual-core ARM Cortex-A9 network SoC with an ARM
PL310 / L2C-310 outer cache controller, dual PCIe interfaces, a 5-port
Gigabit Ethernet switch with hardware packet classification and flow
offload, SPI-NAND flash controller, and DWC3 USB 2.0 host.

Changes in v2:
- Dropped [PATCH RFC] tag.
- Decoupled controversial silicon bus/cache workaround (patches 01-03
  from RFC) from this platform series based on discussions with
  Arnd Bergmann and Stefan Doesinger. Kept downstream in OpenWrt while
  exploring a cleaner long-term MMIO solution (e.g. lib/logic_iomem.c).
- Consolidated maintainership under ARM/ZTE ZX SOC SUPPORT in
  MAINTAINERS with Stefan Doesinger and Navid Ghahremani as
  co-maintainers (Patch 01).
- Split CRM Device Tree schemas into separate dedicated topcrm and
  lspcrpm bindings with fixed clock lists (Patch 04).
- Added syscon-reboot child under topcrm with simple-mfd, dropping
  deprecated regmap properties (Patches 04, 06, 23).
- Converted reset bindings to sequential logical enum IDs (0, 1, 2...)
  in include/dt-bindings/reset/zte,zx279128s-reset.h with driver lookup
  table, ensuring stable DT ABI (Patches 05, 06).
- Synchronized clock gating and reset operations in CRM using shared
  spinlocks to protect shared registers (Patch 06).
- Used CLK_OF_DECLARE_DRIVER for topcrm to ensure simple-mfd populates
  child platform devices (Patch 06).
- Header hygiene: dropped <linux/mod_devicetable.h> from platform
  drivers in favor of <linux/platform_device.h> (Uwe Kleine-Koenig)
  (Patches 08, 13, 15, 16).
- Isolated PCIe SerDes/PLL into a Generic PHY driver under drivers/phy/
  with #phy-cells = <0>, completely removing raw syscon register poking
  from the DWC PCIe host controller driver (Patches 10, 11, 12, 13).
- Restored PCIe ASPM and CLKPM masking in controller setup, preventing
  MT7915 endpoint lockup when entering L0s/L1 power states (Patch 13).
- Replaced separate SPI driver with Stefan Doesinger unified spi-zx.c
  driver supporting both ZX29 and ZX279128S with dynamic CCF clock
  scaling via clk_get_rate(spifc->clk) (Patches 19, 20).
- Validated spi-zx.c in PIO mode on physical ZTE ZXHN H3600 hardware
  with 128 MiB HeYangTek SPI-NAND, UBI auto-attach, and UBIFS
  read/write.
- Fixed LED colors and shared PCIe reset GPIOs on H3600 (Patch 24).
- All DT schemas validated with dtschema and dt-doc-validate (0 warnings).
- All patches validated with scripts/checkpatch.pl (0 errors, 0 warnings).

Series breakdown:
- Patch 01: Consolidated MAINTAINERS entry.
- Patches 02-03: SoC platform integration, SMP CPU hotplug trampoline.
- Patches 04-06: Split CRM clock bindings, logical reset bindings,
  CCF/reset driver.
- Patches 07-09: GPIO controller bindings/driver, pinctrl-single
  bindings.
- Patches 10-13: Generic PCIe PHY bindings/driver, DWC PCIe controller.
- Patches 14-18: Networking: MDIO bus controller, ZX5201 Gigabit PHY,
  Gigabit Ethernet switch driver.
- Patches 19-20: Unified SPI flash controller bindings and spi-zx driver.
- Patches 21-22: Synopsys DWC3 USB platform glue binding and enablement.
- Patches 23-24: Device tree descriptions for the ZX279128S SoC and
  ZTE ZXHN H3600 board.

Hardware testing:
- Validated on physical ZTE ZXHN H3600 hardware running Linux 6.18.55.
- Dual-core SMP, CPU hotplug, and thermal sensors operational.
- Unified spi-zx driver verified with 128 MiB HeYangTek SPI-NAND,
  10 MTD partitions, UBI attachment, and UBIFS rootfs overlay.
- Dual-band MT7915 2.4/5 GHz Wi-Fi links initialized and stable.
- Gigabit Ethernet switch verified at line-rate 1 Gbps forwarding.
- USB 2.0 host verified.
---

Navid Ghahremani (24):
  MAINTAINERS: Consolidate ARM/ZTE ZX SOC SUPPORT with Stefan Doesinger
  dt-bindings: arm: Add ZTE ZX279128S platform descriptions
  ARM: zte: Add ZX279128S platform and CPU hotplug support
  dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
  dt-bindings: reset: Add ZTE ZX279128S reset controller bindings
  clk: zte: Add ZX279128S CRM clock and reset driver
  dt-bindings: gpio: Add ZTE ZX279128S GPIO controller
  gpio: Add ZTE ZX279128S GPIO driver
  dt-bindings: pinctrl: pinctrl-single: Add ZTE ZX279128S pin mux
  dt-bindings: phy: Add ZTE ZX279128S PCIe PHY binding
  phy: zte: Add ZTE ZX279128S PCIe PHY driver
  dt-bindings: PCI: Add ZTE ZX279128S host controller
  PCI: dwc: Add ZTE ZX279128S host controller driver
  dt-bindings: net: Add ZTE ZX279128S MDIO controller
  net: mdio: Add ZTE ZX279128S MDIO controller
  net: phy: Add Sanechips ZX5201 PHY support
  dt-bindings: net: Add ZTE ZX279128S Ethernet switch
  net: ethernet: zte: Add ZX279128S Ethernet switch driver
  dt-bindings: spi: Add ZTE ZX family SPI flash controller binding
  spi: zx: Add ZTE ZX family SPI flash controller driver
  dt-bindings: usb: Add ZTE ZX279128S DWC3 controller
  usb: dwc3: generic-plat: Add ZTE ZX279128S
  ARM: dts: zte: Add ZX279128S SoC description
  ARM: dts: zte: Add ZTE ZXHN H3600 board

 .../devicetree/bindings/arm/cpus.yaml         |    1 +
 .../devicetree/bindings/arm/zte.yaml          |    8 +-
 .../bindings/clock/zte,zx279128s-crm2.yaml    |   48 +
 .../bindings/clock/zte,zx279128s-lspcrpm.yaml |  101 ++
 .../bindings/clock/zte,zx279128s-topcrm.yaml  |   86 +
 .../bindings/gpio/zte,zx279128s-gpio.yaml     |   53 +
 .../bindings/net/zte,zx279128s-gmac.yaml      |  125 ++
 .../bindings/net/zte,zx279128s-mdio.yaml      |   65 +
 .../bindings/pci/zte,zx279128s-pcie.yaml      |  121 ++
 .../bindings/phy/zte,zx279128s-pcie-phy.yaml  |   40 +
 .../bindings/pinctrl/pinctrl-single.yaml      |    1 +
 .../bindings/spi/zte,zx279128s-spifc.yaml     |   72 +
 .../devicetree/bindings/sram/sram.yaml        |    1 +
 .../bindings/usb/zte,zx279128s-dwc3.yaml      |   76 +
 MAINTAINERS                                   |   27 +-
 arch/arm/boot/dts/zte/Makefile                |    2 +
 .../boot/dts/zte/zx279128s-zte-zxhn-h3600.dts |  364 ++++
 arch/arm/boot/dts/zte/zx279128s.dtsi          |  416 +++++
 arch/arm/mach-zte/Kconfig                     |   16 +
 arch/arm/mach-zte/Makefile                    |    4 +
 arch/arm/mach-zte/platsmp-zx279128s.c         |  173 ++
 arch/arm/mach-zte/zx279128s.c                 |   19 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/zte/Kconfig                       |   14 +
 drivers/clk/zte/Makefile                      |    2 +
 drivers/clk/zte/clk-zx279128s.c               |  758 +++++++++
 drivers/gpio/Kconfig                          |   12 +
 drivers/gpio/Makefile                         |    1 +
 drivers/gpio/gpio-zx279128s.c                 |   79 +
 drivers/net/ethernet/zte/Kconfig              |   13 +
 drivers/net/ethernet/zte/Makefile             |    3 +
 drivers/net/ethernet/zte/zx279128s-eth.h      |  386 +++++
 drivers/net/ethernet/zte/zx279128s-main.c     | 1502 +++++++++++++++++
 drivers/net/ethernet/zte/zx279128s-ppe.c      |  805 +++++++++
 drivers/net/ethernet/zte/zx279128s-switch.c   |  368 ++++
 drivers/net/mdio/Kconfig                      |   11 +
 drivers/net/mdio/Makefile                     |    1 +
 drivers/net/mdio/mdio-zx279128s.c             |  157 ++
 drivers/net/phy/Kconfig                       |    8 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/sanechips.c                   |  152 ++
 drivers/pci/controller/dwc/Kconfig            |   13 +
 drivers/pci/controller/dwc/Makefile           |    1 +
 drivers/pci/controller/dwc/pcie-zx279128s.c   |  273 +++
 drivers/phy/Kconfig                           |   12 +
 drivers/phy/Makefile                          |    1 +
 drivers/phy/phy-zx279128s-pcie.c              |  156 ++
 drivers/spi/Kconfig                           |   15 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-zx.c                          |  728 ++++++++
 drivers/usb/dwc3/Kconfig                      |    2 +-
 drivers/usb/dwc3/dwc3-generic-plat.c          |    1 +
 include/dt-bindings/clock/zte,zx279128s-crm.h |   51 +
 .../dt-bindings/reset/zte,zx279128s-reset.h   |   26 +
 55 files changed, 7370 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-crm2.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-lspcrpm.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/zte,zx279128s-dwc3.yaml
 create mode 100644 arch/arm/boot/dts/zte/zx279128s-zte-zxhn-h3600.dts
 create mode 100644 arch/arm/boot/dts/zte/zx279128s.dtsi
 create mode 100644 arch/arm/mach-zte/platsmp-zx279128s.c
 create mode 100644 arch/arm/mach-zte/zx279128s.c
 create mode 100644 drivers/clk/zte/Kconfig
 create mode 100644 drivers/clk/zte/Makefile
 create mode 100644 drivers/clk/zte/clk-zx279128s.c
 create mode 100644 drivers/gpio/gpio-zx279128s.c
 create mode 100644 drivers/net/ethernet/zte/zx279128s-eth.h
 create mode 100644 drivers/net/ethernet/zte/zx279128s-main.c
 create mode 100644 drivers/net/ethernet/zte/zx279128s-ppe.c
 create mode 100644 drivers/net/ethernet/zte/zx279128s-switch.c
 create mode 100644 drivers/net/mdio/mdio-zx279128s.c
 create mode 100644 drivers/net/phy/sanechips.c
 create mode 100644 drivers/pci/controller/dwc/pcie-zx279128s.c
 create mode 100644 drivers/phy/phy-zx279128s-pcie.c
 create mode 100644 drivers/spi/spi-zx.c
 create mode 100644 include/dt-bindings/clock/zte,zx279128s-crm.h
 create mode 100644 include/dt-bindings/reset/zte,zx279128s-reset.h

-- 
2.55.0


