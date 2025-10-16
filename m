Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35F9CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EsIbwfCzj0dNaR5ft+o30uFHCIcVib2leoRsIBXOS18=; b=2Jf0V9Boo4boqFuflmL7OqVbUM
	ddy4EFj1ndOHLUfoMx8mSA4fv/FdkVFxZDZpG29sFI3HjZeLPAtw2tYVkptW702pef0JhpqbBwcIF
	sY6GSZ8UA5Ce07JXilLUw8k22unxhbyFkzBQzV7dZDn1T5P+zI4Qxfh/9+2TLWHVS7N13mYeDIEeP
	NtA4ELbkJGkNEv2PPmQUliV7oIhGbMfk/O+UE6UGYUmDSCv8CdKEG3FHvz0MpbcDbquLIRjaecBXK
	047l3W59ntOcB3CxfDbZQDARwwI1g8eyh0PXeBT1RQm0V3qNyGgDvV4MS4c+S3wNqHpogiKp9jbKV
	wueq1FfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9GXs-00000003V6e-0Jku;
	Thu, 16 Oct 2025 05:29:00 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9GXp-00000003V5n-0Ytn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 05:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWvOTBXy78oOLniZ9WXfK65WuWAPPWch5hcDlaNfJOzo4vLDESbTKxky43hxNKPl9CxE5MT5GxYQbtJllUnJlwuQG/uHxkpvBFSTx83nxpgwTU5kKy0l39luyriyFgFcXaWJDtETKror0xf+OOuFBMZVRVwunxWms1U+RiAjjbauwgsE/kYr6IBOjfX2S17YGM5TwdsELYJ3H2XkpfNPBYjUxd9g63ih9Dchw6kJbnu+/Q7iqLHewNw9aaqnAE/0RWklNvVd0ej85YETOHbaC6MCF/DHOmYQUpUxSSTF1zS2Cw6LYvoUQdu4rOCTVNBkc1i+uPEoIH3i7OCq/d80Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsIbwfCzj0dNaR5ft+o30uFHCIcVib2leoRsIBXOS18=;
 b=wsulDnR0OPxTGbDzEc50FKGoNXvB2NHgC7NoTNJwkwJ5e6EulB06fC6tUcSiFCozUkj9/Jdu8HARidJsxWozczv5vRh4J+G80aewQmNKOF7RnGS+XOwS2oOiA0TUw3awUWlQlGVvVCdnjvCey0uJhPM5Rsg//ivm7kvAFjeoxy+CqUq0RQ6yebsxPcuyVlATY6csCTvfuykpTTkxGSI9rWQu/wrI+HJ+7osligrGGYPRr9umDeCrCEJXJGZ1xT6z989X1aeZcRLYxYntn/6NUFUHSJdrG7mq8IBI+QrrRzHwFmYTPcsp4Aj7QjaV+ffeuNLoHzKx0B1IH1+jp1Cogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsIbwfCzj0dNaR5ft+o30uFHCIcVib2leoRsIBXOS18=;
 b=fUTnDuLK3bMMvx5d9DOot06uW9Qfyw5kgjffxo9QBG/UuNvO/8byB6OtQM6IJPuDZ0m5j7QQHs45MoZHNWh3NKoyOSCp6FjbmybI185WK+AgFc+vyiR02qML2YiUwdujVDEqKrp2b34ADrElt/topgRnWZwrBawVzNZ/nvFcWC0=
