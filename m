Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A2ACAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 07:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkFA7lZHHJ2lADLG9juKzzsOf7dBEPZqf85miPqn4EY=; b=4lwC8ayH31JkGlxIJ7Yl6HEkmZ
	nTdf8Gh6ogQn+KPJXMBoufKIhbMTUiSDhmEh73630bDgdy6x98rTkybZ7pPcHlJJlRJfTeeGhjFtq
	xVm6z6w1zZdqYwSYMJYbLdQCzPM+erKdYiux1oPzBdPvKQFcCHtHBxAh8JUpdKNMv04ASOHz1nNmC
	px6g0m8nvtovlLDREssg9ykLpSUoMpDstbhuNmZDfkItO9DNVKlKpgg6qgRuYHmLBYRoajv5aEKt1
	RGzYmedLRkTa9T1PGCoGIrvW1It5tQ7eeWHiC7hV5MOWz00uDArQnWEX6L/Qt/OEoD60Xp0XtWQBs
	eErNq9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38TD-00000001dgg-15RU;
	Mon, 29 Sep 2025 07:38:51 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38T5-00000001dcI-1DRe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 07:38:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abTejoXL2iC2+gsY6mfdORfn+a6Sz0YfZVkZ052l+fD2x0WITiT2QTkhY4XGJXcyOjOIScVimB+vDh5u/0P9sOzXl5CxUvmhPihnF4vHwHKoS7cFGFSyl6K9jtuzAKymT+s5qO3OS3N1O9DxCyXIUNARnS9A1+EaLVjCHSmKD/WvvXrtFS51LckqbSEhMFgAqh3ikhflxlcEWkAx79bo8JBMBT2PFV0mBDGLJSSnVIHRxkdhDUoRaTraDhkOKm8g9GgN5Z43cUV1Q8dlS6YlqdcJCI5zmoP8wj+QBWFBorckwr6Nl/3TdDshPGMEn3Dcn+Pw/td7qUXa2Tb1cAcI4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkFA7lZHHJ2lADLG9juKzzsOf7dBEPZqf85miPqn4EY=;
 b=KeLTs2/6pCKGTxg2mDcznwiXEYz1jDLblhyRakMdDydJq3PpLFkJFA4trc3VbXhOXT+hss/cEwqSKGFzDuaCzTg8vOXyxBBq04G+lLwzPy39yT+gzu1wZHTl/hmfYxkGHAllfjQ8msySBgDsZvh+bjUEIFnta6kPHRzhsGCB1VOImj0bLX3MLgHvebSgstb3s72wVHzuQK3Ch1MQIGaj7+MIMla63UHirdA/hIdE1XfNQQqSTbZIBXc+q1kg/nGL56eQZPlSpQxNKSmnuPJaF55lIn8o2CNEe/3DCy49TlaI3KG0BjvQcfb44AAD7rchaTLuRTaNJGxaiefVluJEaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkFA7lZHHJ2lADLG9juKzzsOf7dBEPZqf85miPqn4EY=;
 b=1iO/Av5uTmSX3c/1UoOofCHTThORSv+0+P9ieW72MliEi/7XSlYZzga+lDlRNTXC9vX146cevEOUR89AN6z2oj1AIm4RheVZezEWQGCdkIP2bt1r4dfTHfEZLbCF16H/L0mOvlkNiadH8BoI+fRxgE0JmCqGxLVH86vQbQDT9mk=
