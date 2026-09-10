Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEE2C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4v8M6TZQ1VmtJGXFaLzk3h6NLJ/ycuAO8t4dOQz6O4=; b=TYT7xLZi3j2piSrns0o4RtPGSW
	yS2MjegU5G0LVM/gtwQLqKjg9crs3pFu/rCqM/M6T97ku8MKDali6KrBdEmqgRSUN4o3tGCa7p6Cw
	FP0YOiBjuVa+pkoxjdQsD541gHRrdhfTNilTYUI9AGh222YxgWZdUDyvCwAyb03HX+nx3YJmDm/o6
	33tDjK1PUJtq1GklRWRNIeVHmjQP0ERfzYxHnRfg2MyvNckGQMQIO6euAsdxbzP3g73iF6FW1bxaz
	cztJoPijk5o2kC7n5dvWPjGCmwaCwXWOhd+YgLUtkqeWlwn6o9TXMwalkQZKstiRkCcjOPwhAcjIR
	2KNdkntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4o27-0000000FWcy-3RUL;
	Thu, 10 Sep 2026 23:18:19 +0000
Received: from mail-westusazon11010010.outbound.protection.outlook.com ([52.101.85.10] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4o1z-0000000FWW6-1cqw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:18:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6FD04I1saXnIKsdmzkKA8Dt+S7zMkgvKvwvSJrvDhsT3ZnMkjrWjROmlaFOCCKGroGCyoWG3Q08zPnUMDlWfVIPgd3xvUgKZ6lSD0gLy6GAxJgXL/43yt1qkkzfgP1IEViptDxXBxmKBiQfeMxn4KiJfnIH4lD+DYnvH58fNoBFLJxUAtS7tZ2v4KgAZUb4m8q2opWaICYGzrhbhsU99laDqWTrSjI158/KfuK9j5elSSqGtoFAtpKgAfx9xBv5WngP3YUk6wnwLIhwbe2yvKBrFilrIWA0NjEiv20fi/BnV9tooaKd48NAumCkH51tZ3Q0Txd2N33qhSGQ9fy1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4v8M6TZQ1VmtJGXFaLzk3h6NLJ/ycuAO8t4dOQz6O4=;
 b=o3dMzfu/h0OTB2a+quXRT3meADe2CwchJGHuTk3bSMffZOgUBYYQzTPB5llRMKSRUVsHbK52B7OGfYMHr296rcjDJHO7FB+uNygtw/RfN6qnLYEWb0kGOc04a4Vsyq/xxlfI5c8GsLsXjtYdSCKTPI9plzswlOacWUrJBwQL0YlSgA5fYxBY7GTaUOYAjXVBBDdN2I9wJR3Ehz9gJPWYwVKRpF171Aza7cupMvJTyLgnts1ydoy/yKld+nL1/88Iw+0NSF6I6DPhxekwT5S+cXQeYWkBIudgNUozyS0xpBJZcGKBGkklltJ56hcNLfzEtLkwQgbTPMUrEJ36idGpBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4v8M6TZQ1VmtJGXFaLzk3h6NLJ/ycuAO8t4dOQz6O4=;
 b=D//Y+5jOdt2BZT13xEGvD8IaH/MXG6ZntiEeCqzF3Sm5rO6TjjBmCFrfEO49C7bMZ7whfQpbUajqeDR2gZOOTjReAhyQEj7REiPqeHGpbzSbwh6YRiKmA81lqwMu/jYM29VMdMT6PX9Sjbw19VHtRb2n4EsYIZBrM+wSVPrT4Eufgqy54JC5CNkp2OQC7isdcdhMo/uNB69Q1MtZWZjhCS8whPSY04jszpfN4CroG0zmQGmmSH4aqD9hfo+drs8Dq4JU0PVHfcF2k4JYJbYODebb4NTmGqnZJl2zu7cNW0mjJz9pusbAWDqjR89EIIHdIqh8i+XpWcMv9H/wG6pxJA==
Received: from SJ0PR05CA0056.namprd05.prod.outlook.com (2603:10b6:a03:33f::31)
 by PH7PR12MB7794.namprd12.prod.outlook.com (2603:10b6:510:276::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 23:17:57 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::70) by SJ0PR05CA0056.outlook.office365.com
 (2603:10b6:a03:33f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.6 via Frontend Transport; Thu, 10
 Sep 2026 23:17:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 23:17:57 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 16:17:38 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 16:17:37 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 16:17:36 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>, "Jonathan
 Cameron" <jonathan.cameron@oss.qualcomm.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, Jean-Philippe Brucker <jpb@kernel.org>, "Eric
 Auger" <eric.auger@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: [PATCH v4 13/15] PCI/ATS: Add PRI stubs
Date: Thu, 10 Sep 2026 16:17:05 -0700
Message-ID: <d168f7a1951440a2ececd8c5c381056fa9b1e18a.1789081084.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789081084.git.nicolinc@nvidia.com>
References: <cover.1789081084.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|PH7PR12MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 75422daa-9df9-42b4-e5fc-08df0f91bfe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|7416014|376014|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: dnqH0j95xoRipOreeNZZuF+zMWpocj4OOs31K4hZ5srcEj+ygWAl0FRUaPq6j5e3/mg6z5PXdj9T1+xzen6lXjezrM0RRanRlHIxYQS7PVWBlQdtsOxvXDujw++v5cUyB4hCB0HLnM4LqCLpjmFhomqtiX/2Gc21/VxskCoiN7zhRWSgAuy80dl2hKiGSc2/PIyPetrGMf/aoLBzq1oVyl+DWZUFMLiXTec4dHD7UYAUUYV2jbdzvnmwqXBfjI/ohnEAbmRGDT+x5QUCa06oMGcxovWEWnkENhyPFpSP4/CmxxK/nnxOC6i/bryhbGBLJYB842gLf4A7flB6uPt1LMGBW72c4CXhl8GvjdONqV7iMpRMo1vrCBPE893EuRjWdoQud6l2h22RxQCF9gy1HauofosslGI6BdEu+UK+TMDWqcij40eK7jPrc5YAp6BRrtzX+rV+GuFtTzs829mFpVAK/0UdEuW5zco7lBYr8WzwSeo/XQTH8max24OV9335D7ftX8rO0EiRlrwlfWoARCb5S4wQvbvD0prEhrmZBw4BvW6Y+biJYX4CsGWXSze2QCn9mp/zDQ6Xy3B4tB1VTiLw6o32hZMH6SIP69m4Ihz+8ZzTgoU54DB/1kxhc8DUPKe841eMAAZUQFYKf1VIL3oMcUUVMcw9RtatZ3HgLSUS/4MGT5U0PbEqKbZN1vpPiIt34NGgAbDFUY128E9b7w==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(7416014)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5pGUW4y7u/0pPRX8nAx343/EtyuA7fm03GHvqcb+7cQORYaKuWERzbBjU5hWs829UEJTGit6459SfNCsAO7xvADrpRgrSDsJmNZsLvkZI3TE0bFd8dbnzRbNmni6TKA5U095QMuxsjylo4+eWr32ND4BDnA7bu2PV3Ks1uPuhxL+25/Yo4s218kHbZZvYf/cC3eDewrI3qBeHODmdw7bvNtvXvUJOZcuAIkAfs//LAbdQuAnAvBk69COg6sfiMTmdx4XLMP1A9zZdAVHyjVdPjWQgWtf/eGKfGbKCpFSUacNAh6RhgyCMYjH9J66NFpuuKmcofRPij//X9XIef060/w/rxm3fv6ah4naATzxvXZqZnbT81QqjGJj2bXB/krIK9zZAmf7oKbmBMeVgEo7e3YcA011ufcRQ7cQV20RHcSEoruW8LYomEQERJag27/Y
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 23:17:57.3545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75422daa-9df9-42b4-e5fc-08df0f91bfe2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7794
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_161811_443674_B0CDFE34 
X-CRM114-Status: UNSURE (   8.95  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The SMMUv3 driver, which may be built without CONFIG_PCI, will shortly gain
PRI support. Partially revert commit c6e9aefbf9db ("PCI/ATS: Remove unused
PRI and PASID stubs") to re-introduce the PRI stubs, avoiding more #ifdefs
in the SMMU driver.

Link: https://lore.kernel.org/iommu/20201112125519.3987595-8-jean-philippe@linaro.org/
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
[nicolinc: drop stale APIs]
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 include/linux/pci-ats.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
index f3723b6861294..07d24c1c3acdb 100644
--- a/include/linux/pci-ats.h
+++ b/include/linux/pci-ats.h
@@ -36,6 +36,11 @@ int pci_reset_pri(struct pci_dev *pdev);
 int pci_prg_resp_pasid_required(struct pci_dev *pdev);
 bool pci_pri_supported(struct pci_dev *pdev);
 #else
+static inline int pci_enable_pri(struct pci_dev *pdev, u32 reqs)
+{ return -ENODEV; }
+static inline void pci_disable_pri(struct pci_dev *pdev) { }
+static inline int pci_reset_pri(struct pci_dev *pdev)
+{ return -ENODEV; }
 static inline bool pci_pri_supported(struct pci_dev *pdev)
 { return false; }
 #endif /* CONFIG_PCI_PRI */
-- 
2.43.0


