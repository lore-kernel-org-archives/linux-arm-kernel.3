Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10792FCEE8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 11:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVkpacYkLktk7NwjHf6TlufLjZDRVmvmyGTSggIMA0c=; b=uZ+EmZ4orx0bnqDQhF7uhFXRS9
	eVudfoZwHzzIg6dwa0ilENdgBaAMc6lyil2/IpzT0r+nu4Oqri+KI4Z7Q5kLee8Rkpu0ToIkLMylF
	6IWdgclYid8RHxrMnyaM7zimD4QsIqhy8mU1QqWIzl2Cl/5HSXIjSMLBzLpMdcEjZFUQFbJA2BQBp
	C0Kl8GbMLBfe6KhYv0XtgkGGHCZbmgeJovNO7YtxWZmdkOZLa31Yotbg8SgiWUkasf+9QdTbG0MnP
	36IAdBub4/px0reSAGL012KnpU6iLz5ANtDcYSh++nrU7Pku5pjXN95lXrxTFNDbtmm0uFl2uHAJ2
	MEWYPKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDDl-00000003veJ-2qAy;
	Wed, 25 Feb 2026 11:38:25 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDDi-00000003vdj-27Ma
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 11:38:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhD5xUy13f7WDOFpfXUGaNAwAfc8D6uQPEEp3zvpUMBuiXuCdNYqXADPKFyeL0CzOtjsoXiH8B2xp1R/fQ5b6Hz1/9xIh1mKi1qmF+AFGbOyqz2vqmkDDmSwr29NJ/wMwgSiGz5hhBXsAyBJECZBkupzD5+alHZ6NToGBEvrv0vaTHi595K6r21de5UHxx0DqjDiAQq0Ki/wey+6HS7YoAcOl3k3lH0+Htb4Igg6016naiMYxcSkEfa+xDqeRb+OL8+QoRjN/mUnJpQFIa7YSdSwDDFxWK3VKGkcy2XpdqoOKxf5kYJuRhRKznN/cA2THaTklQhI4TgNegi1u0RGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVkpacYkLktk7NwjHf6TlufLjZDRVmvmyGTSggIMA0c=;
 b=eGmkWa8B15eezsDeBi/A7Xuo8AhHXRia6vqE3JVY5bBETv56+Y8k7RGj+9shBlZ1g/q2Cu9HUS1khCt/jBWVVsfYkB7VRsTnmMMAfBa/Cn3S84H6YArL7xNkBeGHeogr6FK/AHu9ePJssBHiAWyD3JsiGrHDytKZBtI+CEmAkN8C4CG/lcmyVd2bXRy3DQo2pxqmQ/0jVpydOMLdqcqsgTizkDLm8Aea3VeoKC0h0bzO4jaUUCS26A85mIQPRFIJsDIjuuCtWjptP6WJE51P14SXZFDBEC9MzDxasELL+0TEuFdHwb1algsKTg9XLGW1N+xOxroDrMiqo0w1kie6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVkpacYkLktk7NwjHf6TlufLjZDRVmvmyGTSggIMA0c=;
 b=Cwk/COO+jfKVSqc+Of3Kwq3FnjiKZmdW7pPT/JBjwlur2HWSX158c2ET9A6fOJNzjcsQ28ZfNPs37pZiptWmIcql7jx0SYMKgW424hcGlJq7qs6WFGuGMrTgcPK9x3Lmg5O92oND2vzSKnNHRtMIrJQKfwzn6fDc8W3llwDBIa2Aa1Z8RLgmSOIMSkKp7l4HYNBfnDdF8nr87CWoTgtzRYnUrBrAb2ZL0hClD6khiZHNpLPwLm19ux+LmcPRtQn8h+dzj26az+F0hU9zAj3kOfreIvvkL4gUEL/kvfjoYcVJR3tJxg7HTLL6kDzpAvsOg8hrzAtSF+6RIYqUS0zT/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by CH2PR12MB4039.namprd12.prod.outlook.com (2603:10b6:610:a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 11:38:15 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%6]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 11:38:15 +0000
