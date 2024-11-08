Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050BFD5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2ziH+83X5lW9wR0l2rVWZptXU5vWNoli71Kv+R3b1c=; b=bptzysKT6UcKla3p/40yB29afN
	a69m2L+s5F3yYy6DlvInk1WNrNaxQsEyELEeAOVjMm6UlNfNVggxOM4nOrvNoR9YgpzGS7i1EiN92
	QppmOAQpEO4Q0YOW4roXSDVIRUrxTzjYfTg7a3DnpizeYcDY1h47KfeB8QCichnix/nXOZ/qjyfky
	E5dtcHIg21DtOC6XhdLePnm5aY7hn6LHQSwpWdn7V5UvMAfFyigT7xNg1ToO1c8/MKsa4CbX8K57k
	KTYPCYt/ZkwCWIlG5u5eycrekesaVIVsJ3+kM3sTNQKl49eAwX2UZHV+oMD3lHk6VB+cDv0BDfR0E
	UsRzLcKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Jxk-00000009hvg-2lBz;
	Fri, 08 Nov 2024 08:03:24 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Jv9-00000009hZH-34Mu;
	Fri, 08 Nov 2024 08:00:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkMlVwuJV4FeuCd8HY8Fh15+sh1ZX69jGPcDhgHraON4R8AobSM46mRwzNM6jeq5ErJNGAEqeFa1SUkl2U/ZoKIvb2mnrRQ5R6Laa9b2V54wxZtp94Yldx+qqUfjVZuiuOn98pRMqFOAf/sch/qCGEDDITgcfFOg1Ev4iui7lrr2gLSzJrnfXB+OTa/8rdS1xxzz3BB+oEUYzg2v77+n7doARnneZcci+AEgfU17UrmA5llzZp/MDc6iAL3so+0KpsA1hKhyg/6p0Vz/A0x9sGc/pdupTLefVAdJ6dGuTpglk7Fl8mkCuHMy173XIYVswzET+5yFsTR6jsIIhQCAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2ziH+83X5lW9wR0l2rVWZptXU5vWNoli71Kv+R3b1c=;
 b=OY3jvEM+IqmDFzyNxA8W4GGzK2uutXi6IwjTocVETb7Um8QFpdL24TOt/NVszuc8IesWhHDCr6anWdWQ69pIcKkl6HM7mwawVbyi6ABnMTLXC6etRoYY9SpdyhMsROTyz1oM8ufTpKHuCzewthZxvJU8vYI0kkoJgwb9xOLmXO1cDNKB2I2H7kxBGc2gDkNun55chj/DffDUmHpy1y63pWuI9gZnI0VNGf+2iQfR83i/oAbZNbGWYekT1QWXl3xrLLvuHaC3ge/uIOv/vum4E1fu1UtzPZcHcm+2WkqeXwWxghiuzVcQzGoyJ6NWXxWOSwPlBiBACjUpd6UvAyYAQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2ziH+83X5lW9wR0l2rVWZptXU5vWNoli71Kv+R3b1c=;
 b=VtL4tYLncZoDR3mUAL4PmmiHkBfLiatv2f0TyJyyy1Pr5OZkJwdb6fVciegzFsxgMHPMHvebmkCA1G9mNIcDm3ap4+psnrTo0FU0XFqOYpMdUjo/c2nBVtvbLMm5ZsCor4OkH6GdbaFTxdnCvwMLTCEw1I2fYczq/Vu06WDEZFRFM6hi6X3YAUJrAT+HdJXcpmZkLt9Cbwm+dNdRQn7qaa0juQWvCGTogO7P+6gRmTJt8RhZ7guD6toVKvViTDHNXtiMfD0wXQnu4Q6nVU6sJWz5tJ0hn/Td4AZ+AoazjNaIYiRBLGe/0vY3Acm110LM+Hv1IU1EKhW58iR8ub7IYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TY0PR03MB8278.apcprd03.prod.outlook.com (2603:1096:405:15::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 08:00:22 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%7]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 08:00:22 +0000
