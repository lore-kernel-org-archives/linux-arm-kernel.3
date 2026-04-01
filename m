Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C07B1076387
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:CC:To:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ke0Czr+9JwECKr26r+t4hBxTTGmkR++JdoyMiqb6rNk=; b=xcpHDmtGoUIlmJkmLLQNX5ewxQ
	C4A87f0UlHlGy1+608wyhUBMWob8vYVRsU5bIpA/FLVqKhg+LBnrCLncf6zemc4r7qVm4w6b1aSsZ
	+4UvMUVflIyidtj6xv/7g/rd4Q80NS/VLZeS3yvC7/UfuzbcDS8WNME+ywh6XXv1ZUoJlj/zT6gR0
	G52voOwWL6kSDFz8c3x4Ws/wFS5HpiXQMaSU416J/xJcRAWwQSPVL3yULNWCVQWFYn0PhwHhDucA2
	kPmwYzKCEXAFFhnozBTWJRYrnOCb3Yzx5guOYzwNcqN5mTQaU+TBPsqQmatssVPMkvELarodfmL5r
	EfvgVgzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7z90-0000000FpLp-1jGb;
	Wed, 01 Apr 2026 17:14:18 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7z8x-0000000FpLG-0Qj7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 17:14:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utiNJ8IxCIZD3h3Z39kGcF6pOkMRts3+uQ/JwWuy/s0bKrJP5eo40sQB7TT3EY3YVbSxbxqsXWrB5wqYxZYBMutl2ZmRlSQmP0VqN3F5UeVqKIUoORnV5LIk4olOa5nnxg65P16U9HTM1m2KT1bHrBFXZcTbmp/l+jdIMn2Mr+IE2ixHqOVOQcFFFL3lRY/WfujQQWLw4VIV3MUnd1Lct1y5ArsveLes1gQeMeZBcF4FnE4ZfCUp2DEob8T3FgpMzsUwMCkDEA11N/v/6LuaETxu8vkV0e/iphkWMCqdeUT8bt2MngYW1HgNMhGs5YaoNgYQzYQpuz2xhoGB/Osdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ke0Czr+9JwECKr26r+t4hBxTTGmkR++JdoyMiqb6rNk=;
 b=JdLow0LdCE5FxCn00kJ0Q5QRsAE4hWdGh1fL/uBxaxARTzbzMcMayPO5rJssTPGOHRu69OzShjuz8HkXw55yx2SPfpYzTnjKKOrXlAtG9FbQ1biE/giHmHVZ5qEBAAzRW1WaOmersapnlTSx/yxiKi1LEgpMLmz6KBlWI6w8/koBYiD1t4PHPLFt6MiUaly3Zv9bI5eYaPnk5OYQe+2R5nyYgjh0hwDS9fMJM2qWiWtZpmACsV2j3b25BvkiYZWaBYLonRDt+pKGnIWJiRDmbzaQ79GsM8qUEIC2UkB5bGiLNTDCvHuiTIIU/Rx1chwUCQngx3k0mhcnYp2UVjAb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ke0Czr+9JwECKr26r+t4hBxTTGmkR++JdoyMiqb6rNk=;
 b=d0CU/3YXH7Km5y+ByPlipwZ4exnD/6mLXI3NjUwdPoCp5Bfzh4lRnA550ETn/F/4R+CyQKLkMDrJfNPsxFVN0romZtvufU/qF1R4yQ1oZpbanU0AW4+SOUJN+t4kvTNT4v8PjrixLwtq7MmMyE8Xc1Jt2Cm3ZakR747FjR1F4aI=