Received: from MW4PR03CA0296.namprd03.prod.outlook.com (2603:10b6:303:b5::31)
 by LV2PR12MB5775.namprd12.prod.outlook.com (2603:10b6:408:179::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 05:28:45 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::f1) by MW4PR03CA0296.outlook.office365.com
 (2603:10b6:303:b5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.11 via Frontend Transport; Thu,
 16 Oct 2025 05:28:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Thu, 16 Oct 2025 05:28:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Oct
 2025 22:28:43 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Oct 2025 22:28:40 -0700
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <dan.carpenter@linaro.org>,
	Michal Simek <michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, "Tony
 Luck" <tony.luck@intel.com>, James Morse <james.morse@arm.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Robert Richter <rric@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] EDAC/versalnet: Refactor memory controller initialization and cleanup
Date: Thu, 16 Oct 2025 10:58:39 +0530
Message-ID: <20251016052839.2650517-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|LV2PR12MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 81fdeda0-46c4-4ad8-f5d7-08de0c74e00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?He+t2Jveg6Bq+cUfJkceZfSlefMXbPdHEDUjEsOTJ/8p6Idb+fyRXspfoKfH?=
 =?us-ascii?Q?3ki9/nGLPbydT4KQvlVRglI24sFbU36HncUGyA2Fjx2NR2G5HhifN0sy5pkO?=
 =?us-ascii?Q?gDuqFvM3tNEO5Tl31Ajl2h1mFTqkKYEWkdzrdo8EGSFkaZYb+yccmOoB3QOc?=
 =?us-ascii?Q?mXY8vnNanjExlJBWr78OqaUMexvedPur01N6A2r+pgFADvvozCdh+0RN2LxN?=
 =?us-ascii?Q?ec6rlaEesp8lqIAnsQnjHt/EJXFENFlZg0RNZb5WViNhHcxYZpdMbLjty+3b?=
 =?us-ascii?Q?owq4NDqWI0qPjB3MKjrUWEkBdSuGgq1+B3tNFxZVl8G1axf/G1pITYVWapvr?=
 =?us-ascii?Q?Kvz3Lvop3ZAxFMt9Tp+27TJaLOUwYmH8Oy0EK/pJiG/q/Kz3fwtSy+cGth0D?=
 =?us-ascii?Q?JafkJH93RF9lJWKQUKf1d4ez4WlMOo3vbZZWQROYsHQhvZRV+oExUah/CrUw?=
 =?us-ascii?Q?yQ7mFokEweux343WSTdV774HqBevntflMsCa9oDNb3nE3Ig+gERo6EkafHxT?=
 =?us-ascii?Q?X+ypX3iRxQOqdWkTllmwVUciYRdM4DJ9XYOO4rYkfCR5s4HaiQoKRn8jKggs?=
 =?us-ascii?Q?TGQJxNL6YWsJyDeTyipQ41cJQYMjnC656gcM00f7hrLX0gSDQbM+eo2WZKI0?=
 =?us-ascii?Q?c1yQHK5+FjrZCEyZN1+3lpVNTJ5ghgc2AnHNzSs33U+Risyq+pUWKFQXGsow?=
 =?us-ascii?Q?BNGBgKQBo+gpt59RyltR2LiB9Z6MVt4YuY37N+vctg/XM4BElpqZuafEaS7w?=
 =?us-ascii?Q?esdK/y3sYOtM7dt1e+EHNHh6tc3gwi9hai6zfWictpebh+jTYIeWLoQIYdr8?=
 =?us-ascii?Q?EiGvazYbvAhCq01S0lxxFNsKrVN+msiLNmpTamedYzJgbW0l5Irq0/99WPU7?=
 =?us-ascii?Q?YE3QxobIgg/33Dedn3K9QuvnXFXbiRLcciCwy6YWbySKpI/8XpXie0v9ZEu2?=
 =?us-ascii?Q?8WU5K/9zgpBTE1iuiFBAdQtYcnn6wDENKBTov4zIhrhkqynGQYesfrHb98L9?=
 =?us-ascii?Q?8q1Sn9Rd/17FTHeMavOASFT6cosecmh7lcKEQW4j/AqUFGpSTfgreCj2iCvd?=
 =?us-ascii?Q?D/Ifde7sCI9AXije/U+G51WNncyOVLi/PF+bOD1QyhAfg0yd2hv0fQjehLEg?=
 =?us-ascii?Q?+NqtURr2Jz1yZ8wj8VDVIjIWofvA4Cl8Ltjn0kzwNGWeuwHUmdPB+Fsawe0F?=
 =?us-ascii?Q?ko/vAiJaBpb+rqefnWR/ga7CBGjuJu4LJorulTNhHOkbT0117YAKJUzUYBGB?=
 =?us-ascii?Q?wJ5LoiSGJIjAbm4exPZEEwdCa0bT+3Z0nNHHz9NMEx6PrBxDB2MRDjrLVty/?=
 =?us-ascii?Q?c86SfWy+M3fQsUDZlyB4ObEo6liWvmxH0dofkw/QgN/Ctx5vkTb3Hj/icn/i?=
 =?us-ascii?Q?54Ad8C9IQMPG0Fcobyrvf+82Lrv0ivNRgG5OmwP0M3zDUPWXp3GLI7bo08ft?=
 =?us-ascii?Q?ZbRl//psGw+xBBpbRNAMjYTHv+2rqdSvQPzQj/NoqtTZBIw6ANSX/1xxpQZT?=
 =?us-ascii?Q?4n9/QxCS3DwXwdl+C4/bPoq9zqFmSBE3trxfMNFIApOAruE9kGPPGleOBAE7?=
 =?us-ascii?Q?7Y2/VLrZl/hbMAylk+c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 05:28:44.6406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81fdeda0-46c4-4ad8-f5d7-08de0c74e00a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5775
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_222857_178261_B2F6A4E9 
X-CRM114-Status: GOOD (  17.01  )
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

Simplify the initialization and cleanup flow for Versal Net DDRMC
controllers in the EDAC driver. Key changes include:

* Introduced `init_single_versalnet()` for per-controller setup and
  `init_versalnet()` for looping through NUM_CONTROLLERS.
* Added proper rollback logic using `remove_single_versalnet()` when
  partial initialization fails.
* Improved readability and maintainability by reducing duplicated code and
  consolidating error handling.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versalnet_edac.c | 158 +++++++++++++++++++---------------
 1 file changed, 87 insertions(+), 71 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 1ded4c3f0213..fc7e4c43b387 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -758,92 +758,111 @@ static void versal_edac_release(struct device *dev)
 	kfree(dev);
 }
 
