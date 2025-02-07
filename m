Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CF7C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 21:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HBJYgpNe2Zy2gRsFh41ExOz15Gu4bZ/zj8Bd9suI/jA=; b=4/sSXzuFr7GdPvkx6otu3v2KxN
	mt+lYYGbXAbARvpGXBF37m79viDs2ehvAAqWzfRddA8wUNm/i/yXS+AOnKoIjZ2jj6TNVk2X3cok/
	rPFS2uG83a08e4nL/LfpqPqH5DSLgkjWW8fUN/pzxC0oWEinGZha0GVxzvLzga3Z9E8FeX7Uyh0Js
	dpddksq+YJwieZi4gjOQkgWS9TttWTl6WJ0SLqg0dpi7mgBtNjJYnzF5hiXUWORlF83BEJZHCZRoO
	9BqkGJ+2UfzMCSaysddMQass1eZn2B48kcwu4bqdC1WOrPCUyzQy5wBjmDBTSNoDfBqeOD0Ib3icN
	w3aAfgIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVyA-0000000BF4h-3kfN;
	Fri, 07 Feb 2025 21:33:02 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVwA-0000000BDIT-06Jm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 21:31:00 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-ab7430e27b2so469096066b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 13:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963856; x=1739568656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBJYgpNe2Zy2gRsFh41ExOz15Gu4bZ/zj8Bd9suI/jA=;
        b=P7MSGEUfUbOe/ITqCTJOeV1l9m9dHjNaXzxElLh6zkQAhLNGF0lrekn01+bfsWEgrn
         lSlqR6kbl2+OF4A1qmk49v1JgPfLF2jGd4xof3MCE8DQpWZdGUvSf3DVXtZYXcWywcSn
         9rjSZBkKBg5CYGNzT6mcjT2SywdOFKLq2XS/6ZzBPf7PDiCa8WZrMxezjnKydYFoozLV
         KPj36OSVSG+MdBJe8F/agSa9/apRUrZ83I8sH42FBdAiG5y0SCkQzJLSE0d+qpQNTvOW
         XKJH/i7rr/a6FQR8kR/BFwinvjFdZjRMfz9p4c/HIeRMBIq9eEke8TqGk+pBvNGThPsZ
         lmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963856; x=1739568656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HBJYgpNe2Zy2gRsFh41ExOz15Gu4bZ/zj8Bd9suI/jA=;
        b=tu0UstNJrae3PI3JLyqzaz0xBowj/kWRKSA5CwFrHjkCIUGQQA+m8nAWDZwYPf6YUf
         by6P7UlBbMRz5VHB+FjjfvqUjQC1S9HEYTGCCSMdepwK6dNcFWfgbtTcGiEWA93fNZoL
         Ubj6F0d83fd0VZ3wkoDeGn/0DNA/WZrvOSLJaRK908VDAKUJHk5Sf6uQiyb5aur1ysel
         eK6bC+jtNPhIA/+o/i5CjJNaPts/lZPJBi63BYMDwAJUng8joLICIkpw7Ncd+WlUq/Q5
         Q3gurXMurBnDQPR+JggXJcekvqqo/GFqG0da1rmP3Pp2o8tpiOk4aa98mVLhbZrPqIbt
         87ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUVzsQVpci3JadRr6SWY79Kw7UcRaZ2PBsuyNDwwfaSlpXbcuTUVPmFDhxDPQD7M/0WB4reZ2RT1sWvTskt7vrB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6LZin7U7iQSxKE4bv/0K+VUSeUJaCI39iul6fmtU5p2W6espu
	YxRaJYdBxcknWHFX1k1YTvpRHHL1st8a5Gxn7BmDvcqQ008y4uv4CIXlMZ9HARQ=
X-Gm-Gg: ASbGncuih00lQz4wxYOzFy7MOK7QBJXfLA8XPBXEaaeaZGDPAESgQY7mPctizXPUdV0
	qF+wU3wdu2lJ+s/tNqowq/RcCgj+498PtOM+7vSfLC1+nBf45PNpyJY7vQVC/HzplzxrKGR0nlx
	t2LB2c279Cum4vEeOlRYK10BWmqQEbRnKxC3iz1oBv4+aEBQGz0XGZjAUBSb2idGHyMZIjHMk4V
	BWcf9Exla1/qwVmRF2HY6psUKBmxVyDFoPxDowClU9+aDe8EM3QYwRBP4648bYHDGAyUdxlAyMH
	jmqnEvQvZ2k6sriRoUwp+ziqby6OC+R74+U8SRfzASajoap9v6spi7ASLtI=
