Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BDCC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 06:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/QKo7ms+0ZEaLVaMxOVPl4yKoPNOAnbPsLMLvfKu10=; b=TVApCx3CehoEp8YxhHUD90YFxF
	QpntlXUo0VBWe+SkRETNgn5Wf6uWjL9SMqhnKfjqpyaMsUgExtkqLq2pX5PrsyEvuB6yc1IAsgFD/
	oduurwOplLL6fxoORP0ftc4e6/MvpM3UVo6e2PRmikRnab/scwa2PsknDkIoppodFeI1jW9NESfrk
	o0g3pweHlGGyDLpFvcjiK24Sa6YnXg3pu8XUUmd/mgAKMhk9D4GBJmt1lBEMcU4etZ38yfAmwqoaW
	PltJRG8G+2jQ2rAkF0LjbzTvT+EJb7/AnF3+licqiIFvgegCPS7gTEMXhOXLlO6WwnIJOU354xZLD
	3LxVDgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsNb-00000005v6A-1erK;
	Tue, 10 Jun 2025 06:22:39 +0000
Received: from mail-bn1nam02on20605.outbound.protection.outlook.com ([2a01:111:f403:2407::605] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsLR-00000005usl-21c4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 06:20:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwBVHxgCnrIEROTVCgyD/4Sp9ASPcIUWBuslCyztrp7GdcOrp8ZnkfEgJBQjETklpj7JyZlTJymo5t4JjCrxUsxgAlqTai3HVn3heIGdZ8HjzjKhaNEgWoOEeTBcQoE5l9Ar2xvbpTBg4RV57vR1czdea5v/EFLuOdkxKgnaqjF2Bsh9jTHnFNpBA9mmBg8jUjlKS193DWwm0hm7ithuw9QEmMzeyd39xBOUZVHOXJTIxFNeeVIvar1grBpNqsua5rd939x3xauxF0nSQqHoVXH+jOg22fSkHetSJIb5ec5skOVhEvUhcVJxi6dDERdHbHWdPmylp2LEuFpHVtZBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/QKo7ms+0ZEaLVaMxOVPl4yKoPNOAnbPsLMLvfKu10=;
 b=BmcF4pjQBpV79+k3RMgJ7tH03feRVxJ58CtEX5gDk/WCoCGp6JKLNKnzFg1mOc6m0RKWSb7p56oQViM9w4sh5wrwJbwQT0nOiB4APuh58aFGEFR/Cid6Ysh/GJxq4WTT5+OAO/eqT1uPnvn1K4sO4NNLg6wg+96yyB+oK9k5de7Iwz5Hya29pMUkl8S5JVCCmv5Li0JQ2kaacLSYTxxQUHjNtD56SAImBZK83fHPh2FqJz/5DRgCJQCXnIed9PQDWY0hQ0OuP0QNF89Xbl44KWy6nYo1cUGfGm81ZPytpx3gm6i0OEjmAKbxZ2tInr0MLhpTTqT4JFT/UxWY44MqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/QKo7ms+0ZEaLVaMxOVPl4yKoPNOAnbPsLMLvfKu10=;
 b=J/EUAoB1vq1XLl6xZb4CcVTjhpdQvqHTOlaLP+MdibPEKIS0tYk5MTEKu/SOaKl0N2C/OFNVL5rNb3Y5PLjBGSxyjWkNoQiPSvzgeJZoDrwTzTpKKXndPlbifOCWSv1nQxNmxHqCQ2K2UUJfOC/kam5DFc4B5/VEwZliZDVPHZVUixVsTm9fWm3R1rV41wAcgugQbZu9Xp3ovAIO6h5XQP1z6nX8lAKgq57kH+sIBFfQBqrV6HJIG6uhZs1KdKYVw3AWC+dBrlbeShpc/dVh/xL2ue39RWmtKzARLxmohDN8D9VE/kgcqAizJSS9lzj8fSekkHcpuB4DEQcp4j4DuQ==
Received: from DS7PR03CA0330.namprd03.prod.outlook.com (2603:10b6:8:2b::22) by
 PH7PR12MB9068.namprd12.prod.outlook.com (2603:10b6:510:1f4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.40; Tue, 10 Jun 2025 06:20:18 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::2f) by DS7PR03CA0330.outlook.office365.com
 (2603:10b6:8:2b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 10 Jun 2025 06:20:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 06:20:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Jun 2025
 23:20:04 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 9 Jun
 2025 23:20:04 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 9 Jun 2025 23:20:01 -0700
Date: Mon, 9 Jun 2025 23:19:58 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
CC: <jgg@nvidia.com>, <kevin.tian@intel.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <joro@8bytes.org>, <ddutile@redhat.com>,
	<yi.l.liu@intel.com>, <peterz@infradead.org>, <jsnitsel@redhat.com>,
	<praan@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH v1 08/12] iommufd/viommu: Replace ops->viommu_alloc with
 ops->viommu_init
Message-ID: <aEfOjnj7xGPbfYD4@nvidia.com>
References: <cover.1749488870.git.nicolinc@nvidia.com>
 <5586990446e4c97827b5a195622ec0f8cf9d2d67.1749488870.git.nicolinc@nvidia.com>
 <663c7eee-5a3a-48e5-8bed-8abad62f3484@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <663c7eee-5a3a-48e5-8bed-8abad62f3484@linux.intel.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|PH7PR12MB9068:EE_
X-MS-Office365-Filtering-Correlation-Id: d2aba6d6-4853-473c-e546-08dda7e6deaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?++TmxCCy4QnhtLAbpTJMPOAiLF8Dusk5AYvI8VRHZTB0WgK9Ysj1tcQwTnrV?=
 =?us-ascii?Q?AEiX+F1Ap1rs4zvZDC/UuNUrhfKTJoA3zsZ4Y0c/KVVFZhSA3AX+8fgD4xpG?=
 =?us-ascii?Q?QEwwI82XEWzPb4mTAqGQkji3A81FczDM98LTjx0/UrosneBsLWbYg/fhJpGp?=
 =?us-ascii?Q?Vz8WcTrPVR8OVDJMdcWXfggwpyBjWLUFtXFwu0uhB+5hLij1OKGD9L4sNC09?=
 =?us-ascii?Q?HRnA6NoKNfNFMHdoF9EBelVZ6Z+LKhD9L48bBCtbAWafU4jcmrBLJsCSbxJZ?=
 =?us-ascii?Q?VXmuz6NZ2kJdxDTfJL2nJLUA9ijdoaXXV8G5KW0abVVZ2d7+7pRCumj1bKha?=
 =?us-ascii?Q?Tj/3U4QWi9PBAr3/ROo5hWSBe//sN++Wgu5D0AcGr//XVD76hXhIKQG+lfEw?=
 =?us-ascii?Q?9PkVpHk8cCFfNYbXdYpZ0uyVss3SoPebzclQYkyHC2bhqBgg1teaJZxIQism?=
 =?us-ascii?Q?srCLj9AWbd3TMjTqQyPoy97AZCLp6uRXSrDFZDXCVkSjgc0Q/WFdFX24Qa4D?=
 =?us-ascii?Q?2/YLQFNnhz++C88NIGgkQwIAl2IXOK/xwvjhHX/n44kaity1bitbGgblzC1D?=
 =?us-ascii?Q?9tdAIlQ9fjscjrkb/yNq9nvZ9FAVDJ4bdFXCSUW/1iOzVaTv3assrLu4HuqV?=
 =?us-ascii?Q?ORBFwxtooNI6NDvo/KhvA1tyXYmZGD92iTdNk10VX9++uFauiC5Ln4LFIGwq?=
 =?us-ascii?Q?bF4taAWVv9Dy0E0lfxaX9yDIecDEa3P68YnpjsPjoZey4/mKO1sUkrr07MiW?=
 =?us-ascii?Q?dhxv0CHZUthpvJ3BnaE6qJrpXcLgsJ1z5MpUgMAU37mcZcH5a2C8GteU0lIY?=
 =?us-ascii?Q?RsEPrrQajJGccIuPmQwZpTwIVRDs5/oiYErFsyTebMxJfFoy+mpjO9qn/qSl?=
 =?us-ascii?Q?4PUk/HsHOD1Umg0hOcv/oJj+377luP6Yk+KDFtVysduEvjtffvjkQwODzOz4?=
 =?us-ascii?Q?LkwMqE8X9Yf09eotSNOs2CGVMlWbRArcgU4c4ZovsbVAy881PdJ5+ziqo8b6?=
 =?us-ascii?Q?EUCaacXtjSpBWAH452KdiWwLrRoos58MkHway8VNrKAe3GrhQHFpNMqTIlQT?=
 =?us-ascii?Q?XMq+FzfJmDYrMoluw337vJymutl372oN8xiQJGl0CCZJub/qhTdi1nrreb5Y?=
 =?us-ascii?Q?MnWvKKpBEx/r9mPhzG+UMPv7ABEF4Il75bV3+/+Y5FMfOAiAXM1P6c6XZ7TH?=
 =?us-ascii?Q?jL8t5DKIz7kBcD6KUl3iMLBbadgOlq5ZHmxPJ9Em5OJ2/dotT0H2ocXCcMar?=
 =?us-ascii?Q?5YjrL4fMWASBNI4FtBwpdSGiXNF0DvaLM11+jtRhf8/kVlrMnsIMlMlALO86?=
 =?us-ascii?Q?06VDgmiUAsS7MqoJhaANXmfz7HC46uLL3t0lgbEzyKhirBOxOas3LCARzg2q?=
 =?us-ascii?Q?2fTQy2wxnCABtPpaFyhgpZQxyxSsFxfhhwSRdy0gfh8kLNcSPFg2eH86M8eQ?=
 =?us-ascii?Q?PiNc9CfmIWOMrxwv0Ypb1PyAhrDgnZ0a3lNUlIXBsZJGwFykJdGkKltoXd0S?=
 =?us-ascii?Q?jvpM09l2prYf26VJZA/YO9n+V3jMDiroGwc8?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 06:20:17.5281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2aba6d6-4853-473c-e546-08dda7e6deaa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_232025_528432_107FF195 
X-CRM114-Status: GOOD (  13.65  )
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

On Tue, Jun 10, 2025 at 01:55:05PM +0800, Baolu Lu wrote:
> On 6/10/25 01:13, Nicolin Chen wrote:
> > To ease the for-driver iommufd APIs, get_viommu_size and viommu_init ops
> > are introduced. Now, those existing vIOMMU supported drivers implemented
> > these two ops too.
> > 
> > Relace the ops->viommu_alloc call with the two new ones.
> > 
> > Note that this will fail a !viommu->ops case from now on, since a vIOMMU
> > is expected to support alloc_domain_nested at least.
> 
> Does this mean that the viommu implementation in the iommu driver is
> required to implement alloc_domain_nested? I suppose viommu should soon
> be extended to support TEE/IO.

It's a good point that CCA might not need a nested domain. So,
it's inaccurate to say that, although I suspect that CCA would
need some other viommu op then the check here would be sane.

With that being said, it's probably not worth adding that until
we are 100% sure that no case will work with a !viommu->ops, so
let's drop this new rejection, since we haven't had it so far.

Thanks
Nicolin

