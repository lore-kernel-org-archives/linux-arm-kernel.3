Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5C1E7DEEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGKWVHKmJeTHKDdK6FooVhqQ5lOyrUX5SxwzNYntQ00=; b=aYaEjDJ5uB/xZ0hh+4Lx/tdDed
	DRb1aFqS8JIsPnKoNh6s2e4/xPXRRDNHRsfushkERypGEDRNRSe8pPZO1aGKrXlYa2rgP9wWUm9xp
	pQWn5qcGg524hZ/j6ukMeBPmvzba6kKKiUbjarzeYCTzM57Oj+864jcK6rCrMnC1kQN23n5PIvzqe
	LYwrF5mhCgBL71RiOmej1ud45ydVmEIApLNGxW8D9pVKz0YSrzKfiQjTduwW2ke1E3TzLEINzPU89
	8hwKzv/KLzPYRig5RwRL9CFTMb0hLr/WYVtlVSH/gdLRmZvzd++JJRzqN0dYqt4fD/8KxEoC1RSzQ
	h4nIAfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuVU-00000005494-1zWl;
	Mon, 02 Feb 2026 14:02:24 +0000
Received: from mail-swedencentralazon11013058.outbound.protection.outlook.com ([52.101.83.58] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuVQ-0000000547z-0IwW;
	Mon, 02 Feb 2026 14:02:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgCoaW4GXn8IeeoCEs7hS/PwxM5yIE16WvmBzZNJK0+g+kgYbHMf50/mKQ4slW8URreATNeFjztNrCbtxA4h9y5RIcrJ1B99SBrxc70/yOioNpnjhAr+QeNXOmPf41FhjeZBrwLKnjOJxy34jhyUwCtjUjZo0AX6veo0cB68l2GjjZDHev/85LKwELmf1jZXgw5NZvehakPXBqqZZ2sZSMmDsRd7Ezh9iwGB6IdsLjaPs/PRVLHQ6lTS3BVhE2iojvNPQQBhB0OiRIdkuWAJJ+LMwfMrZOrooPCwP3lGCeIL039bLQN0EyBfp2Vg5tiGmhvUTyrcs/6nb38car2U1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGKWVHKmJeTHKDdK6FooVhqQ5lOyrUX5SxwzNYntQ00=;
 b=OFumGKijaO2Ir6Q0uYnre+i1o1tNodktI6TxnzeHrjjNEeINh4bjmyavJarCQ6LrzshO9teU6aBF7vQOM24YqyGIFWIf91q0SuhEsZHevHa35mDtPW0x9wWhw231xKZPAR4Ll9fHP95ERdKDMxiAglYGXwIBY6pN3f2SkkososQT2aWI2ZQgHsiyJ/RJnUk7DZ01QkKskreYeERCPwjq4e7G1D3/Bg15IyPcqZJOsfHvU7lHY7t6FJt3RpCN6oiBgDciz/6f6noTNp8QTsURMC2Ve1ms5BODt4oR4jiraTjaJ08VzzyvX1KtEyEa33HdoaC8gYPjrVlLkqz388tlPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGKWVHKmJeTHKDdK6FooVhqQ5lOyrUX5SxwzNYntQ00=;
 b=DIvAry6YdTZy5DSg8gqiBT6pHzJgz9hYx55Rh+qPD/I2sW5U1twXDS8C+Xo+BgR7MlaPL3c5h+HiZAADkljx3eHAANZaRAvXBZsSkZvHejKlQvzsQOKvXQQySha8ctrFJR4pR2plhJxmtWZgR0Q2o08kYIsS52hVaZ22KRRZIqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB11598.eurprd04.prod.outlook.com (2603:10a6:10:60f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 14:02:10 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 14:02:10 +0000
Message-ID: <567d6404-2a71-43ad-8ba7-5053fe1576bd@cherry.de>
Date: Mon, 2 Feb 2026 15:02:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: fix Ethernet PHY not found on
 PX30 Cobra
To: Andrew Lunn <andrew@lunn.ch>, Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260202-px30-eth-phy-v1-0-ef365be64922@cherry.de>
 <20260202-px30-eth-phy-v1-1-ef365be64922@cherry.de>
 <33d3bdd5-0fed-41f6-8b8c-9690e7665346@lunn.ch>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <33d3bdd5-0fed-41f6-8b8c-9690e7665346@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB11598:EE_
X-MS-Office365-Filtering-Correlation-Id: 10398916-5ae5-4b3a-8647-08de6263a85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3BvNnhzSXBuZm5PYmlQWGxoU3ZSaW9qS0x6bVZMRnBiUjVvN2VoRElZUWlr?=
 =?utf-8?B?STk3SlhKbmEzb2QxVkRWNi9aT3NWOXo3YjM5SUVocUNmbHVUL21BU1lIQ3FO?=
 =?utf-8?B?N0grbEc5RHV1eUxGUnhtK3hnUFpRd01FYmJBSkFad0RMbHdmSHFwbWVJT25a?=
 =?utf-8?B?OFZ3Rk4vc2NPRTlHajNHR1dySXJHTlZXOWxNTDRNZjNEMExXL1N1djBtclhJ?=
 =?utf-8?B?enVCcjREdXU4ajkxMjBndXFUTklSUXRyZVllR09ra3pWSWF4N1o5aVluTW1s?=
 =?utf-8?B?VHpQQXNCNWYvT3dPUlQ1UzJFRlRtNy9FL2s1aFM2dG1qMXR5TjVhZmZ6a0lL?=
 =?utf-8?B?ZjVuUXRzRE1nV2lVN2g5RkxFYlVyekU3WWxaVTFvbmhZR0N5UVJ4M2xSNHpY?=
 =?utf-8?B?K3FWam5tZFNEdlZmaG90cEFYQ0VXc2g3K043MVRhbzNRK04xaWJEOEl0akRv?=
 =?utf-8?B?NGZ5dGN1TWpCVHdCSXY1RW5EbmtOY2dnTVdSZTFaQ3lKNSsyaVV2cTUwMkhN?=
 =?utf-8?B?SHhndWZFL1dVdEVML3pXbzlSTlVmUlBHMDVPZE5mS0U1dExVUW5uaFJLZGtn?=
 =?utf-8?B?VFF0eFVQVUVNbGcxQzh3U3M1RHByUkMra0tOOGVaVEF3K25ZWHN2WkpSTjBR?=
 =?utf-8?B?cU9NWnNXZHJ1MDJpbUZLUVVPTk03UGowQ05CMjZIWjQ5SS9tMFI3SFRsZEh0?=
 =?utf-8?B?clhZOGUxK3UvRit4Vm0xTnRhQmdRd3E2OXBPOXlVTGF2YlNpL3hDbnhSVHdj?=
 =?utf-8?B?aXpqQkJlQ2xXY0NwR3dFaGZNcitXVkh5T21IWEw0TjVjVmNWQWtCcm0wbDd6?=
 =?utf-8?B?RGV2TnU0SzQrTzNORGxiT201aElZZGdGQ3QvUmpwNkxZNVNKVExkbi8wc1dX?=
 =?utf-8?B?dWRBeEJOaHJxRkRab3FINlkwQVJSTkl5ZEI3YWFvaDloTmNMVTdnTzBqRUwz?=
 =?utf-8?B?RHB6WVU3OFJVRDJJRFk0MVQ0KzNGQUkxSlJsQWc1U1FOcnZhS0J4TUx4RG43?=
 =?utf-8?B?U3pIMTZJOTE5L0s3V3pydVpoQkJMQ2JpeTRwdmdROEUvOUVZYkwyRjl3eFBV?=
 =?utf-8?B?Nkg5RXpWMUVGTmxoMHNidzRXVmRKUlhkMXlCNjJjRk5EcUs0UjNpV0ZqMWli?=
 =?utf-8?B?QlFXOURybFVCNDJKNSs2SnlWUXFxRTY0THJlTkhPREV1Z3A0c0R4YlF2ek4y?=
 =?utf-8?B?cXRIbG1KOFozbDB1cTFrZmNuSm5mWjVOVTFLVCsrUUVhOGViR2RLYUlFQlFY?=
 =?utf-8?B?UUdJTEVJSC9hVHVIRUl4R0R1MzdyR0dPd09oYnorNzhLelM3ZEF2Zmp4c3R0?=
 =?utf-8?B?cnN4OWk4SGZ5UDVYUW56RUhtVmRUdDJiOHdRMzdmMmhzYnNJREJhTDJxN2JU?=
 =?utf-8?B?L1A1b1hCMXlBTGE2cjlneHJDa3h4L25LbVFpVGFtNTNyeGpoWEpQVzhZSVg1?=
 =?utf-8?B?Rk12QW1oSlphZUJUdHN3QUJMc1QvTTBKU2g4MUJyNWg4MEdZeDNwRHl1Skk5?=
 =?utf-8?B?UjNDeFR4NlR4SVpyVG1JWjArTWpnYlZaRm9vN05pc1pmRzZMb1ZTUmMwMU1p?=
 =?utf-8?B?dUJwTjZFOWlkVlEwcUkvQ2lnTTE3cklCcTQ0NlZORjFjTUpEUm54N3RKSVhF?=
 =?utf-8?B?R1ZNNFJGRzhKWGdBRFhITk00RXd4Yit3L1F5NzNDbnppUmUwbkI1d1lLZEJI?=
 =?utf-8?B?NlIvcWNjSWZhak1BeU5kYkV5a0VVZXg3dkgvUkxJOGp5akQvNW9EaWVMeDhT?=
 =?utf-8?B?ZndqMHNCN1lDTGhtZXlwTmJyNFNDWTJQdldKNCttc3dPMkw4RmxMbkZtZkU5?=
 =?utf-8?B?ZWtiZlBGeWpJNzZkOEFxNjltR2lvMk9qTFpEYjVXd3krOU1mVmRvZ3dXeExY?=
 =?utf-8?B?UUtuS0dkRUxiVVhGYU1oTnRUTlkyc3Mwb0pLdjRGamZ0UVBLRnlsMVk2bFF0?=
 =?utf-8?B?NHJoamQ2Qk5HaVFKRkhoeExZamdVOXphcFd3clB1cjh6L0kzWEtiQUVVVm82?=
 =?utf-8?B?ZVlRbkpSZm8yT2E4OFdQYWVtZWxyem41L1gxdFIxNTBSb0lPMjU1b3FNV21J?=
 =?utf-8?B?WFoxZnVhV3IzU2VmeGU5ekRROHc0NzFBQlo1dVk1blY4NHhXQlBRQU5HNW0z?=
 =?utf-8?Q?E6is=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1VpNWJ2bGROaHZhQ1JKN3FqRVB4aFI5eDI4Zk5BN1hIdjdTdWJqUnNtT1FU?=
 =?utf-8?B?b2krektHK0prT1RpK3VWY2VZcFoySGw5aGpKTFFZRW1Wb256dzBQZ1JYS0Vk?=
 =?utf-8?B?VGVKTHlZSHg0bDFGOXM0UEMvQmE3cUdEZUxZazRrbThEUFZPazBvTUZaazM4?=
 =?utf-8?B?UW55OGl3R0VkbGVpbWMxY1lSN2trQjhzbkNoL1VtbGc1YmlXeUVzbUJ3Umht?=
 =?utf-8?B?bW01V2NGcVlBQWgrb21UbHNWaGxKaTZDNDFVT2xVaUdhRXAwSkc3U1BqMmNP?=
 =?utf-8?B?dWkyTDJmdE5DNmkyS25hTVhEYk1rNXRXZm1DOEMySWpnYyt1VlFBN2ZneWNo?=
 =?utf-8?B?TlU4SW1SQlBWdFJqVW9ueTZ1NzdQT1UweHpuYVNsWEU2MTgyd3BpSzZKNmJL?=
 =?utf-8?B?NStDTUVZYVNtS1BKOTFSbW1id3l5ei81YWZZODNKUUZIZ0hPb09WRU12RW1v?=
 =?utf-8?B?LzMvUzFoY1Vtd1AxcklQV2VMcWR6VkdRY21XVUhSazhuaGV3dGpjL1lLT2Nt?=
 =?utf-8?B?RlJmMGk0L3ZMVUo0WVh0NTNUTlROTkEvbGFvOVRBUzJ0ODJ6RTlQSTZBQnJ0?=
 =?utf-8?B?cURBWXN5NkxDeFNKS2ROK25EWEFRcFptV2YrTFpRdWVrazB5WHVvRElSblZP?=
 =?utf-8?B?bmxuVElQdU55VkIyZXRLNkdKZit1VlBVbkU5RmJCSmlhQ0NkOXNZRjBROFI4?=
 =?utf-8?B?QXRyZ1VJL2NvL1dMTEZiL05aNU81b3NrTXlDMXlMRzNRV3NZaUdSVUtBamM1?=
 =?utf-8?B?Rmh2TG1FSGtITUFiWm1GdGpXT0F3OVF6VnBTRENUNDVaN1lsY3I4V2NhNGU0?=
 =?utf-8?B?RVd5M2h5MGJwaTEzbk8veVNub0pCYVJuSUN3ZTZCU0lUOVZ3dEZmYm8xanFD?=
 =?utf-8?B?WEV4OTlPdk5MM20yRnA4MGxUYmE0dlNUOC9SeFJEM0RhMTVLSERvT0ZZbHlx?=
 =?utf-8?B?OEp2NXNWUUlHbG5aNWhwYzdZSk9HTVRRSTBqQ2dtdW41a0ZtZTlCMklXb3hV?=
 =?utf-8?B?Ny9BYjhrTE14cCtKSisxN05qNk1tTGRYRllSbmozVFVsNVcwb05tdFdhSlc2?=
 =?utf-8?B?dStGbDJGUEFaTzlZdzlGYldmRDZ5MElINmZ3Z0tVU1R3MlZaYUNUd2VoU2lu?=
 =?utf-8?B?RUtubFZmSmpVL2NDejN5aHRQenUzd2xvc0NSamQ2TnlpdkppdHFyMTJhUVAx?=
 =?utf-8?B?ZEpjVWpxZkcxQVpEVThreEpETGpDRWdyR2VMZ2xPM0M4cXFWMnc4dVNqbmd2?=
 =?utf-8?B?MURMOWlxZGNxRW1HeGVZeENwMWk5VGNGeHRzSUFuQUhhRC85R2E3K1QwdWNH?=
 =?utf-8?B?NFZvb0RZN1JDdmhTSkZwV0VKZmlxczlSMkhEblpLaE01Yy9JVlYrbWhvcjFY?=
 =?utf-8?B?VUgzWjNod2dNMWxva3IzUnF3RGNIVTBHaUdqbVVYUVVqUXJwdUxwZHgyemRY?=
 =?utf-8?B?b3d6OWxXbnFEOGxYbXZnRFd2WUs2VnNEN094Tk9pM3RIV1Y1RWh4eHpRRklG?=
 =?utf-8?B?ZnVnYWJacU5GRkpDRUc3aGJRaDVoWFpQSlR4Q2ZyMEZrdm5VeGx4cUhNNEFx?=
 =?utf-8?B?RnZvcForR3Z3TXhUM2NEWGhkY1o5d3FMKzVqdmxnSUVaRDlCWDR1S2FVYS9L?=
 =?utf-8?B?bWhIeVcrOU0zUFQyRXVvbHlYSTZZSHIrSWVwQ0s5U3N1cHV2WHF2U282YndL?=
 =?utf-8?B?QXc5K1RGUUd1WmJ1cWhEaFVzRUhzbldmQ0NENjdzUTEwaW05OXVaNnVJb1Ir?=
 =?utf-8?B?ZkE2enoyRkE4MVgyemVXNHp0Z080YzNUMWdmS3l0dm0xUTlYbDJQVmM5bWVL?=
 =?utf-8?B?d3JMUkZZMk5ZQXZvVDQ2TnpOUS9SQXEwZFBlM2RMVzIwcTFxNDlnYlZURVdm?=
 =?utf-8?B?RTUxZHZOWDN5eTRNSnR2Rkp5V1MrZDc0WVdsVHlDUHVKV25LZWd1bWNFeVNH?=
 =?utf-8?B?cm1pYjEyc1hiNVdCSGtNeG9uVmFlT0M5QlFZN2RSdlpEcVBncWVCN2ZKK2Zq?=
 =?utf-8?B?dkQxTGh1UlJPRVdFSlVqY29sNDFXUlJBUlFHOE10YkJTdk9VL0Q5YytXVzEx?=
 =?utf-8?B?ekEwanNTOU1sNmNsNmhUcHJXUG1SVC80NjhmM2xvNjN2eXZMcVN1UXJSSHZD?=
 =?utf-8?B?aEEwOC9XK1RBeW5lcXQybnlnaWhhazl6NDVlM092OUlnNThNeE15QWFqWVdj?=
 =?utf-8?B?QjBRelRpdkdyNkVlYTNQeTdITzdlbTMxWjhiTm05RU1MNXZPV2hId1U3YTBw?=
 =?utf-8?B?cWJzMkZaV3VKNTR4MDdkSW9RTW5Xb2hmSDl5cmFxK0VCcmVCbGx3eDN3RzhS?=
 =?utf-8?B?bVd5KzFRWTNSOXJSV1NFYWVSbG85NlovZ3NlNVBXTHVrVEJYS0RQZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 10398916-5ae5-4b3a-8647-08de6263a85f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 14:02:10.0732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOZZO8IkpV4YGiqzGa0wjxU/gMln9hKhrVid7vz+Mdwq02kE6P0rDpWnB3n5NXygFv6VYjkXltA/CjbinBhgc33Lple1fa9Szgaeauaa/2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11598
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_060220_175008_5E60034B 
X-CRM114-Status: GOOD (  17.72  )
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

Hi Andrew,

On 2/2/26 2:52 PM, Andrew Lunn wrote:
> On Mon, Feb 02, 2026 at 11:27:25AM +0100, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> When not passing the PHY ID with an ethernet-phy-idX.Y compatible
>> property, the MDIO bus will attempt to auto-detect the PHY by reading
>> its registers and then probing the appropriate driver. For this to work,
>> the PHY needs to be in a working state.
>>
>> Unfortunately, the net subsystem doesn't control the PHY reset GPIO when
>> attempting to auto-detect the PHY. This means the PHY needs to be in a
>> working state when entering the Linux kernel. This historically has been
>> the case for this device, but only because the bootloader was taking
>> care of initializing the Ethernet controller even when not using it.
>> We're attempting to support the removal of the network stack in the
>> bootloader, which means the Linux kernel will be entered with the PHY
>> still in reset and now Ethernet doesn't work anymore.
>>
>> The devices in the field only ever had a TI DP83825, so let's simply
>> bypass the auto-detection mechanism entirely by passing the appropriate
>> PHY IDs via the compatible.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: bb510ddc9d3e ("arm64: dts: rockchip: add px30-cobra base dtsi and board variants")
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> What is the justification for stable?
> 

Bootloader without network stack = no network in Linux.

Cheers,
Quentin