Received: from SA1P222CA0035.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::10)
 by IA0PR12MB8838.namprd12.prod.outlook.com (2603:10b6:208:483::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 07:38:22 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:2d0:cafe::23) by SA1P222CA0035.outlook.office365.com
 (2603:10b6:806:2d0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Mon,
 29 Sep 2025 07:38:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 07:38:21 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Sep
 2025 00:38:06 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 29 Sep
 2025 00:38:05 -0700
Received: from xhdharinit40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Sep 2025 00:38:03 -0700
From: Harini T <harini.t@amd.com>
To: <jassisinghbrar@gmail.com>, <michal.simek@amd.com>, <peng.fan@nxp.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<git@amd.com>, Harini T <harini.t@amd.com>
Subject: [PATCH V2 4/4] mailbox: zynqmp-ipi: Fix SGI cleanup on unbind
Date: Mon, 29 Sep 2025 13:07:23 +0530
Message-ID: <20250929073723.139130-5-harini.t@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929073723.139130-1-harini.t@amd.com>
References: <20250929073723.139130-1-harini.t@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|IA0PR12MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: 35af5335-d517-4305-2217-08ddff2b2a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AWdWXj/w6OAhwhVGG4kRIzzkgcrA/bQlaKn0fntRLLfJN0PkAqcPQSEsN+ed?=
 =?us-ascii?Q?7MMv6EClrIab27DMQneUC4uwLWX5mH+sfEygsdvtvTTcOoQWasH2YY6DyVMJ?=
 =?us-ascii?Q?BekE9AyKwU7zBOkjomRCCKi9yrsrCjWtZtbXC5bkFk4wk62/WIAkb4hQ75XW?=
 =?us-ascii?Q?hcfuF3yAiS09+TVbGIL/1IgqIidyevw33aJcaI9XkaIBPG1rm8WxaDnBHNcf?=
 =?us-ascii?Q?MyPugwUhzPaco5iH+zOmZkvf/ZDdGQ+9hjMndl6uwNUm+uBYphBOL3egiTDY?=
 =?us-ascii?Q?9yD9KfpbFhzasJdxHBp8AD7FyDr+wljK2eWP1llLkmzFoAFiGPEXraOyzUN/?=
 =?us-ascii?Q?u2/89RQpKeBAtRnkN4W+tcJNaI36AHY1KUmi74MNQ0KifAUYi75OkTQq6nhp?=
 =?us-ascii?Q?beNrgtmirmGbdV9fBJN02Qyegn/lB2lpUTHORUCNUVZzxofJj5CXesZgHsf1?=
 =?us-ascii?Q?8LCGKKFcDJQ+kDzKV6T+OEpJl1ZqvbXDAFMsvPCV9C+StF1tLeUQoC2EA1LH?=
 =?us-ascii?Q?M7y4FvkT05dmD4l17GVMxTXmQBbBgPBs8ua4BMhK3rofgV1klLGzMSEAPRm4?=
 =?us-ascii?Q?icMDTJa4IotJAAIdQa/wGsXVNFeyENemMVveBQgUmRycDNrcqPdNTr7VqSDY?=
 =?us-ascii?Q?imaeQvgyxqMCjURz6L8gwXa2aeuoUbjKiqSiTrA6WRNIDFKuiukWlhBqhVz2?=
 =?us-ascii?Q?htco8t5W5JTuiJMfMhsgJIfOl45D+jH5pLFSlaUXIPl+uJnp1hYklHqrGk2D?=
 =?us-ascii?Q?SlniO3Ulhnq/fTdJTERYdcRb+40LoLHmBGJ/S9Xl5l8VGoUov4Kih8jJrTQb?=
 =?us-ascii?Q?ZfoeyoDgWCntyC2gP/X5Uk5GDnmDz81zOUIJ2GJLmjmZE2LeqBWeDRmefAM5?=
 =?us-ascii?Q?uXCtP2kND1iEMXMh5NLDFA16jV2owLbR0WQF7mM/Jv/kl1jXkUqGSnPT95Ia?=
 =?us-ascii?Q?yZHgDgkzcvwFhBCHeD3dYCY9SBG1AzfJ5Xy2Fl2ZJVPnvyWNZFfHmQ//2jt/?=
 =?us-ascii?Q?fsy5t9pJYAaNqj4KSz7UC7mlfDLQ762/bH6JgmRHv3S7CeRIrTT79vL8wgXQ?=
 =?us-ascii?Q?eREZO21gnc+g264s8cpe5TtPGqnVW3v7XePYWlZLSLzx6fmIPgtq4ZIqxbrx?=
 =?us-ascii?Q?5+VATcVGyVbMoFe5mcx/7jvf0rHsV36QAXkDyLwZLE1slqOUxkBp+wAka0nL?=
 =?us-ascii?Q?kA0Og/miDyTZG6dqjK+4E9U/yeMm+pHOFOiKPZKvUj5XBquBcqyp49uml3d8?=
 =?us-ascii?Q?m/O/kirZP4qbIeKOlP+6uJYAg64mFTA5qhepGMUcqAhPYbnI9txsaOa5ZfzR?=
 =?us-ascii?Q?xrrQousaVp9I1Bp/GykcBnDFDceGZhIcMZaptqZC8E3etc3VU8mQnQuLHMc4?=
 =?us-ascii?Q?7cQN2X47CLVhKK65qXyWkBsRjmY54nXH8kLHSmLGYw1WDylJaDWd5eltasRU?=
 =?us-ascii?Q?OZFcb7EAD8uH5yVscu4gTCxYzRbC+CWVZ4QJYXLG293SnwU+6/jy3GQIaqfi?=
 =?us-ascii?Q?zhD04B48l94C+Rg1waqXE8nFiXZkZMKLWOVn2uZjdzJr2XKcoiO9sAUHnWE0?=
 =?us-ascii?Q?FDziPNk6qowYX9Xo8rg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 07:38:21.6827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35af5335-d517-4305-2217-08ddff2b2a77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_003843_336111_F655AE4F 
X-CRM114-Status: GOOD (  16.27  )
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

The driver incorrectly determines SGI vs SPI interrupts by checking IRQ
number < 16, which fails with dynamic IRQ allocation. During unbind,
this causes improper SGI cleanup leading to kernel crash.

Add explicit irq_type field to pdata for reliable identification of SGI
interrupts (type-2) and only clean up SGI resources when appropriate.

Fixes: 6ffb1635341b ("mailbox: zynqmp: handle SGI for shared IPI")
Signed-off-by: Harini T <harini.t@amd.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index dddbef6b2cb8..967967b2b8a9 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -62,7 +62,8 @@
 #define DST_BIT_POS	9U
 #define SRC_BITMASK	GENMASK(11, 8)
 
-#define MAX_SGI 16
+/* Macro to represent SGI type for IPI IRQs */
+#define IPI_IRQ_TYPE_SGI	2
 
 /*
  * Module parameters
@@ -121,6 +122,7 @@ struct zynqmp_ipi_mbox {
  * @dev:                  device pointer corresponding to the Xilinx ZynqMP
  *                        IPI agent
  * @irq:                  IPI agent interrupt ID
+ * @irq_type:             IPI SGI or SPI IRQ type
  * @method:               IPI SMC or HVC is going to be used
  * @local_id:             local IPI agent ID
  * @virq_sgi:             IRQ number mapped to SGI
@@ -130,6 +132,7 @@ struct zynqmp_ipi_mbox {
 struct zynqmp_ipi_pdata {
 	struct device *dev;
 	int irq;
+	unsigned int irq_type;
 	unsigned int method;
 	u32 local_id;
 	int virq_sgi;
@@ -887,7 +890,7 @@ static void zynqmp_ipi_free_mboxes(struct zynqmp_ipi_pdata *pdata)
 	struct zynqmp_ipi_mbox *ipi_mbox;
 	int i;
 
-	if (pdata->irq < MAX_SGI)
+	if (pdata->irq_type == IPI_IRQ_TYPE_SGI)
 		xlnx_mbox_cleanup_sgi(pdata);
 
 	i = pdata->num_mboxes - 1;
@@ -956,14 +959,16 @@ static int zynqmp_ipi_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to parse interrupts\n");
 		goto free_mbox_dev;
 	}
-	ret = out_irq.args[1];
+
+	/* Use interrupt type to distinguish SGI and SPI interrupts */
+	pdata->irq_type = out_irq.args[0];
 
 	/*
 	 * If Interrupt number is in SGI range, then request SGI else request
 	 * IPI system IRQ.
 	 */
-	if (ret < MAX_SGI) {
-		pdata->irq = ret;
+	if (pdata->irq_type == IPI_IRQ_TYPE_SGI) {
+		pdata->irq = out_irq.args[1];
 		ret = xlnx_mbox_init_sgi(pdev, pdata->irq, pdata);
 		if (ret)
 			goto free_mbox_dev;
-- 
2.43.0


