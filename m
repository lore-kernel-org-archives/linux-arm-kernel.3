Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F0AC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBdb25M6KFZDNXTvUBxd5ckTafKw1oPVvc1eJ2JGMp4=; b=bvniZMdrDbL6PK/8sYw6+0f8yI
	oC2ejX7Xtthywz3yvDLXIQkoE2aZ6I5VGASD53UkFh50elhQNiPE+NV0Mnx5+D4+kHlcA2p9JB9LE
	ewdb9+gJ3Qf/jgvg2D5XWlSv/Nji+RYuCOx563m01UpIO45pNxa4uQcALbQiawHDIeo8o2i8V9Jms
	6MDUtoTBe+577uUkX0kS3onzf8POtUa/6YxlKR+ist5+UB1ThbBjgwu3zPhczHyjLm2B4g4vaewDh
	srTrgCFT5SGuWdLYQgrkcZ8zwVvpFIOx0ktHvhe4w9VFSX5iiBEFnfT10E9Iym62I7Js2r+wH91MM
	63z3gtfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visVc-00000006vrb-3EU5;
	Thu, 22 Jan 2026 11:05:52 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visVZ-00000006vqv-3LwK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:05:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpLqkhX9LCZtHfiqMALSqrLhHCKRHjYUIrJKLW6soH8BlomS7zfhQGnKJABZUqOnlY0hipbA56+RIVJCWEoC4riLkfXW3BDGkNyeX5Rs9CZ1kCIMG+7CK4Ghwz8QHRvuvadkOpXt3/F4AV6oTsxztqlb/z/L8lUyRX9VhsGHLEYZO4iay8ZTOXgT1x/q6XyKRFrH+1KWshQlYlNTNWCS9RshBQL0yMLhaqge5hOsrYIM6aObuyfOf2PwCdPGbKKvD+IGjvYVtBLKogrWyw4tKHAeA3LU6DOdO0pYPwcVLvriF1GKegr+9cUdl8kMjrGsRdBFcBBAGIU2ejF0hcdpAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBdb25M6KFZDNXTvUBxd5ckTafKw1oPVvc1eJ2JGMp4=;
 b=MKw6IWzMOgHep1e8GpN+O9dAQKJvwr3hB3jkSDwltqOvTiCCzqE2t2fbK7bcMmjrKV0iouwFfhHOwpFAJPLd9llIy77o6W1vz6so4U9fmt9KrnneKf131Vhvm/lJa6TotaJ5lz+0j7NukLiqS8aNH2Bd/3wHJhfWfrStkrL9CTXSWewijC/gzuCrnb+JR6yfwlPsg5I7M51k/YK06xhkLYexH/YfcfYPiVzs5b/vYkufPWp+cBy2R3mfYYmp+gJh+Py5AnRsV+3zaoRgwU7cbyik1rG9oyqhCA3XGq0VZDBshHRkaYz3hTZ1Qkjx5sbmm1oS30aKBh9gZFl+7tk2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBdb25M6KFZDNXTvUBxd5ckTafKw1oPVvc1eJ2JGMp4=;
 b=BhFuvoeX0KCbdr8yhlM8C5XgH7CONW3RJmA9fgeQf4ozZnRd3ArtG5dxJe7uxiNxx/SdEV5WJSS5xtlhBBEzxyb9e+F2EFqmslS0AzCUHI0TC87SPxUh2dP5czoj8mzLaoOsup0BHcZ2IhCaxKyVLSuAGPKVJlfVzecitJt9OGk=
