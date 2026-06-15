Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D57CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 03:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFyBV90adYeJCdF4jSwYQMSG2g4ZBZ1oQNb0LnvvTlg=; b=IJUeeyBG1z++RWefK+/wYjloC9
	8W7/5mIvL1lAKO0PlOgRCHZz65tFCm1gDR3grE+nr+68SB9zOXZ7U5LXPhzYS4jQ7vhsgQftngS5J
	XPORsHve05s9r29g/GpjR54GgoaEifFjO43JD6/C39XdnoLI4Gg+StwOkPgyS69tHJr1p35qu/FZ9
	u93H7R25GCOmDQRuALuqZlt2ZNBnEZlumoFIVfmqoLhe/PF5/PuKMkdHyc3N2XezGoQ9Pjb/1pWMy
	nCj9AHHttfKG00t7n/eCu1HjtWhD2Lg5luwKToAQToN9t6WpJa6xY+J0/1J9965499XMsKCybl1xV
	YTLzxROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYyKN-0000000DXnE-0qFX;
	Mon, 15 Jun 2026 03:49:35 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYyKK-0000000DXjQ-2xWg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 03:49:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVyliztxKFYJzdBZjATkA1yMKe5+sRlIuqXUxJyGch4/bynqw8C8Uw83jN9sdIsP9JWVDRw7F1IK0Y4/HZzDE4JxIAeglvC/7+QriNYIvelKZfETuadxYfe3tnbJJR+Jva2b4ipuP1n+MbGqWaKKPImrV/01OEFyQ2zx5z/SNkjmK/+y0AMt4rxXxZHL+LaivwCTK+nOfF6iYYLKPAMzOBt005WtNpxpXHsH6MXRExgXDsLaL6bSKLghn9Z4kVZcp9BI9WSZlLa62t9DQeTYRu5FXbOpg/63bsdMMWWXOQ3/uSlJpDy3o5ZGVOGkfHOJDYtQ7EXNxhNfY5uGzyUZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFyBV90adYeJCdF4jSwYQMSG2g4ZBZ1oQNb0LnvvTlg=;
 b=JQvsIEq7B9t9Cpq83W/GdfyjFz2JLZN9SAFtjHS5wJxUcWjWrXynqM98H9j5KFkGp2wfqZ869vAaMiaOo+4Pr4LapFi5icbFzdB3cV1LHfR7HQie0ZJDvseBtCDsGv1Ugqx0qDSmmldAjQEvvxv59JMELj4FhrkvdiRAxgSK/8Ac48eCfnZ03rrXa6LlKBI0dvhBIa6nC/PwpbfUOy4Ff43rcd4XJ3e7NDwKT67KhIKHl/qhgn3aUqxUNFFB/CeHF+fSNgYcy2w63dZ1L+JsBeag7Yog/2Ebq5pK8y0Q/RseSREJLMNtIrpFKdPa5Vq9hePbY83MY//Qxc7l0UczGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFyBV90adYeJCdF4jSwYQMSG2g4ZBZ1oQNb0LnvvTlg=;
 b=RbiUwpucFbiDrmNn0T6fyPnYGvy0PH6TVjAb0aVgNamN0IvQ9Ous641KUqFawaCfsST2Re6nYn0evgZ/ThbGMscHLzVGHHxr8YktjR5HbqQhsTMvXEvSKg+H6y/eibavUl9VxtKNFeBAeExvogJxBSg5ux6hSMNNH4wrV1gGFSk=
Received: from SN6PR04CA0091.namprd04.prod.outlook.com (2603:10b6:805:f2::32)
 by PH7PR12MB9201.namprd12.prod.outlook.com (2603:10b6:510:2e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 03:49:21 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:805:f2:cafe::45) by SN6PR04CA0091.outlook.office365.com
 (2603:10b6:805:f2::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 03:49:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 03:49:21 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:49:21 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 14 Jun
 2026 22:49:20 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 14 Jun 2026 22:49:16 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek
	<michal.simek@amd.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 8/8] clk: clocking-wizard: Use dev_err_probe() when mapping registers
