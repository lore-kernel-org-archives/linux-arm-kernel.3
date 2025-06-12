Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7F1C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvIVSBi1I/+NqrbQVP+a6CedQuv8IUOWr7i7p9aPmLs=; b=XqWfwebgO/1LnrWOYxjUzEMlsG
	shhFffdgEZ0FxrlfR5w6utclZwPOpXynYGEFCRRMQsfhIx8/dE/AqITun5RwKVpjyX1f/l1PTFedY
	LWNK9Ou5u9v9XecobeNOFHP/FROWHGcLWdafRyq1H/++mwfJO2pC8l4+y0C4Iquuty7Muv0B0OVuu
	++IyHKtK4gUOqIRBS+RejbRWykIbbccvr6llDbta72D4yQYyBcnvDG214fALtRx5TotSocSTfwxXb
	BZDYZLE9PDhivn6FMlpeD9QYUfKYL+H8GQDDwxXvcBFiAPo4t/pKuECxrAKryW6Mns3aOWfX2fokt
	k3prsj9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnsT-0000000EMON-3qQf;
	Thu, 12 Jun 2025 19:46:21 +0000
Received: from mail-westusazlp170130003.outbound.protection.outlook.com ([2a01:111:f403:c000::3] helo=SJ2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkbB-0000000DvGB-36Eb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 16:16:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEP1iZkFai9SxGlYT/1UXKyRgR8Juw5zGFmn7oARppayLebeV+k5Y/k1PiwoFFLwZECyaVcay0N4EVm249gzcmIvXqMTyRY6ycmQ04FbmxLeQdWdRfRj9UkUiLdyh+3vAGlGbhzvKhmQUDNmMMvOpTH2bL33E5nH6lKk0WXPX1FGWth5MbtvUN+Qtwri6qvIuP/OivsPF9tVDXT5uTURWF4nuWx5cnyMh7yNc67YSt/APB+wvF9tPSXCLRcQbmGg3uuG68NklY7hsQlw/aKziHWb/uzZrhBHEyYDsSczW/Bjnuv861ys9k3kJyiH8HwN20NlHqPj3KrQP+to1adn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvIVSBi1I/+NqrbQVP+a6CedQuv8IUOWr7i7p9aPmLs=;
 b=DsSRC+JLq5Kq+VltUlNaXyzO8xYVk4zxRHBcdkWj0ho8bCQaZrVn3W+X5EWl6psqlu8eKPWmzjsaE7/7YxXSkiv8BEaqN3sI1BmoaumYrSkxdJIJuTUepwInhpZA8t+82Ev6Iq986SpFRTi3WwCr2w87QHZzmyIBEpCvm2UcK3i3ryoZ/4hRq0UkpO1HzXuHnuezFURvZHQByVvdDmOPDK92DB/7NED4qTNc7Nw2hXsKPOFAJQoc6ttC2OQJWpm/G0hPT/9z0w6bKwjAW2o1cGMTnGCBWmyUlcJ/iEiwlrBlHKMM/VunDsMhppHLIJLxnk2/FbKesYWKekspfwVQ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvIVSBi1I/+NqrbQVP+a6CedQuv8IUOWr7i7p9aPmLs=;
 b=credTsYF8ihkDlq4bqezbZcfjsF/poQbpr7ESX9ETYiRK9YKDQq2oVIBDOWXivSVvhSxrjHUjpAfzZM14p/HNmTiaEFbkzvjv8xUvQYPEkztUuL93YQy+qvL0bwB5RZtUSUyaHH7vHLLzHxsakg2fvK+6MuW8fB4TrUvJgj1imc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 BL3PR01MB7041.prod.exchangelabs.com (2603:10b6:208:35c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.22; Thu, 12 Jun 2025 16:16:07 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::3513:ad6e:208c:5dbd]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::3513:ad6e:208c:5dbd%3]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 16:16:06 +0000
