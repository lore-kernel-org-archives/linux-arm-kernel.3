Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08B3D44D75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:CC:To:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pmz0D+Pmbrx72rnz0xUrNg9TJEJRkzt863LTB4hO5CA=; b=1zl1FugWjYks/nFLhH2skJlfTM
	pNi1Hr2sDvw8XgVg+Z8jIr7qL3wSc1ll3ybsf0sn1RxDSX2lUJY3gnnN8Fm7x4y09oMqIGq64Qz7m
	nj8BYRqohhGeTojMMVkJdd2KRYGYjz9ojZ2KdxgtFiVUTKq3Hb4GLaWCdma2g+QPAnLu8nOZYJM01
	qI7GgXUtbxizmEqNX2Oc6S+3FMQMpUwjabYDCRg1GlYNJPeAMbvjPrRkm5buTzYbljwOBIekcAkpu
	oX1vD0+czIwqb+1S7vkBa2JUj4VMj1ytk8mCfxdkQ/ZmqGM7tqFnFcmedHyyb2UwtJhQoeHY36aEY
	fX7daAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gme-00000003YNy-0MoP;
	Wed, 06 Nov 2024 14:13:20 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gVP-00000003VUS-2aXj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 13:55:33 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A6DtN7Y104475;
	Wed, 6 Nov 2024 07:55:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730901323;
	bh=Pmz0D+Pmbrx72rnz0xUrNg9TJEJRkzt863LTB4hO5CA=;
	h=Date:From:To:CC:Subject;
	b=uPc41EaOmod6E6H+Wv+M5318YIa41f9o/KqTbs9l3LXtfoX7179JBTTIQ/b6vYvIG
	 xQSQc4qD8jhNV+2EHLWveM9G8Nz7vTdBkxSwYlqqu34EzrKnMBXlTqy99Wpz2eABP8
	 kI7B8g3mAVITETy4dgjpEVWRTBzN6vCEolhFF6Tc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A6DtNbF000874
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 07:55:23 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 07:55:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 07:55:23 -0600
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6DtKuL104107;
	Wed, 6 Nov 2024 07:55:21 -0600
Message-ID: <3ded4795-2186-4e06-bda6-9c9a65a3fdb9@ti.com>
Date: Wed, 6 Nov 2024 19:25:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm-soc
	<arm@kernel.org>, SoC <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 1/2] arm64: dts: ti: K3 devicetree updates for v6.13
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------SIAwUcQ6quW1oiueQ4q6JF8H"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_055531_889856_E24DC62A 
X-CRM114-Status: GOOD (  16.25  )
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

--------------SIAwUcQ6quW1oiueQ4q6JF8H
Content-Type: multipart/mixed; boundary="------------sUPnlalQ0bVwG0NLg6o4u8wc";
 protected-headers="v1"
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm-soc <arm@kernel.org>, SoC <soc@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>
Message-ID: <3ded4795-2186-4e06-bda6-9c9a65a3fdb9@ti.com>
Subject: [GIT PULL 1/2] arm64: dts: ti: K3 devicetree updates for v6.13

--------------sUPnlalQ0bVwG0NLg6o4u8wc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC Maintainers,

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-dt-for-v6.13

for you to fetch changes up to 767b6a0d0900c951e8b42306bd636268481a97ae:

  arm64: dts: ti: k3-am62: use opp_efuse_table for opp-table syscon (2024=
-11-04 18:56:35 +0530)

----------------------------------------------------------------
TI K3 device tree updates for v6.13

Generic Fixups/Cleanups:
- Cleanup bootph-* tags to limit to leaf nodes only
- clock IDs for MCSPI instances fixed up across J7xx family
- Misc indentation and whitespace cleanup across dts

New SoC
- J742s2 which is a cutdown of existing J784s4 and uses same EVM

SoC Specific features and Fixes:
- eQEP (counter) support across AM64/AM62/AM62A

AM64
- M4F Remoteproc support
- stats collection support for ICSSGs via ti,pa-stats
- Add PCIe EP overlays

AM65
- stats collection support for ICSSGs via ti,pa-stats

AM62:
- M4F Remoteproc support
- eMMC/SD TAP value updates
- dtbs_check fixes for opp_efuse_table

AM62A
- 1.4GHz opp entry

AM62P
- 1.4GHz opp entry

J7200
- Add PCIe EP overlays
- Pinmux node reg range fixes

Board Specific

AM62
- am62 verdin ivy carrier board support
- am625-verdin TPM device support
- am62 verdin ivy board support
- Beagleplay Mikrobus PWM header support
- am62-verdin increase SD regulator startup delay

AM64
- am642-phyboard-electra-rdk trickle charger support
- am64-phy* drop buswidth from sdhci nodes

----------------------------------------------------------------
Anurag Dutta (3):
      arm64: dts: ti: k3-j7200: Fix clock ids for MCSPI instances
      arm64: dts: ti: k3-j721e: Fix clock IDs for MCSPI instances
      arm64: dts: ti: k3-j721s2: Fix clock IDs for MCSPI instances