Message-ID: <bdd6a7bc-0b7d-405d-99a7-a11eebaf627a@nvidia.com>
Date: Wed, 25 Feb 2026 17:08:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: topology: Fix false warning in
 counters_read_on_cpu() for same-CPU reads
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, zhanjie9@hisilicon.com,
 zhenglifeng1@huawei.com, viresh.kumar@linaro.org, rafael@kernel.org,
 beata.michalska@arm.com, pierre.gondois@arm.com, ionela.voinescu@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 treding@nvidia.com, jonathanh@nvidia.com, bbasu@nvidia.com, sumitg@nvidia.com
References: <20260224092714.1242141-1-sumitg@nvidia.com>
 <86ecma9gb5.wl-maz@kernel.org>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <86ecma9gb5.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0243.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::17) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|CH2PR12MB4039:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e11e38-9287-447c-e842-08de74625cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: P2rUsq5yeEDLtNceJcaDANUfIlGUentjq0am5ea7tzfAgzcsLwg1v4GP7cFIJ/PAeqP09yiud2dJxoxsiXLCVe/msqRb8rZmcJN5oyW4dhaSrEHSwx+7pC8NziOfK/uHIAYaja6gv0piPj/ABf74qJihNFcR5VbGRLixcjuzLzrXMhOPjQflrgOD8V+B9CeG8z87QbwJWO29QUII0q1kWdJO4WIF39b+sePqwlbRBH8VemdxlAnvN5IbPDMXjYnVruef23aOUUoB+GmgqlZKqMV1dEHX36FtHicSxnoEwQuBi/Taa+x0acB9ePylc0puXhWkunDEC5+xzoI6GjrrI2eL6NDS5+d+vCfHCiaoCvQSrnxjuzRmJpu5Fj7KZ+gMk+Z7V89WPxUTHXG1ASU2FhYp/rly9NvNs6RkdEOaqemJve+AfnwxUHZPK2DYUJFVxYhrHy/lNfrfVD25k9WDDGx/ln9WFgJTgbOqrz/aOnUI4LyIbGNPkdwf8XHApReLpce4iCuyUOuQokq2pMR920glG3eL+SnkjnOCezV0sDbBXqEz2lZk9Zx+9ADSTcVA40zOPwgBgj81uT73Txi1LuQ3FRiTbH7sEjGVq9GbQNsG72L2+TDgtd1cttpokY+WuyfN3AR2Eq8ZzKinlsbAIsE9KVs5qk4SnxnQ6eGAN0mNmXjEFNTZ+EcCc7lUf8eXJXSO33HETYqCB5Hz+O7XTeSYS8dafs+/98OdfFocgQE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2Mrazh5RlYvK3Fmd2hFL1BkV2dkT2hTaWlvMWpBZjhIMER2ZU5JdEhpaFhp?=
 =?utf-8?B?b2xNUXora0hWVHZjbWZkMXVUaGVxdWZTeDRXWHVaWkxrR015eXJVMzhHMWtN?=
 =?utf-8?B?cmZoNlcxZUd3VCtCVnI1M3VxVTBrbG9DdVozQ2JHUUo0M3d2WTdYZU9zYmhh?=
 =?utf-8?B?ZjZWQWwxSGtvRkJzQ1ZtdkIwbVFBSXJPYTVzQ0RVdDhndFRaMFh6YjBtQ0FN?=
 =?utf-8?B?RnBJdFoyckMraDZ5cTFyVUp5ZDQ1YnRYaXZwb0dvdmovM3lDd3BLSnJOK0lm?=
 =?utf-8?B?VXN5aDJzRitqaS9PVlJBRS84M2NqSWdOdnlSblVBQmlkeGp0a3Nuc05IK2VX?=
 =?utf-8?B?RkFOR1Q2cXZWeUpkRElTREdtVjVLdjFmdFVmU29sWm13TGxJWnlFYlUzcVk1?=
 =?utf-8?B?YW9idmZWVFNvOVlGWk8zeEsyY0Y2N2ZjMWdyZWJ4V2tFeWE4Y1dBbGI3OVRn?=
 =?utf-8?B?ZWdCZVgwajU4ZjhjVDRIa0wvUkRMZlBpVFQxRUdBdkhhT3UrczlnblZFSHVo?=
 =?utf-8?B?OE1GbWhsbGl4ZU82N2dEbnVoWEVtV1c5QWhYOWtpQVB4S1N0c1JFdlJVK25T?=
 =?utf-8?B?YnFrWlpNaUYyYnhpMmVYdXlhVzgwbVBZdWw4ang1cmppbjRBQVc2VGRSUXQz?=
 =?utf-8?B?aVFQWHpyaFphZWowdHRLWE8vemZkakZqVElaTWUvZzZWSzY0dy81anA4STNh?=
 =?utf-8?B?UEswWnY5OUdZcjQrQ09UcjlTWDg4QVhVV2JlZm51enByNWI0QTlKWkdMQ3px?=
 =?utf-8?B?OEhoWTZjakJuYmMvajRvQ3liajh1cXZ4NGo5MXYzQjFGeXFxWEt5OFNBb3J3?=
 =?utf-8?B?VXdiOFVVOGVUYzNlYkJta1drTCs3UGlxc3JLWTRQSHVqSm1BRTZVTXRyNWdm?=
 =?utf-8?B?dkpsRVB0K25Na1BWa25JZDAxUTVheEV2TjZLS3F6RUZoVXZJTzkySHRYOGY4?=
 =?utf-8?B?MTdUbEVGL1JFd0swVW9lT2tYb2pUYUFjdEVoK1RnRmg1NUpOTVRybmdhZlc1?=
 =?utf-8?B?eTNYalI1V2U0Y3ErYXYycnFzZE11d1BWSndNVTdacEdOcXBXYzJWTUpSMUJj?=
 =?utf-8?B?U1ZqWmxwT01wY084Q2VVOS85MW1NcTJLVzZpSEVhRVdwV0Z4MjNSS0ZiNlRP?=
 =?utf-8?B?bkRzOUdnRFlMK1FxMHZSQm56RDJQcjlPY0FrVGpNUExWLzQ4SWxmTnBBSnFQ?=
 =?utf-8?B?Tzg2bER3T1IvU2R0WHI4dXpGb2tldmYvWmdoK2JsQWh1bHBOS25tQXZCTFRr?=
 =?utf-8?B?NVQyZzVvZGxZbnlmeVpFaFVjUHBvSml4RnpTeS8zOXU3dTFHQitlcTMyTEpC?=
 =?utf-8?B?RktJYTlWQnExaW9QTExaUkRnNmkxVm5QdVI4a0dmejNaay80bkVpeldtbkNI?=
 =?utf-8?B?RGZkUmp6SVdOa09TcWlnQk5Yc0JUc2dVay9zeFZOcnNCYlJPeWFSUEpqcS8z?=
 =?utf-8?B?SXA1Vi8ydDdHeDk0T2dJV2VIbnUwZ3BjRzZHSkFrVVJtbnk2dTBaRlZQbmk4?=
 =?utf-8?B?Z1NKRm1mOTBOaWJ2QkZMcDBJYlB1YWIzVVFGUDZxVVZ2eEdHZTYvaFI4b25z?=
 =?utf-8?B?T091SGdpMzhhY2VNZnlQMTVUYWlTMU1ubTEzN3p2aHZsaEdwa0trcTROUlgw?=
 =?utf-8?B?NDlsQWRLYWZmVEZyclJNdXVDb2tlTkQwZG1yZitUYUhHcHdwaWN3d1p3MnEw?=
 =?utf-8?B?bmdONFhDTTdaSUUwSjJsT1c1Q1dxQnlhYWx2QlZGUnROUVhSb1VtVG9KVkRk?=
 =?utf-8?B?dnRBUzFkT29sWmM4M00wVERFcE5FM3Izczk4NTBPT3VSL1AzN1VBejYxQ0Zw?=
 =?utf-8?B?ekE1MG92cEdZZVVxRVR0SVcrYjJTcHNNRUovYTRvTGswYmR3cnluT25yU1Ja?=
 =?utf-8?B?OE8wcXIvdUgyaG9ucC9PSVc0WUk5d1pGK240bkVYL0lPNHphVDdOZ1R2amx4?=
 =?utf-8?B?cmM1b053TEkrNzFRSE5pd29ZNUhCRVhsUnI1SmRWeXZra3VZOTZERW1ocnVx?=
 =?utf-8?B?bERVNHRoaFNwajlQRFowd3ZPdEgrOFVEMVVZS01tZFJHcVlZWkNnSlNXZ2Zk?=
 =?utf-8?B?RUdtK0cwL3F6ZGhEWi9wY2RhUm1QaG1NTEthaVRCOVJCTzA3a1pYT2Vkd2xm?=
 =?utf-8?B?SHkwdkljb3gvazZlYjJxa2grSEp0QU1tdnRDZzdMOFlNZVIxQWh4TWpvSmw3?=
 =?utf-8?B?Ty9PODlKRjV0S1RvYTNHNndsenZER3ZwR2JDaHBlcGxvOVdUdFhhR3d0MDFq?=
 =?utf-8?B?UTlxbkRIT1M1OFBDMHZqT1dmU3hSTGFWZFkvQit4TkVXc3dFZkdMeUEvV0U4?=
 =?utf-8?B?QnFDL0lVNlBYNXJhVFo5NG5kaER6VkxzMytMdDdYK3N5aEdDNkU0QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e11e38-9287-447c-e842-08de74625cce
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 11:38:14.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZRDCwVy1WMhMA9+GC2eZw9I0pDyGOnMAWdDijwlFOGB+vt2W7nmfRumEnG3tUlV7SLU7UmqFfrxQVG9wj/90w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_033822_578527_0B7EFB72 
X-CRM114-Status: GOOD (  31.82  )
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

