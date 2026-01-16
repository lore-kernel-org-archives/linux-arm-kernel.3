Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA5CC982FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 19:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LOZsR9wD7hRY1wsccByStwxXmomHMxSESH5uMuO/bAQ=; b=DwvmI/nmRt9QZ9PsRFfFzzrHKO
	JxkLTjIVNQRP75QAb6uS1iSXtNo/HmTHuEpalXYphk3AW1df6AUM5C1WtkZv0i1PJohy7GFjOAjOQ
	/fzeyB+H/o5pXs5o3qCTKiVVphc2nDgP33b9q0gktw5T4LV6s6uDlQTlWIHxonQhMM94J38MXueua
	0PkgOD2ucLsdgkgU6MhLXVvzoPpP7fPge/vDa3PjqPoS0HnFT/SYWOiYDaGZmlp6aLMMcA77iMNIf
	0Z6DixDMAuFWZ2Uhtq4pfunh84eyl38m5C77EZsMXyLTspyM8Bc/5GGab6G8CpqZyIwDx2ML4cuxX
	yqKcyX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgpU5-0000000Egvz-13O0;
	Fri, 16 Jan 2026 19:27:49 +0000
Received: from mail-westus3azon11010026.outbound.protection.outlook.com ([52.101.201.26] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgpU0-0000000EgvE-1GH2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 19:27:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDU5CdUYfvM779rqJhcbv7IcskVPcmlnksaOIJ1sLv5BR3HhR7SkpnxmmiuTn8GIqjDnIR4d6geyD8R2iWK0CvqEMtYflg1Uk65HKHWBgv+LCJN6d7itUNTgXb2SJTxace7mg0CjrrpvnrJsJRyCxR9W46UV+g4GzpWWUVJ/j+TOreiKZT4OQ1MpUAvwsZlV7HOzGIhfAC6Jn1M0DPrn9DA5jxGh69JOLXQwcnVeL0YC5Vn7KZgEcRHCntME5ofWMVJmCKY65FzJuM40KOS8F7CytUQixZZRHjTA8wbOXWMuifJlNF0FsGzUdPXS6aw2EAagmd0uytGpaMfhqbUYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOZsR9wD7hRY1wsccByStwxXmomHMxSESH5uMuO/bAQ=;
 b=NWvgYPFYQYfFavcLdQwcjs6P205AmaE3gQxguO/5p+MDQ21Rue6fawf6YGRIHooHjBILWtvy2iIT1aITBwfS8uPatSsGPdgDGKsxxMhNf3ymtUGxXjCF8f1i5izR+dSsL7cgeOt0MsJLafymY17R6HZi3vpTSr+gkevu7Cix/5fmvNuctwURkQujzZ8tTOR9pR755F1za1PeqFwe56CPcDykRR1t9zJo9ipxMY5sy55X5/YHKP+UWunvc3OfBOiM41+sy5wFqt73GpJMUD+uLBBNdT0gquMRdvccAqlILEuit1o4ypREheFo111Gk8wyxrELvzvBiGMF9+N3sDERZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOZsR9wD7hRY1wsccByStwxXmomHMxSESH5uMuO/bAQ=;
 b=ZZgx8W2L3yXeYcufjNSEBvfNdROnhpBazZVKs6lq0UsRm+qvRhh6yGAz7uOhvq9Ekbc6dc7+v4fBGRlzuba75FreofWdE3f+74kV+inIzPkVRuvyjwqFpD8wv9VlYia+xscuYZ1Dib2LQu2lnvCexNY998aXhQYqNFJ0mOrXX4Q=
Received: from SJ0PR05CA0138.namprd05.prod.outlook.com (2603:10b6:a03:33d::23)
 by IA1PR12MB9524.namprd12.prod.outlook.com (2603:10b6:208:596::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.8; Fri, 16 Jan
 2026 19:27:36 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::76) by SJ0PR05CA0138.outlook.office365.com
 (2603:10b6:a03:33d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via Frontend Transport; Fri,
 16 Jan 2026 19:27:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 19:27:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 16 Jan
 2026 13:27:35 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 Jan
 2026 13:27:34 -0600
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 16 Jan 2026 11:27:30 -0800
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <michal.simek@amd.com>
CC: <sean.anderson@linux.dev>, <linux@armlinux.org.uk>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<bmasney@redhat.com>
Subject: [PATCH V3 0/2] Add devm_clk_bulk_get_optional_enable() helper and use in AXI Ethernet driver
Date: Sat, 17 Jan 2026 00:57:22 +0530
Message-ID: <20260116192725.972966-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: suraj.gupta2@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|IA1PR12MB9524:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f004987-2f8a-418d-4aa3-08de55354de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LLoUNtOVcIfGQ/hXHDQRXSirOfdOA5O6v7nWpDjj27w/VBT2T9qw1JHMsGuA?=
 =?us-ascii?Q?lvM8YE4EMaujg8SrTeJDxXNoORjQJk+Fyv1qQcxr3gNWdZEEVELtxsZpM3PC?=
 =?us-ascii?Q?D4rOPmdfH5RWo7fmAN3wlDfzzBwkt40RF+blZolkJNbHJfvVbYCFE3kxoSbS?=
 =?us-ascii?Q?Gsqqn0omygO4h2Kh7o+s0TuAn12Mbefsih9lnRnUJnpVzIpRDAJhYBDQPqfT?=
 =?us-ascii?Q?mg7JUOEVyIgJG5RofGXMN2PGfIocxg4pvjR/niNTUVqBcJI1bJPw/Y7rsat7?=
 =?us-ascii?Q?r+DYE1f/eh4J/IUQggxAXWLSVSckV/aQgZljz27eICdStJ5bYjDuZwE+Rfmy?=
 =?us-ascii?Q?mPvQHHZvpiAQ3ssD9t4KV40121pOLv3N3V4pAOl4SXy8tjEcOkZ7QxeOIpqe?=
 =?us-ascii?Q?Bk/pv0veoMutLsf1LdKUt8aexK29DQGcbscXmJFGxwCRvmz/Wy2C5soPhOdK?=
 =?us-ascii?Q?Oykh8tG4Xzem6FTFpwbmPlBXpkTidafOJe4u0nNmPNU6xsxx3XNM3qKtx87K?=
 =?us-ascii?Q?nZwD4/3vx40PC/JtPUCts8v2sBs5a5+es6q2QTEatqoFokUouZcc1IIs7Rob?=
 =?us-ascii?Q?m8/gP17mY8ehsPHpXvRHtBRwcW114yu8d7oZV2Emf190EcG/kSelQ+M6dVEW?=
 =?us-ascii?Q?FjOCHH9F5tdLO8W+o+dOV1RM27yQEnrAOEWyKRKSZ7eb5s6qwafzpGgLYD7M?=
 =?us-ascii?Q?Psxmp7IUJvmR6LWFDijeNV3RaMECnGy67YTzqx0J3BGCYaexR84MzvvHHD3R?=
 =?us-ascii?Q?PjaTWyj0RZK8e8hJ3T83IlDPt1So8+auHf+OZeOL+dKshHuw8tGxqdYhKk7q?=
 =?us-ascii?Q?Rls9imDnRpJMue/vtAeaTkahFSfOQm1I1jAxTcNEPToLn8zoob42bRns2nMO?=
 =?us-ascii?Q?OLdpBk8WwNATF3vp1uM6XTCDj9Bl6AdpMDVEOonsFRA7Sx53UOrlhR+rKGdj?=
 =?us-ascii?Q?XUbU3Xi/aWJvhTZK/9gHUzVp5lpUfFsSTt8RNYanfIJcEh3tn3ig5jwyD3v+?=
 =?us-ascii?Q?l1OQ2AEIKsbA3bnz00YDzsQon3kfbBazxYzsEHDpKCfvp4rXrqNAZ0ehBMTp?=
 =?us-ascii?Q?iOZGPjsju3sULRpAWgKkgyGB0Hxr9qBMhCBlnOUq/TKbxLowxEMbDgO3QST4?=
 =?us-ascii?Q?x52vP3/SQ685xiKkC9JnC2xDG7JyrA4Q4Q+BAdpcFqDeD/EbND2ljaV3WYAh?=
 =?us-ascii?Q?EIgV3OVxmiOodTETPfYNWp8pIrrmWRXRPQTu5DIAjfWka9g/wT4RzBZhehAI?=
 =?us-ascii?Q?k8MKSVolYHTIRANM+YoCf02o5FDZmdcUeaThHB9vk8ti5zk74MFk46yJDHi+?=
 =?us-ascii?Q?uWMDuVXH2NxUkYwQQgcrN8PvQ7NT+3MN33vBWmk2Y6XLJNhXvLcOWDf3aXL2?=
 =?us-ascii?Q?sbXAyiFH68tz2xtZZvkm035U6eUUWFYGrR44xripKtpB8oV4/Dq/n8jIpOf0?=
 =?us-ascii?Q?nnNbvMeOJWZ3Osi46xVBKwaf8V8Wifvgy+nwbP2AAgQdKYW+oJs+s9CscZTm?=
 =?us-ascii?Q?vOXKXncHSP4nN6yJMg2byp98rlPjhJkp+uDsB2OENMXkcgZvEbRLtQYP6CbI?=
 =?us-ascii?Q?+BYXABjwkd7JlTUwgC/ys/z1qkJ7wZUbYJQ1Wfz6VyVoXheSTOk3liMliXnC?=
 =?us-ascii?Q?j/0jkRFctMQEKQyT+pNmYdi3mrwThlIs7+E0CNlHVvu2sGQGmt8copxwngaP?=
 =?us-ascii?Q?ord/+GlJC/T9sWMhEmtdNBjfu+o=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 19:27:36.0936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f004987-2f8a-418d-4aa3-08de55354de6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9524
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_112744_377049_17FEF833 
X-CRM114-Status: UNSURE (   9.31  )
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

This patch series introduces a new managed clock framework helper function
and demonstrates its usage in AXI ethernet driver.

Device drivers frequently need to get optional bulk clocks, prepare them,
and enable them during probe, while ensuring automatic cleanup on device
unbind. Currently, this requires three separate operations with manual
cleanup handling.

The new devm_clk_bulk_get_optional_enable() helper combines these
operations into a single managed call, eliminating boilerplate code and
following the established pattern of devm_clk_bulk_get_all_enabled().

Changes in V3:
- Correct 'Return' format in documentation of
devm_clk_bulk_get_optional_enable() in patch 1/2.

Changes in V2:
- Modified commit descriptio and subject of patch 2/2

Note:
Prepared this series as per mainline discussion here:
https://lore.kernel.org/all/540737b2-f155-4c55-ab95-b18f113e0031@linux.dev

RFC patch link:
https://lore.kernel.org/all/20260102085454.3439195-1-suraj.gupta2@amd.com/


Sean Anderson (1):
  net: axienet: Fix resource release ordering

Suraj Gupta (1):
  clk: Add devm_clk_bulk_get_optional_enable() helper

 drivers/clk/clk-devres.c                      | 50 +++++++++++
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 83 ++++++-------------
 include/linux/clk.h                           | 23 +++++
 3 files changed, 100 insertions(+), 56 deletions(-)

-- 
2.25.1


