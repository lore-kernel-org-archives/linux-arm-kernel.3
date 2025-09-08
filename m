Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB813CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MQC27QXssgsLAUjA7NX5koArz0ziy85Qn7wjBTCydeM=; b=Peme0rot9Sp9/VVqpKDjnLGRYA
	x+u2i5JTiv0OZJ466f2Pm36div96J4p6KMSfpPcY2c44f12Fcvm7LFH9L8tkTRQqIrkxf/YwGfG9L
	Ftp5PMWUSSxt6hleUkemicz4RhyVz1ufTiVQkMw8X4nlFDFcmhFm60gssErSZcXvZV3/fWcGKfO3J
	iz8bSgFlzHstiylyk1wLiBMP4ZgQeOA10RcAsXI6z4yIOMRqGmWIKZ5hnuq2RzgVBe04XmC4gwcMm
	F22APWQ8AIXmbmr43Hzl+lA+KNV/fImuSFwYd4XycHBEaW8cIe2XpLJ/bx1cXGh7Xnah2kBFokCyz
	Nx/CGvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfPB-000000015lg-48PJ;
	Mon, 08 Sep 2025 17:11:49 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcrc-000000006f3-1Hx2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:29:02 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588ESpxT071220;
	Mon, 8 Sep 2025 09:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757341731;
	bh=MQC27QXssgsLAUjA7NX5koArz0ziy85Qn7wjBTCydeM=;
	h=From:To:CC:Subject:Date;
	b=feYE1NoZ0CQ1h45PTzWSPoAVNHZ+fR7kO2izvX4u2uQWdERI642lX0exvcSRdVB/y
	 ru/ophDL7WDFit3UySVryYRBWHcc8seFFq+ZEz4Zn9zW5O5VGk5xVHgz3YB0wrxS4U
	 7Hoxhe0NZ/P9NAIl6VHZlKPKXw/xjLPipIFvv/2w=
Received: from DFLE20.ent.ti.com (dfle20.ent.ti.com [10.64.6.57])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588ESp9q3832927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Sep 2025 09:28:51 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Sep
 2025 09:28:51 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Mon, 8 Sep
 2025 09:28:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 09:28:51 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ESecc1037553;
	Mon, 8 Sep 2025 09:28:41 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <d-gole@ti.com>, <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Jo_o Paulo Gon_alves
	<joao.goncalves@toradex.com>,
        Parth Pancholi <parth.pancholi@toradex.com>,
        Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        Matthias Schiffer
	<matthias.schiffer@ew.tq-group.com>,
        Logan Bristol
	<logan.bristol@utexas.edu>,
        Josua Mayer <josua@solid-run.com>, John Ma
	<jma@phytec.com>,
        Nathan Morrisson <nmorrisson@phytec.com>,
        Garrett Giordano
	<ggiordano@phytec.com>,
        Matt McKee <mmckee@phytec.com>, Wadim Egorov
	<w.egorov@phytec.de>,
        Andrejs Cainikovs <andrejs.cainikovs@toradex.com>,
        "Max
 Krummenacher" <max.krummenacher@toradex.com>,
        Stefan Eichenberger
	<stefan.eichenberger@toradex.com>,
        Hiago De Franco
	<hiago.franco@toradex.com>,
        Diogo Ivo <diogo.ivo@siemens.com>,
        Li Hua Qian
	<huaqian.li@siemens.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Baocheng Su
	<baocheng.su@siemens.com>,
        Benedikt Niedermayr
	<benedikt.niedermayr@siemens.com>
Subject: [PATCH v4 00/34] Refactor TI IPC DT configs into dtsi
Date: Mon, 8 Sep 2025 19:57:52 +0530
Message-ID: <20250908142826.1828676-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_072900_444974_9877640C 
X-CRM114-Status: GOOD (  19.90  )
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

The TI K3 SoCs have multiple programmable remote processors like
R5F, M4F, C6x/C7x etc. The TI SDKs for these SoCs offer sample firmware
which could be run on these cores to demonstrate an "echo" IPC test.
Those firmware require certain memory carveouts to be reserved from
system memory, timers to be reserved, and certain mailbox
configurations for interrupt based messaging. These configurations
could be different for a different firmware.

Refactor these firmware dependent configurations from board level DTS
into a dtsi for now. This dtsi for TI IPC firmware is board-independent
and can be applied to all boards from the same SoC Family. This gets
rid of code duplication (>50%) and allows more freedom for users
developing custom firmware (or no firmware) to utilize system resources
better; easily by swapping out this dtsi. To maintain backward
compatibility, the dtsi is included in all existing boards.

