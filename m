Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7E9CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vl5onSsMJgyDyHNAL/WcBCaLiBhm7EJqzj4ZI6iqxsM=; b=lNw2x+fIJVNg4uREVp3T4MvUU2
	pTa0Q/n9ARZRhj9ZkztQoJi/PTZ0pZntGkGEAg1E8obZAzFOFjAU4pxAngrwGBdQSO1hoGfnW7iv8
	VTF43zFL+Q4UWz8VibMHgNucw9NufrxQGkYR5imdQKG/1GbPVRFsaLoZhEp6Kiyn8sA29I7p0P6Uq
	/2P9CMZJbrAm/aEH+ISQF2rpHsecISiKeXhxEh2nXIpyBuOiMhiLuD1ojZ4Tpsw/wXbQ5AYpfgScw
	y4xeYRFwitHvWZacrgbZ7TRF9026tXAEMu5G9vxrFo9WhyDQMyN4pFiCHMaU53oCH50jOAUu53vgO
	iPNVs+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3Xr-00000006aYX-2pi3;
	Tue, 23 Jun 2026 16:00:15 +0000
Received: from mail-northcentralusazon11013035.outbound.protection.outlook.com ([40.107.201.35] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3Xn-00000006aXb-47wE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:00:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kA3S3vN3GzUr7ShQgmglUNGhD84ZHLe7UztOPigPT/r8WmOA2iXtPHuITW7Lndl41ouI429Zs/CMSuxmYieYz9z5Xj9MNZ5mU+VLITsKRKy/X2jsDRwCQOFPisdfmDYgdzrDFu8s06DZgMNQ0xZMbE7biCoBEl8K4tNb2TYGxzn/YDTfMUJmsdy6k0VMsT9iEJFxIwW0QIg3T18ef+ERwKqag22e7yFY3fYVZb1MdSu7Jp4Zj22+jV9ByQSsPHyCkz06eLk3SAUzxmmGmk4d7HWU1x128C/kkWFGBI0ko9yhMjpmGydtHd03HK3i0ucYclZLc6RQg6Y93foSLWuD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vl5onSsMJgyDyHNAL/WcBCaLiBhm7EJqzj4ZI6iqxsM=;
 b=u7WnDFPYPuUr1vULuWgf0M+c55Oi5hxmxMyvFzZvAQmpGyfyRQHWH6EwwnRxt9lhnIu8g+Mv5QRs9dKhnekCrdRxjcRxU6VwOm3f2IrJoMs2jacQ+fUUNhfSSvTmXkR08KTuKMf2ZlBvWvROLYILZ5V/SNpfIBiZIIJHVsup+Jzow9+SNagFpdYx/q47+VfZLyDn0+lgR7kq6yKPThZQRYrOXnu2JbJUG8PM9oPmlhrWu3BjsG2R/+YBl1ZzfNMNgMOeu7DyoeLCIEUTalcKjPaL9d8DPLXdqxI7b3/0n4o+NakfYVnmDeG8zYkOszCX6gEV5MQpB10GuUBrU1oDEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vl5onSsMJgyDyHNAL/WcBCaLiBhm7EJqzj4ZI6iqxsM=;
 b=uNpbKSzzcGpDXLjwBONazkz1RG500BhSnNXSTBVucl61ISxVrabfcvXuEUFP354TQqD7ASYbslh8IeTLHrpA9boWQG+XxwdkRSt6k+Mck2BziVdw+7gwrpEk26SmqoqEqSZ2KeR/+m6WjHkDkk4iams/q+/ey+NzIS95O++oaZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 16:00:04 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 16:00:02 +0000
Message-ID: <7079c747-3168-4aee-aa28-9410b57ba806@amd.com>
Date: Tue, 23 Jun 2026 21:29:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/3] dmaengine: xilinx_dma: Fix channel idle state
 management in AXIDMA and MCDMA interrupt handlers
