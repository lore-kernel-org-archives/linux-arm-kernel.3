Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0412E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 21:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LtH3w2yzay2mB9h+63UlRphjDaprFBP4pzyXR1a8HkI=; b=Fgvp4sgFx8IwbHuZJwdonNBWDe
	OWlhf93NqLQQewGW6n9NBFqEJjUNCT3/PiijRtdIDod6IEoHo/JYN9cqC6cksrRpxg2oMKbLnp+2Z
	snnpwOUX6F3sJqapinWaOjT8CA3UAdDxIPBhsA1l/8L9afnVQ1GX3IfTLVnvQWppz8QzR3mgJbJ6R
	JRVZ/5gwoVycShw3A8hZbbnFNN1jYsCiGFhVd6Jcgg3FRJsdSk3TxoGg4vbgFSnyRkDUmS+HaZvI6
	EBMq7SIQNSVS32exAf01cNAdTUOtxBepoihcTlirNgdOLkqmg2Yf5+Uk/5JDJiUQRrIWF4d+6Nm5/
	G05GAUjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMIP-0000000GzET-1exN;
	Fri, 10 Jan 2025 21:11:57 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWMEy-0000000GyjR-3UHD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 21:08:26 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AL8COD3468778
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 15:08:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736543293;
	bh=LtH3w2yzay2mB9h+63UlRphjDaprFBP4pzyXR1a8HkI=;
	h=Date:From:To:CC:Subject;
	b=iEBAkXG16YVSFm0VrVX63PlK2HVmdjYRONle6pCspnUkLz9qM2XIKSnOGSga+UiZW
	 2uuyj7NsDJI6C6DY+BJpAbfvyQ10t23jg65i8oO3fxEfBRCw+PK/TASbVLakJeUs5/
	 oqWR9o/mbsBwsWKYbGPmkj0spV3SY4R8OsFzj3Cg=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AL8Ckc090010
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 15:08:12 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 15:08:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 15:08:12 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AL8CkX034021;
	Fri, 10 Jan 2025 15:08:12 -0600
Date: Fri, 10 Jan 2025 15:08:12 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: <soc@kernel.org>, <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Tony
 Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 3/4] arm64: dts: ti: K3 devicetree updates for v6.14
Message-ID: <20250110210812.bdpypzvmg6s6sr5t@itinerary>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_130824_970400_1646E70D 
X-CRM114-Status: GOOD (  16.55  )
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

Hi SoC maintainers,

Please pull the following. Please note that there is a minor checkpatch
warning around "Reported-by" without "Closes" - the report was an
internal report with no public facing URL and was hence skipped. I
decided to leave it alone to acknowledge the reporter.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-dt-for-v6.14

for you to fetch changes up to 5532b8a9ce0e80514e37a1e082824934663580a3:

  arm64: dts: ti: k3-am62a-wakeup: Configure ti-sysc for wkup_uart0 (2025-01-08 09:45:52 -0600)

----------------------------------------------------------------
TI K3 device tree updates for v6.14

Generic Fixups/Cleanups:
- Remove unused and undocumented "ti,(rx|tx)-fifo-depth" properties for
  ethernet phy
- Clock description added to ICSS-G

SoC Specific features and Fixes:
- Duplicate GICR reg defines in am62x/am62ax
- Mailbox nodes are enabled at board level bringing AM67/j722s/am62p to same
  behavior as other K3 SoCs.
- Introduction of deep-sleep state defines for pinctrl header

AM62Ax
- Enable ti-sysc for wkup_uart0

AM64:
- Switch ICSSG clock to core clock.

J7200:
- Disable SPI1 loopback default.

J784s4:
- Clock ID fix for McSPI instances
- Use j7200-padconf compatibility for padconf to enable suspend-to-ram support.

Board Specific:

AM62
- phyboard - hdmi bridge regulator and using 16bit input for hdmi bridge,
  vcc-supply for i2c eeprom
- SK - SoC wakeup using USB1, Add bootph property around cpsw mac syscon node,
  M4 mailbox node redefinition fixup.
- BeaglePlay: Fix ethernet phy reset time

AM64
- hummingboard-t: Convert PCIE/USB overlays to independent dts.

j7200:
- EVM: fix typo in overlay name.

j721e:
- EVM: overlay for pcie1 endpoint mode.

j722s:
- EVM: Add mcu_i2c0 support for expansion pins., Add USB0 DFU support, Enable
  PMIC
- AM67a-beagley-ai: Add remote proc nodes

j784s4:
- AM69-SK/ j784s4-EVM - Mark PMIC regulators with bootph-all property to
  indicate ones that are needed through boot phases.
- AM69-sk: PIC0 Endpoint mode overlay, USB Superspeed mode.

----------------------------------------------------------------
Andrew Davis (3):
      arm64: dts: ti: k3-am625-sk: Remove M4 mailbox node redefinition
      arm64: dts: ti: k3-am62p: Enable Mailbox nodes at the board level
      arm64: dts: ti: k3-am67a-beagley-ai: Add remote processor nodes

