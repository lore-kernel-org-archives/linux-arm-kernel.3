Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCA4C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 05:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zjmO3ojMm2Vjo7ePVEJu/JvTRq0DTzdQSMliClHFdg=; b=yMVS9UcTAjc7RbsCPinw5+WgX0
	HniS96LtlE29CPWVbbbqSYmJME1TfwgmWbXKjyLLB/XUEQKV600qqvYVsWS/DvvPja1eaLXiQh1/a
	TuNoBlVS44Ymf7Gh6xQgoTmBvBsmjK8RGZTXtX8eLVOBTH4IGlx/QjhyMbMiy2vj6l06IndvPDYSQ
	aw0y286XRfYKPTbR2BpiKFdOSfkVyipCzH1Au2vlN3iudbPco2KXnjelG3rKgVpECJLPPOPxokKIW
	MtnO6fFOxD5g9IfrKeBBSFh7eE8uqHP+/80ctijcIAps9d+jC3SBFi4cnOqA7u1+mARLOhAQl6It6
	2PrPvgEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3MY-00000008Tmw-2igF;
	Tue, 21 Jul 2026 05:49:54 +0000
Received: from mail-westus2azon11012022.outbound.protection.outlook.com ([52.101.48.22] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm3MS-00000008TlE-2vhJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 05:49:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cb79w/gR5gYmp+gpw920Vye8hCM/8iKWn19yMeuXohFxj+rZCiPHthOeuA710VvHuCcZ2gm9Ilv3KUB8IcB/OcoI6aFp02k3xv0i0PexvXmWoN904EF8vj/C0IWGvLwj+zUtX0ne5P3FGlZZjtFz+6OleEB/OTIwyyw12q+nifpvOikI1fDkJgHIISLX2NwSOI/3+hyl+sKBv+SYsSvnDTRLt0UPBgZ7EkWvbJnRUgva3Ygng8hz+7s3s5W110UQ+2Z2pFigeSaN2FIvZSbaO0AP90CKXmJDmxswxU0ijAi3N0ATBXoflyojvKuzxd3QQvzqyK66OAgdu/nKLiAWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zjmO3ojMm2Vjo7ePVEJu/JvTRq0DTzdQSMliClHFdg=;
 b=oLOaOChdlow0duc3Txj2MuGs8ab6BVj/tjKBQRDD/z1YGMEIlZztdTHLg9isQYk67cAeFc1c2XCEJHc/tl7ZXnYgZqnCFDeZzEv7Ojnw0IaQYGrwsjGvUeGTeWQz51o4m2Y75XaqQ57vybSv//j6AeFbNtWzIMPmzZD8FT5Ajea7y50gRIyn3Y76YumvqPEqHlKN8DrHeVl2OoomIoqMYNJYGyV7poL+lxuDwsjdBFZvUBKsXS8eVxMJrEKgSShogWGR9Ke+zir7V3g7gLkO7j1p8C3JyTZGtHdTJYd4wiXu8ZQoN4Zf/k0n9LvpvXc8fdbq0WTvlNBaFPqDWwm1LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zjmO3ojMm2Vjo7ePVEJu/JvTRq0DTzdQSMliClHFdg=;
 b=Zwr8guacNHVYSEuSv9xnFWI6G0xwjxAhfH9g5dUK5IjS0JDg3ZojjEdqZEFKGu5jxCZyqJrfaef4RWtswUa47NpJdmNRIBB1jHPW+CEgyWNuPBPwmcD8/C+WFjMW4I1JDUOGq5JVxMODwDWOPsnYUwRiKgptKrsju1+u1H8ASkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CH3PR12MB8236.namprd12.prod.outlook.com (2603:10b6:610:121::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 05:49:43 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 05:49:42 +0000
Message-ID: <859dccbe-0d00-4380-9543-3b81f2380997@amd.com>
Date: Tue, 21 Jul 2026 07:49:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] soc: xilinx: Remove redundant dev_err()
To: "Pandey, Radhey Shyam" <radheys@amd.com>, Pan Chuang
 <panchuang@vivo.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>
References: <20260720095920.542801-1-panchuang@vivo.com>
 <20260720095920.542801-8-panchuang@vivo.com>
 <8ca27e7b-d122-48c1-bf1c-0f104c4a7eec@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <8ca27e7b-d122-48c1-bf1c-0f104c4a7eec@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CH3PR12MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: fb654350-6184-4402-5feb-08dee6ebdc95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Dr59YAM8Lx6t/geWjsEywWZPNO4MMemCvoGG6CrfwEI6gniP8Lq9mSr+RC099uQKaS1kHoNonrOZEMf1iAC570xqSzSAlmyHHQDIwZgIxPYVtHKmIlnNG1UXbMvV5lQR1PIG+VCz31pV40QjP+4zIkucTVcuPKuErJDUS2Rp4P75w5Xyx2OvHwabaq3RToWFPF6dgLczW56h2orBE/M4T96JU2FiuI4UQ9fafjafTLRKzE9EB2bTGu2TtO3KNfhV6dcfsfkYmM0JlAvBGgFAsiMF8ZVozgqm/AVcOa6iGnmXjkSJDxViBHIRV7kbJkSyl3I+I5ObNK4fDHI3Bl948FULq7bZ/hgpxyyw6/aV8JsTC5gBONe56GYLoyIYXn+imi1vSx6kXGpFCU2EtrPONO3BoPtKPjXozAvbEU3XJRJ71du6oHKKu9TL4dyafmuThp6uNGHDs/JlCDTgWCdEdQ9tYOZQrLBKCQsKcYVVeFnP/fe/1Ez9NpvP8Ft+wgzkG1w2+IzP9O5OIGSlgMKDJByRHBFv/TEg1njcYcsC8Pbc+fnNheMXhxbxJfQRcwN3d4JSVFvlO4cE21KCJKLm0RdjsT+5Ze2fsWFBoLNse9s7qyIcQmfb/WIPljgBiZ0sLuV2BhuEQ5k0QG+tnbuuwSlhw7+xPBn3Prjb0kmNgUE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmRFZHVaNFNtcUZPYy8zRUNXOWhzTy9FekdKZzkwTFY0NW9aSWowQzhocURB?=
 =?utf-8?B?Q1JJVE82N084bEtCNDNxZFRJNzZ4WkpiVGtOYXZqaGplZzZCMmwzOHRKcldE?=
 =?utf-8?B?Um1rVjNRcm94V1hmUUJ1RVV3Z2grVGI1NXNJRDFOVHV2eEt4eXlvYW1MdW5V?=
 =?utf-8?B?VCt6NnRNODVKNGZHbHhsMlBXQ2JBQ1ZVUUFDSUhOOGlEbkZZMnBiZXhJUHUv?=
 =?utf-8?B?RUtDWExUSHFLSWZlZHVSWFF3bnFxdGEyemdKVyt0OUFxTEIxRzVMWHBxZHhK?=
 =?utf-8?B?MG80THhkMTNRc1Q3Ymc5NS9oRHcxTUFiRnVTTWdPaU9nQXJXK0I5MDVETGEx?=
 =?utf-8?B?SHZCQ3FMRW9uV212NjRwMkowb2g5cmtWREpFblIydi9MNlQ5T1RaajdvOVhT?=
 =?utf-8?B?OUc1ZHpNbDFPYnUvTWt4azJ1aDNQajkvamxsUmZMbFc2dTJVQzFhdkMxOXJT?=
 =?utf-8?B?VHl5Z1dkaWFzejkrQTZMcTlvQWpmL1lBVTdMcGFtazU1d1puWkhkVkhLaUs0?=
 =?utf-8?B?NnJjUWtia2VGYWNDY1BhdTZLZzZxcC9uMjB1WlVVcklyTjdUUXVoVnFWeisr?=
 =?utf-8?B?RTg5OUZ2dTliZFM5VnVMRnNnZWZxRHV6VWsvT2Rja1JSU2F6SUdnVUd3MU5l?=
 =?utf-8?B?cGNzck9SbEcwUkZRUCtDSHR1Y01NNXBOWlhaOU5zL2pqWkRRSnRZWEQxdWd2?=
 =?utf-8?B?OWZtZmNQekFmMFIwSUNiaklmdU83YkJkTTNiQVJYcUZET3poeEhLSzNLYlFV?=
 =?utf-8?B?aDZaNk5LU2ZMamEwSDBqUktjSUF6YTJMOUtxSFJ1eDk2bzErZFlManY1eHh1?=
 =?utf-8?B?QXJESWNTMXBrR1Q5eUdEWnZiaFF1SUdmQnR3TmI4endYTlhjckFBdW9QSlZ6?=
 =?utf-8?B?cTRiNjdaVWM3U25jQWpKMzMzamF3SHoxRzFRZkY3d2p5d2dGQWxSZ3lrMVN4?=
 =?utf-8?B?Zml3MWJUbWRUTzJUY09UcVFjd2IxMUlRbEg4VzhQeXdYREpFYmt2Ukx4YXE1?=
 =?utf-8?B?YlFmaUx2OFNtajI5dWRNNVBaM2FaSU0zTEorZ1I5MXVFUGlIUWZhWXZpOTEw?=
 =?utf-8?B?bGFpVW1OMnZGTlhpUUY4T0NZQ1BjaHJMWlpMRElsYStIV2RxZUE4MnQ4TzhZ?=
 =?utf-8?B?OFJBeWZrQ21RODdkdHhvdXJSb3FEaGF4Y2NaSGk0NUVwaUswK0NidElWdmFP?=
 =?utf-8?B?QVZKbHRmbVI3S2RlNUM0bHZFK09TZ1hjUUEyd0pkMS9zMzF5bWlCOFU4bHVE?=
 =?utf-8?B?UDc0eThmVXB5cCtweUNNaElGSkk5ZC8vQ0ZkWHlNbTNteXI2OVB5UnlTUW0r?=
 =?utf-8?B?OXdKeTNxMXI1UXdnQ05zVW55MElvYjRKY1kwZFBKRHV2NzBBeFRqZHlHNDBn?=
 =?utf-8?B?enBKOW5DVlVES2owWEFKRmFZbE5XQUxGdXBPMGh1S2poNEdTM2htQld3V3hp?=
 =?utf-8?B?cTQrK2dPN3ErczEzcVI1bGxDVnJUK0NxM1NWRXhTdGNUdkM5R2YyWW5UTXlK?=
 =?utf-8?B?T051Q09lQXJ1bU9HVllZamhiZEQ5bXdwMUV3OUF1dVZCV0FhM3llc0xJR3Ny?=
 =?utf-8?B?SUxkOFdSWFFrdHloRnZGMHkyelBndkdCNXdGY2NKR1p0OVVSVXdGazZzYVZm?=
 =?utf-8?B?K0MxVkh6eWpFUzEwNUtYVUliTkYrVW9WZmJOTVQ0M0QwWENFN0xyY0RTaTUy?=
 =?utf-8?B?b0ZwbmNCZ3d4L0JnamFGcVBpRHNwYjRaK3JhTklKMlM5RW9VdnJ0cEhTMmx5?=
 =?utf-8?B?MHlMRW8yYytydFd2MDJWa1AyOXVCSEYwY05jK29ZMHp1RUFpeVVzUnZXMmFn?=
 =?utf-8?B?VmJDekw0eGthUnRzQnpSMXYxcGZWSUFocGxCODU5VFBkRHVDRVVaNmRMdDkw?=
 =?utf-8?B?QjF6NURtc3RsdDJCc1c2WmNROEhzZzE2RFR4dXh4bGgwQWp2REorWW1vYS9x?=
 =?utf-8?B?akNUVEY0VktXZGovL3gwME1teThyc3ZTL285SjdYWkZ0bG5iSlcwQ1Vsdlhi?=
 =?utf-8?B?VVVQWkJvS01HSjBndVlTZGJGQWZ0dURJM2V0UEZLSHZ0eDhSVTRoUVF5eVkv?=
 =?utf-8?B?ajZvVUZvUU42dklFM2lmVWFxMTZaSC9sRGVZL0FXQTZ2OXBnSUcyMzR3YUs5?=
 =?utf-8?B?S2pqbkdRZVZZdktSNlVTV1pXSk1mVkU0LzR4eUdEQ1VOWGl4eGlHQzJFQ3dx?=
 =?utf-8?B?enhRQ25JRnM1WUdsL2IvOUhIT2dlb3RSNW9YbWp1QkhjaXZWUGhsa0tzbUpZ?=
 =?utf-8?B?NFpySS9FUmpBUTZxK2hqRXdlcDBOenFybEFYK0pwWGUyV1FFL0xXL1VUcE0x?=
 =?utf-8?B?OFlQdmhLQ25jR241VnZuTmpWUzVXZTlQbkJYS0x3QVo5U0FlWU91QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb654350-6184-4402-5feb-08dee6ebdc95
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 05:49:42.6964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64rtzIcLBdtlfy9WxSi+s6C/wI5ySy458ZV+C6BxM028hQ0rRHdjErjRZJHEjuNj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_224948_737898_9CACE46E 
X-CRM114-Status: GOOD (  15.13  )
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



On 7/20/26 17:50, Pandey, Radhey Shyam wrote:
> On 7/20/2026 3:29 PM, Pan Chuang wrote:
>> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
>> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
>> detailed error messages on failure. Remove the now-redundant
>> driver-specific dev_err() calls.
>>
>> Signed-off-by: Pan Chuang <panchuang@vivo.com>
>> ---
> 
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Thanks!
>>   drivers/soc/xilinx/zynqmp_power.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/ 
>> zynqmp_power.c
>> index 370e61ac47d8..54c796afb89e 100644
>> --- a/drivers/soc/xilinx/zynqmp_power.c
>> +++ b/drivers/soc/xilinx/zynqmp_power.c
>> @@ -368,11 +368,8 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
>>                           IRQF_NO_SUSPEND | IRQF_ONESHOT,
>>                           dev_name(&pdev->dev),
>>                           &pdev->dev);
>> -        if (ret) {
>> -            dev_err(&pdev->dev, "devm_request_threaded_irq '%d' failed with 
>> %d\n",
>> -                irq, ret);
>> +        if (ret)
>>               return ret;
>> -        }
>>       } else {
>>           dev_err(&pdev->dev, "Required property not found in DT node\n");
>>           return -ENOENT;
> 

No issue with this patch but how do you want this to be merged?
It should go via soc specific trees and then to Arnd. I don't think Arnd will 
take this directly to soc tree.

My suggestion would be to split it and get that patches merged separately.

Just in case
Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

