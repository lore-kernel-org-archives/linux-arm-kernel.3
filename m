Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D2DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 08:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7r0qxbYz5KikhYIhGjZnS71KRZ+6xXvLWz8igB4oKw=; b=kLTBl2/A4PFTqLuED3Q9HFO/Yt
	EPwAX9etzSTr1hJBlWUO09LV1UIF8ZAcQ72KnUU5meTDO45UIFQ37q+BaVJynNvKftDKUW+gWuteI
	cHSrvHOuj3R7rHwEblYj9xoLLwxwO5zUSdhvE9WGyeLM8lUzcUVRE1IqMWNTE6nY1XQOHQv4fG9RK
	20dquxKeL2/67nfxLMaEEYLBTCZyuH3xj6EWkhuEshMURwGQAGvD14KzDCODhJMAx7D857zmctFIK
	WNoZ4XcSmmw1D9O96oqusRQtoXZ5aPCqw0ZK/AgYVHYFMQS9gM77Ms/haD7KW6lipehZKEH3bkx3T
	ADnqZZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqir-0000000E3TZ-1mhF;
	Fri, 14 Feb 2025 08:06:53 +0000
Received: from mail-mw2nam12on20627.outbound.protection.outlook.com ([2a01:111:f403:200a::627] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqgA-0000000E2wv-1pI9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:04:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSkkC5QpsUejEatoDgcWXsiXGGLQznip2ThZqyve/htG7ziLJ4qjtsi9TVOg3C00r+NsIV6W7udr1U9kxBS4tixlcx4NxmaCqes15iiYruardiXqW3rMLfKKP6Ug/wRMqPFh2RYeSRfaJBXKQYQ5bzDCDlOj1nUP67cPjtteTUtQvps0wtlb9ZpQ3ZgO/niedVroGAo4ByK5IU9MbqIPu/7CumUMSZPSJJwk2iXKGcvzA/WNw4NFJwBZ3jDXCte50rwGIW+nrLEuasaP+RBtBQ84bQqj8JBxX7B7/Jv5niahU4joEEltW2E1hfiGPqgToXjl/NrnfhszeNK9dEJG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7r0qxbYz5KikhYIhGjZnS71KRZ+6xXvLWz8igB4oKw=;
 b=Amr+XQ8oKJ523yZLHYDpgBEDalsofZ6DtpQloXmHLr8z1LrAVDA0cRZNgC+Ok4s3zXjSA8HIN+8p5rSCXyVoQv5IoVIIXB1i2ASN0TyxIe9XgwDtKn01pClGXoT98wgu/7yZNeMGDWUE84JTgb0utaaz00lglV/DUU8p+Qotd5E2dzwtQXnbyobWbFKe1J0PcajfTTn53WyH6xfWKmV4ICwXrWYX2S0McLDpw6GPtRoJpWo7z1gQ+cjyZeI57kIw/MoP9KQ0IKkge0igHXpQdMzlAfIEULLS4DdqnfvIrbJQNTG7avYlGKhNUE/pmgVNoPkxVxwEJjFIbwXMEI5HnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7r0qxbYz5KikhYIhGjZnS71KRZ+6xXvLWz8igB4oKw=;
 b=Pe5bIth2tK5K6d3aprazcF54fszQUS7Q6QsSYmH2Z81Dx67uKLfKB0JVghI5U8isMjfz3nwT+zeCKuGpHLQqBywZV+ZYpsHoE4C/cvSc548jH0/ko0E/dmFdXPIw3zyC2sVDJ2uK9LCblwLNvHlnq/0ajYrF7Fnr5LAIIF82VGfR4k/mbwmJBB3IER+Qyamgkivit28+xUjyLYma7kLCPoIIrqzK89SeoQMMzLl9ZwQjaFDiGzabhso8UmCRz+2mTmchsDbt66vin6+oBmkeT16vTLBkqmEcuYRkEI1FTLvdHz/SDOESjKBzXRolwYAw+pyLtMLI2YmV++u6d5aGgw==
Received: from BL6PEPF00013DFA.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:d) by CY8PR12MB7100.namprd12.prod.outlook.com
 (2603:10b6:930:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Fri, 14 Feb
 2025 08:03:59 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2a01:111:f403:c803::1) by BL6PEPF00013DFA.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.14 via Frontend Transport; Fri,
 14 Feb 2025 08:03:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.0 via Frontend Transport; Fri, 14 Feb 2025 08:03:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 14 Feb
 2025 00:03:49 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 00:03:49 -0800
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 14 Feb 2025 00:03:48 -0800
Date: Fri, 14 Feb 2025 00:03:47 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>
CC: <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<shuah@kernel.org>, <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: Re: [PATCH v6 00/14] iommufd: Add vIOMMU infrastructure (Part-3:
 vEVENTQ)
