Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D0FC02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 15:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU74qvFBviMMkX2KxoIvVvMK64ghR23Y16egs2p1QAc=; b=lz3BXoOv43uJVVhyfrbIg8F2in
	lh9BCo92ZS7f5MM1jT6bVWTjl+hPaRnc6W9y5NyLhtEPGFz+pNtVQmZxhe506xGFDW0XnphY+RR+h
	gIafUDJqN7wHY75r3SNbFOOgwK6YOVb2j67WEbUZI/+IXdvNEAf8+ON0DsTPaZtEEincm9oFZJsUo
	jY2FKw7OqR6qLHoWB6GdJlUj9TP7sfNopklUk6qpesPai21wyucCeQMpaN/7GDqWhnmkrCNH/Mavg
	l3Bbmi2vdW5Mn51t8hrK0rnpyycA85bm+Iva/pYrlZ7APQNuFDBKwO6aXQBACLLzlnXX5d5VkUqQp
	Q63fvvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tacqE-0000000Aaqo-1pXJ;
	Wed, 22 Jan 2025 15:40:30 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tacoG-0000000AaWV-1axe;
	Wed, 22 Jan 2025 15:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1bLSXVNkrL3xD7ScmvCb96Hdp7HB/tDdg9fWJ1eX77PUTnUdzR9r4RUpMMEP/FZVM0NmiKRtTT6SvdICwI+GssaPSGWXa1XTRHK0AUvA36QqesIJadwmiiO3PwjsQ12AY5zYuxUvIi0742TwPyusHgUn8wX0tRnRb0I5M6aj3niwlWVxw+F8D1V83+EjdnjIfeBvsKaWsDTeRqAHH2oeqBahLC5SettgIeQu2UJouSock/CRFEW59IXCaMZvl87DwlHGwJuHky6JS/xYnQWmEVg7szEnyTGPl1+9nsk7XdfU+z8ml1aj7ypVD+4oa6d5xUPK5yPdN+4oKvMha8+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jU74qvFBviMMkX2KxoIvVvMK64ghR23Y16egs2p1QAc=;
 b=MvaHwwnzfnYeVHxRBbgXx67kpkWlCKUWoC6b6NEuE8eCB5+MTPi4PSYAu2+Rsq+XnHKTcW4WYSZo6w3+poJ9cmrE6FZETro/c6XPscv0mluEvPbzET2geo4IB0wHOeSJuiBShQ8vP8J68cvJ4tGOKzufMRIJjXVyM2xSVVd1AiqjIaFguKYCi7ASYA2uFsCrgiPomc3zyjcLnQ4IRXe1salc2LGuZze7koAPLwjiCWZXGNEeGfiagdY75dvHpaS0rORvM8Ig0lsEvufoaGWiITlkvu6IqKmgkW1enVusG0hpz8rN/MQQAKP+Ef9vKuGGDjYvf3475XS5EnLe1h5bOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jU74qvFBviMMkX2KxoIvVvMK64ghR23Y16egs2p1QAc=;
 b=e6neBgjGGE9QxxWi/wkSxxqkdxxWdyttELeGTmtVVh/ObMMIMV5YjaIW3WzvCgGdz8Y6t8sTIbsvePFTvOEh96URRUM7yhcE1bQbOKcvphaiPQPjfXCShB1xw844YFiadpytyR6kkZIN3lrNWyUYssEzsMv0XZ6rDgN7ioMtICw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PR3PR04MB7260.eurprd04.prod.outlook.com (2603:10a6:102:8c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 15:38:18 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 15:38:18 +0000
Message-ID: <6dd64754-fe72-4288-9724-b3cdaf193b3b@cherry.de>
Date: Wed, 22 Jan 2025 16:38:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar + add overlay tests
To: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0045.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::34) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PR3PR04MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd610fd-6470-4858-2b5e-08dd3afacb26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDYyUXRUQUt5NW82cnhKYnRqdlJmcHA5QjV2U1hMbGE1QmF2dmRubmRGeVVG?=
 =?utf-8?B?OWlOMDlMZEZSbm5lNW5vSmEwY2lzY1U0d1lkZjdlb1RoUy9TUjNuelNDLzlo?=
 =?utf-8?B?TG5tZjNteHE3UkRWUGM0SUpsakJkM1R5VkxFWE00MmVYUzMwOU81QVRTQkRZ?=
 =?utf-8?B?UHdKRXk3RWIrVG9zaTNrVXliVXhHVVFhd0NFUXo3TjN0K050TWhyTDlwSGpS?=
 =?utf-8?B?d08vdURBU3FOdjI3ditVUHVvWlNNTlFnb3grZ0xrSDJiUHZFZ1JIYjJQcXI2?=
 =?utf-8?B?YUFQdlJLVm1XUGNVUEg0Sk1DcXE4QklnVExSWENUeVRzUXRvUEEzVUpEd0R4?=
 =?utf-8?B?L2V3VWxmSENHMGFYWXYzeEc2cXlJZC9TWXU1QWlwTG0zei9ycnk1NFNLdHho?=
 =?utf-8?B?TnJwVHVLdUFici9vSDdEZGJ3RU5JUkxtakxUNVZ3N0NKcWNhRnJSd2RZY1g2?=
 =?utf-8?B?MW91cExGYy9xZEs3LzNnMFJRaVZ6c29kdm1hTjhxcytta0dzcUlqNWw5cXZz?=
 =?utf-8?B?Tm1iMWZKM1pXS29pYkZGamxDSFFodmJJUW9vdkJpM1RZRC9UUUhVTy9xOXlp?=
 =?utf-8?B?clJlS3E0THVGYUkzNTEvZUpBbkFXR3BOT3U1Z2FCZE10NVBPRFVyb1l3NE9C?=
 =?utf-8?B?OHNKOStSV0NTRWdrWGdoRXRqS2dUNmhlUU9NMmhrY1dhZC93QVYvTW1nT21l?=
 =?utf-8?B?bW9yL1lLZ0ttYnYyUlZjb2JaOHN5QXdVOVQvd2RRL1RuSXlldGhrMTZrdENB?=
 =?utf-8?B?ck9lNHQ0UW41MFArcjBYSGhzVm5BOUxjelBSMFg3emhpa2czZWQrVmw5UXRZ?=
 =?utf-8?B?OUJoeis4a2o4c2tyd2N3WGpDd1ZXb2ltWU4ydXZ5ditIM1pDbEx2czN5YzlM?=
 =?utf-8?B?UEV1KzV4RUFtVEdTeWlJV09GTmU5VjUyV3BIQ09jYmNjc293KzA3MjBTc05t?=
 =?utf-8?B?cndnK2FrNHFMSDh4RGVXSWx5WmZ5UXF3MkhydEY4Y1VWSmc4NEt3Z3pKOXJH?=
 =?utf-8?B?NEtjWW1CMTZkZ0I5TmFWdTZBMFRIQTR1bVQ1Sk5xRDBTRjJRbzBVNnNpRjNN?=
 =?utf-8?B?Z1ZVNWxJTEF2THdzZ0dVNm1MOGtnMzJuWlVLa0ZoS3RXRFBzZVdHTlBDUnl1?=
 =?utf-8?B?VENCZnRzanZEcDZKck5JMDB1MUF2SGpTYTVKbHgyZ3pZWHphYmFaZHcxVFBQ?=
 =?utf-8?B?a2theFlEMmVwZVV0Zm5za0oybmhFL29OZnJ1WUY0K0FwUGRTVWU4Ym9rUm15?=
 =?utf-8?B?dWw4M25XakwvUE44Z0pHMUNmQWxBZjVYRUFNUXV4MFJCc1R6Q0pZUEtYbk1B?=
 =?utf-8?B?TEU1aWk5dkxDMy91eGw4QU8vUVMvdGk1NHU5SXVIVUZWREx4Q1BOVUlnZ1VH?=
 =?utf-8?B?RmYvS2M5czlZSjF3eUoyUHVyUFptRm5iTWJXVDFCcGNwUmk2TEhLTXZGcGpH?=
 =?utf-8?B?bEUwMGJaT1JIaUtITEhpTCt6dGszbDZpWk9WN3JkVDgwdDEyUERIN2dlUDBS?=
 =?utf-8?B?RjVENTJ0Z0xxTEtFSjZ1VGVGQVFndmVoMno3aTJFd1B4YTVnczVxcUM5NXRI?=
 =?utf-8?B?MktxWnRUNVlaSnVTVHlqQlBYY1pLVlhSM2JDQWdLL1ZhQmlYL2wyd2l2NTZm?=
 =?utf-8?B?QVVHS0x3MWRDcGFmZFZENUZFTkR4Q1liaElWS21mRzhuQnJtMGxjaE5nMjdE?=
 =?utf-8?B?Qjh2N0UxOGNzdDNpOU9kbFpxYVdISW5CYnUwY0ZDb1gvWlpwSW1HNk0vdTcw?=
 =?utf-8?B?dXpFdXRFNXg5eFY2Tk93NnFIc3hDdTZPSFpFSmtnU2VZNFNMTG0zMjBQa09n?=
 =?utf-8?B?VzVqK3V4dFN5aklOdjFhZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0Q0NDJIMFlYeDZhSmNWbldNdDRUajFBODViVzVLS04vbDJSZGVZMkkyNDN3?=
 =?utf-8?B?dUNEcXhFVnZyR2lWWFJqUCs1Y1Z5KzFuRkk2TzZuOWZjenV3VC83SVNkWmNE?=
 =?utf-8?B?VTByV1ppeEZWYXJubmxjMS9ZOHdrNEV1bnU3enJsM0hCdm1EYWdCdUNONmdo?=
 =?utf-8?B?bnVVMzhJWGxJSzBnV1JSQUtNTHdmbURoQkYvdU91R1MyVVpNYjlPMWxPODdX?=
 =?utf-8?B?NUgzWmVGdmpFZTloenk5YkRlK21MZ2IrSHR0emJkbUF5Y2ZqMHNMNjhFOGFs?=
 =?utf-8?B?S0J0dUJvWXhpZVczNmQvRkZjY094WHdVTitQUU1rWVUwcSthcDB6ZWRQbTd1?=
 =?utf-8?B?S1NDL0hXRng2YjFvOG9HbU51OFpnMEVyZCtVeitzd3NPeGd6ZHY1MGd5dGpL?=
 =?utf-8?B?emxYK2MzNjM0OHBwSSs2NWlQL29vQUxNSVdaSThtaEpHZWpZaXlhR3dFSnAv?=
 =?utf-8?B?N3RIMFVYQlJLMmZtL2svRlBLRkhocXZQN0JOdi9qSDdUY2t3WGZQVTB5ckwv?=
 =?utf-8?B?cWJjUGRQZ1E4UUZHQzRsTzBFZjRKYzNveUljdjdlRjBGSFl0Q21OdHlZVVJz?=
 =?utf-8?B?Ly81VFkvTjUyMkljSnVqeGhWclZ5cUxPQjUrMnllWldZMGswZFViUG5ZS0kz?=
 =?utf-8?B?MmVrcmhybmxUREtMMUtsdldpNlJPelpJODBIRXdtRW9PV1o5R2VNQWgzUGpl?=
 =?utf-8?B?bVZKNk0xSExidFNsWXZjMHplbUhYUmtJS3h4Z0pUVXAxOXk0ODA3dlovTkp0?=
 =?utf-8?B?RStMVjlkS05kcHJma3BhbFluYlUvZllQRDFhTmRSZnh2aWVlZWxQdUNMZi94?=
 =?utf-8?B?SXk5ZFU2K1VCMzdsRFNHNTRsK3FlcFBWOVVPakVPck5iVjlyczVuZEdhOTdC?=
 =?utf-8?B?dG5NYldNcmo0RndhckU5VFQ0c2lXM0tOQWk3N05lb1NYZ01PSlVZYnNPUmdt?=
 =?utf-8?B?VFJsMkdSQmtlL1ZJd1JXVlI1NGlyRUhNZTJGZ3ovdy90cktCdk40NTZNSURQ?=
 =?utf-8?B?YkNJdnZ0SXRFQlQweHpUYm92Z2RWZFVkUkFndWZ4WHkydDcrWjNNcHFSRHgy?=
 =?utf-8?B?OWpVTG5EeUhCc2QyWHZBT0FjbFpxVm5zVEN6SXhOdVpNckRUb1lOQjN3cStE?=
 =?utf-8?B?ZFJCN205TC9OcWJtelF6SVV5eWd1aVhyNjA5TlZXbjcrSmJCRmJMbVBleEpT?=
 =?utf-8?B?Tm9zYldqeTFzZk13ZnRsWGFBQmdkWWp5aHRYM2FvVEJsd0NBVG91RnRDZnN5?=
 =?utf-8?B?K2VnZzk4bUoxWmlIdlREUi93UHBvMmoxMXhjK0RveHZZQnV5NDdSTFVkYmZY?=
 =?utf-8?B?TmZvckhURWlXaVh1aE9tQkx6MTMvK2tZYWoveitzdk00S1FQbU15RERqU1pB?=
 =?utf-8?B?WTUvelo4TFBRcVdwYm8yRFFBUFdZYURRYUtodmpwTG1UNUJkdUNCZWFJUGZ4?=
 =?utf-8?B?Q2dWazhqcVFyRUphcmJLSHpZOVJiSHRnYTRwdHZGcWRkbUJuaUl5VEtucE5l?=
 =?utf-8?B?VEZNbmhFaFYraVlZMTJ1Q1dGaXB6YThxcWRta2hyNzMrbDhWKzVRWGRld2FV?=
 =?utf-8?B?Zjhna3lKbEZpYkQrRGtzRHFjdUN2bGtQdHFJUkVvTEh5UVVNRDFqYXEwYlJL?=
 =?utf-8?B?N2QzQk9HcHE2Tyt4YldNL2RvZ2NBazgxNVI4M0srMGNzK0IwdHRUWTZZWTAw?=
 =?utf-8?B?NklsS0R3clozSXJEb21wTzdQcmVydElLOElRK3VRankzYmt5d1N2ZHB1Q3hu?=
 =?utf-8?B?cU9obEVIL01IOTJkdnYxaXhxV0hZK2Z2VDVsYXpDUUhjdEprNG8zZm5lek9P?=
 =?utf-8?B?N2QrWHlqOEF4UXMrUWJ0Y0Q0clN6bGVQL2FCekc1M2pnZ3JzSVB2WVRNcWFm?=
 =?utf-8?B?aGtGZk1SNk0xS3hFWDlmMnFkTFlqaE4wWUZJd2VwVUpkZitLU2ZTMC9ncmFu?=
 =?utf-8?B?QjhjaW5pM1ZVMERGcUNJTCtaWUxhaWpMVWFUaGgyQndOQ24xYktNNktzR01l?=
 =?utf-8?B?RmNuQzZmZHU1bVRnMkVlOGN2cmZVSTVCZTN6Y3NscFlxbDFEeGtKYmZPZCtX?=
 =?utf-8?B?d3F2K2wvUDlRV3hVTUgvRmdCTlcydzN1RkdEeno4Z1dSZFFxVzFCYzcvUFpl?=
 =?utf-8?B?N25ZcDBnWHhnU2s1VHh4VW1iRVF5dmZ6dStpV2ZPVE1LaG55VG9BaEJ1Y3ht?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd610fd-6470-4858-2b5e-08dd3afacb26
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 15:38:18.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0i7HZWb6vWoCOac2HCal9pttASm17YUwZkFwxQ68nMndHLFMlEMRJwnbP54ZLFJM3R9eAImnSwMNn1Kdo4JCgZ060Q8xnljG3qxCRIxFoTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_073828_604279_56D371EE 
X-CRM114-Status: GOOD (  31.27  )
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

