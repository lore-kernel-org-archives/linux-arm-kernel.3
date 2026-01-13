Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B804CF45CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 02:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucDyfHRC1uTL1WLpwb9aB0imWb3mZK08bw4kB8cilF4=; b=bRV4bB6ZEQR74yBXR5ThyIZ7TE
	opPbnrdIIJ1L7/stSNryHLEC50sY2hbYDkhT5XRjqPEoiCIKxM2jsAfY2+30qRrDD1WiYMVwzcB+L
	rf1GZ9tCWwH5YYpkuvSQPTxcrjoOlAVF4GOj3L/uSRvo2A43YiM1a9uvtw9jeYQUt2xjZyASbKcdl
	Dmfrjo5r6iHm5Gf0uOe0xjst/vLQzCOjMcO+C+Ddq0jasRcxJTnIzp1TmaNnmPUH2+wst93dIvIeQ
	iQqFjARHsapUraDms1+1Wj/dKEO+1cyqJNp6uszcrK5FIdleqAYnVjMaePGu0O3SLp/XMXW4uj+um
	8H00UIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTmf-00000006PTz-1bOB;
	Tue, 13 Jan 2026 02:05:25 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTma-00000006PTX-2a7s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 02:05:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ga+NditVaFjRop6Hq00iSEcfCEd5tsbX37pftoaJJGILXdcIFosocvpz2l8ecPApRl94qzHjLIOJpZ4aALCAt3ge5Xo4paqeWVk+0Jyv7OX/T3q8B5dYXj6ei6gXIILx2+Ymh30v+mzsxSm9bPuHBuYjoC8NeHDKKVFIRd1isKaR8QMAdaP8pGTswVPhyPPiISofiXZwtLpUlXM3wLnzgs2JyVYss9FCLt5Q8HPlYKugi8llqeixxkr5l2Nq/I8nPZZPZWC59P0yw6hei2FgyLvhifvSuEFbMSNij8V7ooZvSgQw3AwQZ2eetCX7uGa+DfzT17zghv6k41mP/mJwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucDyfHRC1uTL1WLpwb9aB0imWb3mZK08bw4kB8cilF4=;
 b=KI1qpdbI0Tg7+rlNod1n+lf9woGtJOizeVV/jGaFesD1Tj48XHKVnPcKuAqglM6Hu36QQ2yiohJjjJmjrrLexsioZsGh3uujknpf5iWCfbeF2aEXCsLWinDgsShNAhXrLkQdcEFTxYlPVHswpste9CeSIskgB4gYnipB1CwEyns6zcSglKxFOmTwF7UtoXCFBg6r5SXhAAJ1w/S6DxeotrTLbEm7ulasUDFkY69vbM7Nm47ErqTULetZpGozkDQ0C0HQv2buwxuT+a9i5elv5Bq7duAd2njmZDfxR+JdoAEu024/kuRfdJCW2nT58wczWYW22apt11t9H1vuUlqWaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR03CA0004.apcprd03.prod.outlook.com (2603:1096:300:5b::16)
 by JH0PR06MB6889.apcprd06.prod.outlook.com (2603:1096:990:46::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 02:05:12 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:300:5b:cafe::64) by PS2PR03CA0004.outlook.office365.com
 (2603:1096:300:5b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 02:05:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 02:05:10 +0000
Received: from [172.20.96.43] (unknown [172.20.96.43])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3A0CF40A5A1E;
	Tue, 13 Jan 2026 10:05:09 +0800 (CST)
Message-ID: <2cef1db3-809f-4768-a5ca-c148a03f3d79@cixtech.com>
Date: Tue, 13 Jan 2026 10:05:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: arm-dma350: update DT binding
 docs for cix sky1 SoC
To: Robin Murphy <robin.murphy@arm.com>, peter.chen@cixtech.com,
 fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org, jelly.jia@cixtech.com
References: <20251216123026.3519923-1-jun.guo@cixtech.com>
 <20251216123026.3519923-2-jun.guo@cixtech.com>
 <9d4c274f-3e4c-49a1-9b2a-a95e9a48a4a6@arm.com>
Content-Language: en-US
From: Jun Guo <jun.guo@cixtech.com>
In-Reply-To: <9d4c274f-3e4c-49a1-9b2a-a95e9a48a4a6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|JH0PR06MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 235a6490-d6d9-4a3e-fc28-08de52482ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bENCWUZ3ZTg2TFZDV0w1RmVCOE1UdWJHbGtvUjlaVkJKaHkyMExOaW9QY0Ix?=
 =?utf-8?B?d1NFNFl0QlIvMURoY3gwZXFWRTlIc05LTkdxcE1JZEU4bHpDNFJHSm1NREdM?=
 =?utf-8?B?UEtiRUdtQUc0MExSaHQ0RzlaMHlpUmZhNFBmWm0vaFY2ZTdHQkt6Rzdra2Ju?=
 =?utf-8?B?TFpZSnkwbFhVUWdsL0RUZzRBYXBYMkdKVGhVaWxMWmozd2tZK3NtNDBKdElT?=
 =?utf-8?B?R2xhejNJaXpGWjZuZDNGZnA4VG5LN3YyZkRiZWRha2dOTHNPc3I4WFFSb3JH?=
 =?utf-8?B?akF5UDRXb2pudlZ1blFNMFpLZzBKR0c5NndPNnVCTEVZMDRybi9mS05KVEZr?=
 =?utf-8?B?b1pQYno3VVNtbHJ3S0ovMFlIVHNTRDlkeVY3SFBZTnRpVGE1OHRGSy9yVEps?=
 =?utf-8?B?NExkYTY5Q044UmRJYlUrOHR5bDgwT0dERXhaKytpa3BjeXdBZEpmcVo0ZG5r?=
 =?utf-8?B?K2ZVbElIcTZ6R3QvWG1XYnpFN29keWc2aXpzZVV0anl4cXZ1WE0xZGd0RXla?=
 =?utf-8?B?R0luakY1TjdreUYxWWZqaWRNcGF4cXUzWTM3eVBERnd1c0dLU0NJb09ETUxy?=
 =?utf-8?B?anRyaGNQUlNQbTYvVFJaL0dicENjY0doakp3aW9mT2sxL0dUeUdyMkRJTkpS?=
 =?utf-8?B?VkxtaUg2Qk1raDNTT3Blbkg4VERPOUZaaHFkVWhaOWNIQnBiZi9IWVRhdGQv?=
 =?utf-8?B?RjNPRHgxWGhybGtSdDVVUjQ0T0d6aU9uRktRMG1mMUZMdlFJTlRPM2Y3c2s0?=
 =?utf-8?B?U0JMY3lHZzY1SEEzbHlkSnRwK0RVVWk5QmU2bnNicTA2TlN1cjd1bFJIaWky?=
 =?utf-8?B?K0UyZXJEVUpWNkRLQllMMzFZWkhlZzNENFhINWFRTUhKbE5SSjdyUjhOeEx0?=
 =?utf-8?B?aVVXSVE0Tk1wQzV5YVROdzA2Ky9oMTl5UFZSek1kZXNYYTNJU29iTWVmRmNk?=
 =?utf-8?B?WHNQNTYya24vNWFVZ1dnekJ4NzVqNFZ2VjQydCtWZ1R5NDVvU0x3RE1LWEpy?=
 =?utf-8?B?L3drMEpJb2s0bzJ6MTV4RDV0Z2lsaXFqdGw4bFRSMkRjWUVNZ3BlanFWTGdC?=
 =?utf-8?B?ekh1c0M4cFRGVzZFMEgzSmRYbWZBT1k1VDVqR09DanFISi9QMXVpd1JMRVFH?=
 =?utf-8?B?Tm9wU1lrOE1VVU91U3RjQkVjYlJna2VUU3c1L3ZPeW1KZ1AvazN2KzBkSmlN?=
 =?utf-8?B?S1J5b25WbExQeHBhYklqc0ZaSWFKN1dhdVhmSS9qTWtmYiszb0k4emZaSzZO?=
 =?utf-8?B?VFlXZXFaWEhkMFlUdmdJQStWcFRHQXRqbFo0RDZRSi9vM25leDFrQUdSZWd1?=
 =?utf-8?B?bnNWTmdlcTNFOEYzWmp2Nnhpc3Q3MStMMXYxQU5ERU5WV0ZJUWQ2ZFh5Sm1k?=
 =?utf-8?B?NnFVMWZhQnQ1Ymt0NENrcFpvdzZ5QzNzOUNNMUp2NkNyWWEyMEk4b2pTMEVu?=
 =?utf-8?B?dEdSbnZYUGFmSDl3RS9NWmZaUlVyQXFoYnBUU3JsdzhacCtQU285ckZ1aGI2?=
 =?utf-8?B?Vk5ESVQ3a0llWHNhV2wrWUxYY3d0cDE0ZE1pL3RGM1hSa1ByOVJjOVRSNHNF?=
 =?utf-8?B?WHNjR25sOU5UNzJvM0tYMmNDNngwSk8yb3pkZWJWQ1BZQTRmd0V5M21jelpu?=
 =?utf-8?B?MG5BVzZwdXB3WTl1VmZNNVNXNkM3bXhxVWtWVHkzU3lEQnN1ZUNnbDU4eWps?=
 =?utf-8?B?TkJ1c3RSVFJ1S0Jjb2pFNVNza3hyczdvQTRqbWNJS0pINnY2T1l1OHpuRkFO?=
 =?utf-8?B?ajd1UExHSWdBVXAvMHYxMXJES2xHVFdpVHNnSzd6bTdwcjJtT3FXVE9rSDM4?=
 =?utf-8?B?L0YxNG45bHFDZWlZeTd6R05QTjZKUjhHNU1zNWI1aUhsRXdSWHJJL3VNYy9I?=
 =?utf-8?B?VSsrRm0zaks0TS8zSE9pV0lVWFNYUmhWSmZET2ZSeGRCMVZ5N2lIMWFyTHBl?=
 =?utf-8?B?L3hCWTBTdVBvdXp6TnRzbkszR2dYd05jMG8xY3E2dzFQTmdwdzJBbk5ibGNp?=
 =?utf-8?Q?ds4M/5Bgi65EjxOE7PTM2iGDoo0SE0=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:05:10.6703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 235a6490-d6d9-4a3e-fc28-08de52482ec9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_180520_659307_D5C79A74 
X-CRM114-Status: GOOD (  17.95  )
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

Hi Robin,

  Looking forward to your reply.

On 12/16/2025 8:43 PM, Robin Murphy wrote:
> [Some people who received this message don't often get email from 
> robin.murphy@arm.com. Learn why this is important at https://aka.ms/ 
> LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> On 2025-12-16 12:30 pm, Jun Guo wrote:
>> Add SoC-specific compatible strings to the DT binding documents to 
>> support
>> cix sky1 SoC.
>>
>> When adding support for a new SoC that uses the arm dma controller,
>> future contributors should be encouraged to actually add SoC-specific
>> compatible strings. The use of the "arm,dma-350" compatible string in
>> isolation should be disallowed.
> 
> No, you've missed the point - however many channels the hardware
> implements, the DT should list that many interrupt specifiers; it
> doesn't matter whether any of them happen to be the same.
> 
The interrupts defined in the device tree are based on the hardware 
interrupt numbers of the GIC, not the DMA interrupt specifiers. 
Therefore, I believe it is not possible to configure them as you 
suggested. If you have a demo, you could share it for reference. 
Typically, interrupts in the device tree are defined as follows:

interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>;

> Thanks,
> Robin.
> 
>> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
>> ---
>>   .../devicetree/bindings/dma/arm,dma-350.yaml  | 31 +++++++++++++------
>>   1 file changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/ 
>> Documentation/devicetree/bindings/dma/arm,dma-350.yaml
>> index 429f682f15d8..78bcc7f9aa8b 100644
>> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
>> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
>> @@ -14,7 +14,11 @@ allOf:
>>
>>   properties:
>>     compatible:
>> -    const: arm,dma-350
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - cix,sky1-dma-350
>> +          - const: arm,dma-350
>>
>>     reg:
>>       items:
>> @@ -22,15 +26,22 @@ properties:
>>
>>     interrupts:
>>       minItems: 1
>> -    items:
>> -      - description: Channel 0 interrupt
>> -      - description: Channel 1 interrupt
>> -      - description: Channel 2 interrupt
>> -      - description: Channel 3 interrupt
>> -      - description: Channel 4 interrupt
>> -      - description: Channel 5 interrupt
>> -      - description: Channel 6 interrupt
>> -      - description: Channel 7 interrupt
>> +    maxItems: 8
>> +    description: |
>> +      The DMA controller may be configured with separate interrupts 
>> for each channel,
>> +      or with a single combined interrupt for all channels, depending 
>> on the SoC integration.
>> +    oneOf:
>> +      - items:
>> +          - description: Channel 0 interrupt
>> +          - description: Channel 1 interrupt
>> +          - description: Channel 2 interrupt
>> +          - description: Channel 3 interrupt
>> +          - description: Channel 4 interrupt
>> +          - description: Channel 5 interrupt
>> +          - description: Channel 6 interrupt
>> +          - description: Channel 7 interrupt
>> +      - items:
>> +          - description: Combined interrupt shared by all channels
>>
>>     "#dma-cells":
>>       const: 1
> 

Best wishes,
Jun Guo

