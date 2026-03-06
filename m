Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C51F513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 02:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3KTW9tz4wkNN8jUSVG90aAJUsDGhnrHZ6pRdfeoiRA=; b=1wCNGJ6shSdOQbFpfaHq6FYtHw
	EuBmKDfkgprDcr0v3JilouF58OGx7HBcCnOed1SQep0FjAHY971r37LKuKdxctoHmzsIzU8/8ffqT
	xNwuNCNJY2XawOfzdsiGoey6yf++tPxrB00tnoKOZd0Dp8mSaSlUhuwm++NabYxh5LIk8BoPCLC9b
	PFv18s0grO3ZWB2OvDS0jxevjcDAqJl+uElChKDvgFFTfrQHlKj3pRniNuNPqPNk0bxE3WMzp2S0p
	ycG92OwZSAgDbxiL/QsSX0+ifF93K34N/qtW4N1iOLby1txY1cTedOTduYNEHZDKtCE0pCzTZR8bQ
	gNmEEYbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKYz-00000002rPD-0VX7;
	Fri, 06 Mar 2026 02:05:13 +0000
Received: from mail-swedencentralazon11013022.outbound.protection.outlook.com ([52.101.83.22] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKYw-00000002rOc-0XSR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 02:05:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWr3WmlDH39z61yQXZ5VioxiL9H9dwKxaIeC8XBJk1IXdibthSk862glIBGee6TnvJ/aJhnfT1eG+hEXj2Q5LX6VQAzE/I66ZFDqtovYGCrSTWKnSqGvMwK4aPou/xxABCi5uvxS81/XqBdkmT1rfDrW74ICasJuGgMtu0kPm+HxT4SAnDfZTnKpPIoqZTNvS96+bFq7Vvk+DQHI+Q6OTW+IrApeAFwwra91UJdStuxgwJBUzzQ2HRzHya8++qS+6AY3pdiQJ3VUMbo5iEh9OY92iktl5UfRv0QUrGJIpYNo32MBoIWezDdV4k2HGjxD5Z71ggJK2JOahzR4p5hvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3KTW9tz4wkNN8jUSVG90aAJUsDGhnrHZ6pRdfeoiRA=;
 b=Fcnp3WepwEq6JLie7OYA1LtteWHiuEe8BSWVmy0dvra/bLXZQ6lJA1D52bWapHj/TBeN3KsnNu0dURiNnK5ziATj8gGTvmeupig5AMP4Z2Yrnar17tcVwgbu/uXxBNTAosman8Tgw7aagjVN6S1L9bz861+Lzv/TR7uKEUl3kLbtoa2RWPfFLn7FK2KrqKyzxvNchhnQFPAl1OUcfUGJ0kb2w6itd79kvpwnLlkAevNwMKLLLsYrPw1P38fEuX1iOAfewBbHaY3EEX9dS+847AcXPUt9yzRkRYfFGwmrObXlZDKGWwRGhz5wdWVFo7jMrZXsoWtLPOBwmpUYHbC5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3KTW9tz4wkNN8jUSVG90aAJUsDGhnrHZ6pRdfeoiRA=;
 b=CpCia7GvyuY2nHHILGk8FAHJMW5UWXvm+6rHzAnieuM/aPDGcuSu4Nagr1Hq8KBeuAUksvMUbLLEE9oxyqNDjjXabY443jHsEWBih2o6K1TAdJ9bL+T/K2vCROmnfEX8pWiNTjyceRJlPsDROEKmpJqWz4uCOyyPjc6Jdjn8GP6P9L/a/Pws4w78BsKXiLlpEMTFRRKyo9eAz+PDm0txrvo7P+N9xR2jmHDE3ngINqPlGx3dTZDWcNWWiSBeIjB/z8pOH1792QjqTo5LZhMb6wAgNFZRMqKIwmj7ThtPazAGf29HbQWWuTPPyTzz8syATEIRDXTNZ2bKflj2gV1hrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA1PR04MB11335.eurprd04.prod.outlook.com (2603:10a6:102:4f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 01:49:31 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 01:49:31 +0000
Message-ID: <84b588c1-edad-4c94-b3ad-38e85f7e64e4@oss.nxp.com>
Date: Fri, 6 Mar 2026 09:49:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: verisilicon: Fix kernel panic due to
 __initconst misuse
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, sebastian.fricke@collabora.com,
 shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, fra.schnyder@gmail.com,
 linux-imx@nxp.com, l.stach@pengutronix.de, Frank.li@nxp.com,
 peng.fan@nxp.com, eagle.zhou@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260305100149.722-1-ming.qian@oss.nxp.com>
 <azwbgxp4pl3m6klyvd5htmy7h7pc76nqvvgmi6pudvfl7zippl@svv7tiibyrci>
 <4eaae784-3730-4a9b-a94d-d0343c6b31c7@kernel.org>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <4eaae784-3730-4a9b-a94d-d0343c6b31c7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:4:197::18) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA1PR04MB11335:EE_
X-MS-Office365-Filtering-Correlation-Id: e8dfc3c8-001b-42ba-b79a-08de7b229bd6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|19092799006|376014;
X-Microsoft-Antispam-Message-Info: tvkzrq/MHT/zE+zek4vytLp2jLsCFE+TefwJfrNhKGSHiSI9BO+EjzfqhGly+WU8ZuJxE7O+Xi/YGautcsNnH/gHSFTs2I5tjoIUXaMedmyryxWht7sOAiaFB7Yh4DuAj7lM6ZAqqpOZZQIEmEyNJ6TsPPJkiQyOYANSCiAxU2WfeU/XoFYIKLZgjryZUZWjxqaFdQuO3QBnvSY/yvZeiO8KPjr7cwwJS6D1/Wm9P6o9e8KYhKufBt5I+om9FcVxWScdIdjQ7DDTBkm6JG3YF4Li2VNCmLnqaO9aZlqes2stNeOlJ2hehMBgZgJVMoZPO5OILv61t5YOfoIlVYyNEV7EY33zdWVcVZReGAAKt9abGacEYFdZpTrGfhM2eSb67X8dbbnQGZaNALGNTz+BDIHPbheDpr9WmXUMZF6Qtb+e0U3mqSmPmhQE4JP40gK5JpHRW7XpJYJKlXWYNBYhfKsrIlh4+uhAf0MS8Wv9vo9w1GsOmBmDnjIYDsQTpH+sJ6hxp2AseuhDH8D+ec6xCr4eU0Zx8iSpYZJwXg6l+GBSZWfkGO76905c6+e8IdpIOGRQFHw9p8j4cNM38V6t3CyUEvaI6cF8b1+hwHQtcHWezlAnpQfzM/E483TwYVCL3H2oZrNm3gwY6F85B4RR3SR/IKUNUndmSB6nplwg318NQlDNsMqXqzip8ckpa4GYuXc6Ky719fPuxlSbFC2/QBktoduwM8AIW9Uuv1JPt4ojBZELejmcjJ7AgK5y8wKO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(19092799006)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXlLOFA3c1N4dXBYcHJvU2FqK0RHdU1WMDVOMnNXTjlBbmJzWXpIWlRwME92?=
 =?utf-8?B?MldJNFlvRVdKOW1RZXA0UnRjRjBYMXpLSFBvOG1KYmxWWkVRYlNScXJPK25N?=
 =?utf-8?B?dTJQNmh3T3QwTFp0ekszRXVBbE5vS2o5NGRsb2JVdnJkVGdjZFc1aHZySU91?=
 =?utf-8?B?ZEVkczBGc2hZNE5idkxaVzZpaVNvRGhocHB5MnZwSFhYZjhhTnNOUFV0U0tY?=
 =?utf-8?B?SUE3OFBBdVpwSDFLenpxWmcreE1WTiswRXRSU0s5U0plM0hGNENDMG5sVzJQ?=
 =?utf-8?B?NFNmSDNhemwxNEdYQlQyUWg3bzVZeHFPTVQrSm9FU2tMTVEvaC9WTUhHbWN4?=
 =?utf-8?B?L1RQQWxrNTZkTEdvcFpJazJaT3lCRVBiSXVzZFNNVTFqdUtBbFUyR1hIWnNI?=
 =?utf-8?B?V3d0eXdrR1hhTVVjeWJ1WW9vTmgxcmdwZkhYd202ek5yVnEvMTM1YTN6dFFM?=
 =?utf-8?B?RW9rTkwvZ3BWRG1sNXJLVEJOZStBZUhtcG9NcFMwM21PNmh5V0FjMnVwTDVB?=
 =?utf-8?B?bllGT1lTdHhZVG1WSUtXd1FiYzUrN1pTemNIN0pjUXRiU0lEaTVoQVppOTI2?=
 =?utf-8?B?R3lYcTc2V2huYjFpTUdUUjdXc0RRUHVMZzJ0RUlKWHM5RWxUREE5eklETUdK?=
 =?utf-8?B?NGl1WmVPUmdKcS90dXp2c0o0UEQ2a1FEdmlDbjFTWHpZcDR1THM3WVBkcmdn?=
 =?utf-8?B?RVIvakY5L0QzZW9yeUM2bTVkMzEzbjdJam9JVGZoYUQ1U0tWQkkzSHFneUJy?=
 =?utf-8?B?R0lVbUE0c3B1dWlGNmJwTU5kbjh6TXlLMWNJTWxrUGg1eDduRlFOWUFxRmRK?=
 =?utf-8?B?WG8xNUhyYkFOYXViMDc4NGppZDB0d0FvOGRMVDRrZW56ejdFZWpsWS9jbmtD?=
 =?utf-8?B?NXAva2V6N3ZYTDlZOEd5UVJiMXlrUVVwOE5NOE00Qk40djJzemVCUERuQkFm?=
 =?utf-8?B?YTlXMEZLU05Gam1MWWZ4aUdHbnV4ekgzaHdCMTcrdXhKenJHZThtZmlHN1FH?=
 =?utf-8?B?OXJGWlhqbHdIWFpIVlpGNW1ZTG1vWVNXeEhZSDFSc1E5dWJGaWY3eFJaOHNQ?=
 =?utf-8?B?SEdseHJoNnplZS92RVFsaGNMVk1IQm1GR1VCYjBPK1oyVFh3UzdkazEyZGF4?=
 =?utf-8?B?WWo3SGM0R1pPWGNDWTd1RUlnNkh5OXlja0dRYzRVZEdJL0N6bHhibG5XZHho?=
 =?utf-8?B?VHJRbDQvWnpRTGJTdHI1cFlSZ1ZkRVVaUk90WlRKM3VhbGphWEtpYVB5RVpQ?=
 =?utf-8?B?QUorRzRBQ2k1QlFrd0doWk16d3paajhpdlpRWUJhZVdLKzNCZTl3K2cxOWVZ?=
 =?utf-8?B?SXZrQ3dpbWtLNlVWZXlyem9teGttOC9tdW5aOWRTamROL0RaaXpGUWdTd0F6?=
 =?utf-8?B?elZrS2YxeHdISHNWdUV1L1lXbUp5QmVBa1BYc2ZPVTZKWTNLSExjd0hrdHJS?=
 =?utf-8?B?M2pGUE80bWFyUkh2RHVPd24vYkJySkZuUXNPcmtHdHh6SDVsbzFvS04vWk9O?=
 =?utf-8?B?TWlmTHBZdGlsNkV0SGgzakRLNE9Pd2ViUkw5Y0NSRmpTTFB4a1pNVTRLUHFD?=
 =?utf-8?B?QW5xb0dmSkRTdUd5bjNRL0dweUx0ZXl1RmIyYjBFS3JEN2RHQndVTjJKTHlP?=
 =?utf-8?B?T0tIWkZMY1kyS01FSlVRdWJDZUN0UkNsUmszbUs2UjdrZFc0dUl5R3oyUW5I?=
 =?utf-8?B?cFNIMUZFWEhMQUVsaFlpNWtPTTRYc3Jsb2VMelU2ekN5VUNGaUR3RFY2a2lB?=
 =?utf-8?B?ODZPSldSa0pXTzZYOFFsS0JIaldaZzNIb2pFWndPbkE3WlFZcFVJbFpRUisw?=
 =?utf-8?B?aXFMTTh4dmx6Z2V2b2hlM29VSUdDNTFuOThPQUJGQ0ZNTzMwdWdVTHREMXlp?=
 =?utf-8?B?S2h1TzYyY3p3UmhxWTVIQ0ZRVGZBRWJCQU9qRHBRWkM0elB5eEVERXpVZXpp?=
 =?utf-8?B?TFN6Zk1YNEl1OXF3NW1BeVJoUm0rL0JJdU9BbzNCaWdjMHhrM21mbGFDRmYx?=
 =?utf-8?B?V3V0WW5tcFFUSCtsYncyeUs4RWRQSFFCcHVXY0gvWGtqYUUzMXQ2aTRicVN6?=
 =?utf-8?B?YjgyMlJ4Y1JNUXllM2VEZGFaQmhOWkh1dFhZYUl5QkRab0daaUhrd0dVMlFN?=
 =?utf-8?B?eXpTMiszVUY3K0s3T0hrSW94YllmMmNweHpHbW14OEVYOW1KdTUwRldhMmVK?=
 =?utf-8?B?ekNJaGhKL21hRWRGTUdqQ2RoWlRNZ3RpOUk5MTFJMnpDN1l2cFhWTGpGRmVE?=
 =?utf-8?B?TnZCdVhTRG1XUG9Bbkg4VDlYVzFRNEhjeHN3d2tyMjdscmoyZFhObldKWDl4?=
 =?utf-8?B?L3cvSTlZT1dZa3J0YjNad21qUDRpNEQ1YzZ0aEJxOXNmS3duaXZzdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8dfc3c8-001b-42ba-b79a-08de7b229bd6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:49:31.1435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vk89MLU85cxqR5uurazDol1j84Oa6yY5Mv/xApdMwO4kOUzvSYHFhiDFAiV8doSTkm7pjvNczoMaDBsDwCzx9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11335
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_180510_668220_49E58822 
X-CRM114-Status: GOOD (  12.03  )
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

Hi

On 3/5/2026 8:04 PM, Krzysztof Kozlowski wrote:
> On 05/03/2026 11:32, Marco Felsch wrote:
>> On 26-03-05, ming.qian@oss.nxp.com wrote:
>>> From: Ming Qian <ming.qian@oss.nxp.com>
>>>
>>> Fix a kernel panic when probing the driver as a module:
>>>
>>>    Unable to handle kernel paging request at virtual address
>>>    ffffd9c18eb05000
>>>    of_find_matching_node_and_match+0x5c/0x1a0
>>>    hantro_probe+0x2f4/0x7d0 [hantro_vpu]
>>>
>>> The imx8mq_vpu_shared_resources array is referenced by variant
>>> structures through their shared_devices field. When built as a
>>> module, __initconst causes this data to be freed after module
>>> init, but it's later accessed during probe, causing a page fault.
>>>
>>> The imx8mq_vpu_shared_resources is referenced from non-init code,
>>> so keeping __initconst or __initconst_or_module here is wrong.
>>>
>>> Drop the __initconst annotation and let it live in the normal .rodata
>>> section.
>>>
>>> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
>>> Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
>>> Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
>>> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
>>
>> This fix was suggested by Krzysztof :)
> 
> Or at least a bug of __initconst called from regular non-init probe code
> leading to bugs during probe deferrals or during unbind-bind cycles...
> 
> Closes:
> https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org/
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ?
> 

Thanks for your help, I will add this in next version.

> Best regards,
> Krzysztof


