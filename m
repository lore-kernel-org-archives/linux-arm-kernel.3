Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1105AC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 07:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Id/Yu/+2yQnlqd/LO+bL3R0wbbOr/n0v6ohb1JFmRo=; b=Pn6L6LC5LyeJ2xgSch3pmphNuj
	OpwY5dR1ddxw3UPM8KFPjjAffV7keybGbtjhwqdIqGJNypMkg7pQmAGeFCqmAwqVV8POghjyYEpv4
	+Oa1K6yGwJTQbz4wEQgnraKXvOJjQjpKaQQ6epoZgJDIQf9oN980BQ22Cn1efZX8TVUIG7H+meCo+
	gyNSDmMd02tRbnYlNUZoBmqgUWP6f38M4E/vUXlaol6ki1pEiWDQy3TReeykxnftS2sRCnsflp6Ts
	MeAgxGdKbRzZ9qarlS+pY2nP8/qMcLZGZ4aB3Mpry9wzbxypEbGkNDATwWVBQRhimrVODklX1rZ54
	3HMRh11g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJRv-00000009VUj-3G96;
	Thu, 17 Jul 2025 07:54:39 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIwh-00000009QD5-2qnF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 07:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGqs2+6va2yi/Nmucssp56uQrMsAs3ltkZ9u38n9evePjNH0uQqRulQF5r5WVOLiA00rXgXJR9vCWKVZdt0xGj+gk6Vh4GeX2eg/ME9A4OFOX3/j+IAaiCLSowqetWNscLSvFleRpwCswDAD72poGXr1hZ1NdKJfQL1pLhoppMk/G9VLD1xOJRa8nZd1rqpoE6bSkH0CI3iFjpvq+ob3WEELKldzrlqnqb4UwJWumypYlR12UprsOiGaS9O+tTK/R5/GASDt285RENkJJJA3bnOpuwvBmAhCWycETEsS5CpO8hzMokAV+4pCaYLjmBrbMDDeArvnLh0JVPVeZD4dAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Id/Yu/+2yQnlqd/LO+bL3R0wbbOr/n0v6ohb1JFmRo=;
 b=hw4QGQ9P9Kw0sDlm7cjeCyKzNtOR40lIT1KMGxt6A6Gjyf1mXi34hrPzzvaVA+JhESePLOhg5TqzJMmJhKxJGhYk2XxFVfledLZKhnQm8eTIigui1jlZmBB3jz2/nr3OIai/4x8WTdV3I+PHQAvOxhK2+ssC+YzztOe2jb8Nyjw6+fz48iSm6eUx6UxHtbJbku7ebvbL7n0IhxSluIwWCyhbEV/yuNhLadxevXRpsZSCs1Uz6EKCb+eP7+Y7nSvNkweB7w6/b9WPA+xF+uzs+NjynjpW0IKTehgWOUsS3Q83IYwqQVP+p5Iwb7imGB5DkyFsU4SOAJKo7nmQsGUtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYBP286CA0017.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:ce::29)
 by KL1PR06MB6556.apcprd06.prod.outlook.com (2603:1096:820:f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 07:22:11 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:404:ce:cafe::97) by TYBP286CA0017.outlook.office365.com
 (2603:1096:404:ce::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.19 via Frontend Transport; Thu,
 17 Jul 2025 07:22:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 07:22:10 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 95E9B400CA08;
	Thu, 17 Jul 2025 15:22:09 +0800 (CST)
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
Subject: [PATCH v10 0/9] arm64: Introduce CIX P1 (SKY1) SoC
Date: Thu, 17 Jul 2025 15:22:00 +0800
Message-Id: <20250717072209.176807-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|KL1PR06MB6556:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a83757ca-65a0-49c8-6ff6-08ddc502a51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/9wqVt6cDp5eWiN2r94m35+UuOzr3IZ9nuSjc/yjtVPo6rOEwBMZcDNVNvOd?=
 =?us-ascii?Q?7tSTSX4udhZc8582jL7Cx9JomKo7y4jCwvOzMB8W1fGue5piHje63lBc/9ip?=
 =?us-ascii?Q?NRvbBh6ldzmZJtOZ5fs+lPF1O/EHRhezFO8aTxbdeX53+gx1heEcB54pE5q8?=
 =?us-ascii?Q?Shwrp7DFXu77cfSzuRKfFW6i06S1WFmvhDfC50nCNa9mRENVwdCytmcdZ5mF?=
 =?us-ascii?Q?SUgI4/4qNWfyeC+O0UKnTaQ4cYN+H7HMeXK7XLnSZ29B2kzRKPcFqvb37s7A?=
 =?us-ascii?Q?7OabCoPqK+jX6ZHHqAgbNQHU3OKB5kxQbPTiqqiIVSstSlD3w39Tgmzly2Bo?=
 =?us-ascii?Q?Xuk547MqO7pYwIGKgeijuwbeXwi7eJpOkaSnGTzog6pVgjxryyqIGCyOEZo6?=
 =?us-ascii?Q?INyM3uKz3FCJSlz2yk4tzsg28G+F+bJ/PzWFklJOMGB8crmPBSJnRLF2VpJG?=
 =?us-ascii?Q?LKymohXhMBSGZSYjOx/jSDaFb1vp4uPFC60M/NbEnFSviF7STFx1/DLevRpu?=
 =?us-ascii?Q?qhSP0+5TTtt6jX1FELK0fCtjvmZQbGwldWG+Dmpisc3MrgurNI2pMK7W82Ol?=
 =?us-ascii?Q?6X21gvGidpbf4rTLnLQ+nMGecAa/gIIN+lL2SRdChOReM2fuPHP83cQJeyG6?=
 =?us-ascii?Q?we+htKlXg7AOeYtpKdW5r1QToCdvi8XIxzn0xEzV+PeawOdta6AeuRUORfDz?=
 =?us-ascii?Q?6ySx2OBIDlEFJ38i8BbjVaLoeWWDXXzxgb8Lw/9P6zFjY/b2MhELPwgBrvLZ?=
 =?us-ascii?Q?A/+3oLcjy3R8/A+yrHZlNRjF1qNe9S075laQbNG3Edkaglp0wMtVWdr2W6gU?=
 =?us-ascii?Q?16uvXk5C4JH4LXJFnu+n9v5NHofQAS7nnuyEI3db6Ab/baT8ZI8abpA/U5z3?=
 =?us-ascii?Q?iXyEsbhVzjgnQm4IqKEz+RHw1fSWmtxC0UBzXmEb+chMkqWO60QLwKrCeSXO?=
 =?us-ascii?Q?MEi96tL+FJsFnqk1vnE1meiavrXbSV0uvXRB8H86x0cDd02BP8Eny1PqC7Yq?=
 =?us-ascii?Q?11PF/YGQGMbb6dTtdGSQrlua6BIbuIMl6osrw4/TXFoqfwQI10/xEFhgrU0L?=
 =?us-ascii?Q?q2Q2Plj1ETwqCzE2/XPr4CyLMh35JJxUcsN3KHfhFoMq1r5voJIujgUUEguR?=
 =?us-ascii?Q?6mLCXGcvsELZDwFWzfWlyk7nlnDiQFl9qKOm5jy97JFigoafxdnNJEa6rW5v?=
 =?us-ascii?Q?C7ceCag8Fda5mabTHRp4W6h+sLXDcC7YsBWmQA7qSe58G9qhySC40xVKZgIP?=
 =?us-ascii?Q?F3M/vATYFDwVa7Mg04acNqL4SqFkxjkqeNsVv+JoKq1wFB6ieE+CUMT8hhtV?=
 =?us-ascii?Q?o6bZWSroIG9a6aFHwSxKilohYnapngz9ZqtYJMrMW02ybBjFxd+iszTx+gNK?=
 =?us-ascii?Q?LQl+65PC/hNWO40YJVUHnR8ZYZ38ffsnRBe8PhrVjMlP5eciWWmHlGguTVJt?=
 =?us-ascii?Q?yG0uj/Z6ptzX5Qe2Ip+wk4FlWMuK1w2DPqNz1F2qpvKLGnfHnAZcQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 07:22:10.4988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a83757ca-65a0-49c8-6ff6-08ddc502a51a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6556
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_002223_763109_55FA7B18 
X-CRM114-Status: GOOD (  18.26  )
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

Changes for v10:
- Patch 4:
	- update the description of the Sky1 SoC use case.
- Patch 5:
	- Move macro definitions above where they are used.
	- Prefix the macro definition name with CIX.
	- Update variable names and remove unused members.
	- Fix the misuse of the use_shmem flag.
	- Add some comments for use_shmem.
- Patch 8:
	- Address comments from Krzysztof about "shmem" node and delete two blank lines.

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
 .../bindings/mailbox/cix,sky1-mbox.yaml       |  77 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  13 +
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/cix/Makefile              |   2 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  39 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 330 +++++++++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/cix-mailbox.c                 | 645 ++++++++++++++++++
 include/dt-bindings/clock/cix,sky1.h          | 279 ++++++++
 14 files changed, 1434 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 create mode 100644 arch/arm64/boot/dts/cix/Makefile
 create mode 100644 arch/arm64/boot/dts/cix/sky1-orion-o6.dts
 create mode 100644 arch/arm64/boot/dts/cix/sky1.dtsi
 create mode 100644 drivers/mailbox/cix-mailbox.c
 create mode 100644 include/dt-bindings/clock/cix,sky1.h

-- 
2.25.1


