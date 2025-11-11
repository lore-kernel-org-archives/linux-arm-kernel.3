Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAAFCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ri1rouVHKaiyVybKWhXGvEnSJJef/UKVI9Y7HLNUtX4=; b=P6dimKcx9og4TRcPd0fNYEkT3P
	o3o94gIC/5DbjKxghMduXuVHMBnjGkRAuFzTGjOfaAccrvNbqyACXFH4I2jq5kBsUAqm92Y7GVGAS
	iJCH4M6w28fDOUTijO4EQG337SlLe5dv6kF3GFicDD2RfPlbQxYXiQXa9RogPl6Wm58XhoDZtvHiY
	Zl5sKiRnCuFw6sKP8Gtz2IFQ90Z31tNA6wknPBkte8EOSX3reqLgN3J6WI0DOHsBmTcIEylQQe+x2
	BX9zqUKj1PDPA1tNkHeuX7TlqFXwL7YV2KLAKSTrRH3Aan98Qtb9IazBD0KJ9XwEQs5kedCb4Z8Ml
	GSFiKdKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIvSr-00000007m4K-2ZW7;
	Tue, 11 Nov 2025 20:59:45 +0000
Received: from mail-centralusazon11010017.outbound.protection.outlook.com ([52.101.61.17] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIvSk-00000007m1U-2KFj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:59:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHTiivqyNnUAQ5PyQUWLS1OfdSZW2+jqXcDhMiicchsBFVbcJmOjzUK6211DcvrRQCOWzwdQzYl/I8TB5pfUWHlKmfQevsM67mgiLH3lDI0cZVXLX+/f++Ji/zo0VO3dzIeIv+4Zij7SYB8bet7E2CP76nC5TeLkABTBqqgALTbZp9XXHsJvWX7CpjKuBvKlRkETKXaWSfe52ncA19olrtF3IxTMl14zU3gXWuTakMkZ0FOAoMc8/gOwajf0z9PjOMkhzreDQtZzypFf7avrTJVo/veU8g72AZMbXaL1BIuWKxh4qn48jtVg6RJJPvKqve7GnelMFz797gBxVfXPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ri1rouVHKaiyVybKWhXGvEnSJJef/UKVI9Y7HLNUtX4=;
 b=gL7auab2jL+sA4uk8bLWc/sf5D6uLFj84gvxSmW02GbhM3sm24EJjWlm1c4ewmmbynZNzJew7JQl11aq6KCSAn8R6VYVPEuHO03Ysr45aA7r00E5pCxU82ehkhJ2pVqqTQn/QZUtjOG3CeyQo7kHJgr8a4nBecS7QWNKQ7jTn1cmSyGPnsuTmtT5rylzzm8vXdkGogbz6FezkTdv74xTpiBkLce0bnLRZsiQsuzzgbQQiA6pYaqs6OuqAyF83ZZsHyNEOr4Y0UBKTnuk+SD+l9GMpBzhTZvbCvo4WYVjhzHBNnuALdpgGRVVABS8mcsUwZjCpTd7jUabJzl9/fPFsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ri1rouVHKaiyVybKWhXGvEnSJJef/UKVI9Y7HLNUtX4=;
 b=wF2Vo+FZGd5C/vzhlamlbbFTJvFGtS2ZpaJveYunGN+sFNEzIlu9vZRkbX9yjxVURiVeikZhEo3jR9GjRhRZkhP/baatL/B35laVro1aqn7oZKfTvoeYq0U4bUs9FCMZ/9JK3Z9YPu8yWTae98XrpbpxwIZM++Kn/5qeM500pgI=
Received: from CH2PR12CA0005.namprd12.prod.outlook.com (2603:10b6:610:57::15)
 by LV3PR10MB8060.namprd10.prod.outlook.com (2603:10b6:408:288::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 20:59:32 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::7) by CH2PR12CA0005.outlook.office365.com
 (2603:10b6:610:57::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Tue,
 11 Nov 2025 20:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 20:59:32 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 14:59:27 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 14:59:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 14:59:27 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ABKxQl21551676;
	Tue, 11 Nov 2025 14:59:27 -0600
Message-ID: <fd3a66bd-ef22-4270-b0c5-fdda2a9bb631@ti.com>
Date: Tue, 11 Nov 2025 14:59:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source
 system-states
To: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>, Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vishal Mahaveer <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, Sebin Francis
	<sebin.francis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>
References: <20251103-topic-am62-dt-partialio-v6-15-v5-0-b8d9ff5f2742@baylibre.com>
 <20251103-topic-am62-dt-partialio-v6-15-v5-4-b8d9ff5f2742@baylibre.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20251103-topic-am62-dt-partialio-v6-15-v5-4-b8d9ff5f2742@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|LV3PR10MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0cdd9d-b532-441d-92d9-08de21653663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3VYUElHcGlxS1pTOTBETkFmcUo0NUk2amVYeW1kT3pmZ0NaZGhZd2tuNVlG?=
 =?utf-8?B?Tm5xelhCTHpCWS9GOUFhY3VWY2RDOUdqRmJrNjViRXVzWEZhczVxcXg0Z09C?=
 =?utf-8?B?bkRCc3RwQTk2b0pDOU5MejIrSWNkNHNpUjhSRk5JS1JyRXhxd09CRG1Zc3lT?=
 =?utf-8?B?eXVTaDF0Yld2QVlmRjZ5b3laZ0hlK0s4OEhPUU1XdFBRVWo5VUxRMkpuMTBm?=
 =?utf-8?B?Qkt4MUYrNnIxV25MbDVWZi9hNGZEUnpCcHZRWTRWS0xEbkhmV2hRaUg3R3U4?=
 =?utf-8?B?N0dVTXJ0RE8wTDRRVTAwVFA1ZWhiUVpLTGsrL1NHcXV2QmtXVnBnbnJUZzRx?=
 =?utf-8?B?OFRXLzU0WWxzVG8rYzh0WGVKQUl1bFpBU2J6dklHS3ZBbm5qSExmV2k3RUNB?=
 =?utf-8?B?R0J5MTlaVlNUeE8vcXVmR0YxQWlKa0x0UXRBbFVIQ3VLZ0Ywa2x4bWdCTldC?=
 =?utf-8?B?MjRYRGJMN3hEWG5Ha0xEWEI1eGFhUGdGcHIwQnQ0L0p1ajFOVllzMHp0QXVK?=
 =?utf-8?B?WTlNT3JUczcxWm9QRmxHWXZyV2kxclZkM3pTbTdMZTdRekVWRHM1cHB3eFNT?=
 =?utf-8?B?MnI3ZVRsK1JOdHgyNVNZQVY2YTdVVHJXYUVUMVRnblZ1S3JxckVRaE1aRG90?=
 =?utf-8?B?K2E4RHJEVFY2N1BLUk5tcUtJaWYyWU83amlFZEpTN25VekduV2xzWmQxeHpk?=
 =?utf-8?B?YVI0S2RPY0Nqd2REaUFOQUJNSkloMVE1clBJQlVNeUIxY1RNVkpLTXgvZCsz?=
 =?utf-8?B?bmNDclNJNDE4WThvZWd3TFViR0FHemN2Zm5SbzZ3VVFFc0NiTnpNZUZNSm0x?=
 =?utf-8?B?THpqTU1VekhoMVhYM01vVnljYU0wUlU0dnVyUU1PbmVib0Z1SlRaUUUxbkFu?=
 =?utf-8?B?cGNPNjVIcm5Qc25iVk1lbytNZmtURTAxcU8zOGluOVhDTGx5VHBEMU5GWVlC?=
 =?utf-8?B?U3lOREdHVVJ1QkcvVU81R1NzS2crOU5MWm84b0tWZ0xIbFhXR0xDVjB2S251?=
 =?utf-8?B?SmxoWmpyUUdqUkp6VGljeVFSQk4yNTJSZ0lvcUFib0liUmVPUUlMdS9aeGR6?=
 =?utf-8?B?MmxJR1FlSUUyd1lCanFqNVRWU0VRSmFjRGdyWlJIMi8vSEVtSHlGUWRxNWxR?=
 =?utf-8?B?MkNwYzgreE91Y2NoQkVEWkhCY1dTWVJTZ3pyR0gzU3VzazAzbHVac3ZscmFG?=
 =?utf-8?B?NkU3Sm5QMDJZdmh1QUY5UUN0eXlxVmk0bGppZmgvUWh2L3ByRTNqVHBxY0t3?=
 =?utf-8?B?WVUvU0cyUGRPUkt0VzJBaVhlUFJwZEdpb29XY1RMS1hGZXg5dnNFdW9mdlFm?=
 =?utf-8?B?QzIyd21aS3hrUU5PTU9hTllmK1lpNzJRb1NqdmJjRzFjVFgvK0FiUVNBb01D?=
 =?utf-8?B?bDJvQ0NCaUJLdDdYN1o3UGkrQ0lIWHlmVlg2Y3hnUlR3Mk8wWnJMdk9wUFU2?=
 =?utf-8?B?Z0lqSk40d0dIdlNlMEVLWkFKaUp1aVdQcUhqbVJYdUl3R0VVdnByR0pXd1E0?=
 =?utf-8?B?K2Mwd3E5SnVGeHlPMEsvMDNqVytjc3pPc2lRV1o0REtuSEhhbmVyNUQ3aGdV?=
 =?utf-8?B?NUVVYzZ3OHQ2RWFTTkZnUmZvVThsVDAyZ3FKMFNGRG1xcXBqVEFYbHB4T3lZ?=
 =?utf-8?B?RmVxcHA0cVZ6cUREeWpoVjZoZmpFMld6UjI0SzFONnplMDJLQXIrZm01RmFH?=
 =?utf-8?B?M2tqdngzUXhYbWgwVWVUU0w2YUdtVCtrRWdNTGlsNkkxdFlRMmlsNUJlV2Rk?=
 =?utf-8?B?clVrUEFqTk1XaEFIUG1NLzkwV1VXS1B0ZUR0U3p4bUEyMDc0aHlsMmhZbU9C?=
 =?utf-8?B?WjlVL2hBM2p4ZVNPQmp4Q1c2VWl3VU01UmFuQ2pCZkhYb1ZjaHRvMFV5VU82?=
 =?utf-8?B?NHBkMmlGMWVZbTFVSU5MVGVsdExXR2FVRi9BNjFsUlkyOFRhVnczRTJ2YnF2?=
 =?utf-8?B?TEVNdFdZT2gzNFpxSFBIakJJcVVwS3RDMEJjUXpSZlFwZTN4M0l3L3lGNm5P?=
 =?utf-8?B?ZDR5cFYxaFNMdFQvb0t2L0NBT0gwQ2RaaVNKdmpUNGRrazQray9hRE81dFFo?=
 =?utf-8?B?RHUwTCtyWkF0bHduZHc3dHY3VTBOc0JwT29yYWxDcjNPZnliTWZGMkJ1S09m?=
 =?utf-8?Q?b+cY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 20:59:32.0073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0cdd9d-b532-441d-92d9-08de21653663
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_125938_640933_C5C08A1B 
X-CRM114-Status: GOOD (  17.71  )
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

On 11/3/25 06:39, Markus Schneider-Pargmann (TI.com) wrote:
> The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
> powered during Partial-IO and I/O Only + DDR and are capable of waking
> up the system in these states. Specify the states in which these units
> can do a wakeup on this board.
> 
> Note that the UARTs are not capable of wakeup in Partial-IO because of
> of a UART mux on the board not being powered during Partial-IO. As I/O
> Only + DDR is not supported on AM62x, the UARTs are not added in this
> patch.
> 
> Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
> Partial-IO. Add these as wakeup pinctrl entries for both devices.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 ++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> index ecfba05fe5c273c671cd0968f3eceaf54d22ac7d..cb63db337b2bc4c83b48dde693b95dd9fd93cd26 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> @@ -276,3 +276,63 @@ &main_gpio1 {
>   &gpmc0 {
>   	ranges = <0 0 0x00 0x51000000 0x01000000>; /* CS0 space. Min partition = 16MB */
>   };
> +
> +&mcu_mcan0 {
> +	pinctrl-names = "default", "wakeup";
> +	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
> +	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
> +	wakeup-source = <&system_partial_io>,
> +			<&system_deep_sleep>,
> +			<&system_mcu_only>,
> +			<&system_standby>;
> +	status = "okay";
> +};
> +
> +&mcu_mcan1 {
> +	pinctrl-names = "default", "wakeup";
> +	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
> +	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;
> +	wakeup-source = <&system_partial_io>,
> +			<&system_deep_sleep>,
> +			<&system_mcu_only>,
> +			<&system_standby>;
> +	status = "okay";
> +};
> +
> +&mcu_pmx0 {
> +	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
> +		>;
> +	};
> +
> +	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
> +		>;
> +	};
> +
> +	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x038, PIN_INPUT | PIN_WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
> +		>;
> +	};
> +
> +	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
> +		>;
> +	};
> +
> +	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
> +		>;
> +	};
> +
> +	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x040, PIN_INPUT | PIN_WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
> +		>;
> +	};
> +};
> 


Reviewed-by: Kendall Willis <k-willis@ti.com>

Best,
Kendall Willis

