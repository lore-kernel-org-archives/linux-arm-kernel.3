Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808AEC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 10:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81DyW/fUuvbnGkHHrDBXWJzmbfUZiB7EB+C6hxPtOQk=; b=AwtVSobf7yzXq60lSICqc9MYLW
	jlWrorF7sxG+JK+nB5jUVwVywahT+2CIP/RSJuT4x5UygvN1k+a/XNGwWsIuZJ7sHjs6KLuy9A2YB
	tcrRUqEKsqq7AFSD0jNyIBu/q6vZJH1nKQBQoLns5qaM2Uixvkt3pmUo/9kgKiNJyayOY7G8B/7To
	RU0z1dp8PRg/VJUfYuqQqWxnDi5nAEAvOuXgvOpXq2+9pB3sjR8ysvpxRK+DHGwkh5enrcdLWAh5I
	i/ipivuiHpLxjWMTiUQ0HP0pJIMevJOB7h9zCnfba0AhlD4czteSvoYBFWkqaAMbGI1fikOciU4aO
	iOpyhexQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZp2B-00000005L7m-0BCk;
	Mon, 20 Jan 2025 10:29:31 +0000
Received: from mail-vi1eur03on2070f.outbound.protection.outlook.com ([2a01:111:f403:260c::70f] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZp0s-00000005Ks4-2XQD;
	Mon, 20 Jan 2025 10:28:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imXmTg+gOLMaHnalV+UeFRVp+0wQ6Bbitms/hGHwTB90TK4gp5CVjjSsdHMoFk42uYAXrgn3l2uke3Jt5QvmFEfGHTz06QX3aeQRgdzYrNLeAYXzBWplFHTpTKP+TEIvFtHEargi7/YWOtUGn69jxmTbaiT/smXWEXtSYVdUGnEmZvWtWpNizq0mzDIpUwPmyb3bRdvfbLDdEmpen2ObJyJGupSbN+XmP8P7FwmK0vjPcH6tLh9oEENZYXGfP9ww5M5OXJZ8DBR6/bXqaTQqj0tcTnhJaJsm032TiX6bF/AmxiUGjoaaw+ESWC3290tePgez1YJtSGZqzF633KyO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81DyW/fUuvbnGkHHrDBXWJzmbfUZiB7EB+C6hxPtOQk=;
 b=dn0SUwDBsPOj1nLKhtkMYcs7RaOuUlvwBgwCY7yXEbNKB/UAaNPlFDPF+XZUkPkmIJhTQx3K1vHReS4EDEMoRSH+DMtWjJRXjCCZE/45R7xbdoTnketihuqVBGCgQtI/6UhLBeK5x7HsRlNgL6bdAJp9gSiTEOeGgqEKR8V43MsoqqszlwFN3Do1XZm03r+tE4YBStGxjvKRHNPhrKa0XKldLOveKoyMdP58YoWywFR5evzzYS239X+izpDQq31Di/Ni+b6vxBrNqHmiGnpiKrGbsFKrj7EroE8Y97zSVWYJnyCFBkc98x9oQXL/PUJYTrDavRx/vnbsVbvUJJOsYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81DyW/fUuvbnGkHHrDBXWJzmbfUZiB7EB+C6hxPtOQk=;
 b=fIK4sVR4SqBch6dGYX7o+xVwfkOhZWE2Hweh1ndV3Le2uA5rLKSG6zp5b0m0gLNnYvRrGBQd6QvZykTuN7b81KAzUHmBBzSBPV+7E4QfI6dLRdb01Ika/od4LF3JO4xWzMeA1iqUNMexR/aRajT+cVzQxvSZqvOE5hrMx+xSNEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PA6PR08MB10595.eurprd08.prod.outlook.com (2603:10a6:102:3d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:28:02 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 10:28:01 +0000
Message-ID: <46072287-4124-43b1-996c-fdca41f967e4@wolfvision.net>
Date: Mon, 20 Jan 2025 11:27:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar + add overlay tests
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
 <49bfb4c5-12b5-447b-b08a-af0bb9fc304b@wolfvision.net>
 <82e64b27-d254-4fff-aa25-5b848f147ca2@cherry.de>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <82e64b27-d254-4fff-aa25-5b848f147ca2@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0107.eurprd04.prod.outlook.com
 (2603:10a6:803:64::42) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PA6PR08MB10595:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b3c129a-e0d2-411f-2ba8-08dd393d1e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjZkL05CZ01DcmFyT29SSXZlMHlWN2tWSzRUK3lrSUQwT3lWdFIydDU3aU9x?=
 =?utf-8?B?c2NwenNvaHJXampwNm95OGk4bzB3UU8rUlBTdEJvOHlWbTRpbXg4Q1JIMmNj?=
 =?utf-8?B?aHZiNTBBWVBvMHlBcytTT0NlK1BvYnJxNzQ1MkFDZk5yY2o4cnpPV2VKUnpy?=
 =?utf-8?B?eEhhZHBpSURMSE55QTZYek5DaHJMYnljSlo5UFZ4bzZDZEVzYjd0R01mVTA1?=
 =?utf-8?B?RmcvbXNNOVk3NHovTWw3MTJ4aWpEOXpVYzBvV3AxTThPUjdzbzB5MVZPSUVo?=
 =?utf-8?B?SVphUGhMM3dvMklPaStVcC9PQjNnRU05bUl4d1B3VlI4MVBqWUlLQ1RrS2Ni?=
 =?utf-8?B?Ylp3RDFjNzVYOU5RT2JzendIR0xLaldiSTRnU3ZpS1VNTndFbGNJQWQzUUpO?=
 =?utf-8?B?YU9icTZSUkhFUGlScHdObUhMUWRZeElyV3JyeHNxZ3VRdUlPcnFTS1EyQkFL?=
 =?utf-8?B?c09CNFVHdGhzUDRxcDRCd3RmOUNhMmV6S0sydFFWSFhnQXFBTU00ZFJ1elJa?=
 =?utf-8?B?UTNFRTExYTJoNERFSWpaeWc4My9Sd0RicTB1VWJrM045UlRrbE4yaUtjaTR2?=
 =?utf-8?B?a3hKYkJ0L3NFMlVaazkydmpLQVM4WXJQOWoxaHVPdTRuQ3FuMDFTOUVyZnZU?=
 =?utf-8?B?ZzFzSEtGK3pxOUpPeGpkdGV5RmVzdStGQmpELy90R3RFR0xBNU53VEFQQ1dS?=
 =?utf-8?B?RmVBWnBjS3lFYTJRRmhuU09TLzRlSWRyaEJEbFVFcjNlcEh2UGh6bVdJdms2?=
 =?utf-8?B?alBGR2tVOXl1VnFrbWJER1AycktyVWU5QlpnSmk5STQzNHlHdVcyL0FId0Zt?=
 =?utf-8?B?MW9NQWZzd3RaMDJTdEQ0MjhPZUtjcy9XcytpWHN5ZWFoa3RabnR2YU1kWjVD?=
 =?utf-8?B?b0poaFhlME11TmlDMUdJY0ZQNE85QlVvUkdvaDM5U1Z4SnR6N0lDTWUyanpZ?=
 =?utf-8?B?ZXB3UDJoZk9hOVNxSTZiRTFqejdoVXpCTW51bUF5NUQwWEREL1lENWp5ZVpz?=
 =?utf-8?B?UzVMdWFXNVdTYVdUVDgySEFBZC85WUc1L3dqakpLOTZ4cG56c0lGSFhzdkxX?=
 =?utf-8?B?VysyeDlKek90ZEYxaEdZaXVCOWxrbGVyaVZSUVJwWWlTSFVwNy9rbHoxUk82?=
 =?utf-8?B?eURRbmJkVGVTKzNWZFJUQ2R1d1AyWUU4NG1TRlNlVTBTUlM2Y3lnTEN4SXJQ?=
 =?utf-8?B?akJFNGJ0UWJURHFUcTJDOFp6Y0JPaVhiWm5yZHpiVlJKRUtpeUZZam8wQnhC?=
 =?utf-8?B?K0VPNTl1SnViaU9wTEpDK2N5eHY3aCsxampybFpLeW1YMVdySFh0cEgxZlJY?=
 =?utf-8?B?WWlneldONlRadHJJckZnSEN2WVNZb2pncVFMbnJVME94TW9URlZHT2UyaFdN?=
 =?utf-8?B?bVZhS09hU1dibXB4UmJXZFlVWUQzdE01MytGWDA3clpVb0NxZFNuNzA2MTJR?=
 =?utf-8?B?Nmh1R3YyYUhvaTQ0OTUzTXVQbW1FdVBJd1k0WWpNMDdQemNRdDFFdm9yLzV3?=
 =?utf-8?B?aGVXNHNCcTFxT1lUWmZyODVXK3lYS0J0WkdzcURrcTlyckNTNmdYTHAxWmtQ?=
 =?utf-8?B?dmJHQVRyd0c0dHFhOE9Vb2hrUUpaMW9GcU9BTE0zc3JWUzFYSFBjRGhZL2xk?=
 =?utf-8?B?OTZwd2wyMm41SS9Lei9FS254a3BYSnRTNzBLKzhsWXk4K3h2WklzUFB4MFU2?=
 =?utf-8?B?MXhYMEExTDdxUWlGS2dMeHZEWGo3UlViZm12WDh2ZEczTFh2bDdhTFVjbzBL?=
 =?utf-8?B?L3lnQTVhUFF6Q0FKdHpHYWVMVE12RXd4bE9MenU0T0VWeWlRNjlNOUU0YlJS?=
 =?utf-8?B?YW42TW5TczhxY3JLdU1XSVI1aFlDV2NRdWZiWjRIeS9jdkFJQXM4b1o2MXd5?=
 =?utf-8?Q?en/fIyoLxDBZT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3hTREJ2WlFBdG9DUEUvb2ZobDVlb2VEVnltaGllYmtBOG5kKysrdjBsMHQw?=
 =?utf-8?B?dmlUMEJ3akRBVE45d2t1cUJyMlk3c3FWYVBGUkV5ZmhFUTdHNUt6VlZtUG42?=
 =?utf-8?B?bkpWMUdDVlBreDZEZVBNZnlIVk9XcjkrZmRLVjFZUWtJcFpqWWVIMVVJOEcv?=
 =?utf-8?B?bFo2WXdZQnljelBRM3M2Zmt0K3haQk1POWNMVjVYcGsrQlp5a3MwZHF0SzRL?=
 =?utf-8?B?bFY3YzYxa0lpQjFWV2I1Y3E2TVdzcjUrQVlhT29MTFpxcjFBN0YwVnlYY1dO?=
 =?utf-8?B?RGVuMU9qTVlYSjZ0NXR1ZnBBcnoza3FhSGJUa2VJRFZTaDFUdFUxSnM1aHhJ?=
 =?utf-8?B?VUVaMUczMWdaRlhXcFZBVDZXT3gwWXJ4UDdsYzNJU2hKVHI3TFY3WjV0cnpN?=
 =?utf-8?B?Sm9uM0M5VmNJVXFqZEdOdm5hNlNWNHdrSS83UVJKcUhibG1kTkdXQVVFWTY0?=
 =?utf-8?B?SEYxNlpzNlprUTlUWWJYM2I3QzhqcjdqSXRiQjFodmJwYktEeGZyeXd4NHFW?=
 =?utf-8?B?QnpycEZhc0Y0dUw2VmRPR21ZWjFQamNmUlpGZGNQeXU5eFdmSk9ib0J1b21t?=
 =?utf-8?B?bmMzRFl3aGZDU0c4SWVHYytFMnBLOTdCZXdKWWhhVHdXOUhtOFZXTDJmZkNz?=
 =?utf-8?B?L3NUcURXL0V3SDMwczBsM3VQQnhQWDFUOEZoY25aMEtpUXdNWFU0NmZxMEV6?=
 =?utf-8?B?QUR1TDRlWjI5bTljS2xVUTMyTEVZbGNpUFJHeXZEUzRwOTg0ZUxyTnJETXM5?=
 =?utf-8?B?QnpIMFYwNjhwc0Y4RmJMTGxGYkVBYmR6TXlVT1ZJWUF1VWlKME83MFdtY0RM?=
 =?utf-8?B?RW1wdXZDRm5KalNyekR1cGt1UHN6WnI3ckxzMnVJM2ZHV2lRTkl3WnBxdXFQ?=
 =?utf-8?B?MjYvb0N1TzBaYU9HM3l2cmdBaC9pRDdNWkhiTWJqaldyRXhLWUZUSHliTWRS?=
 =?utf-8?B?SmVneDVpcWcxK05ZbkNod0tsNUJuejFNT0Vkd25aYzNhdGxybWFabkNvaW05?=
 =?utf-8?B?dm9udlRvME5WNFFMWDNsUHJXcWRiQXc5WmJyT0FSL0VaL1h0emIvSjlMQmtm?=
 =?utf-8?B?NlA0ZVJwWjZzVmE4U3pSYUR5WWtHQVhCYU9OM2k0L2FnQng2OUx0aVlXUGQy?=
 =?utf-8?B?SGlGZG8vSGxjTk9mTlRpODFUSXh0VDhHeU0wZFBOMHM4TzRvOTFSNVR4RWY5?=
 =?utf-8?B?UzFJbk5EWitCQ2xBd0NxMkxwU1VXWUlaOUhNa042ZW11c0ErV0lDdFVXK29z?=
 =?utf-8?B?RXBTem4yd1cvY2hvN1dacjZaZGRSbUFBNmZFT1U5LzA1M2hTRmRvUXM1MmY0?=
 =?utf-8?B?Q0xjbjJzT29IZGw4Ni8reGV1Wlp5KzB1UzNxL2xvek5CWXpPTGlMcmtBeHlp?=
 =?utf-8?B?SFFhRFZOaW0yYU9nUWhiRHYzTjhkYVlydVhWZ3RhbE9tajZGOGtkQXJYTElL?=
 =?utf-8?B?bHR1NS9XWVlaVG13TGpJQ3dvTkZxaDIxTzR1ck9rREVxUVA2amQ3U0paNngr?=
 =?utf-8?B?V0ZJZG0yNGlvOVA4RVdTYlU2aHVjbkdHb1lQV3YzUWhwRjE1QndKV1FBTnFi?=
 =?utf-8?B?V0FiZ1g4Y1orb1BFeWEzZU9vdkZ6UFUwOUQrRVNhZU8zVk45RTcwM0tOSHlO?=
 =?utf-8?B?Y0QwMlE3R283cjdrVUZpQ3BISjRZZW1mVkl5WmQra1VicWxuNDlWdXBWUFVT?=
 =?utf-8?B?SnJEVUNYaEpseDQxOHdOWEkraGNISmROUHduOHVsbXl1cmpObFA4REhqVE1l?=
 =?utf-8?B?TkVWRnJIeDdQbFJpbWxIUjhDNEd5MUdEcUxLdlRBNWt0cVJwcUhkWXNpaldD?=
 =?utf-8?B?Zkc3OXNudGZFMElHMXlkczJsSHlHTDZoUXhwZlRHZGZpemFKbnU1aWw2ZUJ4?=
 =?utf-8?B?YWk2dU1hMW1wMDlvNGZ2OVduS1ZsVksycFNKckJrWGgyOTVKanFMeXFhRThF?=
 =?utf-8?B?R2c1aVlmeGpyMkVKaXlpK2RFMUJ3UFphZS9HY0NLQ29rbUh6a0hVaGdVRUxu?=
 =?utf-8?B?ekl6TUdzZmZVc3NCQzFRdGJCc0lyaHE1TFJ3b1gxcXNTN2ZnOUVxbENxMWFZ?=
 =?utf-8?B?ZUpNdVVBUFVlWU15TlZnZFhlMVN6SXVEdjdCUTVEZERQcVY3a3RUMzAwR1hh?=
 =?utf-8?B?ZHY3cWh0d2IyRGtKVmVsNEJrMWcvRUsvWTV5Y3VoTjJqazk3NW5MNDBiajAv?=
 =?utf-8?B?L2c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3c129a-e0d2-411f-2ba8-08dd393d1e1c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:28:01.9052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKjWIc8WBBKm/a5AvomZFnLOa8smCcdRC8gsVfYpBA0GzSBO5HyNG/o9Gs8agOVdlICPCpsK3iDSv2g8rc1Py/KIz4M7CpBcFk7lxRigN8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_022810_828078_C59B315C 
X-CRM114-Status: GOOD (  40.43  )
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

Hi Quentin,

On 1/20/25 10:20, Quentin Schulz wrote:
> Hi Michael,
> 
> On 1/20/25 10:06 AM, Michael Riesch wrote:
>> Hi Quentin,
>>
>> On 1/16/25 15:47, Quentin Schulz wrote:
>>> This adds minimal support for the Pre-ICT tester adapter for RK3588
>>> Jaguar.
>>> GPIO3A3, GPIO3A4, GPIO3B2 and GPIO3D2 to GPIO3D5 are all routed to power
>>> rails and can only be used as input and their bias are important to be
>>> able to properly detect soldering issues.
>>>
>>> Additionally, this adds build-time overlay application tests for (some)
>>> Rockchip overlays to try to avoid future regressions.
>>>
>>> Notably, the Device Trees from Wolfvision PF5 aren't migrated (but
>>> should) as I do not own the device and couldn't figure out from the
>>> introducing commit logs what the possible valid combinations are.
>>> +Cc Michael Riesch for awareness
>>
>> Thanks for the heads up!
>>
>> Just to make sure I understood correctly: By migrated you mean that the
>> overlay entries are moved to a separate section in the Makefile and
>> there are explicit combinations of base DTS and overlays for
>> compile-time testing purposes? If so, I don't consider the PF5 migration
>> as *that* urgent. I don't think you can break anything on our side. Or
>> am I missing something?
>>
> 
> I think it makes sense to backport the patches in this series (except
> the one adding support for the Pre-ICT tester adapter on RK3588 Jaguar).
> Because we cannot backport the patch for Pre-ICT tester adapter (it's an
> addition, not a bug fix), any patch that is applied after that one will
> result in a git conflict when backporting to stable releases.
> 
> I believe it makes sense to backport build time overlay application tests.
> 
> The git conflict will likely be no big deal but if we can avoid it,
> better avoid it :)

