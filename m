Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178B5C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TeDOSnn5fREb0uOPL8DykLXJIZWFTF03C5KXX/rT0MU=; b=jPzgIswKy+iz5lO3GMHKhTBR8P
	toazkhb2rx2blhlkxNGdNpYgFEnsr/671Ym0xbIex0nR0Un6hCY5U9hC3xQmBO0pJ7x3FwQ7gbwgK
	qq7YY+MV7x5vZX1OdVa9Uf+gosy7crncm1rtwLZMDlfaaqQX1BM8y6CyBZ+kHeng6Xgm6mYCFii2P
	l+ITsZWBGbUPV8dsich0eYE4E9eU84nhDWunyPoSGebBCrbpD5psw0XAjPLg4qkeBTCt6mpmET2mL
	1Tuuyn/teRCX8zHPrSeQ0SPo0xJWrfjY6kCPiR6vbHE2v9PUVjob7304Lye7zp6VJjnYw2FtXt6bx
	xgFusPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKctw-0000000FocN-2fMO;
	Thu, 29 May 2025 13:02:28 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcad-0000000Fkgo-20od
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:42:32 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso48834966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 05:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522550; x=1749127350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TeDOSnn5fREb0uOPL8DykLXJIZWFTF03C5KXX/rT0MU=;
        b=PQ15hFFTAcmexwMKYGI1ptCJYkVhfUsqKMBVXfG/ijfkLPZkyxU6e8B8+5KJuPGxXy
         VtTRyYonE+vtkosBTOutMuC5ArMIOP7TU3PM5C19jBQjLZiXuMim04PRSNwyIsXClL1j
         JG0i6BsIXmlHwmTDoCHFMUc3XyHxWIRFgJiEF1nc2GVJYEBL5UzPEWJy/Vpval+KKfiK
         VzQHxP7gtkYaVDSSvKJYKqOyI6QcH+/5UYLf0SFmaNk3mjCRyZyHdVqq4SQfNZIsTNXY
         Na0Pq0ZxgLZjauZSSoBzwsi2bkUv4MPpNwuh2bPyYr2GQQIjnXEMHHYWm+BQY+V6l+wn
         rXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522550; x=1749127350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeDOSnn5fREb0uOPL8DykLXJIZWFTF03C5KXX/rT0MU=;
        b=aDb9lCh2TnoGCXiv41KiNTv0MSOzq7U2xqwtZpl8M5B/D726yQ7xKZEKDqnnzTOuSX
         TdYqJhrT9Oc7yx66Nv4CHwFt8wncHOsM1JGbJg16+4OyHUEKgpYW+HN7A1Da/Kf0pvwY
         66P/UZlXu+YH3DOKLPjXzjNeSRDEK00uKinZ3vQrnDL6kRfdUcMIw8wR5ADgdC039/nn
         Qyypz+QSVvPG/ECbFb03DHF8ixRHQ+qg1t2RjF56hNLu4ROvGWxnZ2taluHwpyocLVPv
         v4Wh6rEoc6TC9vBZecSXipbG/TiApNSM+jEQTr1KofHwxKb/pMEwLeyKhcTonGnSR/4r
         MEAw==
X-Forwarded-Encrypted: i=1; AJvYcCWErMaJ9ZttgkcQYd6qkfoKVn786DqRlFdwybyQIKGczxymH8zHg650C4eyapw+ChNL2r/t2iJ3FUTXzCChXgsR@lists.infradead.org
X-Gm-Message-State: AOJu0YzXSSlZ7qp2qXk/aBUVF/TQJcFdW9IjUyXGJpZJyyEJjOTcPug1
	jqIe8Gcj92lfU/BqMoNTKhxh9J0WQvF/7qTcyIKX8XipZGaRc0k0No8bvgEEOFh/Stc=
X-Gm-Gg: ASbGncsROwcjwEkOkzHccEvE1AY4g96b/kvaa01xDgu4NNldxaAIfZaB3QTxsJduoLu
	NiTJVpM/Why1O+RYL/ANJB5oAnEWLnyVA8zYvz9RIJ3lppGBhmb3T32mG3zDWim9KmmQWeELI8V
	uknfpTcI8zgLt3GCaw2LJam9UqrYypeTc1DzjRXZvVVa9ZGBe5zpDR4mMa/u69cpfjQzprL7Ud/
	MSIfo2znHkeFhMz6Kplj2DV3x6qhJnCn1jJU3gjanQB8x/w8uzZHqEATdaxVc/d6Z8FS9O4y7TL
	T1A2EObrlw8c6vglwFbnfDqKRXYjQXEQ+ZHyi4/Y9CJB9pauEVsZopDYjOA11ys7VWuTSo4ucwY
	BHCbfhWOKwZ0KwqCY1XnlDw==
X-Google-Smtp-Source: AGHT+IFc7mYtdWx5h64JYuH4a1LeComufmIsNfa7K/9QthDz9+VCnPqHTyQm1vfkEIaYUwEw02Ai2A==
X-Received: by 2002:a17:907:3da6:b0:adb:2db9:b0b0 with SMTP id a640c23a62f3a-adb2db9b1b7mr45221366b.35.1748522549691;
        Thu, 29 May 2025 05:42:29 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82eee2sm136039966b.73.2025.05.29.05.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:29 -0700 (PDT)
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
Subject: [PATCH v11 0/13] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Thu, 29 May 2025 14:43:49 +0200
Message-ID: <cover.1748522349.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_054231_521704_FF6570AD 
X-CRM114-Status: GOOD (  24.46  )
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

*** RESENDING PATCHSET AS V11 SINCE LAST ONE HAS CLOBBERED SEQUENCE NUMBER ***

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

-PATCH 6: the devicetree node describing the RP1 chipset. 

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

-PATCH 13: collect all changes for MAINTAINERS file.

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

CHANGES IN V11


PATCH RELATED -------------------------------------------------

- Patch 10,11,12: Added: Reviewed-by: Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

- Patches reworked to apply cleanly on broadcom/stblinux branches:
  patch 1,2,3,6,8,9,10 -> devicetree/next
  patch 11,12 -> defconfig/next
  patch 4,5,7 -> drivers/next
  patch 13 -> maintainers/next

- Patch 13: new patch gathering all changes for MAINTAINERS


RP1 CLOCK DRIVER ------------------------------------

- Dropped some WARN_ONCE() lines that are basically useless

- rp1_clock_set_parent() now returns EINVAL in case the parent check
  is failing. As a result, rp1_clock_set_rate_and_parent() has also
  been adapted to return rp1_clock_set_parent() retcode.

- Return an ERR_PTR from rp1_register_clock() instead of just NULL

- Dropped some unaesthetic blank lines

- Disabled the builtin locking in regmap since we're already dealing
  with concurrency in the code

- rp1_clk_probe(): dropped dev_err_probe() as redundant due to commit
  12a0fd23e870 ("clk: Print an error when clk registration fails")


