Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E882DCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 20:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIsArXoQ4fmUAmVv1qc5ewZ6YHXQWG7LZuZEGibkT0E=; b=pwIYZJyh45zcTjsyePISfwxJ//
	ZVcqY8c6kw3nnxng0yMAHm6XXiG8IAc9k3cyCL/WY/JciNYVnX/akwjDXqRisyEIL3JnF12x3IeQn
	KPMSatWZQx+c11FxCOE16yGnUHKdBmTVkT1EQ6t9AsIukITjUH558vNiA6WttKHCWcLVztGbwg+dv
	x4BdyvPV63JQxcV00AjUJ/SKP3s0vN+0rcTYyOna2nvyR0ZzGRPI32teJ+fhrTRUn2EZDs5o4rLmm
	hwBtRUdQANxKQP0yfO0UUjibdjmE4RK3ckQ6Av8V7CIrkW+APeHXhYCZvk1fTrdMnXYRGv9hh9MFe
	ETObwgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbYl-00000000NaS-2ld0;
	Mon, 25 May 2026 20:05:59 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRbYi-00000000NZv-47Cm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 20:05:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bf9OAv/S8Z+EN1cwCXPOrTCwn2kz6u7cS4i8Wav0tOp0MxZH5UeqhnlK5gDPDS9Keu5F3oea0kGx5CDo8/heoKcauQs67Qf63EFAoQf+ZFx7miMql6tnbw97z9oeDRouqXWG3BZHHDFBiKvgB/+aVpUI4jzM8eC9MYflogX+13RYvsOO7FG3nKSNgn4/Dehz88+6eRloJjwbRSwkLlnoQl/LfCdv8rbP63bzcSayD3ms39mHvGG//T42zkYSZgILcen3KHJ+7+0+eyllc11edfu/kEsU8pRnsnmt7hbhoz+SFb5HaJakgIumOn3doqZC+EA/fFnjWqIVWBEdSPyDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIsArXoQ4fmUAmVv1qc5ewZ6YHXQWG7LZuZEGibkT0E=;
 b=ebj0pCfS+KkUo/9x5Pd97RTHVDEFVOJoZeReTF9fbAy1GabwRApnfLBwwQPK6sGaVrtZ2MXgc2VmFv8ptcwTKfvAcRquajkzgKT1IqefTXCQANYzkZ6USJA9qaVXaCpFeC5gTIcrJrLIjs9lkI7PUO+X75EvW7qBDTc5P/2p8X4xpeUFr7jIT+HyD2vEmDYGvj2tCIYjnd8bOxtVfvy+QYvV2ev0DGhKFlfL9loyZEWSpDn6D1GZo5kldWQfP9f0RT3PfV+/q/U66vSePTbj6rETHUvIqcJt/qsxOK6mhTIm4vA5bt9PZ8IpM4KwddF7sJ0vDI275pzP2c9JgWpe8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIsArXoQ4fmUAmVv1qc5ewZ6YHXQWG7LZuZEGibkT0E=;
 b=S8U60xFCKXLtSeO6aI+RhNBJq16UQhG5GseMfn8wZZ4MR4shCp3lJtUs0GuVT18POFO5IF/sllz3yky/0hGdQ4xInuVY90ZmsISKU8vnzytWttv5yoPe1Tg/LdOjCL8zKIEunVZBMwz97QQAqLLGku+ez5Zep1uA1vsKncdWj+dfoEQtGGaq7mI/SBSSKIyrIfneV4107jfEoGRYYuACTFGvI4apVrxaavLwUKJRE46W/E/7T/Bf4EmQZT+ackI8Po/L130wJI9FxKJYY1f0Y6mMKg1qkpkYTssDprMhNEGqbFnuzfWDXUW6BKKk7i6yUMZHNLF/POhvVrGAtVhEzA==
Received: from MN2PR06CA0016.namprd06.prod.outlook.com (2603:10b6:208:23d::21)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 20:05:50 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::2b) by MN2PR06CA0016.outlook.office365.com
 (2603:10b6:208:23d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Mon, 25
 May 2026 20:05:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 20:05:50 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 25 May
 2026 13:05:39 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 25 May
 2026 13:05:39 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 25 May 2026 13:05:38 -0700
Date: Mon, 25 May 2026 13:05:36 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, <linux-pci@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Joerg Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>, Lu
 Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
	"Suravee Suthikulpanit" <suravee.suthikulpanit@amd.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, David Matlack <dmatlack@google.com>, Samiullah Khawaja
	<skhawaja@google.com>, Daniel Mentz <danielmentz@google.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v4 3/5] iommu/arm-smmu-v3: Fix ATS state tracking
