Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC384C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 07:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImfmA7YTjbuyPA3PgekPNGgD+bNMUMbetigG1vwt0D0=; b=GMLk+Zqvt55mgypclA5UBTFQ2w
	ocxy9w6RhrUvWMNKYAY0XujrrhB/W/cfrubgY7rvYwd72gcMC57ROySjiaPzgAC47v57Er0pFCj62
	CJ8n5iEm+jKOjhLjTNH0ZLEoOhdn2LsdFUeSAhXgUyqc1ZRcJVX4uDIZrO7RQIHaxEfRU4XokSDnH
	IhFz4eomldafF+ejU3tv9rwVag24bR/5+DjsjrbChsCAGG6tSHj0EN9boRI3U6Ke0ktcipl5Y8hAF
	wALDGpTGP3UqovxeJIih2rLgorR0CDph2oVY6MBpowi2ZQoduzmI4LXR4JoxyYg/Ysyq2IV9oLI7j
	YInz1t1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphYn-0000000Bwx1-3bOE;
	Fri, 31 Jul 2026 07:21:37 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphYb-0000000Bwqt-3kNe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 07:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+FsSV6Jd7BPxbBPKBHfdftfhBlGDsQ2sImqm/7p60uZXHChS0FPXTNSpLGNS6JUw7hJhLwVCv+qlExpiIsQSPksIlHz1bxn/K5VLEVZI1eG3jRPev5tAajnLCLUzlKkDguoquRGUE0gSHjvaKHZYPwrm7SxxDjGEfOwa6xCuc6SxrmbmPcqctVVZylWegXTixPIIskE05JET2804yrJANIVpZ/3gNQ2TWbeVuvej2fthChgq7EVHT3vNcBvnNZ6p3mA/xughhkvQpUuNdY6ArITJVdUaV+l5gfxUtlOmGFnqBh7nfx+TBjVe3ZtbFJJLDzR9f5jHEGZ+MYLBEnndQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImfmA7YTjbuyPA3PgekPNGgD+bNMUMbetigG1vwt0D0=;
 b=sMbjS8pRXmf+GXaFIE2qhDgfTO0FCKbiWgVn+IfoiURnyh20m3RvwRRohCqkDIgJ8qK6NsnJpMhPNp1NzyoKayQDIT2LVNS676/13PCB7ZaTXVpqZIa6C8quw8Wm2naPSXd0NdCycEWZHW010WNW7X2iFSDsTPOF0GSY/48Q7xiAzbRXu1pwYdkLq8bTbwCt02WLGV9l5a1vtJRHRT9amUONLJcLILM6FdfHalaaEQlcg468ODqdooX0OXtIGw+qHOXb5WEX2vLx17PVMUWHxu4hgXXJUOKQ/OrVVyRbedph/Tn78Z4z7cxvonPfKih7K/D7sRiJgDg4iM6skj+xug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImfmA7YTjbuyPA3PgekPNGgD+bNMUMbetigG1vwt0D0=;
 b=j/Z+qLqlXe9qYjQR+uNkOolf9i8fE+WRq8ZFTeHyJDLo8KrcELhnX6tUeNg6tsjJkBdAL0FILLVb/qvekGxPBxaBlPuPVQjgw0J1KOrZTCPNPnLaem0otqJMow+h3nxxMRJEgQl0RYRi0qULjIKFkmtufQ8CoNK9k2sMAwN8H5M=
Received: from DS7P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::16) by
 PH0PR12MB7838.namprd12.prod.outlook.com (2603:10b6:510:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 07:21:18 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:8:1ca:cafe::2b) by DS7P220CA0011.outlook.office365.com
 (2603:10b6:8:1ca::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 07:21:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 07:21:17 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:21:17 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 02:21:16 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 02:21:13 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 6/8] clk: clocking-wizard: Use dev_err_probe() when mapping registers
Date: Fri, 31 Jul 2026 12:50:47 +0530
Message-ID: <20260731072049.957624-7-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
References: <20260731072049.957624-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|PH0PR12MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: e97a2819-f776-449e-d484-08deeed4503e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|82310400026|1800799024|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: G4vv8r7y5TIFEjf3QzQhEto+zwiz0OqAm+uY9ubZ+XWYI9+B2UVRIGtZAPL722ssdQqkhQfyJZU5f38wgJoTM0w89CC4S8wcICtTDLVDJdvMzwZsD94jDk8NIVN/dQZQZN6rDqac2f2XWKmBBfZIeHwzmZm50rgjaHQsNq9yshtrCy2fIW1buLiNs7OeUU4lyjL67bI5j+BOjb2l9dKpGhfaot8eyOcdZHUdCFuxwrLA2viWIdLFpHMZjdF4eN8SQpjf3D6cE5j4IxYffesycxieCFvbq6hk9ofGRN6osKrmym4ofGutFhCqQcdajR6aMtHHa4JGlKOLdXwt8bYJ4UaAZmtWCmTOQUY7x3cwzBj+Smnmzp1ZBWzBrj32higWlfXMODHscW0Nr/cJT1IkYAE+sOY1TWNAoC6l63A+9+F5ZPuueLea+aVZJARM7uRjguwUvKzih3pVsfVZzAdHOlH9HOIazNFikmvUVF1BAunHj01pmvsJkzgnyVNsxK9BDVta6o5eeeygfrt0dIdzk4yueOib33tKo5urLpV3Ai7nTX/GYdeBtHszOcMMinTps9ZxkSYeZXa2Ya4zZc2vO8JHby3u1F38CP7Wl5pfRMkSMq8DXrGES/vtyE0vYYlONMzm4CUP0VoaPZsZH5lYakYy5gpCwKq3eUG3BpmQnFQxeYHBqPv8pMqA2VOj91kr8iTF1+rqZpY0S17pAUWsxQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SzdnsEtVdrq322T7IDlAKGAuo9KHnKoEX+KKQJCvUGKPSdTQAGD+P8zZOG5mBDTMM488tS4xF3ueXk3yn+ge5jS8Jnw+v0HkSNLFnj7u82S/qYCNkl8maaYm9pblwszsoHYzArc6YMmDMdmRHbd6K3q4jpbrgkJqQeLUbR0ZSCuYgVlrrf2nxm24mRJ6T/ruEmSkTGOBntIchR5/wcckEsAlK2W86N1Adf1SBDO63l2o8mSFkRxjV1v+g+3lsi9JVk+cmhub+GPwznf2ejMUYkAkbcUMC+2pYMTqMInZy6bK8Vzpmy90FwYiElIpWJMhHUE7HMHOc/RLDevHK5IBeXqa+5L70J76eWcCLEDPNRzcImmh99z3tGBjRE5cQsjIKgr/fqx/ka0rP6l4RfnvYTtUN3U2TbLbm971Ea+EtibuVt32aRhxFYa8kPQp6S7b
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:21:17.9580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e97a2819-f776-449e-d484-08deeed4503e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_002125_939031_9D9B0EFA 
X-CRM114-Status: GOOD (  12.18  )
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

Align the devm_platform_ioremap_resource() error path with clk_in1 and
s_axi_aclk handling for consistent logging and deferred-probe behavior.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index c79733f58082..4ddcb4135306 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1278,7 +1278,8 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 
 		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(clk_wzrd->base))
-			return PTR_ERR(clk_wzrd->base);
+			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->base),
+					     "failed to map registers\n");
 
 		ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
 		if (!ret) {
-- 
2.34.1


