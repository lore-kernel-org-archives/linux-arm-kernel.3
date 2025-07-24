Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1352BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 05:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YKs0Lht37tDkgh1CwlEgyh+w4IjGVI5XfasdtSsIgt0=; b=gfttOpF2rLZ3k+0zhQ08Y5xdoP
	u1mRqVRjOBjTHTq8ZVM3YTOKmSIAyGlTjxmMN78ICr+VM4F1/y2MI0V1NCbANBjBKH7FTqhSHRcHD
	PVvq3RUFKPrciylZBG7jtaPQMPg5SryO3QxZnOMx/uB12fhciMtx3/jhFFXgUUjXi+IMu2aURu5Zd
	VMgajG5FlES3cbkl88jrpVKpSkpc1jyyTirUUFTUSZQJIiXJ6ODfpm5OV6lAx75OUZytJr1Hk/QXS
	poONKGIikFgUbLVv36xkWx7bnAnvVSV7myWQe9g+Ov3Ay3WRI32ByY5JSBVaKZwyuqvCH1OMiC7Lk
	9+48guxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoK7-00000006UVK-2vCd;
	Thu, 24 Jul 2025 05:16:55 +0000
Received: from mail-bn8nam12on2060b.outbound.protection.outlook.com ([2a01:111:f403:2418::60b] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoHf-00000006UCW-3cUQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 05:14:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwBkiiXllmWk1XHvJKeHQy4HBWozfpL0I3ZyOFcH8OlC0LC7lV0477VxUDwnTi6jiuJqq6J7Ezp55n4bIAePGvWPoBqQOOwgkYjME/4gSsdJiY2yij5fSgtmcK1tKLCFOuBcqrKRNe3T4e0CyQG9HzxoNgsxMXyICC3rhHKWS+8BvU9fYf+JhzTGlKrRaP9vuPyeRLcJSRavzDKgIxPR15UIgA2bILnbRzrzi88ee2zqq/4e4mKyGl51vB1jAPn5r+mt7R3zGCqy1rxWLtI6iO4q0VeMC53/8NR4ZgUgFA1MHuF0syQp1fnhlc3Q3J7BsZ7QsoluJ+KTBh/YWKoF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKs0Lht37tDkgh1CwlEgyh+w4IjGVI5XfasdtSsIgt0=;
 b=yyamMlTfWfBcRZTSXysFdVEvn3bekNR0C0CctUWZRgF6l/EKqCdycS9Qol+CiRByi89LLY7rjcIcG/sHsCOgNj2rfuswX5PXi6JxMNHwE2Q7kjiJUWlGv6adGi054P5EfLaObGCvQ4hNniafTeLPhZC0s3KgI9P7iLQmXd4WhLgaoYkhIAciE98gBxsJYLoN1/bp4joYlcNwp3CL7NUe29fexkAhfHkFGjZ311PYFXHBLeU8+LOKZnSWcrcjkKrvxJ2ZQtlUYIz98MR7vaOgN/1hDgmRcl3rjoeBpTWJHgz1vJ7uW1vcWzf2DivGvw82VvstNDXen6/O0osC9vG6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKs0Lht37tDkgh1CwlEgyh+w4IjGVI5XfasdtSsIgt0=;
 b=TlxDxHyL+XiwFcZV1oioOTwmVrUhESF3dlYh5AKWHGsQ+/L35Ly1ID+jaRqjnBC7m4MdnAoPZ+A94nymM8hlB4rGbYFV/6KTFDHRbgnXY/QLTpY5wu7GDFPGMDdXhDZXeLiiZDM236cdT4gBpvcrgc9/WYeEXsACdG60mg/UvGE=
Received: from SJ0PR05CA0025.namprd05.prod.outlook.com (2603:10b6:a03:33b::30)
 by CY8PR12MB7657.namprd12.prod.outlook.com (2603:10b6:930:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 05:14:10 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::70) by SJ0PR05CA0025.outlook.office365.com
 (2603:10b6:a03:33b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.5 via Frontend Transport; Thu,
 24 Jul 2025 05:14:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 05:14:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:14:06 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 00:14:05 -0500
Received: from xhdharinik40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 00:14:03 -0500
From: Ajay Neeli <ajay.neeli@amd.com>
To: <git@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <michal.simek@amd.com>, <srinivas.goud@amd.com>,
	<radhey.shyam.pandey@amd.com>, Ajay Neeli <ajay.neeli@amd.com>
Subject: [PATCH v2] i2c: cadence: Add shutdown handler
Date: Thu, 24 Jul 2025 10:42:43 +0530
Message-ID: <20250724051243.22051-1-ajay.neeli@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ajay.neeli@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|CY8PR12MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 89cd68bc-56b9-4552-a4c9-08ddca70ec3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oqr4wcQ0JbDfhAfFC4OpPDaPZynVW1jODlFctNeRi9/yowo6QOoFtaIonIuu?=
 =?us-ascii?Q?y2XUGOiA+JHUi+DO5Wl87trKTm6xj5EHeXHDDy9tll9McOP1OXW7pQIIHGNq?=
 =?us-ascii?Q?ZQ41Wh4YVljyXXN1OsEQPi2l5iO6hm6iQErHGdspjxxNKDuRyjga34kMLi6N?=
 =?us-ascii?Q?s2oy633wfrLQz19TLyC+8WNlo55ByeW2gsWl1o3CXBbFEle3CPomd5OTrm98?=
 =?us-ascii?Q?4jtRuzum3uNRsmk3TV78mh3qg/NTsp5tdfUm9JxkQ0lW8CVh/TLH3YTd4UwT?=
 =?us-ascii?Q?BWUW14MY6gBzZ9hgBvQNr8DiZ3AmUrsYdna8Ovb7T5/XJqWJ4rIaBkiZJ4cB?=
 =?us-ascii?Q?4O9FN2Gt2jWDey448HS/ydhnZp/78kmh8TrN/KfrfUIxUvhgA2cNtpV3Zyk9?=
 =?us-ascii?Q?9v4ib0MZIHd/OwgKjbhRm6SCAmjfYBi9oLo91w9Es45sUVw+RYx837Mcqbz9?=
 =?us-ascii?Q?eBMD+M6Mr+IXzyJwFLttVrLEnvLaxzJDK86EcJuzYxVaIrIw7TiVPJc+bGGL?=
 =?us-ascii?Q?Pt4H4ioUHbmue5cWgUym6rpkfTMxb0ZX6bmvR6LUIb+AL/g/UVLhyrqQwrq6?=
 =?us-ascii?Q?Geh7ECmXnyVSC9U0d0FKRatwceC5ohsUMxGA9w86virIr4uz55GHE4FtaHlN?=
 =?us-ascii?Q?RLzLrl7VGDOYNXeKhrmh8NV4/Mypb7iWnMiYkmIgJuGiHG3JR1ZqfeZ94OlF?=
 =?us-ascii?Q?AOnBwx7rKxolumLpNt/st2yALbIqt3Gho8ywt80YE7AjWhQUR/PDBrFosQBu?=
 =?us-ascii?Q?2sXpvFlB35JoLK9JgXk1WiVEWmUvpYOr5/gSXCPwPTO/T2XqE+v5RDIwDyqD?=
 =?us-ascii?Q?CI8thUb6bq50r3L9htb1JdKyD/49amsD27DFiBfclhioQLUpwt8Zb4UsHJ2q?=
 =?us-ascii?Q?2xs8oGUk7J8PX8yr5OSgKyVV3HDL9sRHm8prQfvSfYeGwCY9cGVpD1ePUD3L?=
 =?us-ascii?Q?uSF/CUCr6VcXtolBfpUqRmEMTwpX3CyWbG/LZC03N286Ia1qnJusPcqxjlf4?=
 =?us-ascii?Q?36EkLdi/f5N4RDjd4AHvlozhGnfMZ4hP+SwUXn5yEtAMBw1tBHd8uPaSrXyh?=
 =?us-ascii?Q?LNR0LSBWWb/NWXlnUdMM6BAxxop8LzXeyLYZZ82HxVL9RzOjQIQ2BlygYXqT?=
 =?us-ascii?Q?s4iI2RQMD/+VDACDaegfXKflRQFXOLdmgAwN1Gi8ZSx9OOrvRlsGbl36hivw?=
 =?us-ascii?Q?VPgUxzWbIablVITlKCtxhx5sJZICdu1EeXoaQhPxcuODt38FMLLb5GYfufbG?=
 =?us-ascii?Q?xyBftiguojDQJTm7EAuqwM6mpJughpZ//yaQIiKnVw5kCe8i/vTSXhqWkpMt?=
 =?us-ascii?Q?c0Ydzhn9go3pl2Jtqnt0qJ22BJ9agVYt799UckmGQOKJ88mEevWjThI8shps?=
 =?us-ascii?Q?8y/wttFnPRAobdD145mLZA6jvY+qdsZd6MewL/GDAqduSBVVLw/+qvJsPnGZ?=
 =?us-ascii?Q?xOwqSHzNxwg93lii4Ozj4L20YJiOoYXSRPKdOQCz6V/4CYb6ImiLxBOe8O+N?=
 =?us-ascii?Q?N7ML8VExuc3p/mBT7Z7US1IonEswCjzR/0MY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 05:14:10.3604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cd68bc-56b9-4552-a4c9-08ddca70ec3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7657
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_221423_910438_7ED81E8F 
X-CRM114-Status: GOOD (  20.11  )
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

Implement shutdown function for Cadence I2C driver to suspend the bus
during system "reboot" or "shutdown".

Interrupts are disabled in the handler to avoid spurious events when the
driver is in slave mode.

Signed-off-by: Ajay Neeli <ajay.neeli@amd.com>
---
Changes in V2:
Disable interrupts
---
 drivers/i2c/busses/i2c-cadence.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 8df63aa..e0a56df 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -192,6 +192,7 @@ enum cdns_i2c_slave_state {
  * @transfer_size:	The maximum number of bytes in one transfer
  * @atomic:		Mode of transfer
  * @err_status_atomic:	Error status in atomic mode
+ * @irq:		IRQ Number
  */
 struct cdns_i2c {
 	struct device		*dev;
@@ -224,6 +225,7 @@ struct cdns_i2c {
 	unsigned int transfer_size;
 	bool atomic;
 	int err_status_atomic;
+	int irq;
 };
 
 struct cdns_platform_data {
@@ -1495,7 +1497,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 {
 	struct resource *r_mem;
 	struct cdns_i2c *id;
-	int ret, irq;
+	int ret;
 	const struct of_device_id *match;
 
 	id = devm_kzalloc(&pdev->dev, sizeof(*id), GFP_KERNEL);
@@ -1526,9 +1528,9 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(id->membase))
 		return PTR_ERR(id->membase);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	id->irq = platform_get_irq(pdev, 0);
+	if (id->irq < 0)
+		return id->irq;
 
 	id->adap.owner = THIS_MODULE;
 	id->adap.dev.of_node = pdev->dev.of_node;
@@ -1590,10 +1592,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		goto err_clk_notifier_unregister;
 	}
 
-	ret = devm_request_irq(&pdev->dev, irq, cdns_i2c_isr, 0,
+	ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
 				 DRIVER_NAME, id);
 	if (ret) {
-		dev_err(&pdev->dev, "cannot get irq %d\n", irq);
+		dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
 		goto err_clk_notifier_unregister;
 	}
 	cdns_i2c_init(id);
@@ -1636,6 +1638,23 @@ static void cdns_i2c_remove(struct platform_device *pdev)
 	reset_control_assert(id->reset);
 }
 
+/**
+ * cdns_i2c_shutdown - Shutdown the i2c device
+ * @pdev:	Handle to the platform device structure
+ *
+ * This function handles shutdown sequence
+ */
+static void cdns_i2c_shutdown(struct platform_device *pdev)
+{
+	struct cdns_i2c *id = platform_get_drvdata(pdev);
+
+	/* Disable interrupts */
+	disable_irq(id->irq);
+
+	/* Initiate failure of client i2c transfers */
+	i2c_mark_adapter_suspended(&id->adap);
+}
+
 static struct platform_driver cdns_i2c_drv = {
 	.driver = {
 		.name  = DRIVER_NAME,
@@ -1644,6 +1663,7 @@ static void cdns_i2c_remove(struct platform_device *pdev)
 	},
 	.probe  = cdns_i2c_probe,
 	.remove = cdns_i2c_remove,
+	.shutdown = cdns_i2c_shutdown,
 };
 
 module_platform_driver(cdns_i2c_drv);
-- 
1.8.3.1