Hi all,

On 1/16/25 3:47 PM, Quentin Schulz wrote:
> This adds minimal support for the Pre-ICT tester adapter for RK3588
> Jaguar.
> GPIO3A3, GPIO3A4, GPIO3B2 and GPIO3D2 to GPIO3D5 are all routed to power
> rails and can only be used as input and their bias are important to be
> able to properly detect soldering issues.
> 
> Additionally, this adds build-time overlay application tests for (some)
> Rockchip overlays to try to avoid future regressions.
> 
> Notably, the Device Trees from Wolfvision PF5 aren't migrated (but
> should) as I do not own the device and couldn't figure out from the
> introducing commit logs what the possible valid combinations are.
> +Cc Michael Riesch for awareness
> 
> I'm wondering if we shouldn't backport patches 1 and 2 to stable? In
> which case, it would make sense to try to have the Wolfvision PF5
> overlay tests merged before the addition of the Pre-ICT tester adapter
> support for RK3588 Jaguar as that one won't be backported to stable and
> backporting the Wolfvision overlay test would incur an unnecessary
> (though not difficult) git conflict to resolve.
> 
> I also do not know what kind of tests we should have when overlay
> combinations are possible (let's say there are A, B and C overlays that
> can all be applied, should we have base + A, base + B, base + C,
> base + A + B, base + A + C, base + B + C and base + A + B + C tests?
> maybe even base + B + A, base + C + B, base A + C + B, base + B + A + C,
> base + B + C + A, base + C + B + A and base + C + A + B tests?).
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Changes in v2:
> - add overlay application tests for Edgeble NCM6A WiFi and Rock 5B PCIe
>    Endpoint+SNRS
> - add overlay application test for RK3588 Jaguar + Pre-ICT tester
>    adapter,

