Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F325FCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhBlCSYddy1zon/1n0cEy4y7xTwnRamgpee904VDseA=; b=vuDrPWhs5zvZ1ZYWilZSzbFmRE
	BAhodOkNiCJeoGNJm7uf97JB04B1WMFRe6Pn8q0z3McxTDzo1h/Yd74/EJwELf3ZpDd/cf6zGc3j8
	btQFP5qruUzfCH8C710cv0FTk4GnX2n3C69D+4TpjOEUheEa1tP+XKWYZ64qH+1YIMuJD2LC6bMBq
	8+SUBcimXcUp+qQ06Tayn5ynlk1qSEBtTWhoUXPArii07OVw2fFnxwprGr1LB+PS3nzekFaYBRWL0
	2ev6g2aCzspl0FcLb85lDo+jdgL+CYxlX/CaPFac6vIGTZNnFZe11Ky7lUGxVWRLwdpHOxx+NYztr
	TJAA/PZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsDa-00000004rcY-0Dm2;
	Tue, 09 Sep 2025 06:52:42 +0000
Received: from mail-bn8nam12on2061f.outbound.protection.outlook.com ([2a01:111:f403:2418::61f] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlIG-00000002xNf-1Ges
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 23:29:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goitxitve+a8L8uVIoTUUnQUvGmWjSGX/pNKuUrtS3/SRYUDg7Qgnw9Zm4ejgBTcYfNlJqhoXl64EecOsba4q1rx/AsNzz6CXvD6gZtJim3y4gWsnfeyzeFVdPYMMBlw9T3x5g3u3b1nGNvJYvvypDAqpz56nh/xbtGRAhO0mjeKRQq3+CKcX8nvG2FmUPZZCOFqgocuKe0Q0TG9xN4qmMxVwsiNY0AQR4piQg7aPz7NyvS90U/IvRqAWzY5sxLSin1y4bUucRHwreXx3wHwm4wpQinkhlmUf6Uaw1CDItmJgO8bHQVCkcqnmC7Su5+eO3s500//+p2mDeaKeh1NYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhBlCSYddy1zon/1n0cEy4y7xTwnRamgpee904VDseA=;
 b=kcGDR417ETnWjavjcTiuJGc3gRhI1iBagJ2XGBSkVUsQjWzCOQmOgpjikIMm5ZYwuJHBDilYqLleoFkQeQxQlOOH94EJdy/IBz404ncdTOyiVXKw6LgPzH/cAinN9q19WReo6X8Uk/FgkOqTawjmr03ReVZNxEmay085OS+llK0F9EU47AAsd7OShUSt7GFWAl6PtUsuZ5dsrPCHMN8irF60SHXSEfjvOZ950u5A+6R8G1g1NwNVpFE12pN2RgqoV+M8eswfsL+tmRQTbhYlyMHY1Te6ofY8YE8/x4691CdYt1n0iKG3YjGyXztNs2yOhk9NLhFY7MWl2EQP6BUk7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhBlCSYddy1zon/1n0cEy4y7xTwnRamgpee904VDseA=;
 b=Xfr8/mW07AyYCjdgs3Ebfzmiqo84rhpgPn5duZQKpOG9xIwBpNDEYw5v3zTwuxV3Ib9YnEYTtA3bIPfpX2s4YwoQeTVsFkEgxg4E0VkVRwzgg4C0pwb83g+E9C+dA57yVVLwUnaGYRwN3joQUyKtbKpq2qkQBaCa4TiK2foRle53kgIM0YXvVW+QWKp+5HEkMKrxI0U4b1b5IZ0SvqkLZ7c4GAFuAwh9rxZImn44pRC8hlUoDtW7u8lt2hbPcEj0QmZBf9JIvcGWq6m/zM/jQMMkMk1BcjsYu+bCJv2V/x5SufFBVD5PEFSGgiJaKMrQTWE7464KaOLTzIMfI5Cmjg==
Received: from BYAPR06CA0017.namprd06.prod.outlook.com (2603:10b6:a03:d4::30)
 by IA0PR12MB8326.namprd12.prod.outlook.com (2603:10b6:208:40d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 23:28:54 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::52) by BYAPR06CA0017.outlook.office365.com
 (2603:10b6:a03:d4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 23:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 23:28:54 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 8 Sep
 2025 16:28:39 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 8 Sep 2025 16:28:39 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 8 Sep 2025 16:28:38 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>
CC: <joro@8bytes.org>, <jean-philippe@linaro.org>, <miko.lenczewski@arm.com>,
	<balbirs@nvidia.com>, <peterz@infradead.org>, <smostafa@google.com>,
	<kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: [PATCH rfcv2 1/8] iommu/arm-smmu-v3: Clear cmds->num after arm_smmu_cmdq_batch_submit
Date: Mon, 8 Sep 2025 16:26:55 -0700
Message-ID: <2f7f5fff38d43221fd60139323d23b258e34cf8d.1757373449.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757373449.git.nicolinc@nvidia.com>
References: <cover.1757373449.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|IA0PR12MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: d895f002-254a-4f7f-56cc-08ddef2f79f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xuD3n/T+8YjoMawAHqV71YvmFrWvG+hGNpZZqVfNsZQ2dZKLkAjKKmLzzl/8?=
 =?us-ascii?Q?CQMc3wQZKjvhPBJvC8vFg0uHgbjcFquMWpIVNROVrykM1VSHEhtUTgYBD96K?=
 =?us-ascii?Q?ICPl7QERMb5Zv6CIjeuRNPeKmC2Ox7P5XzsuL3Oj99gfm+f/v2PtmRcD0nm9?=
 =?us-ascii?Q?gAVTaWD7qe8HUl33pdJd3d/PrqB05C1YXcMTSrgKIsUnTrfSNBOFJQSWpoxs?=
 =?us-ascii?Q?ps+aWMx6Pg/FN19CVqn6PubBl3GN1oOKKQdstzIHHbLgi0w16wY80zJ9sGKN?=
 =?us-ascii?Q?BR4CtNt6IVNU0mLlnVSCCEi3dnJNize7rBIgDhj4ID1D4y6dPDFGiXxejkTe?=
 =?us-ascii?Q?g8x+j+74bT6gfefh51jxurS3eQH9XG1k0UkwpBctzBX4WUe/Lbgurdwxt3eZ?=
 =?us-ascii?Q?er2G2+Bjr6sRqLmRHPgukNreVrKzQgPHG00LYv0UcxIM5QFe1vMU3Tjh5AcG?=
 =?us-ascii?Q?OC/BnDypZlwtlwm2EamhvB0EIbsb80BwIY5ezcnv/2aW8oOt1+Ybe1bjkWDk?=
 =?us-ascii?Q?Z2Wfpwrvd+K9vw9k8/bTUgx/lq+eP3dxE5T28VRKEdawQEu2HlC4Q/JFComC?=
 =?us-ascii?Q?Dd9reUZBNeW6oNNsA5TGrtK295VtkVKJMADkmteaEkagODBJ9QEs1hPoGZwL?=
 =?us-ascii?Q?aVoCp/5A09OLX57iuBnlxME0vzxxztgZ4KqzRXPB9QCB0meyNLpaPrO5iQCX?=
 =?us-ascii?Q?jPa25zL6ayvuaKtjlrgNVbOlzrsM0PsrYs3JMg46ogJoPUAxjpzwuJCgVabY?=
 =?us-ascii?Q?vPeKMMM9WEequSaKTYrG1ILn2r5neBjs5ZyDXQI4ENcDrK+S349bmlqfkWdU?=
 =?us-ascii?Q?9IpSpg6RXbmglLjo5iCYV7P5q5brsG1Y8qWjNbh9BRP1Q4w4+iS6ryA6weFm?=
 =?us-ascii?Q?u0eyuxa62wMZsHUyNCkaAQt3K2ER0WvzetyTMs2sLojQQNoc5m4fzZnFiGBv?=
 =?us-ascii?Q?QUNz0MRdW8/yIg3GSHx4JrKs5rfcqQzvfMIFQVBOZAy79anVFZ+sx3ynWPV8?=
 =?us-ascii?Q?7PbU6nB+p1q+AYu22NtV9EsZReSUsz/tEzBvjEuq7J0sP+pyN9Eu5T8BTr6U?=
 =?us-ascii?Q?xZl34P8GYOG+NgxjYJljaz1PArw686PBXucOWwwJmvSaI9N1W5gZQ7nYRp0o?=
 =?us-ascii?Q?3jfd2f1ACVLSZDyO1C+RHrDtQ2vzU+I3BW/PkK2JUF1r094F1EEA5ZRFFf+W?=
 =?us-ascii?Q?l21AmJa5qPY9kbwbIMy6o6GgfmpB9AVzzI69VMqYytIPzLKESjE2XkHEBvkK?=
 =?us-ascii?Q?rq5EsvjnFV2/cfxWdcJnvRneGiPHopfBwF04aZMV2fftUqlzPCwtMmQF7E0O?=
 =?us-ascii?Q?BSO8mk+Ap38lckMVMKHQWbW6Sx28av4vJ/K5ZUqyh7/YMdlxUi6/z+0TXMRc?=
 =?us-ascii?Q?XPCllBZO2B3oa0ogaBsSs4e4hIyX2gzXQCkN3rXMkxJfB+G1dRi+11knP7gA?=
 =?us-ascii?Q?Ig0XMAofPX/5ODT+6TfOpymXHUzFz7j6s818gl8OMfI1dWy3RV1erxfskm15?=
 =?us-ascii?Q?ng0624jvvvTXuolShOZDjcwUNzKFOv08OVj4?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 23:28:54.4695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d895f002-254a-4f7f-56cc-08ddef2f79f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8326
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_162904_534014_9A9D57A0 
X-CRM114-Status: GOOD (  11.36  )
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

None of the callers of arm_smmu_cmdq_batch_submit() cares about the batch
after a submission. So, it'll be certainly safe to nuke the cmds->num, at
least upon a successful one. This will ease a bit a wrapper function, for
the new arm_smmu_invs structure.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2a8b46b948f05..cccf8f52ee0d5 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -974,11 +974,17 @@ static void arm_smmu_cmdq_batch_add(struct arm_smmu_device *smmu,
 	cmds->num++;
 }
 
+/* Clears cmds->num after a successful submission */
 static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 				      struct arm_smmu_cmdq_batch *cmds)
 {
-	return arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
-					   cmds->num, true);
+	int ret;
+
+	ret = arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmdq, cmds->cmds,
+					  cmds->num, true);
+	if (!ret)
+		cmds->num = 0;
+	return ret;
 }
 
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
-- 
2.43.0


