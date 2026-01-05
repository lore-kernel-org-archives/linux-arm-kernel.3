Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E11CD040D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzR/8Jr9iJoLQLJ+E5Be+gCE5v9t2E6EMxXhuLLH02M=; b=fPKfvbSoDDqG9bHZ/P1rLoMtqJ
	x3iq4SSjLH+j3cyywB9jt7c3FvsZs7lQIW4lBOPWZF2obRsrCtQxUj1DpT1NiYFsNOM2SC7wTqTBS
	n3pyLU4i15QZtxcJvLEp2hsvKwdzsRCnrctB8vfit9F+Qk1gH905a8hlw3X8jL0YYtxnNB9LRvxjG
	Wg3QALUnVWRrf0X1FqMqm5JOvRwXhK2trbTrYycLJYiIzqO1e6A6dCK+9zdktbxJvBglploJf3fuB
	sS9QvyuvM+bgc+zZKz6FswyIW97ICZPq5KPEwnRq9YnQ7QHF5IDOOOLluJ79Vg6URLc9Z1O+u1Tld
	JujCRSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsip-0000000C906-1KT1;
	Mon, 05 Jan 2026 22:06:43 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsil-0000000C8zI-33nK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:06:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7TkZXMLTxfzJ/jO4vyQHu5bg6BIUQqANPDZCltN/sgY7xcbnXyTatqpZx8GEA/3IgfDmPp4yRtDMb1tK7ZiJ0yb6hWuBBtUfdxlhG8z9kiXeVbOFHsCkplbb27HOrznhYCaTgakd5GhkfqHSKgPds1IaLnT57//j//oRSvEI8C/jnjcbiULyneBss6iF6w82432fsECQiBCNTmU04YWyP/+DLrqTwl1yPE8xXUv9EtBfuK+LqIm/3iKvxqWxCq0TYa/WpirJlSuDnRiRBvdUF0DI+CNZDx5OoKPYMqXSsRb6uN635cp046y3Lif/y2+ZuXV2VuNMfmTFhFtoEQUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzR/8Jr9iJoLQLJ+E5Be+gCE5v9t2E6EMxXhuLLH02M=;
 b=uyuiOe5uM4ysmNybsMvo9mG7lQ7t2D2uRIP+cgIieu5Nz0Q6vnV+b8OTxKamCHK2GJ5Yk4kzHl26FUAlegKUnuWt6/HOyXFabHAATPw9BNayPs5VStGtg0cO5eoKC77nPPX1b/4DcjKx/WtCH++/Ige8ojtbhPEJeC/t/PH3qXfYb/ZKgnHqUBNJkU+pIFIb1jLv/a8LhLilFFFRbRr0g7lrcQmzNlclmcnsxj/jK95TCdq68MuBj9mZPexhD7+CrsrVwbj8bD0304DKR/9Oi6U+UXS5nLcBcvtP/kXoyaKiUtMMsj9SS90V8X0ZUejOByfZamw/RfOdJN0RltdNBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzR/8Jr9iJoLQLJ+E5Be+gCE5v9t2E6EMxXhuLLH02M=;
 b=W0T9l7oiQoZoqkhdE//ot5tsEII0bmyy2w500t/CB3Vs+GLeTMmDxWe6aumwTEFzB4pKRDXeZ628XnImHaFXHlD3NHEmRxZlVxl1Y0C1seex7IXdRaFL6R8ifbMC/5bzcZrxh8LEUFe7XLWHbZzhPHnSQ2oK+KQqLrztcmsGkEY=
