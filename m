Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574CBCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 02:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mw6i6+wueYPutLnGeT3dZN865ZxV+5fUHLGPxcyBhYk=; b=RIuTy0eHgPZhajMwEIT/YjgmPc
	jCXHM13jdSCx9/dslrjZVo6naM4LH2jwdsOGj4KF0Lu98d6erX5gW4rBrJkmQu/bbAsXe/WMZeSr7
	SueiqT/D4RLiv0OZcSIEDvFeUhMgeS/pHtCRi9WX9FJbqYSIbi/orUixr/QLxXgxDVopKrRPF6c6m
	2GTOAf+gB/h559ysxDyPBuGdNum8YjIpwNAfXIyqv9W52xsXx2Ix6xOVQ2yLDBtwlq1rg+5AFFfBS
	mnphppMC/oq4m8ZVXoK4eQ/oYsibOHq2XKisslxscoLGloQ+KqBaeMr3TOOggRsVc4IRSFB/aLIZN
	xcLpjWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZJyP-0000000F7p7-2CFv;
	Tue, 16 Jun 2026 02:56:21 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZJyM-0000000F7oL-1ye9;
	Tue, 16 Jun 2026 02:56:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFZLMwNkxZ1gfVOVT3Y8KGcYuyWZ53oiSO8QK+dakINRILMVCP4s9rJOnerBWSfUcZydWadVI/T1a+vJ8/vSjRq8X7AJj7dH+Lui6mJ5Mjvr+5zp32edB2fZ8p+tmonp+9ohMg0Y8V2r1DWAlT7F5TL/L+rA59HprlSRhXyAvwKMFX2CvMmW5YRuNHyF8DET4jVdrwv2RcoMO/X5AD6Haou9e6ztAl3+uoAorE2DvT5jauemVxuOV/R5gD61jE1ceBzymSoWneFGq9BRcBd5s95BsN1P+DvM1Ooq1BRvbVNfBqGrzSK2Gg2yy2KqWpZZUSgJcnaCyUrri5T/fgIo2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mw6i6+wueYPutLnGeT3dZN865ZxV+5fUHLGPxcyBhYk=;
 b=N13ZpVeyGSpl5qerSC65kuYvo40ixAdUa5A/1ITrEQtf89ahJ29daOxYozbHDz7mUPjhU31dVboc9WVZh4xS+fsy7V18FJjz9VFE65Oj3qVkfd6Wayu1JeKFUYkvrOZYmKLZppG6ae8BQSlS8cfN6D3YHfR46ZVH8xZPnSUs6yfHYYUswCLc2pNEN25GDrQb4zZTk5r/dMjVq8VitUGGX3BTp4iQZxHrSsBeKZkJuQkzKwSd1bWxVw2TscNgfkOiLIhodDFQlx15mpsTkmFvjwP1EdK8go7S2n5w2puNFu44geh2t2w1mgIOPJrotPF0JQIpBP1IjTNZQzMzq6PyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mw6i6+wueYPutLnGeT3dZN865ZxV+5fUHLGPxcyBhYk=;
 b=VOzqcc4ZOYlGjkE7aOL8ag69wJ8vQxP8s7WtnE+rw6wUbimkdDLUl6qOYna4koJ9CMG2Xi97Cz9No6Cyq1+I1gJ+q3UA6E3UBzN2blpqjuDkdNhp85sCkdbBNWaMaacH8WvSBYIIKRJ0pF6iRvGJEHZkvS7VMTthIxe2aulwC7Ee5CjCjSOIfdv8vWoDwYOao/tFLTYqWvd8d2LubOyvSSn1H4D+IlytjhQDHOoUZ1B2RIDmN7WqwmOK04PD+E8VIwNJ6+7B7YH9fHut7Y678IgTiJtIFENIZ5ApBUr6n8YkWcKCsVdpXZtPhm0WafhsLGC6i3VpcMZjbHMTtAgXqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SE3PR03MB10535.apcprd03.prod.outlook.com (2603:1096:101:324::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Tue, 16 Jun
 2026 02:56:11 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0139.009; Tue, 16 Jun 2026
 02:56:11 +0000
Message-ID: <e18a0461-557b-40a6-ae0b-74449a292e28@amlogic.com>
Date: Tue, 16 Jun 2026 10:56:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio
 irq property
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
 <20260615-ultra-pagan-84de490070e1@spud>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260615-ultra-pagan-84de490070e1@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0191.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::9) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SE3PR03MB10535:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a968637-d1c1-439f-7635-08decb52d2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: c6M8Fsss6U6+hdvJtLtTd3uarXy2Dam/hfvlHNaSFFJuMPXERHmmxXcMzCtOYagGq3YW6UqhpYDEEFc27j7RLsauaDWkCdlv4gJQ7NRjTNXauayMVEY0B5UdHTmKG1TtXMa3leUcfYBSto5/wQY6hNt7odeJClIwq8QLlfPBrnthlwpC+ZhC/J1yHE0oVq3ePjStPKATswoYufKZ6dCIC2U+hxns4yOSMyYI2JmCOKZS9MOKQFjXiEwsesGF2baw4qmTFRyLxtfCBWwWS4UqQzO7bLqcLI+vQ2lhTgZWZwARd6v6hVYxMjaYg8bkWZO59ki74Dra9qVQ0ZPb7lc+n47XOWp7PV7NWdB5A6dSkz/2pxvHEhbkh1EQ5M+aT9ueNTYGKaqKGueoiGY+veHZUJLeYkSpZTDxV8c6eoJp7YeL36iwdhhnoyESPlvktaJU0AM5UnN7zBReha5z+YlGoy3voIrqt6q1gp90kOZS3TAacnafPhweBh7xidpx/TROMKDAtDeR0cPZ+9LM1ICIoQnZYHBxRd604b1ICs3VVjcXt5xaXfNQTzj7x/0MoC2RednbHmxn83n9miyKqlw49uiGLScsQCKA3KGzFSQ+oXxcA0jqZZTOkaA5pzaY8AVaEWdfK2iXUstVvOy9YtG9O/f2pd9Z6V6Zc+MOzccous7JZXWq7Gj5HxD2+6zRKemo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmREUWdrcDFtc0dJTmJoZVo2aWh4eDVqM1JIQS9yQ2c2dzBESU1sMGpvL0Ew?=
 =?utf-8?B?YU04OGNoQkZXTUFiZEJvRWN6M1ZvbWxob3dydVY3OWZzcEVmSUFiVXl0enBo?=
 =?utf-8?B?alRzQ2ZTVXNGRGN6UTRVZmovaW43MUtLVXAydUtDQnMxK0pHU0JqSFJGb1V4?=
 =?utf-8?B?OTF2NXVNZ2wyTDlHeVBuNE5iNThLbGl4U29GejcyMUY0REFMSStHTmNmNXdG?=
 =?utf-8?B?QVQxUnQrRkEyOEdoUXpVUkNUbGlncnlsQXhvMDhSSEdpNHZFaWduUW1QT2cy?=
 =?utf-8?B?OGhxVFEySzhwVUZ4RVE3TkF4dkE3dHZ2VnB3VVllVHV1aGtrbmMzYUl5Y1I2?=
 =?utf-8?B?Q0hhRjEzS0RGZTlpQnN4cCswalVWMjBndkgxZE1zUDZkalQrRHpwZ2J5MEZv?=
 =?utf-8?B?VjZadkM1RGRiWC93OHNXdW9wQTd2T0pZNVJhTjA4MVl5M0g2M2R1WmE3Qmor?=
 =?utf-8?B?bTBLaC9GRm9IdnlnL09PTVlaUk5yY1dHS1NuM1J6Ym1UbWFHbzNwUXVYWjlD?=
 =?utf-8?B?RDlTdDdoY3BReWd3c1NqN0VZZkNtaUkrTW04NlVIelV4TlpRYUNXQXhnQ05v?=
 =?utf-8?B?RlYwRGZBdnhJWHlqZldId3hhTVZ0VUQrT0FldCtGZG9KcjBBNGZoZHpsUUl4?=
 =?utf-8?B?UFVNazN4eWM0UjB0R1VHb0NDQXdSMGMwQmowVkIzMkFNdmh4Wk9NZzUxbFkz?=
 =?utf-8?B?NWg4Rk9hb2dTL0J1K1FFZ1kwY0dneEluWHpTRVEraGh4NTVwUUpGVEY2WlVi?=
 =?utf-8?B?bzRaYlJPSzFlcFZBMlNITS9aYVkzb095UzBNMkpYRGVKSkZTM0RUNmVSbDc3?=
 =?utf-8?B?d1hlRE53aVhjVjR1NlhLK3RsRHVlWUFOdHdMN2pYc21SekNCcjZnRVFwZDky?=
 =?utf-8?B?M2Q2L0g5RG9PUGZvb2lhcTRzVWVDd0plVTlZbEl5NGNGVm5JUzlKWHdXRVhC?=
 =?utf-8?B?KzJUM1d5aHNPZjNJRDdyY1RJbzVOUXdUQmNnZlZYTnRPU08xam5hakJEeFpU?=
 =?utf-8?B?T1dtTTFoaWkzL1QwdzBPSjFEUmU5SFh0aW5Fa3JKb3JPT0dMNERXbnBXUytr?=
 =?utf-8?B?MkVIekcwdGJ2bUJiUEhHR1paMFB5UDBUcnpPVFo1OWVpbi9ZY3ZDdHIya2Ju?=
 =?utf-8?B?V3QyN1o5clJMTzFyNU1ZbzNxTkYxdXBXeDlnM1JFWjMrR2RRcHJwNUZlREwz?=
 =?utf-8?B?aG1VZ0cxZEV4Ujh5THp0NkxKUVUzYm1TRTBBYUtPeG83TWd5RXdOV0l0b3d3?=
 =?utf-8?B?Tk1tMTVNeEtXdmJBNVVwSHRJSFNxRjNyVGR2MkZGNG5LdGE2c1lJMkFYS3VL?=
 =?utf-8?B?bC9TY2dIZE9qNS9ndWZjM216TWRiT1kyRk90Zy9vYVl3bVFhb25xcWxwQ1Bx?=
 =?utf-8?B?UTVlTjZlUEZ2V0J3Q0UyblR2Tkd1enBodDBsL01vb2hxMFV1a2tJdGtZZDNG?=
 =?utf-8?B?R0ZZV1V0SkpaRi9aVjd6R3FFY3B4THl5Y3JsWkRmSktqZ1dpNHFBbVRnM2VY?=
 =?utf-8?B?cWdUWHFNUU9hQ21Ud29NRGsvTDhtTXUxZlU3czhtQkxrbGVqR3h2ZE9abHp5?=
 =?utf-8?B?V3YxbS9QWjl1SDJLOUxDMHBaTkNzTHR3NTdId3cyYnJWYUVwaUg3RWxOUGtl?=
 =?utf-8?B?WitnU3NvNm9OcmxmUS9hc1EyQUZ2VWl2LzFqT2wxT055ZkNZVCtHOUNBWE9u?=
 =?utf-8?B?citKZ2U1bmI5VUpWSE52NzhEUExPOHlJMDN2aDF0bjQ4WTN4Y3B6QUtHNDNW?=
 =?utf-8?B?cTNENkJBK0k2OE83VHJJVG4vam1ab0Jzb1NFTGt4dHBld1VYbUlaK2VvVHlL?=
 =?utf-8?B?MmJkV3dYYUdZUUZvaXVSR0M4UEw0RUVEQ2VyYUtLUDN4dmE4ZTJNUWM2OFNR?=
 =?utf-8?B?SWdtd0dKN2dBQUNTaVRPNTNScnNyeWZWSmczZ0lzL0pLOWYrdEFsbG1nN1dR?=
 =?utf-8?B?N3BPcU5wcjBRV0FhMmk0RStFRStqNlkxd0k1ZlBhUklaSnpBN2MzSzdaelVk?=
 =?utf-8?B?bnFtZVBnUlNqSG11MXovSHdGS2h4aDVPNzF6SkdNSkZ5S3FMbC90dEVOTk5D?=
 =?utf-8?B?dFdMWlpKTTMyV21MUWVKVlVRVWhwUmxzN0I1ZHB6aC9MNWwvaW85MEc5SXFW?=
 =?utf-8?B?ekpONno0VkZUcnYzdVVqc1MrWmVEbXZBRVRWMk5pQzNISEowUEZ6RmZyZ0ZX?=
 =?utf-8?B?d1dpdm5GZkhIQ0VIVXJQSUtqTTJEVmdBaFRodGNJckw1eWthbVV3Nk8wMVJN?=
 =?utf-8?B?OUxOSTFtV3VXclZBSHprY21MKzZzSitXcDRDN1dmbWFCODNmQkRGZWM1UlBm?=
 =?utf-8?B?WTVsOGhHVzJYT1dRRTUxQThKS3JNQXhJZVRRbXUvMktqdjl1QlJ3Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a968637-d1c1-439f-7635-08decb52d2c9
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 02:56:11.8463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ES3FRwDYv1srYrSLsYgMgNyXbun+ZmeMfcsgKoTQsmI+JsqTyJOC3Yz/F3UnePTzZ3eXqQgi9Us+5tb6PiKzWkBH4SF2QrfbtIy6j07M9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB10535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_195618_518361_5D6C403C 
X-CRM114-Status: UNSURE (   6.56  )
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

Hi Conor,
    Thanks for your detailed review. I will drop this patch.

On 2026/6/16 00:52, Conor Dooley wrote:
> Subject:
> Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add gpio 
> irq property
> From:
> Conor Dooley <conor@kernel.org>
> Date:
> 2026/6/16 00:52
> 
> To:
> xianwei.zhao@amlogic.com
> CC:
> Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
> Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley 
> <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin 
> Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
> Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
> linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
> devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
> linux-arm-kernel@lists.infradead.org
> 
> 
> Given Linus' comments on the cover letter,
> pw-bot: changes-requested
> 
> Thanks,
> Conor.

