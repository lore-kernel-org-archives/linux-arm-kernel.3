Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1094C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 03:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b8xO9FYbgEX7DXbcr1fBWcEdB44HQz3V/Hmnw70Zx/w=; b=J0WTu1dOzmGVkbPSvV/OfxbiNl
	nzxPNWC58rjxmPZMqqWlha2OMyoj8NhSJkKZhF2+KcuA2kwRru9GOF33o+1XU4zB3OyT/9McANpT6
	RjgHQTJ6gZYcJ6gMIqTozmTMsVihAAVF4T0qiwnnxn8t1Vji00rV6LBCoUPG54mZVocel4z5YTnID
	Fq2pNbvHKl4G11unPIfpz6VKmOBI7de3J5MjrbABzvyF4pJOO6YmWxsNrLp2NXh/pFi52vxSNBPpj
	JWeBSAd/qH5KpHym6xWp8wMgm83O1D3AcY/JBN/rlrIsFst+LapG2VaXLHIqUQlid9k0hoJ6rGZhm
	Jk3qLXkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOTJL-00000003LkX-3pi3;
	Mon, 09 Jun 2025 03:36:35 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOT09-00000003KFj-1gia
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 03:16:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltcST9Ff7wkbuxSRw3XE+1YNj82kizANPTLdhTtAC6Qw9IhIsyhPgbNLrC7LCYGV51ATTxm0UhUwQd7Kr7JIV2eL1scioZjXKXgErI9BFmQ6podLvgl/sXTx+3cgXXYqH36qqdPG9fGttslWLJaETfJME2myGnGUkLsNeAetEzGbuRbMPBk/dW2moZbD3eqcWe6OVt6dHx4MZKNfdh0kSrqTOVQQ4fwHhMwkWu/s/ZlznftUPrg/nG0wf+4fVcZ0zEwGXy+IOhvNfq+7p8b+rNdmT5jImNWjpo9BrJP0Aeh0/KXiI6wO1Ra/DXhGJY6dxPY7TZN/SiWRF1+r0OxXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8xO9FYbgEX7DXbcr1fBWcEdB44HQz3V/Hmnw70Zx/w=;
 b=edWmyuRK5AqYb1J4m0UsIf6m+9F8/1pDw6BV/YvFKMbNzfrTQkzyCQmo7XOcpIG93ub26QVTYQrgjJVa8q1l5+3huBYn/s61gR65SvtZgO3fLITCLxef2/mKyvjcWVlUrVM+cJWLtaIDS10cP3noGK6iRKZnR6lIInCoR8/3WNXbWeJQm3jzuCNbNtI6VmiR9hANNNEWtcMtCnmfiJjazQ/R6Y1Qcc54puj12YvPJ0p8QqK4GfE5a37b5GQUel4OJMuZCVtU0c084aJxCEZDWLWmE51Wqw5UqIaAcOSP0dGCoxGAVBLmSvPK9YmI2Kg1MRHFC+X72cHCbeQYkvk4hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0365.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:79::12)
 by KL1PR0601MB5464.apcprd06.prod.outlook.com (2603:1096:820:c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 03:16:29 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:405:79:cafe::61) by TYCP286CA0365.outlook.office365.com
 (2603:1096:405:79::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 03:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 03:16:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6B0024160CA0;
	Mon,  9 Jun 2025 11:16:27 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v9 0/9] arm64: Introduce CIX P1 (SKY1) SoC
