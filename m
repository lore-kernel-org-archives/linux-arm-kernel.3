Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA46C5DF98
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 23:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date
	:References:In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUHyE3zMRsWUfjOxtmDvHBuaT7MG6QQCdcpEBcCP+2Y=; b=c/oE5ibVvR3+bF1mUx7BtqfhGR
	w7aSc8a1gayl80FY1jSvKJ0KkJNu9X7my6M4nBz8egXdpsK/aiihAyTw/cPoQPJeDdKi7RUySBCVC
	XENFa/dgtyFnQWye5lfhWYn5a65VLDhYBMxUBKQSPRRwrR+g11LpNAPiyQzaeOKUbE5xZLiM1G1oe
	jVkeL2Oh74Jq6Kv63JF7ZPd9O/REpZhXibJkpA29ugVStCUS+ZLg0Mnj8DnapIV5AnHM0chHTEXFu
	QOq+HrI/My1fxhan/gJXTKgMcfEYqO/7xVT/8DipAh0szSsJF0cXWs7cktDNiHPPjPsftNc33VAbM
	GYa3X/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYSg-0000000E8W4-2j9M;
	Fri, 21 Aug 2026 23:15:46 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxYSc-0000000E8Px-35qt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 23:15:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0EcFxfG2YWhY6N5sheNWFvzYBph1VoiuinmQZhsrubg3mr0whJIyjtU/eXRbqUMpqTTlj/j8VQNBRXApZhg8eNKUcqsPY/45/xx8vWOoO1eq//6bTmocik4B83I1/6W4F13sZnCfhpnhT2DJLfuxotN0Q39YREeelfMb5bWNwH7VKmlpW4H3x65Ob3cz0MR8Uds6nrpCq+eWISuuWqMB/Mx9ThnjHhf4QpSvZ5zh19PypTuSoxLurQfSdWz3NJ5iyRmoqpyzSAMEsFUsfZvsQSwvAVF+cgQq+wIKP7EY/qVHUVhoJ2gtrIGMPkjqFTbaksUpZIJRkQQDidK3gvzzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUHyE3zMRsWUfjOxtmDvHBuaT7MG6QQCdcpEBcCP+2Y=;
 b=v01K18+KhhiW1C0UauhyoX4sBaM1C/KskwvhkaEuZbSYFJH359uQ/FTYCdp+DDuDJIz2nf4Xz16/Zdy+hialofQqT6B979jmTWueRIfhsxr2t7OW+xl79vngkPnGe7uzy2eAJ9+okGQlI9JVPwT0Mu6u7XKXadhEwRjiFGxC9Dor8mMCiD0UJ/N4o/QfLaZ0hhU98qDZZfgk6KGBwEag/oeQU9H7VQ/4Gj0f9n3WX89q9GgmVIrx5Ez6tqUL+nuy6lYmaV90ieCZEwDrysEIBmizvy8YEGGxg1BqCffOlaKbTLyP/QY91XivXMl35vpyAznsszaUgSplFM/CDSUA9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUHyE3zMRsWUfjOxtmDvHBuaT7MG6QQCdcpEBcCP+2Y=;
 b=uagC9c8nFHvhS5M5fUTESDEl2yuI8BsGmTLYXeWTZDnryZuxhhR5UDr1UzoFe5F/FzDi2M5jwdFXv2j+twzqMBoWk+oJA4J9OWSUhU8lIbCeMA4SlI/3dQ8Zvpj+BOBOIABBNMUM2qw2pza2xp8qMyHhj0ZPcjFRVrcHMr4l+H7Un+4j8DxsrEZJHU7ACPPa3YxPuD6bj8tUw/kc1pQWW+c1toKur08rKf4e1SAuiN/KB2jNqw6Q1NHzUS3b88nv9bn1wQvmkrwNofmn5Km7+H2mas6M5o1MhFGf83d+o8sd4rvMGvt6Nam1vwDvzdXC9beYdtxIBYL+YIYnM0H+Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL3PR12MB6402.namprd12.prod.outlook.com (2603:10b6:208:3b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 23:15:34 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 23:15:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 01/12] iommu/arm-smmu-v3: Do not enable EVTQ/PRIQ
 interrupts in kdump kernel
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, 
 praan@google.com, kevin.tian@intel.com, smostafa@google.com, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, jamien@nvidia.com
