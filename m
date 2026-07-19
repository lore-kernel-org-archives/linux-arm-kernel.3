Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81084C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 20:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXL7NmHXTc9FmrnqJkkwVqpx0wXqXqVn9h4SF6Orl0Q=; b=A5tdeEEK0uRswJKku4HgUCnvPe
	wa2/IQiua6Fev5sy+rIejOx8QZ0xQa/FWLGho7iH/X6UInJr9bBkK/3LK3jhxvz8zyrPw3E8ExX2I
	QHKeZzkSbS5KEBhSwKsXrzG/rJ5jJE3Y8D3dx6pFhCj0autfDNsIvAwap8jA44sbdblSQ3mp50O0D
	FkRBjDqeMM6LwD2+KyWPa7S3PXNgVBa0UefKQhojFjC38CsKm91ss1KqtUUyCRJGrvl2QEAxa4nBE
	DPKf4m79/NTEI3i+X+8ByRM624l9mSobvxiINCNk9iKK1pznCkKrlW97CoFxQmJ94ERLJf08ivJEM
	Y4tmOlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlYGi-00000005LN9-3LyV;
	Sun, 19 Jul 2026 20:37:48 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlYGg-00000005LMo-3Ib6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 20:37:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZKfvsoDPiZS2S+kIcxgI0bCudoxqLTVBvD654ERdALYfTl5dhjUWJ7EgrmDFPpNwerj50bTKp8b80XgWe7sAdklrOH8Wnt/qlrViTHwhfDQ87wZqWMrYH81/hN7IGD0HQAGrtekrx47ONMoqXhgGJDCadqYy0/qbwT+Xko+5fUima93q3TU/6kYlvVTjpP+/ErBR5cXh9LjLuOtDPZgP3dPYFF+2VSs9DA2foJEUQ5FH/Zc1Fr7hBQJ3JAg0bD1fo/1RHLUOWjfkctFIuUMrD3Yv63vWZkx4DRbiOv7JYfcj7d1azR5MgYglYAtjY9mZrWq77+75tCkO4P2TJc2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXL7NmHXTc9FmrnqJkkwVqpx0wXqXqVn9h4SF6Orl0Q=;
 b=A1cyFNE4/ddfUcWrQFHmHPB3quKmvwANVS8WjWq4GY+TWwQCTfHBIx/QDGZq7RiveyFo1utRO5apB5IaOKyB7Rl5pMP5gptzIbumMiHcP0omQiJN/Fo/niTsG0igzfb7ntky4AvTF6BRxw+Pjw3sXm84s/WY1osEnE74SdCzH976N/4tdp7EYMbWq6xYyqgK7QMi8fGpmCLRmjNOtAZM7ydwaDbwb8UalhQl1K95Xoepl1na7ZGS1d5kgwb+xqVTDgIt8zPojBVpQAPWvMeGWTqV8/mQ+eHWTKDnGjpPghl0VacGNZgUfKXObUbbrSBRBNyeZCzqYju4N08aHytz9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXL7NmHXTc9FmrnqJkkwVqpx0wXqXqVn9h4SF6Orl0Q=;
 b=N5TfFekjGePN4Fz5w2KSZoD7uBGs18MVRH/vXwiZf5i3qhahMzKghGA2xFRtzrVlVsvnX4/6txzToj9Uf1RGuZejCB7jrC+Tag6P3RLUD4jc9n5OqG6KFAekGcqUv7dKxolPTYGdHdW0RbGcReA/nIDcILXjvAjbwK4mtywCShRaTQqpFj0xDLYuwPCk6/e57Gsetiv5pWbDG1rHV3oXUtnlYenVYkMnLWkRYUOKx1x6MSw34y+/arJHTKxYAZa5zWEhr746Z8MC0QCfpQhKx6ZPgbqr5oGwd6Go8wU4WJYeK9EYODN7r+VcLbJZWd0Yt0EjSenVodd2qbQLtxCqZw==
Received: from SJ0PR05CA0142.namprd05.prod.outlook.com (2603:10b6:a03:33d::27)
 by MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Sun, 19 Jul
 2026 20:37:36 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::7) by SJ0PR05CA0142.outlook.office365.com
 (2603:10b6:a03:33d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.9 via Frontend Transport; Sun, 19
 Jul 2026 20:37:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Sun, 19 Jul 2026 20:37:36 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 19 Jul
 2026 13:37:23 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sun, 19 Jul 2026 13:37:22 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 19 Jul 2026 13:37:21 -0700
Date: Sun, 19 Jul 2026 13:37:20 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Ashish Mhetre <amhetre@nvidia.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v7 2/3] iommu/arm-smmu-v3: Introduce CFGI/TLBI-repeat
 workaround infrastructure
