Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72913CEFCE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfZf4xM9ouK5t9jpAMUBTEIKO61b+KAwbaWEQezz0Wo=; b=BLUY0qA6lQusORxceLQ5d1Z9DE
	7apDzHy7LFhHefl9W+YK+r0uC2WZBAWAMba9VfvoZFVh7lgXAEO4q0fGmjpy9CTCEroz5f2fisPNN
	3yFhgl37wFkpJnUQnLAdhgIYrySC4MQCCWO61bCnnv1VG91xJ4SEWcSjeuzmfJsXdLLJfe1oAcSiu
	7kBJOZN2mtKayOMVKSX7sTNyF9klQ95wb+0jlgvbuRNoceImUM5xQKUK+vIwhZ5KOUw0CqjPSpoVL
	fAIQqbaIvUIaLTXhjKQrvfCWFaa0/FTpo5Dg/BDTWZRF6yvi5/iZi4zXx8O2eZ6cEWJkrB9HVBws6
	ivj2FQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAaF-0000000DYEd-2MYu;
	Tue, 06 Jan 2026 17:11:03 +0000
Received: from mail-westus3azon11010053.outbound.protection.outlook.com ([52.101.201.53] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAaC-0000000DYDw-1cEk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:11:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrgUsJQGm5M4MiE27R1tvrg4G+H8+11GPQLO7XRq7I3zHylVUPqlaz9BrcJaBz0YCSHUBpHS2exyvohu8SIWeVVJDukqSphY9D7nkV0VYQTmYIvEYhChPsNl8ML8Ob96uwtTl+wsYL43JF0gxGg34x9xCHbxw4lbEH9uVZFzw/cOczWPj2CvXZWbO6woz+iBCnchkL5X/UzVkHIHsRVK03n4U42nVgHU1vUaTS6jU6lY2rYwJtPhxVn65NjjRqJk1AVSR3ngRLxiSymj4gdzVcioXNI3+ireDnTxmjQzdSgNCMJ6FeyBSkDrmIUheGfxeHNg8N4vcD0XXgUNJR2Ssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfZf4xM9ouK5t9jpAMUBTEIKO61b+KAwbaWEQezz0Wo=;
 b=TsRoPYXSmO23hZ7A9Ulr/VlkYsshaPPZe6XpP87Ou7aSOUjxGIXkoJ/s8yIaDmPkVpS4tDbzN0b9YPlC460IiK9R5aBjSD3oJYSUinA3lH32DrLhZgp10xtSfOiX8/xuagqNXWTdR6uBEoTzN+RK0va5mxHptywrRtlxoEwafL4zUzHLQBaSxR5tqurLLxpuGAXrdxPdyVMTs1TT+Rn9q05UqMNUWaXxdrdLspbf8qGTaWROT/BJQp4DCrCHFCFHbBjanbudxqwJ1bCXLKL+1F3npvooT39w9r1cIC3qhTT91ZU+uEFDgU12GO21ICg1TJmWc6Z5d8FPohebicUyiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfZf4xM9ouK5t9jpAMUBTEIKO61b+KAwbaWEQezz0Wo=;
 b=hr8VZWltpCSFZxivHLQK7BsgDg+1rTMZFY9FNQ01oISSC0/jG84XTBM7ANMWoLqAm235clPxueuJPqijXXmxLwLrNI7THerWVBSdWAbQz7omx9RodnrE6Y/F/WrGdYoOOokkitHb7W1AyiNe+2z/T3xPOAPUgbnl31F4//GfJlk=
Received: from BLAPR03CA0022.namprd03.prod.outlook.com (2603:10b6:208:32b::27)
 by BLAPR10MB5187.namprd10.prod.outlook.com (2603:10b6:208:334::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 17:10:56 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:208:32b:cafe::6e) by BLAPR03CA0022.outlook.office365.com
 (2603:10b6:208:32b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 17:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Tue, 6 Jan 2026 17:10:56 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 11:10:51 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 11:10:51 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 11:10:51 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606HAoYq3342046;
	Tue, 6 Jan 2026 11:10:50 -0600
Message-ID: <c5954858-7d62-4b57-801d-8a6fe9cccefc@ti.com>
Date: Tue, 6 Jan 2026 11:10:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: boot: dts: ti: k3-am62l3-evm: enable WKUP UART
 wakeup from LPM
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, "Bryan
 Brattlof" <bb@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
 <20251230-wkup-uart-wakeup-v1-3-cd6e15f8d956@ti.com>
 <20260105135520.rqnysf77ou2kggfh@shakiness>
 <c477e23b-83d2-4369-81d0-b914089842f1@ti.com>
 <20260106115658.susgttqvokqeasz3@width>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20260106115658.susgttqvokqeasz3@width>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|BLAPR10MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a8f1bfa-e3de-4794-f6f0-08de4d468e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmlnOW44Q1hvVVA1RWhMOTFXTFJkcGh2WmNOK0dWUlRoTEp4ckFSY0Z5M0Jm?=
 =?utf-8?B?WWtaendiN2lGTFdVUitmVnh0aVNZQ2ZSUXRGNDBXenpZalRvcWRLQ0FIdjcw?=
 =?utf-8?B?clRMalFmaWZ3bXEyRWRXZmtmUXZTNkZPU0RuUU10eVR3VU5xanZUTm5QTENG?=
 =?utf-8?B?Wmg5M1ZMMFhUVVpwWlVjSi8wMU5teS9QWlRjalVPTHBaYmhGSmwvZzcxT3hV?=
 =?utf-8?B?R0pCMlo3Q0h5dDVWL0R4WDV5SWplblJHQ0hHZW9jYTEyaWtYeW4yWmlhenZs?=
 =?utf-8?B?QVE1aENtUDVBQmhUSUhaUytiRE1EZzBqU1dubWJna0htSkZtWGgyUnFFd1c4?=
 =?utf-8?B?SW9KVi9xVjh3NXNWcEZCcE9sdnNkbHV6Q2tMaWpiSFh4aWh3YUtObGYrcHFK?=
 =?utf-8?B?TSsyaVpHdG81V2dwL0hXS1VSUnMyZDRNbHhrMTdVbmFhSjhXMS9hTjA2OHdU?=
 =?utf-8?B?TnBTY05yWWJscjBsRlp0ZmlQcjMvaXhyeVdPbnc3QlhYWXNaUmlYby9KMEZX?=
 =?utf-8?B?UWUrYmVhQzVsQ2pMek9RU1c1V0I3RU5SZ1VYbnhFWmZpZW9KZzZnR201Z0Z6?=
 =?utf-8?B?Y3RNWTB2OThlQUpYalZRd3VjTWRLODUwNVl6b0IyZVlQaTh4OXErRTM3MjdR?=
 =?utf-8?B?S2ZnK0ZkZU56U1NzaVB0bWhjaGxmRzZFRk5xQU9TRmFRTjVRczZRaUFWdWZi?=
 =?utf-8?B?eVNGZHJHZlJYbVRYSTdOakwyZzZzbFp3K0dQYzU4aGlmSXV5NytZQ2FQWk5M?=
 =?utf-8?B?STBqdmxiSm1obHpydUM4TnBuanA2UGdTeWNRY1RQSUtpWnA0WUtWeTdJT29t?=
 =?utf-8?B?QWhqc0NGWFZVOGVncEZoajFOU0pMcVNtOTh3Z2hNZmFCbncrMHpzcmJYNVdp?=
 =?utf-8?B?bHlLVW80aUtqSnBNMCtqODF0OTJrOWdjRUhiYnBxZ0VXNEZWdXRvbW93Znkz?=
 =?utf-8?B?WlZtTmRSR0tVN0ZCSUV2NlBQMG4xSEV4dXBxMUxrTGhHMW54R2ZrTHk0YWFW?=
 =?utf-8?B?MkdRU3FHNGRhYTRMR25RQ1Uyc1JsMzd3V0NKWUxtWnRVQ0hSb2V2enk5MWJu?=
 =?utf-8?B?a2RyOUJRbHEwZzY2bUV2L240OEtnVmVpU3pyRVdzbmk4VXVRM283UUZtZVhm?=
 =?utf-8?B?NHJxd1BQejJMM3dOaXRidnRmTy9jMEF3Tkp1VWNRb2wrcWpDalo3NHVhSlll?=
 =?utf-8?B?UlV2QkFTd0VBTXA3ZFF6cm5NYmdwTTNGYmN0UE9sZHo0TDFFL2JNUS9aNHZF?=
 =?utf-8?B?TmZodUEyVENxaFJPT0NWNStyeWphc3RBVXV2VUNYZko0MnVEaUlBZVIyclhR?=
 =?utf-8?B?WmhwNXlZV28wdmhINkQybGY1R3NJdFAyZERpRlY1dTFMRmtEQVpWUFUzNE9T?=
 =?utf-8?B?am93bHFSeXJDZGViRDB4VDZxdW82UTdGc3AvMCtvYXUrWC9KREFQb1ZRQkF4?=
 =?utf-8?B?YS9jc0w5SjN6SXhveTdqblpYcFd4RVRJc0o1UjA1RmMzbnV5bm5ET2xhbmRW?=
 =?utf-8?B?SVFaWktnSUZ6cGVEZnhmemNVdDZIQWRYOWNUZExIa01reDRtbmlXREM2bnhE?=
 =?utf-8?B?dlVtL2VRSkNQdHc1K3NxayttdXRpR0dJR2w2ZzZQa1dLMDkycVR6SE9YMGsr?=
 =?utf-8?B?UUxQdUxIVzlnbHMzalYyMTlPa1p3UE9oL2V1NGxXbTVOOEE2c1JUZ0NDc0Zi?=
 =?utf-8?B?dURGeDBUMHRHMFMxNE4rVHJyak56RW92U05DZlpEUWJpT2ppdFY3Q2pweDVt?=
 =?utf-8?B?ZFZ3dVdvNG5ndGZSSElEd0J1Z00rcnlORG5rK1JzazNQMlZUWXp1aWRNSWo0?=
 =?utf-8?B?Y2NnTVM4VTN2UFRtRlNlMlRURzNueHFTdml6Zm9ueTE2ei9Cc3dQK25LektK?=
 =?utf-8?B?VG9JUFRmRUs3bHFGVlNKbThCR2V2eTA3Y2hzWGZ1MEZmeTlVeXN2bVdXaFV4?=
 =?utf-8?B?K0hXanVQRy9IQWRSNUp3MHYxcC9Na2RlTExqMEdsY2crQ015Y1NNUytrd2FY?=
 =?utf-8?B?VUZvUDR0NkxPWE5FNzlWWmpVTlg5OVY1QlhMWlRFWGt1TjZ1WXk4NGwvV3Q3?=
 =?utf-8?B?VkVad3BXaERnSVk1M2srYUFVSFk1dktCTVNXY2I1eFZVYlB4Q3owVGlPU2lV?=
 =?utf-8?Q?anXs=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 17:10:56.7077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8f1bfa-e3de-4794-f6f0-08de4d468e93
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_091100_626666_B0ABD8F0 
X-CRM114-Status: GOOD (  15.26  )
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

On 1/6/26 05:56, Nishanth Menon wrote:
> On 16:10-20260105, Kendall Willis wrote:
>> On 1/5/26 07:55, Nishanth Menon wrote:
>>> On 20:51-20251230, Kendall Willis wrote:
>>>> Change the status of the wkup_uart0_interconnect node to enabled. The
>>>> target-module node sets the UART SYSC and SYSS registers to allow wakeup
>>>> from WKUP UART in DeepSleep low power mode.
>>>>
>>>> Signed-off-by: Kendall Willis <k-willis@ti.com>
>>>> ---
>>>>    arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>>>> index cae04cce337366b50928d39b0c888550b14e43d3..02b1a1c76b2ee05d49cd69d199a6aacdb1973fa0 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>>>> @@ -359,3 +359,7 @@ &usb1 {
>>>>    	pinctrl-names = "default";
>>>>    	pinctrl-0 = <&usb1_default_pins>;
>>>>    };
>>>> +
>>>> +&wkup_uart0_interconnect {
>>>> +	status = "okay";
>>>> +};
>>>
>>> don't we need to set status okay and provide pinmux for wkup_uart?
>>>
>>
>> No, only the interconnect target node needs to be enabled because it manages
>> the SYSC register. The SYSC register configures the WKUP_UART to be able to
>> wakeup the SoC from system suspend. This allows the WKUP_UART to be wakeup
>> capable even if it is reserved by firmware.
>>
> 
> If wkup_uart is controlled by firmware, it should be managed by
> firmware. $subject claims that wkup_uart is being enabled, but it is
> not.
> 
> 

Okay, I will change the $subject to reflect the patch better in v2.

Best,
Kendall

