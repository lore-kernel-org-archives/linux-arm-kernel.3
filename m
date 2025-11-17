Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A701CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+6jWuHHbuHAQB4i9Zzpeg1BCxman3Guevk6kYGMVUg=; b=nmz+WJB+/KbyWrBAZTmla8jbqr
	CC2XK1MPzA69jB4K/euR6wNH7GiSgDbXJYNPUNGLB4Rd68XODUuOyaiSYnlk/6Iz7tmXkJAet30CD
	slo5IfSM1HkJU4orclpHOui9XQNZVh7b4HYe4OflEkEKdlkixDsFloNiJQbG4aWlmqYH97GAvYZ8z
	6G+f49kH48pf452zSyPxqw9eT710C35Fcjlqyji4MWQJf9Mq6LHGh/NFlC7w9js0XTyTHqrqjYQp6
	guUXsaEpNmdeglaIyEgE3iVO3xm9UTKpdTkmy5j15LpZo6oOMq1e4d8DeUWBBLrVmkQoPrejFiHog
	hrGUHJNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxma-0000000G0nu-2vMh;
	Mon, 17 Nov 2025 11:52:32 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxmX-0000000G0nN-2bK2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:52:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5K8oy4INNuBEtree7tjsJEjG4sbALSz32xqJNKLDQw2qS/7WSA6CE8wQu6rpX2zZjt/dRvJpgn8d/w4qDiRnwQA9Sf/Q8PGQLRQuOFdeQL+/CzH8cexdA3NbekD6nnzEAT/9+tnOUFzZd0dQCp5QSzsJMjiarZC+EwWrelkAbC1GqQGI6Hj45R5dK9WS3X3iwcUSlBke8HQJMwFY2JLm8btYXEpPvyDEFKipu4lCv67uU1xhpqDDRLzm/KzeJfNKuxFfxEGnnv+PhcXRsJSP2YqyPR4W/IpPxwgfQAssnx+/hN7bhROEvo3PX6EtnuFcygZOnGV6uvpdzCT/I1ZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+6jWuHHbuHAQB4i9Zzpeg1BCxman3Guevk6kYGMVUg=;
 b=Xp8SsKFNM0KhykDGnrdHyiRoz94mvwVKKH6n/VXB5FK0p4sh4GXiUrwENLcS/ViMM0bplxcCfS0+W86HnsYq0W8LmqGimFHm79aUJ0u/8/D0WAbsBpSbbA0P2HkIQjgK702IvtnDjX7t/0Ifv2ck1gdvxC0vzWHv6uGjeDSX8r6LJ52hFtjIEJb4E54PJFIurjd1AoEQ+J5tS3XzSiIcH4uUg3q6I6/LPOHJbDGvyIFBmG56Dm+K7n0TVdbwMQG11puELlD8DV1jg/reCOSk97cgenirfDYfwpdkmQFmw9EbJ/6V//QI/FKErXS4OXliF8aUrKLeUVnudLhKclhPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP301CA0008.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:386::6)
 by SEZPR06MB6611.apcprd06.prod.outlook.com (2603:1096:101:18a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 11:52:22 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:400:386:cafe::fa) by TYCP301CA0008.outlook.office365.com
 (2603:1096:400:386::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 11:52:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 11:52:21 +0000
Received: from [172.20.96.43] (unknown [172.20.96.43])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C2F2E41C0145;
	Mon, 17 Nov 2025 19:52:19 +0800 (CST)
Message-ID: <af459551-3f31-4108-9863-c050332cd3b3@cixtech.com>
Date: Mon, 17 Nov 2025 19:52:19 +0800
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
 <22f66fbf-8637-4826-a2e6-69d16333c2b8@cixtech.com>
 <9b65aaf4-4204-4034-9441-5e9c888a5b0a@kernel.org>
Content-Language: en-US
From: Jun Guo <jun.guo@cixtech.com>
In-Reply-To: <9b65aaf4-4204-4034-9441-5e9c888a5b0a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|SEZPR06MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: 86970560-6638-4162-5554-08de25cfc496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFIydEdNemNPMDBlOHRWS3ZwVzZ1RHdqTGVUczdyY1djM1YrcFpLME1vaE50?=
 =?utf-8?B?VXl6dS9WbDY4eGZVUGg0WDdZVnI4YTVlSlZjcGRqeVdYdGh0SWY5MkduL21S?=
 =?utf-8?B?a2pJNzllVlh4OGxCOEpzRzl2THFKNFhPbVJvV2k4aEhSeVJ6MkFHS0w1N3Bz?=
 =?utf-8?B?ODBCSXhuVmV3MmQ1WlJvc1poZCtqdFpxWXdBZUlJdnZFa2hGcGJ2QmZxR0Vh?=
 =?utf-8?B?QWU4eXVXUkFBYXp2dmhNcllUL3dCUzRLVTl3YjJpN1RGRjdUb2hmME9LSzc4?=
 =?utf-8?B?TVpHYWIrdnl6a0d6VDFKMEhkTGRQU282VFRwazZWQXdxdnhXZmczR2xCdTE5?=
 =?utf-8?B?aWYyYTdXZVlPQUJpS2hOZnRDbi9ldG9pbmFjZDVoak96a29oSXp2Q0djSHhT?=
 =?utf-8?B?RGxac3JmNG5Da3p3YXhRdlJTMDg3ZUppRytEdFZqaWlaZk1lN05sSGxtUDF6?=
 =?utf-8?B?NnJ0Z3Y2bzZRRTRaZ0xMV2F4eE5sMFh4QVIrZ3IrMEdtVzRiV1MzcS9RQTBT?=
 =?utf-8?B?WGt4Z3RaVmhpQ0NtZnlEdGUzMG1TU2FKZzFTL2M5SVk5Um1mTjdIVDAvU0Zs?=
 =?utf-8?B?S09nN0xsRWV0bXZUYUVROUdrMnJsclk1WmhIUjZaWXNyRkZaMlVZMFFIUGdx?=
 =?utf-8?B?N0Y5d0NpTXdiVXdsN2ZkRzRiaDEyNGlqRWRDRU9aUm83MHQ3cHV6UHhsTXhZ?=
 =?utf-8?B?V0F3UVpyMWQxYXNMa05DQmZNQlNFcGl4UVhBU3ZRdlVwQVQybEMrRXZXWWJl?=
 =?utf-8?B?WmtIcFpnWWhwUE1OaExMVGxsd3dhVzV2NUV2MGJtR1hzdWpWQzRHTGpDRktO?=
 =?utf-8?B?VFFIL1pPMGI3bkQvdlZGQU5hVTIyOGFHVmFrTlQyM3ByQ2dhNzBKSGFCZzF3?=
 =?utf-8?B?SGp0WlFkWEE5Z0VsOS8yVlFHYW1NY3U0Q2I2YWp1ZVArckthTS9EWEdyZjB6?=
 =?utf-8?B?dFRjS3NzZkRTTXFSeERtTU5XMXY1YjRBOGVxWVRDcGJ5SGFTd2pUMlBtM28x?=
 =?utf-8?B?ZTcwRHRtZTFId3Y2TXBhdkZSVzJzZ2NFMFJ3YUhITUx2dThHZGZBME5CNDk5?=
 =?utf-8?B?VHBzbzRjWEd1bTMrQlNEY1ZsTndWcFVVK1pPcUNqc0t1SHVWcThGT0dTRVhJ?=
 =?utf-8?B?ODU3cjllS3JmaEJEMFhSU2NyS21OWTZuUGwvdk5QQW53RU5Wbm9NWVVVWXVJ?=
 =?utf-8?B?eUFwbUs0Tks2Z2w1SVZVU2xpeVpLRlF5RlREVHlJd1pRVU0rOUN2Q0JTcVpL?=
 =?utf-8?B?dDYwOEg0WGtyRHlLM3RnL1hyYmZwVERhbG1RUGk0Y244cytEV2xRVmM5eFpZ?=
 =?utf-8?B?cHlkMFcrTUgvZnMwZFRxajJMVStCVDFaY0IwWk9RQjNJWmllbFE5dE9wc3VK?=
 =?utf-8?B?MUc0Snp0VjA0MnFaVUpWMno3SkgvVWJYVGxhQU03NitmcS9sUW5JUnFHeTB2?=
 =?utf-8?B?MDhYM29IUE4xZGlib01NSjNXRXlRMkNRRGZ0N3lwcVk2SG1kNW5QQkdxQXJ5?=
 =?utf-8?B?T0g0VEFCWmMvYWRsYU5PV0RIdWJOSzVVNlhxMkJ1Ty9qUXJ6YWZ0YTlNdXpr?=
 =?utf-8?B?amV6VmNqb3EyQi9oejcxME0vVkhCdm1VQzdaY0cxZDZjNzFmd2lRb1czUTh0?=
 =?utf-8?B?ekhSTUZIOXM2SGtQdE5HWHhQcWw0MGFXNW5KV1dud2k0RktuRzU5SDlmUDYv?=
 =?utf-8?B?U2RGcHpmN1FYVEc5eFkzbXpqemVVTFJwalV0cG15WDlOaDE1RmtUeUNVZWpW?=
 =?utf-8?B?bmJWRWt5YjcyN1M1LzFaZnovQUZlMDJuRWNqMlhJdXhNUVhCbjcrVjNzOTN6?=
 =?utf-8?B?NndIK0NSTHhJZFoyUzhnUXNja0RzckR0QlpjVlBDSmlteU83NHM2OGtJSzdv?=
 =?utf-8?B?SUs2U2dpc1ZkbU4yc0IyRGExakEvcnAwMFpaQzFGOHFBd2dPak5WM3M5RUU4?=
 =?utf-8?B?ZnhmVmorRXJOcGFMYVcrRXhLaEpXSnE1NUtZY2xWZXZrYXIxNzlkaWliNzhp?=
 =?utf-8?B?L1lGOUY1UjJWY1QvVG5KdTIvSkpxQUJ0NHlMLzR2Sk82dEdpcDhEL0lYdTZD?=
 =?utf-8?B?b3ZmTnU5NlBjbGdYNWtBRHpaSG53SExHZFFuN1NLQ0tOVGxYKzBmTUhsTDJ5?=
 =?utf-8?Q?CoJY=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 11:52:21.7117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86970560-6638-4162-5554-08de25cfc496
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6611
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_035229_674120_CBBCC9C5 
X-CRM114-Status: GOOD (  12.18  )
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



On 11/17/2025 7:44 PM, Krzysztof Kozlowski wrote:
> On 17/11/2025 12:37, Jun Guo wrote:
>>>>         /* Would be nice to have per-channel caps for this... */
>>>>         memset = true;
>>>>         for (int i = 0; i < nchan; i++) {
>>>> @@ -595,10 +683,16 @@ static int d350_probe(struct platform_device *pdev)
>>>>                         dev_warn(dev, "No command link support on channel %d\n", i);
>>>>                         continue;
>>>>                 }
>>>> -             dch->irq = platform_get_irq(pdev, i);
>>>> -             if (dch->irq < 0)
>>>> -                     return dev_err_probe(dev, dch->irq,
>>>> -                                          "Failed to get IRQ for channel %d\n", i);
>>>> +
>>>> +             if (!of_device_is_compatible(pdev->dev.of_node,
>>>> +                                          "cix,sky1-dma-350")) {
>>> No, use driver match data for that. Sprinkling compatibles everywhere
>>> does not scale.
>>>
>> I have another question: by "driver match data", are you referring to
>> the data variable in the struct of_device_id?
> Yes.
> 
OK.​ Thanks for the reminder.>>> Also, this is in contrary with the 
binding, which did not say your
>>> device has no interrupts.
>> I need to clarify here: the issue with my chip platform is not the lack
>> of interrupts, but that all DMA channels share a single interrupt. The
>> current driver, however, defaults to assigning an individual interrupt
>> for each DMA channel.
> I am speaking about binding, which said that first interrupt is only for
> channel 0. You need to restrict/change it for your variant.
Okay, I see your point. Thanks.


