Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C04C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 14:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NInE0lk8Ss0vCT1YxuzFv/lIS0HmxAfeiAjj8cx2sPA=; b=NPM/XbCI2ZyNyahvZ9MGNVK839
	OYo7AukgpUNXy2mqu74bMxnPuGim/DH+ymhkONwvY25srNax4/Z93NOncQVy/d/434iEkf57EPNs4
	VKxaHYMKJZKCG5BD34SxsftHLki2s2vKotndI0H56+JIJW+vhR8LS0S9Ernsm1h1VAlbSPgW3B7gO
	iquHFmfOhBsBpVvXwHf5/3W4y5xM9c5+MOt0RMgg9fB/tOiAHsp7kVYnrMpRXEzXgM+EL4nXT6sj8
	X4vhWjLqxVk1SwD5O7RqYDtKm3q2MBcljN9l+hRNvnOvWI7GyrJsqDnOillCdLzCZxBDar9ViGUES
	2qwqDh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8mZ-0000000DBIk-1PIO;
	Wed, 30 Apr 2025 14:51:31 +0000
Received: from mail-vi1eur03on2062b.outbound.protection.outlook.com ([2a01:111:f403:260c::62b] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8jv-0000000DAkO-0jHF;
	Wed, 30 Apr 2025 14:48:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5I7TlBnIB1YIFKrncNmNPz1oyD/kRuTEpVbLLAzw41FiG69aKyfblQsuMXdw/QdfQD9g3n0Mt7sCCVNpmqHPmIZNu5Z9FZ2QcHvhomABywp0tIW6Wsb5vFtLkr7Ol9wAjJdGZPiC1dvRRYH338Js5itw21g3F84DSJSx+RN14svEUKjWo7jcweqLrQ7WO5T7+XIPk2Tv+0EJALkAZ1mKzzETUqNTr9nc0usu6O8FTDUgJ5W6Iq5k4Y0cLBNBiUAsdOuCy7RiApom7OkNXwU8m8WnX724z19W0pQFM4u6w9gRttUyOtyfFcrOpV7eE8+zmSBH0h99VawH8xA/KsNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NInE0lk8Ss0vCT1YxuzFv/lIS0HmxAfeiAjj8cx2sPA=;
 b=uHsdBkBe0QhPiu9CrlCJ3pYPkkdjgq2joJ3iJwlX1gwYjDvuG/Orb4zC+fMJGZPGXefakI55RpuN9pwlsgabx2VioKzuGiWCZGb0Vn/0noP7tQZDjP3TgWFizjMPR4jQMD1K54/FkM/UmKzUf8NkeVrDRpi5VfowmkcSdsJeKR466RZk8tJd1b9TnW6qILPFWc6KZ5iYGHIDUIXEqOsEvbKHug82wVcTAYqmf7Y02bykijW0NOvFBGspXHb8SO5fQtR6DpijXf0GGMnn8PT+bD+WgnfvzggWTqOxU/ZJUQFAJb+aCB5l6E/+Gk7Zy4MtpTbsy1tVrkTehwwz1wwwig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NInE0lk8Ss0vCT1YxuzFv/lIS0HmxAfeiAjj8cx2sPA=;
 b=jouOiJ54WvCzVetmy9eUMyX2E43upmTZGAXmdwVKTjsWO9yYhUJSYIrzj80FvDiIUZlo6wmJw7es6NvroQW1bynqWDI2Dh4grw6BCmXWxki6+wwLNkDbq+vpLeBN7Gt56lr5icqQJm6Ktw0qYr5KuMOS8XKyDrHRFiREkPw+U1g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB9954.eurprd04.prod.outlook.com (2603:10a6:800:1d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 14:48:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 14:48:36 +0000
Message-ID: <9c51863c-95a6-4c40-9268-0b2be9b8835b@cherry.de>
Date: Wed, 30 Apr 2025 16:48:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add rk3399 industry
 evaluation board
To: "Rob Herring (Arm)" <robh@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: FUKAUMI Naoki <naoki@radxa.com>, linux-rockchip@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 devicetree@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
 Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Alexey Charkov
 <alchark@gmail.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Jimmy Hon <honyuenkwun@gmail.com>
References: <20250430074848.539-1-kernel@airkyi.com>
 <20250430074848.539-2-kernel@airkyi.com>
 <174602375195.3396795.11425847299435773154.robh@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <174602375195.3396795.11425847299435773154.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB9954:EE_
X-MS-Office365-Filtering-Correlation-Id: 936c0627-e45b-4b28-eb25-08dd87f6165e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0FQN21oZjl3d1dvOFBETUJMZXBIS2U5UUlMcU5HRmNvRktZWmR4TWVBc0JV?=
 =?utf-8?B?Sys0aHlUakRhMjg0SFB4amJCZTJUR2FqOWMrSzd4K05reFdEcHE0dTdOak84?=
 =?utf-8?B?NjExQWhQUi8xZ2daTjNkR0JYcTNrUlpreFhXQlJ6RkFSanZaUEZOcHdyT0lk?=
 =?utf-8?B?VWZJM0JoRVVXUyt1TGhqZ1d5T3NtaXR0ZXFhOFdCZnlBWVdZVXkrb01xOG9y?=
 =?utf-8?B?elVOSURrWjYyUGZhTUtHRWZpRU1kelZOZVh3VTg5NzRCQVRYR3ZEbzMrTHN1?=
 =?utf-8?B?ZnV4a1F6b0ViTEg4UTVUTzBBNjJ5SkxrYU8zYVFEY0RFRXNEWmNuQUk5di9H?=
 =?utf-8?B?SDQrN1FrYVBUenA4YTJJQ3lNWUV0dDlSdG5RZURiWDNPNFN5SFErOEdqRXZq?=
 =?utf-8?B?OUNIKzFyTzVVRGVBUW5qZUgrbm95cU1hNlNuNit4SlRXVVlYM2ZQeHJRbm50?=
 =?utf-8?B?MWEzUnc5blJTcTJVZUE0Mmt3ajhreFFvZFZIYUoyMVlvalFpM3ltcEtxZU1T?=
 =?utf-8?B?NEhQa1liT1p3TEJTZUdwZllDNE9sQU9YRVhrV0VLQ3BOamNBZXdHalRidlQ5?=
 =?utf-8?B?T1pZNm8vYzRXdFI3R3pwTXgzMEdpdUFOMUtKVGJoRXpVUlYzQUdacklOOW9r?=
 =?utf-8?B?NkhjbzNwNGpDemJrcE5aeDBsb1VieC92dlVrTUZ2US92WmpDQ29RQ2VVV1dx?=
 =?utf-8?B?TXBQWXY0eG4vQXNFZGNIc292SHFtQkc5Q3htR1lXRGNKSEhZMjhPWTVlRkp1?=
 =?utf-8?B?c2c2SjduN3c3eHd4OWdyL3QxVWlMam9lekR0TGpmb3VvNWQzZytGcnZ1WjZk?=
 =?utf-8?B?VndMYkpZa1oxc29vUG45bGN0bFN6cE9PS05JbXNYWFBWZTlrTUhaZXcrbTFS?=
 =?utf-8?B?TWNBQ3VZU1p1V3VkcHI1aGVlUGFjMmFHc1R6bUhyZ0FJdDFFQW93NlpYQWh5?=
 =?utf-8?B?dEx5cnNlYjkwZlNySmkvN0VSa0xDSHJHd0NreWVYSmRuMmlHdnZ3aHFPRVdN?=
 =?utf-8?B?S25nMUNjb2RCcWdmaW12b1FrSmhuZ3drYVFuMHZTaDdvLzhlVVd5QktDdW1Q?=
 =?utf-8?B?blFCMXNDYVZ6Si9MYUJsSFFaMVl1V21EemRTeGZSTlVmL0s4NlJvNnQrS2sr?=
 =?utf-8?B?SXhMSExXSkdNNENzcytidEZacWxmaTBDaVdLUHFSTzd2YTY3Y2dGTTVmTlp0?=
 =?utf-8?B?cVRvWkFFb0o1SzdZV0dFdFlaclhzN293ZzNvUkZmaVZYSjk2VU1xM3lVOWZK?=
 =?utf-8?B?YzJKR1I1Vjlhcm9MTUdlUkFDa3MzazMzK2xRUHF6bEhQZXZOVUpFSE55RjJW?=
 =?utf-8?B?eHVJclhjcGFVc0tNK3FqK2pQRTdER3JCbWNIOFJva0pzQkRyVlJ4NFVEdTNS?=
 =?utf-8?B?TmVaK0ZabVlLZWhiU3ZEZnQzUkNVUlUwVkZnR0hHQmNSSndWa3JpbUFYeTI4?=
 =?utf-8?B?TnUyY3BYeXpqMVdNck5Pc1lVVEhpZTFrOUl0YzlsMWh4RU9ETEZubGRBNkJC?=
 =?utf-8?B?WmhReWVCbE10bWRhYWZkTzBITkZ3cERZbkhtR0p0a1k0WWJvSGJjTzBNeEl2?=
 =?utf-8?B?K1VieEhNVHNXS2d2RS9tYXpyeVkwRVlhRGhvaFR3Y2hzSjRlWUI2NmpjeEJn?=
 =?utf-8?B?UDZ4QW1Da0pvekQ2TE02c0hEZWNmWWtUa0ZsdzVDcEcxQ1ovSTQyRVlvQll0?=
 =?utf-8?B?YU9UekF6MndiV2ZjUnlsWXBDYkovWFFHM3N1bE13REFhT2NoVG9lUjB0UGhP?=
 =?utf-8?B?Qm1LUmd5VVA5QWhOQmFFVWEyalNXZGZsOWNISWE0SG91YmFRV3BGa1p6ZEZP?=
 =?utf-8?B?WU10c1ZpelhjamxHSC9uakRoNURVM1FyNm1XcFM5Q3FNQUU2bVBlbzNBSG9O?=
 =?utf-8?B?cHh3aXdhRXI5VWlSS1ltNDRpY2FybDF2TE9UdHE1NmFkRGYrWXcxZ3o5Rmwx?=
 =?utf-8?Q?lVDmsrXzW90=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1o0MHFJbExaL05La3ZiUlNsRTRNQmxGTDM4TXJPQjVDMlkzSTg1d3NmOTFp?=
 =?utf-8?B?ZzFXRVZ5MzRsdXNrRDMxY3NHaHBpM1V1ZFpPdW5hWDNZSVpjTy9JdUszMW9U?=
 =?utf-8?B?cjQ4NHFLdVpneFFqb215TnRxaXFpVm9FUjE0c1JxdGxSNytaZjFYdi91Y255?=
 =?utf-8?B?TzVpVjFEQldmQ0E1QnVpcUwyK2cvYWVZeFJXTU9wZzd6VDBWUnlyQkhGTlo3?=
 =?utf-8?B?RWM5TTJST0hNSS83Tzh2VXVWVnZCc3lPSVFlc045WExEVGhidU1IUjExcXVy?=
 =?utf-8?B?TS9STXBMY1dyUGNuTFllY3BEczcvR0sxZnlVNWR6YnRpTmdrQlprS0hDeERh?=
 =?utf-8?B?N1Vrbkt0ZWwvMFVtd1FYRDZWeGk2c1Q4MFQwNGliTWJhYjY2L0pJMkt4NktB?=
 =?utf-8?B?UDQrT2FSRVYrVWVncjF4cDFDTUR6UGJ2ZGMyMVdSdVlsYTBlWUJ5bHo1MVdK?=
 =?utf-8?B?cnM0Uld1SEtFU2F6WjhkczNCL0d6MTRqR3NzZHR5bmNCNmdLb3RPWW04ZFBs?=
 =?utf-8?B?TkVRM1BRL0d0MXVxME8xcXJEZ3VNaGxnd09zY0RtUEdqdjBhUkFidU9rbFU2?=
 =?utf-8?B?cGIvTVk4QndTN29nYnVnNXhNbVlieFNNRHk4Tkg2aU5TclI2N01PY0xraGtY?=
 =?utf-8?B?STcyRFJyTFovSys5SHptNzZMRDVGdVI4TFo0SDdHaE92UmNMbDNkK3pTVEpw?=
 =?utf-8?B?WTh0MVFOdllNQlp3UFEwa0swNExoRXBlNXZ2a1F2d3EvVDlOdlV0SGxIK1Nw?=
 =?utf-8?B?SzJ5Yi90Q0l2Z0x3KzhhaHdzckpqU3FYZmcxeVpQMUNoWndZWmJENzl1bVQz?=
 =?utf-8?B?UDhiMEpQajk1VGZ5clcyRVpKUWpMUU9kckc0YkFmMDMyVG9maUdPVmErUXli?=
 =?utf-8?B?eVdmTWZ5WURsaUd2VlV3NkVGdGFsR2xramFvZ0FHb25uU3Nqdk4zNGI5NmtG?=
 =?utf-8?B?SitGbDBVYnppbExRWjl3VWtDa3YxM2VnYmFlYlpDVUJuN0JPd1BFZEJpQkU1?=
 =?utf-8?B?SWtGd2JsT0hmWkJUMVVFVUI5ZDlLcC9zZUVvZ1FMbXRsYUkvUm0rd29lRlU2?=
 =?utf-8?B?VVJMQlJESmprRTRPZUxxdDgxTU9CWS9TdENLY0w4VjN6Tm40SDhMcEhnQUhB?=
 =?utf-8?B?bXcvb1ZwZVBKMjE3R2xhTXF5MFlxVGtQUXJLMTJwV1d4Y2dmeCtRakl2enJw?=
 =?utf-8?B?SEE0a2dZNXEzK3dOOHNXd2NPYUp6b2MrNnBkemdUcWh4dmJYUVVXWlQ5Tm5O?=
 =?utf-8?B?R0RCK092K3VVQkZ4REc3cVdMbWRLN0dEL3RBWmszZWtVOU5MdnlYZlg2NTRQ?=
 =?utf-8?B?NXNJUkFYK1g2UXhHclN6SFZRR0V0dVJnZitCUjNkengzbnc2MmN5SENqbklF?=
 =?utf-8?B?TGVPVytRc1RRaWYvdGpxOFRLQ3Z3V0E0c1VtRlRPSFBVVzhqN01zY2JzTjV0?=
 =?utf-8?B?QUdJeU9sVUNFM2l3YmVrWk5EekhoTVMxU0FycTAyNm9VUEZhQi9LYmlwVHVZ?=
 =?utf-8?B?QkJKZ0QvdXFQMERseHFyVHp2cFNraDRDL1lDWDhIaDVkNTZKNjhENUtpZEZF?=
 =?utf-8?B?L054OTFMTWhPN2xqNW1mS0pQc1hEQ1VvdXZ4MUFJdFc0TUNsYnRmM3FKMVY3?=
 =?utf-8?B?Y0RQK3F4WmQrOUlaZmMraHkzSXk5NWpUeFIxQlNzWmtPOUNMaklicHJrWXMy?=
 =?utf-8?B?cDY1eWErcWk1OWs1bFAxQnZ2VXVJcWtzMWdCcGJEdW5nWThpQkJ2Syszc1Y4?=
 =?utf-8?B?NjNBZHp2cVpRcjhTMW9ZRlhWUnpBN2pTNHhLNDFIdTBWT0kvMFJoeGFGS0RO?=
 =?utf-8?B?ajV1U285Qmp2L3VuaUE2YjRpVEE2TmROdXF6Yno2YTYwZ0wxVVAxbCtvOVpN?=
 =?utf-8?B?emV6MlhjcXgvQkJLODNESG9vaTZFNjlQOU1oUGRkdVIyc0V4Q1EydTc1aU5J?=
 =?utf-8?B?ZmdKeFVIeHNtSUNMZ1E2TE9BUHlyQ2tTSEZFMi9UcHhDTlNIUmM0dmlUWnc3?=
 =?utf-8?B?MmVwODRvUkxBY3gwa1V2S1h3VjRPVVdod21jOFhCWkR2R3lGR2xQWldjRjZM?=
 =?utf-8?B?TW1PRkRDcGljMTZJdnFoaVBzdFVocEdDeFFMRFhabEcveExaaDN2c1RSUmNh?=
 =?utf-8?B?WTBMSDRUcDZvRGQyODJXUjVCVjJHbmxOMW1NYlZWNUxuRjR6TVlpSHFFcUhJ?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 936c0627-e45b-4b28-eb25-08dd87f6165e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 14:48:36.5171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /z5kHq8hcvEGqTuRFU0x7uVHwOa7F7EGeiY1LMiemN5Dot7D4XES0QUi+XpdlPsZuro3G9vv2D/tpNNoZdp68dm6XnAigYd5l+7seySZoU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_074848_924753_9954BA63 
X-CRM114-Status: GOOD (  15.10  )
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

Hi Rob,

On 4/30/25 4:36 PM, Rob Herring (Arm) wrote:
> 
> On Wed, 30 Apr 2025 15:48:47 +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Add devicetree binding for the rk3399 industry evaluation board.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> (no changes since v1)
>>
>>   Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 
> Missing tags:
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

To be fair, the Acked-by was given on the v1[1] after the v2[2] was 
sent, we cannot expect Chaoyi Chen to travel back in time :)

[1] 
https://lore.kernel.org/linux-rockchip/20250430-light-chital-of-cookies-b8f2ab@kuoka/ 
10:22 UTC
[2] 
https://lore.kernel.org/linux-rockchip/20250430074848.539-2-kernel@airkyi.com/ 
7:48 UTC

Cheers,
Quentin