Message-ID: <al01gEzqzCO8KqTO@nvidia.com>
References: <20260714104202.1664187-1-amhetre@nvidia.com>
 <20260714104202.1664187-3-amhetre@nvidia.com>
 <20260717201841.GC701389@ziepe.ca>
 <alqbxaKVYFX1BZR5@nvidia.com>
 <20260718164548.GI701389@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260718164548.GI701389@ziepe.ca>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|MW3PR12MB4409:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ebb697f-8fb7-479e-c9b8-08dee5d59167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|7416014|376014|10067099003|3023799007|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vgg9bKAZ0IGFdUXl4RF46W2otwIIAmyV2mljGscbFR3sJqenhOL9eIi3ph9WROziAswS3cB2EokkG8ilwvSHHBmYvx5WQM9cRJuKtOuHJm7XOma06G+08pY9zjua/A55BK1HnMrAsS9BBJ6590BObLSQ8TlSObrJ60UFGCpePPjPfD5wcLraZ9nhRH7zKm6WoA351p3Olf57nm3i3fK+RKOtuwK8ySIgCM5rCH0bO2c8pyjhiyKPRGm7DZXpx3J4kh7pk2/QjpLfISKpFtYiVHtPlWmUWXmkos/NKBfY2CNZfBBi6/f9Nulh8zY6/15+YF52dUZwA/qIuT9suN4yO5Y6aTBPoajGjcOZbEzrEIGXwNTB/uTxXnP7zk49K5IYuow1YK3Nz2eV46Ylu8iYWNX6DVdiNIHVOehOp/k/EzlVI1DvDUHIx2y39E3O+v623jmeRDbEhZf8w/NXdXj/bG43dhAcoKmS5Nh3zfZzr6CzfSH2oVCsR0+NlYVqH46HrURLDiKOivHZ2hD37XAlpROpPoYoZzas/rwSTUDheBbPJzFm4OmIxnnpzBgtD62Go6iP3KTTD+Nv6uIDaXiB4kdJi4OFNlQ5p7/4+QVmyWAOyk3PfaUwr2VM/uFGsqWN/jRA3ach086op5px6rVXMS7AbUr18WhsR4d9y+Zj03aIC9DG2SbEAVgLXL1AfbZWE3jLD5QSvNsBfzwlwCPJjA==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(7416014)(376014)(10067099003)(3023799007)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CevySDUtz5abSAfgg+aOQTarJxy64kIyVtnMQrekS/kBlfVPmSMEC1dEX2bb7Rf1oOsnVrnVoV261ixlLvnQNodI+DcmyawlLV1Kq1FqTJkJOpQyClNxfHbTgIedH+KfWHONPhGhlMhM3wXQuCqZ/WUm6RI3aNF8zSD3JQZT/4pL+OqmruqUh7MMUFN6o1nC/ygeyPMF6fGsOiF8VdnMqs82RsNhrPC1vxvuEINESa5MpLFFrooZqbqyuehCBQI0GvHHf6h9K4Ar1T001+kAmHVBfabzmL53XvQWDF2lZ4dfEYq0D6ZYOZrjVyE92pGlK92c09Epu0CUvlexvkE507y7gYr4RF57ap6vqrRbCfBMQKpVKWLuJouUCC8mn+S2rQUWUL0hAIK/ncyDBa6Pc9FlUkq4Oaf5fQVvg7T1X1ezlMdPMwUqjwTPiwHQRxhX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2026 20:37:36.2486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ebb697f-8fb7-479e-c9b8-08dee5d59167
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4409
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_133746_838680_21A2099E 
X-CRM114-Status: GOOD (  12.43  )
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

On Sat, Jul 18, 2026 at 01:45:48PM -0300, Jason Gunthorpe wrote:
> On Fri, Jul 17, 2026 at 02:16:53PM -0700, Nicolin Chen wrote:
> > Given the use cases on Tegra264, instead of patching the iommufd
> > path as this patch does, perhaps we should simply spit a WARN in
> > arm_vsmmu_init():
> 
> Nope, in this case you need to make the errata discoverable through
> the viommu info so the VMM can validate the right DT is used, or apply
> the WAR itself before submitting commands to the kernel.

OK.

> Some kind of new flag in the viommu struct I guess

struct iommu_hw_info_arm_smmuv3 has an unused "flags" field:

/**
 * enum iommu_hw_info_smmuv3_flags - Flags for ARM SMMUv3 hw_info
 * @IOMMU_HW_INFO_SMMUV3_ERRATA_REPEAT_TLBI_CFGI: If set, user space must issue
 *                                                TLBI/CFGI+SYNC commands twice
 *                                                due to a hardware erratum:
 *                                                <link-to-erratum>
 */
enum iommu_hw_info_smmuv3_flags {
	IOMMU_HW_INFO_SMMUV3_ERRATA_REPEAT_TLBI_CFGI = 1 << 0,
};

Thanks
Nicolin

