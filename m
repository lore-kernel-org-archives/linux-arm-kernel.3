Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBFBCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 02:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hZlguZQpHWo+/cJzWVwwh3gyS9Rl1ZHQI7rstGZLJE=; b=wYf8spk6ldg55+hl1u+c15/AS/
	jniA0X9wWjlN/dxBxv+n4+aU+4BiyhkY0fXZmKdOrfCFDBuYsiebrIYUYuQmtDWI4J8i/cYZwKCEs
	2djRzAz2coVeyJCLTxLhZbFlfh2BuW72CXo/QXAMZicFgZvyzyerhLnQ6ITUDbkrnIpeZz//S/OIn
	EQTa6/O4LJhakt/3z1C3HKxGkqMX9/8+ZIwitt2lM9LTrF82GL/ZyjG1S/Yq/ocZ9DdSVqh5xp1Ph
	1FPMGeht2oOeJ4OzHPY3FYRxOXeszsy4d/vmMnaF7P8IyfpE8NVxtXg0B/bUFWSM8YqOTSPu++OGd
	nSDk1ixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWdJ-00000000I3E-0pdO;
	Thu, 11 Sep 2025 02:01:57 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWdF-00000000I0E-1rIu;
	Thu, 11 Sep 2025 02:01:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXf8W7oj2evL9s/3HmGKINOd3P4RkpQOADBYxL9julmzjtkR/eTjIKm09QsdNR0Tjhs1AWPA4cGKTQXQZ8hzN+6r3IZdxo1XB1wt/BJVHIlDTjYUcZc3pcJxxwXI+F+HnePn3SEfCk0uvuHtfDTyq75DhQVHECBsB+2kwOpiGoKzPrvaPtj1NJH+r5NMk1Hf2O3xaa54vGP7/AOJWE8SaZ9mVlQ5KrmcXgwos6tagklwkO4gvF+Pg9tIzeLog+5cEZFKz3OWG/evLxZsJ2uDf6Eg3Rljv5y8CDprdzc4AUGWe8xKXw40aTkX9VcJ9r7k6nJB4HZWEAuqcbmyYukfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hZlguZQpHWo+/cJzWVwwh3gyS9Rl1ZHQI7rstGZLJE=;
 b=UK3tIDAYudGPCu0ebm7m/NnxI4LBLe457popQIOzD3VE0YuPWVGPKiSlPtaSlpZIqymc/8mQ8qPJ0rPAXGhWFav6myvWPgHc+gvR3V3443NvL9Vkddw7L4jkXIMqtgv4fEozcBBCF7X6Ku3KMFINKekLRSh2K70Yxe5sYPyqtXx6qHLlFKLbfM19H910jniTD+wKPyPUdGyAg0MgvkQ2VN9x/YYkBYiqgV6eCWHZUA2SyAUXq3aVPl7XV3n6gHOF6Loym2nJ2+gFrBq1l7yfRCIxJBP5zvk8dafGoa3LT8bMsYxLkEPFVT9p/o2iv9g6Al8aceMUkuUi2NaQ38gwyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hZlguZQpHWo+/cJzWVwwh3gyS9Rl1ZHQI7rstGZLJE=;
 b=cRWUwERmAAbWlJ4AXHKsqwdwz1P760x0TRrTE1HTb22USrOvdrFqfvc/dl3kf9547hafCE3nNLd+9LnwUW0hgFTn9pvKz+AVEYOeBjSeQvN6Hp164YdH7tiKhamu88ZzBs/LnBcWpOs+MtnUrhQunNtHIb/Xq4nmNY1vUF8ClGFyKGhGEa/zKXCgZiFA9buaDIFb2q18k61wcg6UXM8lPIRm2VfbSxNZ+Bf6sO/0nBNXV4QszLIvwwrFY92SVqxRdnHsbvSCTjAkJFMJcpsAE0Isn7MzmuE7QEcxW2PTm9yTxiRn18JVIK5i8dhmCbtTwHOJNVQeNje4EoMTOwrPmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB7033.apcprd03.prod.outlook.com (2603:1096:101:e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 02:01:34 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9094.018; Thu, 11 Sep 2025
 02:01:33 +0000
Message-ID: <28399ab7-2560-482a-be7b-c83d631ac351@amlogic.com>
Date: Thu, 11 Sep 2025 10:01:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clk: amlogic: add video-related clocks for S4 SoC
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
 <20250909-add_video_clk-v4-2-5e0c01d47aa8@amlogic.com>
 <1jv7lqiqzg.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jv7lqiqzg.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0211.apcprd04.prod.outlook.com
 (2603:1096:4:187::19) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 0734a7f3-677a-498e-39ac-08ddf0d72205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1JEMlJvTUF0MWJHaEFUdDhrcW5hejBaN2YyakNFbWpjVkdpTkdDWlNTbmVs?=
 =?utf-8?B?c0VqZVhncmU1Y0RJdzFwOFE3YVNYc0Nsa1RYRUJRNUNaMWpMelNJMEZudUFY?=
 =?utf-8?B?a29UTE9FR0VtVWVjR1BLT1JvS0x0MEQ5RnJLbmluK05zM2dPR2hkMFBsZVhx?=
 =?utf-8?B?Tk1vd2k2SXhwVG12N2ZSNkV5QUFKV3Y3Vm9ZaE1YTjlpWDBtQXpNdmtZL3RZ?=
 =?utf-8?B?aDlLdGt6T0xxN1lrR0UyQURPWENYNnp3TFRQempkL3B5SUVJQ2Y4WU1JczAw?=
 =?utf-8?B?U0dFaTk0LzYvQVk1azJDMXdHQ0pTYjRDb3RzYXpSMUZQSnlFcnZKRlVaTEx5?=
 =?utf-8?B?alYyZGhFVWY1SSttT2U1TEJyM1JEU29xS0dPeUFOYm5sQWY2TnhteWtMUFdI?=
 =?utf-8?B?K0hiUkZjMldyYTRoaWxRZU9CRkt4eEN0amZUa05PbTNDc2hJUnAyRDAvektN?=
 =?utf-8?B?OEk3RW44dmU4RXhtVC9uNkZSUEluZk43a0hsWE5rMjA1eURYU1paRVRhdkZk?=
 =?utf-8?B?S3JwWTQraGlSdFBITlFZRXVFTXZXbDlpbStIckU1anY1ZmlvYlZJWW4ycklH?=
 =?utf-8?B?eHF5TjZrR3RlYjVvK0paU2JhVEU4bVVicVF5N2IzZ3ZTc3hOajF5WC83N1Fs?=
 =?utf-8?B?My9jSVRieW02d0lqbVFmMHFtbFMxUmhCVzRBaUFmTW5LS3VSU3h3dGpQZ3ZI?=
 =?utf-8?B?ZnJNWStwRk4rZlY0WG9UMWMxOVEvcDd0V1NtendDSldCdVVkak96SytBUjd1?=
 =?utf-8?B?eHVWM09ScnUrdTNpWTF0UnlBcTFqckF3a2ZuTWZiZ3JYc0p4WHNWN2xlYWgv?=
 =?utf-8?B?VEtLeUtNVVRBWFI2NjlEZEUyOERLVXdkTEFoM2Z5aHkzNDZpRkpjYW1LR2Va?=
 =?utf-8?B?NWFXQXVKZ3FwRFEzNU0xYVBDTjcrUm5PV3gxZVQ3K3JhM2I1NE1TRTNXOEUr?=
 =?utf-8?B?OE13QzJHQlQ4T3IrRjRRZit1ZEhQR2FZQzZPZkdqcUd6NHg1TGx6cGJhSWZX?=
 =?utf-8?B?ek04TmxCM254VFlnVHl3Z3Jqb3pDOVlSTzM4OCtQc1UzUnBsRzc5UDkxZEFD?=
 =?utf-8?B?NDBrS0JzVng2dzUxQVNtTjlRSWV1dTRJeFNmZ01rMDg1dUIwc0VMbXlTRGp1?=
 =?utf-8?B?YW52ekY4UGRhdXc4Z241ckJ4eStZY09PSHZlaTZ5WS9abmxsbXhpRmVZRkgy?=
 =?utf-8?B?UTdBdGNjbEVuNEVKWDF2cUJlRk1xSDVhbzd5V2RCdXZjcklMVjdxMmZBRGwz?=
 =?utf-8?B?d0lHMUlYb1ZRYUhzZjBUTmhiZi83S05MdmFnNmZhWnNBM09LZG1xMmQvSjJu?=
 =?utf-8?B?MU5Cekg2cEExRVZYZldIZENuZThhdS9PVVM0aExNbnlIZEphZ1NKeTM1RXli?=
 =?utf-8?B?YWVCZkNNL3JlKzNOa1FBOXB4NCt4NXYxNHA2bTNDOVNnZFJ5VEFIdnhqZVBn?=
 =?utf-8?B?V1lHL2M1U2VXbC9LQ0ZDWEUzbitHQmpoTkptTlBIUFFaUW5zR2l3SUt6OGNq?=
 =?utf-8?B?emladWdDNzRoYWhsU2oweFJNVmhKTnUyb1NPWXV0YVRWaDg3djQ5ZHZHaDMz?=
 =?utf-8?B?TUQvTzRkc1p1WEJwb25QbXQ2NHNxVWNESTBFb2h6eW1LYVg0YkFyeFpWWncx?=
 =?utf-8?B?S21zeDEvbFVUOGhtZDV3VkVWYUw2SGx3bTEyYmR0a09ub1JLdU9vWW0zc0dJ?=
 =?utf-8?B?aGM4YUI2UHFleGNoUGRyUzdrYWVYK0xmRjVaZ1puTTN2TDNDZy93VjhCVXFj?=
 =?utf-8?B?TzNIOE12V0Q1bUNFUDNnYmp3MldtRmZUTkpxQVdUbVM4b1ZwM21yOFNRbHlo?=
 =?utf-8?B?Z3NmOHVrbGIxWFIwaitRV3NVaUVoVzdaK1Q5VUZhK01lZ2hDMHFuZStGbTJM?=
 =?utf-8?B?SEVWQUJxMjQ2QXR6dDgrTVJyTEdtZ1J3T0ZnYVVlQXk1eklDQis1aURzRStv?=
 =?utf-8?Q?9GjVtR24uY0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2xXcDREd0VCTXlvV1hQSmlRdDVNV1prNFpKeGtRcjhZb1hEV0RPSy9yd3R5?=
 =?utf-8?B?Q0JEMy9rTXlod0laVm9BRGw4ZllDNnpVdmFmanJOTFNIazJzV2theC9hVlJj?=
 =?utf-8?B?OHFzb21wNWZVaGV0YUEwZktmSjVZVWJIY3BMeklDdHk5d3JNNDhkbWI2RjJt?=
 =?utf-8?B?V1J3RU11WFBmSzQvZEROYTZRa1hhdW0rWHZPYnZtRyszenpvVzBhVFpHaEx4?=
 =?utf-8?B?UjRFN2Y0NGxOQWtMQXdqanN0SFY1Y3l3UHVnTDBiSXdrMnYyRVFUWHVLR1Bt?=
 =?utf-8?B?WXlJMEhDZ0lVQWlueDlFMStLVWxYcTVHdTNQMEdMSFNzbytoMEljN3ZFMnIx?=
 =?utf-8?B?TUdLVnhpOHFoNGpSOUFGd2htT0grWi8wLzBCbzZrMkdBNEwwWm8rNldkTk9J?=
 =?utf-8?B?NGJWODhxakJ3S0lhaWFMKzRncFNrU0NMejI2LythU2RDYzZWU1U1OTJaYUVl?=
 =?utf-8?B?QktpTytHNEdNTVZKRDNtOS85UjhLSUpDeTdXbEM2ODNBaDB0Q1o4a2daeFZD?=
 =?utf-8?B?Z0JvVXE3ZE8yZE52SWRMTXhWNWE2VTMvSEliSXlsazllNXJyRGxTRDl0Nkd2?=
 =?utf-8?B?MVk5dnBQUDJwRG9XOFlJRkxlV1dYOXdycytXcTNiS3B1SXVhYUNKaG92WFk5?=
 =?utf-8?B?TTdNdkxiaE1uNlNXNUQ4K2hPZGN2SG45ajBYODdJVkhIQ3JQZkozLzVZSkZC?=
 =?utf-8?B?UURaV0J2N1Jna1NLNjhqNENubUUxNlZydUpPcFp6b3RKbnJ0dXdLUWlVNkkv?=
 =?utf-8?B?WHNtTk5VWHpPakN5YXZEN2RpZXpWOUpvdS8yMjBySGo4anB4V0tVZmdPWU0w?=
 =?utf-8?B?TzNNVTRObWlaNmNEWVZmL0M5RUJ2cWZUZHlERzc1TUE4UEpRMUIvdWFxU1lj?=
 =?utf-8?B?allMZmh2NUlDaWEwVjFsT2NYQmM0dzRuMEtKR1BRckR5NEw5ZGdaMFNoNGg2?=
 =?utf-8?B?bVE1NGI5NTVmRVM5d3J1RVZnRzVOamhvNjRnSENqR3gvVmdLMDZoblRZanFs?=
 =?utf-8?B?Q0xDUDFKMmFIcVJnK0pRK0lpaXErcEtMd2xDMXhkdGxNU21QRnZRaVV3aTVO?=
 =?utf-8?B?UUJVRHkwUGI2SHZERy92bnJ2QVFPcENXWDY1dUc5Uk1Xc01TZHJERjFKdkxw?=
 =?utf-8?B?Y2ZINjM4ZXBXL3dZQWI2eXVQTTZhMTZUQkxuMVdXb1dISzBPei93bjJCa0Vr?=
 =?utf-8?B?dTNXcVZwZEdSMTRZa1ZxNmx5cmY3dGNoTHVEaWRoMGIzdC96VWlXQzBVSHZz?=
 =?utf-8?B?OEZLc2RNeWNnYXEwQjVlS2FYRVRleVlmK29JMGYxYTFHNm1WTVV4WnlqbnBE?=
 =?utf-8?B?SWdwZEtDK2FpV2RnL0wwYlZ5YlhzblBaa3Z1NzVmYk5FdnhvRnBOcktxWVBM?=
 =?utf-8?B?N2I0bmljMFU4a2V1aVRlanFOaGMzRnl0bjdoSWpVK0F2MWN6NlRkVjc3REJY?=
 =?utf-8?B?T0RBckxqdTkvcFphMDdGTllPaGxMYzFnODFYTFhQRHBLdm1qR2Q0bnFyZEJv?=
 =?utf-8?B?NHNmV0YzcHB2SXFoR2cwRzZGR3c3eXZ6RDk3UlJocmJDaW1BNUxvTW5BQ2NW?=
 =?utf-8?B?cTNEa0x5R3drNGI0akxtWTBTNVdTd0g1V1pPeGFYTGxWYmhhY2NIaUV5WjND?=
 =?utf-8?B?LytHZHF5aW91dWY4aS9ZZWpzekVTd2ZDTDUyM2tnUUNsV2hsRzRuZ1N0cGFU?=
 =?utf-8?B?MjhYZWtZMms3bUNieWZpT0dlRDM0SEx1SU5Gdk1uQU1FUXZrdmxPMGdwak9H?=
 =?utf-8?B?WndZdnV5WHNHM1hmZXlGZEMzUFVmNUNZMXhXQnhucms2MkJxYTV1MzQ5cmI2?=
 =?utf-8?B?bE1QeWI3REU0TUE4SDJiYjY3QldTbzl3MnR4bVQvR3J4Nk1PNVhaVFNYSnA2?=
 =?utf-8?B?SmphY2VKTzZoRk1yTEhUS3NBSURsZzdKcVFRWWNYY1VlSjRrQXpHZFEwMUhQ?=
 =?utf-8?B?VWtTdFArZGIzeTBoT05ZeTRDQS8wdmxnSnZRUlBHOERHeHJOSkx4cCsrMXZT?=
 =?utf-8?B?SVlPU0JSTnBmRmNwL1c2SklqcUJkN1ZLUkM4UXU1OE1mT2N1Uit5YjUwZHVh?=
 =?utf-8?B?QkVUMkdyNlNDdHhEcmdmZ2w5eFAvdkIvamQzajYxU0QyUHljdXdWOG1naUk2?=
 =?utf-8?Q?LoEYXdNERBeh9kQA7le4KEW7z?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0734a7f3-677a-498e-39ac-08ddf0d72205
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 02:01:33.7419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaL/YfMkmO3kxZS6bFYT2SNK6ulBfSXWXa+boeLkDCqfVTmNJyt5H2cqlNDKNGJtRnjpE3+Toi31Z0KnZ8y7cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_190153_594068_0CDCB3FE 
X-CRM114-Status: GOOD (  17.68  )
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

Hi Jerome:


On 9/10/2025 5:41 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Tue 09 Sep 2025 at 15:29, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
>
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> Add video encoder, demodulator and CVBS clocks.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> ---
>>   drivers/clk/meson/s4-peripherals.c | 203 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 203 insertions(+)
>>
>> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
>> index 6d69b132d1e1..b855e8f1fc04 100644
>> --- a/drivers/clk/meson/s4-peripherals.c
>> +++ b/drivers/clk/meson/s4-peripherals.c
>> @@ -44,6 +44,7 @@
>>   #define CLKCTRL_VDIN_MEAS_CLK_CTRL                 0x0f8
>>   #define CLKCTRL_VAPBCLK_CTRL                       0x0fc
>>   #define CLKCTRL_HDCP22_CTRL                        0x100
>> +#define CLKCTRL_CDAC_CLK_CTRL                      0x108
>>   #define CLKCTRL_VDEC_CLK_CTRL                      0x140
>>   #define CLKCTRL_VDEC2_CLK_CTRL                     0x144
>>   #define CLKCTRL_VDEC3_CLK_CTRL                     0x148
>> @@ -1126,6 +1127,22 @@ static struct clk_regmap s4_cts_encp_sel = {
>>        },
>>   };
>>
>> +static struct clk_regmap s4_cts_encl_sel = {
>> +     .data = &(struct clk_regmap_mux_data){
>> +             .offset = CLKCTRL_VIID_CLK_DIV,
>> +             .mask = 0xf,
>> +             .shift = 12,
>> +             .table = s4_cts_parents_val_table,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "cts_encl_sel",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_hws = s4_cts_parents,
>> +             .num_parents = ARRAY_SIZE(s4_cts_parents),
>> +             .flags = CLK_SET_RATE_PARENT,
> Do you really expect the rate of the parents to be adjusted when calling
> set_rate() on this clock ?
>
> It all trickle down to vclks which are shared with enci encp and vdac
> clocks, so maybe not such a good idea, don't you think ?


Thanks for pointing this out. You're right, this flag doesn't belong
here.

I'll drop it in the next revision. If there are no further objections
on other aspects, I'll prepare a v5 series that also includes Conor's
Acked-by that I missed...


>> +     },
>> +};
>> +
>>   static struct clk_regmap s4_cts_vdac_sel = {
>>        .data = &(struct clk_regmap_mux_data){
>>                .offset = CLKCTRL_VIID_CLK_DIV,
>> @@ -1205,6 +1222,22 @@ static struct clk_regmap s4_cts_encp = {
>>        },
>>   };
>>
>> +static struct clk_regmap s4_cts_encl = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = CLKCTRL_VID_CLK_CTRL2,
>> +             .bit_idx = 3,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "cts_encl",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &s4_cts_encl_sel.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>>   static struct clk_regmap s4_cts_vdac = {
>>        .data = &(struct clk_regmap_gate_data){
>>                .offset = CLKCTRL_VID_CLK_CTRL2,
>> @@ -2735,6 +2768,165 @@ static struct clk_regmap s4_gen_clk = {
>>        },
>>   };
>>
>> +/* CVBS DAC */
>> +static struct clk_regmap s4_cdac_sel = {
>> +     .data = &(struct clk_regmap_mux_data) {
>> +             .offset = CLKCTRL_CDAC_CLK_CTRL,
>> +             .mask = 0x3,
>> +             .shift = 16,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "cdac_sel",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_data = (const struct clk_parent_data []) {
>> +                     { .fw_name = "xtal", },
>> +                     { .fw_name = "fclk_div5" },
>> +             },
>> +             .num_parents = 2,
>> +     },
>> +};
>> +
>> +static struct clk_regmap s4_cdac_div = {
>> +     .data = &(struct clk_regmap_div_data) {
>> +             .offset = CLKCTRL_CDAC_CLK_CTRL,
>> +             .shift = 0,
>> +             .width = 16,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "cdac_div",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &s4_cdac_sel.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap s4_cdac = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = CLKCTRL_CDAC_CLK_CTRL,
>> +             .bit_idx = 20,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "cdac",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &s4_cdac_div.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap s4_demod_core_sel = {
>> +     .data = &(struct clk_regmap_mux_data) {
>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>> +             .mask = 0x3,
>> +             .shift = 9,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "demod_core_sel",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_data = (const struct clk_parent_data []) {
>> +                     { .fw_name = "xtal" },
>> +                     { .fw_name = "fclk_div7" },
>> +                     { .fw_name = "fclk_div4" }
>> +             },
>> +             .num_parents = 3,
>> +     },
>> +};
>> +
>> +static struct clk_regmap s4_demod_core_div = {
>> +     .data = &(struct clk_regmap_div_data) {
>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>> +             .shift = 0,
>> +             .width = 7,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "demod_core_div",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &s4_demod_core_sel.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap s4_demod_core = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>> +             .bit_idx = 8
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "demod_core",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &s4_demod_core_div.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +/* CVBS ADC */
>> +static struct clk_regmap s4_adc_extclk_in_sel = {
>> +     .data = &(struct clk_regmap_mux_data) {
>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>> +             .mask = 0x7,
>> +             .shift = 25,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "adc_extclk_in_sel",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_data = (const struct clk_parent_data []) {
>> +                     { .fw_name = "xtal" },
>> +                     { .fw_name = "fclk_div4" },
>> +                     { .fw_name = "fclk_div3" },
>> +                     { .fw_name = "fclk_div5" },
>> +                     { .fw_name = "fclk_div7" },
>> +                     { .fw_name = "mpll2" },
>> +                     { .fw_name = "gp0_pll" },
>> +                     { .fw_name = "hifi_pll" }
>> +             },
>> +             .num_parents = 8,
>> +     },
>> +};
>> +
>> +static struct clk_regmap s4_adc_extclk_in_div = {
>> +     .data = &(struct clk_regmap_div_data) {
>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>> +             .shift = 16,
>> +             .width = 7,
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "adc_extclk_in_div",
>> +             .ops = &clk_regmap_divider_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &s4_adc_extclk_in_sel.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +static struct clk_regmap s4_adc_extclk_in = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = CLKCTRL_DEMOD_CLK_CTRL,
>> +             .bit_idx = 24
>> +     },
>> +     .hw.init = &(struct clk_init_data){
>> +             .name = "adc_extclk_in",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &s4_adc_extclk_in_div.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>>   static const struct clk_parent_data s4_pclk_parents = { .hw = &s4_sys_clk.hw };
>>
>>   #define S4_PCLK(_name, _reg, _bit, _flags) \
>> @@ -3028,6 +3220,17 @@ static struct clk_hw *s4_peripherals_hw_clks[] = {
>>        [CLKID_HDCP22_SKPCLK_SEL]       = &s4_hdcp22_skpclk_sel.hw,
>>        [CLKID_HDCP22_SKPCLK_DIV]       = &s4_hdcp22_skpclk_div.hw,
>>        [CLKID_HDCP22_SKPCLK]           = &s4_hdcp22_skpclk.hw,
>> +     [CLKID_CTS_ENCL_SEL]            = &s4_cts_encl_sel.hw,
>> +     [CLKID_CTS_ENCL]                = &s4_cts_encl.hw,
>> +     [CLKID_CDAC_SEL]                = &s4_cdac_sel.hw,
>> +     [CLKID_CDAC_DIV]                = &s4_cdac_div.hw,
>> +     [CLKID_CDAC]                    = &s4_cdac.hw,
>> +     [CLKID_DEMOD_CORE_SEL]          = &s4_demod_core_sel.hw,
>> +     [CLKID_DEMOD_CORE_DIV]          = &s4_demod_core_div.hw,
>> +     [CLKID_DEMOD_CORE]              = &s4_demod_core.hw,
>> +     [CLKID_ADC_EXTCLK_IN_SEL]       = &s4_adc_extclk_in_sel.hw,
>> +     [CLKID_ADC_EXTCLK_IN_DIV]       = &s4_adc_extclk_in_div.hw,
>> +     [CLKID_ADC_EXTCLK_IN]           = &s4_adc_extclk_in.hw,
>>   };
>>
>>   static const struct meson_clkc_data s4_peripherals_clkc_data = {
> --
> Jerome

