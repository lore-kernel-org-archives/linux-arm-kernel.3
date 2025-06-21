Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5BEC71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 05:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIgn7SL0TtQ55YACedjuQ0Y3gwIeSXteZ6U8meVU2/w=; b=hxDH5sdzJ2d6uvmhawSrqc3d0U
	0/fkxwCgnVuvLH5C5qlBWbD9IwmyrDw7ZhcW6N2fmgjCQE7DzN7sdJFAZn7ATuWs0/xX5ugCuUzZd
	/hnd+eDy64W5NQ4a+vjUju23Ve2iT0yrBkcd98z+XIgI2a7Da2L/FI7oMHP6Z6pJcninqFM2iggvk
	aR2Wva4wRXSeUcpT5/amkmTgfkGu34zVzDgAJIoBUli8BaZinsMSm5j2VmWPDS4a7r4tndt8jZIug
	Dd7N6+act7fzbCx+u7dxsr/zfJiFpGFEojRqpa2kLqJLxTXeWCojtG5BnTx5LWAo9q4u2TSw5NraA
	GgAKrqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSqxA-0000000H8i0-2pzr;
	Sat, 21 Jun 2025 05:39:48 +0000
Received: from mail-bn7nam10on2062e.outbound.protection.outlook.com ([2a01:111:f403:2009::62e] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSquv-0000000H8aG-3Muw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 05:37:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfYjOG9CLitEwjkGo6fMPHIS94nLikxAR1ltabQcH/wcmSkxx+dFwRWj+wBtHOaxm8f70sOO3ar59j4yB0Okeu6raJ7Z5s9t9Ii9KvgV4kHzOVOf0Hvl4VsoEOUG/Bkd3vdtBLjma90X2VS+2MZj95Ij1Jm6Al8SRvBWPa23ts6YXZC/veYfsBHCD1ula15PebsZUtkVK9DIlwh5ADQJf46VEr0cS/jp/qUZO4MaD0YV3jH8olS2cdFhnQXDzhYIWLPgmlO6KGTu1JCq7xsdRDcWQIo+Nks28XVP9lpTHOPTyFH3C/CzbyBye7r31KWgAOKFXAJgm0vcE2KBdKO5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIgn7SL0TtQ55YACedjuQ0Y3gwIeSXteZ6U8meVU2/w=;
 b=DNYphH3gQYYe0WxFn/clSMsbkO+8aPP5m9gY+JqO6xjcwvtatlWnNnr+GCNZ4QKWzDh3kBFUMHPk50QnwDPkQU3ps+FatmWSs9f3CtS3/CFB4aIe9seUb2+efhQlwU9aXARL5FtkfViQJKO2h3hGlCJvkEVpW0m4YJQkn2KQfC6oJI4kgpbnlsq+S8y68Lx/m008hpHsb+ue3QY2fcdWC2ybFI4zhDe29n2+/Dy6BrxgjoPCdch1Khn+0JV4NYUjzLk/W9iW3KBWE3PU9ntNzUK2+U7QV0irFRA83BC6OV+G7bZ86/w8T1HDy5x5dgnolnjrWrhOrMkJusQVmxXWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIgn7SL0TtQ55YACedjuQ0Y3gwIeSXteZ6U8meVU2/w=;
 b=aSAB/ePXf3cFYiRDawp0vNx/WM+d2ILCza/wisyNvV99l2y7+rJipBkSUXE6hZV2gVg9+m9YwAttY01FTPXqen3OpIdCjXdRzINbeMtalzCUKTXxhH7mC/yzwQ8mS9cmZFfDcnat7X/y6cV/kLm2p6Hfo0meE4Y+ESKmnFxH/tEG3gbxEIrG+6PLgvtkb6yPLx31EFLYPSJgMc7wp2c0S01FfJnrfUDyqiD3dzTsFPUP+GemSfwukdv2VFECiK4dTwFf18tOAqE7q3ub2ZYado+60io/+WE9ejLw7Zj0+wGCWnc2jje3uDeXtrrsI+QiAHezWNquvFPBSPe+nCtrqQ==
Received: from CH0PR03CA0224.namprd03.prod.outlook.com (2603:10b6:610:e7::19)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Sat, 21 Jun
 2025 05:37:15 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::11) by CH0PR03CA0224.outlook.office365.com
 (2603:10b6:610:e7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Sat,
 21 Jun 2025 05:37:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Sat, 21 Jun 2025 05:37:14 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 20 Jun
 2025 22:37:06 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 20 Jun
 2025 22:37:06 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 20 Jun 2025 22:36:59 -0700
Date: Fri, 20 Jun 2025 22:36:56 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Pranjal Shrivastava <praan@google.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <will@kernel.org>,
	<bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v6 20/25] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <aFZE+MhTOCvbkKbH@nvidia.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
 <aFP4zHIVT6epJeLb@google.com>
 <20250619185325.GB17127@nvidia.com>
 <aFTWQ4v6aZABpzeV@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aFTWQ4v6aZABpzeV@google.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d76f8aa-2610-434a-5bf9-08ddb085adc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DUyq0zFI0sBDjw/tijAV1DMo8WalCRlNiy0Zpdcz/7Aayf8/YMKgKFuaA5fs?=
 =?us-ascii?Q?WqYBO2ZiwKmbOHtftQaJY5g2ik7tDfZh2zaV7J9H85qRXvTpXpbZvNYEj2gx?=
 =?us-ascii?Q?r8nwwRhoyVg6y4jy54S3r5ZfYdzKdKJRy04jnWEHJRVFA82nxhmR5ekv6Yi1?=
 =?us-ascii?Q?jE4BdI8as8UxX2mXKN5CW84uh0yh/heeYEB55l8MQkBGtA2eaHeeFEw/Kn/0?=
 =?us-ascii?Q?JhKVHU3a020vGgCtMB3TvJoqd018q4uAsvKvmvD0Vo8S9JI7qFEYTWqzeBtU?=
 =?us-ascii?Q?0h16CTZmfLyKt0R392lpa+11Vx7gTHwYrb0Q2NQzv1D3VjRnn+jAOR1EiYxW?=
 =?us-ascii?Q?YZHZqInSXmEnLcvw+jmxmiMnCm4LdWwgxi9LbcJL0o1SNgibtunA9TqACx2j?=
 =?us-ascii?Q?xi/iR9TZCF+ClD9AUXw3fODv95At0pjS6LB/S0hSUPamR3Wt0WtgFhxjVQUG?=
 =?us-ascii?Q?SyzwP71IOsjq14uAOwYp9R8ifU2veHGiT+Loz/a+hY83+8SHQKRM4KQCmlLY?=
 =?us-ascii?Q?jWVCH+o+3YZ7gLM7raJYTdbH9qqHlvf+GCmOiNbtnSese/VDERBDIWORQ7wH?=
 =?us-ascii?Q?2aKlS3btar0wyHemBcoA+ihNkoYR2DLU4IiN0e/M6tqrYGKueKdEY2BPJUqh?=
 =?us-ascii?Q?/tZh4L2kUkwYSFIoYn8sCnpORl3fEXtCjs2Og8W5xkE6Q1GxRc06INwF9Mt4?=
 =?us-ascii?Q?QoQMmn7GQrrCKmAylyj/lvvKr1PCF7eokKZwnXbJaC/uBQJ/SNeT6PZVj9fA?=
 =?us-ascii?Q?HboM5+yFYZeM1ohcAe/TkY/cgJjwgX1w2PQar6C/vZMt5swjqZkZejVAHNhH?=
 =?us-ascii?Q?hkyJ37oAY43X2sJlV1Muh9IikXTsfXB278iTBg5CpKk4jFFf20jg6wtEMS4q?=
 =?us-ascii?Q?pilNStimqr1tvqQeYOp4EaRG9Ja5fCTRNwKmlyNZyzlW+sa0vEzb+mcEqkHD?=
 =?us-ascii?Q?dAg4puqpiCZrHLFVUxEV6kyxJipEyl15WdY2TRl65XxuCT7Tlien2MY0svCi?=
 =?us-ascii?Q?B0vF1iPTcxKsCbhN2uBNaLIiO186oiOFyhNU84V6AVFiRY5Da+P8Fsu7zjBc?=
 =?us-ascii?Q?HezpE4hEKq2Ie49C37XLED6XTc6exfAk0G/+fA/veE0+EJbw/oFwyC0jrjxm?=
 =?us-ascii?Q?uir2WZZNKu8k8VBR2Xrf33KHnZnU1lu58R4YRrEPgKYP+9YQiNUHYIr1egZI?=
 =?us-ascii?Q?fCt6aA0TvDll1CuTB0pieahfMUzbBQJd6RfB7m9BsGmsz3tPA8HW+YTqD1BX?=
 =?us-ascii?Q?paQ7TokCCth8bGRlVXDnERrm+ZU6Dal+2+lR/odqTxrl3rA9ZSoTopXqH/s7?=
 =?us-ascii?Q?UuAmTnDi+pTjMSzsnph7bQQ0F/1H9n8TUkf/65DKIxvnNYcKbb+C/AiY+4ZN?=
 =?us-ascii?Q?YCwIHzMqiInyGWhwss/PzSEvpEDc1QZDioUDu/5alVZiEvD581ujjZ6QRuSg?=
 =?us-ascii?Q?3qryjkkxgXJrXIoPJ0eMjzHVphAuUNVdrkLkjdoWxryZc+cjm/X+DbMhZCnw?=
 =?us-ascii?Q?FGqw6cDQ0KIiOYTm8OO+0/C86DqnMzQeX1xS?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 05:37:14.7086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d76f8aa-2610-434a-5bf9-08ddb085adc0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_223729_837124_79151DDD 
X-CRM114-Status: GOOD (  11.35  )
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

On Fri, Jun 20, 2025 at 03:32:19AM +0000, Pranjal Shrivastava wrote:
> My point is that in-case someone passed INTEL_VTD type, we would end up
> calling impl_ops->hw_info and then the impl_ops->hw_info shall check for
> the type to return -EOPNOTSUPP. Either we should clearly mention that
> each impl_op implementing hw_info *must* add another type and check for
> it

Let's add this:

@@ -721,6 +721,11 @@ struct arm_smmu_impl_ops {
        int (*init_structures)(struct arm_smmu_device *smmu);
        struct arm_smmu_cmdq *(*get_secondary_cmdq)(
                struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
+       /*
+        * An implementation should define its own type other than the default
+        * IOMMU_HW_INFO_TYPE_ARM_SMMUV3. And it must validate the input @type
+        * to return its own structure.
+        */
        void *(*hw_info)(struct arm_smmu_device *smmu, u32 *length, u32 *type);
        const size_t vsmmu_size;
        const enum iommu_viommu_type vsmmu_type;

And I found that we could have another patch changing "u32 *type"
to "enum iommufd_hw_info_flags *type" to avoid some duplications
in the kdocs.

Thanks
Nicolin