X-Google-Smtp-Source: AGHT+IHYuDDLuZlqtQ6Nspmj/6m4io2RGooeIQpuIOV6WNrioVZw+PtkcdK6Lw8MV30RRA4HV39EBQ==
X-Received: by 2002:a17:907:7e94:b0:ab7:6d59:3b4c with SMTP id a640c23a62f3a-ab789adaf0bmr433844966b.21.1738963856272;
        Fri, 07 Feb 2025 13:30:56 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79d4df211sm23307866b.32.2025.02.07.13.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:30:55 -0800 (PST)
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
Subject: [PATCH v7 00/11] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Fri,  7 Feb 2025 22:31:40 +0100
Message-ID: <cover.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_133058_137751_E69C85B0 
X-CRM114-Status: GOOD (  28.53  )
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

-PATCH 11 (OPTIONAL): enable CONFIG_OF_OVERLAY in order for 'make defconfig'
 to produce a configuration valid for the RP1 driver. Without this
 patch, the user has to explicitly enable it since the misc driver depends
 on OF_OVERLAY.

This patchset is also a first attempt to be more agnostic wrt hardware
description standards such as OF devicetree and ACPI, where 'agnostic'
means "using DT in coexistence with ACPI", as been already promoted
by e.g. AL (see [4]). Although there's currently no evidence it will also
run out of the box on purely ACPI system, it is a first step towards
that direction.

Please note that albeit this patchset has no prerequisites in order to
be applied cleanly, it still depends on Stanimir's WIP patchset for BCM2712
PCIe controller (see [5] and newer versions) in order to work at runtime.

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

CHANGES IN V7


PATCH RELATED -------------------------------------------------

- patchset rebased upon v6.14-rc1
- patch 1,2,3,4,7,9: added: Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
- patch 1: fixed a typo in the description
- added new *optional* patch 11 to enable OF_OVERLAY in defconfig


RP1 CLOCK DRIVER ------------------------------------

- clk-rp1.c: general rework of the register fields defined via GENMASK


RP1 MISC DRIVER -----------------------------------

- Added a short explanation about the reasons why this driver
  is contained in drivers/misc, as an addition to the links
  pointing to the entire discussion in the maling list

- Deleted rpi_pci.h which only contained extern reference to
  symbols created automatically by cmd_wrap_S_dtb to include
  the dtb overlay as a binary blob accessible by the driver.
  Those symbols are only accessed by rpi_pci.c and are not intended
  to be visible elsewhere. A new comment better specify this
  to avoid confusion

- Used KBUILD_MODNAME as pci_driver.name

- Kconfig: solved a recursive dependency on OF_OVERLAY


Andrea della Porta (11):
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
  arm64: defconfig: Enable OF_OVERLAY option

 .../clock/raspberrypi,rp1-clocks.yaml         |   58 +
 .../devicetree/bindings/misc/pci1de4,1.yaml   |  135 ++
 .../devicetree/bindings/pci/pci-ep-bus.yaml   |   58 +
 .../pinctrl/raspberrypi,rp1-gpio.yaml         |  198 +++
 MAINTAINERS                                   |   14 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |    7 +
 arch/arm64/boot/dts/broadcom/rp1.dtso         |   58 +
 arch/arm64/configs/defconfig                  |    4 +
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rp1.c                         | 1511 +++++++++++++++++
 drivers/misc/Kconfig                          |    1 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/rp1/Kconfig                      |   20 +
 drivers/misc/rp1/Makefile                     |    3 +
 drivers/misc/rp1/rp1-pci.dtso                 |    8 +
 drivers/misc/rp1/rp1_pci.c                    |  305 ++++
 drivers/pci/quirks.c                          |    1 +
 drivers/pinctrl/Kconfig                       |   11 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-rp1.c                 |  789 +++++++++
 .../clock/raspberrypi,rp1-clocks.h            |   61 +
 include/linux/pci_ids.h                       |    3 +
 23 files changed, 3257 insertions(+)
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
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

-- 
2.35.3


