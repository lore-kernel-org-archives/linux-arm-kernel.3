Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF7FC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgF0MEgU/30tU1I7r6J7cVBBky2HrgoOTg461cjGO9E=; b=loHgeUBRcWm7n+yTruhiJD67zo
	kzn1o7QQRTJHeWs6fVJbfUbiDSGZnf2Lgl/wlMZzZl9/wQYD6Y62RJOa/3cKqV/mWynZDZSOlQTm0
	VffCo/vQDXskUlCSkiwNo3D+O0qMEP48UuW4DfyPFg4mX5iyCjWdBiX4wE03H7o47STWbvSk6jMS/
	o/IDSdZHmik1WUXzqDKeD2AcDURpP/xq3x35wlpAc9NkmYEd7rysPsONd3+Ssn9M0qJQgJe+Tgs2m
	Ba05+FzV5W/Lxlm/ETLMLku+7MQPD+8XT21AJG2L5wNdOcKpmdofRYuf92qIdwV3z6sChg5RE1R3U
	I2cGC9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq57-00000007DQX-3UKm;
	Mon, 20 Jul 2026 15:39:01 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq4z-00000007DNc-2NhG;
	Mon, 20 Jul 2026 15:38:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNFEaDLSOU8cCXs6jaPPZcRXJ9HPQBKB6BtV3ZbwI1QayoDOtQ/pFgoBlkoMRTNLzSQevUC6UVX84/NaizhMJ6b0HPQuzGVc6yskXfGq1BTUjupsoJ0fRlz5LGhVhHpWiJmsW750jwI2ZR9/AQ5pFRajJv0Yj7JSX1yB5gaHTVN3XxwSd6ZWUViCd1Gu/vNys+13fNeQEkv3OwEJxEyd5aC3Agz4Q8nzmbO2hbv3OnnAYeQOiVFNszrwvhJnQ1kNfbQdnAeBwNFlgkPFFoRPLjGoRZY8v9V6FB5oGpI31kWlfH/WPiiLX9QyLN06H6BI0qtwTVvgHVhK4jrVDa7fzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgF0MEgU/30tU1I7r6J7cVBBky2HrgoOTg461cjGO9E=;
 b=ueeQpjCY5FiZ4U7Npkzy9LBksrwjb0YyhDPPIEXMbSyzWbpJHhv6wsqM1R2mkG62XmF3KZjwxhZWZxvE3Wl+gtsnE7F9sqR8Fu9QuiPtMoxr4moo4vh1nHk7pDJxYH92BMcxRva/guNouMhCAb1mqafaag9ROPKx21ys/wlX0nOB8YcaGIvI+B77kIUaThuySZ5TTdyBCIHLODzxEBHiEPSvNaPd76PZhIW8O+mWcYJuxsDh8wQJ++4XrwDOFr5tuZedUTV36xe5N70bqVef44hliA4NZxLyMyLigQT6eTfWWpBLSd4qDVxvxL5G1m5e3CE/lxWxjjCNEiLK/D83+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgF0MEgU/30tU1I7r6J7cVBBky2HrgoOTg461cjGO9E=;
 b=ji05XsFdJ3d4qNIKJUsmz3o9cGOEd+DDkWaPIRSXifi1/qujcwYMzS4MqYmdcuPbs5budYYkFkpAcleOHMYcTcGiJ1OpKK64+zcnSBjWTB1lh9TNbS2FsfmWxR/QYALut0iGWvysymca+9ud8ftnlt+vpue5agtIHbR3UfaoA58=
Received: from BN9PR03CA0455.namprd03.prod.outlook.com (2603:10b6:408:139::10)
 by MN0PR12MB6296.namprd12.prod.outlook.com (2603:10b6:208:3d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:38:46 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:139:cafe::99) by BN9PR03CA0455.outlook.office365.com
 (2603:10b6:408:139::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Mon,
 20 Jul 2026 15:38:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Mon, 20 Jul 2026 15:38:46 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 10:38:45 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 08:38:45 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 20 Jul 2026 10:38:42 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <tomi.valkeinen@ideasonboard.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <michal.simek@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 1/2] phy: zynqmp: fix clock error handling in xpsgtr_phy_init()
