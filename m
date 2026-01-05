Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE3FC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jp7MQqagEa6w2rQ0lkR5RqvUXofducAHNtUH+IUQOgQ=; b=AK/uUL8J1EvFsi0ukC9q0EjAI1
	IWTpMN8Dvg0up5VuW3SXB5FW/UU+EX0Knl8ukkj6FnFjcafF+cjQNyaJ9soP6+kN+29ca4UrwhCYp
	x1rGTipaWEeqF5NnMHAAvqyJ4hYEvOgLZtaVOVGGKq8FhDfisLrovOnMnsz/TCNMpBHfqtGpV6Iqb
	rCJRAAnyxGfLybCHKsHwxNddCgdHOOxEHxHooXwCKt9Kctycb7AVemMc6ZoTMh8Sxl8Z6kNhxLKaj
	MO9ukYYlZTnThTPWjl7nmry0p7C0imTJ97CWpCuzUkk7H2xstPcIiedDULUh1h3vzFybV4YIdzlLF
	DUZ6OBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcl9R-0000000BVkX-1bTA;
	Mon, 05 Jan 2026 14:01:41 +0000
Received: from mail-southcentralusazon11013039.outbound.protection.outlook.com ([40.93.196.39] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcl9O-0000000BVjn-4Beg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:01:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeU3kE686I0orzUovxbINAn7M2wnh7ZNxS5Y05ISEXa3zCAapof7qjZnGT9tm2Ztn9XQ77jKiLPqGtMYFv7/7tUvFkq3AtVeeJ6iBfFwkFDN5fI7w4N18Zjig56BlUy9RJCe4n+Q8ko5DAT+ZUEifNgHGJ6i9/hnMuv+r0fKzmEO8PP/zC5a+9HvfJksn2Qi0HCrYv+q5LY/mzvYW13X7MxfUvX6UgP9AzKQi1LWR//COmRw+zI6ZNVgeSTjE7qEedyuCCYvUOiNZLDip/eLHaXSjmXs63h1r9Nd6fJ7Imh6U3HkrfWytyDnM+l5q6ayCMFhIXBq+V1BfYbKFiYCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jp7MQqagEa6w2rQ0lkR5RqvUXofducAHNtUH+IUQOgQ=;
 b=FuVOYd7r5RpaN/p21GxZ5gLzEQcWF6tmisC5uY79mc7spZ8jJr1vyk9rkDmp4yCHXJY8AMBvQuNStfUvnmMqBM1a346VbRqlaI3REfLlka9EbqQ0mLFP9tXDqn29Aa2HrXtR/4yxKz/iXafTA9DE5XphXDFDwAl1AF/f957G/BDP/VuB6LUluxOcNalCH3eJU+NHycjzNgpdIkF7NsZ4n8MbvdQFeY+NzZVL/HrWJhmxDWGSPzi1GYoB8H1i2t9T1JYPXDhxLeE4Ss4vE11wh5+g8NBZedSuQJ/F6fTQ99S50vqhl9Y1BzOWKB9f7kOkAgKtWn3ejfa+O7kE7+f/Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jp7MQqagEa6w2rQ0lkR5RqvUXofducAHNtUH+IUQOgQ=;
 b=TmP9dpiAYWpgzR9OzTxPit3AbvQPmLkhXRnr1CTHJ8NZ0cCpByVLl+OudJkoQpDPX6QZUn0aGkynES93TZlsBKYT7Pw+hSMjV/v9BMepfoWQzOeNdpFvTgQkdciJ3wt6tqEyufEAOysc7Cih3t28EWkT/LpTPBSOmxydsP20Grk=
Received: from DS7PR03CA0242.namprd03.prod.outlook.com (2603:10b6:5:3b3::7) by
 BN0PR10MB4821.namprd10.prod.outlook.com (2603:10b6:408:125::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 14:01:33 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::8d) by DS7PR03CA0242.outlook.office365.com
 (2603:10b6:5:3b3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 14:00:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 14:01:33 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 08:01:28 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 08:01:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 08:01:28 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605E1SWp1252627;
	Mon, 5 Jan 2026 08:01:28 -0600
Date: Mon, 5 Jan 2026 08:01:28 -0600
From: Bryan Brattlof <bb@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: boot: dts: ti: k3-am62l3-evm: enable WKUP
 UART wakeup from LPM
Message-ID: <20260105140128.bd5tiheg3k6y2tyd@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
 <20251230-wkup-uart-wakeup-v1-3-cd6e15f8d956@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251230-wkup-uart-wakeup-v1-3-cd6e15f8d956@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|BN0PR10MB4821:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff8150f-9a75-45ee-d184-08de4c62eeef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGJ4RW1tN3RjdVA2QVUwcjFSU3J6aEVpTXpxUEpaYkd2WHN4bW1XZjNXZzFT?=
 =?utf-8?B?S2l1T0NKTWdOcHNnYldFSS9Ra1lPYnFtRjY2SU9wZTlUakJ3WEplV3krL3Jt?=
 =?utf-8?B?emFzZjhKWUxEc2Q1ODZzYUduOVdlUWQ5Z3JBYXlTQmcxcG5vMGJxaXZvbE1B?=
 =?utf-8?B?Tml5SVZiVm9LMHZldXkwb2VNYXluVTZ3ZHVITXZUOFhyczI3YzZZZTJlWWkx?=
 =?utf-8?B?M2RxWTZqZ2JoV1VyZzdmaGs4dkRiU3R2WnFiM00zbXBaR0Q4OXpaOXlrUll2?=
 =?utf-8?B?NWVwYWxYWXExVjdWdnYyaEYzWkNhb3lCVHErbVdvTFVyTVQwak0yRUJMMHNp?=
 =?utf-8?B?TE11N21EZFVYV2hISkJKRWMweCtna2JndU42QlpVT2ZXYVBvVmorVklBTDBB?=
 =?utf-8?B?R20yTEZ2RzVwSnYycGRuQWdqRWxtcHFYQlBpdmNjYTRrRWExNExFbU9GS2RB?=
 =?utf-8?B?dmVJcVZKNmYzZU1kTER2Tm5vZXBJamZQUmN6djhOL3p3NHUxVGtVU1Q1R2RL?=
 =?utf-8?B?eXdSaDJUNDlJbFlGRGx6WXZuNEUvZnZ4ZjJETlpvMTNtN21JbTB1bC9vclNo?=
 =?utf-8?B?b3BmNmt1MW9qME13alRFRzV1ZVBYWkg3Wkl3UFR0R05qN0g3Ylg3Z1Bra21D?=
 =?utf-8?B?amFNR3JXNmNmZ3p1RGhSdjZKODdESzJjL1V2WXJPSUhvVUhQeFpYQjh5VW1n?=
 =?utf-8?B?NXRhSHVaaEhzL3BkdXVZU2JmTFNSbTg3eFBFbmNrcmM0WUU1ODd6WEN1OStP?=
 =?utf-8?B?V3k0MmFFR3lKLzc5YTBqYzJDb2xhRWo2djllaEtqdWd1RXEvK3Jlc296ZVJT?=
 =?utf-8?B?TnMrSTFWTHNPTG1IVks4ejJCcnVsR1dPL0dGdWsyc2RBdHJQRmlPcUd3SHFX?=
 =?utf-8?B?TTd5MTFwSnFBQUlrR2dSVFdrR21raEQvak5FS292Q0hYODRNeGZSSUpzbUJO?=
 =?utf-8?B?S1I2M0RFWmFDaGVzdTNQaDBTN2FHOGNzMGZHT09uMzRWWkRWUCt1enN4RndP?=
 =?utf-8?B?aHUyWkM2d1lvMXphYXo4TXVldUp2Z1VSdmZvejcwQnROTjQxUnR1NkM5eGpi?=
 =?utf-8?B?WE1IV1VXTnYwOWg4cXM1MlJUOXVTTmNTNTZLaHQ4Wlp6NlJDMXdHMThFaWUr?=
 =?utf-8?B?a2V1cHUzVFRYenhZeElGTjdKSTIzRjNkdmlkSFdkeFV2QlJXWTNqck9SZnZ3?=
 =?utf-8?B?akQ1bkNiMDAyZUxma3N5a054MXc0NmdJTnk4a2RPMlIvTmYrNXd2Wm9velFa?=
 =?utf-8?B?eVg5M0R2d21rRzhmMkNJSXZ5dXdXRDM1TnFGUjZMelBIUEtHUGtWdlJZa3Z0?=
 =?utf-8?B?UlB3RlpaOVBYY2RZU2JGYlY3Tm9pQithZFAxSG1oMFd2NHRyMkg1eEJhbVI5?=
 =?utf-8?B?a2NYQjY3ZlVlQmtxOEpNMkRPZys5c0VKa3l3b0Jodkh4TXNUSTh5bit2Y1BV?=
 =?utf-8?B?Mm1oRW5LK2FtVElUcTZMQXFHektla3A4Tm5vQzlMbjJmK0FaaTNSK3BiNjIv?=
 =?utf-8?B?L09TMjdtUnAzWFJ5TFp3SjhTRVFQNTVVNWwvVjNReFdlUi81SWtxM0s5NTZF?=
 =?utf-8?B?QjN3anVxL1Q5UXYwT3J0ckFnUEtrS01uSmdmSUpDSS9WQUc1bDRoK0VaZmtZ?=
 =?utf-8?B?V2ZsclRvM3pKRlVHZ0s1NzhMUmQxeVF0WG96ZHpoRkh6WkdOSGVXNFJYb282?=
 =?utf-8?B?RmQwbnR0cEl6U1YrQ0lCdVNIejhUZFpxZmM0R2RZN0J0N0hMSnVYei9kcXc1?=
 =?utf-8?B?Y3ZSalZscHJRT1l1UEFrTm03SW1wOGVRY3I3NEMzdk1lYlNCN2FucDR5WFha?=
 =?utf-8?B?QjVnNzlvQThoc1praTV1dWZRNFRwOWlVVTlkendpVGpTL1NWczFJMGRXOU9T?=
 =?utf-8?B?WkVzSWM3amNkaDR3elZFNDZLVWlxbk1TQTE0b3dUbE9BdC9WQnEvVFg1UzA1?=
 =?utf-8?B?VklxcjY4WVh1cXpVaHlGMGlZTjRBV1k0Q0hEME5sai82QkhtMHd2elRuK05p?=
 =?utf-8?B?QjZVOEplbDVNRDZkRnNVTi9MODZCSWM3b3Q4bVIxSXpSbFJ2ZzhZbHRGN1ll?=
 =?utf-8?B?QmJKQnZRWFA3bkI0MlUzSm1wMzhzd1B6Z1VuUzVBVCtDbEVKa0FJUGdnU1Js?=
 =?utf-8?Q?Hb2o=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 14:01:33.1379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff8150f-9a75-45ee-d184-08de4c62eeef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4821
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_060139_034991_B5FC0EFF 
X-CRM114-Status: GOOD (  13.39  )
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

On December 30, 2025 thus sayeth Kendall Willis:
> Change the status of the wkup_uart0_interconnect node to enabled. The
> target-module node sets the UART SYSC and SYSS registers to allow wakeup
> from WKUP UART in DeepSleep low power mode.
> 
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> index cae04cce337366b50928d39b0c888550b14e43d3..02b1a1c76b2ee05d49cd69d199a6aacdb1973fa0 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> @@ -359,3 +359,7 @@ &usb1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&usb1_default_pins>;
>  };
> +
> +&wkup_uart0_interconnect {
> +	status = "okay";
> +};

Does the UART need to be enabled as well?

~Bryan

