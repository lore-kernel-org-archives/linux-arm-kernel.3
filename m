Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E48CD0416
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AYcEVELS6bk/o08w1DNN/aZSOkiS8/qtk1xy1i3nuU=; b=GUKh+2k9LYGajz7hv9SPp8gS06
	F+P9ZpXT9aJN/ekPi/WtH0prhTOttCfZ3uz+4cl1GVuyvlyqA5T9pI/O7UqCsH5WtYyDo1ViVQq81
	/6BqQa86euNs2R1dEM1OxHT/cDy7UwGKlSLdfkhoP/h8reI0Zd6CNXttLTIvMQiBX9yqMgEV+heMm
	y9Fah2L4/Jgc1Tl3N8vVjSZxWFuuY5KU6Nw2kgTF8met9TNbygW2obA/BLYkWCz4Qf1IzjW8UR5W0
	G+1GwuOv/snaygIq6OfphhLqUydfdtk/ExhX+3f2iT6gh8ivRKtgbwSx6LN+RxJLkyVQipGzvxJpO
	Y6lavHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsqP-0000000C9L1-1W1i;
	Mon, 05 Jan 2026 22:14:33 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsqN-0000000C9Kg-1bSL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:14:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvKvKYcwTCQ8Ueaua5g3xL/VuDh2TcPBlva97LdUmtLwwSBPU0O0w32r148UxAbXmUFlMHj+AtNmkrF5di+Qsm67A5BzXuRRIjpF+3VSZiyPXgeT0l+IecEJAWDmtlf8y7mxAw5MDhtNuPU/lHVwP31N9QBCFapDP2os2F+nUzhXIq/wBEca2bLpj1DaKfXY0e6YSRjAwfM18FlWuOnyLMBecEWCuV8Hj0WYXXcDmfD+IZuecnXbHO0CIbCEe938SR1tig6TeRjoBEwO0p7ZhbAUzaGKpUVsrMTAWFAkSA3AN4RtOvFd5g5D9Hb7c+K92ci5l5lMhASegvmnaHk0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AYcEVELS6bk/o08w1DNN/aZSOkiS8/qtk1xy1i3nuU=;
 b=vZxxaFYXywWEhXtscp/oxntuMMTq9hDvYjcVvyNTlkqnDgy4ekUflzeyxzSif4dPUKKal3+YVE7d4l6JDnOn/Zpqi+ybBV9jL/T+dM19YYof5jDS57JWtzFOMXtySh9GP3gqMr7Os81KRAMdvta2YgP3eAC4WeHnxA9loL4UkjZYVnMPSny1+W9DseXnqbFwUykIqJx5CaA12LvHFjIB1zCiq6T0N+9Oze0fPsVMum97eAnGjmJGch3K9UaptCQHhpyxTCpM+OhyUriqvJ5HR+GMm/FO0br2smsDhPYKvSpwD5e4UsjktOhnk+uyjG/GwnemabcIjOEO8VLttRNXwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0AYcEVELS6bk/o08w1DNN/aZSOkiS8/qtk1xy1i3nuU=;
 b=Vs2wmBBOW+nBZNi4qLjLtgOpBYwDyKImPdDM1FhzpB+snjAbo5fSoEKaSqH9xf5KWAATj05nyYV7uqzTJgfb5q+egEuegKBpvPCqTJIEaxuk07FmEbJMJ5cL1zw4+YwW/tkg/4xuGXPyZlMLQLgl6GPIkjslayCJ60fPHSnBLYs=