In-Reply-To: <35000f29472b5e12114073d614168c251551ff0a.1784663184.git.nicolinc@nvidia.com>
References: <cover.1784663183.git.nicolinc@nvidia.com>
 <35000f29472b5e12114073d614168c251551ff0a.1784663184.git.nicolinc@nvidia.com>
Date: Fri, 21 Aug 2026 20:15:25 -0300
Message-Id: <178735412597.18212.9285735691655908532.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: YT4P288CA0060.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::20) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL3PR12MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 789cd68c-94d2-46da-7541-08deffda1899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: GAoed3aStD68WQPf4whUO3+BK2C6KW+DSbSvxO4OPhtRlpx+8sOXV/AM3bOyGup+pAnvtNLS6uE/0qTOPG0kLTRdMhYUAAtVSZI+CuqgGcTeAqeK73b9JnBrlJKr94u21eEABqUb0RuqzGty1bpNy03Qw+IJP+6c9YvqH7qBF8GZSD7C1pGsX62xx2Blhu5+8WEGyo0NLREDFA4N/UPZ49InyM5e8tCgoiEhFAZXN3C5zDblTqWT6mCgIAAniF7c0zNw3AafOR0h+mL1Fc++UNFDw6wE2btIKJg8OS2YgFfNNf3b40x4NmwBL36BUrtJzKXjVhM587vR1QiwZAxBrx43c8KxtIkMLMPm7hcf8YVSoNCHDCtbF/3STukNhSds5zUQKYo3p2GTPBiPe81EM5qGUZd/dbkKNFSrbruRqbEIG3RrAdMmenR6e+HZRvWZMHgjF4kMzbnp+d51U2xLcUD+kgOkidr4ndbAasi4QMjE7c0MBIEA8LH6eSpHELNiTVzUj/VFVljkyNtdbbk7TVWuZFJ0INWQ6n0XmqmvEdJIbu4iyPVtOfFjhxZ9orFIz7NvNqiSL7p0VpKaf1+hiHGrHxoRq9rWTqxUq1DeEHFpJN7LPyCH8r5B+HXb7cmyOWPx804KRCZivcxhGQuBCmmp/Ox+T/zMieWKTjzhnKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHJDTUQwTmpYSGloaE1SN2I1NlRFQnBuNHcyZ2FpRmRTNlBnbGN4SHVCTElR?=
 =?utf-8?B?d2VGTTM0Uk9rZHdjZ0FzUDFKaERYZ0hkUWY1YW9uMWdITzZPbEEyOVdoVUY5?=
 =?utf-8?B?TWtJSmpUK2QyeGdCeXpvZzVXSFNzdmtCNVRpNDRQdzFWdmx0bEJyWXQ3Y1N4?=
 =?utf-8?B?OXZLNVZpR2ZjTnkwTFNnYTdnaWRMNUt6ZVEvVmZIY0RqUUV0eWloamVSVjdK?=
 =?utf-8?B?anJjcFNBbmpCTmY0WG5WR3ZjYnNKMHByNjJBTy9HcEw3ekt4cGY2QXRUc1Rv?=
 =?utf-8?B?WTlNT1RaSTZabFRPSy8wcTdMZmpyekl0eERoRlIwNnN2UHpHNWQzMUt4cmRU?=
 =?utf-8?B?djlrMnh3aEhqUzlxOFR6cUswTTVUam9wc2g2ci9tdGVNaUFpNEx6a1ZzVy9k?=
 =?utf-8?B?TmJySkhUVG5KVEgveHFMcG5QNWZuVnRHMDBSTUxxRVc2WFpHVXdLdHlTK2Q3?=
 =?utf-8?B?Y3FGS09zaUdMcWpxNXVtUVNvdnF4MmduTXV4WHlSc0pDRnZGT0JiWW9xNm83?=
 =?utf-8?B?QittWVA1SEdZa1IydmJzQlN0MEdFUWN1blZKbU5ZRlN0WThxYTBFVXB4dmVD?=
 =?utf-8?B?K2JOV21nVXhlLzk2VGtDTHkzaE9MOXZFSy92TXFObVMvSzhTdjFkNXplSWN6?=
 =?utf-8?B?NFdoZm5UWkhpRmEvVzNCekxVWlN3NEc1MFltRnhYakVuV2Q4SzBSa0J5bFAz?=
 =?utf-8?B?a201VWhKSWcyS2lyTGNTVmw0V1NiSUVsa0FUVzlxTktxUkJtVXUvalUvempi?=
 =?utf-8?B?QXYyS0tCZFhSdUJBZS91eEZicU5GdFVROTIzTStvbDllZ2ppNkJWVEFQR1Er?=
 =?utf-8?B?RlF5UHdvL1pmNitIODJQWVFsUDJvWWYycTVZelNzUmE2UmFtTVN2UTZaRWRq?=
 =?utf-8?B?SUIwUEdwY0ZhUStZWXROMWFyV05NR0xHT3pickJpKzkvcWQwU08vMm44bmhB?=
 =?utf-8?B?elBNK090YTJ1SDNnZHNocDZibWsxS2NmK3ZsSWtkRng5UGNWZHEydHNsMWlh?=
 =?utf-8?B?blMyS2FDWEUvbWtvUzV6RDBwWEMyLzVLK21MclZ5L1NoTG1ENnMzUytiSVZu?=
 =?utf-8?B?RmRIay9pd3BiS3h6YVQwYlBGOXZmWGNzdXgzUXhNejNMeVpUY0dEOUQxUEJ3?=
 =?utf-8?B?K3M5Um4ySTJ3dVZkQm1CSlgyYTdoK1lxUVpHMWxEeEhFMVUwMmNoOWFPdC9D?=
 =?utf-8?B?QkFXMnh2djBSY0xSUHo3WVMvTnBSYXpHbzRBelQ0WUJRRUJESkk0TUo5Rm5K?=
 =?utf-8?B?RGsxUkIrRVM2WGs2bXBjbWxKeVZyTGZzOU9mbFdiYTdJdjJTVjd1NTRWQTVn?=
 =?utf-8?B?Mk85ZEZxdlJGbGRBVXM4eUFKd05TUFlRQTlLWC9UOGR5SUhWZTQ2SHMxQWxw?=
 =?utf-8?B?cWtneklOU0owcU0wNFFOMmRqVHNhZDJmTVBoN1hxc1Rtc0xTd3crVUQ2MXl6?=
 =?utf-8?B?WjFIVllwWHltamQxK2NNbURoWXczbnNRYzk1VW5KK25sTmFuR0FLQzhvV2RD?=
 =?utf-8?B?WXN1TjdrWWtabUpWNktQR2R0Mmh0aG5SOEhzQ1hBUitDK3VRZmJnVUp0azBG?=
 =?utf-8?B?NTVjN3JwdTNlb0tSOGJreUVzT2x4WW1CVWZFMlN4OVN4SGUxcjYyN0dsS00v?=
 =?utf-8?B?NVpSQUtqSC9aWWtRaWNlaWhHcUt1d2pNMXBqYVBPZ3dRQlZPSmNyNTJIcXp3?=
 =?utf-8?B?d2Z5ajFXd0xzdE9veUo3TFpldjFUOEgxMzVFT3RvVXB2cE9BVFpBTG9Mb3Fw?=
 =?utf-8?B?b1dhaVQ1bkgwNG1ndmNVZFN0eW0rNVpVOXZ5RXYyOWZmaUQ0cklMSkhKZkp2?=
 =?utf-8?B?S0d0NGt3aHYzRmovSUZWVEVmMmI4QzlJQlRFRG5LZUJkQ1c2dWl3aVlQVWw3?=
 =?utf-8?B?SElkS1VEa2ZQdmIrZ2N5NVdQSEZYUjZ0cjhhc1pDYlpyK0x1ODRBR0FwenY0?=
 =?utf-8?B?ZHJZNXlOUzQ1WHBqcnRHT0pwR2hGMkxJU2dKSDR6WTd0RDQ1K3E5S244ZXVD?=
 =?utf-8?B?bnAzUERCNlM4ZTQzQ095aE5uL0Y1YUUvU3hhTlBOaGJCd3ZBNE5JY2pQWHZk?=
 =?utf-8?B?OG9uaFh6cHJGMVJsSHRSR3RNdDUycnZlTXpTRXZxSjlFQjJpNXplLzJyVVNt?=
 =?utf-8?B?NFZXWGhkZHNpaUsvdDdZRW9HWm9TdWluT0VZVjVTbE5lOVkzNnNKZUxkWXdM?=
 =?utf-8?B?dHlxNWlOT2JKdEI5ZnFaWHFuSzJiT3NVYjJsNkhsVHAwemJDYzFsRXBqMzB4?=
 =?utf-8?B?NTBZMzZ1c0Y0NjdYTFZYZFc2NVdSS1FaK0dWRkl5Z2RtRHd0Z2lsRVVxc3F0?=
 =?utf-8?Q?nq5uPonoHktDTi+Sx6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 789cd68c-94d2-46da-7541-08deffda1899
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 23:15:31.5584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAwJu7H5LKymYsA4eSTd/Q+mHc3YMJOcHdpsMzcIVvs3RF3VOEDvjrCsyUFM+r8p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_161542_791700_7665665B 
X-CRM114-Status: GOOD (  16.53  )
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