Ayush Singh (1):
      arm64: dts: ti: k3-am625-beagleplay: Enable MikroBUS PWM

Bryan Brattlof (4):
      arm64: dts: ti: k3-am62a: add opp frequencies
      arm64: dts: ti: k3-am62a7-sk: add 1.4ghz opp entry
      arm64: dts: ti: k3-am62p: add opp frequencies
      arm64: dts: ti: k3-am62p5-sk: add 1.4ghz opp entry

Daniel Schultz (1):
      arm64: dts: ti: k3-am642-phyboard-electra-rdk: Enable trickle charg=
er

Dhruva Gole (1):
      arm64: dts: ti: k3-am62: use opp_efuse_table for opp-table syscon

Francesco Dolcini (2):
      arm64: dts: ti: k3-am625-verdin: add TPM device
      arm64: dts: ti: k3-am62-verdin: Fix SD regulator startup delay

Garrett Giordano (2):
      arm64: dts: ti: am62-phycore-som: Increase cpu frequency to 1.4 GHz=

      Revert "arm64: dts: ti: am62-phyboard-lyra: Add overlay to increase=
 cpu frequency to 1.4 GHz"

Hari Nagalla (5):
      arm64: dts: ti: k3-am62: Add M4F remoteproc node
      arm64: dts: ti: k3-am625-sk: Add M4F remoteproc node
      arm64: dts: ti: k3-am64: Add M4F remoteproc node
      arm64: dts: ti: k3-am642-sk: Add M4F remoteproc node
      arm64: dts: ti: k3-am642-evm: Add M4F remoteproc node

Jared McArthur (1):
      arm64: dts: ti: k3-j7200: Fix register map for main domain pmx

John Ma (3):
      arm64: dts: ti: k3-am64-phycore-som: Fix bus-width property in MMC =
nodes
      arm64: dts: ti: k3-am642-phyboard-electra-rdk: Fix bus-width proper=
ty in MMC nodes
      arm64: dts: ti: k3-am62x-phyboard-lyra: Fix indentation in audio-ca=
rd

Jo=C3=A3o Paulo Gon=C3=A7alves (4):
      arm64: dts: ti: k3-am62-verdin: Fix SoM ADC compatible
      dt-bindings: arm: ti: Add verdin am62 ivy board
      arm64: dts: ti: k3-am62-verdin: add label to som adc node
      arm64: dts: ti: k3-am62-verdin: Add Ivy carrier board

Judith Mendez (6):
      arm64: dts: ti: k3-am62-main: Add eQEP nodes
      arm64: dts: ti: k3-am62a-main: Add eQEP nodes
      arm64: dts: ti: k3-am62p-main: Add eQEP nodes
      arm64: dts: ti: k3-am64-main: Add eQEP nodes
      arm64: dts: ti: k3-am64x-sk: Enable eQEP
      arm64: dts: ti: k3-am62-main: Update otap/itap values

Krzysztof Kozlowski (1):
      arm64: dts: ti: minor whitespace cleanup

MD Danish Anwar (4):
      arm64: dts: ti: k3-am65-main: Add ti,pruss-pa-st node
      arm64: dts: ti: k3-am654-icssg2: Add ti,pa-stats property
      arm64: dts: ti: k3-am64-main: Add ti,pruss-pa-st node
      arm64: dts: ti: k3-am64: Add ti,pa-stats property

Manorit Chawdhry (17):
      arm64: dts: ti: Refactor J784s4 SoC files to a common file
      arm64: dts: ti: Refactor J784s4-evm to a common file
      dt-bindings: arm: ti: Add bindings for J742S2 SoCs and Boards
      arm64: dts: ti: Introduce J742S2 SoC family
      arm64: dts: ti: Add support for J742S2 EVM board
      arm64: dts: ti: k3-j784s4-j742s2-mcu-wakeup: Move bootph from mcu_t=
imer1 to mcu_timer0
      arm64: dts: ti: k3-j784s4-j742s2-mcu-wakeup: Remove parent nodes bo=
otph-*
      arm64: dts: ti: k3-j784s4: Add bootph-* properties
      arm64: dts: ti: k3-j721s2: Add bootph-* properties
      arm64: dts: ti: k3-j721e: Add bootph-* properties
      arm64: dts: ti: k3-j7200: Add bootph-* properties
      arm64: dts: ti: k3-j784s4-j742s2-evm-common: Remove parent nodes bo=
otph-*
      arm64: dts: ti: k3-j721s2-evm*: Add bootph-* properties
      arm64: dts: ti: k3-am68-sk*: Add bootph-* properties
      arm64: dts: ti: k3-j721e-evm*: Add bootph-* properties
      arm64: dts: ti: k3-j721e-sk*: Add bootph-* properties
      arm64: dts: ti: k3-j7200-evm*: Add bootph-* properties

Nathan Morrisson (2):
      arm64: dts: ti: k3-am62x-phyboard-lyra: Drop unnecessary McASP AFIF=
Os
      arm64: dts: ti: k3-am62a7-phyboard-lyra-rdk: Update ethernet intern=
al delay

