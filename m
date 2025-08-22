Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2A4CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZBbfcyXC4cqyqULZhYv+0h8WkT0nh2HJXjm+YswEn8=; b=DAC8cYxvEiSL7evRBP3PDmyrpg
	pABy1zNw13C13T4RX7U4Xf+mt/VERWesIsoiqcAey3KNsWTFL0Z7EkzpQfEQptXDrzzSthdg9H1/T
	eHwjcINycmkVxFUThOe9FMg1BI7zgIq9wshE+Z3dda2GBOC2bm/ZZhejFolzBBx68dci8CoTbZHJd
	D4PgdB5xDojRwaxqHPmcTGcKzqGtx1JTWBTYL58ZTubVN0IkZnDJFS3WvEkA4oeLM/vdTz6n7YXaY
	6P9QxP63mQbTMivv0PNFs8AxyVkG0ZCE9z9CKUuNEPs2jAMO17xvcen0wgQ/mmh59hGkLhyCD8rCi
	hZZjQW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphvo-00000004CNY-3wCj;
	Sat, 23 Aug 2025 06:40:52 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV8W-00000003DCN-1TiO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 17:01:12 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MH0sN3762438;
	Fri, 22 Aug 2025 12:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755882054;
	bh=lZBbfcyXC4cqyqULZhYv+0h8WkT0nh2HJXjm+YswEn8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HHLdqRlcQeoeA2uPsbP6sqwIolmK9uaM0O5/6x0YwFKEgIykA7vcKb0W9BJzDJFoA
	 2OPhasSrqOLiAkuz8dK9VCv6iTIkpUAJbbGoGdgYslKTnbfBPQ2eUJC6Tvzt2Vjmn9
	 G9wXi9yZgUPDr8eFlHgScARWB2I56KG0EEarRFn4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MH0r9X3050466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 12:00:54 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 12:00:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 12:00:53 -0500
Received: from [10.249.139.51] ([10.249.139.51])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MH0ggc3851976;
	Fri, 22 Aug 2025 12:00:43 -0500
Message-ID: <d30d2a07-df76-402f-91b5-2707eed7b9fb@ti.com>
Date: Fri, 22 Aug 2025 22:30:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] Refactor TI IPC DT configs into dtsi
To: Wadim Egorov <w.egorov@phytec.de>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Robert Nelson
	<robertcnelson@gmail.com>,
        Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>,
        Parth Pancholi <parth.pancholi@toradex.com>,
        Emanuele Ghidoli
	<emanuele.ghidoli@toradex.com>,
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
        Matt McKee <mmckee@phytec.com>,
        Andrejs Cainikovs
	<andrejs.cainikovs@toradex.com>,
        Max Krummenacher
	<max.krummenacher@toradex.com>,
        Stefan Eichenberger
	<stefan.eichenberger@toradex.com>,
        Hiago De Franco <hiago.franco@toradex.com>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <2c3d31f0-e690-4e67-acfa-931fca47dfeb@phytec.de>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <2c3d31f0-e690-4e67-acfa-931fca47dfeb@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_100108_491231_86DD0075 
X-CRM114-Status: GOOD (  29.67  )
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

Hi Wadim,

On 8/15/2025 11:19 AM, Wadim Egorov wrote:
> Hi Beleswar,
>
> On 8/15/25 1:38 AM, Beleswar Padhi wrote:
>> The TI K3 SoCs have multiple programmable remote processors like
>> R5F, M4F, C6x/C7x etc. The TI SDKs for these SoCs offer sample firmware
>> which could be run on these cores to demonstrate an "echo" IPC test.
>> Those firmware require certain memory carveouts to be reserved from
>> system memory, timers to be reserved, and certain mailbox
>> configurations for interrupt based messaging. These configurations
>> could be different for a different firmware.
>>
>> Refactor these firmware dependent configurations from board level DTS
>> into a dtsi for now. This dtsi for TI IPC firmware is board-independent
>> and can be applied to all boards from the same SoC Family. This gets
>> rid of code duplication (>50%) and allows more freedom for users
>> developing custom firmware (or no firmware) to utilize system resources
>> better; easily by swapping out this dtsi. To maintain backward
>> compatibility, the dtsi is included in all existing boards.
>
> I remember I asked myself the same question on how to represent the 
> relation between used FW and memory carveouts+others when adding our 
> first K3 board.
>
> This change comes quite late so I am wondering if there is any other 
> motivation besides code reduction / more freedom for custom FW behind it?


Sorry for the delay in response,
The main motivation is to provide more freedom for custom firmwares.
Besides, we were observing some bugs where peripherals like mailbox,
rprocs are enabled at the SoC level dtsi without the proper IRQ/carveout
assignment respectively. This was failing the device probe and throwing
out errors. So we put up this cleanup series to make things more
maintainable & modular.

