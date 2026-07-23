Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8329C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blzn3lB6Lygv8abAhzkHMn1Dg0T7McTq7i2BbaZ7z30=; b=zoUSSkWENgzK3FWqn4iiyEQKsY
	7UHgcOD81hGSlIdJcr+NhRcebhAafBMnZvGLm5fBXjG3Ea2RvvAOLy/qVxpLQEeR+f6NMBMDN0Khv
	iDwy6Oyoq3w3Kwu4Fz9PElE1qECToh4YepDQwai/5gY7cN5CtwqywbES97kjjVjNMOMQZbViwr4dg
	NFgnk8VxH1qSKr/vZjQsLrI/IcLck5A+43KkAJZkaLKrl4p//nVlmDByMhPpaBfzsc/46uSKV0ldb
	CroDNPCFSmzAtvutSTHuN1OKyixAWocVDx57IeE+t5tz6BbJunVb2Bf8Cfu/Danfh2YXHgAc7Y7y3
	+M8rQaQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwHF-0000000EijS-2tC2;
	Thu, 23 Jul 2026 16:28:05 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwHB-0000000Eihl-249U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:28:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wr9DrolIj6jTzmQ7/PcwJy42sEmQZzrLPzrDVE4h3/nxjI+1i8jsH8S1oKApCC1QJFpKQKzf7KqRSrycQThXdktFZS98m9oBETbo2Cm0Gm6YJO0q2nHWaWVxlLlwZZ92f5iq6B7EKWdyEWvjz1vPtkOFzO9CxMOb+AK8nWDmM54uWPh2BVgoLULyuEq3QqCoNfYJ+qNan+2YL+ocSW9TGuJL9EIegvLYcpAAia6xg7dp6OkhGEikFwP6W6L62hUk5h8/Le+TIO0+wgGedceHPZm1uFsqjLc4yG6beGQSWQ2ZdNXTQNM45DX/HoZONfPNI5ipUGPRkqogft3oC3MH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blzn3lB6Lygv8abAhzkHMn1Dg0T7McTq7i2BbaZ7z30=;
 b=Yd21bQelC6IVYl3phKOmgufqvnMdT3dZXVj/mo3H298yZ4lB7tWOa/IxrlFtNhCPNntTPmILEHlzMRLdYsOVbTw25+XNFMImWR4fzwjDqqlbIeGfdKJBlfqrdMrM5mKAYOioGD6Ih+4IClh87iciFlukCVgMUC4nMpR2Xaud7aKTRBapebyVS027P8YJqRORAMMcb8H3motrSgj8hXYvLinBu7MjY/9iqgneeUuyUEDHyW/hSC2dGaU5lcvWk39nKkQPvx3QlKbZcTf245B8cKjsEtL6Re7ZVln8+7VYvbeeAQoK3Zc92VsUyqbKFOFfXawR243CJBBi1jg8chllzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blzn3lB6Lygv8abAhzkHMn1Dg0T7McTq7i2BbaZ7z30=;
 b=R9QBsUxRnnmLEE9yUdE5DrRBRsfqO1SXZr9gF5KXjsrBngVktaz+FXxPJF43zEA53q9oNYox9ehWJ5qyCBZLE6oh7a51trgQ7hNrlqaWjznAliUAc2sGe8SoyqK77JY368T62crt5WDOdQvJmOFtUR8RR8Z5ySD2W5F/pu1rfsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 16:27:52 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 16:27:52 +0000
