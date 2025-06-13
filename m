Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BD1C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roYM1ayh/WlXyOMZO9HWQzN4wOBtYnodl5Vx6YwAyTM=; b=JdADnT1g1JGqk2oAgsXq3XDmnK
	6PhYRfuMP0JG0Ho2+Zk8r9WXP2p4jpHs281GopVLTr28wxyBXE3I47jZA+OOtaNq0p8nt6c4UVanm
	kR3PaS1hdwBK7hinwsrq2X6GiBV4NaeoQ6fHwg+axGTfrCWNiGFiwVCxrL2QMrVGNSzt/8pPKF6Kr
	zRNq3bzwNRVJi28u/OcrV8ZjK+DWuEvI7upUDwz94BK+3+qoT1lPdtZQJaC29o6c1HnXoSUclG2Ye
	5gWhV30bQN6k9AdZXtO6CcG362QfHqAxxvYMEM36qGBvvOm6U69j+FSKVRvLT1ax6c6RI+6jp4TFa
	BQYKkB6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4gX-0000000GWDl-0MQL;
	Fri, 13 Jun 2025 13:43:09 +0000
Received: from mail-bn8nam04on2060c.outbound.protection.outlook.com ([2a01:111:f403:2408::60c] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4a9-0000000GV3N-3aAn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 13:36:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIfnh3urXjBE7Aq9lKOyTkdsHyJdRJLJq3nsFw0S4j3rqKR5LUIkeZEtLswZI63Djv40LpFDJTRaJDoPnQUh81mokS9KyMNZuNhMzD8oechnucP/wf3sOVSF89sng9LNniKQy3sDuCD0TBMYPX+2acVNCNvbRvx83zVrEFD0lGRBtlMjweEMqovhx7QZeIUNYLOPe4hedwhmw69vtnb0fFmS/c5wyGRpCEFscyHb38McM8vt8zDfZBo2hh2GLgblVMzK2xfUtuLYLHcHd4+iy99pGL0YZTFi3itbegEES0Cgk+oOhDXIgmVWCfsE1S3ujMwpjfnPyyqUviWtqheytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roYM1ayh/WlXyOMZO9HWQzN4wOBtYnodl5Vx6YwAyTM=;
 b=ZRoT1JtmwsitUNHCBIVpgBDA9rER8qYWn15OTEJiWA6A3LdPlmlljOrag7dipjeT01/qV5+49kiN/J+O/ND8UANzOBP3v6rIsWeUBHzvJlBzh3ijDZFU/hZhCxZDnXPpequDyMwCJ7VIM+w0efNrbnJRljv9yoz/MVMop4Ey0kUEef55N8kgG6ub9Pcd/yhKMC2Ver45cCrkr/NEN7HYU8K/J3GgyiOQjW/6lvXtibd0al4xZ2f1V5EFIdOlqsfne7tNTIKQ++jymy5Y/bybonnu08lVjgKvdL9qREnKFAonNb/VywNLly5TJLU9QJrn05kIZjZ4Vh/Jz18yGW0gRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roYM1ayh/WlXyOMZO9HWQzN4wOBtYnodl5Vx6YwAyTM=;
 b=F+ZkHK6YLljQH3er04YadtWbXtMRtHikguHRD2ZUIXqKs+wYWIjJYz8jbGIWUIh4lM0Xxe6MhAsk2iEGEC8uwVjgwsGISQTy/bgttl7DTaEskA4gYKSseB31CreRVykSNQx+PnI/GEWvcKtzOa5Cg6RDOOm/En30XSAtQEkF6uUuZlDKg5l6dWnw/dIOX0e1jqpv7S93/PLz5ChwDqCJfH6fNX8vRWgP8dETjfItMTZEswTDzvdJ4qPht5OWeon5MKhQL3R+Sm3+dzRx3Yacajrlf+mzOXtxfIuhK9Pok9NCwe/9udwG9n84B21TuidnKDTDCwKwWbpUQYDoooMVFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 13:36:28 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8835.023; Fri, 13 Jun 2025
 13:36:28 +0000
Date: Fri, 13 Jun 2025 10:36:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, will@kernel.org, robin.murphy@arm.com,
	joro@8bytes.org, ddutile@redhat.com, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com, praan@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v1 04/12] iommufd: Use enum iommu_veventq_type for type
 in struct iommufd_veventq
Message-ID: <20250613133627.GC1174925@nvidia.com>
References: <cover.1749488870.git.nicolinc@nvidia.com>
 <d60d21de0ea6bcb6e0bb1afe624a9045b38c8ee8.1749488870.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d60d21de0ea6bcb6e0bb1afe624a9045b38c8ee8.1749488870.git.nicolinc@nvidia.com>
