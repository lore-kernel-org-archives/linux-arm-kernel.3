Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBA8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOAayk2JtGzDsrWrT2U9/vluHvKhL+xseLBbiGlAe+w=; b=4nlz39WnpGEKLl+6qSbk0Mp98/
	hzG69QnsmVGdEkshYg5kUpYjktin7V/dCUyaQf7T9B32gAABbHojfGOwKhbsyCPxd2Cv/ekkMJHQ4
	21dwdi6AnBG/XjVNenADe3Y8u7Em0VoqYywK8nJXlyId9Azmrg0XNA1MeJaYQzZSDFD6zal3aErDK
	QtDOM1xTVJuGWRrpkZvocYbVIDuBk/bQovdjw/zvoGTSlC3vAyb6xpKuVs76yIq/HkJN05E3FcDlv
	LmuLPuU/4E0XL0Jvvjxe14N0fOdaGi9iEeRENd28MTHqkmyJiPUTO2D2cqW6bTVuudIQGJyHrT47a
	RZ7Nncow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdVxm-0000000CdiB-2RXC;
	Sat, 27 Jun 2026 16:33:02 +0000
Received: from mail-northcentralusazon11010037.outbound.protection.outlook.com ([52.101.193.37] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdVxj-0000000Cdhq-2oS8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 16:33:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMznaF90nt0oZp/V9pJLekwf7W9voPRIqCA6/HZsRolWljArIHOl9tpMv9qBKWzHsDSht91+DmVWOerlbBFhzo+Zh6WPwy1Hp7C6DqzItJGEHQWJeS2soIFZ+dQjvKNTlIxNTSnB3ML7TpQ0gHlodurh5+125b4J8nGTtg1ZtU61/WLcDWzs7xlFGS1vll6i+9G3xe3z2q6LpPnWRcI4gjt+25YqFlPnj5QbZI9MyFdksGE9jsrmwMSIGbdWnK//o93u6nF0Z8wYgvdSHXUKJ3Qvy8nOYJPyxO+Jb0yyKEQ2UyIhKx9Xco69ZOMmkBZpcsij/xatue9fZzitJauWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOAayk2JtGzDsrWrT2U9/vluHvKhL+xseLBbiGlAe+w=;
 b=XTmsaxTOYgjJK3b3P4SBt4ehwvWqt3pVUxFcO+w/KSC8K0SG1ymjwV5retH8oXhGE+enc0y1CI/LsvHQScN7UOYjfN1XEqoTfOjhHMTxlM6jv8PsOMaBK+2L+FgBelPQAaL9DRjXmb1dTxFwWjYKgFZ5EoutD27RSZHZ5iUjB8RgGgsvJtxsbYrfI0ssLopdBux9LVdNr5qyzTjjsSxoddy8YY06iVsofQO/T4a5IQi6xmDkTkZvrEf4ILi2BHMTYbs7ujUlTykHTku1df39qoLoCGo+ZFShJ2jT1/yl+S3rMKCxJL/dm9HCfdn6xV5Wsusc+bCLO3NuI6VEIBoCPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOAayk2JtGzDsrWrT2U9/vluHvKhL+xseLBbiGlAe+w=;
 b=egUN43pANFh5O5/D5yeHnv0jfNqUA+LIWJlkw8SMsRVNjyq9fvr2d5j5akXwbaXZLezPbEEb9oSDL9kK48XC7CjsI1hD1Mr9/wZIiv0/EggyOWliVbDx39f4wBwsqoMJ5qfP8KFm6RUilwLHyB9Dk5J/x4Xg6vgf6SvKTS/CGLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Sat, 27 Jun
 2026 16:32:53 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0159.018; Sat, 27 Jun 2026
 16:32:53 +0000
Message-ID: <b2b9c582-68c9-4a2c-8c2a-b7e7ba7807dd@amd.com>
Date: Sat, 27 Jun 2026 22:02:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] dmaengine: xilinx_dma: Optimize control register
 write and channel start logic for AXIDMA and MCDMA in corresponding
 start_transfer()