Message-ID: <0d2e63cd-7024-4119-bd3b-a472a5ccfaa3@amd.com>
Date: Thu, 23 Jul 2026 21:57:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] firmware: xilinx: Clear firmware notifiers across
 kexec transitions
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com,
 git@amd.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
 <20260723124841.2567827-4-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260723124841.2567827-4-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:260::8) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: a418f771-1841-4030-998a-08dee8d757ce
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: bZZgJMy/smUd/3erR3H94Q8V9l1I+GR51ZujQBnoyVXCL/DDQ6UxNVFaUZr7atg1LutG6WK8CSaaCKkBYGpuusOLp6BWVgKWBu3JdqM/1fBRCjY5X5C3TMUcZ4ghkYnCKKYHDmQIuQ/hiHSOTDlM6o0eg152Hgtnm6J6jS9GNiL2X1GzxEIMhjtiYvf+d9kIhmjZd3t9Abk8g3n/bFWZcDn6/MUbRDjB5pNEe/iskBGjd45gLOKoILt3lkzHyZCE39GoNOggz9p4UHxmmW4P4YbbKL1crVZwL47xMw5AORw1hVDnPfptjPeQhunTkKJFUCqTWBA2C6WS+02OMkaufpTpei+NA2bhn5+cdZlVwbhmvljqkBBlmMiqc7N3YhwutYpbXQHRcwCos5moYFaD7JuS11wcQyhbMmU5pIbJI1d1DcZRM6wYIHvw0l8gdhopw6/7I8L4PZDsb0uE8AGsd2N4ZzGA/XpfOe+1SydC7TjxIfBkHpIWB50j9g+K+0c3G2ImBmmz4/cIa+CBI8RilTTLz5CPUEnbvWnvVa8LuBEvWQL0NohJ2ZSuN85Gouq60So+qyUad1+3C32E85Rq8TsbpdBVAbiBkVLLJ/ZU+O7BRXDweYw1qfiG2zR5DhSYgmqIkRzjlHmGrFTv6GQv5SKLAnjNPYlz9JCuEpO1apI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUQ1KzgyQmxCMCtuN2xETUdCNkpvZC80ZFp6QnZCc3B4eGtFTmUyS041dFFC?=
 =?utf-8?B?azViWEdGN251VWV2SkNBaCtGUHVuV3pPaFRFSE1ULzN0NlFUNWs3U0piNVZ4?=
 =?utf-8?B?Z2VKbXlmOWl6Z0pqcWNiK3E0S2EwU0NxbU4rWTNkcFErbllGaEU2dy8wWWlm?=
 =?utf-8?B?b1RObUFibWlndEpBY2greEJ6eFZ2TjBqY1ZOQ0hLQ0FseFN6ZnJhTDZWUHlv?=
 =?utf-8?B?YzczWUxUNmVEc3U0KzdENm1YcGNtOG9yRE41dk1SekdkdEhmSmZmVHllTEly?=
 =?utf-8?B?MjBLWTVUWnBOdS84M1RuOFg5cE81TmxTZ2M4L3NKU0JYdmtlakI2b3VKNjk5?=
 =?utf-8?B?dlQwSlU5ZTZsbTZid1I5R2JrejRCS25SNHRzQVA5bUFSMWxQQ1JmOTdkVWVV?=
 =?utf-8?B?ODRaRkJGaDRwN1FwaUlMRW5GeTQ3T2NTVnUxY0FWOHFPVzM0dXVNR0VEeGFq?=
 =?utf-8?B?WHkxUWNEWHBYQ1g1NURkNzU5TXZuV2VrakM4d2V4T09qK0xKMDBGQitrbG1j?=
 =?utf-8?B?VUgvalpSdG9mMTFsakkzcWRvY1VBVjF1QmliOHdhaTFIR2hNNWE4ZlViMWxj?=
 =?utf-8?B?cjFLRnh4ZlBRMGEwTmEyVFlGWEx1RmthVXRSMEczS3c2VjNScGFIUTFBa2pI?=
 =?utf-8?B?L1d5UnNPd0lPL1lIR21vNUZzUlVYNkxjM21Ic1ArclRnNEFuNlUyZWllWHBD?=
 =?utf-8?B?QmJldmtMWDlDMHVSdmlQSWRxc3V2TldxTlozTlY1dWF6bzRYK2J4c1JwaVpn?=
 =?utf-8?B?dXF6YUhiYkJHNHA5ejJVNU9RQ3B2SUx2TTZQR0Q5enZmZE82Ni9DcVlNNEZs?=
 =?utf-8?B?c0REQkdVNzVOMTBTRnFBQ1dLOEVaeTZERHoySVkwRDRONkJJVGxjZEhKN3ZB?=
 =?utf-8?B?cXVzc2ovOEVqM1V2eFV1SXBnTm80NDRUZitrK3JFcU5sYkFOMThOU2d4Q0tz?=
 =?utf-8?B?dzRQdlgxeWZWazgwbHRxdmJweUZ4RklUaStpRkM2eXA0ZTF4bDE5cXNtTlJ6?=
 =?utf-8?B?Qm1tTklNS1d2c05KM21SbkkyUENlR3plb2NCMWlmZjBNWjhPOCtTQUh6UGhT?=
 =?utf-8?B?TUZLenRZRnp6dlZGV25uMHpvQ1pUY0FibjR6dHRWRlhRSnM1T0RoYmxWMDVG?=
 =?utf-8?B?UHc4Z0dwUURyeXFqd0tFUXU0ODFKYWd0WXMzQk9DZGpBMGlpd3gweHZOaE1m?=
 =?utf-8?B?d3dkZ0k5OUt1K21GV2hvbVZ4bWV4ZWk0Yjl5VFF5SExWbHdEb1dBTTkyN2pw?=
 =?utf-8?B?MnJwMUk3Y0xuSGR0ZXl6OWJIQ24vaE4yUjBhWUlGMUNnSVN4T0MzODNmSEYy?=
 =?utf-8?B?RG5MWmc3emtlNUpuOUZQU1F0em82azd5SWsxOHFacnhpWnFERHJsL0oxN0dR?=
 =?utf-8?B?VEpBUVFqODd5VkEzK3d4UDRJRTRyTmpqOTNFWWgxcUx4WEVBMjk5OFRUOEFY?=
 =?utf-8?B?b1lPS2p4YmJiSW9PMDR1bE92TVJSQmM5SEtEZmtkT2lzN2xQRU5tTlBYdXds?=
 =?utf-8?B?Q1ZsZ1lPRFZ1VDcra1ZobGtRWUE3WFVoNnFRQjJGdjY5bm85aXVER1FQeTJ1?=
 =?utf-8?B?ekJuVVlubENkQ3FUeXd5TWNlVTdsUUUweHJJNE9HUHdqOVZRU0IwWVB3T0li?=
 =?utf-8?B?Q3NxVXNLQlUxVHpWSEh1Y1BKblg1ODRPQmpQSTc2WUVDN2ZqZGZhRzNBYUY1?=
 =?utf-8?B?ZnlPUVlNQk5vcHczLzArM2U2bC9RVTFid3IwalZ2MExXeEZNbWU5YU1NaUlN?=
 =?utf-8?B?NGNKR1laV09pQkg1aGNnZk9FRjVBc3lYK2dib0hQeXlCUDAvU1lwOE9HbFla?=
 =?utf-8?B?VkZoSTAxUE1sRTVLTGZZUVBWT1BPZmozQ2xWa3NpRDhxZkduVUFWWHJZbGpi?=
 =?utf-8?B?Q0kxRWFvTm92dkorOGVqUW1tdm1qOGJzT01PeE5nMUdZZ2VheHZJcjlYRzN2?=
 =?utf-8?B?YjBRaSsxVFdIRnZ3anFxWUxCWUZCSDlHMDdKZEZxSGp2ZHJaOFVWaW01dmZv?=
 =?utf-8?B?M2d0RytqMlNFNkY0ZG9yNnhlVXdkNWtUaU95TnFQS004OExmRWFTRTZvWm92?=
 =?utf-8?B?VEJ0YmR4NEs1V1VNK1BHaGRPWVozUHRRczZCemJYempuTVVoTHBuWkE0QU1u?=
 =?utf-8?B?Z2JKTkZTOE5lT2YyODQyNCtPeHJrYm1aWDVRTlJyd2JnWWtNVjhuRkZ6NDhj?=
 =?utf-8?B?aFhWU1RFeitCQW1jR2hZaG4rV1I4UWVZUUNVbTk4V2hja21RRlVZU1M1dHhQ?=
 =?utf-8?B?SWhQUCszRkFvby9NMlowNmdxT0JMVytqR1BkYXhxbjU1R1I5STFQNWpIM1p0?=
 =?utf-8?B?YS9XelRIV2luOGpyb3I4eEVuQkp6T3VSRWFjbWlJdWlDVEg2Slc0Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a418f771-1841-4030-998a-08dee8d757ce
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:27:52.5841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZGU53UxjdknqqEG4gJ3zKkHBHm53do17+tkRvGM1/VP9R6Z2oJTtxr1EnHSEfYX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_092801_556177_4EE6148F 
X-CRM114-Status: GOOD (  23.83  )
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

