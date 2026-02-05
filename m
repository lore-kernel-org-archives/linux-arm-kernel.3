Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6B2EA794D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 00:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgT/iF+NYQUs2zaF670eRgDn+rgqOdrWG8aM00niHaw=; b=kVAuMK93vg4AWIQ3rS2l3hqY11
	IxVNtZlVVmIsDM3gyz2Uj9dL0d294F5Rg8wLA7rm5DyyiNuUDZVC9Tz31vyh3784G642PIWR9knck
	4Ql5XUOrAPO4JQaQb5pGnb8jSb3262QJRRcX9S+w36QvHpawPz2TxFOm/zxhAWl8iF9KK7CxJAQSz
	GOqiW/MbX9v29YdMAcVCe7NfNFq6AFE9RBVECgSq4xsD0s6TlogVNEM0P7S2BZor7+G0zuPy+ED75
	lfSLvb7PbvMqRUdGJk7xuNesKUwk4iIpPhJf8W5F7ks/ToCNBfEy8d+p30vaA3Ggjp6KWm6z88CEc
	t2WMfPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnnaT-00000009ETw-1jds;
	Thu, 05 Feb 2026 00:51:13 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnnaQ-00000009ETb-1P8I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 00:51:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGwjNULGthnsT++0fVUfEml3WsKw+7mFlDx5vdez8PHLfgrTNJ2xkIX1vnNeU2zBd5WFoGFsGLMeVEaLEQVSfWc00MyXxYRSYCovtvdz9Jn4EuVc8i6XlQaTvgOHp7uuP498LZokfvgyEh+tPzPrMx5m5bWNaKhjDtp6y2Cf2Y49psN1vM/O5LWhOMIVhj4vHwDgCHlZhgZ5R6rP4A109zOF+8c7SFccDk0DLwgDGUzd2Qap41Bkamx4Znws2btD6jtjZmXbiW+ZbQO9AabQQsSLeVCLYHfmm8h8CNGqA5I81IVRc7Cx+gqDxKllvZBOkcC6VOUjOjMu1ggiYBGIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgT/iF+NYQUs2zaF670eRgDn+rgqOdrWG8aM00niHaw=;
 b=fk/y0HbgKz15bk1WEXDXXGqCIpe0IavUeZPXe9v8DejRymxeibgXsWg5+TkjvkBkVltXJa9Hi2vJnJlU0LJJyD00IB3D25zjMTOQvR80j9RSemRvKV/oVGPsUKPfojxuYdNdgbSlxgxQEh5BG0IDxoOmjiPzIhCUJFmEMeMRZllEKqt9LEiKOY2CKo4jYIc8Mtz2nhr9nsL1NVEcGlGo68RfdqXcDzFqpuiVRLd6C6DV8j0kUELAbYs4oAupZJaCgkQh6nGWFZ6BsmRTFnLZvGzuC/DvAkG4BDKe4BF4cKwGCm3G/nz9pDxIR2kqJtFDozgLbwKkjf9fIWExoempmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgT/iF+NYQUs2zaF670eRgDn+rgqOdrWG8aM00niHaw=;
 b=cNn3/zgU8g//bjBaBVlrCw/RFl3CKnN6mNq/laLoXL/aXZ9Fu29cQQRTnlmR0KrJmIWAlScr6oWQOxI3SrfmGa46NXLt1AfXzMb2to1RzCxheq/GHp+kxZvQaeAE81P1AE6SeMruewOUCkaGiRS/QnOTrH2AP5edGTt+laatrr4=
