Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88FCECD981
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqnl5GL594nigq8Vfkv2OZYRaWjTIehVAKPRRukvfj4=; b=kHgYzI04U23oshxqsnn/ggpghh
	ti8EJRVofXEFhdmrIJC8+/jk1WrU6RmFfNm8X7W1rbllbwajap5OKoREEOGVr58uQvm+RhWShkBxh
	DGnPyMhaA3cEE2/bqNjd+7K5MO/Bq9/Q25vikEbzRvaezZhwOBIhQm63xJidn1/AaDYK5TrY4BrZP
	aFrY38OJavFEugyi1PSKJlzMiC4bdyOeRcToWSBcTgZ3zciGRZSdf3nbodfMAbBzx/rOHbNShbsGw
	v+Smp34RqtCfY66bzbwsCuiIxuZqqobUilbRg84V94uZOGX9yKMK4MPIQ3iKJliu9MFkUqPv/QEN9
	k2eNE7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1kj-0000000ABqM-3QDz;
	Thu, 05 Feb 2026 15:58:45 +0000
Received: from mail-northeuropeazon11011056.outbound.protection.outlook.com ([52.101.65.56] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1ke-0000000ABow-3uKY;
	Thu, 05 Feb 2026 15:58:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfGKuwQCJkw94X2y/a9OHg1uG+sCq215/uEii7WYL5mXgtaNe6vkVer7mwQFkq7zS3By0rvPCtFzM4mJGQV0aiH24V+7HvfsCUchMO3s9AoB7F1X5E2t/Z/I/RJ3EMMb7bP2JrSfBPTL1C47N3HegP7YEJn03p/+GwqoNA8HwKukuLxHqUl0jbJDm6+1zjXZQDop7VKHs/hAVWki1v0Se8C9K7HDtjMN4iBKizCoNK4ZJmnC1g8/e2Eih6DnS1a7IH5DVuCxXw0YBOCSFbJhKehvFYhoywLSQsym2pbTaNyXsOqrGl0OLEeUDZ5j37Els3eobH0WqnGSUEajzZiygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqnl5GL594nigq8Vfkv2OZYRaWjTIehVAKPRRukvfj4=;
 b=K9oYYFNOSk9X/5oNa7K4KC/VJQtuU0A3g4MJkRnwUnLgX2fjImP6J/m060YJfsfCYBKirLg5KFLTobjB81NXiWRFrxkMsL0gtaXm49L/hTIQE9+GbwZL3XX11tz9pJsVw5pP4r/MMawyDWCBKU1FMQd4Ca5TLznLvJE0J7nJd3ZtxGr1ZU/9zibepVBtR4MyAVIWVZfvoh6zjd6jUOtgsS0L1ILa6ra5TQWjn0z7/1smhGxHpeeb208O2yCt4CjgfBiqCRTqHr1NSzLN6fgg7S7378OqpxZng2Z0egQzf89tn2ziIpmvTOa3sv4pgW3/yd5ty0PUzBdPqruaGCROpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqnl5GL594nigq8Vfkv2OZYRaWjTIehVAKPRRukvfj4=;
 b=fhpeESFgKdFxNhsfCuDFFTPSu5cqFbt1WWFT9S8dVrfHU/5NRbl3aZmHcdj/znr+ATeddjAQCYDAt+Pg35qMGgxGhzAKQZ4NEyiIG3RM6uJOsON8nKTt0c5B0PK+IxlfZMrLU2Ci6LBrwdo2TAqXQyhiCEU4yIvz9rUhncaWvC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 15:58:25 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 15:58:25 +0000
Message-ID: <5cdd1a69-e28d-4869-958d-cc83f331578d@cherry.de>
Date: Thu, 5 Feb 2026 16:58:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: use gated-fixed-clock for
 pcie-refclk on rk3588-jaguar
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260205102104.394991-1-heiko@sntech.de>
 <20260205102104.394991-2-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260205102104.394991-2-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::24) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PAXPR04MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e2d6a9-a7ca-40a5-0a23-08de64cf6536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVZVTUNhUktsTjFmMGFxMzZyTTBRa3J2WUZSVGZHNGp4d2oySWMxK1dHdjRq?=
 =?utf-8?B?V3VCUWF5clgxOUp0ZlppNThCNG5EdVl3VnJFNnRia0N4WGkrSVlDUDlNMzJQ?=
 =?utf-8?B?Z3lIMXZ5TzNkZmNLRExaT2k5TkFYdFBWUzVkOVJOaFhoTUpaWEpnS2xoYjhp?=
 =?utf-8?B?elBoQmNBUm1PUFNqUXpra2FzRzQwc0dTRDNQTjJKK0REalA1S3krcDVhNVVV?=
 =?utf-8?B?aGh1RXV0cVNRNEYwN3VzRVpxbzlDd0hYUTlGWlJRYndCbksvd3dXQ095aWM4?=
 =?utf-8?B?US94dUl2aDZQc1AzRnJIRjhxQ0JRRHBHc0V1b1A2cWdiZ1J1NGZPbHFqV0lZ?=
 =?utf-8?B?aHVIKzl4aVJFRHpBOWp2aDM3VUZTRlJmaTNGK2Rxck1zNU9DOE1IMkdvK3hJ?=
 =?utf-8?B?bEgxUDV5UXJTdDNYekR6RlM3elBHTHJTV0hFaVZ4WlhJWTlwaFg5S3JJaC9G?=
 =?utf-8?B?TG50RFFNODFacmFnK3pMeS82dktqOEV1RC9VSG5wK3VqcmVYOTd2eGlEZnd3?=
 =?utf-8?B?REJpdDVPMCtYUmxhcTFpZzdqR0YwUzN0L3ptRlRaSHUxSVF3M2RBNXNhYzhs?=
 =?utf-8?B?ZTEyTGVnSzNFS0pRUEc0QS9yb1RQM3NzSFY3ZFRjbWRBY1J6cjRUQml5L2RK?=
 =?utf-8?B?cnl2MUF1d0YyeXZ1bnZUdlNZNVlRRklvLytLOXJKK2xpdXVvUjlrMGc4Y1ZM?=
 =?utf-8?B?Uyt4UFlwQWZLeFV0ZnR2NTJ5YlRIclVGaGZFUVYwZ0N2dy9DTTIvSzZjR0M1?=
 =?utf-8?B?K3JEYkowVUdXaEh0dW1PUUtFaVVVS3BDMXpqbkxUSVBFenJGRmxaR0RPRUxz?=
 =?utf-8?B?VHNnd1cwS09RY1F6VEIra3k0dUdnK2I0THY0QmcrZkRleVRkOEp5QUNxclE3?=
 =?utf-8?B?aGRmVGRnbVFGM3NaTmtOQ1p3Q3RtZ09QaFc3OEJTek1oU09qakV3VDc5OExk?=
 =?utf-8?B?TkV3VFAyekVyZkNUbjVncnlyaVJiTmk5QkgydmZvV3dpK0lGUzBxUFlHaXJ5?=
 =?utf-8?B?WUlUQUNRZm5QR1V4K3VkOFgyMkx1QWJvc0o5Q1NGR1ArYnJuRGVDVnpKbXRF?=
 =?utf-8?B?dzN5K3F2MjRMS3pnZm1wYUt6OGw3bkxpdE5ydHZIZlZIdU5oTFdsUzhnL2di?=
 =?utf-8?B?N0hkZDFwOTBKb3gvNXk3OXFWak1HVjA0d2tGSWZoOHNnT2YwS0JsN0xYYkVq?=
 =?utf-8?B?aTZYRXZrV2VleW5ldGl0dWlvb3pCZjhveWtJTklQSWo4RTBraVAwNVZieVo3?=
 =?utf-8?B?YjY3dVVyZFEyeXp4VXFDSDlZazI2QXhqYnN0S1F1ZzJPR3UvMVRwbUh0NXlv?=
 =?utf-8?B?a3JaNWV2RUZQSTRrNHQxcVVUQnB1WGQ3VmxQZE0ySUUzNlBNQmVhQno1d1l6?=
 =?utf-8?B?RXFJL09GSHNveDFmeFdHemVCL1NkMlZQNU8wUVJmMDFVM2NTSFU1N1I1WWxM?=
 =?utf-8?B?V2dVbzZubGp1c2lZc2t1MmpXcmhwS2JMSTkzbE4yZG0zTmw3Y2NQNW5jT0hE?=
 =?utf-8?B?Szc1dTc5S1hoYitqdmtodit3bDE1NVgyVCtVejJrY0M2QWNoeEgzL3RFMFBj?=
 =?utf-8?B?TXllbXp2eTYrRE1uTk1WQjhmSEU5a3JFQ1JCMFpJWVJ0a2hvVWkxbkg0enBD?=
 =?utf-8?B?bS93Ly9YaEtLUEVmRHV0Nnk1M3VubGdRS1IvUCtnSmJHSlIzaEM1QkR5cExT?=
 =?utf-8?B?SGhvWFJySXJ5ZEp6MDhqZUR3QXk4T3BBb0hLV2pYR00vZ243SXg4Um1XL0Z6?=
 =?utf-8?B?enBwa1B6dmtxdXZBS1JNTjBNNC9PbVdTd0dMMExBbzZONk1RMGFQUVNPRUU4?=
 =?utf-8?B?S0dxZkY4UzJ0SGN4WHJ1UGZta1pCY2F0M0gySUltMHRNSjFLVUhJdStEM2lC?=
 =?utf-8?B?WnZsR1FYNUdxUEl3TFdhbDlxVlZyMkh2Q0cvM1JLZkQ4ZjRoY0Vlcm1BVXBP?=
 =?utf-8?B?M2VBTTRHNTNKR3QzUU9GaHNoM3BrYUJITWdoWHlMb3Y5bHAxbzY1OWVyTk1Z?=
 =?utf-8?B?Mll4N1poSndQa25KNkRJYnd1YkowdHc0eFRla2FXTEJ0bTRmdkU4ZWZES0oz?=
 =?utf-8?B?U0Y4M2Y1N05DekdZeEhNcS9aY3pJajZxdEtUVHpOVEY1V1QreXpZTTVvbkxU?=
 =?utf-8?Q?79ZU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1p3eGdDYzRzakF4aFBYelMyM09mR2I5U0NadFVhalJ6aERmSHJkakErdTln?=
 =?utf-8?B?dE1rUUxIYzZMZ3VEeHNGY3JaUzdJWDZJY1loalRNdGlOZEJiY1E1TzJ6enBu?=
 =?utf-8?B?QTVjQWcyc3VnQm9iVVpwRGJGRkN3bzhXZ2xiK3FiZ1hyTDZTU3NhZW9FT2R1?=
 =?utf-8?B?aVRkUEhWcnVxNERIMmdYaVAvaE1hTW9VU3BvSm1rNjFNZi9pT1Qva0tKb05m?=
 =?utf-8?B?Ui9sdmpqQzV6NjVOcWRTL3Avam1VaXNrZTQ4OWZUZW4zMEpHcUNMcllSV2hM?=
 =?utf-8?B?cnB6RzRKUCsrdEhWS3oyV0p3cmxaUGQ0N1VZdE9TYWNaMG5uLzJPSHVlYjMy?=
 =?utf-8?B?SjlZTkdEeHVweDd1OVN5RmIyV2ZLWjVMdCtWREFRbjlRUTR1cStzVzFZYVdR?=
 =?utf-8?B?NkdxbXFCRmNCOXNvTDkxWW0rbE9hN1NSZVpaczBBbi8wSi9mY3VqdlpjWXMw?=
 =?utf-8?B?RmNnZEt2ZDgxb25nTDFweHh0a2tUc20yZkFRcEdjYjJ3SkU4S0grdm9DZVBN?=
 =?utf-8?B?YzM0TWZ0S2JPL1RSbk9FTjQwZnFUZEd1eVhWTDdLWVpaYUlqVUNqaDgwZmo5?=
 =?utf-8?B?aFFCZk5MejBDNHcrSTloL3dFaSsvbVFBQXkrc3c0cmprcW9yR0l0RmN4L2pL?=
 =?utf-8?B?TnVCbDZ0Mk1PcEJXRFVXSFlhV3l2Zk5qWWhnL0lzWE5WbjRjTEhwS1BMVWNz?=
 =?utf-8?B?b3NGVnlUOXhvY0RnV2dVbzNLZnA2NENBREUvbzRuVjBDZHVwMmVTWGZMUzl1?=
 =?utf-8?B?UmxnaEZucG94emFjOUk1bTJyOXNUVFAyUUpKblJXb2xiYkgyQlZDdFg4Sktj?=
 =?utf-8?B?UjgrRnFXUU9xVkZ5SFdhR1pNeko3Vk0yVE14dVNMb2Z1MkdlK2xjN1JPY211?=
 =?utf-8?B?K280dzVRTXpWM0pQZzh4ckhvT0w0cndqd1laR2RYOTVXK2g1bmtyb1QyMGNs?=
 =?utf-8?B?b1FVZ3JoZUViT1U2RjlaK21YRzJvUnBqVDhSTmxvNXkwbHpMS29FdFNoL29i?=
 =?utf-8?B?elowSFpwWWk1Q1FxeSsxeW80c3dqSjlqMDlOZnlYb0RyMmpMdkIrMFcrT2Zy?=
 =?utf-8?B?WFoxNnh2VDVocHFrTnhzSXhpdi9Fck1MUEdseFpqUDhJRzlQYXUvbVhsUmIv?=
 =?utf-8?B?REtjMUJ6ZjlEbnM4YnJraDJuKzhDaEhxNVdacmU0WGhCbTk0N1E5TDRJZFFP?=
 =?utf-8?B?bmRxWkZVM2duQ2hDWU9JMzlma3RBaGFmSWRPSllxREpuaXBldmN3eW9VWkF3?=
 =?utf-8?B?VWpPN0ZCZ1NNQmRyYmp6b2tvcFN0K0crOWdhaC8vV0IvWTdMTE5nWTVlTVNy?=
 =?utf-8?B?VUx0NlRKbXFyOW45ckVxbEZIc2lMdVZmWEVWTlJnR1V0d2RYWDhENUlFbkRy?=
 =?utf-8?B?Qm1wMlkyWDV0MDRoUWYvcXlQc2FUNmFpTTF6ZnFWNnlZRytwVGExV3h6MktL?=
 =?utf-8?B?MDdMV3RMbTFCbGM3RHQ4OENGUHRnN1E3YklkM3BsV1hNcUhoeWYrT1dCUHpZ?=
 =?utf-8?B?U05aRGxTRjhUMEdLakJBdXlLYVRqbEltdzBUTXprdmF0ckcybElZbTFXV24x?=
 =?utf-8?B?eGR3RExNa1lDNjFsM0h5NUZBNHlzT1BxUkZUTVVrU2c4TTVMVG9rOHlRS1Zk?=
 =?utf-8?B?bXgrRWxxelQydWIxOXpFd2FxZHkxTDdHN2lDTXdZM0xDWnYvbW91OWpsUW1T?=
 =?utf-8?B?VUgxVlV1dkNJM0piMGlIQlFtQ0k0cVFQWEtzOGJMRDdkR3pmWEtXenN1ZjNw?=
 =?utf-8?B?L0UzZklINEpRQVEwLzIxdy9BR0VkTHNjS0xad2lBNUJ3NnNaeGdWSVpDcVpX?=
 =?utf-8?B?MktsN2ZNMW9CcFY5YjRoTS8ycU51UCtWRXlGSHBPM1d6L0hKVTA3bC9SRXNj?=
 =?utf-8?B?NWs1SkhzRnNndGl1Y0xoekhmbW8ySVlHTXhHaFovL3J3bjRJM2pablMrdkth?=
 =?utf-8?B?c1NUMm9WOFJQNzFwMjl3SzhGandSQUgxVjhGSng4bW1QeGlOaDQvbnZDOUE5?=
 =?utf-8?B?L2VPSzFkRjVVYytRUzZnMUlKZVoyOFljVk1nNlNqQnljaFIrZmtCY20yckJI?=
 =?utf-8?B?SWF4MFN1bVl6aTlabS93Ky9Qa3ZuVGxwTDRvZVJuaDZvRFlyNXVMK3RVMXJ3?=
 =?utf-8?B?ejh4N29BM3hRYzlLTFJWdTcxQW9IMzFkaSt5Nm9xUnRSbERCRHNsZEd6cmo4?=
 =?utf-8?B?VEJsTVN3R2EvZ3hLaCtJR1R2VEIwS0V1QW9yZUxXNWszSU00MFk2S05pc1p5?=
 =?utf-8?B?VE1qV1ovWkRvOXh0U3lOaW9MRWxXZjdEcGU0MHFZRHZ5NE5zT08xVXl5UlBZ?=
 =?utf-8?B?a3h2RERiUmV0V1RaaUdlLzhuU2lScHhOV1pXcGtpSXJISk81ZmxXdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e2d6a9-a7ca-40a5-0a23-08de64cf6536
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:58:25.3346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ynOH+WEVpZEFnAYWJF+BB8zIvXiDrWEF9HSyn8WP+cTEi31a8LTu7r6JHyNYKAkdEXvgaf+v6NIp/yC7HlRLK4dvRuNxHbiEqgMTlF1mgvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_075841_090615_B0830E27 
X-CRM114-Status: GOOD (  18.73  )
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

