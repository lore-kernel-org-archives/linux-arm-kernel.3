Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9BED4662F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 21:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uXAZdPmUkessXAgUMjkvbcm7U/qGJZZHHbg5dFlXpE=; b=m6jG6botzL3ddxkXgVg94yGSvY
	JO0kbJuvJZV0Wv8f89WvvPSD3sFuWcDvjEI17J1ocNu4yHPoYGxVVftU0F/3LWKx8dH0+vh9ma9Ro
	7dzHg3y+ndjfFM2f25LyQoVz1vkBnOxjg5EiCWmQONzuxZg+7eTZToevDEiLGnBQGLTieRJmJrKd6
	ToJkIHjR9moPaWHsjqKa6liIgBWTV9ql9W6cjhoE6daKputAahPPcX73xLHQudT6LfWMxrUT71csj
	BFySAqjC5yG1YKvR4K2x93sAaiiOvpK8B802fX92ftE4FBA+SmRvj6atD11V5Qpy/4I8eiMh1WYx+
	RHV99T4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVJK-0000000DFEs-1X0D;
	Thu, 15 Jan 2026 21:55:22 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVJH-0000000DFE7-46Ty;
	Thu, 15 Jan 2026 21:55:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIqIlRPuj+iUQSXa7OKSfFMWf5KGN2TtRRUj5eFCdWVN2e9VyOsqXweYr+r4qhPN/2mpoROckUTNLdMc6IXpb7iRhfuAt8WOjx8s1oMGFyGd4kV02+NPvPNjQ4p9rKLEW4+iHAV8l9UDYPLVelsj4EiPrvn3b6bFhKc0QD9NRCGI/vH3n1p9o0ttPac7QrKSqf+1b0L5K5QQ+yc2ulIfBvXtSctFq36G+5VqfQLw6s4ZKdJvIxxA7iAqMufQFYtqP3UFivHD/hz520keWHLeEZjSDwCSBVgN9hVJzW4ANs18mkoTYpN1eDkuHZunpmI+OyFYrhaJMNs9MiQuIyx4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uXAZdPmUkessXAgUMjkvbcm7U/qGJZZHHbg5dFlXpE=;
 b=C4jN3XVTzYTRt1s19BfMumM91aDjP7vvF4nbiL3Wc8pvLUllLsRi/Z5KuEOv384xPmIq87ohwqIJnqBJvvf8gL6h59uqiUuszgb2ZO0P/x336/9yevH+tHc5gIJi0vVsudoEsq2UQucH8ZfO6ZPXLrWWVftivyiSBl9otzRCXV4Imn/QfNJjv8XejCwJ1xZDGXEavWK58vYG31C1cB2xopbKpHTg4sYM/CFyXb5B8IGHSiLJMKaDYj+25WbUjwCQiUWDJTfmbwLbTVnJbgHxJmyIiGOCMnxYOal9CjGUUygq5KYLY+KjxOvGzBJ3wGhKorHYAz9cWTJ661s4FTUVmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uXAZdPmUkessXAgUMjkvbcm7U/qGJZZHHbg5dFlXpE=;
 b=bK3odI/rNnVPzvtCg3rZ4K3/ZwQ9XMFUYxQ6iuTcbXeDnu3FfjrbpBFYnMVgF9dMkxfx6YYG8KnsJd+w6/fvC7UdBXgN+azpAnQ+kQn/KotHR+HhdC4tFw9eR5WG4m7VLEqyU9s5Uirmr8L8NqBSzvr3E1E0jSuX3fHfiM4olzy3ayRzsxWf3S6mEteQsBjwW71kMIQAIu+voYRqkd/3neuH26r5EAfMAczO2JvTNAou3u7beqyeTCOVvzOYtbAzCoNqtDflJ/hiE3VDAJ5psF025gAF3DTcbJCfFu0qlw8tRy2fcereNKweIdv24hBdf5O+T6ZdBcahU7McDEfs4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7630.namprd12.prod.outlook.com (2603:10b6:8:11d::6) by
 CH2PR12MB4326.namprd12.prod.outlook.com (2603:10b6:610:af::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Thu, 15 Jan 2026 21:55:15 +0000
Received: from DS0PR12MB7630.namprd12.prod.outlook.com
 ([fe80::c81a:611d:7325:7744]) by DS0PR12MB7630.namprd12.prod.outlook.com
 ([fe80::c81a:611d:7325:7744%2]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 21:55:15 +0000
Message-ID: <080d7aef-0139-4da4-8f43-aedbf9bb9948@nvidia.com>
Date: Thu, 15 Jan 2026 13:55:09 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: Mark Nvidia GB10 to avoid bus reset
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?UTF-8?B?Sm9obm55LUNDIENoYW5nICjlvLXmmYvlmIkp?=
 <Johnny-CC.Chang@mediatek.com>, "lukas@wunner.de" <lukas@wunner.de>,
 Project_Global_Digits_Upstream_Group
 <Project_Global_Digits_Upstream_Group@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Williamson <alex@shazbot.org>
References: <20260115205347.GA881345@bhelgaas>
Content-Language: en-US
From: Terje Bergstrom <tbergstrom@nvidia.com>
In-Reply-To: <20260115205347.GA881345@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To DS0PR12MB7630.namprd12.prod.outlook.com
 (2603:10b6:8:11d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7630:EE_|CH2PR12MB4326:EE_
X-MS-Office365-Filtering-Correlation-Id: 70068931-b83a-4eb4-9072-08de5480c3c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE93ckU5dGMzbFZhaXRmbG9KMjV5eFFaWFdGWlAzZ3Jkang0aFJGeE9Wb2Zv?=
 =?utf-8?B?WmNlYytWd2JMaU9HN1VGSWhUYzNXYndMUXA4WU0vM3ZFZlJLRFBPNUhkYnVX?=
 =?utf-8?B?N0FDVHFnV3AyZ1ZoTnN3eHY3QWVLNXErdVpCZ1JxTlh3a2g4Q3NPaDR6TjIv?=
 =?utf-8?B?ZWRXaWhPMEs5aTF6SnZrUXZRbUk0Y3FnYkVJM0NMeE5HemlmT3BLQ3pzUTVH?=
 =?utf-8?B?SXBtcVpwdnpacHdGNmpDbEphOHNHRnpsYmdBQUhVRVppQmxqRE5EdVhEcFZR?=
 =?utf-8?B?d214eVRwblNRbkpISEoyeG1nakNienhIMFlCRGh5eHNOd3pFOXZBTy81RkJ3?=
 =?utf-8?B?cUg1d2RMRTZqYnA3VkhPRzRkbnJTTWhuTnhNQlhVaUQ3V2NTWm4zczc1enF4?=
 =?utf-8?B?VUVJc0x3dktBM3pTOHdMeEZ3YzJXd2lRNU9hTEZuME40andCeU1wYjkxN2Iw?=
 =?utf-8?B?T3RHU3ZZeUhPQWVnZU5SME9mOVRpUWkxT3BTRUcraWFHaG4xMXpCTVh1dGxi?=
 =?utf-8?B?WStmNGwvMm9RVFZZNjlFMENrSDJDRjBkbktrVU12Wlc5eU1EQ21jc1Z5VmtJ?=
 =?utf-8?B?YkVXaXZSd1FvRDcwdEVJU3BSMTZFQTMzMC9YMElzeDJEOHRwSlZJQjBYT2ww?=
 =?utf-8?B?QUFpMXpMQm9uYmlEQnQrbDEzd3VPUUMraktHbENCUU1VNGl5K3k3SUd1NmZG?=
 =?utf-8?B?VDRNTW1DYmNxQ2ZVQ1pGbVNXdW4wRkFlUnFzSEthUStKN3dwd0lTK1NpbFhp?=
 =?utf-8?B?a01wNkNXamtJQ0JjMVVQS2RQSXZ6WjM4VVhPaHdid1QyL3N3dXBpZ2NNMldV?=
 =?utf-8?B?VkJNY2hsSE5zWUVMNWZpREhiVldOdG9uM3Nid0M5QkVhMGdBQWdSWms2WElr?=
 =?utf-8?B?dzV4Q1R3bEJqQzhIMjdwa1RGTVZzV3dmTm9lWVdUUXQ1Y2I1OVRPOElNSGZ3?=
 =?utf-8?B?RHJuTk5PS2J4Nk9JS3IycFlhS0NZc3MwNFdHMGlNVi8zZ2tGUmp4cWh2QWdJ?=
 =?utf-8?B?NE9IbkJrSXp3OGkvRVJEV2lpaktZY1dyMmFoU042MDg0K0gxZjhzRnYzTmpB?=
 =?utf-8?B?QnN4WnpqTDJEVmlnbGtyN0ovaGdlQTdjWm1DV1Z1TGhlU05oenJOcmpWQVNw?=
 =?utf-8?B?S3VuZWNlMXhEL1pHVHhmUWl3QjByMXA1UldhQStwTng5N1Q5WmdOakY2TVJY?=
 =?utf-8?B?WmlqUElnbG8wZ0lRZ1FUbmJwUm0wdnp4Q0pZUlBXbXpKOVdlbWVyQlpuaFhI?=
 =?utf-8?B?UlNzU2djRUdqR1BHQmo3Y21NU3R0YmpWZ2k0Q25HQmpkWGJ0aWpWRUJzVXpB?=
 =?utf-8?B?LzIwUk92SVM5aDJYYllEcDVPSkw2MU8zVEpkbzRUWGVPS0xhWXFRQ2lFK01j?=
 =?utf-8?B?TndrdjVvYnMzdU9GbXptUHpxTUFjblErZkZwRzRwMytsN2R1OGt3cmlNeDk5?=
 =?utf-8?B?QlJLSWJhTjh5T0VvZEhML2VYbzdYQTZPdW1rOExUUURXaTIvRXREbTk2NlBQ?=
 =?utf-8?B?ZWY3b0lLT1BlZWxDZlZOQ1QrdlhCSklROHZGZVhkQ0x6b2djMDJHdUxnYlI3?=
 =?utf-8?B?a0VkaTRNRVFad3VTeVN0SEdPV3lLK2p3SzRuMmZXYk82M1dRRnZGS3hOUmQ5?=
 =?utf-8?B?SE83U1RReUcxdThJRnpqUFFUd052N3NQQnA4RnA4bDdmQ0hKVnpvcGZuZDAx?=
 =?utf-8?B?Y2pVTEFoUDR3NHd6OW4xaFVMSVZQQ3J2bk5DNGMvU0pSZmMwVEN2dWlwWkNC?=
 =?utf-8?B?YjBsZ1FsdmpJeW8rSEhwZmtyWU9aNkhLNE4vamlKM0lHR3g4TWlyeUMremhn?=
 =?utf-8?B?bmZyaFFJZFZkWGt1MUVpR3JvNkFReW9zQmdER0xDTDZkeW5NUkcrbHVoNWhl?=
 =?utf-8?B?dGtDMFJxaFZNWXZiRTZ1ZTBjamFIR1Y2eTh4WFptY1VEVUlYYUJUQlRzam9k?=
 =?utf-8?B?amJBanE3ZTNSck83WjhjQXJlUjFCckV5Sm9pcGpidndETVNoTGdZQ2FmN2cr?=
 =?utf-8?B?cWIxQm1tZVVwTFF3K2c0RHo3aUgwdFYxYVRlWjJDMDFBVlkzekRadlJNeDV5?=
 =?utf-8?B?cDR5NzRSVUJEaWswTjJVZkZFODZSZkw1NzBrd0ZCa1V1d0daejU0MUdiUjl2?=
 =?utf-8?Q?OT6k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7630.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmhaVUc1eTFSaWNyOUhBUjJpcUdLK1BqRXhyT3JMVjZIRWdrNFY1eG83dE0y?=
 =?utf-8?B?bG4vYzB5UEJ1eFZiQy9FdUkyS3huTFdvaUpTY0piQmFjdE1GaFJlamFEYWZh?=
 =?utf-8?B?eVVUekxPbmh4Z0JHQW9OTTFqeUUrNHlGUlNwWmRVWHlTejFFUDlDdVFQVXFX?=
 =?utf-8?B?YnZ4WUhqblhDQ210M2VFWVd4N1pHOCtwZnIxa1lJZzU1cWsrTCtyQzBKR0dZ?=
 =?utf-8?B?emIzM29uSFdka1pENmkxblVVRjdCOC9Jd1ZYMVRsU1BVTEVLS3ZTdTVpcDB3?=
 =?utf-8?B?RE00QmFObkJQZnloR3JIVEJuUllwYnlHN0ZWYTVkZnFKeEZLdEhScXpWMG9v?=
 =?utf-8?B?dFlSd24zOGRZc3EvWDBPSzlWNUwxR3l6MjdrNmtzUFowaXk1TEh1clVmWnJl?=
 =?utf-8?B?R3hEZjcyRXRJQVlBSytyQzVnMExiellhOVI4OEpMbzd2WVV4WXdPUVZPZngv?=
 =?utf-8?B?ZGwrSXhuV3U1RDNaOCt5UGoyVHRxbjd5a05zMWgzSURyVG4zMVBvTlBFaUha?=
 =?utf-8?B?ZnJwRFF5Zm1TdmowWVlFME8xbDZhMjUxcDJ1SHdtRWtUS1JBWWpXVE9lWXdJ?=
 =?utf-8?B?TWZsdlFGQUtvaWV4czhkT0ZXUDZuWjJvRHRVK1ZwRGFyZGI5ZkxSRWo0K3hJ?=
 =?utf-8?B?a0VkVERDeVc3N1VQSi94UmlNTEhJckVQQk9WMUVnQ05VVFBsSjRYR0hkNjkz?=
 =?utf-8?B?V3NheCt3UWM4c0RzSnBZYkVKdmhyM2kza0FCZGgvQjZ6eUVkQVBrWXdNYzlI?=
 =?utf-8?B?cjlSVnBzaS9pY1hmMkFhZlE5Y1JtZmh3aFdEaXZKU0lkNnQ3cEtJVTM2UjNI?=
 =?utf-8?B?dkl2T2JZQ1hIWkw2R1BsRWQrODVlK0Z0djBkU0NNb0FEc1FyU25qem1TVDRo?=
 =?utf-8?B?UXhLKzZ4d085S3dTTmhWd2NDU1ZoOTUzRnVFVFdtZkFXMnVtN0pzZFlJSFdW?=
 =?utf-8?B?c0xsRmxjMTM0RVBOa2RGYlhrOEJVQ1hkY2ExeG1MbVdJNlptT0hGQktUZXBl?=
 =?utf-8?B?V2Z0OWlwc1NlUFV5SXBZVTEzbXdPYnVpeWJNZUpGdXdTL3BFLzdNZDYvQVR3?=
 =?utf-8?B?MHhnd1dFemxkNXh2UlJ5cVROYXdSbnpaVnQ5K3c0TEVQT0tJYXNoZjhnNklF?=
 =?utf-8?B?dHRESnRvNXlqbGdEVmNtSEhMSTlvV1QvNHhTQ1NHWVR4dWlJT3czYmdIQVYy?=
 =?utf-8?B?Smw1aXdZdVFZS2JQMGNIK2xCa20xTUhJdUZ4RlNVcmJxMGIzYjVUdmxQNTJS?=
 =?utf-8?B?VWRBWTQ3SkhLaUJhOWloRXAyci9qV3VPU21uRm9MclZ3dEJwQS8zeiswS2Yz?=
 =?utf-8?B?MkRWaE9ibWczVlMzK3dZc21NOXk3WjlzQXdGcUlCRUxKLzhxZmY1OHIwVmNY?=
 =?utf-8?B?S01Nb2VUWnBiS0gxZVpvb1BldjdJUXBhSElyL1R0WTI4VmhiamNIUHloNjM5?=
 =?utf-8?B?bGxnZjZiRWxLdGw1MUdpcEVMaVNSVXVWbUp0UkJ4KzBBZm1lQUdHVGZaRWtj?=
 =?utf-8?B?WVBBN0c3cTdBQlVUek5SbThjNVVOUWsxckFwVk8xR1RQUXh5SkVVcUJEb1dH?=
 =?utf-8?B?L1k4NHl2ZVZJUDFwWEZROTdMUmprV0VZVzNZVmhHdzNzYlRIU1Y2YVY2YU40?=
 =?utf-8?B?R0JQZG9iTTV4cmZjMlkvMzAvKythcDdhWi91Qk1Jem44clEyQ1NoUEpGdUtL?=
 =?utf-8?B?ZyszNlUzVjFYU3JiMnhkejdvVmJzaUVPc3NHT3hLRW1FY0xONWpnNkNWczRC?=
 =?utf-8?B?blNUT1A5R0pYYWMyc3BPTng0SXdHbmNiMXFDNGhETlBxUTQrNDVid2NUZmZ5?=
 =?utf-8?B?WWtRS3NmeHJGSmdwdmNuMzZUYS90aFplTHM2MStVQStQRndxUUdENkNWVG1x?=
 =?utf-8?B?ald2UkN6MmFJakRWdi9rcE1wMi9yd0ZrNDJ1VjBGK284MVBkbVJzL0dOaWxW?=
 =?utf-8?B?bjhoZHA2aU1MazA2L2xhcnl1WXhnQkhuanZOMmI3bUduY0lRalJPakc1dnFM?=
 =?utf-8?B?YUxpYkgyQ1lqTnMxNVdYVEg3RGppMWdFVFZsZVhwa29FcjJOYnJueDV3aXI0?=
 =?utf-8?B?RWwzQUM1SXVpODJUTitLc1cyV0h3VXdtb0M2WVg4VkdZUWNCeTZtS2VyZnly?=
 =?utf-8?B?bHlDZktvT1ZRZGxoZ205bmEydkp0OXh3eVhZejlhdkhrTmFORUdGNFVuMDJ3?=
 =?utf-8?B?T3lBSGxnd0xqS0hYbWVpeWYrR3JSM3dFNHB5Mk14Q1cwNVZpcGhFT0RGOERD?=
 =?utf-8?B?dDVFZzQ1MzNzZTRVaXlnYTVVQUZ5ak9EYUZUUTU5TlZjZlJzVURKN0xvRmxo?=
 =?utf-8?B?dldZWm5Xb210ck1RWHJLM1NRNzZCa2hDMENlY1RQL2tnNURhU3QyZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70068931-b83a-4eb4-9072-08de5480c3c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7630.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:55:15.3427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3CyCAmlltNyq5I+sz9OO92BzIuZ/0F2cboS0Ghmxqj1NdBz7LgGpwgqoJgVVNR93oQw8R9XD2kRaNVyME26BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_135520_028742_7A89FDE7 
X-CRM114-Status: GOOD (  10.84  )
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

On 1/15/26 12:53, Bjorn Helgaas wrote:
> OK, so you do SBR to some endpoint below a GB10 Root Port, and after > the SBR, the link to the endpoint retrains with a lower lane count > and config reads to the endpoint time out?

That's right. The symptoms can vary, i.e. sometimes it retrains with lower
lane count, and sometimes config reads start timing out, and very often
it works just fine.

> I see you're from NVIDIA, so if you're confirming that this is a > hardware erratum (not an issue with the GB10 PCI controller driver), > we should definitely apply this, and I'll wordsmith the commit log > and comment something like this: > > When asserting Secondary Bus Reset to downstream devices via a GB10 > Root Port, the link doesn't retrain correctly. The link may retrain > with a lower lane count, and config accesses to downstream devices > may fail.

Yes, I confirm this is a HW erratum. The problem doesn't occur every time, so
"the link may not retrain correctly" would be more correct, but that's a minor
comment.

Terje

