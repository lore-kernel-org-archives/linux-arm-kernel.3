Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0C1EE4997
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 18:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOh01Mw6ZAYL6a7touSm9pObHnInG0uyXbEGoiUQTs8=; b=xUgk1YC7/q3saq5T2GXZGbcppR
	1WDeP1joiWO4SFklKzNmEOmq38ezMs22I8ZCOVJMXHfDUDyRy9PFa4C8GtNuZpgCNdV7PB/cE7g/T
	twrWLSaU33ANHi+Z3yRYFhJ70JgPawF/pJwnIXzFymxagEMcOPGnG0RQ36d4Gdo9y36GlRtT9rvkg
	3mas5rMw2a4Hc6DeEUCSMxDYjYZn6ufgKhc/6u1bancLuh0X+8Mt2d98UQfhSuCjUS/nxy7x4pLfP
	3mUcEMaD+Qvh5ObFxweubAPHWUblYQdnM7WU99MWVVw7kHo+pxjXkKQGzH2fvnSwouw50fzQoQxLs
	ass3gpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaeqO-00000005CgY-0t7Y;
	Tue, 30 Dec 2025 18:53:20 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaeqM-00000005CfT-10UQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 18:53:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlMci1fdkjc6s0ielB5J1oLsfUyTVyTozoLIVoU385uCRxsVNU753h009P0ZlpZeEKRHVFIp/xTS7W6tc5oht8DKRev0/1HbjlBYPi3eP7JKAQ9aK2uHk0LTA++FDFPZyGe9/+YH4IsqDA2r+vqdGCs425gaMUhXfsLEDWxeDFCU0ZckReFvVQxJUjFN67r5O9Rkckh5VnDoPCc+mWF4XONxjxGf8QqBb5Dt4NI1nNjeKtM+ORnGfwDSNH8ULARXSUGBAiy3yQoJq7VOeGbiEvl0hlHx7ZzbVDlgAtPd5PGhhX7OD+AaM8GBGIeUCqxshN1HoJApt7b7JC3GEkA4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOh01Mw6ZAYL6a7touSm9pObHnInG0uyXbEGoiUQTs8=;
 b=QX3X1zmVSWJoMB6RYY26q9Skfg/S/r0MOM641CKBQ0MRVrp2agZ+7S4sHhpGaIJgloY/dVrIDFPkzJOSxm3uTMWCDj0hVamjipx67fTLO7IskisaUepGMUeuWu8d79mDUY3UTgoHfjUWXCJJx3wstByo5xSFABtlf5gd2kRMDd3ytEHo9s4Z2wpi0rqFQXPKB9s6URb/J3yhuFx369lRPC4whEuLiv8cpTbcqLc9Y4CNu3WpbQo72qLzLtW8eSTL9ONi1N5kU2J5vIviZFTY0u65t3T2Eto3vxiuRGksi9Uiphq802Ytwu1zLiGCFrggRGYTQ3UfdiNGkaaj1mF8ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOh01Mw6ZAYL6a7touSm9pObHnInG0uyXbEGoiUQTs8=;
 b=REksF8eKq1630Ru0V4NeSWAzO75vHgjgXp/KyRVfCjSUrBZC4zTRecHU1l73xq2CPnOSoXEY5fPMJX8ik+OJszAeotj2RIO08g2vn2IPPx1WpogrLPyS8ZJn4ZHkCBSry6nVgJKzI15ePxO+SAt0VqQFDVMhGaRXRk7wn/itTojhvG9ofjZMo/dGsBP6P5SVTCRzLWtiUA70xytBfoMmb6SFgmed/hoRJuA16ag1KnJkM64LdyOk9m6XRt8ro4XrW8nY9Iy4d/QaA1C150uxXgz3U5ts0fd53oti2UPBhKJ7Q1DwCBPrm4UmrevD5NC+/mS2Me3o0TLwD5Sj5KZJmA==
