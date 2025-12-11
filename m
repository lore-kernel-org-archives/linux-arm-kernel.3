Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA31ED41C35
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sfN2Xqa+p5gfOJneWzSpNcn4kz4QJ/vo2ZHULLcWoIw=; b=Lvk9eMOz2KPCX0jQ3gKbEc8k+Z
	fPWW4fXmXimm3naiATrcvuGFazlEu9YN1egTdv/Ljf0ctyzoA/seQICCjwqGkvIJ8lj3FZ3rmW4tQ
	7WjUoB8tB5qorsfUYb9qiFzjLAUQS0Xx0igxjS87gYiSYrX+vGeXl4hGKX2gQxRgKb6fs9x4F/Ta2
	0IDnVrjc+Ct0wUQHLIb2Il+5NSS78Yd9LkKefsSZTeQwIQnC2StKEZnnJ7OMbSzZKeSJYr9+TcUo7
	2nsQNUqHnh5TjjMbmhIDflEsG9DCIMqpinKCuvGh1lXq1WOfTbsnhmYw3KwvqX+R65wSEUBAV5P74
	FfFWz7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgtz-0000000Gf5p-2EH9;
	Thu, 11 Dec 2025 13:40:15 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgtw-0000000Gf5M-2F5g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:40:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KI8V1GDT5JFnRHK++DGVqD1WUAw+dhMEzlwU6QZLC+6bbdTEErwY6yHVsWesXSCbc6EKkcqsHwYn6qL5dac4KcNVE3Ek1fZDGgSdyBOFvX5GkO3SbVQHimHKzLIV6+WSYufMVVDmURZ9wZE2fAav6spFKTBQG0JJrssL5gYVQztfOOtlGVFKdYrhhX7dc/0wbhXVA7qsf92EtQyzmXIgWdfIkbxl1mN567avnLXIIXJhMwX3/o+poS5z6QNGbC7dFy/On+/482D/LpfvTp4CgjMDm7Pb4LmFugjS9r7kGmTW5oLFu3wb/daHeK+LWJgscJX/eu75SzX0nN/B9beHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfN2Xqa+p5gfOJneWzSpNcn4kz4QJ/vo2ZHULLcWoIw=;
 b=Ussxz/i2gF5NMcXO4sgRGYrqk3TG0hpo8SWpxvzbmhUoF9Jt4rFkXD5PzKuxIT2I2QeoSSvsD8OkdRtrbhjCmZKSbLYBLAmdyB652gHO36Zlq95PJ0YkdEsbyyW5F39kXix2FnT6VaR8iQrN9csejwXnBoyNRtUaMvhiguwZhmCH16CwZr7k6QxOn23r9RrVJjWEtLYFW1UhsOrPPSaBYIaLghkcQIzUzePByxMVO+BFyjl/K6DmO98RXVaMTujCuaxkscGmM2CDBwjifz6z8HyF4mQaJkMbrDXul59dFCtvR+ZahtA8PM6FmHeImMAK/LEeokuOQrc2+Q1OabuaGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfN2Xqa+p5gfOJneWzSpNcn4kz4QJ/vo2ZHULLcWoIw=;
 b=SHJXdeyNdkxeqhlx/IqR91PENc2lmuO4fGQyQC5JvnbQwtNfddJoUWWaWQJQniU61s8G/b4DRsRcHFwtbaweSPZLv8w6FximogoiE1lKhQmzxZpZGoHa5yNxXDf8hNoQxtiwo3rD5oBAkfMWL45CmBL4l9MeI3nG3LSkFWNE8ZaG/uiwtlc5YvV3z8dOTxy8AHpT5LIRmG9Yc2zDDVRkS2jiSZWZj4zirFV8ouXFChfwnMoZd+iJkdBq4LFIxo39YgB04Xf4Yj6pprDn9hDhSfWjBMk12kJ/spype1L+WX8qRYYQhiKCg/iQgsD4SvVReXXe9hwFxsA68oStaLCc0g==
