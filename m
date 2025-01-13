Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0ADC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 20:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neC8swkEuw03PDXTtFTGziwBfO46T9kvPiTjQuZg9eE=; b=f6r/Q8s5rlgfNEjdE+3m2S91kh
	NqDwqimVKNFHsuJdaxMHXqp/TaIfJ62aVTsmGv1nFrr9J9aMo+EIYxPbeFW5F7vATuozj4rfl2+Df
	z8yYxMd3iCZECbLh15NvezENii0nwGr7Lokwfc/9rYhq8zTx34p5TeNxo6TxC8ChoHxsndwae/vZJ
	pEqfHxqBkIFackb+af/O//HStCvFoCgOSNw99TpTe5oglsDqr9wU2WbV3wq25j2SvzHK6YomzzarB
	UUdCNg0ATRLIB2F+JiJofhbqtzN9Hg82HHCjOdHGLtNVpagQGFzM2yUP6KEkLO01P7tzgqr3YqfII
	4E3ifCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXRKG-00000006aQN-0S43;
	Mon, 13 Jan 2025 20:46:20 +0000
Received: from mail-bn8nam11on2061d.outbound.protection.outlook.com ([2a01:111:f403:2414::61d] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXRJ1-00000006aJz-1NLz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 20:45:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dj1nBoqmV3yYCaY2Fk6GhmNj9zphe+mquNzTHYCxhvJJOkFYLLc1eM3MOn4U4t30AWDXNw5Xp34hXjPGT8wN678VY8CIWqPtQZu0euyNYlY3utbn/dWeN1u3CnDWuNhjLFf5cQpbzW3ZNWDCNbwokCemrlLySoCdH6GGVrlUiOwk5/AxG2U+xAmAOKpMxvissWm+rYD4/ti4JQpPpWmeRGdDDBJF8szi+48HeykoBdv4LNfGkgh4DJ7tu13kxfF9GizYLdZUvv8IKFKQl3yTYhldMlh/fjmWxvuqyCYCd09v8aMsSrhJo8w73sx91za6760WRlIaH//bvx+dSilCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neC8swkEuw03PDXTtFTGziwBfO46T9kvPiTjQuZg9eE=;
 b=B9WzOISv9cL09jELXu+wMRcAQWSlYQfeR3zUY2z3a+B0uZnHtKaBr+QHvtI1WJphsNtUjDJCjB1iU2y0iMDT5HNbpe0qooV3XT8UitFLdRUCVLzHaLI3cCQkX9MGrUNtzXJ9viA8HNp5aVSJogYZHj59eL+S3eeOm4+5Qs9700vlFjvbHY7MaqxzRvKBATcoaFRONnUsCGTxj0lCTxzHQgzRKeTxbVqTUPaghz/TASyBhQhe+DyjcFoYTbCuREqjgPdHDNTJNFzyq8tFtzvjV41pJbPQByfUrAbUr3blYf7TtqF/sD4IzGAccbtIdWj6II2m4XQ1VaL0yEIdqCA4Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neC8swkEuw03PDXTtFTGziwBfO46T9kvPiTjQuZg9eE=;
 b=Y5wd9O6F2z4NevbM4v6OvyTMxTOHg7RzTBVrK8c63B5YXcO0ry6ciTnB5VbzBrXRhcoaN2TQcKmwRdr2+4hT5ArTUWC8F5mPgYI+xLZAy3uoOsYwBRjB+aLhbHaSrxWd7sDzSYwOvTQaiE6suxsYM5Jd5b0+lqMvMOLtvafZiyHGH+NCR8vRj2JdxKhzFQs4u/5D7B9t0z3xHeM6Zt0cz7pIDlIeQbVI+DNA2vqAZxkBTyuh/pU8h8djsuhW1vhn3qMaTzfy2mWt7oOlBQoESR0icSQjBCbzgsrc7t9S7W6mcYrI2Ijz6ZKKFi9NGyfD9jcVHMXgVBlnPJ7PhYAHLg==
Received: from SA9PR10CA0017.namprd10.prod.outlook.com (2603:10b6:806:a7::22)
 by DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 20:44:57 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::f8) by SA9PR10CA0017.outlook.office365.com
 (2603:10b6:806:a7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 20:44:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 20:44:57 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 12:44:40 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 12:44:40 -0800
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Mon, 13 Jan 2025 12:44:39 -0800
Date: Mon, 13 Jan 2025 12:44:37 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <will@kernel.org>,
	<joro@8bytes.org>, <suravee.suthikulpanit@amd.com>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: Re: [PATCH v5 08/14] iommufd/viommu: Add iommufd_viommu_report_event
 helper
Message-ID: <Z4V7NbxGyYoQN0yV@Asurada-Nvidia>
References: <cover.1736237481.git.nicolinc@nvidia.com>
 <b9b4f3df990934cb80b2f5e1e49e555e50c1c857.1736237481.git.nicolinc@nvidia.com>
 <20250110174132.GH396083@nvidia.com>
 <Z4FpMs4qx3NdwrnZ@Asurada-Nvidia>
 <20250110195114.GJ5556@nvidia.com>
 <Z4Smpeb4k4UF3Qso@Asurada-Nvidia>
 <20250113192144.GT5556@nvidia.com>
 <Z4Vt6DAMDfEv6tb5@Asurada-Nvidia>
 <20250113195433.GV5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250113195433.GV5556@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|DM6PR12MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: ac85281a-37a4-4838-6c83-08dd3413242d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FlPLho091fwMX08/BwjJzhAoWn+KQD8ej7xopkQzmoKrcyX4ZLOFn1N1/VYc?=
 =?us-ascii?Q?dE1Hin/bJPjpZmOfcTWcpsGUrGg8tybn1rqB9+OCq+nKwpSyRs8BIGuF855J?=
 =?us-ascii?Q?nNMmqbZxgGprighbhed8HSqijhg7xQdBp4lSjppoOnjG+3/brBPm+bU1gAFv?=
 =?us-ascii?Q?yhx0ZCz8J+6c+F/m2AlHYEmUp9I/UOGeFfTbnwfl4blNOnptl+N4p+8oexdm?=
 =?us-ascii?Q?PO1vqOJT/ot+cQb9PJVIGi8Ffsq7YlC4Sh0CQiVsXQYa0oasJLyGUbfmt36c?=
 =?us-ascii?Q?T77EJeJ4UvrzxN4ssmveBBznhTflyJiEb++WB38rdDt5eaHDi+CUh5KfYRS1?=
 =?us-ascii?Q?AgoiUWvc0vD39evqAi6WeebVbQMp+5hM/ZbuZp2Se7jr/T6ist2Ps+AKGPPn?=
 =?us-ascii?Q?OdOUkr5HyStG7Waf05x6z9ti3AHdm6ozVSa0N2aw2wh7zpreNWNJO3gsOJAn?=
 =?us-ascii?Q?FaX45mfakCYSWCaEdhCYsC53LxcesQFrprxRBSvcpy2bWa+I68EkM+TjFLYq?=
 =?us-ascii?Q?nYCSFxeCk54EZlG3J5v9DJhVqdZCIQRk3/3jPuKKMa+Vn2kLkN2xAtJUYTV7?=
 =?us-ascii?Q?JBFsY8iIiEYVW3dPIuo5QXGq1T5e6VG9nYnNT3+FLWqenaOuDmkBQvmvozld?=
 =?us-ascii?Q?FaAUAbEyEdvDVDd1jpvtu3pYoNYpGojVKdIVl/8g//zGWbW6FmnMILuNPT8c?=
 =?us-ascii?Q?Z0UC3X21x6a7k+qATZqpKGjH+lIhM5IbRN1OKoedzcVsYz/dgJwYcbu00kdp?=
 =?us-ascii?Q?UqGHUDxYC2xA4Hi2kQ2ch5U+8ZmcenWwM7oM/U/j6gh1d7A+prq+0kVXLusQ?=
 =?us-ascii?Q?D97TP8QxHyZKRCeucZZaW+LyTkTkgVZFTXcxc1okChn1FzqfbL0/xaRJ9v6O?=
 =?us-ascii?Q?RWSVds9Z07Zrek3BMgkdeKJRIKP8XbPEYoiNmuizbRz6N29qQUsBMMWtnL8Q?=
 =?us-ascii?Q?S+kN7LYvlzzuOD5J6V4RBA8/8vDo/WoyemGkIrA6GIpEpHZqxmki2ppC+4sp?=
 =?us-ascii?Q?8g9sXSoe6rtkkqB0IszyuXIBCL5KFgTztbNt6Djy83ecHcLR23oaN+VOAvLs?=
 =?us-ascii?Q?FK1I7JOQlR+gbxL2Xgk8T7BoPgJHEIcf8yiKjrAwY7/7w6XLbyOOZDpNBHMF?=
 =?us-ascii?Q?qmDA1RWAO8KK/EhVLITOnw1UbTtrzvMrXl17Gk8mruDkBf5DdV/fLyD+hfE0?=
 =?us-ascii?Q?WAUouEnUfz0N3nhfaPsA+XY8F48ph1Htms/143Err1rivgQknaaFkmQPbXi6?=
 =?us-ascii?Q?YLfyoe4XKLQNNCRGESQqeH4qBlJYgODWTxdMel7N/hjDpBxmC5Svi+2yqq1/?=
 =?us-ascii?Q?8R/7sUtalDzjW85uvOlvRGiNwC5P4kP6TKQNacPGAPVwwJFYTcvb3SHFXJsr?=
 =?us-ascii?Q?JLdgg0VyOVtsa16kQQObAJFsBIJ79Tqnu+TCuRVY1vTFA8ZnMjajnGVAhB0v?=
 =?us-ascii?Q?3b1Ks3w0Od4So9emlB+F+X1Zu5FUxzkaMqsliGex30P/xyIE5X/1CqOXAy2u?=
 =?us-ascii?Q?87x35+1htXktY2g=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 20:44:57.1051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac85281a-37a4-4838-6c83-08dd3413242d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_124503_359977_80672577 
X-CRM114-Status: GOOD (  23.03  )
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

On Mon, Jan 13, 2025 at 03:54:33PM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 13, 2025 at 11:47:52AM -0800, Nicolin Chen wrote:
> > > The other approach would be to add a sequence number to each event and
> > > let userspace detect the non-montonicity. It would require adding a
> > > header to the native ARM evt.
> > 
> > Yea, I thought about that. The tricky thing is that the header will
> > be a core-level header pairing with a driver-level vEVENTQ type and
> > can never change its length, though we can define a 64-bit flag that
> > can reserve the other 63 bits for future use?
> 
> The header format could be revised by changing the driver specific
> format tag.

Yea, we need a header format (or "header type") when the vEVENTQ
is allocated.

> You'd want to push a special event when the first overflow happens and
> probably also report a counter so userspace can know how many events
> got lost.

How about this:

enum iommufd_veventq_header_type {
	IOMMU_VEVENTQ_HEADER_TYPE_V1,
};

enum iommu_hwpt_pgfault_flags {
	IOMMU_VEVENT_HEADER_FLAGS_OVERFLOW = (1 << 0),
};

struct iommufd_vevent_header_v1 {
	__u64 flags;
	__u32 num_events;
	__u32 num_overflows; // valid if flag_overflow is set
};

> This seems most robust and simplest to implement..
> 
> I think I'd implement it by having a static overflow list entry so no
> memory allocation is needed and just keep moving that entry to the
> back of the list every time an event is lost. This way it will cover
> lost events due to memory outages too

Could double-adding the same static node to the list happen and
corrupt the list?

I think the vevent_header doesn't need to be exactly match with
the driver event. So, maybe a vEVENTQ object could hold a header
structure during iommu_veventq_alloc?

struct iommufd_veventq {
	...
	atomic_t num_events;
	atomic_t num_overflows;
	DECLARE_BITMAP(errors, 32);
	struct iommufd_vevent_header_v1 *header;
};

The header is a bit redundant to its upper three members though.

> For old formats like the fault queue you could return EOVERFLOW
> whenever the sequence number becomes discontiguous or it sees the
> overflow event..

So, IOMMU_OBJ_FAULT is safe to return EOVERFLOW via read(), as
you mentioned that it is self-limited right?

Thanks
Nicolin

