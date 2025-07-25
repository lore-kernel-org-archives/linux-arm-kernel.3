Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4074AC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXuJBt8uESMxPtma12oy3ryy0D/QoFBH9o+obC74e1E=; b=V50tzIwvOlHrUE8Mdn9gsctzc6
	85/7pUg/rdIWLn1IkEWnxmikrWeEeNBufMZUXrS/+07RRlDSRzfXoIqx275eta7m0jgZlmsrGHOyK
	yFKifxjxPxh61E8u+zvJJBkwBKIB1DxrYWgq1Ke48I8Zo6vqX7kbNcuA6IPnIOBCy8E63fBfcWlKm
	LOPv0VHMfM4zmXUIPZE08aHTOR6OUBh/Qxg7AAu3icHmb6hVcCgWCY9qOptcxgIQ8LtodNcfAHt0L
	iGhDJXHF/kcnzgtydpK+YjVD63KWIkmEgdqeHz2/0BM3qAPKJr2UpiiLfULa6Yq8pF9Gx08PyMHhx
	/jQRHDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufL4j-0000000ABqx-0Nen;
	Fri, 25 Jul 2025 16:15:13 +0000
Received: from mail-bn8nam11on20629.outbound.protection.outlook.com ([2a01:111:f403:2414::629] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKu3-0000000AAmY-3a8B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 16:04:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgWNVlbRk9YidnlCROEc43djdo43jVDcDYO9J4y6XPb6qWYGgRIPrr4z+a7n1uECPgW3eKNXA7mWUXju9k75vxy/vgewySMQ3K8e0DxmU7FZ2It5jjHUau/ztjs0ZVZFaPuEoz/H9fWiaE/yCkQM81NlVPfC+ezivIz4ZNZ98s8221WHKnfNB7jN5wZWySjOE1LY/FQvReUdkFN8DoHG3KJojg+aZqfAiM6g+3T9QfYdHWGr4V9zdBJIbQyZF9zpayhigTAY1a7vLiw4k8753m48bcPSCD0OS+cukp7HlYFeFUSZBs5nYSkNAESi9mItJYhCgGupqVavrwHzapapMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXuJBt8uESMxPtma12oy3ryy0D/QoFBH9o+obC74e1E=;
 b=YDmJpPjztS9j0FhzYpJU26Ueb6kTm51+qCwGSUkjOqEhiyVWb/F4gRbLgeoF76Mt2oiAJ7WuzV/ovXXMHDp1+cX65sXpjSLhCb9p8DS2vqNNt2MqGNax4n1ZyD4P7EaAv5NSLMiqqPoDhUbd3HQTLR58lPE+MM4Tz3NofTi1mvISkh8KvqDAyeOAYU6sXudSXYerii9KiJUfkowCzui4oU8FMXsFNqoyeVCNBXf8o94yXxuCBcDn/SBoGYDNeVp3KHHOrV+gD5FnASlfK6Ywc6hUFRthmfs/IfRh97K7cpfSDWJkCwnjRgaPSRVTAZJzLqiUCvu3KPCtrQrqDjfyCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXuJBt8uESMxPtma12oy3ryy0D/QoFBH9o+obC74e1E=;
 b=DOitb12fdwa9Z+Xx7LRMj6gipvVHwy3e/n80yQm/xitOxcFSAVBnXd/wkdxTTaGalBdIcZykq9Kkrz/OkRFBMzeACkyl1e30RSN18WF2PjRbKP25UesPp2MpbmjeMbhkGGGNQns+Lz5RHtLH5Vssezgv25k3WK8kf/rRSZY6xWXyXG59dpeLF1wHCH2GGoAEA6Cm6kbEyaeH4UWK/aJlevFOxDHCmhQc2yguDa4ycwvdA3N1Rs033pFeoFSGNUb37wKuyhNkN1p4k/Mef4yXKL0OOPEp89pDOnYYVGSB6mFgKbpud/krXmsByWxD5Xwv+M8o9g2wC1KP6p9RcNevXw==
Received: from BL1P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::27)
 by IA1PR12MB8310.namprd12.prod.outlook.com (2603:10b6:208:3ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 16:04:04 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::ca) by BL1P222CA0022.outlook.office365.com
 (2603:10b6:208:2c7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.24 via Frontend Transport; Fri,
 25 Jul 2025 16:04:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 16:04:03 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 25 Jul
 2025 09:03:41 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 25 Jul
 2025 09:03:41 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 25 Jul 2025 09:03:40 -0700
Date: Fri, 25 Jul 2025 09:03:39 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <jgg@nvidia.com>, <will@kernel.org>, <joro@8bytes.org>,
	<robin.murphy@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIOq2ysFPfZsNUix@Asurada-Nvidia>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
 <aIKd1owebUNQeN1-@google.com>
 <aIKqaGMMpsIuAVab@Asurada-Nvidia>
 <aIMR6xxR3Jdpy8kX@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aIMR6xxR3Jdpy8kX@google.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|IA1PR12MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: b00a2cb5-0501-4c5c-b677-08ddcb94e038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tym/+y54IxzZ3gRwPP192A/sbKKZNPEeU25WIqr6/myEp3XQKbC0kUac0Lob?=
 =?us-ascii?Q?RWHPjPmBekPmVuwv3884IBN7P+VPuOvuyibj67S4JIB855RCMuW4HgI7Nal3?=
 =?us-ascii?Q?ZRSwNjNZcFGf8FnY/bYn/ScKlRTWn7Y+O0bd8QbfI0tHVoyiaUGMvwgCsGEa?=
 =?us-ascii?Q?kLSNrUHo/en/mgfDE4nRij7giHPdpBy2puPRVrrbFhxvSbpB6FpecvmbdS3K?=
 =?us-ascii?Q?aTU9tjvRoKIlRMT2IYw6NrOPjqx+1iDx/ZA/QMm6pukiB4LWVc7YDCcSus/S?=
 =?us-ascii?Q?8orYNZgdj39UZJtp4egDyGfHXRMmdNkD+ZAhRO+tk2P5ut+cuEYiXY5gtFBr?=
 =?us-ascii?Q?j97TaXl5sSAoIiyVQ/hfbkFrE65uCsbEtFI0LhjHUe6W8Nrupa7u1YeDFEJj?=
 =?us-ascii?Q?9JiSLt3KpYE1jZN0ofm/TXX8THkOddBebsw0IDbBHhhfVfC5BfB7Vin57cOg?=
 =?us-ascii?Q?HhnxkmWunsFB3YHuOVKncRYp0D9r7EHkrEA0jrLG4lxKyxNZe9yYXyQXay5y?=
 =?us-ascii?Q?/vQGHZaBNcAGEevolU/pg0DzvRe31MBfLcBV/oDrREUPnAdTpcOHxaagCa3n?=
 =?us-ascii?Q?vDVfzKky9dLnqb45dujbvxlGqrjSeIEIPFZfY9ydso/tSXV1rU+6xsAkQTj0?=
 =?us-ascii?Q?il6VWclPZ5GuWGoJIc2Pg2EbFf2lCJmKTsTxxtx6mmvIPpqBwWHKIuscLzKh?=
 =?us-ascii?Q?/glQbG5ve4PFkDwaP9DQa3ouG0CRMqsoyb6xIwNNSlqTjUW0aWx9OnX0rvgl?=
 =?us-ascii?Q?l/ejyRtlm2eGZ7tzPsMEgKVETNeaXkXdVV2P88TN8dyjdcZAXNHbKKP2m2A8?=
 =?us-ascii?Q?jkMgq8oxk+1cGYNTePh3A/b+u8aWbD7WNuNlMIqiYKoA9tesPyQO6xG2+KNF?=
 =?us-ascii?Q?3hXP4901fFaTa5BaUkz5T0QPhlEstK+e9XcKkhAp6/lQFY4u248/OGlvAndY?=
 =?us-ascii?Q?Djjpp6XsJba4D+q0igMWeQVTLkEtgUbJxnnmwpSJpJg+Vor4NBPmHBOvB49N?=
 =?us-ascii?Q?EJ5i5tCnpo6NG+J4AqDA+JV1CcaMxbqbCtLSvkMzJFl+8/RHaBJ2nyig7hUU?=
 =?us-ascii?Q?11Jk6fW46FF7PzsuT6mfFpr1NnAxN+01nPtak0APrkPGs7pZwCsvBiuztWCv?=
 =?us-ascii?Q?h4c1kA954C2BfjiNt8galkLDTXKVJVQ8vzk6A4WdIH+7WVhJCjtSkGZCmsqS?=
 =?us-ascii?Q?8JGTvqsYRTMyEJ9Eiwj17iPx13Y7uaDFg7xiKHRSRcIcHZprR0pPzTjAUy33?=
 =?us-ascii?Q?Ez8SQ/nnfi0/UBHqUvPRD3G8Ufkl2pzX2VkCZxcU/QMIXxYOf2Sn5+KNfkXl?=
 =?us-ascii?Q?/ePBDHGnxq3KUZ+BLkTj9XcAlrKfDvFqrI/kwRK3qplQNAfJ1v1x9x94C+Fw?=
 =?us-ascii?Q?9QwfeD3qugeZLkRKDHx01q0jpDdEHCGxFXghH08wrUbmCcP9s0K4MwKw+0lK?=
 =?us-ascii?Q?TXoyoG7ekAwFOnY/6s95YyJEuKYKriG/oN4WUAClxcMqZl/mGDjQXY5yfkJp?=
 =?us-ascii?Q?aEWKNnqmOS+vWeRwy6mNo0rv4FIOgPmU6Lzl?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 16:04:03.2095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b00a2cb5-0501-4c5c-b677-08ddcb94e038
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8310
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_090411_912740_FAF44A2E 
X-CRM114-Status: GOOD (  14.11  )
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

On Fri, Jul 25, 2025 at 05:11:07AM +0000, Pranjal Shrivastava wrote:
> On Thu, Jul 24, 2025 at 02:49:28PM -0700, Nicolin Chen wrote:
> I'm agreeing with all of it, it's just that the comment says something 
> was rejected in by the size op, which raises confusion as to why we're
> in the init op. The init op rejecting something due to data corruption
> is a different thing..
> 
> I totally get the point about data corruption, i.e.:
> 
> size op -> returned something valid
> <data corruption>
> init op -> rejecting corrupted type
> 
> Wheras I was just trying to understand a case where as per the comment:
> "Unsupported type was rejected in tegra241_cmdqv_get_vintf_size()", 
> i.e. ->size op returned 0, yet we ended up calling the init op

Is the updated one in v4 fine to you?

/*
 * Unsupported type should be rejected by tegra241_cmdqv_get_vintf_size.
 * Seeing one here indicates a kernel bug or some data corruption.
 */

Nicolin