To: Suraj Gupta <suraj.gupta2@amd.com>, vkoul@kernel.org,
 Frank.Li@kernel.org, michal.simek@amd.com, dev@folker-schwesinger.de
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260626092656.1563871-1-suraj.gupta2@amd.com>
 <20260626092656.1563871-4-suraj.gupta2@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260626092656.1563871-4-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::17) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DM6PR12MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: 726de07a-b96e-49d5-5948-08ded469bc96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: GXwst5X0ensPYxPPtHEL9Gce5GG+aKmRsfDe8bMcxVYwlNmNd3/D99v7GPMHvhDPjn2RLtrpgI1lVDly/1+A+ItbmQy111fU/2/KWNxF57SkOVKyflUbmCjp9lYXyTlQ5iHyB7+RB+Rt27sZbdr51oAxaeQsTG58FtnXlEPZ7uTeMCLsTU6emVeiJJd1M8jEn1epW6OmcUjrkQpEDSkb7D6gxKJ3LoNGsfLEwo94mTlcY7sd6J8CiNPLAEUiNB7pU3bC5z2m8tQZjw02SBblj45r/+oDyS6oSPswRV4bP8HjbYae1HOxkm9zKgL/y8YCIOtHRdn1neJsWsDdD5wknQR2tXngdTZXl76+Mid4MtSq1ymkmqHznXmkwGq7WtOKIZ0CxRKd52C0JzRC4cV6YkJCXuS1dTR7/3rcLuHXtMgs2fpfCKkbaohiir7poFQClMkxAdoxUEe3JVbdWF8JwgK92W6QhPMYx+IKaBpYNuoIrZDA/89f5EGfp2BWZtwce++3kmus+dk0GGsx8rQjijLHXwbxE21XeXwS1uyEo+/Kg0fv1ONozDEUqRXTvHXdaVDdZHwMSV5TzRi5QpPy3DUcEpnU0Ue3SEM2t5+Q2wR3ajo9ufxtfL3LXePsOBhqLa+QMoJIveQaW3oO+l2xMuzD8DMCaVDWFDOz4KAy+Vk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFpFSDRUSDlyMnZwdXViUUY3d0JIQzNmbXZOUVJKdWVNRGJ6SExvdUUzSkJv?=
 =?utf-8?B?WlRiOWhLR2grNE94a1FsMnI1QTdRYUl4NGs1bDMyTms5bnF6RGFnMC9MbW8x?=
 =?utf-8?B?Qy8xOEZWUzRlSk9HekM2UUVVRnZzT01yeHFQdzVqRHJrR0dyc25ObitydmhS?=
 =?utf-8?B?YzBJTXJMT1JhSVlscFZPNTRKWVZxenVjZ3Z6cFRTL0M4S2YvYWxNYkNtdlZq?=
 =?utf-8?B?NWt6OXl4RjVYbFN4akZhWEdKMVRnSmcySXhxYkpYek1tU0RDSWEraTF3TTBD?=
 =?utf-8?B?UTRFTGl0ZkIrWlpmeUp4c2RmSWhlT2Vyd2tyNjdOeEpJWHV3NnEzcTk2bCtx?=
 =?utf-8?B?UzAycndKNmF3TklXQysvTFpkZUtsZkNqdnlrMk9tZ3BRV1U0a09rdmdnZVFL?=
 =?utf-8?B?LzhkUld1Nll0eEUvdGNUNThWM3VEeTh3TDJidXRkOFJIUG11TC9aeEdtVHl1?=
 =?utf-8?B?NWE4VzRZVzBZL2pkN3ZxRnpZR1NKbUk2cmh6cDNnYkVNRGJjYytZdG5vZzhG?=
 =?utf-8?B?OTRCbmwvSGRndDhEUFdCNXNBQUZzWGp2VWl3ZXNUcnI3R1VWZTBKc3hoZDZh?=
 =?utf-8?B?cWpYZSs0UWpzVjdHSkZ6clBRaEtBb2cyRWpEbVFvd281ck4wUG12K3RGdEhL?=
 =?utf-8?B?UDRwTjdDcFAvV3A3aXl2b0xXWEdkSW5QRUQycHhKejhJWFlZSTB0S0dPbkpp?=
 =?utf-8?B?SlM3NnFrbGtodk00OVkzMk1GcGFLb0ZYbHUyWTNEYXFhQUowOEtIeW41c0tl?=
 =?utf-8?B?d2ZmOENta0oxODgwTHhabjZYdnc0a2hzcmt0cnYrVFV1WngzR0VMaWFEbVE3?=
 =?utf-8?B?b1ZSS1dvZmxyR1Z2UEJwamtRN1ZqMDU0dm9OSjM5QTJpcGV3eWoxS1lXV0hk?=
 =?utf-8?B?MHNOZHcrL2N5MXBLUDNEbnJBc0dhUWhKWXBJUitXWGN4VkhRWnFaR2VSaytV?=
 =?utf-8?B?cDhOcjc0Y2hGVXRGaVZHZVNPc2FFb3ZvWmtWQkZKemVMYTJJQzFVQkY3dFZ5?=
 =?utf-8?B?b09Lc2VRcHJNUlhSMXBXalZUZGRieUNVK3NZNUNZUC9GajRlT3lXVG5OUjVa?=
 =?utf-8?B?WlF1bWJDM2lMSldjQ2tqZW5WVlFQbG9KWmVPNEdwcUlIN3RHYloyUU9pSDly?=
 =?utf-8?B?RWFPTzNZWlhybGhEOVlkOFplUE9TMDFtcWVGU2NmTy9qTW9lbW9PRExHbExi?=
 =?utf-8?B?OVd2OTQwWHFuSkxYSTJDSVhEYTdBSTdyckZsUm5icWhEemVMNWhJK3hPbHpG?=
 =?utf-8?B?QjVVb0ViZDg5blNRNGU3Z1ZKSFU2MEZHb1RzZUllRVlIbUp1aDZVQ0pzaXBv?=
 =?utf-8?B?YXFrdmpSYTJXLzZINEV6VHBtdlBKQ29MSkRjdVhxTjZYSTZLNEdzVDZQRXZo?=
 =?utf-8?B?N2JMd2g4R2paOFY1MHhjWVM5QUt1WkdBNXUzbUlKdGNVMDB5YUdEZlZKcVZK?=
 =?utf-8?B?bWM4ZFM5NjlkMTRKazdaamNGTFBCTHYydTdwNFl3NXJod2J5NTRvcFA1OVVv?=
 =?utf-8?B?dzdDYTBwN2xPaDVQZitQTGIwWXFSbnNNS3R0WEEwd1hyR2t3Z0hEcXZJYis0?=
 =?utf-8?B?V3pPMDdaNGxLRElBcU5Tdk5BVTE4K3FRSHVmS2NRWU8yQ1dqL3FTR1JHOHJo?=
 =?utf-8?B?cHNXTE9RaWNxUXQ1anZCRDBNNVdnZzNZVUxSTC9UeEU1QWlXNHFEajBBSVNa?=
 =?utf-8?B?NE1sUnpSTGV3VlF3OGVJcnl3VG5hdFpuajlYT1BNRjVHYmFYL1JGaUpkRFEx?=
 =?utf-8?B?UkZZZEpTbCswaEtGUmhIUFFsZjVuZ29qUmUxeEZ4ZkZYcEdGaDIwN0ExTkMz?=
 =?utf-8?B?NWIwV082UFBhQ2d6Z3pRZks5VTRnNzhwelF0RUxWWHBaTXViZmRuN3lKMkNH?=
 =?utf-8?B?M0NIeDQweXpWM1FMNHRPM250RHJ2VEJyV1VsYkRWQ3ZsK2J2SUVVbzhjRjhP?=
 =?utf-8?B?Qkw1M3RxdmNpT2tZa1JqY3lZWHd6MExLQnJGY01XTWlVeXYzM25pcVgzQnJt?=
 =?utf-8?B?S0RkcFVraTBzUi90MDhROWRLT2ZlazR3R2xEc1ZnYTh1WndiN2NXb1RRbXIr?=
 =?utf-8?B?Ymc1QjA2ZUFFVnJabHYvb0FFSy9zSkduMVhtVGRadUJYeGxJc2JlSFdCcXBF?=
 =?utf-8?B?SmRDaVlNaWpBQTZudjQyS3VYOG1hS3k5TGlWdk1qSk8rNTI1NHdhUTk3VU9L?=
 =?utf-8?B?dUIxR0FLSXBWSnFTZnQyN25ZSXVjOXRxb3VpUXVMRCszdkF5Q25LMk5xZHR4?=
 =?utf-8?B?OFpMVVNXSVhUdUFMY2FpaFNPZFJKZnBlR292K3Q5S0ppUTFNZlNzM28rMFpN?=
 =?utf-8?B?eVAyUDZJNEt0UHZXR2gyZmlLMk8vcUY0ekxyK05LeHF6UlRwS0tsUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726de07a-b96e-49d5-5948-08ded469bc96
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2026 16:32:53.5952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCJo6yNC5XZyNcbt9qIAix+dsVbSyOrlkaiJy0y4bsN5rh5sjvtunYiwdK1WtJ+p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_093259_714573_FC2DBE39 
X-CRM114-Status: GOOD (  15.21  )
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

