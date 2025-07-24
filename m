Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99789C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 21:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVnG3zRnfwv3sFMDImqaO2+YPOjxVGKEBWwC7KZiHuA=; b=DIBQP2952F7bFXHKghU8q8SgEo
	4WZ8pynxGnl3f213tMETHxN85461Sg9bQDIdOEb0agletHAz7nIwBYwDIL1hgur4M48kO54HzDFpU
	iEAXwmbyr1v+zjSTaksdO7VI4BOLtRvWn7w4UQ5SkcqovhN7LpgLk1x2yaFHuEmh4TYkuWETdAx3X
	08RK+yhMoralxvqtcFkOkRGVswMo/EVk7HlR2JNE9SzAq/rzoWMgNnzOKSFhmWSuAs2JVgR7iCt3D
	xJpoGaDkIxxKrZ7W8dUqAkeT58tQecUbE0Ii98L7Sx6lKbEHtdm9RxBesKXDGmjZGR67IT3JhmIb/
	vUJBS02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3uJ-00000008XP1-23Fq;
	Thu, 24 Jul 2025 21:55:19 +0000
Received: from mail-dm6nam12on20616.outbound.protection.outlook.com ([2a01:111:f403:2417::616] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3pA-00000008WyJ-34Ay
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 21:50:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB+6P4XA+oXfJG5ilCZ6Rem+DwKq2ysJ281UggEhXN7u8FHvKpt1at2GBwr5miVhfZ0KIYSm0Y7Wi9rM68Ai12PqRGJsshFVGMbmuQzInJ5hXKbRRzORk+IWc5KQDokK8Vsp7K4rdQebtu48wJkO86t8ZJOQqaObX5MKKpXh+ihvkpFE4bZueO27MPA6D86c3W6B7Theq9CO4fd6hq2udn46XrdrRDel9TLUmGuex9MTXhGzJzvYLo4NXL3ctYXLlV13IB3+lV1gYkwA03UXEJiGkky7ewg6X/LWlmLjutMqKXE6a9wXjc6VFOF0ffrhvAWrivREYjGWVA6xSeBagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVnG3zRnfwv3sFMDImqaO2+YPOjxVGKEBWwC7KZiHuA=;
 b=Ms9KCoJ3zdgVdDP5mYZbKpkhCGrPzZut5c5vU8YPQzHqGszeELrWGIqwVqA5Skag/f/hHk1DmbaX+pjpgj+sPvX3BOeTrDNEv0xHwJ1h93TRBHoe9eyR/6xbtrvNMmGr9pJ0xYoZ9B2Yf3uhS6mkQEK+mRayo1ljJgFQv0HNKKK23zWUppEm0G92VRzEY8TbxRHUuTawj4DTAW8cwldNdr/1J0GCf9MWzzM7wzm9QDPVKHuLk8mBTM2jjMgkP8UyaKVLQDCVA/Rv/xAHwoG5UyVGEPqoTbJCuLUaruyYFeMRUwnI19yEXFdZfoq+2PlQcVkbDEYL3ogysmwBQ6PVkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVnG3zRnfwv3sFMDImqaO2+YPOjxVGKEBWwC7KZiHuA=;
 b=r+tzB8Oy6vFkfl23gqgD5fx5IIDjVNLdUdXL9Nu0zVrY0sD/u2JOOeAZnk5WPiIn+lAn4CFMRlYjdXMUM+P3W+17s8b94fwXuDrAPdHCQzx1UJX06IK68PtuPaCKIXsKriOY6Ifrw7N/4NaahtYWKr3ZgxRTdcJJOUCSYojtlYid/5GqjHFxrMjIT2fA9UpazqkaquvdhmMcxupZzDxlN0PbEHjQenQqkksoLWjRuIXJtdk7O8HdaPju15uRdhBdb33MvpJ8rF7VovuwqVZCMUG99T031RV+gYTm77fo+3rqPbmamJgN5Kvrm2tSnI1/D72GSsF6fUSHD2+73fGmAg==
Received: from SJ0PR03CA0350.namprd03.prod.outlook.com (2603:10b6:a03:39c::25)
 by PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 21:49:38 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::cd) by SJ0PR03CA0350.outlook.office365.com
 (2603:10b6:a03:39c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 21:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 21:49:37 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 24 Jul
 2025 14:49:30 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Jul 2025 14:49:30 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Thu, 24 Jul 2025 14:49:29 -0700
Date: Thu, 24 Jul 2025 14:49:28 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <jgg@nvidia.com>, <will@kernel.org>, <joro@8bytes.org>,
	<robin.murphy@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIKqaGMMpsIuAVab@Asurada-Nvidia>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
 <aIKd1owebUNQeN1-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aIKd1owebUNQeN1-@google.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|PH7PR12MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: b988031c-689d-4b67-a1ff-08ddcafbfc93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZiTedFsjr8Wn4aITQRkXFfwrJsKlvvQ8dI8/0Ahmi6c4ORtQp3wVbpTs420A?=
 =?us-ascii?Q?FfwMQy/p1b0uEg81299bPbrDJ5vqOGeHZQToy+uYkZSkLITYbZbFPxCkPg7s?=
 =?us-ascii?Q?WcnkiyHYAG3ngcojcRNKb0YJQJzuKdJ+W84tQUqNUqMX4l8tt5qxKJSmIxjQ?=
 =?us-ascii?Q?ZS9Kdh8PHnWYh8/lzmUiFKYS30ASGWF3DDmN1JLx6N3DzQMRMWpPWAmb4e6O?=
 =?us-ascii?Q?3DS4NVyq3HvOceapvd21PClyBh8E3xKZWFCNwbhLt4v8tL5F3ABxZ0TNZB7X?=
 =?us-ascii?Q?Ao5axuPKnU45rHg8t9J0opQBoGfj5LVv1tAlHNFGpm49N3zX6EtwWGDvsNb/?=
 =?us-ascii?Q?tbbO1Ww2T1xui3LVdd9qDs8aUR50teY8mRc5KIEf3CAudSb4TXjGgOOCC4DB?=
 =?us-ascii?Q?eQeO3sIVHMFzhWjJBN7+ydm6f901XXmPuqY9VdJ7AqdX58a5miqciqVcdOUj?=
 =?us-ascii?Q?2R2qrg6vTfrRVfadhXeulhmL3lGziFhbXygAsYFoA0Bi3D9rb6fsUypidpDP?=
 =?us-ascii?Q?TaQPu6QQEv4xQ3Xil965Gpu4mqOQuBHYQHiToqGWvU+3wCpyG2tRvZj2Z2/L?=
 =?us-ascii?Q?0CUKKWgiTdz7+q3EQwhcDaEq1q5YNLj1ZYTKEROcbpO05DTpASEnQ3XPLP0F?=
 =?us-ascii?Q?p9yAGali2lPuUr7gsYzE3hQ3cplReEHcFWYE5NZZRw5Ogbn0N85miOYOIJ8b?=
 =?us-ascii?Q?yOKDXmLRp/TB6jMTY4rzV70bl8WIZbvDvJl67lDkrH8d6ldvZiytfQNgh1tc?=
 =?us-ascii?Q?TiaFn2GDXxUeTZQXHsh+TF9ITgDJKR0a4okyO++18Ddy1LEiFpG1d1EB2WE7?=
 =?us-ascii?Q?K4ZJv0jeCm3QnL2GvYvK1x9eE8sp4pOTbPRfDNZNpLGkPyAIhWowwoRqT/lC?=
 =?us-ascii?Q?u4SqVt4GzA1DBOD6KMYD+9/cWFIm3oX1DaTy1oD8wrzcLnjwfvL6tmIafGWp?=
 =?us-ascii?Q?1Ui+PssH8nEzpaQyjxJB7ExZYewo848tF2JHGla0HK15M3v240wzNuL1+YzX?=
 =?us-ascii?Q?++jBrsuMoA/DUX4+F9gPPgVFH7l6vB9ngOjVVEl7A/X5KHG+qX8ihvPF8eey?=
 =?us-ascii?Q?wo7jkOftKnuPqQHxdRIIc9Qo0jlyBwgx1GeJA7YkSC0UfwOYdovojaj8KB49?=
 =?us-ascii?Q?3bUjn8HPIDFRKQlAalbd5ysSUv/XatrLfBJpj0ns0w6Ahxt/Cvhozb+zsuYg?=
 =?us-ascii?Q?Q6kn5GyMz/WYosC0XNPvji9nh5N0e5Om+0VCClCHfo9Y7/fOjY4Q4YOXR6jc?=
 =?us-ascii?Q?YmcmfvxDVzU8zwRRJFpYCaJYqdaSO+u6/+zQyv5NVK4gNHtaiD9bU76WPOqm?=
 =?us-ascii?Q?0DH195b1gBtcbzhhIWDAqJhM2vkCKCbJr0Fo9/+nryqVSt3j+irY5huFkndB?=
 =?us-ascii?Q?q4ctTgmTUqm86GFtIJMZBpuVGmrG+2OeenKvdUiABXrXwe6BpC6Lsfl7r8v5?=
 =?us-ascii?Q?XL4SsZ3Vuq5N1NGFrL2+rhMq3ST10QjaiPgdyYDn4uZWreeDgqjkhxUlEDMo?=
 =?us-ascii?Q?EIKcvPOtl7zszeZJiDd+A2khztG0hRolmTZv?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 21:49:37.8926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b988031c-689d-4b67-a1ff-08ddcafbfc93
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5902
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_145000_776537_A5664E42 
X-CRM114-Status: GOOD (  15.28  )
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

On Thu, Jul 24, 2025 at 08:55:50PM +0000, Pranjal Shrivastava wrote:
> On Wed, Jul 23, 2025 at 06:58:20PM +0000, Pranjal Shrivastava wrote:
> > On Wed, Jul 23, 2025 at 11:05:26AM -0700, Nicolin Chen wrote:
> > > On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> > > > On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > > > > @@ -1273,6 +1279,10 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
> > > > >  	phys_addr_t page0_base;
> > > > >  	int ret;
> > > > >  
> > > > > +	/* Unsupported type was rejected in tegra241_cmdqv_get_vintf_size() */
> 
> Sorry, if this wasn't clear in the previous comment. I meant this
> comment must be updated, the "unsupported type" wasn't rejected in
> vintf_size, rather the type got corrupted which brought us here.

Any unsupported type would be indeed rejected by the init op
callback. There is nothing wrong with that statement.

It indicates that we shouldn't see an unsupported type here,
unless some serious kernel bug like data corruption happens,
which is implied by the WARN_ON itself.

> Had the
> vintf_size rejected it, we wouldn't be calling the init op.

A data corruption could happen any time, not related to the
init op. A concurrent buggy thread can overwrite the vIOMMU
object when a write access to its adjacent memory overflows.

Nicolin

