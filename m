Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDA0D46602
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGiY0zNcnALjCAIGrT5XDHFEk0+8YGKUL0obCXEgtlo=; b=SbPum3C7ubITU9ky7jkXLMUvKR
	h/8asOVqnBw+M/wlF5lmW2sY/QZut0wUpGGBexZrz4sOLEgEWU0xzAyCgEFxdXPmXtkfAq4OUSQGG
	er0Smr6XnhaEMxN/N9B4y/z/2yKy8ACksKQY3g6Ikrysd3I5ETae7yPFpzyNQxh7mnLoLcFyxYd4u
	mr3M53f0YbcPjQz3Id3lOjthexNxxQ1bdIwFt3681nR8U/BfzP9rZYLhenbJiEV1BhbjMDUr9EgZU
	IQc7XYlagWxoY0G2/U+IubTaau1S6Bu56ne1xP0/i9xU36w0ZSaeUcDYuezt8PPPdzApvb12jnXXp
	+keIvw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQr5-0000000CpK3-08OX;
	Thu, 15 Jan 2026 17:09:55 +0000
Received: from mail-westusazon11012068.outbound.protection.outlook.com ([52.101.43.68] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgQr2-0000000CpJj-1486
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 17:09:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEsuCXKv6kSqCj0M38QcHZsoY2b2HIFGtpYTFzAOikPZoSpd4W2kQiPxrYatM+xkqQ0AXmen/CffU7ittoFt+yIPRXq6VGNfZxW5k1DvP3tICmtDmzs9jpZPe0GiAH3PpEZedpXKWw6G5dfq6XUVtAB6HbHAM6JuWhGofiJGYJLVHMUyYqkLf4hLzKgvlenelqb6q+TWDsOxWEAbHDw4L6Bnhv3Ywesk+sYzoMQ+SxPPCFjlIJHtNUX+TH9wcORdktsd1U4jqRXJQWHJUIWAmJ6JIOhoHiF7tCdABi3N+Lcf71t9k8psv7gkfcWNF4HgWzSQl1jF10jIXcFDTEG+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGiY0zNcnALjCAIGrT5XDHFEk0+8YGKUL0obCXEgtlo=;
 b=SqU1VHxYMPlOpvi2wZr/19W8I+TC0F3pjSwrD7ecbqL1CTpFYJT89VbLS8rg5DGLEkAo3Slom+OqBwOR8IGSODLs4etKkqn3AZU+ftqyXOb8WYBS0r6pP18H3KIBWTRVyDJhlR5dlr4VPKIWL7HEAD9tVtAUiKNryd0tuFG8eH6vJpGwLCgIZghqB58sg0W3/RHQfh6wiONtFTfUSPmVp6/rmzQHhohkyNafH+7ybDaxLPpNfYOjBi3474LsF94u//Nm0+RBrfX4DT1OMe+hPXxz6aVwwafschpt4vz9Zo9Pv0Zhi3kei5MUzVtFOOyB+WkmmtMeT/JxsI2Bo7wosA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGiY0zNcnALjCAIGrT5XDHFEk0+8YGKUL0obCXEgtlo=;
 b=kWFN3g57SXst9wd3RoVek7J2fpS2wdvrVzA62YBql9LQn0iTN/oaCiaDDj2p1WxYG3MDAqm9MiTqR0nRaX5SaKe9i3pKTwT4thabS/Gg8YhHE4APWMhWfVU4mCgexLJ7/jlWmnZm9SivMzyBnx4KRnK5EIiPWRu+ImpiVvl6msI=
Received: from BN0PR04CA0191.namprd04.prod.outlook.com (2603:10b6:408:e9::16)
 by PH7PR10MB6060.namprd10.prod.outlook.com (2603:10b6:510:1fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 17:09:47 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::a1) by BN0PR04CA0191.outlook.office365.com
 (2603:10b6:408:e9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Thu,
 15 Jan 2026 17:09:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 17:09:44 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 11:09:36 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 11:09:36 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 11:09:36 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FH9a5j1892836;
	Thu, 15 Jan 2026 11:09:36 -0600
Message-ID: <9ea936b0-4426-46b1-9935-2a849e7621c1@ti.com>
Date: Thu, 15 Jan 2026 11:09:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: boot: dts: ti: k3-am62l: allow WKUP UART
 wakeup from LPM
To: Nishanth Menon <nm@ti.com>
CC: Bryan Brattlof <bb@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
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
 <afac4fe3-1dbc-4c8a-a0f1-6e25666eabb4@ti.com>
 <20260108180341.t2q6msdh5plbrjf4@parabola>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20260108180341.t2q6msdh5plbrjf4@parabola>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|PH7PR10MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6c6aa8-0ac5-4dbe-c142-08de5458e158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|34020700016|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzM5WG84SmV2ZHNKc3k4WktZamFOdWpJaysxVVNBaWZYZHExUSt0RHIzVVVi?=
 =?utf-8?B?WVhTZXR3dmZoTzcyeCtNK2R6aUFFZjRlZkIvNDBnRnk2M3UyczE1TFZnSEVJ?=
 =?utf-8?B?ZTRqMmp4UDY0R3FYRndkd0tPRlRUb0dlQ0FtVmN0K1laVVpXYlFuUXBPWkJB?=
 =?utf-8?B?YUlYM0p0TGVGZHR6NW9tYVdhNjZlSjdkSTFKREM2ejdYejF6Vm5sUVdFUnp0?=
 =?utf-8?B?V21BM2JIdFN6Zk9zaWpubDNIeWVNcjZ5ZEpQYkNTYnpsMEhMeWRJWkY2dG5Q?=
 =?utf-8?B?amNrWklxcDFTZDZjRTkraEx5b09OeGU3Unp4Ti9YUXM3eW5xN2tScmtsL1hG?=
 =?utf-8?B?USt2ZmUrakoxSkFkRmdONXNXTGE4T0JrUGN6Z0Y4cWNOcStSR3lhblNjT2o1?=
 =?utf-8?B?SHlHZlhHTXJxcHpZb0xNNlVLdUgvMlYyWmJGQUR4czY1YXdEbEF5bCt3VkFz?=
 =?utf-8?B?a1NWOHZBRVVoS05pVlJ0WTMwRmR3aG1UZWxRZllrcDNVL3NKZ3dhSUZuZkZs?=
 =?utf-8?B?TkY0dEdIZU40YStqakJyWXJnQTllNm1XZEE4YnVwbjZJY0VsMXVZMzVNM1ox?=
 =?utf-8?B?aThqWm1SV1J5WFFMeUpRQkptR1R5MVVvSEgwbnhpNmp5WXZGTFhIbG5wL2k3?=
 =?utf-8?B?VzNKeWlPYzhGZnM2OGhQU0N4UUNwQ3g3aXB4TlBMdDJPV212R0lsWFBCM0FB?=
 =?utf-8?B?UmhxSUhCWXFtdEdOR3dpTUU1NnlFNWhKNEhmVXlNOFI1L08zYytSWkQxc1Ay?=
 =?utf-8?B?NWFNMlFGeVZDYTVMdnU0dUdxNndIT0dHdGVuUjZQWFV3dmpEUVkrQ1ZuQUhO?=
 =?utf-8?B?a0s3SHJpdHZSdlE4V3pnQUxZZlhoMzlRMGdvMTlGMkpyTTZhZDFHZ1MxZ3NV?=
 =?utf-8?B?UStjdnkwcC9EZ1g1Q2ZDcHhqMXZ0TEozWXVCcjNleDdWT0lYM3NMUmpEVkdR?=
 =?utf-8?B?YkFucUM0dHFmVDZsdmoxMXFpUVFKVWhURUlNRVlJZ252bkYreXBqVmdjUXlh?=
 =?utf-8?B?MFBYZi9kWExJZnNkUHRsWWd5SjZuNUkyNmhTSFAxUE1makQ0YldVS1YzZmZo?=
 =?utf-8?B?bjluTjh1Y2NoRmpDMkdhdUQ2Y1ZFZXBkaUpqVUpPU2ZRWmhuOHlpb0x6RzZq?=
 =?utf-8?B?dWVsZlRBNi9yNmVDV0dSWW82Y0t5OWVjNm0wMnFDNmFWV2QyLy9wcWQ0bkRu?=
 =?utf-8?B?eHdOT0Z3ZjZ6VlZXVkN6RkhVdS8zTGgxVDYvUjRtY2VVQnRPYVA3SmtLTS94?=
 =?utf-8?B?MC81MHhWVm9DV1BReEZlRDBWQmlRT0dMZEltT1lJMXpTOXVHYWRGQWtSYS9i?=
 =?utf-8?B?b3lEWFlXQVFabDFQUHRkRXVaa3FPS2RaM2YzK0c2SEJkckxqR1lPNS9xRE1O?=
 =?utf-8?B?UWcwNzFySkZFY3B3N3NsMnZxQWZTZld1WEFyYXFhbVlZRmMxY3N1N1lmN3NW?=
 =?utf-8?B?ZGJYMHVaaENZODViWEpDcXp1UFBWYlc0V0g4L1NGNGZIRElhejBpQi9UWERk?=
 =?utf-8?B?STRrb1JVVDRIOUVkU3RvY2Z3eXZCNTBTblM2RDA4WVprL1IvelZkNWcvdXFo?=
 =?utf-8?B?UDlUVHRLeTlXc3o2RXlsS2hUN0lYSnNyUnAwMmZ2UzMwcTA4Y2FIZmhoZjhQ?=
 =?utf-8?B?dkNnMU9NcTNJTm1tUGhveFVKRngzcTFDWnZvSXI2ei8zVVowc0M0bHVTSW5L?=
 =?utf-8?B?RmVhNlFaYU1GRnh6WnJ3OXJkUjBhTjNHcDYzUnYwVFZ4VWNmT0JveEFlWStS?=
 =?utf-8?B?b0o3OVpZWnN5SDZhQTJYSGFzRzFBdzBHL2I4REJqS00rM2xFcFRLVjl3S0J0?=
 =?utf-8?B?Y2NmeHZRYmNENGNZc200MHo5eUE5Z213MkhJVzZ1VGlsZGNQendZcHJOc3Bq?=
 =?utf-8?B?bm9rZDJCUjJCVVVkQ1FaemRQVjFnRlExcWtZRk5lLzhLYytBTDNnSXJubzBR?=
 =?utf-8?B?WkFaSXdKREhIZk1WVjA2SWgxanE3NG5ZV0M3VW9jMlBBTWNjVjRlQThaTWh3?=
 =?utf-8?B?TVVxTnNtR2FKWTY3WHRlaU1OVGx2SmwwQUJLWjRIQ1FCTWthRWJSM3lnaEtT?=
 =?utf-8?B?THhSWjZGNjcyNGtoR2Nhb2hrY3A1Y3hra2dLRDREMjkrellhdXFDeWluajlh?=
 =?utf-8?B?T1RyZU5MU2NMUlBYQ2lQSTI0b2ZkUVlUWkJSa1J2MWJEdWswTTEvT3pXbUlV?=
 =?utf-8?B?d2h1TUVsbGNNeW52cmFuUjRVd0J0YUVVazZWVG5jWkx5Zk9DRHVUNTdIcENq?=
 =?utf-8?B?aUhBMjE2SVN4Y1dtWTdSRmZENTF3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 17:09:44.6525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6c6aa8-0ac5-4dbe-c142-08de5458e158
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_090952_424380_98FA6AFA 
X-CRM114-Status: GOOD (  24.37  )
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

On 1/8/26 12:03, Nishanth Menon wrote:
> On 11:52-20260108, Kendall Willis wrote:
>> On 1/8/26 11:05, Bryan Brattlof wrote:
>>> On January  7, 2026 thus sayeth Kendall Willis:
>>>> On 1/7/26 10:45, Bryan Brattlof wrote:
>>>>> On January  6, 2026 thus sayeth Kendall Willis:
>>>>>> K3 TI AM62L SoC supports wakeup from WKUP UART when the SoC is in the
>>>>>> DeepSleep low power mode. To allow wakeup from WKUP UART the target-module
>>>>>> device tree node is enabled. The ti-sysc interconnect target module driver
>>>>>> is used to configure the the SYSCONFIG related registers. In this case,
>>>>>> the interconnect target module node configures the WKUP UART to be able to
>>>>>> wakeup from system suspend. The SYSC register is used to enable wakeup
>>>>>> from system suspend for the WKUP UART. Refer to 14.7.2.5 UART in the
>>>>>> AM62L Techincal Reference Manual for registers referenced [1].
>>>>>>
>>>>>> Previous TI SoCs configure the WKUP UART to wakeup from system suspend
>>>>>> using the ti-sysc interconnect target module driver. Refer to commit
>>>>>> ce27f7f9e328 ("arm64: dts: ti: k3-am62-wakeup: Configure ti-sysc for
>>>>>> wkup_uart0") for an example of this.
>>>>>
>>>>> I think I may be confused. What is setting the pinmux for the wkup_uart
>>>>> to allow us to trigger the wake event? It looks like they reset to GPIO
>>>>> pins if not set. Is firmware doing this?
>>>>
>>>> On AM62L, the WKUP UART pinmux is initially set by TFA so that it is set to
>>>> the UART pins, not GPIO. The target-module node sets the WKUP UART SYSC
>>>> register so that wakeup is enabled.
>>>>
>>>
>>> Nice however should we mark the UART in the board file as reserved for
>>> TFA or is it free to be used by Linux and only during the low power
>>> modes after Linux is asleep will it be used by TFA?
>>>
>>> ~Bryan
>>
>> Sorry for the confusion, I said earlier that the WKUP UART could be used by
>> firmware, but that is not to say it is specifically reserved by the firmware
>> in general. TFA sets the WKUP UART pins, but it does not use the WKUP UART
>> for anything else. The only exception for TFA using the WKUP UART is if the
>> user chooses to use the WKUP UART for TFA debugging [1].
>>
>> All of this to say that the WKUP UART *can* be used by Linux, it does not
>> need to be reserved for firmware.
>>
> 
> If you are going to use it for linux wakeup, then why dont we enable it for
> linux? what TFA does or not should not dictate device tree unless it is
> a hardware description - provide the full description in dt.
> 

When adding a full description of WKUP UART and setting the WKUP UART to 
be enabled in Linux, the wakeup functionality stopped working. I am 
currently debugging this since I don't think that it should matter if 
the WKUP UART is enabled or disabled for the wakeup functionality to 
work with this implementation. I will post another version of this 
series once I am able to fix the problem.

Best,
Kendall Willis <k-willis@ti.com>

