Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D7EC02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubF/gbwnxhF0YG2iCjGvMkPSPY2jfUoMjouIJewvoGU=; b=lDQN7D/mKeFtSSUO8GsThr5pEl
	yH3JXJtWqggpdAJEfeVRDw8KdGG7Fsoqf/uGvdPLXOgpsccpOvgo3lbz1SqcFxjnpRS0p6bm213FX
	X1KHUAlKpimmSd2rk8i/RjMBwfq4Qmlptd6bOn9IEbf0yfXOBUVhzwjbUOn8xff5/ddwVZYyMKKyB
	4aT1LoXcpCZGpkL4qhLOVb0lx1siYG1p3GIdAEgC43GaY8ktsCskH/6hleamT7NqWLYliY9Z18ut0
	g4J4lzfPHJ/fHLX4xuwhCxnR7SvjkesmVRx9SqQex7HCmCRw5fRH2gdZF0ugpECG+d5u3oT97u/xx
	sL8LM0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taVm5-00000009fn5-1Txw;
	Wed, 22 Jan 2025 08:07:45 +0000
Received: from mail-bn7nam10on2061e.outbound.protection.outlook.com ([2a01:111:f403:2009::61e] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taVkG-00000009fTb-0Ko5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 08:05:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ktll2yiSOX+xmv58QK602U/Reevso32AyekkCKjf/7tXZDixCSXyx6yXLSlUZVrEGX9syFCR48UhJQa22vFGB0AnvV5P+i4yzcBdmRSWdlK9r7AbYmComAp8baJuVKG8luykBx0ixgbKG2p9wVgrK+d32YTgZB+t05uqk+FsAvEfrFnKnJQ0g8ElHW4rsHwEyv0g3QBHTO6org/0tX2uUAU3Lbq+L77t4u9Yc8NOBtmudaY8a7t5i88OV4XZIrjoxxIdaNpx+jTKe+p8bkAteBViqgDZlV6IV6Gy5QoaVp0WmaLPwYkGas5owZl1MfPQVvRwPbv9JzPuCKSMJgCRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubF/gbwnxhF0YG2iCjGvMkPSPY2jfUoMjouIJewvoGU=;
 b=rf6pGt2S0LdMts5HchY7FOrvCv8GQjVv0hHS7y6Fb3Fgs4WY2Hkf/cqvQC8nckCY+aOj5lyr8LIyJKJeZOxyHd0sGs/N9AKaXmP6Ec81uTK34m67pGaYVL1qfDrzr7xxaajxAlfEn87ryeA4NZHzYSLauLL+t7AhgA8qxUJopXGJX20kydnqczpDAjkoc2a1Yd9mFtTeapOSlFB7OJupGOJx4rxwbrhVTDQVyrJgiXIAaJRqlznwPnqg5K83Nd4NZYjmFxlv17Wb3rJ1yRIa5AZNHYEnZmE6kOUh3CMpBF+SVqU+Eq26tv8jgOILGww/ADSBgn8xqPO+uzV2uD6wSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubF/gbwnxhF0YG2iCjGvMkPSPY2jfUoMjouIJewvoGU=;
 b=YaXdqCqMpWROJHqDSWKMLMmj3U/cLzXim8bSDQ8x1i1ndFZkHDXGgMwHTZ+Xi97V4fzohi5pcjGbt001bJvPpAx6/1ZboqUkyTZQDggbvOL89QLZM9OtEuDP0m/yhZyLz70/etk/D/9tiasjIUmwkgSv+2rG3vDFmjqfOEosxXFE+ZQhyTqVVsOKaaJIHN7bylNQ25Ax6WpMxbkckrSprhxmWiBB3pdooppr6if3lESu/0ipeek03Pjcq1JpChhdLwV3ri72CGkoO976fbdH+OljhEgPTgQtGNz2PJZdoH7l2cPTL29q52HbYD6i4HH/TIXSRIdUqvsQpnfm2f9YYw==
Received: from DM5PR07CA0090.namprd07.prod.outlook.com (2603:10b6:4:ae::19) by
 DS0PR12MB8788.namprd12.prod.outlook.com (2603:10b6:8:14f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.21; Wed, 22 Jan 2025 08:05:44 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:4:ae:cafe::ce) by DM5PR07CA0090.outlook.office365.com
 (2603:10b6:4:ae::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Wed,
 22 Jan 2025 08:05:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 08:05:44 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 22 Jan
 2025 00:05:25 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 22 Jan
 2025 00:05:25 -0800
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Wed, 22 Jan 2025 00:05:19 -0800
Date: Wed, 22 Jan 2025 00:05:17 -0800
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
Message-ID: <Z5Cmvfp4JW9vmMTP@nvidia.com>
References: <20250114134158.GC5556@nvidia.com>
 <Z4rVg1Xg5TCiFlSb@nvidia.com>
 <20250120181854.GQ5556@nvidia.com>
 <Z463eXfgNArCOfPn@nvidia.com>
 <20250121183611.GY5556@nvidia.com>
 <Z4/7pGx6F1mpAUuV@nvidia.com>
 <20250121200924.GZ5556@nvidia.com>
 <Z5ALWFVTOSC/8+ji@nvidia.com>
 <20250121211404.GB5556@nvidia.com>
 <Z5AUNVHzJPATVqAY@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z5AUNVHzJPATVqAY@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|DS0PR12MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb1e901-92ce-4dbe-7971-08dd3abb9267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8/6HX69zayoBH37fHzvDODjPfIcaAXKBUX9CWt4/woF5XQH4hYSF1ROmKONl?=
 =?us-ascii?Q?cViBPIX03teYOwnmZmRQmM4S01Ky65858Pn+1z28V85023IiyWyc1D0Zkmx6?=
 =?us-ascii?Q?uMbylKKDHl7/PgS/3v2lMzf2ugYc8N9aKXrJSjz7t8qGuCa9C4qsBPQfWMew?=
 =?us-ascii?Q?kRGrfscCYBZiwqAwQAoaB3yqNFf2Ne2+vTFkRhevMNkviVHnlImRBP0g8VsE?=
 =?us-ascii?Q?ca79vnXB+51CBixlndjmbzCUSMsGV2vv/DCplygRE12E9iys39v9p1NP3OW4?=
 =?us-ascii?Q?q3Z5FVF1r/unwdIAW08zNk/XoZUiiks0eXaLyjh3gZqap7NaWCVs+gVtRQym?=
 =?us-ascii?Q?OExKneVKB7pdiwZBguaY63BguHvcdQ1qAVs0kyjBaajGfFaeeTOKPBYByT3e?=
 =?us-ascii?Q?egVzaUgWl3epd6E1GFJTrFN0yJhYS0znrkBhV8CALWioF0IXBs+WYfqFFQSM?=
 =?us-ascii?Q?LHSriooLC8Es+mWqSfP3Pgp2ISDNtaY2k5a8/WXvTyW27J1usSoKew5wiwlf?=
 =?us-ascii?Q?AuXjqYk3R4cryKNjhfVb/FlVGTY5+fw9cwNBU1aoMR3vrfQ658ctNee31kSr?=
 =?us-ascii?Q?8/vRJ6wVgU7kCKTB1CmKKq9RleVhwi/lYfwo7sfQviEK7om7DGI7XnBQxOpj?=
 =?us-ascii?Q?U0+mbXA1PTRTLRsl84pZ6YO6EAQnSmysc+3AVavg0uLc4X8BbnSs2cSCpUkW?=
 =?us-ascii?Q?4wIYdkTX8Hh+9w+tT7vEd082m2x6MJsQOZd5r5NULDX5KAL1aLo3B7hHxAqA?=
 =?us-ascii?Q?I8ZpqgIrpDNFEW5stXYHdbfOo/Q/VsfsYL9PS13tdCKxfXAYrFT7LkIKX7xG?=
 =?us-ascii?Q?9bVCJwEHcqVd6ahxJhoA0mr6ATLpVE6C5Yj23iXF0r3gUddjDoPB0B11HJYK?=
 =?us-ascii?Q?bLHSnk1hsy9UcgluTxSSDZ9a7q9HLjAagfCPtQDfROlXHTIF9kmMh2N6HCIx?=
 =?us-ascii?Q?qIKGCr2jRId0EG+rUsqoyI9haWsAnWC+wcTZUQVCjnPh39UeQPSpU9Exbzxc?=
 =?us-ascii?Q?DRcYPe5xjRSsKwAgYDZZYEtTxVhOjG4YxrZNtT68C+eqTePYATqVDX+MsLc3?=
 =?us-ascii?Q?5WLwcV0SXvzo4hmfuIRaYuel4K9s/vYz471z9z3j1PsX4IPesEKGSQglOr0m?=
 =?us-ascii?Q?cttY/pOLlfQZTdAmoHMNC2oZcGRYUFngKtSzCB8Ytn5TZxAQIDNwUKaVZR5e?=
 =?us-ascii?Q?MYEkDlHHaLNp2dDE9+YfPFN6KpBibYUvsqDt3YIsuPcX//A+MTdeSekN863O?=
 =?us-ascii?Q?xtLyeXpgs2rANWB/q2cLBUdOWH5eIxk/XzIY+7j3lgwqgdcUd/yRFjtZsm5m?=
 =?us-ascii?Q?elJEqiMhyYBIGeJiEpk4tt/57GGWRDRkcqCtLs8aXqV6WffAYKWfPq4ReNrk?=
 =?us-ascii?Q?YJVfkzZVK7DYBxdAFmVtCKHtklZosdgTWCieuVhyizYL/FDGE2zsrqzs3WVg?=
 =?us-ascii?Q?pR3cZGvDFg4Xn1aMinNoj2E8xZnvGdrvIYZI6F90s7L7VIIAJqO276+bcKc/?=
 =?us-ascii?Q?Yv6TXu8IMEDvKzs=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 08:05:44.4466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb1e901-92ce-4dbe-7971-08dd3abb9267
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8788
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_000552_112334_A68EBDD9 
X-CRM114-Status: GOOD (  15.58  )
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

On Tue, Jan 21, 2025 at 01:40:13PM -0800, Nicolin Chen wrote:
> On Tue, Jan 21, 2025 at 05:14:04PM -0400, Jason Gunthorpe wrote:
> > Since we don't hold the spinlock the whole time there is a race where
> > we could pull the overflow off and then another entry could be pushed
> > while we do the copy_to_user.
> 
> I see. I'll be careful around that. I can imagine that one tricky
> thing can be to restore the overflow node back to the list when a
> copy_to_user fails..

Hmm, it gets trickier because the overflow node is a preallocated
single node per vEVENTQ. We must not only check list_empty for its
restore, but also protect the overflow->header.sequence from races
between atomic_inc and copy_to_user. However, we can't use a mutex
because copy_to_user might DOS...

A simple solution could be to just duplicate overflow nodes, each
of which contains a different sequence, like a regular vEVENT node.
This certainly changes the uAPI for read(). Though the duplication
of overflow nodes doesn't sound optimal, it's acceptable since the
duplicated nodes would have been regular vEVENT nodes if there was
no overflow (i.e. no extra overhead)?

Thanks
Nicolin

