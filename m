Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BEDCA9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vOgD4VxzO60T/LHhiSuyZpQbpRAgnZVorMhxAcup42k=; b=AlOC2sbZCbHcewB7z5doH7cm/J
	524fib6XKUwt3D+Zjy8GbF6vo4Bkl0Pr9tSMw8h25z/aR8ZC1WXCHFiDAl1XJYvvebo+dHcaqDoZB
	//8qtFFjFiRqZwcZFtD7cWh8VPgylh14nfO5c5GdTLw9k7Drnjp2LIRpdXZ/6uWzGK2r6YHJa1OdC
	iKbIiGlKZjI2AJ0XU6VletuAfuwuVe6/hCOAdsBf6zEpkO//xv2x3btUn0Zp4JnDKZFBZWHqOstjX
	Va1ya3gN+6sQ841eslcnPMm5xxPrGxD72HUHcpImbZQvRpAlF2+whpd7rWFArxDXgFD+eIP0vXuI5
	frnWITCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgh-000000083Bn-1XXv;
	Sat, 10 Oct 2026 13:00:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgf-000000083BT-3WIj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso8144005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637228; x=1792242028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOgD4VxzO60T/LHhiSuyZpQbpRAgnZVorMhxAcup42k=;
        b=mQALm7k0MMqQkweAnUeMf/J3UPHpflQDFtsb0sqlICSY7X0gjD9aUbXcZcVk7yJBb4
         v1UNHPYRRcjT3Be0PZyd3ZCrwlXKJAZqsYlrDv7lhbtfl3cGktYz2VI+hxKPJDGog37d
         kCG6WKBz5t/BbDn3TLEfZJFMUzPbnCEW2nMFDAjK8f4VCvA+/y8wZe+dLZCHFKaTlnP0
         88E7K2PeBpUVd2DkplTltQsmrxwFNXb0AnKIvVRwITJZVt8SUAmZZ2SmV0904tEIyKlN
         1aP2kqX8ngng5+05vQwY0xoWPOFeiZcYM5U5SjTsDufgWBMGTz33ff4nzKdeXtnhpjVW
         VU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637228; x=1792242028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOgD4VxzO60T/LHhiSuyZpQbpRAgnZVorMhxAcup42k=;
        b=vsmQD8RijyZY8ERS1tJ2BUVFxM8k7ab1QV1xVd8K4GsBdjA11eqS3jeQjyNxeow5CG
         GmsHU4PJv9WY7qVn107M+zXwbQWTmTgaNKJNn/ysYKnhSSAacf3pXkGz/jVslq/BhV0p
         vXCh/2MSBpZWD7LUsMO3PnelGp49HlVXeERa6QQ8ePXqWcxdXisQsn9X7N/7tux80FIe
         LmwBAWLpcQDBb5WrBwRSeNphrEbhodHALlMLz/Z5+OsZul3QDhapGAAnZq0WZGLeH1gX
         Cyw/bxIFc/JKxsnMB6oTaiS9S9ZOQ8i3PGYaF034EloGhrRiV+FgjyrR/t+QVJ0pg6q2
         /DRA==
X-Gm-Message-State: AFq9FYI074mLDryjRWcTxrA7ltlTtqHz6iNtKjIPnayVqn2IWWXSudkF
	2hR4StdgJtDkQ6m6r73bGWAlih4DnkFl4TOnE0EBwIx/mUK2bFPrQMBw7gW6jAX3HeXWzw==
X-Gm-Gg: AYBFou2u2tISSGUMnmZwwmOFGBAk/2R17Ta+9GlrjKLZ2uyT2zB9KDvKERdnvjR6cQK
	rRYRbZ+u34RG69W/FVi1AbZNQcUtaRVMw7JYQ/adOJnmj20MkJg9N+BLHL9FnhLu2hNJc7eCbrO
	04aiTUPzn6TYUowyZSNms6Scnv0BZMex4ldRu1zmHvIH8E2S7QyCKQioB59WR8/M+p2pt3O75kw
	nj+WtqHiaqLOg2J5mUQEVowK5/BQkBSjXPA+eQ1GqgsA5lvSD3d/w/2ouwHrQ8RSRqmQ4T7ErPo
	PVmqprFabFA5UgVYTZF0x0b7ouKbCJRCBhh6ciZMpPNOZ+nFqxgIkg5N3P/T3O91VpBgVI9kd1N
	yTFjVtEC+kNdyyyJAvsJ+3jjhr22qoidVU5yP7e8r5kL7PaRhDXsyQcILGO5cS3uyAqbgwH+JJA
	ESdK94i0oRCHtAdA0UyuFvJrGjXw9LObdw/YfgbPHxNw0rXt72IKAs+FVHZmt5ddid+YN3UsIRo
	s3bv4TV6c4KrlhGOvqcnzEey3ZOu+13vwlLLRNspMGJGuFo91FOr/OPxr9Nl9s9LxVgzUwsH7lP
	Saq4GPyh/RtMIU9QpOILZm5NF59zs7AKEV0Bhe1UfUfjkEUDWmergY9AGFyDog==
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a18e4913c3mr82960825e9.8.1791637227678;
        Sat, 10 Oct 2026 06:00:27 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:26 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH RFC 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Sat, 10 Oct 2026 13:59:38 +0100
