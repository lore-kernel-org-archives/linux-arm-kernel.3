Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E65CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWSLyJybt2OyyRaX8KnGrCyG9V7lLiQLV2SzojMMMTw=; b=h8/IahBOyYbz1r6Qp1cLoRRpzy
	rMhPBoeoy0vg9jiRb3hqgYPmQxK0SIZqKsJRtvYXPxMijDsCaEvfVCc6LLJJGDn1ZRUxHiZ3YuwJH
	dFlmen6mLg9m9vO2hWbR0lqhhEYS6EtnHv2JoAmJ23Yy6oXi4u+I6joHIl/nlDbkF4GRTnr64S8Jk
	1VyAZku+YjDkn+gcDIz9FQPgjkDkXjzxngKUKTTijjkkx3MVp4qiSh6YGMCPLjYN2IqX32fxpjavc
	6nRTQOHWnnXQfZNQwKKVRcCvCZIaG3p/yAkhKzt+iOyeYHh1KeNU1iFKgtKbBv86Wx8C4GaKMSX4y
	vrmLcAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRStv-0000000GzYw-0N8f;
	Mon, 25 May 2026 10:51:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRStt-0000000GzYC-3i9P
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 May 2026 10:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wWSLyJybt2OyyRaX8KnGrCyG9V7lLiQLV2SzojMMMTw=; b=attgYjwkfLkBEkwWQWBDaYbarS
	+eHHoBfg6Ynb21VHdxTfzs+uqy/hgntjZbdwJ28kBRhvpXwJ3JW3W63GvquNGzxMeYQxmOw6Cl+r1
	rxLhGNvxveKtBLkwLpPdrPqY99P5retExD6LxTTiWb7sqq+fbqgMlD7E2SBsL7Gvt0YWrRPDpzWXI
	kDoTxm69NWUlApwnZbCS63QGVxP6z2F4ifnbO61QzaUEKJl7Xr4g7viz/wfFXRwTrn7Ufj99/Wf/d
	KtqKtHOvPvKgvmoD5V33Ruclsp44O1DoItLCa/Kc4FLkQc256ViB2KrUWJFjj9vVSTXJYvZmAB6Vr
	lnaDR+9Q==;
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRStq-000000092U2-1qMS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 10:51:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E78j6yoNKiEq+ifrQyJAHzbS8O35THI7cqRNr2iaD1jFCz7Cmqt31Y6WFkTVqUB4XJzxhwIgbABRN5MF4QOgZqXpOrqWfgKY+vKP+o9uK+Mi91TdrczVLJt38AdsEIs40uexmUEJAUSpoRZEfGEOiLu3SdyHAqrxWbJTUpBDTosb4GlhLmd5QO+Ev4zVQQj1NAF6Qk/gEwaPJv2xLzolEkGWTMT3b6Vy/L0u7rR1A6UTCpZlHsUcDNnig11VJjWjvEX9s8Sdv+MerYIekEVM901Esp+GiPhK2/r0Hu29mqMN8G//lw4hep41ySFnf68LJQEAxwOy480pQa8SNlodbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWSLyJybt2OyyRaX8KnGrCyG9V7lLiQLV2SzojMMMTw=;
 b=WOOG6HzMNk3SZIw37Y6fcM0UywtPWIKbGDfGPBXh6eitgOwQvGUrAw1pf/vY8qXMZkaNT6A5UFns69PRlC5kssLHcz9nR+2a8c99IYKW9r18qzCZpmeGf4pjMRJneJH9QX/17fm4JHQrPsDrYC3C7MXbGest8XafjpTC/avqO4mWaImFkH8Sod4JTv9am0wAh/hhMqv+PFBbQeeDKGL4BBpxzuhzUoHJCQ7fxwurmKwsAnc8x9AIsUXZGB7xOcdowT2NxChQCrv8NlMWOvZby6MmRMm5rDhB0BiikhTlYMG0esNw2NWa0mRt1QMs8tLGAjtj01Pc0H4NY0/uMnX1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWSLyJybt2OyyRaX8KnGrCyG9V7lLiQLV2SzojMMMTw=;
 b=nI5eRu/3NsM5e5f5RcZqsp3F50cHSNQCS3nRXXtELXy5KJN6Y7WSDJ63XnLR9DwYAO3Uy8TwIOkogxajG3FbMahKp0rDstN5hsjTSppgYf1um8Yb2Lc11liN3srhEf+oxMwD3845CISHH/trb54EFdOS8FGW4JD5+6+D9xWRhEM=
Received: from SA9P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::7) by
 MN0PR12MB6029.namprd12.prod.outlook.com (2603:10b6:208:3cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Mon, 25 May
 2026 10:51:00 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:25:cafe::38) by SA9P221CA0002.outlook.office365.com
 (2603:10b6:806:25::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Mon, 25
 May 2026 10:51:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 10:51:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 25 May
 2026 05:50:59 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 May
 2026 05:50:57 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 25 May 2026 05:50:53 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nagendra.golla@amd.com>, <jay.buddhabhatti@amd.com>,
	<harini.katakam@amd.com>, <m.tretter@pengutronix.de>,
	<radhey.shyam.pandey@amd.com>, <abin.joseph@amd.com>, <kees@kernel.org>,
	<sakari.ailus@linux.intel.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] dmaengine: zynqmp_dma: Add per-channel reset support