Message-ID: <07594a59-c999-4592-84b8-4e163d3edba4@amlogic.com>
Date: Fri, 8 Nov 2024 15:59:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: core: refine disable unused clocks
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <1jcykltj7g.fsf@starbuckisacylon.baylibre.com>
 <20241004133953.494445-1-jbrunet@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20241004133953.494445-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0092.apcprd02.prod.outlook.com
 (2603:1096:4:90::32) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TY0PR03MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9e5792-3b26-4659-657a-08dcffcb6529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OE9Lc285QWpkeVZvb2p2VEZlMXQvdTAxeEwzSVdIQkNNV2ZpTE5YcWdmQktV?=
 =?utf-8?B?b1FLVVRaRFRpQ2VZQnNCMUNNOUx3SkRsbEE0bkpoSm5EcDh4aVdtUWtZdUJU?=
 =?utf-8?B?UjRBV3l4K3FoNGhIdFR6MjBacXRKWEkrdk5KdG54Qmo4RDhkTGxFZWhHR0N6?=
 =?utf-8?B?dkg3eWR1QmxCUGQyT3lyL2tqQjJkaTZhUHlTMFQ1U0xGeWxsSXRQbnAzRlhq?=
 =?utf-8?B?aWFPU1JNVEpSVmtKYUtSR01TajZzMDZudkxEdTRhTTZUaEMrVEtjZUJ5c21j?=
 =?utf-8?B?Y0dKZmduNFpoTXhEQk45SVRMNTBGMmRkSG9xQ01NdzBzTUEwSEl5bmtxRFlU?=
 =?utf-8?B?VEZGZTBhUVB6cG8zTDFsaDc4d2c1aW52RmlFejYxNUY1WGNiQnZOODRXMnE3?=
 =?utf-8?B?VzlCWDUrZWxFaUVZM2hxekNGOEV3QXYvRVQyYXJpQjdkNWpvT2RBeU5DdmFQ?=
 =?utf-8?B?OTdZTG92MDFDNXV6MnRTblN1OEgvSGhRR0MwclR5c0UydVl6TWFWbjdWb09N?=
 =?utf-8?B?WWh0YTVRcjk2bDZyRmFURmlqdEMwM3gxOHlQQklOUHl5UzluaCsyU0RsY0dw?=
 =?utf-8?B?dWpPYi9QRnBYd3hITjFvT3VJRyswR0lFclUxMjN5aU5uVFIwcFdXTlZmOGIx?=
 =?utf-8?B?OWFLT2txNXhaN2VwNG1ETWpXZ3RwVGZaYXVrcGM2WnV3bys5bHZnNTY4cFNl?=
 =?utf-8?B?VGh0amtsOFFGVlBjeXg0cVV3OXlkbGwvR2YyNGVDanJPdHBkcWU0U0l5NXJj?=
 =?utf-8?B?NWY3b3BNN2JOcVV1MEhTdTZWV044TlFYd1U0ZXZHTjl0WHFGR1g0c25kWmJW?=
 =?utf-8?B?ay8wTVEweXgzQWxSbDVheHErMGpmQ2o1ZE8zYlhkYnBlZXJWRG8vOEEraWZS?=
 =?utf-8?B?M3ZqSjlXZUZXK3RFNmZybFZ4M2ZiRXFaVStRdnM1WWxQU0Z4d1FxN0NaTFBQ?=
 =?utf-8?B?SDhUcFBYTHhVQmdxVUdiOFBxZmNMZ1FZSnpFbldabWhDakdtc0prTWY2SUNL?=
 =?utf-8?B?TitkejhjRjRLcWhOM3BYMzE4dWZVSjFScXJZSVJBYWVoQWc0RTNxaFIrbEhY?=
 =?utf-8?B?ejRqVmFpb1lUbUxPR2s2dDdlajYzdS91aFFycHA2SnZaYWdOSzRlSG02RkY5?=
 =?utf-8?B?N3BmR05MQkRrK2hSY3N4Tnk1Z3JZT2NaMkROUUJFajJleHViNHphUzZ1bU4x?=
 =?utf-8?B?RDFjYzBmT1lleDB3UFozV3VMUmxXWG4zeHVwSUFDRXZwajlhSlJxRVBQeWFj?=
 =?utf-8?B?Z1Y1V3BOMGl1WkYwemo1QmxtRE1LYWh0RkZ1MC9DT0o4UTdtYlg2OGkyRG5R?=
 =?utf-8?B?Z3VESTRhQ2Z5RmhxMlk1cWE0MWthMWY3YXNUVjJUZmpEUHB3Z1VYTVN3NkRZ?=
 =?utf-8?B?ZzZUTk9PeHk2dEtwSGR0Q1N3dm5nMjNMQ2VnME1yMkJyRC9Qa0lRTXBXK0Ni?=
 =?utf-8?B?b1A3OE9IWG1sSXpjanFic2Fkb3Z3TFNKYzhON0ZEQ3d2VC9yRU9TN0szQmxj?=
 =?utf-8?B?a0w4YlJKbklTWkNhb0VUVjh6OFhDanl3KzZxTGIvWUN2Y0dUa1o4SzBiUFA1?=
 =?utf-8?B?M3pKT2xYRGVBbCs3SFRyZWJQUGdqUzMvaTFpVkM3blY3Rjh3a0pBZzZDcGov?=
 =?utf-8?B?L2dOWnNTQWpnWVFYbzBqZkk1bHBObHBWY3A1V0tnSFhseE82RTRSdTFIMmps?=
 =?utf-8?B?YzM4OVorMkZLRWhuelZ4NzRBN2ovNUZiQm5tMzkwakFwdDF4MmRJUDVHWFI3?=
 =?utf-8?Q?TRRwLn56znMtJyfL2tkk6pabq0FrENgzonR0GA9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG8rd0VDRUJBYXd2SitldGNBNGkzcFVuZk9LVGlYZTV6MTVqaEUwSDQ3Z2FE?=
 =?utf-8?B?WmlXRml5SzhXQW16ME1SU3RLU3BEZnpoRGdISExwcDlFZ20zVHU4MmRUbnlZ?=
 =?utf-8?B?TWw5TUxhVmg4N0ZXdm8xcFJFZjlFdUNzWTBaQ1ZabDYySEhDUXR2bld6R0dX?=
 =?utf-8?B?bTNncnl1SjV0a1htOG5qa1hvQnB3MmdueXl3RnR0OUJOZG0wSmZEUElNazYx?=
 =?utf-8?B?NSswS1NKSlNYNEZHRm56NnovRldBSzdPU08xUnh2UnExM2RMQm5hc1BSM082?=
 =?utf-8?B?T09Tc0c2M0NmTEd0QWsvY2dOSWxRbVU4cG44MFlNYWVTRzhLcTgxVGxudGE1?=
 =?utf-8?B?REhXQ0Zuc2RoY0NjYkhaNnVHUUdJVk9POTc4UVRzWDl5UFU4ZDVIMXIvZy9u?=
 =?utf-8?B?TUhwVHU5V09YRE1iUVhkMjFvVk1vYlhFYUJ4QUtlMjcvRGJJQTJ6SFhkTUha?=
 =?utf-8?B?ZVNRdUhVa3BmUXFUN0FXUFlYS2tyaG1TakI4UWxyOWlwUG1vd1lxTGtxb0k5?=
 =?utf-8?B?UytGc3FyeTVvVGh1c2pKb1NISGluUlM3akdkei9rNXlBOEVQa1F4NU4xYWp6?=
 =?utf-8?B?R1oxdXJYZnJNUUVBdDFYeU84MHlBMTVOWVBzQUkvemFvZmxCME9CUldOYllP?=
 =?utf-8?B?cUs4OXpCOStoTHlYbDR6Zy8yM25oV3haMmxHcmIyVEZhZCt4VGNmSEtidlhC?=
 =?utf-8?B?dnVvdVlMRUxmQ0hheGlEU2JqdXhCTDBWM21tajBkbGRGVHdSZTVnOXlOM3ox?=
 =?utf-8?B?VzBXNzZlZkNUeTQvTWZqQnNuWVJUQzduTE5PSmVhTG9NMUx2U3lEbS83cGFv?=
 =?utf-8?B?dlhDNTh6VW9SZW1kNW5vVGVZcVpWb1BIMS8vSWt1Vmpzb25SZXJ0NHF0TTlv?=
 =?utf-8?B?bWx6cnEyU3paT1Q4bG9JWERQcWhSMWZSeGtHalN5by8wQ1NFVU95K0xTMkJm?=
 =?utf-8?B?dVdtTWxQcUI0NlYxSi84NG04eEdQY2pFam95eVVqckRNTUllbUpGUnRSZlJy?=
 =?utf-8?B?c25nNFV1QkdPM0V4cjNxeHZwb05aUjM1VHd5TGpOY1JvQkF1cGh0a09oU1ls?=
 =?utf-8?B?UjZIbzZTZlByZ1htU2t2OWxRQnZ4REJrellYTU9oTTNMcDdtdVp2SUNQY0N3?=
 =?utf-8?B?L0ZvTG00Z0V3SDJ6M2YzNUdqNGl0M05lakNKc1lpdFJhaUdaejdmMGVaZXF0?=
 =?utf-8?B?Z3BUY3hSaHE0dlljeXhBb2pES0VUS3VMSkpGMjN0Z0tFK1BMVXdwbmQ5bjc4?=
 =?utf-8?B?dlYwaElCMzVYbXdvS0NRNGtaSUprZVZYSVp1dytiU2FvMWpvMmFKT05hZmVD?=
 =?utf-8?B?VjZCTFhaL0MyNWNIY01JWjJvaW1EbWtFRi85RzNOTXFOamhLbDUvZVVGdGFC?=
 =?utf-8?B?NlQ3SllxcUFZalEwc3RsSGEvU2lKY0Evanc5Tmk1aDRTcVYrdStFQmlMVUtN?=
 =?utf-8?B?eDRKbHFPUXBVT1BlUWJld1VlK1h5Skk3YzhGYW8rYlZyTVhkZmRvdEp6NWpn?=
 =?utf-8?B?T0V3Vzh5bWYvRE40WjE3dlJDbm5UNjBJU3J0M0Fxc1ZaeTFJcC9jQnRTVjNY?=
 =?utf-8?B?bkdnRXZkWTdLWTJXK1F5Zklyb2dVN1RsZUtvNGRjVm9KMWZuQS9YNy8vNDlj?=
 =?utf-8?B?SjRwVVMxclVFUUR1djAzK3hxeWt2enJndUlIMlpyUWZRMHc2YkpkVUdjYklI?=
 =?utf-8?B?OHIxZUdVZ3VkNk5haEg1YTIwdjFIUUxGOVdldS9nZjM0TktiWlRpMkhSTUJm?=
 =?utf-8?B?MUpuR0FtMkdYSUp3Vnl3ZytPbzh0aVYxcU9iaTAwZlVhVWJNUENqUm5DY1R6?=
 =?utf-8?B?R3dUc3VnTnYxSjliWHlaandCeWsveGtaU05uZkRyZ3FUMkxCbEtScWl3d05u?=
 =?utf-8?B?bjJNUDZlT3JzbHlBRFZodFpFYW9MZEYzdXloajRLSHVmekNFN1JTTEhXY0dC?=
 =?utf-8?B?ZDh1WDRZZ2ZOSHhwN2lKWmYyNkIyV0hBZFV1VzlROFBGWktDZzE3WXN4R2xa?=
 =?utf-8?B?L1U3M2Foc0dyS0pUcTdTWWhhMXNwUnVOQ0lTYXpURUdBVXY4OGVBbnJNcStr?=
 =?utf-8?B?WWcvc2U4Z2J4S3Y3eDhVandtR25ZMUwxVk5qaDNiS2FZQ0ZwYm1xSTVsWVBQ?=
 =?utf-8?Q?z5uN8yArwd+d3TtvAoyESTjI6?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9e5792-3b26-4659-657a-08dcffcb6529
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 08:00:22.2192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1oiwG3Z5yjhrP7s6/pHOa/7YvBHOjUCuPWtQqJ+jFVlN6sDJDt8ovNCVUFsun43qsSvVGSPkhlVpnOxonQigw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_000043_960632_7B4170DF 
X-CRM114-Status: GOOD (  35.88  )
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

