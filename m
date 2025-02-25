Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE8FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZy3sQ4BoPVTFOnFIfxwbdlouHG7+YZ8QDgPZTjTI0E=; b=RYkgrxaPQUFPXYr4ol8XXYfLYN
	ZHZESSq+6Spcjsj8nDAw5+rKNoFem9hEvhTpeqzFBwb6aXaFvIV8NqYYG8GvW/eYmaP/H4aFRQGiW
	1rKRLxpIUuaDvfW2mJfWcfi7Bbi7l0/+w4bmpH+ZyQrJmt7x2TO8RcTmtlKzMu0kXMxan9pWB5s/W
	qfBa7FbVWkgnaYBQH9X0e8HWKAxB2Cn3+63YOWxvDSANMjC5iHQ3aT5yXNB/SrQbYnInROrvfGHAr
	Yx6ogmCoMn8weBwmG5jscKXHh0ANVqYCygGNyD2xnU/6f6vifW+jZx6UJlT6WNQCXLA5g7Dzwjb9L
	B1lRJSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyu2-00000000hFl-3PPX;
	Tue, 25 Feb 2025 17:39:30 +0000
Received: from mail-bn8nam11on20604.outbound.protection.outlook.com ([2a01:111:f403:2414::604] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmydc-00000000cNh-16Jw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:22:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HO6SaoRWus4zi4qPvW1b/t62tvVxFB8NbtA8ET8Hnnby7PVuVmTwRxFRJWL65oujEIxVOp8Ko0Tb9ujKB5NmzHA2/M2bYkVa/TS3CzBLTG1gY8XF3Ia6exYjPU+XC4037D3wrcejg8sUYoqsjM8XE/Lj1Q0hpuRRQAHRHhx3aPa2kTLFuHzT1NB8KMTGAessN1hwzyUVDaS4Td6KSeJNHQ0TRN+vPuphTUajyrsYxU5s/8uZyr8ew0oCLM0FARKHE08dUS9usvvdxdpIY3+BtsUrqAoWQCpKeYQleozF1caps9jhPots4vt+ziu2WYEIHXJGG4eJMQe2l7f6aavQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZy3sQ4BoPVTFOnFIfxwbdlouHG7+YZ8QDgPZTjTI0E=;
 b=L2kTzQZkO8WNhLllE8ExSbMOjZ67RA5/amAqlkutbsTLMEWG6j5O1a8WE5som/VImkxRvpO3sWWn+vJFR5sw4H4N/khWfuY8A497xnSsVTNQ176p4ZWUU6xq8iSTKlDDijqkus8EShOZJW3gMkzQtF5dfUoWZm/Iq8YLBUTUO/7qeBkRQWLGLav9eOCGD0xxCgYysepmDuKrtnBBhklEYqN4S87m3ZjnybFqNQNNZjRxCFXxCf0auxf1dg0F1QRm4+Xoy482aM9gsnuk92mk5YQs5CHEbORroe70Dej7PrsTrkTYvnaJzyum4H3/kkyUO7hQY8iZH0fWU9vcik685A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZy3sQ4BoPVTFOnFIfxwbdlouHG7+YZ8QDgPZTjTI0E=;
 b=jbh4MlfzFm0hba2wuXFNgDD/+Q7/bHb5E3gGwTtO2EOB+KruJXERAuFOFeDWc+JQm3+7l3+CMCIFX0UyOnOFLx9rUqemYQLqtlbN3VEAoQbFOOFUNLOeYqFhFbu64jH9USMjS2iaB2Gh9O9nuswee2DjoEyE61cwMtGxWaKJCqwf3zJjw5ZbwxIatvx29rX/Ft27UBM9YQyqLNXFdQJGSWcrmwUItgrqtl2+we7N2J2LJ9swM93ZCOA9lSOP6OFlGXtinRnB/XWB+a8R7q2IDgAjaDcg9yBXQGOai2rY66PqUd6yM/UeCZWXapbBPyUOrnzwoyFlJSRImH650hqi1Q==
Received: from SA1P222CA0188.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::16)
 by DM4PR12MB8560.namprd12.prod.outlook.com (2603:10b6:8:189::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 17:22:25 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::84) by SA1P222CA0188.outlook.office365.com
 (2603:10b6:806:3c4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Tue,
 25 Feb 2025 17:22:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Tue, 25 Feb 2025 17:22:25 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 25 Feb
 2025 09:22:14 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 09:22:14 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 25 Feb 2025 09:22:13 -0800
Date: Tue, 25 Feb 2025 09:22:12 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, <kevin.tian@intel.com>,
	<corbet@lwn.net>, <will@kernel.org>, <joro@8bytes.org>,
	<suravee.suthikulpanit@amd.com>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: Re: [PATCH v7 12/14] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Message-ID: <Z738RHVFhgCmxoIx@Asurada-Nvidia>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <be799951a817557ac093ac3e18d02a631306aa35.1740238876.git.nicolinc@nvidia.com>
 <Z7zYLBLZGKim-5UL@google.com>
 <Z7zlH74/orq9HF7Q@Asurada-Nvidia>
 <Z7zqdrQn7Q8yXfcn@google.com>
 <Z7zxsbJsOFp41Dzd@Asurada-Nvidia>
 <Z70EnQ5CXacc4ysT@Asurada-Nvidia>
 <20250225160225.GA593877@nvidia.com>
 <Z73yt4r0iDFwbty2@Asurada-Nvidia>
 <Z735AMlhP29YEndU@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z735AMlhP29YEndU@google.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|DM4PR12MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: a000826d-cf12-423f-1e6b-08dd55c0f8b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CaBaPzh7xyZPEskb86/qaIoWd5DQl2T5/YoHyS2AtIhXG0+0MAi50tBVt/cP?=
 =?us-ascii?Q?SdQFEQxrWpHafnqtIZY3nOZYQyybiN69F9swoqs+N/4GxgkMrKv73oyKKRdG?=
 =?us-ascii?Q?mVFLwvvJTbBVjfUbP3K5uy+EkBISl4v20TgQvsmGFdOvRwRcBsQc+Rt2AslD?=
 =?us-ascii?Q?7lNEORnDj9lo2UDl91BFj4bKDZdhL+o/8hAm0SXV5sn0Vrwsy7bD+ITSJddM?=
 =?us-ascii?Q?ASiV8F9eujjfylu2VjhIfmV/q/nPJGcGdmzOReOS/tYkiO1TkhkjDc/tdZzP?=
 =?us-ascii?Q?SXgp5LxE9qazdP4FpcMJhezSf/DQLl/bmXCuA1lJDYMctcvRahiDzNCwf4+W?=
 =?us-ascii?Q?jiMZJX094RgdIo9UzpOu9WeaAfTE+37WMEk7iXuHoyiUzB0VpIqqGLR1BACf?=
 =?us-ascii?Q?bbw4CTlRmP0K4XYmprXIm0Q8/xic8hq41+Uzv4aPlQsx/aRoXOy69hJb7b03?=
 =?us-ascii?Q?LN24huNGgXEnEI2YgdTURvJ+EVsk+WDHgL6SBmETW1wUzxZ9O8hNL+CszcFe?=
 =?us-ascii?Q?mOPB2Y9Gf9pBx7/Tzk8fY91Ccpf6bRk7EZ/aagChw1kXrdjYZI/zYjv1GOZj?=
 =?us-ascii?Q?bkTzC4PSwg/ZjR6ZMFnp90Xk4aDTiD0HHeZFsFVeS3KQEC96lvfHh58wqbAk?=
 =?us-ascii?Q?6WRSXEvuQWnLS6pUBRnaQDrU4Rr7mLh+jR5zc7neaJ54o4ppjSCBf8gl/Gac?=
 =?us-ascii?Q?g0pGfPii+gM/cj+I2iSXdA0e6kXcdEZi+NDtdq2RkZGM3Zz409N29t5uxCTu?=
 =?us-ascii?Q?CtloRFBcB9j0qlxPWRFBgNnXdcA625750QZi1U7S1e6Qna+UquDXTsePA8zA?=
 =?us-ascii?Q?BDR9YSIpWn4oyEsWeWm1xD48UV4l4XnqaXftDVoe1/9ujBpPHPQ8ji12Qi9G?=
 =?us-ascii?Q?gRPSaQVbbSCw78OXp/viMeWJCQJC+qsjL9c6ZbjUXNV0PPdgEkELZ4NZPD9/?=
 =?us-ascii?Q?V5sK3aLv9xqKu1+K2tJdkzoJfmXngRf7wVxk4kmxLMmPJnKrhJVmNA1bYLyv?=
 =?us-ascii?Q?2BBzBhRsNReMVOrs9uAtgIt+e0L+miVMX+b+eif+Cblm7xk+69LktVr4zpTr?=
 =?us-ascii?Q?+65YjZq8IAtj6qvqPGZGKZFHT5VwVkhGZ2snOpzXs5gUFtvyGo0KdLcA1Csx?=
 =?us-ascii?Q?4oPsd39ZphtHL+6jBArU4gU0BiuaBzekGcfyOyweBo8Uo63msk8Fgeqipri8?=
 =?us-ascii?Q?6wUir1Q0R9H0kPdLHJrc/F5aBttk0NZ5OFCFnp0jpcIs5J1WkgDzgxV5PbXj?=
 =?us-ascii?Q?yiVQa9vJkFoQvdYt0tnMhoRE97yzDiMcZE6SvaZd+37U+OeuvPN7t/QDJmnw?=
 =?us-ascii?Q?JYhHL4KToKCM4Dh1546DQcWKzgU5Rj6e3KaLh1vovaTsRI+/2Y2opkEYSHgw?=
 =?us-ascii?Q?oPXjXvlyYnZkdHr/cSXU6Mx4r4AV8ePvc5UrdsGQFPQdjXJ1M7HsKTfzg7dl?=
 =?us-ascii?Q?BdyTHGPrgkGUYneTfaJO2qDkZEUWvrHUP7fctW6CaRDBLuDZR+e5H6yc8CsL?=
 =?us-ascii?Q?AiKdrfmvk+JAtrQ=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 17:22:25.0126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a000826d-cf12-423f-1e6b-08dd55c0f8b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_092232_297687_7050AC4A 
X-CRM114-Status: GOOD (  13.60  )
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

On Tue, Feb 25, 2025 at 05:08:16PM +0000, Pranjal Shrivastava wrote:
> > @@ -824,6 +829,9 @@ struct arm_smmu_master {
> >         struct arm_smmu_device          *smmu;
> >         struct device                   *dev;
> >         struct arm_smmu_stream          *streams;
> > +#ifdef CONFIG_ARM_SMMU_V3_IOMMUFD
> > +       struct arm_smmu_vmaster         *vmaster; /* use smmu->streams_mutex */
> > +#endif
> >         /* Locked by the iommu core using the group mutex */
> >         struct arm_smmu_ctx_desc_cfg    cd_table;
> >         unsigned int                    num_streams;
> > @@ -972,6 +980,9 @@ struct arm_smmu_attach_state {
> >         bool disable_ats;
> >         ioasid_t ssid;
> >         /* Resulting state */
> > +#ifdef CONFIG_ARM_SMMU_V3_IOMMUFD
> > +       struct arm_smmu_vmaster *vmaster;
> > +#endif
> >         bool ats_enabled;
> >  };
> > 
> 
> Umm.. I'm not too sure how I feel about these #ifdefs _between_ a struct
> definition. Given that currently, the arm_smmu_v3.h file doesn't have
> such `#ifdef CONFIG`s between structs. I'd say, in case
> CONFIG_ARM_SMMU_V3_IOMMUFD is turned off, we can simply leave the
> vmaster ptr NULL?
 
OK. Will drop..

Nicolin

