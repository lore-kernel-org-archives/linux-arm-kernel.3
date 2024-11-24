Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78583E668A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 10:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IRoQ5/TFDPi9vQ2D2F5zOhPJWNXFcAulkMkNcJW6Epw=; b=e9RymsdArSKjadtoZDIdh1Bz2I
	Ipk7UostraeiwRSE9/Pkka/lIgRKPy/e/Rda8AB8CCC23Nk3Q4ZcgLpARFrDhOh33d35Q7jDmMHsP
	ltv6b8hVG0QREvtfrCpd917HE2AOcdSj2tkn07Gf1raBUU2OcBPjE1WHo0hKHRaDfXuNKcu1qnVet
	XQHpmYja1jJi9FhlUgI3Jz5j58ohOZzyA3pU0j5515gwsShgOi6gX21Qdhtl8to/o6CAPCd8sqHbB
	+PxRWv3pdnrPGocsasoIdFFE6gbFQGF45p7SpnECzo9VsoUPx0h8Tqap6hD8AYo6Atg9RrJGdG0At
	sX8WmNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAEO-00000005dxB-0GeZ;
	Sun, 24 Nov 2024 10:52:44 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFAD2-00000005dTi-21h1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 10:51:22 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-5cfa9979cd1so6059654a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 02:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445479; x=1733050279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IRoQ5/TFDPi9vQ2D2F5zOhPJWNXFcAulkMkNcJW6Epw=;
        b=Iy1OB9r/iPS9PjctEGb3RSGOl32Y6uxEnzqW2VEfehiIli5pge9ljZeo63qv9wIFA3
         ZvxYOP0pumT1cxcX7gQjvk0MvfsDT5VP51lcrD1E3rlc1NwMjnh2LMLULgE9dnHVTfVT
         KPAiwBC9VoAJk7TdUlouMLrbk3+NhNA1Eq6Zt9zLQ4XjT2mFqLXabJIwq8a0Worc6WvK
         8sXBWRxt+I5gzitmpAV7FpLkKWaRVDZ+HxXXuZVcS8Q5QvXkdEyDeE6E36KpRlmuANoM
         8dDqIOpCny3kILmHVlQOaQ+EgAsHWNUpH1FzLtobB0+z4XRblQ5ymNjhzu8HpzxL5e4t
         4N8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445479; x=1733050279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IRoQ5/TFDPi9vQ2D2F5zOhPJWNXFcAulkMkNcJW6Epw=;
        b=r9xfVDGDDk4gKmtb+wC7PvS+vTaLX490hr7efypE5Lk6S9QPrFNF/olscDUkC2WIxA
         T70EdDWZ2q3AI2HxtLhg8Y17JYTa9p9gx3+ACpSoP4eYJ2ZjFrNai1Eb0fsAL8IZQFFq
         fb2cyk5byhzVL5P4t35SsZPIbpngaFT+HfHwZwHznbBw5CJHsyKKjSobgHwFgo/WVaSy
         P/NYE35jHKf5Ymr/PSRDChgy5y5S7uyjX+Uo2h4HGPo3ztcTKbREF7BiWFJ6+CSeF4sT
         6wdd1+VcejcijCH3ZDI7sZEQ4Sg4hdWPsx6972Cwx1jiVLO0VSjAPyejGce9D5Qo1y/P
         PgSA==
X-Forwarded-Encrypted: i=1; AJvYcCUNJu9TDd+xyU+YerU1IQG3s0CC8tP4Vr5YtJDv1nrXzuseKl+aLkSSbwTxo+4+YSkn7q7fCSiDGZOu2MX/4QZR@lists.infradead.org
X-Gm-Message-State: AOJu0YxKeP1V7y94oisAgY/Q1kAb8Wc4x0EuWFZD56OBVDgBm+Fk5jOA
	yomw8KdAu8DrYQ2BSZpZHY+5YHucxgQv+tUAd+57LQd/NAlCkN2khtXEMBMQr4k=
X-Gm-Gg: ASbGncvHXp45NBAAHU6NkCIsmifqZ5PkQ8I1WWGt5CnrMZEurV9YUzRaqcHUVfT/8YN
	07BboZ2sWcZl3XqN22SSCUF2Njj167IloIXOYfKRfbiwtA/h494Kv4snq0pOikCYza7901VjmdY
	WVhA7oPKAW6PPpaCFpHBBZ3PrKfFdvL0KloMgQpSKk/zd7B39Cf/DWEqfpkPvfnRUKePDLNPpKt
	MULJGO/DRvL9tTukd4SB+574YrvqQvJ4pV1mpw+tD8W6sV6B238hs6ZlbaVLRFXKonIA/UE9637
	noDnToC6n3itWhwxaTD+
