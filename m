Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC05D2502F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 05:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LqBqeS9mZXuijm9che1spTWbNrSbs6vXjz7X2N6aQ6E=; b=ufBaQwSp6lxvaYikm0KzcEDKXa
	QthvDdflcy9Ctf6Gc9dWRcBKV87uLwCoof49equX6JE27KBejeoWvfGIrm3uZtvlr1cEaWSKLFhWV
	D3CBcOZfTPxkddPdpLIvYdIO+yvA0SYRu1VNNbJPjEBtDlGHeUuUFMmYIOl0epaEZiCbljjE00rk5
	6xSv8Ts70RLhyNPJRTZ4RH4eUT49WsdmVTgfSPWpG8u/YGTD06xskWUhMoAwwOxLpD/4MM1qRvQCl
	vLDhaf/6v7OuEzKlEmo56ynl4Q6qO7mldzzc1S9lEbWdCt7luWu0hBcusajTbwfDMqcQu423wQraG
	a7Ic4qIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAkZ-00000004n93-2NuS;
	Mon, 12 Jan 2026 05:45:59 +0000
Received: from mail-westusazon11012037.outbound.protection.outlook.com ([52.101.43.37] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAkX-00000004n8Q-1GqN;
	Mon, 12 Jan 2026 05:45:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQfJHH+4B3W6/R/guyky2AHzS3XLg3AAlKKOYUCC2Kkk3Zg+GmYHQlVYcvMI0OVNoPzAbTBub8D30z4kARSkfViyWxcwE+3HdavXXQ8IqrRmaCnWcjv0zMX2/LkXaXwQNS6wjGfIks3VCefvQ84z/RgFvlE0cvh2ojBKDSt7KVR5tJLeEpRMaGS0C52mE2YuZmhlQG2cbaoed175P1qZoS4X8Ak3Vyckoo87qRz4PPpN+wg7WvywqjCzrigfUnxRR636CbvjMM8uWqm93DFGmMNaDWud9v4Q8oEukpqgyCx82GFtkhY9AWJ0MVH/aaWTm1+OniBwA5gEmKdp1467dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqBqeS9mZXuijm9che1spTWbNrSbs6vXjz7X2N6aQ6E=;
 b=yiSRG9sZybYNU9n99aBK4Mje/tWA76v5M8ZIhU7QppN+0KzbR6omxDie1M3lkfjqkdA/929f4n3GxwVwZtZkHxXelmux+bzlZ3GyADW/6lZhTxNIe63cU+8v3xMqKo3RSdt1sEyT/DUU5RUwsQ9sY41KYP9XlrqJTdLTEWzvaa/x694JqK8qo4iCrop8jRzKOUWzPf5VJuEdWZvTZYVlNxDgATsHMc/nzlcjcSDLNtcxLWzopoMC1N+9x0lub9jLSO4dcCetMlzfRAKxmtWA2ptjQ/o5NxK/IgtRjqjJdbaTcAQXQoJTfvcNbpGSs/E8oFIUqwMEkIKk4l+CJppx7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqBqeS9mZXuijm9che1spTWbNrSbs6vXjz7X2N6aQ6E=;
 b=wZeM2eP9xoBx4vSZC4vcZEHWK47i4CvvVIg4ComvcEn2ZB8xiDzU2814vYqKgXhKPHxd+cCcwl4iBCpgvut1XdADd98Z2Aa5qVoStCvIOR+wC50gI9sT9VY7AkTV9bfsKkUsoKEmQdDs7vv/mGEhhBAGPGjHVZEzMyN88DDv7hI=
Received: from CH3P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::25)
 by MN0PR10MB5960.namprd10.prod.outlook.com (2603:10b6:208:3cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 05:45:51 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::f) by CH3P221CA0002.outlook.office365.com
 (2603:10b6:610:1e7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 05:45:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 05:45:49 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 23:45:46 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 23:45:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 11 Jan 2026 23:45:45 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60C5jeQ84153405;
	Sun, 11 Jan 2026 23:45:41 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
	<rogerq@kernel.org>, <thomas.richard@bootlin.com>
CC: <andrew@lunn.ch>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v3 0/2] Cadence: Torrent: Enable PCIe + XAUI multilink configuration
Date: Mon, 12 Jan 2026 11:16:29 +0530
Message-ID: <20260112054636.108027-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|MN0PR10MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: 720a3cde-9ffe-45f3-dfaa-08de519dd6f5
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FtbHYYyZGtALF784J5xZdONNw2K4Z/V6VP3KSBUrO8/VvXQ3BB9UggJF/5L6?=
 =?us-ascii?Q?EcWOwEIE7wtrw8RCZHIMEfkhG28/BiB2Fic/lOWRl6Y1Q1qmxG3blvcwLT7a?=
 =?us-ascii?Q?jw7BKuabk/N6e9cylbRPGnJCFcdR8pgVBtlw43mqpfmqBCNZi3PyEx5iB9yq?=
 =?us-ascii?Q?ofXibQukjVodAVL9atkDo/4shhLQqrfcWMzLfWRkkgDUBni9AUOVavyvTi3Z?=
 =?us-ascii?Q?fAaUMu5ErsusfM/qTrDrPsFSiL+kxSlQXkH9fz1W04S2WlVsKMoNtmOh5CYJ?=
 =?us-ascii?Q?wVD05wI+LQMIwKCnZape49Zpr+r+UlgHZ50sSU2SpLTAS/DnWxED2bG96tcH?=
 =?us-ascii?Q?Id/qaL+Nc6KNqQuFsKZRVh2ekTZy0nQhaH9NOmhNUXF6kUgIs0TyvQSy2kS7?=
 =?us-ascii?Q?/zauqDYKDYwIjNEoW5q5Ve8uuuBOXdUm2ktgyOGxYKSK64HD4i6iRLk/Y+ql?=
 =?us-ascii?Q?QwzanSXAwJv5pmyZhlteKu5dUTF1dUoFgubk5D4wHnPTm+VOyFYKFwSM2uIQ?=
 =?us-ascii?Q?qSjhDW1TziD5xCR3K7X4ZYA+KQvViBsSKQORLjOX85VoRVM7VtHU/JFyZU79?=
 =?us-ascii?Q?Q4q8N6LD2Clgkbo6vtaiBZVraL8lvI1neHW2T9y25QOTxEESO6MnR7t603Xg?=
 =?us-ascii?Q?owItHJH1vuRrSFu+EVy/w61UIWKMWTGqk4vw38JQQn8/1qSlq5kdigPDZ1FG?=
 =?us-ascii?Q?uQtWlUtNXPo5yum2AmJaQ8LGprLCSBhHSX+jaWgOqgxdgq3398EWwUD+y3c9?=
 =?us-ascii?Q?0+T5OjVdqwUqJfqwbRtcFAvrNUCnpadZKEQR5tRXN3WA6TgpjEv1NVa+/SEo?=
 =?us-ascii?Q?DeddQhUVEipJrlskz1SFW/siJ8Dv4YeiPRO7VHF9oHpz2EbAC+cwlJeNLP0D?=
 =?us-ascii?Q?3mC4TAornFYpuXxboRnk40GRpemePAJhaU2DVHAN3hKqHEDBMQC2gs7EPSZs?=
 =?us-ascii?Q?gdQHOqeoGJaUjHsCHN8GPQfBIUbrgEL1b6d7l+kXX5uUKPp1ZBWKemZtItyj?=
 =?us-ascii?Q?+oSw3xuvC5RjQPNAHll8+gcWhR+/At/HwCIl/9VcXxEf9uvchqol5dDNRFtw?=
 =?us-ascii?Q?W5zzFAo8XbwBy6aj4vg5GtCjE1qghTzff5YhA55nK1orEbuzaQiSbXEpRtBM?=
 =?us-ascii?Q?eqVQ/1go0QKcbm9YFWf+M2hmmKVnt4OlXm4iPjZc8dSdbNc9C/n0kKCsRkQW?=
 =?us-ascii?Q?xTGiyERLXnLssb7P3kPgkpDa6nq29Fav5Ze67Kgnx9G1eIHOpDvx+jHAEyG6?=
 =?us-ascii?Q?VBAlae5FId/XDyq5oZzpuurCRoMbtPaZWlo1DS6MaaSbjBvP9cjwdpLWwUP8?=
 =?us-ascii?Q?TUfMO1h7RfvacQLbewVN9HFCct5psdc+TbiT1c1LLFM4D9+rwFa+KUcmPO/N?=
 =?us-ascii?Q?0ZvG2/nPJwwf1gbbD9Rij7lM+QY9DvvgtYi+4YBXJpE0ma2VSwxmYTpDtu3D?=
 =?us-ascii?Q?IGyJ2miXmgugsO7n4l0v6M+YNSyw9B9Vn1P3iRnFWQR0S1WA0G5QzXxH07jF?=
 =?us-ascii?Q?SvvmfldKD/76KpmLIuJejKxmbs+qHdvhtoEg6eSNyYSEcpnws4h8QquU+KUZ?=
 =?us-ascii?Q?N0zG98IJ8viXo71/DTxEE5uerY9PN0WM5IqL/kXe?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 05:45:49.0392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 720a3cde-9ffe-45f3-dfaa-08de519dd6f5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_214557_366076_40BFEC84 
