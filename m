Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445D3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 12:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8sIuBv/YDyXXnEUepXlgrse9zfwX57+Id6ZVXGcqys=; b=KcP/lwpcjcryijXYB3nlzvNhu0
	otWQkdTKz+Hcdklox+sTg/8emcso5uVlJF6tHLlsTpgzGpViSSS7C0w+/QrSQLwbxMphFvSVWECxQ
	7xoy2R8UGFShHHXKP68LZ6TI+smkEPvjsmG2igdWDVC7TBxELZ4gihsgHoCdvZdSwW51EjBJSWInm
	cQ/pR3aCrZZDqbyBRz9FNoDPvcnhrQeQrE+MDEmGHt78hdYeRrtrh7VgyX+5elOqV4PMIbBplQB9x
	Vt46O7F6ESFs2qKrUcL8WLWAaYB0E1hyZvRXtauoucaZXSBsgRM0+GgenH9aYGrLrH0PPclIF6433
	EP/erdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQmvg-0000000FlEZ-2fMA;
	Thu, 26 Dec 2024 12:25:28 +0000
Received: from mail-dm6nam10on20608.outbound.protection.outlook.com ([2a01:111:f403:2413::608] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQmr4-0000000FkWB-3fdo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 12:20:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6jQJ+4C+aS/Uj2wZTBHktjDkDYs0pcJNj8BDh5DfyvISgsGc/lT2lKB/ilIDQH1qU6ibp7RY7MVgXfeszrIPgS1Z8arK7de71x8JXbXbfxYVpMW2hqYnrvZhZaPLt6O80E+wNIvVqqA/jv7x+mGuRRvYEwVfkPcGaGcZLmaYHc+ITgQ6g0Tg28/+Bqw0lzzSl6JOrJ03RdFzmJOfbfsFeh+sh1pg971jdtPKN0EdzJC3iBly1LmNOvONV8f35lRi541BWVotniDBDotrNqxK24tN3zZQXsGcdmpbMprU769YutkNXoLlqapWiIDWnQ42pSpwUVudlJGK0zQJAQP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8sIuBv/YDyXXnEUepXlgrse9zfwX57+Id6ZVXGcqys=;
 b=Sg1OpOik5S/rKf6HtwZODbEGL5jy4FAT9solLakj/GMjinmpzE/c/WRUQrvCCkoYUtPaReqhjHsh2HWQKK0724lzVXXAx2f76iidP1IqlYgcYSfoE5Wmoo3hEGRbsFFssjxOdT0RTCYQqWvvMRcCWiSSoSv1ly1RMB4SvYKUu7ZlL5PokkSlCfxpiX8LUpPeuWHy1ScrJfWM5YI41KBVwAv1AhEngVTS9tOWP/zsUNd03cfjFNduxl1qcHvVaAHr/kjbl9AaYrqL2wLfh8A6gGYfFck0XERLFzhpEK815AhhCTuuoftIBL+3lXF2T5q2uQmAQJtRU/tEz8faPDTC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8sIuBv/YDyXXnEUepXlgrse9zfwX57+Id6ZVXGcqys=;
 b=TcO+7fX1zhU9CAPowLrL4CM6iroUYBjJppMqfaHflrHoMwVXG4O/A9lC5vYevUbs/L6ysElNC49+4eHy674PIhx0KaoDmNDm5DDy0WU81CE/4Mq4obUu09B4hVgqieF6Pb3OBaNh8x0XSTorvZwh8C80ww0Y2qUAs9wnbhnqreM=
Received: from MW4PR03CA0247.namprd03.prod.outlook.com (2603:10b6:303:b4::12)
 by DM4PR12MB6277.namprd12.prod.outlook.com (2603:10b6:8:a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 12:20:33 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::1c) by MW4PR03CA0247.outlook.office365.com
 (2603:10b6:303:b4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.14 via Frontend Transport; Thu,
 26 Dec 2024 12:20:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Thu, 26 Dec 2024 12:20:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Dec
 2024 06:20:30 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Dec
 2024 06:20:29 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 26 Dec 2024 06:20:29 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <michal.simek@amd.com>,
	<vishal.sagar@amd.com>
CC: <javier.carrasco.cruz@gmail.com>, <geert+renesas@glider.be>,
	<u.kleine-koenig@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Rohit
 Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH 3/3] clk: xilinx: vcu: unregister pll_post only if registered correctly
Date: Thu, 26 Dec 2024 04:20:23 -0800
Message-ID: <20241226122023.3439559-4-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241226122023.3439559-1-rohit.visavalia@amd.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: rohit.visavalia@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|DM4PR12MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e46894-93f9-405c-98e7-08dd25a7b20e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KO1w30otSjd4T86OfQ4Lxi5RB78waHXQTLS4u7Uo7015pUPxn6Z41gCPwt+o?=
 =?us-ascii?Q?qSmOOsUkp/2rpt52g7F4eCs7jPTNncNpeMEVAxQSYeZu4CnEkVBfY9xAFedM?=
 =?us-ascii?Q?FHeo1AlcpKFlKAtBaiqiBIDjjeoAUVj3fvzLIoR78lqrWWgVrFe3IVt7LcbD?=
 =?us-ascii?Q?RslkXZP0mWkUEolWPfPRu4Oeg6V++9aq8IzOjcRt462791W1tcySScZCZq3h?=
 =?us-ascii?Q?5Xz6UJqDMhNoWKxz3ZjNctAJRRYOu4PlsPCGRUorrHzIL0Sm8NQq6a2EQnEj?=
 =?us-ascii?Q?LSpKo+81kkzFNrmCbHKBPu9FvSkv/o5r5ZXro/8RGqGAs/9N+886DdrSbtBo?=
 =?us-ascii?Q?s8EMmz0qZlF72ZxU0540I7H/aH8j2l1HgWYID5wM6dEMKmqMuopGA3WF9Jsd?=
 =?us-ascii?Q?XpdX3w7v1y91/wAzQ84TLD5YEprI9HuM2w8lITacylP1FDp3BszbYjWOgt0r?=
 =?us-ascii?Q?/4+0x3g9lioquRjsD5ImZ9Z6JttuEOlNe9FW0Rk5ZELkBnV9OWI3sK4T6I4M?=
 =?us-ascii?Q?cahQGosxXUxWryDU9IrYgsXR8gK9lsTSgNoRGwQZNyN0TOPXYEIGMHqCjTI2?=
 =?us-ascii?Q?POedJx2xj6vBoGBDO4N01ExsvizhxueNrdhSTMXZ5EmM/o7F01tVUcjc8tMq?=
 =?us-ascii?Q?TVJc5EZt0IdcMlghQ5Fuvogfs2A0TCPIyD7KKXwkimuBtDf5byU+l4NK1b7H?=
 =?us-ascii?Q?RS0QE3LBjCW6Hu5LOcTXb+WOq8fbaQqOswq7WKONsv/PFCDPbuyJuYD8g1xK?=
 =?us-ascii?Q?z84DbcxVoFWh3HK4Us/dpiHTSvzbJBG8RVYD+4l+SRZzLvViHnOdTs+n8fXB?=
 =?us-ascii?Q?kcKbGivfBHhAgsMTymVjySMpCeEVhtGJoP8yAnB9HhHjXpBYbw+J1S9nh4a0?=
 =?us-ascii?Q?WssONL5o3UVdDvOoE9L4wmkS2jihkDPIhLwhkc3+DHojccahToExjD9I1PEg?=
 =?us-ascii?Q?AM3iMjVZKpyai0HmomKsHSZzTI8Rav1wIsowkniQt2q2JIgPK2ItV/wb0C5p?=
 =?us-ascii?Q?NNzaiVeZ3aGmj1hTpoFJoKAJwX8c31A+25JdwmHCluaMBk+q+yjjIB6oVmHu?=
 =?us-ascii?Q?jH+5yExdhGOX6XShfDa0blbe7eF8CvRDQip9G8nEVk9eBtaRyFtkNFWEb1nm?=
 =?us-ascii?Q?T7UHFIyT+57XspluZ8+oo3HstYvRyilg8esryDFooyGxq0Vi86stkENzzTQZ?=
 =?us-ascii?Q?Y4PooOgV6mHs6BVc8UJW1kbjuhyAUX43TcptoiJFGO23z/yaFfT3pzQJpt43?=
 =?us-ascii?Q?V/mcvik9yeiRCi9gWMk6g4ieN1AfhKQQ1LlJ7D4Jqhurg9QrhJ5HvNRV3oyw?=
 =?us-ascii?Q?Z/4AfAGMJ/FIvCAi8RTrU4xhkSsozyPAdd4vEep1Q+K7p04gCuV3y9iufgy4?=
 =?us-ascii?Q?xmuzZI82H/eaS5fKade9GYdb6Nf9OIyU+DS6h6guIG9cOaOFe/5ekvDwv7xU?=
 =?us-ascii?Q?E6YtYZWlQiUQ7AIf4V7G81tw6SaTa6oelC126s8XEybwv+w/Wurt+6T6JblD?=
 =?us-ascii?Q?ZElYa77h2/5n84Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 12:20:33.1826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e46894-93f9-405c-98e7-08dd25a7b20e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_042042_919005_38CC774C 
X-CRM114-Status: GOOD (  11.31  )
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

If registration of pll_post is failed, it will be set to NULL or ERR,
unregistering same will fail with following call trace:

Unable to handle kernel NULL pointer dereference at virtual address 008
pc : clk_hw_unregister+0xc/0x20
lr : clk_hw_unregister_fixed_factor+0x18/0x30
sp : ffff800011923850
...
Call trace:
 clk_hw_unregister+0xc/0x20
 clk_hw_unregister_fixed_factor+0x18/0x30
 xvcu_unregister_clock_provider+0xcc/0xf4 [xlnx_vcu]
 xvcu_probe+0x2bc/0x53c [xlnx_vcu]

Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
---
 drivers/clk/xilinx/xlnx_vcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index c3a4df7e325a..365c64384ebe 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -590,8 +590,8 @@ static void xvcu_unregister_clock_provider(struct xvcu_device *xvcu)
 		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_MCU]);
 	if (!IS_ERR_OR_NULL(hws[CLK_XVCU_ENC_CORE]))
 		xvcu_clk_hw_unregister_leaf(hws[CLK_XVCU_ENC_CORE]);
-
-	clk_hw_unregister_fixed_factor(xvcu->pll_post);
+	if (!IS_ERR_OR_NULL(xvcu->pll_post))
+		clk_hw_unregister_fixed_factor(xvcu->pll_post);
 }
 
 /**
-- 
2.25.1


