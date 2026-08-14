Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D47C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 04:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSlMFIa+cO6IhmomOYMXs1vF4YEeFIBKdUngi/THcIA=; b=cxZmQ1ChYVMasg6O0fOyOum7Ol
	QVqHbh1Uv8hMJT3OYIg00kiJdFSYC0yZhgcMXFhYw+LfZhm9HhLJK1e0DKTaL7w+e1Wy5nkKkSeCP
	PezYL3Eq8JYozrtbQ2i3DCixYd/AvCS2H8ZQPB393FZUXQpGid8mK+nkl56RqxOtUsDCQQ/w5o9Re
	jZIrvR+/favgDuC6yjXVy59zQpOR+NCLkPIyqslYoquKSm8EMLkRqWjNXgBwHJGnqNB6KYYMx4bzS
	XQ0FJ52u+e+O0oUvn3C9gIG0LZKxs936qHOghLt7h2AWU3yNH/xBh/5ViM0Ofzbm3CaEsyTRG6oI4
	zdnEgYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujyI-00000001wvN-1ZBQ;
	Fri, 14 Aug 2026 04:56:46 +0000
Received: from mail-northcentralusazon11010017.outbound.protection.outlook.com ([52.101.193.17] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wujyA-00000001wt6-099v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 04:56:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxijpD+mUL/PgLsdKU0L8HNEBnsSqProRT48VuLFKhyIM8vqeSy2Bz14ZTzOJtI8RRZCleq2M1lnnDFe9dwypwB78U3rXF9rQlowBGOYMlgIzF20qiS3fGnfoMkFadLfcEEbunvkEjHOjccZR4eLQlWcNF9FJVf3CwSVwkH2qIGLHLK6GROpCVw6GXNe10wwP38NzaTkBRnh6a1/6DKocZbXBOTbWNYvULRoMl+NnXTTlOJvsxUdzLnEedfO1W+m/P7KR20Hw1wzoBNulhjlHsuo77K4BOBl+eQQRvP2SdBCN5Tyh1EnvdFnMVR0pFfDerVroYdQ3sy+9AJrYB37rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSlMFIa+cO6IhmomOYMXs1vF4YEeFIBKdUngi/THcIA=;
 b=SCa9rK8C8xVEVf/jprpi5NTo5ZMoLY4BGLI2XNMi6NqtLVX+2XWXw+IDaznrtSUf+6Iiigo4EtdRvCCYsPVMB23/UW+WJSreUjnKZd9HKKWoA6gJyWIGyHNXYaXCoE4N2seCM3rLkU9PskeY5ZT48IV7+g0iknaCzei3As/XqORl69jX/4fttK+uytno+QgxdfBhRCwb4ldx9+O5oz83E2ABwtAm6jlCtAKAXq/4fqG5Dt/m6IcjZHwkAckX+DPusYyP5h40vJUXcW1gRIotu5isKauJVMsWNV734xNhChV4CHHlHntQ1at+vKaF/6S9z6Tvy5vbcqjwR42d6iR7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSlMFIa+cO6IhmomOYMXs1vF4YEeFIBKdUngi/THcIA=;
 b=aTE8UGGch51J124che9nehKwrzCg0yC7wFcFOE0HWY456+VhQZM+P1nnrdBlR8gtmbYX3WDA0Tb5DOrVzMcOnujH7Q1017jEwyBFmbu0R7wsivXZ5peTvtUA0IVH6oX0l2CKCJtB8e1YoijMqL0ms9wbw+K9UXUByfrO+KY6y3M=
Received: from BN9P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::25)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 04:56:28 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:10a:cafe::18) by BN9P221CA0003.outlook.office365.com
 (2603:10b6:408:10a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Fri,
 14 Aug 2026 04:56:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 04:56:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:28 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:27 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:56:25 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <nagendra.golla@amd.com>
Subject: [PATCH V2 1/8] dmaengine: zynqmp_dma: Fix PM rollback on sw_desc_pool alloc failure
Date: Fri, 14 Aug 2026 10:26:09 +0530
Message-ID: <20260814045616.1661199-2-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260814045616.1661199-1-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|IA1PR12MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: 707484ba-0915-483a-1663-08def9c066b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: GoU1m7HJsYnhZ3T+d1FNTYXqbqW6kNjSVrN6E9/NR0vmgrbnuOpAKhY5Yj+CZNxHrpDafgtWinWqXqJBQgjfo2Zf1NlCN0uGAo+H+uZKtO8FKmqG1MG8l+t77Q6EvuZ7m9dZZESuc02LvYTplckaGsJv9gAcV1Yu0Nv36PxB2TcMCnVnAKijtJVEht6ri9PRg2pxWTUt73Zq1yYOSEs+bo+wX3Vxg2LXS3VqULaoWK+3JKV7AQhXDnfnb9eBNhiFo4aZN9z74O6CPWxZFHqjJhJL5+fUgzzTXWf6jOFUXs5o1Or9w1nbZnBLIk77EXnXTOD1vogkMj5SLftcjpFvgc1n8avs0n3pb0+w++A3kgzdVeVg4p3j2hAsdaVQcmR3SqX+EPVEtq45HDcHUjqabe4D8q/UGIlMVdV3EcGAt/qFgoY5sM0i+4qLcdykBq8tCTlinVxgM7HOs1CNOEyCp3iAfUGlcjw76Z0ylZaEk0pTLErtzDI/TwNRkzAjWqgq2NvhxdNo116AlBar+rcVnq5pcPHFsvK9C2zqQtiphXhaLY21ekQEafDCqcRFs+XPeXHt3WM5ZokHO3s6zbF0w1ODhm+JaXyL0vvLjn2OGhcbwNCQ71x0F+pe2KM+TJawKxTSlcziYNcsQHTYh+mZOQHq5MP3XOdlKHf8IcD3Hm0DH2uzpLDSj+bulOUawq08036Q20TUtF2w0LxQZC4ULg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vkkY/HfDppB9rS0aqhRNAK7LCccmvMxeFfGEL0Ty77ZyWhC5UhZb4bhyYV80ABl6A021e9krdkE4ZpiEFh7Uv7qYiAP8Sw/7hGSFutbZLCTgUKQ12Z7H6yGYGKE8N8sR+tSYjTQ7NPGcxhMyUv+san57TjMDR+4YsMtJVWUwFgYlgH3JMUOwtEXxwNvrSByhKSDAw6p7vi2VUALLId/Xufqcl1kdj77Zkou1Bwm4JPUaqiUkm4PoZjXP19yScIdY6RRMxVwPFrfd30CJb2Yo8VmYa/+nB6a0PAeZlqCL8W0mNQM+fOFvVSTI5ow8ZovcO+amsR1EN7GTgs+AaH7UWM8BihsFM8cwZ8kWqGh3yMPOfKseZbxwh+Uqm3Xe+LFBwljcyXPhMgl+BnRsU0UqrNWHxQ8v3e9FwhD+BZXTrIPgSZgKwDneWI/pdcoXmdAS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:56:28.4749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 707484ba-0915-483a-1663-08def9c066b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_215638_180191_F4C119A3 
X-CRM114-Status: GOOD (  13.62  )
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

If sw_desc_pool allocation fails after pm_runtime_resume_and_get()
succeeds in zynqmp_dma_alloc_chan_resources(), the error path returns
without dropping the runtime PM reference.

Route that failure path through err_pm so the runtime PM reference is
balanced before returning the error.

Fixes: 8982d48af36d ("dmaengine: zynqmp_dma: Fix PM reference leak in zynqmp_dma_alloc_chan_resourc()")
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
changes in v2:
- Reworked the patch so sw_desc_pool allocation failure goes through
  err_pm, ensuring the runtime PM reference is dropped before returning
  the error
- Updated commit description to match the new behavior
---
 drivers/dma/xilinx/zynqmp_dma.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index f6a812e49ddc..9f1e69700dd0 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -483,8 +483,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
 		return ret;
 
 	chan->sw_desc_pool = kzalloc_objs(*desc, ZYNQMP_DMA_NUM_DESCS);
-	if (!chan->sw_desc_pool)
-		return -ENOMEM;
+	if (!chan->sw_desc_pool) {
+		ret = -ENOMEM;
+		goto err_pm;
+	}
 
 	chan->idle = true;
 	chan->desc_free_cnt = ZYNQMP_DMA_NUM_DESCS;
@@ -516,6 +518,10 @@ static int zynqmp_dma_alloc_chan_resources(struct dma_chan *dchan)
 	}
 
 	return ZYNQMP_DMA_NUM_DESCS;
+
+err_pm:
+	pm_runtime_put_autosuspend(chan->dev);
+	return ret;
 }
 
 /**
-- 
2.44.4


