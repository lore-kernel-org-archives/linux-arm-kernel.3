Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6B9D0D171
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 21:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5GrSwV93wyzCmfyY+CfgJ/wayiOSfDT9fXhh8GQkUU=; b=w3HkFVTzqSt9cg+2RkHoiH6YCK
	yojAbK/mzjo+FnXUvYTlUFbsHHpHhD8bzHANmHu9UsyRI0/613T5Pe4aIxj/WYnNLgFf4Q+W4a4O8
	XdMfjGI87o6x+ApAruVE+amqiaPvbxHSsJgDGiW6h1CxrgWm+LGJZzbxRxQN0st3uY5Ymy8tCHAnw
	gGdmlpuB4jxkhZLDYLEctQE+SHt3Wjy57DKWQDDfh9OO95vP2/UnzB/yezAGjNM5tEmZ6Is+oGliZ
	8RcQALkD9hGf2U0y8gyufSSGauqpEj+gkPbVdx/rv1TAaNcEr2s/0y6BFni6bywYtvas0PmFrwUvd
	u+WiYD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdbKz-0000000FfzT-2sjv;
	Wed, 07 Jan 2026 21:45:05 +0000
Received: from mail-westus2azon11010046.outbound.protection.outlook.com ([52.101.46.46] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdbKw-0000000Ffz5-39mO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 21:45:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZj9hZXBei5urA2rnxF0jNI4uJqq5EDaGldTVoQOHcAwBPnJWc8mICBRJZTqJt97rZ3fOit5nZPzDOJRqfVnYQVN5VTzp8YQaL3HeEZ9tXDH4D42RH1SDQBz19jFwHxABZbQq1VQR19EdKI4HmPfB2UsOmRrZuNugfp5PkTKMbvoHCS9nqmwbwObdeUQ21Um5SzHpnw/FZyBP3fylwGrqfatkGXVgg6ZMyv9xJOK84PW+t20B336NB0tJqxWKIovdwO0NnYAoAgBHCV4NUXTq3/IxKiKL6SRMOjX2dtulcwMbzJGOtkNX6dwizgOfRb9VuUBnts6pG/fUhoRTgYYGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5GrSwV93wyzCmfyY+CfgJ/wayiOSfDT9fXhh8GQkUU=;
 b=KAK3RgzZzYD1nKKYLaNw+3mgdDEPcydCyfxhLZmf96zExaXz/lzo6/s5R2YysECCVxHQGlCaO+eig9+DT771LXZQX1/yNzlZgg6Cn8wROKpDao8IkQ8Js/13+N/BuChn2vNUVlyENonzPFnobfyhj8CrnswKmc3jQ03Q4KMpbL7wMadsA85A5KtHlUu61Vdupp1HuBYMKxS8TVL/0p8EsHPA9Ak2QFHlOGi/JuBy9baxx532X5aK8we6g8rzq/AKPB6Bbj9hKDSw8jB8o33tRaaQRQiW5PEd8GNPI3UTpjlGkOhPNDCmTodoU3dTWQhvRLBSrEr5fJkkmemgxj/BEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5GrSwV93wyzCmfyY+CfgJ/wayiOSfDT9fXhh8GQkUU=;
 b=sI1n6DfppPfJMp1C7UCGQUWArepCBjFz/1MQb+n8WmU41EDOptSa+qZvP+KBJdQELp1b56tdguL+sLnUgtGf6RlwwIZHSSgKj3oOGDsi+wudmpVFNU4KppxLOdeREejJxtGzBvzO0TvFOPdLQUovpAROlVcu3TvLRWZAbSZEhCQ=
Received: from BN9PR03CA0654.namprd03.prod.outlook.com (2603:10b6:408:13b::29)
 by BN0PR10MB5047.namprd10.prod.outlook.com (2603:10b6:408:12a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 21:44:57 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:13b:cafe::ec) by BN9PR03CA0654.outlook.office365.com
 (2603:10b6:408:13b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 21:44:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Wed, 7 Jan 2026 21:44:55 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 15:44:55 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 15:44:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 15:44:55 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 607LisWB1271943;
	Wed, 7 Jan 2026 15:44:54 -0600
Message-ID: <c7dfe4a3-1bf5-4e50-b4b7-8752aa9ef1f5@ti.com>
Date: Wed, 7 Jan 2026 15:44:54 -0600
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
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20260107164504.ehvbfizg7ybbvv2e@bryanbrattlof.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|BN0PR10MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: bddb9b1c-85d8-4824-e634-08de4e35ff64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm1GdVFPa3JpR1dhZXV1RmdXRSsveG9jTUx6Wkt5dDVyUGMzeVlqb0lIN08x?=
 =?utf-8?B?TUp6R0o3RHhlREFjQmw2VytDSm9iY3Q3V0s0QVNrdE10MlV6U1NvMTBHb2tS?=
 =?utf-8?B?M3F3LzBRYXhFb0dJakUyYmpBSUZjMjVlTFZBZU9UNUxoTlhvQkJSVjlHTWpM?=
 =?utf-8?B?a0NwRm4xR0JWN0JqS1lET2xXYnFONzhrK2ZpaW0rcnpzV0ZlWVRYUVNIRXBP?=
 =?utf-8?B?NWRZRnJPRTNETWhVSjVRTDlCcG5ySTF2WStPdDBSU0MyWDVLZ0NnQ1gveWJC?=
 =?utf-8?B?MExKc0x5ZzZidVlZbGZHYmlFTWFzaCthU0RWd2F3bkQ0RjMvdm5rOVBsdmFh?=
 =?utf-8?B?S2tnck5hZ2xYYThjREdxV1lUd0IxYS9EWUlkS1FMQTk0ekF0Y0VMSTRTQWhG?=
 =?utf-8?B?Ykk4UVJ4aXRqZzVQOGxYZm9kZDJQbGtIeTRoT0ZENnpGODJIaWNVbmNTL0hi?=
 =?utf-8?B?MzZtKzk3QUU5RVU4K25ESkN2RWp4UEZxR1pWdGwrK0xxYlJGVCtNMFFBZ3pW?=
 =?utf-8?B?VW5UYkF0cEgrNU93ZUh4bzVraGdZUlFXVlhOUDloNnIzU0NnWWxDZ2tReUQ3?=
 =?utf-8?B?MVRyUysrTmVXZHZyeDNiNnEzcW5aM2lnNUVndmxRWXUraHZrb093eGdMWWg0?=
 =?utf-8?B?RUlLREI2ejlia1lVN0xFM3RtZUgzUkFwd0lNWXFTbHZJREZCYlRGdnBnMWM1?=
 =?utf-8?B?WWFycFdSRmVzcXRyeHA2Q0U3ZWNHSmE3b24vU3Jmc24yeE9yWVlrZUx6NDFJ?=
 =?utf-8?B?ZmdLWHFhTEp4bUkxdXBLcndJK1Y2ekExUTg3Z0o4M084TVBDeHR1dy83UEwz?=
 =?utf-8?B?M055bjJrU2h0UlQ4NlREbzlkcXcyZmYwQ3dmcFhtZUdCMUNxODliSUx1U3o5?=
 =?utf-8?B?K3BSR1ZyZlI3N2FNN1ZnR3pJb1RXaTdQQVp3Skg1YmRRQ1JNYm1Xa29lMENL?=
 =?utf-8?B?T1FXMFlMeFlSTFlURDZyZDl2d0JpcWNWTzZHR2t6akMvRk1vRGV4ZVoyOFl6?=
 =?utf-8?B?N1hLVktDcTg3VnMvMFBQcXBMMVU1YkVJam03QThLZ0kyUys1Z2ZqUzZXQkpX?=
 =?utf-8?B?Rk1KSjNoQlZqVXF3Vmo3bzhVVlQ4T1BEd29Qb08rTFQ0bnRTZVlLZktJUWZt?=
 =?utf-8?B?WXU0MzFxZkQvZUZEUVRGQTVLa3RRa3Fvdm51alBrcUlvQ0Q4UVlKR1JWeXhF?=
 =?utf-8?B?VVhWTzdXU21ub2tWTUNETWVqRjFrcm5QdUFManU3b1R4M0tuekZVR1ltNHJZ?=
 =?utf-8?B?eXVLdEFUc0hxSWtyV2pDMWQxK3FseVYvQ3lUSU9wVXIxc0JQRnhzSzhub2J2?=
 =?utf-8?B?V0g1YytXUXpETzRFUlNnSXNrbGw3RzRkUkp2RDRCeGJmSU8rVm1nL1JhN0tj?=
 =?utf-8?B?aDFPMjE2ekRGVm5ETmZJYzE5S2JyT20yZ3owMHEzTzJ5OW1ZRjlSOXFuVUZ6?=
 =?utf-8?B?R1B4ekZIamVEK3RXVFh4WStZSTJCRFVoMXdXTk5iTmljQUU2d0k4VGd0LzVG?=
 =?utf-8?B?YmprbXhpWEZ1US9YMW8wdG5pU0hUWFMwcFpoNWpHY2p2bDhEOTZLMkZzVnB4?=
 =?utf-8?B?M3A1aHhoWTNpblZLWVJOQXNHSzZpdXpWbURzR0N5SjlMK0RBY0RxUThpQlZn?=
 =?utf-8?B?VmJSQU5YMGozTjZ0clNMMEpBbmZjQjBVR05Cc0J0dFkwQnFkcElVRlJzNnNq?=
 =?utf-8?B?M2tldTRxVnFGV1I5QXEvUFJSV25adXdqc2Z0aWZSSVlrSkFNMWJQQ0Fva0hw?=
 =?utf-8?B?T0hUUm5DUUhhaTRBUXh5M1ZhRUZOa2RRR0dOMXVkMTFCYUFjYU1xNERXYmla?=
 =?utf-8?B?TEkyM0VsRU5mY2QzU1BBbExOWEFseGZmYU81dVcwNEp6aUx3S3hlQlNpdk1N?=
 =?utf-8?B?RFVoUVU0bW52dVZ3a0luVUlYcmtKMk15TEJCWWxMUnRxT3h4bHM0cXRyenpv?=
 =?utf-8?B?U2tFVUtFVmpOVmIzRk03MFVzVEx5eVVBbGdTbW11aXc4M0tML3BiT1FIR1N0?=
 =?utf-8?B?a1NOOExWS2hBeWoyWHdlQ1cwZ1ZPVEU2d2hESTJ1ZnZvajBVcGEwM291ajZ4?=
 =?utf-8?B?b01TbEQ4RW1QbVZSaTVRNzZkNGM2bG1CeGgxK25HUG1TNTMrR01LSDVFcERF?=
 =?utf-8?Q?k4sw=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 21:44:55.7110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bddb9b1c-85d8-4824-e634-08de4e35ff64
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_134502_879960_0E4605B2 
X-CRM114-Status: GOOD (  13.70  )
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

On 1/7/26 10:45, Bryan Brattlof wrote:
> On January  6, 2026 thus sayeth Kendall Willis:
>> K3 TI AM62L SoC supports wakeup from WKUP UART when the SoC is in the
>> DeepSleep low power mode. To allow wakeup from WKUP UART the target-module
>> device tree node is enabled. The ti-sysc interconnect target module driver
>> is used to configure the the SYSCONFIG related registers. In this case,
>> the interconnect target module node configures the WKUP UART to be able to
>> wakeup from system suspend. The SYSC register is used to enable wakeup
>> from system suspend for the WKUP UART. Refer to 14.7.2.5 UART in the
>> AM62L Techincal Reference Manual for registers referenced [1].
>>
>> Previous TI SoCs configure the WKUP UART to wakeup from system suspend
>> using the ti-sysc interconnect target module driver. Refer to commit
>> ce27f7f9e328 ("arm64: dts: ti: k3-am62-wakeup: Configure ti-sysc for
>> wkup_uart0") for an example of this.
> 
> I think I may be confused. What is setting the pinmux for the wkup_uart
> to allow us to trigger the wake event? It looks like they reset to GPIO
> pins if not set. Is firmware doing this?

On AM62L, the WKUP UART pinmux is initially set by TFA so that it is set 
to the UART pins, not GPIO. The target-module node sets the WKUP UART 
SYSC register so that wakeup is enabled.

Best,
Kendall

> 
> ~Bryan



