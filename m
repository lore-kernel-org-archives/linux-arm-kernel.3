Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F27E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 06:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38q7Ry+Yct24XCnUbA5Vx4p5xLryBpZEycYZRnwSRqY=; b=3W6BJK3ETSX/PmE55fgpH6yErQ
	U/M9nZ4RS+/o7vPotP15HdUJtvSRdWk7PNhln1N6jBAhhOCv3fqYC5UTjZVDRfJGw6mL84FUhxZRP
	cmFhQkPKpUJGG56Q5UGruv3he7CWv3ra3ChuzsO8Miu5/3hIU9W+jOJTsfgkk9KO2YSn5k18G/9Pm
	0ipeN+qD5FnCKwQJDbnggnuGSsx4EAKiqFrilkUSNAoXCa6O0GBao+EuyJM/77HcVIp9F3mZ9ykRD
	VX1pXz+tDiWwnQEIY7MkBLIE8zeufdxjcZlixodzRXLl6KhPT0CS44GN4mj2+uAoBjCavXuBEcSXt
	0F/Hi3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8hQ-0000000EHYV-2fWS;
	Fri, 10 Jan 2025 06:40:52 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW8DV-0000000ECCs-3w0W;
	Fri, 10 Jan 2025 06:09:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+/SMEvSLzR2raM7M0FS+bpuhJjljxZqdcWn1QNcDYI9nLXJgRRz8nD6d5oILWOqQsMrpfmHPlp8PMcG35AKgJoT+4xN2KCqNx7aG5//11NTwkbVVewoe21BJVSd9wwj5APD7k0iXISp8U0Y8/FMkj1VnC3C9zmvkabqGLzdEbxwmoRBU0l25gNWint4X253YmWEXASMUDbCgEP+WRi37VO5OkaxzbK5iKSv1umgEtPQxEzeNgkPeaDALEYqUFpTLqRfkCS9Uluqy3IvgfmDHWCajSi/OeHq7HAjrG94199TqmXQs65bIiO/DQZxFayJQag8lOGq3/eP7AkeBXRzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38q7Ry+Yct24XCnUbA5Vx4p5xLryBpZEycYZRnwSRqY=;
 b=Wczohkey9MlowCiRNtrKfETaEbEUgH6sE3CsNiguQRK9DLGSZOw9Ycsk9CEylHFNEvlhw+MtVDANEXaMRvH8h5OD36whePvUkXQaxn0AkEx2TIWpCqjdbfUk9BSKJrlZkHd1ORsORN9/hst6h8d/HY8h4mTZtkjtzsdTl3pbd6SGL2xKROucXQtsAEvTEkz/XQ4pkX5DtbHf8ldpWaNTl9Lx8j9zDwMwAjzskOUYdCg6Lqubn6XEpZW+wy7gpGOxW1maay5+tE9YbvnrwtiJTqybfCG6DzpbgdaQe+KHrROS1NCjq+F72PvvlyOPZK2KYoDjDMkPJZMy/19VRd9gWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38q7Ry+Yct24XCnUbA5Vx4p5xLryBpZEycYZRnwSRqY=;
 b=QMnP2t99TIfCNSz3rt9iytpZaO7lf5sYxMY+YrfgjKHa0b02fiBq4dvDvLHwJlOqYrMlfP6KEYq33hZwbr/QZ7s20CGkXf0kjXizlKr3zyCvOzaypxaXcMU75OGDScVrVRCo2MZKXEvh07ZmV0J5oji20XsbFdaP/QV/PCX+4RscHqhY3lsxBcI/nyHDqbZyu1/dV2+Va63usL9Un+13+moPl/2Ja4Xqi39MoBBwdbXMjkKyPaTyVenQHq4RwVRJ8+a63bM4yyp3P1O4xJNwLXC6A5LrQbQbXThz+sP9o4TGIpOTQHWfYGA94BrD5yx/iu9BFWVIJrzWcmO2klXIPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by TYSPR03MB8670.apcprd03.prod.outlook.com (2603:1096:405:8c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 06:09:33 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f%6]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:09:32 +0000
