Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E20C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YO7ewETJb5sG2NP2BZ8Dt0gF3yg5dRK/kZXaV2fV63I=; b=Ei0b+pN+sJS20dkFtEHdNVNOYl
	F2u0ikqSzAKTUc42/BeRxuLHDVGkarTCrKfybU900V77qx0/Z2vYhYgDLpgjMU/UXyawNo8FiVv0l
	ZBLkp941K2q2hcnJBn6HM0fLvSMbJ/PkGKPDcSq7Zz+AgEZ1Cmc2JLKTb4Qq7f62e0wqcKXKIRtWo
	0QvCsNK4IZfV3fDULFoW2QW7FOCNjefakSowhworkfh+Q6ITFm1mT1t+Z06babAoiHMdov8G1M4HI
	pqSzquu4v0KNTaU1Ixlx6njMzjFq7BOpXbGqVoLO2+P8dj8YcqbWxKvX7Zc7dVEXLtgm8cLzAyyKq
	zwoZEibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thY36-00000000pCA-0Toz;
	Mon, 10 Feb 2025 17:58:24 +0000
Received: from mail-vi1eur05on2061c.outbound.protection.outlook.com ([2a01:111:f403:2613::61c] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thY1f-00000000otz-1gcD;
	Mon, 10 Feb 2025 17:56:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ks61WpRhlGM2qd8MT5sZzXh32PtWVT9j8DGYXw7mD0kqJuZxS2y36yqhHeyzgjVAepMCsL82zWRHbEDYa+8rVvUrrnQY2X94gu27m1C+Rl1VpOd3qOSw9f1OfP2IDE+ldNsx1paGGGsALXa+1J/0JkLEj9C0va4bnoGkWI7G0Vy+5U21RaoRY1WatWJ2hxB0hc0EKyropMHCpYiDlVqwyItDQITiGZl+E+cACFS9TnYrLRild5xk1Xn2n0QK7XfJF8g4bYr9wIyNcfI1n0PROtwt+d8nQAmC0yRh59cXay2ir0OH4zbM20Iqb8d9KZNARYAyKPwPbH5x+4gMzjVzGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YO7ewETJb5sG2NP2BZ8Dt0gF3yg5dRK/kZXaV2fV63I=;
 b=JDOi/FYEpxPKcAr1YjGp5SJGbFKBWCodp0s7BQVEUJFM4ujAN2PIt38ZtKpeFswXlLpU1VH7RzWMWaZ5brSxvinVLSAQ9R/gxgzNyK+EvH5vtmkDezRWIFA8IX9ow9Etmu/GxYYtn3498e+pJB2woNbQjvtVig8xjSrH5OiYmy6UlimKSPiWhahr2o6XVjinNldBrLpSmXGyw6BLAlcCsYnVuBmq98jlCIC+4dKhNzXGvts+wjOknvc49gpCBoj250AocFMjVa+30XQhXkEfgkPwT29SQ6cilH3165C/SIvF9XSGCsFFysqkVjyN+A0npE/4j2dSFNyuvXRn86nTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO7ewETJb5sG2NP2BZ8Dt0gF3yg5dRK/kZXaV2fV63I=;
 b=TlCgLPUVc74U2YHWiSgkSAms/2U/XCWQG9YMxFwoiOmZtpwBNo763RL11I9uDf4JAV2Y1sMNu1voH77thES/bXEh03MjCg8e+yXNpj/iBO2mL0owx6UoHqF2at+KgUhEscUuUTGG1L73dZJ/3sY12VQXnXi8zZQI9gS2ovabqe0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB11029.eurprd04.prod.outlook.com (2603:10a6:10:590::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:56:49 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 17:56:49 +0000
Message-ID: <9615521e-8a2a-44d7-99ea-5571f5de1e57@cherry.de>
Date: Mon, 10 Feb 2025 18:56:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] arm64: dts: rockchip: add overlay test for
 WolfVision PF5
To: Dragan Simic <dsimic@manjaro.org>, Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-1-a70819ea0692@cherry.de>
 <ef9133d217bc35f611ef390da8042510@manjaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <ef9133d217bc35f611ef390da8042510@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0114.eurprd04.prod.outlook.com
 (2603:10a6:803:64::49) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB11029:EE_
X-MS-Office365-Filtering-Correlation-Id: 175daaf2-7d48-4b72-b4cf-08dd49fc4ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjcyemlITHVMWDZsbGtZWkxrdDY5T3BvK2tINk9nMXkwRHZXWU12UUdDUVFG?=
 =?utf-8?B?K1RqS1pic3R0dTh0WUdiR1pqb3BrZHJ2MUwxOWQwTDNzelVFMDNBRHJPOW5B?=
 =?utf-8?B?RnNldHYvaGR2TG0rVDBUZ0RDNEJKd3FPL1c3VTVEU2VicWFNVXpHZ0FzcWx4?=
 =?utf-8?B?Sk9iRGR1ZUo2czRBL1N1UTRqK1R5aGhTelVpaFYwbFpjRTl2U0MrMEZ1Qi8w?=
 =?utf-8?B?TnF5dDVmbng2Wk5LVCtBdnIvY2hvK3Z4N2xsNm9WT2F1UlVvZGZZNytIamtH?=
 =?utf-8?B?eFRVRDRPeU1MY2RLbWJrOVFaWTlZNHpzdUxiNWpTRlFmRzNzTDNLb3FrMUtR?=
 =?utf-8?B?cGNzcnI1WVJOQkxnMlhmRUtKZVR0YjBYNzBrV1VQWXZyYURlVHIxR2dhQWlF?=
 =?utf-8?B?L2YxMHBtbWgxcGNlOTlZMGRXclVna2lzVjJDYUVBc1duUXdjYU9zazJaQmIz?=
 =?utf-8?B?Mm43R2dpRGlCRGtuWVhic0NGUldENmtUMUovd0l0N0hQaGdtS3JzZGlOeUJm?=
 =?utf-8?B?akxJbjZ2WFZvakpwUWN0VlU3MHVQWFp1Y3hOczBmZFZ0RGRid1dRZHBIZ2hu?=
 =?utf-8?B?Z2ZjRS91OTZLNXg3bXV5bDRPRzV5SnNiZ2FHVE5aRTNWRFo3OHplaG5nbmlv?=
 =?utf-8?B?bnRPNjVBQ2h2aWRxMEVJQ3IySmtGa1hDeG4yMUs4Uk1PYXR3UFBZM01MSEFl?=
 =?utf-8?B?NzkxRUJ1R0c1TnE5WE4vQlpVUUVjT3UxYkNkN1hmOXJyTTlvdFh5WUkrNS9U?=
 =?utf-8?B?N0J1d0xCMUZvU2MzbzBGUlFNcTNJRDhnRzFWYlUvcXZoYzJHRXg3Rlh5OWhH?=
 =?utf-8?B?akVoa1oxTlFQRWp6YnNpRHQ5N2h4K3NOQ1dmYUtIVXNmN0lwZnFyOGZxRWdE?=
 =?utf-8?B?NHJ4Qlhia21aL0tvL205MU5SR2FWQkFwQWxpM1Y2eERkVDUrQmpiYTNUblZt?=
 =?utf-8?B?L3pGQU1pUi94d2dxUTJOdUJpY2QwaVJFcVVKZFpOanhMYXhhUHJtR3dPMjhP?=
 =?utf-8?B?YXJldUVWaFllMG9xNGtFb3RJY0RqeUcwcnRjeW5oVUppYXBuOWoyVm01MS9n?=
 =?utf-8?B?NDlKNmIzcFM1L2Yyb1dKWTl6S2R0MjMrczFqa0VFcVY2bHp4cDB0R1pPUlNQ?=
 =?utf-8?B?ZzVzV25CK0dWdjdlR1J0VjBSbW9qcjVBNXgvR2VSRUQ4b3kyWC84YTlPckhP?=
 =?utf-8?B?SllTeDNMeitVUzFocDdIVVNTdllLRGF5S3dTL1M1bVhkcTZMU1IveHZKakp2?=
 =?utf-8?B?NEh3djZhMk8yQUhOeVZxTzR0YUN5dUZPeUZGSUt1NFJjYm1JeVFIWE1kTnRW?=
 =?utf-8?B?djA3N0tkSzUzTCtBNCtrUDhwK0x6d1F3dEFla3VHSEQxZURDVTd6OVEvTlhF?=
 =?utf-8?B?bUhQWHlCcVJ3alRxWVdCb2pHZ3J0a3U0ZHMwdG8vY2xhVFJobStLK0hsTHc2?=
 =?utf-8?B?MUI0WlVKNE52c1BZMmJHRGdBV2huWHJnclFjdEhTTW9BM2RkSE1oVFVUcHR3?=
 =?utf-8?B?ak5JK1hkT0M1MmVYNjYxL1c1NjU3SWVhSjZGQkU4OGdndVlzZHpadGRKbm9T?=
 =?utf-8?B?TDI0QnNCWXo4a2VjZGdmdXB4S2lqS21sb3JtKzIvc2FhV1lIOSs3MTdiUTgy?=
 =?utf-8?B?ZHlTSWRrVFNjMHRxMTZoQ2JwZ2FoNnl6azFRR09GbnRTVk1GZFJNZWVSM1Bu?=
 =?utf-8?B?U00wODNyc1VNL3NPMlRURHFIT1JpYVFXOS9BYmN3YWQyRVoxWTZGcHMzOUlz?=
 =?utf-8?B?d1F1aVpMY3M5dHFNR3dsYzNvRktqV2VGOU5QMWhId3JEaWtWQ0llcy8zaW5w?=
 =?utf-8?B?MlM2b0tPTWd2YzRKMXV2MU5BWkJGOGRCM0xoVnpma0FYOVozeVB0QVVMZzBM?=
 =?utf-8?Q?szDeXjmD6YT6D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXdFVERlVWtDRHZnTUxCYnlRYk1WSzRNTFduaUtQUHhFdDFQK2ZsbnBkSHUr?=
 =?utf-8?B?VW52K0NEYUtYRzM3bFh2bzlHenlGcWVlQm1BdXNsSXhuRHhxekQvSWdxMTlm?=
 =?utf-8?B?ZjdVeW4ra091Vk9RWmFRcEJOQ2dVMER5MTNoQmxGZWFFSVVCMDMxelNlajJU?=
 =?utf-8?B?U1ErUjNVN3pWUDlTbUg0dXFnMFRiRTd1VjA4dkNlclNyMzg2aVhyMXpiZ0Ix?=
 =?utf-8?B?TUMvQytsTUt3RlM3TUdjQ284Uy95SnZiNjRucVpmUktMVkFINVlYSUxPZURH?=
 =?utf-8?B?YmpQdWQ4aHR1YTdSYUt2bjN0d2tqbEd4dFpOa1hYc1JSMWdXRlBBdnFGVEtI?=
 =?utf-8?B?dWU2ZE5BOWo2anFjdUU1QlExang1NHplaWdDWmhzb0NPMmViSW9aM05Pd0JL?=
 =?utf-8?B?bGh5N08zRzVPVlhFQ1Y5Vms5T25oQ216THZ6anp6cWFOazh6YkNDYXI5M0VO?=
 =?utf-8?B?ZmtiU0ZUYkRVdktycjlEWk5xRTIzaFRHSGoyRDRwRExQb1JQUXhzckNJdXFr?=
 =?utf-8?B?Y1lxeDFCVk54djZ1aHBTN0J6ZnpJSkFuL2FzYlVxcWphTkxEaTFic3N4NHdZ?=
 =?utf-8?B?NDlHK0FhRkxuRW1FR3lzWTdQS1hsT1RzN3JFdU1mS0RuUXNJMHZDRXN5eVA3?=
 =?utf-8?B?aWZKNC95TjRTUjhlazEyMmdSMmd2R1A4Wk5tbTJtL2ppbk1WSkNEc1FFUW01?=
 =?utf-8?B?ZnozSkhVV25Pa3pSbVAwQXlUZ1c1RUkybnhNV0t1UFFOQUZpZ3UvZW9YMVp4?=
 =?utf-8?B?c1pnRjlFOVBUK2k0QXBLTGlVdUdnNW8zYXZya0dQYUdRNStsMmZnRjRMZXYz?=
 =?utf-8?B?dWtUUThYTlRLN1NONDlOUXJiYXpJdEZ3UkIvNVVqWTUrOVV4cS9PeG5scTRs?=
 =?utf-8?B?YTdHc0R0ZXoxM2RhR1ZnTzFtbWJiRXhHY0lQRnQrT0ZuV1Y5SXZlVUZmZHVt?=
 =?utf-8?B?YlBUb1M1UFZWYjQ3eERTalRhVjg2NDhmcXczL2FVcHgrNWVieHg5cXZ1MU9Y?=
 =?utf-8?B?eStqWmkwR2xOOHdzb0JTdHc2cnBCWXJQWUNZOGt3c09hTEU5YlV3Rno5UUNR?=
 =?utf-8?B?V05Cc1p6REhoc0lrS2swSTVZU2NJaUpNVytlU1lYT3BPM1QvbnNJZ0t0NUlw?=
 =?utf-8?B?MHZtUm1oTUFHdy9vUHpudE93UVYzZzNxVkNYWjNpTlg1Y3doaHQwbWMySWYx?=
 =?utf-8?B?ZC81eW04MnRTR3RqSlJ5Lzlyei9kQnR3WnBmZDhjZHNYZ1l1b0ZOc1U3OS9I?=
 =?utf-8?B?QVY1MVBsbGg1YmNWRVFrVHpQUGlVWkEyZ3daU2pMVmFrNzZsejh6cWowOVVV?=
 =?utf-8?B?NFVVRkFTU0hKREJqVjFiZTZTRFA4aitJYm01ZGdyM3Nvb1FZMFBrU2F6SUdq?=
 =?utf-8?B?VldUWjBFS3ExY3RJeTczVGx2N1E3eUg2OVV2REdGTTV1NlVDSXV1ejRJcStt?=
 =?utf-8?B?UkF2K3c4Ym1JMk0zRzQxZ29oZWZ5ZE14Q0s0ZGxGNVR6a29RQi9nc044MkVP?=
 =?utf-8?B?azRaN0FOdVl6NlZFNXczK2VUTHZZYitEOGxrUGI5ZmF5M3JlM0Y1WjdmSU1X?=
 =?utf-8?B?YkRxMVREU3Ztb21GUmloNHBnUy8xZGRIcVpnaHFES2RLb0R5L2d1VkptbWYr?=
 =?utf-8?B?OTZia0E3R3FLc21UYnZoY0ZaMGVyeEhEbmQ1Z0ozODI0QjN3ajdKTU9MalBh?=
 =?utf-8?B?R3NvTEh0aFdheTY3RUNiWmJaY1lKd1dpMVVzOC9HOFhSRWxxZVB1dHoxTjdj?=
 =?utf-8?B?L0F5QzdpaGMzL1RMTXhoV2RDdWVHeVdaZVpOWkpiNXNVV1Bhd25kNUhBTENq?=
 =?utf-8?B?WmVpNHBML3ptbWRrQWVETEhpU3FjTFlmMlhYV0ZJeEdiSUxJdTJhdEZucSt0?=
 =?utf-8?B?SW54amU2QVhJdDE2VHAxMGE3eHc4eHBvRElubmZXeHRCTWRIQXhNWUdtQldi?=
 =?utf-8?B?bTI4OWRoK01aVUgxTUgvU1QvTENEUm9IS3cwaUpycHhFRm9kZm1HRXhIdi8r?=
 =?utf-8?B?VzNzUytBQmIyK1NSVmQvZHBCc0xZV05TVE9GajBROU9zcWVSZnBmNkY1QlJB?=
 =?utf-8?B?eGFDWWZDWDNxNEFNQ21nYkd5OVlUUGxDOWt0Qm9mWkZVVjh0V2lPTVM1V0Vl?=
 =?utf-8?B?Z1E0bDNtNHVtMFh5RWxaY2lLZkZzQWxqaE13TGVvdmNmdG1OSElIaGc1Z254?=
 =?utf-8?Q?1bYJiBAgC4vHHGwDS6uj8xk=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 175daaf2-7d48-4b72-b4cf-08dd49fc4ac5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:56:49.2746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Qq/xDn63gq8ZrTlzUPkEawKaK2+i8metVi3F0OC3TtB0qoVCzeHMBFA1pz+zwV4jpdRZm/gGY7Dsa02R4u7zGSCjwco+43pCsPK/4ur+C0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_095655_581641_7F042CC0 
X-CRM114-Status: GOOD (  18.28  )
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

Hi Dragan,

On 2/10/25 9:46 AM, Dragan Simic wrote:
> Hello Quentin,
> 
> Please see a few comments below.
> 
> On 2025-02-07 16:19, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> The WolfVision PF5 can have a PF5 Visualizer display and PF5 IO Expander
>> board connected to it. Therefore, let's generate an overlay test so the
>> application of the two overlays are validated against the base DTB.
>>
>> Suggested-by: Michael Riesch <michael.riesch@wolfvision.net>
>> Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> ---
>>  arch/arm64/boot/dts/rockchip/Makefile | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
>> b/arch/arm64/boot/dts/rockchip/Makefile
>> index
>> def1222c1907eb16b23cff6d540174a4e897abc9..534e70a649eeada7f9b6f12596b83f5c47b184b4
>> 100644
>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>> @@ -170,3 +170,25 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s- 
>> orangepi-5.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
>> +
>> +# Overlay application tests
>> +#
>> +# A .dtbo must have its own
>> +#
>> +#  dtb-$(CONFIG_ARCH_ROCKCHIP) += <overlay>.dtbo
>> +#
>> +# entry, and at least one overlay application test - ideally 
>> reflecting how it
>> +# will be used in real life -:
> 
> Hmm, what's "-:" actually doing in the line right above?  I mean,
> it's a minor nitpick, so might be worth addressing only if there
> will be the v6...  Also, "test - ideally" might be replaced by
> "test, ideally", because splicing sentences together using em/en
> dashes is generally frowned upon. :)
> 

That was supposed to be an em-dash yes.

, and at least one overlay application test (ideally reflecting how it 
will be used in real life):

Would that work? I don't like the : following "ideally reflecting how it 
will be used in real life" as it applies to "overlay application test" 
and not the end of the sentence.

>> +#
>> +#  dtb-$(CONFIG_ARCH_ROCKCHIP) += <name of overlay application test>.dtb
>> +#  <name of overlay application test>-dtbs := <base>.dtb
>> <overlay-1>.dtbo [<overlay-2>.dtbo ...]
> 
> As another minor nitpick, I'd suggest that
> 
>      "<name of overlay application test>.dtb"
> 
> is replaced with
> 
>      "<name-of-overlay-application-test>.dtb"
> 

OK.

Cheers,
Quentin

