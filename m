Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBE2C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 17:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8xygTO4q1lMJ7YDsexIinLkl+nP8R/OuQLTaZrLQwI=; b=3tAK28NWE1POib0Ifa6Ckmlp7K
	ACloIZxgrg/GUg2pmHVRxTZGy9M/HPiaZDxbDMDG39npmniqv2SB40JXXBiOnhRjNta7l8dH9SMcR
	5TjSp3W/SxVJW3Tg16jDAxCQOGx+umdEexPjDVq1i5j9bGil+1CyQzsswTxxTfd/vMw4mMsaOmrsC
	ll+exShGlX+9easHAS5ftv6Z594VHFSGzM0VltzVoASYz7okSc38YjkYF5cm3eOxRRY6phxQ8s7H0
	8Hoeeg1t8L2kWjP+5A896JFe3rnHxXVrZZPTeyCQaPf1B5s4ggduH+NLPsdjAbBRbZJwdBK9EVHMC
	oDCFH26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QNs-00000008xcr-2mee;
	Wed, 23 Sep 2026 17:03:52 +0000
Received: from mail-eastusazon11011036.outbound.protection.outlook.com ([52.101.52.36] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QNo-00000008xbv-187p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 17:03:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQEiRiwyFvS21TbgGjlp7Y4Cxdxb7O8mfOahma3pQsmJ3ZP4oaVl0jJDw9BuuDvgVAhUfmOQdryBlxBVxbYbyhEnu5s4IaGaVtFMId5HL2LE9Qh7V6UTPhwCDFBSl33i/d/gayAYx/EqoywzFsh5IekgEC3UL9gPc3bulJCWXkNVMlLIAoZG0ka9hu1AHCN2pH9iKk63NJRkiCTKUB65X2g/13WFIxGiO/Ny3Uj18QA0p61LEqEBzzCimo/E64WsWQBUUYJAWZ1DTKK3MRKE7bf1Q1AJUPKlTqUAdM7Ef0YxWfdu5xrJ8xVRgfgOqTmIV4lDVDX405LvgUIllOYggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8xygTO4q1lMJ7YDsexIinLkl+nP8R/OuQLTaZrLQwI=;
 b=X455d1+PrHhE7NXQ61HDdmwEPjHUZ8R+/9NZZe/yBrm8AFOXXVbE4CvO8iuWj97dJWDlsM0n1wNEkawY9nLMWMWnkhNzwvTh2g3/aFYCAaHE91CFRIMHOwJggS8PBmIVyZic7fPo+lqlwaz5fLB/FjHFo2niEgJCgkuWswqwooW5vxsjzW9sDbG3zRUOmQKaemxN5UaVXQlLRg8teuvC45QnZjKxX1lwMOPVZM72wDtPk8E7CaGOIMTiSZxg14Be87c9v6E3HlNtlLwYhWKaur8N/RqbWcctA97FIWVr7z/lAuIUqeM/SkWcMvfx540dV81f9W3sX+/Sa980jh9ecw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8xygTO4q1lMJ7YDsexIinLkl+nP8R/OuQLTaZrLQwI=;
 b=GFGvh0q2MJYNj891Eh3yoyYg9qzglttdcB8d87ijm9p5fK4VUYFsutRlHu0MQCzZj7mecvki2iSPvfdJBo3DsQmHruEOb5udo9yyDHMqgyvyQb01UNI3UuxGnn6tRItsMQX1U/kc1BhAoZUFPMwP2cfhl0fyOcCZcX73QRnCELTZYAhb+8sAUPeRp2p2KPI2Odp/yQ0eM98dgcwrIVKWW4BNzIdxANfznM9WbSf5jFEKXuXHv5YhFITXWw80UHSV/QqOSa4GBsIzYbEPXGP0qszUXxFV/3z9StTMJ9zcS/7wJOvDGr5cI5+HJfauG/Q9R8Fsh8dkDYwJwmG5cBoLow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14) by DM4PR12MB7574.namprd12.prod.outlook.com
 (2603:10b6:8:10e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 17:03:39 +0000
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5]) by LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 17:03:38 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 2/2] iommu/arm-smmu-v3: Default queue depths to one
 page in a kdump kernel
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>, 
 Jason Gunthorpe <jgg@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
 Mostafa Saleh <smostafa@google.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Krishna Reddy <vdumpa@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Breno Leitao <leitao@debian.org>, Kyle McMartin <jkkm@meta.com>, 
 Usama Arif <usama.arif@linux.dev>, kernel-team@meta.com, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260909095228.2174031-3-kas@kernel.org>
References: <20260909095228.2174031-1-kas@kernel.org>
 <20260909095228.2174031-3-kas@kernel.org>
