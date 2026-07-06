Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D09C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 05:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UI3FgpFSlNhOBqcJ44yyNjJiMlD0pwIuWCVP6+E6LeE=; b=kRmoT3KWEC414T7C7oXGxyoSJx
	NnUtK97U74rYMEbG4dMNr/n3jPR/rI00ZI/J17gG+ix/Y6qK4Hzv3lyhDSpo77SUoF7abr6kNEd55
	Bwpe4AszYRSMRBAAjjqP6drn0FrXrLEEZj1wkKs4X/hi3Hevmf4rF842x40BTSYF8jZLwznuCznl6
	7CqSSxhOq2ZFqyYZNgc0Gs3/6vFIEOP5gaC3/hxi8jRaLoXjpFdUBgeGbPp3BGSGfu4vx+GqzJwf9
	kq+pP4hS7ZjiCpDoezNkktadGSiNx1otnn2weLkaX9Fey4jtlwVGXpOsPnkZtDsZO9V0uHW35EeQA
	NBWzreog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgc0t-0000000BXa9-0YQT;
	Mon, 06 Jul 2026 05:37:03 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgc0o-0000000BXXb-3aoK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 05:37:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVhKhoJEzTVIoCS+MAgnhtt0HCpZk5QhTT+PfuxPkphHeCcl6zH0r6VB+CIFHBPwl1pQoRMSuZuM1n68xiqxwGeTjOrxqIbJvxIiKxGNgwlsG+1vlX6lHqnRQenezZ3EcxHG9rFzt4/dxxZX9E2SmlT0BSI590+DMYpGMbkM4OdDHd1H+6eK6E9yZA6KEpfyG/AQPNhh6N4L+ToFW7rcvxiI6UnPofpT9a3Sz8r1Wmeq2fqf6rooaZO+wbJKc9WhpqwTi3aXiI/5LY82x8Iu50HsjAKTFGl3mjHSfMh4DgKzrWlDxpQOBTN5/QvdXXkqiQdArDOZ1U8VKTeAKLwNrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI3FgpFSlNhOBqcJ44yyNjJiMlD0pwIuWCVP6+E6LeE=;
 b=UCdWR8DKdNHFsJUkxShqCEhBB7KGOtEZHufitCl+vKHc73isY0yYEuYowyoQyip2r2iJilCWLys0+C6+fxOhJ9D2QyqyJ7CykzYHIrtYe0EtG1qxJo//o0MLspmOL1BmtlPw+Qr6pMQatlxlhL7gjxBaFiugJyLzXzvProQbFy09/WMVj6zuha+fK7Rq36TiT0p+YgThZR7gK/4ZD3jNZzIh24h37uY84UgsyH6x7mO10Gmr7gxOiAovy7MgN5YcYx8TJxGZCIPoc0225CXLPrbFJa5vfda1QN5vJ6kxw9kDgqWXeENNSWiPuP2tJc36/KLuAkcEb4VdehPo2nVA1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UI3FgpFSlNhOBqcJ44yyNjJiMlD0pwIuWCVP6+E6LeE=;
 b=nUVEybC9oQn9KMC9lBj3I5b7RwlYrnOVE+xksElf59n/mX4g4x64VFNevNjTD2hmkZ+CjFmcFxrdhIzqiHQ4kKc2P553FIDqkLg3HrKUqVPU/tTKDkDTknG7jBKMUMWBjvWFyHwSAyC7Tk8zMHsZIs3fk6Q4GhU/YqfwBQ25HdNqD1a9OZ0sWVvzwYNyCWqZ6ks44YsbMbD/2t7xqvZ96GTfUW4pSoRdS0sPQ71CrZE/pwdP+AG0AklKyIg9Ze8kguKFhU0jMH65u10glnUazP09cQMH+oPm48oA4oZKaVkvTnpbl9tuSjoYQAWE7TDzBkJk5JJf9ddDh2Phmjte1A==
Received: from PH8PR02CA0016.namprd02.prod.outlook.com (2603:10b6:510:2d0::25)
 by MW9PR12MB999210.namprd12.prod.outlook.com (2603:10b6:303:301::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Mon, 6 Jul
 2026 05:36:53 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::6c) by PH8PR02CA0016.outlook.office365.com
 (2603:10b6:510:2d0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 05:36:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 05:36:52 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 5 Jul
 2026 22:36:33 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 5 Jul
 2026 22:36:32 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 5 Jul 2026 22:36:31 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
CC: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, Kevin Tian
	<kevin.tian@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] iommufd: Fix vDEVICE allocation lifecycle bugs
