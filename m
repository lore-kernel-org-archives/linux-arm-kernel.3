Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086E6CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXEiZH9nIoRIzjG+ZNjr0J1RW2yaY0gJvodWoSP4WXw=; b=19AhokPraaSXYsdzRL+oG8eWBC
	E0XrXliddkPcRc9Z11/knKCtxLWPRrgmhcZFKfzJnRD1GuYAJMbyEcuutnX9UiT2WgUXxTuAY/U3t
	B5fgmEqvsYeO2ILbMZ8EwK0+FP04xxRf6URqk2JDT45j+rejr55k6KQ+o1/bBtTMwy191zidrnDbW
	vsC7lzFu/xSQ8lQctQC1rLuWjsS5Hbs0t4SNp29+1KscnziD5vgmSQ4cuZyw/ME1/te7/Cq6Cyov0
	GzmeMRaZK+JwDF19cNf/FfqbCIpJEWC4fMi2qDdTLi3jUDJ9IualsqPGEn7KGUP/GrXhsk6HKndSx
	K7pkowSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPm1-00000002IyZ-0AnI;
	Wed, 07 Oct 2026 11:25:25 +0000
Received: from mail-northcentralusazon11012063.outbound.protection.outlook.com ([40.107.200.63] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPls-00000002Iwy-1bf2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:25:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwPn7fUYC50Xrp+epWz/JBa9ISYoo9FATrWHDjdrzYeb0PWgSVuf+6syUaFlm4CJzjAuB+Tn1vRrBEXI7cejOJqe+IF08e4EaGFbNzIuhiVKZ/eI/FIX+nUARIvSTagQlZ5xLgntJjb0wE6PUyorIJuIRflbYHQ8JlWOdg5hjdBBFGx6nPFX3yjGOzJxL9r1xP9QFRZk0b23ENVc45W2ZoL2CxOodQpjfFHHeRZlQ6WAGHhpTZP1bv1updjCzSnkvLQRLa3sW6bbZs+eXdu0xryNi0Yl22FovkjlwWjWY9XxOtiKLuU3eGpYTMWoFjKASInKQmHXFKXbdYtlh3l5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXEiZH9nIoRIzjG+ZNjr0J1RW2yaY0gJvodWoSP4WXw=;
 b=Yep84XdnnmqeUSj72+l11uQe75CNqZ8JB63JS47/mBs7jspuFrLVxye3lPKMMubTok8mxNanCTJsK8DLpGn2UZv7hcVc/lDAyqeP1n158ByRRUcBxqOoVHEWiBQoCKkqvgjdqB2+OskB/TfXo4TG6G7ZcTeVIPwMZ69HfBnPzR911Yir3dH7omJ7SckQSxLovBdEeeKjmInzUgm/7I1EVLn6kbeywCVAQHUso7OmvbUZX+ZEN3Y1N3Y6YAYN3UgCZTDaMQqj8nx8kN+99gpiClxxnd2a3ghikIdetqlVSp+X5vMMg+BdeTAAR+NjR47Jct6wyDWLu1X8q+yITiEXGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXEiZH9nIoRIzjG+ZNjr0J1RW2yaY0gJvodWoSP4WXw=;
 b=Lbib4CWHm8uLH9PXr7251O4FcLVy9/r4nynwjtzZ4p5z4lNgxXpdAZnNGrYWilL+l63fEvAihjBFBK+szhn/6Qj1rjXlnUd5BY9qdX3gIyLIoB5OtCiiBqEnOs2vfMdROdxXDIRKksrYRafXi8ICsJJ69qNiDIWPJEaTsxHKo/A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8)
 by MW4PR12MB7262.namprd12.prod.outlook.com (2603:10b6:303:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Wed, 7 Oct
 2026 11:25:08 +0000
Received: from SA1PR12MB7366.namprd12.prod.outlook.com
 ([fe80::ec75:5e87:d973:77e6]) by SA1PR12MB7366.namprd12.prod.outlook.com
 ([fe80::ec75:5e87:d973:77e6%5]) with mapi id 15.21.0496.015; Wed, 7 Oct 2026
 11:25:07 +0000
Message-ID: <6ef05629-255d-4a45-958e-7bbdd3c62a79@amd.com>
Date: Wed, 7 Oct 2026 16:55:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] firmware: arm_scmi: skip empty CLOCK_DESCRIBE_RATES
 replies
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, cristian.marussi@arm.com,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20261001114538.671755-1-jay.buddhabhatti@amd.com>
 <20261001-persimmon-wallaby-of-popularity-c29bf3@sudeepholla>
 <00a75d3c-f863-4ed2-aa3f-a6668e5f74f0@amd.com>
 <20261005-powerful-skilled-caterpillar-e2fdeb@sudeepholla>
