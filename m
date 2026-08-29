Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78A1C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 20:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KyyGb35nAAS4oA4Irll3Sa8Tk2Bw+6AdEssgThZrGY=; b=b5SH+atF5rSBx+yi9nOQlPhfpl
	jZiH6dw6nhZ9n8uRfMmkd5F2vs1NuIQo0/PP5tJvrN3+9+JAzkOSMburbHb9yhyTlNSJgoMsp3D+A
	/U0pC3/diaEpBgNX/o9CVFZWCIciu+vqkHEgMrhmQ18g0IYLm1Lb7WVocFkGwYPXF1BlH2tOr5Aql
	fFAdDttjcBv1UfGQOdlhC12K3JZypvEJkLBsmh7Lg3Ad+Mq5D2JYXo0qQz+Kr9rJCfTg/+2BTvOLQ
	lLvj4LmKD4s6GGy3T3yLEvaa+fy9j8x867KoJ2mV7oYcxEz1O92vF9VtfGIC5E4kKEPb3hLRGm0uh
	Gw8vzDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0PEr-00000007HbO-2voC;
	Sat, 29 Aug 2026 20:01:17 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0PEp-00000007Hb0-1yEl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 20:01:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQSv7tgouWFCUOwdKqT/ZbCK0eoML9PGFSNCHqp92YvRdRzcNlTSZbxWjRDu8Ar/4u/UtGN1KMc+YxcodlpP0eZcXdAYJTHwdtd1uX9tIjtXve04vQ6EEcuzY0YCQvC4Rm4s7i70Q7Q4yOBd8Dzw1X50n/mOc2Q+SDGB48MlfabmQRb0DDIAoVe4fLCah7C1J2gZ4RJps3QAm+SyE33Xvad7Az5WOangcbMttEhEnVeq5vM8eH83F3NZUN8vwuBp9lMH6X36PohUkrpVhQm3wNkGZnunjFu+Z4p9zhaT+ZCcG7qBinCnDR+1FogcXiWGw6emQshN8wnHROfZYlKoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KyyGb35nAAS4oA4Irll3Sa8Tk2Bw+6AdEssgThZrGY=;
 b=dhsUkG14sp6fYMa/rI5U7SkxEbGno5WuCr7TspkJr/nQGbR9WHbfCsLsjPbPGzppQuTZL1VWFWCGDT3yqb7qbMRz3rDpZ49JufAp7XwUJ9YIDPhyL7jkE5MWs6PGNTppErbyVtVmUjNrRf69+xd/+bIbCuTbW9fNoJcMn6H8hFF5/pREHbeVh9h3ZbrCIFYL2KH5At/oOooaJXz9NvUTyEqsQxvNRmpjUHQG/8DYOv3RqJm1PNKQziofsW1Bj+YTk0fTAOwz9heRMwPhzZLmUDmDswpmF3Qi5ojU0CUihIaDaxnbVDYwrn7z1OwpokbS6lci+YFKW4DmjRKTi3lqCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KyyGb35nAAS4oA4Irll3Sa8Tk2Bw+6AdEssgThZrGY=;
 b=sn1mNuhxxP27HrG9eE0OgT2VA9FIQnxhb1Sg+odFt0sHJ7gdhP8heI1suzhQlqzFJJVEh7Dg/8csvsV5113BfYcw73RELxb0jgZZ7QaZi8OToEiAK+xHd/RpHctVqJw9oX3tJOwZZAOGDYyK6UI+d38s9eUOjlcp6NCazEH3P8nWdAUJlRa8Z4Ougf88VirhWupsViOx7aUDt8yLm0BvPmwBYPaVAUphxHoTvNSiLkiaveRS23emjg1vLsOFMhcadDcxhMv+/6xeLck0783DXOC2Qhqe8XvIGRzHF0yGaJvnfl+r4TWkcGMgFdslFgXrwzViuwF+AoK4DhMjoAwurg==
