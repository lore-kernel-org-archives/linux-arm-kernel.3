Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3861CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 03:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPmwvVL4uqd8MfKMyLLqUzMrCkZ+Y0nUf8O7x1eR7yM=; b=2Eqb51Mnyhl5s5BFoEsWPLy8Ep
	wR3G0J2wxqvIH4T/7MbShIFss6Lt9XwceRRQu/pXX4GGnkaFbt+rApFdCDupydE/lBjOZMpTDl9gL
	ra6KpGqV+sfXg2wd3I3Ejcmh45f3FP7QSqIbMn8SYK3zX9kPOuwmyq2j3hceP5ngKf6glmeeWmT4f
	XSMSeY36Zg5avyCtn/UGMzK9lcx7a8cmNOWuH5GUfswGeFeg5z0NPoETl9Cbw7tFbQPAmi3J/xwQQ
	KFyXNhAMsAzTWrgDfMyiCp9Wizy0tJUi+03hyXd93xplSsggKE49I061Pj4vwkEM/2MLguJmbYMW2
	D2zenZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFleG-000000099ek-3KSx;
	Mon, 03 Nov 2025 03:54:28 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFleE-000000099e9-1dsd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 03:54:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXMPUsa0iZKpqqHilS44Efuj6mEiJcUCtOcylbJl1+2vTx5bjrmMDf77Zr3lrcM0wwHq9j2f9umZqaA8UHG8ByVyUeLqpwNfCKtW12MlwfP/LiNnANTv4XZYQhyJWxjJM7OYPE4t+n1I+jC/K3UCtc2keBcr5p9zpbRa8aXrRz7/qMKoOFEBPhGiimASDtrVrMshQ83XmEfw9m7LDIjZvm4mewKkW99Dyg99daylF2i7wWg+30TcPeTj7fBUWn4SSTRv1KLvBS90AwNCiqTt7zekjqK6aj++EGVZUeP01FJQ2LQpCpM+NW75M/CLSdIcNAk6EfpvvAZgrxHg3cCQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPmwvVL4uqd8MfKMyLLqUzMrCkZ+Y0nUf8O7x1eR7yM=;
 b=KbXGZz58WwWEN+8hJTQE/wNkFEX+G7lC8ebUc1oSSqMdiIu2JlY7mkOdzYlDh88/82jX5oYOXAMeWRiUQq9YqeiR9FccfFvBk7gIakoXHqOp+99aNLuYMX7NgqZoipw3+NNE8wJsI/cCfoLYAX1/YbcBspbotZeXBNCcmPBlzlXsAtOcJkhz/R8ixTNB8GebcIBnsvkh9WYfojDhoQVnKFTOOns2EMc92wFegsBbemhrkN6tzK2Y56cry0DAlZeuQfNiS6jQ2/2bhQL29//667+F5tBlR50Xu7Vb2+KIpkInY5atKWoPli1lyJ7Q3rVV8FMHZ2XdfKCIC0mlBlUhLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPmwvVL4uqd8MfKMyLLqUzMrCkZ+Y0nUf8O7x1eR7yM=;
 b=Dp73vcpsUvKBPjLzVxtUXV72Xghyf1lBrdHrB2kDM283/c6YZDApwT1RgFQL/nEAPckjdeMnkAf511SITigxcLzNeDl1JnSa8XzVM/3NAyQTREaNznLsz28GBGup6hBEui2pQ4vRm7BehxLTSZ0R3RRaFsAJZ12JI+WJcNqhRjc=
