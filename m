Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BC7D3398E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmWQwY0LyW7DZAdLbPONRZPTG7Y9Z40HVMwsEI41r2Q=; b=qH1MgNeImYYxMYI8xo4HVU2sqa
	zcPOkhXa18tEoN5lcdBRilAX6PaitdHijXxXSin64eKAyNJM8Bvi0pfAiLI9RcYg0tLn4RPXuV49u
	mYHKvu7/5eswdGmEvcH0HtmIGWP2+JlrRyvc7swa1FnlJDFjP7GUnsxTOPZhf7Oa1MdvWhuW8lJ6U
	GyzG7qu87F1H800Ed7Dz5lE3ZSPL+3md78cXGiaYSwZWgUPg48dVBoEtycAnkoTodxf65kcpty4s7
	oCpQxL61bXY78UTbmEmAer4+vAAF0R5FpjCJbCTeZW4vsuavZY5HKjaUWWaBBQdGQmbWegN5HEv5g
	XFY+V+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Qjr-0000000B7ns-44AX;
	Mon, 28 Oct 2024 14:28:59 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QOr-0000000B2ev-0LAw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:07:20 +0000
Received: by mail-lf1-x143.google.com with SMTP id 2adb3069b0e04-539983beb19so5163075e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 07:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124434; x=1730729234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fmWQwY0LyW7DZAdLbPONRZPTG7Y9Z40HVMwsEI41r2Q=;
        b=KR+ru1mIpYGrci57PnNhYvirIkc5Y1duY8d58hx4PLz4T+KkLh+x2rdSo5dwf3/YLZ
         AwggIXLGozdi2o4RZS54RqRo5cVXVt0HMSXThlEX6/l6CZA7fMiLI8xaRqFCI/lj3w+W
         tM9aM3+71KhGUYTHViaSUhXcAeM+awWmoRrTttV4A2LlIuXEeA3Vv2/wBQKYY9vPgS52
         68A3hh4UXnXuyTP6XOiOWpIx2LcScGqpuNaeycNIjtXwQQMhuhbveCrJ6eiBE0gqmNIK
         IUUcck+Sq5lCRIZygjzqAmBa0xDowXf8hVWOmFpGIww6+xEYOL2CvDjM3jlhEq6kc9bp
         vMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124434; x=1730729234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmWQwY0LyW7DZAdLbPONRZPTG7Y9Z40HVMwsEI41r2Q=;
        b=JF8I+0ee9uzmaeJIPNZzUY7jodeYzviB5XgZX1LW0Bs6pX2dvXAG7JwvO6pq4PD5nT
         OVLxnoNmiy2UGigvdG+RrmlPCo+ujHCj5lIKF2hXx5UDVzYpaj+xwF+aGroRuVKLtHkl
         CEqGJnse9J8PtvI3bGF5rIQbTJ3+uVkzVUGNj6hcHF+Ws/jqStIjRtv0B96467wVWi0W
         1pIgyBYnkJzS/CU0RTYp4CBAGBnfBdIFlzNVLy+++H0YMp+nnVLHQsNi7kJiBVqwAIOs
         rTbzmaTeJU/u49lPnYSKtBIpuAAx4I06r0U4oWOFLXQJ6Eeip3qIV9ukWi3W/5ufwy80
         3kSA==
X-Forwarded-Encrypted: i=1; AJvYcCWSiLBpFVBBGBvg1aBu6mHz5WKuavJrF70JW/pwT80VZrhoi7JhCW/Pdjnq9caK2BpQS9pd7i4yiUlVldxAGFpQ@lists.infradead.org
X-Gm-Message-State: AOJu0YycgNxcXZ1s3DGDy8mq1yURuxFpjNRAQBGS2qt4m6wUWXgzoNqF
	G0az+5KRhSXZwiRVEzKtFUyKIXQwzWxFUdTN3tBOImjQ+h40Rfp7kJbfUsBwBfg=
