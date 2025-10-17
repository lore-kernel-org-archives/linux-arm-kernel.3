Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFE9CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 21:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBeFx6AcIYxszjsDkB40Bj73J86fcr1cYVIsN3e8b3Y=; b=w3EPAvaSda262SdHferQ3j7m7e
	rcaNcgT56zY8226z/iCf346XaAYBXbRrxjSkqEXrAL50hqIKxG215k/+wpjwho4DMlgGIJ/7qhV/l
	NZjygX3JWqMfzECDChwO+RQq5yVtLrlgFklWLdPzfmYHLPjVYOqqeP5tBUoA0qTW2AVoDHODDKdRZ
	wwb0XLbyLRJ77H4wVeyPrWvTuFS7BIY505jIOh8a+//C82d7bA6s+YajIafXdTkIyzd7bguSdXhAC
	c9xr5kKqjuGTUxjYaFT9NDExoohYeMwbyNNYY8DbXAzR3JwrgeCll6FWXNVV33nSiExHC7vveEj85
	eQngOQMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9rjx-000000091TS-0bbg;
	Fri, 17 Oct 2025 21:11:57 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9rju-000000091Su-0j6T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 21:11:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nn5/Dv/Z1el+zsM/2KRK1Txw5pqyrBlvZJD8Ov1Z+gCknml/9+AxVlbvpBwxZAizJjkGZW4fnW9iYH1ifmTiMsH0XZ1AtIJl/o4hx/ixubaY5t4nLwRWdx1phTiP2B8vmWxdPwyggg2IEuW1SOnvgE+pHFTl/0mVQXA6g972jQB4wC8YLtHIyyzDC4f/JBnUbcjJ0dlC8JDy2F+CNmZVk9hoH6J8j+suSkIO0Zfg0SxLbblxLo96+n7zNKIXIKD7wSFhosW8o/FIYJI3C9qMV+q8EEFr/IkXCqgtjt0pQOz8WJBxerYGpI3Te97PqhNAaaE/MV5eL+1MCytvlj+iyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBeFx6AcIYxszjsDkB40Bj73J86fcr1cYVIsN3e8b3Y=;
 b=vjHEcRp/vn/Hh9LFok8MSpDbTTtyWHOOkdvZGJEJqhZOt18KrBda1Vof1ZkVlSq9WzJG/YdWg+Hbl4Q8o5imW6kK3csAKX9dm6b+3Jh6ZY2ZWp7kmNYc4fayC2NxJGTwuRjI5e/RHtVbQFFH+a5mVuUhsyRF7pFyreuwlTXQeFU7qoGnqbpOuhjvwVXCRL+7x7yEb2PKbsLggLKu8lzvGZbiunCl8YfnzYGc4AxFW2K6tM7oa33Qi6cc4BrA0aEf9+hCT+bJ0Zb6gfZvFTsUA1jNG1UaIJTeutwXY8b68GGgPqzGIyQbx6e2CwNGnJShA5gBa6auqh9QG83l6Ikgsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBeFx6AcIYxszjsDkB40Bj73J86fcr1cYVIsN3e8b3Y=;
 b=Cu1oAaxPG37q8vHevVZWx+goBsd9uSXcGgxRciurK16v4DAT1RL2GhEF2X7yPN9ps3jssK5LkfyKWPiOi5C2fnnmE44eW9wmIVqCC7x8GS9ikwnYVWSwc/G1HqnowW6OgXoGzboxFgVTf2LlPZXsLSirv49OUFRD9+6C1WfI3UlguS05vD5F6ujLos2eHTmoleBBSH7eTPl5kIdBtYHydsVD+8S6TUcZGnAJl5VVos7hUUiPzcG7SUewJmd/l6saQh4BeSaEZRC1zoEQ3ZBemOV4fXUWemUb6H0jwUJQkXMa47/+4UawQGWKZHBxfNY6af9AiC9owDAJ+Ti9HZZ5tg==
Received: from MW4PR03CA0074.namprd03.prod.outlook.com (2603:10b6:303:b6::19)
 by PH7PR12MB8793.namprd12.prod.outlook.com (2603:10b6:510:27a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 21:11:45 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::72) by MW4PR03CA0074.outlook.office365.com
 (2603:10b6:303:b6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Fri,
 17 Oct 2025 21:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 21:11:44 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 17 Oct
 2025 14:11:37 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 17 Oct 2025 14:11:36 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 14:11:36 -0700
Date: Fri, 17 Oct 2025 14:11:34 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: kernel test robot <lkp@intel.com>
CC: <will@kernel.org>, <jgg@nvidia.com>, <oe-kbuild-all@lists.linux.dev>,
	<jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<balbirs@nvidia.com>, <miko.lenczewski@arm.com>, <peterz@infradead.org>,
	<kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/7] iommu/arm-smmu-v3: Populate smmu_domain->invs
 when attaching masters
Message-ID: <aPKxBh14fxnVIXK+@Asurada-Nvidia>
References: <14d76eebae359825442a96c0ffa13687de792063.1760555863.git.nicolinc@nvidia.com>
 <202510172340.XyneWIPI-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202510172340.XyneWIPI-lkp@intel.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|PH7PR12MB8793:EE_
