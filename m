Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FCDCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 07:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNdb9DXpcCoc1nA+Psqz7oGwRQ8AhMwKGeUPrchz6Pg=; b=jSB/j9YpyXS5o0BEWCFIwZAdT7
	K8Vl9RVXNjz906ZG/aC/aSvvx5snRkoz7PETfHJHwhMdmgNu/HQZWpdK7BzjNSJEM7VlMwwfTSYh5
	xbj2B8cxvmlB5jyXCX9z/IL2TrmFH+2Ic6xmTkmkzlyTzbH5d6IwjfTEsLmBfVbFfHC3roK76na/m
	iEuNR7LBl7LfoLnYvPQ9SR7hpyzm+qinDWw1s2D1NVXE+lLiPzpULTV617plVzSbXcH1qKVP4HJDL
	ocm34vnVY1Ny8wvvSQH6K3bVYcg5b0RBKQMaH8pTwKCtMYnA6yHq73RCzYusM7N8y1KVBjV0gJvcx
	YKUJBHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6uO-00000000k3g-40cW;
	Thu, 18 Jun 2026 07:11:28 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6uM-00000000k1C-0HXg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 07:11:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VP6Eb1F+24F0Krfvi8gYi10avk/FEHdYX+hQoXzg2xWvyf3xX27W1KFJtL0Qj3OXRslze3bLIR9hYJSh1JQJZznAEJNNiEUGeMU3or21qzGIOf22stMk67DiNLm4w/7gqFOOk4fsy04+GA4aN/hKQ3xvbGH23aVJ2pDhqwoGx7VW8yL5vX/Oyyc3rEiP/x4PVy1Y3oKJTUYC9l/00nnuAGylOlHxqfYXqaOIlRfehYSUtrCtCTUwIEL+T6scHrq6nfN1QHFG0IVWmSImpEVWOyiy/Ji80g6/WxU6M7r6mLnFDF80wzwJHAROM78NgFkaYn86L6SelFX2QsrLEg2AgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNdb9DXpcCoc1nA+Psqz7oGwRQ8AhMwKGeUPrchz6Pg=;
 b=iAVKD6sR/Ufp38S54VNythIR5xrAvP/GMM4AXpY93vzWOxJ3PE/DHQA0csw/P2t+ez9y8iQRDu0L5CUAJwvLAJNm4yDFZnwXVznfxNUOPMswzkGB1/bLW0hcCvg+ecNwWm6rnKRJyip30TQJIoQkusOQYlfxzYwaa3afC0QXgIkq61Pj8E5Dj227xQPnHpu7eihF4e+r4PIyHKnuw38rZJ5HgiBMQc0OrYdT8xxnjFvdVvz5Ys5uaTlCjwP2jDQmeUjlGcbwpUUp8FjpdLdbwTQ6adGSEHXLYmNvx2FlifYEMzwF6amJdRH0zmPUOqmOr4yq2bpvxTD9ETrJVtXJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNdb9DXpcCoc1nA+Psqz7oGwRQ8AhMwKGeUPrchz6Pg=;
 b=i7YMSOCnUXU9KwLr9aSmCAEa/LmAm8PWowI3R7Xx3YjIYiadFi4OCdwAisNVDG4mcDmsK8/crs9tKd7RjeBXkXfWhbEWL9czkAgjV52Yq4Penl/3bPejkOshJRAma+xGEURIDpKuN/+HJudTijGNlzP4LaDOccCEJ9KoR6MYyAg=
Received: from MN2PR16CA0056.namprd16.prod.outlook.com (2603:10b6:208:234::25)
 by PH0PR12MB7079.namprd12.prod.outlook.com (2603:10b6:510:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 07:11:19 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::8) by MN2PR16CA0056.outlook.office365.com
 (2603:10b6:208:234::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Thu,
 18 Jun 2026 07:11:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 07:11:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 02:11:15 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 18 Jun 2026 02:11:11 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nagendra.golla@amd.com>, <jay.buddhabhatti@amd.com>,
	<harini.katakam@amd.com>, <m.tretter@pengutronix.de>,
	<radhey.shyam.pandey@amd.com>, <abin.joseph@amd.com>, <kees@kernel.org>,
	<sakari.ailus@linux.intel.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 3/3] dmaengine: zynqmp_dma: Guard IRQ handler against spurious interrupts