>
>
>>
>> DTSI vs Overlay:
>> 1. I chose DTSI over overlay as both the ways required including the
>> refactored file in existing board-level files to maintain backward
>> compatibility, so didn't see the advantage of using overlays here.
>> 2. If we do down the overlay path, existing board-level file names have
>> to be changed to indicate they are without the IPC support; so that
>> they can be combined with the overlay to generate the same-named DTBs.
>> For example:
>> k3-am69-sk.dtb := k3-am69-sk-sans-ipc.dtb k3-j784s4-ti-ipc-firmware.dtbo
>>                  ~~~~~~~~
>
> While it's a good idea to keep backward compatibility for older 
> devices, have you considered using overlays for new/upcoming devices?


Yes, and this is the first step towards it. IMO, future devices should put
everything firmware related as an overlay. This allows the same base
board to work with multiple firmwares, even at runtime!

Thanks,
Beleswar

>
> Regards,
> Wadim
>
>>
>> I am not sure if this renaming of files is ideal?
>>
>> Testing Done:
>> 1. Tested Boot across all TI K3 EVM/SK boards.
>> 2. Tested IPC on all TI K3 J7* EVM/SK boards (& AM62x SK).
>> 3. Tested that each patch in the series generates no new 
>> warnings/errors.
>> 4. HELP needed: Boot/IPC test on vendor boards utilizing TI K3 SoCs.
>>
>> Note for vendors:
>> 1. This series streamlines all boards(external vendors included) to 
>> use the
>> TI IPC DTSI config. In the process, several new nodes related to remote
>> processors have been added/enabled in the final DTS. Need vendors 
>> help in
>> performing a sanity boot & IPC functionality test with the changes 
>> included
>> (More info in indivdual patch)
>> 2. If you wish to not include all of the TI IPC DTSI configs and 
>> leave the
>> board files as it is currently, just let me know so and I will drop 
>> those
>> patches in the next revision.
>> Cc: Robert Nelson <robertcnelson@gmail.com>
>> Cc: Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
>> Cc: Parth Pancholi <parth.pancholi@toradex.com>
>> Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
>> Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>> Cc: Logan Bristol <logan.bristol@utexas.edu>
>> Cc: Josua Mayer <josua@solid-run.com>
>> Cc: John Ma <jma@phytec.com>
>> Cc: Nathan Morrisson <nmorrisson@phytec.com>
>> Cc: Garrett Giordano <ggiordano@phytec.com>
>> Cc: Matt McKee <mmckee@phytec.com>
>> Cc: Wadim Egorov <w.egorov@phytec.de>
>> Cc: Andrejs Cainikovs <andrejs.cainikovs@toradex.com>
>> Cc: Max Krummenacher <max.krummenacher@toradex.com>
>> Cc: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>> Cc: Hiago De Franco <hiago.franco@toradex.com>
>>
>> Thanks,
>> Beleswar
>>
>> Beleswar Padhi (33):
>>    arm64: dts: ti: k3-j7200: Enable remote processors at board level
>>    arm64: dts: ti: k3-j7200-ti-ipc-firmware: Refactor IPC cfg into new
>>      dtsi
>>    Revert "arm64: dts: ti: k3-j721e-sk: Fix reversed C6x carveout
>>      locations"
>>    Revert "arm64: dts: ti: k3-j721e-beagleboneai64: Fix reversed C6x
>>      carveout locations"
>>    arm64: dts: ti: k3-j721e: Enable remote processors at board level
>>    arm64: dts: ti: k3-j721e-beagleboneai64: Add missing cfg for TI 
>> IPC FW
>>    arm64: dts: ti: k3-j721e-ti-ipc-firmware: Refactor IPC cfg into new
>>      dtsi
>>    arm64: dts: ti: k3-j721s2: Enable remote processors at board level
>>    arm64: dts: ti: k3-j721s2-ti-ipc-firmware: Refactor IPC cfg into new
>>      dtsi
>>    arm64: dts: ti: k3-j784s4-j742s2: Enable remote processors at board
>>      level
>>    arm64: dts: ti: k3-j784s4-j742s2-ti-ipc-firmware-common: Refactor IPC
>>      cfg into new dtsi
>>    arm64: dts: ti: k3-j784s4-ti-ipc-firmware: Refactor IPC cfg into new
>>      dtsi
>>    arm64: dts: ti: k3-am62p-j722s: Enable remote processors at board
>>      level
>>    arm64: dts: ti: k3-j722s-ti-ipc-firmware: Refactor IPC cfg into new
>>      dtsi
>>    arm64: dts: ti: k3-am6*-boards: Add label to reserved-memory node
>>    arm64: dts: ti: k3-am62p-verdin: Add missing cfg for TI IPC Firmware
>>    arm64: dts: ti: k3-am62p-ti-ipc-firmware: Refactor IPC cfg into new
>>      dtsi
>>    arm64: dts: ti: k3-am62-verdin: Add missing cfg for TI IPC Firmware
>>    arm64: dts: ti: k3-am62-pocketbeagle2: Add missing cfg for TI IPC
>>      Firmware
>>    arm64: dts: ti: k3-am62: Enable Mailbox nodes at the board level
>>    arm64: dts: ti: k3-am62: Enable remote processors at board level
>>    arm64: dts: ti: k3-am62-ti-ipc-firmware: Refactor IPC cfg into new
>>      dtsi
>>    arm64: dts: ti: k3-am62a: Enable Mailbox nodes at the board level
>>    arm64: dts: ti: k3-am62a: Enable remote processors at board level
>>    arm64: dts: ti: k3-am62a-ti-ipc-firmware: Refactor IPC cfg into new
>>      dtsi
>>    arm64: dts: ti: k3-am64: Enable remote processors at board level
>>    arm64: dts: ti: k3-am642-sr-som: Add missing cfg for TI IPC Firmware
>>    arm64: dts: ti: k3-am64-phycore-som: Add missing cfg for TI IPC
>>      Firmware
>>    arm64: dts: ti: k3-am642-tqma64xxl: Add missing cfg for TI IPC
>>      Firmware
>>    arm64: dts: ti: k3-am64-ti-ipc-firmware: Refactor IPC cfg into new
>>      dtsi
>>    arm64: dts: ti: k3-am65: Enable remote processors at board level
>>    arm64: dts: ti: k3-am65-ti-ipc-firmware: Refactor IPC cfg into new
>>      dtsi
>>    arm64: dts: ti: k3-j7*-ti-ipc-firmware: Switch MCU R5F cluster to
>>      Split-mode
>>
>>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi      |   1 +
>>   .../boot/dts/ti/k3-am62-phycore-som.dtsi      |  43 +--
>>   .../boot/dts/ti/k3-am62-pocketbeagle2.dts     |  36 +-
>>   .../boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi  |  52 +++
>>   arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi    |  31 +-
>>   arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    |   1 +
>>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi     |   4 +
>>   arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi      |   1 +
>>   .../boot/dts/ti/k3-am62a-phycore-som.dtsi     |  90 +----
>>   .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi |  98 +++++
>>   arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi   |   1 +
>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       |  92 +----
>>   arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      |  77 +---
>>   .../dts/ti/k3-am62p-j722s-common-mcu.dtsi     |   1 +
>>   .../dts/ti/k3-am62p-j722s-common-wakeup.dtsi  |   1 +
>>   .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi |  60 +++
>>   arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi   |  42 ++-
>>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       |  54 +--
>>   .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  47 +--
>>   arch/arm64/boot/dts/ti/k3-am64-main.dtsi      |   6 +
>>   .../boot/dts/ti/k3-am64-phycore-som.dtsi      | 124 +------
>>   .../boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi  | 162 ++++++++
>>   arch/arm64/boot/dts/ti/k3-am642-evm.dts       | 146 +-------
>>   arch/arm64/boot/dts/ti/k3-am642-sk.dts        | 146 +-------
>>   arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi   |  92 +----
>>   .../arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi | 107 +-----
>>   .../boot/dts/ti/k3-am65-iot2050-common.dtsi   |  58 +--
>>   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi       |   3 +
>>   .../boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi  |  64 ++++
>>   .../arm64/boot/dts/ti/k3-am654-base-board.dts |  54 +--
>>   .../arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 152 +-------
>>   .../boot/dts/ti/k3-am68-phycore-som.dtsi      | 235 +-----------
>>   arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi    | 229 +-----------
>>   arch/arm64/boot/dts/ti/k3-am69-sk.dts         | 348 +----------------
>>   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi     |   3 +
>>   .../boot/dts/ti/k3-j7200-mcu-wakeup.dtsi      |   3 +
>>   arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi   | 115 +-----
>>   .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi | 131 +++++++
>>   .../boot/dts/ti/k3-j721e-beagleboneai64.dts   | 229 +-----------
>>   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     |   6 +
>>   .../boot/dts/ti/k3-j721e-mcu-wakeup.dtsi      |   3 +
>>   arch/arm64/boot/dts/ti/k3-j721e-sk.dts        | 266 +------------
>>   arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi   | 266 +------------
>>   .../boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi | 289 ++++++++++++++
>>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |   6 +
>>   .../boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi     |   3 +
>>   arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  | 231 +-----------
>>   .../dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     | 250 +++++++++++++
>>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts       | 154 +-------
>>   arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     |   1 +
>>   .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 163 ++++++++
>>   arch/arm64/boot/dts/ti/k3-j784s4-evm.dts      |  26 +-
>>   .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 337 +----------------
>>   .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |   9 +
>>   .../k3-j784s4-j742s2-mcu-wakeup-common.dtsi   |   3 +
>>   ...-j784s4-j742s2-ti-ipc-firmware-common.dtsi | 351 ++++++++++++++++++
>>   .../dts/ti/k3-j784s4-ti-ipc-firmware.dtsi     |  34 ++
>>   57 files changed, 1820 insertions(+), 3717 deletions(-)
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
>>   create mode 100644 
>> arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
>>   create mode 100644 
>> arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi
>>   create mode 100644 arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi
>>   create mode 100644 
>> arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
>>   create mode 100644 
>> arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
>>   create mode 100644 
>> arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
>>   create mode 100644 
>> arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
>>   create mode 100644 
>> arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
>>   create mode 100644 
>> arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
>>
>

