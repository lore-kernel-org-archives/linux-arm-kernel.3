Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C05C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 11:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=we6kX8c1jEEVMpkRDJZRm/0sdajbfwMgVnriyN7aRk0=; b=BhBLCQvlq+bp5sIPLcErYyUskB
	y7mrItvHUEhV364Qx4Ofwe5poqbBLoPooGq+t6Sz5xLkQaRYxcWtxA+kmpJyfleGVBu4GSihTgzaw
	4i07GuQGhXYHGm364FHHc2SBNxnpot9+PAeYwKxPKx+8CXAFvEwqhLr0hDuF/N11dO644o/7Voouf
	apTKkJlzFtGs5k3UzMSt/jRepiC5952AxPE5kFFkQeJgSI995yYtxIuAYiLu7Nuek6+lMioCLSK9T
	cCFubXhICN7HzkYR88+cE5+GEaznVsKFAWlZk9JK5oqQAFUvYsr3Xl7Mt1wpVw8m4iuzQ1f2SRV5k
	RA431+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Fg-00000009B0a-1TdZ;
	Mon, 31 Aug 2026 11:32:36 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Fb-00000009B0D-3di2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 11:32:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2ocbrv3HcR5WODGP6/vzj9uSz+SVIdfNxLY7e61MHx7pl6i7M6gMW+muXrFkNwNRaoOU3VNyCq6gGwn3e2y4DJQZldDjQcaxjLwmCOLImLAAnO6ZdycPXzoiUOvxn9WhyZuHe7lm8MImp8Map3ZAAVQy+ezvLO88V3S6vPLplxMeCwrUH9UMORYLyAafVENavCBMmPgah/IDEdNN1JhJSMdb3dZ2zu3YDnUrBhUVnm5qP3aFg72Pbx3WhMzAuw+D0DSLvcHthtP97UKicVVVqmZiyYc6078IJ9IKnaV3pQnyJsekK8RLYgyTjl0cR/zcqlAffmHIQdY1GkVBaGxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we6kX8c1jEEVMpkRDJZRm/0sdajbfwMgVnriyN7aRk0=;
 b=XeqE9bIUFffe7OGciRdhx9SNMzPqs8/bbQEUsfygxkjViWccFnqBrMRhwfKMs0K/se2O6MRCp5+p8NV0fJTsekeaudfihf3Pzs36NhqSGBsvt4zXBkTOqTX1ztvPRYeAMRAbfrl9r4q7V4j82Uqw0X9SII3AMPaqJQs32eoC2mt5An8EuWz9LExnzVdc5TDPP5Bofg9EYbfOp47wEqyGwtGZ+Ti7cE/kDbTZnZHT/Dyf7tWQCwUosZPwoy08dlY/2uonhC0mffT/dxwueqONYCSRyLku/0+2yOYn/zsAs9ujQmMJ+1eAjfdcdArlUVcoPUHKM3qFsAkK1J7C9/5L+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we6kX8c1jEEVMpkRDJZRm/0sdajbfwMgVnriyN7aRk0=;
 b=XPp5/ar3ZZaGA1g4JXgvkI/ouPH81naJTg11nWnyM2/kAwhKOZeR78SivQzJsbjWPbstSD15SxR2P6DUw0VISss8fsDPfFC4Yc4gOH6NtcEbBZEew/YjgqNrvEVLD6A71SYzoOxKVaHkJydqUEkwTRBDMyZXDQQviaxZo93bIb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB9475.namprd12.prod.outlook.com (2603:10b6:8:251::6) by
 DS2PR12MB9799.namprd12.prod.outlook.com (2603:10b6:8:270::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 11:32:13 +0000
Received: from DS7PR12MB9475.namprd12.prod.outlook.com
 ([fe80::4371:c924:8800:2587]) by DS7PR12MB9475.namprd12.prod.outlook.com
 ([fe80::4371:c924:8800:2587%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 11:32:13 +0000
Message-ID: <53e214e8-2199-430e-8dd6-da56a91f541f@amd.com>
Date: Mon, 31 Aug 2026 17:02:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] irqchip: Add Xilinx Versal NET SMMU CSR interrupt
 controller driver
From: Tushar Nimkar <tunimkar@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>,
 Tushar Nimkar <tushar.nimkar@amd.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Michal Simek <michal.simek@amd.com>,
 "Sarangi, Anirudha" <anirudha.sarangi@amd.com>, git@amd.com
References: <20260817105251.1557770-1-tushar.nimkar@amd.com>
 <87ik55kirt.ffs@fw13> <41587817-c7dd-4fb2-aad7-772f85dedd6d@amd.com>
Content-Language: en-US
In-Reply-To: <41587817-c7dd-4fb2-aad7-772f85dedd6d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::17) To DS7PR12MB9475.namprd12.prod.outlook.com
 (2603:10b6:8:251::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9475:EE_|DS2PR12MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ef2734-821d-4c59-412a-08df07538081
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 3sRcOEHrI6uRaKRZitjxSvSRC5QnrLJ8QDSyliugRIgjsHGMjckFh/mxclhAETsHhFjZfcSulmfO3kSoFomX8hbQ9oEVEZmc5WqctBkr9UOavDpM1nzEonjUFDo5u5tBRWe2Dn3/nWYenoMAGaPu57ajGury28wx6pY4WIjOcGNrgZM2k9TK3DXtC7ppXpxXxS+CXulEtRJQEEr7mMRh9z+IvVo9b2FhYtaHM/H3b+/X7zou9kH82ju40P5zbBMkIlki72kvHT6yRs4htdj9kgfnVTSLQJ1HHzFI1hPAM4i/a/4Z3Y67YYJ6ItpUlY2OXXHCTiHdkR+WFYQHU4OEiiYGoa+BiE9DO4vPKUW2zZSo9wiRI1Cq5nhgT5x6RGlEOtN+iWHyKWEI/UhbIF9CI+D62zw+QVyr0jOLlVwWxioxwkVfxh0poKhmjNtMM7U6xJcAbwEwbi30dnXtqc+pR7/POOM/VXH463E0letNg4SD9nbxBnFgI7TDN6kOA9H/tu16y6IzpJyaf8XLt1AkjHFgX9dqLs0/HTCx/VGImbr48sRELfpfj4WMCvhfRZMj1J20JX+byOPA5chkSgdk7AE2ZJzRP+iyb6YnpdnxK2d1PHzaSL0If2U5QTA5e8GlpjraNClk5h6xckwrQe4uoNy4X/qMENAy0enoKKc5Lk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9475.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVRXU1VVS29GMTNrdjA5WDJNMUxKZHIyR0hQcmQ2SndWNlJNNmxaNnRBb3Qr?=
 =?utf-8?B?clhIcVplVHIwTkFzOUM5MHB0a2E0aFNWcnVJcjNkUGhSMks5L1Zmd1BqZ3pv?=
 =?utf-8?B?UTdPU3JMS3V1VTd0QkNWcDJVSSt3RUhWUDBuSjRPa2VMbHZ1OWY4TVZRVEJC?=
 =?utf-8?B?eTlobGhCbjNqYW1sR29DQWR1RFViUEtpbW55S0NYTGN1eWllTVAxTldFSVhR?=
 =?utf-8?B?SHMwbHhZTHR4YlRadmFXeXhCMzdLQXpMVVVWaHVDZURvOTVUUVBzMVRZYUx1?=
 =?utf-8?B?ZGhLMTNRWGMwZW5jZWhIZEVnYkFYRjZPcVVvSi9JVkFWMnEyTk5MSGlSMVl3?=
 =?utf-8?B?NGFvcHRGL012a2k4bFN3L3FDQlZtK0U2VDFxVmFsY0x6UXo5aXFWQ0hGNHM0?=
 =?utf-8?B?eEloMzB0MWNzcXVoTWFHZUwxMUd3ZmFXZk44ZVNCT2IxT2V0dWtmRXdBTnBu?=
 =?utf-8?B?ckpuY3VnYzZKQVF4aHk2d25WcEhLUjBpMFVaZjIwWDlNTmgzR2pOU1BKdEND?=
 =?utf-8?B?cVhsK2JOTWQ3N1dzRW5wenp1OXNXZUxML1pyRThiay8wcENDZWsza053UUJE?=
 =?utf-8?B?eXRjc3dpSjVWSHVGeTFBS09laXprYk1tNVZjZnovMjZubVh0YmpsbCs3L3lr?=
 =?utf-8?B?ZXZWaHkxN0F0dW1nMXQ2Wks4RkR3UDdmbERlZjhtUlRuM0RtZTVEamRFcW0x?=
 =?utf-8?B?QW5UeUl4d0Fic2hPWWJwRnVIdHE2Mlhoby9HWkxDd1hWSjI3czBuS3VlWVpj?=
 =?utf-8?B?WjZicjdiZXIvRzhoOEhpUnZ0NXhBM2tuMTRPeG54aXVQRFJTdFU5SW1SMUJj?=
 =?utf-8?B?L1ZJTm1WMEVnSktRWThLZmJRNGwzL2pnTm9MajhOTzFWWUZoelJRTlpsL1cz?=
 =?utf-8?B?Rkt1ZnQxd1ZHbHg4N2huL3ZQOTBvRTNOMzkwVnZQb3YxQXhYaTBReEUwMHlJ?=
 =?utf-8?B?MWVNRFlCL1phcFJEdWk0ZGRINnBpcFhLaitST253UnIzT0ppNy9tWThOSTl4?=
 =?utf-8?B?eXJQaksrb3FRSlNPMDZSOXJURnNIRGIybmpucFZQZDhuS3M1MkVDdzNIQ0xj?=
 =?utf-8?B?SlFyWGphR2tUQjRETFd1L0FvR0kyU1gwZ2VqK0RzR1BrNUJnR2N3Tkp5d3Vz?=
 =?utf-8?B?cnR5b0JMa3p1ZVRvaE9wTldyOWIySUU3Ti9YWnY2dGRydDd3dGxUNnN0WWtY?=
 =?utf-8?B?WVpWUG8yZkZhdU1XRTFqQTJFeXdjNVRDK240dzNTd2N4SHFHL2pNNEFnS0Nl?=
 =?utf-8?B?RmFGaEtZeHR0bDV1SjE1aEt4Y2hNdS9OTFdOWFJDYllUaXU4bnhZRzBHbHlQ?=
 =?utf-8?B?RG04ZUYxNExHTEloRlVQeUkwa2l0OEVNUkhzQlZkblRCRkNkbkZ0eUxBZWt4?=
 =?utf-8?B?M0M4Qm9mUWV4eFZjV1pFZ0NKOUVhVUVYcnQ3OTl3SjdDWm83YTBYckkwcjhL?=
 =?utf-8?B?TmUyNlQzSXRGbjlSK21uSVRjVE4wTmxtRGxRYVlHUlN6VVhsOXFpb0N3aVp5?=
 =?utf-8?B?Y003VVhqb1NXdnBCZFBOSmd1YTBoL1B3MlpHZDlSUXpTNzNCbTU3cm5YYWwr?=
 =?utf-8?B?RCtRTXIvTXVqVEFXeXpMdHdjUmIxR3RBR0NHMHZkSXRzR3F6SmN1VTU5TjM3?=
 =?utf-8?B?cS9zTi9VaVhGejQwSnBwSERYNWVFOWdmQjlqaWhhOFlJR1FJdlQxWXJsL0Na?=
 =?utf-8?B?b3RFaVVqV3ZHa2NoVmc3MVpTSDhYdDR3bVhZY05hVUZ5VE1DRk13blNLMkFn?=
 =?utf-8?B?a3hTK2pYNTd6diswdjZqUU5nSi9jWmc5VnVZaEkwM0RjZHlTVVhzendlOUU0?=
 =?utf-8?B?ZXdiQjVaY0J2bi9vOU1oV0N2bmlWOU1lSGxKYUdHaWlmMGRZa3gyQ2h5RG9X?=
 =?utf-8?B?djZLR3lHOWdpckFlbFJ4V09LNmJqS1lLR0ZHZVF2NTVCVGlsQnpDMW1TK2U1?=
 =?utf-8?B?RjNmMVNtcjRJMW9wMjhPUmhlSkVrU0cwYVVvbmJoYlAwb0lGN1FwK0pDR3BX?=
 =?utf-8?B?NjgweGVuV0dSbG1wWU5aelBwOXBDVjlNSSsxV0ZURGR1MVRETVhKTXZ2ZWMv?=
 =?utf-8?B?dzh5aFo3bHFmZUtkaWZvRm1wbzBYUUE5a0JtL2tuNkZQRXdCOUdYVHEvNVAw?=
 =?utf-8?B?dVdSMTJMTGhpS0tBemF6R1BaWEpSMUxzVGc2K1lkbEpaSDFtR2gxUjBFcXY3?=
 =?utf-8?B?anZ3Y0lBcXM3c2NsSUZoNlRKdS8rTXBaNU8zYzdJTTIwNjFRSWp2aGZqbTdS?=
 =?utf-8?B?M2ZzS2EySVNLWGxEa0RKMmJIOXRHenVuWWltaitVMjRpWnp6TTFNTTkxY1dy?=
 =?utf-8?B?RmloM09abDFrbWVhcHRObmowNmorNE5NTXhlN0FwU1dKNUpPT0hCZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ef2734-821d-4c59-412a-08df07538081
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9475.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:32:13.2881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0r/h85EMZc7DcDP+sjEAaiR252pJBeB1IM6Yp2J48tKlkDLcVaT5UW7Des/FguT/aEN0YNFeAT7GoeF0PUlGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9799
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_043231_918073_49C6F124 
X-CRM114-Status: GOOD (  10.74  )
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

Hi Thomas,

>>> +{
>>> +     struct xilinx_smmu_csr *csr;
>>> +     int ret;
>>> +
>>> +     if (WARN_ON_ONCE(!parent))
>>> +             return -EINVAL;
>>> +
>>> +     if (irq_find_matching_fwnode(of_fwnode_handle(node),
>>> +                                  DOMAIN_BUS_ANY))
>>> +             return -ENODEV;
>>> +
>>> +     csr = kzalloc(sizeof(*csr), GFP_KERNEL);
>> devm_kzalloc()
> okay
>>
>>> +     if (!csr)
>>> +             return -ENOMEM;
>>> +
>>> +     raw_spin_lock_init(&csr->lock);
>>> +
>>> +     csr->base = of_iomap(node, 0);
>> devm_of_iomap()
> okay
>>
I realized later and thought to get a clarification on 
devm_kzalloc()/devm_of_iomap() -  both need a struct device *, but this 
driver registers via IRQCHIP_DECLARE, so xilinx_smmu_csr_init() is 
called from of_irq_init() during early boot — there's no bound struct 
device at that point. AFAIK - If I get device from 
of_find_device_by_node() it might return NULL since of_irq_init() time 
the platform bus isn't populated yet.
So I think we should keep using kzalloc()/of_iomap() -  what do you think?

Thanks,
Tushar Nimkar



