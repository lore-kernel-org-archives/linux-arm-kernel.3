Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78936CDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuWXUg+L5G4q1vuW0NzZ7ISjcHJRItNY/483fn+wDKs=; b=Pc0RK5XhlZXh6iotl4QGI0tBk7
	0Q9NKgmklse5B6Pp4t54RdOLHKEltnxdXqrCZinLA2ClTKzx3ASbx/9GvAe16j4yQo+AkbCW+0X2o
	Vcz+ZNlXBBH95rjOFbpOKapJ8N86vy1xfHqe2KUPfl4T4mFzimVGp8V2YGNybDQnNiFkhNR4riAUt
	Im+uTtSG4VEl8Un4OvzI+fOc5OaeSPt50tGAwZreZk4aIwq5f2EK7bsUbNFp5kaGAvICUw34WYnJe
	WUQooqhzf9Jb6StTr2Uq5cYW+wg8i7JcxdoR9LQPmXYVyrwBsuwg0L+8oSTAC2pHfsYB/5A97ETRo
	SNEDDqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2qP-0000000AyuJ-0Jsd;
	Fri, 26 Jun 2026 09:27:29 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2qC-0000000Aync-1zSQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4ygFtWcTMq9I7N5cOhQ5a+J/Gjy8etnaYnN+rNVobygT4yAw0ZJLzC5dxZ3LXhcCf4R2In6zhWsX3JnwIpCFwiMtoOyefo5gDZY1gw+TW/qgzWK3tbThpcIqcJsUUsqHozcCAOdKnTCyS791dTDZ7dB6T/wZVbAC+XY83gvyxEiq8xFtCbMamRe2d4jAFo0QP8CakrlvOH1rlTMQJmKwL+wfWrkap0/97QWygPDxdNQqm3+sr6QWfplztxHbk1/s2Q8oj2CyO+Qu+TAXlyqYws1HT4Ztg/zNFDsf2Bjs6A4X6n1nqvRvJn4MHFosULpuB0Nzv0lQnzHHONvzg5QfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuWXUg+L5G4q1vuW0NzZ7ISjcHJRItNY/483fn+wDKs=;
 b=lGWN0RW3Yc8K1DCe+CjTO5Ce33qGP7uG8BGJzUwlzbV1SuCttUBhx+7umkEPwVjNXJH7m+u5VX/rR47nYgNnBlO3lQeqNGCZ3u/8wOeiFS82CX2yLoMZTXNFLNTq7BtMG1w8Ik0HDVynZEfLJxnLM3flG3Qe9PQlUdVFSPXIg9mL/d6b5r5HbxTRYWTEj9CRGTbk5RiySlArp9bN2/n8TCTfp3Jctuha6eXImep8iQpAGqzXbVoaEK6wbyJmKz1WZ8tkrIQwZm2RbzVehUikCSEwbhUXj9clGCCkp/pZQZDdpq4g09mmXm4gOu10tppP5sl3Op0r52xTeYoEdBPFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuWXUg+L5G4q1vuW0NzZ7ISjcHJRItNY/483fn+wDKs=;
 b=tUprCJGRaf1NPp5CmtBR79YG0Pij95sdD2vq+3YRTyHEHkhUeffWe/mslLSJm8RGfMBAcdSubR0Vb1hXbGMuos3TWa7Rsb6CXISIciX7GfIxu/JGzK++O/X05RRQJAGXHtcbZyJBe4EX9V2ALFsCTrrVcJZqv8uAyD191Xumsfc=