X-Google-Smtp-Source: AGHT+IHUuPqkKP8P1megHNLn/ao7CtOz4cPFTAgpqvApPN3/0axwoAMsnKF52yOT43fKrZomUCJmpA==
X-Received: by 2002:a05:6512:2399:b0:539:e9f8:d45d with SMTP id 2adb3069b0e04-53b34a1b10fmr4101627e87.52.1730124433790;
        Mon, 28 Oct 2024 07:07:13 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b271f56d9sm388920166b.144.2024.10.28.07.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:13 -0700 (PDT)
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
Subject: [PATCH v3 00/12] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Mon, 28 Oct 2024 15:07:17 +0100
Message-ID: <cover.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_070717_149195_48C34EBE 
X-CRM114-Status: GOOD (  33.16  )
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

-PATCHES 5 and 6: preparatory patches that fix the address mapping
 translation (especially wrt dma-ranges).

-PATCH 7 and 8: add clock and gpio device drivers.

-PATCH 9: the devicetree overlay describing the RP1 chipset. Please
 note that this patch should be taken by the same maintainer that will
 also take patch 11, since txeieh dtso is compiled in as binary blob and is
 closely coupled to the driver.

-PATCH 10: this is the main patch to support RP1 chipset and peripherals
 enabling through dtb overlay. The dtso since is intimately coupled with
 the driver and will be linked in as binary blob in the driver obj.
 The real dtso is in devicetree folder while the dtso in driver folder is
 just a placeholder to include the real dtso.
 In this way it is possible to check the dtso against dt-bindings.
 The reason why drivers/misc has been selected as containing folder
 for this driver can be seen in [6], [7] and [8].

-PATCH 11: add the external clock node (used by RP1) to the main dts.

-PATCH 12: add the relevant kernel CONFIG_ options to defconfig.

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

Link:
- [1]: https://lpc.events/event/17/contributions/1421/attachments/1337/2680/LPC2023%20Non-discoverable%20devices%20in%20PCI.pdf
- [2]: https://lore.kernel.org/lkml/20230419231155.GA899497-robh@kernel.org/t/
- [3]: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/#t
- [4]: https://lore.kernel.org/all/73e05c77-6d53-4aae-95ac-415456ff0ae4@lunn.ch/
- [5]: https://lore.kernel.org/all/20240626104544.14233-1-svarbanov@suse.de/
- [6]: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
- [7]: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
- [8]: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/


CHANGES IN V3:

NEW ADDITIONS ------------------------------------------------

- Fixed a bug in of_pci_prop_ranges() that was incorrectly using
  a CPU address instead of PCI bus address while assigning "ranges"
  properties to PCI-PCI bridge nodes.
  As a side effect, the patch "PCI: of_property: Sanitize 32 bit PCI
  address parsed from DT" has been dropped since it's no longer
  necessary.

RP1 misc driver -----------------------------------

- Dropped -@ option while compiling the dtso.

- Removed unused includes.

- Dropped unused sys_clk references.

- Got rid of dump_bar().

- Added the relevant unregister function on exit paths for mapped
  interrupts and domain.

- Added missing MODULE_DEVICE_TABLE().

- reset_control no longer claimed in probe().

- dtbo_size and dtbo_start local vars definition moved at the
  beginnning of the probe() function.

- the DTB overlay is now applied after the interrupt controller
  has been setup.

- Reworked the Kconfig dependency list for CONFIG_MISC_RP1 to avoid
  a recursion.


GPIO/PINCTRL --------------------------------------

- Gpio line names changes (and relative dtbo and preparatory patches)
  have been dropped.


CLOCKS --------------------------------------

- raspberrypi,rp1-clocks.h: license adjusted.

- Removed unused headers.

- Replaced locally defined KHZ and MHZ with defines from linux/units.h

