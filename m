Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA30FC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9ZkHzijdIOgvEH7DTBf41lbH2iJAJiAThDaWo1Kn6o=; b=kHRjzqQjIJMJ8mI+Ao6CHf9D8J
	VjEIasIlHx/s4og7ffCYOTYPZwiV0zj7Cljd0ud9lV4BKTBrL2WJbqxRfOfJPqrcilrPfrh9nkF2L
	TbfWjuGsmZkM8pzRbYXWeIdpoEgraEIFwwt0MC9rCvgsTJ5ka+nPAer2QPFMhBeICnmWauWhVR6k3
	gcdqHPLLSM0mlV2zS5xLNtoBCaLNciNF1VbOF8EUCQTWD0pp9sn7QQHnMa7+/3VqR2ycrLDKzOI6O
	N4vMCH2cMXRUkB+57IEI1FKQ57LlFi1OMpd0DUpbShDxvN8vYQAcx5d/TFIpe9+ZZh68pZR3Usc3H
	WpAzQ05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxFE-00000005mnz-0msL;
	Thu, 06 Aug 2026 12:30:44 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxFB-00000005mlp-2yR4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:30:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWfqXBbXvbqtP7qtuFzmDj4Nwu2W2CcYglI97XV0Kproerd46UhNuIBtFv1LeA/S5GHVhMq9omIs1K3PODDQBoNsrLCQFZ6lUa2qMoXUTBc7WQHU8nJX032QLlArDeQomVoHq9MOR2v1wOhV2rerSPRjFk8UyA0eRlb/8BW7hAuKEG4czAVsrZ/D/O03yxvdxWDqe1DFXVHNt4jJEMhSpRTNdCNC5UVsCuyKsBL0m7bcrA8tqP22KZKIXuqZJdGfh1SrCGpz7fBdDClpXEuwYVN8DYV8k5s0wRBaZxULeCHl8bg9lbKwQE52+LeNTuRLSVlnS1YLpb0sD9zq3oVbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9ZkHzijdIOgvEH7DTBf41lbH2iJAJiAThDaWo1Kn6o=;
 b=LTxnUQVM4Z4q4430ejjzP5oibUn5n89x8kJ7HAyNdwg5Y4IqJDDm5Q9j4J3p08gnV9io6D8gH6kBK5edG4ZHpiW1MlUS9R0N1mTSrqXObZsV5ZmfRGQlqtxamf6440r8jvFRze5Qgqsn/Li4yiKNdb4ONTaTPyJL9WF82wmeRB0GFap2bic67F+ODtDGPDXgV+U2mRCcIOzYz55SLv3HjANU9TfTqHguT4XpsQ3jDdYUf9Jbv2f+B9GX8x0EsvHN/HgmX96/3TwGsa8HGzOoIZ88g2LcQwZz9IMYM2XvrmJnvyFiR5mq4G9TCeBROFhCZvy3n1GFniLJx9IuVotA0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9ZkHzijdIOgvEH7DTBf41lbH2iJAJiAThDaWo1Kn6o=;
 b=Qr45z4sBpgioLD2X8B52BMhJ2XWv9Daw504dtlPZFa3r47Txlo1VA+HnaCUDUPZfIkWCVekFjyUqWXYNweUBVdJb2c/V9OSCNG1d8F6F12J5qgHdw+Pkaec6GN2CSLUfo9GbgYtUTN79Tu+OZlZhSyzNDLgtDdkwQEKEU1oliys=
