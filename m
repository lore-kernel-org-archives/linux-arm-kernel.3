Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CFEC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkSPXjSu5mksi6wyxjgO69eZdO6DveaESQDDIYVK+j0=; b=SLxuyKFlX/sqa8tR036JDnABv2
	Rf0Nw2cHyH9T9f9qpuPXuJ6o3VZcWlw7dHJFNo4gTFmsXqv5O4CRY0lv1gv2zittwzJjWJGs435VG
	iFrgB6p/9egZnK0b7dRwr66hQ4O8NXVZ2C/sG74ygJBVn4hR9tG218MsnAq6jnNGeyCBUTb6EwSMq
	eYGhsKCCzAlUMLHpXSBesaAAaia6bQtomAO/HBzvy3k0UgmlYrWsFlzz2AXthU2Nk5Mw2sxsewJmB
	I5pDb/48sbCWPcBpzDChMDudCKJQrOGzgjp6KNp1LiABmOz91yfhYCNlCPlVtM5X58oe893d82/Uz
	0qLcXzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwEt-0000000EiJp-3uMt;
	Thu, 23 Jul 2026 16:25:39 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwEq-0000000EiJS-0Bjz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:25:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMDPF9DxCfGBHi+e1XwQU8f1R6ECHUXZ4U3La5JUpLyJatUd9zNYQZ6uHDHShHhcNWToDXAyi3QT4c0fvtXJ1/eedxfOSt9bfjqR9U4PGVPup6d2PRciOg5vlhvpN78endw+Jc+hfnjP2bnUtgsovCn71il2O4dLAbuyuiQcSYHdeESUq2R9J8XXbVuHxU9Gr1KMnTtvyN0z8ECpdpHUq8qAMDgJcTHVVbJqvv3cqtqbxfBBcmxSAXELllIJ3sWjgj5ziMWI52VXbhWkacb3B8XKuRVwtrQYapUQjhPGTWOiY+23FY92NRtyeo/7keWkg6HN+dJPBqfD8pw/10Hv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkSPXjSu5mksi6wyxjgO69eZdO6DveaESQDDIYVK+j0=;
 b=Ol2/miQNF1YYxu2AdO0jR4aPVBoWrsURa6F1FW/HL5u+wPuq6DwzSjsx1NkWkbNS6HU+xbBjAQ0nsYdHaSZ/7264s62wmq7NxyJY7zfSYBNkGYLK5a82t2+sCvhpSTbFFWrgRsy5Q2+FeioqifEb7UmrOrXn5PhMwIu8yx+UMyPmn+pF4qvKUkuWlrxzZyNHK7fWfyOKUqWxBs1dx0mYLFWq6h47Omi7tucOXdXWniOJZMh+iBFaGnqXrF9DXaAfxeAs7kmidChBzmKmiCAbOoNLgPViJIfZdwOAyjSj7fwF9vn9wDtnfPMOiAPToqaVXphfhhnBIRCJfDfMOwMhPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkSPXjSu5mksi6wyxjgO69eZdO6DveaESQDDIYVK+j0=;
 b=UguSbl8zyy8aTuN+LPUSGYfnJ9lPJS8jqyMzp7gEuRVv27IRnASTHas/YZrTqPAyM/UngOpG4l/gdA7rDisuE4cP3E64+ng8/NqkgVrIo4Ed7tTTKJsrmaO9xBfapIx9VaJJPfWaswCCBYs6AaVKM6RWMFV25hYExLH7czfDa84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:25:27 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 16:25:27 +0000
