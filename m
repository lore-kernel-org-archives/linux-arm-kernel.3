Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38138E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 17:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z22F15rGZHFba0Gpf/PxN4PXeDcKdofUUQQVfwRVmYk=; b=Kj+jTHDT9zYNxC36kHwC2jxXL+
	2lt2y/zpLwDzBryosw5OLmKnhGeBnuGs1X5XjoKgnuqAxMgjdzE84Rp4mjJiNjUMhhPF7ZQ/+yKOt
	bAyZBx0tAtDJwhUf4HnC1U2kLy/oS47C4+3EoVoJapcZ4aPpbC7RhZt/xjzi5nRI17bsRLqNoQwDL
	/VnEO8BTzGn3ge0eQnfZQt9kLOaUJYEs2VDgXI6QDfH97qRf7cWQu18RApEJwLNLcp1oObtn+3o0Q
	0+gye5OJymq5QtU6t0ZOZEIVMStCdnRX0iy2NBXgGC7/q6ob2K80qpyZSH2aBCGTWZINfp19zJrp2
	LhN6jBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOfv-0000000AwKK-2WVi;
	Thu, 02 Jan 2025 17:07:59 +0000
Received: from mail-mw2nam04on20612.outbound.protection.outlook.com ([2a01:111:f403:240a::612] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOcQ-0000000AvUB-2YlJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 17:04:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7Bti8BEPgy9mxWb/ZLIpFUFVqry4oZZFQ7FeDTQI164T4sM6U5mieF9wdhQEq/3XXTPJ85nMN3QA1BvC2SonWSHhWwLQi+AxOPCrA0Srf3IybNtrBfU32P3r9Sz674KnVGj64Y0Up91DEmcPSJwSKVtiIw7nOYxdoBw/HghK6AlC9iJZkVep0Ybb7kG/0LW6H5pSKAMRukP5fCDrkGMVOlFNUsIqNpRmw94sFcVUfl5xSpUJ5uv9rIAAk88NaSbCRKBMR7XE7+qKifBJMy5YjZi4LJBsr2D9PqiN7q2KLkJq3uQDeFp2MT2FF7ugJ7WRT3k5G8vVVnTQTErvDEMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z22F15rGZHFba0Gpf/PxN4PXeDcKdofUUQQVfwRVmYk=;
 b=sThoNNtVqpaJlac54pUxn2xDC8IjwLIhPJ04ryRqjd2X6dDISuml/SypWccdacI2Z9QBQY7/x29gEpOchclq1oS7WYpMBUyEEk6Lx5aLl1Jy+B/jxBQQp2pkGsODdZOs1CQPtxiwj76Y+igNwBd7pMTWQ8qpkB8maqg2zJUq9eJmtIVVf62pYKEUahNd/HIRuTvXzuRSNyEwdJCpt3VLmX5GqRW8ny1VLyHtSMAFDCkI/Spzs2374c30MfuVA4FTw6U0d24kvMXekkuSrNfPb9MH4HsMOqRdJhE7YNCMblnU5wYs5cVmo+hrZjhiv6Q6znGI2AiUIIyjy64hJsfHmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z22F15rGZHFba0Gpf/PxN4PXeDcKdofUUQQVfwRVmYk=;
 b=F8yyiwLNf9WEWSNzmL78msAni58m9TWldcUQvI/K7ln/JTU9oNikMwey0fYCM1z5+i1LuTtjPPykpSNjgCUUrQvdZGbvdDhLBMgw85dcgFV2VjVyFYNogUAAs2HlqlSSzZ/h8nqj3DIRDhFadQNX1YenB0v03EfsuWrzEcxc5Tk=
Received: from BYAPR05CA0019.namprd05.prod.outlook.com (2603:10b6:a03:c0::32)
 by DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Thu, 2 Jan
 2025 17:04:11 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:c0:cafe::b3) by BYAPR05CA0019.outlook.office365.com
 (2603:10b6:a03:c0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.14 via Frontend Transport; Thu,
 2 Jan 2025 17:04:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 17:04:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 11:04:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 11:04:09 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 2 Jan 2025 11:04:09 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <michal.simek@amd.com>,
	<vishal.sagar@amd.com>
CC: <javier.carrasco.cruz@gmail.com>, <geert+renesas@glider.be>,
	<u.kleine-koenig@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Rohit
 Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH v2 2/3] clk: xilinx: vcu: don't set pll_ref as parent of VCU(enc/dec) clocks