Received: from PH0PR07CA0018.namprd07.prod.outlook.com (2603:10b6:510:5::23)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 20:01:08 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:510:5:cafe::72) by PH0PR07CA0018.outlook.office365.com
 (2603:10b6:510:5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.12 via Frontend Transport; Sat,
 29 Aug 2026 20:01:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Sat, 29 Aug 2026 20:01:07 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 29 Aug
 2026 13:00:54 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Sat, 29 Aug
 2026 13:00:53 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Sat, 29 Aug 2026 13:00:52 -0700
Date: Sat, 29 Aug 2026 13:00:52 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
CC: <linux-coco@lists.linux.dev>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Joerg Roedel <joro@8bytes.org>, Jonathan Cameron
	<jic23@kernel.org>, Marc Zyngier <maz@kernel.org>, Pranjal Shrivastava
	<praan@google.com>, Robin Murphy <robin.murphy@arm.com>, Samuel Ortiz
	<sameo@rivosinc.com>, Steven Price <steven.price@arm.com>, Suzuki K Poulose
	<Suzuki.Poulose@arm.com>, Will Deacon <will@kernel.org>, Xu Yilun
	<yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 03/16] iommu/arm-smmu-v3: Add initial pSMMU realm
 viommu plumbing
Message-ID: <apM6dOHcEI2ztWS0@nvidia.com>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-4-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260427085344.941627-4-aneesh.kumar@kernel.org>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: af804dde-6e1c-4184-2dfa-08df060843ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|7416014|376014|22082099003|18002099003|56012099006|3023799007|6133799003|11063799006|4143699003|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info: 7oL0aYKYjVbpbk4U+IPrP9pFnIYkvRcEGI8e7L6xJ97rn2ZUFdMX7VRXsusQXvI9HemNYji4Vsy9EDjRaMJCYKPyHLUzvEBYNInMze8333EAoZV4grhBQnDuEwTHpbOGiSrODIQ6dk5TaUuYoZv63WwI1OfEUbmC3VvUp4G1Edz9dIxxd6ORzDoGlULV5nDD9+YBd6/Nfx9PuHpUQ3eBw1s4SUGfb8hk63gQH55sJc6j3Dmn7YJGJ3yieNfwiT04lgwXelZ4Zz76GXr7i2nKRzE2h51caAgjwxQbT1AhHcD651TjEeDoJWg2pEAvGzeIsHvYt0WXwQwkwA65gaMjgTmJPoUXCehPq6/N1Nbhj1O58UXoPtQg0jfjngL2hMpDrCQRVMkI3wY5bpdimQzpMP53/pjwCpfwQSh6q9TpmVlsp6P6ayARrg4Ra7lHccIXcYWX21R2vz9jj4RYf7KcsX49b5yN3GzEdXuG8D5vxP0I4Dx3oSYQzUybxGq9BHNzIss+10DhVMhHvxHeLnJRdWOffSQ+I9bQlaGI4/GlWIwz7EhelSWg6F7DhVWMLzIDsH0LGJzG2fV/gZI+zi1GLA0TnTjtg61oEpJ++Ct7ldfW+t1lBQ+wcyKkPCgOykmszZzGTioN600P5wBu86a3Th4ceWDqvDHvaPenk1QhgdsIACjTFbPr0OI3i0EaCosHFD7PYAQFJHDcZrqiYZHPdw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(7416014)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(11063799006)(4143699003)(5023799004)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KxE7Juy99ISE9fS7HIlwicdhr1SY1i0HaOCM6OzaCy1GUBwDJQX6Z+Ma3xheHUVfggeBlCd4OxXiOKPbLcyrG646BMqKdnciFsAfsMNl5DBlZ4JQMb9kEd8VVdFIoKn2BaVFozixM9fC5GzAzIlQoa/xOH4Wz/aXRQXyzAuYYaweTTbBFX1AO2yTru/4wjdbo8zubkp/3MFUASkvys5Ht7DOL9e522Tx+SyAV1TAhes93IzSMSN+wrMvrIxc9YF6k9oLhksgUqpj/NAA0+NE67Q3xgLZz+cmVpDQclBlIfoEJQUS3H1HLYUcPpRc7SGuzbz/BjmfbkTH6XFFJTya/79F10weERLn+vnYp0i+tUzA8eLRDJslmC+G4dUtDpzF1YoZaxW0zA7dy8XUCM0+skLnruoVTDF8Ufue9KHyq2+CRNO+1PlFpijV9Ysoir8p
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 20:01:07.4211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af804dde-6e1c-4184-2dfa-08df060843ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_130115_514337_ADFF6745 
X-CRM114-Status: GOOD (  19.15  )
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