>  static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>  {
> -	arm_smmu_gerror_handler(irq, dev);
> +	irqreturn_t ret = arm_smmu_gerror_handler(irq, dev);
> +
> +	/* In kdump, EVTQ/PRIQ are disabled and there is no thread to wake */
> +	if (is_kdump_kernel())
> +		return ret;
>  	return IRQ_WAKE_THREAD;

To Robin's earlier point, how about some ARM_SMMU_FEAT_EVTQ ? We already have
ARM_SMMU_FEAT_PRI. Unset these by kdump instead of sprinkling kdump things
everywhere?

I'm not especially kean on these kdump annotations as a long term
maintainability, but having a FEAT to protect a well defined area of
functionality seems more understandable long term.

Plus maybe an embedded user would disable FEAT_PRI for other reasons, somehow?

> @@ -4625,6 +4629,21 @@ static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>  	arm_smmu_setup_msis(smmu);
>  
>  	/* Request interrupt lines */
> +	irq = smmu->gerr_irq;
> +	if (irq) {
> +		ret = devm_request_irq(smmu->dev, irq, arm_smmu_gerror_handler,
> +				       0, "arm-smmu-v3-gerror", smmu);
> +		if (ret < 0)
> +			dev_warn(smmu->dev, "failed to enable gerror irq\n");
> +	} else {
> +		dev_warn(smmu->dev,
> +			 "no gerr irq - errors will not be reported!\n");
> +	}
> +
> +	/* No EVTQ/PRIQ interrupts in kdump -- queues are disabled */
> +	if (is_kdump_kernel())
> +		return;

Then this would flow nicer, you just wrap evtq in a FEAT_EVTQ test and don't
have to move things

> +> @@ -4682,19 +4691,30 @@ static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>  		/*
>  		 * Cavium ThunderX2 implementation doesn't support unique irq
>  		 * lines. Use a single irq line for all the SMMUv3 interrupts.
> +		 *
> +		 * In kdump, EVTQ/PRIQ are disabled, so no threaded handling.
>  		 */

Why? I mean I get we might not need a threaded IRQ handler without PRI, but is
there a reason kdump would not want to create one anyhow?

> -	if (smmu->features & ARM_SMMU_FEAT_PRI)
> -		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
> +	/* No EVTQ/PRIQ IRQ generation in kdump -- queues are disabled */
> +	if (!is_kdump_kernel()) {
> +		irqen_flags |= IRQ_CTRL_EVTQ_IRQEN;
> +		if (smmu->features & ARM_SMMU_FEAT_PRI)
> +			irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
> +	}

And here is also just a simple FEAT_EVTQ?

The overall thing looks broadly right to me

-- 
Jason

