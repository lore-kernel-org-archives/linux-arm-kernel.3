Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28751CF2562
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 23:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foXjMln8BX2MC2kFAVcgdO6kKqZuaACXceZeraeAQV0=; b=oMEtAM4x6+boUw7GN83IliUchK
	/Fk4aHYFSGmHh5x26ahsXw8DQir0hHpoyAq1OjhZoPhr6TVIu9KryCTZ+3fWgki/IolypxorMHqrU
	uJCml0XpeqjLj9yxSx8kR12epQpduNLZ5yW9pVyWlvNkUXhLkww19JNYpN41HLYOYXvG2slYBDMHn
	HG5cq/dgeXifcCN5VmtC8N7T9WoSSxuDaDF2X/UwFX/oXI6hOGN5ocHg9hMiIf3YIcBXck0Y1c3dn
	UiojQJBrN2TSqJw8TSUYeKGObYKHODoFyqPD6ACbeU367iNcWb5jqCykVy98Y4a24aPZRm8MCijMB
	bn6OJpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVDv-00000001F71-2yDo;
	Tue, 18 Nov 2025 23:34:59 +0000
Received: from mail-southcentralusazon11022116.outbound.protection.outlook.com ([40.93.195.116] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLVDq-00000001F65-4BVa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 23:34:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZwTDSVd56Q5W7TyiNu+YyQb+ugpmIT5cSLDrjC0cnF27EdCwUqWg/T5+omc3fx22N0NJdE6lYLe2+TQLfUXUM4AWyHs7O79S4OYPgHK/mtjpx6RUbdXCQDOeMKo7R3oW5ooFS5r3W3X8Ip9l5V5mpXxXwy10v8iAmFb1pDFR1MlrK+9shLSbCWF3YfRONTDypoXx06B0535OydTt4PZ8i5IIiKXPtuwrZZcZUn/6vRTKrSIUh2gbt/sexCsjuhlPFvHK1HQAlk7pDhtms5yNeE5ltNh18T83v6Bmh8wmS3V3gdxfp/T8cCiOj9/A1mfNGNmkXZbzJIID5IjnVB9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foXjMln8BX2MC2kFAVcgdO6kKqZuaACXceZeraeAQV0=;
 b=GSRYnwM5yKu3UpvsUz4dxCnAWkDPLDSHXsfDcc/Nykouu79wL3Gp3SX4Rdvm7Oi6USbulsaO763055CPupRefgv6DQqBH5WwtjZe7w+4DA/RIT8xrPmmWgQOX8SqVKv/gQwZnLq6dAZiOtTtujA/XicwQd+KqMlq7WFwB4DH/Ntu4krsm5b0hKS7ITNn8LfURNtWK6wE7R7ZiEIS9wNAAUgcg7yuo6RGsIogFkUwDofJySv30tC1FZ5AT35b3a8NAGQVNxRUGZkTggAFsndSUSu/benN1ox69yEFfpf2x3Am7K/sx07DRMPXEeHPaRdocPw6Q4UQz2ueg4LX9ccMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foXjMln8BX2MC2kFAVcgdO6kKqZuaACXceZeraeAQV0=;
 b=h1JvqwCsWhC7rWq2VXjlv9B32EHjjvdqjmsGelyXSaQUjLzP87jcGt1aACGA0Uago8mjiWMecD5BmuPl+XsV2XgSBUJGoOhPoU533tflk1Ps5FbXIP81lYNAvu7zmO0b84XUEX8uKUeCZ2EIjdDudhnSBT6Xev5giZvuOvLx+Ps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV9PR01MB994200.prod.exchangelabs.com (2603:10b6:408:377::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Tue, 18 Nov 2025 23:34:50 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 23:34:49 +0000
Message-ID: <d52fb90a-0d30-49de-8d4e-86141f5ce297@os.amperecomputing.com>
Date: Tue, 18 Nov 2025 15:34:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] arm64: mm: make linear mapping permission update more
 robust for patial range
To: Nathan Chancellor <nathan@kernel.org>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, cl@gentwo.org,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251023204428.477531-1-yang@os.amperecomputing.com>
 <20251118164115.GA3977565@ax162>
 <7147bd7c-f4b2-4757-96f5-d9b61405ec91@os.amperecomputing.com>
 <20251118230750.GA1451312@ax162>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <20251118230750.GA1451312@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR19CA0087.namprd19.prod.outlook.com
 (2603:10b6:930:83::8) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV9PR01MB994200:EE_
X-MS-Office365-Filtering-Correlation-Id: da8573c1-2dc4-4a1c-5b36-08de26fb1108
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnM3QXpINkhxMExHb0xYdWt1bWlmVDNNZ2RqaHMzdFU2dmpmQTZpdkVaRHhY?=
 =?utf-8?B?bTM1cFFnQlVkUW1QS1ZJcGRzcHQ1b3dqVURia3lnZEdjdmxFbnMvYjhyMTNB?=
 =?utf-8?B?ZnV5TXBZeVlWMkZrWHp0OHNmS000eVovaEZKMGY0alp4VFlGWEpWTUtYVlVK?=
 =?utf-8?B?c3RmbnNWZW9seHRpN016TFFtUGlHRnNDcmdUZ3VoOGc1YlJsRjZ6VzRSNGM4?=
 =?utf-8?B?YjBGakJkZWNiTWRJeFpaQXpOV0ZSczk0LzQyWWJTSFJvSkRQcmtzQUNkakkw?=
 =?utf-8?B?MnVXZVFpWEJZblgwYko4VXBKUUxLUGpQdzQ2bExBWVJGTElLbkdtZjdyQXZV?=
 =?utf-8?B?OTNoNzBBZUxIYjY4RTRVSjJtWlhYdUpJTWVjTVNpSktLWFZraXJnWDF1QUFs?=
 =?utf-8?B?a1hTaE9VcTNQd0hLOU9VanRtNWh6c0VWWHFwTitFa0h4QXJsaURhRWZIT2l6?=
 =?utf-8?B?R1pEMzlkM21TUGQ0dUN0bnQ3SU9waWlMWkNja25YbmhweEFwWDg4bXNzMEVN?=
 =?utf-8?B?WHlyOTBaQlFQMElZeitHd1RWcGVtNGYzMTh6Y252aFBzQm1vVTJVV0ZsbHow?=
 =?utf-8?B?WllHTjNRZXh4Y1lBUTZPYU5KL1FXRDNEK3VpaDRJNzZieExCb21kc045M1Jm?=
 =?utf-8?B?L0tQT1BJanJOZm1mRUZVSWhTQzJjVkVpT0VXNHhDZnlDTVJuWCtmTGxDekpZ?=
 =?utf-8?B?MkJ6b1JpeHNEUnE3d1lkU0czS0t4ajUzOFFJVVYraS9FNDVMYTg5bTRUTGVG?=
 =?utf-8?B?NnB0bFRZMTlVR0xZMmhhbERaWUdNWmpJb214aEsrL0FsU0x4ckFlN2tmYzhp?=
 =?utf-8?B?bXFNR0oyZHlDVzladDVaZ1RYeUlYRW5WSDUwaGFHOVVKUVdrZ2JwNEpIMDl2?=
 =?utf-8?B?aDBkeEk3ZTRJVHlEazQ4dUdleFhPd1dVdkVBMmVOL3R6TkIxd21XVkZCaVky?=
 =?utf-8?B?NzEyL040amY2b1RYNzJjMkwyZHRpNG1XT2ZqcGsrKzIrNW5xcFNOcGdBeHRC?=
 =?utf-8?B?Q2dWL3JtaklUN3NCU0IvMk9KOGtISjlIRno3b0hFOEdpeFc4SWRFVHJBdnVk?=
 =?utf-8?B?czlEV1VLd1l3N1FVdlZHS2pFOENXQllhRW02ZmZVYk5CTkFkbGpYdlZ0bUtD?=
 =?utf-8?B?azZMcVpsanRGVjF2Y1h6dE00bXBKNnVZSWkyY3d1dkJTQnIrZlpjeE84RGgv?=
 =?utf-8?B?bmRCRExEUFlaL1F3VmhSemxjZjNGd295VGMzR1Rhb1UvM09DaFNHREZKTGZu?=
 =?utf-8?B?eStqYlpqZG9LZzJ5aW9LaEpyZWd6Z0lMUmsrMnRhMVJmZVRUMzJ6WG5JZGxu?=
 =?utf-8?B?TnV1U1NlekVkSW43aEJVK0JMK3pLaFlQMVVDcTh5OGN6Ri9oUlJqRFlib01Z?=
 =?utf-8?B?MGpOUTRiOVpOVUxkMjdwWXNKZS80VW9PUVg5VzJnVncxOUZuQlc3SjVyc2F2?=
 =?utf-8?B?UGRPem9YWElwUlJzRGRaSVJOMDF3TTFsdDFCR0xSQnRjcFM4THdVa2JEQ2dJ?=
 =?utf-8?B?NUwxM1hyc0Y3QkRPakZjM3h1dHo2OTlyZXAwSmRhS1ZQalRuS0xON3JrelM2?=
 =?utf-8?B?dWtVQk5IdWwzSFJTaVVJRVBtaGpaWGJqTllJVmVjUms1NWQ3MXZxVmxKTkdL?=
 =?utf-8?B?YjRYZDQ2U1lpSW5SSVNwNi9TUFY5d2tVd3ZwMWRaZ2R4dklzK1luT0sva216?=
 =?utf-8?B?WE9VT0l1OS96UVordHpCcno1WDl0ZVd3bktydE9ya2JuVk5TVVd6TjcvMjds?=
 =?utf-8?B?STgvcm1PYTFoOXhSVkg1cUZyZ3Via0pVb29CU3Z4OUJqSW5iVWNmVzhuZW5U?=
 =?utf-8?B?cWtMUDRIQVZMeU42WnRXTDg1UFhZcEpPTkxxQVJ1SWRhWjhqbDlsRUNrcFpT?=
 =?utf-8?B?UzlKWE1YSWVwcUVvamZBZU4wbXcva2ZFRW9KK0RUUlpQb0k0Ujd2U3Z1aEdW?=
 =?utf-8?Q?SrUW/GfmdQVb7xqj9ZXSLjN0ZF9aOpsD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0JDemFpMzFQZW9RdU1KNEp5L29TSDg4S2hudGp6T09QcFlQYU52dmlYUVhB?=
 =?utf-8?B?anhVdHRGZWg3bnNwSHNyREl4czN5MG42VGNhanJWeHFqMlZGSDBocFQ1Z1lJ?=
 =?utf-8?B?QnJyTFo3bVZUQVo0c1phNXZoY2syVHhmOTdiM294Ly8rM25mMDQ2ZDJtN1JE?=
 =?utf-8?B?QjFaNllLOVZMK2QwMVJVcTRnZlZ2NER5SDNFU0FSdXF4emN4ci9VOHpkR2hz?=
 =?utf-8?B?Q2Z6UlpQeGF4a2g1Sm5NazBQelFxMk0yZ1Q2cGhkRXZsR0VUTHd1YW1pUmRI?=
 =?utf-8?B?QXAyVm1TWVVTaHVSVkpMRjVoY3MxcGZWSVNDRFU1TWw0R25sSjZpUEQzYmtw?=
 =?utf-8?B?SDI4WmQ0eU4zQnloaGRPbGVjOC9yOGFRaWFKbVVCOVdsbmdhSFo1aFRxU1Mr?=
 =?utf-8?B?U3Z0M1J2YTR5VDFvSFN3eHhTODEwY25uTERtTFlSdEpwL0szR2loWVhsdlZw?=
 =?utf-8?B?RjQ2WllGMTNMNnNpaFFrUnJ6UEF6a3ZTT1pGaGhsOXc1aVN1b2RLVisraVRq?=
 =?utf-8?B?L2ljRFZyZllISE01WUVmREQyR0QvaGp4VGZTYlJqRVNNZHNTR0ZoU1RoMnFV?=
 =?utf-8?B?VEg0SGRPYUh3TWtOaHdDZUFmaGt2SGtHUzVNQ0dLdVFqczYxUnYzQklTY3I1?=
 =?utf-8?B?S1A0UlV0dVBoSC9qaTJEUEdUYjVOcXJlekJ1QUZTM2U5bFBnc3IxdVZPM1NG?=
 =?utf-8?B?NGNyeldJVUVFTnkrUnFQTmptZ1dDNDc3cG55YnRFZEZnZkdKUVpvMFh1ZnhJ?=
 =?utf-8?B?SVVlU1pGeEFGYW9ZNitXQUM2K0tkZHZNR3grRVpoaS9DQWg2VjBtRENlMmky?=
 =?utf-8?B?eFp2Nkd2S0pBZklKbG45bk43ZElEY29Rb3pxNkR3c2NVQ1psSERIMEQxOXFm?=
 =?utf-8?B?ZFFjem10Y1FTQTU1ZGY5OTlTdEpIWnpCNjN3ZjFHWXRtUkxKcXNNdXVHTDlz?=
 =?utf-8?B?Z0FmUFNIYW4yNGlqTnZ3NHhEUDEweDFLYTJRUGVsTHJDdkVlbU9YdVgxcjJB?=
 =?utf-8?B?OWZTaDU2ZnBzcGkrQk93SmU1OTNvYnNvTmtHZVJ6cE1MQ0QwSitUdzFCbHhz?=
 =?utf-8?B?ZUozRFlCbkR0SHRpM1NuQUNLUmZza0ZsOHh4UDNqWUF4eXNldU80Vk45Ry9k?=
 =?utf-8?B?UW11b3M3RnNvMXViQlZIMEt6cEx0bW9vSXJWVWhLMDdFdlphUGxiNHRjTXFh?=
 =?utf-8?B?YlgvUXB6YTNMQXp2eXF1R3E4WlQyQkZ6UEwwRFdCUFZJSTJOZ244Z1RHQzNj?=
 =?utf-8?B?MkZnQ00yeXlhVU9sUGRlYSsrK3ZtZ2VKNmVXdlN5a2E5REhDSFN1T2lXamdQ?=
 =?utf-8?B?OGVyYWV2em5JcjBHa1NFWUVjZzA1QnlZb01BSW5mUC9Bcnh5R2luVzdReUhR?=
 =?utf-8?B?WFhzTWR4L2RBZzk1MTErbUhaUGlDNTk0T1RiYUpLSEVXa2E5UlF3SjQ3QUlL?=
 =?utf-8?B?MUgvM28yWEJkUmh0MXNjaU1pNHR3TDRvUlhlZEdWa3Q4cm5qd3l0UmJOMytv?=
 =?utf-8?B?YXR5SzNlVG03d2d2Nm95aHIzR2JxVGtUNUx2cXgyQnpYQ2tESnNobHk0Wm45?=
 =?utf-8?B?RXpjTkUwa1g3ZnZoZXYrVUUrZ1pNRTFuWXlWbkV2TGNCQlVXbVRhQXhuZnpD?=
 =?utf-8?B?ZjVjTXZOZ0hKU0UzbFdNZ0phd0FnV3pCbG5kUDFTTG50ZU80amRLRTdRR1B2?=
 =?utf-8?B?bTQ4MVM4UXZRdWkzZ29OcWhMck0vRHcwL09xcjlpMVlnOXdyeGpNc01xZ0Fw?=
 =?utf-8?B?RllFbVdFVVIxZjAya0lmc0FxYUdKZXFhQjRtMHNSd3lKSDhSa0hqU1dqOE5k?=
 =?utf-8?B?YkVKMlRTSS94SmxycXBrL1UxbGN4RkQycDByMXR5N0xNVG15cjROTHV6Vml5?=
 =?utf-8?B?RHl4THBGQkp1UXA5UjlEQTQ0cmd1Nzd2eS9zSmwrcXd4cU4reGtGdTZyQ1ls?=
 =?utf-8?B?RUZ6TWg2YUw2a25XdnF1UHhGMWw0Mk82NzJ3cFcrY0IwODZ4VTEwdUlEaTF0?=
 =?utf-8?B?Y3BwbFBIQW9DTEg0a1hRME1uekRObndiVC9HZUdRb2p2eHV5VENFVEJMRE1I?=
 =?utf-8?B?S1dTYUR1NHF1NVBHSkhKR2VMMEJNL3g4YnZFVUNyWWhqQXV3UGZXVitKaUxO?=
 =?utf-8?B?RWFkNU9sTVVPa0pVYW93eXJGSnlxNnpvUHlCRS9ONEhNem16Z1VNcUpoK2hG?=
 =?utf-8?Q?LWuqp+gBeVbcTS4HFUzCytI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8573c1-2dc4-4a1c-5b36-08de26fb1108
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 23:34:49.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2AuDVwuvZLpQ5eHyDxvENk0ompPRhBqhvvvBVACs2YeYay5a8U1/RNwyXvh8i+sJ2M13nEs5WntqSiGzKwWv+unPDU48zLFaJiDa/i+Iwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR01MB994200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_153455_053593_49B6F659 
X-CRM114-Status: GOOD (  13.14  )
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



On 11/18/25 3:07 PM, Nathan Chancellor wrote:
> On Tue, Nov 18, 2025 at 09:35:08AM -0800, Yang Shi wrote:
>> Thanks for reporting this problem. It looks like I forgot to use untagged
>> address when calculating idx.
>>
>> Can you please try the below patch?
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 08ac96b9f846..0f6417e3f9f1 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -183,7 +183,7 @@ static int change_memory_common(unsigned long addr, int
>> numpages,
>>           */
>>          if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>>                              pgprot_val(clear_mask) == PTE_RDONLY)) {
>> -               unsigned long idx = (start - (unsigned long)area->addr) >>
>> PAGE_SHIFT;
>> +               unsigned long idx = (start - (unsigned
>> long)kasan_reset_tag(area->addr)) >> PAGE_SHIFT;
>>                  for (; numpages; idx++, numpages--) {
>> __change_memory_common((u64)page_address(area->pages[idx]),
>>                                                 PAGE_SIZE, set_mask,
>> clear_mask);
> Yes, that appears to resolve the issue for me, thanks for the quick fix!
>
> If a formal tag helps:
>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Thank you. I will prepare a formal patch soon.

Yang

>
> Cheers,
> Nathan


