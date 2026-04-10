Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C40F36B9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 01:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hE30yaKS4C8VidfcjjoCRxKgOh9LwJZutQy7D8LJlXM=; b=JUsDVt4KPjx3ZvAwPGUqYmH6k0
	/jul3w9NvEMfRPpCm3emXzPK022vDgLbLY4xWEOd3d0xQcodnyXcyJMax3PYU/mY40z/oHz6PvBHb
	VSs5vPc2UI2CWCVtyisdn/9Cza3YWF3gk4ZhgXYWWuJ0WZn8LFu8xY3BFHMzIBkC6gzbGLpwsj9/6
	dJXwUEHDqo8yhRfo3yYPZJD/NtNzY2Usw4OZREr8NazfokZw+O3HQ8fvSJJiemT5H+D9DMil1yVkU
	3qkFvw4DABYCsB7QrjbLi37mO8Bqc8c0AR2qQlBlRyhiI5i5OS+0iXmDw3q78g9ZL9savFGC10Qi0
	ctikXd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB0Vx-0000000BPPH-2ubJ;
	Fri, 10 Apr 2026 01:18:29 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB0Vv-0000000BPOs-16u4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 01:18:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYOXYiYw2aBhYqtpRCpaSXl0tT7sQUSqXyJ4vealPyFQYEBFlPQ3WvxVVa6rE21jhCsX2pqcn/yFNO1cIosNRYokHGUyMPeJR4mW7Gt0dhPFsB76hddvz97wLJ1/MSWJo+hZwbyH4nXUFyeikVeFB94jv14Sf/TO5X9sbqyWJtecAPnjZ2gnTMpRINl0QniDrDMq+CvZC8FI44qENGbFdrmSaQ4eCNI3hDzAqwGENWcgsgkKqaf2mRjIfj9yJKhUcnwhOo1RMiQ711ZhBmcOMLEaE2cdKk7Ld1VSFN0hnc6P1AA9lIYNS1ST6WyiXWWPsudaVJ8iW+Nf67daLUJL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hE30yaKS4C8VidfcjjoCRxKgOh9LwJZutQy7D8LJlXM=;
 b=UvWbjtnDBAxIppq38K8GPwasE1ptFdn7D6uIfcXh2YYGiJinnOZ+vxxUgAhC7bQPWAw+Q/IGkqmZJAy53jt1r1hdaIBOd5QYMh6LRS/pwe8aipFdMlS1XcTFlgmx0pdAVNuvxQ3TTSzUkotS1DmnwFRq4fQNeCE9wXhtUq1xY1fkv1YoMESDOw9yrUp+BNBF6lWPYHJvRh6ga+H2Gb+jKBdFJVblVtRufAQ/DAexyV81mqHi6MEcUFq0ZRT1YNAaw6vn5YaSOEuy5YIhEUVcrekahNKML0JfQ/dXEA/ykG4HTtYgwxq4hEs7qiG2CMbXgm7D3eh/D3Z786yYV1YOsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hE30yaKS4C8VidfcjjoCRxKgOh9LwJZutQy7D8LJlXM=;
 b=spdfdBeOdKE+DIjRsaNyMJJKXtLwwbHt9AqqL8TIPyGNVn14x7HLQk5U4CUX+Q7PBvrNagzxtbcf+OsUcBqFNFI1DVKYn5ni/0kGgKiQBM7ngBMxWMWnyLjKh5PFm3dvB/nsYtJXXGXKRxMhGqzXRLCjJBHbhEEy8EYYAUkeU49eTd003V7H/tuF43/wZAlF3/vdjrgCcdjxmTH5yY/NHDDFcNDAO3Dseld5VdNDp7cSWC/wfwojRV1qLT3YSQCpFtNIWwCc2U+pMqJ4h1w5hJBH6m8tXWfOKekSgAxL3QnPjn42iws5uYfuTjPQ4SGVdyLyvDJYLLVbuYCDWyCXnA==
