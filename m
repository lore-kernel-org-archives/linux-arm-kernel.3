Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D171D29C4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgAc8jS+Me3Ca+SNviJduVjGd5+n+gjkQrXAuqoguU8=; b=RcVuMFfphD+m0SXIhkjKnQDE33
	3XUuv0m7xLRkTrPISeU/DCBI96VEs8pME3aSsZe+hRY2b1MoGva6GXebYZAkUS+yHZ07jwtQMJlc7
	v4TN7whf127bYyGOV2dneCx8Yb9l2QpK4oJMxcAyN8J9AWTLYz0Kh6/W9+32eQC4tY5qqnP1z8w0A
	RzlLA9MGu04UrHBAHMNM88RD2SAnrR5pVqd0kWhoaI4AfBv9bDjiIq6wLgcs7s1Of9A8IFrHgjSFn
	OciuKdtjUc76zbTU42uQLUeqQHVQe7sbGTe+u2z3M5m/hYxRYhxdYCkJqrFGGih0IaioaNgP3PMIQ
	gMfgifHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsh2-00000002aXA-1v9I;
	Mon, 19 Jan 2026 17:05:32 +0000
Received: from mail-westus2azon11010035.outbound.protection.outlook.com ([52.101.46.35] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsgx-00000002aWC-2gHb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:05:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqLHNbu7wNGJkJpAillwdw4IWJuRlEYo16iNxJl03AEWktt2j+uIMYdvJo4yeJm2nWlxNaMV61/EUp1wWpCOqNhk143NU55YP1z1pz3Iy/eNs/Ayzgpyg0ugJYaAHp6LiBEor9XqDt3oatNApGPQP3Eh/KCrko0SCXN7oO/Qb5D4RCMP8geFyYgEP/O3wWxqpgutUs5/WS67Qzhv+2WespoUoU67STMC8cUTBmXw1PPv4ya+kG3UZlwNV+3qAmN7ZZ4399XsydABCRkIY5EibviwBMWofT+ozsmCMzvVDYihBX5mUB4vzVe7+Gn1XKKGWja5tMzoGxQwgKyLMsHrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgAc8jS+Me3Ca+SNviJduVjGd5+n+gjkQrXAuqoguU8=;
 b=qNzVtTumDJJkNvIPFWiNtViHlkOfVzRdy4PB604ObQu+UVOfDq1gGs6MCmiHYwgXfb6IvEb/9X6KYHLN+Q0J5K3zqibr6x3CaFh8Ph8wXftj/ZELekD7oOW0yipLtz7gX0N5+w5YCx7uctUrRABrvdjBdb/yROL9i4SxqlZjx0iXs6cOykX6HBNcInnOcdrW6gYTLbESUq5tgg6vctybdOer3vSsI+8OtHT5HxV3doaAy62crRHRA9/Zi5JrNYVHQw9jUDLtrwnIk+eJdwFFDAt2V8FqT0vMrImGGJKnqVu/DnsHhE37TNyA6e1Yk4yhP26lQAY2peUAAnhNYM6ACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgAc8jS+Me3Ca+SNviJduVjGd5+n+gjkQrXAuqoguU8=;
 b=w5mIA8uykC63gw8r8AlKj74/A73fOJwHLxzeE+Oj0lodGLKwqjtuXR1A964tjSsTaHx7lE/lyMgliV75iYLRram0mNOVZX4FcHYqznCpTuFWwjQtjWm70y9+lIxksR0LjGrVejg8So0gZAkBxEN/QfbbQONsGqbQUiw9nYbo4Mk=
Received: from SA9PR13CA0064.namprd13.prod.outlook.com (2603:10b6:806:23::9)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 17:05:20 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::ff) by SA9PR13CA0064.outlook.office365.com
 (2603:10b6:806:23::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Mon,
 19 Jan 2026 17:05:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 17:05:18 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 11:05:18 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 11:05:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 19 Jan 2026 11:05:18 -0600
Received: from [172.24.234.127] (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60JH5Efh3885010;
	Mon, 19 Jan 2026 11:05:15 -0600
Message-ID: <6342109c-7345-4895-8eba-e5efca0606f5@ti.com>
Date: Mon, 19 Jan 2026 22:35:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drivers: irqchip: irq-ti-sci-intr: Allow parsing
 interrupt-types per-line
To: Thomas Gleixner <tglx@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	<u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
	<kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <j-mcarthur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20260116-ul-driver-i2c-j722s-v1-0-c28e8ba38a9e@ti.com>
 <20260116-ul-driver-i2c-j722s-v1-2-c28e8ba38a9e@ti.com> <8734432qur.ffs@tglx>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <8734432qur.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: d7df966f-cc6e-4d1c-d585-08de577cec9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emFkQnIrSC82alB2V09RWUdMeHozbTlMODh4L05qM2ZndHhVZCtwaEk4QWpX?=
 =?utf-8?B?emdkRTBEaVUwNnZRajU2cDBEa3dxUmV2TTBrWSt3S1pybjZHdXFSc2o2WU5G?=
 =?utf-8?B?R0Z5a1NkM2JNZ3FkdEtoNDRRbkkwZlZSSGczK3B5NHpObHRQYVJBZ2cyMFRo?=
 =?utf-8?B?YnZVcHppNHlhK096Q0Z2K3dLaXdjSW5ZcDFOMHd2OXdrbEw2NG9kSmswYXNo?=
 =?utf-8?B?RC8xa3MyYlROUU5aNXJGeEs5dlJyem1pZ2R4ZUIwa3JyT3FWR2lHY2wxbzBO?=
 =?utf-8?B?VUpvNlY1eVViNVN4RmtYK28wdXIrQmxPVTljT1NPYXk1SFdmcWNydk1ZNTFM?=
 =?utf-8?B?TUcvenR3RFNPaStMaTI5K1FuSVFTVDFBY1hXVGNWcEl4VWJiZkVPTVpVTUM2?=
 =?utf-8?B?WDJVanlMb1lEOUJTZkhQYXo3WmgzUXl3eHdBQ2lla0JCYndHVTM5azQzTVpU?=
 =?utf-8?B?SHMrOGxzZU9Dd3hvTUk3Qld4UmRyYTljVzRSZGg4TlE4VlFieFZvK2dhK3VV?=
 =?utf-8?B?V084MW1NZm40cDVOMEpTYkppV1pjV1VBWnYxQmdtLzBaVnVMMG5nclAzU3pH?=
 =?utf-8?B?c0ZqSnRxS2lNbnRkYXMyQ2VQWlkvM1U0RkJiWFFVSE1UTFdGWkxITEpTdTZy?=
 =?utf-8?B?QW5nckxpK09QSUxVeUtKMkJjQlRKWVd6QWt4WGlpbUhsZlc2R3RSdmtyUFRT?=
 =?utf-8?B?aXJnTEFpNjNVQndIaGF6RkVRaUhIbUlhMUNldUxwcVV4MXc4Q1JvbkRoSXdX?=
 =?utf-8?B?eHpVaUV4SkpTZUJkYmZJS1NUM0NaUVltRlN5TkIrcDkrTFdIM0NLRU13a1Rz?=
 =?utf-8?B?QnIvbGVqaFRPcUpPR2YyU3crN1RNNG5KdEUvdFQvUkxKK2R6cmlGd1V6UkIx?=
 =?utf-8?B?SjJrdkFoQ1dPZGo4QmxBcGZsQnp4T282RE1TaHhpZFZBbkwvcXNhanhhaHB0?=
 =?utf-8?B?RytOcWNpbXNPL3YxSjB4bExDS3BpR1R5eG1FVElYbm4vSHBQYlIxam1FYlMy?=
 =?utf-8?B?VlR1MzM2SEpwVXl2OVBRSGJOUEdFbllSTWg4ZmcyQnBIV1NvWHg1NEdYMTU4?=
 =?utf-8?B?OC9xSnV3WGhXUS8xUnlnS2NCbUR1bnVITldTYjljTTZKWjhVZ2h4dy96S2ZS?=
 =?utf-8?B?R0c2L01jS25JWVgrTWxUeVZDbGw4djBtMHVISWlQdmRvNkIxd0xRSUlBUUhY?=
 =?utf-8?B?allkdWhxTWNqTE9kR0xWYmJmR0NGU3haUDFwQW9vVndramZIZlgyMElHckVO?=
 =?utf-8?B?WDMyc3RUMVRuS0MrUkRmUWdDMndUdFZMT3dKSTdqVyttdDhpb1lWWktuWHZO?=
 =?utf-8?B?WlhGaVkxa2lDZTU5ZTZQMWo3dVFmcEVETVJRVE1lOGdTVkc5RzlmNWFlbHBR?=
 =?utf-8?B?VG9mR3FCYzJwQ2lsa2tWdG1PT1Z4S242RGpkRW5EaWJUV3ZhVFhBR3RJWTFJ?=
 =?utf-8?B?YnBBMmI5OUdBQjRIbU1uQkdKSVFSVGRUcXZRWWR6dFVDR0J2NEFXRklYdGZy?=
 =?utf-8?B?YkRjMEpXeWxxbmQ0anlHZSs2U2hUbTNjYUQ4YXR4endYcnA5WHZNZ2dpakhH?=
 =?utf-8?B?UmJ2RDEzdVFyRHRRU3hRTmFsRTFQRmVRV0lNdUQ0K3hKcEJab0ZLazNRVWFt?=
 =?utf-8?B?bVhIVXhHaFdSa0VYWjVBSTBiTWUrVURjSXJNcTJtdjRiWDUwcTRqKzZ0Sitj?=
 =?utf-8?B?dzhVR3RYclBIR3I0YXNOdVRkSWVDTDdnN0lNZUhwSTZSd09lN1BNNnlvSk5m?=
 =?utf-8?B?RHJqVUVpSGhEZWVTQ0htQ21ZbkFCZHdIOWVZbFMrdEt0bkY3YVgxNVRxdXpW?=
 =?utf-8?B?SHVXeGdQNlhURGJGVFNzSG5CSnhsdHdwelVCRVQ5WHdrUkxtYU05bWY2VTFh?=
 =?utf-8?B?RkJzV084TFBNcEpWQkxRMnhyOXhieXRtd1JVY2NvZUlzMzR2MTBSeXdVNUd5?=
 =?utf-8?B?UFFmeS9oc3V2bTBZVW11MlkzV3EwditDSmdveUhrQzNOMjA0YytubWdlYnRq?=
 =?utf-8?B?eWM2eHJXb29rQWZzYi9pUmx0UjdSZWh6bXgyaS9ISXpEV21YZ0Z1SjhYcGJK?=
 =?utf-8?B?bHBqVC85MFlIc1Zlb0ZaVHBNYWk0TFNzMkROUlZqcmVKeENwQ3doVURGUEJp?=
 =?utf-8?B?bERnUGlQMlBQYVl6T0hqRTBQdVA2VnpDcXUyWGh2ajdXKzdkRCtVWXJpOUEv?=
 =?utf-8?B?MUtsKzZEa2QvdzJDVWRpZTl6ZFZ3ZG9RdEd0VG1uVXNWTUhDVHFZUXRPTk1N?=
 =?utf-8?B?TWNDVGd3WnFUWDl6c0ZpaWtHYnFnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 17:05:18.9752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7df966f-cc6e-4d1c-d585-08de577cec9c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_090527_790161_558A2359 
X-CRM114-Status: GOOD (  24.61  )
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



On 18/01/26 15:19, Thomas Gleixner wrote:
> On Fri, Jan 16 2026 at 18:38, Aniket Limaye wrote:
> 
> The subject line prefix is made up. Please follow the documented
> conventions:
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes
> 
>> Some INTR router instances act as simple passthroughs that preserve the
>> source interrupt type unchanged at the output line, rather than converting
>> all interrupts to a fixed type.
>>
>> When interrupt sources are not homogeneous with respect to trigger type,
>> the driver needs to read each source's interrupt type from DT and pass it
>> unchanged to its interrupt parent
>>
>> Previously, the interrupt type for all output lines was set globally using
>> the "ti,intr-trigger-type" property (values 1 or 4).
> 
> What means 'previously'?
> 
> You want to describe the current state and not something which might be
> in the past after applying the change.
> 

Sure, makes sense... will update this in v2.

>> Add support for "ti,intr-trigger-type" = 15 (IRQ_TYPE_DEFAULT) to indicate
>> passthrough mode:
>> - When set to 15: Parse interrupt type per-line from DT
>> - When set to 1 or 4: Use global setting (maintains backward compatibility)
> 
>> @@ -156,11 +168,27 @@ static int ti_sci_intr_alloc_parent_irq(struct irq_domain *domain,
>>   		fwspec.param_count = 3;
>>   		fwspec.param[0] = 0;	/* SPI */
>>   		fwspec.param[1] = p_hwirq - 32; /* SPI offset */
>> -		fwspec.param[2] = intr->type;
>> +		fwspec.param[2] = hwirq_type;
>>   	} else {
>>   		/* Parent is Interrupt Router */
>> -		fwspec.param_count = 1;
>> -		fwspec.param[0] = p_hwirq;
>> +		u32 parent_trigger_type;
>> +
>> +		err = of_property_read_u32(parent_node,
>> +					  "ti,intr-trigger-type",
>> +					  &parent_trigger_type);
> 
> You have 100 characters and if you need a line break align the second
> line argument with the first line argument and not with the bracket.
> See documentation.
> 
>> +		if (err)
>> +			goto err_irqs;
>> +
>> +		if (parent_trigger_type != IRQ_TYPE_DEFAULT) {
>> +			/* Parent has global trigger type */
>> +			fwspec.param_count = 1;
>> +			fwspec.param[0] = p_hwirq;
>> +		} else {
>> +			/* Parent supports per-line trigger types */
>> +			fwspec.param_count = 2;
>> +			fwspec.param[0] = p_hwirq;
>> +			fwspec.param[1] = hwirq_type;
>> +		}
>>   	}
>>   
>>   	err = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
>> @@ -197,14 +225,14 @@ static int ti_sci_intr_irq_domain_alloc(struct irq_domain *domain,
>>   {
>>   	struct irq_fwspec *fwspec = data;
>>   	unsigned long hwirq;
>> -	unsigned int flags;
>> +	unsigned int hwirq_type;
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations
> 
>>   	int err, out_irq;
>>   
>> -	err = ti_sci_intr_irq_domain_translate(domain, fwspec, &hwirq, &flags);
>> +	err = ti_sci_intr_irq_domain_translate(domain, fwspec, &hwirq, &hwirq_type);
>>   	if (err)
>>   		return err;
>>   
>> -	out_irq = ti_sci_intr_alloc_parent_irq(domain, virq, hwirq);
>> +	out_irq = ti_sci_intr_alloc_parent_irq(domain, virq, hwirq, hwirq_type);
>>   	if (out_irq < 0)
>>   		return out_irq;
> 
> Thanks,
> 
>          tglx


Thanks for reviewing the patch.

Will send a v2 addressing all of your feedback and will note all 
recommendations for future patches too.

Regards,
Aniket



