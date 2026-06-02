Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4BACD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 21:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VrRhDMs//pfjWvMtl0p6S2y/Xfy899r0rDeBGPgNOs=; b=t1aq8gQf7d9GNcoUfQI6mwr+99
	WL2jb8G+f2zM2j92LJwEpBPa0apL3iMsZDi4sp+jtngMEOWUh5RqbFYe68kRUUmDdHBi7NLMuJ7k3
	8wShwfZimHFjl77DMFmt0IUi3CPqw+FJiKH8PNek3HI42QQerQbQD2xJJbDVUuOLve07Qqz7oTHAQ
	tQfT/eaqjq6ISa9EbShV+XTAIykW24IKL/MNl+i6ouTllCpeRgoXit421gvjav6eBq6Ulh90BOdLF
	7wcgjA5QjRujN7qfeKSluf2CqJ0KLisKemHPT5xtf5Ukx8M9mAXPa98/SPV6iBU0X7UFSuA1xCU2n
	W/e4Hw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWKY-0000000DniW-1Tqm;
	Tue, 02 Jun 2026 21:07:22 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWKV-0000000DniA-1FUb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 21:07:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWBvZO5wfRH/6Ntt/P7B2iudd5WI/GQpsu8czv6Nn6RXZ9nsoxL+5ML2tJtZ8C43D6AGwBMq0mDQi2xSoFJBP4yNewif7i4fBeL1orY0fF72RhsQNfiu4L1wtpGvRt+W8zUVD+ZDukHx8LKKmBhXk+Nnb1UXDTdGgjo3Jdi0vSng8rfjejdO7/KlKijamKkU+tMymUEoQEn1DppqIvcVcOq+EyU8Xj1ABcPFGgxlCweYcAitYTo08e/XQBWSY8olqIvPSFQmc7TOsb8aGC7jKZ1zh6wtnxiABZnXCALxPQ9OVjzRSLMjI0aL++HqIMyE69UiXZ2ICpXRdqlaJrE3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VrRhDMs//pfjWvMtl0p6S2y/Xfy899r0rDeBGPgNOs=;
 b=djBrF9MgZltdiwhAqGMpUYH2nTcImpC8hgTprFHzfTtcq6Htm66Lk9An56QCO6f9me4F/u6gkOTxf15IMhHpQ/TJhAW88b4u5RV9g43KEOSVlQRSzQUM9ILSqJpIagiQO2FBKr7QWaVj6HnV1TnCCzl6V1trhzIVtptpy6MllrvC9u0XEXyeDsUqvSPEN/hwi70rWrlhwtxRNez7hPlUikytrUPFJw1W/nA9+zZC+3bYblVWDXZMzVUoaDGEVKZznBURBG8EXWcow8y3JfrP3nenLqVYpcweAUlH31SIe7HPPWrc0UYu7Lh58RaRvQh/a4XEsm9XAR2P4vv/Ug/oqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VrRhDMs//pfjWvMtl0p6S2y/Xfy899r0rDeBGPgNOs=;
 b=D2xPwoEFcww4okwNblsxZz3vFHOelnYxh+fWoNOiegFlsddW+c+sGFp9Ftf/9KcQ5ehAyvCgV/gLbO/AlWGMTD39epbwEZV+L04zW02BHwt440417hbR1Nv0aXC0mgkCVWAOFCa07bjHEDh+VsRVQoho9h2ETSJxQglivOfQ4a44/2/95WAWWu7wZrnNl9rN2P0DCFjShzCobUEPXuJOlYjd2WDKIbNSuBacpXPw9FKhgnF/yl87i/9Ix+6i2fuASItSTDNgkOza5pTZC1r62+0Jjh1CgZkSiEQ+ULMpPcCUVumGgFTaYzE5adnUU4Xcac8ROTYdo7aXm6JJNvakOg==