> Optimize AXI DMA control register programming by consolidating
> coalesce count and delay configuration into a single register write.
> Previously, the coalesce count was written separately from the delay
> configuration, resulting in two register writes. Combine these into
> one write operation to reduce bus overhead.
> Additionally, avoid redundant channel starts in xilinx_dma_start_transfer()
> and xilinx_mcdma_start_transfer() by only calling xilinx_dma_start() when
> the channel is actually idle.
> 
> Tested-by: Folker Schwesinger <dev@folker-schwesinger.de>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/dma/xilinx/xilinx_dma.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 6e7b183cb499..829601d8a16f 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -1603,7 +1603,6 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
>   		reg &= ~XILINX_DMA_CR_COALESCE_MAX;
>   		reg |= chan->desc_pendingcount <<
>   				  XILINX_DMA_CR_COALESCE_SHIFT;
> -		dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
>   	}
>   
>   	if (chan->has_sg && list_empty(&chan->active_list))
> @@ -1614,7 +1613,8 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
>   	reg |= XILINX_DMA_DMAXR_ALL_IRQ_MASK;
>   	dma_ctrl_write(chan, XILINX_DMA_REG_DMACR, reg);
>   
> -	xilinx_dma_start(chan);
> +	if (chan->idle)
> +		xilinx_dma_start(chan);
>   
>   	if (chan->err)
>   		return;
> @@ -1703,7 +1703,8 @@ static void xilinx_mcdma_start_transfer(struct xilinx_dma_chan *chan)
>   	reg |= XILINX_MCDMA_CR_RUNSTOP_MASK;
>   	dma_ctrl_write(chan, XILINX_MCDMA_CHAN_CR_OFFSET(chan->tdest), reg);
>   
> -	xilinx_dma_start(chan);
> +	if (chan->idle)
> +		xilinx_dma_start(chan);
>   
>   	if (chan->err)
>   		return;