Hi Marc,


On 24/02/26 23:25, Marc Zyngier wrote:
> External email: Use caution opening links or attachments
>
>
> On Tue, 24 Feb 2026 09:27:14 +0000,
> Sumit Gupta <sumitg@nvidia.com> wrote:
>> The counters_read_on_cpu() function warns when called with IRQs
>> disabled to prevent deadlock in smp_call_function_single(). However,
>> this warning is spurious when reading counters on the current CPU,
>> since no IPI is needed for same CPU reads.
>>
>> Commit 12eb8f4fff24 ("cpufreq: CPPC: Update FIE arch_freq_scale in
>> ticks for non-PCC regs") changed the CPPC Frequency Invariance Engine
>> to read AMU counters directly from the scheduler tick for non-PCC
>> register spaces (like FFH), instead of deferring to a kthread. This
>> means counters_read_on_cpu() is now called with IRQs disabled from
>> the tick handler, triggering the warning:
>>
>> | WARNING: arch/arm64/kernel/topology.c:410 at counters_read_on_cpu
>> | ...
>> | Call trace:
>> |  counters_read_on_cpu+0x88/0xa8 (P)
>> |  cpc_read_ffh+0xdc/0x148
>> |  cpc_read+0x260/0x518
>> |  cppc_get_perf_ctrs+0xf0/0x398
>> |  __cppc_scale_freq_tick+0x4c/0x148 [cppc_cpufreq]
>> |  cppc_scale_freq_tick+0x44/0x88 [cppc_cpufreq]
>> |  topology_scale_freq_tick+0x34/0x58
>> |  sched_tick+0x58/0x300
>> |  update_process_times+0xcc/0x120
>> |  tick_nohz_handler+0xa8/0x260
>> |  __hrtimer_run_queues+0x154/0x360
>> |  hrtimer_interrupt+0xf4/0x2b0
>> |  arch_timer_handler_phys+0x4c/0x78
>> |  ....
>> |  CPPC Cpufreq:__cppc_scale_freq_tick: failed to read perf counters
>> |  ....
>>
>> Fix this by calling the counter read function directly for same CPU
>> case, bypassing smp_call_function_single(). Use get_cpu() to disable
>> preemption, as the counter read functions call this_cpu_has_cap()
>> which requires a non-preemptible context.
>>
>> Fixes: 997c021abc6e ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs")
>> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
>> Reviewed-by: Jie Zhan <zhanjie9@hisilicon.com>
>> ---
>> v1 -> v2:
>>   - Rebased on v7.0-rc1
>>   - Updated Fixes tag to match upstream commit SHA
>> ---
>>   arch/arm64/kernel/topology.c | 21 +++++++++++++++++++--
>>   1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index 3fe1faab0362..c3e883e99aa0 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -400,12 +400,29 @@ static inline
>>   int counters_read_on_cpu(int cpu, smp_call_func_t func, u64 *val)
>>   {
>>        /*
>> -      * Abort call on counterless CPU or when interrupts are
>> -      * disabled - can lead to deadlock in smp sync call.
>> +      * Abort call on counterless CPU.
>>         */
>>        if (!cpu_has_amu_feat(cpu))
>>                return -EOPNOTSUPP;
>>
>> +     /*
>> +      * For same-CPU reads, call the function directly since no IPI
>> +      * is needed and this is safe even with IRQs disabled.
>> +      * Use get_cpu() to disable preemption as the counter read
>> +      * functions call this_cpu_has_cap() which requires a
>> +      * non-preemptible context.
>> +      */
>> +     if (cpu == get_cpu()) {
>> +             func(val);
>> +             put_cpu();
>> +             return 0;
>> +     }
>> +     put_cpu();
> A slightly more elegant way to write this would be:
>
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 3fe1faab03620..83c7b346dc8cf 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -406,6 +406,13 @@ int counters_read_on_cpu(int cpu, smp_call_func_t func, u64 *val)
>          if (!cpu_has_amu_feat(cpu))
>                  return -EOPNOTSUPP;
>
> +       scoped_guard(preempt) {
> +               if (cpu == raw_smp_processor_id()) {
> +                       func(val);
> +                       return 0;
> +               }
> +       }
> +
>          if (WARN_ON_ONCE(irqs_disabled()))
>                  return -EPERM;

Thank you for the suggestion.
Will switched to this in v3.


> But I'm more concerned by the overall pattern of doing these things in
> random contexts. Going back to the original patch (997c021abc6e) that
> states:
>
> "However, this deferred update mechanism is unnecessary and introduces extra
>   overhead for non-PCC register spaces (e.g. System Memory or FFH), where
>   accessing the regs won't sleep and can be safely performed from the tick
>   context."
>
> Clearly, the AMU registers cannot be arbitrarily accessed without
> blocking when accessed from one CPU to another, so either this
> function is never called in a cross-cpu context (and the warning
> should be removed), or the premises of this change are wrong.
>
> Which one is it?
>
> Thanks,
>
>          M.

The function is also called in cross-CPU contexts, but only from
process context (get_rate, sysfs show) with IRQs enabled and
calling smp_call_function_single() is safe. In the tick path,
cppc_scale_freq_tick() uses per_cpu(cppc_freq_inv, smp_processor_id()).
So we always read the current CPU's counters and no cross-CPU access.

The premise of 997c021abc6e applies to same-CPU accesses only:
Reading the local CPU's AMU regs does not sleep and is safe from
tick context.
The irqs_disabled() WARN is still needed to guard against unsafe
cross-CPU calls. This also returns '-EPERM' unlike the WARN inside
smp_call_function_single(). So we fail instead of risking deadlock.

Thank you,
Sumit Gupta