Received: from BY3PR10CA0023.namprd10.prod.outlook.com (2603:10b6:a03:255::28)
 by IA1PR10MB5897.namprd10.prod.outlook.com (2603:10b6:208:3d7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 03:54:15 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::73) by BY3PR10CA0023.outlook.office365.com
 (2603:10b6:a03:255::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 03:54:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 03:54:13 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 2 Nov
 2025 21:54:12 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 2 Nov
 2025 21:54:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 2 Nov 2025 21:54:12 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A33s7ot3445729;
	Sun, 2 Nov 2025 21:54:08 -0600
Message-ID: <7a5bc725-1475-4e29-bb31-c257e397be1b@ti.com>
Date: Mon, 3 Nov 2025 09:22:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: ti: k3-am62p5-sk: Set wakeup-source
 system-states
To: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vishal Mahaveer <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, Sebin Francis
	<sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, Akashdeep Kaur
	<a-kaur@ti.com>
References: <20251030-topic-am62-dt-partialio-v6-15-v4-0-6b520dfa8591@baylibre.com>
 <20251030-topic-am62-dt-partialio-v6-15-v4-6-6b520dfa8591@baylibre.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20251030-topic-am62-dt-partialio-v6-15-v4-6-6b520dfa8591@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|IA1PR10MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d550bac-9714-4397-511b-08de1a8ca71d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2RNMU15WkNYcDZWdncvUnVwdTJlMkVDbGtZRUM0SmR0QUNUWmhVdEYwK01n?=
 =?utf-8?B?U3BWMTNSZlE1V1hrcEdjR2RRdmJCWHBlaXRYSXFFMC9DRXZvcjBVMTNvd3lq?=
 =?utf-8?B?UlViV00zQzJuellBUEV6THhUVFNxc1FJOWp0NkZwV1MyREVZd3Y0NzNxV2tr?=
 =?utf-8?B?eWFEeHRpb05pVWRIZCtZRkdSdTlvbnFDaXo4dU1YZVZYSHBtZ29KZDZnejdm?=
 =?utf-8?B?R3ZRY3VncFhDNXN5eWxuNG51NGdvUitrekVuMCtQRW5mNy9kR3hRSmRQY0F6?=
 =?utf-8?B?U2RWcHJrRXZtZzZFcnN2aDZrWVJJQTV0b0p4VVlFQWcxTXAvMkhxOUZ3Ullt?=
 =?utf-8?B?WS9UL1BDSDdBU1RITTAyQ0dvWVg3YWsxUEhaSkJSRjdFTVA0L1lWTSt4R3Fl?=
 =?utf-8?B?MytuaWF3amxhRzNxOFVFQjBHeGhOZ1JwUitDWlU1aFlhQ2VyQ25OWm1DcnA0?=
 =?utf-8?B?bjJrb3NhbDJIdjh3aDNqYWd1dldVbUl1OFJWK09LWVF3STRNQTlCdFBBV0hj?=
 =?utf-8?B?YlZMMnZmNzduY0pmOURYMDJYV2o0TE9nQldJQTNhZS9lZFRRaVBQSjlTN21l?=
 =?utf-8?B?NTVlKzQ1V3NoNmdBMkg3NGhJTnp2VlZkVDdhTFpsaGhCMy9ydW5rS0dWV0da?=
 =?utf-8?B?aS9uRUxoWDZOYlhzZWpBMUduRmpkeDZTN0MvMjgxdEs0TWZQU2M3MXNveVZ1?=
 =?utf-8?B?Q0RyK08vbldrbUVBVlZzalZCakl2UVJVNEhTa01zd0VMNFFCR3dYakp2UTJP?=
 =?utf-8?B?RWN4T1J2Zy81QklNbXhFTElLMS9JVjBsQ09MdGtZU1k2U2NZcTlnQUxzRVMz?=
 =?utf-8?B?NEk1Q3czTHdmbjlzeG4vNDJhOW1BZlJnYmJ5RllYQ2hsaEgvSzFBQTRiZVFn?=
 =?utf-8?B?N3dDUzlMVFNtV3ErNVlRZ2Z1SkRmV1o1K0x2MXpJWnl6Mk1uQWNraWN3ZzV0?=
 =?utf-8?B?dlZlZVRKYWdDZFpzTGFTaTNmYWNoZkk1bDFqYTNCYkY1cUNiOXh4NGZEMFMv?=
 =?utf-8?B?M29RcEtaWC81UWZtaVZyNkJxS2FZWmFPNHN2elByQzNEVGo3Q0tpd0xDNk1G?=
 =?utf-8?B?YmNUYVJrSVlUN2NHYmpaamNNNlZYSkxHRjQ1bnBSd0RuSGswTC9TK0FxSGNp?=
 =?utf-8?B?SlZVdXpHSDNYeGtyMUhKWWRsVDJJU2ZSV1B2Sk9keW5ZQ1F6M1B2R3N3bzYy?=
 =?utf-8?B?VDlhcEVZdTQ3Wk10QnprSWM0NnRXaU9iVExHK3ZaZXphb0xpTlJKank4ZExn?=
 =?utf-8?B?VFJtT2N6TlcxbTVSQVVUMVZNNS9NbGdVbkx5QmJWeHgzMVlpdXg2ZXN2UFJQ?=
 =?utf-8?B?MkI0cVZxZjZ2UnR5TlJqaTkybmJsMWI1WHRSdE9tcm5rK1VDZGVBRHNScWNC?=
 =?utf-8?B?aCtzOVNBNDBlQ0VPYW5VdFlvV1lQbGtCamtWRXlQNUZYT09QVWpCTS9WQ1ln?=
 =?utf-8?B?NjA2ZnBieGdmVXNHVlpNMjNIVjVraGFPK1lVQTNRQUsrNk9qcFIwQVdMNUZP?=
 =?utf-8?B?ZHFmSXZKelJJcnJQR3RRK3NYVUNiUFFTTG4ydmlJb2xSejdneGYwQ2dOMWRQ?=
 =?utf-8?B?dUMwTUxGc1l5aGJBR0ZsVlkzQzRhNURrcEhCaExNaUFUdkpPMGJzTi80UGhZ?=
 =?utf-8?B?RHMxbXRPZjNXeVI3d2NkSTl0QzE0eFU1NVhGbGlPdXNJcHlUQUxFcUJvdDN2?=
 =?utf-8?B?c0pETms0RkVwVVMwbEhaVklqek5KNWYybEVzcXlRU3J5L2J5NC8rc2FpbG4z?=
 =?utf-8?B?ODM2SkxLRWFNQ2lYSW8rSldGc3Y0YUkxSytsd3Z2OXVBYnA0RHNnbC9Zam8y?=
 =?utf-8?B?aDJTeHhMbHd4YkxhemZPNnI1K0FSVFZPSU9qZVJnQ21sczRzQzM4TkxmNm5x?=
 =?utf-8?B?eU1MM2tETFBpN0dPbmR2a2JhMXJ1bGdrbXBBZ045ZFVhVjNDR3pKdi84OHl6?=
 =?utf-8?B?S1RTcHhHQWhXbXFhcGlVSHhqNjYrc3YzWTloejhidEtsSjVHR3hObVhRQk92?=
 =?utf-8?B?N0JWaG5vSmdWZmVuQjBucXZsL3RxcjFCSGIwa1RwVzRia0NUblFKUFp5STc5?=
 =?utf-8?B?NmtLejkrZWtpOHhsN09VS29iVlRoM1dicGgzQVhsWWZOdUF1ZnR1SGlIVDVZ?=
 =?utf-8?Q?9x8I=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 03:54:13.4013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d550bac-9714-4397-511b-08de1a8ca71d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5897
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_195426_662739_44B2EEB5 
X-CRM114-Status: GOOD (  16.88  )
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



On 30/10/25 14:47, Markus Schneider-Pargmann (TI.com) wrote:
> The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
> powered during Partial-IO and I/O Only + DDR and are capable of waking
> up the system in these states. Specify the states in which these units
> can do a wakeup on this board.
> 
> Note that the UARTs are not capable of wakeup in Partial-IO because of
> of a UART mux on the board not being powered during Partial-IO.
> 
> Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
> Partial-IO. Add these as wakeup pinctrl entries for both devices.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 71 +++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index a064a632680ec69dba9dbe591fd49caeb9ac1111..36116210fbe6111ee8bb9a1736ed02bec0f20b67 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -716,12 +716,52 @@ AM62PX_MCU_IOPAD(0x028, PIN_OUTPUT, 0)	/* (D7) WKUP_UART0_TXD */
>  		>;
>  		bootph-all;
>  	};
> +
> +	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_MCU_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
> +		>;
> +	};
> +
> +	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_MCU_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
> +		>;
> +	};
> +
> +	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_MCU_IOPAD(0x038, PIN_INPUT | PIN_WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
> +		>;
> +	};
> +
> +	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_MCU_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
> +		>;
> +	};
> +
> +	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_MCU_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
> +		>;
> +	};
> +
> +	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_MCU_IOPAD(0x040, PIN_INPUT | PIN_WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
> +		>;
> +	};
>  };
>  
>  &wkup_uart0 {
>  	/* WKUP UART0 is used by DM firmware */
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&wkup_uart0_pins_default>;
> +	wakeup-source = <&system_io_ddr>,
> +			<&system_deep_sleep>,
> +			<&system_mcu_only>,
> +			<&system_standby>;
>  	status = "reserved";
>  	bootph-all;
>  };
> @@ -763,4 +803,35 @@ &epwm1 {
>  	status = "okay";
>  };
>  
> +&mcu_mcan0 {
> +	pinctrl-names = "default", "wakeup";
> +	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
> +	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
> +	wakeup-source = <&system_partial_io>,
> +			<&system_io_ddr>,
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
> +			<&system_io_ddr>,
> +			<&system_deep_sleep>,
> +			<&system_mcu_only>,
> +			<&system_standby>;
> +	status = "okay";
> +};

Same comment as 5/6

> +
> +&mcu_uart0 {
> +	wakeup-source = <&system_io_ddr>,
> +			<&system_deep_sleep>,
> +			<&system_mcu_only>,
> +			<&system_standby>;
> +};
> +
>  #include "k3-am62p-ti-ipc-firmware.dtsi"
> 

-- 
Regards
Vignesh
https://ti.com/opensource