Message-ID: <36f59ea1-1468-425d-991c-c4bacefe0fd4@amperemail.onmicrosoft.com>
Date: Thu, 12 Jun 2025 12:16:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 1/4] arm64/sysreg: Add BRBE registers and fields
To: linux-arm-kernel@lists.infradead.org
References: <20250611-arm-brbe-v19-v23-0-e7775563036e@kernel.org>
 <20250611-arm-brbe-v19-v23-1-e7775563036e@kernel.org>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20250611-arm-brbe-v19-v23-1-e7775563036e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|BL3PR01MB7041:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd2844c-087f-4ec8-74a5-08dda9cc6faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWJrRTFMdjU0QSs2eWtJRjgrNm8yclJHMyt2ZkZVRFA3MDNXaU9Mb09Ua29O?=
 =?utf-8?B?TFZETXU1TDJTcjFJdndHMUFyVnF1YjJEenlUVGkxdktySkRkRitod3d0dlBh?=
 =?utf-8?B?bERYejNxTW9HdTJNalZPd1FDRVhWb1VtTjRMbkExRGNSK0pmUjZqNlhYNHc4?=
 =?utf-8?B?S3llMmI0c1Q2Z2FXbUVrVG5zUTl1Y1NXOTdLRC9WTVlOQ0dGcmxxYmQzZHJP?=
 =?utf-8?B?eE55RHVNbXM2ZVh0cmRzbWo2TDE2a3pUc2lzenFTLzVJa1I3aGdKTDBuQkNw?=
 =?utf-8?B?cGZwRXZrTWx3SWlmQXRUZnlqS3VhbllhZVBNem5lZHRqMFhmM0FpYm1oWmIz?=
 =?utf-8?B?c0FmTElqNTBYTUpYdmljVXdQOGFLcHF0ekV5YmFDS0l2TkJkZGYrWVpaRTJ3?=
 =?utf-8?B?SUxoVExYVUN0OG55V3VQTVhPSDVYUnNPWG4rTFl4NmVpcDJuZ2VYcDhPRnJo?=
 =?utf-8?B?U3FDUlhUNGpvaEF4dmJyM1p2RzFxVUFWUHZVZENzdDFBdndWNkkzTmNadmZx?=
 =?utf-8?B?VmNZQTk1TGZzNTBEVUQxUy9yWURBajk3Wlp6QmpnVG9VUmlOVmFlOEpPVFdE?=
 =?utf-8?B?cFpTa25BVm5pS1NqM3ZFVjF2WFlnczFSUW1TK20yMDBySjJSR1AySnpNV0FO?=
 =?utf-8?B?dFF5MWIyWmtCNm4ydUZJUzhGRC9uVlQxQjVydVU5aFMxdUtuQUJPMTZrTERZ?=
 =?utf-8?B?b1JkNStsZnVkTkVNWm1wOTVGS3ltQUdlZmRXS3dkcWZvMmhDTkRPRnFoL28y?=
 =?utf-8?B?WFZGRFBWaURhamExVVU1RzgyVEhpT20zMm8xZ2ZqRXJCT0JpVEdIdEJLdHhT?=
 =?utf-8?B?SDdoRUUvayt3MWM5eWFDdEk4K2hiMGYybHJSZS91eGxLdUpiK1NjV1hacFcw?=
 =?utf-8?B?cXpKMWpxWnprSStReUVaY1I5R1RlZEg3cHB4L3dSd1VsWEp6Z0lMUGNKQkxL?=
 =?utf-8?B?d25rVDhYWForWkVPdzh0aWRHMm1Pd3dHYnduVk1CSkh0ejV4NVVGSGFQSW16?=
 =?utf-8?B?TE1oVmpGdXdEd0EwUytDL0tHNXlabmZ6OFY0V2V6Q0xSMEFVd0t2bm52Mlgv?=
 =?utf-8?B?RFV4Zk5BcnVnblV2cGFqVHZSUmtkdHVVejBFQzJnS2QxWUgyWkxFODFkK0Fy?=
 =?utf-8?B?WFJwQkRDdkR6ZE1PcTExTUFkcWFVUXllaUNOaml3cHU0YnM5WUtsdExvS0pU?=
 =?utf-8?B?RzlmSlNGckQ1U0hvSEo5ZDc4WjArVW41MXdJOUNOL25IVTFIbVdZMDZ2aEZ1?=
 =?utf-8?B?WE5EbmVYd2dUNURtci81QUNmSHBLNHE0ajEydjZoemZqN2tSQXJOT1kybzc5?=
 =?utf-8?B?TG5DcTNZWndYTHByMlFPZEowNHVvNGtjT1VHcVVoRGZwZXBPOWYxc2N3VTg4?=
 =?utf-8?B?VTR0SkxoVTlPRTZvb0JtNlVSNEpWNi9iU2pnYTE2dWxrMWV0NXg1VUNVSmtB?=
 =?utf-8?B?aW1NRDg1M1RGRTZoQTZ5RmhuSFNjSmJxUnlCZnduaG9XOFdjTEVDOGIvSDlP?=
 =?utf-8?B?clpQbEgzbzFGcmxPeGpyTTkxWlVjdElJLzhhdnkvV2ovck1CS3NSV1pGN2wv?=
 =?utf-8?B?azNhU21KNG42aWVMd1R5MHoxZlN0Zm5uRnRJTVZKellnRWc4elRrRkw2UEE2?=
 =?utf-8?B?ckt2WVhTSVBRY2kvOXM1Z1IxSUNTM01MMlZGWWhVUWUvT0hiTWdEb21qTWFq?=
 =?utf-8?B?LzFaYnI0RU5uSCtGUG9sR2EzVm1lZjlLQ0xyN0ZMMFM4K2lqNTNjRXFjcERG?=
 =?utf-8?B?ekpEMFZkQjBEaGh1WlAyRU5qMlkzeVlkVDZ4UHVHRDRQaCtzSU9sb3k4SjZx?=
 =?utf-8?B?eGpFRW15Si9uQW5BWE9FSTF1Z2xZcEQ5eDdNTmJ6enRmeE9sTklhKytuNDVU?=
 =?utf-8?B?WGdRZmRFVnh5c2hqaXNvWHNYTVkwTlM3OUIwejJQUXlFT2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVUyTTNPQmRTM0pRYUlEc0RuZE9uUzIzQjA4WEVuOVcxYVNJSkg1em9OWlNK?=
 =?utf-8?B?K2RvejZXTHd4WmEwQUl0amVFQ25nRm5PZEZTR2pxTDZSNzRyUjdyTXlmMDhV?=
 =?utf-8?B?R2xpZ0xRbS82bThQL28vTlNWZUd5UkhoOWF0WTJPMEN3czZNTWpPeTR0dFU0?=
 =?utf-8?B?dGprSnN1ZEZDVjh6cG52S3hGQVc3UzNrYTdPejNSK3MrdzlZMUtobGNBb3RM?=
 =?utf-8?B?Zk4yY0FCUHZvc1dZUEc1R0h5aXJLOGFGaXFGckIySkdNZVMwNjgvSUlWb2JU?=
 =?utf-8?B?ZkYzQjVqY2N5UTNGSTdUNkFJaUoxT3ZvclZKVk40MzV3dERpS000SHJLRHBX?=
 =?utf-8?B?dmxsek5PV3Y4MTVzWVhNaEZJWjNtTml4NEJVOStpWjAxeGlpRVFtdXdwUExV?=
 =?utf-8?B?UmpUZ2NydHdjQUluNmt0dFhOT2RXalgwaUt4RjE5UGFoM0FKSTV4b3hVd2lw?=
 =?utf-8?B?QmYxTzVaMDN1UExGcVlWR0hjYlFzczJqay9uMG9IVFFSMmtrRGZKVjFLMG5V?=
 =?utf-8?B?eWxqYXlVRVlSZHNHK00zM1NJaC9oeTVDNWJpR3QvM1U0dkhua2xybkxzdFNp?=
 =?utf-8?B?aEhiVnFZVERGRlZiUGU5L3R3MGVIalp3SlFGY00wTnQ4cS9IMmlxQ0paZ2lw?=
 =?utf-8?B?Qzl5MWh3aDdVeTBHMlVkNE85YmJzKzZYbmtqMTVHcStpWC9lQnowSThnTDQy?=
 =?utf-8?B?d1BnemdGd216RjM1cTVZbUI5WHJKT1d5NEVlbnlzQUpwSkwrTnBqUkpsRWNO?=
 =?utf-8?B?cUFxa3VNZU5YemRuN0xxK3ZPQlMzV1lHckYzMnNnVlV3VHJJaHhRT3ZlWjdm?=
 =?utf-8?B?dmx6aGV0NGlESFpXWDZCM3dGeE9ZY1N4bEQzWUExajRsZDYzV2RWcHYrRVlW?=
 =?utf-8?B?VkF3MFlzWVpMK3NLTlgzRk10UjFqVnV2WFdNa3YwK3lJdVhONzBEVFJxMnBj?=
 =?utf-8?B?MUxXeWkvUWp5MW9XNU1INVQvQU1BWktnUFh5S3JWa2lpOTg5MjNsaUVaeVg0?=
 =?utf-8?B?SlJtTmgzcDhtbnM5Q29xdTdDcVRpY0xFcXZJYi9TOURCUjhKQkFnSndXVlJQ?=
 =?utf-8?B?WjNBc21GNVhJYlUzdDN2eEtsV0cwSWhOdmZ6eVFacUJaUGNxanoxTXlGMUNZ?=
 =?utf-8?B?U2s1d2NES3p0MkthRU01TUxoQ0dxZTJjeGZQWnJvY1djeitvRjF1UE44Q1ZQ?=
 =?utf-8?B?Qys1Y3RybURkWGk3d3k5aExpbTlhTmM1WmxRaElmR2E3SVJQODloOTQyYXlQ?=
 =?utf-8?B?S2ZNQWxRRXExMllJRlduNGxoVEhnZGgvcFY3OGE2UHVRV3FpUTd1L3loUTR2?=
 =?utf-8?B?aDZtaSs4WHcwWWVXbVlHTUhIUDA5R3FZbHIwZ1VTT3J0dnJkZ0o0QmZIei9F?=
 =?utf-8?B?VlE1Y3JkaFZCOENmalNLWWk4NmtDaWpLT3NEZFhQenpMZDc1ZzJwU2hlcXFK?=
 =?utf-8?B?WDdPMVk2bld3d1hJTHgwdWF5bTEwM09sL3BMQ3hzODRIaGltUElXcm9LZEMx?=
 =?utf-8?B?UDE2bWE0QkszY0xDYnE5dEZCQllUZ0J3dmxrV1lnVEwzd0N1dGVYMGNyaHJ0?=
 =?utf-8?B?Ny9Vb2hMT2Rndm5IcUJkdVJMUmIxMm5EQjhKV2VoeVMwYVlZK0RmRjJMMUs1?=
 =?utf-8?B?VTBYSzk4YnRyWmxDdDFRcVYzQ1A0V09WUythMGQ4UWk4OWo5Zm1pNitNSjlr?=
 =?utf-8?B?OGNTdE1MOUVHdVBPazF2RjI4US9rbkYwWCswVC9sVG9sZzBhS2d4Z2NlcUF5?=
 =?utf-8?B?TWsrbzIxNWlMZ1VvVCtRM2xIVnNiNFhyWkFlQVFXSWJKMmhoNWI4a1EwYW1n?=
 =?utf-8?B?akd1NGFxK0djTU01bitLOGsyaHR4QTRXbTJ6b3k3aGI5dkQrd1FzVk1LQkFG?=
 =?utf-8?B?ajhyNVUwWEVFYmx3U3VtV3ZUV1ZacUFmQnZVbEVvMXBhalFaVWlTcUxHcnVv?=
 =?utf-8?B?dmxjMXRrK1dIS0wxZVRIcDdXVDlNVVVrdzJWTkNySC9DOHozV2hZaTRhZmd4?=
 =?utf-8?B?cHhIM0I3K2JJa3dEVXZnZTBtSFFtWk8yUjdMUnd3R0Q0SnJFVU9kTlBPRTk3?=
 =?utf-8?B?MUFMMjJXall2K3RVcGxMbEF6Q3QxK0NDKzFBMmc1UGkvVGhrQU51NVp5ZnRo?=
 =?utf-8?B?YThWQ3cxYU5NQ1kxcXBqK2c5VXc4VVNlV1ZQbHRTemttUzZoQjdKMzNkc2lj?=
 =?utf-8?B?Mm5zVWl1ZkJiaXlYeldsL081R0ZZQWI0YTZOZFlrSlpCSEI0Unh4U3VkZWNY?=
 =?utf-8?Q?F1hDZhhensgbDD3qMKQvE8XP3cDoko1SnhO822v7zs=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd2844c-087f-4ec8-74a5-08dda9cc6faa
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 16:16:06.9462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1t4f4peZC/S9aixS93bgRE/C/gflFpDG9LWikx6IQB3uhGgR4rk/QKpS3M7CMcrnjjh2mmlcUC0XhHJfDbgAkT6Aosfj4/gQn2oSmc8eDALkGsYnmqLFpeA2z09GbIKd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR01MB7041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_091617_802037_6380D192 
X-CRM114-Status: GOOD (  17.10  )
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

