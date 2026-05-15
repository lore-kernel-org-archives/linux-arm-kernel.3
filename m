Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33B8CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 22:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROioUmo2ON/fDHH2Lh/FNPPuXViE3qyUZFXXPbJ6x0I=; b=ZO042v6alCkdB3aOwFeM1DUi+0
	sM0RqJ9AYgVNVyt/u+/81l58odIXlRSg42znJ0GYyoRXyeAY6PxqSXUsiZzhN3SRHPHk+9bdm70fR
	88lwtHojc9AXyxSEViC82JB2MBpsC4fbkgh3wmv6b7J3Wp2rORTnf0y/xnFOEfwETROU1Tlm7OUbW
	/aqbvmMPPSdEM4BA3lfdIH4QwJYX36AiuXZY23FKgrid5UqtTK47m2X4zZdHi/RjJneZJ2928BumV
	Od9xpW+7QiEgTz0sHO/4kb/pgq7Ub6s4h/UYZf6ZODQHNJ5lgD8Ti7y5G2+3BEJ/7QPA870fQOmGs
	xvCagTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0aJ-00000009aTz-12uL;
	Fri, 15 May 2026 22:00:43 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0aH-00000009aTW-0X9Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 22:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwYGUnCx4ESH+HSaNNSylnaXCg2VbuqMCm688nbobShv4OjgKyFeyI13f8j4o/ulZX6fDMSqySbkdq0KXkExqE4At3/3JUq63EKatpsZ6lVq6Kc7Zp6Rigwo3JGEX0VcMnjpIhg+ubpbxFM6skYNaPqe5PRn20gyXQGkfqtnCny4LVkScdLVul4SOSRgHeipYnSMlDWyarrZ3IP0FTWeQCle91h8fAwX910oFOENq9ixW68k6RN6v12Vbrmb/fNiAWzB5HIeXA7amHkdCKkJN7p0npl41pv0WSX8fr9j4v4h/ZHYGJtstvXgGjyTr85G5DYij61U8m29W1ZErySdEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROioUmo2ON/fDHH2Lh/FNPPuXViE3qyUZFXXPbJ6x0I=;
 b=DqjjSfk9QQs0TzeVa9Q+oK8a2CU6ND7y0KeCvMTTxxPa+L7iK3WQl1sz4PTi7NrqrVNEgdQmF+1YuUVZaFDbNYqKhhMgmwmhOh+QDF288Ys35ohxEEfvfIY1HmIDm68miGPpmU8DYiYHeA2aB9x/4wR1vbKr2rnuoHtZ4NGdFr0VslaDJ828m9Bbzem+3a/fYa+pAlfjLEww9p6iM5MzC00SZYuQLjbWfriDp5kLJVEaJD9po28BuBuwTXOoQn2X4465MPj5W1UZwopQpUjPLzCLGnF6XCzdIql+YqRI2P++pOHdToFY6uWaH+R+TIAFjbYFUGSHbvXiEW2kZ2D1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROioUmo2ON/fDHH2Lh/FNPPuXViE3qyUZFXXPbJ6x0I=;
 b=ZMyTxVhHyzCDXCMRx2SOdXsaFtkWddMkF/YcwQlARuJ4Zzylcf1V+krqy2Z2ZnWG6RdA102OiteBL6zUwYbcXJ3ozmFd/OlexqXgo+niqJWNUUPN//5FxwOTFc29vauh+d/IZCIiA2yEXCIXb8hdqkTNwr/NLzMfwQ4hsUdxaQRM2qRV78jLSIsunntnFcsuBOodYVzQZHNvg6teeGpdangKj93pJ4SbAdPETQanhPifbg/im7qp9qh6QDIBZwrkVsNZDhdPAN1jGnYLIN90kxkYuRkSGgtRJh8F+WpalVqNNQ+fvrMsjcuR4zdzanMAyygjX1lDQCWia7t175AuCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SN7PR12MB7369.namprd12.prod.outlook.com (2603:10b6:806:298::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 22:00:33 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.21.0025.012; Fri, 15 May 2026
 22:00:33 +0000
Date: Fri, 15 May 2026 19:00:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 3/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in
 cmdq submission functions
Message-ID: <20260515220032.GK787748@nvidia.com>
References: <0-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
 <3-v2-47b2bf710ad5+716ac-smmu_no_cmdq_ent_jgg@nvidia.com>
 <ageKAQC7yAzI0xB6@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ageKAQC7yAzI0xB6@Asurada-Nvidia>
