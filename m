Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EF4CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 10:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Roi+Q9ko3sGht9cTAIHr34o1RfYrFDnBLN0pAJ5zTvw=; b=vzyQCaxycYKK4qCH7+/Y5DNh1O
	Q3YCChGNxKZuPDWuowSbfR82hdza9Day0jGsHvXjfPJTdMpKCWOUZofdYcJxaL8Vy3kAkqHPZvH1x
	8puOWnqVOFAo8A0UIh0E/J99h+YVRx9lv4ZYHYXeSoKreFOPsA2GkIUwdMYKNC3f0S/uu9bulFt/X
	hu3V7RkMJsQjHLI3jNNELbhkNydpAIkitlWRrIpVbUWC+xTY5dHehmvmTLNG/2MBQRpvHWszo+Hlw
	APDFwcZl7XWnstsquW/rDJB42XasjHqjfp3yxGTe63lBQzx6I4joRGCUSD8f6ceHLYoxa8Q1Y32o/
	FhEay3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSti-0000000GzUB-3LOb;
	Mon, 25 May 2026 10:51:02 +0000
Received: from mail-westus3azon11012008.outbound.protection.outlook.com ([40.107.209.8] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRStf-0000000GzT1-1qJ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 10:51:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zfama6BsKmOjJt0cxgCMD8JR2yQrN5KApPQsoB3N36MJZyU4EP5h8oItUAvUksoZbI9pUGEt7zsUGcjEph+PBhK0u1fyQAwcHHcLRXEJOS4ne2P8rKSlnu5Pdz9m4U7+DWCWltdbhsR+SdOnuJO+GgSMFO4j8nPLiicL07PpZLf97pJWStqnMA2hZ1KBqegs4llkrTKxDGcHN+k8Yl01LCzb1TUu58A3PWNcsUbyEMKcXq3gj+QvpQ/k04JzY5Zdl4QlgQGIu5PBINdVADPr4EpCC7KdKc/SeSzAKVT23KBuVub5U3EymTuWHc+vhBzPYUw7BWrGg1rSVe1JCNqITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Roi+Q9ko3sGht9cTAIHr34o1RfYrFDnBLN0pAJ5zTvw=;
 b=SAo89+R5wES6aY3SlgV7BCPuXX68ft0K65K2SYWUN5y1kREnRy8UpyzViMgCyYkx92pUhd06myRfJkLHuxkAlq2W6K0LTB9AkbwAdbe8WcQPn9Wn1bKASq29E14/tLWZrN27wVYfbTtGZRCk6mg6eF8ppAgP574CYDLQLskCBgNGB2fYlDB2ICStJgkgdXJaSqutrc3Tr/u4LYwKrXnXHffsgL0G6fH1fV5KwHTO7k8NyPlDvJCNRqQIfCM02vOa/uny5vWk94nAyLG4sij33IeJgYBQtbhSv71qZjrorIokak0IrFqbD8x0Ew+wYGSIEOebRL6oxvRQzDq211Fl5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Roi+Q9ko3sGht9cTAIHr34o1RfYrFDnBLN0pAJ5zTvw=;
 b=FOyLfkT2fPWpLbTLGf39WhvLLQV/4S2RyTeZnVrDw/vRzuyu0POoEB8/3JDvnBPr0cmytqN0jXUBszYwlxHe1WbNZ2gBz6A8HKnePrNpatha4rPU/YLDvasVFOIb3snJis7deoiMTd5ipNx/8iTWPCzkB2g2GfluwaU9heXbndA=
Received: from SJ0PR03CA0191.namprd03.prod.outlook.com (2603:10b6:a03:2ef::16)
 by CY8PR12MB8313.namprd12.prod.outlook.com (2603:10b6:930:7d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 10:50:49 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::56) by SJ0PR03CA0191.outlook.office365.com
 (2603:10b6:a03:2ef::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Mon, 25
 May 2026 10:50:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 10:50:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 25 May
 2026 05:50:48 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 25 May
 2026 03:50:47 -0700
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 25 May 2026 05:50:43 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nagendra.golla@amd.com>, <jay.buddhabhatti@amd.com>,
	<harini.katakam@amd.com>, <m.tretter@pengutronix.de>,
	<radhey.shyam.pandey@amd.com>, <abin.joseph@amd.com>, <kees@kernel.org>,
	<sakari.ailus@linux.intel.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] dmaengine: zynqmp_dma: Add per-channel reset support
Date: Mon, 25 May 2026 16:20:40 +0530
Message-ID: <20260525105042.2249542-1-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|CY8PR12MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: ee565dfd-7e09-458c-9f0c-08deba4b7bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700016|376014|921020|11063799006|6133799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: htt4TGYhUk8/cBc2sHVyd6XLDVxneJ7LUCCa8A6+cVYZHtnFHtbhXBwzR1AyG/JZybaHTS800gqyu2KnamEcIEqjh0HORtDlB1lVimmIXNI5ilX61Hyq0E3WmEfwsgZR/lAOEDv95ldhtIoMS8lNSOztqhGs2biTy4ruMOm3EO8pVYDGKccDPV0ReIgEUvMo7meCO1x2Bx8waoRklIPljUlK2EEL97BDOMUVP8BlQYXkaVxqz9CQqLpWRY2s5QI53751Kx6PeMuYfWUvIUunGE3h+4ZU7A2vZxRX8FbPA+RCOE0yEllPhiduLo86tOdW76Ci9aRSQXD91DDEA/LkUZq0BiNt4vGkSOXeTnEfEmGQpjXfRlcBCPzAjb2vCAjSwA7kjmBNC9IvGr//lDid7tULRI3KjFk1nOdrIcJQRogclnYiLo2tC8OM4g/9ikjYhZ8NZW3yUCK3DTeF3ZnAsN9wm9SqF9gtSgnGsrQVC5qTiGYSTbLsazwAcCC9fJu34lK7j+3+eDSU++CiHvMyU7y+XLGlxfvaYt1tWv1vgtnqRAiy+2i2d/7Asc2cryvTraRTyXTW5ZRtwuYbf3OaWR3mmLqEgFFDnJXGVoJrkqupQnEXRTtJANr1eSOUpn3DiRkPsMg9VvzmJEaebFpSVrj857BRu+pCq3r7JhrcsYuAaF7jsyIMTvQRfg+jxy2Pp//KO7UrTh+N6wkNme2lBNxnV5YysW+P7iRmVeDw3oJb5ykR6DrZ+5dhB8ep59Nt5OSwy3UNbOVEaNH3RTbAEw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700016)(376014)(921020)(11063799006)(6133799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: S7Uojf/LasGG4ffTMqIz6VIpULM3RZezOydQ2ZGODZysIa474HoQSuvs64BkZ4PTuRorL1Nvf/Rv49kYbA98u9QsZBhQ0WLlQfuDncbmHng6WBAhLwiwfUsYstvDHuRS8/IfB7bfP7Ed8SiEy8AL2QCRCpQsnjO/ejQhEf47ybSFclWNM0hZ4HmdAcJC5HirLuPd0q4aQD2rICW5xR3BSX3Oz7GLB0pejwgfs631UcZGzwCzDGTWJ2UEJRKpzw9e03So71Arh/TapXvnL8X2b8MsJaFLuH/Rfm88aA1XSoAtu4YNZY0PALHNgso2wdqA9B8IKYf6xd59h7BH91e7qG6Lb6g7TnB1jNF5DwpXPvutkI1q0Tz1heaBaWndi9/ZJO5YRaXPX6E4Zai8YgvUF4hHI9rwTT4FTxWKFErgdirfQCpFVepLF25w1YsjJP79
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 10:50:49.4965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee565dfd-7e09-458c-9f0c-08deba4b7bd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_035059_519042_D48E2533 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

This series adds per-channel reset support to the ZynqMP DMA driver using the generic
reset framework, along with the corresponding dt-bindings update.

Patch 1 adds the optional 'resets' property to the ZynqMP DMA dt-binding.

Patch 2 adds reset control handling in the channel probe path to assert
and deassert the channel reset during initialization.

Golla Nagendra (1):
  dmaengine: zynqmp_dma: Add per-channel reset support

Jay Buddhabhatti (1):
  dt-bindings: dma: xilinx: Add optional resets property for ZDMA

 .../devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml | 3 +++
 drivers/dma/xilinx/zynqmp_dma.c                             | 6 ++++++
 2 files changed, 9 insertions(+)

-- 
2.43.0