X-MS-Office365-Filtering-Correlation-Id: 5deafb60-5e7b-4ca6-625c-08de0dc1c6ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ewdlzCPzqODWano3NK7BS0kJvNjSZoOIX86zeDbyObVazJFqwKDL12jpf5iI?=
 =?us-ascii?Q?5AHlqVi7OEIjNqv4Cwmbjyjy4Sh7/764kN6BLEv2Y0wi7rU2G7ibop+UuL0J?=
 =?us-ascii?Q?jKStCFXDQV99+TxQWZPlDkfxDnSV6hoicb5BcBpAEfwTOTZXOpWI9L+IP8h3?=
 =?us-ascii?Q?VNSEIz1qx/1DJ9+eGFyx42/AjYbbI+qqvoFiugZdXTAPXcA8inhxlILG+x0x?=
 =?us-ascii?Q?7plrf7ypcRvZdIX0yUhNFKSQ2uugWQGkfYKvS810BYFPm0CGJKrqRB2GL1xI?=
 =?us-ascii?Q?aO6Ck1lgvrJBsbRFVyNYK/XPg94JJ3McP9QX8mL0bcTXigz/sRsDw5BZgsti?=
 =?us-ascii?Q?5nR0rooaKwPkPMEQDTrin9fjg1H26OfipUkatp2fyPJr58us+r48Ir465sVW?=
 =?us-ascii?Q?up3B4rEksF+8L/IsRJkvKf+8Pt7UO7mEHv4Q9LJWQK+KMBK3JxUgJBfy1MwV?=
 =?us-ascii?Q?ejrGddApypyLTQmyVs2YLIoJL9HFy79rNViFwnmrl6tPbATzKvv5/W98KFzA?=
 =?us-ascii?Q?J5cYf5yNCWZdj2+3Lp8ePn+3Iij87J8ZrtqL7JY1agSGxzDPBizP5F7TMtyU?=
 =?us-ascii?Q?lne6IBIAiMKyoZHmH6JDwbjoDlf7b4foZb4xmiDZ8MHllIWfMyNhrzcFFJha?=
 =?us-ascii?Q?ivwHf4dNDcDjJiC/l1k5V8WfiAU7AtoRjkyUKB4RiRV3CqDz4emC1gsMuqTO?=
 =?us-ascii?Q?zM2hNTGivhduVzPJfVTTCVWyeowZ7B/UOY39tyFcQkCDkuQdE3tmy1vfMa2+?=
 =?us-ascii?Q?PLMm6hAr+r2eAuCpl0oNzckvVcY3ruX0b3Xefrt8iEB+9xF88Kuc7VDgVYeA?=
 =?us-ascii?Q?qCP3bkO/Mf9UgMUFfreSDdkCaNJ0Irys4MLiUdCACkSMfOYKClN8sNYIfMfJ?=
 =?us-ascii?Q?WfUXpRBlQtOvtnd5wXQ3RB4Hsz2DvUNg7Wsepo+TKkpaz8hsJzm1maejkb+a?=
 =?us-ascii?Q?2UXAQM/dOG5WrOYGUSJ+WbIshtiWzx6dGbeSi2NBjxnlfkAGblgz9VLVqxYV?=
 =?us-ascii?Q?ofenJXfKH0g0QYzQlYqyFsUm3QWp3C+vBuoASk5R5tiKA3pmrtCTDFg6uKqY?=
 =?us-ascii?Q?KPV2HgXrp5M5wafBAB0njPtAhV4nG7q+yUD3ZJ3XhlFvYXG5KvB+YF+rhw4T?=
 =?us-ascii?Q?RMWZJbQTUPsROWv7bX6Ef9i7gm2OQzJS6uievo8MWhZU0sr0mFD3rrQNqK05?=
 =?us-ascii?Q?cXaJ9QlsSzKn31KenJieTRQQp5mbHQZ3xxkhFuWhehuFvO1eScJssfiZuDzr?=
 =?us-ascii?Q?HqzQTxj+hPWEtEsSWGo3dvWzOpVQYP9c65AbqImcbyEHR0UySkjvTKp57Pft?=
 =?us-ascii?Q?p7K+BPTBjR+5EtSIyaEdvMF5CXeBvW7afmYgFN2tGnLX1RyG3t9fRTCrllrV?=
 =?us-ascii?Q?yHM0b/6vK0EJevXx8Bd2C0IC/AVSwC4LoX2jzwgjsAweScUv2U2ZWPpdtPij?=
 =?us-ascii?Q?hw7DN1XRAFwvnGA8wbHEk45LY0sJ21xCsphRvJO+aS8OjgKI+sa7fFEFlGzm?=
 =?us-ascii?Q?4oBXg/9J+HPuA0NwfTNp87stkq75Q0TeGQSAeBHpEnBo5k+yPGXyxnaTrGpo?=
 =?us-ascii?Q?Cg/I5nWXLSCfVpikOqI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 21:11:44.9634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5deafb60-5e7b-4ca6-625c-08de0dc1c6ef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_141154_213009_CA19A5F9 
X-CRM114-Status: UNSURE (   9.67  )
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

On Sat, Oct 18, 2025 at 12:03:27AM +0800, kernel test robot wrote:
> sparse warnings: (new ones prefixed by >>)
> >> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3208:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct arm_smmu_invs **invs_ptr @@     got struct arm_smmu_invs [noderef] __rcu ** @@
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3208:33: sparse:     expected struct arm_smmu_invs **invs_ptr
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3208:33: sparse:     got struct arm_smmu_invs [noderef] __rcu **
...
> > 3208			invst->invs_ptr = &new_smmu_domain->invs;
...
> > 3247		rcu_assign_pointer(*invst->invs_ptr, invst->new_invs);

Looks like we need:

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 8906c1625f428..398d8beb8f862 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1105,7 +1105,7 @@ static inline bool arm_smmu_master_canwbs(struct arm_smmu_master *master)
  *            to_unref argument to an arm_smmu_invs_unref() call
  */
 struct arm_smmu_inv_state {
-       struct arm_smmu_invs **invs_ptr;
+       struct arm_smmu_invs __rcu **invs_ptr;
        struct arm_smmu_invs *old_invs;
        struct arm_smmu_invs *new_invs;
 };

Will fix in v4.

Thanks
Nicolin