Date: Mon,  9 Jun 2025 11:16:18 +0800
Message-Id: <20250609031627.1605851-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|KL1PR0601MB5464:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 451dd7af-20bd-4859-45c3-08dda704066e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WW26EzaRqbKBSxb4Vbrwms/mpyPWDW9nhwGsmJkIRvTcyUIih2awJalP/Asw?=
 =?us-ascii?Q?uOh2hgQEhJrdaiL3dYrmXkFc44hpxZKF+OL1Vkk2noNQ3sb3QpPqwLrxR9tm?=
 =?us-ascii?Q?dgD75DcWIec7qd22mZXclBT7SSZllndKf1owfmS+CRUnE+eSn9uHsiTxtt85?=
 =?us-ascii?Q?T1NKT/ID3AoHYKGlDM7BOhgC3nHBk7fIIM1+hbRTN54S4HaFOv7aH4WdDJtj?=
 =?us-ascii?Q?J3+VfvhuBSLIJFk32Wt2N3N20fuxQKE7M9fwdIL/rdjnxPURCdJhvKe+hCCM?=
 =?us-ascii?Q?VykWN4VInp39k1iJLwK5V4w5bjhVYMbw/ItTa6WljIZqr7JH6x5NMEWzMCGb?=
 =?us-ascii?Q?uyx6obz9WjTEYq4JjBcyKAWItsC+4S8EZa1mbeVWMt0olbZeNUVPhLnLQz/T?=
 =?us-ascii?Q?t/mxwnoVKbQXyB0CvNh3OAwp0u6hS643tDN6dGvwk/xNxvenIy+212Pzvn1U?=
 =?us-ascii?Q?HdW2IITEVc9BfFpvnYr0goYdKh/cqIdsT1AGMaszv/2OluIaYEtfiIs5bUH3?=
 =?us-ascii?Q?Bt7nhSdwH5mAE1UJwEDLk07G/k0QOaKLe+U9g1ZxJimRtXCuIMgfcWDN6QmO?=
 =?us-ascii?Q?3sLDfom3Mcf1rVPwZoP4XDUkhHrj4USwoDwjPOnq9C7JeaEMDia1NtdSKzNj?=
 =?us-ascii?Q?sAAxu4pXgfHU9SLvkjlOtDwuSyaZTWPT2uc8Hqs+QO4yO+61rnr9Z4q0jCVb?=
 =?us-ascii?Q?02qBN2f60C+hW3IzTI0QTEeD3sHrHDIWUIIA611oPUXGSeBdLCFc3M/0fW80?=
 =?us-ascii?Q?aBBV14HMbv3qDzJgVGNX+TMZc72j5Xkqnm1HyLrCa7dWQHW4kknHrItnaRvW?=
 =?us-ascii?Q?dyxvACFufFGd/gP4Jh1Sqwz2+zAHvKIBbJ+ny+rJ1Da2dCZRd6g787iXELLw?=
 =?us-ascii?Q?Q38DoawpkbqLX0kk6OFbW6+5UxNeKD+y39w3xzfWqzMbwrYtwqI+T5tJqjw0?=
 =?us-ascii?Q?P6Wnt061ctgz8dFcCrh8O6EApU1eg4pDL5uibZ0uNlqbJsxExfU+FpVLq5ig?=
 =?us-ascii?Q?GkIsYJtFJqBR9xHcLELMi8IXvSd99F/yciCU4B4rt5mxBK4Pid7TJR3Z6iBI?=
 =?us-ascii?Q?ZdxfHesr32r484PySuJ0uWWaV4APlmbKWLoDJYk9WDHPrchZLw6vo4FRkZzp?=
 =?us-ascii?Q?nOgFEWFfx9rQJcOu5KLL4SpiJ7i4vJJboaMpFtuwFYrTHu9SjUisB/iBi+M+?=
 =?us-ascii?Q?MxjhSmRxOQNGQEooMVfHNcE3c4NpuS0govVaRaokT5cnmfNvm2QxmAo0j2pb?=
 =?us-ascii?Q?9od17hyC9LRHhGdtk2te2SaKLZWYevaemqE4SNrUl/v6m/cwLolxUzS7pjEB?=
 =?us-ascii?Q?Y2fDj6d6QprtgbTa+uO7mY4s80j/HYWCPCyVTuzLX0sHpsdNfFGa2Oaf7/8w?=
 =?us-ascii?Q?HH0B9uXvLJamnw89IZ7VezmbJ6YfpFa+GZ8YOgLQ+8qSBljVl7xr+bSTW/tm?=
 =?us-ascii?Q?+882N64zHsd7jY6w2X1IjFCpPveCWXblhxqIjxjfzQdGXZ5IVnXY2A=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 03:16:28.3665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 451dd7af-20bd-4859-45c3-08dda704066e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_201645_434995_0C87935A 
X-CRM114-Status: GOOD (  16.56  )
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

Cixtech P1 (internal name sky1) is high performance generic Armv9 SoC.
Orion O6 is the Arm V9 Motherboard built by Radxa. You could find brief
introduction for SoC and related boards at:
https://radxa.com/products/orion/o6#overview

Currently, to run upstream kernel at Orion O6 board, you need to
use BIOS released by Radxa, and add "clk_ignore_unused=1" at bootargs.
https://docs.radxa.com/en/orion/o6/bios/install-bios

In this series, we add initial SoC and board support for Kernel building.
Since mailbox is used for SCMI clock communication, mailbox driver is added
in this series for the minimum SoC support.

