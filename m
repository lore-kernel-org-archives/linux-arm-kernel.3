Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FE4CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNGdRgjJ3dYQ6IVUUNYcG7Gs7/gB2vZtCg5KSgYH1fg=; b=KrcoklJeApSvG2Ip0HNc3goe7v
	hBTY9k6jVjMvDHNaujCA/YGX0erBBPSyVB54rf2c0lTGv2pZsWvRmct3aim+4Wuy9vGXHlD3vdjWi
	kO3yijmnAsw+xtUwQwYXznv+6hA7muQhTseROQa5HdizZHDdsoSetoaCgiMfTFGOhYSFpKJeDQi6k
	6T9pigOZ09ShucY3YVo8yj7YgMheWr6BAo+eo/PNJF+b1GCQUCZTsKE0HmqMV+M+i4AyCW6Bky2c3
	bwZ3KFohzeCB2WfO6fBuwIpWRCvlOdTVIwwITKxKoCCVZu5dVlfGZC/wKwGvKRL3F9/z3xzePM1n1
	LXFrFpOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWw4D-00000005c3o-3odr;
	Tue, 09 Jun 2026 13:00:30 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWw49-00000005c3I-34dz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:00:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDeRfrNcLP3fAeV5dlTGw094h0uzu44pPELXu1nPq0wwf+7wtXBE0c8pfftkSSOlD/9RCZ+qhRtVzkgRDpg1gAkSNKnthiImrOjKM4GSo44BSYzTMKbos85z390IRz57AIUdWi5MtLKTLs5pMJWty+hdJ1uQU7aK/83vrjY+QEAtKtXUN4NdDv0fLApvIAU9mEsLQRmN1ke5vchYLLosimNEf6YrxjPvCggoICTK9MyfMz2JDcVuGbBbdipKyqv4dQtOV+i2QQswwLc0E+tyNfFzsc5FLoHh13wNIlhK+vU0eLgv1Y0XuZVP8uNRUbkXmQ59hpeAkd+Po7RQwSvtsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNGdRgjJ3dYQ6IVUUNYcG7Gs7/gB2vZtCg5KSgYH1fg=;
 b=V0KtWDU0DQ790OQXkAjAewl1gJ8rTipB7iIgdX2uqbFzSe0RJpQRGafBZUnHyREYitx5VAaExtfZ8tcl+CodQ8VbXmqlsTLVKkI6jOzT56FPbOLM428eD376P4w+eCgWewavisZC6jzmWAbIzF/nhYy54m0IV32aOyvfIjVXa6H8vBYWyGGE45fgUTxvTgi2KoV3UboJfl+Cjlp6OyFcB4jN41AdHnZ8C+q1n9HSpewapnX6S476w+00ji7MAVKThegLCcsPwmFUTof5A761fh1E0AtdY9nKR1o9pEPWssdlwSbVDuuLY5Zq7pC3bQ+eazC2jhk6uP+kaX4GQktfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNGdRgjJ3dYQ6IVUUNYcG7Gs7/gB2vZtCg5KSgYH1fg=;
 b=OBX+EyY0tPb9K2e0G7TA1FrhoWlayI+jJr3VuzBPoX5mGn4iQLougAh0Im4rAWbZpV2R3bK9schr/WwbV0FYPx3eDlMFhvdFi0JPHYEurW6yX3OtbR9fgJk1qg5HoIPnz1Vgp0JLpEYzxhVIEWEB8aZSh3wjLznljrWK136bzYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DS0PR12MB7948.namprd12.prod.outlook.com (2603:10b6:8:152::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 13:00:19 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 13:00:19 +0000
Message-ID: <ff4746f5-d48f-4959-93bb-d88705f10d0a@amd.com>
Date: Tue, 9 Jun 2026 18:30:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: zynq: fix runtime PM leak on remove
To: Ruoyu Wang <ruoyuw560@gmail.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek
 <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Harini Katakam <harini.katakam@xilinx.com>,
 Soren Brinkmann <soren.brinkmann@xilinx.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260609073313.5-1-ruoyuw560@gmail.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260609073313.5-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0126.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::9) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DS0PR12MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 571c6904-2561-4c2c-e6aa-08dec6270f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: yQVHWkbM8nx8sJZgf04EKlZ6f0czFWrTsyHQ+zHfP7/XaKISvdbGc/3u7PUH5ERfqJwc+o7vETM6aXTdzH6vtBS37ddFqp9nSBqaeKWMK2nZ1wMC6yHJDkD/PBdbZ4P5N/5hg1EsJtVA+ytxsqZ/67cLzYWpQTfai9YW3cEMfIaLIeA4l4EaYxgYY8nqsHzkmGh5bDoaFR3cMV79RmCrmGA7hBJrwnQz3I+bVwAKq69NFa6wVH2LrKZ+96nab16P8ihshKj6rVKMd9Os4QcFUTTeczJCdVKBMjoFEBEkxEnQwjP43aS5FsuNoE2yHO0TFJ/EnJflhTklkMg+gNzarYDUB0sXxWJjQ/QwabcrJYN5qJORYkUYMT3bXv3TEY/EDFbIda7uqGF35KirqKenjatF3xmGtHY+KdNKxBaeSP/D/lD6XnhYPz4t8T26Mea77rStYn52oI7FikZfElMZ5YMOkZHedfOfHgEewdXb9WcFMpKP8xA/KSk67bqbZHu39G4P3t42x7PxJo/LB4yL0R0RIHBSEIBkBqNen26jFQsWZrrW/vNgoFd9QtRK+K5FhTPJ7QeyYuMHw4+9svPEcu7WF76py7TM8bMTBWSsLjWlsOLVKE6PvtjiBtkAx7+Nt3/HT2+ZvdnFw96dZ8z5HIDnWyLR7ujYT2M0937jwVpetHK4kSjz/a/Me1hOVvIq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnlWY2kvcEhEOWR0VlJma2M1Z0hHUEhNN1VOcGdSSjNaUDhRY0VVaGZSSHlI?=
 =?utf-8?B?TW1oOFF4TE81dXdDUXJGVkJyd0dUOVIrWWZPTG5uZ3dKTUQ4ajZIY1ZaNW0r?=
 =?utf-8?B?MUxuRkVEc3l0NUVDbWh5Y0h4NHFxVWhSWFJkSGdNeWc2aWFzSnQ4UVpEb3Zv?=
 =?utf-8?B?NDZMWmszRmx4WmcveEthY0UyTzFtUmJlVU9nS2hBQW1kREl6VTN2NmdheFhv?=
 =?utf-8?B?V2VuQnhDbHFhY3ZFaDZYbENoNmwyS2RBc0Y1Z2MrTzNuWDI0NXdJVU9jUUk4?=
 =?utf-8?B?YUZteG5Ielc1U0ROczgwQzRBZ1lDMzR5Sk1YbVZobDV6NzRxZmZ4Rk9RdThS?=
 =?utf-8?B?d1pVZE4yRWYwbGRaWkVESEtmZjBJVHp6cEJzbkdJaGNudmFkSjBDWk9GaHA0?=
 =?utf-8?B?SDlBUzlETEhNMVhqaVUrenhFc2t3SWVkOTZkZFJnL2wwSDlLM1JiRUJUdEVs?=
 =?utf-8?B?dmRwWkV0U0t3OEpVYjBVdW1majhicmxiSlFDTlhRclkrbUw4aTlkblNuUG9p?=
 =?utf-8?B?OThGbk80SDIwSG04My9vcVQycm9nTThST3VvRi9SVU9SdVg5SGJTemdnTnJt?=
 =?utf-8?B?L1hNNDdmZ3FhV210WitLSzZqRHIxUHc0SUVmVG5LOTgybnRWNWppNTlGTWx0?=
 =?utf-8?B?NWdDQy9nT2Npb0hweURIMFdhOGh0eFEwcXpnRkovZ3NiZW5pM28weGsxOVlX?=
 =?utf-8?B?TlA2ZGxRaHh1b3VmNWMrUUNSR3FlYU90SDVvVUVyRnNnc3lSVmFIRHpHcC9H?=
 =?utf-8?B?MWFRdFRuaDF2QVRwRnZsdEptRElHYkFXWGs1VlFTMHhtWmJ3YTVEaUd2NGp0?=
 =?utf-8?B?THVlY05mSjZRcnhYclpIcnlhb21tRy9DdjNFemlOZ0wyd0xkVkpSNW1xTFFm?=
 =?utf-8?B?Q1VNYlV2YUJZT3JhWmV6ZFl6NFRzaWdKMVlQbXhzOVlFYTEwdzJMSFJ0OS90?=
 =?utf-8?B?RU5WR0FTOWxBSTMyeGN4R3R5ckwzMVMyaHJyaFQzRlp1MDhhd1E5OU10eFBY?=
 =?utf-8?B?QUxXcDNuVUN5S1QwWXo2ZWFPMFlhSFdmMEsrclYzS290S0xFOENEbVhYRUNj?=
 =?utf-8?B?R0hEaHIzK3g3NmZkcjA2dkI2SERTWThvMzFEUzFYdzdYWmpjaUJmOC9zT2VF?=
 =?utf-8?B?YlVQKzBnMmk1SUFBVTk2V3RROFVxVHpQc0V4dDJvSUpYYlo0am5weXlkUy9j?=
 =?utf-8?B?MTFmcnZqd2RwRkhFOWdSSWF4RHFUdzNubFIvT3U3VXZpYk1PMXdzeUVOZ1Y3?=
 =?utf-8?B?WFJnclhOUldaNWJBUjJmbWlUdzkzclM5U1VIM2J4bVdKUU9qRFdaM25RdWww?=
 =?utf-8?B?Y3BhbTNYRkh5Mlc0cGViMmtJWmxMVDVzNTNyVURPL2ExV0l4Qm5vNHA5S1Js?=
 =?utf-8?B?aHdLdi9EUUFzbzhQYW9BUUMzdEwxTUtMZW1sd3pDa1BuOVJKcWg1SlRuSGo2?=
 =?utf-8?B?QU9ZTWt5Wm1vZERBM3psSUYyNFl2UlNNMW5vSHBXU0Zwb0dyYjVUaW1zd1gw?=
 =?utf-8?B?bnBZbnozb3ZvTmFIYkdKbkVPMUtTMXlQY3g5WThwUGhFN0FLcHpRUVFzQzNH?=
 =?utf-8?B?Y1hPR0lBWUljb0Y4SDJiTnYxRXZVTGk2VWFnK3J4RDhoT0lZTjZnQlZScDF6?=
 =?utf-8?B?ejhJOEtYS1FoMmxwcVVJL0VqMlcvYWRTaW4yaUs5VHBEMGlZV0kyY0wyMG1z?=
 =?utf-8?B?UXVOTHJtVmhvbksydDc4cWlxQVpsa2MvWWk0aXF1WWs0SE1BUXdoRFdPa3hS?=
 =?utf-8?B?Z2ExcHB0KzdKaXQ3cURwOFMxaDdFYzlsQXVLSm9yRmZvOVpqYjRHbVVHNzZD?=
 =?utf-8?B?UTVLeUcvWHJ5dXYzM2p2U0RCbXNJbmZlNmlrelpKa0hIK3QxWEVxYmpCUkFn?=
 =?utf-8?B?OXFJaS9GTjdFOXI3Sm5hMEhNTGM5aGU4RTc0enRsNDEwL0JmcDBYa0I2VXdV?=
 =?utf-8?B?dXUrNFdRRDllc0hjcUVMejJhUzYzeDVrdW16OXVVem8vR3pSL3I5cm5CQ2M5?=
 =?utf-8?B?Z3RMWWt6d3pNSUxDNGVvY2lrZlhaZHFCcGNtdFFKUlZuNjRta3IzekFDdWpB?=
 =?utf-8?B?aWpuQjc2b1FhV0gwSnpqMm9hWkgvUlp2Wk00UUhBWU5MQWErZUI5ZWROUmZp?=
 =?utf-8?B?YlFON2lodjZ2aTNYOGxlSHYwbFlLbzJRcEN3U0xhUm5DRGxiRStQbVpWayta?=
 =?utf-8?B?V2Q2NTZydlFXRG55dlhydnBBbmFYZENrSHhCSWJiSkdJWDRTRmhFY1dacjY0?=
 =?utf-8?B?YnZkZFNTemdPWlJkVGRoSUxXbzlpbTluQTFjWHFaNlZyaW9NTk1UVy9QUnp5?=
 =?utf-8?B?UW1XOEY4WHE2Tm85dkFMb215SXY1bjVOUldyRzg1NHVCWDE4MWVrQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571c6904-2561-4c2c-e6aa-08dec6270f07
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 13:00:19.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOeV9z5wWJfPmkR7/CpUJiJ0i1zvPExQvqnbm8mJxYb1iGdhG0JhxO7q/tjF2kIq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7948
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_060026_033035_3521890A 
X-CRM114-Status: GOOD (  16.22  )
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

> pm_runtime_get_sync() increments the runtime PM usage counter even when it
> returns an error. zynq_gpio_remove() uses it to keep the controller active
> while removing the GPIO chip, but never drops the usage counter again.
> 
> Balance the get with pm_runtime_put_noidle() after disabling runtime PM.
> 
> Fixes: 3242ba117e9b ("gpio: Add driver for Zynq GPIO controller")
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/gpio/gpio-zynq.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index 571e366624d2a..fafca91128b2e 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -1014,6 +1014,7 @@ static void zynq_gpio_remove(struct platform_device *pdev)
>   	gpiochip_remove(&gpio->chip);
>   	device_set_wakeup_capable(&pdev->dev, 0);
>   	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
>   }
>   
>   static struct platform_driver zynq_gpio_driver = {