Date: Wed, 23 Sep 2026 14:03:36 -0300
Message-Id: <179018301690.3334538.4814198445884368343.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BN9PR03CA0618.namprd03.prod.outlook.com
 (2603:10b6:408:106::23) To LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB325698:EE_|DM4PR12MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: 787c46e6-1951-4796-17b6-08df19949ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: OUtGQRYuXvfq0OmWcbX+v+813LWJWtYOPpOt+7M9E5lgdTglwLOQhgbaCDVabUmYan9FmjlHJFoEDgJM/eKlRtC+zsZsMy8H0IRHODyU7xwkN+tIYmXCFBzZMhT8MctzktAMSUcfm6cjSsr0K+1mhRldJanH2Bhsw3ioLHUrjOTZzo5YZNp8PGN9zzGQOro9E4k/uIi2I2T/XASY+G1ZU4Z75By2rk3U/sJh7YwP7VnaHM2EZC+Ly29qKGgb6+/Aw4Lcn5UFMvaJxCc8MpZDIc3i24YLwzv7QQ3P7jNYQJo3qtT10q/ntcFCEJ8zdr4I+tOMX+L3ALj2h68QyfwzoiXxEe7uK8jUjte8qk9sBRMJBCOqABbJvl0bYqrxNWit+niLHEUpXQmumOUsYq9eZESBtZfPe64YhJZrb2uLKFAVdLvpR2/YTmvpeyEjYl4Exju5UywYlRifTO/0zaygeLXcNazTd0fN66z5Mt9by3t7Tl0qrx+eLsZd3UWdoWKPLwIwoYDitj3oS/2dHPfKZ3hQkzuAeubzdLAVc5d39XeEmDZ3XstRgvQzSu9pM4fhKA0MnEsyq8nj4Jg+K+9cYCfyrJruUPt/ff8TjdFbbIDHxIZpfOBe6EerXhWEzVDgse20aa+V4oqJGTHSK3lZNfxmSl4y+BVvd5NO/4Nn8H0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB325698.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elEzaEZJUWw4TmJEeHc2VElZMnBZUVBVYWJjL2g3Y2puS3c1d21UR3dabGVn?=
 =?utf-8?B?NGg5dlZyY1BNZStVTGRiYk9UQzhkUzFYSi8ydnVRbThmUDFMOGtQRXdGMHFz?=
 =?utf-8?B?Y2V3SnBvbXR3YTlWUFkrUmNEY2JHT1UzaHhvczVPU2ZQVHNnOHcyWlZ5VFdK?=
 =?utf-8?B?LzFQYzhPTXFvMURrRUJOek9tQVAxM1FRRUxjL205VUJ2RHUwZ216S1RzLzlY?=
 =?utf-8?B?WkZlRlN0NUprK1hnblB1UVlTd2FnY2hWcDUxNE8yMkZjV21OcVM4ajR6YlFF?=
 =?utf-8?B?WGR5OFp4bEwyVDZTeXorSDVpTk1kWHM2V0tTSGxwZ3IzS0YyN2o4SVhlRFNt?=
 =?utf-8?B?bmFPTWliVEJSWVdZcW5nMXZidW13c2ZvK2U2Unp1MDF3OGZ5M2dxYkxPbHlL?=
 =?utf-8?B?T2NIRHVDZWRiVUdNRU9oR3JnMk03WnJpalhZelZKS2M4S1JoSERBQUdRU0F3?=
 =?utf-8?B?amhvUEdONTdsZWFOaVU0V09HWGpXV2lDbFZBMitNZ09ZQmp1ampiNW0yRy9i?=
 =?utf-8?B?bit6V2RidDBFNHZPRmRkZEZtckpLYldvU2oxUUxpWDFMU0RrOUZQaFE2OXRq?=
 =?utf-8?B?Wjl6VDE0SmRiU0o0MnVBZ2wyZXJoN2NWQ1gwRmJ0VjdCdFZ3YmFEYWZiL2w5?=
 =?utf-8?B?NjBvbWt4WGt5UWNxVlZGQkhPZTFKRDhTY0twamxBMnVubHZUa0RHK1gzMVlS?=
 =?utf-8?B?VG5VUkx6bzR0UEQ4MDlreDlnU2xYUHplZzJGTURPOFNoalAyZlFwajk1Nndz?=
 =?utf-8?B?WFBZd3M1T2JaaVNrWjA4b0tsSlBFa0FLcmZOaTBobFRtYldXblg5Yy9UZnZX?=
 =?utf-8?B?Z0RhZXhaTUlTbDhILzhvbTZnQ3hHYXpjK0FmZ2pPaW4wU1pDdU8waFBJNHRy?=
 =?utf-8?B?TTBhVzJIQ3J3RmxDVVN2WkVyZ1pKalF6Q2RyaWwzYy9KZXVXT0t3aEp6bnM2?=
 =?utf-8?B?NXFaMGhzaWJCbXhXVVJYQXRsUWhxSEFWUVUvTFBkaDF3ZmowcXNXZ1FwTHpa?=
 =?utf-8?B?L0VVSisyWjF3NDZCSTV2N2svLzVpMVE1MHUzemJjMHowMFdMVndFYzZlOFZK?=
 =?utf-8?B?dUx4REhFMGppNGZRWFY3ejlDdmFWUWEwM0dnTFNPSUVDWFJjNEpQaThXOEJk?=
 =?utf-8?B?eWs4S1BRR2gxd2FYWmdGY3BmYWZBTDdpcmdoaG5PcFhUd3NQWmkyQlVsUlpV?=
 =?utf-8?B?WDhuaGlVSUF5T0sycG5QTko3M0FmbzZ1ZEVPM0xwNS91TVBack9hQ3hsMVM5?=
 =?utf-8?B?SVpqZWwyajhMNjZrTWpPa1NtbzNLSUpBUUViaTVUOUozUUJPY2dTeDV1eU5s?=
 =?utf-8?B?SzRUSHByNmZSK2dSQUszK0gyZjEzQ1RYSGRmQWNLdDRtRzlzK0x6Y1V4dWFE?=
 =?utf-8?B?SFAxeFhHaTlNeEZ6U245LzJ5cEI3eDlnY2ptMlFCb21JQlc2cFY4akV5dzR6?=
 =?utf-8?B?ZDc2eGNoOFdHNXJyWlZvM3hrNmZmQmd6c3ZjSG9ZREp1Y1Y4QWtldDR3anNM?=
 =?utf-8?B?L2V3bUxJc2tQV2NtM295Q3VSb0NVNmtSM1d2VzA2NU40WWFTeVViVHJZSkV5?=
 =?utf-8?B?Y0tyWUdIUHlKbS9vVStpaHRGWE40aXd3b1dKN2N5eGhLdWcyK1l2d1hpeVpK?=
 =?utf-8?B?dWR0WmNvZnZxUUtpUUFpTTR4azFaMVNjZ0FpUDRVNGFrc1hRWTlqK0tIYjhj?=
 =?utf-8?B?OExEWFRaQnZ4ZTREL2VUT2V4M1hnR2RSN09kMnUxWXArUnAvU3M3YlEyczFT?=
 =?utf-8?B?TnBLcDluaDBDZWRHRjdpb2kzTVdkWUFPNm9YcDI3QTc0ZjUxLzlyMWx5bkw0?=
 =?utf-8?B?ZW5Md2N0MWRldDNjR1JkcmJDNkQ4U1J5VHhNZTdNNnMwRUVNcXgxeUdHN0Nh?=
 =?utf-8?B?UkYvTzBRSVo3Y3JwZmRjZHhMU3FMOGRoNHo4UWdmR3FhMGZzcEh1VVFrbHJq?=
 =?utf-8?B?T0h1blRHdW1MVG00b3ZUZ3BSVEE0QUREQWYwbDJWMms2azA2NCtqR2pTLys1?=
 =?utf-8?B?MDNOem9IbVVqTDVOU0M2LzdiV1hLWURvbFpFSWd0dm1MS05CamZ0UGk3dlAr?=
 =?utf-8?B?cTJkNFNWWHNIK0FBNk5yai9FYjNlbTdiWS8wMHJKR3k2V09XeTB3NmphRkxW?=
 =?utf-8?B?TzkxYkVzUStKZFpzOHFnOXdnMUsvUFZmc01YV2RnVkZ0aXhaUTRyRnk2SDBM?=
 =?utf-8?B?dWdYK0ZqOTBDTDdBbWpiTWkwL212RzJRNGR4RWZ6ODV4UzgyTy80Y05ZWnd6?=
 =?utf-8?B?QmlpUmhsTDRaZW1uZVR0ckt4VlNhTFZxVkFTaFRxOC9vMXlCd25zd1NMd1A5?=
 =?utf-8?Q?eQmBL8TsWAY3uXsMCF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 787c46e6-1951-4796-17b6-08df19949ce8
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB325698.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 17:03:38.8995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hg6C8H1iR8eQxSMe4mXEkTmX8HLWdomStCUm6sY5pGca2KR7X0AHm/o+2ytu8Y92
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_100348_636064_A1C5F9A2 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

> [ ... 40 lines skipped ... ]
> @@ -4432,10 +4435,30 @@ static u32 arm_smmu_queue_max_n_shift(u32 ceiling, u32 ent_sz_shift, u32 shift)
>  {
>  	u32 floor = PAGE_SHIFT - ent_sz_shift;
>  
> -	if (!shift)
> +	if (shift)
> +		shift = max(shift, floor);
> +	else if (is_kdump_kernel())
> +		shift = floor;
> +	else
>  		return ceiling;
>  
> -	return min(ceiling, max(shift, floor));
> +	return min(ceiling, shift);
> +}

The logic looks OK

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

