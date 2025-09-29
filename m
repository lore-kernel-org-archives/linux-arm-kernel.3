Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C39CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 18:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApiJD5gUL20hRszC2BGL7GpljeEYeG7HJuXEt16GsyM=; b=HlFhJlPqAJuKvqfEKkHy6QxSTu
	NCuAhfDC/ZmE4YeO126MKRp1gA+JEHOtC21iJ1NiVqHjI6vQhdiFe03NAoKvsiL7qgBzNJI88sUx2
	cQcYczTI3ScKcTd0UqUxmaN9Ej2b38uagXQU0yjprk29BsCOh4u9TJybKlITOC3wiq+A8knO/In7v
	7sk1IqShCc12HqefYLFGSTdoXU+Ptu8NIgBWPjSkSFI2sViuS8byNkB7wQ0nYgOgMLF25s64pEric
	dJJXCyRe4zJMramLyz7eJnFbzMWE9MXrRA3pEyKKR1/Imhc+21Cvp7JEKQ3/I2sDT1tGdrVVbKCtS
	X9HpdTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3IzB-00000003HiG-1JQ3;
	Mon, 29 Sep 2025 18:52:33 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Iz9-00000003Hhr-2OIo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 18:52:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2alMpWYQOHjUShcs1Kv0efR5wBVXkwZ0KpWVqGB5namSBUV0rxMl92n9hoXSOxbhud6SIYv3qsgotf84QwOE/roM82qeNLQsuLCDMKdS5EZ7b6x38b3JmNzlEBMf+KCyX4P6IftPpoK5jkkstaPw7R52bfpijT4URmGYJXytecRbFgUjI4TZDCW5GpfCRYcLWLQDFpJCwRTWc1xngCjggrrIgzXVT/+5Tt4SZn9rEjFCw44pUCo8HcVrnM//rRNzKG4hrDQasFtYAOCWqOYAkBKqzIRdyzW4qjCwmINyCZ/PIK+7+ksk2v7pJtJZFgZOz/SbRUh5BXkLDfDvBVBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApiJD5gUL20hRszC2BGL7GpljeEYeG7HJuXEt16GsyM=;
 b=FCYm1PrFo5ymG+EAsvmzNhFFWUhHP9Dzg+QghAX0OOAN4RpUQ1ASCHtt/taPFT2fyEXX2Xr/y6yCJACmzsgEJ7B8zJLnClrMg1C2Xui2MEmokHdorvp8t2+9bztz9u0ig1KfOrL63f71QQofSGrsV49gA978Hze+EO5rh0l3uSKroGA3/iMYe9VqmnSwQF5TcpWNp8i2aCyzCTRcAukYB9T91BYW7iPAw6cRI6MzdZA7kRHWcOUhaQzC+XNNH0K0NeWGPs8Sb9E2rakB5wVWe6JXBiZ4LXz28/2q3qfSsuP0dDY3quyybl4XvULC2ArBGcFvocBHO6fwooyazkEe3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApiJD5gUL20hRszC2BGL7GpljeEYeG7HJuXEt16GsyM=;
 b=K4LHu9UurdUW+5AjPvMUi3auF2Z/CIpvTpEbxvPgcddNlv9YplegcPyRz8mNa7jy7gLRbNhTBPvF8qwsMUFXPQkE7v/hqnBRPydLP3JAWn2YQNTPN4ZlLISdHbirEJzvBwXw0npRcjxqJI2REzUisAty7gPWl+bLZUjfhC6X79QZRq+7WI3qR/2DlEyAjRw8WI6PPfyl789DV5dDK2g6LJvJne+jDDnzysIcdHNGXIqrnw9y4FMhI8IPLG01+K6/QTn8z4V4uzRby0uPDrIDdRFORubP+jmbQ3K5JEGsoRAYJYGFdxnirjWJVpCudgA+8eCcaSbNRXur0W9f+qnxXA==
Received: from PH8PR15CA0018.namprd15.prod.outlook.com (2603:10b6:510:2d2::11)
 by SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 18:52:27 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:510:2d2:cafe::89) by PH8PR15CA0018.outlook.office365.com
 (2603:10b6:510:2d2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Mon,
 29 Sep 2025 18:52:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 18:52:26 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 29 Sep
 2025 11:52:11 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Sep 2025 11:52:11 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Sep 2025 11:52:10 -0700
Date: Mon, 29 Sep 2025 11:52:09 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jean-philippe@linaro.org>, <miko.lenczewski@arm.com>, <balbirs@nvidia.com>,
	<peterz@infradead.org>, <smostafa@google.com>, <kevin.tian@intel.com>,
	<praan@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH rfcv2 4/8] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <aNrVWfF69EU1xvBB@Asurada-Nvidia>
References: <cover.1757373449.git.nicolinc@nvidia.com>
 <80310b98efa4bd7e95d7b3ca302f40d4d69e59c5.1757373449.git.nicolinc@nvidia.com>
 <20250924212912.GP2617119@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250924212912.GP2617119@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SA0PR12MB4398:EE_
