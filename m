Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D16C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZu6q5o+4eFullPeNUeCYaYl8kXGYXZqZ3U+7gYldos=; b=nBDWdbNnneHq7w2h/ZTSz8unza
	RZQNHsGDy+Iyh1HVT0kN5DVe7OQ1B38JxgkPjYnC7tlBx+fnalO11F7tOq6t62D45AMmTlhRQ6AJ2
	bO+/XHUux0JBWFYGKDSMCUQbcRtQ59/dYJQORMaHOagThO8kNSkoG7TZUwhcg4zAY9xHOgmYJz9ah
	e8hCpjYUT+PUnzKbFmlfCUcitLar1yzZO+bgSYE9V30KgP7t/1zrSttYwRcWowYj+6lw9VRvGbCxb
	b8ufm2E5+kikoG1rESJ1dsBDKs65AbII1XMBIYB1WWvesTGuSXhX2JAdSQg1ymGyig1VhujEAA4dC
	PmfY1B9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSHY-0000000G22k-0c7l;
	Tue, 30 Jun 2026 06:49:20 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSHV-0000000G21b-2CBl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:49:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yg4Di5LPFgVfI+kwb75EJH74lGZvbF6yPMMFEELWQoeZ4ZEL/92aP2ih9rbNbNLvcYHv2x2LyI9cplNSx6V/Qe3Yv2oQMonq+xIiypLJeQhoMXCF3pZDVWpI1hXQPCDwgV2ly9VptaR5QFWK6Z0AkW9ADC7+0Sh78oF121iEiAmTDeh8rXXd360Ecb2NLEu2cEtiE92n3tsQycwMlb7QEaxIr5bjLKc0PhgPT3yfbzNqIlIwnZJVToVXSmCk8UKvu16J87d8cDHOSZggAkUNapnMIu1t0cxKismodJbZ0fkx7mzqH15tEgDvfr3tqQ1frlYQaWeCLSHac6rxisoxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZu6q5o+4eFullPeNUeCYaYl8kXGYXZqZ3U+7gYldos=;
 b=sMNF5k6Y66zFXia008WG2rg2lNZ4R5dzS6fhBppOEWkWQJ1mTlEAWCKK3K8pHlBKv2gL1n10ZXueEwXyFH7L+/djTWAYJpQ3c9JeO08UKHSxjui5o6SdQM09xafkVeZW/VQTs6/FYJeylotV6jOwrZkQCXv/e8HoMZ3L9NzYav6efOtoouSuW6xPtA4Ai64Nw8zR5SxV+SR6yzv7mPrg9kYQAR3IcrIJOWc0FMbwyO4kvZphTv7BaZMdTc6DkuyGG0VqTyGdZ6flUNpJR6l/w2H7oqXb+jAjjTHW7PK+vp6gA4oHwtjaBx4rtfUradkXaJjMVf/0d9oRTL9kB+ozkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZu6q5o+4eFullPeNUeCYaYl8kXGYXZqZ3U+7gYldos=;
 b=Rp7LXmO5o+p1L3G6Q/vo6rfn8C/5sU3vgZGuBFkiSEFpabArJRxG6SwMDF9lSnTjFKjYV3ejGzrMCCmUK7lZPNKDZcBHxTVfuQty3xV5L69/+lDjxQb8osLNWLj+89g+q3KpjM4Bsxe3qB2uQKY5d4DEzE6OISvzK8JLTki8f5c=
Received: from MW4PR04CA0189.namprd04.prod.outlook.com (2603:10b6:303:86::14)
 by CY5PR12MB6574.namprd12.prod.outlook.com (2603:10b6:930:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 30 Jun
 2026 06:49:07 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::7c) by MW4PR04CA0189.outlook.office365.com
 (2603:10b6:303:86::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 06:49:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 06:49:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 30 Jun
 2026 01:49:00 -0500
Received: from xhdlc220353.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 30 Jun 2026 01:48:57 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<nagendra.golla@amd.com>, <abin.joseph@amd.com>, <kees@kernel.org>,
	<ptsm@linux.microsoft.com>, <sakari.ailus@linux.intel.com>,
	<radhey.shyam.pandey@amd.com>, <u.kleine-koenig@pengutronix.de>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] dmaengine: zynqmp_dma: fix kernel doc for zynqmp_dma_remove()
