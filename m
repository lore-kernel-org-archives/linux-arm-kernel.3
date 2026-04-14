Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC82EF9D0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7rNJx51nZ5v0rxVmH9cSEcldop8PKAU+fA+AP1OHk9Q=; b=vuFSXuvcKfPEgF6xbZr4g/ll86
	McLNd09P38SovBHSRab92OzaqiOxxVoHRB5WpIKwrjbEj+v1HD/dpudTKo1kFkYTSFrWAmxY3X8V2
	WN8xsexcG0NWJFT08u6mUGstNIE0WWlQXZR4QJPNYD5Uef+c4stkHIJx8TNNyPtpo+2BrbCW/naax
	JTDpybopu03mzE8HgEq/SRsE3Tthbf9uxEO0j2E5CE5i/KUZMJVrLKp/qZBebfqR2UcgwH13XEGXW
	+qWmrpAL7tg95gAa7o2+JjxAE7DKDUKXDj/6H9nH1pG8vG/Vj8O9Fqp1DpCbVMtyWh7q+jDGVrZ2+
	sD7XQEWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3Z-00000000Dqf-2lNB;
	Tue, 14 Apr 2026 21:12:25 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3W-00000000Dq3-3U9V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:12:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43d70b3e159so1307780f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776201140; x=1776805940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rNJx51nZ5v0rxVmH9cSEcldop8PKAU+fA+AP1OHk9Q=;
        b=KBySJAs641K0ppMzrAukpxHTqCrQTim82p14qLVfzLMFGQmxrk/Lhj+RGB8OGZNJXi
         hoo6vdDRZH/RK/H/yGyMLjH0ANKrd2qYE3JNn/6fmdKmTCFSt5Bix87xUypp/B3k/ger
         c+ahDe/JOnQjEJD7U3W1xlw8w+Vs6AlKwdN3A0Fln8NWF0ky2eN4lrXpADF/biAcbFoF
         pSiiqrHTql5qaXVtUpfxyg2LRM/KSNQ5BDkoNhqC3v2/YzEX+FlXTbvWwUtH1SvxXrrp
         23wK4MHYfMhGWeKcVu01j+Rejh6aCS5EJ8ms20c8oLS6F7E4685EH5LQQLnAF73aI2WM
         eSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776201140; x=1776805940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rNJx51nZ5v0rxVmH9cSEcldop8PKAU+fA+AP1OHk9Q=;
        b=WTQ+ZgT+NBadsoLVQ78BclLORYPN51PDVBjKOv/dAocwkoZQle1/Q4IWsq3C2byd/c
         sAoPTTvQ0YP/YD18Rck26My25PfLyIm0Bj5HJuNI9LmgTo0EEfnytA7H4Cb5QLuNGDO5
         1x9f8sVXhP7loPS/QaRrGh1HBak8aPQ/WvpdzzrCIxwg5pCnRBwT0kgjm+zMXyRDVmOD
         jrEngUHh/8XTpVPA2Rc8+H4PcLTXqq8A2eXgaVCIXOFOetYW6vE2E3RZp0ql3KXLUbXK
         o0lvTZXGWD+gDsP6dDxxI5vgN1drR273mWAaiOtHjCnUkToLHTHOUG1pWVcIpWWfNNQR
         GkwQ==
X-Gm-Message-State: AOJu0YxgXKfW9ZrJ+nb2YuQvxVNY5utJ2PMNwZRJpF3o3zXZCypNJTv2
	BtntxukQ0LzD+1kxj271EpkBICEDM62rh4DkrKlZhlHo0DqfsbtyrNLxWDmUpm//
X-Gm-Gg: AeBDiesVbPOnss3hKP9PSRDTBTBWjtTfE/8s4wPyEM4j9vR58MHTJBV4GD0e8JT0zxJ
	NhRar3M/fOAOzTkTRcn4Bi37WecDbATdtJuL1fesKuVMApDynJhQqESoHuBdwoZY1zmAxJn7DHi
	t1K4xeQU6e2Nbrag86juNx16pP8YJlsjUdeizYPwDh4YRDcPhJ+AB0C9NRb3tAum5vPFE3G3zXu
	T/7tvRLY0/oS1W18XLe/pCz0riIHdgFX+17eu+MvaDRSkKOGsLpxD/Nkf9PpOeC1Fb86coSkapf
	KlRVstUNqURvlYzx/h67SHQ3qDk3mUh82f8hmEdnBmodZKm6I4ME0Fac2y5FlXId4xU7z0efrkA
	oEUfU4czhjXo9Nk1IX+TBny54V/Cw2pwt5hBA+JrqZzUCnv/UUT0HCdAiLNa2emZO47v6m6YNnH
	zEvG5dNpMD2w1M3stCISGNQz1QZudCEJbOQejOIJJmDoE=