Received: from BL1P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::16)
 by MW3PR12MB4473.namprd12.prod.outlook.com (2603:10b6:303:56::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 21:07:06 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::1a) by BL1P221CA0044.outlook.office365.com
 (2603:10b6:208:5b5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 21:07:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 21:07:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Jun
 2026 14:06:47 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 2 Jun 2026 14:06:46 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Jun 2026 14:06:46 -0700
Date: Tue, 2 Jun 2026 14:06:44 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Ashish Mhetre <amhetre@nvidia.com>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] iommu/arm-smmu-v3: Detect Tegra264 erratum
Message-ID: <ah9F5Fy4KMqbStcq@Asurada-Nvidia>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-3-amhetre@nvidia.com>
 <ah85c4u011WNJQgE@willie-the-truck>
 <ah89vg26255v4lqF@Asurada-Nvidia>
 <ah9EO-djR3Tf9ohf@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ah9EO-djR3Tf9ohf@willie-the-truck>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|MW3PR12MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: 8013b1b5-a01a-4bac-8ad5-08dec0eae6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|56012099006|4143699003|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SZd+5c+K5AdOXdWwovQ62l6PGJaN+e0sfGbOcsZP9GteH9jbrESQfZWOl3M0iovqkyJhUSMQfsMp5AHZjH1gT2thAu2u64AbTe/pOYxPuGlcpBvxV92t505EII7ouWjf0TI2sGCx7gStWavWeGsVBtXxm8luAf9Yij1Zowb/05ql0LAvkWx4QIfz/iXmmC62UOweibmh8jJ68V6s9K1OsnOf4lgc0b5mnVJkd0tk4wFl76XbP3wz+Eei0nd91g4P+mmJC/U/jm4Dg/ibGkFi2oSqrCJRsij1qZ7dYuKJUizr+OTTHzkEzJNoDFyMyQ4/Xk7cvr84zpS6ShMfogQk4VsusBDY4E9Hn2i2eehV5ar7DRWxm/JFIR6r44LzTdwb3tlviRkQ24iLMhrEapGndUbqX5ajVc2MbmqVAkR8toQcujCuaQmUWoK+0VTXrbI8GBYGO01I5J9j46aPikXnDryfGj+meoyo891Gg4dGPPA9ScZayl9zOK+OKFjs+u6+TEUnu+GySIkTnXsX0Nelm+pnABtmh5DKobFQvfA8I6DpePf9GPeM48LF4LIIpULna1XO6s2r06B0UOCzSL+fCTbRaTzGl9cYGF1ikzwddUB57C/SN+lQHhpFklZAQicpsmBFvx9vpP3d3p7ppp8Zi9XXgUOZmbK8TF4nHfy72OBEzpSjKuGEUpAnwlYIWsX+x8XgM9CowPFe1pARrmGYQsgz0/b+b9fl/pOQHYA3R84=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(4143699003)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wiGNHpoK6p0mOZbSLKiKBwaJOPHd8Sm8w2seQxqjzzWrTAC67iTYEm2gRTgRG2HJiSsr4O2P5kol0ncU89CQmC22wPKnUxaJBr/nZVlbi5ewahCbVaHwBmVqJ7nOh4j2pj5Ijrwfpzol/7PJGgS5JsT9R3a10NdlHnQ5YTf56zy+zaSr/q0FPonNeBy8PBiF0Xs9y8uaOI3ahGjZueiZ4tP0Bu98nExe2Bviuxpb/d40MKfXNzzHjQDrWkt7fZWgV63lydl1s8Wc0mLwp3xqGlbLUlu1sTOpxay7AoZckyzom+rS5rvDQQ3hBAecRCUT3f6ChioEJsn/Agm1wWt8dbgC4fEwaMZAJxHFWIIMq0EUOEW78e2OkgOiq8qKRxQfJuiUUeuQEqhV39JkBDVRIpAMWdvOQ1mP+NJZ1UIJ5IkokdxVKA/mbxtcs6v+SHL2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 21:07:05.6741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8013b1b5-a01a-4bac-8ad5-08dec0eae6b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4473
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_140719_344987_FE36C6F4 
X-CRM114-Status: GOOD (  31.14  )
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

On Tue, Jun 02, 2026 at 09:59:39PM +0100, Will Deacon wrote:
> On Tue, Jun 02, 2026 at 01:31:58PM -0700, Nicolin Chen wrote:
> > On Tue, Jun 02, 2026 at 09:13:39PM +0100, Will Deacon wrote:
> > > On Mon, Jun 01, 2026 at 10:48:44AM +0000, Ashish Mhetre wrote:
> > > > Tegra264 SMMU is affected by erratum where a TLB entry can survive an
> > > > invalidation that races with concurrent traffic targeting the same
> > > > entry. The hardware-recommended software workaround is to issue every
> > > > CFGI/TLBI command (each followed by CMD_SYNC) twice. The second issue
> > > > is guaranteed to evict the entry. ATC_INV is not affected and must not
> > > > be doubled.
> > > > 
> > > > The erratum is not flagged by any SMMUv3 IDR/IIDR register, so it
> > > > cannot be detected from hardware ID. Tegra264 boots from device tree
> > > > only and has no ACPI/IORT support, so detection is through device
> > > > tree only.
> > > 
> > > That seems odd to me -- whether the hardware has the erratum is
> > > completely unrelated to whether it probes using DT or ACPI, so I find it
> > > really weird to have the workaround enabled when booting with DT and not
> > > when booting with ACPI. We should have consistent behaviour between the
> > > two.
> > 
> > That's a good point. Yet, for ACPI to detect the erratum, we would
> > need a new IORT model or flag, right? That would need to go through
> > the entire ACPI protocol to update SMMU's IORT spec and the header
> > accordingly, which we don't have a use case to do so or to test it.
> > 
> > What would you like us to do here for the consistency?
> 
> Gah, I now realise I've mixed up Tegra264 and Tegra241 because
> tegra_cmdqv_dt_probe() is only called if the compatible string matches
> "nvidia,tegra264-smmu" yet all the cmdqv stuff talks only about
> Tegra241. So I was surprised that the ACPI probing code for Tegra241
> wasn't enabling the workaround.

I see. Numbers could be indeed confusing :)

> But if you're saying that:
> 
> 1. Tegra264 never uses ACPI
> 2. Tegra241 doesn't have the invalidation erratum

Yes.

> Then I'm less worried (even though it's a shame that we can't detect
> the erratum from the hardware itself).

Agreed, though I think the compatible string is already a life
saver as we wouldn't need to go through the whole ACPI route..

Nicolin

