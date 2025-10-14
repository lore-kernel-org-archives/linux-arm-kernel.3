Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07409CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 20:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nr7oB/pqYIs2WXby4ZrH+gnFb0uI4y02QTKBJKNHjk4=; b=381TzFI7woQl/h07OMNz8TR6mU
	2IipS3ZuQiAEhb3njPmIOmWOMzYm9sneIXDjhbZvySPDTRrvoogsR6746LzLqhFfH6itx3pqGEe3L
	G5KDld3busAtr/sxiYg/ScshBv0HlZjRDabRulTpVapdwhOn5SP2NaGs8xcdCPMujVU0GHT+Bq3z+
	3gMK8SyNpBPYyDJczO7GwujhZtOKwl7FWpAbgAc5wKiyyKsBd0urbXMLkN73zGwDOIAcNWwvTCHVc
	6v1p0+Pdv670Rh/hby3USP5Sn9xhyd735J73CRmmHfovWWnGJOEjSF2gvMZfwwXS2AG9PiHxwtQ0J
	PiDKRQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8lYj-0000000HLw6-2kDj;
	Tue, 14 Oct 2025 20:23:49 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8lYh-0000000HLvS-2ufT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 20:23:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyUTlMGegGjGD3qPtBpzluH531SLtgAm0fRuQST9hGE/1UdDHhl7Mhd3O72XZZiPyFu3rWOPXkYR2pMLSdoQVXlpNo22A/zUa2GTEpI6zUNvYoMRSXqbFILzGCoJ3tAApx39QM7GzeT5rw4Ipaveg6DMus8ZlAYKFwq9kYvHyS/TKx6sHLm+MXf+yOH4yinnjEMZntwx62HrI69hFyYKURdxn10v49niAVwmqXFJdPH5xutR/tbrUC6skcVrs2XSxBH1LY5qXbWJvaWRkJt/7kA2VTA6ih3Nzy+tH3fFWEjrCU0o253QSGQBvhcCjHqVNy2EQlmj1LQxMm+W/zCDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nr7oB/pqYIs2WXby4ZrH+gnFb0uI4y02QTKBJKNHjk4=;
 b=NJW8Ewkde8tdMSfeSPxNewihJv1TfgsQAmfl8/CKJQvlZj2w2PIhpNBXK5IWm0BfNoCyJzbRRaY1KYU1ybEJbU3UzRdvRvC/Lc2gEApROarzlkZJgbqY0XVaZzxT1hve2W/ogXrpNq9JJWXGeLE20p0Dt8oPD5VFjqCLRGgM2CyP1hQfMGN8ANKR/8C4RIaR+wnNXuDJyNfgo+hEzQPF5I2xJ97ryWsxuDsFo1K6cVYhmOnYhu8NL6M+o9tf9cayWJisJ8rxU7jb3XrL1e0/ro3JlSjA0PrVmYuGWcEysaOo5EpI/+gBxBKrbD8bb85nQGVvaAS6tNoAeUBwUPxlkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr7oB/pqYIs2WXby4ZrH+gnFb0uI4y02QTKBJKNHjk4=;
 b=fYwhFmbID/+GqBUYjBBxELpK5HMLDmKRdVuKT9VadC7yB3q/tVmeyXMAOcW0VuiV0SpBXO+p3inFHcKbCQiiu7aDqNW1/qNwAflitp6LV9gxnx0qYHi8c2YBgBlFUKjneDNXYf84js/+P+GFNAnX0PGA+i3rwU85zw0LERohTxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CH0PR01MB7034.prod.exchangelabs.com (2603:10b6:610:108::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Tue, 14 Oct 2025 20:23:36 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 20:23:36 +0000
Message-ID: <833b32ef-20f8-44a5-9d00-e56f818e49ca@os.amperecomputing.com>
Date: Tue, 14 Oct 2025 13:23:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: mm: relax VM_ALLOW_HUGE_VMAP if BBML2_NOABORT
 is supported
To: Ryan Roberts <ryan.roberts@arm.com>, dev.jain@arm.com, cl@gentwo.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013232803.3065100-1-yang@os.amperecomputing.com>
 <20251013232803.3065100-3-yang@os.amperecomputing.com>
 <f6e31f0d-a256-4d58-adfb-4d3d97dbaef2@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <f6e31f0d-a256-4d58-adfb-4d3d97dbaef2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:217::17) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CH0PR01MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 537802ca-a1af-45b3-541a-08de0b5f8dd0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUQyZWVoakNDb2pIYW5GbzVOejN5UXBiSm02cFgzZFFUeVM3WE56WGFHeklE?=
 =?utf-8?B?L0FBQWNmOFNzOVdsNFBUK1I4cGw3a2trd28xMXExOXZGbFhZWDM0d2NVVkIz?=
 =?utf-8?B?RHQxd3lLeDNlb2lOamsvellCTjZ4anMyTjM0Y3N2dTBmSGV0ZmFKUmdBUWw1?=
 =?utf-8?B?bzhCYjVOeWJsUDQ0Z1BVS0kxMzRYU3oyTFV5ZitBVnl0SWtxSXpTNlp0QXly?=
 =?utf-8?B?YjZKZzIrRHN4cHNQZFlGQlVPVVBrK3Z3b1lUdThQZTlQMXB4NDhPbG9ya0dF?=
 =?utf-8?B?Y29KNVB5S25Xb05NSzlsck1BaTl2UW83SktORzJhY1o0aEtIRXFqUk5hRGhy?=
 =?utf-8?B?amVjelJ6bHd5S0tPZ0ZTdngxcCtKNU9LSWRURnFENlk3YW4xMGczYzdIaDdj?=
 =?utf-8?B?U0hqSm4wRDh1NGlDRXZLMnJpYzR5Nkg2M1hqTHhqQWxhbGNFcW5obTBtUEs1?=
 =?utf-8?B?cnBPUitJdFJFRzBuQ21jZTVNU0RBaUw1QktkbmdtV2xMWXowME5leTBjRXF6?=
 =?utf-8?B?eUxFelVmanlBRGRVenhEdE5WYXIxL2RGSjFESHBva1I5b24zajZ0b1duTUZt?=
 =?utf-8?B?YlZpT0dLZXlWdWkzb3pERVNRdVhvWEZRQWt5QndEUDJXL1VleWFxN1ZBaFpz?=
 =?utf-8?B?YXlYbU5mZUw5UXo4dUJiOHczcHIzVFhsOEZpWDZ2bWdaUmhsZ09Lc0UvcnUw?=
 =?utf-8?B?dEVobTFVVWJOUFBVWHF0OWVsQXVzbmlIWURiR0RzY0lqcWVZWGtOOHdQU3Rk?=
 =?utf-8?B?b3M1ZzlmVElzbHppRno1RjBhb1FMbmRjVExGRkhFTkI2OFpRRGVCclRrL1hl?=
 =?utf-8?B?K3NTN2tsbWRFV3k2blJjVE5BYkxFbkovTy81R0EzdjNxUUZGM0FGeXRMY05n?=
 =?utf-8?B?SFF0SUpSenh3R3BLS0t1b2xGOUVBdWg4TFhwNE9ybWRQUWRzQStpbm54MmFS?=
 =?utf-8?B?T0JJSVJqNlQ2RFZ6QW8rdG1nVXlRRktVN1B0Unh2MnJYNWp4b0hWbE1DbTBB?=
 =?utf-8?B?UmQxMm5tOGtCaWVlSWk0aEtVeTczd0ZSUDFHZFhVWEFsVk5BYXd6dDI1ZFhS?=
 =?utf-8?B?UEd6UzdHdFZQRGkvUFlXR1JoRVFJNWMzV2J6V0Q0SDBTcDNnMjhiU200THV6?=
 =?utf-8?B?K1dUUjZUWTI4OTZlWXhYK0MzVGc0cm84S29vbHJCWGlGN0trSncwdTFKOEtK?=
 =?utf-8?B?NDNxbEswTkx4c2NuU3dKY3lvM2dxMHhZZWcxbjRETnR0TFg3cjFLZ3hQMmI1?=
 =?utf-8?B?WnA0NVk0WnhIckpiQWNiNmR6cVJBaXBSK1R3UkpJNHVnZ0RpekZqeFkzemJ3?=
 =?utf-8?B?d1I0UGlXTENNSXVzYTgvL3RaNkVIRFI0YnpkbTdoRE1pNHMrMGVXNzNRQWhE?=
 =?utf-8?B?SlpiWWwyc1lkbVg2RUVQdXhMKzVyazQvYzNSbkxZeXpHVUVZMHBIdDRiZzBG?=
 =?utf-8?B?OUhHMHkxei9uTERRdnc4ZTZURFpYZWtDN0hPVzZ0NisycXdaTXVueHVSaWJ5?=
 =?utf-8?B?Z0p1aDJDY1VNWE9MWXI5U0dpM2M3bEhLVTh4SDBOTjJyZWJQaVBmWlNITnRU?=
 =?utf-8?B?eW9lT0RnVjFVNXhVdEdFK1FqdkxSblJwTGRjbkdSOVRyT3hmcmFlVWp3cy90?=
 =?utf-8?B?djNBcUh0cEsxVVR2Wno0OEh6VGVlV0VOQ0JnS2hMQ2VORDN2YXYxamRMUDVX?=
 =?utf-8?B?L1dkellZQ2RuZytEMTVPVmVoRmZpYlVXRjlVajR2Z2pjSXdNU24vZGRmWFNm?=
 =?utf-8?B?RlJUOHVwcCszNTN3UE95WFNnd1pyRzBBaGNZNEdvTTUyOURkQ3pYV24vYjg0?=
 =?utf-8?B?Ty9BSG10d1NUR2NyV3ViUHJ4UE5YWkdscHAzd1ZGaFlsRzZtd2JqOXJ4VGFX?=
 =?utf-8?B?bGd3WFdJWnIvdUZtNXYrUU9zQ0NkZFBjOWxrdksrUU5objRZTUc3SlF3MXhU?=
 =?utf-8?Q?ZxMJ6KFlHDqSE8Vi9SyZIncmM1azX2C5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTFJQmRtaGtNcktTRjBES1JkZ1A4VGd5QnNLS2tqaWZnL0piQ01UL2E1VVFj?=
 =?utf-8?B?NjJ1emVQS242MXA0eFhPN2dFbWUyWTRqT01wTzdJWFAwZ0ZPUUhUWHUyeERu?=
 =?utf-8?B?YzNmeU5xM2Y1a284YjVUOW9lZ0JOL1JEZFZhMnFkNHBMelBGVGpnUFRoa0tu?=
 =?utf-8?B?cDFLcEkrMU5oZ0w5cjdIWXIvNHBqVVF4TS8yckpTdDZFNGMycUxTQTY2UVZF?=
 =?utf-8?B?bWtOS0xKMVdTSllSS3U0UTJXOVdMZHJXR2dGd1ZVb0poYmJMd09Zbyt6Ym1V?=
 =?utf-8?B?S1kvRm00dFd3WGVjT3p5MzhYcU9XdUJtQzRxNFNYcEJmdmJoUHRDc1JuM1hS?=
 =?utf-8?B?WjQyL1NuRTFQQ1BoTG1lVUpKUXUraTJaUzVRNE5Vajl2dEU0UWpOcFd0TjVO?=
 =?utf-8?B?Z1dneEkvOWE4dTB6MEtTdXBlWDhKYWpwcklKR3VKdFlHcjhGL3F1RjlLcCtj?=
 =?utf-8?B?aXZCMFljSHF5ZXovazZuVmtkWC9wTDJ5WlhmQm1oQnJTU0N1RXpvRGx1czBK?=
 =?utf-8?B?WjFZbmt6SzB1ZmtHVUZCWmVRYWRvY243NlhKS2hmRXNMSE10eVNsOVNyeHcw?=
 =?utf-8?B?cFA3NFhnS1N3Q05xUTJCUVdwUWdlUTllRzh4T0pHMklJV1k4WFFmazNoNUMw?=
 =?utf-8?B?Y08rZEswQ1NtdGNHc01GcVdqUkVhUHExSmsvb1dMamtHbXN2azAyejU5Z0pm?=
 =?utf-8?B?SmFkWi9Wa2c0NU1iR3lRcC9MaWYvU0RKMU9KK011YkxocStRYVluZUFpS3JQ?=
 =?utf-8?B?aHFQRzVLeGh6Zm5oZ2JmVzhVUUlpNHpLbWNJQmRsU0hFOFQ4WmhLaHIzNjRZ?=
 =?utf-8?B?TXF1a1pJNVhDM2Z5QTYyQ1Q1NzltS2taaVR5STc5eE5IRWZjN0lPOTZaN2dD?=
 =?utf-8?B?WjlzQ3ZncHY4VHBCbmFDSUhUK0FJQ3JYZTBRekhuM3NqTDRHVTc3QVNmd2xn?=
 =?utf-8?B?bExjN290MDQ1Wm9OeFgzQTFmWDRVVWFKMEE0Sncrb2x6VitoaHJmZFZZdmUv?=
 =?utf-8?B?Q25LY3o4NVZtMGtFaDFYQWVtNUVaMUx3c0h5Wkh3K3RGakdha21hMnk5M1l3?=
 =?utf-8?B?bG5NNWp5Nm91RldIRlpWWVlTakgwajhRb2ZPcnRMcWdhTTBsWDdXNzdHVUpM?=
 =?utf-8?B?d25iQk9zTyt0RDJBTlhCc2tXTGY0VlBhdVZZUEUvY3pML3E3V1hJcjZrN3h6?=
 =?utf-8?B?M0lrblUwNDRveHk5UWtKZEhqYmlGeDI4UUowT3ZDc3FHVGN0UWxSVG9VWWU1?=
 =?utf-8?B?TzJjRlRUSWJncXRqeGtqdVFpVUdHT25vZVd0eHR4UksyRjZ2cGpKTkNoRTBP?=
 =?utf-8?B?YWhneVBYNmQwbmFKd3MrMDY0OE5WMWpaNGx0MUw0eVFhZFlEc3hoWWRWWUxF?=
 =?utf-8?B?RHJDTlh6eGJOUFJRU2Fla2xqcXdaKzk3bE1oN2tIbXY4YlNRcUZ5MEZzd0VB?=
 =?utf-8?B?Tm5iNFRrY0ZBRmtmZWNVRm1OVWN5ZEl0U092WHAvYTk4azdUbWkzQk5OaTNZ?=
 =?utf-8?B?VnNib1hBdGpkZDg1ZlNGcFNOYm91QWMyTlA1ZjhGR3FRZ2dzWWNnRDUxUkFG?=
 =?utf-8?B?RW5selRoQlB2K09uRXljTWROc3NyZkk4a0ZhU1ViUUNDNVZEdzRQc2NRNERk?=
 =?utf-8?B?TnB5RnhnSVRrYituNTZycE44V2owK1lGNW1sZnE1UjFqREFpUkVjcnkwOUVU?=
 =?utf-8?B?Tzk5NTNWYSt5RmJ0KzhQWFBtUWcwZDdXSkdTZ1dzaW40SFlZMUJJQTNvYW10?=
 =?utf-8?B?UjVKNFQvd01NOHFvTVN5ajBDRWpTU2JkUG9QQ2h4eUpwaVVDby9aOXpVeFNs?=
 =?utf-8?B?cnNQdnR0K3ZYVzg2YlIzQVdxTEtJMXpwWVhKdVpyZFdpZk05T3U3dVNFcitM?=
 =?utf-8?B?MUZOeWZ5ckhHUjBmNnp5d3BwdmR2QTRMbllLNGhTNExaaDR6b244UlA2bVdx?=
 =?utf-8?B?a1RVaU5nNE1USURHR0RBSmpZakxwT0lKcWVrOThNTWZTcml5TmxuYkxjRlha?=
 =?utf-8?B?aUo5R05jSVBNWkxselhRZ3BaNGVVZ2JDWlovdlhBZ3YwYnQ5TURya0FqYzlP?=
 =?utf-8?B?Z2JTNWxGZ1RiT2JrWnVUL1BjRktIeHppM05LUW1kVXVDd21BakgyN1BuczBx?=
 =?utf-8?B?c0lVTlNVSjJkUGU4UTdMNWNpVTZhYW5DZ3l3QndzTnVtenZIS2lpQmlFYlJk?=
 =?utf-8?Q?qkPDYf0yl5f+6aq1iO21sto=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 537802ca-a1af-45b3-541a-08de0b5f8dd0
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 20:23:36.4364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K173PpPLb2mnPvmqG5Yf5jHvS3fgMUIOGzOzWxA63pvRXpyxVpSEwjBcKXNaff5pgVdEa5bfofxO8l3vkcXFAUKMjXys38RFYnIDo29pmYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_132347_744538_5D0D8548 
X-CRM114-Status: GOOD (  25.21  )
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