Date: Tue, 30 Jun 2026 12:18:44 +0530
Message-ID: <20260630064844.705173-3-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260630064844.705173-1-nagendra.golla@amd.com>
References: <20260630064844.705173-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|CY5PR12MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 7035f58a-4a62-43a6-132d-08ded673ae51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|11063799006|56012099006|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BEGwQUAE8N506oo9WeDNXFZxRznOiur5WNLzuSnhiuMti5/6E1zmRhhhq7plKhNxhrMMCRVhbjR94v4VvaZ2dyyTh9qjjZ7+HuTc7Js+BgiN4romc3cCDVPL/YTYfS19jwAWLnZ7yK6v+XEszf404Uq8HDoQEa6CK5hg0tUOjxCTM8cGiC6pxW5NlUTPQLm05tMePSpdKBPgCgvw6n0KnGyd1m1kSK8i8YRufciS5sviIFYCl0qUKRnz7bmy11wxJRJIH2VBRvQZ+RGN5bmrnTrc8Eh32B0kEV0Vnu3doRAJdMXpu4kNRsmGS/CWemGK9f7d4LcVzz6olNnc3hCCCo3jsbFa9vxkheg+KiNfLQuybfRCNlOYcBvQw/BmtQDF/cH5rh7nDFfQE/GaF38mMhKQSEno8dG4B87N2rMjZBrPNCEtiy0zC4mJbg6eP1WE/3bDAbHsXgsXJmHNMeuG/jygyfrWAl97VynNKc0BUe2nf9r/MW1EJMyASe5eRCAzNGk4XX4GvZh+oo7NC7c7rsri6M2XI+fcOSgxy4+bM1pES5v5eQYaP196NHcsBZ09tGYJ2xJQ4y1dzvkQS8jgJY9IVrpJHajgr1bxZ6xuQWQ01AmiY9HeVe+/sTgvIiNzzd6ySLrkHiGAUFUxPV3gT5GBKROWiN29vVZ/FGGADu6XK/NyXs3RiRntSxUMoUU1yIVKpD5MFbyF5nOn1OwoFlXlBSqSCuw8y7JRBOq6jWzjbesPLFY1sVtctZi07nlA
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(11063799006)(56012099006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ISg3crNEGZnEogW4zOy5UsTOd7ff85RCDhgVouCFvPweBiaZhHp8EQACs/LA25gLLyKNzGtDPMovsKrgHUzL4npxiX7iA4KML3KiFshxFiyr+A6fUn9UtfpOLhniZa6leXfB4s6IcMZEbnCGTAfET+9t4rIpKIyKGDHwml8IuHl7l7p0XeyQY2DdREBLWyrGTgy6mERBo33ezpLoou8GxfOYrLMuQRFbxloUTR3NgOCgBvi5GItW5y5fXK2OHmtWh8A/ywKXgDZK4EgUev1LSFFwZzezLh9KLuIpMIdmoIudWodsLiC6HhN+dW6tUtrO/0M0mk2iwHG8jOmERpWF35eg3K3zz1Tn8CCS8ByS/5CSqUJ6UwwrqX+LA1w2JkKB4Pw0VuplK+kZ7+L+eFC0XJfrNxDiwCNcPglM+R8t1JoW1DV8ISAedUaGV/vdDdu3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 06:49:06.6232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7035f58a-4a62-43a6-132d-08ded673ae51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_234917_568570_69713891 
X-CRM114-Status: GOOD (  11.45  )
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

The zynqmp_dma_remove() function was converted from returning int to
void, but the kernel doc comment was not updated to reflect this change.
Remove the stale "Return: Always '0'" documentation that no longer
applies to the void function.

Fixes: b1c50ac25425 ("dmaengine: xilinx: zynqmp_dma: Convert to platform remove callback returning void")
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 26f097db593d..ba6604dd7153 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -1177,8 +1177,6 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
 /**
  * zynqmp_dma_remove - Driver remove function
  * @pdev: Pointer to the platform_device structure
- *
- * Return: Always '0'
  */
 static void zynqmp_dma_remove(struct platform_device *pdev)
 {
-- 
2.49.1


