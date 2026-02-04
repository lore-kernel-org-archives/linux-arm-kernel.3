Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5E2E83F1C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 14:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7e2SWyb/IamYJ3N1S7YmOSHPuhUu5A42iRYImCpz40w=; b=BnDsZiLj7Lg0cV6JZi1iYmTJ7n
	78goz3j23hth9MBfobDV+8ydnQ9pK6kI46FW7HSpsyP8kxgjvaB1Z5/jEX3TnUFnEAF+dO9DJlJMb
	YdpCGe0OM5snVDcjv1J37jZYfpo+DjG2NBYafNBIxIP3459ac/tvl1Kj+UdX3gbypJfoyYqLKS8lC
	qyaLKZ31mJbc11pwWEQM8khyp3jizRSVcWRCrFS6MA6AwBHI9kTJjbGitG5qqsgkufxEQmoOftrAe
	Zwcv60fBEML/XOd0VqEpB5Ln/BGQ0ObgmEWvD9mCQL70jBLEIpk3KLSI/wNGp9p6kY+fxMUnOwVa2
	kL8FDTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndRE-00000008YiL-2t8A;
	Wed, 04 Feb 2026 14:01:00 +0000
Received: from mail-westus3azon11012052.outbound.protection.outlook.com ([40.107.209.52] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndRA-00000008Yha-3GAO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 14:00:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puLeGM2EsqzdqB/DPOg4gZ5AKObI5ixixyId6E0f8pMSAuAqziAQsD0E3uyJgc4O9WDL/3UmNlUnV8kEk8coLt7HHVl9bmGxEB2igwCz+aGP27WeGeAy7An/qY3O81lo8yRAetefM6Sqp6yWNeVGEN0iz7+D5vRjFDIbgDtV+gWBDJ6iGjcFaZaR7msvPJdtTX/CxQwEhCuJyMwLwDfbJjuY3VvxPx690+yFcIe1XJae6oyMfviMRwkjaRcogNeBPQZIRQP/lk9JuqFILWRG9QNMzCkdIfZQBY1f0+bM4KfoxYp9CNTo5e0o9V3BBzCN5V0ZditeGMVpTe9ajkjuww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7e2SWyb/IamYJ3N1S7YmOSHPuhUu5A42iRYImCpz40w=;
 b=tA9dkbMAuyIJK3Mjuijvi/7r4nDRq+YH2dCnwCgspof6bduQR7/Sg9DPo7ICRQAzfDiRTMQA5e1GPCgXDWvqrn5hE4S1PjqeqeuCc6j9+95gY1EL/gvNAJcn0i3c02XGX6vVJumqR6OmCq9VTh225+ZgrhmZLbmTaHxkGy1iG3OjTJn3xXvxdpm9oqduXcMYjkjM5Dmb+0sj1XuGG8Sc42QzWN0Ygq+y3MXyWpvpehIu84yMRWCupcTpqqCA3m7WXmt8NbOZ2bcZv6ppmMgPavdsXRXZxNlqLr5rmtBIHv3d06eXvUPz++wkwkEoI1VLUnryadcehCUx1VKonfVlgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7e2SWyb/IamYJ3N1S7YmOSHPuhUu5A42iRYImCpz40w=;
 b=YqG5+9QrF88B4ST715aBqGWM9u4uDNrhZEF50LyNToP1yLNFaKFdXyNx9uOazuz+K2aN+iY0QeVyy3gnhrinvG2ObaqpEkPGYhVLDKoJG4QnVZnv3/Zf6YoR1I3sjZ3+snNYKckFupWjqEu0xeawBRBO3WJtZEYAFKG/bRZGsS8=
Received: from DM6PR08CA0057.namprd08.prod.outlook.com (2603:10b6:5:1e0::31)
 by DS0PR10MB6248.namprd10.prod.outlook.com (2603:10b6:8:d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 14:00:49 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:1e0:cafe::1d) by DM6PR08CA0057.outlook.office365.com
 (2603:10b6:5:1e0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 14:00:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 14:00:49 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 08:00:48 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 08:00:48 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 08:00:48 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 614E0mVk1657231;
	Wed, 4 Feb 2026 08:00:48 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 614E0l0l002165;
	Wed, 4 Feb 2026 08:00:47 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <vadim.fedorenko@linux.dev>, <jacob.e.keller@intel.com>,
	<horms@kernel.org>, <parvathi@couthit.com>, <afd@ti.com>, <m-malladi@ti.com>,
	<vladimir.oltean@nxp.com>, <rogerq@kernel.org>, <danishanwar@ti.com>,
	<pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
	<davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
Subject: [PATCH net-next v2 0/2] Add Frame Preemption MAC Merge support for ICSSG
Date: Wed, 4 Feb 2026 19:30:42 +0530
Message-ID: <20260204140044.4086725-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|DS0PR10MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 54558082-6898-4343-fcc0-08de63f5cd28
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tm031pPUJ98nrwxODHOFdZoJeybtxNUdyrakmOxgg2iRxskZlovTd8Al7pdA?=
 =?us-ascii?Q?HOF4Lw47MCkjpYieayMPo6T8eGDAhro5kPAjQ7nw2czli8HhLMw/PUDu1U1X?=
 =?us-ascii?Q?Zu8QSp/Nu3iWVFDo90yWSWM5SC3N0B7VADn88OQswj8i6ke365AzHMs0qB8v?=
 =?us-ascii?Q?TmovWKPsPZ5fqcmezj/fy9m04w7A+/T7Mb/54en8oukf8vEHatR+8qUYYkUg?=
 =?us-ascii?Q?WHgzQ6+WUPunEX0PiLqnVsNzKJ8vTq3lffyw89Mb9iWMN6DnqL1hCsj2G66v?=
 =?us-ascii?Q?bwRqLpEPQp7YXKz2o6qsJgxjiwpZ68PqfJMPvehuh+Nr+MYOxMoMsgfx5ELO?=
 =?us-ascii?Q?XVBL/reUifmcxwCYPDMRZPPDiksat9dN+j1cqXL0tyn6berTBs3zsxeZlfXa?=
 =?us-ascii?Q?l/jYR21slxRke1CEx1mRDUyl/aF5g97pRGIcO6pTIC7tzWURsSnhNUnCeV7b?=
 =?us-ascii?Q?2esVl/p2H5xwMeWrW3XZP+8zTOL5TdQ6QsQDpUBp1DtbDciLaSloyl9IV4Bb?=
 =?us-ascii?Q?mNhkDbxoIPP0/AsTJVs1afJr9gcRAREMG3ghNyf/Z5wK3485cV/xA6SDlMVA?=
 =?us-ascii?Q?+TnTHeZYyZEdyGhfn7akAWCzb9HvuTEhCJK2onoNIK2FYpt/aPOoBiGTTMW2?=
 =?us-ascii?Q?4J1Op7TTOoM6qYRRAj2wJ1nFL/2i3jKPO5DggpYZ70wqDyWEAoA4N2+PBkVp?=
 =?us-ascii?Q?YCRkeBa2tGklmnn4tAwgXh9WMw0BxU+OPxOdsSOxOQ1hWG8YicFc07KBis28?=
 =?us-ascii?Q?7j4M+H8F3CIYBiiqLAUwEgsRu5RJm3LV6H9+b5qjBSZ6BqfTwlFg+aa6G6uG?=
 =?us-ascii?Q?iStZ2pgGm0P95PX4sowh4E/3PbzlcVZIZhiH2QFNfSUy72aBodvwuS7Yvbky?=
 =?us-ascii?Q?AwfOJvZwewtIYCkofYWNmUhDFeevpqYeHp3cXOazYy4u853xG0EUUni1GHvC?=
 =?us-ascii?Q?DEZ1VucvFA6EdQhBv9UpQFYnnEIgwDSNV0YZSK7nDiFDRb8b+fEXSyX7Obgy?=
 =?us-ascii?Q?24G6WtdzADL7BIRDYRsw6xq13NnM9ZlcJcxxHwtMoyEL3Yjim7tt8fRViYZg?=
 =?us-ascii?Q?mxg4wVlE2hOFRf9DODEoY6i+RHWL1oomCN4mVf3WQc2kgyS9pGQMmW9iiw7s?=
 =?us-ascii?Q?CWdrbnMadCdPebmGCjEaOzWMDnu0ACsNtouXEGB6KXVr00K1JxRdI+2gpCSx?=
 =?us-ascii?Q?dVdZEQSH1ME/3bGAIhkj5CQcr0/P5f11MCkcb6aOcjmV9+V7zycfZjCZQSFI?=
 =?us-ascii?Q?TMDBdIbFOJOOp3IqLjiQVq+WhQppaos20NrGdS+ZBO0STna6JuxCs0i8QjJi?=
 =?us-ascii?Q?T/bsFRyLa2z58zDYWQ9BQ6mLaEP2dBmuvDNB+UcqstvTPV7FTCzBA42Evs8W?=
 =?us-ascii?Q?+ll/3eozM83FQfwSFeBs8IkIXsFuWpmFCx3+C1BHDqlX94n6APJ9jXx0DwRt?=
 =?us-ascii?Q?wUm73/9daOLxSKI3turKqsZcisdqSV+OH5gJqKFtK0GODhBb+drpgFYMwSlb?=
 =?us-ascii?Q?MPZs0pUKH2VfKJpzBWGwhjya4qk6EHSXvXUZi3TRvX24UPKT17iekuRWXaOL?=
 =?us-ascii?Q?HsAXMN7JEeXFCv44OZ5/ykmiug+EQ9RMcuXJ99eVgp/cVim9o/daKUj25GwE?=
 =?us-ascii?Q?d5HY8mZTPE1pD4RJL6ojopIUgXcKxm1pQNpVwG9QZHGR/Ya8aXuMMLn3Doq3?=
 =?us-ascii?Q?NTfm+j4fAJ47P2D7X6vE0CsURgA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ihf7kPFE1pFIvwGQXMCra/rGfp8BGwO+uiFJib11xhJq5IqmMLYJ8rOMo90WU2nVqngAbNunkS2Pbb56mpyS2CLGYy8hPaYyzV8YxmK89TPG7zngkEPZdGQ97pn2h05tNq4/xkqU+FtwVSQAahdYLkoNr7PXb8C5XU1Wje0hUR52WdTZikp0ZDCicdffUiRmimRKBs1pOyJjcTLdUj0pVFF+YzuGzfkfFHU75gMQPPA7Vt1a49VLFXZudLDc5mpxbcpaGCmZFGstbxoLWM4qUcVg3j3inL2n5XckIdIzNrAWQXfXaCopNFPJ9KUW0BZSbIaZmmHwKLvG5lQr4swdiDStnelN51MDsD9N0n9vDMR53Mzrv2aqMEbBp5mFc39K/+NiqEZ4XZnOBe67j9jhIKOQ93AP9Pjnf0BDTCEFBkN0JF964BSbM4n9F57G4FJH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:00:49.2211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54558082-6898-4343-fcc0-08de63f5cd28
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_060056_931032_A5CF39ED 
X-CRM114-Status: GOOD (  11.62  )
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

This patch series adds QoS support to the ICSSG PRUETH driver.
The first patch implements mqprio qdisc handling and TC offload hooks
so userspace can request TC mappings and queue counts.

It also integrates a driver-side mechanism to program the firmware
with the IET/FPE preemption mask and to kick the firmware verify state
machine when frame preemption is enabled. The second patch adds ethtool
perations for the MAC Merge (Frame Preemption) sublayer, exposing .get_mm,
.set_mm and .get_mm_stats so admins can view and change MAC Merge
parameters and retrieve preemption statistics.

MD Danish Anwar (2):
  net: ti: icssg-prueth: Add Frame Preemption MAC Merge support
  net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge

 drivers/net/ethernet/ti/Makefile              |   2 +-
 drivers/net/ethernet/ti/icssg/icssg_config.h  |   9 -
 drivers/net/ethernet/ti/icssg/icssg_ethtool.c |  86 ++++++-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  |   5 +
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |   5 +-
 drivers/net/ethernet/ti/icssg/icssg_qos.c     | 216 ++++++++++++++++++
 drivers/net/ethernet/ti/icssg/icssg_qos.h     |  78 +++++++
 drivers/net/ethernet/ti/icssg/icssg_stats.c   |   1 -
 drivers/net/ethernet/ti/icssg/icssg_stats.h   |   5 +
 .../net/ethernet/ti/icssg/icssg_switch_map.h  |   5 +
 10 files changed, 399 insertions(+), 13 deletions(-)
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.c
 create mode 100644 drivers/net/ethernet/ti/icssg/icssg_qos.h


base-commit: 9a9424c756feee9ee6e717405a9d6fa7bacdef08
-- 
2.43.0