Received: from CYZPR05CA0002.namprd05.prod.outlook.com (2603:10b6:930:89::20)
 by LV8PR12MB9208.namprd12.prod.outlook.com (2603:10b6:408:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 09:27:10 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:89:cafe::7d) by CYZPR05CA0002.outlook.office365.com
 (2603:10b6:930:89::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Fri, 26
 Jun 2026 09:27:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 09:27:09 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 26 Jun
 2026 04:27:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 26 Jun
 2026 04:27:05 -0500
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 26 Jun 2026 04:27:04 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<dev@folker-schwesinger.de>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/3] dmaengine: xilinx_dma: Optimize control register write and channel start logic for AXIDMA and MCDMA in corresponding start_transfer()
Date: Fri, 26 Jun 2026 14:56:56 +0530
Message-ID: <20260626092656.1563871-4-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260626092656.1563871-1-suraj.gupta2@amd.com>
References: <20260626092656.1563871-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|LV8PR12MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8387dd-433a-4c0e-7d63-08ded3651927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|22082099003|18002099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: MHsCr+CngTY52aHH/gWYTOFC/af+o3GJozJQ4DdhLEtPcicQENrFsT3DlRxzpEUiImif9NBwQgRrShMK/kKzOy3Vyae6l4ClgtU+X7KGyR7cs6PZREfOXNlfbKVPMgQdBpMWRS1iFmp32mRBLmWHrgeEtSwD7I+jFvKrq6U8+EbB0iyyi86bnFSofkDPzMO6oH6uItiOxhcSr3zXwZjL+oPaIK9F0SpMgz1DUATBWjaEEL7tVKUiP62kfnMdB+nFcgDQWt5C9K4Ya2kMdORt1RMeVAPtv4kDTlIjQYwcfX5H9TGKuRA/aSl7W8kycQqEr2JAPD4Dpg+OQVv2uevWh2D1fTYjewEHZSPbZyrVvGDzyCS5/6h+0pgXhZXYeDwnMVXrtch+5FX9NZEOIlVI/SXVmnSl5ivMWkHX45w9UxIlH4lCk35+odRnujV4+INCreNrBOoMy06niy5cGamBArEqU8p4yJAg0TgMCtuhSMi2Novvm0/LC6Qr5xK8Pfe602MfrmeHwQ8WYuGtP+NYMEb7IBa7qCgH/dE3WYGkUSizki4yZlIXmStppBfS1kZfM5nui+50Qg0R4YlUYTgaLbK+GY1jXyNHaY3vw2qnCDgNy328dHrta3ayddCwdohtv6DimTryys1zFS0Ns59cBd4bvVjdBin7/TedV8tfK+npn9yfi9ULRNasUm3JeZ2SRDjnMeRLiR3j9yqkfrnygA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(22082099003)(18002099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HhwofPRdDdYwJCUwXM/JxnzuLKdVgptI1XHVf2vIURmodGbLU6oCwkCxzPI2fss+LMmTMLXSDnK4N8kY29rcfFB5VOwnqwOvFBzSxnDWk1zxb/s5K1nJL94S0wexf9S9JZj4/uupg1tnW6AoUXZX1Ko9xpCZa8v5lQ3tnQwKOaFRDVUPXqtGIUynq2FMhUdBA73LG9C6urMMWgCTUX2t58U7B7ledlUm4FISivNCosZPoYDaUxvTnUFjpUPqx/0Lh3+pi4i+pmD5UZIDJRUyWaRqP8LhuJoSH9yZaleNOvpQ5XO793dt+xBazlUnmQRpFX4KiUmLK5rS2TOd/lHz+ro74IwpJWg7qfJN8ry9/QwdOjVORW9eZoq90JQnEXk7rcLnZhJX9+7Ez9FVFzebpUezU1pJQ/Zxf1uEcz8CWt6J+aIyW+6tDInmF9+sfA2R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:27:09.9484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8387dd-433a-4c0e-7d63-08ded3651927
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_022716_520052_AE613FE1 
X-CRM114-Status: GOOD (  10.49  )
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

Optimize AXI DMA control register programming by consolidating
coalesce count and delay configuration into a single register write.
Previously, the coalesce count was written separately from the delay
configuration, resulting in two register writes. Combine these into
one write operation to reduce bus overhead.
Additionally, avoid redundant channel starts in xilinx_dma_start_transfer()
and xilinx_mcdma_start_transfer() by only calling xilinx_dma_start() when
the channel is actually idle.

Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>
Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 6e7b183cb499..829601d8a16f 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1603,7 +1603,6 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 		reg &= ~XILINX_DMA_CR_COALESCE_MAX;
 		reg |= chan->desc_pendingcount <<
 				  XILINX_DMA_CR_COALESCE_SHIFT;
-		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
 	}
 
 	if (chan->has_sg && list_empty(&chan->active_list))
@@ -1614,7 +1613,8 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 	reg |= XILINX_DMA_DMAXR_ALL_IRQ_MASK;
 	dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
 
-	xilinx_dma_start(chan);
+	if (chan->idle)
+		xilinx_dma_start(chan);
 
 	if (chan->err)
 		return;
@@ -1703,7 +1703,8 @@ static void xilinx_mcdma_start_transfer(struct xilinx_dma_chan *chan)
 	reg |= XILINX_MCDMA_CR_RUNSTOP_MASK;
 	dma_ctrl_write(chan, XILINX_MCDMA_CHAN_CR_OFFSET(chan->tdest), reg);
 
-	xilinx_dma_start(chan);
+	if (chan->idle)
+		xilinx_dma_start(chan);
 
 	if (chan->err)
 		return;
-- 
2.25.1