Patch 1-2: add dt-binding doc for CIX and its sky1 SoC
Patch 3: add Arm64 build support
Patch 4-5: add CIX mailbox driver which needs to support SCMI clock protocol.
Patch 6: add Arm64 defconfig support
Patch 7-8: add initial dts support for SoC and Orion O6 board
Patch 9: add MAINTAINERS entry

Below are the review status:
Patch 1-4: received public Reviewed-by or Acked-by tags
Patch 6-7: received public Reviewed-by or Acked-by tags
Patch 8: received public Tested-by tags

Changes for v9:
- Rebase to v6.16-rc1
- Patch 5: address comments from Jassi Brar
- Patch 9: Add CIX mailbox information at MAINTAINER file

Changes for v8:
- Patch 6: add Krzysztof Kozlowski's Reviewed-by tag
- Patch 7: add Krzysztof Kozlowski's Acked-by tag

Changes for v7:
- Patch 8:
	- Refine *_scmi_mem nodes for their properties ordering
	- Delete Krzysztof Kozlowski and Fugang Duan's tag due to substantial changes
	- Add two Tested-by tags from Enric Balletbo i Serra and Kajetan Puchalski
- Patch 4: Add Krzysztof Kozlowski's Reviewed-by tag
- Squash two patches as one for arm64 defconfig
- Rename clock binding file from sky1-clk.h to cix,sky1.h
- Some of my Sob are missing, add them

Changes for v6:
- Rebase to v6.15-rc2
- Add mailbox driver
- Add device tree description for uart, mailbox and scmi firmware (for clock).

Changes for v5:
- Patch 5: Delete pmu-spe node which need to refine, and add it in future
- Patch 6: Refine MAINTAINERS for all CIX SoC and adding code tree location

Changes for v4:
- Move add MAINTAINERS entry patch to the last, and add two dts files entry in it. 
- Add three Krzysztof Kozlowski's Reviewed-by Tags
- For sky1.dtsi, makes below changes:
	- Add ppi-partition entry for gic-v3 node, and let pmu-a520 and pmu-a720's interrupt entry
	get its handle
	- Remove gic-v3's #redistributor-regions and redistributor-stride properties
	- Change gic-v3's #interrupt-cells as 4, and change all interrupt specifiers accordingly
	- Remove "arm,no-tick-in-suspend" for timer due to global counter is at always-on power domain
	- Remove timer's clock frequency due to firmware has already set it

Changes for v3:
- Patch 1: Add Krzysztof Kozlowski's Acked-by Tag
- Patch 2: Add Krzysztof Kozlowski's Reviewed-by Tag
- Patch 6: Fix two dts coding sytle issues

Changes for v2:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=vendor-prefixes.yaml
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=arm/cix.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
- Re-order the patch set, and move vendor-perfixes to the 1st patch.
- Patch 4: Ordered Kconfig config entry by alpha-numerically
- Patch 5: Corrects the Ack tag's name
- Patch 6: see below.
1) Corrects the SoF tag's name
2) Fix several coding sytle issues
3) move linux,cma node to dts file
4) delete memory node, memory size is passed by firmware
5) delete uart2 node which will be added in future patches
6) Improve for pmu and cpu node to stands for more specific cpu model
7) Improve the timer node and add hypervisor virtual timer irq

Fugang Duan (1):
  arm64: Kconfig: add ARCH_CIX for cix silicons

Gary Yang (1):
  dt-bindings: clock: cix: Add CIX sky1 scmi clock id

Guomin Chen (2):
  dt-bindings: mailbox: add cix,sky1-mbox
  mailbox: add CIX mailbox driver

Peter Chen (5):
  dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
  dt-bindings: arm: add CIX P1 (SKY1) SoC
  arm64: defconfig: Enable CIX SoC
  arm64: dts: cix: Add sky1 base dts initial support
  MAINTAINERS: Add CIX SoC maintainer entry

 .../devicetree/bindings/arm/cix.yaml          |  26 +
 .../bindings/mailbox/cix,sky1-mbox.yaml       |  71 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  13 +
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/cix/Makefile              |   2 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  39 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 331 +++++++++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/cix-mailbox.c                 | 635 ++++++++++++++++++
 include/dt-bindings/clock/cix,sky1.h          | 279 ++++++++
 14 files changed, 1419 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 create mode 100644 arch/arm64/boot/dts/cix/Makefile
 create mode 100644 arch/arm64/boot/dts/cix/sky1-orion-o6.dts
 create mode 100644 arch/arm64/boot/dts/cix/sky1.dtsi
 create mode 100644 drivers/mailbox/cix-mailbox.c
 create mode 100644 include/dt-bindings/clock/cix,sky1.h

-- 
2.25.1