Received: from MN2PR01CA0025.prod.exchangelabs.com (2603:10b6:208:10c::38) by
 MN0PR10MB5912.namprd10.prod.outlook.com (2603:10b6:208:3cc::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.18; Wed, 1 Apr 2026 17:14:07 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:10c:cafe::28) by MN2PR01CA0025.outlook.office365.com
 (2603:10b6:208:10c::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 17:14:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 17:14:07 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 12:14:06 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 12:14:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 12:14:06 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 631HE3b5475624;
	Wed, 1 Apr 2026 12:14:04 -0500
Message-ID: <e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com>
Date: Wed, 1 Apr 2026 22:44:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Tero Kristo <kristo@kernel.org>, "Nishanth
 Menon" <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL 1/2] arm64: dts: ti: K3 updates for v7.1
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------T8uAc3ICRv90EsD0lIaStzoB"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|MN0PR10MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 8498dd94-3a5e-4d96-5eb7-08de9012155a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: +Z1f0RLBZJFD6vai1FHLGQ1fDRomO0kOPzzvkhrrRtmSo+NCfmnc3I3Specj9sZ8wzUs4twIV7oOdfTO50GStczMhI9VSkmlU2qZGZIHWkgLZrbaBtH6iUf8viECZiYrUx5vsajhxiD4twoJjR22rnqBHey/90SKVykdGWWxhleAOHV+RRrAlz3cAMp1dfwn7qy0VRh8FIXB7ASi28Hk5o3KqJyscnkEaqLQtdeJrWExjKO7VXOusKDL7SpkYqd9Cq5/G4CfNz1UC/vBDm/GxjpAbWyh1FlKr8pQOu3XzFTVm7Sf/HNPG1xxeA8L9UdpfF8K8mz+XMUqkl/6PjJEHiLOvcktmFwt87LtiVPAArbCQRpYasJ3RrCuSQjrbAyoB4MFWeaILEwCfAGaZ+4VaBMR4qvt+OuYeSkbk+Ii8KsXcoRNGuL/H7ShtA9djWVhQu0AUQivqi5rN+yaxrme8ejh5+9rt+u2ens7TmEafCcqv7EAqF0F/ldosBLfVzJ/I8NrcNC/PgijOc/AsRwrLpk1Yi9OPJCtaR+u+Fx1v9E2GTXuRcqGcRUK49MIq3uB5xVr8xnIjSoK9jmRzeWQb3SFuwRcn/L6W+j/9lIvPp97dADNvt0BmVnihwAUWokDZ1K7ZbVSYO40SwjTY4jOfA8OUtArc3FDRy9NFjroAY2Ml3XK8r5caZyGlS9EfTA++8YspsA6B49Gs6McRodRCtRgbHcGdQCYjFbWnz7Hk0BeEbDQqq1F3PQt8rdrxfAENxUQl/wYh3kJHXmYTbpVJg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DznccOXUVfxFxc+F6OE4r96tz5FMb2Dl4DMl37KAPOuSgoT4g3Ii/+diuENOjxLe5sQXlKOrWrK7+6+YP9gRgiz91tNw1y1YphVIbQw9uJsQbOuKgLVhZTEmjAeMHZcJl9HKhUJQJsFvZyAWqfqjyAb00QtJx//a9njj2RTwAyYw1rTpMw7l1tXHloGfKqAh7x1xdungdONEpF78RmNd5a5/3sfJXfloBloAlioIZtE5dCr1HTQyRXdOB6TVIitM3w+V/ajEL5SBOPajXCQcS45RtkImCP0le7Z5MZzCgk1GX3wKOFcfRG/wai6d+cX17vE4NJJGCJc5M/1gtKU2KenicI26HFUpg1rqxsJkdOehuM3atQacq3Mw/0ViBLrNAZvL/iTJ0lBoItZC+tZxIrKaBF8ST793f/lCQCPdbDQvd5pBxTXAM9dBbtUyIca4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 17:14:07.3971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8498dd94-3a5e-4d96-5eb7-08de9012155a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_101415_274622_0FC0C77C 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

--------------T8uAc3ICRv90EsD0lIaStzoB
Content-Type: multipart/mixed; boundary="------------oAW5J7hdI1PCiXsPU00w0Ax0";
 protected-headers="v1"
From: Vignesh Raghavendra <vigneshr@ti.com>
To: SoC <soc@kernel.org>, arm@kernel.org
Cc: SoC list <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <e724f95d-09d0-4ede-9ed4-0ce782d81058@ti.com>
Subject: [GIT PULL 1/2] arm64: dts: ti: K3 updates for v7.1

--------------oAW5J7hdI1PCiXsPU00w0Ax0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi ARM SoC maintainers

Please pull DT updates for K3 Platforms for v7.1.
Note there is a patch touching embedded-controller/kontron,sl28cpld.yaml =
as it is part of=20
series that removes of Kontron SMARC-sAM67 board support.


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-dt-for-v7.1

for you to fetch changes up to 47c806de9e9cf171d197f2f0df86df7f2bd1aa56:

  arm64: dts: ti: k3-pinctrl: sort shift values numerically (2026-03-27 1=
9:55:06 +0530)

----------------------------------------------------------------
TI K3 device tree updates for v7.1

Generic Fixes/Cleanups:
- k3-pinctrl: Cleanup alignment and reorder macros
- ti,min-output-impedance addition to all K3 board DT files

SoC Specific Features and Fixes:
AM62L:
- Add RNG node
- Support cpufreq scaling

J721S2:
- Make MAIN domain system control bus a simple-bus
- Add second DSI node

J722S:
- Add main_i2c4 device node

J7200:
- Make MAIN domain system control bus a simple-bus

Board Specific Features and Fixes:
AM642 EVM:
- Add ICSSG0 overlay for dual EMAC support

AM62:
- LP-SK: Enable internal pulls for MMC0 data pins
- SK: Enable Main UART wakeup
- phycore-som: Add 128MiB of global CMA
- Verdin: Add Zinnia board support and misc cleanup

AM62A7-SK:
- Enable Main UART wakeup
- Fix pin name in comment from M19 to N22

AM62D2 EVM:
- Enable Main UART wakeup and set wakeup-source system-states

AM62L3 EVM:
- Disable MMC1 internal pulls on data pins
- Enable Main UART wakeup and enable wkup_uart0 pins/target node

AM62P:
- SK: Disable MMC1 internal pulls on data pins and enable Main UART
  wakeup
- Verdin: Add Zinnia support and misc cleanup

AM68 PHYBoard:
- Add DSI->LVDS bridge, LVDS-Display overlay and PEB-AV-15 overlay

AM69 Aquila:
- Fix DP regulator enable GPIO

J721S2 CPB:
- Add QSPI flash partition details

Removal of SMARC-sAM67 board:
- Kontron SMARC-sAM67 board support along with all bindings
  are dropped as board is no longer planned for production

----------------------------------------------------------------
Andrew Davis (2):
      arm64: dts: ti: k3-j7200: Make MAIN domain system control bus a sim=
ple-bus
      arm64: dts: ti: k3-j721s2: Make MAIN domain system control bus a si=
mple-bus

Aniket Limaye (1):
      arm64: dts: ti: k3-j722s: Add main_i2c4 device node

Anurag Dutta (1):
      arm64: dts: ti: k3-j721s2-common-proc-board: Add QSPI flash partiti=
on details

Dhruva Gole (1):
      arm64: dts: ti: k3-am62l: support cpufreq scaling

Dominik Haller (5):
      arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
      arm64: dts: ti: k3-am68-phycore-som: Add DSI->LVDS bridge
      arm64: dts: ti: k3-am68-phyboard-izar: Add LVDS-Display
      arm64: dts: ti: k3-j721s2-main: Add DSI1
      arm64: dts: ti: k3-am68-phyboard-izar: Add PEB-AV-15 overlay

Francesco Dolcini (8):
      arm64: dts: ti: am62-verdin: Enable pullup for eMMC data pins
      dt-bindings: arm: ti: Add verdin am62/am62p zinnia board
      arm64: dts: ti: k3-am62-verdin: Fix SPI_1 GPIO CS pinctrl label
      arm64: dts: ti: k3-am62-verdin: Split UART_2 pinctrl group
      arm64: dts: ti: k3-am62-verdin: Add Zinnia
      arm64: dts: ti: k3-am62p-verdin: Split UART_2 pinctrl group
      arm64: dts: ti: k3-am62p-verdin: Add SPI_1_CS as GPIO
      arm64: dts: ti: k3-am62p-verdin: Add Zinnia

Franz Schnyder (2):
      arm64: dts: ti: k3-am69-aquila-dev: Fix DP regulator enable GPIO
      arm64: dts: ti: k3-am69-aquila-clover: Fix DP regulator enable GPIO=


Judith Mendez (3):
      arm64: dts: ti: k3-am62p5-sk: Disable MMC1 internal pulls on data p=
ins
      arm64: dts: ti: k3-am62l3-evm: Disable MMC1 internal pulls on data =
pins
      arm64: dts: ti: k3-am62-lp-sk: Enable internal pulls for MMC0 data =
pins

Kendall Willis (10):
      arm64: dts: ti: k3-am62d2-evm: Set wakeup-source system-states
      arm64: dts: ti: k3-am62l: include WKUP_UART0 in wakeup peripheral w=
indow
      arm64: boot: dts: ti: k3-am62l-wakeup: create label for wkup_uart0 =
target-module
      arm64: boot: dts: ti: k3-am62l3-evm: define wkup_uart0 pins
      arm64: boot: dts: ti: k3-am62l3-evm: enable wkup_uart0_target node
      arm64: dts: ti: k3-am62x-sk-common: Enable Main UART wakeup
      arm64: dts: ti: k3-am62a7-sk: Enable Main UART wakeup
      arm64: dts: ti: k3-am62p5-sk: Enable Main UART wakeup
      arm64: dts: ti: k3-am62l3-evm: Enable Main UART wakeup
      arm64: dts: ti: k3-am62d2-evm: Enable Main UART wakeup

Meghana Malladi (1):
      arm64: dts: ti: k3-am642-evm: Add ICSSG0 overlay for dual EMAC supp=
ort

Michael Walle (3):
      arm64: dts: ti: remove the Kontron SMARC-sAM67
      dt-bindings: mfd: sl28cpld: Drop sa67mcu compatible
      dt-bindings: arm: ti: Drop Kontron SMARC-sAM67 module

Rasmus Villemoes (2):
      arm64: dts: ti: k3-pinctrl: consistently use tabs for alignment
      arm64: dts: ti: k3-pinctrl: sort shift values numerically

Shiva Tripathi (1):
      arm64: dts: ti: k3-am62l-main: Add RNG node

Siddharth Vadapalli (5):
      arm64: dts: ti: k3-am642-{evm,sk}: add ti,min-output-impedance
      arm64: dts: ti: k3-am654-base-board: add ti,min-output-impedance
      arm64: dts: ti: k3-j7200-common-proc-board: add ti,min-output-imped=
ance
      arm64: dts: ti: k3-j721e-common-proc-board: add ti,min-output-imped=
ance
      arm64: dts: ti: k3-am62a7-sk: Fix pin name in comment from M19 to N=
22

Thomas Richard (TI) (1):
      arm64: dts: ti: k3-j721s2: Use ti,j7200-padconf compatible

Wadim Egorov (1):
      arm64: dts: ti: k3-am62-phycore-som: Add 128MiB of global CMA

 Documentation/devicetree/bindings/arm/ti/k3.yaml             |    5 +-
 .../bindings/embedded-controller/kontron,sl28cpld.yaml       |    7 +-
 arch/arm64/boot/dts/ti/Makefile                              |   27 +-
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts                     |   14 +-
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi              |    7 +
 arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi            |  493 ++++=
+
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi                   |   42 +-
 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-zinnia.dts    |   22 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-zinnia.dts       |   22 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts                      |   15 +-
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts                     |   82 +-
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi                    |    7 +
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi                  |    7 +-
 arch/arm64/boot/dts/ti/k3-am62l.dtsi                         |    5 +-
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts                     |   32 +-
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi                        |   47 +
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi       |   13 +-
 arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi           |  469 ++++=

 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi                  |   29 +-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                      |   19 +-
 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dts   |   22 +
 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dts      |   22 +
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi               |   13 +-
 arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtso              |  168 ++
 arch/arm64/boot/dts/ti/k3-am642-evm.dts                      |    1 +
 arch/arm64/boot/dts/ti/k3-am642-sk.dts                       |    2 +
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts               |    1 +
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso       |  146 --
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts        | 1091 ----=
------
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso       |   26 -
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso      |   61 -
 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso |   31 -
 .../boot/dts/ti/k3-am68-phyboard-izar-lvds-ph128800t006.dtso |  125 ++
 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-15.dtso  |  191 ++
 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts             |   17 +
 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi              |   17 +
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts             |    2 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts                |    2 +-
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts        |    1 +
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi                    |    5 +-
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts        |    1 +
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts       |   42 +
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi                   |   50 +-
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi             |   12 +-
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi                    |   13 +
 arch/arm64/boot/dts/ti/k3-j722s.dtsi                         |    3 +-
 arch/arm64/boot/dts/ti/k3-pinctrl.h                          |   82 +-
 47 files changed, 2030 insertions(+), 1481 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-zinnia=
=2Edts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-zinnia.dt=
s
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinni=
a.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.d=
ts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dts=
o
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts=

 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dts=
o
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dt=
so
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv82=
63.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-lvds-ph1=
28800t006.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar-peb-av-1=
5.dtso

--------------oAW5J7hdI1PCiXsPU00w0Ax0--

--------------T8uAc3ICRv90EsD0lIaStzoB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRQBrqaOmQ441h4YbUDQj8NV+8d1wUCac1SWwUDAAAAAAAKCRADQj8NV+8d15Az
AP9/E7nWmBzLcgEvzyFtprNTh2HJDtB5xe34vIA7o0DKLwEA0S/GKbQ2fVCqw7MwGw66YiWmBI4Q
x9cV1/BYoVxw5AQ=
=F0Sy
-----END PGP SIGNATURE-----

--------------T8uAc3ICRv90EsD0lIaStzoB--

