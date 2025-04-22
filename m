Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428EBC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0jYZzp2m3rJocRHqJkPGj8t9XumriM/fA2gWN3X5VLQ=; b=q5UYvERFPMBuIhNYWf8El5WD7C
	2E2UA+HFLHozKHZg/46o8EjxAwXLsy/o4zA68z/MpmYjBX9rycfOGfhh+1RKfIVYteMyHC67BYLql
	270ZrLV7JeRhlO85LMkNTTOU9g4WzGUzVrVuN/R9wIcuLU1KUYsTEa5qZ66Rf3p2+CqGBYjrtuRoT
	C1Gilk6vtWlnKWzi2Pgjg9CLpJQ0QbP9KIyQptLe6Ry+nL4yVzjr8Fg3rQRSFU7ibxeTKnmnyMcwk
	alJQuJVIHr0bQCdjQl+WmWLHtm/gLCjmu0cqINAM/QCiENmgQq8y5BW6sjlAtmMsboagQ5qYP1VDr
	y5WJBLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7KbE-00000008VLs-2ZV5;
	Tue, 22 Apr 2025 20:52:12 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Iiy-00000008EGG-3rRQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 18:52:06 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso2930779f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 11:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347922; x=1745952722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0jYZzp2m3rJocRHqJkPGj8t9XumriM/fA2gWN3X5VLQ=;
        b=NFJ0ZI4Bvh+rSkdHFVlKV+KjO31XfrHUPM8kZ/I1kSgfSYTd4lgM2qDHv0DkR1/4vX
         A8sVaoQjfqSrVkzIucyf8IZLGeuNzm/GnAkgn7vvm2MnVHo4gWtfkYw2d4E0HwMpyWJ8
         lAkZ57rFYbJB99h+R+U7xuJ3acPBo6zHsBeyZiXW9lUmEv6aUtdAeQpCbaZvly5GuNFs
         lihdnj82W4+XmO+TYp1grtx5PEwq4/M38hst9BlMPdeiCHKqzcR0E8HlGnepaPZ2xMf/
         RhFYv11i+HB7mN4PCvFPZSkgJ8aCFkYQs3kyMkAIaxHCJ/ckqwOs4h/AUf4ak8RdF7HL
         RYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347922; x=1745952722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jYZzp2m3rJocRHqJkPGj8t9XumriM/fA2gWN3X5VLQ=;
        b=uBf/BQPJ5B/fVDggUnuTq0cNXA8Y5pEeyq+33Fmhlyte2efrhC6TYvj4ahJAYZJXVv
         0CPEpM+3og+GK+Vb57JDAebsd1ov8ZxPwBsm4S9GrXsXc8i3iPmCSE575UMhoKXK2gOT
         SjJdkT7j8+h84NVVq2P2s4E6U9dkC3faJaNVxHvNHnWdBkq2aykOrIc/8dM7VH6N7hgj
         JyxhMELiJbudL/a7tcRlD4nERxthI/BgJv23kKRiihni+mi3A3Hu4hDHJgPQjtrUgEN+
         hPB6NbRLmHghKZ2e3gR6rczdEapM/RmPTwnXsguqOPjBgZLSvrwaQ45a7ThgXwpRW5QQ
         CPNA==
X-Forwarded-Encrypted: i=1; AJvYcCUII64bhR6z1UhfxbdLyL8wlYEidlAULp/02QQX/2I67D+FZ6GEdlQ7IGNQBZ1PNaH2bosfiwYs0y71iPlXW9We@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ+zC/89iORZ5bDhpXI9jLhKdUgZrPBm3+OQHNTfOIMI1Rlgw4
	e1o6W+xVtXRSSUDHsBwpT6fae/vj2cwqTt3cbzMuH42eB74wODZk8DEDDm9G3zM=
X-Gm-Gg: ASbGnct0vdHE65LTX0kl8hBclUR3P0u1YbDu0r08BEvp88Ea/QcsfgzztxyHd1FVy/b
	YdVBbHHbEMzGZRk+lwJo6zofU/6Vao8Su7VO9dfTaZAGBSwRdj7cZSYG5OTBhg/7KygrCXAF6N7
	uBnr/ahPrIvYTciqt90joPPe39wLhIZBUEANRPanlP6sg1Znq515Jh1DTgTfokSEI/MZ+fe0Pvx
	1s5BOIEAqFQg/it1JZd1Us8APDetQRF15B7V8bb6W7LvA3p/2dVPNoVCY1dB5mQkRGH/cv3I5ze
	UUCC7gH1wauBW1MRlSCvg+O1PftnUeYr+ujgM3ZXqCr4hiFMHqxhhssfmO52zLAqrGoqM0npkJI
	AQ7DA+w==
