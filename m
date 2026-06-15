Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24CACD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 03:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSwIEgBSMD6gS8dnYUUWT5EjkcRg9Qd+wLOcAS8AZqQ=; b=K9IoAK3+ODEWYeo9+0PbVyiC0K
	noQKXLsBjp4UelwvFQp/bkVvKJlp1TUyzviNCRne+bD2TqgjgoZNs8UQcBFxD+2kR5SjQnGbpAJsU
	gYdMP8j7zAcpPnLKklQmtc0U1LkdgLclDDJR0Y9Yfjwy68e0uLNKmJm1btOy4Ss+9x2EYC1Y7O9ow
	KRhM9AAQQqcM9fXu8DDdtaJ9M/1BN6dLONFIDomNlLi/yfGkE6n4UOy6QJFcIzHuAU98/14NPCIFm
	KO3ukkARQzsFCJ8eo83xWTVqjkx6zpMY3Z6eEymBYE8J+/3I9rHNV1zAKvwaURlQmzJ53fQFruZQ4
	7XV6n4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYyK8-0000000DXYj-28cK;
	Mon, 15 Jun 2026 03:49:20 +0000
Received: from mail-centralusazon11011021.outbound.protection.outlook.com ([52.101.62.21] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYyK4-0000000DXVB-2dp1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 03:49:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYZ1rtgKEXzY6QpILdrg2hGQFEUqKy9RiXjEXOoeF+oTi03H9EdvfZ10UVR8cPR5sfXpdaoV7eB6dhpMKePwM9zEa0xAlN3tRE2ew7cyv7jlFYbocN2G083+56BUnoLNoVRVEdaBndE4fRDb99y29uMSJ4RajrHHv6Qjo6ah8o1v1iz4qsv8o1SXK1T7E9WDJg7BSw/mYReppjLq7I3qYEhKkSBqzeW7XGIHtSpsSvJ+LQiIb0mEAXFRlCIjzu7/nx4aN4rhYnTc4tXGjdpYeK9q40PeW5rjHwujRr130BAoADfxy0AAkb3lcWp/zoHNRINL/l9dRVFEsuGz4O0vTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSwIEgBSMD6gS8dnYUUWT5EjkcRg9Qd+wLOcAS8AZqQ=;
 b=FXbnvRDnFAx9lkspSsciUZ+hwNZjTGMiu0bd1PZ1CmNRfLnDde1S5zz/ZW3Mt8r0ogdQn5gR3BKKnsybacUYH6JqD4e6p2ZXIQUVR/mo4u/SAEO2HDvfgR9UqXkQtJGZPOzvCldVwO9vBOXkc29BDLwZP/Jx4rLpe45tDQWkrIMHqLmptZ/cAPchasAUaw3D7CnqGiKNapjkxy0vZoFKA9GMKDqk2zKOU4vlLjoDD2Z4x2m7vyo+cZnOAyJe9SEkEyAWH7nBZeANXy25KsULvBroaQjUOgsJsXpxnXLD2aIc6bORDuzFXhFRceEMMOnj6tvaFRymgqi6yzgNylgnXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSwIEgBSMD6gS8dnYUUWT5EjkcRg9Qd+wLOcAS8AZqQ=;
 b=wTE11DD3US0GCH/Q1GTk7bZ8VC+dUD4JflfZUgyZJ7/JjZAiIgdpi4elR2NlYsWvHV9iG/QDUeo8jzxdZsa63RvgL7kIW7K+WvwNyHtzq5o9FkGTrw7cAYo2PJpZntJGkBfzyeywiDJGKwwKrPJcmOGIqzdbBFAt62lb0OVXYm4=
Received: from DS0PR17CA0011.namprd17.prod.outlook.com (2603:10b6:8:191::13)
 by CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 03:49:10 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::1d) by DS0PR17CA0011.outlook.office365.com
 (2603:10b6:8:191::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 03:49:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 03:49:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:49:08 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 14 Jun 2026 22:49:05 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 5/8] clk: clocking-wizard: Move clk_in1 acquisition before static-config check