X-CRM114-Status: GOOD (  10.21  )
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

Hello,

This patch series adds the dt-binding for PHY_TYPE_XAUI and adds the
driver support for enabling PCIe + XAUI multilink configuration.

Patch series is based on linux-next tagged next-20260109.

v2 of this patch series is at:
https://lore.kernel.org/r/20260104114422.2868321-1-s-vadapalli@ti.com/
Changes since v2:
- Collected Acked-by tag from Rob Herring (Arm) <robh@kernel.org>
  https://lore.kernel.org/r/176772419699.2512006.6478554353373580831.robh@kernel.org/
- The commit message in the second patch has been updated to explain the
  changes made to the LINKx_MASK/SHIFT and REFCLKx_MASK/SHIFT macros to
  address feedback from Andrew Lunn <andrew@lunn.ch> at:
  https://lore.kernel.org/r/7fd42221-d602-4ce4-9f7f-6754ed91e7aa@lunn.ch/

Regards,
Siddharth.

Swapnil Jakhade (2):
  dt-bindings: phy: Add PHY_TYPE_XAUI definition
  phy: cadence-torrent: Add PCIe + XAUI multilink configuration for
    100MHz refclk

 drivers/phy/cadence/phy-cadence-torrent.c | 143 ++++++++++++++++++++--
 include/dt-bindings/phy/phy.h             |   1 +
 2 files changed, 137 insertions(+), 7 deletions(-)

-- 
2.51.1