Date: Mon, 15 Jun 2026 09:18:45 +0530
Message-ID: <20260615034845.3320286-9-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
References: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|PH7PR12MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: d89c52b7-e62e-49ab-8e56-08deca9115b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: HBgCmf/N+Y7z6Fk9GAaG6FJCxSTCUSs0x7WWLWhUFWc6RJ2lzorLzWwIh5KxuSncuBEnaXdOeWiV6wHNp9noDslNlemMpXJAh0dWXIfLxYRYVLUnmcTVaQh49cLo6zyo0kjJWALrxBqieTYTo/QWFJHCVp7M2ZLEyVyb7AFTa9ya0IzrNvgCUdd5XcB2Cgbg+dfYanI5O5BG9pRYg2qhr35ei6zDmKZV5qWfQSjKRRubARIUthK0MLw+GrtQYjW2AE2U7TLtaqlLYhPjzVKFUJHF9yxGN7ku79OLcOsLBPJaF1bf++sh7xgXoVSwKVaQNxUOWS3Mf2Ak00YOVlQ1YdDbghGIHPjfeFYSAl4O1PrLDl2GCqH+ogNVt8DkPAF7UPVtlxkdJgkkSb129b8B29h74+OVy3ywo8UURITjgstPeR5jUfESDgeWh4e381vxA5CPNq4M3v34MH1oW6jwIABpQCqDjVzrbBRIJI1eadI1Lz0SFNrOo6BPHQ7oPD68Nf3HVRxV3u6ouaw5WcGEIrWHMr4m6pZHv8mTNDiffzf0WC15mt+2hc6ajsr0iiV5GuEMtj40M3+bN3rmCz94wZjGEb8jGgs3S36D0GEX6Zu4fI39M8Yx0Psy/W2zRYHP+1pg+8XoIC2x8RdnteHgxtUqfjxhw8Rh3pGmcLY+Gk6PnIrbyj+OejDYFNfhRhvPZT4qmBdPn4RkYkKVeGwSvjzP/+Wvxbuz/fixWPRORRY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BAyXqrlyv7E40gA7vXh7igEkZmv4p4lxfJUy2rXPWnOTQ8x+jhiMBBfP9nDReaHW2iqTCmTZ9zZ2Llu2O87IOMye2WGuhR9KQvZxkyhh3dVFMVAAVOusub8YLPJDw0hzHpTI+TzBSM3lh/qemXDCJQdCBOJ3aSWDzJcWkBt+XdSu5N47xkCZYEI41nf/FAo/HGmuNX1DWyFWM+7vhDGQvIjYz1GkNkEVa2GaSgeM+Eq1SkyyRX1ddS3fjfb41qMvj/MxO7yduWB+bWNSnyTM1OOF0LZxGpAvy4bQxDxjeVm1NmmrNstVaiV7e+a3H6B6qJpmt5iOTnYSKxC1OIb05BGjLhX5zRpcRavzr37ncpUSeKuKFSWKSKax8jrQ5wKlp85h8BMLk5bEVAwnXlsg5TeF06CeJpi5jM8pzCYYyfKlrh1sM9VfUI0NEpET7LGg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 03:49:21.5635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d89c52b7-e62e-49ab-8e56-08deca9115b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_204932_749225_6A695A07 
X-CRM114-Status: GOOD (  10.57  )
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

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index fe73ee02b54e..381e396aef0e 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -1277,7 +1277,8 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 
 		clk_wzrd->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(clk_wzrd->base))
-			return PTR_ERR(clk_wzrd->base);
+			return dev_err_probe(&pdev->dev, PTR_ERR(clk_wzrd->base),
+					     "failed to map registers\n");
 
 		ret = of_property_read_u32(np, "xlnx,speed-grade", &clk_wzrd->speed_grade);
 		if (!ret) {
-- 
2.49.1