Date: Mon, 15 Jun 2026 09:18:42 +0530
Message-ID: <20260615034845.3320286-6-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
References: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|CY1PR12MB9697:EE_
X-MS-Office365-Filtering-Correlation-Id: cc650414-eae4-4ffd-a088-08deca910ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|56012099006|5023799004|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 49NxBkA4NG8flTabF3V5WnihxgXgmSWUE/59j2hOyxa2ZlCviM/i8nJcM8E5FWFRfenRr6lUXLZu0cKDOF2RgYJgLI+uodGlftw0Dgmqt8PQKjm/zJ3eDadRKc7ESu9lDSnIrGDY0uh+/DknCw4fwbRY4Nn6FVmVn/vk1VebXyJMriCiv7B4pRIwox2CsWEJBha9W8Os94z4+1/y0JhXd5IOILApL6PJ2/MM6mHnGlWsVqSWW9KjLUKeIVJf9mMFYpCSMn2q/JvARl7BqdmyJS/WVEQO3tWKAAsdwKaY20P9RR7tEvysV3stzwcZf8VWAeWlyapSbJNusHw9AOAijR5QaqDAtwF9od/RojDQ2qDZiFNlNPomGWDE4f+LxphozIu+Ev1J+BGyWV6mHZCL3b64l3i89k3Y+BOF5PpmYZ77rvCmsHj8nx4oQ0WSIzfEhrZ/GjD8mxMCjsYDwfNOpTthyF6LTik03rHfaSAwKndjHcPavSG5bC7i0PYT6PIQMDKc3G62BDcTh2kLoQqEssOsTGEj6CEIEGq5+YMagt0wKERibfi1BDwwIbFA7J/rtM4GdYIvb97wkRRDJzV86V0N/7iSwDCwUu93JDntQi+jPKVCtBst5kBFzV8ItRfoYL5g59uMZVOo3TNe7MgBjeB8YJfu3BjiuOcG7MpFhDY7VPUbl9Nf7SoGJcaXq1icHR2hR9Dkwc9FuWFj577BZOO5TBgNJwvmJoT4HYx2244=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(56012099006)(5023799004)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XKXck1YUWEj3UZ9jM0ABQDIGg0nnLLiZ+JiY4MJr7d7Lcrb/rdz3x5UuPJjLpUAl1Z3R8fd3pEMgGgjDuKenS+CiO7tWtvxfMFlnRAJxes9LGfLCNJ14REcN5FUNPCraPXC6pkGaD7dv3Rfl8k2iOPlJjsU5x/OngkLrUfrTJgBI9l+Dttvn6yDB8y4a5HWvFKzjaTvtFWSCMpe4H9jW7D5ZOlb8HMmiX1iGOsRzqF06gZ1l37EMdO2VoCuOlunUCbdP2T0URMPvVVeAnxH6RV88XQtTU00hcQxf7jC/Bhyrs4Sc0TodqZxCrhaYBxSWDLl7k4jVhRQGG0uqhADhz3D7Ad9C9M66cEJIrGDUE+DgTjMKafALe/5enVR2JF8yk6b09P/D6OiyQGrm+w6gXkioPBZTRR3FT9TYQHkFldG5azlE/dwaBxP1/a2o9l2o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:49:10.1114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc650414-eae4-4ffd-a088-08deca910ee0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_204916_671902_69C2FFDD 
X-CRM114-Status: GOOD (  12.31  )
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

The clk_in1 is the input clock for both the dynamic reconfig and the
static-config paths. Acquire clk_in1 for static-config as well. Output
clocks are registered as fixed-factor children of clk_in1.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index e082051221be..ffc78c90bee6 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1178,6 +1178,11 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
+	if (IS_ERR(clk_wzrd->clk_in1))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
+				     "failed to get clk_in1\n");
+
 	if (!of_property_present(np, "xlnx,static-config")) {
 		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(clk_wzrd->base))
@@ -1192,11 +1197,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 			}
 		}
 
-		clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
-		if (IS_ERR(clk_wzrd->clk_in1))
-			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->clk_in1),
-					     "clk_in1 not found\n");
-
 		ret = clk_wzrd_register_output_clocks(&pdev->dev, nr_outputs);
 		if (ret)
 			return ret;
-- 
2.49.1


