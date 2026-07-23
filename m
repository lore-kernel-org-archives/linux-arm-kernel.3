Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAC0C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08u+zJ5pswNcujtTfZXluEKMFAs/8Jpuqsvf2XI05HU=; b=UKkGCYAyIsIfQRPmIMhGvB/vF0
	ynAeRGM00ueD6BW6dAWfhjrJjcejf36ZCaBX+Nt+fNnYBe/R7ovs3V+IsdypA0+Km7PlxhsUSXHub
	mX7L4+IU/fkKOeQTENxHRPiAeikWaUIDkwaGyEEbIz1M8CgL0y57MJoez4n9EQtDiw9WCtdOOMFXE
	4q8SD+eIT3vA4IEe3Ku9ONW8KWvdMbunR1+wrYq/hIOPB3418AU1d4MwdH3yzEtWx0MMny9Z4a2wg
	ZL723/vgfnbO53rdu/5RrGSCKCQhE9tVPxopoRycnoClRIr7brBsQuuKIEm+Z+APBx3GYAp2c6VzG
	LQwJjJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwHi-0000000Eit2-3qhZ;
	Thu, 23 Jul 2026 16:28:34 +0000
Received: from mail-northcentralusazon11010034.outbound.protection.outlook.com ([52.101.193.34] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwHg-0000000Eirp-1PfH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGZ3jfONF0mfzdrJnLG9+qQa3VA1INdD4J6sOndITEFoYPQV7DJ7ItgJzsHklvS2irC9okvwu7HVkYtiC8Gio0F5p+ZszMEampCG5api2stZclEtU+eMAe+H1+SEprEwKgfuiwzDERZfOEoip3py7Xb3EI3EbumLYVz56ssJce25uQ2yiXBlay8Nr2cOUQCtQOkx9c0anmhJ83PRU1GmU3ihXq8bkaCnI/PNLYm0UyzEcTVQvq8DbkVYcMA4377khO+nyKOqsapk46BgOSGcMyWbFzYTGRGCSweeh+feAQ6zh5X7gWTMX0I9vd6vXEVGFNvx4D0ukCJUVrUpL4qEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08u+zJ5pswNcujtTfZXluEKMFAs/8Jpuqsvf2XI05HU=;
 b=um1w+l54f6C5enI7IlaFpX9DoknIksPZEtZdFHCoTde00ZNIRhrl7yJgmTJLRRzM4X4KsdEGdLCe8+HVZPRCTgTypYsI2d0AVUHCO5mFvMyKeZe1HA+tZYhH3kpAD5UDOIcsMapZcXKWpkIeu51sGI1xRV33rXAaKNqZMZLT08U/o5mZyzuwyS7B2c1ofbbMuu15bGvYYT/acserp2/KKluDVahts4xedrAVkq0vTq7IN/e3f0l04cuM3XVCkh8L+ePCkRrLUZoZCVG4TQkUWSKGwmHyrMBHZqZOiD6t0FiR+9LKJVtdYzt1QZQGIVcO2y+hJbYgPUxOmjuciUnU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08u+zJ5pswNcujtTfZXluEKMFAs/8Jpuqsvf2XI05HU=;
 b=MpGHqACTMzFRYppVrvTRpDr90fW7S+lmE3O5Dji2GIFoma01MAy61jmt1FPgofgqsm8urrSjbAR+m/0RXyAbfWS4EPCBqjGuzfeSd6m9wvorOAU6eUioECjkY1tufS85CMtBC3Z23zPuS5gdT6kAeZZqa4kD901/Vx+CeYpi6JU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 16:28:20 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 16:28:19 +0000
Message-ID: <bff5ddf1-3d48-4de7-a22b-0203edbdf66e@amd.com>
Date: Thu, 23 Jul 2026 21:58:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] firmware: xilinx: Use TF-A feature check for TF-A
 specific APIs
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com,
 git@amd.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
 <20260723124841.2567827-5-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260723124841.2567827-5-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0048.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::19) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d42c25c-e24d-4d11-5e54-08dee8d7683a
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: STGsVkYT+pWk5Xh7zaZf9AGMU9umhENgg5u5pI3jgVabZ9f7i1FCe6t/OeYq8BqoBBOIMMPQGcP+A8ta5CaNwdxbUyTLQ1KqpogvAJAC/G1DTZaKMU9G4zjyGUWABYfljo6uLuDBfX/9lxKIw+RQNkLSVgTSVbnOWTWZutkoBbSYX7MIESqLB9s3/MVBkMMaBgMpSeBX109MYq+XpRT8Xomo41DiuNyslCjSP27bBmELZLjCNZEpbAAvnDf/qEl8IhSg8EnPacoCiOqyvaOx+Wy07rw8eUp86oHrg+yGAhOYoQlJTRM44l+ZMhd7zTp6crnTTnGe+3hElVBlPwaKwNC38npTFVNim89T0ni0uFgVkRO2bkcOOeaO21PW1Eb85Y13OH43PFKXawANFxy3LAl/KHZPmmJR6NOtar96r+0nMkos6FmgoaL2Ve1pJg/DAKJUEIfYRNyIHi123NRt3duYzJhxUkE7QDvf+TkD91FVIwIxX76sBKLokLOmBEpMnpbLDcstPv0b/wcl7yKcGMdVro/tiLL17hfp30Sgg22fpLADBBYL873iHpT15KIhN/FCObnJ2LAYhjjpBIMkJ3pJck0Ih7QWUgtFTxEN8cZLe15YukeUehTv07JLk4EIkD9wo0O8K+6O1d3TMfcQU4c8JZEjTz/bYT4hIrN3dtc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S01sRkpBTy8yQ2cyWk1YYWNGMFV5RWJuaVdoaEozLzkvZjJBOXNiTmlLem43?=
 =?utf-8?B?aGpmemdNNkczUGFHdEV3dmtpVWxzNGh5b1M2RTBmUi9WZVpqbEJ5QnkxOGds?=
 =?utf-8?B?UDhMZVl5NkNWdGUzaExKUUVraXBibUcvRmIxbmdDY1ljYmt1a3lmRlNxdkF2?=
 =?utf-8?B?RTh3bWFoU3BVci9haGlxczVPelZIblVmd01wd3FBUWg1OVBVU1BKWmFjNEFV?=
 =?utf-8?B?cmNvVTNvNFhnRnNPZ1lrdTJOUjNrQ2xtMFRKQmpQV042UnRNekNtRUJscEJI?=
 =?utf-8?B?Q09rd0pWbUNFM2FnSVN4dDMvUkdWQVptU1JzT1VrUzVXZmVTdjZSeGd6UFUv?=
 =?utf-8?B?TVhVYjQrcFozRE4rVk5ISHc2WXl6b1ZJcTlJZlFWLzM1MUg3WlF1VHQ2cjYx?=
 =?utf-8?B?OHFvNTdOSjhaeGRmbkFQTnU4cU5tbjZPTmJqMDJ6M0VIYm9BNzZma1hicTlM?=
 =?utf-8?B?NFRmejFhSzE3MWxWdmpvZmhCdkdobWdxTVJNTHluZUJuSWozRVh2cmZnL1VP?=
 =?utf-8?B?amZvZUtTeU9RaGtJMm1VMDlYcEhBY0w1RlJUOEVqQW4reG9WYWNDNFl0eWNK?=
 =?utf-8?B?ZTJubjhsQzhrTTZGUjM2aXg3RngvR2FVWXJlMVFRclM4ZHlMcFdZaXBLLzlZ?=
 =?utf-8?B?aTU0aEd2S2NBb21CNWU3alBpa1dEYVFLU0VjNXNhQm8rY29KTEZLUUhmdkQz?=
 =?utf-8?B?cmk3Y1lLZWVtUHhFQjdwRGVFT0tEdU9wVEI0YTRMUGNOYzFMYWc1MllHa2Z5?=
 =?utf-8?B?enM2YjV3L2JaOEQvOGpGYUpRdTQvc2FxaFI1emJaMnpMOVVDVDlicFBtNFhJ?=
 =?utf-8?B?d0d4T1V2MUhidVNmeXhFUEF3TXFkL25leVpqMFhBblR2ZDVzZ2dReGx0WUFX?=
 =?utf-8?B?eURVcHNrZlYvVGtZVUQwN21jOExHalUzSFhyOERXeWdpU2hyRkxRMHdFY0ll?=
 =?utf-8?B?ejJ2NkdKZ09rck9VKzMxc2swcmNVOHlyb2lsemdkTmpIUlhDc05WQkx6QVUr?=
 =?utf-8?B?eCtoV0ptOTM3QXpzeitIWmpFdndhRHhaVzlldDh4YWlHZVNsbERINGxyTVZ4?=
 =?utf-8?B?blAvaEFibkNJZmJjZTkvME9qMXlwSXcrb3d2Rm9uRXd5dnNoMlE1L1pnelNT?=
 =?utf-8?B?djBZNGtZRTRKT1BtaWovNms5UkpQa3lZL3pldXpId2NQNTRYUmxUQWNENXJ5?=
 =?utf-8?B?QjBYeC9mODJJSzU3bk1sSU1rT3NsNzE0WENyeUFEQnJnM2FEZHJFN3FYSEhu?=
 =?utf-8?B?UjNpK1pCREVxbTNIZGFYUnJHb3dNbDg2b0p5MHUyRDhTV0NaM3lMT3JjMDRm?=
 =?utf-8?B?Y29RNG11Y0ZRUSsxQTBjWUVhenVxdnhGcjJxeDdwSncySUdWZE1CcE1jcXdm?=
 =?utf-8?B?WlVDMEg0dnVpWFhaQk9iMmZCUXk1MWx6RExQbDNUNFVRMlhqV3hDS0pKNDlE?=
 =?utf-8?B?WEY4eTcrcDlXY3ozMUhUc0k0K1FCWGJ4b2lZcFlHZEpMYmNKTFlrT2tnN1Bj?=
 =?utf-8?B?TWlzNjZWMk5YdEZlMjBRbmo5L0t4djN1KzIwaFNXSzJVd3BKalNheWJ3d3Rj?=
 =?utf-8?B?eUVYYUJJakFGZk1DTVVtcGkxZTR4NnF5cERybEhhL0g4bjlQQi9HTEF3eTl6?=
 =?utf-8?B?RlkwNjRWRUZRWmJjenRLazZlcjFZRERlckRZNzl2cStGTTNSaEF4QnlxREln?=
 =?utf-8?B?REZjeHdPaXBWSG1RTUp1MGhGMDZhUWJMbEVHS0dtaDU2RHlKL2QvTWIrTnA0?=
 =?utf-8?B?R293WHhLclZpZTVIT1NKWjRHVkZNYTd1TlE5ekN5UXIwMEtkUkZGUThmencr?=
 =?utf-8?B?YmRqU2FOOWdTQk9BUUZYY0p1QzgrSFc4VHhtbVBtYUpDTGZaNnpTZVA4bVFz?=
 =?utf-8?B?cmVTWnpVNGRVUVpyeENJUEVnTS93RDZVYjFBenFxWUpOeUZvZVdyQWhCSWtr?=
 =?utf-8?B?YjFselNpOEhwN0tnYXZHNGFmYzdKdmZCRjduMXE2SWdUbFk2VUlFYmlOQjVK?=
 =?utf-8?B?NG9uVEVTK2VhYzZxKzV6c1h2Slp3YUR3T29LK3VzZVN3OWJxbXhPV3dtbWdB?=
 =?utf-8?B?TVV6ZUhYcGd4MG1pQ3o2ZGszcU5VVTlSSkdvcmpXMlN4a0pmZXJtME5VSFF4?=
 =?utf-8?B?SlpHK2Npd0FPUGdqaTlDcVc0WCsrdlV1L0FERytZMjY5OExVSFBtT3hYVEdK?=
 =?utf-8?B?VGQ0ZHNvS3NRWXRGUTJaWVp4Q2VDeDFuVE9BeUo3aWJtQzhHVHlzU3VhY1Qv?=
 =?utf-8?B?NDllWFhhZS9PVDdJNnVFeXVGQXFhSmdlTDRCT1Z5bmJGR01PYk9sOVRkRUxD?=
 =?utf-8?B?M1A2RUlLek9zMzlEMFVCbzBqUDlCbmc5M21tZHowVU5YZ0lkeFZjdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d42c25c-e24d-4d11-5e54-08dee8d7683a
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:28:19.8738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9JLjOWnsqtk0MjJ4+MvVdbu8Wxu+yEl8qjSTi5LRQqtyKs86n/dlbdkeZ1b77I2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_092832_412159_EE1521C4 
X-CRM114-Status: GOOD (  25.18  )
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
> Currently, TF-A-specific APIs are validated using the firmware
> PM_FEATURE_CHECK API, even though TF-A provides a dedicated mechanism via
> PM_API_FEATURES API. Ideally it should use the TF-A feature check
> (PM_API_FEATURES) for TF-A specific APIs. Update the feature check logic
> for TF-A specific API calls to ensure it is validated using
> PM_API_FEATURES. If this check fails, fall back to the legacy
> PM_FEATURE_CHECK to support backward compatibility.
> 
> When do_fw_call() fails, propagate the errno from zynqmp_pm_ret_code()
> instead of always returning -EOPNOTSUPP. This applies to every module ID,
> not only TF-A, because the rewrite sat in the common failure path.
> Existing callers only test ret < 0 and are unchanged.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/firmware/xilinx/zynqmp.c | 31 +++++++++++++++++--------------
>   1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index fc7212f554ee..0b6c20a1d8be 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -224,34 +224,37 @@ static int __do_feature_check_call(const u32 api_id, u32 *ret_payload)
>   	module_id = FIELD_GET(MODULE_ID_MASK, api_id);
>   
>   	/*
> -	 * Feature check of APIs belonging to PM, XSEM, and TF-A are handled by calling
> +	 * Feature check of APIs belonging to PM and XSEM are handled by calling
>   	 * PM_FEATURE_CHECK API. For other modules, call PM_API_FEATURES API.
>   	 */
> -	if (module_id == PM_MODULE_ID || module_id == XSEM_MODULE_ID || module_id == TF_A_MODULE_ID)
> +	if (module_id == PM_MODULE_ID || module_id == XSEM_MODULE_ID)
>   		feature_check_api_id = PM_FEATURE_CHECK;
>   	else
>   		feature_check_api_id = PM_API_FEATURES;
>   
> -	/*
> -	 * Feature check of TF-A APIs is done in the TF-A layer and it expects for
> -	 * MODULE_ID_MASK bits of SMC's arg[0] to be the same as PM_MODULE_ID.
> -	 */
> -	if (module_id == TF_A_MODULE_ID) {
> -		module_id = PM_MODULE_ID;
> +	if (module_id == TF_A_MODULE_ID)
>   		smc_arg[1] = api_id;
> -	} else {
> +	else
>   		smc_arg[1] = (api_id & API_ID_MASK);
> -	}
>   
>   	smc_arg[0] = PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, module_id) | feature_check_api_id;
>   
>   	ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
> +
> +	/*
> +	 * For TF-A APIs, if the feature check with PM_API_FEATURES fails,
> +	 * retry with the legacy PM_FEATURE_CHECK for backward compatibility.
> +	 */
> +	if (module_id == TF_A_MODULE_ID && ret) {
> +		smc_arg[0] = PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, PM_MODULE_ID) |
> +			     PM_FEATURE_CHECK;
> +		ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
> +	}
> +
>   	if (ret)
> -		ret = -EOPNOTSUPP;
> -	else
> -		ret = ret_payload[1];
> +		return ret;
>   
> -	return ret;
> +	return ret_payload[1];
>   }
>   
>   static int do_feature_check_call(const u32 api_id)


