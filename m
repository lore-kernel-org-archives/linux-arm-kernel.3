Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F011106FD61
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 00:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y/Mzib1nsWFhIJuM4E8zkXT3GrRXPYxVU593L+nAlbM=; b=brjh9DRCQjEGjfr4XmQEjLqysf
	pJeQTdJmzYYHxr/SO5r8OaAFSWqjF1LL/suC6Vhjk1lmyZFzz3zfYMyq585/vzQqx7fuLqaKtqYRK
	UcT0MTJEdQGc+ZnxR6WHFvMcrL50pZ8tXxhNpM+3pr4RJ8vuPNFPWuILtLjDjJ4ZhylpgijLXvdIz
	Sx6VJNHO1za/PrUf1RpU5TcaqQx62QpYWCYO2TSReShfkT+S+oSLPxpGXn+bQ4EaTAHonTX3ac99Z
	1dv+7iv+n5CDX579N2BbzR4YtW9B+LjPalHUeZ53SsE4VMeKzhfnbJR2wDpchkHaMsmfBS6ykKLUN
	2wCc2Vkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qWo-0000000Fwto-00jl;
	Fri, 13 Mar 2026 00:37:22 +0000
Received: from mail-westcentralusazon11010049.outbound.protection.outlook.com ([40.93.198.49] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qWi-0000000FwsI-2TJi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 00:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=th5zw9iMVRfT3iK4I3JYzMVRqVFhx10JB5iS4dFjPAea5eF/bD4SbtaAsSNFlezIBH9p5gQ1GXKLYvvj0sLXkJ1tvuWxgD2nKSzYVBPUyqB/vqb3zZhfYMcdRIesBO7mhoPY8JUMrCOq+Qhv3FfVo+KEMASQGw7ZM2p54/lSQboyFzqLA6B0NTzaxENEZaMsFpGDO9pt3BPr6h26hKdKa/tzeXkW/F33p5P6x948fLyEy4OTk/lIDg6tYfydZ8sGr7fE6PIdJIxoUc5imZnh1GV5StwiNdVdri8zu+xOOSfM591crqrfMMqYzOIjEskMqBUX0HaKTu4i4F4ufbfluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/Mzib1nsWFhIJuM4E8zkXT3GrRXPYxVU593L+nAlbM=;
 b=rPSVe6IAAvz3n77exQAyBrpNJDIpQx0m+P3R+/dr10udS4v7rByngVsanTMjEM5NRUQ51n8RaUT2L9j+sxx2bgSpcdvH407161Vj//cM83yeRR0N7U3TstSE0d1d6RNYMFkxPNvVpdU7kQt28CLmR/i4LKq6d/65B8ajtr6jTaSA7dXPeFGLTAybAPBQPfA+OOcVWNmYQlwyJ5AswitG1Nd30gPymWa3RZNQeYXArDPQbtnKyOW0Z/hLMm2+9l0oV6aBzSNRbjXWFCj4QaolXtbcsbhIXhPhQBr44eNghcgGKBpSwY4MmxJRDuS38jQlzmN/YZ+DwsmYfx0Ww+E8Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/Mzib1nsWFhIJuM4E8zkXT3GrRXPYxVU593L+nAlbM=;
 b=UxgBihVammU45IiEa4WtJm6dlKLsDWFM9zgwxqW/SukA0iCnejrlBuyHDug388Cf/t/jE8rUedu/LKf6ItW4SidyOHlPjpx29cSG7NMNBvVDvM6fEJ08F40YUOOH0lFDAg8h3iysOV2v+C8vxKjZwKExPqn58nTr15CBGEnhFiELvk3cFlHEBfYYtDG/pUZCaf2sPSVlLBcJ04KHHlKMGR/nmAwcca8LIuDdjMz+4aaREBR4ffdhXqlbUL7e7enNITnP9/mW2ByDJ70l7TVrCnKhvsZniF2Rb+ETm1FkgyiPDKjixzFdrRx3t5uULfTRREEEvq3dX5i6p5Jg/hczmw==
Received: from PH7P220CA0172.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::33)
 by CH3PR12MB7570.namprd12.prod.outlook.com (2603:10b6:610:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 00:37:08 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::32) by PH7P220CA0172.outlook.office365.com
 (2603:10b6:510:33b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 00:37:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 00:37:08 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 17:36:52 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 12 Mar 2026 17:36:52 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 17:36:51 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <joro@8bytes.org>, <linux-tegra@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <eric.auger@redhat.com>,
	<skolothumtho@nvidia.com>
Subject: [PATCH 0/2] iommu/tegra241-cmdqv: Fix initialization and uAPI related to HYP_OWN
Date: Thu, 12 Mar 2026 17:36:33 -0700
Message-ID: <cover.1773361875.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|CH3PR12MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: ac23080c-b8ef-4960-96d9-08de8098a88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6FRAK4CU+ttAtzjc1Qa9WKcUntC1dIV1V0c8kVy67vQ9rADCWEvKxRfgPtggEz1xbrmrUOGweXUwDR3c9XNfs21HwoziIStIAKHTOuUaxhNAPlpuXTHEuY9nTq+qt1tHaMjnqrtney36zFGHKRMIfOYCnGwU7TtqmE/ARhhJdcvKY5qXU3dNqK2bfXbBYFJ4dLCyt6EKS/HW6uJS+RfhVrGDBkkfrvASaqR6llt6JSGBuPf5Da31wg+yJQQf+b1ykN+HJEPWeFB97YXOxVeaVURogCp/91s2DpDu9ZgmsHSjeyrPzIz7JctQTYS0hC7Bdcd37tB1exQ+2hO7YE3Qq061/5/7fHu+scBkVszkITuXdB4YISfdeMlM0JPcoVALqndUjb7u1iQi6yomPZyJFy4uzD0KpikzBlfNAm1/1fFNuUZp/E0WH7zIMUx5HEdfMNtnjtHVX6n5AZkzXm44zizVfN+MXBMGkvxOcuVfGhgvNM62tztqBDBnkiAEgH7KZbFIHZigaHWd24edetT/yrFcgQJiH3EJfvypj2l2C4EDqAWPyLBVkIycYri2lgkRqXli4xdT7HgUm9+I8O20ICgC+G8l2Vh9Ijf2WIZRNL3ZkUpXm4Lz5yBG/cTJ2qwTuJTVGbZm23IisNxeh967kUynGmAr8hRTPa8ya4MSE4VYPp/YtCSpsYsbVpahwPAtA4UQIrvQfEJrQxKOCjB6fNIuHPmlUxoLFN/ZuuY1QlqL3bWKAR1OWmcgGuIjNqhRDN6KMOyaactDqqfkT5S3jA==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hNk1d4z+FdfFf9Pav6l0zkgQXaeSLCUMd4ECTlzPY2IFdgKTj5avn/EiwgXineDQfQe4QUqZ2ccnOuU4gD7sQfQFgd0MbVLr+wG9MnnzyiTz/bOPjL2zZ6vN5sSJ/985WoiSZBa5DFHIVHHI+VpdrAlQCSgaM9Xr35UBjZYyeDDlgRI7UNC1/CjTsLMXxAw09PxafmE9yoCcm68mZ41vNgUNbCVgMTCSDuy+T1/6IraEgd4lTSQStB4Y/Yd2r05fPiWZLCTxjvQ6sxcgrLW8gLX4Im0qoDG+dA/4miaJkZILf1ziLSxt7AcJWblqtzSc7tsRpeeu94B2uyAxyGcmmjwbWnW0hOjeUcPYHqeaR00VaHEznyEsIki/c6rE6CSiav1r8QUUV10sJ5tlEDQ46QPHuJx1vn49nmD4F7baKuRZOhCL5wgPu+fW1uMBFvh+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 00:37:08.3177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac23080c-b8ef-4960-96d9-08de8098a88d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_173716_627696_12C6A2E9 
X-CRM114-Status: UNSURE (   7.96  )
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

Hi,

Eric and Shameer found a bug in kernel driver that supports_cmd is set in
an incorrect order related to the hyp_own finalization. This results in a
unnecessary command filter in the host environment that sends unsupported
(non-invalidation) commands to the SMMU CMDQ.

Also, Eric pointed it out that the requirement of VMM wiring HYP_OWN to 0
is unclear.

Thus, I am sending this small series to address these issues.

Nicolin Chen (2):
  iommu/tegra241-cmdqv: Set supports_cmd op in tegra241_vcmdq_hw_init()
  iommu/tegra241-cmdqv: Update uAPI to clarify HYP_OWN requirement

 include/uapi/linux/iommufd.h                   | 5 +++++
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 7 ++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.43.0