Message-ID: <20261010130024.177503-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060029_914943_22254F11 
X-CRM114-Status: GOOD (  16.12  )
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

The ZX279128S is a dual-core ARM Cortex-A9 network SoC with an ARM PL310 /
L2C-310 outer cache controller, dual PCIe interfaces, a 5-port Gigabit
Ethernet switch with hardware packet classification and flow offload,
SPI-NAND flash controller, and DWC3 USB 2.0 host.

This submission establishes Navid Ghahremani as the maintainer for
ARM/ZTE ZX279128S SOC SUPPORT in MAINTAINERS.

Series breakdown:
- Patches 01-03: Outer cache read serialization mechanism to prevent
  bus deadlock between outstanding PCIe device reads and L2C-310 cache
  sync operations.
- Patches 04-05: SoC platform integration, SMP CPU hotplug trampoline,
  and MAINTAINERS entry.
- Patches 06-11: Core peripheral drivers: CRM clock/reset controller,
  GPIO, pinctrl-single bindings, and syscon.
- Patches 12-13: DesignWare PCIe host controller driver for the dual
  MT7915 Wi-Fi links with shared reset sequencing.
- Patches 14-18: Networking: MDIO bus controller, ZX5201 Gigabit PHY,
  and Gigabit Ethernet switch driver with switchdev and hardware flow
  offload integration.
- Patches 19-20: SPI flash controller driver using the Linux SPI-MEM
  framework.
- Patches 21-22: Synopsys DWC3 USB platform glue binding and enablement.
- Patches 23-24: Device tree descriptions for the ZX279128S SoC and
  ZTE ZXHN H3600 board.

Hardware testing:
- Validated on physical ZTE ZXHN H3600 hardware via U-Boot TFTP boot.
- Dual-core SMP, CPU hotplug, and thermal sensors operational.
- Dual-band MT7915 2.4/5 GHz Wi-Fi links initialized and stable.
- Gigabit Ethernet switch verified at line-rate 1 Gbps forwarding.
- SPI-NAND flash persistence and USB 2.0 host verified.

Independent prerequisites sent separately:
- MTD: heyangtek bad block marker reserve byte fix.
- NVMEM: fixed-layout mac-base consumer offset support.