X-ClientProxiedBy: BL0PR02CA0037.namprd02.prod.outlook.com
 (2603:10b6:207:3d::14) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SN7PR12MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b15c8e-a4f5-4ac4-3ab8-08deb2cd630c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|11063799003|18002099003|56012099003|3023799003|4143699003;
X-Microsoft-Antispam-Message-Info: 64366r5cpvw3r7uZKeZkgpkWT6MU3GV6NPDsTnvjiuSOLlXAE72w0YvxWcbySu+8lSsoN0WG8hZ0fek3sztBFUPU4vYIxGG5lYFX7/chmHG6asu683nv8B0u58zHP0tsb9fOHeAhXN1dQmB3HUhr9AHx5KJjdEB0WhDQTAwowDVw/fD2F4sxax17Kfj5VwVW7b/2vZHJSweEPdDnJSJNzQ4gR3D+S3WK+z5dutMdNdC5+xouwGoRm4zTZq6IxPggmYzKU9o9b7yZevk2gHWxMAtSL662jxMT4M4O8fgQ9z+ugFO8+OTFtQA346miu4vJc27ebNS3AGpOaNHr1U9iO7xvUCGsgyS2E10OmHI1O/KSW5MkAvXiFLasP5Ce7ujHd8LkmLPQmoDSx9i6nR4fFllVmpgJsmkxm0qMF4UMs6KJxguVDxixY3bLYDEZkcDpVQs7VRhx1b/i44cNpbOQNL/MHleYS8jB+IggVqWfFrcuadfM/qZJK52y1hfx3eO5rGZjhl1taDWc1tAqumfUUJ3dS2MrFqw0XZC+j34FEApfLHD7b9vHIoG/rHdJzfvEdd1vbPNyCtN3yl9gRVYM4+Qz5Sdqhhs6W3/kIcVMj91Xy1WMQ+5Lk8VKCHTjbSUvIQHpx37lBWVK4p5U1CPjpSm8hToDy68voaK/rn1+HZ66y7bVMTmqr2fjYdBxGSsb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(11063799003)(18002099003)(56012099003)(3023799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QtIbdaFHS/foyPvW35WccoGdTEn6wzFZbaQRIE2lRyC7EJ7H/VaVtRmgxsOx?=
 =?us-ascii?Q?m4YYVV6GYCl3LDcsCzDzHSVzkbj8NuDyulc8jnNuABoHQNpoSMkGuN7oGE1j?=
 =?us-ascii?Q?C41um0DAbAqpjMtXZ46DwcHT2bdoGJ1YbPY1oA+17AqIofiVo9a/Y7VGrMlu?=
 =?us-ascii?Q?QSqYX9RV5xoNDsQbSH+0gV+i4/2vzzYHp2KtO6uYySrtSnlo/nqtafYA4IiR?=
 =?us-ascii?Q?FhG/yQ1nVfDRA4lDa96FTI+twZB3D+DBIg381zHQAFWcWOu5skHpHcHlM5ec?=
 =?us-ascii?Q?sl/zjGkqsRCY07k+9evXGRasuMQPyLPwtJSmwXjmnzugojwFMNJ+VCifhz02?=
 =?us-ascii?Q?KamVewzPp88O0VEXdol0qJ71SXAXqyTtmGYAO8ToUW6iVrAd3b0VghtzFgU1?=
 =?us-ascii?Q?UVRKwxBGbpWYIGzyZTy2sEk9S41xZkXgu+DbfQiFAdwnbZxrcsDWgblRhdO5?=
 =?us-ascii?Q?b4BYVLFCQs5R3l7i+aMHshiy/HOtVqee64YnMnsAtafo9C+Z7WFacaUsfqcJ?=
 =?us-ascii?Q?0TPSok/ekMqwDCdoFEbwgCRlW28Dq0Xc5r/uNspGsnTFifP31CZQadWvlLOn?=
 =?us-ascii?Q?VvyK2ogZFyANDNB1wD2cVJsADSxK04Jzr6VvNar3CSUA7xMRYulB2GDOIkSw?=
 =?us-ascii?Q?htbVxdjmXvdOMs+lAhSUMA2I3qXdTp30V3wNOhCHX4X8mV3wAh6rnvP2gv4u?=
 =?us-ascii?Q?4KZ9ZxErIDsO3rx7J+LZf70Vi7TZctS4ujBfrNfzGEaavvxeUF0jcEn9Q+RY?=
 =?us-ascii?Q?YVHxnGkJv/mtbg7bsBDMLF5lv1QpqWWr1QorT+8QFoqyNZnDu/0y5YDGCpN/?=
 =?us-ascii?Q?rEPFtMcAXo0exMU0SixFA6ao7bCx9WuEksTRZGmhyYu77SYENYLiRroVWddg?=
 =?us-ascii?Q?tsCR4W6xA43IFTbC9ZgeptGiU3lK9b/nTo9jk/Xkbk058TIhzEt3xyovM2lm?=
 =?us-ascii?Q?Ad6o5Gnvr+z7SrmmHvGaAZKVnChzH0e6ebkyagtTnVEGgdM8ZrAlmCHBgBlP?=
 =?us-ascii?Q?nrIXrFUnMHxQ99SQRK++zom6iI/yPcLj+GTMMIMHYKtxbQKz+hTxpi8sXjYo?=
 =?us-ascii?Q?RnLCVemVT4OBafkGnQm8KGg1jDB4IM36MCZjfIPlvyB2VfodbiP3MQZCEZ3H?=
 =?us-ascii?Q?2SYceaSX/b1R2WkAKAdjgE0JpYD5Jy50tPeX1CLfqVoMSokHZnlvqepn/uBs?=
 =?us-ascii?Q?xEkViqRjBrlEBEpRepAaJO16+Vm277zJveLhB8pkqN1AdhuuXwAwtNdGnCf3?=
 =?us-ascii?Q?5pjAp21XkzIsrrM60Jqqx3d5kev+B2BjA6RzouAAn2/dzkF2zQ/eMnbql6HU?=
 =?us-ascii?Q?HK/AOrVvZ2fGFw01QaL846n/dTrypSRtxaU+x638hYybfrnW25PW/007L0/L?=
 =?us-ascii?Q?lmwONQqISKFh1ZFjAoYVejCG4V7tu47aD67mUUbtzaTersK+GibxzThAMVgZ?=
 =?us-ascii?Q?xDVqw2AEfZ6gkXrLIf6Zcyp94H44JcGFWsaIGTi//VfKe/Gs/9FCHtmgWsXa?=
 =?us-ascii?Q?/N2/pCXeOgWRzvl9VGPM3n4xfjvXtTewWoaa5WC8Nzv3bGcoU3ApCumadVZU?=
 =?us-ascii?Q?z5t/wowe+5mfKanXmigOCzZrhTYunOXZKO7UmzxHuq2EPa1ugdGwNAZRrJwG?=
 =?us-ascii?Q?3zWF+AckKmaV5+9xZUOtash095pO9PNxyK6gKPA49eXLXkCNnHxToCOlTTo2?=
 =?us-ascii?Q?HAJwFvU9MPey7JQW2vl4BdF0VfR+bGv3anPkmeV3Zw8ySoWO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b15c8e-a4f5-4ac4-3ab8-08deb2cd630c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 22:00:33.5338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YO9eQsaHQ/DsxjznV5v3YJKa47a1DSWQuyF0WvTkZnGriKQbNu1z4QeXdcG2v3vX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_150041_173703_80D5C397 
X-CRM114-Status: GOOD (  13.88  )
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

On Fri, May 15, 2026 at 02:02:57PM -0700, Nicolin Chen wrote:
> On Wed, May 13, 2026 at 08:57:42PM -0300, Jason Gunthorpe wrote:
> > Continue removing struct arm_smmu_cmdq_ent in favour of the HW based
> > struct arm_smmu_cmd. Switch the lower level issue commands to work on
> > the native struct by lifting arm_smmu_cmdq_build_cmd() into all the
> > callers.
> > 
> > Following patches will revise each of the arm_smmu_cmdq_build_cmd()
> > call sites to replace it with the HW struct.
> > 
> > Reviewed-by: Mostafa Saleh <smostafa@google.com>
> > Reviewed-by: Pranjal Shrivastava <praan@google.com>
> > Tested-by: Pranjal Shrivastava <praan@google.com>
> > Tested-by: Mostafa Saleh <smostafa@google.com>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> [...]
> > @@ -3446,6 +3447,7 @@ arm_smmu_install_new_domain_invs(struct arm_smmu_attach_state *state)
> >  static void arm_smmu_inv_flush_iotlb_tag(struct arm_smmu_inv *inv)
> >  {
> >  	struct arm_smmu_cmdq_ent cmd = {};
> > +	struct arm_smmu_cmd hw_cmd;
> 
> Following the other pattern, this could be:
>     "cmd" -> "ent" and "hw_cmd" -> "cmd"?
> 
> That being said, at the end of the series, these all get removed.

Yeah, I made choices to minimize the diffs

Jason

