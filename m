Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F72E77194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 17:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G96SmpEt54IB9Df3wvkKqTgeWYSbIG+wUCdWuEyobIo=; b=4XOYkp492dnBWH+oQxSqKj6+SO
	fPD/bVUE7Toj/Aq745LrqjJ8shlsDRTWa0+EnW1p0X2Fv1yL//o2Lycfw7Wqwk5ny1GvY45+yg89O
	sSGfdekmkeHTsaJLod8tBFfgpnLrGT8+/bSLCuP3gZlYSVbA/TCkALbL/v3z4tZQg4oUj/+5his9R
	+86DpXhQIqv1wx60oZy+aFhkOXivyVxFP7H2WXl/90a+TdDDi1CvBNY3mw9u5ZlQo7REwSS10mXKJ
	vMXY8UiQT7+aBVWkoVBqMDv024ExSFs5petGP21AE/woQUhO/uEo8dQOykWAa5Tz+bTaepzWcsGCS
	5Y0Ey67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOdY-0000000Avpc-0hCx;
	Thu, 02 Jan 2025 17:05:32 +0000
Received: from mail-mw2nam04on20628.outbound.protection.outlook.com ([2a01:111:f403:240a::628] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOcO-0000000AvSj-0krg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 17:04:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKtQg46EoIMQ62mQQ2iXF6eW7m1kFvb4/l+EQ5mYUetwQoJ56UaEAy4O3fja6sHijPU+lTGDk9DSH/gVbzpTUIpGVr/Bjwb/oE/p63OEXxAg8hke1hQIXXJvQhbH6GQajdmE21Cw6FBW6rzIPY7u4CU0pBUpch6a02yyNSGN/OspAyjuZ+w0jmFs6ztkoTSoPAOO/gs7T42+O+m8IpjNzIzQsr3eIAq1RlyXIs5t7WAh9Cdmn3sJ5hIc1drEbPOR6F9WwHL+2dHOXceq+qh2o20/mL5uAfA0GW2Vooc7JYdo468egEs/0obC25ZhYa0Zll7oZVW8Ud6uUljahkjpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G96SmpEt54IB9Df3wvkKqTgeWYSbIG+wUCdWuEyobIo=;
 b=TvSBuSRLqvgH/MhztFq58Dr5ghwch9CwUdGnmscgqjgUGhLhCeM5HG3grRe66XHZMliifliBN6enk0R/Ie4EZYHt9B5x9LfEI+L93NxPvewJrEy/IQFuC67tnfNYO8yUGpLnEUtjez7JyKKsDD7isHi7zMqgy4SX4gNFmLTfJRwSAH2i72+ouqje6il3uMCVCwf1I2uRUFU1YevYDtRfwDWN8PxIN1DB3cNcYWXGBlxZCIBT5Ibzn9fr1KMbb880fkdUtqE/9XkKY+cpD/qhBzytEYJsqqqgJWDLVmqCpPfeAStjbGQAecbexQ5ZtRaHlte+koSotB8AM82XlK+PsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G96SmpEt54IB9Df3wvkKqTgeWYSbIG+wUCdWuEyobIo=;
 b=NvR3jonaByKP2+FVzfk65t6m0MzXxFKwdrselWwsCpqFAOIyomprVqjiwBNLvU0G8aAmPL8TfChbLOBikzuYKxQ5JjAZVPX1A3wT+NOBNT/B/M3saiHFNfqnpqfq7WAvnj8VQP+rmGpfJGHs/sd82/5Use8EOhWRq6QSczXh/fg=
Received: from DM6PR07CA0122.namprd07.prod.outlook.com (2603:10b6:5:330::18)
 by IA0PR12MB9012.namprd12.prod.outlook.com (2603:10b6:208:485::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 17:04:10 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::d1) by DM6PR07CA0122.outlook.office365.com
 (2603:10b6:5:330::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.13 via Frontend Transport; Thu,
 2 Jan 2025 17:04:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 17:04:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 11:04:09 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 11:04:08 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 2 Jan 2025 11:04:08 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <michal.simek@amd.com>,
	<vishal.sagar@amd.com>
CC: <javier.carrasco.cruz@gmail.com>, <geert+renesas@glider.be>,
	<u.kleine-koenig@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Rohit
 Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH v2 1/3] clk: xilinx: vcu: unregister pll_post only if registered correctly
Date: Thu, 2 Jan 2025 09:03:57 -0800
Message-ID: <20250102170359.761670-2-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250102170359.761670-1-rohit.visavalia@amd.com>
References: <20250102170359.761670-1-rohit.visavalia@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|IA0PR12MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: debe44c5-6c67-4865-9cd1-08dd2b4f79e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dnJzX/U6miWZZ7vSaoaxl6F3h6sANd7IGpIOVqOrBq7Pd3xmurZOwM+060h3?=
 =?us-ascii?Q?u6MiBt5Q3iT2CoFKk2EMFWy4pCUvvIseVuW6ZjKfQBx6P29zB3m73zonWnBx?=
 =?us-ascii?Q?l0R20kDL2oPdbsRdvnUYJfZvL02PKwO+tHUJ6tAlnLVJEt0frIBTmybRXd79?=
 =?us-ascii?Q?VG1jRKPHgX7pvDjYHmCRtuv+ro+kM5WuFQrjrWCQOUJFsaUCT9ecLDcGxR/u?=
 =?us-ascii?Q?IQ/u3LpPAAPrSH+YcuJ6X8jJSp990MHaBM/V86NlJ79OHmrXu3ZVKPCLSr7s?=
 =?us-ascii?Q?fFQZwNK8NwX7SxRWeNgUgEw81778NCo3Rwpob0B60RDy5kxLhLM8SVPBd4+y?=
 =?us-ascii?Q?sr4SGf4n2FJB65LiTOz26LJTY6fLN68PRfd63ksEMCArdSeMIZ9sncmmv439?=
 =?us-ascii?Q?mhx+0fMHRgw8tzrbTiIIZgbIwVeW65wKkhvXNKdqBViZ7bH2AnKg+APT3cjR?=
 =?us-ascii?Q?Azrk1YxitgScb27kFAiOfP3zbyFmiwuaYUmpT3B83Cpemp0BktzU5UCflnQx?=
 =?us-ascii?Q?DDxIcHWHfjnXskiLsemzALCreQHNQCJyaLXPUI1JR2ERHBIlPnkBSKZEbHdV?=
 =?us-ascii?Q?peWowTGwSeevUJnR/Jgfvo1UENoeCAqbKqocuzByaeitozZz/46T1kMEvhHy?=
 =?us-ascii?Q?Ul/1dD5XPpIyCBnnZ1vFyqRrjXtrqHFKDfAbMgxtQ6SN1tjNmFKYPiARWzJt?=
 =?us-ascii?Q?7JDXk4jpo9OfPZs6ePQw8oGEpKBC2Leg9AE/fU5Tbz0+UWXZb9lYJQ+3zoHW?=
 =?us-ascii?Q?nFrUcqDJpum4gaa3P7RP5zT+w6vfPcGTICri7Ez03TnCRV24euCAagwIIKxC?=
 =?us-ascii?Q?V3vtecShjyZKMZ0ufO5GmTrG6neFZ3iYeAzowHEFumoP/l4EHwlRlb1N6XFQ?=
 =?us-ascii?Q?6haJaFLtfKtyGvF7pPH6UivbCGanm3OD1WWSjfXte60pj7WsW3VqKjRa/G8R?=
 =?us-ascii?Q?tcbweErsP3gMMiX3VjrkvWmyQjGgtoA2UzjLJrfgkE33yUzmtFk8ooXpoEYM?=
 =?us-ascii?Q?Sq14ANuPe8rOS5BNV/zI21ttZ/20jl56dIkXkmFFK7caUkN4ymZGiNVE0OMu?=
 =?us-ascii?Q?2cQyGkIYrvQev7miSNSF7FMDxOpdFtkiNr5vaWkfGF5V7SDJ/dLZUrf+4HoG?=
 =?us-ascii?Q?aOiKCV2F98XcdlrU0dA4KkhzGsVHz1KRczcCiBzgW6rOI3f8QnKH1Or0o9dB?=
 =?us-ascii?Q?kFbSknEs+phJV2WLb50g5MZoOgPB5tw5tG/aqJoje5JSJ7uP0ZynSdQxbZEu?=
 =?us-ascii?Q?RB9JE9H4y2YdS43jZvImDWAYJ0/KUC78x57g9JfAyBOrl2JggKmcACM3XgTU?=
 =?us-ascii?Q?O9a4V9jV8QfB6BPEaVB5BvqABAkf/xMg2oTCPqDndstjPGbdgv/9ABUsxsqu?=
 =?us-ascii?Q?OOxn6ELDjhlNLuxky/LQkZLYmGKPvw8LbqyNSbbALHWvPq+2cbQVa0R1CKvN?=
 =?us-ascii?Q?QyH2ybTHSHlhwBKmppd7SO9LRTE5fesOCK36ErVTAJf5I0wsvEMP2GzIKgBS?=
 =?us-ascii?Q?oEITXG+TVql2BWw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 17:04:10.2846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: debe44c5-6c67-4865-9cd1-08dd2b4f79e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_090420_215614_11957AC1 
X-CRM114-Status: GOOD (  13.43  )
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

Fixes: 4472e1849db7 ("soc: xilinx: vcu: make pll post divider explicit")
Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
---
Changes in v2:
  - Changed patches sequence to have patches with "Fixes" as preceding in order
  - Added Fixes tag
  - Link to v1: https://lore.kernel.org/linux-clk/20241226122023.3439559-4-rohit.visavalia@amd.com 

---
 drivers/clk/xilinx/xlnx_vcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index 81501b48412e..88b3fd8250c2 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -587,8 +587,8 @@ static void xvcu_unregister_clock_provider(struct xvcu_device *xvcu)
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