On 7/23/2026 6:18 PM, Jay Buddhabhatti wrote:
> During a kexec restart, only the kernel is reloaded but notifier callbacks
> in firmware persist, causing state mismatches between kernel and firmware.
> 
> To address this, introduce PM_ALL_NOTIFIERS node ID to unregister all
> notifier callbacks during kexec. On a graceful kexec restart, this occurs
> in zynqmp_firmware_shutdown(). On a crash kernel restart, it happens in
> zynqmp_firmware_probe() in the reloaded kernel.
> 
> Unregistering all notifiers depends on firmware support for the
> PM_ALL_NOTIFIERS node ID. On firmware that does not implement it (the
> feature check reports a version below PM_API_VERSION_3) the step is
> skipped and a warning such as "Firmware doesn't support unregister all
> notifiers at once" is logged, e.g. on Versal NET firmware that predates
> this API.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/firmware/xilinx/zynqmp.c     | 14 ++++++++++++++
>   include/linux/firmware/xlnx-zynqmp.h |  3 +++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 64d2109eefd2..fc7212f554ee 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -2110,6 +2110,20 @@ static int zynqmp_clear_pm_state(struct device *dev)
>   				 "Bulk device release is not supported by firmware: %d\n", ret);
>   			ret = 0;
>   		}
> +
> +		/* Check if the firmware supports the PM_ALL_NOTIFIERS node ID */
> +		ret = do_feature_check_call(PM_REGISTER_NOTIFIER);
> +		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
> +			/* Attempt to unregister all notifier callbacks via firmware */
> +			ret = zynqmp_pm_register_notifier(PM_ALL_NOTIFIERS, 0, 0, 0);
> +			if (ret)
> +				dev_err(dev, "Failed to unregister all notifiers: %d\n", ret);
> +		} else {
> +			dev_warn(dev,
> +				 "Firmware doesn't support unregister all notifiers at once: %d\n",
> +				 ret);
> +			ret = 0;
> +		}
>   	}
>   
>   	return ret;
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index ac39e5492961..69a2f74269f3 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -149,6 +149,9 @@
>   /* Node ID for all peripheral devices */
>   #define PM_DEV_ALL_PERIPH	0x18224FFFU
>   
> +/* Node ID for all notifier callbacks */
> +#define PM_ALL_NOTIFIERS	0xFFFFFFFFU
> +
>   enum pm_module_id {
>   	PM_MODULE_ID = 0x0,
>   	XPM_MODULE_ID = 0x2,