Date: Thu, 18 Jun 2026 12:40:56 +0530
Message-ID: <20260618071056.2024286-4-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618071056.2024286-1-nagendra.golla@amd.com>
References: <20260618071056.2024286-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|PH0PR12MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d4c295-f2c7-427c-f7d2-08decd08cb83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|7416014|23010399003|36860700016|18002099003|22082099003|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: UIdBq2VtI2DtE1v++eC82AhmSxsUYTtNIo/RcV89KsqrDG4vnx1uJQh39I3m9659wFUjfydkmuzGy8+v3Ri3GyKl1NQjfvz+IRve8EMuEBNMTU5eHgwVf1CLcWqg4u9d5IGA1sFDP1mPU5ZUTpg+HD5qDGPpRmXEmL1SEDbDKzrU2EJtfnpExDXX7uKVLy3ZqH89wCtPe+uPFXB76+cHpBA3LhfaXe+zLgVkXX31x2w2bDBqGNwND+yDZYIFVCdxzI7/q1UsNtElIRa4BKhbBsUfyeHWpPCTn3pFB19zNH6MxSmdzMa3Rniv95EcZJu4svLqgdVx2Gz9Nj9a2i3as4WVwZ7xtmTVxeAaRYI0asaWI0s+YcdDrQX3a5kzwLBsR+lsvWiW33JQviXWhUoFWWtFceE5fl+h+c6dE/5mX3SLsm/QPdDHSOnTV19HWyVvygoiB/NE75Mm92VYIUPzHq+P4Gse486oMjJn0y+acu5cx/t7xjWG3l2CfSd+NvzAyOdOwe0UCUNeqfntOgIFJcLvnINEb6xRC1mK5vGnWHM0o7MWSslC/P4J9zrEIA21v1VUd3JDboJS5uZNbk8Gjufj9Fz2ypAJxbAavhrtQYG4uSe3c13Ey4dpvoi0UcpCE8bS0Y+CPb790zw57dOToWvItovI8hiCQLX7jvWzvpIG/Wvz8+eRLx7WkxiTFvaFLK05etSgcacArUEnrEiQkkJQuZ87wfhWRTMZhcTNjmnjz5dFhqB5aLPtkF+hHCmRwsixgio2IVAbSydFdYAsYQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(23010399003)(36860700016)(18002099003)(22082099003)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Fegu17DNfmSbbpIdOWLCt+Px0OCmuSa8Cc+ZKw+kh94J5kyl+NJYmb4qfwoh3ILsXpyYEHryFIv8NyQl+kLyCKK9FOAaOOAY3/dHuu28jTvHDT3fzjRIXihVvHynYV0fpU+O8GRwBvu7264G/yOTLF8isKeMqw2QaBfSqs0cP1P0/a6oWXB7HVCCTeJhq2uE7dJyZsnxLF5Jc4IM7haCGA4/ZHgG7G/Biqy7tZg4PX5RA/jWjRB8BaNdPoRkrPgsdd1t6qlzYQur0TsqLfUiFzJb4aFbyEioSPA5F/bThq/D54BQnjDTGgbY27sXV0SvogamkBmde9MOu9cRJdnatB6TvadO7uItdOv9LUHV2mXfr0fcrhGMapm3pBIj+aX6Myb9MaAm7yKXysjYanu4It+9QAVjCGBRfUG1RjnBBYtwcnIwn5OmBBQ6PHQT8aoz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 07:11:19.0615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d4c295-f2c7-427c-f7d2-08decd08cb83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_001126_132002_BBB7CAE6 
X-CRM114-Status: GOOD (  13.31  )
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

Add pm_runtime_get_if_active() check in zynqmp_dma_irq_handler() to
safely handle spurious interrupts that may arrive while the device is
runtime-suspended. Without this guard, a spurious interrupt could cause
the handler to access hardware registers (ISR, IMR) with clocks gated,
potentially leading to a synchronous external abort and kernel crash.

When the device is not runtime-active, pm_runtime_get_if_active()
returns false without incrementing the usage counter, and the handler
returns IRQ_NONE immediately. When the device is active, it increments
the usage counter to prevent a concurrent runtime suspend during
register access, and pm_runtime_put() releases the reference afterward.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index a9dfec3c0ca3..ce9163138be7 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -730,6 +730,9 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 	u32 isr, imr, status;
 	irqreturn_t ret = IRQ_NONE;
 
+	if (pm_runtime_get_if_active(chan->dev) <= 0)
+		return IRQ_NONE;
+
 	isr = readl(chan->regs + ZYNQMP_DMA_ISR);
 	imr = readl(chan->regs + ZYNQMP_DMA_IMR);
 	status = isr & ~imr;
@@ -756,6 +759,8 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 		ret = IRQ_HANDLED;
 	}
 
+	pm_runtime_put(chan->dev);
+
 	return ret;
 }
 
-- 
2.34.1