Message-ID: <68c9c721-906f-41be-81ef-7fe3be0c41f2@amlogic.com>
Date: Fri, 10 Jan 2025 14:09:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] pinctrl: Add driver support for Amlogic SoCs
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
 <20241226-amlogic-pinctrl-v2-3-cdae42a67b76@amlogic.com>
 <CAFBinCCbipebu2sNseNqatfBYdsnW1ouccWBH3N0JTo6GjRG_A@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAFBinCCbipebu2sNseNqatfBYdsnW1ouccWBH3N0JTo6GjRG_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::25)
 To PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|TYSPR03MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: e74de534-3b6d-498d-fb6f-08dd313d59cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0IxOWxoS1ZQeE0yZDMxV0tHRkw0STQ0MmJvZ1FmditDakdBY1JqTStpOTV3?=
 =?utf-8?B?U3hzaVZEa1BiYjJsUWNLWkVFUDNTbzhJNllkb3lrR25JVm0ydi9mcjdIWDVu?=
 =?utf-8?B?b1RKaEFaNkdabTQ4amt1YWNOK01JSDRxQWZTN1ZxeDRTWlV3ZElTODA5THpE?=
 =?utf-8?B?bmJVVTVVb2oreURYdm1UUWtlOTlCdklxQlRJMXNlWGV5UGhRejFpM1VMS2tM?=
 =?utf-8?B?aTd6Z0pRNnFvSnRRcmVzZTIxZ2kvNFRJY3pLUHZiZU1GU0tUcnNnc0k0Zy9R?=
 =?utf-8?B?eE9zcVAvNWJCZ1VRNWlOV0syK2pFZUEzUUFGZlBQUU5jUk96MktDRE93YTFP?=
 =?utf-8?B?U1MwK2dQUDlxVXRvN0p4TXRIMzZYWDRWTGoxc3pGR2EyUTFyZXNZdHhVKzhS?=
 =?utf-8?B?UjlvZU5KUUNHdnFJbmRmdDYwZXF3WkFtdUpuNy9mcTg0bkw0TEg5ZS8zM2Q4?=
 =?utf-8?B?b3RhRVlqV3dQbnJSOVVxcnBzVXY4QTJRSitOeHg5OGF5UUR5QkxnT3gxVWNE?=
 =?utf-8?B?alFVNmF4Nys1empIV3poWEhmQmcwYVplZy9nNzZTaEV0b1oyd09UaVpYMFo4?=
 =?utf-8?B?NmxzWVo3cVczZkRXeEFxT0VENUdDVzdpc3FGUXV4VmZCVG10cUxvbGRqZVll?=
 =?utf-8?B?NjZ6bGFNMDFZckFzc2s4SnVJTFpqNW1KNExGbkJ2SXlwcjJRT000Vm5mR0k5?=
 =?utf-8?B?MnhjQ0h1RXlQZURwNUYyV2NKcmpOek5vS3NzZXM4Ynp3WWh3aVVDQVFhU1Fz?=
 =?utf-8?B?ZWoyMUJxSUFndVlMeUNyZ1F6WnlXOTNZbTlwaFJyQ01iOW91UnViTWVDSWYv?=
 =?utf-8?B?YlVsTHFtMlpjbFFycnpRbFUyb3N2VkpvSnRyWmhNVVMwSXdZdXZtamhTZEVM?=
 =?utf-8?B?TTFLSHB6WDJzeEVSbStNNEJ0QmE2ZUF4bEFUaU5FNG9VZC9zck4vYWgwQktI?=
 =?utf-8?B?ci96K0tVc01QSm14ZU9UOTRSdWg3NzhPNWJjdnBBMkQ4alFRRnViNUJwdUl2?=
 =?utf-8?B?ZjhyRWVVdzRGd3hXZUwvUkhDdGNwWS9EZDFxWEZIbEJnL28zZHAwRU5SWXVr?=
 =?utf-8?B?RGNnRE1kZXNYcGtmbktqa1NDZ2kra1RDbDRRbjh0WWRuTWxnNlFtRmRkZWNo?=
 =?utf-8?B?Y2p3clBLSHRteU5LUEROK3FKWDE4THZBcE1JcmJQKzFRd05JdElFdm1Gdkkw?=
 =?utf-8?B?MWFLWXU2Vmt4US9KeXg4R25RZk1BMU9vQXZoYXFjS3lnTDVSZW1xU3JxNzBW?=
 =?utf-8?B?RWdaa1pBcjBPZ0xWTjYvY3IxbVNWN2pwd0VlK1pjY053N2pEZnE2eHh1QmRJ?=
 =?utf-8?B?R1o3ZDdiTzk4UFpJWEQxVStQNWljeWZJN2dkVmtVcmdKUmVrVCswSGsyeDhO?=
 =?utf-8?B?eEpNZVFOVFRqRjR3VUIyZVRGYy82czhDUmFPNVZXUEhYYjM3M29tTlZlQnpN?=
 =?utf-8?B?VTMrdXpjek1vb3Q4STJoS0N1azRZay9LWXdyeFlDOUMyTVJsZGxIa0E5eUox?=
 =?utf-8?B?aCtXVmlNMUdFbnVpb2V1V2lPOTBHMks4V2FreGV4VnY3ZGhsV0JyNkVJamRQ?=
 =?utf-8?B?RGtJUEI3V1VxZk00Qlh5S1lKalBXeHpkVTZkU2VFM0VNSE1KSzRqU3h6SUdh?=
 =?utf-8?B?OFdUbHQ4elZEZW9VVlZqL1gvQUlDU2xDVkhva2V4S3VQT2xpQUVXNjB3YnIz?=
 =?utf-8?B?RE1CdXl1NEp1THl1eUsxU3IzOUFCelY5UHlFbG5OOVNKcVB6TkRJWjl3QVI0?=
 =?utf-8?B?NE9kZ0ZJMlIzREoySCtGM0QwcGowNUNlSmxuNFZsMk9aZE4zRFRYYTVoTEhS?=
 =?utf-8?B?dWo3d0tpZE5idldZU244bTZmM1hYemF5TllheWFpL3ZaRURKZTJUaE9YM1Zu?=
 =?utf-8?Q?952DDt91D9ZBD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTY4V0ZRRkFaT2ZkTDdad3ZCa2l0T051OCtkalJ0eVhySllnNmVCdDlHYjli?=
 =?utf-8?B?OW1pV3F4cFR1OTRGckdrMnY2NDlOeUJ3UENvMVh3dVdmekFuSmpHOUJIZnY3?=
 =?utf-8?B?Y3MzS21EbzlZMWllWG5nc0xLdm9ndytwckoySWVxVEpCV1JJamFhVjVvZy9B?=
 =?utf-8?B?a21PdEZnU1FBV3NSL1U1MWFiNmxtNTI2b3RCbC90KyttMUhiekdGT05uM1pv?=
 =?utf-8?B?ZmdIc0VHTnMvM2Z4ZHUxTFNFMmFVSjdEUWw0SHFxdXUwNGswVEthaHlhZDdr?=
 =?utf-8?B?Wng4YkhhNW1yYmJsKyt3TUVqQldvSjV1bGp1VXVTOEd4ZjI2enZhZXRoS2xm?=
 =?utf-8?B?a0tpMzZ5djhLMlhKc2RqRkhrNXp3VWFETXE4Mjd1SmlFSHhsUkQ4SnpWY3Vw?=
 =?utf-8?B?UDUyc040UUFQcDV5MUhaNnR1L3FBMW1jRUVlR0FucnJDcTVBVEdlNUxlV05m?=
 =?utf-8?B?NWxURzAvY0xhQXl4dXRobzVYUmlnQ0N6SjZoU20wclkyVDVmd2FwZFVQQnB0?=
 =?utf-8?B?OHVXVTgveklRNUtkVTZsd3ZKcEpNbnltQ3V5WHYwZXBYSEVDRDZLYmhVSWh6?=
 =?utf-8?B?NWxvYXZOOU0rN1pkMXJmM3psUUNnMkJWU3hQY0NnVVRlaE5hY2poaVI2THdn?=
 =?utf-8?B?TFY3WjF4eUNFdGFmd2I2NFUyQzJLMTJaTjNOVVhTUkpOSENHNWdTQWpJWU9p?=
 =?utf-8?B?eTN4TW96cDRjTyt6MTFZZlBJNkl6Tm9ONm9naVVvWUorSnJHNWtQNnhUV05a?=
 =?utf-8?B?djUwaVVWZWhxVm9jZTZsRmpwc0czK1YrdU9vK29WOTUydFhMOTdwNFN3N1Zk?=
 =?utf-8?B?SGlUZnkvVUNVTG5lZXNlaC9wNmdrZUxTRU9pZWFwT1ZQZWZjUmVYZXVLZ3Fm?=
 =?utf-8?B?MEhFaHZNSGJXeWVuZjkvWnphLzVrWGRSWnNUdGZJTVEybUQ5N0RmdGRiRldY?=
 =?utf-8?B?Y3VFejdBZG9JVU1IcndOQ2loMlZwWVpORk50RHhsWVVLV0N6bVo1RlR1bVFh?=
 =?utf-8?B?V214NmtpbjNqTm9ldkZ6UTRGVEJLWXZnaHpuRkRNaUI3VG9LQURCcWVsVEds?=
 =?utf-8?B?MWFtM0l4M0xNT2xQZk1GcEVidnorMlF0aGpTeVFyNHdjK1BBYWNDU2s3TEt4?=
 =?utf-8?B?cXRydkJBV1dGSkNZMzl6c3BJV3BxT2crRVRkRlBuYjhlRUgwVHdRZ0M5UFR5?=
 =?utf-8?B?WEFyRjNORDVBbG02V3NvSWh6alYwRy94eXkvK3kvVDlhVjR3eHNSZjZaaDlC?=
 =?utf-8?B?WG4ySDRKVUxoR29QQ2pyamhnZjlMTFNUTktvaGc5RVNmYW0zT1ozL25YcVl0?=
 =?utf-8?B?UXlRd0E2N1VxbDR3OVNhV0k0MnNmRGpjNXM2OHFzQjkvQW5VVGNlNkszR0pp?=
 =?utf-8?B?TGcwdW5haERLS3ZCQTNka0VmTDg5elhhbWI0M0F3WVg2M296cTdEeGxYQ2JO?=
 =?utf-8?B?VUhFN3BKVFBSNUZ5REQ5MDZwY1lseGZ1eDhjRldnNm1Oek1GKytSUFVnVDJQ?=
 =?utf-8?B?Vk1RN3M1ampGTzZVYUxDSERYWHZGRDh0VzdXTWwrYi83NitwWTh6ZlFmU2VW?=
 =?utf-8?B?TWsyTEk3ZCs1TG5IWkRKWkhESXkvQXN6bmtzN2VSanZCZkVUbFd1THVmVU1X?=
 =?utf-8?B?MHRrNVFjUVBQVFVxNThYbzMzcWJNNU5id0s1eEZFTWFyUURjMlcvMk42TXI4?=
 =?utf-8?B?cy9BMGs3a0k3YzU0Y1ZFMUNtd2ppSG1WTWhNU1c2dldoY2V1Rm16a2dQQmRK?=
 =?utf-8?B?d2F6WDcwaVJGWDR1eGw1SkltNDV0RjlEa051TE9qNjJub01LR2FPeDlXVHg2?=
 =?utf-8?B?MHVXOS8vTzFKZFAwNnUzSjJ0Y0pzcDFZODZyTlpibmVhQUlnWWxwb2NCUUpn?=
 =?utf-8?B?TlBUK3c3UXBWZERsZnQ5RnRuU1NPdHUyRkV3SnY4Z2wzcHRlcnU1OWlQclBr?=
 =?utf-8?B?ZmdaK1ZDVnd5cjBNczNFYlBvSTVZSUpYVmxGSWNjS2ZRZTR3OFJhaFNFVkQy?=
 =?utf-8?B?ZzMreitlT0JxV0cvalMrRVUrcUN0SktiWitFS0VjTmxPUEdFWTlMVzFjb1dW?=
 =?utf-8?B?OWxNVE52aWZoTmdjSHc0d2dLRkNuWkJ6NTU1R0pzQjY3WFpUSXRYRmpPR2pF?=
 =?utf-8?B?Z0lhdnJEV2JzL2xkcU13L29mQVpXbnZZWUNEUmQvQ29SRVNkVUNOVVpWTzhP?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74de534-3b6d-498d-fb6f-08dd313d59cb
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:09:32.7631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4618sSLs21PxwUDuzjCF7XkRY4K8V3RblrCES8aM2PdHLEu5XpyyXkcDirB1Ie8Kid3WQQOBp0oACKo2sc0PEYi5Gb698JGDC416W7N7mA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8670
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_220958_000165_AF04A595 
X-CRM114-Status: GOOD (  18.01  )
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

Hi Martin,
    Thanks for your reply.

On 2024/12/28 05:11, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi Xianwei,
> 
> On Thu, Dec 26, 2024 at 8:57 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
> [...]
>> +       if (of_property_read_u32(np, "mask", &bank->pc.mux_mask))
>> +               bank->pc.mux_mask = 0xf;
> I don't see any documentation for the mask property.
> The discussion about the dt-bindings is still pretty heated.
> Everything else is already part of the documentation (which is good!).
> Please document his property as well (or remove the code to read it if
> there's no need to have it dynamic).
> 
> This is not a full code-review. However, since the discussion about
> the whole dt-bindings is still ongoing we need to make sure that
> whatever we document in the bindings is actually all that we need to
> write the driver.
> 

The whole dt-bindings is still under discussion and revision. The 'mask' 
property will add description next version.

> 
> Best regards,
> Martin