-static int init_versalnet(struct mc_priv *priv, struct platform_device *pdev)
+static void  remove_single_versalnet(struct mc_priv *priv, int i)
+{
+	struct mem_ctl_info *mci;
+
+	mci = priv->mci[i];
+	device_unregister(mci->pdev);
+	edac_mc_del_mc(mci->pdev);
+	edac_mc_free(mci);
+}
+
+static int init_single_versalnet(struct mc_priv *priv, struct platform_device *pdev, int i)
 {
 	u32 num_chans, rank, dwidth, config;
-	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
+	struct edac_mc_layer layers[2];
 	struct device *dev;
 	enum dev_type dt;
 	char *name;
-	int rc, i;
+	int rc;
 
-	for (i = 0; i < NUM_CONTROLLERS; i++) {
-		config = priv->adec[CONF + i * ADEC_NUM];
-		num_chans = FIELD_GET(MC5_NUM_CHANS_MASK, config);
-		rank = 1 << FIELD_GET(MC5_RANK_MASK, config);
-		dwidth = FIELD_GET(MC5_BUS_WIDTH_MASK, config);
-
-		switch (dwidth) {
-		case XDDR5_BUS_WIDTH_16:
-			dt = DEV_X16;
-			break;
-		case XDDR5_BUS_WIDTH_32:
-			dt = DEV_X32;
-			break;
-		case XDDR5_BUS_WIDTH_64:
-			dt = DEV_X64;
-			break;
-		default:
-			dt = DEV_UNKNOWN;
-		}
+	config = priv->adec[CONF + i * ADEC_NUM];
+	num_chans = FIELD_GET(MC5_NUM_CHANS_MASK, config);
+	rank = 1 << FIELD_GET(MC5_RANK_MASK, config);
+	dwidth = FIELD_GET(MC5_BUS_WIDTH_MASK, config);
+
+	switch (dwidth) {
+	case XDDR5_BUS_WIDTH_16:
+		dt = DEV_X16;
+		break;
+	case XDDR5_BUS_WIDTH_32:
+		dt = DEV_X32;
+		break;
+	case XDDR5_BUS_WIDTH_64:
+		dt = DEV_X64;
+		break;
+	default:
+		dt = DEV_UNKNOWN;
+	}
 
-		if (dt == DEV_UNKNOWN)
-			continue;
+	if (dt == DEV_UNKNOWN)
+		return 0;
 
-		/* Find the first enabled device and register that one. */
-		layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
-		layers[0].size = rank;
-		layers[0].is_virt_csrow = true;
-		layers[1].type = EDAC_MC_LAYER_CHANNEL;
-		layers[1].size = num_chans;
-		layers[1].is_virt_csrow = false;
+	/* Find the first enabled device and register that one. */
+	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
+	layers[0].size = rank;
+	layers[0].is_virt_csrow = true;
+	layers[1].type = EDAC_MC_LAYER_CHANNEL;
+	layers[1].size = num_chans;
+	layers[1].is_virt_csrow = false;
+
+	rc = -ENOMEM;
+	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers,
+			    sizeof(struct mc_priv));
+	if (!mci) {
+		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
+		return rc;
+	}
+	priv->mci[i] = mci;
+	priv->dwidth = dt;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return rc;
+	dev->release = versal_edac_release;
+	name = kmalloc(32, GFP_KERNEL);
+	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
+	dev->init_name = name;
+	rc = device_register(dev);
+	if (rc)
+		goto err_mc_free;
 
-		rc = -ENOMEM;
-		mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers,
-				    sizeof(struct mc_priv));
-		if (!mci) {
-			edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
-			goto err_alloc;
-		}
+	mci->pdev = dev;
 