Received: from DM6PR02CA0078.namprd02.prod.outlook.com (2603:10b6:5:1f4::19)
 by BN5PR12MB9540.namprd12.prod.outlook.com (2603:10b6:408:2a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 18:53:10 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:5:1f4:cafe::12) by DM6PR02CA0078.outlook.office365.com
 (2603:10b6:5:1f4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 18:53:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 18:53:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 10:52:55 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 10:52:55 -0800
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 10:52:54 -0800
Date: Tue, 30 Dec 2025 10:52:53 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jpb@kernel.org>, <praan@google.com>, <miko.lenczewski@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: Re: [PATCH v1 2/9] iommu/arm-smmu-v3: Add alloc_id/free_id functions
 to arm_smmu_invs
Message-ID: <aVQfhaqfvfLFNZqe@Asurada-Nvidia>
References: <cover.1766088962.git.nicolinc@nvidia.com>
 <1541ea4a9e9c935c2f907c0c5f13a4af2bdc2114.1766088962.git.nicolinc@nvidia.com>
 <20251219170551.GF254720@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251219170551.GF254720@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|BN5PR12MB9540:EE_
X-MS-Office365-Filtering-Correlation-Id: 279e0896-fa0f-4988-3ffb-08de47d4ad60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zk9gE4mYl5UnhkDvqBfB/wdvYssr+GysYo0GGzuwI9SdqBXG9pRvPlczXIsc?=
 =?us-ascii?Q?CA5pbxIuhFpS74QV21uF0Okyqf3aOjyc5YayRGMwAzoIWFGFfqZ/siv4kX7p?=
 =?us-ascii?Q?pw9JvHKMiIQXZ0YXkbgGqnRKk58B8F2pdUffTjMCfCTrOO23uXMpQ3nYN8uc?=
 =?us-ascii?Q?BaTmzZz91zv//eK7p4dB9ftCEyt7VE1cqI4X5QEtPi45HzVAusSuCSNf+oJS?=
 =?us-ascii?Q?qaCpe0xixUZwFz4rTcbDEFFzCYFcPjHHtTPFUGOT0Ke3+yWTmskyoQzKTE6/?=
 =?us-ascii?Q?B31HI5M1Eo0Fa7e8uA2CjA9aaZ3gts9qVp8GGRwayFTY7RmGUGEAuFad2VEP?=
 =?us-ascii?Q?Y4aQem5L8w3zOhJvaTdPQwVAR5R/Ro64yMH1O3B5CG9OiFJrOzbKF6kRrZit?=
 =?us-ascii?Q?m0z+6dFOxLxn4tzG3Ki4UDGf4Mx3+//NwrGTDcGhNRfLpFaXwuAOZG1LeILw?=
 =?us-ascii?Q?K5csLESHyUl7jYWhMnYxxE3BrgmPefgsrjm81bJoFwoZ70iPoleOrXYzrxYJ?=
 =?us-ascii?Q?U097M4aboA6xvzxtHIjQA5GM+0eUzmGSfpTpOjIZAD1LlFeCI7LKygqaoqSi?=
 =?us-ascii?Q?AkrUCov7BGcXFu8NSMaFpw6THlhtdNETXtI/D9XMF+b6F+D9K7jYcV764MpH?=
 =?us-ascii?Q?aUubPb5pHxGVJ6MU8DI+EikjSa13qsOPUNVja5/WJelwt7l8K/JCGGCPoyXd?=
 =?us-ascii?Q?jm6aRq56PGRTob+Is2WwqAJUtxESxVlV0mfGY02IdS2XC6LkofxrTGtkffXz?=
 =?us-ascii?Q?ZkuZtMmb5li6DHGFWooEHsYWzXeovIQNVWp8dzfz4BOGuJIJJMVvWEvNP3jT?=
 =?us-ascii?Q?131chTkfr1QlkyF6WmnYjKW+yW/Oe/QN4QSyOwDzqKR+htzNb1J+RtrBPVr7?=
 =?us-ascii?Q?fcUbTMYsDtXk9RE7NhXPoi650Q8zHT+RNvbCaHcbBWjtnDvKJqRCe17BL3oR?=
 =?us-ascii?Q?UrBl54L5VODuystjE1kwZepjY1GUQpmCy26aafEQFWtjWJVzJMvfAgHowSiX?=
 =?us-ascii?Q?bdDQ/C4LkBM1xmx00CgeRds/j0X+7PSF5D3fRDxJzP56kNiSMiGnQzk+Sb0x?=
 =?us-ascii?Q?vI9TIfnCPQXcSbUHesk7CINv826PhZB1FKSzx9qjDTY1yi1D44O1/00FenjC?=
 =?us-ascii?Q?orB1FanMEGwXFDY6xD5M3eZ7aag58x8/flcWWQAQlXSyzwsGEySoyoeh9Ik2?=
 =?us-ascii?Q?7ifnv9PMRd8cZOy/UOq48Qk61q05eBKrfA7D8ETGuByDow3EFE9Zd3cFafEI?=
 =?us-ascii?Q?w318UqUghbzqhUCVI38WcL6TXVqr0MSZI/ASmgqIFnv0HNJ8VFavcTXlgkMj?=
 =?us-ascii?Q?sldXzPazs+I6MzhPBDwWAbIWSyOIwK8MVL3Q64yvGT1dRambhCR1RVw3C98p?=
 =?us-ascii?Q?F7p+y8F81WRii3XkNpzBVa/JNnZ4yH6av2zmWO+8jDkUg2FNPzcnA43I3Ok+?=
 =?us-ascii?Q?IMMuUy5YXOlNqP59olwYXGUl1V/fVQzfFcCrZL/2tDWbkBL6Ttc2Dz9MVjvf?=
 =?us-ascii?Q?TR9vdMSfrIXMCEIPuEAYLCaVfkE5jhp2v9lO6NnNd6BvM2ukIWWKdDDP1s7i?=
 =?us-ascii?Q?+RFN5hCtXQkHnh9sjhw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 18:53:09.9236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 279e0896-fa0f-4988-3ffb-08de47d4ad60
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9540
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_105318_296027_4433B96D 
X-CRM114-Status: GOOD (  14.75  )
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

Hi Jason,

On Fri, Dec 19, 2025 at 01:05:51PM -0400, Jason Gunthorpe wrote:
> +static int arm_smmu_get_tag(struct arm_smmu_domain *smmu_domain,
> +			    struct arm_smmu_master *master,
> +			    struct arm_vsmmu *vsmmu,
> +			    struct arm_smmu_iotlb_tag *tag, bool no_alloc)
[...]
> +	case ARM_SMMU_DOMAIN_S2:
> +		if (smmu_domain->nest_parent) {
> +			/* FIXME we can support attaching a nest_parent without
> +			 * a vsmmu, but to do that we need to fix
> +			 * arm_smmu_get_id_from_invs() to never return the vmid
> +			 * of a vsmmu. Probably by making a
> +			 * INV_TYPE_S2_VMID_VSMMU */
> +			id = vsmmu->vmid;
> +			return 0;
> +		}

Would you mind elaborating why arm_smmu_get_id_from_invs() can't
return vsmmu->vmid to share with a naked S2 STE?

I'm having a bit trouble justifying this INV_TYPE_S2_VMID_VSMMU.

Since it's the same S2 domain/iopt, if anything that is attached
(whether nested or naked) changes the S2 iopt, we should always
flush the nested S1 domain too, right?

If so, a naked S2 STE should refer to the same VMID in order to
allow its following INV_TYPE_S2_VMID_S1_CLEAR to work properly?

Thanks
Nicolin