Received: from CH0PR08CA0008.namprd08.prod.outlook.com (2603:10b6:610:33::13)
 by CH3PR12MB8236.namprd12.prod.outlook.com (2603:10b6:610:121::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 12:30:28 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::47) by CH0PR08CA0008.outlook.office365.com
 (2603:10b6:610:33::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 12:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 12:30:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:30:27 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:30:26 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 07:30:23 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <radhey.shyam.pandey@amd.com>,
	<kees@kernel.org>, <sakari.ailus@linux.intel.com>, <yukuai3@huawei.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagendra.golla@amd.com>
Subject: [PATCH 2/6] dmaengine: zynqmp_dma: Fix chan probe error handling
Date: Thu, 6 Aug 2026 18:00:10 +0530
Message-ID: <20260806123014.2120447-3-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806123014.2120447-1-nagendra.golla@amd.com>
References: <20260806123014.2120447-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|CH3PR12MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: b84f37b1-a1a7-4250-ba72-08def3b67f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|1800799024|82310400026|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ARHmq+LvqCpq12G2vhHF9/PMaTWpQJHcNA+3Xhiji0Rlc7/ic1CuiwviZv1N7hze8KfGyabtAIFS4g1r+BiKGvaRA6Wrl0LFTSERM2kExMVQi00DK1cAAq1lnnaWuvGqMbQp3j5ZreUt+X8WDhnUGhLvWrf5m/H9zMZ2hT0IUTHE8ElbzQ0Alo8dobgTjILAer02NKxobSOQFj/SofgM55ejLLPMo/R11F/dJiXLYVPK9/AGA0/iD/bgggwFUtOexOgQPcXIhBK8tEKUESI/qmI07XvoTZjiEgzH/YCxnEgGnf/LDsIkmV/GxKpNmQ94YHdy8PNV39WQFLr7mlCichTIViVvFlVTzyv2ATydeKwt2Zyh9RTELUlfz7m+gDoMayOyl8ZTVAmzSKL1GY3vtWhRISdNzRyyr5Tb2hG9SRNUfwOQasZurVs9Xt5nHmo5MXEZLXsRIlJ5O8OthdN7sq79Nm3CctUfIa8Nr3ukDR5C+ZbyoU9pGQw+CtZotYGq2b2vDN2LtsJr06N/b7UFb21kIe1sxVy4BFoomaFWjAd1mYZN7mNJtpSlMgPkkrkPuwfgHYyp76YKdyk1l8nyUxZeDq7tOZKwKUzakTYoZna/LY2pbbfoPaemGMXyIRW9McCVATVwZF7GUTFm2wM9PQZQAjBqjTNFfSNeoFFgNDZTA8cts4XruAjvatzUl5FdOZ370MywPekwXXRmEZ9jGg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YXRPVfEK9hjOYW8EuWHiGKRSQdBlvoMCHtBOcfyfTO4VbcrrVq1228JWOpt4KtjjPCeK43Y7SnzVDmoY8RgTLKeITCKV1zyqcmg0atCTesKpBlxK/dX2I4UCaWmQY93SftPOtokan/i4grJPGU7lp5WoKw6pzoVd5c0xgFERCfzZnsQ7odC9LciT5NO1Y3Vh5BieDj/x/QTjN820Ap9RTk/XlcAL1DQk1MRS+Vr9ZbRtTQZjsOOAG1Lz4HYJXXCXF5puux3lgbTZlmDtkaHnCYjECfgTlF9bwj4Xb2KJtn455+hD2qVnZCGEL5HQ88ZJSycZhBNyt/SBFPvJJZfOm5oAtQkw4b+Sl3WR6DiEOtNqKxBvKWvftbSxIB65Cu0DIpeP3+kPT04Ti/ye+30wN/m/qmKgRv2WFumobAPUJf86F0myys4ypShtRQaIleKL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:30:28.2817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b84f37b1-a1a7-4250-ba72-08def3b67f93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_053041_778332_58885A1C 
X-CRM114-Status: GOOD (  14.43  )
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

Keep the real platform_get_irq() error value by returning ret directly,
initialize chan->irq to -1, and only assign chan->irq after
devm_request_irq() succeeds. In remove, free IRQ only for valid numbers
and delete device_node only when linked.

Move channel list registration to after successful IRQ registration,
initialize device_node list head during probe setup, and kill the
tasklet in the outer probe failure path when channel probe fails.

Fixes: b0cc417c1637 ("dmaengine: Add Xilinx zynqmp dma engine driver support")
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index b7c561280694..f7e4a177bd17 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -205,7 +205,7 @@ struct zynqmp_dma_desc_sw {
  * @desc_pool_p: Physical allocated descriptor base
  * @desc_free_cnt: Descriptor available count
  * @dev: The dma device
- * @irq: Channel IRQ
+ * @irq: Linux IRQ number, or -1 when not registered
  * @is_dmacoherent: Tells whether dma operations are coherent or not
  * @tasklet: Cleanup work after irq
  * @idle : Channel status;
@@ -896,10 +896,11 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
 	if (!chan)
 		return;
 
-	if (chan->irq)
+	if (chan->irq >= 0)
 		devm_free_irq(chan->zdev->dev, chan->irq, chan);
 	tasklet_kill(&chan->tasklet);
-	list_del(&chan->common.device_node);
+	if (!list_empty(&chan->common.device_node))
+		list_del(&chan->common.device_node);
 }
 
 /**
@@ -915,13 +916,14 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 	struct zynqmp_dma_chan *chan;
 	struct device_node *node = pdev->dev.of_node;
 	const struct zynqmp_dma_config *match_data;
-	int err;
+	int err, ret;
 
 	chan = devm_kzalloc(zdev->dev, sizeof(*chan), GFP_KERNEL);
 	if (!chan)
 		return -ENOMEM;
 	chan->dev = zdev->dev;
 	chan->zdev = zdev;
+	chan->irq = -1;
 
 	chan->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chan->regs))
@@ -954,22 +956,26 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 	INIT_LIST_HEAD(&chan->pending_list);
 	INIT_LIST_HEAD(&chan->done_list);
 	INIT_LIST_HEAD(&chan->free_list);
+	INIT_LIST_HEAD(&chan->common.device_node);
 
 	dma_cookie_init(&chan->common);
 	chan->common.device = &zdev->common;
-	list_add_tail(&chan->common.device_node, &zdev->common.channels);
-
 	zynqmp_dma_init(chan);
-	chan->irq = platform_get_irq(pdev, 0);
-	if (chan->irq < 0)
-		return -ENXIO;
-	err = devm_request_irq(&pdev->dev, chan->irq, zynqmp_dma_irq_handler, 0,
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+
+	err = devm_request_irq(&pdev->dev, ret, zynqmp_dma_irq_handler, 0,
 			       "zynqmp-dma", chan);
 	if (err)
 		return err;
 
+	chan->irq = ret;
+
 	chan->desc_size = sizeof(struct zynqmp_dma_desc_ll);
 	chan->idle = true;
+	list_add_tail(&chan->common.device_node, &zdev->common.channels);
+
 	return 0;
 }
 
@@ -1134,6 +1140,8 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
 	ret = zynqmp_dma_chan_probe(zdev, pdev);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Probing channel failed\n");
+		if (zdev->chan)
+			tasklet_kill(&zdev->chan->tasklet);
 		goto err_disable_pm;
 	}
 
-- 
2.43.7