X-MS-Office365-Filtering-Correlation-Id: 054106ee-2895-4e22-ed62-08ddff8955a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MQGZBIOO9yEMRC4CozVt8SY9ydZxlWOKNc4cdWxKb6aeYIAxR8vJPP7ztfuC?=
 =?us-ascii?Q?8RKCfSNgV8V5ZtQ9etF0KHbphy22qp7ZvWaDf3xrsxhsh72TsryAGbJyWMqF?=
 =?us-ascii?Q?wXCWeR8pb4W1gqv3X5Mf05MBKc9Sm+mqP9RDB9XkUghyhCYc2pVCKSWJTC74?=
 =?us-ascii?Q?m42NfXsb8rJ5CNMPyghYMiquOAaZ97E2uK43v8ZwedFeP93RA3dzIwtoRXEY?=
 =?us-ascii?Q?22mga/dDIARs8Auch2cjPdRfnSDSPhwMv5uQm8x3gwo9uEhciRoQ4nqJZ8xm?=
 =?us-ascii?Q?o4ID7UruryNm8yDr1HmNnXUwqlRBvR7E4Hhw6zhzSrjEUeDu8Rfv4NWARU8A?=
 =?us-ascii?Q?zebKktQNXNwYD5XNUe7BgDJH4bQ/AiGky3rHxfGV8FddKO1Kf90d3zQANodN?=
 =?us-ascii?Q?GkRHO198vLi573oahnJQwcXpQarftTi906vuhtTpm5HX1/bOOuCWQOmFBvvS?=
 =?us-ascii?Q?c15F451Ci3airvD8bVP40UoA9fak4VvjhaSg23AEOV/0cIbMwNo74MXncEku?=
 =?us-ascii?Q?EHECncjBaNJRnsl6YFxbu2QaYBNHJ9KuF4eocbB8jXrqVtwf9bAqJKA3MPQ2?=
 =?us-ascii?Q?qRIkqIhg/nZCL6abVnvyOauVp9Q7jL/5oeK1XVz2mInE5hyUuy/wClniDeM1?=
 =?us-ascii?Q?nuSkATFrEieFGUs8Ph1wWCfWLROY1l6wW8nSIb6JfOy936YW6cGSUG0ZZ1Rg?=
 =?us-ascii?Q?ZxZXu8sb9Q9tA/keorIXob3ADrpPycjtOPs9J0PpK0SWldy8ysinfqcazF+0?=
 =?us-ascii?Q?/jS2Gvl8LasQeoDyysgXzB1lJYxgFtClpqLRYOqnrgRgYnuVLhetCNatg6Ro?=
 =?us-ascii?Q?j02RhpY9oGMn8rIL9tkFKusdPaXxRKIfi+HxHulbrZCE/tmRHdMR+1mVuIz+?=
 =?us-ascii?Q?Rz9EYYCcpZTU9+qroR9TEa0PfCZN9D+HZ7QIrjscg0jn+8kNKvRGPxZu+cGj?=
 =?us-ascii?Q?FfdRd5QRHMoGNzZKn24igGeUipPJ15o5lEsxZbnx/VDhb0eclZvQCRWAVnO5?=
 =?us-ascii?Q?oMLgvSB/1M8ixQZbs0zdoHoIHRsi7/vSENWJ2gz1R24f4vVfJv5E4NjMXzrQ?=
 =?us-ascii?Q?9s1YDcUqU5uHU9NMmtCIKkMKtCPpZaVRPDgEkwVnjtbbC+tGHynqfNAjPB5k?=
 =?us-ascii?Q?sKbvVGK4MhCxP3oOU0Bob8oKHyQ8Qrkf9XtSMQuLjAp0jSqEr6lQMnmdC3Xm?=
 =?us-ascii?Q?5vGrsTEE7F9OYEOM/sK6hIPDN3QIvveIeea7q2trip03l3c6V+IrDiH20W3H?=
 =?us-ascii?Q?pwP/1L0umAgtGNoDy2Q8audFhPwByBx5v3z9ArPVS4sP+DGZlPe4/KAUwdoL?=
 =?us-ascii?Q?2I/6QYs2jNH7a5vzZl7p67t885BostbAqWrySjMuSNfIkrpbQVPscpCRvTHu?=
 =?us-ascii?Q?koW5dls7V21uT3lf62XFQnzndo4qRpajC5nGIVtJYFgENEFaAhYRUqhbnuq6?=
 =?us-ascii?Q?hdZz0tHbIGOy560uy8ljijv2yi6T3QkhM6EdJsIEzi/+9IL95tNDOKD4ZSy0?=
 =?us-ascii?Q?PIiPGbNc8PXEqBJtnNvgDwVzcKq9tKi6T6mPQaMURxSq95AYYYxl+gupgQC7?=
 =?us-ascii?Q?C1fRMkznj7X9wITaTOw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 18:52:26.7962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 054106ee-2895-4e22-ed62-08ddff8955a8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_115231_622439_579666CD 
X-CRM114-Status: GOOD (  13.02  )
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

On Wed, Sep 24, 2025 at 06:29:12PM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 08, 2025 at 04:26:58PM -0700, Nicolin Chen wrote:
> > +
> > +	WARN_ON(new != new_invs->inv + new_invs->num_invs);
> > +
> > +	return new_invs;
> 
> A debugging check that the output list is sorted would be a nice touch
> for robustness.

Sure. The second for loop generating "new" could run a sanity.

> I think this looks OK and has turned out to be pretty simple.
> 
> I've been thinking about generalizing it to core code and I think it
> would hold up well there as well?

How would you like it to be written in the core: a generalized
structure or a general macro that generates driver structures?

And potentially we need a new drivers/iommu/iommu-invs.c?

Thanks
Nicolin

