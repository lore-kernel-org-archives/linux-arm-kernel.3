Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D49C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IcJ0DVuHP7K4FsoT3ssJd8kPfTTgCTwUYTzhOUtP5mQ=; b=NJXs8RUz/Fak517yk0R4E0D401
	VPiZ8AN9EP2vr3CPByjUXRxLsqocus0Ni774WwDdTuuOwRthD0B6VEwvz29B/0jcjk03TD56gn2EA
	OfpprJFD3BXbrFeOwq/vrAYFILadzGUqkcj7ZSkV1uqUlHmFuMJy/69PGClQdhe7THobZyxD/v1Kq
	tG41TV7Q6MmW7y9GjgcKdqJr1zIUo9za7u6JJNfYeW7ljJo6yyBTEaD/yLD4B4e0p17yeq/9lATZD
	DrQfgrU89+QKUnH4MNTiy13R5b4L56BcD+trD32iKlyZxoBiIVyydmmhSQnl3kjlHfvIUwOszHBqf
	jibWQfDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1Ux-00000006J1P-2ibp;
	Thu, 06 Aug 2026 17:03:15 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1Uo-00000006IgD-0y1y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:03:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RX1kjh6VS7ak/u7H3BS9C9s2rg/2jcacK7z8iDafpRCfnAqr1CwC9LyAYniMhOQrvise9a4OxvEW382V2LiiSjM9OPCjJoJfQ/omtkNfWjDQ12d+FkdsI/M/mCDeTBizko0Yvh72MvVNzbR4QucExFhA+0FoXOZeueo/UFXM0FT90L982FoTRBenwQeKEFu6NQ7OJFNyCuj9/E6PafMSQ4AYZ68s8YqTygIleWU0cGCr1idCbUSS0AihPs8+yCzJCIwH5AqcbLSQzTngiKTdoY428hB8zE98PKLp4AKjN1cQZP4RLmV2kWdaVpU83T4/SbYe0ZspcfIrDxlwVOca/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcJ0DVuHP7K4FsoT3ssJd8kPfTTgCTwUYTzhOUtP5mQ=;
 b=j0QgI103D4ycUZmEFIw5Qovcqe2eSbijNaWYUUOJFVJMB5dXRPnX2gLRWgMQW7ylgvfQ+TXe6+xxH/q12oFTao/0nSeBxYNoSsyvGpMsb877qJs0JOCvMkOhtI0nRCsj1zdF5vubp+5oUPdQ65jlpB/Ma0eEe2ANikyoWHG3aCaVT+JPAD8O7Lmfel0WUQfdLNNplUmJEdadqrm8GOKp1nuxyYkcmXQeM+yDC1BpW9zerKjHs7Q3iJJQtUcJ/pIWe6lBfix3+M4RSP0rfcRMMBTSrOe30zTpp+9l9tgLizhwFlM+YsFHixaVqxqqj/iUPSpAFTsAVRFuFDzx+SgIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcJ0DVuHP7K4FsoT3ssJd8kPfTTgCTwUYTzhOUtP5mQ=;
 b=fbjs33RFlluvsrC9p7kVOZ+vit82VD1wF4nSkAuYQeKS+P1yjWT60+aG7X2a2mMRdprQOKtxcXsQSxbJhOhEFGHAioBkM2MApp+yvw7ZsGyub3ncgDRgWvK4eFlOfy9IvUVHGfmF3ZrSIZ2jQlwYUuVYRHuBV1/bC2OeQoeuDeo=
Received: from CH5P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::15)
 by CH3PR12MB9284.namprd12.prod.outlook.com (2603:10b6:610:1c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 17:02:57 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::69) by CH5P221CA0007.outlook.office365.com
 (2603:10b6:610:1f2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 17:02:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 17:02:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 12:02:56 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 12:02:53 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH net-next] net: xilinx: axienet: Treat xlnx,rxmem as a required property
