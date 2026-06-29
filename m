Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A0DC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBzyNkqA6reDvjvgS/IkAmN/yoxjsNNq9h6u5BxoEL4=; b=f+dJdO+N3zR/bWM56g4DvcDOW9
	5BPqB+W/MQPdRVVxcl+BCqzfXRtN4QkMmRiCg570VZSZ4OO122a31rOqjAdXChgBt0qiCKIVClfQV
	i5a213yAAYUebwvZK0+fO1k19M7cIZwqGEICzTvL8Y6nXZPj1PkKB2x5ynGV8hZFLglG5qomjUJaI
	hJlh2Zm7yxSIYFZGli9awzIV23bMLoTzCvcabenox6LApUOGve3EzgbTEQJMO2o0dAa/m1bH5Vchf
	NYoqrmbbI7RrN5/InVHWUx0Efd3veDJw3z7JZmMYaSwI+drgtESeaS2T7XET+xIsHExY7+1hg1qc7
	zvlp6Wvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDtk-0000000F4GG-3EJ0;
	Mon, 29 Jun 2026 15:27:48 +0000
Received: from mail-eastusazon11011012.outbound.protection.outlook.com ([52.101.52.12] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDti-0000000F4FT-1cnL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:27:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baU18BwSL6cVLeYD+mBZLACk31T5NFxhx8FxXEb5K9ythE0FEbzIak7QDzNDKf5uiZ+XL7CnFmAdTd+dzb7lOz674qPVrnYSDnXPM3Kc64NXTHb2Rt20Dy4pQDgqpebBbZ+ZOf8cJWKbQMJ/+4R4Pg3djQLFHP7HfcFDVoqurTm+28X8jRKm5jm3QwXx+35aN5CU6RA6N0nwsp6YevLoj1X6IN1q8u/q878ls7M+lAml5dUwhcKKMRsds2DqqBF6U7E3sH1pGHhVCC1fumJvo1vzsRNJBKJYOTBbuIhs+HsUAWq8Pu4rzlb1/FHoFQH9brqozrKKi85h2S7OuVPctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBzyNkqA6reDvjvgS/IkAmN/yoxjsNNq9h6u5BxoEL4=;
 b=ZhO2g11y0owrVAIFrdcWMmwbmy3bNMNBCez6sfUMCGGO13sC45eitAPO65rdtj2KhU+1yJLpZbI7KRHufdvnu3ZTkESYoKC0/SLSIYw+Pnxy8n6WufY3LRKQNusj2+bfYDzF1qwnG6x1awQi7/U4BrJs4xiLQRPHjk8xR0dkdiHe81CDqaeKFUlYijnqZwnDyVVQrvV4YM+gVsqThoKwPfYXa9yYn2G1S5iWPnZc2nkZy+hjeWOpemY3S5MriWCE9JcRdBnyO+RYT7ceQS++bFglnOIpwCH5diR84+1gRTVkOJOuuEscznp6/4pyYbyfjpFNJomnITEpa503YZb3Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBzyNkqA6reDvjvgS/IkAmN/yoxjsNNq9h6u5BxoEL4=;
 b=d3glffaE0HKDIpHAsnN2+MNmtKLDxynnXQJsBbetqx1+RzW1WtvaEtI6MneEDdRUYMeu6EB1TSMyWe20Ng7BfB7h9CvALXkjmv96PSFdTZxaJoaGBoUghTyxmBMhFtkyVUoh49sdOqbzoXVGnwFLxH5ppj7IPifA+rZz3hp9N16PKg+zidHTY4hMVjkIHET4ajXsrVFK9UIKlXOZIZZlyCUH8eIh2vY0xa2AbJz49HUyLK7uO+6dU67xTPdYIbvgr0RPetSXP6Y1226a7DCp0H/d5EIMFejAYMQo6iW3EiQGVMCHCv+QadMExS5B18ADlpjObR03bNI97wh6AFghkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by IA0PR12MB8304.namprd12.prod.outlook.com (2603:10b6:208:3dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:27:27 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 15:27:25 +0000
Message-ID: <56a1e8bf-41b1-40cf-a943-79cce84a774e@nvidia.com>
Date: Mon, 29 Jun 2026 20:57:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: topology: read CPPC FFH feedback counters in
 one operation
To: Pengjie Zhang <zhangpengjie2@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, rafael@kernel.org, lenb@kernel.org, robert.moore@intel.com,
 beata.michalska@arm.com, zhenglifeng1@huawei.com, zhanjie9@hisilicon.com,
 cuiyunhui@bytedance.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 linuxarm@huawei.com, jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 wanghuiqiang@huawei.com, xuwei5@huawei.com, lihuisong@huawei.com,
 yubowen8@huawei.com, wangzhi12@huawei.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260410094145.4132082-1-zhangpengjie2@huawei.com>
 <20260410094145.4132082-3-zhangpengjie2@huawei.com>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <20260410094145.4132082-3-zhangpengjie2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::8) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|IA0PR12MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: ee28fa65-a209-442e-7f43-08ded5f2ec04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info: elcTxoi7fHAIQg0i3D6rHSBpjg4JC+CSYXvsevBQzCbEAzM25CvLsTC5jHVzbwAOpxpsxdHgRcKezrSJdptFrE4YFvrEln16BK5kf3/gqE/uKRSCaOrAvCWMPGcTDAfjXnweIjC5nB7Vka3OjZh24HQQz0mAl6zHHPABOWu3epGT+XimNitCUuL5wAYupjQIn8JowJ+nQ6ALQG7atUvF66b4mP7Bay+ZBR3lZuJ7cTkw8YM9M8b+hK6p538v4apTta5nItobJh//YE+ix+Um3LM8kH/4baex/+RU+Us+XAjMeNbGDra6LrS/obLpPMQ2ZDi/H8asaOcaNxi85gy/SWH8FF9u1q6oyVE8LkYcGndHlJ3teyyc1NxGVjkGsiFaQhQ9n0DHDDSJt9KGH4mu2eT0lfwql2CeMKBrPICPuG/okdvH1x4UPfguGJkkGRahpmksuBuEdHwmSeZi9MqhrhkeI4vAN5mx/k1tQaOxT45Ga5q/A4akf/3JAXU8t4lPvEKUityg27Ld/XjQePkA+N+3tq48cpv97QpOXYMZzaviU3BDKXyoPSo21Hf1McZWc641DtIRLwSbfLKkthLf8JJWsh2rudJwZ/uD9w52pCUcRJxgf10YuaxLUzlBkSxrL4lgrw4XLyWzmmIfbGfcWoWuFrzNkr8MvE4cDytFm590dltuo057G45T+lKy/gt9cKfmF9bpGyo7q9zB33D9bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(6133799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THVxN2tQRzdWcHc1d2RLVnhZR1BGM2RINE5BY05ESWkzaWlrVmFGN2J6OUN6?=
 =?utf-8?B?M0JMR1pWTEFQZDNvd0YxSFRtbm52QjNpaHFGTUljWFI1NElMd0dlMFptOGJ4?=
 =?utf-8?B?RE5nbXJJVmhqamdsdUNlMlQ1WjVYLy9lYnhveXVYK2kzSlRKZFppT3QrdTNu?=
 =?utf-8?B?YTBHZTBINDljY3ZhS3JzNlFDTHJyVloyQTlnNXRXVUZQT1UyNGQwOVA2ODM3?=
 =?utf-8?B?MGo5blEramJmRy92cUNiSWl1VDg4ZDI4aTJ5NmtYOFhRSE9yVUw3VllucHNS?=
 =?utf-8?B?dk5PUnI5aFRHTUxoclVGMUxWK1dkQklDUnA1anFURlVvb28vMTROanArWDRy?=
 =?utf-8?B?OUl5Z24wcFZUUE93bzBzSlFEK29xV295T2NqVnRwSmtRSWVlQzJCaTNmeG1T?=
 =?utf-8?B?K1ZIS3I2TjhMTUh3TVlQZTlYclQ0cThWUkdTaHZxa25SdzBoS0phY3FLVElO?=
 =?utf-8?B?ZFV4TDhnNlhnRXBKN3lVR1MrUVh6Ui93ZkIyUnMvSXNmdVJEb3g1ZUovZmo3?=
 =?utf-8?B?YSs5dXNuQzVESGFjV3NQUGY1ejBlVWh0WVh3VEpJTlpicmg5ZDd1QVFETkhW?=
 =?utf-8?B?WTBTNVZXNEdUWkpNQlZBU3BlbHgxNmxUbjRlS1dpZzhLbE5OQ2F6c21UM3VW?=
 =?utf-8?B?WFJMakRnQmhZRUxWSDhmamNRdXVkWmpGL0hqL000WU5Fa2RMb0ZRcmFLYkNp?=
 =?utf-8?B?d1Ywd2JCQTFNU1pydHBEQXJRTmFtUjVPcU9VRVUyV2dBcUVVVkgvbkFFY2pJ?=
 =?utf-8?B?a0lIc1JxdVZuVkI0QkVSM2RlVTRLL3R0K0FjRFVsYkFOVThOaTE2NXdkaDB5?=
 =?utf-8?B?dTNLRHM5eW1CZkVJWlZMMWtsT0VCS2FqemFZSEF1TitrK3YwRDZzemVZeEhn?=
 =?utf-8?B?bU5EbXFkQlVoWnZZUjlMVnBiTnJvRlNtbmJjcWlMS2d1eGs3Vm5aUHBlYTdW?=
 =?utf-8?B?R285eFd2dmtQK2dqQmtnZzA4WXNzamR1QklsRU9TT2dhaUpEM2JqSGdQZFlM?=
 =?utf-8?B?dHlsTkpFK1NwNzM2SFRJTGhpeEZucU5Ud1owYTBPc0oweXNmM3E1UmRVUm9q?=
 =?utf-8?B?UGNEeDU4ZVNWV0c5VXhQcUVVM0sxNUJmb3VZZE0zaDZrMWNCNitrUlJFZmhz?=
 =?utf-8?B?REh4SFFRVXdyTnp4MGQyelJ0SnJUMVErZGxOalh6eUF3bTdtQm8vc2VKQ3Rl?=
 =?utf-8?B?V1NGTEV1MjRDVXVESEwyNGlFSVI1YWtwSHkxanJvekhLNHgxTWM5SG5oTEND?=
 =?utf-8?B?L0pPRXZTdGhuSmIyS09GamtGbmNNYS9LRzZGS3d3QVNxY3lyM0tUZUFMRkl6?=
 =?utf-8?B?ZjZ1bHlWQmNYMk4zcGlxUWJ6VW16djdOdkJzWWdnMlhvNXJVd2V5MkhkQTAz?=
 =?utf-8?B?c1I1a0VNdTZ0eXBBTFkrMHpPVU81c050YjRJVjg3c1ZscVd5T3RiQlJ3QWhr?=
 =?utf-8?B?U2JXU2tUNGxaMTk4SStSV21tYWxnNWkyMWxNK3YrVVhDaDRwKzE3cDZ6bWk5?=
 =?utf-8?B?bVB4S3BBNm1PbzViV3J3OWJ3QTVzTkNsRE82dW10TTJuSEc3eGJPMnU2YUE4?=
 =?utf-8?B?K1pJREJJendjT3Q4S1FYWTByQ2NWYzQwcU5ScmZJRjJVemU1U0hUOFpvZFZT?=
 =?utf-8?B?N1hXemwwRzREYklvVDhobmg2TjdNVTZMMEZuNVh6dW5kaDMyTnpDd3NRMDJZ?=
 =?utf-8?B?M0dhcUZrUFBST3RDRlBDOUM5U0JQYXlzL01pQ1Faamo2aGFjV3dLZnFVYmJz?=
 =?utf-8?B?aVdyZEU3RkNRSTZwU1gybitzU3R3dEdZakhMVG9NdWJvSzhFdWtuazVkTWdN?=
 =?utf-8?B?VW93MmdFdm9ZL3hiZ2w4TldUVzdTSVdxbkFWeHBNTzFhV0gvWFM4N2xlaXZI?=
 =?utf-8?B?VHJ3Mm8wSFNNMHhIcHZCVUd4MkQ3S01zTkVvclVXck5YdHVISVNJV3BRYXha?=
 =?utf-8?B?cDAvNmhZQ1hmMG9tSTd1RWZva012cURQQlJpVlRkaXRseXo5bk1aNzRlVGF0?=
 =?utf-8?B?WXBHdXNvVTlCdzI4MXN2NTFNVjM0eVpYaU1wRktKMlRpRXdkc2gwUDNmRzJp?=
 =?utf-8?B?VXkxV0JWOWFXT1hFVnFVeVRuajBYYTc0WW1DbG1LS0NkblphWElPV3FxZ1dk?=
 =?utf-8?B?YkppdWZoN3d6cVBJSGltSFJkVVJDOFlrWUc0TDhsZFdIMUFOaWRXc3pMMVZX?=
 =?utf-8?B?N2RZRGdsMFdIRGdySUVCaWhna3NYZzNmQTZUNktrbUh3QS93VFBNREpLUExX?=
 =?utf-8?B?Y1cwSjBBdkRLTnJsV0xsODk3blJXKzJnRGFKSkw4Q2x1Wm9NcEFudThDRTk1?=
 =?utf-8?B?QjJGdkNXTGR6WGRONU1XQkJRdmNyR08yNmtkK2g1Z2wwNnNqdFFBUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee28fa65-a209-442e-7f43-08ded5f2ec04
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:27:25.6234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyOv1w8d4ouNjaq5bH/ynxRgz0vaEiLxonwqLcTv6KXSExk6WSOIJ1BMzgX8RCsVDhUFi1CNNmdoBQjpsrv9Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_082746_436213_6A7627BB 
X-CRM114-Status: GOOD (  17.06  )
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


On 10/04/26 15:11, Pengjie Zhang wrote:
> External email: Use caution opening links or attachments
>
>
> arm64 implements CPPC FFH feedback-counter reads using AMU counters.
> Because those counters must be sampled on the target CPU, reading the
> delivered and reference counters separately widens the observation window
> between them.
>
> Implement the paired FFH feedback-counter read hook on arm64 and sample
> both AMU counters together before decoding the requested CPC register
> values.
>
> Also factor the FFH bitfield extraction logic into a helper and reuse
> it from the existing single-counter FFH read path.
>
> Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
> ---
>   arch/arm64/kernel/topology.c | 75 ++++++++++++++++++++++++++++++++----
>   1 file changed, 67 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index b32f13358fbb..b90a767b2a1f 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -50,6 +50,16 @@ struct amu_cntr_sample {
>          unsigned long   last_scale_update;
>   };
>
> +struct amu_ffh_ctrs {
> +       u64 corecnt;
> +       u64 constcnt;
> +};
> +
> +enum cpc_ffh_ctr_id {
> +       CPC_FFH_CTR_CORE  = 0x0,
> +       CPC_FFH_CTR_CONST = 0x1,
> +};
> +
>   static DEFINE_PER_CPU_SHARED_ALIGNED(struct amu_cntr_sample, cpu_amu_samples);
>
>   void update_freq_counters_refs(void)
> @@ -397,7 +407,7 @@ static void cpu_read_constcnt(void *val)
>   }
>
>   static inline
> -int counters_read_on_cpu(int cpu, smp_call_func_t func, u64 *val)
> +int counters_read_on_cpu(int cpu, smp_call_func_t func, void *val)
>   {
>          /*
>           * Abort call on counterless CPU.
> @@ -447,24 +457,73 @@ bool cpc_ffh_supported(void)
>          return true;
>   }
>
> +static void amu_read_core_const_ctrs(void *val)
> +{
> +       struct amu_ffh_ctrs *ctrs = val;
> +
> +       cpu_read_constcnt(&ctrs->constcnt);
> +       cpu_read_corecnt(&ctrs->corecnt);
> +}

Any reason to flip the order?
Harmless as they are read back to back, but better to add a comment
if it's intentional.

Thanks,
Sumit
....



