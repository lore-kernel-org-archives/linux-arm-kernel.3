Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD39C44521
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JO8SmM+704wEZCd+MjHQoN3LfKuzpVQvhb4T2yDbPJI=; b=z9Gl3jXGK3LycObTf908Z6ECIp
	N/SsrnXM3EpH2pV1DPJ4qbFXKqBiFUehrIAdp2jp6Uvpp7x/+ESi5c8mc+6gJcil9IBlvEOvZ+x6h
	/0Zn59iqFLHDFvOiX9S8gaBVnm2cAPMjK+qt/DbVQfeyLJ6qB2DhATITNuXCj06TP07BTSJ4cZsjb
	vLs3W8hJtVY6zIwBheES5F3A3Ft2BQcBm/64Ze5NTzGpH2Vx45lzrELrj+PWRb8rY6LkqsJ8IlgXr
	Hab8o95U4NE8wilSUL1Y/1oyFNgUbWR0sYK6TtF1geEaxmc0Td/xVPdx+U/c3NJToQgOb6Vd3in6M
	/D+aebtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viX6e-00000005OqZ-2B68;
	Wed, 21 Jan 2026 12:14:40 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viX6c-00000005Opq-1HrV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 12:14:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDnvpFajD8Ipu7Jj5LaZwlodZsJkQm1VzI9A+OvignpkJsJJYQc3qAj04PXhFqF15+hep0x0VoWpExYY24YNu34NBroG0t5Nob4rZu2xDWG+12EuV0unARCE+ey4AU8Q1W0q51kB1UbLVyQqSyPbjddV2EJUXyRsryGUo0O+I8B5eqdyworLvzgyGhQ/jbWHR8/VVR7IRASsE5Jm7bwsWbXNHhK4Eep3Q5O3uAEWelKaif8AimMCnPn+OqDysYPCoeotM98yJTmRij+lOMiCO6Gd+qAdSQ8GXWqLiW40c8INYz7nN9e9Nj+xbZ0fqdGbb3eb+F+C++Z+upb+8FhOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JO8SmM+704wEZCd+MjHQoN3LfKuzpVQvhb4T2yDbPJI=;
 b=ok6E1JNQPd+6AexWWqjHCxIwx+VLI99nuSnYRKqZbd8AGHM60TbBJksYiBPlg8BE319K+ZsgucqyS2rQu+z4ZsIAJ6mIInm8Jy+5NdZpGmwzXO9GqL3o+5Liy4fQ8CQgl7K10vZO6/sKTLIydx1a9baeApAsTooRtQlHPH6bJtXIT4xLdUTIuOGEmbvZ69QVhw0QDVmKvcJUIdjIX0ojtBYq1dLQ4UnZLHmPNUz9zZw8LFQhfMS4WW5LumQuUhjqEmrLvbw/oZkpsMw2fWFyLD3VVdce1DXBdYSMuKB+t5RsdwXn8BluMzyEOEyASudupUGqYI614GsRQFZToZzryg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JO8SmM+704wEZCd+MjHQoN3LfKuzpVQvhb4T2yDbPJI=;
 b=rdAs9H0kSNRKNBEYQ6jOmKrmUhMVdR9961nSKAxLH2yceLwLSUr71fmgSJdCeVLh4nunOZvV8GTJaD07tBqelzV2fHeTZ4UXiN/MPrWv7GG15VmSNic9ETIQfM+eVgBrgWIJ6kgTSGVLcEuOx59oofOdHdTBj1apJVjGsPJe/h0=