This actually has a side effect.

Rockchip DTBs are compiled without symbols today for backward 
compatibility reasons. Indeed, having symbols increases the size of the 
DTB and by a rather non-negligible amount.

With this series applied (plus the change for the wolvision that was 
intended for v3):

115K arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb
162K arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb
165K arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb
165K arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb

Without it:
57K arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb
83K arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb
87K arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb
86K arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb

As far as I remember, the issue is that we want to make sure that such a 
bloated binary is not going to break things. Considering that U-Boot 
passes the full DTB to TF-A and that upstream TF-A has support for 
loading it on Rockchip since v2.1, this would be one piece of software 
potentially impacted by the size increase.

TF-A v2.1 to v2.3 (both included) only had 64KiB available for loading 
the DTB passed by the previous stage (U-Boot most likely). 
https://review.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a/+/7029e806833b94f729d9117bd35d488476b0e27e%5E%21/#F0 
the commit introducing support for parsing the FDT, see the static array 
of 0x10000 bytes (64KiB).

The buffer size got increased to 0x20000 bytes (128KiB) in v2.4, c.f.
https://review.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a/+/8109f738ffa79a63735cba29da26e7c2859977b5%5E%21/#F0

Additionally, before v2.4, passing a DT too big would result in TF-A 
crashing, c.f. 
https://review.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a/+/e7b586987c0a46660aa8402f19d626a5489fe449%5E%21/#F0