Date: Thu, 2 Jan 2025 09:03:58 -0800
Message-ID: <20250102170359.761670-3-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250102170359.761670-1-rohit.visavalia@amd.com>
References: <20250102170359.761670-1-rohit.visavalia@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|DM4PR12MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: 123e6475-e369-4ecd-5388-08dd2b4f7a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z9MMT7Ke5f3dzCGaZNxWt8dcmILMC4Zta4A3YOiAhgJQQM7nA4EFJRubt+HF?=
 =?us-ascii?Q?iTD4FS//D30cQZCUVmLW/845r/8VnrylwVvVX9CtR4z40wHeF79ZotO3PBpP?=
 =?us-ascii?Q?Oz/0piO/OYiuMY1yFnS7AxoTozHgWO3Ix/RDPwFnNV9+CoUDqKwm3MDj8ZIp?=
 =?us-ascii?Q?cEzTNer5Q0qMyLVQx89jG8Ye4piPKyi76jz5vAPQSaVma7gCjxXrLyMW5ADL?=
 =?us-ascii?Q?wovINLcM91EEyWKbR8OB4h68Onrg1gzJl/wxlcceDWVk8oVLcIO9OaU5hMRd?=
 =?us-ascii?Q?lD9lL2mZOqYzY8W0CUu8W8oIT9yo7tdu3gLe/Kn/0r0mUG7mCoZW2LJ7j8F6?=
 =?us-ascii?Q?E8uTZHzheE8OMMh3NkybSS9D8+I7uGqSWla1wuj8imI3MBipBtbGSZ+tl+bu?=
 =?us-ascii?Q?ZluS50wKQu0p37X7hkA/P+/+PA4ExAYibWOJn5yBmbQFIGdT+vZp9fRlyhFc?=
 =?us-ascii?Q?qi95KSmtP2l4xv/OHt2IyYAHPqH/RuCZGyGEwz40e52Ifs3P1XPFU3Qf1jYB?=
 =?us-ascii?Q?0EdgghgWuvkVR8M0LKMuwa/HM/ETaV+36XxdEruegwCx+38rGOUlV3jMSDZD?=
 =?us-ascii?Q?Z/b6Nh4dZf8AmDZI9tx7upeeu7lwfkwA1ZDh93uYL8D4xG+G5aI0hoDdePjy?=
 =?us-ascii?Q?ePwd+qz0MkD3ax4IZAf8CVZTzEp3M13dNeARknJf0BW7cyUYsDsaHXiuFLVr?=
 =?us-ascii?Q?GDabWj6CWPbCm5v8WFPOaJu3+As1Zis9pdyUDch3MlNtpyj14mAimd2x3ty/?=
 =?us-ascii?Q?Q7lVx+5UDq9oRHjNV10jvwqbrw4aUeapT8dsWUR4blMNdQUOMvL3wghV4Rhu?=
 =?us-ascii?Q?fqAmwBqMQnSRfd+Pd062UpU+OI0ANmJNHGIVQoX4ojasnKwcOxOCNf66da7a?=
 =?us-ascii?Q?ZcgEPVyR8khe5e82cFhNAea89xBdSnqpiDH4XD8/ppBSE7FnEe+stP2Y74kY?=
 =?us-ascii?Q?boGfUUOH2KDDPxTS+AEtbD8ENA239IUbaJORXFlgVuBucC2NRIVEnxdZ2TJ/?=
 =?us-ascii?Q?lsfulDLTvP1X/H8aDfIVykN7t/cjZr3dXy/cUqhcw47Mk2Y05yZIAIHxAa9O?=
 =?us-ascii?Q?eQcqMMlOdTkvdfW8cbjU10pUNn9s7XeVOF+pfPYdsaU8eUA9SJkvHAlw2JyA?=
 =?us-ascii?Q?XIpxx7yYY8kWwXKXgUitIPlCJ7ylA0L56KfrBRAQGS0UALcIcSU1tPgdHOPT?=
 =?us-ascii?Q?m/NWV+Z5lWiuJDj3ICY00V6DvJxeKEl/2MLRSlSIHyjpXIyDL8OJVSk5e7d8?=
 =?us-ascii?Q?+G00zksCW2yKJLwRsQL0x5VZnTjqPEjiscHLYHNCFiFU6PTT7GFuCKB2MOpw?=
 =?us-ascii?Q?SZdHHdls55nDI6Ias5bf3PaSjgI0qgrm/yJwMQv0VPCbPM3ezfn7OIK5dk8N?=
 =?us-ascii?Q?wPhXDdzisWy96vMh9vfJYbfAEIEwuSH+wNdHC7zAPhy0FluAakwczscLbDas?=
 =?us-ascii?Q?UpW0dwa2EPAL+7F7UAO1YyaVDbrPVavdGCIPORoE0IjhkmN/KYM8b3LRshZc?=
 =?us-ascii?Q?bc8JTq3FELj2Abc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 17:04:10.8755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 123e6475-e369-4ecd-5388-08dd2b4f7a46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8451
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_090422_648947_5D6A2312 
X-CRM114-Status: GOOD (  13.04  )
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

CCF will try to adjust parent clock to set desire clock frequency of
child clock. So if pll_ref is not a fixed-clock then while setting rate
of enc/dec clocks pll_ref may get change, which may make VCU malfunction.

Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
---
Changes in v2:
  - none
  - Link to v1: https://lore.kernel.org/linux-clk/20241226122023.3439559-3-rohit.visavalia@amd.com
---
 drivers/clk/xilinx/xlnx_vcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index 88b3fd8250c2..c520ae1ba65e 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -547,7 +547,7 @@ static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
 		return PTR_ERR(hw);
 	xvcu->pll_post = hw;
 
-	parent_data[0].fw_name = "pll_ref";
+	parent_data[0].fw_name = "dummy_name";
 	parent_data[1].hw = xvcu->pll_post;
 
 	hws[CLK_XVCU_ENC_CORE] =
-- 
2.25.1