X-Google-Smtp-Source: AGHT+IHUSnB4V4XKnFJZOBm9HqRjQiL9Lrr7Bj5H1pnfj/ZaEVQcms8HU4jA8YugXV5C9/7lLWckhQ==
X-Received: by 2002:a05:6402:1e94:b0:5d0:ffa:7322 with SMTP id 4fb4d7f45d1cf-5d01d56873dmr8435590a12.11.1732445478579;
        Sun, 24 Nov 2024 02:51:18 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3fc6a6sm2910063a12.57.2024.11.24.02.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:18 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v4 00/10] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Sun, 24 Nov 2024 11:51:37 +0100
Message-ID: <cover.1732444746.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_025120_529220_C77D226A 
X-CRM114-Status: GOOD (  34.17  )
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

RP1 is an MFD chipset that acts as a south-bridge PCIe endpoint sporting
a pletora of subdevices (i.e.  Ethernet, USB host controller, I2C, PWM,
etc.) whose registers are all reachable starting from an offset from the
BAR address.  The main point here is that while the RP1 as an endpoint
itself is discoverable via usual PCI enumeraiton, the devices it contains
are not discoverable and must be declared e.g. via the devicetree.

This patchset is an attempt to provide a minimum infrastructure to allow
the RP1 chipset to be discovered and perpherals it contains to be added
from a devictree overlay loaded during RP1 PCI endpoint enumeration.
Followup patches should add support for the several peripherals contained
in RP1.

This work is based upon dowstream drivers code and the proposal from RH
et al. (see [1] and [2]). A similar approach is also pursued in [3].

The patches are ordered as follows:

-PATCHES 1 to 4: add binding schemas for clock, gpio and RP1 peripherals.
 They are needed to support the other peripherals, e.g. the ethernet mac
 depends on a clock generated by RP1 and the phy is reset though the
 on-board gpio controller.

-PATCH 5 and 6: add clock and gpio device drivers.

-PATCH 7: the devicetree overlay describing the RP1 chipset. Please
 note that this patch should be taken by the same maintainer that will
 also take patch 11, since txeieh dtso is compiled in as binary blob and is
 closely coupled to the driver.

-PATCH 8: this is the main patch to support RP1 chipset and peripherals
 enabling through dtb overlay. The dtso since is intimately coupled with
 the driver and will be linked in as binary blob in the driver obj.
 The real dtso is in devicetree folder while the dtso in driver folder is
 just a placeholder to include the real dtso.
 In this way it is possible to check the dtso against dt-bindings.
 The reason why drivers/misc has been selected as containing folder
 for this driver can be seen in [6], [7] and [8].

-PATCH 9: add the external clock node (used by RP1) to the main dts.

-PATCH 10: add the relevant kernel CONFIG_ options to defconfig.

This patchset is also a first attempt to be more agnostic wrt hardware
description standards such as OF devicetree and ACPI, where 'agnostic'
means "using DT in coexistence with ACPI", as been already promoted
by e.g. AL (see [4]). Although there's currently no evidence it will also
run out of the box on purely ACPI system, it is a first step towards
that direction.

Please note that albeit this patchset has no prerequisites in order to
be applied cleanly, it still depends on Stanimir's WIP patchset for BCM2712
PCIe controller (see [5]) in order to work at runtime.

Many thanks,
Andrea della Porta

Links:
- [1]: https://lpc.events/event/17/contributions/1421/attachments/1337/2680/LPC2023%20Non-discoverable%20devices%20in%20PCI.pdf
- [2]: https://lore.kernel.org/lkml/20230419231155.GA899497-robh@kernel.org/t/
- [3]: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/#t
- [4]: https://lore.kernel.org/all/73e05c77-6d53-4aae-95ac-415456ff0ae4@lunn.ch/
- [5]: https://lore.kernel.org/all/20240626104544.14233-1-svarbanov@suse.de/
- [6]: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
- [7]: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
- [8]: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/

CHANGES IN V4:

NEW ADDITIONS ------------------------------------------------

- Patches dealing with bugfix of core functions (1:1 dma-range
  translation and PCI address translation) have been splitted
  in a submission of their own. Also added CC: stable since
  they deal with bugfixes


DEFCONFIG -----------------------------------------

- CONFIG_PINCTRL_RP1 value changed from 'y' to 'm'


RP1 MISC DRIVER -----------------------------------

- Drop 'dev' variable in struct rp1_dev since it's 
  redundant

- Substitute some indentation spaces with tabs

- Virtual irq and local irq automatic variables are now unsigned

- Add a check to unregister interrupts only if the domain has
  been correctly created

- Replace dev_err() with dev_err_probe() where applicable

- Add an exit path check after pci_alloc_irq_vectors() in case
  that less than RP1_INT_END irqs are allocated

- Fix the exit path in case irq_create_mapping() returns an error


GPIO/PINCTRL --------------------------------------

- Can now can be built as a module

- Add MODULE_*() macros

- Replace dev_err() with dev_err_probe() where applicable

- Replace builtin_platform_driver() with module_platform_driver()