Siddharth Vadapalli (2):
      arm64: dts: ti: k3-j7200-evm: Add overlay for PCIE1 Endpoint Mode
      arm64: dts: ti: k3-am642-evm: Add overlay for PCIe0 EP mode

Wadim Egorov (2):
      arm64: dts: ti: k3-am62-phycore-som: Add M4F remoteproc nodes
      arm64: dts: ti: k3-am64-phycore-som: Add M4F remoteproc nodes

 Documentation/devicetree/bindings/arm/ti/k3.yaml             |    8 +
 arch/arm64/boot/dts/ti/Makefile                              |   18 +-
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                     |   74 +-
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi                      |   13 +
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi              |   37 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi               |  655 +++
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi                   |   12 +-
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi                   |    9 +-
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts               |   12 +
 .../boot/dts/ti/k3-am625-phyboard-lyra-1-4-ghz-opp.dtso      |   20 -
 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dts       |   22 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dts          |   22 +
 arch/arm64/boot/dts/ti/k3-am625.dtsi                         |    2 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi                    |   27 +
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi                  |    5 +
 arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dts       |    4 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts                      |    9 +
 arch/arm64/boot/dts/ti/k3-am62a7.dtsi                        |   51 +
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi       |   27 +
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi     |    5 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                      |    9 +
 arch/arm64/boot/dts/ti/k3-am62p5.dtsi                        |   47 +
 arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi           |    6 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi               |   19 +
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi                     |   37 +
 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi                      |   13 +
 arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi              |   29 +-
 arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso            |   51 +
 arch/arm64/boot/dts/ti/k3-am642-evm.dts                      |   22 +-
 arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts     |    5 +-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts                       |   36 +
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi                     |   15 +
 arch/arm64/boot/dts/ti/k3-am654-icssg2.dtso                  |    1 +
 arch/arm64/boot/dts/ti/k3-am654-idk.dtso                     |    2 +
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts             |    8 +
 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi                   |    5 +-
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts        |   15 +-
 arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtso            |   53 +
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi                    |   40 +-
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi              |   17 +-
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi                  |    6 +
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts        |   16 +
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi                    |    2 +
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi              |   16 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                       |   18 +
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi                  |    5 +
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts       |   14 +
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi                   |   17 +-
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi             |   19 +-
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi                 |    3 +
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi                    |    2 +-
 arch/arm64/boot/dts/ti/k3-j742s2-evm.dts                     |   26 +
 arch/arm64/boot/dts/ti/k3-j742s2-main.dtsi                   |   45 +
 arch/arm64/boot/dts/ti/k3-j742s2.dtsi                        |   98 +
 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts                     | 1488 +---=
-
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-common.dtsi          |  148 +
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi      | 1481 ++++=
+
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi     | 2671 ++++=
+++++
 ...u-wakeup.dtsi =3D> k3-j784s4-j742s2-mcu-wakeup-common.dtsi} |   12 +-=

 ...4s4-thermal.dtsi =3D> k3-j784s4-j742s2-thermal-common.dtsi} |    0
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi                   | 2847 +---=
------
 arch/arm64/boot/dts/ti/k3-j784s4.dtsi                        |  133 +-
 62 files changed, 6066 insertions(+), 4463 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-1-4-ghz=
-opp.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dt=
s
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-j742s2-main.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j742s2.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-common.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dt=
si
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.d=
tsi
 rename arch/arm64/boot/dts/ti/{k3-j784s4-mcu-wakeup.dtsi =3D> k3-j784s4-=
j742s2-mcu-wakeup-common.dtsi} (99%)
 rename arch/arm64/boot/dts/ti/{k3-j784s4-thermal.dtsi =3D> k3-j784s4-j74=
2s2-thermal-common.dtsi} (100%)

--=20
Regards
Vignesh

--------------sUPnlalQ0bVwG0NLg6o4u8wc--

--------------SIAwUcQ6quW1oiueQ4q6JF8H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEyRC2zAhGcGjrhiNExEYeRXyRFuMFAmcrdUgFAwAAAAAACgkQxEYeRXyRFuNB
Ewf/WESZfT+MqtlMGASNMEehnRUr+0ln6ghNHoFft8+jUTRRdct/sO9/nWh58xMvPaxCwL17KkyO
smeQpxxSqgrM8iVoUfXgtHR+yeUDnO7VUniwnTjVCtF2w+eCsignat4L3JKwGCBc0AXjbJxCv0yJ
MODl6uF/tFA8wuoW2PHsJwYN34tSA8El6CieUMJtyazZ1ekecibSOVa9wbxmy5McuyzHYTbP5PqP
T8Q0WK+xmzupLp0bCvnvWbsOoFglTYRdy+4vasutyafH0uVlWH0Pieh7yum/hl9+IW6h0bCqs7Db
ZeeEBlW0sr1/llwmQdFsZZ2GYDJ/34u9xdtvBNYUKQ==
=qi1u
-----END PGP SIGNATURE-----

--------------SIAwUcQ6quW1oiueQ4q6JF8H--

