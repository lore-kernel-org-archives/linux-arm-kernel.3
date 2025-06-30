Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C84C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIm0xFJK3jRnfwYG215UQKCyQbCd7X/xLkVjmY80bHs=; b=A0ADMD16dsjFAN/MmJwd2NSOMc
	ahxrawZ7FL33R72LWN0waQr04BjOXd0n2QC7gfRX5xOo7woDVokA4g/0eMn2tNY8b7ozKcye7UVLI
	5Av0GDEMPITqp3O+K5j5FZLmPtMzoKNIaBKdCSICUOJGnbibVKqfY5mIZv9rkULrfd9iXabAdTWnI
	N0i8CZFBpTbAeUV+HLWUKju3cLU/8KMvGgSvO6eYy0xuXlW6h3z+GdKI0RXCQu9pRzbi1FSVD3qIa
	0RFoxY3FIw2zSzEeNI51jNJRSPzoXpVRdVwuVQYM4rxMyHX+Ubvk1JNl4DHXcYkjFF7FO8SzyXvHt
	MgQ/HJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJxS-00000003Ghl-2p8K;
	Mon, 30 Jun 2025 19:14:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJlw-00000003FKQ-1DUa
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Jun 2025 19:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KIm0xFJK3jRnfwYG215UQKCyQbCd7X/xLkVjmY80bHs=; b=o/fbzef5oJiR/cAWLh8tuaCWIB
	zczpC6t3VhWRMofrKDpPsRH8xUd1ZLMYTwA+1FiOwIybXwoeuLs6lP7DCEckyxgQ62sXoJIrFQa5Y
	LxUwAVrB7G/rVLm53DXpiqSwzaqh5Ng9zXbCVQlaCztXuXRHMZUBTCq3fgfhUjWIMPXkcA9MKapn/
	qKV3U+yDiehDvZV7uRdckY8gMsPMnOuu3g2CYwj991Bhlf3vxmKVCTsEnvj2oxO13HkA7BnvSVq4q
	LYervI1Oc30bMBp3IEjIQDH2v3MSQERW/giLF4/dhP5IwFtD6IXCW+YQTpwZpTSJLpiAKubfvSU0y
	MmznaynA==;
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJlq-00000006s7T-41zT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 19:02:30 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4577AC0008F3;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4577AC0008F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1751310142;
	bh=AbK9hehWKP1ojh2cXx15qNWNQKke9TeRZzgIfQP3KYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CxPRDHXuMUeCsceZi/W8AOWEWBa0qtCsl14WFNXHmF/YwOKM9ovWZ9MCFOrZScKmU
	 DkO+2bmuVZPR7v9fZNQj0dfP+DkTB+mP5WZc+0H9P38+YjGFPelJt1evNsvTREPoYS
	 2De249x5hUyOTtrcXqfkNHxiWWgBB9cM4RgxhPPw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 1C88418000853;
	Mon, 30 Jun 2025 12:02:22 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	William Zhang <william.zhang@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/5] Broadcom devicetree-arm64 changes for 6.17
Date: Mon, 30 Jun 2025 12:02:14 -0700
Message-ID: <20250630190216.1518354-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_200228_410139_67DD22B8 
X-CRM114-Status: GOOD (  12.72  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/devicetree-arm64

for you to fetch changes up to 657e413c277898f0ff91922475c67d82faaeeef7:

  arm64: dts: broadcom: northstar2: Drop GIC V2M "interrupt-parent" (2025-06-10 10:49:57 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree updates
for 6.17, please pull the following:

- Linus updates the 64-bit BCMBCA SoCs Device Tree with the common
  peripherals that exit as well as correct IRQ assignments

- Andrea adds support for the RP1 companion chip on the Raspberry Pi 5
  systems with clocks, gpios, pinctrl, all of that using an overlay to
  describe those peripherals

- Rob drops the interrupt-parent property from the GICv2M node on
  Northstar2 SoCs

----------------------------------------------------------------
Andrea della Porta (7):
      dt-bindings: clock: Add RaspberryPi RP1 clock bindings
      dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
      dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
      arm64: dts: rp1: Add support for RaspberryPi's RP1 device
      arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
      arm64: dts: broadcom: Add board DTS for Rpi5 which includes RP1 node
      arm64: dts: broadcom: Add overlay for RP1 device

Linus Walleij (4):
      ARM64: dts: bcm4908: Add BCMBCA peripherals
      ARM64: dts: bcm6856: Add BCMBCA peripherals
      ARM64: dts: bcm6858: Add BCMBCA peripherals
      ARM64: dts: bcm63158: Add BCMBCA peripherals

Rob Herring (Arm) (1):
      arm64: dts: broadcom: northstar2: Drop GIC V2M "interrupt-parent"

 .../bindings/clock/raspberrypi,rp1-clocks.yaml     |  58 ++++++
 .../devicetree/bindings/misc/pci1de4,1.yaml        | 137 ++++++++++++++
 .../bindings/pinctrl/raspberrypi,rp1-gpio.yaml     | 198 +++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/Makefile              |   4 +-
 .../boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 121 +++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   | 111 ++----------
 arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi   | 116 +++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi  | 129 ++++++++++++++
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi   | 130 +++++++++++++-
 arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi   | 119 ++++++++++++-
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |   8 -
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi       |  42 +++++
 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi        |  14 ++
 arch/arm64/boot/dts/broadcom/rp1.dtso              |  11 ++
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h |  61 +++++++
 15 files changed, 1145 insertions(+), 114 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-common.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