Unfortunately, Rockchip has seemingly decided v2.2 will be forever their 
base version for their blobs. This means that we are forced to pass a DT 
below 64KiB in size at the risk of crashing TF-A otherwise. Considering 
that a memory misalignment can also make fdt_open_into() fail and thus 
crash TF-A <= 2.3, c.f. 
https://review.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a/+/621acbd055d712ab8bf79054911155598fdb74d0%5E%21/#F0, 
there's essentially too much risk to use DT with TF-A <= 2.3.

Rockchip being stuck on v2.2 for the binary blob is the reason why most 
Rockchip boards supported by U-Boot do NOT actually pass the DT to TF-A, 
c.f. SPL_ATF_NO_PLATFORM_PARAM symbol: 
https://elixir.bootlin.com/u-boot/v2024.10/source/common/spl/Kconfig#L1446

So essentially, if SPL_ATF_NO_PLATFORM_PARAM is selected (the default 
for RK356x, RK3588, forced on on RK3308, enabled for the majority of 
RK3399 boards, enabled for all RK3328 boards) the DT won't be passed to 
TF-A so no issue in terms of size on that side.
If it is not selected, for TF-A < 2.4 (released 20201117, 4 years ago), 
a DTB bigger than 64KiB will crash TF-A.
If it is not selected, for TF-A >= 2.4, a DTB bigger than 128KiB will 
result in TF-A not being able to read the DTB (for Rockchip, that means 
not being able to derive the UART settings (controller and baudrate) to 
use, and will use the compile-time default instead).