Received: from BL1PR13CA0376.namprd13.prod.outlook.com (2603:10b6:208:2c0::21)
 by SA6PR10MB8085.namprd10.prod.outlook.com (2603:10b6:806:43e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 12:14:32 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:208:2c0:cafe::b6) by BL1PR13CA0376.outlook.office365.com
 (2603:10b6:208:2c0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 12:14:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Wed, 21 Jan 2026 12:14:32 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:14:31 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:14:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 06:14:31 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LCEV712981585;
	Wed, 21 Jan 2026 06:14:31 -0600
Date: Wed, 21 Jan 2026 06:14:31 -0600
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Tero Kristo <kristo@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 3/3] arm64: dts: ti: K3 updates for v6.20
Message-ID: <20260121121431.qam6qnq7sxdwpeor@unlivable>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hdnqogoathnziinh"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|SA6PR10MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ff675b-5251-4f6b-3da0-08de58e6a280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S2lIz/UBt0em0xn9HszhIwPJMdSKVfc4af6L1ZUZcUVW8cVu0CRjmdXMR6eQ?=
 =?us-ascii?Q?qWVr8Majhc5uzmDCZU7I9Hf+qHm7FumptWFXZbL9iDtS54sPoz8xa2ntiu/o?=
 =?us-ascii?Q?EgvoqFsRtUphwqtog4+65s5qqiy0WeoVUfCDcZG2cvw6EMYBqgVDE8pOTLB4?=
 =?us-ascii?Q?b2kqQTXNR1uw4Kh/011dG8xaHqxwedU8iZ0bv71mwf2ImeTehCJcaZIwQaJI?=
 =?us-ascii?Q?EhHdHo6G+t5EzuOGEDHseO7U/asWxguC7rOBV6ddom0tptENxaWN/tUXoGCB?=
 =?us-ascii?Q?dmpRYUGvA0HmXP6Zm4rQ9bkML3BfDoVWxHQPtQtgrEmKfWfB3YuVjiUaIKd9?=
 =?us-ascii?Q?xyAp5Rg7XFkctOBZYgEbEQWyDCJpTUlHICB3F5otURP7XzpN3iWGy3wWjHBT?=
 =?us-ascii?Q?ygFOUTm0VNGrAoOs7JGzeM+1hDSMg4h/Z7ZHB6x7Yl1u9MRgOLtZEXGsOiIr?=
 =?us-ascii?Q?JabzER64pFlWc4cUt65CdU5dSZ128noYK2Ybvamk4Sa97izNkwxK2f6Hqr8f?=
 =?us-ascii?Q?fYkibcnIHQc4npuTbfhu2zQSXV2V5EEvxshvX6/9e3ki0culEW8WR3FL5dcz?=
 =?us-ascii?Q?Hfzemc9fXJHe1mauHxDu23u6aOqGxIFL5q6EuGVIbEoViEnWs5f57KDRHLjw?=
 =?us-ascii?Q?bIWtTJAwa79XYyUBXLDO8ymWPEt7LIJCq+b89vddev5ReZTMx5dk8IvSNF11?=
 =?us-ascii?Q?c5yRF9lf6rDkp7dE2IwKpKYMaXdIUkC2OC166L6duMmxEm2+JlbWhWEY5gp/?=
 =?us-ascii?Q?B981YJyj3N3RlPTMGj+ZVtkbg6iHgAWLnTJbMPDMCJ0IVFrToVOGytA7r4/o?=
 =?us-ascii?Q?Nx5GB7NkQlXVEk9nS0dEm8SsBL14MH47xuR84SbRuUGzNttWn14edERrAeez?=
 =?us-ascii?Q?ISVJSq1M5vVPG1/H7s+Hgw2fU22pVn9YMJuGhjkeedbR2353eEaFxTU0PtXh?=
 =?us-ascii?Q?ceYcqZ76MBvngA8ngP/cpNeIMpyayGMaU1WkKX3xVLu3UVpSj0Zihvz798IW?=
 =?us-ascii?Q?mAkIAYB6yF9Ycy+PqPfN7o5RhUV69bF2USxtUoq/jcLQJuigR6kBqQ1hvrKm?=
 =?us-ascii?Q?f3wNt7Il940YRAQHnDrSJaoKF4aDne8jlXBH5MfTVTaLu3jRKcUQmtBo9OQA?=
 =?us-ascii?Q?46LNk94voXJcQGammie7EWDaWBbAOAUxLd711fRzTQYcyTcBCOl7SJRvJIP7?=
 =?us-ascii?Q?gNyZlAvK7ksyeTgjhdz1xx1zaUd6Ng7npFsS25nn1HBP+aytqOqYuniFgE/3?=
 =?us-ascii?Q?Xj/62FEJdMbvoRij+xDYFJvxk9mvizYlqPOAptr4PHtbhr/0kMaSOhH6RmsQ?=
 =?us-ascii?Q?+f8cCS/yEinDfVCmNwFIjVxx5eVNnnyVbZNcmMTgslXKiK6uj3K1r6JD5JkM?=
 =?us-ascii?Q?iqFhGX4iwpwy08kEKAJ5eoOmsDOMtDoCv0ym5ORBgWID5R6Upem5s6nZelQG?=
 =?us-ascii?Q?2WIecBLKLr+TuLOa88l2q8QoPm+BNuqd5T1I3j10hYINS4ylijr3jEI1wid/?=
 =?us-ascii?Q?kNdrdko/JJ5lHfe7prl/YwSLp4xhBa7/C0+ZK2l1zPc0Cy+Ox7VcR5AqzN3c?=
 =?us-ascii?Q?qbapxNDRrSSwMT3DZP6PwOg0Q0fP6iL1YIhYVtn7MRAVPH4ydg1iHkk1Cmns?=
 =?us-ascii?Q?12RgXev/RZgwiv+5ig5PEVJj87QWWxoNdBDWgxhAlFObggbJAbEZ/+8WRv7g?=
 =?us-ascii?Q?1oSAAX//kkvJLCx0RrkOiVf9Pek=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:14:32.4021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ff675b-5251-4f6b-3da0-08de58e6a280
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_041438_435096_60801692 
X-CRM114-Status: GOOD (  16.33  )
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

