Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50234CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQJEWaGWtJwIgHiHzR2yg48GdT5dypcvdCNI8DUXwTw=; b=YazmJxl7VIup7hKMuVeFYHmEMf
	KSaSoNl6Tlf3bQzG50lbUswK1wyDNrbzYE7LoAMfoCQRIiLfiyupELmjc8dbhI03IylNJ6C7HFadY
	TBiVjdECejUbWta7Wi6ZDhjQlhT4+IGN8jRHuS/QDhDgkZTcBEIC0IWiiLXGMGKuwaR9vObNnJTRg
	WhfKYdxznByanD7lQ1/cBIVlNR3GSs8F+ihECVvtmqwf1Xtss6P4qzwsgCLPwtlaA7tIuGi02P3cQ
	6dqveRNnDtaWDSYGwdjG5FPJNsseNNpEmOMpAzr3/vMCh6CyPpf+BbZf/Fzlb8lu3IAVfS+FlNuqb
	Tjeibmqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxY6-0000000FzPS-2uhr;
	Mon, 17 Nov 2025 11:37:34 +0000
Received: from mail-japaneastazon11022130.outbound.protection.outlook.com ([52.101.126.130] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxY3-0000000FzP4-14wa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:37:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+cmTtyP9MwJHnFuwvNQbVt1dLHKzEjvW/SRJnUFb5lRP1BF4AVGjkvf5RtpJ/8NI01rpWzK14yuavcDkRLNpcbkbMX1hZ7kzaOAAOebWfNzT4SIV7vSPvKcQK9p6nUBZBTCVqZoqwVf70Ewi6Hu7rmzNL+zGeGEERvEzDe+JPUfLekwqeZAwwtPIslOsrrAX9qtXQRaEet8Yfqup3CT/khz5dWbw/+NOSi+dVl2R+6ZrEk8yZ7j9zqB5/VT3EJ+T8iSoV5p1FrGbNmPQKe0S031Am6LbRlQsKag/IEpNuoDA75up/F2MAkRFnJ7Wv2+fuvxBBzRKa1bwpF5BwXsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQJEWaGWtJwIgHiHzR2yg48GdT5dypcvdCNI8DUXwTw=;
 b=vL7lhDTY1QOgn8nKCfdJreZpAXZ7q8bnnCCv0gUOdtUVgndZrpknSyQ2iBjIUqcGzMFOaPQDYIR12mRG1sGFJwgaM4xLZz/GPIPGWfj8r/N7zyiYNTr1ckOwZ+qm3ybSnwKC1lCnCS/jjfcg/HN1E02eYUreCkEDN1Nuvb5mUc9aawUnL7l/9Adorczu7D4p5sgYeUAoEbyDBGG7UA0D2QPQAggrdcDmLdEVapIG2oxFBvO2OJzlh/+OPruvCt5lGip9IBWQq/o5g7C1UmPkjtIrmfS/g7ZZHI0SQ4oCE+25mDLf5gLUuQmFSQqL8BfR7qbRMU+RNaWBDIPU1xx3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS7PR01CA0283.jpnprd01.prod.outlook.com (2603:1096:604:259::11)
 by SE2PPF279E222DB.apcprd06.prod.outlook.com (2603:1096:108:1::7c9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Mon, 17 Nov
 2025 11:37:21 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:604:259:cafe::da) by OS7PR01CA0283.outlook.office365.com
 (2603:1096:604:259::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 11:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 11:37:19 +0000
Received: from [172.20.96.43] (unknown [172.20.96.43])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D609C40A5A2B;
	Mon, 17 Nov 2025 19:37:16 +0800 (CST)
Message-ID: <22f66fbf-8637-4826-a2e6-69d16333c2b8@cixtech.com>
Date: Mon, 17 Nov 2025 19:37:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dma: arm-dma350: add support for shared interrupt
 mode
To: Krzysztof Kozlowski <krzk@kernel.org>, peter.chen@cixtech.com,
 fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, robin.murphy@arm.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org
References: <20251117015943.2858-1-jun.guo@cixtech.com>
 <20251117015943.2858-3-jun.guo@cixtech.com>
 <eb9eae64-f414-4b04-9a10-4dd8a9088e96@kernel.org>
Content-Language: en-US
From: Jun Guo <jun.guo@cixtech.com>
In-Reply-To: <eb9eae64-f414-4b04-9a10-4dd8a9088e96@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|SE2PPF279E222DB:EE_
X-MS-Office365-Filtering-Correlation-Id: 532562e6-0fac-40da-2553-08de25cdaacc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkVOSTR1QTRVY1RHWktXRk5LaGhOdVdIWHJXbm8xeGdVemI1dVlEeE1BbXNW?=
 =?utf-8?B?dXBWc1I5L2h3aUpaTkVZK0M1b3JUSmd2NURYT3lvZ25tSXd5dDhCdHNRRHNs?=
 =?utf-8?B?TEV2c3BhVmNVSi9zUVRpR1FTVk8xSFRZc3BkZ0xUY3g4SDVXYTJRR2QrZTAr?=
 =?utf-8?B?cFN5VEtOekdFR1BFYmlqMUNvbUxuVXIrNEozeFMzc1N4UGt4NDcxNTdsMkZB?=
 =?utf-8?B?T2xDZUxzajJ1cGVrYklJZFJpNW5rbGpMWWVmWlkzb1UvN1ArWHA2LzNkbVl5?=
 =?utf-8?B?US9Zamo2RVY3M2liUW9xeXBhTlE4Y3BnR0dVYklkWHZwcUtVUG5Ba3JLYlBa?=
 =?utf-8?B?bDNBaG1MRzN4Q0h2NUowT1B4cEpPbVd4NU5RUHBUNHo1bGVRdkFSd3ZML2Yw?=
 =?utf-8?B?OWV4TUxPbHpFRlEwLzZsUFlqNUo1OGVIUlRSQ0RZVklKbUN0aDBPcnUwdjdw?=
 =?utf-8?B?MDRObFdkejN3a1BxalFHTTlZbDJsSzZjWlFjY1BYZnlwb3pGd0tUaDROMGky?=
 =?utf-8?B?RnQxYTEwL3AxZjdYS0dtU0piZEJTYWNCK1lMaEE2YlhnclF3cEZUOUxkUjJn?=
 =?utf-8?B?VW1ZVWRvSWcxVEtRcmVPRDNuQzl3ZFNkVFZhWFZYMFBJdC9GaHROaGhxUjcx?=
 =?utf-8?B?YXVDcWpjNGljTUsrY1FncFN4TjQ1Mkg1SHl1Z3BrZTJieXNoMi95dDBraWk1?=
 =?utf-8?B?S3FabzFzTHZVUVdXN1c4b1dadStsN1g0Y2plWTRWVVBvelJGbmlJWllWWmpm?=
 =?utf-8?B?Y2sveDRtZGliajVhQ2tzenNETzJvSUVBQkV1WmsyRk1iUFl4L3NaU2twaEtQ?=
 =?utf-8?B?ZUFQMFdZWHljUlJPb25iRDRXWXdCdS9LdWJsamtjQkUybW9DL0w2NlFCandj?=
 =?utf-8?B?L0Q4ZEdjNXBLWXZ3dmxlckZ1QWlJaUdGWFRzQVM1OXdyVEVWcDRLeE8rSnN6?=
 =?utf-8?B?VFpxYjE3TmlSNU5YcnQyYWRQS2daYkVPT3ZOWm9aQzZ6MnMxV0QxYU5DMWpX?=
 =?utf-8?B?eWpLYkpuaDNVQ1BxcU10QkRPbXpxLy9wTEFXWlZ4akVSZHhzYkZmb28xMlZ3?=
 =?utf-8?B?empIV0lHV0xLT3ZOMmZJYnlTaDdJMmxZVDBGSkc3OUliV2I5UFVOam4xM3ZZ?=
 =?utf-8?B?Nk1USXd1WW8rQWgxQmJxTmEvalgwMlFJT1lodEswdnU2WDZZNzRib1FCdDg5?=
 =?utf-8?B?amphb0J2ZVZKRlJpR2gxbnc2MjcyaUI2cjc5d1A2TCswTzllRVZ3NU1lRTRS?=
 =?utf-8?B?UUo2M25PaHhWa0lSTnBwUFFPTTdpNmtONW0vZHBNVEwvRmRvd0hjMGxnODhK?=
 =?utf-8?B?aERxUm1XbHpoZU9lNkFVU1kxa250am1vTXordzc4NG5wRVdQa2ExcWZiUWdU?=
 =?utf-8?B?cXFCVXZ4VzQrQjVwSEZoVDNuOFNTeEo2NURVT2N1d0JtcTVnVkh4UUUrWC9h?=
 =?utf-8?B?MGtXUG5tcDFzcjBwY0RqYTF2Mkk4RVF1NVNQQXlva0RvNXVOT0t3S0pwaVVl?=
 =?utf-8?B?NXBXUWZjK2E5dzQwbENDdEJ5bW9ZYkVFaFF4ZmpmVktvbzl5RFBHeW1kMDly?=
 =?utf-8?B?RVR3UHlFTWU0TVVQVUNHV3o0VWJZZ3NvblM0SW5mUnhpeE1ibGVEdHdmRktT?=
 =?utf-8?B?aWJwNW5VZUdIVks1T0FaSXpabkdXRzQvbDR4RnJ5ZUgxTzhEcGc3ME1CdmRU?=
 =?utf-8?B?Z09Odm1Qdmp3VjM2bXJHQWtpb2RpeEdwdG9BVGcyNjA4SkVDRTVnRTBDNTN2?=
 =?utf-8?B?RVZtVXczUE5YNzJ1TzBCRDhMbWZkYTZUV0p4ZHJBUkJRZFphUTFDRm5ja2xi?=
 =?utf-8?B?emo0WkFjbTRhV0pvTHI5N3Y1OUVBWnczYnlKUEZ3MUpZWUN6VTNDTURvMFpS?=
 =?utf-8?B?MEdpa3REMFNRcXB3bmIzRDRzb1BkaCtmNFM3Y0pRcXR5bWRacmZFRVpQZjhi?=
 =?utf-8?B?UVNyc3VLRGl4NXlyUGVSWjdjVjBORUxZZUJUNXlyMFRxUTlxaThYTmlDU0U1?=
 =?utf-8?B?RUJrMmdBbVd3N3o4UDZSaEViUzFGL1JYTmxoYm9XQjMvcjZSWllrK2VIbHg0?=
 =?utf-8?B?d2txWmJVU2pCLzFOem10anBQSWlocWw1dUs5TGV2dW5Ib0R3MGxSb294Mjlu?=
 =?utf-8?Q?wdi9IKqNPaqbrfnBXsuUXS/4Z?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 11:37:19.1872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 532562e6-0fac-40da-2553-08de25cdaacc
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF279E222DB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_033731_305453_C45CFD8F 
X-CRM114-Status: GOOD (  21.89  )
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



On 11/17/2025 2:13 PM, Krzysztof Kozlowski wrote:
> On 17/11/2025 02:59, Jun Guo wrote:
>> - The arm dma350 controller's hardware implementation varies: some
> That's not a list. Look at git history to learn how to write expected
> commit messages.
> 
>>   designs dedicate a separate interrupt line for each channel, while
>>   others have all channels sharing a single interrupt.This patch adds
>>   support for the hardware design where all DMA channels share a
>>   single interrupt.
>>
>> Signed-off-by: Jun Guo<jun.guo@cixtech.com>
>> ---
>>   drivers/dma/ar
> 
> 
>> @@ -526,7 +593,7 @@ static void d350_free_chan_resources(struct dma_chan *chan)
>>   static int d350_probe(struct platform_device *pdev)
>>   {
>>        struct device *dev = &pdev->dev;
>> -     struct d350 *dmac;
>> +     struct d350 *dmac = NULL;
>>        void __iomem *base;
>>        u32 reg;
>>        int ret, nchan, dw, aw, r, p;
>> @@ -556,6 +623,7 @@ static int d350_probe(struct platform_device *pdev)
>>                return -ENOMEM;
>>
>>        dmac->nchan = nchan;
>> +     dmac->base = base;
>>
>>        reg = readl_relaxed(base + DMAINFO + DMA_BUILDCFG1);
>>        dmac->nreq = FIELD_GET(DMA_CFG_NUM_TRIGGER_IN, reg);
>> @@ -582,6 +650,26 @@ static int d350_probe(struct platform_device *pdev)
>>        dmac->dma.device_issue_pending = d350_issue_pending;
>>        INIT_LIST_HEAD(&dmac->dma.channels);
>>
>> +     /* Cix Sky1 has a common host IRQ for all its channels. */
>> +     if (of_device_is_compatible(pdev->dev.of_node, "cix,sky1-dma-350")) {
> No, see further
> 
>> +             int host_irq = platform_get_irq(pdev, 0);
>> +
>> +             if (host_irq < 0)
>> +                     return dev_err_probe(dev, host_irq,
>> +                                          "Failed to get IRQ\n");
>> +
>> +             ret = devm_request_irq(&pdev->dev, host_irq, d350_global_irq,
>> +                                    IRQF_SHARED, DRIVER_NAME, dmac);
>> +             if (ret)
>> +                     return dev_err_probe(
>> +                             dev, ret,
>> +                             "Failed to request the combined IRQ %d\n",
>> +                             host_irq);
>> +
>> +             /* Combined Non-Secure Channel Interrupt Enable */
>> +             writel_relaxed(INTREN_ANYCHINTR_EN, dmac->base + DMANSECCTRL);
>> +     }
>> +
>>        /* Would be nice to have per-channel caps for this... */
>>        memset = true;
>>        for (int i = 0; i < nchan; i++) {
>> @@ -595,10 +683,16 @@ static int d350_probe(struct platform_device *pdev)
>>                        dev_warn(dev, "No command link support on channel %d\n", i);
>>                        continue;
>>                }
>> -             dch->irq = platform_get_irq(pdev, i);
>> -             if (dch->irq < 0)
>> -                     return dev_err_probe(dev, dch->irq,
>> -                                          "Failed to get IRQ for channel %d\n", i);
>> +
>> +             if (!of_device_is_compatible(pdev->dev.of_node,
>> +                                          "cix,sky1-dma-350")) {
> No, use driver match data for that. Sprinkling compatibles everywhere
> does not scale.
> 
I have another question: by "driver match data", are you referring to 
the data variable in the struct of_device_id?
> Also, this is in contrary with the binding, which did not say your
> device has no interrupts.
I need to clarify here: the issue with my chip platform is not the lack 
of interrupts, but that all DMA channels share a single interrupt. The 
current driver, however, defaults to assigning an individual interrupt 
for each DMA channel.


