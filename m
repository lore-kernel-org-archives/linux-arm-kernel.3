Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EC9C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtlTR61uQO3mNxRStzch0uHyaua72/I5GjCaRU1csSk=; b=aeF2tB7Na7dV3497XrkrHSx20U
	tt1hpuwMrqzb0TUE3ZTcoFHUJns9zBxZW0yzKZ+InD8GafupawTW45DBT+FGDLUE6qs8CVAg+Iw6I
	PogQYWQ3Ly6dEItaasTGCzT/+z9c7QygGz5taQ4mU6R9SzFjVklxlu1DLyNafwE3GpNyGjIDgGLh+
	wtX4X8aDZIpVrvVLVZc+bZdU28zu4Z7IHmUuDKnvfFdCHZ5xbUhKTMNnbpQz1Oskyhk6YqtmDhAJ3
	5G9g7z5OqvxG6Us6CXbjeivxWFvmWy693F3tAQpnhTzW7ASSSutQUqn1H6oAjv0yBEu+ZI+5YjU5p
	sJcn3xMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXbz-0000000H3Pi-2Why;
	Mon, 24 Aug 2026 16:33:27 +0000
Received: from mail-eastus2azon11011069.outbound.protection.outlook.com ([52.101.57.69] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyXbv-0000000H3Ot-2F88
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 16:33:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3fKq4GFgwppEVyq9tAhp123HRrDDrxsy52+jJEElLRorH3yStH+DMEQNN0aVeVomgZqJZDnxl785+LjO8mVfDLZ9oEu9ikp6oZX65XkdIOYNSGuA4ml26muNf/YPcfAVzi9KBuFrv4MtPn1qlTnk67D0uiWpizgG1Jv8+pBsDjAEGEAuhQyvB4Hz/tUo4wiUVTCg03Brw3/FTNTRxe516wHquHd0bdGU64CmIkscabeAaXlq4AUTh1Fd9aqKLZQhxYy0VFXf3kETaRvNwThTQ+Xlo38X+plW/wd6+IkNOtTTH+SE2mRV3kfUgC1B9J6ZHilmINAa2Y/4a1NoSxSdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtlTR61uQO3mNxRStzch0uHyaua72/I5GjCaRU1csSk=;
 b=qn0rNU91Q1XpzMLe4pAZ9VQYYmvqvWRKNq4O+R1kI7wQPyM+BS5EcjAEFQSK1JhVWyX8QnzWiS7+kt0j5pDUZA+lqGyQwtFBDvFxOaxiSvm/nyK9Mu44j7nlYWPnKVa+TNbXaWm4vwmVt1nqApdJ9eXZ4sN3gHgNU2pb4x++lmCXx+G44/XXXz/F7iMZSZJeb/Qy7c6PyU1UiQ9bi4o9MInWFyYJsINeOKEvSrr4rYNo4QAtM1cSiCuj/PblOy0q6u+6J7zIlxeifCJqujqzc748xdmiVJRAsd8QsC048NWyfU/Y8GQ5oRiIowFbMW5QgWgKlP1X6IOjsixPY4msOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtlTR61uQO3mNxRStzch0uHyaua72/I5GjCaRU1csSk=;
 b=XB1/GPU5HMiPl1JohYq479hwYC2DlXNDFqqjgP8nO6Ku36AE+P4B4xQvoatyhDrFBH4mqqvRWs8I0BGGuPLD5FdDvoStTagQ9Pl3yh1ZyIl66uNecvDaFXdgOHFepfQX1FWuOMlzF84aE5PzWML+zzcvmy6b0URKDYRHEdKQsHuf628P5JeZ5eXnEF4GuTm9NkjDTSvAkIjlY+foT5RC6aeElLDiwx5Bk/2pFS5wjdULzpUq2jpa/4EkM4qU/85CcxXlyvWh64LZlZR2oS3tvmEeds1+H+fMyrS8WL6JQr8j4ivFSnX88ef6/9Es67zASClXIjn3u4smOhEnynC23g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6882.namprd12.prod.outlook.com (2603:10b6:510:1b8::12)
 by PH7PR12MB6659.namprd12.prod.outlook.com (2603:10b6:510:210::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 16:33:11 +0000
Received: from PH7PR12MB6882.namprd12.prod.outlook.com
 ([fe80::6d0a:d79f:abf2:d544]) by PH7PR12MB6882.namprd12.prod.outlook.com
 ([fe80::6d0a:d79f:abf2:d544%3]) with mapi id 15.21.0315.008; Mon, 24 Aug 2026
 16:33:10 +0000
Message-ID: <4436a4ae-de40-4355-95b5-f5104ad30dd4@nvidia.com>
Date: Mon, 24 Aug 2026 11:33:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_ffa: Unmap Rx/Tx buffers on shutdown
From: Carol Soto <csoto@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mochs@nvidia.com
References: <20260818224404.3694580-1-csoto@nvidia.com>
 <20260819-aromatic-albatross-of-virtuosity-2406c5@sudeepholla>
 <c5f0fe8e-faa2-48d5-b6a1-370ba36b19bc@nvidia.com>
Content-Language: en-US
In-Reply-To: <c5f0fe8e-faa2-48d5-b6a1-370ba36b19bc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0311.namprd03.prod.outlook.com
 (2603:10b6:303:dd::16) To PH7PR12MB6882.namprd12.prod.outlook.com
 (2603:10b6:510:1b8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6882:EE_|PH7PR12MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: b4430bfa-9e60-4d02-9ba8-08df01fd628b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: RjR/QtAP37qpQ4gNrnJDEZj+JJNW4UbbCVgKnsF6C0EsjyXqTVVARfwtOQS01nkwSN/F2d643Q4imbyx181vcTwTcld1pt2FfOsWLII+f2YKrAZUmUGVy200FUG6BiET2AYFBJTdq5/nz4Bp2F7HQQT+djb55nIb/WgmznLggseM9qLgbXzqG7FyanqRAEUsxfSNlZYXd86rlQZeOOXjnNKovBuG++zqkIPz3s6jg7wUDF6zP15bqj2pBxtRX6ek+82MujWQNyHRnBxWGaEtA1jjR6yGHfFsxNU4X+V8KXx8SU719NLRdba9LbEaNgFa7dz0en523SYq2lPB9zdoUw49Tuwtz5B6TKFUcAVqpLwy+KG2RWtg1I9/XbBBB0mmpER10hCZVKIM/v3RSShjnjQhJLSvMi+o5QqaDQDCnJ3KscUI+4mLOP7T1KMGdOOHyyHNyiz7UCwItEfOLq/FUfnSLM/Tx3IaHGaApfO9+EGP1p2L6Z/GriPLckNTvnegvpW0f1W4k138m394sWOxi0gpQ5nqesg8UNNlOKr0wVgmVdrPYOxe+RjTZoe+wLTXmarUdLX3NgbWhaxQGG3yVdwbrowavlvUzrflGFNkVJzeBwwnM1IJsXgIG1mfxSXJL8TEAuFx670lPYadBa7v8DXF6cKfGO5ADp7W/6Lieos=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6882.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1Ava25sQW5yN0t0RmN3S3Awejg5L3hLMy8vTmc1Zlg0VEJQZk5NV3BSNW5U?=
 =?utf-8?B?SzNROXZMTW4zNjBkOUx5OUNxMExEOENYSlp5RTBpOG05OE1UYzFldlpmblVo?=
 =?utf-8?B?dGt2UjFZN2VnSVBSTzFmMGtQNmUwWDd4T2hIOGk0QTZ4aDIwMkt3U0hLK0NH?=
 =?utf-8?B?RCt1TnlIQW1nVEdvQmdjd1FpckR3QXo2aGpkOFRmSDM0d0RRSU01SXMvRGhS?=
 =?utf-8?B?M0gzNnN2KzRqMUkzK0cySWZIUTB2TlBselVsOGs2bDVpYWgvVEROd0JCdktW?=
 =?utf-8?B?QnJWa1pYWXNCd2JnMjlNSmZZQVFOUHI1czBTbjMyamM4RHZoT3FGK282QnBJ?=
 =?utf-8?B?U2VYcnVDank5R3lLM0NubFVnVG1qR2NwRUp2cFhxbGhJU3ZqMmlKTXJTK2FE?=
 =?utf-8?B?alVMd3hqczlXZkUvenpvMVo2bFBDdVg3ai96MEpVNmJ0QWxiRkVVVmMyTDli?=
 =?utf-8?B?ZlcwNnBkdGxvMUNPWjVSOXNKZVcvUndWU1JXTnJaV3lNS05haGtaNkNUWlp1?=
 =?utf-8?B?NWpGTU5jYTFyRUo0WHpaZkNWRzFoZGloTjJtTDNWajlUTXY4MUIwQzdoT3lM?=
 =?utf-8?B?Zy91Snd4VVR0d0JHSldDZkN6S2pIejRETWxHaDM2L05yS0N3VCtCNWtzOS9v?=
 =?utf-8?B?bkk2cmFkcWY0RkFPOHdYUGtYSHYrTkltUytPQlNjWG1IcmQwOUF4TXo1dVk2?=
 =?utf-8?B?WkozL1F4eWQwOEJUVkVBLzJzeUpESitVSUx4dk9tTVRYajJBQXExam55MWx1?=
 =?utf-8?B?dksvVVc1dFdVWS83NTZiaTR1RnM2bUlvb3UvVTJtNUVobkk2TGpWQlJMU1p2?=
 =?utf-8?B?eFovUGlhbVhSalBxM3ZHZzBYWVZ6WkdXY2Fub3FFYlFaLzFxRit1QWJxV1o3?=
 =?utf-8?B?enN0Y3JvR1orcmQ2SW5xeTB5Q3pRdEU3R0FUalVaT3p4Yldsa3lxeUFWVHhF?=
 =?utf-8?B?TytDeGVIZC9KTTgzYkxTWm02UUs0WXJ3Nm5LK25xY3NReFdDOUJFa2ZzclQr?=
 =?utf-8?B?YngxM2RHTE5LZm81YlpjeW9HRmVIeFpYVkNVSW9rczUwVWYxTDNiWEhDWGZY?=
 =?utf-8?B?RHhadTVScy94akVjS3ozV3QvSldsS2w4WVVaNGFyc2FWWS82ZHZYNEYzTHJ3?=
 =?utf-8?B?Rk9pYXR4N0VaMjZyd1NBVGJCQmZxSkZSOW1iQUJTKzZhcnpjZ0p1K3lvbzhE?=
 =?utf-8?B?KzJmS2pobkYzS2xXc00rTVlEWEErV2hpd0owcWwzQ3lkblk3TFE4Rm93N09W?=
 =?utf-8?B?RTQ3Y0xJd2FtRjc3NEJHdW9BQW1qRkh4ZFdVeVgxQkRNYjRPT2ZjOXNpRXlK?=
 =?utf-8?B?dy9kc2c3Yy8rL0lzbHpnNitWTWxBV1BIeHUyelJrbFlVWlB2ekJhQmI3dCtK?=
 =?utf-8?B?S09iLzNIQ0RDczNJcklBUFB1OFVsMjdjZ29CQzBrVTVmOWNSQytnd1h6ZkZ1?=
 =?utf-8?B?d2p3aXU4QVhNSk01ekNGU3F1LysrSko4SEVJbjh6VHFRWm5Wb0N4S0RiTTFk?=
 =?utf-8?B?aUhidklUSW5lck00cnJ2bTZ4MkxweG5rb0YyUVdmbm14S2Z6NTlJeGk2cnBP?=
 =?utf-8?B?clNrRTIwdXZBd2tTN3lVcE1jVXU0dllWK2JObkVpaVV0QjROb3gwUGJDajRu?=
 =?utf-8?B?MjJETzQvRmhHTnI5cDRQT3lzOXRxeFhvRkx3WEl4NEh6bkFGTHNjS3BrRzlp?=
 =?utf-8?B?WmNiS0RrbU5ibFVBOGdNTCtxVG56MmlVRkZjY0FaYTA4Y1pYdXM2anBkWUxJ?=
 =?utf-8?B?Z0w5SUF4ZEd2Ukg4OS9kRm1VYlR3cDRHOWFWV3REQTF6SVd4cktFc2hsMmpp?=
 =?utf-8?B?R1drR1ZldGxZTTBEOEV6cFFuNXJRWjV0MWwvVFhhdWkzUE10b2dLZm5GaGw5?=
 =?utf-8?B?UWFPcVVWZnhTTzBJeEV5R1B0UXdJVEtMTm40cGZKMU8vRElPeWtnNGdWRU5m?=
 =?utf-8?B?SmxMMVFBR0V1bHNEN0EvQVVuUFBRQm5ySzFmVmcwWll1Z2M0b2VYeENyWmE1?=
 =?utf-8?B?UWEvdUJzRVpnaVROZ2F4bUd2STJCQUJCSG4ydU5jWU1DQzYzb0Rpd0k2MC9n?=
 =?utf-8?B?K0kxcUJDa3ZYZWlIWTY1R1huVXh3VTRRT2tWRTYzUG42ay9ya2pMTi9XNDBa?=
 =?utf-8?B?OHo4Qkt3N3A2VWwzZ3o1MEI0SUJZZWZhMVVQbVJrMjdHeG1Uc1FuOE12MzNR?=
 =?utf-8?B?UGRhMlozZXp0UmI2Zm01bG9ySEVqQ1U1K3NXYTE4M2NGUGhRQ2NEZW9mZmk0?=
 =?utf-8?B?YkU1OEpDOC9lbkRpZGRzNGRDVVlqdVJRVEo0SVIxdFZJVlBNaC9rOEQ5ZXVs?=
 =?utf-8?Q?/KTK5txLMpZn/YskPy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4430bfa-9e60-4d02-9ba8-08df01fd628b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6882.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 16:33:10.3606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VacIAk9ZgKyZrzwIZQpkQI9VSPtwn3sJDm42Bo6DPqhbrh04xX0kRtBsXf6GexvekG2XSqyXRiMsXrb5yaUyhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6659
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_093323_589537_4468F81D 
X-CRM114-Status: GOOD (  17.75  )
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


On 8/19/26 2:13 PM, Carol Soto wrote:
>
> On 8/19/26 2:08 AM, Sudeep Holla wrote:
>> I had posted a single line patch here[1]. The original 
>> author/reported never
>> got back.
>>
>> -- Regards, Sudeep [1] 
>> https://lore.kernel.org/all/20260729-nostalgic-accurate-raccoon-ab7d7e@sudeepholla
>
> Hi Sudeep,
>
> Thanks for the pointer. I tried your patch from [1] and it fixes the 
> kexec issue on my setup.
>
> I also tried limiting the shutdown patch to just RXTX_UNMAP, but that 
> is not sufficient here.
> The next kernel can still fail notificaion setup with:
>
> ARM FF-A: Notification bitmap create error -13
>
> So I agree that using the normal FF-A cleanup patch from shutdown 
> looks like the right approach,
> since it tears down the notification bitmap state as well as unmapping 
> the Rx/Tx buffers.
>
> Are you planning to submit that change to resolve this issue?
>
> Thanks,
> Carol

Hi Suddep,

Just following up on the FF-A kexec issue. Do you plan to submit your 
shutdown cleanup patch, or would you prefer that I send a v2 based on 
that approach?

Thanks,

Carol


