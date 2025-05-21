Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9F3C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3Zc+HE3zAeuA4amKvHN4n7m1wlVxVe1VnraaL1MD0E=; b=YatSa48tJi5lCdRkAMVJGXY7p3
	AKm1bojZ6vtpADsjQ8YI5fwy6E8sowvJoexMZfeijSIvuQ2co2xi64Ith/JgAYU7JfJngeAnupxEZ
	Ezcv85Qw41DG2dR7Kq1tfiASPs0OCQC+oVZmJTd9l1yDBIjaaJh5qykhe1KQ63rJcvojU3j8WhHvT
	8GrAjU5QK9WiXYR4Q8YZEUFwldLsE/PvQOI4lR1+a4QoTT04VX3CmDNWpW7wqEQGyK3bSnDbP5L5K
	d+kS5rNG3/QPjO/JiiZcHpa64s4NLgdCmzaDEaUzjA7mPkawI/0yhHaCuqLYzUyuKUEPIAyBcI53/
	e0b+jVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdmY-0000000F35s-3gqz;
	Wed, 21 May 2025 07:22:31 +0000
Received: from mail-dm6nam11on20619.outbound.protection.outlook.com ([2a01:111:f403:2415::619] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHddv-0000000F1wc-2Tha
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 07:13:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jv1EWIg7JeSQaN/WcLgyUAcEH+1fMcqCLDurit9wjtqhr3+EwIlgPPBqYlwPERC0Qfe+seLHsZzUeR1Nyj24F9k2cYfEvjJH99N3TSkZSOYzTe5oksxKEGExH+tNfJ01MYQy7Vx2HkaKfKO22o74ABi6JowUZXd/XygCPXVi9iXUcnwS0waRd9ovl2Fnx0W9Lxd/SpXuHmROKHkHZ1uhegfug0AOqk2Fk3e79JQF1oG4SO0bgl4HNJWpDnxPI3Ps2MXs0jKktwzr1Zwr6SKZ4Yb/trE788ph1qcV8SXlKcDMsiB0FDghXW90z6gMY+kk/ZY4YTwYPIvz8YBxqBTPHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3Zc+HE3zAeuA4amKvHN4n7m1wlVxVe1VnraaL1MD0E=;
 b=VoU1MMAsXS6fywFSjEI+VRFsKcbpepzXFTc95HJeSFPeFPnk6Yj4fEyDMbww0PbiT4xnxC5s/8Kb3Gb+75dWsMpBiNLmHTKpUfPTKXNG37v547Hu92LYz/HXHXDaeblJVwDM9BVY8Ho+EwkeIh6n+AgHJnOGsuLKbXmROUExhDmiu2FQ4Z6DiTQKTXsGkYTYD9iBYAV/ELthl/BC52A7XLeoYIfvpCKXqNOMM8sQIK9DsE3P98Wd5ebwJfEzjX50qU57x7NPoDA7LT6RkoEg2B3DFhnv5f/CFuBesfDC8yOV9C2UlvaQWybP9pk1qhjkneahBpUCtPQQbYvdZumvHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3Zc+HE3zAeuA4amKvHN4n7m1wlVxVe1VnraaL1MD0E=;
 b=ZMPD0nZ1WMBJzppQ/jYnAAUxh+Jok3MuDhMhzs4smQ8o1MvVVUci0jQ6UGk0XG2oKnetCPn29Ifz6IL5q994qMwqAPfmY1VjdMYlkOz0zX+zqs8T7ilLEAapXI+GuHFmwpZDJUFg/V6YNlSLUzGyzgU08Kiv40bczB36nKN+Zco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 07:13:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 07:13:24 +0000
Message-ID: <dffbd709-def0-47af-93ff-a48686f04153@amd.com>
Date: Wed, 21 May 2025 09:13:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/9] dma-buf: dma-heap: export declared functions
To: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>, Sumit Garg
 <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-3-jens.wiklander@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250520152436.474778-3-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:208:256::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: b432b7d6-730f-484e-d195-08dd9836f9f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnRTOGUvTnRPR0lQQUs5eWpLaXlxdjM4Z3VtYk5pMHl6bUtoL1V2dk5SV2Uz?=
 =?utf-8?B?RnlNTW5tWi9ibXNLM3hVclNwNjRra1MycFR5aVVqUk5MeFkvNUs4N2R0WU0z?=
 =?utf-8?B?enU2N0JUTlNCUW5WaE12L1NNdGdkaHpUSEt2M2ZVVGg2b1AxMnY5MkdoeGcv?=
 =?utf-8?B?UFJRRjVEWVJFTCtmRE5WNUZRbm8yTU5Uc0gwUFNMcTltczQrVXBaRHN4T0Uv?=
 =?utf-8?B?Z3dCRjlteGZnaW5McGZLWTNIWkZCUTcveWRIdE4veSs4ZnducGozT3dEcVhG?=
 =?utf-8?B?UHVUY3hjK1ltOGkvS3AxVWZzTTFBaWZLc3pyeGdZYU84anBRTUlFcEs3bCs1?=
 =?utf-8?B?bHlhK21PSmRkOEFNK0JqcGRiQVYzZXQ1Snh4YkdZOSsvZjZFRUtNUjdEeUV0?=
 =?utf-8?B?d21BOEZQV3B4MEczSnM2ckxtS3R6a1BBUXYwSTNvRlloNGo5MGJlalhKejN1?=
 =?utf-8?B?SHlUbWxvOUkzcDNBNHd0Ti9YZk9jMk4wZXlGdkxsTG51NXJrbGF5SnA5L2lL?=
 =?utf-8?B?M01nR25KZXVkTit0eDNtc3B3U1VTVlpIUWhhTGwwQlBmYVhnQmliYWJzRWth?=
 =?utf-8?B?YXl2QkQrYVNaRmpCcVRKMjNMUW5UNURwMnRlM29JQlJ6RGs2dUp0aFVhSENX?=
 =?utf-8?B?K1NZSWRYMUhxT0puNFIwdjVEZWwxNWpXMkNmTnY3c2wrL2NFYUFpZVlRQ2h1?=
 =?utf-8?B?Q1I0bWladko4MnRwZlE2b3VTT2lpZVgyUmpoVGxXa3BlTEgrVU1oRmdteTVi?=
 =?utf-8?B?cXFPMG5ybEpWa1ZZQlRCK0RnWkhNS05odzdZNk9wRkR5MERDU2k1ZzRjdzl6?=
 =?utf-8?B?ZlYwUWhqV1pVa2U5ZUxPU21DeXN5b1UzMTRPK3B6alZLb2YrdDI1RnVBcXk0?=
 =?utf-8?B?bGttcnNYdnQ2NldxWkVjcjhJMXB3U3cvME5MRkU3MlhHK1pNK1BCZTZaMktS?=
 =?utf-8?B?N0xDdElVdjRjSy96eHpiNkUvQzh5UG4xZzFHbCtZWFloalRBMWxrRmFmcmh3?=
 =?utf-8?B?U29haklvNWR1WUZRSXpBaURLeFpHNVJPWE5MQU52Rk5wbzNhRXk4d0VmYWM4?=
 =?utf-8?B?MU5OSFpXUlZJK0VaWnEyNElSUmFYTjFacUNuZDVKazVEdXhaU3JRcXZUM1lR?=
 =?utf-8?B?KzhpazdYZzVnSDV3T2tCSTZrcnNneWM0NHkrcHJMZ1ZHbzBtNVVQOVlOQ2N6?=
 =?utf-8?B?OTBwSDFqQzZSOXRaSjZpc2RJZE9EWllTc1ZDV3hmZVRZVEFKQm1xVk1Vbmd2?=
 =?utf-8?B?VTNUM2hLaTBhcHRrc291N3BrMDNEdER4OTBCeldQeXovdldJUTdBUmhSMGww?=
 =?utf-8?B?OWZIOXp1T1I4dEJEMERla2lFTVJsV1c3QlhxSFBmZk1UeGJSazZMVkdzZGIw?=
 =?utf-8?B?bUFIWGM0dTV0YXFIQkY5cFNjUnF4QnVIMUZiNmIxT3o5YVJTUVdEbkE3V0Zs?=
 =?utf-8?B?UHU0WDM1SDhHcGFaeGIxU3grbkhNYVU0T3lDbUZRVGFweXQwUDUxUzRmemJq?=
 =?utf-8?B?TXBzTXp0OXFOSU1hUTVQS3ZMaFdmSy94S2RlVkhmeXlYVVVKdzI3YXZmTmVT?=
 =?utf-8?B?c3JaL1dham9IeEYrYml4U0hoVjBjMVlSSno0TDRrT0pnaDcrNUltdXFlWFR6?=
 =?utf-8?B?YnlLMmV6ZFJJRHJyN0FFazdZcUxtWVg4N0E3b0ovSU9Sbyt2Uk1iRFVxVEZo?=
 =?utf-8?B?M3d0SDVkWGJtOWhjelNCVDFUR3RCRUY4SG04NHZLMG5OVWg4aU92OHBGb1Yz?=
 =?utf-8?B?eEdaK3VQMHZtU1RCd3VvTjA1YUhNdmNFZ1hnVUVabVFub3IxQkdyN2xqRmZw?=
 =?utf-8?B?b1JOQWtOSC91TXY1UjVDVHhaaFBDcUg0cm1oWVlPcXV1OGRxQmNxb3FQTi9o?=
 =?utf-8?B?Qk9MQmZXYXh5VlRJeG11UDBNYXJDL29QNEpjK1FFRG9icFNoMThnbnNKd1JB?=
 =?utf-8?Q?2ilKW+T7N30=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEFtTll2amExZEpNU3R2dHBSeGRLbVg2S1Vla0hzTjNpUG5wL09wd2NtbVNn?=
 =?utf-8?B?b0xidDVwOWVId2svQjBNZ00xMFR1K2VlY2l5bHprbUdYa00ybUY2T0JXQmdm?=
 =?utf-8?B?UllKMFc0UDNHUUJUT25rK2h4WkF4OVVMTjJYOE8zUTBpOXliYkhoSU1rS202?=
 =?utf-8?B?M2x2eVp1UG5Sc1lxQjFDZTA5Q2p4aWlaL3RFM29Qc1ErL1pVQWJrSWRNNndH?=
 =?utf-8?B?TkJQWHlXdVk3aFd5bVJCR3Q3cmpPVlEzQytPTi9WQWc4NnkrY2d2K3lOTWdi?=
 =?utf-8?B?VTlBYmJ4dzlzM252WkdWSFVCVnR5N3JkWENwY28wWnNYZjFuUThnRkFycXNE?=
 =?utf-8?B?QUFXUDd3WmJzMWwrY1oxbXp6RmtSQlFLanh3VkVySlRROGxpaDJhZTRKU2JT?=
 =?utf-8?B?c3lpRGw4aS93cjh6ZU8xZzZRQmhuRkp4cEV4NG02YVhTN3FFQ1ZQQ0RsRFl2?=
 =?utf-8?B?K2ZGaFZVNmlrT2dna3NpM0M4K2pTbkVkSUNLZHIycjFKNzllRkdjRUtIWTVJ?=
 =?utf-8?B?c2tpY2wzOHNSN09XTnBTRHh3Z3lPV2N0MGQ3MmViMUZkY3ZrQW5XOWNuSTVE?=
 =?utf-8?B?WlVZaVR4eENyaTNLUlBLaENvYk51VHZqTUpDdXM5YnA2SGNZVjhzazBoeStZ?=
 =?utf-8?B?TmhMVmFUTE9iOXZJWHYrMGRxbDBGdE5zSEZvdXQvd3N2a2NEeDdLcDdIS0Fs?=
 =?utf-8?B?blU2NDFuM1pKUzJNVjNDb2dFbTdtd0ZreUdqUU9zbGw4K09Ia1c4TzRCcHYz?=
 =?utf-8?B?YnhmY2dka255NldUQktDMVhHOTJmS2pNdHlkUGQ2UFhPOWpKbUs1YWdZT2Q2?=
 =?utf-8?B?bjRnL0JoTFhxd00vZitFSGh1dytCa2hybndMMk9DRko1K1RlWEc2SDAwei9u?=
 =?utf-8?B?VWxXeHVwR2p6aVEya0lCa29KWUN3aENBcFFCVDcrdW5xZU5kTkUzSDNHcDd1?=
 =?utf-8?B?eEcxVmxCNjVBbGNnM0hDbUgzeDRGNjN3aWxEelJudWVpdEkwVHFOdUZEWXMr?=
 =?utf-8?B?QWtSY21wVWxvK2V4WUx6ajlzYkVzQU9tcmFUYVBZWUlRUXBiaWxCeHVMckFt?=
 =?utf-8?B?czZWQ1pGQzhjS0s1eW5YZUptSEY2ZmhnbkhMcWxPdEtKS2Nia2hwWndlVFVN?=
 =?utf-8?B?anRxTWtKQk96UVhIeHRaZDYvZFRUb0RJYjU3aXU0akpZQ0U2MGFnWHlKUHY3?=
 =?utf-8?B?enBQMVYrQklpVGdlWms2Y2dvOGVaeXpjL05pbnFsOHg4N1VNbSt6cWNjZHM4?=
 =?utf-8?B?MmxWMlBaN3dLS3ZJcXRmVXcwU1VoYkZQS2MrMEhHTUV5aTE2UGJ0TmxxcDg3?=
 =?utf-8?B?QUVKMEo0ZFZiUlN6Qjc5bnNVL3ArYjN0MGNhcExCTW5rN05DVDFJcHpISExB?=
 =?utf-8?B?WmE4ZkM2WVl1MUJDVXd4UzFTNnVINjRhdkJweU84N1FQT29BYTZxVDFnUUxk?=
 =?utf-8?B?OE8rS1BXaHJFaWpaOC9lM0dXdlBnT3h3QXprVWxiZklzWHgraFdkTU1zcG1G?=
 =?utf-8?B?MWsyWXM5b0lIRThRSmxybXdFRmdBTzBuZnhhUmRUaFVCYXVzbGFWQ3BQNUZR?=
 =?utf-8?B?NW1LQVBJc0dYcXgrVWZwQ3JpNUtYYVpLZ3JISktaMGI4VTkrL1BCa3RLVVF1?=
 =?utf-8?B?SWVUeDlGUTNjQXBER0NwRVF1S1FRcVhuRG9UajdtNXdIVU1DYXZxcW5wN296?=
 =?utf-8?B?aXcrbk0zbUpRNUM0VkpvZFB6YnpGS1M4c1FWOHpRR09XT0JSbWR0YWx5anN6?=
 =?utf-8?B?Ny9jVFlHYnVHSnRuSnZ3RU0xb0NETWhwK3h2QS8wMjRWRVdBdkFZajZmdXRm?=
 =?utf-8?B?Rkc4TVpFTE45eFRhVGplK3VUa2R5bnRxUktPRmlSOHFrdHNBd0FyVnRDRElI?=
 =?utf-8?B?N05FRlJTc3JJWThRbk4yekcreFBUMG14RUVteG44N2VkTWl4TFFhTUpEL3I2?=
 =?utf-8?B?TWlTUjVOalAvZUFrS2Z2b0VUNmhUTFZZdkpkTml5RU4razZDMHBKemd4M0xz?=
 =?utf-8?B?emVhK2p1RlAwYVovS1N1S0pmNkdPYmlHUDlMajF6S0NKd0xvbWFISXd4Y2JG?=
 =?utf-8?B?QThab2l3VktHdHh3ZE9hU3lJVDBNOExMRmw1dWhxSFFReG1mWjFmQmhLTkJB?=
 =?utf-8?Q?RxSX+MkQzmKgvnsEN5eADA5vV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b432b7d6-730f-484e-d195-08dd9836f9f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 07:13:24.7140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZF1vLwbmgYxMBouhf12MpMjocBBsILmHK9i+/9wB9Ppv/Dk3+HFxxGFosx+z7KO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_001335_623900_3CB5A29A 
X-CRM114-Status: GOOD (  15.13  )
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

On 5/20/25 17:16, Jens Wiklander wrote:
> Export the dma-buf heap functions declared in <linux/dma-heap.h>.

That is what this patch does and that should be obvious by looking at it. You need to explain why you do this.

Looking at the rest of the series it's most likely ok, but this commit message should really be improved.

Regards,
Christian.

> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/dma-buf/dma-heap.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 3cbe87d4a464..cdddf0e24dce 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
>  {
>  	return heap->priv;
>  }
> +EXPORT_SYMBOL(dma_heap_get_drvdata);
>  
>  /**
>   * dma_heap_get_name - get heap name
> @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
>  {
>  	return heap->name;
>  }
> +EXPORT_SYMBOL(dma_heap_get_name);
>  
>  /**
>   * dma_heap_add - adds a heap to dmabuf heaps
> @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
>  	kfree(heap);
>  	return err_ret;
>  }
> +EXPORT_SYMBOL(dma_heap_add);
>  
>  static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
>  {