Message-ID: <ahSrkOv+4QZWrcJq@Asurada-Nvidia>
References: <20260525184347.4059549-1-praan@google.com>
 <20260525184347.4059549-4-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260525184347.4059549-4-praan@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|SA1PR12MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce48b7e-9ebe-4291-2da9-08deba9904c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|4143699003|11063799006|56012099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 1vbUS5woaL6iF5za49wDC+aImWHJ8R32CN4VlR+TfOd90z1QWjm4xWJrjRqz4BElx5sa7R/kdkqU0aARsoBVdMtkz9v77AOYFocp/QDVFysFrs5GbGx5EZqohPf/FZIBp0VqXa20bPtzGM9TkI0PwhzwYxMcMj08uo6n1AD4yzy9x7VzAI347iDBS5BOUNSzZWPP8hPMhf4jLIy1BbGdSD2SJ5WMJ7B9ZS24f7A5g0BkiVpEuxz2zHs3ReCdUOveSIJefUz4MV5d76MYrlDMg3wA6yq0vSojZ3Qb2sEiShIza37GcG2odyYps75uArANW7qtQWLoHFJ4/tyAsO6R4HF7nQjxqnqgkWAlOQWdNliZyMtc771WbXeihStDkrurrl6Dlbaq1hNJj17M03XEMj8GB44Tc5waz7r5o+0tPD9+tysMbQcdAU1QnGJ/a5imgdrGtWTPMoSasjAn/vb4yP1fK8Jqa5wm7PEHjAjMUfKvQJK+IKOvPgBZHDod8erRKefXvqSl4TPWrrjaWwp8fQ8cNGRqO7oPF2Wx3FS1pIPUmDIg2dJtrgUW164Bu02uR4lQwxh4uI6JE+kYrnxQcFxM9YaNzJIAw55udXDKAddPXyKgMlBPETTIt6DPhMs5+/EVVn60DEQeHAGA03psgoY2Xh7Dpi08gVkbFZH2YxetbREuY8ku4ZRv6lbYeFgK6uK2go6zvXAVXtW7WzRYUw2dxV6aJq9sX9l1YjR+FeQ=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(4143699003)(11063799006)(56012099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Gxcs462pQM9dgXEUoI8+3tbLHj2Ou94bAqhHOMrWuxhlUVbQ5Hf3P25Vby+OX0Bt5B4QIywK+zkWjZn2j+9Xq5F5ieFxI/exIbFfbJtg3UUMNqB8N0KPzhn1PPnV+kf/q5R6PmCILFhXqJWeA6jEZvYI7BYWZuqyK+WSoLoc9yHNc/8qLPMBgFg1mtq8BTTIHktM+okTBz5cu74yEdFCI4IRLFz4+a9ATQ/Uy4GGnhziDVhjylNhEOTm7LEnXLbAxmlV9z34caFEg/fkPnXreXOMxMi/O4g1Rg9QyYFeYqO6LYazpybyMaQYOEGl7StOKucc39+nwcxRDsb8FU+5E/8BdC406En0LB3osSkakcDLMzSBbfzfYzksChFD+iDW8w7g/SnJcYuilfrSxQ5Lk6q2wtsdjhv506n4LphjMCoPFJM/md1hp/9rTqH2a5fE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 20:05:50.4341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce48b7e-9ebe-4291-2da9-08deba9904c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_130557_026903_B4E6FE09 
X-CRM114-Status: GOOD (  17.48  )
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

On Mon, May 25, 2026 at 06:43:45PM +0000, Pranjal Shrivastava wrote:
> @@ -3065,8 +3065,14 @@ static void arm_smmu_enable_ats(struct arm_smmu_master *master)
>  	 * ATC invalidation of PASID 0 causes the entire ATC to be flushed.
>  	 */
>  	arm_smmu_atc_inv_master(master, IOMMU_NO_PASID);
> -	if (pci_enable_ats(pdev, stu))
> -		dev_err(master->dev, "Failed to enable ATS (STU %zu)\n", stu);
> +
> +	/*
> +	 * Any failure at this point is a kernel bug. pci_ats_supported()
> +	 * and pci_prepare_ats() have already verified the hardware capability
> +	 * and programmed the STU. Thus, pci_enable_ats() should not fail here.

Nits:
 - WARN usually indicates a kernel bug already.
 - pci_prepare_ats() covers pci_ats_supported().

	/*
	 * As pci_prepare_ats() have already verified the hardware capability
	 * and programmed the STE, pci_enable_ats() should not fail here.
	 */

> @@ -4264,9 +4270,16 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>  		master->stall_enabled = true;
>  
>  	if (dev_is_pci(dev)) {
> -		unsigned int stu = __ffs(smmu->pgsize_bitmap);
> +		struct pci_dev *pdev = to_pci_dev(dev);
>  
> -		pci_prepare_ats(to_pci_dev(dev), stu);
> +		if (pci_ats_supported(pdev)) {
> +			unsigned int stu = __ffs(smmu->pgsize_bitmap);
> +			int ret;
> +
> +			ret = pci_prepare_ats(pdev, stu);
> +			if (ret)
> +				return ERR_PTR(ret);
> +		}

Again, pci_prepare_ats() covers pci_ats_supported(). So, the check
is redundant. Instead, it should check arm_smmu_ats_supported().

By the way, this would conflict into my series:
https://lore.kernel.org/linux-iommu/18bb6f421b3be891caa8f1fb50f3a4d56b52d5be.1779392420.git.nicolinc@nvidia.com/

It would be nicer to have an arm_smmu_master_prepare_ats() so that
both series would have a common ground; mine would be just adding
some additional lines if your series goes in first.

Thanks
Nicolin

