Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A19CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 05:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UYwL0KmrCRI86f6H8V9hkN03Alhc3zLT639AYG8Hm4=; b=YID/4/GjX83IMUSIruL3jr37r2
	0fkOMos923/JK2Cro95kK2AchNrqGuLZAOsBTDlRqC0F+BM1aGP89vKhrQOc2aZYyd5uKA2OTsEWJ
	SA9I1+AAq7cQ5nuGK7gbnVpFZyycTvLl+lNZ046zouG7j29B4QAb4WH2bbUJYlkuejHYdMhhvD9R0
	qTj2TFwl5nlP0N/oy3mNMrOBSHi6Q4PTLpcJU/lcOk4ZJqbbNNcDXqVFOW65jcqumQymYHm+buPKJ
	zBu2qA3uO6SQYTKmEvp3D4SMYvYR3v9YzEcqOaVy6oH8m8Yke2TsMUjJS/qrlfir55AMqMIm7sWsk
	RJuUQ1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1eeU-00000005vlc-0QsH;
	Thu, 25 Sep 2025 05:36:22 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1eeR-00000005vlE-3J5n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 05:36:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVqpXz//MGFA/L9XyYCrpl1r91thjy5JCddf83+RdZLDfxeS2jbJtV4SSntrXTpdoJjeCIvvVPh1JaTGHvPOnxRY2IrTpTx3JCKU9YerdS2fP/VrQDFoDFfiT5xjWFftrMsBoExgZLojo1Xu+jFFt/0zdQ1L5hfnyCzfphPUOdf/jSG/mbXNWTIoVcIwesa2IuVi/AFoprsDWg7ceerDkQNViMfLxaY6a3FrP09/CxUaZcNxBerSy3/ZRW/xab9ePtN6H9PuNT41n1yjKPIw4745FR76YiQbUIJD0z8EyoA/Ks9BDge2X6NbadPnC8VFXjvQDbuGWFdBkvYkio/ExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UYwL0KmrCRI86f6H8V9hkN03Alhc3zLT639AYG8Hm4=;
 b=h/VxKgD9tKnYS2Y5uREoGUntzMUlhTJyH1NMTvAAnb29Xhi6Bsk5OrOOgDoo6MRtwvXc+icaKxqi7USu+Aab2CxfABRUvRvd653AYU73hu8FkTjQlblL8xb7I+528hWJDJOoQ86ZPnSEgu9Sg3wxMYGHlbl91MeHxkXoMrbsw9S+ymKSCfIaHb1VZQVa12UWA/40+UMqFKNS4jhnRMg6mzOKlvagAzFnRdjzJLkSZDJT7agPQovU7GFhMxd3Zz/T7hMDadmSGGaWzvuJcpvL5uveGPlW0IFNor1/JtbAjLv9Oln0E8CQq9z24ojcWYd61j2mlAIpDitQGFlEf1NtAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UYwL0KmrCRI86f6H8V9hkN03Alhc3zLT639AYG8Hm4=;
 b=Ks6x16HHd6Ptd4QBlP4oFrUYTxMTdsCcHPnMVxPlcIYyYDUY10BiDgPPmVMI/iwwnABIOHM4VskUf8tiTdEAvv17QYkrp/HnWlLJ4S6DhFQPY3zr9JSumqIgBLPUwhijUMydnob3+0rygXIjn4YTxGqOXLYdW2Af8g886OB+OLhWRh9aXbWOFuofSawq5RVzi7zXS7vyUq0yqbam4fHtoROh2f5ZA6KH55Kxu7sODu+fHb41lVx2XxAhKGvCWvU4HIm6Uto+HPCzxNhHnt/invR9JsK5pOCQDPXyw+7QXPFsPB+3dtaMG3uVpOvpaXH/u1+uSTq48ZAP+r8/S2oIqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH8PR12MB9768.namprd12.prod.outlook.com (2603:10b6:610:260::9)
 by MW4PR12MB7214.namprd12.prod.outlook.com (2603:10b6:303:229::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 05:36:15 +0000
Received: from CH8PR12MB9768.namprd12.prod.outlook.com
 ([fe80::f7db:9f0:a574:1abf]) by CH8PR12MB9768.namprd12.prod.outlook.com
 ([fe80::f7db:9f0:a574:1abf%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 05:36:15 +0000
Message-ID: <5e335918-3632-438c-a021-8c8447d5de73@nvidia.com>
Date: Thu, 25 Sep 2025 11:06:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: rtc: Document NVIDIA VRS RTC
To: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250919135950.10403-1-shgarg@nvidia.com>
 <20250922195354.GA1065946-robh@kernel.org>
 <a1d6955c-ac43-4cd3-bb7a-9b627aecc47c@nvidia.com>
Content-Language: en-US
From: Shubhi Garg <shgarg@nvidia.com>
In-Reply-To: <a1d6955c-ac43-4cd3-bb7a-9b627aecc47c@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To CH8PR12MB9768.namprd12.prod.outlook.com
 (2603:10b6:610:260::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR12MB9768:EE_|MW4PR12MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a685a9f-fa17-4e07-0bdd-08ddfbf571af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V29pM3NULzU2TEppbTNpenpZT2ZHOFZyTGdpQjkxNlBIMlhDanl2MUVuZ2s1?=
 =?utf-8?B?ditucXZmMVpNaEp0U3hoRHZiL2ZKbVltYms3SUtjRXRCa1VVZGFYaWp0RFFT?=
 =?utf-8?B?SU5wMXlxV1hSNUJodlhqS0pSTWs1NHZLWmFXT2twcW4vMkdGV2hTbnBGemdO?=
 =?utf-8?B?SGsvd0RCK3EzZUJVWWNVQlVBcFNYQVVSOTY4S21wckp0b2k5eHNZRWFmTFYz?=
 =?utf-8?B?YnZFcCtMS3Y4MnNEK21NVXpqNElOTFB6ODZmd3E5ZG41Q2pvbWhVTTdDVE0x?=
 =?utf-8?B?bHBjWFUzRW9idlVzYjVVTDB6QUJqTTVYUlZBRHAvdFZPYkoyTmJNcDhrbkUx?=
 =?utf-8?B?SFFWVzdTMm4vTjNRdVA0ZHdQa3poVWpiWHgzVGZyU1FmV3h5aXVMY0RGUERN?=
 =?utf-8?B?bW9DYlRMT3lBL2ZlekYya2tXY0lFeWwyN1Z5MFl1VFpOcWp4MjIyanJtT00w?=
 =?utf-8?B?QytvaW9XZkVqaVRZdzZWdEp3MVJGTDVES0J6K29nK0dmOHhQUEk2SSsrcjV5?=
 =?utf-8?B?TVdHUlVldFpNS2lTbFR4Mjd3dk1WRjhiOWlEaDZteDdvZWhLNEFqTEJKTHBw?=
 =?utf-8?B?WHFIUTVCRTdZN1drSzgxMmJmeHlNWDQrTmFyTnhBaWJLQUwzWDVQZ2x6ZDdx?=
 =?utf-8?B?dDJ6ZEJDZzFDZkhYRkMzdTFSUzdmN0FvaFpHU1N6UVkvZ29VOTMvVklnbVha?=
 =?utf-8?B?QVpMVnFEaUNpU1MyRjVjOC9Nb2VBQkR0MEJodmFiSW0rNklJZFVyL2tUclVU?=
 =?utf-8?B?c1JLSTFEWHEvRlh2QW9UNjNydXdBQmcrQWNTcTNhMjFPcW9HYXJwbUxIVys4?=
 =?utf-8?B?MUtHZ3g0Qy92cGZiUVdLQ3E1WS94TUt4VlVoQzhuTkN1UERrN0xmanlNVnFJ?=
 =?utf-8?B?TEV2OVlrZXAvMGVHSUQ0QzRPdFdMRm5PNFFNaUdwSnBobGIvWng3U0lIdDJZ?=
 =?utf-8?B?b085cTdxMlJTVk5EMXkrUzNsRTJKRFdHUkd2cHFlTTB4U0N6WGIxNVplK1JS?=
 =?utf-8?B?L2FueDdIeW0xeVQwYjNuTk9aL3drZzVaT2NuekFhN1VyUGlBc0djNnNieHR6?=
 =?utf-8?B?TDFNYzdwMThvQWwxU2FMOGZ1SC83VTNzNjRUWXllYjJSNW12ZEUyeUVDdUp5?=
 =?utf-8?B?WnRtdjVkRUt0SXArU2kydlRCSkJlMWVJOXRISGtLamhFdkY3WHcraWtTZWpW?=
 =?utf-8?B?cCtzTXFmUyt0L0N0WDVzRS9CNW50YTBEcVF0THQ4TTVJWGpjOFhPaU1ONDNT?=
 =?utf-8?B?b2o4c092U1g5aXZhWUZ5MVRucVAzT2ZoTDVQZzlKenNSSkV4aHBZbEg0RThz?=
 =?utf-8?B?QlRSOTNNWUZPTGQvc2NINnkxejBKNkhzOExyMlBPVXN1OHZrVXVkNW5zSmhJ?=
 =?utf-8?B?b1QxcUYxVWN2MkJMdEtkcEdJdXhueWVHd1p1V1g3Q3FNYXJJSE9ScnFhNFNJ?=
 =?utf-8?B?cmNiTVV4eWF4N0dpYXdiRGhQNFNUbFZ5d0VRUWlOZTh1cko1SUhGekt4Y2dJ?=
 =?utf-8?B?cm0ycFFwQWpSMk0zS1Z6UHU0Y0JhenJhdHlyR1EzRzJXeHR0d1drZjFpQ1RH?=
 =?utf-8?B?OHU4NzZpb1ZyY3BNQ3g0S2FxTzl6YkM5bEJKTndUOHdTKzFvUWhNSzNIeHhu?=
 =?utf-8?B?bnpLVUlWNW1BeWxiVmtJUlBMZ0pQb0ZCTUlTQmNWV0xHazBBcmxueEp1TXBS?=
 =?utf-8?B?U2Z1TFc2YlVPTUtUTFlDWFFlemV3ckhkdm96K3hVZmRXbUY4NFJxS2JOWDds?=
 =?utf-8?B?dldmdUVEZTJUbzh2b0I5M2JneUkwQjZ2d1hvcllTMzJZTW9heUpJTXNiMnVr?=
 =?utf-8?B?RmhVZzRXb0Jvb2Z3VFVYVjBCa1gzZzV2akZGSUlzTkxlajBKM1ZwcjUwalhU?=
 =?utf-8?B?OTVoTjBRMWN5aXpPbVpWM2JGTlVIVjc4SXpyT1pGUFg5Q0JyNHZnL1dsN2to?=
 =?utf-8?Q?gFkCEobjZ8o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjBMUmJaM2tHdVBINUJCcWNDNms5OUFkdURWZnNsRDVEN0oyRlhVYjN3NVJz?=
 =?utf-8?B?c0Q3ckV5dVViTHFTQ2pvSHluRmdCcGx1cDZwNndkbVVjNjhsUENxcFpqaDUr?=
 =?utf-8?B?d2xFSkx6WVBackx2eFY1RWJ3dVprekNrUE9rVnlDeFEycGcwMDhBdFB1eFBQ?=
 =?utf-8?B?ZVAxbHNxYUQzakdCb2hmTUV3WnZ4U29KZUdlMXhicU9sckxUZXpNaURQekhr?=
 =?utf-8?B?ZTB3clFZdTUxWTQ2RURub3Rwd242ZUpyanVEVUJpeWpUU0xIc1lDMExLeXhX?=
 =?utf-8?B?cjVOdFZMbXNIanJMeW1HRmM1Q1BaSzlGa3kyb0RDd0NGRFpjdW9MN3dGVkJ6?=
 =?utf-8?B?cDFSejd0cW1NK2dLUDBST0hqOERyQS9iTnlEdktmdUdHWFlOek5Id0xlVS9r?=
 =?utf-8?B?MDluVWtiNk5TQTF5TGwzRHhBZXNMWitLbDFDNHhGazRTbm5VbEZiRTlUTEM0?=
 =?utf-8?B?TWE2Um9sbVJncXFkelplREVyR1hncThZOUVxcU1WWFZPWjJwS1huY2xzZjlI?=
 =?utf-8?B?NkJ3SVR4VHBkZzNXQUUzQjgwbDdGOHJrVzN2QzY0YmZWZ3RNb3loM3M3SkpJ?=
 =?utf-8?B?VlFUMjdWV1hXcjQyOENHSHpYcjBqK0RUOXE3c3k0clI5QTVHRmdQTG4zc2hY?=
 =?utf-8?B?UjkxQ3Q3cDJEUWlZbmVsbTJSMzhzQVhycHRWNFFFd2FwakJIOUdNTDNBWlFR?=
 =?utf-8?B?QjhWYUVhaDNTNXF3Q1JpZ1JvYmdVdkd2WDdMU1p0VVlDdWJDUUZsNlZuYXRL?=
 =?utf-8?B?dlB0Tm9jN3haYzlwYUpmOVQ0NkpGZDFMaFVxQ1lucTJmQXBYSituWjB4WHJv?=
 =?utf-8?B?SWhnZ0RvVXhOQ0VVUHM0aHRGUURHcjFEWUZTNkNjd05UR0xQV1hYcGxwVkRT?=
 =?utf-8?B?Z1pPeTVYQXpqR2Q3UnQ5Z3dMZkN6LzhQaDZ3SkhTWE5KL3dCOXlobzJGSXFo?=
 =?utf-8?B?YU9kNTBrZGdOL211R0JGcnRTUzNUL2k5Y3YzV0xuUk1KQTFGenRrRXY1SkJa?=
 =?utf-8?B?R01qSW1rdjVzQzJrTWFibENrNkhSelpod2tFdlhQRktTTDNKZ21vUlF2THR6?=
 =?utf-8?B?WE9VbTFGdDNyenU2WkxZT2p0cWlmN05YVDF0cEZTeUFsWnJ4R0dSbnBGZFF1?=
 =?utf-8?B?a2J1V2RaZUc4aTY3b3VxZ1I1TVYrZXpONHlIbGl4U3NvVk9BbWE4cjV6aFNu?=
 =?utf-8?B?WWJram1ldW5ua1g0Qm5hM3VVcVZNeEQ0UHNPUjdZNm1LMHJsUmhNMjE5L3Jh?=
 =?utf-8?B?TmViVHdjUHNpaExIelNrWWIwMXo1bzRKWmhTS0tFMzJsaFV0RmtSVGtCM3VO?=
 =?utf-8?B?U2EyQVFSL3l4aVFlRzFkbEFNWEhZNGZsck8yL2hPcHphMStBcldTVVNQWEhN?=
 =?utf-8?B?Sk1MN0RkUXEvdzdOWmM3Yk12aUxHeFgrZWxpTm14ZjQ1cG90L2NlOGVVbnRO?=
 =?utf-8?B?dTAxK2E0THg2SVozdlVScDhldUVRbG5RNlhEYlh0Y2x5MGR4VE02WXd1NUcw?=
 =?utf-8?B?NDBXdUJhYndNV2xnR2kvVlNEZmtWZEoxV3BJYmExS0x4bE1Xc0sxRkpGQkpY?=
 =?utf-8?B?VzlHaElHNlRMTXJ0OG5XVWR6djl2Q2FaQTJSdkIrR3hVZk43ZmxXT2t6aGxH?=
 =?utf-8?B?SWRqb2haWWNZZ3pxTEhkUC9TMUpXMU52WXd1aHJMTVdDZHdrWXFvSXYxNWZi?=
 =?utf-8?B?S2UwdU1qSE1yL0tPTnY2bnVzRnArRG5GcE5XV3M0YS9MWmpkN1NSKzVPMjY0?=
 =?utf-8?B?RHl2WXRmb1Z0VUNvVGttM3Z0U1FIYzdNTitQRy93RzdnUlpKSXpGTTg5MzNs?=
 =?utf-8?B?K1pGSERjSEpOYm5MVU1hSlR2WnBLaXZsL3ZZRnlqQld0eGlFSXUwME8yQkhh?=
 =?utf-8?B?SFBVOUNhLzNFNGJ6QTlCbm91eXZDOUp0ODFQZnQwM0w3RFRnNUhrY0ZWNXll?=
 =?utf-8?B?MjZJRVpuVmxDZG51RWtjenlyTHlVaU5zTVdHMnRSVWRhVUdwZ3RkUVY1c2xk?=
 =?utf-8?B?Smc1R2M5aXpKZWpsSWlPbUJqakppTUtEZWY5eW5rMWNYbGFKL042Q3VwZGI2?=
 =?utf-8?B?bktEcSt6OTVxU0VWZU9JU2tmK3ZHWW5keUtOcW1YTWNjVmVOU0c5MnNPMEtJ?=
 =?utf-8?Q?Eu1rVpb4ngCfP/+d8my05lzEH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a685a9f-fa17-4e07-0bdd-08ddfbf571af
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 05:36:15.2916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdzaDtqaQ99lTSrliT7fX7Mtswgz1nSwRD22Lc2cIqQCjybBpfnXOhVAG9bGYWdlYCONUK4Ic16xSluov7SwNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_223619_871548_55DFA200 
X-CRM114-Status: GOOD (  11.45  )
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



On 23/09/25 1:38 am, Jon Hunter wrote:
> 
> On 22/09/2025 20:53, Rob Herring wrote:
>> On Fri, Sep 19, 2025 at 01:59:50PM +0000, Shubhi Garg wrote:
>>> Add device tree bindings for NVIDIA VRS (Voltage Regulator 
>>> Specification)
>>> RTC device. NVIDIA VRS is a Power Management IC (PMIC) that implements a
>>> power sequencing solution with I2C interface. The device includes RTC
>>> which provides functionality to get/set system time, retain system
>>> time across boot, wake system from suspend and shutdown state.
>>
>> I only see this patch. The threading of this is broken.
> 
> Yep I see the same. I am not sure what happened here, but let me work 
> with Shubhi to get this resent.

Yes, patches got sent individually so threading is broken.
I am fixing it and will send V7 version with more fixes.

-- 
Regards,
Shubhi


