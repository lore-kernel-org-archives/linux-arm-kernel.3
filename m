Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2242BE83051
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 05:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nap07RHb4rM+hKSHVTqZcqGFHxc7m4waNZ0DBiX/gOg=; b=KmUMyQOd6x1RHMgmnBnOvw5A5D
	jz/3Dh6EhnwBYWVZh5agPsfRN2oOGKTPETxCvu61P9s7pAA5RxyAgRJjeBkxhPl2t2h1ek0ALhiJk
	b63bfu5+VGpiXDnYxSiH0IoDmAYyV56oZhAnzvaiduOJn8SRYF0REeKQUGj8iwExlw9c2PCMx3dGD
	NQXZIxDleazgkhMjXm20zAZJ9fyErOIiZ5ggkaZzJwCUBVPxVkSGGi6qzLwHvTxEQ/qchsEffNkNa
	jJ8oHy0eyLt89cet90QIBHtvuhgkgxi/P1XMsO4i66TQBlQhN6mmyXzZh2zbFRbjdmaZavGyUMWnK
	3hi5FfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn8c7-000000064ee-2hVe;
	Tue, 03 Feb 2026 05:06:11 +0000
Received: from mail-westus3azon11011014.outbound.protection.outlook.com ([40.107.208.14] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn8c4-000000064eI-0zsF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 05:06:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckpp6RzwHLOTsxljwRCAw5Pp1cnbzJe+S9mbHNM53znN47LzqxZ8aVvIpIVRZufLUFhlKs0Xmcm+yH627hivig/nf0L+t0f3jlMwXltRKqG/VcZsdHZFu8chw4p6TZUITFdm1xoJy/VAEf+TATVBvEtF9UH/cFLdRDhHczLyaTC7NEpow+LEhg1qmmqazRX37184+Uo/D9H19QGEb+lwcaPPOYc+b0uzKHCuYGIkHWB1Ohsad+fMBZp1eaK9zJ5EnW21uk1E4n37oqhVeVBePZwkkvuRJIJjD684k1/hgxJMopms7WOvqqmSHmPoDdTJTqKSj5gI7EKLAeMhIvDpTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nap07RHb4rM+hKSHVTqZcqGFHxc7m4waNZ0DBiX/gOg=;
 b=JZ0eSzz2haS4AyGTIk8CqhuYaH9AqrghS+yp5+2hneXosCXFItMqkbQXiigZafAbUuC/gtjD4mNFgYl7vxezp0uqcCK6sWsVHXQfTBsr7Qg5yqeBbjiKFWr70dBTSh4eyPuyvgxuy2gvIPWRaShALJj3WJRKdNIPkU6HwSGO+myKdBO8itoxMLLQmBQiouzvnP0nW+4n443oUCvVOE4r3QEBpJ76QlRV9ai1TUGJQ0T4jpXAuRgZvFIk36/LfugEZRBUvMLHkWB8YAF4WkV7sQJFXXYR7ijTzel71L2bIKWDzcoK3ASqX42Rt1dI/2PaUATlD2Zq0mu8GfsY5XI7EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nap07RHb4rM+hKSHVTqZcqGFHxc7m4waNZ0DBiX/gOg=;
 b=hBSzrmWMxJ3+EvR5EK4yUnoV1DDD10e/FSDwD2FxU3RCrad96BSawzy4sdpX9HTWV2NdYQYpPvXW8r9nqn4f/sr27TdvEMVpNeOVdC+PmTRoX5Xng8etfcBWT2lF1MGSLT8sF7qSui0a9jDkLfVQ7pkcJPT5EkauMumD/BC3g58=
Received: from BY5PR17CA0035.namprd17.prod.outlook.com (2603:10b6:a03:1b8::48)
 by DS3PR10MB997750.namprd10.prod.outlook.com (2603:10b6:8:347::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 05:06:02 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::24) by BY5PR17CA0035.outlook.office365.com
 (2603:10b6:a03:1b8::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 05:06:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 05:06:01 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 23:05:56 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 23:05:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 23:05:55 -0600
Received: from [172.24.28.167] (lt5cd2489kgj.dhcp.ti.com [172.24.28.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61355qTw3353316;
	Mon, 2 Feb 2026 23:05:53 -0600
Message-ID: <10988add-dd63-47ca-ba5d-809694171f33@ti.com>
Date: Tue, 3 Feb 2026 10:35:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721s2-common-proc-board: Add QSPI
 flash partition details
To: "Dutta, Anurag" <a-dutta@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <gehariprasath@ti.com>
References: <20260121051855.5890-1-a-dutta@ti.com>
 <1cc180ce-f808-4018-90c7-8df2c46ca94c@ti.com>
 <9675d81c-12f5-4798-bad9-ecbb2349bb60@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <9675d81c-12f5-4798-bad9-ecbb2349bb60@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|DS3PR10MB997750:EE_
X-MS-Office365-Filtering-Correlation-Id: 135e1420-caaa-49c1-c976-08de62e1ecb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTl3cG5RWTNSbkIxOUZHQ05jKzR2elREeWVtRmtoYUF3UEJtckNnOHg3amJu?=
 =?utf-8?B?d2V5a3JHQTZCUGlSd3BJWGRuWFF1NjBTUGxqc1pqYmE5cENPV2tCSGJzNGh0?=
 =?utf-8?B?TzdNOFh3akZHL2locWs2NEpDSnVZaDl0UzRNM1BqaEZCK0xsYXluTS9wZUtL?=
 =?utf-8?B?MzFNbGtsRjBjcFp6RThWdzZaUURGUGxNTUxITVBJWnJkQXlxSHVSU1VUb0dV?=
 =?utf-8?B?QkVmeThRazZnZWl4eUYzeUQyWC8zVFhySFNqREJwTFpvUk9WVy93SktaQjNj?=
 =?utf-8?B?NHMrVkUyZTNQYkVNbENPZ3N6M2Y2cnRBTVdsR2lNZS9TZ3V0blRJcUQ3ZW1v?=
 =?utf-8?B?NHd3QTFpT3BsRVpzaHRXL0ZVZ29BcmNOYi90RzhxTE9NdHV4Z1Q0MWNpWkFt?=
 =?utf-8?B?RUUrQ2JTdEloMThBeFVUeFJDODQ3Mm0xM3I0SmRyWUtVNk1aZ3JtRXlsNS9i?=
 =?utf-8?B?SXRMT1U5TDY4Vk55a1RjbVdNUnBXQWEwVnlNWmV5cHRvSXJBUElTNXBSUFJ3?=
 =?utf-8?B?VklNaHhOVDhxNUVEK0F1Qmw0TktBMFFqNTA3djZwTU1PWjdGZ0ozUnVxcFov?=
 =?utf-8?B?VCsrMU5QcHZsVHNvTkY5NmhGMmUrWms5UkF1bHlQaWtMQmRTa0xhaXdmd3Ni?=
 =?utf-8?B?VWNGUkY5U3M3YzZWOC94TTlaS2ZSQ284NjlRQ3RHeTBrWnpKYlg0ZTNqM2hT?=
 =?utf-8?B?VWF2SG11VE55QUN6RGdDQTNNdUJzV3pYUEpFN3AyaGsrbnBsM0NRR0lEU1p5?=
 =?utf-8?B?SGJOc2RzZ2R3elozSnVNaGhiUjFRZ0VGMUVOT0pUTGgwWXhKM0xMelNNZHZ0?=
 =?utf-8?B?TnpnU1Z2N3BDbTU0bDdQUUNZN21WYUNLc0ExVDBsbjA0dkNXT2hpbVpoT0hW?=
 =?utf-8?B?UjhuOWE4VUdLSENuU1ZjeUxkOXFzYlVrOXlEWkxxNDFhcFRmQWJFQkFQcDlu?=
 =?utf-8?B?eDJXNWV4YkdIbUtGRTNETUJFbGs5Zmd2aERIR25oMXF2OEdMdU1pakVmUWU4?=
 =?utf-8?B?QVFIbTV1MmZKSWRMcThibGdMS1VYVjdRSWd3RDlEK2R1Y0JIY25pYUNSanF2?=
 =?utf-8?B?WTk0NjE3eFRvcm55eW5HSmJ5ZE9Oc2FwU2RRV2tYV2FPM1ZETSszSGVaQzNY?=
 =?utf-8?B?eGNuWW9lUFFtWTNmb24vVCtIeHp4UEVyRDl3N3k5M1Q2M09hcGk0dndrU2gv?=
 =?utf-8?B?OVdXY0hvMmlPR082VDNEdit1dU1LM3pMTCt4WHlhbVhQT1RVQUNrR1h4Mmly?=
 =?utf-8?B?T3ZVTm5teVdiUW1FLy9DTzhvak5IbGE1K1ZZcGw3LzR5YXhsdDVCSVlLMkwv?=
 =?utf-8?B?aTNTanp5RlhJYkxJK3lLVkRqOWV5eldkM3ZHSEtSbzRxQksybjBIWWtqRTNh?=
 =?utf-8?B?NHVJRy84aHVuTFNoeUowK0x0V2Vkc3l6bU8zVVIwcjZ4SmFHdkdBeHBsSTZX?=
 =?utf-8?B?clNTNnZGS292NEZZQ0lhWVRpV21mWnpubkFYQU5zK3RrSld3N1BnN1RjazNM?=
 =?utf-8?B?WWNHaFFOc3RGcWRFajZ4Rll3SUkrcVRsbjF0eGtKbkN6ZHFmblBOM1Fab214?=
 =?utf-8?B?STNwU0xuVXNaWTdNTHhUVnBqdEx3MWNBRUQ3SzFveTRFNkdSRytDSVFzRGRX?=
 =?utf-8?B?elJyd1FVSHlFUFlCVUFWYWRscXVjYnZGZlBpWVpUYndUZDFTYTdBNjNjR2xG?=
 =?utf-8?B?RVA4Z0tjMm9vYkJtZEJjdWZnMGQvOG5BM1NFMCtUa0dGRUhlOHZ3eURxQmVC?=
 =?utf-8?B?Wm1pMHpzWlRLQS9JSFNxQ0JueGlsMTQxSk4wUVA2OXZpa1pCRjAydmliQS9E?=
 =?utf-8?B?L1ljRE4xdDJGQWtmVjRhNWFycnA3ZmVWanViNnJ2SDRyQXNwVnlmTXMrdkJJ?=
 =?utf-8?B?dzRpNzZEeXdtZnhwUENWc1RWV1VPYUljNjcvWm04eUdsRVJnT0tJQVdiMXFp?=
 =?utf-8?B?emxwajlMclRvVnE1NTQ5K1F4bjU1R0JSRi9iYVV6OStjOFFlcnV6dlZjcjBo?=
 =?utf-8?B?V0RLOUJUOGpTZXFtK1BUWExWMCszZHU4am5lOUU1RXpPN3ZPUmhGZGVkb2ZM?=
 =?utf-8?B?VTIzSzlyTFhpVzZ4VHRHQVBWVml1dTlhTS9WYXQ0WTNlem05Yml3MnV4L0lz?=
 =?utf-8?B?dGovM3BwVlcwelp2Y09RN1owaU4vemFlZjJBTFZ1U1VIUlFJb0d5eURpc2ZO?=
 =?utf-8?Q?ZvByjFiJy0KyilpimY30/tM=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fhV1X36GUSUhDnwuGcsx/0yDyQ2NHeepoX6IbP/YrfTvS9No0djIb7J5LUBbD9WTpmfyJpxrI8G+8VtQ+Uim6srGvJ+J2ZT/7BccSosypDo5FP5kBazGs6N/weEMOzKMfp09rP7aQszqWqQ/wX6XwknpNp8exrWy+Mt72z7dBi3sNcA7Y92xh29cl69TkvaXS40vIFpD8zy/t/8imYNVHofvSto/sOaoFoXkLjDw6N5gtLfyrWtg1ow6YEjUDa5ISXuH9IoZCgSgmCHnyPnnXtIgQSU+Rcv1Av5lYWrZ3bOM/SmdnSY+71XFCh4530Wh+t6s2iLe87GOxltgigpVCWnEoyYeE6vqrYCRhRIRtgV5tmXly+a+WVthAmB0KStaa68WmX2gNmAJBOOiJ0Qh5g/2Nzzm0fbIUeXXLw+4wtBjevSbgENlwzIuDidn25xm
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 05:06:01.0375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 135e1420-caaa-49c1-c976-08de62e1ecb5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997750
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_210608_461174_A417499D 
X-CRM114-Status: GOOD (  12.24  )
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


On 1/30/2026 1:30 PM, Dutta, Anurag wrote:
>
> On 22-01-2026 08:53, Kumar, Udit wrote:
>>
>> On 1/21/2026 10:48 AM, Anurag Dutta wrote:
>>> J721S2 EVM has MT25QU512AB 64 MiB Quad SPI NOR flash connected
>>> to OSPI1. Add the partition information as per bootloader.
>>>
>>> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
>>> ---
>>> Test logs: 
>>> https://gist.github.com/anuragdutta731/b65f63f22c69317d714b65a201438cbc
>>
>>
>> Thanks for logs, but these are for boot-loader and I don't think 
>> u-boot consumes partition details.
>>
>> could you share logs for kernel as well.
>>
> Hi Udit
> Here are kernel logs : 
> https://gist.github.com/anuragdutta731/d4ee38df3ed8889f44bf28ab163b1baf


Thanks Anurag,

I think, you need qspi.phypattern under bootph-all, as I see u-boot 
stage will/may do phy-tuning.

While at this, same thing needs to be cascaded to ospi flash as well.


>>
>>
>>>
>>>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 41 
>>> +++++++++++++++++++
>>>   1 file changed, 41 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts 
>>> b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>>> index 4fea99519113..7faf9367dbb2 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>>> @@ -530,6 +530,47 @@ flash@0 {
>>>           cdns,tchsh-ns = <60>;
>>>           cdns,tslch-ns = <60>;
>>>           cdns,read-delay = <2>;
>>> +
>>> +        partitions {
>>> +            compatible = "fixed-partitions";
>>> +            #address-cells = <1>;
>>> +            #size-cells = <1>;
>>> +
>>> +            partition@0 {
>>> +                label = "qspi.tiboot3";
>>> +                reg = <0x0 0x80000>;
>>> +            };
>>> +
>>> +            partition@80000 {
>>> +                label = "qspi.tispl";
>>> +                reg = <0x80000 0x200000>;
>>> +            };
>>> +
>>> +            partition@280000 {
>>> +                label = "qspi.u-boot";
>>> +                reg = <0x280000 0x400000>;
>>> +            };
>>> +
>>> +            partition@680000 {
>>> +                label = "qspi.env";
>>> +                reg = <0x680000 0x40000>;
>>> +            };
>>> +
>>> +            partition@6c0000 {
>>> +                label = "qspi.env.backup";
>>> +                reg = <0x6c0000 0x40000>;
>>> +            };
>>> +
>>> +            partition@800000 {
>>> +                label = "qspi.rootfs";
>>> +                reg = <0x800000 0x37c0000>;
>>> +            };
>>> +
>>> +            partition@3fc0000 {
>>> +                label = "qspi.phypattern";
>>> +                reg = <0x3fc0000 0x40000>;
>>> +            };
>>> +        };
>>>       };
>>>   };

