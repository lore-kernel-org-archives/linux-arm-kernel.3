Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97181D73EA0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 22:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PJI5PtIc8dAPfYJbcY/enVx2TnXC90MRK4WO/cPLmpU=; b=rTZhufZH3yDXqxF6b1u+t1y3J9
	8DmXN31WKzriDlaBrZhkUpHiOuF11Z5/WIN/RqQsBdP2mzBdWAezE358TJfhmy25vJOujq2BxSCI0
	fwwCzh2Xwi3Sqs4RxcurYJaH/LhrL+VLA+C+xOpsUqSJQgzKRUhicBk71Sd4Ndpx3/rBeg6bCRgaH
	L14ACqDhf8KaRPsNhX0UDae12VAZG6w2FOkIPCELcuz3+rK6lj+xhOdYm9DLKRoSHA9P3YbVyf7Fo
	ZE2pumr2oonlH5kmV1iKlaR4SOhYVLOx87SCA8jbu5nnBMMWfpb9SrmjSLWDyPc+QOf91JcNuDfH1
	JsWe0rpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlakR-00000000kys-1ySs;
	Thu, 29 Jan 2026 22:44:23 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlakO-00000000kyG-32l6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 22:44:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYEPfSuSq2eaSy9pPWtnBIza5/miDA5cr8wZwwdon3XdX+8ixC8K6OmEH0pAgOrBa0BnyKKwhoq+lWFUTD2sC5XZxdoj8XngJgApWtLmolpOozJxUc2VwRL6ANsmgQhSKMDUu18Jz4fgCT8NHcCfAlMbtrZ/Re3A0CfSii3Z4cZwEX/w2ZvleN6KX3tWp71tx6Kzz7o9Ocj6UppO5yWehw320K1HT3OkyIZv2WUoaV5rAFyPBqbImgXYkIlPhNmllhPuyVxz8m5LRZ2VaKcginNCNhWL+yQR+rjahJugZtUkTIZbKI6z2TeelP7roZJrMneXerQVq07MlJq63nd3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJI5PtIc8dAPfYJbcY/enVx2TnXC90MRK4WO/cPLmpU=;
 b=b1swR3tvARb+LkvKfr86CBl6PgNf6wNZmlPWqiS3P+xG/35khjEogyxCX9YrztCNpbimKe+1LL29x7brVA2R7CeLBTVD+zoUh1FkgNHnv80tIaa5nZehPb2Nhw9MFqrqHTN2w5/NrlHQ9kxmlN9vvE254yIrdi7dakkG4TvnP+ipuzXHs0utLb8xKy+CIjmT5POdr92BX0B/9P76pFTeVOZOsquHdsdIdd5D2NEMEsm5NRVmqpqDZMmNsfP2vSNbtku1cNMVNJYQPe6obNhl87FjvdevZXkz5pqOufLJfcyNiMoApRVSwP0gVyoE2RrsetTBOO0DcOMfID0GBJ3Udw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJI5PtIc8dAPfYJbcY/enVx2TnXC90MRK4WO/cPLmpU=;
 b=V6X/OeRb9pGQkVANaZZDd474Ns4AXyR8EDdEcXDslRQQcGNEGtwlrgydCiCqnTOluiPpFdWDP78p64RFb9EFu7FXqSYKqedpZvtCFxUbjD/cVR3Uj+TgWHw1YTbVDgN1hkAh6YpiOid+3jd7QEqXPMScbeWwHxq1Q0bER8hGkUJG4NnR1dXS3F2tQi6N3O0+s5C3UvXJI9oOOXBOMdt1why3Hf5LR9URdxiq4F4T2DXzICdATjM84/M9Ib9KS9RxTTVfxSb+Ngcjpr7VHxq0KerPP8G/enDJS5/moQjlisiE1HOtj1XqYuggekxXdr5ghQVskU2MPUmQgXl55tyg+A==
