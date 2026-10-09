Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6730CCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 04:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4Gt4bUZ/e41D6IqAnJw+W7nc2PcV/oaW0DYCpbUiPE=; b=eBkpU+aVJC9nB9nSPIO45vqSv6
	IFTq3K61Vsy8AucqiynxTH8ABzuWF9SjnuxSxTs8gYx05OPZwMTpJOcFFpH8X8o4ekBAo5QC5rJm8
	svyrz6r6IkSMizGE/chum6JC+MYU90D7S6TVT/jC0Y0vxhKBywq3LbU7l88XIMz9UDynR5azT6egd
	QVfkMeFenjt/xpEZSF7PYGeIPn+kcQPqoIsx5ZdH9HLP3YZl/gcQs5vO/BEO3UyfXXC0tbwzXTdT8
	xGebedPHaYIs+uSrhvp3L68keBU9hJzJzR8j+WNsF9CH3m17blqjLWEs0MEEBPtvVbgboMLQSjWBx
	A6PRbZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1nA-00000005RQq-11WV;
	Fri, 09 Oct 2026 04:01:08 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1n8-00000005RPC-0UQb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 04:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmgW1F5Sjvu7xvTU/XVSuCnx61+mM64e8zb+7Wv1DAWN6MRYoSWCcsS0LjsngAM9OF+1R0kj8yjKDecHUs+YGzFaEG6CX4P8M4wboXlcO/fORU4mit0Kh1Lpckpa8IreXti39nqHSQIrXjOJR0xQo0L/3OUfsDdwLjEb8t8dsjTBhXdeNqUY+o7nT+dCi+iQYXxfPE16O2z58dq7hfVWIK0/fv7obhZj+xQhlFzYMStoaRAa3ZkZ7sOsaYwbz/1xUvCvlX/gfgjatzoNTd+zep4ZoX8Pkt0ptgz+mKZeQoao9WET1201ClMLTTLWIye3YROPJUWNUgGEoQzGp3Gytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4Gt4bUZ/e41D6IqAnJw+W7nc2PcV/oaW0DYCpbUiPE=;
 b=rq53P5Q1MDWxspVb/8JcXQkEawQKmw4FCRydBkV7SOsnyzBwq2balPdznVW7NUiUoYZsVGH0lNiR3ys9RsBOtH+RmS9jbEeVr++bNR+GllQljq/jaspd5kPUDilKSknWBUO8b6hYIKB+ZcwWjSUR3bshnfc+OaHjJrmbLcgqoNKXup7Hh8WtycKZUVLSqiX4ZPgNOovWcAgv61+u+r7ALIXiZdmtrT3NA6d5QepZWQLuRo/tpj832YYTKB4wswV6BaVfFgE1szot/deOuKK2GCbDTCM8X+bVXodzXDnUpj3RN7VDCkevPqvgCs9kllaMzzrvkrhwzuxc2bohrspU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4Gt4bUZ/e41D6IqAnJw+W7nc2PcV/oaW0DYCpbUiPE=;
 b=3OPB62aF5RZwupC+l+HlIXF48J8CnC5U6mkktGyVxgEq4M1V3quWqe9QLKB5Et5OXW6gy2lWezWz5WqIWHn8KyhD5R3MoBxsXpJoXtySRVFTUwAWwuhEXjzYejc9p4HQXtljJHArc5X3QkP1UCq7E/cbYcAj90jFPkbQ9LnvFGw=