Date: Sun, 5 Jul 2026 22:36:08 -0700
Message-ID: <cover.1783311134.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|MW9PR12MB999210:EE_
X-MS-Office365-Filtering-Correlation-Id: ca8edf67-020f-4741-a1ef-08dedb209572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|13003099007|56012099006|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info: BhOmggi2dVEhtIDRYyS/JAm83IJg0k4xEEBc6oCPtBe0syKbH5Vt2ANQKI0mpeaKvUPtEzxDnepkPEYh8trCdbxu6Es+O9zKe2zKIPcOmLbRGkWrSd5yMbxL7KwgkYCkPTG0XUBlGdSnz3Q1VPoH0wOnl8MnD+1b5O6hYFz/+g4IVMjo/cajgHvx3MACcpRHlYsDImARlvOC9drUTssOmU+pfvODgb/cuAl6n/WQJiSdsi5Awdw/cTVyUiNrtl98N5fGL2Yj8YEehZ0l9nBY2EFAkkXbrQd8eI1LfAPVKBhdadLJntPKiWs2lbT4FoVVN2SOQzk0kYCO51LG/v97jpcYXgbznt9OH1e3XQH8f3jQ7yIZ8tkrcBoZXIsh03tD5JDO2Y9kzjWFc66htXNxJYg0PTcNYiMY4aR8p4Zs7BzUPb0sEhhFZpVwXsJopm2G1AvqGYlpuFCopKLUbqOV8PySI1zmFAX7D5Fzf/Z0S4i6JLADW9Cx1OPqZIme2sPD/hM6LSBQVJ9zBkeK06GWB8OfCstwRKe6Dh3ptgh3Hkz7nN9syFVgt6XOl434HgFOgZ1/8eKdiFeYBpYJwtcBmwP51rS1fF286UBH4ZImVfEgZnw34j+4vJLMULOybd3Y0ROLGKJLls7cF1YXZQkI7ohjMtReAY5zwvyJHx8LnrnZV1Es0mecqV0B3fStpuwFniSTP4EA9qAKlF6B7FG6yA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(13003099007)(56012099006)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rohNwAFs3eOIyxcPMrtequE9T5AWZytrZ/hpoO0oWU/pFBm3QYNqsByfRQjrW0EJ+h/OnxrPN2bUqYgtxCYc6nSU2Noze2YD//Wp3GcGFNcTRnrY45ubN7x8v89Mg0mWVaVFB0LtohexSFXifDq89gG7c6PgYnm8jjlFmo2yvpmg7prlDD/6CGb+xYOCAQrNzK/fyuGl4dHCGCBb3Xx/FlSCXccx60sT5iUk29NO+aMHXl2/zFoutoNdKljdYNBJx8afAtRT2zo5Dii8UDL3t29+DbUsWHS136GoTJsbN7rAGlIdzugdKa7/9osPEKW9OGf6A0DGCZqse1jymPm4/bquGC7lKjQ2EhLd9ucTZSg+93jOusYRGG+3cJmpGPX9k1kXf9kUONGAITESukuiTzuCgrTtuNEhy3t2UzlM5NrjPOHd+4fcKlcyyDqMGKZT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 05:36:52.4772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8edf67-020f-4741-a1ef-08dedb209572
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW9PR12MB999210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_223658_893413_52D5B5EC 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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

Sashiko flagged a few bugs in how IOMMU_VDEVICE_ALLOC creates and validates
a vDEVICE on a vIOMMU:

 - the core publishes a vDEVICE into the vIOMMU xarray before the driver's
   vdevice_init() runs, so a concurrent invalidation can reach one it has
   not yet accepted;
 - the undersized-vdevice_size guard returns holding the igroup mutex,
   deadlocking later vDEVICE operations on that group;
 - the Arm SMMUv3 vIOMMU accepts a device without exactly one Stream ID:
   an out-of-bounds streams[] read for none, stale ATC/IOTLB for several.

Fix each of them properly.

This is on Github:
https://github.com/nicolinc/iommufd/commits/fix_vdevice_sashiko-v2

Changelog
v2
 * Add "Reviewed-by" from Kevin
 * Patch-2: Add "Cc stable"; drop the out_release label by inlining the
   xa_release() call
 * Patch-2: Note that the reserved slot is hidden only via xa_* helpers
 * Patch-3: Return -EOPNOTSUPP instead of -EINVAL
v1
 https://lore.kernel.org/all/cover.1782767110.git.nicolinc@nvidia.com/

Nicolin Chen (3):
  iommufd/viommu: Release the igroup lock on the vdevice_size error path
  iommufd/viommu: Publish a vDEVICE only after vdevice_init() succeeds
  iommu/arm-smmu-v3-iommufd: Require exactly one Stream ID for a vDEVICE

 .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 15 +++++++++++++
 drivers/iommu/iommufd/viommu.c                | 22 ++++++++++++++-----
 2 files changed, 31 insertions(+), 6 deletions(-)

-- 
2.43.0


