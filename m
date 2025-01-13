Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA40EC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FwnS3vaGfU2joF6cYNFfsBCgKjyVEnMzRnIWwalUQU8=; b=0Aivceav8tpr4uEhh7GsMIkftc
	LkhFi7i/nCmplndlodiKsMe41113Z3ted5WhXPfTiDOor9gWqxURFmCGsbBX40LfEmIcD+5HXhb3E
	WKcGHbwcCg8o3TMhI4S2KAjtOj2CTCteR5Z7wQAqNN4ZYP+PmkVl2gBez2bOtypjuyz4WH1JKzIlb
	1uvNvqb8ls8Ezg2vDBMuk0xogVzkdBlv898AY8rvPaDPkPNwCIOIzMu/p2RjcMTZimvOr8AAaXTf1
	4NaU5WG4j19AvTQVDpM3UrFbNq1wOXFcGml+/kgeS5a3t2ej89vXcDPeEgE4uKr0TuTLKuFTy8aa1
	0oJ9YUaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMWt-00000005gEU-0son;
	Mon, 13 Jan 2025 15:39:03 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLsb-00000005Vp6-1VFe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 14:57:26 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so6682492a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 06:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736780243; x=1737385043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FwnS3vaGfU2joF6cYNFfsBCgKjyVEnMzRnIWwalUQU8=;
        b=L+2/ZnRK3Pn0qEkRY8RKGPbB4JB68xzzG9FhNIlJB0kFH0B+fgJCRKyM/37XrF6rnS
         g1IHwNsfAyO1F3p3SB1MeWXNBgBZk1+a0GzPbsbSgAZPc86t/IyeVEXU1R0u6ga2iOPk
         xJMXFYe2OjDrK60Lg79b7Y2ZU9eEXPdmG/WcwvbsoJgJ3VPJ/iPXBUHezxbbvTdpsI4x
         0zgVs3XCvlAcRP/C3lgUyAfu9eUDRk6QZ0hJ61D9cIpIQ4HDbf6VLafz0kIL5T6+zoXG
         BRLt+4x0DEB9VyVqDMossPHlAU8pJMrOdWiKJVrnxgm8nbXiXrP8BSB+ZzuSlruH0oQ0
         Whww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780243; x=1737385043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwnS3vaGfU2joF6cYNFfsBCgKjyVEnMzRnIWwalUQU8=;
        b=C3Ty+6xOu2UMMy9N/jrRsIq30k6DHkHjHnAQoihMll1SY4Dj+Z4jEKxj5svqYv+Lb0
         1l6Wyep1K8yiI025a1TSCenc59l8PpBUU+DYZv8w7alLtqwv2BllZQP760qgCveuJSF6
         rL3OxCZjxvgV41Xfybv/7/1+v9yT875H8XMwzlXBsDp79fhowt5+wvshgto2PqfQxzQl
         dKraj9t1OZLNGpgeekybDebS35dibBw4tGO7DscRc0wKSVront3Jw/V7ImIuy+TOr5qU
         +1lDbxXUjY109bU7MJlp+PRTVaUsgIDdXRuoBuTL+9NMC94LDFeo3ZXxCXg9JOou3m+Z
         appg==
X-Forwarded-Encrypted: i=1; AJvYcCW/J7S2r8CqmN5+FbVV2XnhPNpelCxy/hXw1l3khnhgVg2WWIWrNq8CAGjbqek3ZE8/rvTKWYh17uj9UomZs1UH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt4Vu3IwX7KK/FNN+uOQdS1n/Of6lKDz7Cg9wuApO84r3/Fqq5
	8j+lVwLYhBW6Qmdrnm1u109prUL0FRAUHCEcIHh+7Wz7nKWh/hN8kBGrZy7GFWc=
X-Gm-Gg: ASbGncs2ZqSVFfTcZd12BPQFCC7Bp3tOuc1ZaglBqHQCZp1C8s1v2BSli4sigym+Ltk
	l6wKhg3O5lhnxs0gaKevpAYDcFLseTNqzBhClNqLgCAUKn6ifccoPH79aDwjAj/Zi3wjwEuwOkz
	ln+T2eonM3h0k6RQAzzr64w4F6VnAQGeDHaCcnOx9xj4StLDPdFxfQsXEmm4ZchqAFbU3mN+rVx
	m4XJPxLgutzv4kh2+8FQ9MLLBwXhAtIDV0UkDA+0m+2dJJAH6sBxeJhxCqVYWLtXQ6APYanOE1y
	86dXjZoux72v8Y9ZIUthTJ4pQ1Q=
X-Google-Smtp-Source: AGHT+IF+dQmIb1tSxF2qnawRLekJBTCQVTuDzMZWssaSx8RiWN62SO954NQh7GFSKEfS+l/Tll7rpQ==
X-Received: by 2002:a17:906:ef0d:b0:aab:d7ef:d44 with SMTP id a640c23a62f3a-ab2ab6c1ad2mr2040825166b.24.1736780242877;
        Mon, 13 Jan 2025 06:57:22 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90da2c8sm516494166b.62.2025.01.13.06.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:57:22 -0800 (PST)
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
Subject: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Mon, 13 Jan 2025 15:57:59 +0100
Message-ID: <cover.1736776658.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065725_412793_2DD560D4 
X-CRM114-Status: GOOD (  25.07  )
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

CHANGES IN V6:

PATCH RELATED -------------------------------------------------

- patch 2: added: Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
- patch 3 and 4: added: 'Reviewed-by: Rob Herring (Arm) <robh@kernel.org>'
- patch 8: removed a stale paragraph from git commit message regarding
  gpio renaming through configfs


RP1 MISC DRIVER -----------------------------------

- interrupts definitions moved as documentation from rp1_pci.c to
  pci1de4,1.yaml binding schema


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
 .../devicetree/bindings/misc/pci1de4,1.yaml   |  135 ++
 .../devicetree/bindings/pci/pci-ep-bus.yaml   |   58 +
 .../pinctrl/raspberrypi,rp1-gpio.yaml         |  198 +++
 MAINTAINERS                                   |   14 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |    7 +
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
 drivers/misc/rp1/rp1_pci.c                    |  305 ++++
 drivers/misc/rp1/rp1_pci.h                    |   14 +
 drivers/pci/quirks.c                          |    1 +
 drivers/pinctrl/Kconfig                       |   11 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-rp1.c                 |  789 +++++++++
 .../clock/raspberrypi,rp1-clocks.h            |   61 +
 include/linux/pci_ids.h                       |    3 +
 24 files changed, 3287 insertions(+)
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