- Fix a circular dependency involving CONFIG_GPIOLIB and
  CONFIG_GPIOLIB_IRQCHIP

- PINCTRL_RP1 defaults to MISC_RP1 (and depends also on it)


CLOCKS --------------------------------------

- Dropped all CLK_IGNORE_UNUSED references and reduced the use of
  CLK_IS_CRITICAL to a minium

- COMMON_CLK_RP1 defaults to MISC_RP1

- Drop 'name' and 'flags' variables from clock specific data struct
  in favor of the ones defined in struct clk_init_data. This
  in turn leads to some simplifications in both clock declarations
  and in registration functions, and a general rework of the array
  containing the clock definitions

- Inline substitution of FIELD_SET() macro

- Unify rp1_register_pll*() functions into a single one (with the
  exception of rp1_register_pll_divider)

- Use CLK_HW_INIT_PARENTS_DATA() to initialize the various clocks

- Replace dev_err() with dev_err_probe() where applicable

- Use clk_hw_get_name() to retrieve the clock name for better isolation

- Added a sanity check in rp1_clk_probe() to skip registering NULL entries
  in clk_desc_array[]

- Fixed a bug in rp1_pll_divider_off(): the divider register was
  cleared upon unpreparing the clock, causing some peripherals to
  obtain wrong clock rates.

- Added clk_eth to the list of registered clocks. This is important
  for the ethernet controller to work


DTS -----------------------------------------

- rp1.dtso: dropped clock-names = "xosc"

- rp1.dtso: ranges for reg properties now start from 0x1000000000 instead
  of 0xc040000000 to better reflect the addresses in the chipset documentation.
  Also changed the reg properties in the sub-nodes to reflect this.

- rp1.dtso: added RP1_PLL_SYS_SEC to the list of assigned-clocks (and relative
  assigned-clock-rates). This is needed for some sub-peripherals to work

- bcm2712.dtsi: renamed clock-rp1-xosc to clock-50000000


BINDINGS ------------------------------------

- rp1-clock.yaml: dropped 'clock-names' property (xosc) from  bindings,
  and fixed the example accordingly

- rp1-clock.yaml: #clock-cells description now just mention the binding
  header declaring the clocks

- pci-ep-bus.yaml: shortened the title to comply with coding-style

- rp1-gpio.yaml: added a newline in the main description and in the pins
  description.

- rp1-gpio.yaml: replaced additionalProperties with patternProperties
  enforcing the nodes and subnodes to be postfixed with, respectively,
  -state and -pins. Updated the example to reflect this change.

- pci1de4,1.yaml: ranges and dma-ranges properties are now on a single
  line each.


Andrea della Porta (10):
  dt-bindings: clock: Add RaspberryPi RP1 clock bindings
  dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
  dt-bindings: pci: Add common schema for devices accessible through PCI
    BARs
  dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
  clk: rp1: Add support for clocks provided by RP1
  pinctrl: rp1: Implement RaspberryPi RP1 gpio support
  arm64: dts: rp1: Add support for RaspberryPi's RP1 device
  misc: rp1: RaspberryPi RP1 misc driver
  arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
  arm64: defconfig: Enable RP1 misc/clock/gpio drivers

 .../clock/raspberrypi,rp1-clocks.yaml         |   58 +
 .../devicetree/bindings/misc/pci1de4,1.yaml   |   74 +
 .../devicetree/bindings/pci/pci-ep-bus.yaml   |   58 +
 .../pinctrl/raspberrypi,rp1-gpio.yaml         |  193 +++
 MAINTAINERS                                   |   14 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |    7 +
 arch/arm64/boot/dts/broadcom/rp1.dtso         |   58 +
 arch/arm64/configs/defconfig                  |    3 +
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rp1.c                         | 1527 +++++++++++++++++
 drivers/misc/Kconfig                          |    1 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/rp1/Kconfig                      |   21 +
 drivers/misc/rp1/Makefile                     |    3 +
 drivers/misc/rp1/rp1-pci.dtso                 |    8 +
 drivers/misc/rp1/rp1_pci.c                    |  366 ++++
 drivers/misc/rp1/rp1_pci.h                    |   14 +
 drivers/pci/quirks.c                          |    1 +
 drivers/pinctrl/Kconfig                       |   11 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-rp1.c                 |  789 +++++++++
 .../clock/raspberrypi,rp1-clocks.h            |   61 +
 include/linux/pci_ids.h                       |    3 +
 24 files changed, 3282 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 create mode 100644 drivers/clk/clk-rp1.c
 create mode 100644 drivers/misc/rp1/Kconfig
 create mode 100644 drivers/misc/rp1/Makefile
 create mode 100644 drivers/misc/rp1/rp1-pci.dtso
 create mode 100644 drivers/misc/rp1/rp1_pci.c
 create mode 100644 drivers/misc/rp1/rp1_pci.h
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

-- 
2.35.3