On 10/14/25 1:08 AM, Ryan Roberts wrote:
> On 14/10/2025 00:27, Yang Shi wrote:
>> When changing permissions for vmalloc area, VM_ALLOW_HUGE_VMAP area is
>> exclueded because kernel can't split the va mapping if it is called on
>> partial range.
>> It is no longer true if the machines support BBML2_NOABORT after commit
>> a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full").
>> So we can relax this restriction and update the comments accordingly.
> Is there actually any user that benefits from this modified behaviour in the
> current kernel? If not, then I'd prefer to leave this for Dev to modify
> systematically as part of his series to enable VM_ALLOW_HUGE_VMAP by default for
> arm64. I believe he's planning to post that soon.

I actually just wanted to fix the stale comment about "splitting is 
never needed" in the first place as we discussed in earlier review, but 
I realized it doesn't make too much sense to just update the comment 
itself w/o updating the behavior. Because the skipping 
VM_ALLOW_HUGE_VMAP behavior was added because va mapping can't be split, 
so it makes more sense to relax it if va mapping can be split.

I looked at this patch more like a follow-up fix for split kernel page 
table than an enhancement for VM_ALLOW_HUGE_VMAP. And it also seems like 
a prerequisite for Dev's series IMHO.

Thanks,
Yang

>
> Thanks,
> Ryan
>
>> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> ---
>>   arch/arm64/mm/pageattr.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index c21a2c319028..b4dcae6273a8 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -157,13 +157,13 @@ static int change_memory_common(unsigned long addr, int numpages,
>>   
>>   	/*
>>   	 * Kernel VA mappings are always live, and splitting live section
>> -	 * mappings into page mappings may cause TLB conflicts. This means
>> -	 * we have to ensure that changing the permission bits of the range
>> -	 * we are operating on does not result in such splitting.
>> +	 * mappings into page mappings may cause TLB conflicts on the machines
>> +	 * which don't support BBML2_NOABORT.
>>   	 *
>>   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>> -	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
>> -	 * mappings are updated and splitting is never needed.
>> +	 * Disallow VM_ALLOW_HUGE_VMAP mappings if the systems don't support
>> +	 * BBML2_NOABORT to guarantee that only page mappings are updated and
>> +	 * splitting is never needed on those machines.
>>   	 *
>>   	 * So check whether the [addr, addr + size) interval is entirely
>>   	 * covered by precisely one VM area that has the VM_ALLOC flag set.
>> @@ -171,7 +171,8 @@ static int change_memory_common(unsigned long addr, int numpages,
>>   	area = find_vm_area((void *)addr);
>>   	if (!area ||
>>   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>> -	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>> +	    !(area->flags & VM_ALLOC) || ((area->flags & VM_ALLOW_HUGE_VMAP) &&
>> +	    !system_supports_bbml2_noabort()))
>>   		return -EINVAL;
>>   
>>   	if (!numpages)