X-Received: by 2002:a5d:5d83:0:b0:43b:40ef:5d1a with SMTP id ffacd0b85a97d-43d642552e7mr27403907f8f.5.1776201140232;
        Tue, 14 Apr 2026 14:12:20 -0700 (PDT)
Received: from strix.doe.home ([197.250.100.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73b44b3esm27652679f8f.13.2026.04.14.14.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:12:19 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 0/8] Add support for ZTE zx297520v3 
Date: Wed, 15 Apr 2026 00:12:07 +0300
Message-ID: <20260414211215.152850-1-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_141222_910165_5D09FCAD 
X-CRM114-Status: GOOD (  22.53  )
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

Hi,

This is a follow-up on my RFC patches from January [0]. I made more progress in more work on this SoC and it is time to get serious about code review and upstreaming.

Since my version in January I managed to get more hardware running: SPI, I2C, PMIC with real time clock and voltage regulators, Watchdog. LTE is not working yet, but I am able to start the coprocessor that handles it and talk to it via mailbox + shared memory. Wifi is working on a few more devices. Since WiFi, USB and Ethernet are working, the devices can have actual use with OpenWRT even without LTE.

Another hacker created a free software program to talk to the USB loader [1] and boot uboot and Linux without modifying the on disk files. At the moment it needs a proprietary blob, so my documentation is emphasising booting with the on-device U-Boot.

This patchset here is mostly unmodified from the version I sent in January. It is the bare minimum to get an interactive shell working on the UART. Future patches can be found on my git repository [2] for those curious to peek ahead. The first 30 patches are in reasonable shape, but the further you go the more cleanup is necessary. I expect all of the patches go require a few rounds of feedback though.

My plan for upstreaming is largly this:

1) This bare minimum boot patchset
2) Add clock and pinctrl drivers
3) Add hardware to the device tree that already has existing drivers
4) Add zx29 specific drivers one by one: Watchdog, spi, i2c, DMA, PMIC, battery
5) SDIO backend for rtl8xxxu
6) rproc, mailbox and rpmsg

I am willing to maintain support for the SoC within reason. My patches add myself as maintainer. This is a hobby project for me though, keep that in mind if you want to ship a commercial product with these SoCs and upstreaming Linux.

Cheers,
Stefan

0: https://lists.infradead.org/pipermail/linux-arm-kernel/2026-January/1099306.html
1: https://github.com/zx297520v3-mainline/zx297520v3-loader
2: https://gitlab.com/stefandoesinger/zx297520-kernel/

Stefan Dösinger (8):
  ARM: zte: Add zx297520v3 platform support
  dt-bindings: arm: Add zx297520v3 board binding
  ARM: dts: Add D-Link DWR-932M support
  ARM: zte: Add support for zx29 low level debug
  ARM: dts: Add an armv7 timer for zx297520v3
  ARM: zte: Bring back zx29 UART support
  ARM: dts: Declare UART1 on zx297520v3 boards
  ARM: defconfig: Add a zx29 defconfig file

 Documentation/arch/arm/zte/zx297520v3.rst     | 158 ++++++++++++++++++
 .../devicetree/bindings/arm/zx29.yaml         |  20 +++
 MAINTAINERS                                   |   6 +
 arch/arm/Kconfig                              |   2 +
 arch/arm/Kconfig.debug                        |  12 ++
 arch/arm/Makefile                             |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/zte/Makefile                |   3 +
 arch/arm/boot/dts/zte/dlink-dwr-932m.dts      |  21 +++
 arch/arm/boot/dts/zte/zx297520v3.dtsi         |  83 +++++++++
 arch/arm/configs/zx29_defconfig               |  90 ++++++++++
 arch/arm/include/debug/pl01x.S                |   7 +
 arch/arm/mach-zte/Kconfig                     |  24 +++
 arch/arm/mach-zte/Makefile                    |   2 +
 arch/arm/mach-zte/zx297520v3.c                |  19 +++
 drivers/tty/serial/amba-pl011.c               |  37 ++++
 include/linux/amba/bus.h                      |   6 +
 17 files changed, 492 insertions(+)
 create mode 100644 Documentation/arch/arm/zte/zx297520v3.rst
 create mode 100644 Documentation/devicetree/bindings/arm/zx29.yaml
 create mode 100644 arch/arm/boot/dts/zte/Makefile
 create mode 100644 arch/arm/boot/dts/zte/dlink-dwr-932m.dts
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3.dtsi
 create mode 100644 arch/arm/configs/zx29_defconfig
 create mode 100644 arch/arm/mach-zte/Kconfig
 create mode 100644 arch/arm/mach-zte/Makefile
 create mode 100644 arch/arm/mach-zte/zx297520v3.c

-- 
2.52.0


