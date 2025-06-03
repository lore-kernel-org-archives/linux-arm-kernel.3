Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02A8C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 12:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7zl0rMrU+FPJ50bHE1pnO6w1R6firHoFui/VsYxgS8=; b=jmc4Cm8CRzwL382Mj2Af9AbA3M
	+ccy77pfq/x4IV6L9fryn2B6P+K+QrE00BrgrOkcw54vBFpNvUlb3/JzOtDXggActKbwuDdEpbg2F
	QSwjjrKf/E4PyazJJJuMJuSdNJapG2hcWQfXRqvMSxD55jm3K3rBfJ0DnPyrj98i8fYmjGJSmT4Tf
	zfo8K21bp4vDGXEFsaAdg9CWUIJst/M/Dt0if169laqI1DAR7f1p9brewBbeRpr2LjELBr3Hbk1qj
	XA8llERuB+8wO6/n6AJQMT8GZIouifW6n+faQb6JZlm4Cuj7hTW7bwh8BX5qOjy/9ghNZ5w3p/WSz
	AHskC7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQir-0000000AuqR-1sSk;
	Tue, 03 Jun 2025 12:26:29 +0000
Received: from mail-bn7nam10on2060a.outbound.protection.outlook.com ([2a01:111:f403:2009::60a] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQge-0000000AuSz-0Fce
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 12:24:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4TEpMSlQaZQRUwxGW0He2fx+5Z1sCntQy9xHzlU5kTJQsDCx/TCsSCodWIAApdeIMSaefgYg1of9Gx1MdmGi9J+nledFeShMvdgweoSDTlh4pUgMmGWbsDzvlDJ9S/ds4fNz7euBshVzrfvORiX7Rwers6GKI6d2EOX/lqqEC3O/iV7UCdfKUqZtnvgCLDtPaWBpu11fZcfV5w3DVANkU2yshO6q1EFscaDcYd2duUT6ITAgaZORgGwx3Ln5eIcYTaJFilm/7PWuNy9/gvQbVO/5ng17sKUe3rDbilKXgvGZZXCNPvhM1vqcl/Z6hUy44q53m5NFEqCMN0a3EZKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7zl0rMrU+FPJ50bHE1pnO6w1R6firHoFui/VsYxgS8=;
 b=DGvyQYS+xado3KYU+2BopqezdXeM725Ni9C10R4hqtKE1dti8PJPf8vbOQJbwRLtO3fKrNGYcpTzRmbfHJn+HsYPvcTcxqivCN41ZdIWoUOqZH30VpLrsshKQ3XTsVc9R6FZvmGztA26y4mKuYuJmhv+0W9qIZa+SoSOO25cAXEKzcw3cWtkq7SEtT1PXPNgTFTNs1YuZhQyeoPsaRIsfNwJMEbIOkNOr6WeTZQ0G47hnknA382mtEXHh/y7e2/mew0joVH6wmmSMd75Yi5WrTePizBgUnppQClRWfafK9SHJIdYGbtOYKVTn75zWOGa3EatEQ7yiIocacru4ry1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7zl0rMrU+FPJ50bHE1pnO6w1R6firHoFui/VsYxgS8=;
 b=otZYgveduFuUbe1yNRHOhawydy+ok2ZLkXp7yblo05WoDvr49HwL2ktPwwLksM1S5qa73D6kq1/HT/LD9KvZoND8AAo6tx/VggaJ1ecD8w5DMCvY6LMo87WGnITXLDCHII/RjdIhWFnSvWp9CwmHNnsrXdmvzNjKAIrE9WQrzMpBOxL/GBuCN18lSIQzfCLoPy0jTi0vrfPwPygjdAxf/RoY/ce3ILPuTt0LGT7yzdCHAgLeGrmHuLT046fJI7WJ5O+/j+Sx3eCTpAxOCKeIFxQ5GgLyODMRt1TzIHQ/KKHHbhnbcOlwAGaVHNv9zwkpiWziGnv+P/LxV1WKSweCJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS4PR12MB9611.namprd12.prod.outlook.com (2603:10b6:8:277::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 12:24:05 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 12:24:04 +0000
Date: Tue, 3 Jun 2025 09:24:03 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v5 14/29] iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC
 ioctl
Message-ID: <20250603122403.GI376789@nvidia.com>
References: <cover.1747537752.git.nicolinc@nvidia.com>
 <5c509f092ba61d4c0852ba57b530888ffb864ccb.1747537752.git.nicolinc@nvidia.com>
 <20250530161455.GE233377@nvidia.com>
 <aD6K8ZuAH+zjXIx2@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD6K8ZuAH+zjXIx2@Asurada-Nvidia>
X-ClientProxiedBy: MN2PR19CA0042.namprd19.prod.outlook.com
 (2603:10b6:208:19b::19) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS4PR12MB9611:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d53a748-2fb6-4219-71a2-08dda29987a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fn0bPkLnIb4Mca9CliZOIxfYjGgd4bggnWFMWXbBuxTC8Eu7ZGNs686emmgq?=
 =?us-ascii?Q?evwC9q4TAWPDuf1Ufhkfkow3RaL9YDvsl6q8juzFNhPZIP9OXsGu42QoHl0s?=
 =?us-ascii?Q?lkZFVofpnrFfIwShBOMOMgAleQCgUzXeKYbfbCUe8kdqfJ1qum+1kcHe8f0t?=
 =?us-ascii?Q?fwgXNXREwVXh7ZJ6bwUodfoqSwwL16mhGQKnvyobjnfwIoYf7TGOoJlAwmYn?=
 =?us-ascii?Q?JO1iJ8wzWoy7xos4B0mKqwqBVddtZlHHD5aUKeIOplrzR8oNOYYMDsNibhhq?=
 =?us-ascii?Q?p6bBfGtkgYLdGLrJH1lhKKzDwtiK0+wD9Rh2LIy85ifqqy2q+WVvyT0/qEK6?=
 =?us-ascii?Q?zWEp75HaJlhPPZ6hCvtKMvtd2KTT4Bp+V+c7ofJ60DsdTM9cHQo6vTpXf9Dv?=
 =?us-ascii?Q?30jB/gJYHNM36DEE2SzoDRq24p3ek7Son5QP18Mwn2lCWB1ZkQFXHgcsaXmj?=
 =?us-ascii?Q?F8/ZoVMvZKIm1+tSoGQMQQdHnhzm9eguUFKdwfxg6px/i8rvxPv1myY+ed4L?=
 =?us-ascii?Q?HfPa+58JH8jUqhAfmLsgw337Z0r8QbcBDYNt0Ou/BAyw745utMj5OTD6KwfZ?=
 =?us-ascii?Q?Hc3fS2npJ1eFoU6h9pgfQce82Wy4QEaHIk9+qQnm8a2AXjlKGGb3GSO5YCCK?=
 =?us-ascii?Q?AoUo57IGqyS1W45JYCxy6/vazggThZfE+awUwS/y5qenXCaKlgS5ooFcia6R?=
 =?us-ascii?Q?ZtPWO4xyONrL2ELJ3fYrNewxJosrbB1o719/cWm35WdWfok+vXGz8fvm0HpA?=
 =?us-ascii?Q?fLVQ7H59hQ/oD8VblynOq/oiUSzBU0LNwhYgmUFRSCkxjbvVm8qxlQ/lmYGR?=
 =?us-ascii?Q?1zQsNeEPr9h0Ax7R/TA0tDPAYh/iwxIPpDnBKs5z80KjCyIkIRlKYMMRKHlb?=
 =?us-ascii?Q?xVVU2u5DQnrh6Qdlq5w3DI38EhO34zTR3ZDRzltghQ7uALfTW1W/t9JiHVxW?=
 =?us-ascii?Q?A7KSdzG5AlhXlpHWg77jxqstsJSIMaG0Ntx6v3jxFntSHAwUK7EHc6Hkjcc0?=
 =?us-ascii?Q?Tx1bbazS9eSCiMMb+DO7RpTuCOjqttLrfnR29R5ejBleN5j/AHHEqNdXKi18?=
 =?us-ascii?Q?8MBLvqJGDxIFeda5PjwW//aF0QjGJCbSR/On5EyJKoeF6i+SDS+fx/HuulNk?=
 =?us-ascii?Q?2IyuuBLziH0AKMsZlaNUKraYC94CmIvYTb+U1Ni7liOhquLBP3NdpcqCmYV7?=
 =?us-ascii?Q?astqfYYagi49HUueuzCFzyiju3GSFEAK3CLLn/fF3+ULnMvT0VZIiX59CN7B?=
 =?us-ascii?Q?o6iYAOllkpZEVpXSVZUNkEzWwRKr3wdHiG2GJYJMCcn5KINKm1YixpK9nTH4?=
 =?us-ascii?Q?GHlXNxTvHb3p4G4hYz8uWMFY/rZduF94Wzff2Ni+P9PkCgUeHSD/f2FSfHjS?=
 =?us-ascii?Q?Z3nJ5P579fdXaPO49TkxDOrP00SPtoNBGrO8Uvu5OZwPQ4lL9XYT0JDupYlm?=
 =?us-ascii?Q?Efljp6s+yos=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j+rIE3Kd98OR2m9fJk+xnvstBPzeZgHeGSXfHuqdi2FOyWqDMcDMjiBq4KxK?=
 =?us-ascii?Q?CP+/ujJJ7IGRyncJGZu2qlGy4mEUrtm5Kl5q9W41sauCIItfGkcNG9XKXpcp?=
 =?us-ascii?Q?6UU1T8JhL+1CP8PyNe4+mu8CCwqxqGflNMlhNKc9cykGvhs1wlQl/BBKwXUu?=
 =?us-ascii?Q?+NrHO2xpCXBx69UwctPfNfJKUmIokn+35wAJ5ZBk0eFAClFqmJgrbxZJ6xio?=
 =?us-ascii?Q?cWYwn9/my/NW4YXXzI6BnflnBhO7rSSr4T+Mc2+dXAtm4ksIT+zKkzr4W8Bn?=
 =?us-ascii?Q?nRT4ACGBQwwvEMO6RijEmqmf6vDtUp+99qp2njv9iVCFuP/a6Pkd7Z8buhs6?=
 =?us-ascii?Q?csaCCBacZczUMZEudksg80kgdrn2WUwzr73n6Y+HKwkCFLLUx3HMEUulvCgK?=
 =?us-ascii?Q?wtaXypogi8I3FoQRKWucXCYjqK0z0jB5bnuxseYG7ZNWU7xidMSUt9RjumS7?=
 =?us-ascii?Q?2/oC7rfKUZQFjnXHG8/Eqz3RWgZdXGeo/GB5zOOTM6YWkUmGLHJ0ns3CC2JK?=
 =?us-ascii?Q?qjmF1YDapxJMjTyAJVgsNb/+wIf6eBo886/y98CgJtZ1wxa3bLZd6XBjiqSS?=
 =?us-ascii?Q?5f4hUFkp/JDEtBZdb3YCmY0oHbfw8qF8yhEfAFpfB15kZgTrUdCpB88iZWuj?=
 =?us-ascii?Q?MV0p5kMtPANv7kO4/FLzq8pU2x56qPOA3Zbf7fxRLK2wpgxaEfiddWpe3SqG?=
 =?us-ascii?Q?CBqBivhriM+nV+E5ymsW/mry41lwB3JfKuDLRZX74lWWvQYihaKCVg3OEws6?=
 =?us-ascii?Q?eiinUi2ntSGtNbmAfYRjcQ7ZTU8aRuqIAU1WxH5/tM2cTrsqkVE92fhIRhUL?=
 =?us-ascii?Q?yZpbt3VIWV7SAYAQB2xxBKL71lpKPYBAkEyrkmykN/AEnnYagG0p4xBQEOyJ?=
 =?us-ascii?Q?42VXYf/Gj1tjMOxnAJveC7RfxptCMslOUGcu6d1tgVaRWlY8XKrNHE5HFuSD?=
 =?us-ascii?Q?fLNJ1XUPj/ddLCX+bymqZ8F2hB28jT/RAHyforfFzdLUPVg+fn4RSEvXq4Th?=
 =?us-ascii?Q?GGupMkwzks4/V4XonORDiGGIrrGe+dPhMyveblyzPeb05KHgeC3qKT8egtmF?=
 =?us-ascii?Q?TuXZirWxOUIgviefM9ZCxyMvnZHStKd2KahFDOQVAR9KJEHjnPtOx+lQQVip?=
 =?us-ascii?Q?UGVNbwgTGA0u+z4ftrdv/HZPUibQJrv50D0R4JxN2In5btyPSOE4PZrl+PSo?=
 =?us-ascii?Q?NsSRK51U6drnaOanGSntLmWD4jmv4sC0+zVFXV32OYqubT1wTEfl0LUnUDmB?=
 =?us-ascii?Q?WcEJVf//QoXdwy+EZ80Yiq8SaNP+z/J3uHFeRRq0iviYAcRu+MVkijiWy+cO?=
 =?us-ascii?Q?ZrVeTLv84wZpaKx6MUnLhvbdve84nj1WJyaLBO8HV3nRQ6S+C6pREP0HEo65?=
 =?us-ascii?Q?foCyoSnmjON/czDPrh2h7m8+lZpjNrByQ6qaPcoWsMUrxiIl2gAa1DVZyCbl?=
 =?us-ascii?Q?nPKpQejpYhgiGkEb3CMT2RzgzdzbCQ/bsLm7lJ58+wmAZC05h38JjgTjVQ/O?=
 =?us-ascii?Q?eVG1gwFOblfxK2AKsEOjkpwted3ULCPtJKhFLuddyzdJGv6CFBEUfXPwpP1l?=
 =?us-ascii?Q?jR0mc1JMFNEadV/wZUnJWNwY/jWCx0rupmTk+by6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d53a748-2fb6-4219-71a2-08dda29987a6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:24:04.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3W58mTbafxwzHto2b5DdJXOt+YiM7WjFs17VOj4dsel65k0Tui529xZBJZutYJCO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9611
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_052412_101543_E8D85CD7 
X-CRM114-Status: GOOD (  12.65  )
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

On Mon, Jun 02, 2025 at 10:41:05PM -0700, Nicolin Chen wrote:

> I found that the size_viommu or size_hw_queue might not work using
> a static macro as that RDMA one does:
> 
>  - The size in vIOMMU case is type dependent. E.g. smmuv3 driver
>    uses one iommu_ops to support two types: vSMMU and vCMDQ

Maybe they can just be max()'d?

> 1) Define a get_viommu_size(unsigned int type) op: use a similar
>    macro in the driver function to return with:
> 
> #define VIOMMU_STRUCT_SIZE(ib_struct, drv_struct, member)                      \
> 	    (sizeof(drv_struct) +                                              \
>  		 BUILD_BUG_ON_ZERO(offsetof(drv_struct, member)) +             \
>  		 BUILD_BUG_ON_ZERO(!__same_type(((drv_struct *)NULL)->member,  \
>  						ib_struct)))
> 
> 	if (type == SMMU)
> 		return VIOMMU_STRUCT_SIZE(
> 			struct arm_vsmmu, struct iommufd_viommu, core);
> 	return 0;

I guess this is best?

> 2) Let core allocate with sizeof(struct iommufd_viommu), then let
>    driver krealloc during the viommu_init op call:

No.. memmoving things like locks doesn't work.

Jason

