Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13C1CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lh7RG7L/K5/iTPw6I1mEZt6mlOVhGls73p+pB9Hmsf4=; b=oeh99Y3sFnPfY3DHg0si6C+wrI
	p7w1ZlPaVQdk3WcQx7yZzP/s4irLs5CajeeO3Qf3isvGbvZ0hcDfeDegtet0yLe5etV6h0Cf2S7Dv
	qWhqDlXAy70tTuXp3YDMpYQwGtSgkqZERm+yOreZkJxHIM+RxMZaR/EGW0eoCN92vmMGT60aX0QnS
	yLhmm+r4BlfzLe/yVukuiOWiDN82bj2k/DI93Z3mxnwnBjYH/HswHt/ihWbncb8kCAb7kxwcTQNyl
	DWPsOCNQ/99Rkmy2ZejywZz0LSy3FXkVolCjPUhbR3IiSUHmzos3cwTb2vXlKYMMrJQCItPphNN3x
	uxk8H/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0Cv-00000006GWe-2z9a;
	Tue, 23 Jun 2026 12:26:25 +0000
Received: from mail-centralusazon11010055.outbound.protection.outlook.com ([52.101.61.55] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0Ct-00000006GVS-1C9Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:26:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZgicAtVKbQTYG9HfXLhlhNVXpIm7gKdKLwGgrev6ukeY/drhnv6n1DU6yrk8V2NLtFHNM9FndcbDboWr745fTCVqbt+8+gvVTrWryjPCTAN8/dlJ4x62dGA4xWy29oyunzvUkGtsUiQ/haL7aOvvwicYCZf/LD9Ml0FCYzCuEFqx/i+hf3XM0Y9CnmT4AcDWvBCMEjiMNADSm2L8rf6zR1LCBEBB6j0Gv4UeHDtrE5EQcavuirfT8HitEKbJI69KANEK3sQUMLptQVsdhOe5bORbE83WjqnI178CbxhQC0F7vMi8TAzupXxjQZU+2u0CbBNOELiyD6dy21ikrzjyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lh7RG7L/K5/iTPw6I1mEZt6mlOVhGls73p+pB9Hmsf4=;
 b=Kp65c6ryN0TSRJjyyM8PYGgv4Tz0ciD/P3DT2/m/Pf2Oy9qJ7+gRih00Cp//ggS3W6rO/Yhovy8+uNN+X6zVLO0QiDWg7gC6viER66BcFdDq6YKtW4pLQNocnt/1HfjoqobPbV3P3UfwUlArzFAma6kXhOBxZCfa7YrzwmS13lMkbIg9iEkgGDIv6fJSHaas2qFhVQ64L6g0MonsUavCe3zViO8oMGPO8TqDAhk1ijGs8cz+Bu5lW1Pwn86/wmz/aFLwnEbCoGRLV5U6GSEcyrPPPfZ1HDMUPoxkoA9dlJ0DaH1+nmhhPj44zAud0xh8kZ0JTa20LW1lZF2gteMYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lh7RG7L/K5/iTPw6I1mEZt6mlOVhGls73p+pB9Hmsf4=;
 b=xU9+JChpPC1Sw0xShOJDv6OkDUhKyDxmcX8iIEvsyv7kxyx4qHn+H+dZJhF9sfB7fTCy+G4WBmvtjJyzzVFSOEqG4jdjClXLOeu8v3rO6+4TH9HK7t03uegUZJOmj5GGFYT/gWM5O9S2+WqgGJEyNaAGGAXrrbpQZrWYLzuGgeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by LV8PR12MB9713.namprd12.prod.outlook.com (2603:10b6:408:2a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 12:26:16 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 12:26:16 +0000
Message-ID: <ddc6210a-303c-44ec-881f-d902946eb6a6@amd.com>
Date: Tue, 23 Jun 2026 17:56:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] char: xilinx_hwicap: unregister class on init errors
To: Myeonghun Pak <mhun512@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ijae Kim <ae878000@gmail.com>
References: <20260623085604.89284-1-mhun512@gmail.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260623085604.89284-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::28) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|LV8PR12MB9713:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a56ce8-77ba-4244-7f7a-08ded1229ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: 0m8wS8NA8Swf1t1uFMAXM9sGZDY9qsJD3PBwaWgOElN0dmkUh5wHu/+OapDZU8NK3uon1noqQV918wBfuQHk6M2xHZTFYvcvxfGtX6sjAVi0t/IyT1ytGMWnwGwed0jE/4zcZLkeBKPBYRAFCGiEQsmmnW9yfZHAponCiXXCg+Ziq+9sxMHo/NmS8s/FkiI0PXs5gGadHAvi3iC/PVU23s6ec2MSGWoIbHAFC62UzRyC1rTTEMnWZnwHVUpGY42WdmhEdqT5KtJR1LNJUnlNU9fWQb2folVDCLKiNxF88bzkGBVoRP3rG5Q3teRgNyJBXdkVDlms/8hkmp8mN66C/CFaH/4+UBX7EiFcnDQ+hdKxDB9cWAk4bPXPPL6UCpoS2p8fGlaUMlBtEVuKNCcYAMEvbuiMre6it5C4lV3LnU0NXVKddJjVAURIa3XKoTKoVaGYEKzYoSQasZqAiQ/MCY3j/dOp2/il7dMsT/HeCF1FAY4vpNwmRMkyE25iz2OyNFaD7Us7os/KHcUyN31mFRRzJ2zfwlBdz9WAWa0a4Gg8SfZondoS0fkgTBQ/CDtsLhCX+oM+PVZN0TwwAkbnGXaRtMliBeaoI4Fpgs8GQf4+9+GnZqUVpA5BGLXn9wo6DdtU57Dobv1ZU2TYJ+64wOyzcmr5lYtgkLTZhITa1+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzBMQTNoZU9NSm5xRFV2ZjZIWmswY2llQUd6d295dVZhL081ajZMSGU0UlZv?=
 =?utf-8?B?SWgrT0orMnpnUVB0U2s2OG53U3R3NUZCUW1vYVNKbzNTaWcvSE9hYzAza3E3?=
 =?utf-8?B?eWg5cGwzTnlKYjZnOHVnL0pkYXcycWFHSXhLR0kyaGEvek1vSVI0cTAweUhw?=
 =?utf-8?B?SDJkamtLNDZPbFdwUEJZTVNnNW54WGpqQ2tFMG1obVhxMXhPODkvTXZQZ0N5?=
 =?utf-8?B?NVEycFJVRk5DTWdIY1hvY3A0aTFtN2FnZXh2c2VpNmVjQ2haUVpMK1IwQXc5?=
 =?utf-8?B?QjZRQml4WXZQbVpNSHYxR1JPbmhvTjVRNlRYTlFIamJ1TVl6a3NxbFBZSThF?=
 =?utf-8?B?MHo4Ykt5TFpXcitEaFNDVytHTEZyNzdhVDFBa2lDL0dwL3lWV0I0T0V5TzVZ?=
 =?utf-8?B?a1VVa2x1alhFMTRVc2d3cmlFd0tURWN2Uk9ZL0cxRFBLK2hrNzFnZzlGTWpO?=
 =?utf-8?B?Wk1uMElBQ2xJY3lIWnhIdTNvN0lya1JkaGhFQjVZT2pWcUtEcXA3ZDJpeW05?=
 =?utf-8?B?dGVkb2pPRXphOTExZFBVaTQxWlJ3RU9Hc1A2OHBEdnNEUFN0MVlWR3BON3FX?=
 =?utf-8?B?d0g2SEwrZWZnZTdsNHZIbkl4L3NiU1NTNWswTE9tT1orTERRcWV4ejlQU1p0?=
 =?utf-8?B?TkxRUC9iV3dsWkRHYXVLRjQ1dk95eS96MmQyYnRYM2hUQlloMkU3TGJNTHpv?=
 =?utf-8?B?RnBoOG9wMkVySFpyZGdpNkFoR3BtWFUwTHNrUGVFbldxSGNPK1R3Mmh3TTlK?=
 =?utf-8?B?M1FUMXAwQ2syWEFDM1hPSjVrR1o0RWFnQWxiNHBUMmNIZEEyb0k5NytmQnd3?=
 =?utf-8?B?YVpyczhNWjRuWWxacmJaSFMxTkJQNms4ZHNqMDRKN05nTkQvTUtjNm8yQldK?=
 =?utf-8?B?QlorWXc4OTdIMVhSdnk4SWhYL09RQlVtV1dXYUNyQ1FpR0EzS1dvZDFpTTFq?=
 =?utf-8?B?a0kzeVZqUm5KS1NldVg0MGZHQy9tbEU5Uk1TWjFUVHYySFE5ejJhemQ1Sk4v?=
 =?utf-8?B?eWVYSXpNOFBqUGRNOVVSTjFnM0NwaVhRUDdQSWNsYnpkczN3STk5Wjl4Zmlm?=
 =?utf-8?B?Ty9DSXphMHN5UlFHY3VuSkJBK0wvdzNxR2JYZ20yZ3VVMWp2YjFib2d0RStj?=
 =?utf-8?B?WkFMOWpGaTlyNllKZFptQWpiNldBMzY1U2RUUFFUeThUeUF0Ulg4aTV2RGJs?=
 =?utf-8?B?dWpxem02SlhqNkZvNVpJSzJIK0tHamc4aXNNQ2h5TTc4VVRodkxOd3lzY25y?=
 =?utf-8?B?UjhFbUpwM1dzaFpQNkl5eEs1MkUvTnBOZkFzUVRqYmZQcklaVUoxVmZlbDN4?=
 =?utf-8?B?ZHEwNHY5THV2SmJqdEhDSUpIbkpsRk5aQ0FaWXlkMTFqKzFUa3FOL05lYjVv?=
 =?utf-8?B?RHJWaExpVWh0Ukc3cFhzWVlOVUh5WkxFRXVOUmExU1pUY2hyLzJ0M0xlMWNz?=
 =?utf-8?B?bGFiQlFhTUZWSUNSaU1ZYnNXamZuVVkxSVNMRUxLMUxEUDMrZkRyOS9Namtz?=
 =?utf-8?B?djVJRWVUVXphNC8xLzN3QWxyYThpOFpoWG01R0t4bXpjelBjbEhTYk1WK0k4?=
 =?utf-8?B?VjZiRkVUV1dsTTVtbU80ZkVoTktrSmtnbXpRaE04VE5BODJJVVBvUTV4Q0Mr?=
 =?utf-8?B?YnMzYnVVb2I5d0I5MzFpNWdSWUp6RThyUnBEM0Y3Qmh2U3NRR3ZGYWt4WVNw?=
 =?utf-8?B?UE0xQTJWcHY0WkVKTHE2clpCazBXVTZmanFyV05TMFBPejgybVpCYTBXd3VM?=
 =?utf-8?B?VWlEODNmaFl3MXZvS1hRZjc4Nlh2ZFVKTmpydmdMUENZSHVUZzUzRHRGRGxm?=
 =?utf-8?B?ZzFNU3Vvb0RweXZqQ2tLZW94azhSR3QzNzJ0NlBkbVJTTHFQL3g2cHYyL2dx?=
 =?utf-8?B?WlBtU1pNTTg0VjlOL1dBbEJ4U0FiT0pSYTFNZldSdVVtM2ZqV1J4SlU5Um0w?=
 =?utf-8?B?bEpQbUg0SjBSWjkwY0JscHBFSkdlbEUvNUorRVo5TlNuV0RnWFo5akd1VkV6?=
 =?utf-8?B?Sk50NjNNWWk1L3NsNFNDUEVSTXRXeU5MYVVnN3Y3ZFlJNFZvbmlyNTBQWG1Y?=
 =?utf-8?B?b1pkSTBsYi9wRFFoaFRzTzIvdjc5a3NYenBleXJRTHVpVHRXeVZpN1lWUHhQ?=
 =?utf-8?B?MTNTa0Q3ZEIxVzBBdWVkdzdUbEFLdmtVb21Oeiswam5sR0hFckxpYUlObUxl?=
 =?utf-8?B?RWJiK2lqeTBrSmtRMEZwY0h4MVRKSjl1dGdoM1BwWHJDRUxzQ0dhaUZIczd4?=
 =?utf-8?B?NDNhcDltUTUyZm9HSFFGYXJWeVNXd2t6NjFuMFNGOEVXN0llV0M4c0dXNE96?=
 =?utf-8?B?R3dOOXZQZityTG8rYlIxNUd1V05HWkNKQXo3TXVCK29CYkFYMmJ6dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a56ce8-77ba-4244-7f7a-08ded1229ede
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 12:26:16.0825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpmjyxsBba8CoCsgLXAo4gAoZucibZcXfwAS/BluNCdMpndCGO/xoeEkQVhHyAVM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9713
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_052623_561923_16D52E3E 
X-CRM114-Status: GOOD (  15.82  )
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

> hwicap_module_init() registers icap_class before reserving the
> character-device region and registering the platform driver.  If either
> of those later steps fails, the init path must undo the successful class
> registration before returning an error.
> 
> Route the chrdev registration failure through a class unwind label, and
> let the platform-driver registration failure fall through the existing
> chrdev unwind before unregistering the class.  The normal module exit path
> is unchanged.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: ef141a0bb0dc ("[POWERPC] Xilinx: hwicap driver")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> 
> ---

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

>   drivers/char/xilinx_hwicap/xilinx_hwicap.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
> index 34a345dc5e..9bb5fa642f 100644
> --- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
> +++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
> @@ -760,7 +760,7 @@ static int __init hwicap_module_init(void)
>   					HWICAP_DEVICES,
>   					DRIVER_NAME);
>   	if (retval < 0)
> -		return retval;
> +		goto failed_class;
>   
>   	retval = platform_driver_register(&hwicap_platform_driver);
>   	if (retval)
> @@ -771,6 +771,9 @@ static int __init hwicap_module_init(void)
>    failed:
>   	unregister_chrdev_region(devt, HWICAP_DEVICES);
>   
> + failed_class:
> +	class_unregister(&icap_class);
> +
>   	return retval;
>   }
>   


