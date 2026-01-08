Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04355D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3goFcKee4OUgmaWcAc7KDOw58mefuVRtDRqXl+x8zEU=; b=gOEkPWnTMIeZAM12btBS2TNFku
	rYuLpQR030jhDoi9Bl8j4+aA8dAgi+0+ZcEJ7eXVKa48cBHe1A0qdhAZRamGTJ56QolRXDiOqMRIS
	ufHqoc/JVsvQ0bW8ClO/rKfCkufgEiQe6V61CbbyWSNctLwCrRKKGZG8/yYBtZYGgC7ORw1pEyK3+
	Asir4F5il98B1pYk1aYhT5sPg9EAdQfUTd8Jl5wGMhclo4VbODD4Bxd1U8lWJbmrc7BKJPkp00tEJ
	dSxCSsGn3GJV3wfrV1zmZ4Lv+pr8gnMhMKxqlYbortuQObXNrK9FtCoEB0pYFvh1yk5qyLgn0MN8S
	PcpEXpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduBm-00000000VRh-0u6X;
	Thu, 08 Jan 2026 17:52:50 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduBj-00000000VQD-1HjT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:52:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAzBl4DMLh87nuEb/KI1SqJYw7iyv2T002zBHiqQwKUyxGspkJWo/BzUrIHkVNu+V3iWXnpLcmpI1n58fTczB89nWp9giUwwzBAxoEmaXwbGy+/52+Mjt8BW0dUaCIl7a1hrM8v+AYQzzAFkz9Vn4/u5qDU3GVTYskGrnyeHjWINQ58JmHBhWAXrtKA259Qbg8vKeYAYO7r99j2mAqU2SkxrG+gaaK3XT0WJ07dyKgC67XPK3zGmxPien3R6yinZp44GZ45XX8ttvZAnkkhF1mUsk5/ZOExBU4QZy6vsKeJMCZbMRMyfow8EM1840llidiuSEAv5mSh0eS/BmY+IIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3goFcKee4OUgmaWcAc7KDOw58mefuVRtDRqXl+x8zEU=;
 b=WpuI+TcI4plsLPOzjuRAelHs4VDP4bIARTGuf5nW0vVq3jgNpPXkzqngTEScFOQj9C4L2i3EVz892T16LV5DNJdZpLWpKsdPyDBydG/twkU/dumgrAa/yktdKb+kiTQdt0YodDD4ia+G6UngnVqZ4n2TjDgkdecI4rqx5szOnoADafooFbxzKkPngkENUlyiY1FRTOX0gA+Z8MEl1LQo9Jrfk48QMJr76OjSPI5MtYo4hmJQyQ1QCGXg+JMHOo4FanawGkQxOXGkKL0wRIOr52BV2sxrQIpAFJ6p1kZ5Fg6CzLPRGYjPsax/H0WyO4rt4tN2f4fjrEO2ZmYZ+P8YaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3goFcKee4OUgmaWcAc7KDOw58mefuVRtDRqXl+x8zEU=;
 b=oeKkbQudDSeMXwHGwPNvqKkBngIa9oJf013jQYh/+Z5cG+XSywMF990tnF68uCU5OhR09e7kdbGYo8ZQb4pKF8aOcqXAfs54uMF2KdC+zg1yMAs/Tzs7PED1jC6zWZfTilXlo13EH9b1UndWxADu3qPmP5AVbU+45uZDgkjIuFI=
