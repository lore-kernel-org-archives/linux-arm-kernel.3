Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C85ACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 03:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpD3wie7IfodzEahDEfC3PG3TVGhSZCv0NNcgMG5xIo=; b=S9Mupi3VJBJMk2Bh0NwUKwCECh
	VvJH0au6l+tgo7ej8IzUZrfuNb0gsX9r9qDqDX/aKVSnAefF7zKYf5D+tl4ZGnr1iM3uJzzAQPpDh
	SvDowXJcfa6mpLjNkmDPdIemYftXcBuXQ1gqUVls30PpEZ80RrNfNKq6+Cy0LzNem/F/wyf+t2I1X
	BhhofecjkIZ2KM3YJxkkull6YOMoU2DFsQoe1eguzDmYna1wmuudb08EsiTgqvqL09sWdg++W4wY5
	98LQrjMm8GVDuG1gNaFuwV6a/e6wUR4hgp4MT6MXytk8Kmd1ODrQoaSr8w9FdAJYwO4rEzHRNqkCa
	Eek4TkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYyKB-0000000DXcC-37bF;
	Mon, 15 Jun 2026 03:49:23 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYyK7-0000000DXXf-3Orl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 03:49:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sjr6O1rsmopRtiaLim86dJrUn8t8ybk6G5v2eNUKCmwwikiT/J7RVpl+YF682YzTaW+kkyzq3zyMwTzn+f2fas/MCT8dcxLyYJigC2gCwBbUb+ILUF+gLqDD5RXRSa2UtpUAtMQDtbNxfFCgjtsCRBYFR0ah47V6gBOFBNKtyqcBtUzus2SjBN0/NMMyYe8Lc87aVhjQffyznSBln8WGLUaEqyl/QCMoh7VVMPF92ogRPN/KLg4aYcs+1iWn0A/fgJWYnTBF+iiaVYYZswwE0OytVsD2CvO+YPg7o1G5w53d+L2Hrn/t1EDDCaOfj2/4i8tW3lR7lUGCkDZct1mKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpD3wie7IfodzEahDEfC3PG3TVGhSZCv0NNcgMG5xIo=;
 b=O6tzSa02Nd6Z21OvPfSC02i15NTYZ+G0Pit7EVnWXmkddP49Yu5g6GAnonn7j+4QAGAntr8sw9iFd0YRCCAQVLdkbu8I+yPdQxt+8jMtBvBDGEQE/wQ7k3HIIm8PNjYJ6xazFfx6xoATfz/QkF8unpd06uBVgI64cErCE3wkcywdD60UKx85O73vbYnfNitrx7MXvN9ruMWVluFXVqIt78wkNpCNMkzzeIvCyUUgwXWnqX8qY9gcy1kK0suvcVl31x+/lYPvzodul4kGwngS2O7DsMmA6+optlM7c1kLfyQfqPOeVHJWCWFkioqxfq18J5fpPqg6DS/XmF79NFdVRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpD3wie7IfodzEahDEfC3PG3TVGhSZCv0NNcgMG5xIo=;
 b=d9wZe4C77oywRc/L6xC9ETKxRgj+nk6P4dl93F9QDNP9quOWp6lSz5DaRDJehM/zRDGYFOVZskxiY0OywQNbeCBd5+qEJAGPmFx8/wydujRp5RD0qHtC1GjlwYI9RrGZOWW66hHuy1CB98XSTs16YX5C4wtgOtwETwc+9JcZcBE=
Received: from DS1P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::9) by
 PHXPR12MB999258.namprd12.prod.outlook.com (2603:10b6:510:3ca::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Mon, 15 Jun
 2026 03:49:07 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:8:451:cafe::86) by DS1P221CA0005.outlook.office365.com
 (2603:10b6:8:451::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 03:49:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 03:49:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:49:06 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:49:05 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 14 Jun 2026 22:49:01 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 4/8] clk: clocking-wizard: Do not map the memory for static-config