OK.

> 
>> Maybe you can move the lines
>>
>>    dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
>>    dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
>>
>> to the overlay section as well? This should not cause any functional
>> changes.
>>
> 
> The overlay section would only support the syntax which allows build
> time testing. I would like to avoid confusion around what to do when
> adding a new overlay. Specifically note the missing o in the extension
> with the build time tests.
> 
>>> I'm wondering if we shouldn't backport patches 1 and 2 to stable? In
>>> which case, it would make sense to try to have the Wolfvision PF5
>>> overlay tests merged before the addition of the Pre-ICT tester adapter
>>> support for RK3588 Jaguar as that one won't be backported to stable and
>>> backporting the Wolfvision overlay test would incur an unnecessary
>>> (though not difficult) git conflict to resolve.
>>>
>>> I also do not know what kind of tests we should have when overlay
>>> combinations are possible (let's say there are A, B and C overlays that
>>> can all be applied, should we have base + A, base + B, base + C,
>>> base + A + B, base + A + C, base + B + C and base + A + B + C tests?
>>> maybe even base + B + A, base + C + B, base A + C + B, base + B + A + C,
>>> base + B + C + A, base + C + B + A and base + C + A + B tests?).
>>
>> I have never been good at combinatorics, but I feel this has the
>> potential to explode :-) My two cents: The overlays *should* be
>> orthogonal to each other, i.e., no dependencies between them in the
>> sense that overlay A creates a node that is used by overlay B and that
>> sort of thing. Then
> 
> I disagree. I can already tell you the following usecase:
> 
> our Pre-ICT tester adapter for RK3588 Jaguar has two proprietary camera
> connectors. We already have two camera modules working with it, so the
> following would make sense:
> 
> pre-ict-tester.dtbo
> pre-ict-tester-con1-camX.dtbo
> pre-ict-tester-con1-camY.dtbo
> pre-ict-tester-con2-camX.dtbo
> pre-ict-tester-con2-camY.dtbo
> 
> You would then apply pre-ict-tester.dtbo followed by one or two cam
> dtbos. The pre-ict-tester can be used without the camera modules (c.f.
> this patch :) ).

