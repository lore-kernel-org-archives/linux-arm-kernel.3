Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA0DCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AO+QwuftpWsQMDUEJ5JM/I5y4GFNwbDtpxDrS/aidw=; b=48Cbo26rM/vPauMvcgE6YTccsw
	nEoznCPF9BesKgWRVF3rwxBer7bt5FSlXKNBM9uV7FC7udRGjMSgKWbiOLQevqZsbzoqbUO9gaa0P
	kn5XSsL5fO+AK+V01U03sT/YEfvOEnAClyx7SkdkYVQ+bSfTS2FQXD/hqwF/Fdd8I0h91j59r2LZa
	EF9yreIADth6W55dSnDJHD7c6HjOm4bVyYRXi0hLOiOO0VvfEGxrz7I+qBiVCwGrnelUgcDASOs9V
	pkP+IJG9AmwgpJDHf/JqUbauKd5DYbEZBt1kzewJWy0Tl3SUvS7pKjcBd0S2WnWkiwe6JYQFOZ3Ny
	FVl4UsBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKZx-0000000071k-0Txh;
	Thu, 15 Oct 2026 12:29:01 +0000
Received: from mail-westus2azon11012002.outbound.protection.outlook.com ([52.101.48.2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKZt-0000000070t-4A0Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRp6K5jQ1u0yLvowxkG8lfo3BneRcyH4+OLXzIDflwjLnSeTaMWwrrK/6KhZd+AyqgXJcgf668JnPfSIjAI02oLcZYIlAsglWr6SBiAT6eCixYu0m6chxDbLw8Nq2E6QKmmNuZ4xJse/ZfM+qAo3bPiAssWY18ct9nbHjY08EbT3drOXCb12st76Ktu2fxdHzvlcN/9wNj/HyGzxDg/QGNCIuL81+HVyA3U6nAhML6JFhuCqSAqDzBN61jdsBsj42wrGvofmhpYPWi+pOc4N93GOhmLmQqiU9QeuYF+j7zSpVYeXNDAJd0Xp0WcpHWygcJ+Z3vZ/v4h+haw/mKvfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AO+QwuftpWsQMDUEJ5JM/I5y4GFNwbDtpxDrS/aidw=;
 b=Hy9kzo03Az97wM2JaYU5AzQ07MyyHsQeBbyrRiHT7JeDFPrMt9OAfMPZO1hjSfwiopXwEgw0M1mF7qpHpxMZj98CmQg0HoyAxjOR+6WmVQ3C8uZAi/FeeIsMhLhWfTUHeR0/gXpzt3I9SzsO6abUW5Hw5bDi75OBdDcgHf1T1/7F4svmzmpnamPkNfuCLj9KYFgsQ3cKOdL75gjBO7/SGuHkYiuw1H8sS5pd92hxfwrSDYYCcVHBM4oxCcZw99zxRAqj/flwft6tb5vk+Y/SsotT7JJ3y+Gkui0JoE9HvjxK1UBWJCSwgqR9gNcKWWfGt/uubyAH5jkLL8Grc5iGsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AO+QwuftpWsQMDUEJ5JM/I5y4GFNwbDtpxDrS/aidw=;
 b=FH1KORdNMEBjjfuiXyXzNoFut9LS+FjkUKDZISiXIvPn/a8NsZY5aeHVNHHwdSWnszNQuNf/tg9b4arDnk0wMGwVf6sqLRul5ZAcSMzrS+hcTfxa1F8YxikEaXhOGJqLhof6yHUCJ1mGEHLY5dDmVQ9ShYyTJvkU7fSEDk/3e6U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11)
 by PH7PR12MB6738.namprd12.prod.outlook.com (2603:10b6:510:1a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 12:28:47 +0000
Received: from CH2PR12MB9518.namprd12.prod.outlook.com
 ([fe80::5f97:8622:699:6b37]) by CH2PR12MB9518.namprd12.prod.outlook.com
 ([fe80::5f97:8622:699:6b37%5]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 12:28:47 +0000
Message-ID: <4f42a518-42b8-4969-b346-6c5c2acababd@amd.com>
Date: Thu, 15 Oct 2026 17:58:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] pwm: cadence: Add TTC PWM driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: michal.simek@amd.com, tglx@kernel.org, daniel.lezcano@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com, linux-pwm@vger.kernel.org,
 Michal Wilczynski <m.wilczynski@samsung.com>
References: <20261007-cadence-ttc-pwm-v1-0-52a95a8d98b1@amd.com>
 <20261007-cadence-ttc-pwm-v1-4-52a95a8d98b1@amd.com>
 <asYvE-ThtZeYSEyk@monoceros>
Content-Language: en-US
From: "Vanukuri, Meher Thanmaiee" <MeherThanmaiee.Vanukuri@amd.com>
In-Reply-To: <asYvE-ThtZeYSEyk@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0040.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::13) To CH2PR12MB9518.namprd12.prod.outlook.com
 (2603:10b6:610:27e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB9518:EE_|PH7PR12MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 314f7420-0c27-4898-fd1b-08df2ab7dbf3
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|18002099003|22082099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: Oux3j6y7zcFqgc9NfTlLVwAP3fjQYMNhqLkvrEopeWGbuXJsSJ0CTAz03zw4xiDG3B3vWYI7YPKVDSO8YZaCSuATBG/g/9CzTuTZLfmQ68IobGHukNeWlRagwCiw6TYPjtJm8RL0SqrFo4PwQm5oagKaDP4yUn57I5iemU73RWLnl6ojyxwaIbR6EtPE/XrLN6B5VB2GDMMUvf2YniiliCwfern5fyeZJZh4glf6vTBlCYA++09A2hQYlcYTWMcNGHAQr6tNHaj2PAHIYlxRVrzR07K0NkD6VPI6PubhGSz+m8/x1iae0MunaD57pOs2k02XGuTKwJZTVTFlCM4/MWVFoK//Q/pCO1BnfA44GvBaBudtf3oSu5wKupoTqvUCPEEmIbDJcMw61jY5FLQxXglN1nrhcXUOBjMbG7g3z3jzMPyJEh37r4f+J175vvYKQL4ZEV6rVvq9HXjW/3V+nT7cLmg1jApuz2bQQZBlGu+ulW+yXOoX+RLKm3lXOlNx/tW4QxBtSmcU0C6o0DYLYQUdOxnZfKRp1odZvQHNTjyBG1cQwI5uTVdAfQJ1nVyT+8PpO0rvxWd1RUn7rJ5TzVaui1dngns2+PKWIn21zcnl8K+NnEmd/4sewqHyKGl6Y8usOLUXJhdyS1VdZIufq0ALF7ufbwtOaND9g7/drHk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB9518.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHNGbDB4cWxWVkYzR2FzMzZGc1R2M3V2bXlVeVh1d05CS3g2RUhUdmtIZ2hH?=
 =?utf-8?B?dnU4bUJhd0p6ZlFYellQV1I5SUE3OVZZcE5JQzVCcmUzeENLUkFObWFNVk9o?=
 =?utf-8?B?Q1NqMFVIVmNEQXdWRjhKY2lBK3hWa0MzUkwxd3ViRjcxVGg1MHEvcXJETnJ3?=
 =?utf-8?B?R1luOTNFRzJZL0d5UVd2QWZKaU5WNy9jSHZnOEd4aTlKcFFiREdpR2dSdURV?=
 =?utf-8?B?YmxwN0g3TnZFSElINUJRbWl2elE3QiswUFpvcTJTM1BKTW0wZm5FMkY0VjZ3?=
 =?utf-8?B?ZnpteWMzSk4yV1JwNXZTRE01ZmhXNWtXN29BaDlDdlR5b1I5dnc0VHFYNFBz?=
 =?utf-8?B?cEUzbmZnWGExMDFDV0phZXd0RmVlaFdtYTJDMlBiWGtMOG83QkMzYlFsL0J2?=
 =?utf-8?B?Mk1CQ2F4ZzRhMDJ6RHhXM2VyVDhHSG1tZ1ViVVpmbHkxVDFSejVjalJicmFn?=
 =?utf-8?B?QlhKYVFQQk56SDc5Ukx2dXUyYU1jcUlieDFRWWlZMHJPMGtPVmdETTJyQ1ZE?=
 =?utf-8?B?SE9HakZrUUhuK1pkVFVTQkhIZUMxakVGQzIvdnJLbFZSdlZ5ZEpYYzJodGpt?=
 =?utf-8?B?RzJBTFlRSFZyRFd1K0JGbFUxNGJYNXlWSXAyajFGU3BjVG5NU1krbnVsQ1R6?=
 =?utf-8?B?aldjN1pnUTIyRFk2d1dBZmx4RCtWeVdwbTBzZVQ2RnhxQU84YlMwRVdubm5v?=
 =?utf-8?B?RWt4Z3h1ejl3UFJjYzh6L081WXZ0Wndzb2RtQTVMOG96cGF1UTJVeVJETFQz?=
 =?utf-8?B?ek1IVVVlM2pzMmdKdDVXQ2diaVJiOE5zRG00akFMT1VpWGQ4QUNLMFpaQU9I?=
 =?utf-8?B?QVE4dGs4V1VPMEF4MXNWaVJRdy8rSVJreWtpTXVuVDBVSmJ2UXVzV2hJRUN2?=
 =?utf-8?B?M0pVeUVLR0F4MVpSdkpuUkVEdGp6RkU5a1h3OXozdXlIOEg5a3B2SjZCa1FU?=
 =?utf-8?B?ZDFiYWo2SDdaY0lNSVcrekZoZTFKa3FkRytLOHN5emFLb1NSb3dBdGhnc2Ny?=
 =?utf-8?B?dk9VRFQvSTJSNUY1R2FhSG5ZZitUS1czaGZhWE05cFE5dm16bi85dWsva2xH?=
 =?utf-8?B?bXlUM1hzaFN0NWZPdGsvekFlbk1kZ05rU3VHZlJZT1pydFBCVUhqNFhXL0Qx?=
 =?utf-8?B?WWxXbFdCZzFQQXNVWk85cjdta1NkbjVMTW8wcCtZTTZXdUFoWGgwVnJQWXlV?=
 =?utf-8?B?ZlBsc2FJSVdCOExGaWtvN2w3MVFYVVN0TGdudFZlanVGODJhUnZXdnVmL2xt?=
 =?utf-8?B?YmhSMG1IUTQ4QkgxQ3NvcXZLTW9FMy93a2g4TTNMdTJuSFJab0dtbHZWSVJT?=
 =?utf-8?B?Q1J2dWc3ZjhGT0MzNytXaHhUY1VpbGFReFRuUzVBNjRET1B4Y0F2VXB0VDNv?=
 =?utf-8?B?NEUreURxdUpqTnhJMGlMWnRIRHo5c3g2Z2g5QlNhK0plMnQvZ1UvZkNOSElh?=
 =?utf-8?B?SWg2b0NTREljWTh1cFJ2QUp4ZGorbFVhYWVYVkpTalpWWnNGSXNJVFA2dDlE?=
 =?utf-8?B?cWFESWUxUDdQR05vVHZIcmF4QVJFSEpVR3NsbGFLRzVZeUl4Q0g5N2EwTXpq?=
 =?utf-8?B?SzJEWEFHdy90eGJmaFA5QTVpS0w3WG83R0VJdjVDT2QwS3NoTEFVYVBuVG9y?=
 =?utf-8?B?Ujk0ZHJQUkNnbWgyT1U2RTczRVFYUFFwcHlzNHhPeUQrRk9md2hXMmlvaWpP?=
 =?utf-8?B?cTdITVFjNS9kNEtnZ2RXYzF3QWV4cDdZekYzUEwwZUFsU2ZhTXhFaTVTcEV0?=
 =?utf-8?B?aHRuaHRoUzloTlFHbXp0L2lSenNVRkVrenVVUlRxeW42VHlvWWZKVXhNeEk5?=
 =?utf-8?B?VWthUGJOWUlLbU00SjlxdHFFcHNYbmpRQ1g3T3BZWlNxNWhwSmZ6RUhxSUgy?=
 =?utf-8?B?WGVvMm5MWnAreW9NR0FWWi9acGVsbkw1TkJRRGdKdDdvYlVFZEJiN2ZkVXVs?=
 =?utf-8?B?a2o3c3JweXhielFIUDRsaWFUUHhndlhjTVQreUhYeStrVDJZaXV3ZFl3TkJS?=
 =?utf-8?B?cFh2ZTFNci84NGJ5Sjh0R3UyV3NwQW1hT3pxSGo4VEpYejRjMzJ6OVJhNHJU?=
 =?utf-8?B?YlpyZFBYVDVjUm11Y1VIZVVOK2RuWXFpL2gzUGRsQWZmaUYreDZMOU1EZmo3?=
 =?utf-8?B?Z0tKOXZ5anpDR2hXWXF3NkR6ZVVtdXkyUzhieTY1c2poUENBRjcrVS9YRHUx?=
 =?utf-8?B?Lzd4NXZUOGpFQ25yT1Y3WnF4ejJFdXpVMXVXQVZWZm1oMHkvQ2N2UmxrK0NH?=
 =?utf-8?B?NmJLb3dKL0JUK00zSmo3NFo2ZnFhbXVIVjJJQUcvNS9jNzJ1Q1IrRW4xc2lD?=
 =?utf-8?B?TkV6Mlp0Q2VOZzhKM0ttKzJkQWEySDdBbS9McHgyU3RjRi9pdm1CUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314f7420-0c27-4898-fd1b-08df2ab7dbf3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB9518.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 12:28:47.0879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7THPnE+WMbJVcurKTSDo4JsNvvDQlN5b08AlkvPpYkKHmuetW4C+1EzE1LheEWbjn8zm0JoWE52vTCUkgnmAlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_052858_035284_F13D131E 
X-CRM114-Status: GOOD (  13.18  )
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

Hi Uwe,

On 10/7/2026 5:11 PM, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Oct 07, 2026 at 02:37:02PM +0530, Meher Thanmaiee wrote:
>> +static const struct pwm_ops cdns_ttc_pwm_ops = {
>> +	.apply = cdns_ttc_pwm_apply,
>> +	.get_state = cdns_ttc_pwm_get_state,
>> +};
> 
> Just a very quick review: I won't take any new drivers using .apply().
> Please use the waveform stuff. And also note that there is Rust support
> for PWMs, so if you're adventurous try that. (The reference in that case
> would be drivers/pwm/pwm_th1520.rs.)

Thanks for the review. I will rework the driver to use the waveform API 
and send an updated patch series.
> 
> Best regards
> Uwe

Regards,
Meher