Received: from SJ0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:33a::25)
 by DM4PR12MB5938.namprd12.prod.outlook.com (2603:10b6:8:69::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.17; Fri, 9 Oct 2026 04:00:54 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::26) by SJ0PR03CA0020.outlook.office365.com
 (2603:10b6:a03:33a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri, 9
 Oct 2026 04:00:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 04:00:54 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 23:00:44 -0500
Received: from xhdnaggolla50x.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 8 Oct 2026 23:00:40 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
Date: Fri, 9 Oct 2026 09:30:15 +0530
Subject: [PATCH v4 6/6] dmaengine: zynqmp_dma: Add per-channel reset
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261009-adma-pm-fix-and-per-channel-reset-v4-6-55f5fe409c55@amd.com>
References: <20261009-adma-pm-fix-and-per-channel-reset-v4-0-55f5fe409c55@amd.com>
In-Reply-To: <20261009-adma-pm-fix-and-per-channel-reset-v4-0-55f5fe409c55@amd.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, "Michal
 Simek" <michal.simek@amd.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Kedareswara rao Appana <appana.durga.rao@xilinx.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, "Harini
 Katakam" <harini.katakam@amd.com>, Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <git@amd.com>, Golla Nagendra
	<nagendra.golla@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791518416; l=1920;
 i=nagendra.golla@amd.com; s=20261008; h=from:subject:message-id;
 bh=fGHce2equmyTiavwxAeVjmHKngXlT4F1hhSsbpK6S9Q=;
 b=q3F5l/IzaDYu+I6HYlk91216oLJqAF2VsyywHOItELftqcEoAOdrNpqu28Tp+0Zhf8zNgH4d3
 u27SLc5l2pdD3UWli9yW1YKyMyAYITsWVZFC2mzN23LJqaSNiJCgTiv
X-Developer-Key: i=nagendra.golla@amd.com; a=ed25519;
 pk=pCRGj/0mb0C3aDMpVVZeyBqOIQZUKGJjCKL4QZTu7nQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|DM4PR12MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: e16224b7-4ff5-4200-a375-08df25b9ea95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|7416014|18002099003|22082099003|921020|56012099006|6133799003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: TFSMmt2xRoqa+c4fyC4iRl10w/raW1oWufCBYlDrto7gNh5LdK0GqxaF4WHkLBFYdrFaYIFLDWAcG4kwRd6Aln+K6Umr6kT9mpRpqMeEw6trd5sc0CFyD5/VHlfKqZypGXLAGR/ZyJzdnePCkIH+JSV/G459QzFVkbjh3AB1o5iuPCP2kTRJxBj2hu7jZlVZKl9duF0e5GK2Jbrka2PPyZC9hUcyAvRv144sb2BLd5tB6FVNgm9tk2MPaQqgcuPXIkJDEXT7EO503j+fOyibDMChB/Nr7pHVSduWOUrJHbCLAboo2c3JGA1EchsAxqawy57wHIY6ulD9KpiLU5d0hxWPcr40UklsHEV8oGAxMET9nA2fuTCccPWb0DOGUfhHX6FIUEYcEq9brP8DFKAMKltLV7ndGV3SB6aoZRpbSvYcRXyEWTMZSjvR7qqBudQ489Pyt1UOReURKCFz7EqGeEdYn7RvuyEeneJXTgxjidt+vvWAFtSQZj2uHwpo7FyUeACxQhsEJe0imVE4/DZ80RQZC9iDGJdVVOgJyOUJ9p6Q9bvJRu6C245sX9/XO0nyEOzXuPhBmReZl9AtT/3ZYwMDaIDb0WZQ3tsqJj3JmgXW1u2cnRwS40K/EbA1fq81Ts0Nz2BScZpnK9+tE9K+WoBJX59CM3uqn5DTGzO2PSywT+56P9re/+22ttBr3wI5rDRyOh8torhrp1cwg+FUibtPp1dAFyLmnRdHU24+2QZAXf5ZcenAL5b1jOJ5kVSw
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(7416014)(18002099003)(22082099003)(921020)(56012099006)(6133799003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ruwotea7M5Oyr81domeIVPxc3tWYx7GpYb616u99v5fiednApHQAIxwWStXyr076NUKQ+UJdXIIS6F/uTOapqZqxUSN0WYdzBVunvDtH0uzSylBRXK81GneSQ66gM1SwoHS/398ZhFzBGoYf+ZaZxTHa8ko18ZDHVSWLH5KeuZRk4Ijs7P9znLvZksoNSeg76uWjqH/wfK9K4Me/mywh4VJW2ZXtx14vvzmlFnZ9MTSIHRncK9NNKB+vgwUH5T4CYFAywpNexQZoj5jbrIMq6ZH1IOok7QhM0QDqKhgbHIddPqXiRTRH3U9HeM7OWPf5AykmiLiARpPEPZS9UDokGKTubqEC2fyMi7c/KLykx9lhatgaBUVVshQwgxIfE4ZFRVhDIEsh1yjFsb+VuKDqt8FlEguv/ss0IRx/2PpEiFCtLk7iEwdKAOUIVyxc2gyq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 04:00:54.4065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e16224b7-4ff5-4200-a375-08df25b9ea95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5938
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_210106_169780_E576BAB9 
X-CRM114-Status: GOOD (  15.39  )
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

Versal Gen2 and Versal Net expose a dedicated reset line per ZDMA
channel. Use device_reset() to trigger a mandatory reset pulse on the
channel during probe when match data indicates reset is supported.

The has_reset field in zynqmp_dma_config controls whether reset is
performed for a given compatible. For Versal Net and Versal Gen2,
has_reset is set to true, so device_reset() is called and probe fails
if the resets property is missing in the device tree. For legacy SoCs,
match_data is NULL and has_reset defaults to false,so the reset path
is skipped entirely.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 6881dc19435c..047a85342824 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -20,6 +20,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/cleanup.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 
 #include "../dmaengine.h"
 
@@ -942,6 +943,14 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 	if (IS_ERR(chan->regs))
 		return PTR_ERR(chan->regs);
 
+	match_data = of_device_get_match_data(&pdev->dev);
+	if (match_data && match_data->has_reset) {
+		err = device_reset(&pdev->dev);
+		if (err)
+			return dev_err_probe(&pdev->dev, err,
+					     "failed to reset channel\n");
+	}
+
 	chan->bus_width = ZYNQMP_DMA_BUS_WIDTH_64;
 	chan->dst_burst_len = ZYNQMP_DMA_MAX_DST_BURST_LEN;
 	chan->src_burst_len = ZYNQMP_DMA_MAX_SRC_BURST_LEN;
@@ -957,7 +966,6 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 		return -EINVAL;
 	}
 
-	match_data = of_device_get_match_data(&pdev->dev);
 	if (match_data)
 		chan->irq_offset = match_data->offset;
 

-- 
2.43.7


