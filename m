Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB783CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3xseSfgGSk8z8D1AyjLt0MJGVhHLoyQosqZuz8elzY=; b=1Y7IWMkRhNehmGjjRKS3V6hZ9e
	7w2XJbDAHko++MMHELHuVyxjw/yjibZ5I3Owq2zNLmV8yzIMxLEGb98Uf0fX28pUs0sQIf+DIwmhb
	/Mj1KdHBSJJEyyjdBIawx9RtbCXUnUiFxK3E91SrCGW9qRN4/zlzK2ryLjrQqET9CT8N2WnmWVbHj
	iKXhgWJJeKUoTeLYwJN0uqZlfSkONZp1rqHkIzVmGGhhJVhmA3yyd8qnJpIoZOk8VHgfugk5HTadO
	jEdYtzdMW+wBPhjtbndha1ZMLoxu3UKLO0lRfGDO2WGRU5lySi4+YIDwsnkK6daklgpOszn4snqrJ
	O9mrTPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyiI-0000000G83T-3dYu;
	Mon, 17 Nov 2025 12:52:10 +0000
Received: from mail-japaneastazon11022117.outbound.protection.outlook.com ([52.101.126.117] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyiF-0000000G834-2D00
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:52:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3wKZPinBMHAHzrWY9nJc5o1lBA+LeWB0LRtqylyLKZajQqLvDDVmtzjg3XWv+Mi1bb5tqU1H+QK9wwln18PCGddIJv5w+bcen+A7wxQ9Zs+3YbYC1+cGOaot4qnFEz2bGfebik99/p2m+g6i+NxNrn0vyVU74ekH7as3lbqIWEtTf6L299qOmkJsqYTwDswJsq3/oNJ1ndjHZ47nMu1wjK7gSNu65PLmNlCW18e+lbsH2T3UQ4qmCAO/8U/Pnn7MOXadapsKiR5Ial9QxqqlFYErVAFS5oeJWb7+4/hAGq7RlF/xEc06TDoFptlYW4u6UiVPKaq+Q+rgzS7ATNiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3xseSfgGSk8z8D1AyjLt0MJGVhHLoyQosqZuz8elzY=;
 b=PnhBvfF4DvEbZWb4Ih4BBHpAAHFE379i4Xg01tI+T3wzBoeOvZ5oh4Xls3IOzR2Jgj6gj69PazQ+E/McLgt7XIPQCYfrPg2H/7XkN2hQxhQwV81kxETJtb962mgzFAGaGutnTYrTWIlMe/ZI2oecZh4DKKzwy4kyXYJkx0eDm4lDPMhE8HFABCTZf+WNmxl5amA1sksq6fzUtTEVsBYbsPmNt5zQbdepEvyZT8pbsi9u1CzMqX/s7KVExCb7f4HWMV2sb+eLci3GcqtQNOz06kOyb0PU+P1LGL4IFKKE04xKHlLsV/CQpw6HpI+bBP9OUzjemQYYDSALI9a1Ao8+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0138.apcprd02.prod.outlook.com (2603:1096:4:188::12)
 by TY0PR06MB5404.apcprd06.prod.outlook.com (2603:1096:400:219::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 12:52:01 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:188:cafe::be) by SG2PR02CA0138.outlook.office365.com
 (2603:1096:4:188::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 12:52:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 12:52:00 +0000
Received: from [172.20.96.43] (unknown [172.20.96.43])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 73DD841C0145;
	Mon, 17 Nov 2025 20:51:59 +0800 (CST)
Message-ID: <08142bd3-4a17-4c4f-88ff-fd81e9941a18@cixtech.com>
Date: Mon, 17 Nov 2025 20:51:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: dma: arm-dma350: update DT binding docs
To: Krzysztof Kozlowski <krzk@kernel.org>, peter.chen@cixtech.com,
 fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, robin.murphy@arm.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org
References: <20251117015943.2858-1-jun.guo@cixtech.com>
 <20251117015943.2858-2-jun.guo@cixtech.com>
 <bfe6a067-704b-45c1-919e-6a7dfb08b984@kernel.org>
 <aea1429d-b67e-4c42-ad19-88d04f69467b@cixtech.com>
 <024eb64f-74bd-4170-a6c1-09c4af647926@kernel.org>
 <62b59d52-7107-4426-b922-812d343195db@kernel.org>
Content-Language: en-US
From: Jun Guo <jun.guo@cixtech.com>
In-Reply-To: <62b59d52-7107-4426-b922-812d343195db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|TY0PR06MB5404:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0ef6cb-06f0-45bd-2bec-08de25d819ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVo2Z0drUTR6c2xnaGc5b09KQkYyN29VbVZBQlNUU2Q0SFV4NG9KVXJTTmF0?=
 =?utf-8?B?WkFJYmt2SzNOREtlVm5OQU8vZXk4enVkajk4T1A5ZWJCcDJCOVp6VCtQRXJ0?=
 =?utf-8?B?RkkrT0s4UnVoUWo0SnN1T0ZKdmsxTVlEY1ZvTFUxVHNCR2tpdXFtTUlTVVNl?=
 =?utf-8?B?Y0JybVpXbUx2NE9vbjBUbXZBdUNjL3IxcnNrNUFTSnNKTFlESm8weVcxd1p4?=
 =?utf-8?B?dWNYWGs4SHlXQ1VkZ0tvMUxmbGtJeXFOdGVnNTRmSzBvZ2lOMVRsNjNwd0NB?=
 =?utf-8?B?Yjk0UjVLS0d1cXdhb2ppbWdEUnBybGxEQ1BMUmlLN3NSQm12MTRuRmQ1cGNQ?=
 =?utf-8?B?c0lGZEhOYWxwbGlLSzVFZnRyZ2pBRGRnVHBIbnRpamUyWTdNWlpTQTN6TEt6?=
 =?utf-8?B?ZWcwekk4cU5seWxSUDI3Ty9vZWM1SWhLQktLYkZZU3JVVS9HcktIbUt1TXE1?=
 =?utf-8?B?MkNjZXpzK09lelJETVdITXFnTEVhVHlva3A5akpIK3o3bWlwYWg2MEhIYTZv?=
 =?utf-8?B?Rnd1VnJmVjAvZldSdFdHdTljSzd0YkVtYXN6cWtxNmVpeHZUS2w0eDMvZEhw?=
 =?utf-8?B?aW01Rk5rNy9SblFEYjJwREs3OWl5dm9kZEVXOFE1MG9OSnZIRzIrYjJXTEdI?=
 =?utf-8?B?Y2RhMkJERkRNRzArNnVwNXk3cDNNblBUbmlBOTJKVTlFTW9XUlJkTkp6czlV?=
 =?utf-8?B?aUlOTE9OSm1sYXh5V0hLblpOMXZmejFFVzh2ZWZESXJScUtyRXNlOVNldUhi?=
 =?utf-8?B?WmpVL1NEVlBlejVpVHppdnZOTWsraXh6OCtCaE9UTWJWeng1bXovaCtoanov?=
 =?utf-8?B?V25PRGNOc0tHRjZSZlp0SXVJVnE0MHhQUE9iQjRzbHhBYWVjR1dYKzI1RnR0?=
 =?utf-8?B?dGcwNHFUR3FESXE2MXVsd0U0OWgrb2dPOGFZQ3lCVkdlSzV6WC9tcTlvcVhY?=
 =?utf-8?B?MHdjUGs1bmt4S2xPQkdaaTdTWFowdHF3SHRIbTBOUnNXYWIybGd2VXFnNzJD?=
 =?utf-8?B?NFg5anVRTjJuWDZUczNZZ29iamE5alZwNmx1cGp2V3ZxL3ZmQ2pDN0pZK2Jk?=
 =?utf-8?B?aGIxaUNtVjhiY1Z3Y3p6SU13UG05MlVlQUMwd0xBOGNPeVJhM3BmaitFaHZY?=
 =?utf-8?B?SHN4Z0lKR3JWUHB6WU83aWxOWEttWnBkaGNxVzVjaTBTZU90NCtQcGxOdGJs?=
 =?utf-8?B?eTYwb2NPbFp1Yzd5WXVvRVdBT2E4Rms2NnRMbzBUcVpsdUVYaThMc2kycGlB?=
 =?utf-8?B?YWs3UjA0cGtTUnhncll1Rjd5Q3EyZjliOTRYZnZTdXowdHJSd2ZOa0J0am5Y?=
 =?utf-8?B?L0JiQTBEUFlwaHZ4azVnL0w4RFJ2MGJqblQ3Z1NqMTJYbTBIT1F2NFl5Q1Fl?=
 =?utf-8?B?ZllNYlBPcXFDcDhqRHBLQmpNNmJTbDR4MWtreXZBMW03WUpXeDJLL1IvOEZ0?=
 =?utf-8?B?QkFRNGxVQThsdi9xak5wanFMTlNEY0c3RUhSMms2OVZpTkNNU1RLdnVteldZ?=
 =?utf-8?B?bFlLSjcrOGlnVHRmaHNjek1oVUh6NmV0NUltTllya3hqVWlacWNHWEhvQng0?=
 =?utf-8?B?WDZXeFMvNnpyT3VBeE1SbDhVbzFWV1p0NFlxcWIzT0dBWlI0TGtMTnppUmVo?=
 =?utf-8?B?Q3JFR1psbS9xczgxNjNhUnJySlNaUzgxclJDa1VPMWdSTG51QXJ5ak9KLzFF?=
 =?utf-8?B?NDhBZFJqcmROc0dzeHJxYWdtNjNla2tvbGp0NXNpYnM1YURXK0JVaUxOWk5H?=
 =?utf-8?B?TnJob2VTYkJEcjZiTlBlMldjcTY2eUszRFd5ZWFMdDNRRmNqdmQ0N0pncVFj?=
 =?utf-8?B?bk9UbzNETmlGMWlhYmFtclh1Umd4MExHeEQvVUFWZ3hmSXlTQmljL21vMnk0?=
 =?utf-8?B?MlVLYWVFM254cUZFWDhaUENQcDQ2dVBMTjNveU9EcExsd25uSHdNRFYyN1Rp?=
 =?utf-8?B?MjlpTzJlYmhZOTJTZGtrZEQ3TTA5cHhVUTJKSkRLVjVNN3FrSEFhTmlLbXRK?=
 =?utf-8?B?QjZlZ2YxZ1ZPRXFWWXpjSlhvK3lpdXF3U1lEa0tqVW1uWlRTcVMxRkRacXo5?=
 =?utf-8?B?OS9kcWhaU3NNa1UwbzRVbzZ0T2JJb3FsVkcvVDVXOFV0c0hlL3dDR0pZYkRv?=
 =?utf-8?Q?6CdYPZiASRCZY959UA/tJmREZ?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:52:00.6108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0ef6cb-06f0-45bd-2bec-08de25d819ba
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5404
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_045207_570779_8FEB9DFE 
X-CRM114-Status: GOOD (  17.43  )
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


On 11/17/2025 3:13 PM, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 17/11/2025 08:11, Krzysztof Kozlowski wrote:
>> On 17/11/2025 08:07, Jun Guo wrote:
>>>
>>> On 11/17/2025 2:11 PM, Krzysztof Kozlowski wrote:
>>>> On 17/11/2025 02:59, Jun Guo wrote:
>>>>> - Add new compatible strings to the DT binding documents to support
>>>> This is not a list.
>>>>
>>>> Also, subject is completely redundant. Everything is an update. Why are
>>>> you repeating DT binding docs?
>>>>
>>> Thank you. I will incorporate your feedback in the next version.>>   cix
>>> sky1 SoC.
>>>>>
>>>>> Signed-off-by: Jun Guo<jun.guo@cixtech.com>
>>>>> ---
>>>> You just broke all existing platforms. Please test your code properly.
>>> The patch includes proper checks. Since this platform is the first user
>>
>> Nah, tests are here incomplete - look at the binding and DTS users...
>> nothing there, so you cannot test it.
>>
>>> of the driver in the current codebase, the change won't affect other
>>> platforms.
>>
>> NAK, and you keep pushing... I just told you it will break everyone,
>> which is obvious from the diff.
> 
> But if that was intentional change of ABI, then could be fine, but you
> must provide in commit msg proper detailed rationale WHY you are
> changing ABI and WHAT is the ABI impact of that change.
> 
I'm not entirely sure if I fully grasped your point, but I also 
identified the potential issue. I've reworked the patch to accommodate 
both the default DTS case with a single compatible string and the 
scenario where platform-specific compatible strings need to be added. 
Could you please review it again and confirm if this aligns with your 
intent?

properties:
   compatible:
     contains:
       enum:
         - cix,sky1-dma-350
         - arm,dma-350

Best regards,
Jun


