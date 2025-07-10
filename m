Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49260C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 06:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BnabqTncymFIsnzldAZgcWH6gkUjxym7aZDsKbUhlY=; b=BhjKRwWeDF5/FbK9mBXrccJAsJ
	dD0q013uG/AFuCoOIVYxroZ4MCmH3MZPgtO/DPWbrLei6b8avrDf1oTx6L6Q8LpII1KSSGkKxLuaV
	wHCRGdceCVJ2FwsMLxXSDX0VgFpq0ydWXYHFRxXAtVrLfM5x/UsOQEWoSVmwVg0jMAro2+Tp/pu+w
	7m0KrlssisGCsFlESKQ+S+x/ZyuKO/7v7RPe7VVPvLxKaeccBO76hMGiutLCocp20+1zsGDklsFhW
	6eJR1QEXUWfxJWt5+LPIRR2B+R8fxMm+oALg/lHJ9A3T1gyIyc9SPOtVpV4a+bqcRTQX+hsO5fU8o
	gcV9BQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkPD-0000000AnYZ-03qG;
	Thu, 10 Jul 2025 06:05:15 +0000
Received: from mail-bn1nam02on20616.outbound.protection.outlook.com ([2a01:111:f403:2407::616] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkKH-0000000Aln2-0122
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:00:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLWgE5dJEQ3wUU10d0+NlyBpSfaRGEBXp0LECXE+1YfmiMEKne43GMPamRe7MZdOqEF9ob5inBHkFBSopRafF+dkVaJNxEYx9EHr90cTv4ODd5tObQ6TMjQpXuKG9Dg9bBzCaF6VmGsCXYjy03gAA7TSL9/9r+IjEE8+d5PkQU74bsajKSHYENPxmbW/J8fk3uAJ3PjeplIuYZJT011ZtqHZfdmy/GnH8N/HUYHYiJlX8f6gwWpQrk/UzeJ4PBjWj/lVOHZEEAAbpH8pwvxpfJr38myS2joQbADSh/8fiU08wGhUByTWlWg4BM+BvjfArI+87dRY8mDyLy23aNgdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BnabqTncymFIsnzldAZgcWH6gkUjxym7aZDsKbUhlY=;
 b=pe9m7chcvyX8PNpiYpV/CZbBP555MSFAV0sjeFIMk9+ZWMk7ZDd1KK6JETl/t41PA8ZUsCBMbLyh43HSbLr0evfrflnSMl/q17xlOKxU9NR4XokV8R7+5E0dfKnkaM7QWbpKZDtCkBpY0TXR6f9om1nmaokYv9DpSPyJU67pyj50IUdk7nGeB9VIEP5xwMblJmhUJrCEzQdtHamgVqEnqeFMfPcKgcT9jU4KXbCih7xC398U8wPNg0o8if3KskqECMi5+NEktjeSSwxkOvLMkf9hjXWcJXUeJWWuNnJ2KSFqiJAAKEI6xiu0UWyvHT5fgexIivAEF/LYr6vF9KQ08g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BnabqTncymFIsnzldAZgcWH6gkUjxym7aZDsKbUhlY=;
 b=VdAVgvhsCymbcRXQeyS/MxPKJY2QL8QNV7oH9dSMLr1+zm+gwD5x76jHwSPzQh7TQckOr7pj4WpUbkf17HV2Uri9RKICC6P9zQgn/R9Q8cE66D1LiSJJQLs5h/9vuYUhz1ffN/e5JaxXS/xIqErEX8G1uE4Fl3I48nVMY7jTMWiSK7U/KIIvSzcZQN4O+9xhJ/F6xDAmRj4MZok0GFGwBUTqbj6OLi1M5wsAleT4T5id6QySkOzyAj3wsTvvjge0ED253pio7MVtVo1IJZxyUYrJ9P5F52ePTSg/+zzEoRJzhLxjtXHIl6xSwYmLEds8EItfAJQPXVShA1u8RzNiIg==
Received: from CH0PR03CA0398.namprd03.prod.outlook.com (2603:10b6:610:11b::29)
 by DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 06:00:00 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::88) by CH0PR03CA0398.outlook.office365.com
 (2603:10b6:610:11b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 06:00:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 06:00:00 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 9 Jul 2025
 22:59:48 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 9 Jul
 2025 22:59:47 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 9 Jul 2025 22:59:46 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <bagasdotme@gmail.com>,
	<will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: [PATCH v9 01/29] iommufd: Report unmapped bytes in the error path of iopt_unmap_iova_range
Date: Wed, 9 Jul 2025 22:58:53 -0700
Message-ID: <e2b61303bbc008ba1a4e2d7c2a2894749b59fdac.1752126748.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752126748.git.nicolinc@nvidia.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a82a150-62f5-4a02-cbc5-08ddbf770181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b/zM/HywbG360pl8CfeIVuCC5S8BoftrdTi12KwWGUeNvORr4mInB4uItsQq?=
 =?us-ascii?Q?3HuDCm7g+//U7F3nn4NU/1lc96GA60L1qkwUx1ZyIFFDASexB0vf+Gb3T+xt?=
 =?us-ascii?Q?WO1WWT8PCH3zJLocixv+XEWsFAMbBTpB0vc6j14MIiHiFRZrqfimhQllwJZl?=
 =?us-ascii?Q?RVktmlgJ9k47heBvzeZfK3XZpTqBtg+aXPdyszLCqv+wj8Y3mvVaD8J/0ZiJ?=
 =?us-ascii?Q?x5M4/jR12XjBPCPlKWMEih0mmqi5daQhXP/+etAybcsV1n0q4Vc3Zc1t2eCy?=
 =?us-ascii?Q?ZZHdYcd/o44pGVrOyvKIg6suxaHg2jDqLPTfMqHtNAqpdVO/9mz065MzRHg9?=
 =?us-ascii?Q?UJ7hUsAD2RvNcT0j+j9aUbANY/rWx6u+gALKmRdNc2aKGdo4+b8kZ1UNr4fi?=
 =?us-ascii?Q?E/syfYo4/1t9SrHdSxSs1pOHDHprM0t4NnVJDMWL+M+gHE6xBFbg1gov3amL?=
 =?us-ascii?Q?PDMz5QeD3l+xvry1fkFkTKj1qyuN8JD2SgboDmXahYnK3qYUyFEVcpad87JX?=
 =?us-ascii?Q?Fhr7Nrta+mG//AbieMJt2rIrNEZM4Rix8sQMWBJxensCtmii1HAYrRgaqsWE?=
 =?us-ascii?Q?rRuGfjUlRoTVbdJE01hrlysOKQckaa/SyyT5VHckQxxiPRx0Fa7ajuLXtSx2?=
 =?us-ascii?Q?PKHwgYITwi8o0MdF2jOVzdWsuZEvV5c0p38IVuznjvgWyEKd6wNGgPrl5IJD?=
 =?us-ascii?Q?+CIck0ofCU7n35oNMakn0D9s3fXmGeG8iEd1CA+GeLn7vfsw5jDtu0g3po+I?=
 =?us-ascii?Q?Jk9xxAVXkK7hR+DsgFmEcZ49uoLXEx2QNDZjeq07taZTOVAjfVnW1ZYsMNGt?=
 =?us-ascii?Q?dojTkpUwUmpFzKnX8M16Sk5JPFQ/qFDaxfvIhrKkJNDtD/z3Ujp4Sh3BEkQ/?=
 =?us-ascii?Q?5pr5N4kP6JGS0lnv9crr37FiB99W9QXK8Wv8k3EMJ58cNcc5HdJLkT0MbafT?=
 =?us-ascii?Q?w+0UYZ3ptKMqTHk+r9olo/K9OQge812gHNwwiNSU9XUkA+HeTs+6riq1qvqd?=
 =?us-ascii?Q?fUOEvHuksUx1WymbnXkcy8Ou+fpJSHBc3lHcPIqR4BMlWyDPE37DWLBSwquV?=
 =?us-ascii?Q?uQyqbEYfgLwhAqGVIaclSTMmLCzYU/ynCmF+y8RjtG2Pru6GWS1gnWWPkHwc?=
 =?us-ascii?Q?d41IToQVoXFMyYAm4kbVeqaq/ZDFiUvVe3p7tU1gRT0vogRuQBSg54kf+HsC?=
 =?us-ascii?Q?YNl45QADhlzeQD9frS+6P2TVEd00cn2HSUzE6KZE2qjlKoNmHkiXzKScWikR?=
 =?us-ascii?Q?/ZJdV4BmSdVfHDzsGbfif8ryLFvx95VBWI7z78mYdkNpl8COxYZuU7GM1/lX?=
 =?us-ascii?Q?ROrzalvcaX0VjXPckpYxYkQ5sdCz4n+Zd8BqHd3BAmTMQbs4cba2iZVnQvFm?=
 =?us-ascii?Q?Pv8drjJ/tRSdkSn4iWzWl7o0/P9haxvVd8znB81IIhS2BKbH4fnv3O1FWulc?=
 =?us-ascii?Q?s/xuFuiGce00GOEbee1xmdXeqcGRhpilVGs00/tjkZCW/b8AEuyQz+aJrwqY?=
 =?us-ascii?Q?6pEf/bdyjFNWurgjHPG8Hu+FAaAk3nIRUE3u?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:00:00.2254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a82a150-62f5-4a02-cbc5-08ddbf770181
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_230009_037790_1B046E1A 
X-CRM114-Status: GOOD (  11.96  )
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

There are callers that read the unmapped bytes even when rc != 0. Thus, do
not forget to report it in the error path too.

Fixes: 8d40205f6093 ("iommufd: Add kAPI toward external drivers for kernel access")
Cc: stable@vger.kernel.org
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/iommufd/io_pagetable.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
index 13d010f19ed1..22fc3a12109f 100644
--- a/drivers/iommu/iommufd/io_pagetable.c
+++ b/drivers/iommu/iommufd/io_pagetable.c
@@ -743,8 +743,10 @@ static int iopt_unmap_iova_range(struct io_pagetable *iopt, unsigned long start,
 			iommufd_access_notify_unmap(iopt, area_first, length);
 			/* Something is not responding to unmap requests. */
 			tries++;
-			if (WARN_ON(tries > 100))
-				return -EDEADLOCK;
+			if (WARN_ON(tries > 100)) {
+				rc = -EDEADLOCK;
+				goto out_unmapped;
+			}
 			goto again;
 		}
 
@@ -766,6 +768,7 @@ static int iopt_unmap_iova_range(struct io_pagetable *iopt, unsigned long start,
 out_unlock_iova:
 	up_write(&iopt->iova_rwsem);
 	up_read(&iopt->domains_rwsem);
+out_unmapped:
 	if (unmapped)
 		*unmapped = unmapped_bytes;
 	return rc;
-- 
2.43.0


