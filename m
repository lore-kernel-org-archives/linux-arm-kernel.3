Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5868EC7114B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L56glez7YpRSnyUsx0iCxmoOl3Qf+G7aaHhaGhcFEx0=; b=ze+8NYEC0RHj+EMRKzBc4npPVx
	1vd7XG3TwSmEjm/ZgNA6mOHxbsoPgiKhpo7Grl6tVCT3olE+15BbE64GR6kz59KFz1WVhYv1Ta3/q
	TDh5S+XKS6OZNr84e95k/ZIOv09Dvkq7U9ENFxqXvuwL+bK7Yb+TC7QGaWdXXlD+IcTxrxprVKa7l
	s75RRvq1C27fyuSfXP/bxCCePJf62ABou6/A2RiS1vBOg462g2PECHguHLtWuHLV0LBYYetRambcZ
	MNwKMMMMYFPy3kzVBjsJ2tAlBXn9SF8qAtUwA13NtfhdEC2d4OU532xB5TLELh7/3oKPf3vlQ3DqN
	5UtrR4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPntO-0000000ENZE-2IjR;
	Thu, 12 Jun 2025 19:47:18 +0000
Received: from mail-dm3nam02on2060d.outbound.protection.outlook.com ([2a01:111:f403:2405::60d] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPlqk-0000000E2sq-1RNB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 17:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVN44WFf6UyC6+FGyD7uGNAYmc0KwMpVZkL7Q/BHxe96qFVr0mtLUOcsOjwk5h6UsqfZvgs7U++J9Lfp4EAt2Nmq2j+IWVAngIvF0Qs36K+rz7wQXZDzWFtWl0ROM50queoR9Wk3au/yA8umQ7PEX6b5+7KTkKUvnidA2G0fPT0Sp0sRihjU2yGoNMBn6OObZOkWoCGZFDHs90t7vSKe4KVWlmuWuYc2ROWp+wVvJ28zbzH6b0bi+Gx7jsVanFWfje4n8++yeCtVmPo0fhzI/AW7r5DHw13YfO/uYZDPzkVg6hDhJKzuZYholOKKd6sd+W7YKEX4a4XrfzPtrzDwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L56glez7YpRSnyUsx0iCxmoOl3Qf+G7aaHhaGhcFEx0=;
 b=DdAR3OckuVBv9nJhY/rZLheZYNhSvpFbYsgYxMBkB81vXZnotxovHo0YHQXW2HLocARV9KH0nA/Qb+iUVBw6e6euYxbbj086V/jpRbNBdTjPzntSoJF+E1O+g1ed6hIuFHRq8ysC3dsKBgoRAf9lI0GykL+5R6jwrbRmJvjamZal3PI61L6q+PGiAVYOOSZNYhZj7AU9dAAhRZuqn+6gzm5azIvlhJjFE+Xq0xcC75WfNM68beVDycun/aLrwrVbNU5YX138BQWG5MROlf9kHOJRgMuNND1OQjj27e2kk0OBuKzWcLaganM/Fq+hWBZdE9aGQvstyQCgQLeR/I/clg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L56glez7YpRSnyUsx0iCxmoOl3Qf+G7aaHhaGhcFEx0=;
 b=aERXx7+uHb8TWtJxHKgX/QZ1UEuo0JlWauPaviZ+NgqExjXbXN1MGPTbAgJWiSeZDcUE8aVIg4oyco2i8ZQU58M266UKaxrwo7er8kosnB4xhWfBQkUp3lclXuGRPogUamQXuADw0CiSVSUbwPgnoJ0DY88fhlNQ+f+Mt8CW/6VlkIbe/yREvYWPioJpGicS8Awro1EljKP+Hh8meKCy/c8xrlN/+lXqcR1CwLLrAccdHD9HELCqIdFGs0l7YniIB2V8jgGJqsq8Q6HQhGhN7922GDAtThnrkiIuO1nFu7Catq1F+aOWA/E5/HsKo4CZ5YSX0wWXcB7FUurG48i4xA==
Received: from MN2PR15CA0034.namprd15.prod.outlook.com (2603:10b6:208:1b4::47)
 by PH7PR12MB6562.namprd12.prod.outlook.com (2603:10b6:510:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Thu, 12 Jun
 2025 17:35:47 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:1b4:cafe::78) by MN2PR15CA0034.outlook.office365.com
 (2603:10b6:208:1b4::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 12 Jun 2025 17:35:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 17:35:46 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 12 Jun
 2025 10:35:32 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 12 Jun
 2025 10:35:31 -0700
Received: from nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Thu, 12 Jun 2025 10:35:28 -0700
Date: Thu, 12 Jun 2025 10:35:26 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: Baolu Lu <baolu.lu@linux.intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"ddutile@redhat.com" <ddutile@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "jsnitsel@redhat.com"
	<jsnitsel@redhat.com>, "praan@google.com" <praan@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: Re: [PATCH v1 08/12] iommufd/viommu: Replace ops->viommu_alloc with
 ops->viommu_init
Message-ID: <aEsP3odkscXw8l5/@nvidia.com>
References: <cover.1749488870.git.nicolinc@nvidia.com>
 <5586990446e4c97827b5a195622ec0f8cf9d2d67.1749488870.git.nicolinc@nvidia.com>
 <663c7eee-5a3a-48e5-8bed-8abad62f3484@linux.intel.com>
 <aEfOjnj7xGPbfYD4@nvidia.com>
 <BN9PR11MB5276CC4AFEA8DFE315BD51C08C74A@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276CC4AFEA8DFE315BD51C08C74A@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|PH7PR12MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cac4c95-cd97-4f89-2397-08dda9d790de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QFpMagq+PBFUoDGn4rCfSBfCqSBCAFld1gApoVwY/kgP79UZff2xvdTBwrah?=
 =?us-ascii?Q?HTWfmF/CJXaXg68HqOrrpzmAZHp2ofrJKSGIcpqgYeIrHnX0j73JbPvlqjE1?=
 =?us-ascii?Q?AqVrdfMZERxjo9/lNYMiwnHHicHC8ZgLFI1gO2Z35Ccd8OsR/siZbziBJAxC?=
 =?us-ascii?Q?d4+1ksY/lvicEdJikHP8jaaSUE5bLDCsa9OQFah7TzKJh9BVsHsKOOWHHxMM?=
 =?us-ascii?Q?4fmT6mvKl/c8v1shahhHCg8rjK8N7rGipBel46BozyKVV/8ClAD334jTs6PN?=
 =?us-ascii?Q?dyQUe/HUQp71geo1nnETSAyDlGjBn4SXqKJf87tw6pcWNewS5gYaEOSzckvZ?=
 =?us-ascii?Q?041n572xcu99WCAWqe9EvQwBbVFKCZs+8QzB4crhXaJ2HdtlP59O+DfWd+dM?=
 =?us-ascii?Q?2WBHUtiww08cjOyhkNrdAznBtqZyEPoGHub02Y8xs39mBxGm2WHKvGjXJEMd?=
 =?us-ascii?Q?lV7anI1cczXimQrOpnlDfMjFDGMHmTZuZ5HFgx+GWfL+mhTKp3t8BtUqltuR?=
 =?us-ascii?Q?5jxh56UVPl6vYAFu/bg1Q8aXcqFa7+tI6bnVC03rHE37q7llF46ZzoCJQ7GF?=
 =?us-ascii?Q?EDYFFALjqrCI1DDQN3wPvHvei2MZcloDNJqo/dsyz/yjaJA1o5Z2IyNKKVSF?=
 =?us-ascii?Q?0LuQJ1ces1g41RUTKwLqW4TXv5F+gasRREVUuugVAkjjzzim/jXXTt3klRv8?=
 =?us-ascii?Q?cKkcyXIMIUFGbC04vh+0P/7s0xvWx2XnuDX8FaRU/2mXe6OvAan3qC712uWf?=
 =?us-ascii?Q?LJh36BpekIYyCayMFV6Sa1lmop4AFG3+jlYVuMl4X2OTsfEnQpsIUB/YiF7u?=
 =?us-ascii?Q?LmT30MAWpNLgXc5d2Q+owFMbFRpvkg3KsDPXM++Rq3X9/ZNbMomwNWsasrQ0?=
 =?us-ascii?Q?ocPlHgSTTSmHThbKaxcdmM6LGRYqyZSrE59df4fDy95PwQIh551fXPl6odRy?=
 =?us-ascii?Q?MFsjyZQPP/3iB7/DuuUbEug3S8QFPJI1FiMc1Bv1EYDnB9r75I/2xE8TUL8H?=
 =?us-ascii?Q?PD4C4bXeakjoFlKJ4aXXCdUREI84eRpG4QH8+ZF+r67ggStw6c1NlK2kuJgX?=
 =?us-ascii?Q?sYTVo+dpUswjoQOpfpFptGMJXLhNNKPxrG50ORg3ehUt7Mgy68LQ8ccT9iu7?=
 =?us-ascii?Q?My62baeyUXqzc6YDbi19Y9eS4JIA+2s0g2S2HsxOyeVhGF1luGNNMWBmfei5?=
 =?us-ascii?Q?ar86vFsNMW7uVIpAv/dmGh6QzqTeIQs2xVzMBTtnKQ/URPc8bx7tlEeU+vRA?=
 =?us-ascii?Q?GH0EDWD6IuQWMzwDSc3cfWD7vw97KxtMx46DekBNfZ7k7Y/UQA1u+ahIpDNt?=
 =?us-ascii?Q?YFcWNYrZE4/bonUE8SIGYUIPG+9bEgMpsfkbnKv7ruT/J3A6sKFL+Il5Sd0P?=
 =?us-ascii?Q?kty05fVmdLve/Ku7TKLgxMjsMN3XqztPX7QtdXbLCsQsUKZb2EHNKq139sxw?=
 =?us-ascii?Q?dl4vjlv237srqebnnTjLAHoFm/Wcm8ktNH+5ywQHHdi8RDBHCbtfHxJiOMKb?=
 =?us-ascii?Q?q7nlBBN3MF3kTbiPVHtySIZUihBXyIjWxa1u?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 17:35:46.8083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cac4c95-cd97-4f89-2397-08dda9d790de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6562
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_103626_390673_BCBB026D 
X-CRM114-Status: GOOD (  23.67  )
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

On Thu, Jun 12, 2025 at 08:22:49AM +0000, Tian, Kevin wrote:
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: Tuesday, June 10, 2025 2:20 PM
> > 
> > On Tue, Jun 10, 2025 at 01:55:05PM +0800, Baolu Lu wrote:
> > > On 6/10/25 01:13, Nicolin Chen wrote:
> > > > To ease the for-driver iommufd APIs, get_viommu_size and viommu_init
> > ops
> > > > are introduced. Now, those existing vIOMMU supported drivers
> > implemented
> > > > these two ops too.
> > > >
> > > > Relace the ops->viommu_alloc call with the two new ones.
> > > >
> > > > Note that this will fail a !viommu->ops case from now on, since a
> > vIOMMU
> > > > is expected to support alloc_domain_nested at least.
> > >
> > > Does this mean that the viommu implementation in the iommu driver is
> > > required to implement alloc_domain_nested? I suppose viommu should
> > soon
> > > be extended to support TEE/IO.
> > 
> > It's a good point that CCA might not need a nested domain. So,
> > it's inaccurate to say that, although I suspect that CCA would
> > need some other viommu op then the check here would be sane.
> > 
> > With that being said, it's probably not worth adding that until
> > we are 100% sure that no case will work with a !viommu->ops, so
> > let's drop this new rejection, since we haven't had it so far.
> > 
> 
> WARN_ON_ONCE() is built on the current context, not the future
> usage. So I'd prefer to keeping it until there is a real need to revert.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Okay. And I can make the commit message clearer.

Thanks
Nicolin