Most probably there is no general answer. In the end the use cases
decide what tests do make sense.

> 
>>   - Permutation can be ignored. (base + A + C = base + C + A)
> 
> I think that's fair. It would anyway be an issue with dtso which are
> using /delete-node/ or /delete-property/.
> 
>>   - Composition (base + A + B + C) may be ignored in favor of individual
>>     tests.
> 
> Not sure this is ideal either.
> 
> Our RK3588 Jaguar main PCBA also has two proprietary camera connectors.
> It would make sense to test that applying a dtso for main PCBA is not
> messing with applying a dtso for the camera module on the adapter.
> 
> This is a bit theoretical at the moment though since there's no camera
> stack available for RK3588.
> 
>>   - Individual tests may be ignored in favor of (a) composition(s) that
>>     cover(s) all individual tests.
>>
>> But of course this is likely to vary from case to case. In our case, in
>> the composition
>>
>>    rk3568-wolfvision-pf5-vz-2-uhd := rk3568-wolfvision-pf5.dtb \
>>      rk3568-wolfvision-pf5-io-expander.dtbo \
>>      rk3568-wolfvision-pf5-display-vz.dtbo
>>
>> would do the trick.
>>
> 
> Thanks, will send a patch for that in v3.

That'd be great, thanks!

Regards, Michael

> 
> Cheers,
> Quentin