Date: Thu, 6 Aug 2026 22:32:53 +0530
Message-ID: <20260806170253.1199749-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|CH3PR12MB9284:EE_
X-MS-Office365-Filtering-Correlation-Id: 0135765e-91e4-43ff-43d8-08def3dc9014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: D6F5OLfOWCYuEvQbRnWBPl6WcEYdndttPHFoSjnPd7eh/8VPyUtOxIkKf/eHWJvvKKiCdzX2RS+C8HfFxOObxFK3zAzaKQOlx0Y4VIjZkuHpzXvr9bML68e7h9SmCcAVW07eYGP3J7EoHkREz3ORR5DmFrw9NTXWuVd2SM6UlD9egdhqXpJLiON/yCp+r/8gzuqhUclcvjZIm6vKMsLy+fbFc84KynNjjjNOq9PQ104cKHylo3i7pMfxwgQlEwcND7TDXtIgsKCxJji2g3mkioBpjPb2hnmpnHJX4sVx5tApSQywKU8h3rTmgbYpX5MAv0SahqDc+vrdvqfQ6Gcf3p9xXgq4sCkko71OcUnHTdSxix3gQtgCbTU4GMatBReH4F5dY57tgWCFyTUgxNLNQCmInBQZpkWMoOmecqmm7iMv7OxFSCBh70b3b172AgwfixdTeGSIm135OXFJFUDw8syh1DUTI8L+uOpJcCM/pxBUomw4fOxcXWGJ2+8vQfkcJkkjS0/th1yx7rljqXHhqdUj3qLjcb0JfmrwjUHym+K5Y1ze+6QxaicMywtvdw7UEIuqIpPu91g0QzINunmeA78img02QrBMsQ7UsxP3A+qD6y42ueKrrNkCDEiQGI9kqxwswBTZsYoZXWtfQ30h5sJu/rhzhxAFpuy2f7YsxFtIynfRnEHxgzOfN0BYPGFycu3qd7qtzjQToCH92ddjVg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WKBU0eHAlCVzBMiuY63veUBmrSHaqKCo4LBIDkldvrGku6kdfHTcQTAACWbKp5GOnLIIzMhEoRpD5AKmZpQiKs328aInNLCpIx0i0chz/0YzRAPHotzw5O2kpnbZ6MnNnOIRXqfQz3KPtObemRJm9okbz1C0QJ+1fXKJxvNMYqs7wlY/OmwrnSX1wJOjWeTyIpWbOjYoRSbqrtyJEFjcvmB4qmsiEcMZ6ZBBwpIEfkR9Pd3i9KM7NccUWQT+ronuBjVuIzEy/xIJxtAp7mzDv4l1JIoGScp/4q5dmWhZCSm1qP0ytp/rIjv0E9gGFueUfBNO1epizjvcP+NGcBUYt1/g3PXo4ro5o795xtGUB0PzguVt0Ry1TSGdM6HESd8pGV3Zc4IClmrmpM22anc8Vjd2b6h+85DSYX4SjnPTlyHDOIFaMx681DtOY3Uh0fmM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 17:02:56.8451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0135765e-91e4-43ff-43d8-08def3dc9014
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9284
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_100306_306364_6BA9A2F3 
X-CRM114-Status: GOOD (  15.52  )
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

"xlnx,rxmem" device-tree property is used to learn the size of the Rx/Tx
packet buffer built into the ethernet IP, but return value of
of_property_read_u32() is ignored. When the property is absent lp->rxmem is
left at 0, which silently limits the interface to the default MTU and
disables jumbo frames with no indication of the misconfiguration.

"xlnx,rxmem" has been documented as a required property since the binding
was introduced. Check the return value of of_property_read_u32() and fail
probe when the property is missing, so a misconfigured device tree is
reported rather than silently degrading functionality.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index fcf517069d16..1722b7038f34 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2898,7 +2898,10 @@ static int axienet_probe(struct platform_device *pdev)
 	 * Here we check for memory allocated for Rx/Tx in the hardware from
 	 * the device-tree and accordingly set flags.
 	 */
-	of_property_read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
+	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to read xlnx,rxmem property\n");
 
 	lp->switch_x_sgmii = of_property_read_bool(pdev->dev.of_node,
 						   "xlnx,switch-x-sgmii");
-- 
2.25.1