tested-by: Adam Young<admiyo@os.amperecomputing.com>


Built and run on a BRBE capable machine.

Built userland perf tool

can run

perf record --branch-filter any,save_type,u true

as well as

perf record --branch-filter any,save_type,u ./sort

And will generate a perf.data file.

The mechanism applies cleanly and produced what looks like sane output.


On 6/11/25 14:01, Rob Herring (Arm) wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
>
> This patch adds definitions related to the Branch Record Buffer Extension
> (BRBE) as per ARM DDI 0487K.a. These will be used by KVM and a BRBE driver
> in subsequent patches.
>
> Some existing BRBE definitions in asm/sysreg.h are replaced with equivalent
> generated definitions.
>
> Cc: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Tested-by: James Clark <james.clark@linaro.org>
> Acked-by: Will Deacon <will@kernel.org>
> Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
> ---
> v19:
> - split BRBINF.CC field into mantissa and exponent
> ---
>   arch/arm64/include/asm/sysreg.h |  16 ++---
>   arch/arm64/tools/sysreg         | 132 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 138 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index f1bb0d10c39a..ef76a4b9e240 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -202,16 +202,8 @@
>   #define SYS_DBGVCR32_EL2		sys_reg(2, 4, 0, 7, 0)
>   
>   #define SYS_BRBINF_EL1(n)		sys_reg(2, 1, 8, (n & 15), (((n & 16) >> 2) | 0))
> -#define SYS_BRBINFINJ_EL1		sys_reg(2, 1, 9, 1, 0)
>   #define SYS_BRBSRC_EL1(n)		sys_reg(2, 1, 8, (n & 15), (((n & 16) >> 2) | 1))
> -#define SYS_BRBSRCINJ_EL1		sys_reg(2, 1, 9, 1, 1)
>   #define SYS_BRBTGT_EL1(n)		sys_reg(2, 1, 8, (n & 15), (((n & 16) >> 2) | 2))
> -#define SYS_BRBTGTINJ_EL1		sys_reg(2, 1, 9, 1, 2)
> -#define SYS_BRBTS_EL1			sys_reg(2, 1, 9, 0, 2)
> -
> -#define SYS_BRBCR_EL1			sys_reg(2, 1, 9, 0, 0)
> -#define SYS_BRBFCR_EL1			sys_reg(2, 1, 9, 0, 1)
> -#define SYS_BRBIDR0_EL1			sys_reg(2, 1, 9, 2, 0)
>   
>   #define SYS_TRCITECR_EL1		sys_reg(3, 0, 1, 2, 3)
>   #define SYS_TRCACATR(m)			sys_reg(2, 1, 2, ((m & 7) << 1), (2 | (m >> 3)))
> @@ -277,8 +269,6 @@
>   /* ETM */
>   #define SYS_TRCOSLAR			sys_reg(2, 1, 1, 0, 4)
>   
> -#define SYS_BRBCR_EL2			sys_reg(2, 4, 9, 0, 0)
> -
>   #define SYS_MIDR_EL1			sys_reg(3, 0, 0, 0, 0)
>   #define SYS_MPIDR_EL1			sys_reg(3, 0, 0, 0, 5)
>   #define SYS_REVIDR_EL1			sys_reg(3, 0, 0, 0, 6)
> @@ -821,6 +811,12 @@
>   #define OP_COSP_RCTX			sys_insn(1, 3, 7, 3, 6)
>   #define OP_CPP_RCTX			sys_insn(1, 3, 7, 3, 7)
>   
> +/*
> + * BRBE Instructions
> + */
> +#define BRB_IALL_INSN	__emit_inst(0xd5000000 | OP_BRB_IALL | (0x1f))
> +#define BRB_INJ_INSN	__emit_inst(0xd5000000 | OP_BRB_INJ  | (0x1f))
> +
>   /* Common SCTLR_ELx flags. */
>   #define SCTLR_ELx_ENTP2	(BIT(60))
>   #define SCTLR_ELx_DSSBS	(BIT(44))
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 8a8cf6874298..81c4e214ba33 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1329,6 +1329,138 @@ UnsignedEnum	3:0	MTEPERM
>   EndEnum
>   EndSysreg
>   
> +
> +SysregFields BRBINFx_EL1
> +Res0	63:47
> +Field	46	CCU
> +Field	45:40	CC_EXP
> +Field	39:32	CC_MANT
> +Res0	31:18
> +Field	17	LASTFAILED
> +Field	16	T
> +Res0	15:14
> +Enum	13:8		TYPE
> +	0b000000	DIRECT_UNCOND
> +	0b000001	INDIRECT
> +	0b000010	DIRECT_LINK
> +	0b000011	INDIRECT_LINK
> +	0b000101	RET
> +	0b000111	ERET
> +	0b001000	DIRECT_COND
> +	0b100001	DEBUG_HALT
> +	0b100010	CALL
> +	0b100011	TRAP
> +	0b100100	SERROR
> +	0b100110	INSN_DEBUG
> +	0b100111	DATA_DEBUG
> +	0b101010	ALIGN_FAULT
> +	0b101011	INSN_FAULT
> +	0b101100	DATA_FAULT
> +	0b101110	IRQ
> +	0b101111	FIQ
> +	0b110000	IMPDEF_TRAP_EL3
> +	0b111001	DEBUG_EXIT
> +EndEnum
> +Enum	7:6	EL
> +	0b00	EL0
> +	0b01	EL1
> +	0b10	EL2
> +	0b11	EL3
> +EndEnum
> +Field	5	MPRED
> +Res0	4:2
> +Enum	1:0	VALID
> +	0b00	NONE
> +	0b01	TARGET
> +	0b10	SOURCE
> +	0b11	FULL
> +EndEnum
> +EndSysregFields
> +
> +SysregFields	BRBCR_ELx
> +Res0	63:24
> +Field	23 	EXCEPTION
> +Field	22 	ERTN
> +Res0	21:10
> +Field	9	FZPSS
> +Field	8 	FZP
> +Res0	7
> +Enum	6:5	TS
> +	0b01	VIRTUAL
> +	0b10	GUEST_PHYSICAL
> +	0b11	PHYSICAL
> +EndEnum
> +Field	4	MPRED
> +Field	3	CC
> +Res0	2
> +Field	1	ExBRE
> +Field	0	E0BRE
> +EndSysregFields
> +
> +Sysreg	BRBCR_EL1	2	1	9	0	0
> +Fields	BRBCR_ELx
> +EndSysreg
> +
> +Sysreg	BRBFCR_EL1	2	1	9	0	1
> +Res0	63:30
> +Enum	29:28	BANK
> +	0b00	BANK_0
> +	0b01	BANK_1
> +EndEnum
> +Res0	27:23
> +Field	22	CONDDIR
> +Field	21	DIRCALL
> +Field	20	INDCALL
> +Field	19	RTN
> +Field	18	INDIRECT
> +Field	17	DIRECT
> +Field	16	EnI
> +Res0	15:8
> +Field	7	PAUSED
> +Field	6	LASTFAILED
> +Res0	5:0
> +EndSysreg
> +
> +Sysreg	BRBTS_EL1	2	1	9	0	2
> +Field	63:0	TS
> +EndSysreg
> +
> +Sysreg	BRBINFINJ_EL1	2	1	9	1	0
> +Fields BRBINFx_EL1
> +EndSysreg
> +
> +Sysreg	BRBSRCINJ_EL1	2	1	9	1	1
> +Field	63:0 ADDRESS
> +EndSysreg
> +
> +Sysreg	BRBTGTINJ_EL1	2	1	9	1	2
> +Field	63:0 ADDRESS
> +EndSysreg
> +
> +Sysreg	BRBIDR0_EL1	2	1	9	2	0
> +Res0	63:16
> +Enum	15:12	CC
> +	0b0101	20_BIT
> +EndEnum
> +Enum	11:8	FORMAT
> +	0b0000	FORMAT_0
> +EndEnum
> +Enum	7:0		NUMREC
> +	0b00001000	8
> +	0b00010000	16
> +	0b00100000	32
> +	0b01000000	64
> +EndEnum
> +EndSysreg
> +
> +Sysreg	BRBCR_EL2	2	4	9	0	0
> +Fields	BRBCR_ELx
> +EndSysreg
> +
> +Sysreg	BRBCR_EL12	2	5	9	0	0
> +Fields	BRBCR_ELx
> +EndSysreg
> +
>   Sysreg	ID_AA64ZFR0_EL1	3	0	0	4	4
>   Res0	63:60
>   UnsignedEnum	59:56	F64MM
>

