Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31913C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 23:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3y6kf6aOS8RC2LXRpAyZvCSolrqJwt6gbeedkJ510dU=; b=VrD5j4NCVJ9fVNhGr3Ms0iJclN
	yIi16FO+lLxy0AFLYA9sBGCiHBusp5yaF37WspEJ1r1/Yyshbf2SP1kJJ0+YFZ4GnKkzebavRZo5j
	lMzKW4Xage8MNwj9LVqIPEfrbkv/BDaYZWX2B44g9EDg0Ui3uOHmOqjFntgGvq+Os3qigFkShBt1w
	U2FM22I35KbCuFtNEfWaRCxafIPh77Pk+pAZ0dIfpz440KQfO4/21BkcoF17Gq/pGHHDnCKHACPyj
	slawAszeFhBw85QBB/qlFERXQeLpvt1FKzKaeueortdrpuNVcKeTM25an0w5F4QBWSbeYXCh8bPB1
	qDHz7P0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHWUc-0000000ENcM-0AWB;
	Tue, 20 May 2025 23:35:30 +0000
Received: from mail-bn7nam10on20620.outbound.protection.outlook.com ([2a01:111:f403:2009::620] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHWSQ-0000000ENS6-2D6w;
	Tue, 20 May 2025 23:33:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQTwLsdhln7VyQOfUFKHPDycoNgCZzXxDp35Xepe7Yk0rjH2Ml24w8cezPvDbeuKeFNsEC0k+LiBBfrsy91PR6LEUyrUU1uMcMS3lyiDHbKKv6OPu7LljTvRAEVfKU1d+yoI+S80SIxUP50ChnBRwJVzJK7SsyrJVbdeyXy8e4k1LjKxtB05TkG2icvjZnSDLmL6+0zVnko7o6sbQpIXvBPnKV3nZBOPZrZVS0eYq5brmBAwb+vGYUbuLRVggxInQfqPzspdcJU8ms45AYRwhTe07dvldye3yMdToIknXk05VuOgq/bdEJDfB06YjmXy/bYjp8BMzUwXM39xOUqIDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y6kf6aOS8RC2LXRpAyZvCSolrqJwt6gbeedkJ510dU=;
 b=EykwqeWAwi3O+gL2AYnj0dbvSi48EnbB7mgIdQl/6P0d6pJtz9TAEkICad/LEqFUqf86iDssmSwTcGLssUMCU/vPssKjRxcH1zsv5Eq35m/s7cBfBEEZt2wHWQxfS1qCB0z/RA6ExVu1Wp3wfGf4HJ+RzWNQaxHUX6Cr0zYywPMXnOjQUQWxXzmvmV+1rjf1xHD46rlK9BkRHJsYOUQIL+IMk5txkeP2JPFqHlD1WviYFBgytASnipkes99GqhPnQw1wm3M8SRhhpsEm1grV4JKwqG7ydpQviJBpaeTVvSMxeDTat1Zyg+kYo+rFWIGhkLRPCUyQQAsAtcgWaaIMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y6kf6aOS8RC2LXRpAyZvCSolrqJwt6gbeedkJ510dU=;
 b=JKaanhsQ1pvnMHw+OhvCRAEtNsNDBn5xz8LSu3ebgyorNP3if4op/gzgeVnb9oRcvD1CfULXDQbDe+5dHJU5zGRz6B9lbgEOh/U1efUxqQ5SxuxD04Pfv5AKdNViDksdxPqo/8stlLlfv3He9NDVkvtZxWgN44GmlRYVWMUiygc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) by
 MW5PR12MB5600.namprd12.prod.outlook.com (2603:10b6:303:195::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 20 May
 2025 23:32:50 +0000
Received: from DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::c8a9:4b0d:e1c7:aecb]) by DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::c8a9:4b0d:e1c7:aecb%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 23:32:49 +0000
Message-ID: <d2eef52b-8500-4858-96b4-1b95d533ec8c@amd.com>
Date: Tue, 20 May 2025 16:32:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: Correct spelling
To: Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Sean Wang <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250520-mtk-spell-v1-1-2b0d5b4a4528@kernel.org>
Content-Language: en-US
From: "Nelson, Shannon" <shannon.nelson@amd.com>
In-Reply-To: <20250520-mtk-spell-v1-1-2b0d5b4a4528@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH1PEPF000132E9.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::30) To DS0PR12MB6583.namprd12.prod.outlook.com
 (2603:10b6:8:d1::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6583:EE_|MW5PR12MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: 4967730a-c41b-44c7-f1f1-08dd97f6a240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFdpaUxadm5qcXkrb2xYSVJSM25OTTljSnBpN01Zc05YS281dXRVV1BRSXlm?=
 =?utf-8?B?ZGtESitONzVuZ0JxVmhMU3RQNkRTalVtYjgxeTZkWnp2SVo5SzlFV0RESUdS?=
 =?utf-8?B?dTlaTWhBSHZwbHpTb1VWRjFLYXlQOTJqY1NYMy9EZm9QUDZ1S0VHOWVaL24y?=
 =?utf-8?B?RGVnbjJBZndKbWxBOGYxdlVjTmRGYzd0dlJXeWxKL0FDaEFLV2doOW4rT2FG?=
 =?utf-8?B?WVNxK2pCeGFRd1ZxVExDd3hpaDlWOHIrRk0yRzNQS0RpSVlnWURXd0xnUUZp?=
 =?utf-8?B?RURhMWFyenJjYzlYeGJHbjdNaTVhbDBvNnMvUVczNFJxYklEMXN2emkwKzVL?=
 =?utf-8?B?TlA0amRWVExyNGF2aWpzRkI2cm1UaExGOUgybDJ5aklLa1RtNVdZc1M4MXRq?=
 =?utf-8?B?V1lBbmVQT0NBdzQrR2NpY2lHSmF2dGVVd0h0OGhQNnJZU0phTkh6ZGU0M2Fl?=
 =?utf-8?B?SWl0MmpMZlgyZnhaZ3drRlRqQkVxZE1HWlJTRmJPSVlzWWY3Rm1kY2FtYTE3?=
 =?utf-8?B?QmNBblNQVFNQck9JOXZabGEva2hGakJjMUdDemhYUFdLWEV0QjJXdnJGY29i?=
 =?utf-8?B?VUJJMk5paWU1TWxBZm9EM0JqZlkwQzVZSmlBK0dPL1pXZ1BaMmpzV1FmM1lm?=
 =?utf-8?B?QlBLNk1oWHlaYU1MNUh0K0ZreTJUZnkxWUozeStXTHNyTUc3WmpSaEZXVk5B?=
 =?utf-8?B?WERWSWNXbW5oSWcwUzdUeWFGUVJrZHQvOFBEY3VPY0V3QjBUdWYra01naEZK?=
 =?utf-8?B?RXVFaHpsU051NVNHZjdzYVpHSnBvSXJTWnNHcEdzWUFzSU9QNmJFUWRQWm00?=
 =?utf-8?B?cnV4cmZJWENxYS9DdUNTS21YaXdkUGxJcGZUa21PbHYxYVArZFUyN3d2MEVm?=
 =?utf-8?B?UTlybjhicVg0SE5tNWRRQ1JKV2M1T05jSG1RNDNyQnoxQU92QTZMRWhSSDdF?=
 =?utf-8?B?RmtZNUloTTQ2dm92NGtsdUszd2c1dUNyTmF6dThzTUNKOS9ZTkFlUjBzZ0RX?=
 =?utf-8?B?b1l1L2FyaTJja1p2K1dKQ1IzcE5TbnlhZGVzVGZyOGY4Nkx4Vm1MQ3ZKQVZS?=
 =?utf-8?B?TWo2TzNUN1dRTUZBSmxZbnRMWEthbW5vdmU3dndsZVZKV2pNYVRWRU1VeHQz?=
 =?utf-8?B?emtUVEcrWWhLS3ljU2Uvb3lqanJVRk1rZGJZWWVTcDAvbFVQNXhROVlheXZT?=
 =?utf-8?B?QXhPZjY0Ty8wKy8wRXpYNk5md1ZlZ0RQRi9haDE5QXZ3M05xR1JWQ3N3RExL?=
 =?utf-8?B?RmJQRUZMVzNrMjZPMEdxRnZjTmdyQjRSRGF4QktSK09qYmJ0eTNPbXlPZjFt?=
 =?utf-8?B?R3JxZzEvRlFBWUwrWkQrclFNK0tNMFBOang1ZndiL01xeFhZY3VBMmN6Z2Zo?=
 =?utf-8?B?TkdPN1pFYzNsWUZsdDdlajA5UTNhVEd5aHQ1K2Nva3lTcm5UbWRLd3hBMzBp?=
 =?utf-8?B?NXQ3Tlp0Tzdnd3Ixc0s5YXdGWTR0NDd6RmZscy90NkMxdVhJZEJXbi9OaWk3?=
 =?utf-8?B?ZWtlck9TTFVoRkJLTytDT1F4Z2ZWNHFZWkxoRzJYMS9CUm94M3F4OXlIVXhq?=
 =?utf-8?B?V0dyRlZsL2YrbVdFalFkSzJ4YTczN2NnVFNNcHNPRDhYSVNyZmQyTjZoQ2dT?=
 =?utf-8?B?QVZ2Mnp3VW9VUWhiSnZnZDNrZ2FuQXZJTTl4OXJ5SVAxMVFhUmllM3BFVzdD?=
 =?utf-8?B?MXNSbkloZWtMQzh0YmcvdVF0K3luUm1XM0JZTEovVjJmd00zVlBydmpFYVk3?=
 =?utf-8?B?MGoxR09YRTJnUlFpbWdtZnVQMUR3aWIyT1VOSGlEb2RvUHFUUE1qazRob1Ji?=
 =?utf-8?B?OUZtaTVRVVlGTTlBUkNDUG9hN1lQM2dwUkVIbFprVVhqeXYzWGxLZkE0a2Yw?=
 =?utf-8?B?b29VTnJKaEx1bVo2ZkpMWkt2T2c4L0VRRndtMGlhdzBGSTFKUE9TYitycG5K?=
 =?utf-8?Q?vN1L4IW/hBE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6583.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1RrV0lsTjRpOHBja1MwY3NtL1NqN29xUzk5VzhQdVR2SEdza0FJSTZVY2Fw?=
 =?utf-8?B?dm01WmxuWDRicm83UUlwYkxHVXZ1a1JqM1lqV3FKdUo1elVkeXB6VU10TlRq?=
 =?utf-8?B?bFlUQ2UxeEcrYjhqTzhTYlFjdGVzZEhPaUtyQUxuS3MvSHNVMCszZUt4ZXVa?=
 =?utf-8?B?cHYzNWN2MStsVHBjTU9tckpWdW1RTUVXaVIxWldQcFBxUmpNVitYTVYzMzl1?=
 =?utf-8?B?MTFOeFR0aEIrRjlaQ3ZjQ0hiVFMwQjF6U2MvbmZjOTFCUjdTUjRNZW9MUTZX?=
 =?utf-8?B?ZEEya0o3T1M1MXFmQUJuMTM5NXZDdVZUS21PcjZiZEVxMTBGMUVsdlV0N1pR?=
 =?utf-8?B?WEpBOHYzampBU0lhQis3VnFvV0hwZGxOSEpXcTR4d2JpNVV1eGhHS0ZVUjJN?=
 =?utf-8?B?aTExSGJVYXB6VnB2Ti9wUVhmUysrVW5yK3JCZ2VRa0NTcmRyYTNDOXBJdEJy?=
 =?utf-8?B?R1Fzc2d5aFBENFBBdE5PbnJyYkNiTWViUjFDY2VtcVJ2YjNHYmRjWWNGTVlv?=
 =?utf-8?B?SjdTRVBWM2Y2SDJucEdGMi9TSk4vbFRVVnNKN29QYSsxdUxSK2VqMlZraTdO?=
 =?utf-8?B?eks2bWc3Nk5iRHpXV1VJMlFyWUMxVE5vbFpXaGpIblVjQXY5ZDVSbWdFU0ZW?=
 =?utf-8?B?NzlldFlYUGMwT3VjQy9rTHRGc3hTbWVva3JocUxXSXovRXZGKzhDK0dEeVJu?=
 =?utf-8?B?aHJjUXNJNHBPWXFGUnAyTFZkVmVCUU96VDlGNy9kVkV5SGFyU0lxT3FzZkpQ?=
 =?utf-8?B?eDFDVm9NSEliNGphNEplUFdwaVdXVFVBK25vOE11YlpwYllhS3F0L1NoM2ky?=
 =?utf-8?B?cngvRU1SaFV0dWFzc1dQZTREOE5rUVFJeXVIb2VsSTlndHZqM0ZJWTJvdWk5?=
 =?utf-8?B?QXpyUEplemdOSGpPTCtQdXp1S1hCVHYvZkk4bzNla2NPSFdpOHl3VzEyeENW?=
 =?utf-8?B?TFJwMS9lRnEwME9iNEM1UVF3blVCSnQ4OWhpVkZNcXV4bFJjVlBjaEZlQjJM?=
 =?utf-8?B?b2plZzBsSkpPNDdxTWRMT0hTQnQ0Y1BKcjlMSm5SNi9MVWdQUnJlUE85S2ZL?=
 =?utf-8?B?TVFlU2RacUcvRWtrWFd1WC9MOVZHTGkxckVuS2xuYncyTC9TaGdsMVAzejk3?=
 =?utf-8?B?cjVKUU5UUjMzUUR1K2FYTWZtOVd3bnBpOFp5ZndBSkZxRmYwRGNmQ3pVMnJ6?=
 =?utf-8?B?Ni9LQkJ6SWd2MmlhU0hMK2owYmd6dEU0N3dQQ3k3aFpneWswaWdLWGZpVnVZ?=
 =?utf-8?B?MFFOcUpRSm9mTUtlMWhPQ1MvWS9aVHExL0VsV01NTDQzS2pobzJsN3ArQUtj?=
 =?utf-8?B?YnRDR0lRMU9ya2ptenpJZnBXbkNqczBXYzMwelZDWkxxT09oUlFqOWpycVNm?=
 =?utf-8?B?MGdFaUxiam40ZnpSbnVyRGRQalh5YXV0ejVkSlR2cG4zdnlJb1l6OXN3MW9G?=
 =?utf-8?B?TmJEWHRnNEJLTDB2azRWYVdGSEFTUUJpYU4rbHVZZDBMRjlzVnRRYlpaaGlz?=
 =?utf-8?B?L0czLzg4b3lDMXYweEFIOHBKWFhFaDVFUDhWcXE0OC80VkR3bG9JVUphOTFY?=
 =?utf-8?B?Q2MrTmNLQTJlekQwdmhTTEZQNmh2WU45RFkxb0ExMnIrejVmTkVxM2hrSVVS?=
 =?utf-8?B?UWZ3ejR4ZFc4S3pIUE8vOTk1ZzYvSkMrN2dvQ1Y2TlpRNkQxQS9uZktNdzlG?=
 =?utf-8?B?MjByQUVMYzFscTdYclEyNFJ1Q3lWK3Rvc3FlWlZENHllOE1qU25URFBtQnQv?=
 =?utf-8?B?REc2NnhzZXBxSnIyM2pJeGI0KzBYcXJkZys5VFI3U2FHeUxNNFFZZjg0UGtR?=
 =?utf-8?B?eE5ROEZmdHFBNlJwL1JqdVVjNFVacFZNdEZ6SjhMc1Y5NnZSZFE3SkQwYmIv?=
 =?utf-8?B?akR1ZTVPV2h3RWFuZXNjdWQ4K0hocXUvWXR4d2puaVJ5QkVYUTAwWll2NGpn?=
 =?utf-8?B?b1BMekVOdkJ6ZHZXbStXNnhCc1RsYUxTNWNuMGkweG5oNi83WndBS2Nmc3Fv?=
 =?utf-8?B?UzlOYTJQelNLNGlvc2cwZWtHcmVjd0YvTDBBVWdIUU1oSlFQVzNKSzZQTjBz?=
 =?utf-8?B?TnJrMzdxWENMZ0hTejBaMlk3MHduVDNUdHlOMDVsQzk0L0ZrKzZ2ZTQ3WlFu?=
 =?utf-8?Q?/zk2wIddXjPxhMOUhTa+6XX7B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4967730a-c41b-44c7-f1f1-08dd97f6a240
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 23:32:49.8659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iuvnrFXjaQrW9Qcx3Cm2RiUEjqDhYzN1CTAXa4eX91n4Zyr3ymk+p6m0yhXl9odHjNjrYmx+386qj8CiR8qm4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_163314_564497_8D05753B 
X-CRM114-Status: GOOD (  18.38  )
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

On 5/20/2025 7:33 AM, Simon Horman wrote:
> 
> Correct spelling of platforms, various, and initial.
> As flagged by codespell.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>

Thanks,

Reviewed-by: Shannon Nelson <shannon.nelson@amd.com>


> ---
>   drivers/net/ethernet/mediatek/mtk_eth_soc.h | 4 ++--
>   drivers/net/ethernet/mediatek/mtk_wed.c     | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index 2d4b9964d3db..6f72a8c8ae1e 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -1178,7 +1178,7 @@ struct mtk_reg_map {
>   };
> 
>   /* struct mtk_eth_data -       This is the structure holding all differences
> - *                             among various plaforms
> + *                             among various platforms
>    * @reg_map                    Soc register map.
>    * @ana_rgc3:                   The offset for register ANA_RGC3 related to
>    *                             sgmiisys syscon
> @@ -1278,7 +1278,7 @@ struct mtk_soc_data {
>    * @mii_bus:           If there is a bus we need to create an instance for it
>    * @pending_work:      The workqueue used to reset the dma ring
>    * @state:             Initialization and runtime state of the device
> - * @soc:               Holding specific data among vaious SoCs
> + * @soc:               Holding specific data among various SoCs
>    */
> 
>   struct mtk_eth {
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index e212a4ba9275..351dd152f4f3 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -2000,7 +2000,7 @@ mtk_wed_configure_irq(struct mtk_wed_device *dev, u32 irq_mask)
>                  if (mtk_wed_is_v3_or_greater(dev->hw))
>                          wed_set(dev, MTK_WED_CTRL, MTK_WED_CTRL_TX_TKID_ALI_EN);
> 
> -               /* initail tx interrupt trigger */
> +               /* initial tx interrupt trigger */
>                  wed_w32(dev, MTK_WED_WPDMA_INT_CTRL_TX,
>                          MTK_WED_WPDMA_INT_CTRL_TX0_DONE_EN |
>                          MTK_WED_WPDMA_INT_CTRL_TX0_DONE_CLR |
> @@ -2011,7 +2011,7 @@ mtk_wed_configure_irq(struct mtk_wed_device *dev, u32 irq_mask)
>                          FIELD_PREP(MTK_WED_WPDMA_INT_CTRL_TX1_DONE_TRIG,
>                                     dev->wlan.tx_tbit[1]));
> 
> -               /* initail txfree interrupt trigger */
> +               /* initial txfree interrupt trigger */
>                  wed_w32(dev, MTK_WED_WPDMA_INT_CTRL_TX_FREE,
>                          MTK_WED_WPDMA_INT_CTRL_TX_FREE_DONE_EN |
>                          MTK_WED_WPDMA_INT_CTRL_TX_FREE_DONE_CLR |
> 
> 