DTSI vs Overlay:
1. I chose DTSI over overlay as both the ways required including the
refactored file in existing board-level files to maintain backward
compatibility, so didn't see the advantage of using overlays here.
2. If we do down the overlay path, existing board-level file names have
to be changed to indicate they are without the IPC support; so that
they can be combined with the overlay to generate the same-named DTBs.
For example:
k3-am69-sk.dtb := k3-am69-sk-sans-ipc.dtb k3-j784s4-ti-ipc-firmware.dtbo
			     ~~~~~~~~

I am not sure if this renaming of files is ideal?

v4: Changelog:
* Francesco Dolcini:
1. Re-named reserved memory carveout names to memory@addr for all TI
K3 based boards. (New patch -> #13/34)

* General:
1. Carried R/B tags from Dhruva.

Link to v3:
https://lore.kernel.org/all/20250905051846.1189612-1-b-padhi@ti.com/

v3: Changelog:
* Francesco Dolcini:
1. Re-named reserved memory carveout names to memory@addr for AM62P, AM62
boards.

* General:
1. Carried A/B, R/B, T/B tags from Andrew, Wadim, Judith, Hari.

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-1-b-padhi@ti.com/

v2: Changelog:
* Andrew:
1. Re-ordered patches in the following flow:
	Patches 01-11: Enables remoteprocs/mailboxes at board level.
	Patches 12-20: Adds missing configs for TI IPC firmware.
	Patches 21-23: Some fixes and cleanups before refactoring.
	Patches 24-34: Actual refactoring of FW nodes into dtsi.
2. Split out [PATCH 06/33] into [PATCH v2 13/33] and [PATCH v2 22/33].
3. Dropped "[PATCH 33/33] Switch MCU R5F cluster to Split-mode" in v2.

* Francesco Dolcini:
4. Added new-line before sub-nodes.

* General:
5. Carried T/B tags from Hiago De Franco.

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-1-b-padhi@ti.com/

Testing Done:
1. Tested Boot across all TI K3 EVM/SK boards.
2. Tested IPC on all TI K3 J7* EVM/SK boards (& AM62x SK).
3. Tested that each patch in the series generates no new warnings/errors.
4. HELP needed: Boot/IPC test on vendor boards utilizing TI K3 SoCs. 

Note for vendors:
1. This series streamlines all boards(external vendors included) to use the
TI IPC DTSI config. In the process, several new nodes related to remote
processors have been added/enabled in the final DTS. Need vendors help in
performing a sanity boot & IPC functionality test with the changes included
(More info in indivdual patch)
2. If you wish to not include all of the TI IPC DTSI configs and leave the
board files as it is currently, just let me know so and I will drop those
patches in the next revision.
Cc: Robert Nelson <robertcnelson@gmail.com>
Cc: Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
Cc: Parth Pancholi <parth.pancholi@toradex.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Logan Bristol <logan.bristol@utexas.edu>
Cc: Josua Mayer <josua@solid-run.com>
Cc: John Ma <jma@phytec.com>
Cc: Nathan Morrisson <nmorrisson@phytec.com>
Cc: Garrett Giordano <ggiordano@phytec.com>
Cc: Matt McKee <mmckee@phytec.com>
Cc: Wadim Egorov <w.egorov@phytec.de>
Cc: Andrejs Cainikovs <andrejs.cainikovs@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Cc: Diogo Ivo <diogo.ivo@siemens.com>
Cc: Li Hua Qian <huaqian.li@siemens.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Baocheng Su <baocheng.su@siemens.com>
Cc: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

Thanks,
Beleswar

Beleswar Padhi (34):
  arm64: dts: ti: k3-j7200: Enable R5F remote processors at board level
  arm64: dts: ti: k3-j721e: Enable remote processors at board level
  arm64: dts: ti: k3-j721s2: Enable remote processors at board level
  arm64: dts: ti: k3-j784s4-j742s2: Enable remote processors at board
    level
  arm64: dts: ti: k3-am62p-j722s: Enable remote processors at board
    level
  arm64: dts: ti: k3-am62: Enable remote processors at board level
  arm64: dts: ti: k3-am62a: Enable remote processors at board level
  arm64: dts: ti: k3-am64: Enable remote processors at board level
  arm64: dts: ti: k3-am65: Enable remote processors at board level
  arm64: dts: ti: k3-am62: Enable Mailbox nodes at the board level
  arm64: dts: ti: k3-am62a: Enable Mailbox nodes at the board level
  arm64: dts: ti: k3-am6*-boards: Add label to reserved-memory node
  arm64: dts: ti: k3: Rename rproc reserved-mem nodes to 'memory@addr'
  arm64: dts: ti: k3-j721e-beagleboneai64: Add missing cfg for TI IPC FW
  arm64: dts: ti: k3-am62p-verdin: Add missing cfg for TI IPC Firmware
  arm64: dts: ti: k3-am62-verdin: Add missing cfg for TI IPC Firmware
  arm64: dts: ti: k3-am62-pocketbeagle2: Add missing cfg for TI IPC
    Firmware
  arm64: dts: ti: k3-am642-sr-som: Add missing cfg for TI IPC Firmware
  arm64: dts: ti: k3-am64-phycore-som: Add missing cfg for TI IPC
    Firmware
  arm64: dts: ti: k3-am642-tqma64xxl: Add missing cfg for TI IPC
    Firmware
  Revert "arm64: dts: ti: k3-j721e-sk: Fix reversed C6x carveout
    locations"
  Revert "arm64: dts: ti: k3-j721e-beagleboneai64: Fix reversed C6x
    carveout locations"
  arm64: dts: ti: k3-j721e-beagleboneai64: Switch MAIN R5F clusters to
    Split-mode
  arm64: dts: ti: k3-j7200-ti-ipc-firmware: Refactor IPC cfg into new
    dtsi
  arm64: dts: ti: k3-j721e-ti-ipc-firmware: Refactor IPC cfg into new
    dtsi
  arm64: dts: ti: k3-j721s2-ti-ipc-firmware: Refactor IPC cfg into new
    dtsi
  arm64: dts: ti: k3-j784s4-j742s2-ti-ipc-firmware-common: Refactor IPC
    cfg into new dtsi
  arm64: dts: ti: k3-j784s4-ti-ipc-firmware: Refactor IPC cfg into new
    dtsi
  arm64: dts: ti: k3-j722s-ti-ipc-firmware: Refactor IPC cfg into new
    dtsi
  arm64: dts: ti: k3-am62p-ti-ipc-firmware: Refactor IPC cfg into new
    dtsi
  arm64: dts: ti: k3-am62-ti-ipc-firmware: Refactor IPC cfg into new
    dtsi
  arm64: dts: ti: k3-am62a-ti-ipc-firmware: Refactor IPC cfg into new
    dtsi
  arm64: dts: ti: k3-am64-ti-ipc-firmware: Refactor IPC cfg into new
    dtsi
  arm64: dts: ti: k3-am65-ti-ipc-firmware: Refactor IPC cfg into new
    dtsi

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi      |   1 +
 .../boot/dts/ti/k3-am62-phycore-som.dtsi      |  49 +--
 .../boot/dts/ti/k3-am62-pocketbeagle2.dts     |  36 +-
 .../boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi  |  52 +++
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi    |  19 +-
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    |   1 +
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |   2 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     |   4 +
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi      |   1 +
 .../boot/dts/ti/k3-am62a-phycore-som.dtsi     |  94 +----
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi |  98 +++++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |   1 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       |  96 +----
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      |  83 +----
 .../dts/ti/k3-am62p-j722s-common-mcu.dtsi     |   1 +
 .../dts/ti/k3-am62p-j722s-common-wakeup.dtsi  |   1 +
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi |  60 +++
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi   |  30 +-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  58 +--
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  51 +--
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi      |   6 +
 .../boot/dts/ti/k3-am64-phycore-som.dtsi      | 128 +------
 .../boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi  | 162 ++++++++
 arch/arm64/boot/dts/ti/k3-am642-evm.dts       | 150 +-------
 arch/arm64/boot/dts/ti/k3-am642-sk.dts        | 150 +-------
 arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi   |  96 +----
 .../arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi | 111 +-----
 .../boot/dts/ti/k3-am65-iot2050-common.dtsi   |  62 +--
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi       |   3 +
 .../boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi  |  64 ++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |  58 +--
 .../arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 156 +-------
 .../boot/dts/ti/k3-am68-phycore-som.dtsi      | 239 +-----------
 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi    | 233 +-----------
 arch/arm64/boot/dts/ti/k3-am69-sk.dts         | 352 +-----------------
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi     |   3 +
 .../boot/dts/ti/k3-j7200-mcu-wakeup.dtsi      |   3 +
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi   | 119 +-----
 .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi | 130 +++++++
 .../boot/dts/ti/k3-j721e-beagleboneai64.dts   | 233 +-----------
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |   6 +
 .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      |   3 +
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts        | 270 +-------------
 arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi   | 270 +-------------
 .../boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi | 288 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |   6 +
 .../boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi     |   3 +
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  | 235 +-----------
 .../dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     | 253 +++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts       | 158 +-------
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     |   1 +
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 163 ++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts      |  26 +-
 .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 341 +----------------
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |   9 +
 .../k3-j784s4-j742s2-mcu-wakeup-common.dtsi   |   3 +
 ...-j784s4-j742s2-ti-ipc-firmware-common.dtsi | 350 +++++++++++++++++
 .../dts/ti/k3-j784s4-ti-ipc-firmware.dtsi     |  35 ++
 58 files changed, 1848 insertions(+), 3768 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi

-- 
2.34.1


