Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCF9CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 04:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7EgqrSeB9xNlz0Rcurj5NI7eLQtaUNh9jWOytKla0Q=; b=Eb4zrxWIIl5K7tO9sIQz1b8gr+
	ZBCkoipzKLeoS5ZNNmo2eyqbDFszF0MG+pQtK7m9MDipOKh9EKF1780bnRKRY3SCYkGmqYIP336or
	UZWauwQflZ4Bh46F5LdKrxjG877FVf2FM+biBbn6ZNC9q7VE+6/2kqNFx3QvANRlgDncGvYuq+sXK
	JwChU8r+rEHNvTA73IttrHUKAeMF3SQOqho2m7HgysZyFlnSHbzHHpVUJPMWsT+8NO/aISUvQI/QO
	PnySdbeMh5efZtv/Txw/wZ2N+6fOBTPyuxmQyCiNK8LlpAHIB4QRdhUAcw8iP89jF3UEOm0jmr69L
	uLMlShnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXAPa-00000006mJV-42tG;
	Wed, 10 Jun 2026 04:19:30 +0000
Received: from mail-koreacentralazon11023098.outbound.protection.outlook.com ([40.107.44.98] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXAPY-00000006mIo-1Dda;
	Wed, 10 Jun 2026 04:19:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZqbKeY9h3+EBt3dpv4sFC597Yo2dPgUJjDBjGVNvzEK+Jp2v0vfbyjmD+9W3jjBGmXFWzeYBNFgK6zwJGxJD5UTsIK2D+WeJwObn1Aeni3N+EgR0qVafrs1zc9I4CoiZ2hCgkxl+0BJ7JmhsaY9dCE5L+v0sjXblL+qlBeUoTJQrOoQmb7wzres7uQ9+ycLafWO/1HJkBQ/gpnZMYgAzuLyWNo9c39ghy+3XihxKXoSmvma3ixFST2BUSnJGlLBVlymscg1empCx2Home/BNeWpzECWGQFcGtqXHM95gTMQNUA63H8/emobgnxM9pyf3QJ/FnL7xjPMMzatl1rYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7EgqrSeB9xNlz0Rcurj5NI7eLQtaUNh9jWOytKla0Q=;
 b=OJNocZonm4aPeJHqJrk1yh9Dhdh3M2HMWf/B74AL4t5WTzlXahAWkxzMXACk3rU1/ZOWBfHzPwPMEyaBPjXB9pgthhHrAr7TafchcscOG67+A8YBj5u4ph2Ea5j4Bd0JuBY6EQmiTi2NHOyp/Yr6dSouL4d54HS9rOOsos6cbPVYjye3MAhL5LDfmETNSjIGPjWT075aGDCqTxws4EAQndhW6BhT6v8Vuq/KtU0qO6d/eAL9akoVjt7giaJcefol/V+PqLjOgGMofJO/X0KIA9gNVKzMZcFCAxirxOkX5p7Z/oCPyaidj4lvOhZLQj9kg5k/zZamaBAve+SoAhMSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7EgqrSeB9xNlz0Rcurj5NI7eLQtaUNh9jWOytKla0Q=;
 b=HtfTuActOR0scnn6P+qvKJzPouNJJwfwmh4qDMJpYWksnNkpI6133pUbyETSiXC+9WYSgviZaq0OyNPPqmOmVAHU+CTAqNQOVNYcdLq5ppCFQFGibHV9FW7P9Mf7o99DiArOsUMCPF6sLi+ddGUdo9MleqGAfEm/xxKmIPmkzbKAFRgDLEvjHXtVuv4q5sts90NDDEDkI7lRE2RDWirc8eOI2AtKrWus/RTj1WyKtHUv9VBHBC2a2/IqxJkgs936yocw5miXGERDz3MtIFqdmDJFVZwjidg0kvT6/+7j+xLqtQSeul8/hpddNFol2WawNcx2XA9HjOnNj3VqzIevYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by JH0PR03MB8024.apcprd03.prod.outlook.com (2603:1096:990:3d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.9; Wed, 10 Jun
 2026 04:18:58 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0113.006; Wed, 10 Jun 2026
 04:18:58 +0000
Message-ID: <67fcf9bc-0ac7-4812-aa7c-4d42d8f1c162@amlogic.com>
Date: Wed, 10 Jun 2026 12:18:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: amlogic: Add A9 AO clock controller driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com>
 <20260603-a9_aoclk-v2-2-f47ea616ee78@amlogic.com>
 <1j7bofd7dr.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1j7bofd7dr.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0164.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::16) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|JH0PR03MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d41eeb-61c2-432f-c233-08dec6a76449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|4143699003|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kOkU5cks1y+b7tRWPMSfhSxzror4rqRMCNYFOtBexJGby+bZ3zpjVwM5S+y9h1lhQccp2vQXku74uqO1YuDkLRXz/dJRhoqpuo7vM2hUXmsrr7b1lh7HwBpDrvQRZt4n4Ca0qrxVYZVut2UZuYoxTHGkA1nEiPC7kxXTFfBGes/eEvzTkgEnoGC28RnCybHSVC6LkCx/qdRz9yj2Hvj+RcHBV3LKNsN1L0wrOt2Qs6yU7pDzfsvxsYyMArxJiV0LFmEwdGJUNyEwGDw6SRTjMKH4qGBg00dqG8Bc0fvOlmpTDAp3LlOZUcKhhb7l09EScTM5V9vF+ijuDekPODnevw8M5MD+BD1J8M4bosdj3sgwunr4f7tnfj+SqTRWg4zgNmabCXInBGhlAggsBcer5Z7Z8bdYhqAX3oZSpeba3NGwCCNF6vw1l22yl0Ht7rDh4FTSiBzqwe2FzK70mbacDo2IQ8ElGgoSeIkihnG8GVfQ6Ni5REWVkWyncbE0tEYxbYxgr1sjoDut1jh+ZCLl03YVOd32CoSKUQpE1zQ8Bo22xvLwE92RcBSwnF3kk8GnFA8lfBHmyYdAS9tmkY+WSBtcOt/C2QOBIwdol1DK8xlpUp6JGEnvmMNb5NQQg+0OFXSdHE7A+MH9EfcAZ+t1GNdWoigxG9hMUktsS0wMDZT9Orr+ce+OywzeG/9nWwhA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(4143699003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDJMZ2RVWWRtUzVuSENweXcvL25CTGVCSW81T1YrK0ovQ3VXLzd6YVBVRUZJ?=
 =?utf-8?B?QkpYcUw4eStSMzRqbmRkZTBWbHp6QkI2c1BnaGNpRktpMERzcmQ3WUxjd0ZR?=
 =?utf-8?B?ZDd1WjBwdEp6L0hJRXdLbW1rbXpoWDZkYWdvQ1BNa1dVbnJZRHU4MUhkWkF3?=
 =?utf-8?B?YXVEbkpHSVYzcWVYN3Y3Z2pMRmUvT3hwTmVxeGZBUUsvNjA2dmd6cTBRU1Fy?=
 =?utf-8?B?QlEwVjVLQzlLN0ROeldLMUVheU5zdkx6TlJBNlQ2Q21YU3VuaVR5SXhRVG9S?=
 =?utf-8?B?MWFCLzJTNmo3N0kvZk5pWnJ3N3pDTjUxRWkxZlJ6UlFjcTlFdmVWMUxIT3Fv?=
 =?utf-8?B?aE9mNER4dFJMRnNFS2VDa21KMWQ2K3RDaGlGcVpyUDZOcjlWTkhwNXI4ZEdz?=
 =?utf-8?B?aDJIdFNvVFZMWGtQZy9aTUZ3RDJQcWc3c0g2UlM4bUNyUmpHbnNNR2I3NjZU?=
 =?utf-8?B?Rk1naEVPZTVmYVVpS0tyc1RDeWMyQlJvNWViVkZGeDd5bm9mcnBqa1FyZ2JX?=
 =?utf-8?B?NURuempLY0M2YVIwbnVjeWpZQzVWVUZtZ1kvZU84TVhCU2I5RXgzN0pqL2wz?=
 =?utf-8?B?R09qM29WeVl2NFZDZXBobHc3bUVHV2ZqeTRCMngrOURSMnMwWTRnN205UDI1?=
 =?utf-8?B?VHh5TkRjY0JVMTBZT1crRGxwTnpZVzd5Z1F4NzRSM3YwQ2s0S2lFbXZwUENS?=
 =?utf-8?B?VUMvRmdzY2FUTDkzZStGMDBhQkpMSm1FSTJiNXplYnM2ZEpaWjh4Z1FMenlH?=
 =?utf-8?B?cmY5cWE4cW0yS3F6NVBudE9tRFQvUEsxcmRIRVdRWVk3dDZSTHExbDFFUitQ?=
 =?utf-8?B?Y0xaODVqZm45Nk42RldDNC9UdXhUL29vL0xZNGJkMWFGQ3hPekhZeEFpVm8x?=
 =?utf-8?B?U0JGelYrTTVhM2U2eUJaZml5ZDdTMjEzVFNEckFybDliZDhVUUdiZ3Q5dWMz?=
 =?utf-8?B?NHBEcTAyYXpBWHlwMkdqandobmIrZytkTjBONVdTQzFaYjdZQ3NvU0xWQWNR?=
 =?utf-8?B?ZHZOOC95TWt0SjNyMzdxQmoyVE56Z0VnbDBoNWM1Yk1ZLzlHaWgraHlEMzNS?=
 =?utf-8?B?dXlpMWU2c3pkMFVpOEJwamZMekV3ZEc0T3RtYndSWWthNTR4V3JpQTM1Vy9H?=
 =?utf-8?B?NlF0eS83TlN3bXRuVWlHblQ0YnQ4YndVWDdHV2JNa0lDZ01JK3B4SWJRb09u?=
 =?utf-8?B?V1RkK1ZBMkx6TXRsNlhIMnM3K2pWdWZVdUJCaDYrS3JiRlhnbkMrVHJ2akIy?=
 =?utf-8?B?Y1hzcFJYSW1hOTk2VVcvYkpwRHBjdDFyNHgybHQwaXNsdmhWeTQxTWNFeXZp?=
 =?utf-8?B?bVFoNU1KRHQ5VGhWRnVneWlqRmIvRmdYNG1JbDhpN3BXeWJmNURUZkhQdm9x?=
 =?utf-8?B?dDBkU0hjbEdaRVBQRGgvNEw2T1lUOUh1UWd5dUtDMjFCR2dTTGxZeEJhUVF2?=
 =?utf-8?B?MVZDL3l5cndUZUNXSFZRL3NkOWJLSWNKTXBXSzJ2YUhvZU1YWS9oKysrblYz?=
 =?utf-8?B?akRXbFh5RE1aK2FUSTRyNldNTzZGT000RXpBSWNnb3pzaWRBb3JQWFpwYS93?=
 =?utf-8?B?N2t1VFlJQ1pyZ0RJMFJ3R1V2NnZUc3RWVS9MdFI1bGI0ZXBYdHFSczNBaDBj?=
 =?utf-8?B?cGcyUHhIRFpxUGRTYlBSditVcGlibjlDcUlRdFovdWQ5b0grakhvZHNRdnhz?=
 =?utf-8?B?T2hkTTNDZzdCeHcxYnp0Sm9kK2VzZG9iV2ZaU1ErbE1HR0RvZW1OUzYyL0NF?=
 =?utf-8?B?TWxhb3Y4TGRjOVgxU2NscDZybE51SzRlSHQ2cDJ1SXJ4ZWd5U1dpVTFjUEQ0?=
 =?utf-8?B?OUk5cy9GVUFIMjUxZXNxNXY2QWRHbEFBcWwvTGN3V2ZqYTYvUGJPbk1DeFd1?=
 =?utf-8?B?bnM5WkZ2c3ZhZkpMZzhkWGFVTzV4Q0NMZFoyaS9wc2UyckJ1bFpqYWZIZ01L?=
 =?utf-8?B?cDBaOVord2Iya1MvTXh4cmZ0Ulo3aUFkSkk3RldlNnZiMU5zV0pqbC9tQ0hm?=
 =?utf-8?B?d2ZROWFjeVR6UlgzSldZT1NURHJ0Q2xtTTRrOHRHbDBUTTBIRHFyUTc1ZnYr?=
 =?utf-8?B?QVVRc2dZN1J4R1FyYlVrQTBoLzFESjliVk05UUxFbzlOMUFnRVZQdlV2cmFy?=
 =?utf-8?B?Yk9PNTgyZXZhUzhZbFhGVm9kZkMvTkdYcWVQN05paUovV3FKK1Z5K0JYTjh4?=
 =?utf-8?B?S3JFR2NRSkFSbVVSUUoxcEMzWDRlcVZHZE5IYXh2aWdRWEFDNkVHck03Wm93?=
 =?utf-8?B?bVVsZ3RNSlYxU1JpSDdVeUxDU3VCVEJxbDdnTDZmdDg4WWY3SkZTUk8vemxR?=
 =?utf-8?B?TVN4R05Oekx5QWVlK0FUTURkeDZhR0V3WTlBZEhKZVFQQngzMGtGZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d41eeb-61c2-432f-c233-08dec6a76449
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 04:18:57.9535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/KIxsjvFUZjeHJgU9KsT+pGfyRsZpXTJvS5eabPolY7r8a2YXZnOIdoCQ7adFFmM4+vnrdbMmWY5TaZlOeNIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_211928_361533_ACA27BD5 
X-CRM114-Status: GOOD (  24.52  )
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

Hi Jerome,

Thanks for your review

On 6/3/2026 10:29 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Wed 03 Jun 2026 at 20:17, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/Kconfig    |  13 ++
>>   drivers/clk/meson/Makefile   |   1 +
>>   drivers/clk/meson/a9-aoclk.c | 419 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 433 insertions(+)
>>
>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>> index cf8cf3f9e4ee..625e6788b940 100644
>> --- a/drivers/clk/meson/Kconfig
>> +++ b/drivers/clk/meson/Kconfig
>> @@ -132,6 +132,19 @@ config COMMON_CLK_A1_PERIPHERALS
>>          device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>>          controller to work.
>>
>> +config COMMON_CLK_A9_AO
>> +     tristate "Amlogic A9 SoC AO clock controller support"
>> +     depends on ARM64
>> +     default ARCH_MESON || COMPILE_TEST
>> +     select COMMON_CLK_MESON_REGMAP
>> +     select COMMON_CLK_MESON_CLKC_UTILS
>> +     select COMMON_CLK_MESON_DUALDIV
>> +     imply COMMON_CLK_SCMI
>> +     help
>> +       Support for the AO clock controller on Amlogic A311Y3 based
>> +       device, AKA A9.
>> +       Say Y if you want A9 AO clock controller to work.
>> +
>>   config COMMON_CLK_C3_PLL
>>        tristate "Amlogic C3 PLL clock controller"
>>        depends on ARM64
>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>> index c6719694a242..f89d027c282c 100644
>> --- a/drivers/clk/meson/Makefile
>> +++ b/drivers/clk/meson/Makefile
>> @@ -19,6 +19,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>>   obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>>   obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>> +obj-$(CONFIG_COMMON_CLK_A9_AO) += a9-aoclk.o
>>   obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>>   obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>>   obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
>> new file mode 100644
>> index 000000000000..b7b3ca231a42
>> --- /dev/null
>> +++ b/drivers/clk/meson/a9-aoclk.c
>> @@ -0,0 +1,419 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +#include "clk-regmap.h"
>> +#include "clk-dualdiv.h"
>> +#include "meson-clkc-utils.h"
>> +
>> +#define AO_OSCIN_CTRL                        0x00
>> +#define AO_SYS_CLK0                  0x04
>> +#define AO_PWM_CLK_A_CTRL            0x1c
>> +#define AO_PWM_CLK_B_CTRL            0x20
>> +#define AO_PWM_CLK_C_CTRL            0x24
>> +#define AO_PWM_CLK_D_CTRL            0x28
>> +#define AO_PWM_CLK_E_CTRL            0x2c
>> +#define AO_PWM_CLK_F_CTRL            0x30
>> +#define AO_PWM_CLK_G_CTRL            0x34
>> +#define AO_CEC_CTRL0                 0x38
>> +#define AO_CEC_CTRL1                 0x3c
>> +#define AO_RTC_BY_OSCIN_CTRL0                0x50
>> +#define AO_RTC_BY_OSCIN_CTRL1                0x54
>> +
>> +#define A9_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
>> +     MESON_COMP_SEL(a9_ao_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
>> +
>> +#define A9_COMP_DIV(_name, _reg, _shift, _width) \
>> +     MESON_COMP_DIV(a9_ao_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
>> +
>> +#define A9_COMP_GATE(_name, _reg, _bit) \
>> +     MESON_COMP_GATE(a9_ao_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
>> +
>> +static struct clk_regmap a9_ao_xtal_in = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = AO_OSCIN_CTRL,
>> +             .bit_idx = 3,
>> +     },
>> +     /*
>> +      * It may be ao_sys's parent clock, its child clocks mark
>> +      * CLK_IS_CRITICAL, So mark CLK_IS_CRITICAL for it.
>> +      */
> I don't really get what you mean ... Could you rephrase ?


The AO sys gate clock chain may be:

ao_xtal_in->ao_xtal->ao_sys-> AO sys gate clocks

"ao_xtal_in" is part of the parent chain of the AO sys gate clocks.

Some of its downstream clocks are marked with CLK_IS_CRITICAL. To ensure
those clocks remain functional, ao_xtal_in must not be disabled and is
therefore marked as CLK_IS_CRITICAL as well.


I will rephrase it like this in the next version:

         /*
          * ao_sys can select different clock sources. One possible 
clock path is:
          *      ao_xtal_in->ao_xtal->ao_sys-> ao sys gate clocks
          *
          * ao_xtal_in is in the parent chain of AO sys gate clocks.
          * Since some downstream clocks are marked CLK_IS_CRITICAL,
          * ao_xtal_in must remain enabled and is therefore marked
          * CLK_IS_CRITICAL as well.
          */

>> +     .hw.init = CLK_HW_INIT_FW_NAME("ao_xtal_in", "xtal",
>> +                                    &clk_regmap_gate_ops, CLK_IS_CRITICAL),
> I'm honestly not sure about this. It is correct, sure and the macro exist to be
> used but ... It does not really help readability here, does it ?
>
> (I know that was a feedback you've got on v1)
>
> Other than that, this looks good to me.
>
Ok, I will use the original clk_init_data for this one.


[ ... ]

> --
> Jerome

--

Jian



