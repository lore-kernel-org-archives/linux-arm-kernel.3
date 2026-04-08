Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193A7FD5F84
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7nl46sto5oiezNArpd/wCnGKrfS/j3oNwJu4aTd76E=; b=g1XmDLoKxcHoQWMsoay/dUAShD
	mTEwOzVlCa0lUH34C1atfyoY6iH9BuCLBg6GvIdwJ5pBbCP7h+olSehZtb7l1yHhQHoMwkGhfZxYF
	kJpA+PZ+gYn6ltMpMpnnvNL0CE7MJHXueKoUiHYb9ZxH6zsv4CzpPPNS2OjJHeGlwUz7Yy3XCckPl
	FHso5CTtCa3RxQVUz/j3I6O5NdmZT8xDsPtccCoftY/YHhFJkV7plmz1s88O/rq8Uw1lF4Qqp1OgI
	eBrAmWt1Zr9vIoh3PCHHqBzRE05Li90tG9piW0rey3cXHaULC/F1RjYWz3yUZQz0CIn/h4kNHhhN+
	uYqsR1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMZi-00000008M6s-1aTD;
	Wed, 08 Apr 2026 06:39:42 +0000
Received: from mail-japaneastazon11022096.outbound.protection.outlook.com ([52.101.126.96] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMZb-00000008M5W-0eOW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 06:39:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYodkEy4vpMYi6FwetgubuV9kDyLvSPyvDyPny0aYWCsLy22YVt5ePaKgHbtnFijeSc8MBU9Tz1WFO3RQyFnoyAIYQLehYvG8uDiETjqpdXxMlxyLOsu+DKkTjdZknF7ubQU7R/oIxsISJD1YzHhj+60QfNFCmLwTgM3DPJAwxlIQg57DqgUdRN3XEpf4m4WkzGV6zavtyxgwmBWrUCcpnzLdfGyEZsF9Zy1Zzz9XRFaV06nIpa91N9D9NL4RnwB10SexW7C4c+sN7RjXUWLfN2M/GoCzUvQ8KTw7umM5/21/Ej5pAJBgQOpOKlQXMOaYEgQ8K63YUGT9VHoMGoJJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7nl46sto5oiezNArpd/wCnGKrfS/j3oNwJu4aTd76E=;
 b=iWejiM+Yya+Yj01WWWZKkkLbV16r3iReExaaIBFhwI8PsbMA2iVf9tpc8yV6DXHn718jsl94skdd4gw4SnFsjzck6HSW3oDD7SvhePz8wEp90wstuHsl9+6ZQwnG3XSb3vfs9vcn2NBQ81xdtbV9GTbNMCI0xXNQdEdVRwbLiN7qpUW3OuGmaNeXRKHdPMN4ulmCugeb/TvrUSVftSNW3HvVo/fOLPIc0gqXW0BnaNIpVUZZdIgSFKi9acz2v05oxIbFF8YtfSL50EBozNogkmK4snRmUYykYS8E/a+Q5y5tJQmqzOmIKU1J5OiS+SCEO+YHd5UZpaQGZq1tZsBj5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCPR01CA0148.jpnprd01.prod.outlook.com (2603:1096:400:2b7::7)
 by TYSPR06MB6289.apcprd06.prod.outlook.com (2603:1096:400:411::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 06:39:19 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:400:2b7:cafe::d9) by TYCPR01CA0148.outlook.office365.com
 (2603:1096:400:2b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Wed,
 8 Apr 2026 06:39:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 06:39:18 +0000
Received: from [172.20.96.43] (unknown [172.20.96.43])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3D6044126F83;
	Wed,  8 Apr 2026 14:39:17 +0800 (CST)
Message-ID: <eea87be5-5257-4ed2-b8f4-42c35889fd05@cixtech.com>
Date: Wed, 8 Apr 2026 14:39:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: dma: arm-dma350: document combined
 and per-channel IRQ topologies
To: Rob Herring <robh@kernel.org>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, robin.murphy@arm.com, Frank.Li@kernel.org,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org
References: <20260324120113.3681830-1-jun.guo@cixtech.com>
 <20260324120113.3681830-2-jun.guo@cixtech.com>
 <20260407172014.GA3090142-robh@kernel.org>
Content-Language: en-US
From: Jun Guo <jun.guo@cixtech.com>
In-Reply-To: <20260407172014.GA3090142-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|TYSPR06MB6289:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db1028a-cf41-4d8e-a851-08de95398f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: TVAaewECHsIhaEnhyvs6sy1ewZ4xpTBREd+iOcT2Ve4fWhJd6YCrz+lNkBhWslA+H7A+13WhqoegCDSJV6C60DYJIF44FX11hS73MrB611AOvVh7EIrzh0ZhdK+jy7hd8VCOds4+jSGTXEgmhZWpu+AAfOrM7wxp7pzEZU61QdiT4EYoXuxvnXIPKxbFa+coU/Q2aENJ/CtizQEdwjULcJNkPIjJu1AXhfwmxcAXQkEPFFl3E8hUzypuw5UsQdXErZR3BwIXUn2f7R/TjBUH6Kos3P6zb647ofuzRjBgNIDwK5R2MkAtbN9rhTFyg3LX3X8tj3MWcL1MbuDK1aKbaK4Va5JuK4Tjr6PXiT1XitEGYTNvHnSHcVu8vno+HuoVXjcrtTcAE05njxd9fW1AzqdXL+p2VKQrO1B8mmVgAfyGC3W/sQ2eaDT9O5h2HCp1Bvkuo86cghUtONgR+MYs9uoH6lMBdELGoz8TqEHVXOOphD2GkSV8h028a6OwWvUegIQFC+J4OHmrMuON8D7JxPisAxQYmhaPSPfOcKjWZkLbAehGVhhkbN1w8A1TY6/Lp65b2MnLTdlAXxpg09d7Lgv/jnRQwG5I0/XlfERbbF33DdASLEkS24i/D+VXW1AlY3QZ3mTwLFlz5EpsbZIpLdiWyrdw9dpBmURk/87B16PC8jNHAppHo77HFHv20vyrm2coAIXA8PLhesarlFkq5NRz15HUL6FsDLUaSESlo0aREiY4IFYV/DqlME8jgNUB5i9DeSXGpgm6/h66f4n5sQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VmVCGsM+k0us2VAykKy5xlzg7Cs3q5cIInY7lVOaZsdcCKJ3AsdNad+U6TLYItcM8aNUQlAo8o1sGIkoL7/DddmNqNFcrn3zonJDreqMu6AzWFPhB6VZhBHRRXON2kEaMDLURUjDFwG+moHGewLLQVp7bfyZ0b5uxd5zk5xfKoQ4OF+aeQTv2+B3TQlBpyjPmqy9k7WO2BDKSDPVCU57T+Bx39GOyh3l4BZ1rYN4I9rR7wFgkedtch1Rk9LNpM1sQzDoiAp9Lx5jGRbdMrMSWWb4MiXuNNiXyq3HtHm754lBJnpuN9BhJZl7Ok7PRmG3CSbFo0eMGpcr0bvspb4T44midy1IYTZDZdX99b+V3WaQKSmmp8g0t4J6FaM8x3RPADi/T9jWThlabRI8mXjpOzR+bzKfRUbqUMBubokwwJpbowCWPTKmiq8xjiBbgDq6
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 06:39:18.4548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db1028a-cf41-4d8e-a851-08de95398f82
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_233935_201842_6A6705E6 
X-CRM114-Status: GOOD (  12.93  )
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

Hi Rob,

Thanks for your review. I have already resubmitted the V6 patch. Please 
take a look at the latest v6 patch when you have time, as it includes 
considerable changes compared to the v5 version.

On 4/8/2026 1:20 AM, Rob Herring wrote:
> EXTERNAL EMAIL
> 
> On Tue, Mar 24, 2026 at 08:01:11PM +0800, Jun Guo wrote:
>> Document the interrupt topologies supported by DMA-350 integration:
>> - one combined interrupt for all channels, or
>> - one interrupt per channel (up to 8 channels).
>>
>> Assisted-by: Cursor:GPT-5.3-Codex
>> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
>> ---
>>   .../devicetree/bindings/dma/arm,dma-350.yaml  | 25 ++++++++++++-------
>>   1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
>> index 429f682f15d8..bec9dc32541b 100644
>> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
>> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
>> @@ -22,15 +22,22 @@ properties:
>>
>>     interrupts:
>>       minItems: 1
>> -    items:
>> -      - description: Channel 0 interrupt
>> -      - description: Channel 1 interrupt
>> -      - description: Channel 2 interrupt
>> -      - description: Channel 3 interrupt
>> -      - description: Channel 4 interrupt
>> -      - description: Channel 5 interrupt
>> -      - description: Channel 6 interrupt
>> -      - description: Channel 7 interrupt
>> +    maxItems: 8
> 
> Don't need maxItems
> 
>> +    description:
>> +      Either one interrupt per channel (8 interrupts), or one
>> +      combined interrupt for all channels.
>> +    oneOf:
>> +      - items:
>> +          - description: Channel 0 interrupt
>> +          - description: Channel 1 interrupt
>> +          - description: Channel 2 interrupt
>> +          - description: Channel 3 interrupt
>> +          - description: Channel 4 interrupt
>> +          - description: Channel 5 interrupt
>> +          - description: Channel 6 interrupt
>> +          - description: Channel 7 interrupt
>> +      - items:
>> +          - description: Combined interrupt shared by all channels
>>
>>     "#dma-cells":
>>       const: 1
>> --
>> 2.34.1
>>