Received: from CH0PR03CA0331.namprd03.prod.outlook.com (2603:10b6:610:11a::22)
 by CH3PR12MB7499.namprd12.prod.outlook.com (2603:10b6:610:142::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 22:44:10 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::ed) by CH0PR03CA0331.outlook.office365.com
 (2603:10b6:610:11a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Thu,
 29 Jan 2026 22:44:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 22:44:10 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 14:43:58 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 14:43:57 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 14:43:56 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <joro@8bytes.org>
CC: <jgg@nvidia.com>, <robin.murphy@arm.com>, <linux-tegra@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <ncqb@google.com>
Subject: [PATCH rc] iommu/tegra241-cmdqv: Reset VCMDQ in tegra241_vcmdq_hw_init_user()
Date: Thu, 29 Jan 2026 14:43:41 -0800
Message-ID: <20260129224341.1594785-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|CH3PR12MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6ffa24-2d05-4eec-2cff-08de5f87eb60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GxMjszyg/mE3HLpFfjiWgg7ZUwzjwPwQv+vhu8PHfFiQFHPSApWXS0cSmQMo?=
 =?us-ascii?Q?SQMA+0Npw8FZ9W02Wbxar4HnaCxW2NFvKHGKOhyH3RgUfTNDPbNFqeYSCCdy?=
 =?us-ascii?Q?O4pZwstfEJ4I8N1QD+tdMHvbEKaoJKpKI5LwJ3vdYxvDYdX6D9S7XwveE3Ud?=
 =?us-ascii?Q?O2wxedxkKDhbqGEzwRcedzY4UwoirfXp5v/82GFEGrMNrpicJr6iNgAP6WrC?=
 =?us-ascii?Q?o0tjFLWnje0uzlOOFFfjlY3DDwmiLWM3rS3lDmldHJ1jtpS7Q76L+h6vNAx1?=
 =?us-ascii?Q?c+qUpSGrf6w1yKtBT5slSqoP2zdIveGgic5tehAtRwF1MBBjYME4jnWX039L?=
 =?us-ascii?Q?i4668wh5d8qSVJmHD1Id0U/D2AFWu1ozEm1eWb8OQCNFwZtrXGyiaoOBK9Cu?=
 =?us-ascii?Q?lb7YTzVzqKEk6FiBliW5Ofzn+i3rHihHjWBvNEAR6TDD4/856U2ErBAq/ASt?=
 =?us-ascii?Q?uDeY2YCaCwL8OSj9gKXHaDVn1kqstG+Jrzf1cX7ggeWBmA9DjyR+xNLlD9pN?=
 =?us-ascii?Q?Q8pneDDE4YXnv49ubPZu/gtXFcq7I7R45zGFcsWkc5pjiVlHFTOhaaOFzp30?=
 =?us-ascii?Q?NCI2DvAIxDIOHFebrzUl6w7wWyVCtFDcwREeIQlXyl3tusH6TRMUHZtCvB0V?=
 =?us-ascii?Q?ZlihiAb7eZvlye3yM7lb6kLRlHty0HjQFdQxhtu46MW2j6yCZPAA29uq7CJx?=
 =?us-ascii?Q?gR5kFzV6GFcB/ORzFXhYzJrs60qlgdqTAZ1W8uqklXTwsMvxZJjEMwr+biST?=
 =?us-ascii?Q?fXIGE2XjnulbpbxSSPlA46RmL2D9uhp69upGMG2mup3YAjrYDznQ8azozsBm?=
 =?us-ascii?Q?d4PUYFO3vbzsTfMb7wi89WjUSu/XlDX72YrWE3N3QxGeavRTTbyVrgxLsyYy?=
 =?us-ascii?Q?Zpv+xScBXeDONB0rAPf+uQCPr8G2xYvpiCVDa4VYGEIXWkwPCBds8lE7vu0z?=
 =?us-ascii?Q?Z8FRbmSb6o9sETFkr3R2cw9/MaiyR0v6g3fDRpXY4pU2Pj2TROV28i7mFEnD?=
 =?us-ascii?Q?AP48DqsbfIjttK+CB/L9WvBq+TYykswawYCa0ULSD9r3c16nGJ0LMFbJFGuF?=
 =?us-ascii?Q?svFdLlyGDtY14BQ/jQNxV13LRzpulDofseksUQl4oFeUhYAyNXJTtuvpBaTn?=
 =?us-ascii?Q?6ua7IxTS/XUL57eREA+QDzL9tLopLVGJjJ01A1UBbEgG5XLXPHmAK3lH4Q92?=
 =?us-ascii?Q?73awfBsplPheOhJe49fZ0fTxnLi1KQGrZ+KCbJ/UJL1MIA+c5EEQw2TkicO+?=
 =?us-ascii?Q?BF6miCN4bFxb3o4oviJDyLAJJDIjLQJYE7HVJjQiqEb9GM/WsjzC+BqQgA0D?=
 =?us-ascii?Q?AexK4KYtkmJFO4ZNPA0UNUOlC9K3O+cl5bBxuUEq1iMUMiMBTZ8YJmgRp/lD?=
 =?us-ascii?Q?foV4tiUbV/BX/5ka0FMeBPI+SGvq12gYxnWysoUnk6J8VjMX+lcJv5nM/Vyi?=
 =?us-ascii?Q?bUFchHZgmo9ev1CuWxC6SAsulBdjvhM0yhKZvCEXd6LxmpvYMjPf4bOr/afu?=
 =?us-ascii?Q?yUxfasv8ZWU9vpC++72VZLSh1X7qdqZW8qDrqT6rgM89CD/BNlJQMT0xI1Iy?=
 =?us-ascii?Q?PMeVlCw+vtQjJeRGzIeAsSfAwkla8aq4b0aJ8+TF95xIyLi1YThYF1vLMJA/?=
 =?us-ascii?Q?ZwQwojOzTEbw4uvoUf5XRNGlANtnDvaiVpF892N2SXj9iJa+Ts1HVPeaLy21?=
 =?us-ascii?Q?0ZfMiQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: b4sevns3tTAAns+IfQ/IPKF9HHSfCRG/2sVjYkOrC9CkmaRVkpsjH4yczvNXCyzuJoKMEdTKDC3bkEWk+C/RyfP7Fl+HNczwN+mm/jF9PhU2NRUCaq/KK3NUDcjzogLT+vUuxC+B454CtALwKmZ7fIXKetpDeEtmGPHMSS1eYaHaqCtrlDI1ncBTBRw3Q8gVSASwC9astPjVdKLqM/MPTNDzxlLrRVXwKIhiZzMWJbBhrQbSj34S2LMMvRf3CoZprJwZgEaxzUnUEIRmEAXp/a06QSYWX0B/WPgYs0OEoSfT/cjVTHeNSZ14Q4JhisJOaWh3OnXGagnkxgTJyv0bUC2Bxg5SaeZu+1jfgiyVRM9UtoFm5JWEMJGt+eHpSNObIO46h9cw/bqJDOibSP1XjUqWe5dLkVjR8bKogq7zprx31lVhIBMhe7LW+fL9EKLQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 22:44:10.4687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6ffa24-2d05-4eec-2cff-08de5f87eb60
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7499
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_144420_768446_B1E5FFC7 
X-CRM114-Status: GOOD (  10.63  )
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

The Enable bits in CMDQV/VINTF/VCMDQ_CONFIG registers do not actually reset
the HW registers. So, the driver explicitly clears all the registers when a
VINTF or VCMDQ is being initialized calling its hw_deinit() function.

However, a userspace VCMDQ is not properly reset, unlike an in-kernel VCMDQ
getting reset in tegra241_vcmdq_hw_init().

Meanwhile, tegra241_vintf_hw_init() calling tegra241_vintf_hw_deinit() will
not deinit any VCMDQ, since there is no userspace VCMDQ mapped to the VINTF
at that stage.

Then, this may result in dirty VCMDQ registers, which can fail the VM.

Like tegra241_vcmdq_hw_init(), reset a VCMDQ in tegra241_vcmdq_hw_init() to
fix this bug. This is required by a host kernel.

Fixes: 6717f26ab1e7 ("iommu/tegra241-cmdqv: Add user-space use support")
Cc: stable@vger.kernel.org
Reported-by: Bao Nguyen <ncqb@google.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index be1aaaf8cd17..6c7329e62010 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -1076,6 +1076,9 @@ static int tegra241_vcmdq_hw_init_user(struct tegra241_vcmdq *vcmdq)
 {
 	char header[64];
 
+	/* Reset VCMDQ */
+	tegra241_vcmdq_hw_deinit(vcmdq);
+
 	/* Configure the vcmdq only; User space does the enabling */
 	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
 
-- 
2.34.1