hi Jerome:

     Tranks for your REF. I looked at your patch and there are some 
parts that I don't quite understand: The original intention of 
CLK_OPS_PARENT_ENABLE was to solve the issue of "parents need enable 
_during _gate/ungate, set rate and re-parent" when setting a clock. After setting 
the clock, it can still be disabled. However, from what I see in your 
patch, the handling logic seems more like "parents need _always _ gate 
during clock gate period"?

On 10/4/2024 9:39 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> As it as been pointed out numerous times, flagging a clock with
> CLK_IGNORE_UNUSED does _not_ guarantee that clock left enabled will stay
> on. The clock will get disabled if any enable/disable cycle happens on it
> or its parent clocks.
>
> Because enable/disable cycles will disable unused clocks,
> clk_disable_unused() should not trigger such cycle. Doing so disregard
> the flag if set for any parent clocks. This is problematic with
> CLK_OPS_PARENT_ENABLE handling.
>
> To solve this, and a couple other issues, pass the parent status to the
> child while walking the subtree, and return whether child ignored disable,
> or not.
>
> * Knowing the parent status allows to safely disable clocks with
>    CLK_OPS_PARENT_ENABLE when the parent is enabled. Otherwise it means
>    that, while the clock is not gated it is effectively disabled. Turning on
>    the parents to sanitize the sitation would bring back our initial
>    problem, so just let it sanitize itself when the clock gets used.
>
> * If a clock is not actively used (enabled_count == 0), does not have
>    CLK_IGNORE_UNUSED but the hw enabled all the way to the root clock, and a
>    child ignored the disable, it should ignore the disable too. Doing so
>    avoids disabling what is feading the children. Let the flag trickle down
>    the tree. This has the added benefit to transfer the information to the
>    unprepare path, so we don't unprepare the parent of a clock that ignored
>    a disable.
>
> * An enabled clock must be prepared in CCF but we can't rely solely on
>    counts at clk_disable_unused() stage. Make sure an enabled clock is
>    considered prepared too, even if does not implement the related callback.
>    Also make sure only disabled clocks get unprepared.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>
>   This is sent as an RFC to continue the discussion started by Chuan.
>   It is not meant to be applied as it is.
>
>
>   drivers/clk/clk.c | 92 ++++++++++++++++++++++++++++++-----------------
>   1 file changed, 60 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index d02451f951cf..41c4504a41f1 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -332,17 +332,6 @@ static bool clk_core_is_enabled(struct clk_core *core)
>                  }
>          }
>
> -       /*
> -        * This could be called with the enable lock held, or from atomic
> -        * context. If the parent isn't enabled already, we can't do
> -        * anything here. We can also assume this clock isn't enabled.
> -        */
> -       if ((core->flags & CLK_OPS_PARENT_ENABLE) && core->parent)