Content-Language: en-US
From: Jay Buddhabhatti <jbuddhab@amd.com>
In-Reply-To: <20261005-powerful-skilled-caterpillar-e2fdeb@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:264::6) To SA1PR12MB7366.namprd12.prod.outlook.com
 (2603:10b6:806:2b3::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7366:EE_|MW4PR12MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed6d8a8-f3a0-4ff6-7c68-08df2465a435
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|6133799003|3023799007|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: vMON+Z9EbTrUdqN28lsZLDUmkyMTvY1QYiGefOPoB2DJwGZzOdh8FyFVZ9xq/+SHKEg4wrm3PGfy6UpXSeBMFausM1lv8KG9PhdKsR7PJ6ytIc/5gM7eeq5pRgMqiYnDtd2l7RdJHOibLQuOoUGMu+eHTUW9awUF5EqKoZgIsHOVmCIpTfGnqvJnqPSVA8qwh/k9t+ePgQ7c1Vfjd+i5siuX+bPDwCdu5burFK8lhkv77v5NYnNvtKIVlcUgn2RSWxMSTdAucWNJdNz2Y9TdJZkYL/x9oNIpB5tjTlVaLrfTKQ6uQzLZwQviDMy349JOrj3Zdwtni5Fc/JEWnovyaywJ5K98M+hEwMTvhYA7Yj2nhkX7uD2HcsGBzXIvfpqXCSSSuBqV6bMuI3oMk4A96AvSeXvEiox/hcbmbA8ULxHWIlTJvWbxfCUGI0Wx3vmbXFmYNfKsRlhU+F7D1TND2wOO7a7Ucw0oNBYBZdVnag/4qm3ZqC9y3NL5bZEfWjvxD+zDW+ebGKxEBv8ue1zgP4/i4tMI05i0I1oFjFLOVkexzUFSsQhFyUX4y6ADx6/sALG5xWLMWzNEillNZ5MYzBCBPCqUFJsAExptLitTIwrUVbLje4MaxPoLeTUfOyXpfjqkcu2yCYOubG9a4xFlM3RKdfD+tXbN6y5Sz6iEBKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7366.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(6133799003)(3023799007)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU55VVUwTDhOVkxlK1FZSzBZTUJPeklITXpOVlFyNGZ6ZnFNZ0p1VTBXd08y?=
 =?utf-8?B?YUpNRktqYnNmSnRsOGVlUEloTXVjREFWaFFsQlVNUE5lREt1SXFGOU1xSUpE?=
 =?utf-8?B?eEFiRHltR0lQTXVsdTU3c3UySW1ORllJa0dGQk1IdWUwcnZLdGpQRWdHMlZ0?=
 =?utf-8?B?cHhQNDdKSWRObk1BVEt3ajFRVDJDa2RiVkwvNGFKRGhhK3g0eUxGbk9PKzQx?=
 =?utf-8?B?SG1ldXFvUnhjSTlYMUVRQWxvaWpaS0FnRUxLMHYwbnk4cnNNdW9RTWFRVi9K?=
 =?utf-8?B?UkVCbjB3c2dWdEhVejRnQXZFM2RQWEZDUmQvNzhPN1p0cHRQMzJEQVdGTnZh?=
 =?utf-8?B?ZStrL2hvcW5PMkFkZklRakllays1L1RTaVBRcFRKajRrU3ZIa1o4ODdPL3NT?=
 =?utf-8?B?VXlsSUVtSHJ0Y3crblVCZVFrUExBbnY3U3A4VlBoTzFvdVRYaTk0RU9rQnJF?=
 =?utf-8?B?N3l3WndSY1JsRXpJaENDZXdPSlVRaDVBeVU3RDVzektLRVJYVmhId2x1dCtu?=
 =?utf-8?B?NkduWEtjdlhtRTRRdEQ3UTBsdGJlTGRWRnF3R2RCRnRZUE91WGtXUDVuK3Z2?=
 =?utf-8?B?bC82OFZoMktCZmFqMGJwSGV0N3h6WHduR3ozUnc2MVEwa0ttc2doeGxJWlJI?=
 =?utf-8?B?eUsweXQxWWRENDNFQ0FDOHNnQUVDb0pxY241UmFKMVluWmtUalF3eW9HTjRU?=
 =?utf-8?B?YTZCZ2ZzWUxpbUNNUEFaSnp3SlZ0SlJ3TnlrMnBQaitHOXg4Z0VXYThTNWE5?=
 =?utf-8?B?MlBFNDk3WTYwekdHdEFCTGNYcU1tdnhWUkJFa0V3Z0RiTDg5KzdNejE0MytK?=
 =?utf-8?B?bjBJTFRscVJDOGNvdFRmVURJNDU4L2tWM1NzcnV6MWl3c1NXVDk5OElqeDh1?=
 =?utf-8?B?dWkwT1NsbUI5UndiODRtaVNlWVZzWFE2TFphcHN5UjZGSk1GbDFHNUFkNGtt?=
 =?utf-8?B?MzkzZVZGSEJWdjZNMnBORm1oUDVNQWNLYmhuZFE4TTZEZ0dyZzBnNFQxcEg5?=
 =?utf-8?B?YW1GOC85VERLTGNnMFlmZy9WZ2JSZ211Sm43Sk5qampzT1kxeFEyZE9ZZ1hN?=
 =?utf-8?B?Wk5Db3hIMGhsRFNZY1ZsUktZWWhjUTdvQmhLRGVGd0hxcU9QV1dnd1lORENj?=
 =?utf-8?B?VTcrQjVzQXNQa3hUNk5uajFPTVFReUlUNlFnUmtQVy9sQ2dsRzVSVTBIbnZX?=
 =?utf-8?B?MEFkOG5ZMWgwMjQyaUZPeXdtYlZDWUxmcjl5Y2JEOGVMM0YvMWs3NlZ6cmNQ?=
 =?utf-8?B?bStmZDZmMnoxejh5aXZkTUlXQ3pWWTVsWENjWHZLalQ4dzhWVkRkb3ZZaDJX?=
 =?utf-8?B?WngzVjZvSHZUMlRiNlhzTEtYUHVjOUlMQzBGNWZoMjU5NkFEMFVpaFk0VnBU?=
 =?utf-8?B?QVRBNFZFaHl6cmY3RUxYVW1GQlFRMTY3VDRya0sreVVmbS9BVzZBK0lSMEZY?=
 =?utf-8?B?UklPdTg3NUJyMjJTVUFZazJkN08vb01MWTZSQ3p2dzRCS3ZuZ3ZINUI4TVVI?=
 =?utf-8?B?bWU0RjUrbWdGejR5M2U4bnhWN2lBdVpNWnBtZ05JTXhsVEpZVzZxNy81aEFo?=
 =?utf-8?B?VWlnRzFJVkUwQVdtNjlRcDQwTFNVbllPeTh5QlZEOFdjTGxwQUc2NjhHYjN6?=
 =?utf-8?B?L0o0eVNWazAvOERBdnI0dWZ6S3RpSVhVTm0rOEFRZWxZa3dlOCtTN0NrNThI?=
 =?utf-8?B?NjM4KzVaSndCdXJBSVVpUzBoWWdOVDhiaS9qK2gwMXgxbmh5LzViaERXZDZY?=
 =?utf-8?B?S0JBN2RmQVl4cTFZdVp1ZW91S2czR3FEaXNGdjNFMkhpazZCMkRPY1d0VjlB?=
 =?utf-8?B?RDFId0F6RG54SWxVc3ZVOFBJQ1BMYzIxUnZQMFB5MkVPQzZ5eENCS09EMDIx?=
 =?utf-8?B?SmkxS2hzMkRVclRFcjBQK0xXa3lhM3g2K0FkWjI3dHE2cjl5RkZnODNhbnJX?=
 =?utf-8?B?KzJYejVWcHVMR29QNitiT2daZWNTcVYyMlkyR1VVQmgxNzc2MGVEN2d0M2h0?=
 =?utf-8?B?bVZySnJ3dEhPcVVpL0dPdmo4SzhBK1dHdWllanNUZThnanI0V2ZnUDl0aDF2?=
 =?utf-8?B?TDYrTWZrSFBDYXBMeUxwR3RPczBtWXRKSUR2N2NNdXZBc2JOd05zK2hkWDRN?=
 =?utf-8?B?VldiU1liTTRISGtUMlpqTmdBTzI0N2pQeUt0NDhnNkJZaEdtYi9iUUUzL0pG?=
 =?utf-8?B?RXlramhJd1JUdWxsTEZlR2hZQkYxempUaS9hTElxbUNnNFd4VWUxenc2WmdD?=
 =?utf-8?B?SUppKzNJSXgrallIUDIyZW1sRHUzbk9JeFo5ejlpYVR6UmNaQWcxWUNFeHha?=
 =?utf-8?Q?tzfDFYMEl6DQumw8zv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed6d8a8-f3a0-4ff6-7c68-08df2465a435
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7366.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 11:25:07.7254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcEtrqMFqIpx+oRZNNvSZeuxh1+y8uDBc4I7GKxmtQN6fAgLFKAd2Yl5yf1M6U9l47hLAiNSVjLJnjShT6WSng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7262
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_042516_444957_E390F87E 
X-CRM114-Status: GOOD (  26.01  )
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

Hi Sudeep,

On 10/5/2026 9:01 PM, Sudeep Holla wrote:
> On Mon, Oct 05, 2026 at 06:06:09PM +0530, Jay Buddhabhatti wrote:
>> Hi Sudeep,
>>
>> Thanks for the review. Please find my response inline.
>>
>> On 10/1/2026 8:14 PM, Sudeep Holla wrote:
>>> On Thu, Oct 01, 2026 at 04:45:38AM -0700, Jay Buddhabhatti wrote:
>>>> Some platforms advertise reserved or uninstantiated clock IDs that still
>>>> succeed CLOCK_DESCRIBE_RATES with zero rates. After dynamic rate
>>>> allocation, kcalloc(0) returns ZERO_SIZE_PTR and protocol init then
>>>> dereferences rates[0], which panics.
>>>>
>>>> Do not allocate or index the rate array when the firmware reports an
>>>> empty list, so unused IDs are skipped instead of taking down the SCMI
>>>> clock provider.
>>>>
>>>> Fixes: 62ba967595e0 ("firmware: arm_scmi: Make clock rates allocation dynamic")
>>>> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
>>>> ---
>>>> The SCMI server is the source of this zero rate and successful response
>>>> and it should be fixed in SCMI server. This defensive check in Linux is
>>>> still useful because firmware responses must be validated before
>>>> de-referencing dynamically allocated data, The panic is a Linux
>>>> regression introduced by dynamic rate allocation; previous fixed array
>>>> tolerated the same response and other SCMI implementations could return
>>>> the same unexpected response.
>>>> ---
>>>>    drivers/firmware/arm_scmi/clock.c | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
>>>> index 0278705d809e..8934a95527e2 100644
>>>> --- a/drivers/firmware/arm_scmi/clock.c
>>>> +++ b/drivers/firmware/arm_scmi/clock.c
>>>> @@ -8,6 +8,7 @@
>>>>    #include <linux/math64.h>
>>>>    #include <linux/module.h>
>>>>    #include <linux/limits.h>
>>>> +#include <linux/slab.h>
>>>>    #include <linux/sort.h>
>>>>    #include "protocols.h"
>>>> @@ -484,6 +485,13 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
>>>>    	if (!st->max_resources) {
>>>>    		unsigned int tot_rates = st->num_returned + st->num_remaining;
>>>> +		/*
>>>> +		 * Unused/reserved clock IDs return 0 rates. kmalloc(0)
>>>> +		 * returns ZERO_SIZE_PTR and must not be dereferenced.
>>>> +		 */
>>>> +		if (!tot_rates)
>>>> +			return 0;
>>>> +
>>>>    		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
>>>>    						sizeof(*p->clkd->r.rates), GFP_KERNEL);
>>>>    		if (!p->clkd->r.rates)
>>>> @@ -505,6 +513,9 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
>>>>    	struct scmi_clk_ipriv *p = priv;
>>>>    	const struct scmi_msg_resp_clock_describe_rates *r = response;
>>>> +	if (ZERO_OR_NULL_PTR(p->clkd->r.rates))
>>>> +		return -EPROTO;
>>>> +
>>>>    	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
>>>>    	/* Count only effectively discovered rates */
>>>> @@ -622,6 +633,13 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
>>>>    	if (ret)
>>>>    		return ret;
>>>> +	/*
>>>> +	 * Some platforms expose reserved clock IDs with an empty
>>>> +	 * CLOCK_DESCRIBE_RATES reply. Do not dereference rates[].
>>>> +	 */
>>>> +	if (!clkd->r.num_rates || ZERO_OR_NULL_PTR(clkd->r.rates))
>>>> +		return 0;
>>>> +
>>>
>>> I expect the Clock rate control bit to be unset in the permissions for
>>> these clock, else it may be dangerous to do this. Please add that check.
>>
>> I will add that check in new version. If the Clock rate control bit is set,
>> Linux clears its local copy by setting rate_ctrl_forbidden. The clock
>> remains registered, but clk-scmi does not install set_rate and
>> scmi_clock_rate_set() returns -EACCES. This avoids exposing rate changes
>> when no valid rates were described.
>>
> 
> You did mention this is issue in the firmware. If the generic solution(once
> agreed upon) doesn't work on your platform, then you need to fix it with
> a quirk I am afraid. I will let you propose the patch and take it from there.

Agreed, Linux should not override the platform permissions. I'll drop
that in v2. If CLOCK_DESCRIBE_RATES returns no rates, v2 accepts the
reply only if:

  - the clock has no name. clk-scmi already skips unnamed clocks via
    scmi_clock_info_get(), so these are never registered, or
  - the platform reports rate control as not allowed. The clock is kept
    for enable/disable and no set_rate is installed.

Otherwise it logs an error and invalidates the clock, so that it is not
registered with an undefined rate range.

The de-reference fixes from v1 stay as they are, since they
avoid the panic in all cases.

I checked our platform SCMI server: all the reserved IDs that return an
empty rate list also return an empty name, so they were never exposed
by clk-scmi. With v2 they are skipped silently, and every clock that is
exposed has a valid rate list, so I don't think a quirk is needed.

Does this sound reasonable to you? If so, I'll post v2.

Thanks,
Jay
> 


