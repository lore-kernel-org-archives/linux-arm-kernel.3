Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B30D3A681
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wywf+WjxkcYsKm0sj94F7Vq9koNkB60UEnjqYCVrlA4=; b=afPdjW6aU6/HSVuRSm+WnYOjJ6
	KHDnB8B22PScG6s01rzV7T/Qtt7MwnxKFHKRA6hZEyVAaXrX9gkt+F2cunn31oIswhJE+uiSQ2lf8
	LAJ3EDecuGVSFLL9GwUQzlwCmVZKaOfrlLRc5r4ljQUkDapGlg3hGVHJbOKThEnmZQe88cZTMgNGV
	1A79A2lQSMEq7Ktg9NF22g7X2JAEphkgX6wd9ZiFJP1Pqfq7ED8EPtwNy6R56VxiR36xRiQvhRBPk
	hQB2zV0CKXASi4aL0SgX+36X0F/bEP+R53m3ge/aiy4ua9Exj93JRRgp2WzopbLD9MmTYaoa4I/xi
	Ny9egF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rDm-0000000FWjA-3IgT;
	Tue, 29 Oct 2024 18:45:38 +0000
Received: from mail-bn8nam12on20617.outbound.protection.outlook.com ([2a01:111:f403:2418::617] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ovR-0000000F5p9-2zbD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:18:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqrpLWL0cT8TvwK8hs0qGoYWiLT4LFpFZ8jQ6TW2OrrIeLHfCJsldf61Y356y4e6bVyU1NyhBM4morpYoLw/pD3HcZVG0uqMvtgie4UmBZX09YEwEiGkGoDkDV/aahh/SHCcr1S4BFgUiBJTlJXVrrcCqiMbdztyvslqr6yNh1XPxyHVnToyAGyUl68ziSSwbNFVhNihTr2m8tn+7ZlgRqmChWlckV/1RRJGzgpc/qJQJ0oRN68sZUOp6tNvGtw4ED6mTHVQHaurZ5wVmol5dY+WF8J2JvrbJvr/l5TvQcizMmy2u/bZk0N44QzaRkdkLvcliABiME7Hw3qVjWvbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wywf+WjxkcYsKm0sj94F7Vq9koNkB60UEnjqYCVrlA4=;
 b=CsRQBEOfbl/9ft1cs6lD1OZtLxCh9BxFVukRe66fCfg/5pIjuyOceayL0eNEfemzE281d5lTDIj7kWyKOngKDnNHyDGTFlSFFRkcPsw0+kz+93Jy+9oz3YyMRx6SRMsu/SW+eEjGJsk/whVHRHYZba9iXxzap2jbJCSeaMd9XBuNNbh1fL0s5X3KpUi//Jq8QbI4k6M98uW0dPpL6H6ZgRG4zL2BonVeU4NdkhnI4ryZqnJ6v217q3FWHK00SThmkUjrbK6M3J8Pgvvvy77Ze9VbpeBAspJ/CO/r+2SHyokwpqh7PjPmNrnMV0sJnWRXEfk4/21CNrbjfSSnPaubNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wywf+WjxkcYsKm0sj94F7Vq9koNkB60UEnjqYCVrlA4=;
 b=j7mPw2DsBRt//uJAoMlRaB3No5wEyc20Qkxkm4c9nAyvgpXvdpT9hV+wcV3dnUuzRWQk3rsRz8HjIKCbR3ZE48KK8ZjVDNuTegOJTcrYRrDqJJCpwOuILDnCG0DZla8v7Q9K32/nT4/UTZOJkogPFGIsgyKS7poVk+UFZO289fLM4GVaGf+5K0mx+G/yOF0UrjiDbKdDQUCdumVipyKRU38858nLFV7GjZ2Yiq6U45Iqqx64fO57VvfOzRkKgMM0H6XENilptN18Kn6PTCnEsGEP/kFWUHsuRYqeNSrpuyIhJu9IELNrZgQONOvfuX4lY+25tlp2MfshISdm/z46Zg==
Received: from BY3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:254::32)
 by CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 16:18:25 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::cc) by BY3PR05CA0027.outlook.office365.com
 (2603:10b6:a03:254::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.14 via Frontend
 Transport; Tue, 29 Oct 2024 16:18:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 16:18:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Oct
 2024 09:18:09 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Oct
 2024 09:18:08 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Oct 2024 09:18:07 -0700
Date: Tue, 29 Oct 2024 09:18:05 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <will@kernel.org>, <joro@8bytes.org>,
	<suravee.suthikulpanit@amd.com>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<eric.auger@redhat.com>, <jean-philippe@linaro.org>, <mdf@kernel.org>,
	<mshavit@google.com>, <shameerali.kolothum.thodi@huawei.com>,
	<smostafa@google.com>, <yi.l.liu@intel.com>, <aik@amd.com>,
	<zhangfei.gao@linaro.org>, <patches@lists.linux.dev>
Subject: Re: [PATCH v5 03/13] iommufd: Add iommufd_verify_unfinalized_object
Message-ID: <ZyEKvcpgUsS1nCEg@Asurada-Nvidia>
References: <cover.1729897352.git.nicolinc@nvidia.com>
 <e99946ea0128370349373c94339d465397946137.1729897352.git.nicolinc@nvidia.com>
 <20241029144907.GB209124@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241029144907.GB209124@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|CH3PR12MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fc50a2-03bb-40aa-83b3-08dcf83550fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z7xNHfJ0DISxTXvb58qOeG4Tl/w8hyLOk1chRTVMgXh2VPtdZrxIx3SlIvIZ?=
 =?us-ascii?Q?TLkKW+J7ADCI3HGxlhyXgNTk9vM1yauTuheKkwCVDsxx9gfkMZDxLFp24E90?=
 =?us-ascii?Q?W4dPdMylS06mMUQZPw8X/cYUM70fFjFSEViV0zf+OcFNeBqq8w4Ze5oY69tF?=
 =?us-ascii?Q?HObvye26rpM4RHRJ4NfRhtkosilKYiL0q5cdLwvW34DSaFigxr8zgjvNYLyN?=
 =?us-ascii?Q?fZLcWx+QL3o+atD/OcRCWyBXx3Z1ksCKxHs0lNQe/9+AgjiZAxZpfgbRu/se?=
 =?us-ascii?Q?w0hcepBCYXgR4M9+nZ/kmkXuNcPfP/x5FscWNxLmx3y4SlnGo9Uh6sHRO3Xn?=
 =?us-ascii?Q?6lTAIj1FSPEVithkbKAlZgIlcnp7h+i9sgcdI8Pmd4zYjNJM+MYsnSciy9Jd?=
 =?us-ascii?Q?j8IqEVQbv8ZOza7zWmntmvo0Xoxlcy5dQVnQp53Bds1aJAQrfHQWllcdtL0Y?=
 =?us-ascii?Q?troKoAUkAf18bRQVwZv0d1IUU78kroZpLEYi05hmsuLfz3OOngkWN98udDeD?=
 =?us-ascii?Q?y/817DfcA3o3DYbJBxGQ/HMM+a4gScj7JyTzMs+5b1eTjgVDH6G46cNVuAGn?=
 =?us-ascii?Q?i7mC0OhEEjm0A5IGx2X7JM2dMuG+RZDOt/IYT0PP5AeElr0ElWZoHTq46afa?=
 =?us-ascii?Q?Mrye5Wkd4zYrst9WdUDwcazBTSvVcQ/ewlBV8MQpg4fAFandJB7+1KD8GU/U?=
 =?us-ascii?Q?LWsx1NwZII9LivzMIBfOZqjf/xYJ7z6tHVZ+0KUCH56ZjX7EotFnjUdzNXBU?=
 =?us-ascii?Q?U15ZSVDqfuVFt8i8B6N4hx1oI+Ah20eFIKQiqg+K6KjoTkTtmi78KRiG7VQ2?=
 =?us-ascii?Q?P54lvw+PSeTODz2Y6zEEXvZLVte077fR1VVI+Lt0yYyxcKluVuuW5k76v4f5?=
 =?us-ascii?Q?mAPC9HJ/zxEDkAA+bP+ZQZ4cpPSwNwM97nKPbgZiQRTekkFG8LJA66oec12d?=
 =?us-ascii?Q?J/fap0Gklbx2ispWoO5/6y9cg3rJpdWVTKGvaVbHKfgXJgcc9i+mHX5F5E7q?=
 =?us-ascii?Q?jpGqLPif1EqIDiS1hiFfaWd9xYVfOgwD7sd/58jvi2TwCHBPn1liaojT3/Yo?=
 =?us-ascii?Q?b/HMRm+m0O9uc2D3oAe54LpbD0hT/rkwKwVfbROmBMU2zIC4o4I/G2wsnv7D?=
 =?us-ascii?Q?PQNGpCCT6uS6EwsOU2GlB/yAzlF3SFHRMBzlJ3oyl/Z2q1Fa4Om7k8aPzUyS?=
 =?us-ascii?Q?J6YwPUByUF/IotPRYjbzqJ2SkqUuhREFQBe6VYbGvxJalGRxpyS8UaNUSitx?=
 =?us-ascii?Q?lpvBJb90lYLTnSK8ZmUix/9kabqFogPnqvoO/+cxzCdNcCHukEsV91Q/J6nV?=
 =?us-ascii?Q?fH5nlhXMUrGTgGRl321L96iC/FvGHy4J2cHc4W9oXFJp6yiznmSDiGOnK4dA?=
 =?us-ascii?Q?HBoksIaIrTwgn+oSuLY01Zkp5SHE2QzkBYJRhdmKT550EpGfhA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:18:25.4199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fc50a2-03bb-40aa-83b3-08dcf83550fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_091833_783267_C0ED0AAF 
X-CRM114-Status: GOOD (  18.22  )
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

On Tue, Oct 29, 2024 at 11:49:07AM -0300, Jason Gunthorpe wrote:
> On Fri, Oct 25, 2024 at 04:49:43PM -0700, Nicolin Chen wrote:
> > To support driver-allocated vIOMMU objects, it's suggested to call the
> > allocator helper in IOMMU dirvers. However, there is no guarantee that
> > drivers will all use it and allocate objects properly.
> > 
> > Add a helper for iommufd core to verify if an unfinalized object is at
> > least reserved in the ictx.
> 
> I don't think we need this..
> 
> iommufd_object_finalize() already does:
> 
> 	old = xa_store(&ictx->objects, obj->id, obj, GFP_KERNEL);
> 	/* obj->id was returned from xa_alloc() so the xa_store() cannot fail */
> 	WARN_ON(old);

It feels unsafe to carry on the iommufd_viommu_alloc_ioctl() until
iommufd_object_finalize() as the function would touch the returned
faulty viommu pointer? E.g. what if the viommu has an even smaller
size than struct iommufd_viommu?

> So, we could enhance it to be more robust, like this patch is doing:
> 
> void iommufd_object_finalize(struct iommufd_ctx *ictx,
> 			     struct iommufd_object *obj)
> {
> 	void *old;
> 
> 	old = xa_cmpxchg(&ictx->objects, obj->id, XA_ZERO_ENTRY, obj,
> 			 GFP_KERNEL);
> 	/* obj->id was returned from xa_alloc() so the xa_store() cannot fail */
> 	WARN_ON(old != XA_ZERO_ENTRY);
> 
> It is always a driver bug to not initialize that object, so WARN_ON is
> OK.

I think we'd need the same change in iommufd_object_abort() too.

Thanks
Nicolin