-		priv->mci[i] = mci;
-		priv->dwidth = dt;
+	platform_set_drvdata(pdev, priv);
 
-		dev = kzalloc(sizeof(*dev), GFP_KERNEL);
-		dev->release = versal_edac_release;
-		name = kmalloc(32, GFP_KERNEL);
-		sprintf(name, "versal-net-ddrmc5-edac-%d", i);
-		dev->init_name = name;
-		rc = device_register(dev);
-		if (rc)
-			goto err_alloc;
+	mc_init(mci, dev);
+	rc = edac_mc_add_mc(mci);
+	if (rc) {
+		edac_printk(KERN_ERR, EDAC_MC, "Failed to register MC%d with EDAC core\n", i);
+		goto err_unreg;
+	}
+	return 0;
+err_unreg:
+	device_unregister(mci->pdev);
+err_mc_free:
+	edac_mc_free(mci);
+	return rc;
+}
 
-		mci->pdev = dev;
 
-		platform_set_drvdata(pdev, priv);
+static int init_versalnet(struct mc_priv *priv, struct platform_device *pdev)
+{
+	int rc, i;
 
-		mc_init(mci, dev);
-		rc = edac_mc_add_mc(mci);
-		if (rc) {
-			edac_printk(KERN_ERR, EDAC_MC, "Failed to register MC%d with EDAC core\n", i);
-			goto err_alloc;
-		}
+	for (i = 0; i < NUM_CONTROLLERS; i++) {
+		rc = init_single_versalnet(priv, pdev, i);
+		if (rc)
+			goto err_rm_versalnet;
 	}
 	return 0;
 
-err_alloc:
-	while (i--) {
-		mci = priv->mci[i];
-		if (!mci)
-			continue;
-
-		if (mci->pdev) {
-			device_unregister(mci->pdev);
-			edac_mc_del_mc(mci->pdev);
-		}
-
-		edac_mc_free(mci);
+err_rm_versalnet:
+	while (i) {
+		i--;
+		remove_single_versalnet(priv, i);
 	}
 
 	return rc;
@@ -857,9 +876,6 @@ static void remove_versalnet(struct mc_priv *priv)
 	for (i = 0; i < NUM_CONTROLLERS; i++) {
 		device_unregister(priv->mci[i]->pdev);
 		mci = edac_mc_del_mc(priv->mci[i]->pdev);
-		if (!mci)
-			return;
-
 		edac_mc_free(mci);
 	}
 }
-- 
2.34.1