Received: from SA1P222CA0046.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::14)
 by SA2PR10MB4729.namprd10.prod.outlook.com (2603:10b6:806:11c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 11:05:44 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:2d0:cafe::27) by SA1P222CA0046.outlook.office365.com
 (2603:10b6:806:2d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 11:05:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 11:05:42 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 05:05:35 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 05:05:35 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 05:05:35 -0600
Received: from [172.24.234.127] (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MB5VWa459511;
	Thu, 22 Jan 2026 05:05:32 -0600
Message-ID: <38256538-44ff-42c8-89fe-65509194c0db@ti.com>
Date: Thu, 22 Jan 2026 16:35:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: ti,sci-intr:
 Per-line interrupt-types
To: Rob Herring <robh@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <u-kumar1@ti.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<j-mcarthur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20260120-ul-driver-i2c-j722s-v2-0-832097c6b64f@ti.com>
 <20260120-ul-driver-i2c-j722s-v2-1-832097c6b64f@ti.com>
 <20260121155602.GA3196596-robh@kernel.org>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20260121155602.GA3196596-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|SA2PR10MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e1695e-3e28-41be-9224-08de59a62f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b21xNVVEVEJLKzJJUGkwTXdOZFJRQkY3MDhONmZQaStTaFZGSUFObThpU0g4?=
 =?utf-8?B?aUpsQ1BYOHFialkzemVXMjRyd3FRbkFzdHJZMEJxVEt5blRYR0RncDBFcCtu?=
 =?utf-8?B?MjVsYjRmMlZYWmhHd0NjMjVaZ0FNeEpEaXZPTndHbURPVDlwdW91RmhwQjRO?=
 =?utf-8?B?N0RmcGVRV2MzR2g5L3ZEd2xGWDZYNzdlQjNhd0RuV1pUTmlkVHc5b2VhRk84?=
 =?utf-8?B?OVhvZ2tLREtKamcvZk80dk5RNktTaWJyMjRSOG5TSjZ0MWJlUFRhTHdtMjVi?=
 =?utf-8?B?ZnVYWnArUFRzdVFuaWRLQml5Y0RJN01SNExMcmNRdzJQRTZkVjRhblNXR3M3?=
 =?utf-8?B?RlQzWGRQVmc3VUQ5bjN5L0owdXdwTmpPK1lKZWlsZ0dZSURiWGNlWWF3dWZl?=
 =?utf-8?B?Q2VkUE9VZThYMmlaR2s3VTAxQjlDSXY0T3g2aDg0YzF5VW53a1F6akkrYUhV?=
 =?utf-8?B?Rk1QT0c5SDIyeXcrMzB5bjA0R3BpN2hDTi9aelBybDlZL3REYmpjaUZLbUhh?=
 =?utf-8?B?Z3FkbUxGQTJYYlpiLzdRVDg5cG1sRi95Y3J0UFA0TWIvYU85empzRjgvT2Ju?=
 =?utf-8?B?M0ZRMVUxdXZVYlNFOVQ1SjQ1cUhHOUoxeXdwTGVqZFJwRXRSZUhUclFkWW9s?=
 =?utf-8?B?RDVlNkpQNWJuL2psdlM0ek5TejBDaSttUy9KUXVuVEIwUGlWdmtiK0plU2VP?=
 =?utf-8?B?c3U1anZKMVAwWmZ3VmY4QTNqdUxkZUhlQWdjK3gvZWhtaHVpZnFhdUpoNVd5?=
 =?utf-8?B?SHBBRDU4eDI5WHRJUFk2UUtnZVJ3eFZhUXFBZVFOREgxMkFPbXRzdGVla0Ny?=
 =?utf-8?B?MndsYlNOS1YyNEIwek5JdEFXT3Y2azJDcmdOLzBON2FnWWIrVmxxK1JXMzB5?=
 =?utf-8?B?SmpKTnRqNTUwR1JFZWZETWtyMWx4RDVYcmJibHh0Y2NkRGEwN2ZDYmlqOEx3?=
 =?utf-8?B?cG4zaWRCblNNbjFtOUtUL3NoUkxqVldFVEN4b2Y0WGkyWEVHU3UzWXJNejBP?=
 =?utf-8?B?bjNabGdUbndqd1dWdHJWZ3NPZDQwdk9mcENZS3RkZFZqU2t3dmlTYlJEZGZp?=
 =?utf-8?B?N3VDSG1zSXhxMWt3d0JzRVF4VkJQcW9waUdWR0NiSzBTZkV0YzRqTXRkMzdG?=
 =?utf-8?B?VTl6VnI4aThvYkp5dllNRG5Tc09kVzlNa2JUY1YxZDgxRXM1cEorODhCU3pt?=
 =?utf-8?B?aWlLUHJvSG9KRk9xQ0xCbDUxRVN5eCtLaDNEeG5iZmFXOC9pVjRSUXFETmRI?=
 =?utf-8?B?eFdEbUUwaGt6MWZqbklvRVE4L0JDR2VNYUxMUGxONmo5R2IxU1d3QmlsVFVO?=
 =?utf-8?B?RnR6K3JXRmJ0NitjOFV4dm45bkJzMWc3R3YrdFV5azR1YS9pTEhZZFViZWRB?=
 =?utf-8?B?WDhscHNaR3l0Z3FxMnFPMGNXN2JqbHU0Y0NVVWZZMzZ6cTQ0VEhXLzRwTkdk?=
 =?utf-8?B?RHhkOHlxQ0x0cmtGV0hQQzVvUTlQbmxocVNBMHMreERTU1l1ZFJ3WnUxTExE?=
 =?utf-8?B?S1I1N1ZZMzhDTkoyTU8raUd4SmdkZzhmalluSTd1cEY2UllId1pQcHNKaVZq?=
 =?utf-8?B?NkVLNWxnY1lZdTNST29UY1FZTllsOHNHcUF6RURWbWtKMFdYb3F1TW83WE45?=
 =?utf-8?B?MDREbU9Kb09UVVlBaFI3U01WWjJORXpXclNDTk0rVmxhVVhPenRjK0tpR2pq?=
 =?utf-8?B?UmxzSWltK1M2ZEF5M2lobktzaUJqWDduSVVBMzQxUTdaejJ6RE5tQ2lQS1Nh?=
 =?utf-8?B?OUkzckRUSXphSUN4UUVVMFNmREFCalcwYWd1a3p2NGtrTFBUNStRelFSTGQr?=
 =?utf-8?B?VVNpN21vUjY2OU0zM0J4MTJKbGxSUTJwUjE1Z0tXQ2xoWXJ5enV0NWxrUEpQ?=
 =?utf-8?B?dUhpWnV2MjBHMXNkMjBVcy9pcWF4cVhudFY5ZEdwcnBQU2tJVjlCZmdnRUZF?=
 =?utf-8?B?Qk9zdU1Dc0pXOFJEVm10aW1VQ2dxWU1mTzg1NUxQZ2Vub3pDdXludGRuTTNE?=
 =?utf-8?B?SjBsTzhoZmxnWUhFamwrblZBcmQwWEMvaWtzampTUlFaeFFwNHQ4L2hQR0tY?=
 =?utf-8?B?OW05R0VUQ1IxNmxaQndKeG80U25heUgwUlJFU2NwRWUzUXh1TFNqcitDenJv?=
 =?utf-8?B?N0kwVmZJYkU5dC9FTHVWSkJWWm9iMHk4NzZScVRIbkJ1YUdqMXVUb2J6ZzBt?=
 =?utf-8?B?OWh3VkZpOERTODZ6VlpNUVEzcEU4aitnNXhmdDBCRHZKVkRZNEFLVTMzdHZ3?=
 =?utf-8?B?NnEwZ25PU1VudWlua3JnUEl1S0JnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:05:42.7270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e1695e-3e28-41be-9224-08de59a62f69
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4729
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_030549_849320_44A559A1 
X-CRM114-Status: GOOD (  16.84  )
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

Hello Rob,


On 21/01/26 21:26, Rob Herring wrote:
> On Tue, Jan 20, 2026 at 04:13:46PM +0530, Aniket Limaye wrote:
>> Update the bindings to allow setting per-line interrupt-types.
>>
>> Some Interrupt Router instances can only work with a specific trigger
>> type (edge or level), while others act as simple passthroughs that
>> preserve the source interrupt type unchanged.
>>
>> In addition to existing edge or level interrupt setting, add a third
>> enum value 15 (IRQ_TYPE_DEFAULT) for "ti,intr-trigger-type" property, to
>> indicate that the router acts as a passthrough. When set to 15,
>> "#interrupt-cells" must be 2 to allow each interrupt source to specify
>> its trigger type per-line.
>>
>> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
>> ---
>> Changes in v2:
>> - Reword Commit msg to better describe the patch
>> - Link to v1: https://lore.kernel.org/r/20260116-ul-driver-i2c-j722s-v1-1-c28e8ba38a9e@ti.com
>> ---
>>   .../bindings/interrupt-controller/ti,sci-intr.yaml | 42 +++++++++++++++++++---
>>   1 file changed, 37 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
>> index c99cc7323c71..59c01f327f3b 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.yaml
>> @@ -15,8 +15,7 @@ allOf:
>>   description: |
>>     The Interrupt Router (INTR) module provides a mechanism to mux M
>>     interrupt inputs to N interrupt outputs, where all M inputs are selectable
>> -  to be driven per N output. An Interrupt Router can either handle edge
>> -  triggered or level triggered interrupts and that is fixed in hardware.
>> +  to be driven per N output.
>>   
>>                                      Interrupt Router
>>                                  +----------------------+
>> @@ -52,11 +51,12 @@ properties:
>>   
>>     ti,intr-trigger-type:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>> -    enum: [1, 4]
>> +    enum: [1, 4, 15]
>>       description: |
>>         Should be one of the following.
>>           1 = If intr supports edge triggered interrupts.
>>           4 = If intr supports level triggered interrupts.
>> +        15 = If intr preserves the source interrupt type.
> 
> Why do you need this property in this case? #interrupt-cells == 2 means
> preserve the source type and this is redundant. Just disallow
> ti,intr-trigger-type when #interrupt-cells == 2.
> 
> Rob


Yep, I agree.

I will send a v2 which makes this property optional instead... such that 
it's absence <=> #interrupt-cells == 2

Thanks for the review!

Regards,
Aniket




