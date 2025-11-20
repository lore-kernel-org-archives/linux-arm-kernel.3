Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18266CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 05:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cL0Dh91o1bCVwoX8NEcemWJh5bhQJzeBH1jlX3hGHiA=; b=Y99RCpi92z1Rxjyr4yI2rrp3f3
	EMC78TexLkqpK/Iy8B3ZS/U9rNzv+V8H+EqDFoJutyLs3gjH7WWfjCoB9yqMuqMyeEBI40HftGCaV
	2QrU3lc6Kz5l2RR70kRg+EBNpRhQdXFz4o6/W0DxFdZY1kW/JfLYqXGCC+ByqZvnOPQJWtsss3+Gm
	1FENPdaL+GQeN7YPklf2t9BloqFyi7ad7nA9tnQEuA7r9xCZECZ0e8DBnZiATZWZ88I1oqZ6LCCki
	R5s9JO6TnlEXRtMEMLOd73wYLzD+nU/eAP5lJIL8+C14HEOhOMxXc4O54cJ4S2xmbognWZbB2uw7c
	EeKqabOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLx0I-00000006AaF-25EJ;
	Thu, 20 Nov 2025 05:14:46 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLx0F-00000006AZI-3ABA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 05:14:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxVPaHok4SzBoEWNSsmVdNkBvvzHBTFhepLw+HT6HSSfspA7iwqFyT8ppDt74Vu2Y+JpRpOWXrl3VFpA5fq7LO/g4oLyIQZ+cIoNkzx05chD+v/1ugZY5/0vI2HfihnvvsFSGniy4cjods2TCsMC58dZwQ2pqN28ZmZTpmKc2bZIeaaFRI9zV91RttRuiuXmT5VhCNXZgaJb0hkorSCamN+XpYkcityl+i0t8r/xhbvbuxNu13WY+jLw9PspO/Q3gJmc54MG+EsH3m9jr4ZEJlINSUGKIgw9ZWdcc+nHinNlTl/7tfZq5QvZtaYtXTFl9EUA4sWm5UUXs9/oEUiEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cL0Dh91o1bCVwoX8NEcemWJh5bhQJzeBH1jlX3hGHiA=;
 b=OvILzlidzVv0eUaqYH5gL6G+QaXAgIVDOe0vhiEQKQcZsBgxs5xWNwD2wlNgD/RGG4jI6HJleyeebumPQo/4H+4RMQ1AX4HVP3K8jxyV2bFXTyUQplX/RVm2WVvgK/igoD78s1hbk1XmfNEFrpPmk/UlxDhh7+mJYfpIEfgqEjLyibMDSJjpYIj+jBTl/au/wkrg+F6+g2Um9UFw2Mv2DCGdBUFLuSR2nJ68MR4V5tnrpdGSC6g6/jnUh388bNq8dRm62sRTWwBJTvx6/yGWIWkNagucM1wc0RYndfV5CGldT3dGKuKGQnuAAKmCilsZas9eBzBS2f/5v0aHLKh8kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cL0Dh91o1bCVwoX8NEcemWJh5bhQJzeBH1jlX3hGHiA=;
 b=w51/XmYEAZSxp+8Iw1056aOiac8yNZxoakYECloM3Wgy7+nchbttQROFGq/JTQ/NuVLFkxXwgITgG85DYwBBmskqLWI87ZW999/ipgu8AdnwGCXXI1QCSGA+LD9kOtxxBhQqECzZiAqUHVLz67JSf0WVnB3yQTuXa9qFLyoV7Hw=