Hi Heiko,

On 2/5/26 11:21 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Using a combination of fixed clock and gpio-gate clock works but does
> not describe the actual hardware. Use the gated-fixed-clock binding
> to describe this in a nicer way.
> 

You also add a regulator as supply :)

> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> index 952affaf455c..6eea4e0b6ca4 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> @@ -90,21 +90,16 @@ led-1 {
>   	 * 100MHz reference clock for PCIe peripherals from PI6C557-05BLE
>   	 * clock generator.
>   	 * The clock output is gated via the OE pin on the clock generator.
> -	 * This is modeled as a fixed-clock plus a gpio-gate-clock.
>   	 */

I'm assuming the whole comment can be removed as it was just the 
reasoning behind two clocks and now we only have one which is pretty 
self explanatory?

> -	pcie_refclk_gen: pcie-refclk-gen-clock {
> -		compatible = "fixed-clock";
> +	pcie_refclk: pcie-clock-generator {
> +		compatible = "gated-fixed-clock";
>   		#clock-cells = <0>;
>   		clock-frequency = <100000000>;
> -	};
> -
> -	pcie_refclk: pcie-refclk-clock {
> -		compatible = "gpio-gate-clock";
> -		clocks = <&pcie_refclk_gen>;
> -		#clock-cells = <0>;
> +		clock-output-names = "pcie3_refclk";

Why change the name? I'm also wondering if we cannot have free backward 
compatibility by setting this to pcie-refclk-clock to match the old name?

Same remarks for Tiger (patch 2).

Change looks fine though.

Cheers,
Quentin