X-Google-Smtp-Source: AGHT+IEHrA8/5iMMk838JwvYEMJ8MIlvTyjc4FVX8BePMsqeS4R2c2WZZfYix+jfAiEZqawBBzBmYw==
X-Received: by 2002:a05:6000:1889:b0:39f:31f4:f2b9 with SMTP id ffacd0b85a97d-39f31f4f32fmr3786363f8f.32.1745347922481;
        Tue, 22 Apr 2025 11:52:02 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433170sm15912911f8f.25.2025.04.22.11.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:02 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v9 -next 00/12] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Tue, 22 Apr 2025 20:53:09 +0200
Message-ID: <cover.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_115204_963245_898EE3E9 
X-CRM114-Status: GOOD (  33.96  )
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
from a devictree overlay loaded during RP1 PCI endpoint enumeration. To
ensure compatibility with downstream, a devicetree already comprising the
RP1 node is also provided, so it's not strictly necessary to use the
dynamically loaded overlay if the devicetree is already fully defined at
the origin.
To achieve this modularity, the RP1 node DT definitions are arranged by
file inclusion as per following schema (the arrow points to the includer,
see also [9]):
 
 rp1-pci.dtso         rp1.dtso
     ^                    ^
     |                    |
rp1-common.dtsi ----> rp1-nexus.dtsi ----> bcm2712-rpi-5-b.dts
                                               ^
                                               |
                                           bcm2712-rpi-5-b-ovl-rp1.dts

Followup patches should add support for the several peripherals contained
in RP1.

This work is based upon dowstream drivers code and the proposal from RH
et al. (see [1] and [2]). A similar approach is also pursued in [3].

The patches are ordered as follows:

-PATCHES 1 to 3: add binding schemas for clock, gpio and RP1 peripherals.
 They are needed to support the other peripherals, e.g. the ethernet mac
 depends on a clock generated by RP1 and the phy is reset through the
 on-board gpio controller.

-PATCH 4 and 5: add clock and gpio device drivers.

-PATCH 6: the devicetree node describing the RP1 chipset. Please
 note that this patch should be taken by the same maintainer that will
 also take patch 8, since the definition it contains is possibly used
 by the dtso compiled in as binary blob and is closely coupled to the
 driver.

-PATCH 7: this is the main patch to support RP1 chipset. It can work
 either with a fully defined devicetree (i.e. one that already included
 the rp1 node since boot time) or with a runtime loaded dtb overlay
 which is linked as binary blob in the driver obj. This duality is
 useful to comply with both downstream and upstream needs (see [9]).
 The real dtso is in devicetree folder while the dtso in driver folder is
 just a placeholder to include the real dtso.
 In this way it is possible to check the dtso against dt-bindings.
 The reason why drivers/misc has been selected as containing folder
 for this driver can be seen in [6], [7] and [8].

-PATCH 8: add the external clock node (used by RP1) to the main dts.

-PATCH 9: the fully fledged devictree containing also the rp1 node.
 This devicetree is functionally similar to the one downstream is using.

-PATCH 10 (OPTIONAL): this patch introduces a new scenario about how
 the rp1 node is specified and loaded in DT. On top of the base DT
 (without rp1 node), the fw loads this overlay and the end result is
 the same devicetree as in patch 9, which is then passed to the next
 stage (either the kernel or u-boot/bootloader).
 While this patch is not strictly necessary and can therefore be dropped
 (see [10]), it's not introducing much extra work and maybe can come
 in handy while debugging.

-PATCH 11: add the relevant kernel CONFIG_ options to defconfig.

-PATCH 12: enable CONFIG_OF_OVERLAY in order for 'make defconfig'
 to produce a configuration valid for the RP1 driver. Without this
 patch, the user has to explicitly enable it since the misc driver
 depends on OF_OVERLAY.