To: Suraj Gupta <suraj.gupta2@amd.com>, vkoul@kernel.org,
 Frank.Li@kernel.org, michal.simek@amd.com, linux-kernel@vger.kernel.org
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srinivas.neeli@amd.com, dev@folker-schwesinger.de
References: <20260620203417.4000360-1-suraj.gupta2@amd.com>
 <20260620203417.4000360-2-suraj.gupta2@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260620203417.4000360-2-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0143.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::10) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 7756c962-50ec-4f77-9906-08ded1407c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: ekjsOf0rgoX0FaosehdZWdVbMtrf5tawiHGf/hmuEfCDADjDktpFpAFeAUAZofwNtAyUtpcJLONzJS3pEno144Kw3hOhsPeTBeeqfKFEH0BfIsCefZvR7iWx4sL1mDCx3d5VhcuysujF6RmoJanrZVjHICpmyhVOnbrOFHDPoBKeEAOhsf6opS5RA/QjNbYXSjscWKXmw7F4gIQ5UZwDdtteWacTerYt/akd5UDLgYymPKT9uxelxo2mLwB5wIj1+JpN31PhkomJDvTBWWyvS/4s6DvWETJKXZY3oIYElxR+q5uCVWQBrR0OcoeGZFfeUPUrwDhiTwzVSjDeeIcQjwBgUqvEYcPiIzRXEHmvhODgC5bQMfLrDp8OHi8dC1Nokd7DGjmAVHj/ZPrYFWzMDQ/w6jQKzQ5pJRA2uAHeaRlMnwoKJUg1+j/PeJP0Rsdw44Z8rO6guE6oiwV1p8YZbxDO7DswrNaPssQdZhM1Wg27gn7fPNkbc3rghlH4kdnlIxXTIUIVXJQrcRnlsnbHkg3CZ4JZgCfAB58YCTe3CWA3ZkGw05JdLFTNQ9jO3gRtY1BAZxX9tTL2jqHaUNMHiVo1mm64OgHCrDQPQ36EkxR3XQ3lFW0O1JBoAitY5/RovPmzJl1FeKjQOVfmAVik4sU1TqADx1XTJ0d06BIUdnQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vnh6WHJ5U2trYkVDOGdQNjg3SWZ5dm5LTGtFRmtmTldkL3dJZ202dng0QWxD?=
 =?utf-8?B?Q1RuREVZSmJQTU5iMmE0Y3BwNkh1a0Z6dS9ucWVyT1Q4a2VmZFluNk1jZ3hh?=
 =?utf-8?B?ZTZvbmFCS3k4QWtybzhsQ3gwREpoQU96dzFVYU04K1pnd2d0OVZPdnZQaHp2?=
 =?utf-8?B?RmQ2SVdoRHZrOEZUakVSMWorVC9sbEtQTDNPRTRIOEd6b1lWNnVMaFVtL2Mv?=
 =?utf-8?B?aTlpK1JobEpxOG1DcmxFUjE2UldGMENkbkZqUCs1RlhOSHRhSjRIM1dFaU5Y?=
 =?utf-8?B?bVVrSjc5OFlsY21MTlJzZHZUQi9rZEd6TlQrYVFYTXVCS2ZsZlNzTEVzMGV3?=
 =?utf-8?B?Y2dxbjFqemZRQnNROUlSWWRPOU5pRXNITExnbTVjTnE3cXRjb3QvZ1AraGk3?=
 =?utf-8?B?QTh6YXdwUG9mZGdPWE9ZeEU5dG1ZR2VxWEZ4VERuZElUWVRYYXdHeUllRklM?=
 =?utf-8?B?UjlReEJscVdsVXdBc1VYVGFJRHJ2dFZtdDB0aEt4cncvRlhzY2ZoTTdUZkda?=
 =?utf-8?B?d2J6bXk0bkdBQ2FKOWgrYnNvdCtwaG9udDBpeUExaU9MdC9QWDNxWThtMnh3?=
 =?utf-8?B?amU3azc5UlhZYWowUWpTQ0Z0QUk1VG5oR0JKMnpqaFRtVEJqUHNzM1oxM3Ji?=
 =?utf-8?B?cHN3U3M4TDFRdVI5ZmlORE1NU2FDLytMeVFoRElQcmZPTWNrakV4SlBmZFJC?=
 =?utf-8?B?d2VwWjFBYW81VGFTY2EyQjNOTzExQys5RGhMR2tFQmlxdGJpUWpRUzdBUUJE?=
 =?utf-8?B?S3N4N3JvZFh4MDhkU0EzMDh0Q1V1Z2NqbTVjRnd6V0RMSEtTTm1MRkxzR29j?=
 =?utf-8?B?TFJyeS9hd2c4VE5WbEJNTlAraG1ob3FXTmVpTE1wVVd4Uk0wK1VYM3dySHF4?=
 =?utf-8?B?Tk1DTHVUNUk4b0dMeEtQdWxlMjRvS2xPMUVvSFZubCttMjlTUWQ5elZCR0py?=
 =?utf-8?B?eGplVktGNzBKaGlBVlR0TytxWFdtM3d0SVFORGVKL2J6N0xNVnhPNW45QVZI?=
 =?utf-8?B?dFFhQUp0OWRPblhCTi8rVHFBYmZUcEtpR2NFMllsWVlZbUpxVDR1U3pmNzZE?=
 =?utf-8?B?bEZ1Q1BoL2E3VHdTNEl2Q1FWaDNxMThRdjlGREVlcVNsQmRpZzRsM3g4SlFY?=
 =?utf-8?B?b2ZPSXhFdVRiNHZ1QVN3SmR4emtnMGp0NGZKSllRZ1AwanFvUFI3Vzd0WHdo?=
 =?utf-8?B?bHFMQmNlMjZLMzZjcE8rRUUwQk42c2ZDYWhzY2ZVcXV0U0JqOWNIODY0d0Vj?=
 =?utf-8?B?T2hHbWk3TGtjYS90K3VCcUhCRHNmNzVPUGZhd1lGVFZGLzRqa3pWcjg3YW5t?=
 =?utf-8?B?NXc5QWJQR1dYU29KcER4ZXpJeFgzREE5bmhYdVZObmtiNjdXc2NHZnFRRjRS?=
 =?utf-8?B?Q0t6TWpsZHRFUWIzZVFFcTRaYmtNMWtZdmdxYmpiVDdjTHlESGk4ZS8xQUJG?=
 =?utf-8?B?Mkpyd0dmVUt0ME1hdnZQZWJxNDN3ZnN3OTNWaVVrRVZHdGcrNzB4MHcxbGNz?=
 =?utf-8?B?eWNwTE9rT0pxbUYwS2dRdG1sVG54aGpDMFltL2FaNVQ1eGhMZ0ZXcWFsTnZL?=
 =?utf-8?B?Z05uclpKd1JjQ0ZLOGZZU0JrU1VUZGdRTUVZWXVlbUt4K0lvTEVwY0RjeFFR?=
 =?utf-8?B?SEo0ZEY3S2c4MW5XUFVqQ1VKM3IzQlBYcm9hakRKYWo0NEJVeVIrYzhlejJy?=
 =?utf-8?B?Ynlnb0tWRGlUejYwZUtCSkFMWkhzeUNxQTRFZnVKR0E2ZVZTODAxbkUrRkVE?=
 =?utf-8?B?MEtjWXN3Wi9yUFI0eTl2NEdQeFdhVUxnU2hDblFlQ2lZdmdkaGRPcE9jOGxa?=
 =?utf-8?B?UHpFRytNS21ndVdLUnM0dUFaQUZjRDg5TGZ0SjNyS2x6Ly9YRU1UYVlHcVlX?=
 =?utf-8?B?QmJ6ZHdxNThqSEFtYyt1aTRBejVHWHBXZ09UMjlrM2dLRFBQd1E3KzRSc25L?=
 =?utf-8?B?OVJYSzFJTkw3VjJpaDBjQTJCUmlDcmE4cldBbEUvN0k5V1RvQVMwV0l3YkNI?=
 =?utf-8?B?cUduTDFvcDlOWWJIMW84M3JsZG1HSWVVVTN1Z0Nic1VJQ3F5WVdYMms0WUcx?=
 =?utf-8?B?dHBwTjZUTzkvR2hJT1NiRmYyNXkyd1ZqSXVod0pyaXNJR21ZTEU5OWxBVmNu?=
 =?utf-8?B?YWJFOTdhRmJFdDlDdWdHSksyVnNzdnlwWThrc2FjUEhncUU4V1A4Y1NyRXJj?=
 =?utf-8?B?SEIvU0NlSlBpYkZwU2cvRzhiaCtLU0ZKMU5MOW5lb1NjZGRFMnRHZ1JYdU1R?=
 =?utf-8?B?S3QxZ0MwNUZmeUlhR3dPZGpBQ3dZSFBBUFRtY0plWUZwUllyL255anZQa1Yr?=
 =?utf-8?B?d09kdEgrcnROMG16emtxVjJCWHVRMlBLVVdSanFSdzNaVFAwR09RQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7756c962-50ec-4f77-9906-08ded1407c48
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 16:00:02.9481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWFlcGKOdHu8NiDANJYAgbXy5Wkj1XImenJ3zV17ptrKrzLM1BUc1RUTVRPeUmHv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_090012_032289_7F205BD5 
X-CRM114-Status: GOOD (  18.35  )
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