On Mon, Apr 27, 2026 at 02:23:31PM +0530, Aneesh Kumar K.V (Arm) wrote:
> +static const struct iommufd_viommu_ops arm_realm_smmu_v3_ops = {
> +	.destroy = arm_realm_smmu_v3_destroy,
> +	.alloc_domain_nested = arm_vsmmu_alloc_domain_nested,
> +	.cache_invalidate = arm_vsmmu_cache_invalidate,

I don't think realm vsmmu should include NS nested domain ops. I
wonder if adding here is for some covert reason that prevents us
from registering viommu/vdevice objects?

> +static int arm_realm_smmu_v3_vdevice_init(struct iommufd_vdevice *vdev)
> +{
> +	struct device *dev = iommufd_vdevice_to_device(vdev);
> +	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	// fixme which stream to pick
> +	/* At this moment, iommufd only supports PCI device that has one SID */
> +	struct arm_smmu_stream *stream = &master->streams[0];
> +	struct arm_smmu_device *smmu = master->smmu;
> +	unsigned long rmi_ret = 0;
> +	int ret;
> +
> +	if (!smmu->realm_initialized)
> +		return -EINVAL;
> +
> +	ret = rmi_psmmu_st_l2_create(smmu->base_phys,
> +				     ALIGN_DOWN(stream->id, STRTAB_NUM_L2_STES),
> +				     &rmi_ret);

The "vdevice" is for a PSMMU stream table allocation..

> +int arm_realm_smmu_v3_init(struct iommufd_viommu *viommu,
> +			   const struct iommu_user_data *user_data)
> +{
[...]
> +psmmu_activate:
> +	ret = rmi_psmmu_activate(smmu->base_phys, virt_to_phys(params),
> +				 &rmi_ret);

.. and the "viommu" is also for PSMMU activation...

> +++ b/include/uapi/linux/iommufd.h
> @@ -1055,6 +1055,7 @@ enum iommu_viommu_type {
>  	IOMMU_VIOMMU_TYPE_DEFAULT = 0,
>  	IOMMU_VIOMMU_TYPE_ARM_SMMUV3 = 1,
>  	IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV = 2,
> +	IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 = 3,

.. and we demand userspace (VMM) to use IOMMU_VIOMMU_ALLOC ioctl,
even if VMM does not actually expose a guest-level SMMU instance.
Thus, no user_data.

I can get the reasoning behind the flow using this viommu/vdevice.

But, on the other hand, I can imagine that a Realm VSMMU would add
a new flag with a user_data to this VIOMMU. Then, this flow would
give some troubles to VMM (QEMU for example):

 - For VM with a guest-level SMMU, QEMU creates a realm instance
   where IOMMU_VIOMMU_TYPE_ARM_REALM_SMMUV3 (with vsmmu) can be
   allocated.
 - For VM w/o a guest-level SMMU, QEMU won't create such a realm
   instance, while still required to invoke the ioctl (w/o vsmmu). 

Taking a step back, I wonder if we really need to use iommufd for
PSMMU activation and its stream table allocations?

Here are some facts:
  - An iommufd has a ctx, that's one per VM. Similarly, a Realm
    has an RD.
  - For an RMI command that needs an RD, it makes sense to be per
    iommufd ctx, e.g. RMI_VSMMU_* or RMI_VDEV_* commands.
  - PSMMU commands are global; they don't need RD. So they don't
    seem necessary to tie to an iommufd ctx.

Instead, could the PSMMU activation be done after RMI_PSMMU_INFO
check? Is there any reason not to do that? A safer timing might
be at the device assignment stage?

Speaking of which, RMI_PSMMU_ST_L2_CREATE doesn't seem necessary
to be invoked in a vdevice context either. Maybe it should align
with iommufd idev's lifecycle?

Nicolin