--hdnqogoathnziinh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

This PR has the usual 75 char warnings around pinctrl usage and couple
of other places which I have chosen to ignore in favor of readability.

Additionally, commit 4df89cb826e0 ("dt-bindings: remoteproc: Add HSM
M4F core on TI K3 SoCs") is available in linux-next from remote-proc
tree[1], so ti,hsm-m4fss compatibile nodes were picked as a result.
This generates a checkpatch warning which should be cleared once
remote-proc tree is merged.

Finally, this tag also contains ti-k3-dt-fixes-for-v6.19[2] for
cleaner build which was merged to linus master post v6.19-rc1
(shortlog and diffstat in the pull request contain these patches as
well).

Please pull:
The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-d=
t-for-v6.20

for you to fetch changes up to 53289af62b66812d07a7b0f5f9d62f429c94d317:

  arm64: dts: ti: k3-am67a-kontron-sa67-base: Fix SD card regulator (2026-0=
1-16 05:57:33 -0600)

----------------------------------------------------------------
TI K3 device tree updates for v6.20

Generic Fixes/Cleanups:
- Minor whitespace cleanup and lowercase hex formatting for consistency
- Various DT schema warning fixes across multiple boards

SoC Specific Features and Fixes:
AM62P/J722S:
- Add HSM M4F node for hardware security module support

J784S4/J742S2/J721S2:
- Add HSM M4F node for hardware security module support
- Refactor watchdog instances for j784s4
- Move c71_3 node to appropriate order in device tree

Board Specific Fixes:
AM62:
- phycore-som: Add bootphase tags to cpsw_mac_syscon and phy_gmii_sel

AM62A:
- phycore-som: Add bootphase tags to cpsw_mac_syscon and phy_gmii_sel

AM62P:
- Verdin: Fix SD regulator startup delay

AM67A:
- Kontron SA67: Fix CMA node and SD card regulator configuration

AM69:
- Aquila: Change main_spi0/2 chip select to GPIO mode
- Aquila-clover: Change main_spi2 CS0 to GPIO mode
- Aquila-dev/clover: Fix USB-C Sink PDO configuration

----------------------------------------------------------------
Abhash Kumar Jha (2):
      arm64: dts: ti: k3-j784s4-main.dtsi: Move c71_3 node to appropriate o=
rder
      arm64: dts: ti: k3-j784s4-j742s2-main-common.dtsi: Refactor watchdog =
instances for j784s4

Beleswar Padhi (2):
      arm64: dts: ti: k3-{j784s4-j742s2/j721s2}-mcu-wakeup: Add HSM M4F node
      arm64: dts: ti: k3-am62p-j722s-common-main: Add HSM M4F node

Daniel Schultz (2):
      arm64: dts: ti: k3-am62-phycore-som: Add bootphase tag to cpsw_mac_sy=
scon
      arm64: dts: ti: k3-am62a-phycore-som: Add bootphase tag to cpsw_mac_s=
yscon

Francesco Dolcini (3):
      arm64: dts: ti: k3-am69-aquila-dev: Fix USB-C Sink PDO
      arm64: dts: ti: k3-am69-aquila-clover: Fix USB-C Sink PDO
      arm64: dts: ti: am62p-verdin: Fix SD regulator startup delay

Krzysztof Kozlowski (2):
      arm64: dts: ti: Minor whitespace cleanup
      arm64: dts: ti: Use lowercase hex

Michael Walle (2):
      arm64: dts: ti: k3-am67a-kontron-sa67-base: Fix CMA node
      arm64: dts: ti: k3-am67a-kontron-sa67-base: Fix SD card regulator

Vitor Soares (2):
      arm64: dts: ti: k3-am69-aquila: Change main_spi0/2 CS to GPIO mode
      arm64: dts: ti: k3-am69-aquila-clover: Change main_spi2 CS0 to GPIO m=
ode

Wadim Egorov (4):
      arm64: dts: ti: k3-am642-phyboard-electra-peb-c-010: Fix icssg-prueth=
 schema warning
      arm64: dts: ti: k3-am642-phyboard-electra-x27-gpio1-spi1-uart3: Fix s=
chema warnings
      arm64: dts: ti: k3-am62-lp-sk-nand: Rename pinctrls to fix schema war=
nings
      arm64: dts: ti: k3-am62(a)-phycore-som: Add bootphase tag to phy_gmii=
_sel

 arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso     |  2 +-
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi    |  8 +++
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   |  8 +++
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           |  2 +-
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    | 17 +++++++
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        |  4 +-
 arch/arm64/boot/dts/ti/k3-am62p.dtsi               |  1 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            |  2 +-
 .../boot/dts/ti/k3-am62p5-var-som-symphony.dts     |  4 +-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           | 18 +++----
 .../ti/k3-am642-phyboard-electra-peb-c-010.dtso    |  7 +--
 .../boot/dts/ti/k3-am642-phyboard-electra-rdk.dts  |  6 +--
 ...m642-phyboard-electra-x27-gpio1-spi1-uart3.dtso | 12 ++---
 .../dts/ti/k3-am65-iot2050-arduino-connector.dtsi  | 58 +++++++++++-------=
----
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi |  2 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |  4 +-
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |  2 +-
 .../boot/dts/ti/k3-am67a-kontron-sa67-base.dts     |  4 +-
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts   | 14 +++---
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts   |  7 +--
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts      |  4 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi         |  6 ++-
 arch/arm64/boot/dts/ti/k3-am69-sk.dts              | 26 +++++-----
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |  4 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts             | 24 ++++-----
 arch/arm64/boot/dts/ti/k3-j721e.dtsi               |  4 +-
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi   | 19 ++++++-
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts            |  2 +-
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |  5 ++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi               |  3 +-
 arch/arm64/boot/dts/ti/k3-j742s2-mcu-wakeup.dtsi   |  4 ++
 .../boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi   |  4 +-
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 36 --------------
 .../dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi | 17 +++++++
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi         | 58 ++++++++++++++++++=
----
 35 files changed, 238 insertions(+), 160 deletions(-)

[1] https://lore.kernel.org/linux-arm-kernel/aV59SdFU15HpLHeO@p14s/
[2] https://lore.kernel.org/linux-arm-kernel/20251215132845.faudhjh7ywxdx2n=
q@elongated/

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--hdnqogoathnziinh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmlwwx8ACgkQ3bWEnRc2
JJ3BiRAAhvZPWBLtiTLwVmru2J5ohBbWoKME8KF8qYO9CTZybuUJC+Ci1L1TnKAo
8rtzbIulyo3tgj3QbFXgCd0pTAUhF04mCYwEv+cEUBrx/HeY4J51Ep+aAM5NbTqy
BjNalKIkJz6xdS43zhCiQ7cb9iF8Idk+7w3GBNKiPb5PBW2SMD8rF8Av+PJKrSEJ
BJSk/Wr99Jx42j+aaBSc4hdlKoG4ZO/UE1kULbJn6tX48C9eeqgCCQfxM2aE9jO4
h3Ke9Wlxs1Mr1vI4gIbdny+obktmVHr4R+CBMfpIDo3bo2XzyxoZKeYNpkQpkzoX
PgOuPxJEyTv4qcktj3ajZwQ9mE6KcKgKs5nr9s7dYXvtVOW23q5HKJDBYsaHY4tG
e3gmmTXW5n6xxWKPDLHZGTf/LHTpQzrV2IChuQzROnhlG+viPNUmh2OnNZ0Qm7Yx
vkMxd4tkOcWzViV4Yzi7Ki6Fqp0MHFb3mCNdnHBSytGSwg4IuPmYbm8o/AkZZQOh
yBpzBZRQZS1V8tshTdih7/ivQdKUDBAYISBqDSYqwr+BG6vhEZg5F13yzi3zGWga
wOcAAtPg9MPXDx+HgRZFCV9PJuJUMgd6PsiS7bqFD1CbiSfoHnUCF1IftVhMImJy
QvfOhZqYFcoa/royZUgD+Up4AZbSdWlQ1E374/UDv3Ib1pjIvMo=
=X2K2
-----END PGP SIGNATURE-----

--hdnqogoathnziinh--