Received: from MN0P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::17)
 by BL3PR10MB6236.namprd10.prod.outlook.com (2603:10b6:208:38f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 5 Jan
 2026 22:06:32 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::d2) by MN0P222CA0011.outlook.office365.com
 (2603:10b6:208:531::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 22:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 22:06:30 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:06:30 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:06:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 16:06:30 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605M6Tug1848998;
	Mon, 5 Jan 2026 16:06:30 -0600
Message-ID: <44b21f10-2ad4-4c88-a8e8-f485ecb53af9@ti.com>
Date: Mon, 5 Jan 2026 16:06:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: ti: k3-am62p5-sk: Enable Main UART
 wakeup
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <d-gole@ti.com>, <vishalm@ti.com>,
	<sebin.francis@ti.com>, <msp@baylibre.com>, <khilman@baylibre.com>,
	<a-kaur@ti.com>, <s-kochidanadu@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251230-b4-uart-daisy-chain-dts-v2-0-fa5257ec54bb@ti.com>
 <20251230-b4-uart-daisy-chain-dts-v2-4-fa5257ec54bb@ti.com>
 <20260105135202.vnamexwl3afdt4cw@deferral>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20260105135202.vnamexwl3afdt4cw@deferral>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|BL3PR10MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dedb78d-82af-44a3-4160-08de4ca6ae9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L216Z0g1SE1pa0VwVmx1L2lwVHFib1FFTWR6b2pVRjVIUkFBNVp0aHF3TE8w?=
 =?utf-8?B?TEZ5Q3Bxc1lIMjE2ZEZPVzNQenFOaTlFZUZVdHJwOVZLSUhOZ3hETHlseHV5?=
 =?utf-8?B?Q213Vm0vMC9tNUd2MkRqR282SzBCZzJud1cwU2tTUUtQWVZrcXlyemJvOFVw?=
 =?utf-8?B?YWpCNnJ2V2JqQnhkWFJONzc5b3M1U3R6MTNFMkh5a1ZnUDVCTTRZZjYwTmI1?=
 =?utf-8?B?T2xQNDBKZG53eGZNTXNEM2tTdm5XREMwRlFWMlNTVVZ5RkREc2dPNCtIeEtW?=
 =?utf-8?B?QVNEUmduNkV1MmZiTVpCOUNsNWpMdlFoTms3UlFoYy9uVzRFWjZ3YXZWSElS?=
 =?utf-8?B?ZG1UTUh2VWtBSUFNS0F0cGhNRWcvcTJsajJjVmwzV09wOVlDMWUxUE41N29Y?=
 =?utf-8?B?UGNTalArZGhkaHB3b2k4UHAwQnJQbGJvZlVhWGkyZU1XeDlWZ1VSSDYvVUhl?=
 =?utf-8?B?d2F1SWFlcjYwTU5SelV3YzdzK0cxenJwaWEzdFhzcyswRTd2a3JqcUdOV1I1?=
 =?utf-8?B?ZjhqczlVVjhLTVJBdkF0QUdwcmlQMHUrdHJuWC9ORGtVRjRHUHUyU1F0QTVi?=
 =?utf-8?B?MVBoOXdHYndnQ1FpbGhLcG56NTcyNE9nM1ByN25zeWU1MkV4Yi81RHV5Q0dZ?=
 =?utf-8?B?N0dkbHBORkd3U2dHTHdpY3Y2VVFKeVVXZWVWZkw4QnJXZzBCSlNScUhxT24v?=
 =?utf-8?B?M1BZSklBK2tFVzZkUDFZMXoyVVNNS21EUktCS2h0Ykd0ZFdtZDd2eEZZMnBV?=
 =?utf-8?B?RWYwdVIzUWxWR09pVEV4YjNYN24xZk5DUDhTWG5zcnJ0OG5sd040T3hqZVRk?=
 =?utf-8?B?RDVDUkxtYTg4SFVrbjYvVjRzcXZVTW01WEdCZjFCL2U4Ukl1MnVjRVJPVkla?=
 =?utf-8?B?bS8wYTEydjIxRWtiUzhMRWlmaXNtdXJNdi9paktXRGlnYWh0YWd0ZnI5WkhW?=
 =?utf-8?B?MnBub1czb2RCWW5wWUxQTHduOWJpdHBLVlNrUXE0NjRtYktOaTBmaTJtOURV?=
 =?utf-8?B?WW5qT0Q5WmdvbFRhSitOOUxsY0I4Nm8zUzR3YUxmNUxMTTZrME1kejJjWnYr?=
 =?utf-8?B?cFhQNnJaZjkxd2N1eGR2TTlZQ2RWOXdMS3V0SXVydlZJbHE5dHA3eW1GUVhi?=
 =?utf-8?B?YU5ua0tIdzdaVWgvc01QZ3VkaUVHNit2UDZXTllRU2Q4RDlYSldkcjlsK1p1?=
 =?utf-8?B?OU5uU1g3Mmg4WktJSUplVEtmWURkV1RlUHhwY0U5YmlqOXd6NUZ2bk1ON3dn?=
 =?utf-8?B?eEZEK21VTVlvZGtiL3ZmbmYrZFU2Skh3aFVIdDVwOXJmYklveVJrbGdac2Jz?=
 =?utf-8?B?NFFudGU2ZUVuUE5Pa1dwSGEvd1ZYZ00yM0t2QnhrNWxxK3hydVhQakRWSlRn?=
 =?utf-8?B?cXlEa2RSeDJlS3orNmpLRzlQMzhUOUY2UmZrYVNWOWtDWnZkZjJ2T0wxa01I?=
 =?utf-8?B?T01LVHZSQzRNYjNUT25wbTdrZEQ1L3A5UTVqMGN6aWlZSnJrdXRDdFBXbHlv?=
 =?utf-8?B?Tjl2MEQ0OWRDNDRFWXlRUnUzOENuMTFBQkZMdUJ6dW5MbE5vODhRWDhkd09K?=
 =?utf-8?B?VVVkeDhYQjRHMWZzTEs1bWErTENpNWh4d1dvU1F4bEErcTc1UHpQMUxncUNp?=
 =?utf-8?B?ZzU0dTI4cmpMWXpYajkyYkk0bDVaSjdNOTlycTYyYjliNzA5MzFSYlFsNWhw?=
 =?utf-8?B?bGplZE9zUUNibXdmWUNITTllNTJGd01DcTlOQjFNVnRwTTdkQVRvcWFaUjQ3?=
 =?utf-8?B?VkxmT0lzVzhiRnFpT1FDZ1A4Y00rcW50QU9MRjRETnljNjVjbUtxUUtUSFpL?=
 =?utf-8?B?SG5rTnFiMjl1VTFCZjBVdFhkSTBtVnpqa2s4Vk4zdHN5dTRjQ0g5SUZ2cEFJ?=
 =?utf-8?B?WFZsdjgva1FnWGpLLzJldzVxd1p1WjNFU2pWNnJldmNqVjNHVFArMEVhOERs?=
 =?utf-8?B?cHNlSm9ueGVwWE1lUEF4UlRSYm1jOTFOTE9LSnM2S2R1aUZKdEVDM2RkWVJE?=
 =?utf-8?B?YTc0LzAxRzNxODh6RUhIN2c2VC9vZEM3OTdLaFFLQ2ZLQXRlMjZUODVFUjNU?=
 =?utf-8?B?bG91QmlZWTJlaEZETHlOaTBiZFlMRWhRd3RBZmE0V1JZNlEvdEs4RUZJSnZq?=
 =?utf-8?Q?W2kk=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:06:30.9811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dedb78d-82af-44a3-4160-08de4ca6ae9e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_140639_907615_884CAA3A 
X-CRM114-Status: GOOD (  19.42  )
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

On 1/5/26 07:52, Nishanth Menon wrote:
> On 20:38-20251230, Kendall Willis wrote:
>> The Main UART can resume from suspend to RAM states when PIN_WKUP_EN
>> is enabled. Add the necessary pins needed to wakeup the system. Add the
>> system idle states that the Main UART can wakeup the system from.
> 
> Is the tx and rx pin register states both lost? I wonder why during
> "wakeup" we set PIN_WKUP_EN ? is'nt that supposed to be set while
> entering "suspend" state?
> 

The UART driver uses the default pinctrl state when the system is 
active. During the process of suspend, the wakeup pinctrl state is 
selected by the UART driver in order to allow wakeup. Upon resume, the 
default pinctrl state is selected again.

> if the tx pin register state is not lost, then all we need to do is
> play with the rx pin state (and leave pinctrl-0 as is)?
> 

Yes, it can be done where the pinctrl-0 does not change, and there is an 
additional pinctrl pins that has the TX and RX with PIN_WKUP_EN. The 
logic behind both implementations are the same, just a different approach.

>>
>> Signed-off-by: Kendall Willis <k-willis@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 24 ++++++++++++++++++++----
>>   1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> index ef719c6334fc094f01d9e8185992f2f58320e17d..96bba65f4f16792834567324db6f7f2bdee7bc06 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
>> @@ -328,14 +328,26 @@ AM62PX_IOPAD(0x0164, PIN_INPUT, 0) /* (A20) RGMII2_TX_CTL */
>>   		bootph-all;
>>   	};
>>   
>> -	main_uart0_pins_default: main-uart0-default-pins {
>> +	main_uart0_tx_pins_default: main-uart0-tx-default-pins {
>>   		pinctrl-single,pins = <
>> -			AM62PX_IOPAD(0x1c8, PIN_INPUT, 0)	/* (A22) UART0_RXD */
>>   			AM62PX_IOPAD(0x1cc, PIN_OUTPUT, 0)	/* (B22) UART0_TXD */
>>   		>;
>>   		bootph-all;
>>   	};
>>   
>> +	main_uart0_rx_pins_default: main-uart0-rx-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62PX_IOPAD(0x1c8, PIN_INPUT, 0)	/* (A22) UART0_RXD */
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>> +	main_uart0_rx_pins_wakeup: main-uart0-rx-wakeup-pins {
>> +		pinctrl-single,pins = <
>> +			AM62PX_IOPAD(0x1c8, PIN_INPUT | PIN_WKUP_EN, 0)	/* (A22) UART0_RXD */
>> +		>;
>> +	};
>> +
>>   	main_uart1_pins_default: main-uart1-default-pins {
>>   		pinctrl-single,pins = <
>>   			AM62PX_IOPAD(0x0194, PIN_INPUT, 2) /* (D25) MCASP0_AXR3.UART1_CTSn */
>> @@ -692,8 +704,12 @@ partition@3fc0000 {
>>   };
>>   
>>   &main_uart0 {
>> -	pinctrl-names = "default";
>> -	pinctrl-0 = <&main_uart0_pins_default>;
>> +	pinctrl-names = "default", "wakeup";
>> +	pinctrl-0 = <&main_uart0_tx_pins_default>, <&main_uart0_rx_pins_default>;
>> +	pinctrl-1 = <&main_uart0_tx_pins_default>, <&main_uart0_rx_pins_wakeup>;
>> +	wakeup-source = <&system_deep_sleep>,
>> +			<&system_mcu_only>,
>> +			<&system_standby>;
>>   	status = "okay";
>>   	bootph-all;
>>   };
>>
>> -- 
>> 2.34.1
>>
> 

Best,
Kendall