Date: Mon, 25 May 2026 16:20:42 +0530
Message-ID: <20260525105042.2249542-3-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525105042.2249542-1-nagendra.golla@amd.com>
References: <20260525105042.2249542-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: nagendra.golla@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|MN0PR12MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c77e8fb-7578-4e59-e570-08deba4b8232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|18002099003|22082099003|56012099003|921020|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: IVbRnHuL4tdMRghznap3LUkAMAJHHZC0fJB4akt7iOlxquA3W3X6XTEh6xeG6f0Ndk7PWbnICqbTKfd25TyudI9lkfxX15TS5BB8rAXT0tATP7U0e5dr7YQLQIzIr8FxlghF0YzlAtyhNjK6dx19EiTiXGPzHfMDQIHizTrYf7PjzySq1xZNYfvNghMetqA84gTBumafl1n9WCi45ik5E9QXUZRHiHSlixITvFBUVMzQsUR28/AoEA7ZTKHz9Iv66XETIAjJR1wjovd6gPs26EXUhL+Q3vNZZOpqUD+6leT9KqIpkCaW/Kht4QaaTY/bJAIUyvmr2KlpE1u2EgLfmVOx9CF/c56oiKeGcOfvaTcOSt+g83scbneqDf6Lyr5kihcBOEnPK9z6oDvpCKC5C1snja1orKK47tUyqELP1tPkF4wMZQMpvuV+JLsYPj1luu1c1XbZxC1+o2KZPMamMed4WWItr9gZ9pvuykFKuZRPGx6KcwefHEBL0Hl31qlUI9NSx5DdBec6wo0y8y9lcTbxYPKYwfTY9rB7oScP11OYX5F79ITrUxWHSc05cRTT1sKjY7viaVNE83E/MMnFerZ0rk4JRb0XvFybEzGMIX6tysboDJZrtGr73Yvvsc7oSOM8uQfIyJ+BslJZN7cV/Aw3VdQcw9gtvrTV4ukzauYbDy2qKuyDOAQFhg9d7mLBy/pmOKgAZEH2g9Jv5VFDScflvtCTz/g03JxMODu34aNhkmGayOBNtCzrhGPEiCkFvhZVgHMjhJ1rKw+EVLMx4w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003)(921020)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: u/DfibYFJDdHNJErb8isBy57/P+1sEVjNf3X+WApRetl1WjL6q9bGkFnB6S0dx9ucA6PSfmKyOOaNSbAm3TJq4VUEpOVTNuTmGEvTuPRdDaWAGPj+2R9imbX1/lQMtBYw00Ljtdt0hgw59ZX/tuuuf+pTaTTG/N0i4u3vu+NTbvZPk046X4kw7kxaoFEjFy58XzV4IhdwiM2FMijSd+qkamyENeV8cQ89AupjoZCJ0J7QcmNVVFw2sdmWVltDy+9/VXGzmeSckPBijCUK3/dcMQwxjNNKjtU3sSMJ1m0JtVHUtNmGrCswvcKNAwfVsg+ae12QWd89a+NyarmN+1GXlYEJpfPB+moQXQrRqnL85MDgcc4sDNvj8zAb3LCYJiLIUa+MbkaSjqHCOEd2K9F1/BLAu+ZY1yGgQM/W6vmMOQM2Bn8E235urYJyXyd2TyQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 10:51:00.2233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c77e8fb-7578-4e59-e570-08deba4b8232
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_115111_013609_39BFA869 
X-CRM114-Status: GOOD (  12.90  )
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

Versal Gen 2 and Versal Net SoCs expose a dedicated reset line per
ZDMA channel, replacing the earlier approach where a single reset
was shared across all channels. Add reset handling in the channel
probe path using device_reset_optional() to trigger a reset pulse
on the channel during initialization.

Platforms without per-channel reset continue to work unaffected
since device_reset_optional() returns 0 when no reset is specified.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index f6a812e49ddc..51c831760372 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -18,6 +18,7 @@
 #include <linux/clk.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 
 #include "../dmaengine.h"
 
@@ -916,6 +917,11 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 	if (IS_ERR(chan->regs))
 		return PTR_ERR(chan->regs);
 
+	err = device_reset_optional(&pdev->dev);
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to reset channel\n");
+
 	chan->bus_width = ZYNQMP_DMA_BUS_WIDTH_64;
 	chan->dst_burst_len = ZYNQMP_DMA_MAX_DST_BURST_LEN;
 	chan->src_burst_len = ZYNQMP_DMA_MAX_SRC_BURST_LEN;
-- 
2.43.0