Received: from BY3PR10CA0011.namprd10.prod.outlook.com (2603:10b6:a03:255::16)
 by DS7PR10MB4911.namprd10.prod.outlook.com (2603:10b6:5:3a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 22:14:26 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::1b) by BY3PR10CA0011.outlook.office365.com
 (2603:10b6:a03:255::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 22:14:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 22:14:25 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:14:23 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:14:23 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 16:14:22 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605MENB01977329;
	Mon, 5 Jan 2026 16:14:23 -0600
Message-ID: <a2e87f32-b8a0-4a91-9db3-fae7d43b2ca4@ti.com>
Date: Mon, 5 Jan 2026 16:14:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: boot: dts: ti: k3-am62l3-evm: enable WKUP UART
 wakeup from LPM
To: Bryan Brattlof <bb@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
 <20251230-wkup-uart-wakeup-v1-3-cd6e15f8d956@ti.com>
 <20260105140128.bd5tiheg3k6y2tyd@bryanbrattlof.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20260105140128.bd5tiheg3k6y2tyd@bryanbrattlof.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|DS7PR10MB4911:EE_
X-MS-Office365-Filtering-Correlation-Id: 01e7bac4-b7a3-4665-77f3-08de4ca7c9b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG56T0hBVWVKRTRYdmhrK3RhNllTRUlKK3JXT3hCQVV4ZytjQmNDMm5qSkYy?=
 =?utf-8?B?OUZsbWp5UFBYd3lPSmY0VW5JSTU3VjFlMCtrZ2hVQlhmNEtsWkxxb1BzQmJ1?=
 =?utf-8?B?TW5aeitRMFJVWWYrcHZrRXF3OHVOK0lSQzBUcWs0UWlhSXdiTnVvZmJXOE5l?=
 =?utf-8?B?a2d5NHNWSWtoYnZjUjVLUGMwQlBPTXd5MmhwQXN3QUp2YUlYQ0YwUUlMYVRE?=
 =?utf-8?B?dHhjSk9UODZ4TE9vQVNKYTJoRnlEeEZaVFA5Q3RWSHdzVzFPV05xRWZMc29M?=
 =?utf-8?B?WlVqeUxCeUh4QmxTcVNGOWNFd3lWSmU4NFh3Ums3L3BKTTVWTThWQ2FyNnZQ?=
 =?utf-8?B?YzBHMmRhdi9mdkNjdnJuSGhiL01GMG13TkU2bGNDVEZ4Y01EYWR4TVJ0SW5l?=
 =?utf-8?B?Y1BwOHVnSDZQTU42NmdMMU1JbkxSWHBnYi8yMXhIWWNVL1JTcHVUV2RCbXZW?=
 =?utf-8?B?aERXaFhlWTMwQXBtZGtDeTJGa1cydnNvYlFOOHh2OWhXYkdpa1BWV2pSSkp2?=
 =?utf-8?B?WWd5Z1c4dFhneXFZdnMwVG84UXJybVFzWUEzOGZqWDVyVUk5ak1NZEYwSXA4?=
 =?utf-8?B?aGFBQ1BQZytPQ1JDbmNFYkZwNkxzVjR1L0g3cjU1L3IrcWovQXg1ZUtueWVG?=
 =?utf-8?B?MXZvSTkvOXpnSXZaaDQ2dklOb21MN3laKzJ2dkJGT3RYQUZMN25KelVvS1hY?=
 =?utf-8?B?Q0RMdFR5eThHOGJzUjgzc1RKSHBNZWdUSEg5dHNKWjNMa2ttZlFIOWVURWJW?=
 =?utf-8?B?SEF0bXRFTHR6Zy9uQkZBVmoxSm84VjdLblZhWFVVajBRV2UxVjFzNlpOdG5v?=
 =?utf-8?B?REMwQVpVcmVCektLQXF3THllWlB2TmJ0UzJBM2lMYVZGUTJKWElDV1NIOFow?=
 =?utf-8?B?QldrRkNDby9aRCt6dDZWRGJzL0Qwa1k0RUdmM3lHb0VZU0VvTnVjRlI4NmpR?=
 =?utf-8?B?RlI2bVpyUk40S25LS3BPeEN0VGpEK3A3dTlOVzV1NzZpamV6R1RKcjNGYklv?=
 =?utf-8?B?TUFnc1Z1SUtqZWU2WHBEeHM2emFaM2NzTUlJR2FVZWEyR3BVbG8rZDRveXpT?=
 =?utf-8?B?Q3lzRTJDczI3TXp2Tlk2cWR3dDVOTUY2R3JlNUp1QzYvVVZ6NG8xSFF0akFF?=
 =?utf-8?B?aE12d1RjMnJPSzdnSUVZRzJqd2xJNStGbXVDNm03VTRmc1NEaGNGc0ZWcUhr?=
 =?utf-8?B?UjMvRmZEWXBIYzdLK1JvNXJkdUhaS0Z2NnYwV0lCcXRFbi8yM2lSYTBENGJM?=
 =?utf-8?B?d05GUWZzUU1YTXNLd3JJYTFNVklaU0VKNFNYTG56azlDYlhJaHczblZnVHZG?=
 =?utf-8?B?dU1oRERTRG1YUWN1MUlYc2VjaTVheGJJVmgya09iaGFMSk9qdFYyR3hCbjBa?=
 =?utf-8?B?eTUrUXpKZGtGZmZyVnBnMUJmS3pvelpPT3BDS0d4eXdFaVYyNit5NXpJdjN2?=
 =?utf-8?B?TldsQ3dTR08xQWVDa3l5UEgybnNaaXVMOWtUcnBGLzE2ZHVCc1JtQVprVHVV?=
 =?utf-8?B?K0M0b0Q1bVlsVUpHS2FVWDVuR1VnS0pYOEt2a1RzVzVTMVBCVXVwMUtKQTRm?=
 =?utf-8?B?YStHbElGNDgwYTFFRWovZmVFQmhxSC93b0xWaXBENGF0SC8rZ0Vyc0ZqVHoz?=
 =?utf-8?B?bDFVSFR2dmJzeWp0RHN0MTI2SStGS3N2cDlKQVJFc0lld3dzN2MyTHZnalph?=
 =?utf-8?B?dlpaT0M0QVp3aHNjbWRIZGl5eXdiMnZNQ0VJanRiamdpVlNFTEl3WnR4Z0hW?=
 =?utf-8?B?enl1eEF6RytYS3dkUVB0Vk9WNnU5K3Znd1hHVFZoSnByMlc4NzY1cXhXUFZM?=
 =?utf-8?B?S2R6ekx2TjlKbzczV012RENsR2hNTXRVOVRlZWpvM2F5cVRIWjlzZzFNd2FG?=
 =?utf-8?B?bXpaczFWWll0YklDSXF4OXNuY0RSdzhkcjRrZmFteUdPcytRcmhNdFFaaDRq?=
 =?utf-8?B?eXdEV3R4emIvOTNIZzJ3MXhJRlpyWmpmVG5lb3VMMHJ2Wk41TUFKVFBleTJY?=
 =?utf-8?B?Wlp3WTB6UXVRR2ZuNWhSNEJ5RHMraElNK2RqL2JUcHhmeUhVRUJXbWVIck10?=
 =?utf-8?B?bG00VkZhUmE1VTMycDFxay9ieVRwUysxSHJuYjR4M1A5Nm5QajhBYWtvMHhK?=
 =?utf-8?Q?tb0o=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:14:25.9910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e7bac4-b7a3-4665-77f3-08de4ca7c9b5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4911
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_141431_462339_E44DBE1E 
X-CRM114-Status: GOOD (  13.75  )
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

On 1/5/26 08:01, Bryan Brattlof wrote:
> On December 30, 2025 thus sayeth Kendall Willis:
>> Change the status of the wkup_uart0_interconnect node to enabled. The
>> target-module node sets the UART SYSC and SYSS registers to allow wakeup
>> from WKUP UART in DeepSleep low power mode.
>>
>> Signed-off-by: Kendall Willis <k-willis@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> index cae04cce337366b50928d39b0c888550b14e43d3..02b1a1c76b2ee05d49cd69d199a6aacdb1973fa0 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> @@ -359,3 +359,7 @@ &usb1 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&usb1_default_pins>;
>>   };
>> +
>> +&wkup_uart0_interconnect {
>> +	status = "okay";
>> +};
> 
> Does the UART need to be enabled as well?
> 
> ~Bryan

The UART does not need to be enabled because the interconnect target 
module manages the SYSC register which configures the WKUP_UART to be 
able to wakeup the SoC from system suspend. This allows the WKUP_UART to 
be wakeup capable for the SoC even if it is disabled by Linux.

Best,
Kendall