Date: Mon, 20 Jul 2026 21:08:30 +0530
Message-ID: <20260720153832.1130006-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720153832.1130006-1-radhey.shyam.pandey@amd.com>
References: <20260720153832.1130006-1-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|MN0PR12MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c748e05-6862-42a7-ebc5-08dee674fcb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: Hs+80azgXeP9rqC1/NVwuNnpS86ZRhSCf2bVEZgLJ9mkcgs2UZBoin/eyR38ASTbzK9qYRHpJq+YBcZlgtbFU+HDQe1b+zTHNoReo2JtwPGos8/D3tGTR8fN3YcmO1e0BFEb9leyqVvbBv8OlLPF8fXDbEKlTTE+gZl4EcNiJyaqFdQMfds1eB1raNSRmj/5fhayaOmeSdEl8C+sXZy/GQ2ualIiJIMmulI+W53fPxriJPbPp92fgNSvWPDP7Xt/J4CyazLGo2Vq1rnn/9H3Wh4Um9KDEu1VrxU3xps3SkCN13bDByJw1L0S27z/IJEn2+jWGYDhdTswfyoA085j014zht8BE8uCAs1AQHwWNixys8Wh9Uc85iVjhHS16xHB9Jtr6AuY2eaP/Wy9SQcWbG8jC+ChmsYHzHfBCr2pPQ9YmIBJFt12jmVmD8L63HnCgcDnSpCXDC/HTA+tHzmV1Q2TwipuvTAXJcGPy5xADKPeM//Og+cn5quJZNtqlpCOp3rQGNvwTXO1vF7SP0l7/5h2ObeO7HVfZXKrI/jqfzWk12Gdj7Cnfj3uWRXzCGhrOSpG3Yh3daW3FZNKBAkS7so1UJI+tmzLfXO4/t4MpyQ+fCHZWIze9jNhYieSQryPAyS7/3LysylriTXSRc6Z2zYPKZn8pOIabv6IpxPpKuSEoUcwp2QtKZBLJbx7G8J9xLtaw13J9/gY9AfOCigz7g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: D+xEC5Ps1vzhkaX46zuQwupr57YusVGeMGbALvO5O24yweGPdOYXNMwwiTkmSG3yLyfVTuQgT4Pm0XTpFLnFIt9NjE69sYRkAg/av+HW98UUVZqJKTMT84t8+UDcvETHqMYYUU9JuEJHTX6KEJuOqwblaZ0a95t5TQ7aHQqIOz4gLiqwhmoygOvbmcO84+8N0vOLaClQR0SCDlVJSEpjypBLxZ/VTyR9xYl3FCQTFb3892wlWR3ooXme0M4D7FH7Khhs3JIbJqOz24YnZeiI+Jz1e8KUP/kmNsylZt5q4sgVqLq56TLtI+bN9avDcEuaCcP0Xc263DC0EBNpzxx1tBTfdhZtF/N6zBAKcSqaJ/m3gi29pDm18FI6J4RF/Teuf+VQtvUDc8aE/zDgm1GV5ziBExLSvEK1vmzlOHw80aNAg6q1DtXAGOlFKc8BpuH2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:38:46.2872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c748e05-6862-42a7-ebc5-08dee674fcb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6296
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_083853_604812_3033B54D 
X-CRM114-Status: GOOD (  12.85  )
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

Propagate clk_prepare_enable() failures to the caller instead of
returning success, and disable the reference clock on initialization
error paths to avoid leaking clock references when phy_exit() is not
called.

Fixes: 25d700833513 ("phy: xilinx: phy-zynqmp: dynamic clock support for power-save")
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/phy/xilinx/phy-zynqmp.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
index fe6b4925d166..c8230f2bda62 100644
--- a/drivers/phy/xilinx/phy-zynqmp.c
+++ b/drivers/phy/xilinx/phy-zynqmp.c
@@ -658,12 +658,13 @@ static int xpsgtr_phy_init(struct phy *phy)
 {
 	struct xpsgtr_phy *gtr_phy = phy_get_drvdata(phy);
 	struct xpsgtr_dev *gtr_dev = gtr_phy->dev;
-	int ret = 0;
+	int ret;
 
 	mutex_lock(&gtr_dev->gtr_mutex);
 
 	/* Configure and enable the clock when peripheral phy_init call */
-	if (clk_prepare_enable(gtr_dev->clk[gtr_phy->refclk]))
+	ret = clk_prepare_enable(gtr_dev->clk[gtr_phy->refclk]);
+	if (ret)
 		goto out;
 
 	/* Skip initialization if not required. */
@@ -673,7 +674,7 @@ static int xpsgtr_phy_init(struct phy *phy)
 	if (gtr_dev->tx_term_fix) {
 		ret = xpsgtr_phy_tx_term_fix(gtr_phy);
 		if (ret < 0)
-			goto out;
+			goto out_disable_clk;
 
 		gtr_dev->tx_term_fix = false;
 	}
@@ -687,7 +688,7 @@ static int xpsgtr_phy_init(struct phy *phy)
 	 */
 	ret = xpsgtr_configure_pll(gtr_phy);
 	if (ret)
-		goto out;
+		goto out_disable_clk;
 
 	xpsgtr_lane_set_protocol(gtr_phy);
 
@@ -705,6 +706,10 @@ static int xpsgtr_phy_init(struct phy *phy)
 		break;
 	}
 
+	goto out;
+
+out_disable_clk:
+	clk_disable_unprepare(gtr_dev->clk[gtr_phy->refclk]);
 out:
 	mutex_unlock(&gtr_dev->gtr_mutex);
 	return ret;
-- 
2.43.0