Received: from CH2PR08CA0024.namprd08.prod.outlook.com (2603:10b6:610:5a::34)
 by DM4PR10MB7390.namprd10.prod.outlook.com (2603:10b6:8:10e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 17:52:34 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::2e) by CH2PR08CA0024.outlook.office365.com
 (2603:10b6:610:5a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 17:52:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:52:33 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 11:52:33 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 11:52:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 11:52:32 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 608HqWWe2762413;
	Thu, 8 Jan 2026 11:52:32 -0600
Message-ID: <afac4fe3-1dbc-4c8a-a0f1-6e25666eabb4@ti.com>
Date: Thu, 8 Jan 2026 11:52:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: boot: dts: ti: k3-am62l: allow WKUP UART
 wakeup from LPM
To: Bryan Brattlof <bb@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260106-wkup-uart-wakeup-v2-0-fb4cbd56c827@ti.com>
 <20260107164504.ehvbfizg7ybbvv2e@bryanbrattlof.com>
 <c7dfe4a3-1bf5-4e50-b4b7-8752aa9ef1f5@ti.com>
 <20260108170545.cfez6dvwkft2z3jh@bryanbrattlof.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20260108170545.cfez6dvwkft2z3jh@bryanbrattlof.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|DM4PR10MB7390:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b533d5-7411-4f55-f587-08de4edeb39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|34020700016|34070700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U212bnlLSFoxNGJHTURYdWpOTzJuMXdRSXlFeUxlZEJaZHN0b3czTk5Zb3B6?=
 =?utf-8?B?c2RQNC91M2RGUG9JRmZ4WVdBbEVhZHNJeER6NkVNQWdkUVVXNUkrR1hLSnA3?=
 =?utf-8?B?Zm9sdjhuSTRiQWpjSTBzM051MjZyYUFZMjN6REYzWXA4NjBoalZ5aTlGbEdl?=
 =?utf-8?B?RVpjQjBmV1NwbjdHU1Q3ZndkcHQ5Z3A3NWhGRlVveDg0bXJaMjFEelBNUVVu?=
 =?utf-8?B?dHowVTY1WG1yZWViSE5LdFpsK29UcmsvZWJrZXFSSVUwMnFnWUJ3eVhNckRu?=
 =?utf-8?B?ZmlsYi94c3RGU2tmTFNlSVJTbE10V0ZJNlVnemNmd253Q0ZKVk1Bc0dhanNm?=
 =?utf-8?B?eldCeUhsWno3eG1lblVxZHBnSHorU1V3QmhkcHVyUUh2SEhQNE52QlVKWXQ0?=
 =?utf-8?B?OVlZa0hmUU4wenZKK2J3ejkwSTN0VG1JYWVCZEl4R0pKK3RIMStDZU9EOEc3?=
 =?utf-8?B?VFdVMExHRlF1T3hiNmlwZFcxcjNmb2JTUmRpNVBLMGlkWElOblhFVmw0ZjRH?=
 =?utf-8?B?QkRHaVg5Vktlc2VaMmtrUGRyRVJrWVp2Vkd2aUFHMDVDbU9lOTNZa05JaTlJ?=
 =?utf-8?B?VitxZjlWOW1uVlQ0OGdCanBtZlFZV2xpM1JyZ0IrVUVQOTJtdnovZmFTSFN0?=
 =?utf-8?B?cFdoS21zZ2Z2Y0FCT0VnUGppOWhESVFNYUR5UUdCbm5xTXQ4NXhtSzFmZ3Bi?=
 =?utf-8?B?d1lmMjdtVkxWaUhvTVQvQ0tlKzI0NklqanNXemd5SmtEQlBjQ0pwSWVxNlBF?=
 =?utf-8?B?ckhId05lUldBajRUNytZVzVFV0o3QTczQjdkK3NvU2V5RGJpZHJNZ1d1d3cy?=
 =?utf-8?B?RXNVUlBiRGZsNUhGeDMyQmRDd1JsVGk2eGdFZU13cE9mSjNLZ3BWMmwwb2hI?=
 =?utf-8?B?K2o2UG5XaXl4TkplUkU4TUIweVFXaG1UMHh2b3cvRzQ5UUtCSytvVllkNlFs?=
 =?utf-8?B?bFBud3luVVZ2Nm1mSm5mUzMxOURRUzl3bDdGYmRmSkJZM0NPQk9QQ2txaWdo?=
 =?utf-8?B?QSs3aXNZcnIrRVUyeGxmdFpudCtkVU43bVVQSWxWU2xBb3Uza3BtTWQ2N2pZ?=
 =?utf-8?B?dm1YOXZvek1NRWxIZWdjZEl4UDN0bXBiSEhnc1UzMStXUTNDY3RQQll4OWFs?=
 =?utf-8?B?dHVONHBESWp1ekk0TnZZdS9GUGc0WTJJQXhVREoxU1d2dUpSUHI3YnFoWmhq?=
 =?utf-8?B?UUl1eXM3c2ErZGc4eE1YL1pYYjVseE9PWlUwbkkwd2lyTnYxbHBxeWtlQlFi?=
 =?utf-8?B?Y0loRk9uc1lYYnE3U1k2NkRpQkFzVXk5TW5kT0YvNVp6ZUEyaHl4UEI1V1Ba?=
 =?utf-8?B?ZTVOcXVBOEFld3NISWsySXZEdU01aXNFanVlT1VmYVRGdnJlZU84cmYwSWlk?=
 =?utf-8?B?UDRXQm9zcFRiNGxOWHpQSDQxWTJleVVmaFhkUld0ZzVBOTZPTTBkTjVwKzJE?=
 =?utf-8?B?QlI5ZzNCdC9aLy9UWENjdWpXVHBobmtNRUhMWk9meWdOUjViKzhSOWhDK0xI?=
 =?utf-8?B?azBpVG1HbVRaN0htNk5hQldCMW9MK1BGUERiWWZvN3FaWlZUY1I5NjA2clhW?=
 =?utf-8?B?MGZkSWZxTExlRjlxZnYwR3ZPaVh6MUtiWFE0UnBaai84T2FnTzhraUJaWFd1?=
 =?utf-8?B?QWljTXF4Q0pPZUg3cmJUMm0rdlRNY1J2Y09sTWpLTFE1a2dJa3BwZk1qa1ll?=
 =?utf-8?B?UGJSRHlSYzdQQU9PNDJHendreFRDaVRpcXNuRnVLRGVkamRGSnk0dXpSNnRW?=
 =?utf-8?B?d3RSNVNjZmdIYUhtaVhLeUFTcTdGRlozTGxjVGtmT2F4cTRoZXhvUGcrTWNw?=
 =?utf-8?B?L2JxVXkvVjZlZVFwQ0lmRkt0V3pialBCSi9XblFzdDV0NWVtcXVyRmQxaTU5?=
 =?utf-8?B?SjMxcHllL0NDd2VHR3dpZ0hXM0lnQi9XWi83Y1I3SEJpQ0QxVFRBS21VdXJh?=
 =?utf-8?B?UTZ3U1dDS0NiWkpUR3J1M0c1OVRJa09WcTNJWmo0NWFqd0ptUDMzMnpKU1pj?=
 =?utf-8?B?U3V6b0dZV0l1dXZMYWZHSk80UEdvcmpQVTRiRTJ4VDYxUTdqMzl0Mmg4RHBz?=
 =?utf-8?B?dFBHMG1XaVNOSzBkeno3TFlLZVd6WTVJNFd6V3NoQU1XaHZpLzFlQkRtbkdL?=
 =?utf-8?Q?WwVA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(34020700016)(34070700014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:52:33.5264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b533d5-7411-4f55-f587-08de4edeb39b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7390
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_095247_423295_E8D90321 
X-CRM114-Status: GOOD (  18.88  )
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

On 1/8/26 11:05, Bryan Brattlof wrote:
> On January  7, 2026 thus sayeth Kendall Willis:
>> On 1/7/26 10:45, Bryan Brattlof wrote:
>>> On January  6, 2026 thus sayeth Kendall Willis:
>>>> K3 TI AM62L SoC supports wakeup from WKUP UART when the SoC is in the
>>>> DeepSleep low power mode. To allow wakeup from WKUP UART the target-module
>>>> device tree node is enabled. The ti-sysc interconnect target module driver
>>>> is used to configure the the SYSCONFIG related registers. In this case,
>>>> the interconnect target module node configures the WKUP UART to be able to
>>>> wakeup from system suspend. The SYSC register is used to enable wakeup
>>>> from system suspend for the WKUP UART. Refer to 14.7.2.5 UART in the
>>>> AM62L Techincal Reference Manual for registers referenced [1].
>>>>
>>>> Previous TI SoCs configure the WKUP UART to wakeup from system suspend
>>>> using the ti-sysc interconnect target module driver. Refer to commit
>>>> ce27f7f9e328 ("arm64: dts: ti: k3-am62-wakeup: Configure ti-sysc for
>>>> wkup_uart0") for an example of this.
>>>
>>> I think I may be confused. What is setting the pinmux for the wkup_uart
>>> to allow us to trigger the wake event? It looks like they reset to GPIO
>>> pins if not set. Is firmware doing this?
>>
>> On AM62L, the WKUP UART pinmux is initially set by TFA so that it is set to
>> the UART pins, not GPIO. The target-module node sets the WKUP UART SYSC
>> register so that wakeup is enabled.
>>
> 
> Nice however should we mark the UART in the board file as reserved for
> TFA or is it free to be used by Linux and only during the low power
> modes after Linux is asleep will it be used by TFA?
> 
> ~Bryan

Sorry for the confusion, I said earlier that the WKUP UART could be used 
by firmware, but that is not to say it is specifically reserved by the 
firmware in general. TFA sets the WKUP UART pins, but it does not use 
the WKUP UART for anything else. The only exception for TFA using the 
WKUP UART is if the user chooses to use the WKUP UART for TFA debugging [1].

All of this to say that the WKUP UART *can* be used by Linux, it does 
not need to be reserved for firmware.

[1] 
https://software-dl.ti.com/processor-sdk-linux/esd/AM62LX/latest/exports/docs/linux/Foundational_Components/Power_Management/pm_am62lx_debug.html

Best,
Kendall