RPi seems to be loading it into a 1MiB buffer, Xilinx into a 2MiB 
buffer, 64KiB for ARM FPGA targets and Allwinner.

We could/should increase the size of the buffer for the DTB passed to 
TF-A but there's a limit. Indeed, there are many assumptions all over 
U-Boot that TF-A only operates in the first 2MiB of DRAM and reserves it 
for that purpose.

If I didn't misread the code, it seems 
PX30/RK3328/RK3368/RK3399/RK356x/RK3588 upstream support only uses the 
last 768KiB of the first 1MiB of DRAM, c.f. BL31_BASE and BL31_LIMIT. No 
clue if that's a proper interpretation of the code or if I missed 
something, that's a rather odd choice, considering Rockchip is adamant 
we need to reserve 2MiB for their downstream blob.

Regardless of what can be done for TF-A in the future, the fact is that 
it currently is limited to 128KiB in the best case scenario. This limit 
is already reached by adding symbols to the DTB, which is a thing that 
this patch series does.

Note that U-Boot typically does not use the kernel's DTB as its own, at 
least for Rockchip, for now. It does compile from the same source (+ 
some additions in arch/arm/dts/*-u-boot.dtsi files) but without symbols 
except if OF_OVERLAY_LIST symbol is defined, in which case the DTB 
symbols are kept. This symbol is currently not enabled by any Rockchip 
board.

In short, I don't know where to go with that additional piece of 
information, but this is a bit bigger than simply moving things around 
and adding compile-time tests for overlay application.

Cheers,
Quentin