Andrew Halaney (2):
      arm64: dts: ti: k3-j784s4-evm: Mark tps659413 regulators as bootph-all
      arm64: dts: ti: k3-am69-sk: Mark tps659413 regulators as bootph-all

Anurag Dutta (2):
      arm64: dts: ti: k3-j784s4: Fix clock IDs for MCSPI instances
      arm64: dts: ti: k3-j7200: Add node to disable loopback connection

Bhavya Kapoor (1):
      arm64: dts: ti: k3-j722s-evm: Enable support for mcu_i2c0

Bryan Brattlof (2):
      arm64: dts: ti: k3-am62: Remove duplicate GICR reg
      arm64: dts: ti: k3-am62a: Remove duplicate GICR reg

Chintan Vankar (1):
      arm64: dts: ti: k3-am62x-sk-common: Add bootph-all property in cpsw_mac_syscon node

Dasnavis Sabiya (1):
      arm64: dts: ti: k3-am69-sk: Add USB SuperSpeed support

Francesco Valla (1):
      arm64: dts: ti: k3-am625-beagleplay: Fix DP83TD510E reset time

Josua Mayer (1):
      arm64: dts: ti: k3-am642-hummingboard-t: Convert overlay to board dts

MD Danish Anwar (2):
      dt-bindings: soc: ti: pruss: Add clocks for ICSSG
      arm64: dts: ti: k3-am64-main: Switch ICSSG clock to core clock

Rob Herring (Arm) (1):
      arm64: dts: ti: Remove unused and undocumented "ti,(rx|tx)-fifo-depth" properties

Siddharth Vadapalli (7):
      arm64: dts: ti: k3-pinctrl: Introduce deep sleep macros
      arm64: dts: ti: k3-am62x-sk-common: Support SoC wakeup using USB1 wakeup
      arm64: dts: ti: k3-am62p-j722s-common-main: Enable USB0 for DFU boot
      arm64: dts: ti: Makefile: Fix typo "k3-j7200-evm-pcie1-ep.dtbo"
      arm64: dts: ti: k3-j721e-evm: Add overlay for PCIE1 Endpoint Mode
      arm64: dts: ti: k3-am68-sk-base-board: Add overlay for PCIE1 Endpoint Mode
      arm64: dts: ti: k3-am69-sk: Add overlay for PCIE0 Endpoint Mode

Thomas Richard (1):
      arm64: dts: ti: k3-j784s4: Use ti,j7200-padconf compatible

Udit Kumar (1):
      arm64: dts: ti: k3-j722s-evm: Enable PMIC

Vibhore Vardhan (1):
      arm64: dts: ti: k3-am62a-wakeup: Configure ti-sysc for wkup_uart0

Wadim Egorov (4):
      arm64: dts: ti: k3-am62x-phyboard-lyra: Set RGB input to 16-bit for HDMI bridge
      arm64: dts: ti: k3-am62x-phyboard-lyra: Add HDMI bridge regulators
      arm64: dts: ti: k3-am62-phycore-som: Define vcc-supply for I2C EEPROM
      arm64: dts: ti: am62-phyboard-lyra: Provide a vcc-supply for the I2C EEPROM

 .../devicetree/bindings/soc/ti/ti,pruss.yaml       |  10 ++
 arch/arm64/boot/dts/ti/Makefile                    |  19 ++-
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |   1 -
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi    |  11 ++
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts     |   2 +-
 arch/arm64/boot/dts/ti/k3-am625-sk.dts             |   7 -
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi          |   1 -
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi        |  36 ++++-
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    |   5 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            |   4 +
 arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi |  24 ++++
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi     |   6 +-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |  22 ++-
 ...-pcie.dtso => k3-am642-hummingboard-t-pcie.dts} |  14 +-
 ...-usb3.dtso => k3-am642-hummingboard-t-usb3.dts} |  13 +-
 .../boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts    |   6 -
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     | 158 +++++++++++++++++++++
 .../dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso     |  53 +++++++
 arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtso    |  53 +++++++
 arch/arm64/boot/dts/ti/k3-am69-sk.dts              |  41 ++++++
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |   4 +
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |   7 +
 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso  |  53 +++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts            | 102 +++++++++++++
 .../boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi   |   8 ++
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  22 +--
 .../dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi |  12 +-
 arch/arm64/boot/dts/ti/k3-pinctrl.h                |  19 +++
 28 files changed, 654 insertions(+), 59 deletions(-)
 rename arch/arm64/boot/dts/ti/{k3-am642-hummingboard-t-pcie.dtso => k3-am642-hummingboard-t-pcie.dts} (78%)
 rename arch/arm64/boot/dts/ti/{k3-am642-hummingboard-t-usb3.dtso => k3-am642-hummingboard-t-usb3.dts} (74%)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