Received: from BY3PR04CA0017.namprd04.prod.outlook.com (2603:10b6:a03:217::22)
 by SJ0PR10MB4607.namprd10.prod.outlook.com (2603:10b6:a03:2dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 00:51:05 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::88) by BY3PR04CA0017.outlook.office365.com
 (2603:10b6:a03:217::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Thu,
 5 Feb 2026 00:51:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 00:51:04 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 18:51:00 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 18:51:00 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 18:51:00 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6150p0Ej2474863;
	Wed, 4 Feb 2026 18:51:00 -0600
Message-ID: <07ebc227-58a8-4aaa-9711-2d8469d49dee@ti.com>
Date: Wed, 4 Feb 2026 18:51:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: ti: k3-socinfo: Add support for AM62P variants
 via NVMEM
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260204213746.2589028-1-jm@ti.com>
 <20260204213746.2589028-3-jm@ti.com>
 <25ced9af-b103-4cd3-9b31-42b188fcad60@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <25ced9af-b103-4cd3-9b31-42b188fcad60@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|SJ0PR10MB4607:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c714a36-69f0-4e6e-f1c1-08de6450a3e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWdzK25xOVJOVnFnUWd5YUV2QUVHR3lLa0VDV2w4U0pvZ1pFMDZ4N1BmYkRx?=
 =?utf-8?B?d3NoWjBNcTN2ZWJFd2g1dVpMTTZOQm5GNndXSyt1M3FTV1BDTW94NzhCc3kz?=
 =?utf-8?B?QlZ5dDZXNVNXTXJ0K1pmb04yMXVQY1cyYXlCUlNaQ09TTGE5LzFGa2xoKzR1?=
 =?utf-8?B?Ym5DRHpWMTZ0aTYzZVZRQUlmUEFYMjFqK1VsYVR2WUJWdER5WjYvWHZrK2hO?=
 =?utf-8?B?VmZTMlF5R2FuTTR4RUM4aGc1QWpUM1pnUVI5OHdmVEdUL0tZSHl3YU4weThZ?=
 =?utf-8?B?cGdYeWNueEFzSlc4ejVZS1BjTDNoMHdBMzg1YnpONjczWGI1MWJEcmJrSEh0?=
 =?utf-8?B?MVF5RGcvRVIzSFovdncvL0h0eDNua1RzVWhIc1pkcWpjaWRrbFpWclBBWENv?=
 =?utf-8?B?clJLK3V6ZjFmZlNSN2lpV2haVFlKL1pxb1JwOENEUDJ5RlNHRXZURE5WRE05?=
 =?utf-8?B?SnBSRHVKNTBzRUxyZ1RSYTZseFpQZFE4K0hlQTJZK0xibU12UWdsaEpWeGtH?=
 =?utf-8?B?cmhvQjFDa1UvWDMvbmNhN3RxL3B1cWlYSy9mUGJLMGE0ZHhUNTIzSXJTRzBv?=
 =?utf-8?B?SmU0c21Fdi9acnlJK0ZjZVRDeHFhNlR1cmUyUm94M1UvdU9vMzQ5ek9xbnRa?=
 =?utf-8?B?bW9FZUlLMHh0Y2krUTJWdVp5NHdwUnVERHNGWHBaSmoyMURUcFhoSVdiOXB0?=
 =?utf-8?B?N2xZN2MwRHdXWVVpd2VxYjFDczdoQnVKS1RmeTUvbEcybWJrS0Y2ZG9hMEpR?=
 =?utf-8?B?b3hJL1hMdUtvTERZaWNjNHIyUTEwbTV0RFFPMW5lTUlVeStvWEo4Ui9QQ0RR?=
 =?utf-8?B?R3JpTHdJczJsYXhkVGdtSmVWajdjaUNuVUxnZnhrU1BMQjRrZlhneXRmeU9N?=
 =?utf-8?B?UTAxc0tFcEtJVHI3RHRnTHQ4MHhGYWFDS2FBVnFTeE1VcG5pOFhNc0E0TTE3?=
 =?utf-8?B?eFN0cEFudHBzMGx2VkttT3RYOVA4UXluSDltRktiRFlNNU8xeDJVRHlxcjJQ?=
 =?utf-8?B?dG9WTFRYUmFxM0JLcWo2TURndjdRak53Y2IwZlVublYySnpTRkdFUG5nVEp5?=
 =?utf-8?B?MUF1WDN1NjBFTGdzOGRubVViVnZzMm4vb3R6THYrMDcxTDJES3FjN3BXcW5E?=
 =?utf-8?B?RGtaUGN3eE11TG15N1hVMnJVY2M1VUJoWndvcGltV1lubnZMQzl5Zk1RSjlw?=
 =?utf-8?B?SHBwVENaU0cyNzNOTHV4TzFRTDIrN0UwUUN6bEtqL2RIT1dqNExGakdZWkM4?=
 =?utf-8?B?SG1tUXV6Ly93elFYbFJhb0FjN1picDA0VStDdlVaTXAzbUFMdDVVYVFaclBN?=
 =?utf-8?B?eXR3TFhHUlhzS2tKcCtvSVVSazA5Q3MrRHpaL2NDdFJTUFIzNzRYdndNbjNI?=
 =?utf-8?B?RDh3VjJNa3U1QTFuZWFiLzZEUWdURDJRQTVEdko5bjF1TCtTU0p4YWRSVTRK?=
 =?utf-8?B?ZGZjeXltck9UaUt4Rkh4NkVOSVVST3hzZDY5N3QxaWRXZWIrb1d0UnZpejJq?=
 =?utf-8?B?cWpsTUJybVB0Q0diLzZvaEZXTVFQcTRacnVob2FiUFpWbGJHL2gvZXhoQlJB?=
 =?utf-8?B?eUtXb3c3VFdDVHdzYXFLZVJzVUluMFZnSHlQY2NhUjdRcjh3Nms4RTE4bVE2?=
 =?utf-8?B?bE9aanExSlRYTXNERmNTNDRJekJ6bkdxb1ZMMER1MXp0VVNqVjdyU0pWbnZ3?=
 =?utf-8?B?MXdtM3RpSmxlZmt2RVUrbmF4MXZhVEtOTUxvTXZLaWlyWXA5d3NzYVV2V0Ns?=
 =?utf-8?B?RWU0Q3M3VmtYZ0pZK2wxakhMa0tmMUJaaHFGSzRSaW5LUkRCVVcrRjhYRVM4?=
 =?utf-8?B?ZVhMRWZ3eE9lZVdVVkpGeis2MFlnSkk0aWR6QU02eE1VS0dFOWdrUzVSU2Qz?=
 =?utf-8?B?ZHk4WDFxMTNuTlVPNjZ6Q2xabFNnYTBZMVB0OEs2YzdtY2VLRDFDNVVjWG15?=
 =?utf-8?B?cnNiOXNrd1lKT0pRZFl0YnRRY1F6Uldpd0lpVnQ3RDlaSnhLRGxiTkRIYmx1?=
 =?utf-8?B?RE9XZjZnU3hRK0NwanlQRXcybjE3ZFNOZG5PM2hQMEZkcDR5blpqTVpuM09h?=
 =?utf-8?B?ODROMHI2S3UwZG1pbWZwWDJUcDRyV0UyK0o1OWhwTzI0VVB2Z1paWWM5VGhD?=
 =?utf-8?B?UFRPMC9jdXo1ckY2a1lnUlNNUlp6SDVhZVV6REhLMW8rMDNSd0NGOEo0eTJx?=
 =?utf-8?B?c0QvWXdOck80THVZRUJTckRqUjZuZkg0VTg2U1lVWTB4QVAxeUJROUpZSTVl?=
 =?utf-8?B?QzVUM3lLTWZ1MzdnVmxNNjlTNDVnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E6gsuCv+o5HGPVmXxzmY7EEPE2XJE/LeQ4Rr1EygkPGRWyTyMqFgEnqOKtxFufv/juyrz+q5MQ/craZnpHudYgix9wh+R5RGTSKod7yjIcYWX7+CiXS5JZ40H/sYRhynuF1wzL0GBs6uOni8Cy7GghXLZ+afW7jWMv4PFupFrUJ8s+SR5VCBSJgwFaA5BDi8Zrq/aKwOSLHJ/idv8MAA1MIJxcV5c0sttzqdl5uyF3Ru4iXBfWTO+pKUdwLoW20/Y6BpKIXj9pv5RmAl1Xu6lY2rI5a79cdZMYduS9FtwUpAHA6+2kAGNvwBer69OnQXF6Xym+R2M12NmCPMTKhuElcf0JuG1UkTGAA+bsVjJ5OX3W8TPycc9zBVi6Ue5ScTJpA+DaIE5ioTpRC7OAaqGPji42fGT02+ZuM94PWPkf4zxr8zJJOxlLMEgOhaF9Vz
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 00:51:04.2100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c714a36-69f0-4e6e-f1c1-08de6450a3e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4607
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_165110_449369_7DE7EE18 
X-CRM114-Status: GOOD (  19.23  )
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

Hi Andrew,

On 2/4/26 3:54 PM, Andrew Davis wrote:
> On 2/4/26 3:37 PM, Judith Mendez wrote:
>> Add support for detecting AM62P silicon revisions.
>>
>> On AM62P, silicon revision is discovered with GP_SW1 register instead
>> of JTAGID register. Use the NVMEM framework to read GP_SW1 from the
>> gpsw-efuse nvmem provider to determine SoC revision.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   drivers/soc/ti/k3-socinfo.c | 48 ++++++++++++++++++++++++++++++++++---
>>   1 file changed, 45 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
>> index 42275cb5ba1c8..4b6947a9ceb4d 100644
>> --- a/drivers/soc/ti/k3-socinfo.c
>> +++ b/drivers/soc/ti/k3-socinfo.c
>> @@ -6,6 +6,7 @@
>>    */
>>   #include <linux/mfd/syscon.h>
>> +#include <linux/nvmem-consumer.h>
>>   #include <linux/of.h>
>>   #include <linux/of_address.h>
>>   #include <linux/regmap.h>
>> @@ -25,6 +26,9 @@
>>   #define CTRLMMR_WKUP_JTAGID_VARIANT_SHIFT    (28)
>>   #define CTRLMMR_WKUP_JTAGID_VARIANT_MASK    GENMASK(31, 28)
>> +#define GP_SW1_VALID_BIT            BIT(4)
>> +#define GP_SW1_ADR_MASK            GENMASK(3, 0)
>> +
>>   #define CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT    (12)
>>   #define CTRLMMR_WKUP_JTAGID_PARTNO_MASK        GENMASK(27, 12)
>> @@ -70,6 +74,29 @@ static const char * const am62lx_rev_string_map[] = {
>>       "1.0", "1.1",
>>   };
>> +static const char * const am62p_gpsw_rev_string_map[] = {
>> +    "1.0", "1.1", "1.2",
>> +};
>> +
>> +static int
>> +k3_chipinfo_get_gpsw_variant(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    u32 gpsw_val, adr_val = 0;
>> +    int ret;
>> +
>> +    ret = nvmem_cell_read_u32(dev, "gpsw1", &gpsw_val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!(gpsw_val & GP_SW1_VALID_BIT))
>> +        return 0;
> 
> Return -1 here so you will get the warning message about setting default 
> SR1.0.
> 
>> +
>> +    adr_val = gpsw_val & GP_SW1_ADR_MASK;
>> +
>> +    return adr_val;
> 
> Merge the above two lines,
> 
> return gpsw_val & GP_SW1_ADR_MASK;
> 
> Or maybe try using FIELD_GET() or similar if you are feeling fancy.
> 
>> +}
>> +
>>   static int
>>   k3_chipinfo_partno_to_names(unsigned int partno,
>>                   struct soc_device_attribute *soc_dev_attr)
>> @@ -86,9 +113,11 @@ k3_chipinfo_partno_to_names(unsigned int partno,
>>   }
>>   static int
>> -k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
>> -              struct soc_device_attribute *soc_dev_attr)
>> +k3_chipinfo_variant_to_sr(struct platform_device *pdev, unsigned int 
>> partno,
> 
> You pass in the platform_device struct pointer, but only ever use the
> ->dev member, just pass in the "dev" device pointer.
> 
> Otherwise LGTM
> 
> Andrew
> 

Thanks for reviewing!
Will fix according to your review and respin the series.

~ Judith