- Added regmap support for registers which also has builtin support
  for showing regs via debugfs. Dropped the previous implementation
  of debugfs attributes.

- Reworked the clock tree using clk_parent_data instead of strings. This
  also allowed to get rid of __clk_get_hw() and friends.

- Split a couple of lines assigning to calc_rate into multi-lines for
  ease of understanding.

- Dropped .set_rate function from rp1_pll_ph_ops since it does nothing.

- Initialize struct clk_init_data init via = {} instead of memset.

- Used dev_err_probe() instead of dev_err().

- Module init/exit declaration replaced by module_platform_driver().

- Kconfig: CONFIG_COMMON_CLOCK_RP1 now depends on CONFIG_MISC_RP1 instead
  of CONFIG_PCI.


DTS -----------------------------------------

- "rp1-xosc" renamed to "xosc"


BINDINGS ------------------------------------

- raspberrypi,rp1-gpio.yaml: removed a paragraph in the description of
  pinctrl node since it's already covered by pinctrl-bindings.

- All paths to referenced bindings are now full-paths.

- Uniformly using single quotes over double quotes on patterns and strings.

- Amended some node names to adhere to DTS coding style.

- Dropped unused labels in examples.

- pci-ep-bus.yaml: simplified the definition of pci-ep-bus node.

- pci-ep-bus.yaml: added additionalProperties: true.

- pci1de4,1.yaml: interrupt-controller and #interrupt-cells moved from
  pci-ep-bus node to the main device.

- pci1de4,1.yaml: @unit-number not optional anymore.

- pci1de4,1.yaml: droppped pci-ep-bus redefinition (already inherited by
  pci-ep-bus.yaml). Also removed the internal SoC nodes.



Andrea della Porta (12):
  dt-bindings: clock: Add RaspberryPi RP1 clock bindings
  dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
  dt-bindings: pci: Add common schema for devices accessible through PCI
    BARs
  dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
  PCI: of_property: Assign PCI instead of CPU bus address to dynamic
    bridge nodes
  of: address: Preserve the flags portion on 1:1 dma-ranges mapping
  clk: rp1: Add support for clocks provided by RP1
  pinctrl: rp1: Implement RaspberryPi RP1 gpio support
  arm64: dts: rp1: Add support for RaspberryPi's RP1 device
  misc: rp1: RaspberryPi RP1 misc driver
  arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
  arm64: defconfig: Enable RP1 misc/clock/gpio drivers

 .../clock/raspberrypi,rp1-clocks.yaml         |   62 +
 .../devicetree/bindings/misc/pci1de4,1.yaml   |   80 +
 .../devicetree/bindings/pci/pci-ep-bus.yaml   |   58 +
 .../pinctrl/raspberrypi,rp1-gpio.yaml         |  163 ++
 MAINTAINERS                                   |   14 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |    7 +
 arch/arm64/boot/dts/broadcom/rp1.dtso         |   61 +
 arch/arm64/configs/defconfig                  |    3 +
 drivers/clk/Kconfig                           |    8 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rp1.c                         | 1540 +++++++++++++++++
 drivers/misc/Kconfig                          |    1 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/rp1/Kconfig                      |   21 +
 drivers/misc/rp1/Makefile                     |    3 +
 drivers/misc/rp1/rp1-pci.dtso                 |    8 +
 drivers/misc/rp1/rp1_pci.c                    |  357 ++++
 drivers/misc/rp1/rp1_pci.h                    |   14 +
 drivers/of/address.c                          |    3 +-
 drivers/pci/of_property.c                     |    2 +-
 drivers/pci/quirks.c                          |    1 +
 drivers/pinctrl/Kconfig                       |   11 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-rp1.c                 |  801 +++++++++
 .../clock/raspberrypi,rp1-clocks.h            |   61 +
 include/linux/pci_ids.h                       |    3 +
 26 files changed, 3283 insertions(+), 2 deletions(-)
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


