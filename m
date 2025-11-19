Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F314CEE356
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQgO+5ebdOnWGfqH9mnnlh3Ijz/z4H6/GahjpM15XXQ=; b=Zu8tqMoBiVC4DrG2o/d4LF+K5Z
	vVPPujeQ2rO1q35UW1dErNw7SDdI+gCl1PKErmZkESCXyjoV8eT7mlngkL2U0Nk2gtZKZLoR49OUq
	umtz0KCh5Asgi2FQ7ErVHmd3IOEkYe0L0tjARaOtN7imBxykTz0CIE79zfeSZuqbmrKna/R/R1ZLs
	LUmGXQy9tqGeg/jOCNZky0nvGY2ZqVZEzF5m3mn2NCeWbdjKdrZ5wVq7baKhttn23PUwjIReFJXNj
	hvCNih+5bkOfGrQWpVp56itHC+HTYpRC+V5Awyw0kfL+OkXUxu9AklcUdV4iZAj4L7rU47mnb+c4k
	DcpxQldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYNT-00000001QcW-05HW;
	Wed, 19 Nov 2025 02:57:03 +0000
Received: from mail-westusazon11010022.outbound.protection.outlook.com ([52.101.85.22] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYNQ-00000001Qc8-1PT1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 02:57:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9svGsATLQpCMy30lRbYg99UkUmruAYoUEUbJWXDH+8tQ0WO0KskJ7b6icSYLoALckynO3y/yyst3i2YO8OPLG2m40Pa+NgAx7yqYDIUoIDk67u2OyNbC2xO8g39avgD3CtcMWasyQkIE+IpBUZM7M3IgYD5AyzkiZZItuicMr4/xbdPzGdnkUAzF9lRk4vusrI3hmW6M0nifFw2Xn4RxE99orO5wUyzoBm2kZJ80T9cdNW+A1DHZ2AMLFfFt/ShJAW7LB0gMpS6H5xActMOyAUlplNcHiAvJ8KNsZf2OhwkdDM+p2eamV2IDMFuO2TlrGlpQ8sepFsSxbZsb/KDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQgO+5ebdOnWGfqH9mnnlh3Ijz/z4H6/GahjpM15XXQ=;
 b=f7zTvl6h/hqco1xGjkhkgaWStgbtd0eYroItl46fKignklJmpYWbxA3wpXTt5w21x1Vl8nNyIGFLuOjkrqB8UCJbjOw0gxre4TeXkYUglQ3kobqfkqcnxzk2TydSHdPlpA03JzmX+w4ueyIljUB4mp64FlbKS1+Rt7udtQ4I1Ivw9GCjV8IOXDZUVsER49JeZWne2orQmX282/A9tZhArgsY/AZASe5fN8GyqKKdXckmSW0zTyZx1Zzdog3r8KNhym5YNr9G757xhI+p9PUm9WF7UmLxNQhYfWXjtClg4PUm39jaL39b79tV/TcclxyKTfbGq3lZn/YoJAytG2FpNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQgO+5ebdOnWGfqH9mnnlh3Ijz/z4H6/GahjpM15XXQ=;
 b=V2NNDAYlaI1nkJ/u7LVncD4T4tXWH8Gpyges8bOyAidNY/nYYeNeGQi22PzGdl8vnlAOEHUk0mhMrKmcmCvrS/dUrMtl2usnnMOPiASNldRaJsJmi2Il59Mz+4AzMe7R05aDccDGz/px1pSd/aHJPZ7TZmNPo3v99e4oMPN290SWzDZkpYPgq8qN1Fp2WnMFmrttax09HyoXYMuoSWiCljuV0NrMH/vqM1WRi3x5CqMbgcDinASoVq0mNW8u6CvDFtlwOqnXDn72PBixIDzsGWt5jrj3M+z0fN3QZciIyHBRDza6KB/YbmlcxFeHthiCSGSTxEWtsvVwkoQ3nfdGEg==
Received: from SN6PR08CA0005.namprd08.prod.outlook.com (2603:10b6:805:66::18)
 by LV2PR12MB5822.namprd12.prod.outlook.com (2603:10b6:408:179::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 02:56:53 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:805:66:cafe::de) by SN6PR08CA0005.outlook.office365.com
 (2603:10b6:805:66::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 02:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 02:56:52 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 18:56:36 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 18:56:36 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 18:56:34 -0800
Date: Tue, 18 Nov 2025 18:56:33 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <robin.murphy@arm.com>, <joro@8bytes.org>, <afael@kernel.org>,
	<bhelgaas@google.com>, <alex@shazbot.org>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <will@kernel.org>, <lenb@kernel.org>, <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <kvm@vger.kernel.org>,
	<patches@lists.linux.dev>, <pjaroszynski@nvidia.com>, <vsethi@nvidia.com>,
	<helgaas@kernel.org>, <etzhao1900@gmail.com>
Subject: Re: [PATCH v6 4/5] iommu: Introduce
 pci_dev_reset_iommu_prepare/done()
Message-ID: <aR0x4b7fN22K36jR@Asurada-Nvidia>
References: <cover.1763512374.git.nicolinc@nvidia.com>
 <246a652600f2ba510354a1a670fa1177280528be.1763512374.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <246a652600f2ba510354a1a670fa1177280528be.1763512374.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|LV2PR12MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: 8802f48b-3f4d-441b-19b5-08de27174af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WB284D0OZKvWVVk/HR/th4cqbIRvwj2B8ljPQw1FJiyLqJrZ/tuQk2DC3Rsx?=
 =?us-ascii?Q?DdP5e58a+E/xAKIbyS9QiAclQrk5LcG2x7OymHNMzyETNChNvbrYJqrNLBJK?=
 =?us-ascii?Q?2y4N4zyAgjpGqvgRXUIjGADxSFBc1Hj2mD7aVvIeJCS6A7qIk2PirwhjLmux?=
 =?us-ascii?Q?ZgmkUF7IHzlzHLjHHGskYmNrVY+QwV3BtnaTAyEf5olKg7ND4vOtuR85L5Jv?=
 =?us-ascii?Q?2QVWOv04CDR7nXcOxrNRtHZNUfNjftk7Z6RJcPHh22Og6I9K1tdBddAlNP/R?=
 =?us-ascii?Q?Ltxy6UGNL193QZLsbjeyRz0oZlN8KsLvD139nC1h4L/Fybz2N8NNekYKlRVQ?=
 =?us-ascii?Q?EtLZ8AJWFZTQp3aqSNSYYLkPe11BrGsF8dPak9dfyJBb0TyMHHYA/hsChUk0?=
 =?us-ascii?Q?BcNEZZytQpD57+Fky7PPDEnMbQISz6FIYP8FVaJqjY4qvUcin7JQE110KdSP?=
 =?us-ascii?Q?Ui/nE7U5al3vsYOioi1LLbd8Wh+kbNhjUKpmZrLP+KydY5FhQET28CZVETV7?=
 =?us-ascii?Q?eO+HyKpEsSzMfhf5jD24StiXRjA5DLDe4qpKd5eXGcnzqwiK4QpBU1xrO1pC?=
 =?us-ascii?Q?BWUVTXIV9Z4+gc+CZFN82dpcyIYpuGzDvnM58iCUW0RcRQSOn5pb7o2zl1zx?=
 =?us-ascii?Q?tPO72iVg+6XS6jpowvLdifNRw0LCR6VnxLX7yvu8oPFnwIZxbCaunXZKOmWf?=
 =?us-ascii?Q?XEqtO18rR+5x8vmv9bM0SZYy5LYjmkJRqeCmKX4kfWNGx27yNblnD0Od+Jh5?=
 =?us-ascii?Q?ubgmZJ0SQT2z0yk5/cuvnB5oRvJbTq2Z+cObGKUr/bnPh6214i/3Y8Xvm24C?=
 =?us-ascii?Q?5rO/pGNuRaL7l7r5ydi18E46voWJllN7oe62dnDrCKmyJkgUsrnY3yqQOlxB?=
 =?us-ascii?Q?BwPsnih+80i9fXeza35K6B/f+K2DIIXOgisPKpT+h6F08qDjgJX5ZGp9Vd7n?=
 =?us-ascii?Q?mWt1sp9TY3qGol8t/R1tfVYQtg1L1s7dpQT/SJcWjRAlsI/vBrNi+Pp7ljQc?=
 =?us-ascii?Q?g6/57bsEbR4iQVlsIxAHlzB/Um4wLCf/9xpnm089HmKLFzF0+ijl16UiznRf?=
 =?us-ascii?Q?KjpH0r1YjHugNjyHXDzVSYjNeFggaaNO8IVhRPUzzf9UEyZvCRgQPpW6IjSf?=
 =?us-ascii?Q?VH+4KmdN6/NPB+7famYrygT5gztAb7fiS68+v2k8amZRAqVTvGnxXHWCWld4?=
 =?us-ascii?Q?PVTLBHBUoelfUXKQs+vVqnwCx3QMwCIt1bG+ySB9crnL0ppkgh3wbxHCbl6M?=
 =?us-ascii?Q?QK2TVj3AJo3CCbLCUaZycWaGd7Yij22/BBbQulWY3lwt0YaBNhsryOU6HJ85?=
 =?us-ascii?Q?GV3KJ2soHUHLMTKItMg+qEn1erRB9Nd01YHhv6hXfNcDefKabMU59U4W+T7+?=
 =?us-ascii?Q?FC46GrTvuFaGCwof8WIDW9AnTwWf1Ud0Xf/GkTjfFzTpB4p3YJ89GtHs64+8?=
 =?us-ascii?Q?5cCxwl7UmagVzTfWyrv1TIkNNDaPyb7lTbSYS9ZHd60xvHxbHVKpk4Bf/2SH?=
 =?us-ascii?Q?GePaZePPxSojFpG0AmcgXevrgSLgB3kz5eKL4ncGxrghX0um7KYCoSC31/iC?=
 =?us-ascii?Q?IjRBMgD6Z4S42c61RqM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 02:56:52.7433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8802f48b-3f4d-441b-19b5-08de27174af8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5822
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_185700_398468_CA734764 
X-CRM114-Status: GOOD (  11.57  )
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

On Tue, Nov 18, 2025 at 04:52:10PM -0800, Nicolin Chen wrote:
> +/* PCI device reset functions */
> +int pci_dev_reset_iommu_prepare(struct pci_dev *pdev);
> +void pci_dev_reset_iommu_done(struct pci_dev *pdev);
>  #else /* CONFIG_IOMMU_API */
>  
>  struct iommu_ops {};
> @@ -1509,6 +1513,15 @@ static inline ioasid_t iommu_alloc_global_pasid(struct device *dev)
>  }
>  
>  static inline void iommu_free_global_pasid(ioasid_t pasid) {}
> +
> +static inline int pci_dev_reset_iommu_prepare(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static inline void pci_dev_reset_iommu_done(struct device *dev)

Ah, I forgot to update these two using struct pci_dev..

Will fix this in v7.

Nicolin