This patchset is also a first attempt to be more agnostic wrt hardware
description standards such as OF devicetree and ACPI, where 'agnostic'
means "using DT in coexistence with ACPI", as been already promoted
by e.g. AL (see [4]). Although there's currently no evidence it will also
run out of the box on purely ACPI system, it is a first step towards
that direction.

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
- [9]: https://lore.kernel.org/all/Z87wTfChRC5Ruwc0@apocalypse/
- [10]: https://lore.kernel.org/all/CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoDWJ3=zd3cgcg@mail.gmail.com/#t

CHANGES IN V9

PATCH RELATED -------------------------------------------------

- Rebased on next-20250422 to avoid errors while compiling the DTBs
  against v6.15-rcX.

- Dropped patch 3 from V8 ("Add common schema for devices accessible
  through PCI BARs") because it's already accepted in upstream tree.
  The cover letter has been adjusted accordingly.

- Patch 6: Style change: added a blank line in the commit comment.

- Patch 7: Added: Acked-by: Bjorn Helgaas <bhelgaas@google.com>   # quirks.c, pci_ids.h

- Patch 9 and 10: added 'broadcom' to the subject.

- Current patch 9 is now in front of every other dts related patches
  since it's functionally required for later patches to work.

- Patch 12: Added: Reviewed-by: Stefan Wahren <wahrenst@gmx.net>


BINDINGS ------------------------------------------------------

- File renaming: bcm2712-rpi-5-b.dts is now the fully populated board dts
  (i.e. the one that includes rp1 node), while the overlay-ready
  one is now bcm2712-rpi-5-b-ovl-rp1.dts.

- bcm2712-rpi-5-b.dts: Added an explanatory comment about the usage
  of this file.


RP1 CLOCK DRIVER ------------------------------------

- Implemented the delay needed to ensure the pll vco is stable (was
  a TODO comment).


RP1 MISC DRIVER -----------------------------------

- rp1_pci.c: Capitalized any IRQ occurrences in message strings.


Andrea della Porta (12):
  dt-bindings: clock: Add RaspberryPi RP1 clock bindings
  dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
  dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
  clk: rp1: Add support for clocks provided by RP1
  pinctrl: rp1: Implement RaspberryPi RP1 gpio support
  arm64: dts: rp1: Add support for RaspberryPi's RP1 device
  misc: rp1: RaspberryPi RP1 misc driver
  arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
  arm64: dts: broadcom: Add board DTS for Rpi5 which includes RP1 node
  arm64: dts: broadcom: Add overlay for RP1 device
  arm64: defconfig: Enable RP1 misc/clock/gpio drivers
  arm64: defconfig: Enable OF_OVERLAY option

 .../clock/raspberrypi,rp1-clocks.yaml         |   58 +
 .../devicetree/bindings/misc/pci1de4,1.yaml   |  137 ++
 .../pinctrl/raspberrypi,rp1-gpio.yaml         |  198 +++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/broadcom/Makefile         |    4 +-
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  |  121 ++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  117 +-
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   42 +
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi   |   14 +
 arch/arm64/boot/dts/broadcom/rp1.dtso         |   11 +
 arch/arm64/configs/defconfig                  |    4 +
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rp1.c                         | 1510 +++++++++++++++++
 drivers/misc/Kconfig                          |    1 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/rp1/Kconfig                      |   20 +
 drivers/misc/rp1/Makefile                     |    3 +
 drivers/misc/rp1/rp1-pci.dtso                 |   25 +
 drivers/misc/rp1/rp1_pci.c                    |  333 ++++
 drivers/pci/quirks.c                          |    1 +
 drivers/pinctrl/Kconfig                       |   11 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-rp1.c                 |  790 +++++++++
 .../clock/raspberrypi,rp1-clocks.h            |   61 +
 include/linux/pci_ids.h                       |    3 +
 26 files changed, 3376 insertions(+), 108 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-common.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 create mode 100644 drivers/clk/clk-rp1.c
 create mode 100644 drivers/misc/rp1/Kconfig
 create mode 100644 drivers/misc/rp1/Makefile
 create mode 100644 drivers/misc/rp1/rp1-pci.dtso
 create mode 100644 drivers/misc/rp1/rp1_pci.c
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

-- 
2.35.3