Message-ID: <f710ac0f-ca32-453f-a0cf-181b4718af4a@amd.com>
Date: Thu, 23 Jul 2026 21:55:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] firmware: xilinx: Add support to clear TF-A PM state
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com,
 git@amd.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
 <20260723124841.2567827-2-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260723124841.2567827-2-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0062.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::11) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|PH7PR12MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: d651e063-8ed7-4d6a-707e-08dee8d7014a
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|11063799006|10067099003|5023799004|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: GBwPKktKUrqIDHVrcsCDHThtL3cVv8k5kESdi5S0Qwp/2OlqzSQWguOXPQHRLlh5gnIDvCa1/6u20zpzqCVVrRAinNCfads09zwaY/hBUrjTz811mOTzsKe+7hnxuIMWAe+MQacVe3GHFNPP2R8dDGX3xvR1e+Zh/RqFYGbApHNdzgX4Es0AWTyScorxbsPtHzB+7m+9NH5rjMoZ2oaENyuLwATr2ImD538wmQnSqpJxVLeOrg2MWBwTtew4F/kfH4a/XA8n8qgel7rf0rtpoIf0ByeaWkxBbrUfOarSLbB/wK2evQRGkOr9jsD/wI2lQozRhB+1VvWMKkOfTaoG5utZ7Kt02248rIk0VHOUd4KNFVK/GgvahGV4HlYFcdhd0ylXwABS9vX03eGfu4TtTXcpQ7UAcIhpxMi2dw0Dp/x07nIuXkphiWcg38aFeDezSIolpMUBPstOtiXdeqHvy1uRqSasqpl22dJTCjFRgYxKsJZPikyeViOIOIkdD/7b1vrgVTdp2VR7EpM/SEJGFKfJuUniU92KqzmeR5aPtlfyQpmboMeKg4/QlcCoX1wu7ywIaqD3usc3oLDWYlqTnK3qizpYleIii4XW4S3Usbk1DtcXUN3fXBnWSqzKUID3wLdud5qSfirIqBf05YZdRLBNJtfqrMHM2HFHMum7Bcc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(5023799004)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDRIbjNmSmhNZlNNSlY5MGZzTnFING4rbnhzWjcrOXdqMzdDd2QvaUI1YWkv?=
 =?utf-8?B?N1BJczRzWnVkMHVUb1M4V1VnM1dPeW0yOTRWYlk3NUppeEdkQzV3czN6a08w?=
 =?utf-8?B?Q1FWRzJXejE4TWVEU1kwQ3BtRGo1SlFudzFueURXblQrVW5TdU83alU0V2VB?=
 =?utf-8?B?YXZLenNma25kMVZIWFpGdFppTkJZWW1qdUh6Y2EwOHJUZCtrZVhIcVNtM1Ru?=
 =?utf-8?B?T2p0cXJiNlZzK2dhSXNjeitUbUZnUXg5b0dLS3RpOFRSclBxMEJGMm8yZ0VD?=
 =?utf-8?B?dUNrRGNNNGFmMjN0SUZGTmhxbDBXK1pkTGJWMVRrKzhNVXE5SmlSM3BnWnZU?=
 =?utf-8?B?QnRtZXYzajZTaHZNZHk4OUI2UFdJYmc1WGtRK2JZTmtNOGM5Z2FGc2FVRUlL?=
 =?utf-8?B?VFRPTElkQkhMY1RLeHYzRWw3aXU4b3poWjBhQ2pRTGFjeHAvV3ZsMlZTbDQx?=
 =?utf-8?B?bnBiQWtld0xwWkRYQU84eVdYVW9GZjdtcHpuZUNHTzlUblpQekMxdm9DenU5?=
 =?utf-8?B?N0pDM1RIQlR4WnJJNzZYdDhST3NpN1YwQ2toMC85WklGeXhuRVFHd1IzOVRk?=
 =?utf-8?B?ZHhLbVBkVHpwaEw2SEgvODk3MjRVM2ovTWg4Qy80M0VXamJaQmNrWmE0R1Q4?=
 =?utf-8?B?R2FlejAvNkEwdFdJQmdTTnA5UU5vdHVNbHhMS09zNTZMdTBlWEpKa3dKYVYv?=
 =?utf-8?B?MnNSaTNDZTZ3ajZaMGl4L1NUeGhmeXhIb3c3aHNwbWlqOGZZR3ViWWw0MDhz?=
 =?utf-8?B?bkRCWnJZc0ZyamdsSlhmTEJmNzI3cXNvRUh3Q0tDUzlScDk3b0pWcUYzV0dp?=
 =?utf-8?B?NXA2OTRKekVQMklvZGdJS2ZBVEtIMUxmdThnZmhuYUpBUWZBTW9SUjAyWkNl?=
 =?utf-8?B?SHhHd1BHVTZhaVc1RFVjSGttK2RQeldqK3ZBdGNkeVpYRFFnSFl4SWdlT3Qy?=
 =?utf-8?B?YmlkMWoxSGpCNzdHNHY3c3Z3WkVSNUE3N1pHZU9PenRWNDE0NWxPZDFYNkIw?=
 =?utf-8?B?NHQ1WnIvejlSYU9YRDlzYTNCRHIvUm1oc1AzN0FSdHdtY05wdytrN0lkd0F3?=
 =?utf-8?B?MUNML0JyWTNlaVdxa2RsWXBrWHRtL1FSYi83VWpkTzJqT096N0UyUGoxSVJw?=
 =?utf-8?B?V1hJZnZXcTFMOWZMQXNxMmFldEVERy81Z0JwK2pqRVhlOHhEK3dXODE2RE5o?=
 =?utf-8?B?UEpVVWMwNkloczdCVHhRUzhYRHd0T2NGUWZEZ2VCR3I5NDBMaHpMUzZjQmRZ?=
 =?utf-8?B?eXQrZjRGR0EwNHJOZlZ5UUpadUhmekJtWGJVWStFZnhuV3oxaU45RWNrRVo2?=
 =?utf-8?B?YTFCeUROZWFjTWVsRG1YSEdLS2NBc0g0ZTUvMHBQaEYxZGpXN0o0UWlHVzVU?=
 =?utf-8?B?dVVNeHE4TUZCY2thc0x2V0IyL0ZtdnY4Rk45RE9aL0s4TlFabHlKZXYvdEtW?=
 =?utf-8?B?NzRSZlJ0WXhZT0JXaU5PR0NFeEpGY0RxNHhCYVViWk92c085ZkI5MHhYQVQv?=
 =?utf-8?B?bDhiT1ZLMmEyOGw0cGhOQWtuSTloeFh4eFBodkp4NTU3dVhVc0EwNGQzUEwy?=
 =?utf-8?B?QkpQL283TnhLNkx1RjFBZVhRQ0dXWnhFSmdPNTRYdUtiV2JuaFdwcUtJaFNv?=
 =?utf-8?B?Rll1NkJKVEMwSzFFYi83WG05Mytmam9PNStCUW9FMUVNdDkrY1NnNzQ5Z1hI?=
 =?utf-8?B?N2VPVEFQNlIwUjJoUmp1ZU5MaHMyVWtCTHN4b1ZqL3IrSmRwWHJaTkhMTStz?=
 =?utf-8?B?QzZvYlB5NHRoUE40Tm5NZzhjQWhaOWdBN0Rja1FEb1dvVkhhbHlsamtrSTRw?=
 =?utf-8?B?WGZhQllvNldBS0VKSEtidUw0eHJlaTZlOXd3N0tGY1YrK0k0ZlViR0U4cXRo?=
 =?utf-8?B?M01zNHdtQ2hxL3FST3F3NXhMdlNVSmxmV3lrZjBPQjlDWklRc25uMmovSkJl?=
 =?utf-8?B?cHJvdDd6VkJla2ZodTA4R1JZYWxvb0RFYUgxczlvSkZmbWNyRTBhdFVndHJw?=
 =?utf-8?B?WXd5Z0VHa0J6Y3ZuZjhqZVdFWUNmWS9XcDVoR1N5TGlxc0hvMjJiNm1LSFpv?=
 =?utf-8?B?dFZvVDRJN2t6QjJXbnd3MFJzT0UzUzZHVDZCa2libXJ4ZUhxZUYxeE1aZWZ6?=
 =?utf-8?B?M2RUSTBZbzBwaXFaQm15d3c5K1JSd2ZUeVRsK2cwajBadDVQYU95RmllOWQ3?=
 =?utf-8?B?S1JRRmxzTi9HVDVIUHpFMlVOZDU3NWtjT1J3REZRalpVRDBFN0tlYlljSXNI?=
 =?utf-8?B?SUxCTElwalZjOTJzVHNMdWdINUJZRzB4NXRxTWNBQTNtdjh2emREYkhzWE9X?=
 =?utf-8?B?REtxNmJVRUorQ0t1SUExeXVWSDdkaDZiS0F0Mms5MnZCZjdScGtYZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d651e063-8ed7-4d6a-707e-08dee8d7014a
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:25:27.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fpYR8LSacu8TSkc96GHPlhYvdByZTkx2vzadFiHVY+QBaw4Aru3+J4qLp1o4EU0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_092536_115374_CE6C0C91 
X-CRM114-Status: GOOD (  33.42  )
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
> Currently, during a kexec restart, only the kernel is reloaded, while the
> TF-A specific data remain unchanged. This leads to a mismatch between the
> kernel state and the TF-A firmware state like SGI number and shutdown
> scope variable.
> 
> For example, the kernel registers an SGI number with TF-A so that TF-A can
> notify the kernel of events via that SGI. TF-A stores this SGI number in
> its internal state. After a kexec, the newly loaded kernel re-registers
> and may request a different SGI number, but the stale value programmed in
> TF-A remains, so event notifications are delivered on the old SGI and are
> missed by the new kernel. The shutdown scope variable has a similar stale
> state problem.
> 
> To resolve this, the TF_A_CLEAR_PM_STATE PM API is introduced to clear
> TF-A-specific state during kexec. On a graceful reboot, this API is
> triggered by zynqmp_firmware_shutdown(), while in a crash kernel scenario,
> it is invoked by zynqmp_firmware_probe() in the reloaded kernel.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/firmware/xilinx/zynqmp.c     | 48 +++++++++++++++++++++++++++-
>   include/linux/firmware/xlnx-zynqmp.h |  3 +-
>   2 files changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index af838b2dc327..95ffd8f33ce9 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -3,7 +3,7 @@
>    * Xilinx Zynq MPSoC Firmware layer
>    *
>    *  Copyright (C) 2014-2022 Xilinx, Inc.
> - *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
> + *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
>    *
>    *  Michal Simek <michal.simek@amd.com>
>    *  Davorin Mista <davorin.mista@aggios.com>
> @@ -13,6 +13,7 @@
>   
>   #include <linux/arm-smccc.h>
>   #include <linux/compiler.h>
> +#include <linux/crash_dump.h>
>   #include <linux/device.h>
>   #include <linux/init.h>
>   #include <linux/mfd/core.h>
> @@ -2065,6 +2066,42 @@ static struct attribute *zynqmp_firmware_attrs[] = {
>   
>   ATTRIBUTE_GROUPS(zynqmp_firmware);
>   
> +/**
> + * zynqmp_clear_pm_state() - Clear subsystem state
> + * @dev: Device pointer used for logging
> + *
> + * Clears PM specific data in TF-A.
> + *
> + * Return: Returns status, either success or error
> + */
> +static int zynqmp_clear_pm_state(struct device *dev)
> +{
> +	u32 pm_family_code;
> +	int ret;
> +
> +	/* Get the Family code of platform */
> +	ret = zynqmp_pm_get_family_info(&pm_family_code);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (pm_family_code != PM_ZYNQMP_FAMILY_CODE) {
> +		/* Check if the TF-A supports the TF_A_CLEAR_PM_STATE */
> +		ret = do_feature_check_call(TF_A_CLEAR_PM_STATE);
> +		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_1)) {
> +			/* Clear PM specific data in TF-A */
> +			ret = zynqmp_pm_invoke_fn(TF_A_CLEAR_PM_STATE, NULL, 0);
> +			if (ret)
> +				dev_err(dev,
> +					"Failed to clear TF-A specific subsystem state: %d\n", ret);
> +		} else {
> +			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported in TF-A: %d\n", ret);
> +			ret = 0;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>   static int zynqmp_firmware_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -2118,6 +2155,9 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> +	if (is_kdump_kernel())
> +		zynqmp_clear_pm_state(dev);
> +
>   	/* Check trustzone version number */
>   	ret = zynqmp_pm_get_trustzone_version(&pm_tz_version);
>   	if (ret)
> @@ -2151,6 +2191,11 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
>   	return of_platform_populate(dev->of_node, NULL, NULL, dev);
>   }
>   
> +static void zynqmp_firmware_shutdown(struct platform_device *pdev)
> +{
> +	zynqmp_clear_pm_state(&pdev->dev);
> +}
> +
>   static void zynqmp_firmware_remove(struct platform_device *pdev)
>   {
>   	struct pm_api_feature_data *feature_data;
> @@ -2210,5 +2255,6 @@ static struct platform_driver zynqmp_firmware_driver = {
>   	},
>   	.probe = zynqmp_firmware_probe,
>   	.remove = zynqmp_firmware_remove,
> +	.shutdown = zynqmp_firmware_shutdown,
>   };
>   module_platform_driver(zynqmp_firmware_driver);
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index 7e27b0f7bf7e..baaa88b0b197 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -3,7 +3,7 @@
>    * Xilinx Zynq MPSoC Firmware layer
>    *
>    *  Copyright (C) 2014-2021 Xilinx
> - *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
> + *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
>    *
>    *  Michal Simek <michal.simek@amd.com>
>    *  Davorin Mista <davorin.mista@aggios.com>
> @@ -66,6 +66,7 @@
>   #define FIRMWARE_VERSION_MASK		0xFFFFU
>   
>   /* ATF only commands */
> +#define TF_A_CLEAR_PM_STATE		0xa05
>   #define TF_A_PM_REGISTER_SGI		0xa04
>   #define PM_GET_TRUSTZONE_VERSION	0xa03
>   #define PM_SET_SUSPEND_MODE		0xa02