Received: from BLAPR03CA0082.namprd03.prod.outlook.com (2603:10b6:208:329::27)
 by DS7PR12MB6333.namprd12.prod.outlook.com (2603:10b6:8:96::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 13:40:06 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::6e) by BLAPR03CA0082.outlook.office365.com
 (2603:10b6:208:329::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Thu,
 11 Dec 2025 13:40:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 13:40:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 05:39:48 -0800
Received: from 9491a72-lcedt.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 11 Dec 2025 05:39:48 -0800
From: Nirmoy Das <nirmoyd@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<nicolinc@nvidia.com>
CC: <jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Nirmoy Das
	<nirmoyd@nvidia.com>
Subject: [RFC PATCH] iommu/arm-smmu-v3: Allow stream ID sharing for devices behind PCIe-to-PCI bridges
Date: Thu, 11 Dec 2025 05:39:33 -0800
Message-ID: <20251211133933.4128100-1-nirmoyd@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|DS7PR12MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: e2049ba2-7cbb-42a4-58e0-08de38bacb4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iTdSsV8FXunh1OwlqP02RtbronY6srNu+b1UF0JsDizBXZ8ESI/UhcqNXFmI?=
 =?us-ascii?Q?DrENQg4U0LeVcRImIBHHWuNjWJB+EmouIwNsA4vFjnEPV5SFwWP/Oi0qrBAo?=
 =?us-ascii?Q?kY1uSqlDIj+Y17s8/XjKDGxWdhmu0HBZjE+IcTp+yD8emagWDc10edL3whtx?=
 =?us-ascii?Q?7QOAgr86EBk+5mCFuvVtXqydg9rNzqTvDc0itoAjOESyaFJC1fjNHs6gxZ2F?=
 =?us-ascii?Q?9pqeP+fztQM52FJORdDAcyP13PVo0rse5z2TDHc1LmJU9uf9ZfJyHHJHprih?=
 =?us-ascii?Q?QjEtyfQ+LL8iTDV4B7zYi3HhkFkQMGn1Oek2y2ihZ7BVZQhg415xX9erGGOs?=
 =?us-ascii?Q?ky6qse67yVEjEI41VIocuMkDJYUgI+jdhy7rzsKoUQaNlasXsHc1BCLMxQpA?=
 =?us-ascii?Q?1ufhryH0VGZ9EvA0SJjjQPhQVnlFJLJi10xBBfY3pQwDgyxMOMy7C0X2Ezxv?=
 =?us-ascii?Q?TDmId1wpSvdR4wRwgwq6yB8Mn9DSwBiwV7HZ1h/sdWzF8WbuqWMF+Ccj5+ki?=
 =?us-ascii?Q?q6KNyhjiQ08zvetf87/ftKnD9qSG3zEFTWT66INAjCxy/Q1mwR4eY6gztOtR?=
 =?us-ascii?Q?NKFhtFklEa/KDtJ8eOugbXFFK/TsbWyCMbt0XPvcP3lcXKdKTal5Nt7qpSqT?=
 =?us-ascii?Q?4e3Q5+fQ8w16asbcqS22n3r/LaQqRshKkmEhoruothDXmjlCz1x2OhVozB6g?=
 =?us-ascii?Q?Ug/QLjphDKukly5cLRBB235yDwaTWrg1iVvpGJpb/Z1BNMaj2FY+gIOccaMe?=
 =?us-ascii?Q?GcqOqj2li5USO+7FaoAk3ghj5sL3IgPItjRjp/M4/RHhP5HGjSIbAmhwfNbE?=
 =?us-ascii?Q?JfVfibHB7qmehnMg9z+n/L/5Xo4b8fnh8gnmhBheVhhZ8uZKcHmFmzc1Z1S3?=
 =?us-ascii?Q?7UjJ/BlRbjZ7IiOkksD3tLYaVQcNU0V4ZXs6+Cm0TgbGRoOp6kq6WuqENURh?=
 =?us-ascii?Q?nRozyPZxMvqBOH+38g4M9TcKDpM8tThN0j8FcLsAMFqePILAkl97yCIjB/2d?=
 =?us-ascii?Q?IhYNXCaG/by0hgVhbr4Z7kCBVELMg0V0Vpnswql5t8I6weUpms7j8zMr81SR?=
 =?us-ascii?Q?g9603Mb3SYmGfxZwAg6bOASM1eRDy1T1sN9aJ/hyxlpMdFXUSCGpNPsK3C0i?=
 =?us-ascii?Q?/Lk5CpEPFu07H8g3rZIk9WLGynFzhEO7cPGcKxBJBbLAaKVkhzKrtYi8xsbU?=
 =?us-ascii?Q?2JVoeUhI3MBlhz4WAN+rHT51RGUMh/TxDleE4IfDtpm6j/LdXMD5uLZIIssD?=
 =?us-ascii?Q?0wjCjL5KMY01L/zm+4PUu94zI/isEzBUHfi6CrDTjedHuRJ5t+FCi4lOjaeW?=
 =?us-ascii?Q?7dtwPbaAhWTTd8ddCxt8PSAE20ePLfUYDrooq8p5KiNRP8ve2WQCu8BAVnh/?=
 =?us-ascii?Q?6IEKz+wMjRxlY/dC3nSs8PVhuJH+UplbI5EQV5tQkDKuLLBauCL82jgO/I8U?=
 =?us-ascii?Q?tj7Wk6Voogm9ZIRXkDlI+n2XClXqrWTCwjmPvoWv/Z9rGeqXI3XFO80nKnbk?=
 =?us-ascii?Q?KI9PIfo4uxvzskyJV4nzbfZgVAEn/dqXtMug+MLa1fr4gX0bZmMK+x3KuWru?=
 =?us-ascii?Q?RJaKIbECniD0/ns8nwQ=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 13:40:05.6937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2049ba2-7cbb-42a4-58e0-08de38bacb4b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6333
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_054012_581396_08CF52DF 
X-CRM114-Status: GOOD (  10.10  )
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

ASPEED BMC controllers have VGA and USB functions behind a PCIe-to-PCI
bridge that causes them to share the same stream ID:

  \-[0005:e0]---00.0-[e1-e2]----00.0-[e2]--+-00.0  ASPEED Graphics Family
                                           \-02.0  ASPEED USB Controller

Both devices get stream ID(0x5e200) due to bridge aliasing. Currently this
USB controller gets rejected with "Aliasing StreamID unsupported", causing
USB timeout errors. Allow stream ID sharing when both devices are on
the same bus behind a PCIe-to-PCI bridge to fix this issue.

Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2a8b46b948f05..411b8803eb46f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3480,6 +3480,17 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 			if (existing_master == master)
 				continue;

+			/* Allow PCI devices on the same bus to share stream IDs
+			 * due to PCIe-to-PCI bridge aliasing.
+			 */
+			if (dev_is_pci(master->dev) && dev_is_pci(existing_master->dev)) {
+				struct pci_dev *pdev = to_pci_dev(master->dev);
+				struct pci_dev *existing_pdev = to_pci_dev(existing_master->dev);
+
+				if (pdev->bus == existing_pdev->bus)
+					continue;
+			}
+
 			dev_warn(master->dev,
 				 "Aliasing StreamID 0x%x (from %s) unsupported, expect DMA to be broken\n",
 				 sid, dev_name(existing_master->dev));
--
2.43.0