Navid Ghahremani (24):
  dt-bindings: cache: l2c2x0: Describe ZTE device-read serialization
  ARM: l2c: Serialize device reads with cache maintenance when requested
  wifi: mt76: Serialize MMIO reads with outer cache maintenance
  dt-bindings: arm: Add ZTE ZX279128S platform descriptions
  ARM: zte: Add ZX279128S platform and CPU hotplug support
  dt-bindings: clock: Add ZTE ZX279128S CRM clocks and resets
  clk: zte: Add ZX279128S CRM clock and reset driver
  dt-bindings: gpio: Add ZTE ZX279128S GPIO controller
  gpio: Add ZTE ZX279128S GPIO driver
  dt-bindings: pinctrl: pinctrl-single: Add ZTE ZX279128S pin mux
  dt-bindings: mfd: syscon: Add ZX279128S system controller
  dt-bindings: PCI: Add ZTE ZX279128S host controller
  PCI: dwc: Add ZTE ZX279128S host controller driver
  dt-bindings: net: Add ZTE ZX279128S MDIO controller
  net: mdio: Add ZTE ZX279128S MDIO controller
  net: phy: Add Sanechips ZX5201 PHY support
  dt-bindings: net: Add ZTE ZX279128S Ethernet switch
  net: ethernet: zte: Add ZX279128S Ethernet switch driver
  dt-bindings: spi: Add ZTE ZX279128S SPI flash controller
  spi: Add ZTE ZX279128S SPI flash controller
  dt-bindings: usb: Add ZTE ZX279128S DWC3 controller
  usb: dwc3: generic-plat: Add ZTE ZX279128S
  ARM: dts: zte: Add ZX279128S SoC description
  ARM: dts: zte: Add ZTE ZXHN H3600 board

 .../devicetree/bindings/arm/cpus.yaml         |    1 +
 .../devicetree/bindings/arm/zte.yaml          |    8 +-
 .../devicetree/bindings/cache/l2c2x0.yaml     |    9 +
 .../bindings/clock/zte,zx279128s-crm.yaml     |  141 ++
 .../bindings/gpio/zte,zx279128s-gpio.yaml     |   53 +
 .../devicetree/bindings/mfd/syscon.yaml       |    1 +
 .../bindings/net/zte,zx279128s-gmac.yaml      |  108 ++
 .../bindings/net/zte,zx279128s-mdio.yaml      |   67 +
 .../bindings/pci/zte,zx279128s-pcie.yaml      |   97 ++
 .../bindings/pinctrl/pinctrl-single.yaml      |    1 +
 .../bindings/spi/zte,zx279128s-spifc.yaml     |   69 +
 .../devicetree/bindings/sram/sram.yaml        |    1 +
 .../bindings/usb/zte,zx279128s-dwc3.yaml      |   76 +
 MAINTAINERS                                   |   22 +
 arch/arm/boot/dts/zte/Makefile                |    2 +
 .../boot/dts/zte/zx279128s-zte-zxhn-h3600.dts |  361 ++++
 arch/arm/boot/dts/zte/zx279128s.dtsi          |  397 +++++
 arch/arm/include/asm/outercache.h             |   22 +
 arch/arm/mach-zte/Kconfig                     |   17 +
 arch/arm/mach-zte/Makefile                    |    4 +
 arch/arm/mach-zte/platsmp-zx279128s.c         |  173 ++
 arch/arm/mach-zte/zx279128s.c                 |   19 +
 arch/arm/mm/Kconfig                           |   14 +
 arch/arm/mm/cache-l2x0.c                      |   81 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/zte/Kconfig                       |   14 +
 drivers/clk/zte/Makefile                      |    2 +
 drivers/clk/zte/clk-zx279128s.c               |  460 +++++
 drivers/gpio/Kconfig                          |   12 +
 drivers/gpio/Makefile                         |    1 +
 drivers/gpio/gpio-zx279128s.c                 |   78 +
 drivers/net/ethernet/zte/Kconfig              |   13 +
 drivers/net/ethernet/zte/Makefile             |    3 +
 drivers/net/ethernet/zte/zx279128s-eth.h      |  385 +++++
 drivers/net/ethernet/zte/zx279128s-main.c     | 1485 +++++++++++++++++
 drivers/net/ethernet/zte/zx279128s-ppe.c      |  803 +++++++++
 drivers/net/ethernet/zte/zx279128s-switch.c   |  339 ++++
 drivers/net/mdio/Kconfig                      |   11 +
 drivers/net/mdio/Makefile                     |    1 +
 drivers/net/mdio/mdio-zx279128s.c             |  158 ++
 drivers/net/phy/Kconfig                       |    8 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/sanechips.c                   |  153 ++
 drivers/net/wireless/mediatek/mt76/dma.h      |    2 +-
 drivers/net/wireless/mediatek/mt76/mmio.c     |    6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   23 +
 .../net/wireless/mediatek/mt76/mt76x02_mmio.c |    2 +-
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |    2 +-
 drivers/pci/controller/dwc/Kconfig            |   12 +
 drivers/pci/controller/dwc/Makefile           |    1 +
 drivers/pci/controller/dwc/pcie-zx279128s.c   |  322 ++++
 drivers/spi/Kconfig                           |   13 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-zx279128s-spifc.c             |  353 ++++
 drivers/usb/dwc3/Kconfig                      |    2 +-
 drivers/usb/dwc3/dwc3-generic-plat.c          |    1 +
 include/dt-bindings/clock/zte,zx279128s-crm.h |   55 +
 58 files changed, 6460 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s-crm.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/zte,zx279128s-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-gmac.yaml
 create mode 100644 Documentation/devicetree/bindings/net/zte,zx279128s-mdio.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
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
 create mode 100644 drivers/spi/spi-zx279128s-spifc.c
 create mode 100644 include/dt-bindings/clock/zte,zx279128s-crm.h

-- 
2.55.0