Message-ID: <Z67440qtXH35UN2t@Asurada-Nvidia>
References: <cover.1737754129.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1737754129.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|CY8PR12MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a3b385-0cc1-42d2-577f-08dd4cce2362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7416014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qYjRelFvtTr9vsBNYDEHeoABF7b8mAvewpj9GFboNdabSIVn5wHFdnUlTpYU?=
 =?us-ascii?Q?5oQTydhGWnRHamMNmQ5lhIvimD0qs26zwASlVgyqWxtn8VR/pkZb8iXAkq9+?=
 =?us-ascii?Q?uZm5b8efkSm6r3jx3ISI1vt/U3UoCW4yNTG2075oR5d8Yv9G+wN2t0ULXlGq?=
 =?us-ascii?Q?x1siEaYTgmDZKHchEKeGB1ciO5DD4H1CGEDnXND6bkLQbTL40B+kXH0yWsk3?=
 =?us-ascii?Q?aMVy53RCjNq45cPB1pLJRre2KQ45tICrYd4KvLzmToc2rmjtJi/Sm5SKUtBJ?=
 =?us-ascii?Q?/z7f4Td5GAx4OuqiM45PerJ7Sx8lQauINDGnUNrkOfuVIw0EuiFB588D3B0Z?=
 =?us-ascii?Q?5jNALI6GUcVKsuhGrx/Gq9rM7tUec74w1ccNGOulY6U0kdFawoTEpsZEGqWU?=
 =?us-ascii?Q?RR/xhorMCEErCIQE8h0j2gv6n04E8yOW8QtbqxIo4X1YtQxqiWC18L2kKDh+?=
 =?us-ascii?Q?BrLqsduijQ+SW7rvoOXNZyJalmrQfDfMjwHWUAFT38X4ks/7Mk9Lw44QJvW2?=
 =?us-ascii?Q?+cSKGfAg1ea9+v9qH4L69gRcDkYuYfl0CK4dgrzgx5OvLh/z2ko7vjZKUyWg?=
 =?us-ascii?Q?C63P+I7n86g72t7CQbaJ37NKX/ynBdho0eCpwSTHnVeNrB7PSnt0Af//POFX?=
 =?us-ascii?Q?dq/sPZb7VVblvlei7oMWCmPjK2YXXXsg+FT/sHW+q4K0q/wVc/FgchGB/mBz?=
 =?us-ascii?Q?e/SDwM/rwoNvRGUYE7VCw8/MD0I2vHEvT8Y3kbDbOfk1xYphUBWACeY3XMfG?=
 =?us-ascii?Q?iN9vsZrcUPSnrhNCEQ+BGIlUF9VO6rKxzpNc2q08iA8M8pcXusL+LxZC1RTS?=
 =?us-ascii?Q?FP+ehQPAVUtybt4FtIT98P06EhudlI+J7JLunk+uiqbcA7vAYoyfoebiMjJW?=
 =?us-ascii?Q?yufv6NutX2G90ZEHvL8LKz3J4iPUYmgOGb1YgR3dNJiQlsleyE+9DYY2+WfU?=
 =?us-ascii?Q?qGynWPXeFQuYgw28IowC+KmBUIoEt8btbaoHe8zOpEgY/S1TPrjcCEpmnFyV?=
 =?us-ascii?Q?tBrR94+Q1eH3tVh0OH2IyhkrBH4MYbx/7D4z9VPOWaWFMRTtYVx0xq1dMdkK?=
 =?us-ascii?Q?UDG+yHX/EeUHHdcBbNoNrgHyP0cZaXOtbjGpOuU9EsTYMrj8rr1Qtj0h+cHZ?=
 =?us-ascii?Q?VoJxjP0+p5y3eTUvmf3KGvxMckTy0RIWwtMbSYRyeiugT8jDM1DfZ4RNE85e?=
 =?us-ascii?Q?gN8XXgtGLAKEm8/VdsOpbrt/B2QRCzfR1tZUzW+04Q4ksbBJ540zeJXXmvxV?=
 =?us-ascii?Q?WRmZpXwE1tbTNvoZACVCcVPmUvu3oUyqSr8tHN2wfxxq++z+CopME9CZEFCy?=
 =?us-ascii?Q?VrF0y62ic97d9vqwQEbQiaArQt62BasWDnybF+qDwdevwXf20cXQswbmVONE?=
 =?us-ascii?Q?xjBUjZzgDE0GeSMbtW4QFx00dphcF0tfGF3rMmZ9Rbn6hwF8wL4XPIFJlTyR?=
 =?us-ascii?Q?xGa3kWGcOOaQjTs37L8Bmz5pMvTIZs1HLsJV1vOC4LSNjiMl6jr0ZeIHwe3F?=
 =?us-ascii?Q?yOF0Co5z9DdcZtc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 08:03:59.5224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a3b385-0cc1-42d2-577f-08dd4cce2362
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_000406_473471_F6A669C2 
X-CRM114-Status: GOOD (  10.84  )
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

On Fri, Jan 24, 2025 at 04:30:29PM -0800, Nicolin Chen wrote:
> This is on Github:
> https://github.com/nicolinc/iommufd/commits/iommufd_veventq-v6
> 
> Testing with RMR patches for MSI:
> https://github.com/nicolinc/iommufd/commits/iommufd_veventq-v6-with-rmr
> Paring QEMU branch for testing:
> https://github.com/nicolinc/qemu/commits/wip/for_iommufd_veventq-v6
> 
> Changelog
> v6
>  * Drop supports_veventq viommu op
>  * Split bug/cosmetics fixes out of the series
>  * Drop the blocking mutex around copy_to_user()
>  * Add veventq_depth in uAPI to limit vEVENTQ size
>  * Revise the documentation for a clear description
>  * Fix sparse warnings in arm_vmaster_report_event()
>  * Rework iommufd_viommu_get_vdev_id() to return -ENOENT v.s. 0
>  * Allow Abort/Bypass STEs to allocate vEVENTQ and set STE.MEV for DoS
>    mitigations

I rebased a v7 on rc2, but found no changelog at all from v6 to v7,
except Bagas's "Reviewed-by".

So, I think we can still review on this version?

Thanks
Nicolin