On 6/21/2026 2:04 AM, Suraj Gupta wrote:
> Fix a race condition in AXIDMA and MCDMA irq handlers where the channel
> could be incorrectly marked as idle and attempt spurious transfers when
> descriptors are still being processed.
> 
> The issue occurs when:
> 1. Multiple descriptors are queued and active.
> 2. An interrupt fires after completing some descriptors.
> 3. xilinx_dma_complete_descriptor() moves completed descriptors to
> done_list.
> 4. Channel is marked idle and start_transfer() is called even though
>     active_list still contains unprocessed descriptors.
> 5. This leads to premature transfer attempts and potential descriptor
>     corruption or missed completions.
> 
> Only mark the channel as idle and start new transfers when the active list
> is actually empty, ensuring proper channel state management and avoiding
> spurious transfer attempts.
> 
> Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx AXI Direct Memory Access Engine")
> Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
> ---

Checked shashiko report and it points to 3 existing issues
which should be handled in separate series.

For this patch.
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!


>   drivers/dma/xilinx/xilinx_dma.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 404235c17353..ca396b709742 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1893,8 +1893,10 @@ static irqreturn_t xilinx_mcdma_irq_handler(int irq, void *data)
>   	if (status & XILINX_MCDMA_IRQ_IOC_MASK) {
>   		spin_lock(&chan->lock);
>   		xilinx_dma_complete_descriptor(chan);
> -		chan->idle = true;
> -		chan->start_transfer(chan);
> +		if (list_empty(&chan->active_list)) {
> +			chan->idle = true;
> +			chan->start_transfer(chan);
> +		}
>   		spin_unlock(&chan->lock);
>   	}
>   
> @@ -1950,8 +1952,10 @@ static irqreturn_t xilinx_dma_irq_handler(int irq, void *data)
>   		      XILINX_DMA_DMASR_DLY_CNT_IRQ)) {
>   		spin_lock(&chan->lock);
>   		xilinx_dma_complete_descriptor(chan);
> -		chan->idle = true;
> -		chan->start_transfer(chan);
> +		if (list_empty(&chan->active_list)) {
> +			chan->idle = true;
> +			chan->start_transfer(chan);
> +		}
>   		spin_unlock(&chan->lock);
>   	}
>   