X-ClientProxiedBy: YT4PR01CA0210.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::13) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA1PR12MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d66ecde-27f8-46f2-e100-08ddaa7f4cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3af3NlV/Xx2tEu2ZYbms56F86ea3PeY3LY8ooVD+R6sD+iJ5hmkfEj/Ip+IO?=
 =?us-ascii?Q?JeA6zG3WbJa+Dm9obTJyHr4wvwIqXeFwdGz0U1pGQJL2szRoJWLnyxZLsRy6?=
 =?us-ascii?Q?yapgIVEGma9UwXBEZdeLNrX7WKwA5jXuZd9Ight7DpkRWy/KA5fq3MIg9s3C?=
 =?us-ascii?Q?sjmlpC3iz1/20PjPx2TAiItV7QpWyTOlEIFAM0OcEbiVHrFm2iOQRs66V4UA?=
 =?us-ascii?Q?6ZQVnnyEou1G5Ju1akrnnZoVkQFDTEovGqBUPQ3Oh+9N/loSJLepXN3J/+tY?=
 =?us-ascii?Q?hEB1IhDZ+O/mo2eZdDQuvnarJOwwnxvQ2U1fpjk1Np3DZjzdW0Y78h9w23QJ?=
 =?us-ascii?Q?//53S23CnPIUIpSHGIpPHh4WWUBI5joNsVXa4ruyWcb5kFbCuGuXKS2ACoLx?=
 =?us-ascii?Q?jx/9w8JVBIWQSnj9unbXeZYMM+MXfjM3TH7g6gV0KizVdhkUnJuPskKI/Xx8?=
 =?us-ascii?Q?HBdm4jML5boslIWgDa0X6FFQUakbb9cRscdTQqNWite159SioBABN+aLIrmA?=
 =?us-ascii?Q?uRFVRGNpuWBX8MN5NkomlEYDYJa54QqJxCUacTq6AJNbc/wQqAM8uQ/Jupcc?=
 =?us-ascii?Q?vWYaICBUoXjxZDGbIyRjDWAiaSU3L6DSTmSbMy3bCoER8raAuEg0jO99hhm4?=
 =?us-ascii?Q?kj4cc/nJjG+OjNxxzSFZ+35MfR1F+sbmeKWuWxFU22KIJlbNmRaVx8Fa2NG/?=
 =?us-ascii?Q?heykp4gHvV8Bbq1Z4TRI8xSgF+sLtksyodCpPIrJE+3Ae8+8+mnXE7tn+1vo?=
 =?us-ascii?Q?YU2s39iiGhOTFB1TCbKL8rwWu76EmGEDwXn8jKGxArV90S8rxcffz/IoJjgc?=
 =?us-ascii?Q?+StTubo6BYPey0pgXv0z+FaZTvNptz00e0IYFRbYvcqQ9b2/vVN8L3eGt03b?=
 =?us-ascii?Q?MtYcPysHmu5JSNqWep+Yti15Q1tVl5Riqx6ts+c3Ps+Le/m5ddrd52L7moGR?=
 =?us-ascii?Q?lXAq18rBEvFG9LENFLoJc8jen2hDNJl5aA5NFgWSZtRCpPwLoCgmJH6RCWtK?=
 =?us-ascii?Q?3CiLlIov/La96IcqJmEOwUF6Z+carQQzp+p7XzNARrMi1Cyk0aFqZXv59roS?=
 =?us-ascii?Q?tBfoUc6MNqTcWX41bGPnx7dtstLVfbbSrOAOnPbZdDQS/mE9J2RLmk/ZKNf8?=
 =?us-ascii?Q?ebKlX8A+hi4EL+NkU8ghU6WBXmTJvYfx9/pBe4qwzohPTS/k5OzEt/IVB2Lz?=
 =?us-ascii?Q?Ff60wxWqVpZX52fBv5iZ0cnWuGQH7+RK9XnQefzrOcNamCCW0dSKmaztGhiu?=
 =?us-ascii?Q?ha6EHWN619Tmt/DS9Vok3yKDiU0b5b7vjVDv86PEuto/Po370/kMhjdhXV6Y?=
 =?us-ascii?Q?iukPrzn4dM7xLbrEZUR20hdO7mpUPW2Jc73WjMEYxB5g2YcrCRvDd2HcYfpY?=
 =?us-ascii?Q?o2uY+6K/TUGQrELsxT7xjj5brmEOWCGPaejaQ5D17BEBKa1gAx59EzCDrXqw?=
 =?us-ascii?Q?AsH1A0rUpR0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WVvlHS50/ZXO/7NKf4JVwk7yE/GkblkfU5APydrz+iQHFUwpMPYGIfa+3GsZ?=
 =?us-ascii?Q?2YGNEaLsVWJz1zCS1kGxoiZB2V+ME5Jdn3FgFvFKwXG2gDGxjK7fCYOxGOv/?=
 =?us-ascii?Q?LYfGXB0S+aHl/PEp5NJagR3sDXCxmTFLvrtvVkxp5+2yFoh7f0ivIVxq6Mqe?=
 =?us-ascii?Q?2HZuzT/AkEVlGoH6QqjYUOR1//83xPMG4Xkb9VPTkxFnZ2PVBaXH1XDIW62H?=
 =?us-ascii?Q?Q+KPWawWjOuUW98C0a4EanOqWGPG6zK/BltGbRkWXjudNRN3dD5ysx6snI4q?=
 =?us-ascii?Q?OOgHw1qUqlklU6gf3uuWBE3/QpDMRpDXDe7Ia5GyV4HSHo+cDP6Wj1M3HixD?=
 =?us-ascii?Q?4C0nZCOhSzQYPuVdp6Berwx3JTol6/TmyqQJfz8lJhGIv9onGpE4fca/Liv9?=
 =?us-ascii?Q?UU/txj1V54PnVZB348ksGD3PYDhAtglzigzeaH6T2ohteYj+nvh96Ew7ZuIf?=
 =?us-ascii?Q?Yy9aZgWedXJ2BWn93n/har/4lzELCrArXHpwqFuRdIZG1w8UizqkGuWAI1uG?=
 =?us-ascii?Q?+v5M1dMdSjuLzi9MpqJFUJEzVCo7TCTN9G4rNUycdTj0QMuDu4OxpOxtv/7q?=
 =?us-ascii?Q?FfA30YxZI6hxsI8uGgP71Q9h3Pfh7xo7U9EC9kUanPyySiMhMkEelO0GzpJh?=
 =?us-ascii?Q?vLG4o5dQFSTOcvHb6aJkrYu/sccQnMEjrxSBcV3A0vUh3DBKj85KnzDIaivR?=
 =?us-ascii?Q?7g+AnDXS/aMF13C/9VXKGxU1uQUQfd3XaRJVJ0mEWOGHM4BhQAYDNUckE9b4?=
 =?us-ascii?Q?PmvuZjboHx8NO2tvZRep0ZEgsSlxtbpK1Ufsu4cuKdZFpA2qVoRVvB9+W2NK?=
 =?us-ascii?Q?yEms2Uo+0zqTx87QoABJMOKevrqA5qYnBCAKd3CE4iOqNJ1Nc4biV7R9YIof?=
 =?us-ascii?Q?b+nZg7/KkwjUYwsOldGL2nVQ88vGzU7qnK89ZXywUs4+bP18e1eAmNjY2B2u?=
 =?us-ascii?Q?rytjBHh2Vc5vrOzupXtiEHFDdXi/XR93Btr5lNnKAo0pulERSLHVE94irPok?=
 =?us-ascii?Q?IsWqt37FbSDOaSynK6yvP9eUmRsKYvam6sOdeU4Ymzl9Zh0+vZ6WnIDu4mOl?=
 =?us-ascii?Q?GzemJyE5FP7GV9gGPNxTEkDz2Bi84pBZN9aXMEQ9fhfoqNp0Bez+MinkpyIg?=
 =?us-ascii?Q?jNcekRoWiSM1ba1ySdDTSOOywTme7D6fmHNH9booVSOnPHarBxZNVfQbqe4s?=
 =?us-ascii?Q?Eo4D/leCPkegE07TKLLyLvn4QfOAFKlXNKd8+k8yp7ZcJ8c8F5Z3a9RVy+hS?=
 =?us-ascii?Q?8RgPOXRmqWTaWo4nlGl0t8A4Wr2r9SRHpZ5Uh4E0LH/N5PJNe7CZjvQ7fWxB?=
 =?us-ascii?Q?1QiiPCQekRsJooLEPsXB1hgGoBW9Q/Ck9RacICZ4C4bdEZEJijcXdbKtuLYb?=
 =?us-ascii?Q?Xf9ZU2IVvXHpeBGtOJ9eCLcylyl8MdO/aEDoQ7lM8iMHJUiiz3Z+KxEcmjeI?=
 =?us-ascii?Q?JdnUrN1tUiU9snsMJX/jGppUmOIh8iP9oNL7Z25erjuPiMZ2PHTrlRE0Ag8Y?=
 =?us-ascii?Q?hsQy5OFdHsmJ9XcOqwkiGunuocUaSqI+SbiWmwQonm/PjFVKxnxNopbeTxht?=
 =?us-ascii?Q?tj/LO3PUdUtJl8lpET9qEftF/CXl+5rtKXwgVJzq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d66ecde-27f8-46f2-e100-08ddaa7f4cbd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 13:36:28.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFV4aU0dJsnM7ypyozPZiKLTV9HOUU9qWTsm/HZWTIHv5vM2/ZLztE79f/72up89
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_063633_892561_B5899C3E 
X-CRM114-Status: UNSURE (   8.50  )
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

On Mon, Jun 09, 2025 at 10:13:27AM -0700, Nicolin Chen wrote:
> Replace unsigned init, to make it clear. No functional changes.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