Date: Mon, 15 Jun 2026 09:18:41 +0530
Message-ID: <20260615034845.3320286-5-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
References: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|PHXPR12MB999258:EE_
X-MS-Office365-Filtering-Correlation-Id: fd056cb8-fe6c-4ece-9627-08deca910cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gqy+kxOhu8TrjVKJxVCm/0vaD+PRx9EGzl5U566ZLfNA6MVanpi96r74ARS5CEQRimuq22QQZ0bM1BYlkr5aUDTw0jVPZ58C5czL0vYxTNO6L7JSaE9K++WPhX66EdSmnMYe9lNJ3+XtGYKeuEegtZ3dw88PxRCA/R+iWTloaVQXRx0GssUjFyAMIN/Qbh/hVDhID81A/206HvGN5lGiZzh/i7RPioVtUWc9pkeq9DqT6rmn2jMWlVgJqqxLjx8OArvRXLeJk1VXVaPQFQN7F0SxUV3tDensABKWv9JpdGX55j3+LNg1l2qaplJiOa97O9m/mUXUTA/ViCYMVzT6ui5qHBpieYz6Sd+KXiNoeV7dvw1QfdELCk4kJy+IYmGWZKYOgQMua/oGCliT7QWeBOJnyjAeg5p1Khc1IJ7T3I1X3wjq0fJeItjwx5uSkFXLJSSDw9fqJGYrnXxo3O79r8ujlauJOvtJCGFKMlIQiMVGptMj/HrJBjDxkjsK/4+yOkMixxrEY8oh+e7LmRrP7UO7n3eA5pUxQG2uZxoKOLNBcvnRjQm9keTx1hOkteb725AR6CbnBsK5VwNxEXlr8kR+XfBFuP/LY07GLQDtn0zTSoBKvogSLSdGfe8btJNByMksmMLw4rskV47O+M60ChFjOiWj5hSzTsi+Z+uMQacPZyNhAxLz/DEHtwUZSlgvr38MawgeFPB9t22upXky3SUht/atVZV1F4oqmtfAoe8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1sLGwfi/X7uH1QllXvI1TKwpTNZLZPprjnVBWJL524887+UvCbSTLzKI2ToEfdqOlvyhDl3Ye0/SCAPo85H/gOiWDBg7blB40mTzaPv0AaMqpbsQ8x5mJgbVkjMMRE/+koNkerSYtYBS3AeMeV+qAsMGRZAPHxq4xWns/Kxllo5AOfX2y12MrP6RyLeqXIaifCyTZQWJhL6ajESXaayqfsSH9KhQ4mgVDf9XyfLRwSFK6j672naBDEg1zbauerbRjSpY5dkImY505dxs2PxQbZL9pQxTZKEbq9ILsLxNU6aFY8Ylcv2HS+XxDXH3fbx+uRlFRrVtDSXiFIKvXg8UGpX0tpaVo4IGp69kVGG4l53d9tgvwu2r5Ravq2gi98n61yP/9nX3VOQul+HShYq0iksBExQW1NnORCjF84YjFxPUxEOIaVFPycoOS68c3hl8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:49:06.5742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd056cb8-fe6c-4ece-9627-08deca910cc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR12MB999258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_204919_852497_065F9936 
X-CRM114-Status: GOOD (  12.40  )
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

With xlnx,static-config the MMCM/PLL topology is fixed at synthesis time
and no register programming is performed; only the dynamic path needs
the AXI register block. Move devm_platform_ioremap_resource() under the
non-static-config branch.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 4a0136349f71..e082051221be 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1168,10 +1168,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, clk_wzrd);
 
-	clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(clk_wzrd->base))
-		return PTR_ERR(clk_wzrd->base);
-
 	clk_wzrd->axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
 	if (IS_ERR(clk_wzrd->axi_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->axi_clk),
@@ -1183,6 +1179,10 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 	}
 
 	if (!of_property_present(np, "xlnx,static-config")) {
+		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(clk_wzrd->base))
+			return PTR_ERR(clk_wzrd->base);
+
 		ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
 		if (!ret) {
 			if (clk_wzrd->speed_grade < 1 || clk_wzrd->speed_grade > 3) {
-- 
2.49.1