Received: from PH8P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::8)
 by IA0PR10MB7158.namprd10.prod.outlook.com (2603:10b6:208:403::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 05:14:32 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:2db:cafe::28) by PH8P223CA0002.outlook.office365.com
 (2603:10b6:510:2db::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 05:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 05:14:30 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 23:14:29 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 23:14:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 23:14:29 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK5EPLA3096606;
	Wed, 19 Nov 2025 23:14:26 -0600
Message-ID: <a8d1aaa8-9204-42f1-9e2d-3d20d5025efa@ti.com>
Date: Thu, 20 Nov 2025 10:44:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: Add missing applied DT overlay targets
To: Rob Herring <robh@kernel.org>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Wadim
 Egorov" <w.egorov@phytec.de>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251117211316.725960-1-robh@kernel.org>
 <002fad46-adb5-402e-8eb0-e4c71b862674@ti.com>
 <CAL_JsqJNOeKViuUwpLf-7RzBDB-EMm35MumJsGZ0deX1cLx3CQ@mail.gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqJNOeKViuUwpLf-7RzBDB-EMm35MumJsGZ0deX1cLx3CQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|IA0PR10MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: b7bd1e39-ea49-4efd-7fb4-08de27f3af72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2lMdEtFYVhjb3Bxa05SNDdkV1pLd1kxRmlTM3pVLzhmanZHZ0p2VThETWtz?=
 =?utf-8?B?UzZsQ0tNa0o1ZXlqRFBIdnF3UkJVRVp0OUZOeldqMzgxK0JXUUl1VStra2VT?=
 =?utf-8?B?N05kb2FSTUg2alhLVW9vdmZWb2lJQVROeHlwTDljMjI1N05KcmtYVkR6azdM?=
 =?utf-8?B?UXY2aE9DKzc0SXpJWHVrbWNOOXo1b3NESm8yc3RMVFY3SkkwTkRhTzlCSk1i?=
 =?utf-8?B?TnJySThVdk93TkNjQk9RMFpUZWFUcTJOL0NveWNWZW4xYnVEbk00TWhocytD?=
 =?utf-8?B?RE16b1J4VkppVlU4Q2hQUkV6ZEVTQ2hCMkJLMTFnQk5xYndDU1dLSDlwL2E3?=
 =?utf-8?B?Q1ozVndkQ216M1BPeDBPcUVtbTdMcHMrU05CZlM1MlBSci8wN3ZzTWJJL1lv?=
 =?utf-8?B?R1lxUDlPSjJxV3FSWS85RWhJaDBjQ1AwT094UnU5WUV2R3g0NUFrT1RTLzlR?=
 =?utf-8?B?VW1RcEVYL1lLWkcyRXpnTmtNY0thVlkxMDEyOURhOHpqT0NuR1pFQkh4RDdF?=
 =?utf-8?B?eGR0N2N5c1plYVd5R2IwckZMQmcycHRFYW1kNGh0Mno1VGl5V3lHcGFxOWFm?=
 =?utf-8?B?OWxCaTZoUThYL2Fjay8yZEhvdHl4SEN6ZTFpeGdic2g4eHZZWkpMakJ4eEJW?=
 =?utf-8?B?RXdZYmlKYzVXb2RXYjFJV3l5RlYzWWVQcUdCdDZMdmxnSit0U3doRnd6MDFW?=
 =?utf-8?B?Y1VIR2VCajh3a1lyU09UNEUzZERGbjhBTFRsMmRnaFlPeVY3bWczK0dxNUhT?=
 =?utf-8?B?bkw4QmZqK08wVjVaWDF5UndtNDRqL0dPSThwaWVIYlFnbWl5Y3RFbnl5Mkor?=
 =?utf-8?B?TlV2dUtXTTVMUVExRUlUK3pXRHNkWXNVWHMvYm43RERmSWRDejVvb0FFMXla?=
 =?utf-8?B?ZXVHOEpNb3dlMWJvTkk0VFh2REphTHBZNC92VjFzZ3NDMlI1VDVSc0tVdCtH?=
 =?utf-8?B?RllpMmxYMkpGblFxaTdoaHdsRjg3ZTlGZk5vZmluL2lxZzhHMHdiVkJ1elIy?=
 =?utf-8?B?VXBIY0RvNktRakRWWHVucGRvRmd4bHBRVG0wY2RsSGpZcmtwbjdxc09NOVV6?=
 =?utf-8?B?aVZNNjRiQVNBcE9UT3h3Sk85a25HTSt4ZU5YSER6SExiWFlVMDRPTXExbjZZ?=
 =?utf-8?B?dWVOZTh6TWEzQmxVVDUrK3R1TlN1NW10L1J2dUFYYU93OFQ2WlZYV0h4YW8w?=
 =?utf-8?B?RHlnakJsZTY3dFFTT2dyR1htTG1hZUZYMFdBYkI5YklrWVduM2VhajRRTEI3?=
 =?utf-8?B?empJNHZZenFSeUVuZTVETVRkM2JLcHBhT1pUNU01Zk5QcmR0RUpGQzdrTGpM?=
 =?utf-8?B?aDNhSFBYSlVFcHJhRXRwdWkrOFJXeTZpWEEzWHlSQUhIMjVmL0s2MEJMbkFS?=
 =?utf-8?B?Sm0vcXJkeDBLcmdqdkRCVmtkcDhOcGJ4b2x6WmZzaFRJNjRkSHpiVGdCNDdJ?=
 =?utf-8?B?cnJ5azc3aWR3RWpDN2RuKzJOWWV2Vzh5Z0NTTFF2eFZmOU43Z2xSWTRWd2hQ?=
 =?utf-8?B?dkl5WjlQNUpaaExCdlFMZ0hYalJ3MEJvK216NmpNMW1ta0ZpU1lFUDRIUG9q?=
 =?utf-8?B?bXdISHV3Tkc1bmJiQ0FIT2M1VGx3bkw2ZVZXNU5PbDVaSlR1WXFDRE1vbjdk?=
 =?utf-8?B?NzdVSlZpYVBQYVBQeFlEUnVTaG55c0l3cHlYRjBXcTc4L3JxLytGVSt1R3BK?=
 =?utf-8?B?MnNKelZDMVpsYXBUOERGOWExd2R4OVFVd09kVTVxMGNITlhETThtOHlwbEx4?=
 =?utf-8?B?RFk4QjhUNHpnS2lzN0JocjBjN2VNeG80Qlljd3JOMXVDNEw3KzZpMUtjOHFX?=
 =?utf-8?B?ZndkZ2pKVm9ML0NsSWxvR2F5V2x0UWZaTDAzZ3BGTC9XYWhpT24yQ2crRjk3?=
 =?utf-8?B?bEtqWkJMVSs3N1VVZzhBMWV5cXcrMHhCczVUNFhRUlYxeGNYeWx5KzlreCtn?=
 =?utf-8?B?ZlZWdEZtL3BWUlF0UmkzSUVuWVJUcFp1c1FNVEU1bEVKdWRTNy9DYVJtN3Mz?=
 =?utf-8?B?SDRJbitUTmZjMjRZT3BBQ3E1MktzRkFlOGtPczIxSEVJWHM4MjdYaG9sek9z?=
 =?utf-8?B?Z0dQZkdxTFFRbndhYWg1TU5JbVMzdWRna2RYQkhkQkpEWS8vYVlaUXhaUGhI?=
 =?utf-8?Q?yPdA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 05:14:30.6773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7bd1e39-ea49-4efd-7fb4-08de27f3af72
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_211443_894384_A0A6A633 
X-CRM114-Status: GOOD (  14.13  )
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



On 20/11/25 03:26, Rob Herring wrote:
> On Wed, Nov 19, 2025 at 8:47 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>>
>> + wadim who posted something similar:
>>
>> Hi Rob,
>>
>> On 18/11/25 02:43, Rob Herring (Arm) wrote:
>>> It's a requirement that DT overlays be applied at build time in order to
>>> validate them as overlays are not validated on their own.
>>>
>>> Add the missing TI overlays. Some of the TI overlays have the first part
>>> needed (a "*-dtbs" variable), but not the second part adding the target to
>>> dtb-y/dtb- variable.
>>>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>
>> Look like there is more needed change needed.
>>
>> https://lore.kernel.org/all/20251119123216.1481420-1-w.egorov@phytec.de/
>>
>> Could one of you post the superset patch?
> 
> I'll leave it to Wadim.

Probably best to merge Wadim's patch first and then then delta. I will
take care of posting the next as TI board targets need a bit more tweaking.

> 
>>
>> I have already sent out the PR for v6.19rc1 for TI tree? Is [1] plan to
>> be merged for v6.19 cycle, if so I will plan for a follow up PR with
>> newer version of this patch.
>>
>>> ---
>>> This will soon be a warning[1].
>>>
>>> [1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.org/
>>
>> BTW, with above patch, make dtbs seems to fail w/o CONFIG_OF_ALL_DTBS=y.
>> Is that expected?
> 
> Yes. What's in linux-next now is fixed.
> 
> Rob

-- 
Regards
Vignesh
https://ti.com/opensource


