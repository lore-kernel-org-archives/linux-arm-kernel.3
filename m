Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D68EE20B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SUa2/xTsC3OX8rqGzEPP/+S85cA0WNSow2zvi1pHY8=; b=0z5+n5rL2wrbUvKJ7Mia3T3Iv9
	PB7PoMQ1h2bsKG8+ADXoRHvq2b/dlFbSMFE5LRfRKRM3JhJw68u+G/OUwCLwvoNPqBGiR8xc+vHfr
	divzqo2d96dozziCXt/yhVY6F4pT6WKyEHsS/ZGltPe0WTdydf3Na1+sf7dqcp1uUcOVHBsLp5rIG
	UA9a472lXHIaO6wyNu+rY9eUmJ6jLMaVbq1BD/QutM4TfhV1lxwMB87lgcpOw86O+SmfzdR/GsFOG
	POMebm3ogbJnIyYegtpHUMvlV5GYi6Z06g5E8YDl8PYCjqRhRs93K7rdyreEyzLIFKrd4HVrSR/WI
	Lf1oDezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voP2S-0000000BaXY-1O6u;
	Fri, 06 Feb 2026 16:50:36 +0000
Received: from mail-westcentralusazon11013021.outbound.protection.outlook.com ([40.93.201.21] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voP2P-0000000BaX9-2EL6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 16:50:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppF1mcJfa7lvmiDUFiuXTBaF/YxK5l3tl6kJ178Dklh0mx9vSIZPTFAJUY1y2RSPXJG0XG/FoiQIpFuq3XfEvSPeqLiBqT07L5vGmzd7ZGTEFiRf4/J4fjKm5A4JIqsmlMUuwCO9cY/Uo/zRstoccmp1dAE/b6U9pKbImg306RpAz2geIc5H/+6pwoGNJoD0lw51czs66nBnSCU3t1KmLZkOU0zAco/LURHzOGoRTpmjeIPUMscOlKkRbcUVSoJIVcVSbgmJjY/WgvtPsk4ooJ1q4o3cWibKMycprZG9S12hcFqf4vlZRfrFXW5yVUHLEO4Zanvk62elh5kCMCh18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SUa2/xTsC3OX8rqGzEPP/+S85cA0WNSow2zvi1pHY8=;
 b=ChFgq3okNsp3zF79nezDTazNn77F5AhS50N0sWQ4+F31jodnWEbkiA50lgFZ9rJYobAHnWAnGbjfIyWozRq14RC/3Jhg3GjkbtmW7Z2npL15/g/vDfs0DbOj1UiEW+PXTdcorqX6o+ZYJ1p6iI08OREexYs6KfQBNHepYRBh4p8vu+l5nTmcptch7KG+LV2U7YqT11lQerTK/EidxPyoRXI7EsL38Jd5LbfYu2P25l8lH/a4K3ahMmhqWsd30Y88XGrRvA1vxzhSIjJQvLVR9KcR3x24oHtCB1wlHzLtGauBA1tnX94WhO9XX6K0nhkAfXJus+d4qmc3OKPSuKZJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SUa2/xTsC3OX8rqGzEPP/+S85cA0WNSow2zvi1pHY8=;
 b=dDy0ZQ+zNOYeL8AVZorOEXb1DJRgLyfsas4x1Nz1R4WwcG9r/tllOip+/bBK3vLl52quUKK9ugH6HRY/dtHqt2qqD3lYtoeuB8CwbNs2tfwnLpYYy4FgqLjVRq5xIR4SmRZhpalcUQGrLJyymf5IGke4C5bPbvlMiaVqUtGyJyI=
Received: from SJ0PR05CA0160.namprd05.prod.outlook.com (2603:10b6:a03:339::15)
 by CH3PR10MB7531.namprd10.prod.outlook.com (2603:10b6:610:139::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 16:50:25 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::c2) by SJ0PR05CA0160.outlook.office365.com
 (2603:10b6:a03:339::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 16:50:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:50:21 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 10:50:20 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 10:50:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 10:50:20 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616GoJnX1617576;
	Fri, 6 Feb 2026 10:50:19 -0600
Message-ID: <d04fbaeb-1801-4987-bada-5f99018aa2bd@ti.com>
Date: Fri, 6 Feb 2026 10:50:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: ti: k3-socinfo: Add support for AM62P variants
 via NVMEM
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260204213746.2589028-1-jm@ti.com>
 <20260204213746.2589028-3-jm@ti.com>
 <25ced9af-b103-4cd3-9b31-42b188fcad60@ti.com>
 <528b107d-e2ff-4970-9484-24a6acca8308@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <528b107d-e2ff-4970-9484-24a6acca8308@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|CH3PR10MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf56cdf-86c1-41ce-1e2d-08de659fd136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnFYK1lxUjkvNGUrODQ5UVRzWmRZbmZaSHo5T2NxTEw2c2NLOVFEL3pnbnE1?=
 =?utf-8?B?VXBRcGw3NmZOQUx3RW9CeGlPSFpaRS80Y2dSQTFlSkxsVW5ySVoyY1BUL05y?=
 =?utf-8?B?bWRkbW9VcVcrMjJOVkZaK05NWnRMSHlicmNoOHhwTnduSzJNYzlLbFdKY3BI?=
 =?utf-8?B?NzNOV0U2QTFFMUIvK3FxZVc3RVdsVzRwckFzL1lCZUZsaXdBMHoyUm1ZMmpt?=
 =?utf-8?B?bndkdGh3Sm43Y2JNRHpZekxtYlVHRVJTSjgrMkJobUNaaUZsUlZWN1VOakNw?=
 =?utf-8?B?V1N4UE1xS25ON3lTVGtLcEpGWVFEcm1SV2NpNExDUFQ4U2Z2Y3lvNWU2NHoz?=
 =?utf-8?B?V2F6Qi9yRjI2Y0JlSnMzNUVvcGlZSi9XMlA2N1BvbEllRXlGZWVYeGZxYmhX?=
 =?utf-8?B?YlpweUttaExvdzhOb3FTeGVxWGZEUEZVdmRvWlNnZk9CeE13OUcxci9URmU5?=
 =?utf-8?B?djJlTTczd3B1cXpaTm9tdHZjd0JmZkh5TTk2NHZ1Vkp0RVF0NWt4bWJINmhS?=
 =?utf-8?B?dER6Y3grZEljbkFkVDM3WnFMSHBoK3BzWjFBMnZhOHE0TVpOK3MzelBMaXg0?=
 =?utf-8?B?WlVZVjV1V0JZZ1VpVHBOVXVNZWpubkp3ZDNKVld3MTMxY0M3OU5Wd3o3ZHMy?=
 =?utf-8?B?TWUvT3hQcDdkaXR6aC9HMWlDT3RnbW1MNEFtallGMGdYMTdkU0FNNmkzNHpl?=
 =?utf-8?B?Z252Wk13ZmxPWmZ5cldGUEFtekJGRmNMZHNGalkxTHZtQm5QOXhVWVRiemRU?=
 =?utf-8?B?Ly9JN21IcFl4UDZ5dUt6NTRHWWgwTTFRMkZQWEV1aFhUcXBVV3VkYW1TTjVz?=
 =?utf-8?B?S2ZscHdxSjNnY3ErUE0yUTdRWDA5ZE5XMXQrODM0eDVTMlJBemlRTE9mUVZN?=
 =?utf-8?B?akpuNmhkT2E3dkw3YTIrMjliUkgvVVYzVmxkQkoxMjRhMVZiZXAxeGcrS3Uy?=
 =?utf-8?B?Q01BUHczVjA1R3FOWDVMQUFtTWYyeWpyT0UyWmhPTWJvQTlaeEJaTU9iR2dk?=
 =?utf-8?B?U2tKV2xVR0F5M2cwYytzcFFlanZzZHhIVSsxWjVKTDZFVnF3WC9hdHhQNTRH?=
 =?utf-8?B?RkdQamFtTUpLYnRSUjkvbjlSN3psU1VlMFF2cEhzWTNVcjhQMnUwMXYvZ21D?=
 =?utf-8?B?TkpvNGJVZUZhNkk0YkJwVCtJcVdmQmk2S216RTM5N0pYYlRiODBheU42UnFG?=
 =?utf-8?B?VzhUbHZNclRpbFVoWXlJM2swdnVPb2hiUlY0dUt0YjhBWjhSRytiT29qaTZa?=
 =?utf-8?B?QVVXTjl3ZVVvcEFaMW5sVFZVQzdBNTZ0d0hWOEdxSDdJK3JCMDVINS9WWkxX?=
 =?utf-8?B?blU0OGNqa1lJdmtZcFpIazJEeUZTMktXVC9pTUhaMkFtSGpDZFdDVnlROXVL?=
 =?utf-8?B?dUVLK3VPY1djelNNMFpjTWk1QzJUbnRMcnJQc09UbDNibUJESDBpekpxaVlX?=
 =?utf-8?B?WWRxanJmUVRWVEFKdTZsTG5ZRThrV2lzVkVWeCtNK3ZDREhIYTlkVVY3QkIx?=
 =?utf-8?B?b3FYeHdmblVrS0NCSytpcUVtZ3dJMTZVK0pPYU1HTkNRRWNBTG95WUlhWDM4?=
 =?utf-8?B?N3ovQy8rK2JaVFpDSFJpdzhjQ1BJVGJpeDFKMlJmUEI2QVowVTlUU2JFK2kv?=
 =?utf-8?B?OFNpZDc5SE1JQlZNNC9lR1JITjRuSlZ4ZTFmd2F6SGlPSjNQK1lsaXpsMGxu?=
 =?utf-8?B?K1dXeUNUdFg4aGkzenI5djFuWW1adWU3bW02UFV5eVE3R2t0VDJLVGNiUUE1?=
 =?utf-8?B?eWFXQi8wRmwxNjFZRmNsM3lQNUZaKzAwZkZBMWpKM3hFSE8vaXhkL3hNN1R3?=
 =?utf-8?B?UVc1WU9jQ3hNcjJEREt6b0ZNTk9LTUFCVU5TaG9GckRneHVzamNoM05XZnhj?=
 =?utf-8?B?SmFCSXVtMnArb1JSdlhmYnljN2txMVNacFRLUkV2Sjg5SWM4YkV1L1lXQ2xL?=
 =?utf-8?B?VUwxZC8wRHhsbmJaQlZqOVYzNmZ2dnFJSkJ2T1kwL0hkeTZoNUM4OHpmSHdZ?=
 =?utf-8?B?SS9YZjZ3cTFaVnN1L1VIZFZVOU1wcTVxa0t0VDlMMUplYkpobmVPS2VSN0pX?=
 =?utf-8?B?RDdvdGEwZ1JVaG44cDdyT2lEVUJNbzZuMlh5S1VKdm9ZUk9UWlNYYWtiR1Ji?=
 =?utf-8?B?aVpRNGdnN0M3ZTgrZFB3UDltWTNsb2ZPb3VOcnh0SHhjNXhWRWhWSHhFM1oy?=
 =?utf-8?B?OXZHT09vNkNwL1IzMlBjdEZjRjhUS0tkK2ZQbzEyZEQ0M0JPNTVKVG1wY2da?=
 =?utf-8?B?VUVBK1R5MzJmdG9XWWpwWUFTOFhnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IIoxzoXgcJwYY3QbUrs/6XgOmFG9FYQ5EXkR82QjtznQQiLRKt4cPKOR/m1PshT28vgnMdBslX5dQ4XTb5HSwsgdx7OrX+Jl1E43ershF+/hPh8jHCIoWwTmGyM0CkwCyeAicfWmLqkgH6geyrvMmevMN7wERO645t/OiOImLKfmw6j5S4yGrdiiXEjbroBqsMUwNMPkJj5Lk9wxzRsxblK95Q4ebri1gFoe6Jj3lmAC8UgU4ebwhV62vo6xyZKLnESE0GXUMn4l2VfLDSXguj323CXePvVXSJcJCW0ue9zBeCuTi/iOLH+BuS4RpFV6jcJQTLtrie+Z3+2tFSfd6jdrrYw7wRKgxBsjB/wYf1ftFE7j2eJ/qAuahz0a5dONuc0RJmFEqhdLk0hmRpVkR+FxfsszSu7vUvRpuGyBgkYynQ+94p0+136w+nF8dw9D
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:50:21.6016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf56cdf-86c1-41ce-1e2d-08de659fd136
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7531
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_085033_733507_18D84561 
X-CRM114-Status: GOOD (  18.20  )
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

On 2/5/26 6:38 PM, Judith Mendez wrote:
> Andrew,
> 
> On 2/4/26 3:54 PM, Andrew Davis wrote:
>> On 2/4/26 3:37 PM, Judith Mendez wrote:
>>> Add support for detecting AM62P silicon revisions.
>>>
>>> On AM62P, silicon revision is discovered with GP_SW1 register instead
>>> of JTAGID register. Use the NVMEM framework to read GP_SW1 from the
>>> gpsw-efuse nvmem provider to determine SoC revision.
>>>
>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>> ---
>>>   drivers/soc/ti/k3-socinfo.c | 48 ++++++++++++++++++++++++++++++++++---
>>>   1 file changed, 45 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
>>> index 42275cb5ba1c8..4b6947a9ceb4d 100644
>>> --- a/drivers/soc/ti/k3-socinfo.c
>>> +++ b/drivers/soc/ti/k3-socinfo.c
>>> @@ -6,6 +6,7 @@
>>>    */
>>>   #include <linux/mfd/syscon.h>
>>> +#include <linux/nvmem-consumer.h>
>>>   #include <linux/of.h>
>>>   #include <linux/of_address.h>
>>>   #include <linux/regmap.h>
>>> @@ -25,6 +26,9 @@
>>>   #define CTRLMMR_WKUP_JTAGID_VARIANT_SHIFT    (28)
>>>   #define CTRLMMR_WKUP_JTAGID_VARIANT_MASK    GENMASK(31, 28)
>>> +#define GP_SW1_VALID_BIT            BIT(4)
>>> +#define GP_SW1_ADR_MASK            GENMASK(3, 0)
>>> +
>>>   #define CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT    (12)
>>>   #define CTRLMMR_WKUP_JTAGID_PARTNO_MASK        GENMASK(27, 12)
>>> @@ -70,6 +74,29 @@ static const char * const am62lx_rev_string_map[] = {
>>>       "1.0", "1.1",
>>>   };
>>> +static const char * const am62p_gpsw_rev_string_map[] = {
>>> +    "1.0", "1.1", "1.2",
>>> +};
>>> +
>>> +static int
>>> +k3_chipinfo_get_gpsw_variant(struct platform_device *pdev)
>>> +{
>>> +    struct device *dev = &pdev->dev;
>>> +    u32 gpsw_val, adr_val = 0;
>>> +    int ret;
>>> +
>>> +    ret = nvmem_cell_read_u32(dev, "gpsw1", &gpsw_val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    if (!(gpsw_val & GP_SW1_VALID_BIT))
>>> +        return 0;
>>
>> Return -1 here so you will get the warning message about setting default SR1.0.
> 
> Actually, thinking about this some more... If valid bit is zero, that
> means that we have detected SR1.0.

To me a valid bit set to zero means the register is not valid.. If you are
saying that bit actually signals SR1.0 then that bit is not well named.

Although if the whole register is simply all zeros for SR1.0 then do you
actually need this check at all? When you do extract the revision from
the lowest bits (gpsw_val & GP_SW1_ADR_MASK) the result will also be 0,
which is the SR1.0 value anyway.

Andrew

> Id rather return zero instead of
> printing an error to the user and overwriting with zero. What do you
> think?
> 
> ~ Judith