This judgment of CLK_OPS_PARENT_ENABLE seems redundant. According to
normal logic, if the parent is disabled, its children will also be
forced to disable. This seems unrelated to whether CLK_OPS_PARENT_ENABLE
is configured.😳

> -               if (!clk_core_is_enabled(core->parent)) {
> -                       ret = false;
> -                       goto done;
> -               }
> -
>          ret = core->ops->is_enabled(core->hw);
>   done:
>          if (core->rpm_enabled)
> @@ -1454,22 +1443,39 @@ static void clk_core_disable_unprepare(struct clk_core *core)
>          clk_core_unprepare_lock(core);
>   }
>
> -static void __init clk_unprepare_unused_subtree(struct clk_core *core)
> +static bool __init clk_unprepare_unused_subtree(struct clk_core *core,
> +                                               bool parent_prepared)
>   {
>          struct clk_core *child;
> +       bool prepared;
>
>          lockdep_assert_held(&prepare_lock);
>
> +       /*
> +        * Relying on count is not possible at this stage, so consider
> +        * prepared an enabled clock, in case only .is_enabled() is
> +        * implemented
> +        */
> +       if (parent_prepared)
> +               prepared = (clk_core_is_prepared(core) ||
> +                           clk_core_is_enabled(core));
> +       else
> +               prepared = false;
> +
>          hlist_for_each_entry(child, &core->children, child_node)
> -               clk_unprepare_unused_subtree(child);
> +               if (clk_unprepare_unused_subtree(child, prepared) &&
> +                   prepared && !core->prepare_count)
> +                       core->flags |= CLK_IGNORE_UNUSED;
>
> -       if (core->prepare_count)
> -               return;
> +       if (core->flags & CLK_IGNORE_UNUSED || core->prepare_count)
> +               goto out;
>
> -       if (core->flags & CLK_IGNORE_UNUSED)
> -               return;
> +       if (!parent_prepared && (core->flags & CLK_OPS_PARENT_ENABLE))
> +               goto out;
>
> -       if (clk_core_is_prepared(core)) {
> +       /* Do not unprepare an enabled clock */
> +       if (clk_core_is_prepared(core) &&
> +           !clk_core_is_enabled(core)) {
>                  trace_clk_unprepare(core);
>                  if (core->ops->unprepare_unused)
>                          core->ops->unprepare_unused(core->hw);
> @@ -1477,27 +1483,50 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
>                          core->ops->unprepare(core->hw);
>                  trace_clk_unprepare_complete(core);
>          }
> +
> +out:
> +       return (core->flags & CLK_IGNORE_UNUSED) && prepared;
>   }
>
> -static void __init clk_disable_unused_subtree(struct clk_core *core)
> +static bool __init clk_disable_unused_subtree(struct clk_core *core,
> +                                             bool parent_enabled)
>   {
>          struct clk_core *child;
>          unsigned long flags;
> +       bool enabled;
>
>          lockdep_assert_held(&prepare_lock);
>
> -       hlist_for_each_entry(child, &core->children, child_node)
> -               clk_disable_unused_subtree(child);
> +       flags = clk_enable_lock();
>
> -       if (core->flags & CLK_OPS_PARENT_ENABLE)
> -               clk_core_prepare_enable(core->parent);
> +       /* Check if the clock is enabled from root to this clock */
> +       if (parent_enabled)
> +               enabled = clk_core_is_enabled(core);
> +       else
> +               enabled = false;
>
> -       flags = clk_enable_lock();
> +       hlist_for_each_entry(child, &core->children, child_node)
> +               /*
> +                * If any child ignored disable, this clock should too,
> +                * unless there is, valid reason for the clock to be enabled
> +                */
> +               if (clk_disable_unused_subtree(child, enabled) &&
> +                   enabled && !core->enable_count)
> +                       core->flags |= CLK_IGNORE_UNUSED;
>
> -       if (core->enable_count)
> +       if (core->flags & CLK_IGNORE_UNUSED || core->enable_count)
>                  goto unlock_out;
>
> -       if (core->flags & CLK_IGNORE_UNUSED)
> +       /*
> +        * If the parent is disabled but the gate is open, we should sanitize
> +        * the situation. This will avoid an unexpected enable of the clock as
> +        * soon as the parent is enabled, without control of CCF.
> +        *
> +        * Doing so is not possible with a CLK_OPS_PARENT_ENABLE clock without
> +        * forcefully enabling a whole part of the subtree.  Just let the
> +        * situation resolve it self on the first enable of the clock
> +        */
> +       if (!parent_enabled && (core->flags & CLK_OPS_PARENT_ENABLE))
>                  goto unlock_out;
>
>          /*
> @@ -1516,8 +1545,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
>
>   unlock_out:
>          clk_enable_unlock(flags);
> -       if (core->flags & CLK_OPS_PARENT_ENABLE)
> -               clk_core_disable_unprepare(core->parent);
> +       return (core->flags & CLK_IGNORE_UNUSED) && enabled;
>   }
>
>   static bool clk_ignore_unused __initdata;
> @@ -1550,16 +1578,16 @@ static int __init clk_disable_unused(void)
>          clk_prepare_lock();
>
>          hlist_for_each_entry(core, &clk_root_list, child_node)
> -               clk_disable_unused_subtree(core);
> +               clk_disable_unused_subtree(core, true);
>
>          hlist_for_each_entry(core, &clk_orphan_list, child_node)
> -               clk_disable_unused_subtree(core);
> +               clk_disable_unused_subtree(core, true);
>
>          hlist_for_each_entry(core, &clk_root_list, child_node)
> -               clk_unprepare_unused_subtree(core);
> +               clk_unprepare_unused_subtree(core, true);
>
>          hlist_for_each_entry(core, &clk_orphan_list, child_node)
> -               clk_unprepare_unused_subtree(core);
> +               clk_unprepare_unused_subtree(core, true);
>
>          clk_prepare_unlock();
>
> --
> 2.45.2
>