Received: from BN1PR14CA0012.namprd14.prod.outlook.com (2603:10b6:408:e3::17)
 by IA0PR12MB8088.namprd12.prod.outlook.com (2603:10b6:208:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 01:18:18 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:e3:cafe::dd) by BN1PR14CA0012.outlook.office365.com
 (2603:10b6:408:e3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Fri,
 10 Apr 2026 01:18:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Fri, 10 Apr 2026 01:18:18 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 18:18:03 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 18:18:02 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 18:18:01 -0700
Date: Thu, 9 Apr 2026 18:18:00 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jpb@kernel.org>, <praan@google.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<jonathan.cameron@huawei.com>
Subject: Re: [PATCH v4 10/10] iommu/arm-smmu-v3: Allow sharing domain across
 SMMUs
Message-ID: <adhPyEWoK01ZzqgA@Asurada-Nvidia>
References: <cover.1773949042.git.nicolinc@nvidia.com>
 <5293b61417f96dd58f25fe797e7d0c20dbe30da8.1773949042.git.nicolinc@nvidia.com>
 <20260410003223.GD3357077@nvidia.com>
 <20260410003624.GE3357077@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260410003624.GE3357077@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|IA0PR12MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: b19a3f24-26f0-421d-69c0-08de969f0c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: k3rGT8QKWbdPGi9SwJLvuPwvqirqAdyynsP8g0DoBxLAML0s5DxFRah3eg2zaIs0srF3FxlSg1yI74ONTGM4cS5vRO4mV5MuQIbZtF8ADD+VNyhRIL9eAUUrOeBuc2/leazIaeoetakk3jiFQGlT72pLUHMg9f6Gj0jT6ezRyG/TKQSaiTRUwO8BUtXQE+8/5By0BR7akFE7kHFylTYjuXUp2A9hTb5tHr/7saStDBqE8TicfmmYtYjpBZX4/+Vz086RfrAEUa0C+VfHimWg+zlnf1UW8Z+AMQc0x/9wXo/5RlpxkFYL5t145XHMQAZsGxbXap8zMcSRyGUBE1t0e9REcnt72Q0KoRcJ126cdG5pnMAj2ARwODBx4wj/jKHaHi1/+Aht7Yzd0FG1/MmEBFl78K+oifTIIFc/09D6pFT4HLFzt14XKteKWgcSklbKVsz6zk0K7hQBaP9hw72e8csmk6TvWwd65eGXJKkAEP1TRnLhMS4rKXnpm3ajyb91qlZy7hnpKgPBxt5Zdd5ETic3nhIw9Kfzny2Rj7R3xwLxBGyBCkwTSmdoiwHZ3uV/yxCtRflr07NsewYfZM0UCKQc0a44MUCm+JNeZ5XR7yda14+owcwKPsfma4/GezE/nnxQHWzoWKt/7RzaNp1qzDsLcvZWGt6qyIOmsC4QPswASrFBaqVGTtKK7vIWO/iQLz7HKjm1pwhiy16/OyEO1vLvUQ4T8OsmmfNbZeCEUyCD7hs5SsNsdnJRH0MU+g0I+n44gzvJMSGmxfT8+yAEmQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8Av0hwC7F7M/p9oBBXmrRHMfXwqZ9HrOZPvl2Ik+PeQqwKkM+5Z6S1ixXA6SSGA6Ubc3z2/W2SMTb2pshk+UI0fQaE8tcWAILMool/n2Xf93yDSVvgP51tSW5qX/YPcikNn1jiYL6qPU+tE4zrpDz0vQSEcE21y2fmP9CdEIR8AXf9INb+ZJq9vOe1lffAxLOBQI12jlZcK2ChoEUgLf4VTNOF8ul7viWPALLf7MFwxmUtcTX5D7LENej8HYpZ3H9dfj0IGF2fdkoGEnUJHm33s/TnHhif1hwe72OCFIVweclQAFkB3Mjtcv4xCr8iVASTktW/MgjRjlWTMbRPevua2I6walZb3E5MLN64lpN63LoRdELnc+HlTPiUPHZeK9nbCRokrEtDiOx86FgFZan5WNDL7JlDYtpqDim47aFRIdUtYaoCop81a1ckS4PQDp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 01:18:18.2503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19a3f24-26f0-421d-69c0-08de969f0c59
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_181827_315770_C797D610 
X-CRM114-Status: GOOD (  13.37  )
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

On Thu, Apr 09, 2026 at 09:36:24PM -0300, Jason Gunthorpe wrote:
> On Thu, Apr 09, 2026 at 09:32:23PM -0300, Jason Gunthorpe wrote:

> Though something else is missing here, I expected this to be removed too:
> 
> struct arm_smmu_domain {
> 	struct arm_smmu_device		*smmu;

An, I didn't look into that very closely, as I vaguely recall that
we planned another series to clean this up.

> What is left using it?
> 
> static int arm_smmu_s1_set_dev_pasid(struct iommu_domain *domain,
> 				     struct device *dev, ioasid_t id,
> 				     struct iommu_domain *old)
> 
> int arm_smmu_set_pasid(struct arm_smmu_master *master,
> 		       struct arm_smmu_domain *smmu_domain, ioasid_t pasid,
> 		       struct arm_smmu_cd *cd, struct iommu_domain *old,
> 		       arm_smmu_make_cd_fn make_cd_fn)
> 
> Thous should use the new helper right? It should work for a S1 domain
> too.

Yes.

> static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
> {
> 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> 
> 	if (smmu_domain->smmu)
> 		arm_smmu_tlb_inv_context(smmu_domain);
> }
> 
> I suspect that is just dead code now, it is from before finalize was
> part of alloc?

It seems so. The invalidation doesn't need smmu_domain->smmu any
way.

I will clean this up in v5.

Thanks
Nicolin

