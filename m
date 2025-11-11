Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A129CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCS2g9vs9JWPEhNkH9Y5+N3Fwj0PY7DH+/W2TNHcjvY=; b=ds3JHqIUByR4ByiQHpbOvq6VVy
	7JL5eAcV8EMqd1uqiCU99MRIQBDk9fTaAbLcjE3AAONgznmxhQ7grpW5yEGTLIiHrw62yd/xps74u
	8W9qaQu9zNwB3rBTd+BtY/OokiLf73fmbpyTtFcBzpePGZShyJ7F4gJmfBO0YfyFEZCda+1eVaLY2
	zNG32nDPJxOVpDyhPLDZiAWGj12LLQ0WfhAnN/IHpngLcWlCTw9dtI2ezXyQF/A83Uk/ACmOfPXOS
	88j9Un6LCmX9bjLGmuRklpiIV28g1rqb5hQnI8RxjCnnZSQ5kuXQF1TlmGgSgnGTlxfoybIodPpqM
	ErUdyDkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIvSh-00000007m10-1IeQ;
	Tue, 11 Nov 2025 20:59:35 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIvSb-00000007lzb-0L0j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:59:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dofzU/sicdiehfAXuR7Jw2KUIPp50cJCGiXRpXeRt+31YZmT3AcWv8wCzK/E5OoMo22k/CWQviHdCp36a+P7KZieWc/fG+ya126A3wwS9GHP/cacmtCZ2Yv5vWeFnhM837bdlpfJTTf+jiyEXi3C5IQSs4Uu4hcMJhWx2Qob0KLQDLVfZWx4dAte+TfT00Ai0yBBbWwLhKDyFPBvRz1eImibx1sXerju1GWzBHCJo5x3JJUj7q36IPFQEwSO0H0yrDu6/L4PuofHzBykS0Exqvoyt3noPxhzAqQpZ5A2dzXSCS0u68xeOZZZSacTaSlj76I+wPrpok0Mm3l7r2m9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCS2g9vs9JWPEhNkH9Y5+N3Fwj0PY7DH+/W2TNHcjvY=;
 b=wYjdfmyZWHEjd6K599ASco6ZYDJFFropUx8UZJ4htCevlwTmsxZyRQkyrhkOO0jeQVZsmf3ESPLwmS+aXinvPrFzMqS+M0DGI5vqNSgnZTn6B0Mkp01/z5Cry00seX1TB1+X/8SZ44g0Xw3jEha1Lrj/a0jBkC3PppBXodYRYb/0MylxSG8fTFpVLT/r2jgcUZjmKm+EF7ZNmCdK6dUDuaCU+WDVyca2+pNaOKNF1jinlB5piolyTy5aFrVSnsXmHviMNCsTTzqzeSQ6eAw6QEHSmil7p/6N0Xy45rS00fJiMWHFPcfiuZDuxe/uCBvbjpqLuAA1DOHjdIPgf+1/OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCS2g9vs9JWPEhNkH9Y5+N3Fwj0PY7DH+/W2TNHcjvY=;
 b=vH1Vt7DhuSqAZs5TgQX7KzuA0XOtGNJDiApUhYGn60hXGb+3LHmhf0YfuRUH9kzpKuc8AOphuqb3r81ZxcWt2sVfYM5/XXRxbGNPIOiWAMzCv33mWCvqH9B1eKTXo0duHGms0vX9gGUBY/pAYljvIeKcLqM2jW08Z4xwb/6EGqg=
Received: from BN0PR04CA0134.namprd04.prod.outlook.com (2603:10b6:408:ed::19)
 by SJ5PPFC322FD87E.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 20:59:21 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:ed:cafe::38) by BN0PR04CA0134.outlook.office365.com
 (2603:10b6:408:ed::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 20:58:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Tue, 11 Nov 2025 20:59:19 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 14:59:12 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 14:59:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 14:59:11 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ABKxBkc1518807;
	Tue, 11 Nov 2025 14:59:11 -0600
Message-ID: <3748f05a-34b9-43e2-8623-4f5d6ed599d1@ti.com>
Date: Tue, 11 Nov 2025 14:59:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] arm64: dts: ti: k3-am62p: Define possible system
 states
To: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>, Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vishal Mahaveer <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, Sebin Francis
	<sebin.francis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>
References: <20251103-topic-am62-dt-partialio-v6-15-v5-0-b8d9ff5f2742@baylibre.com>
 <20251103-topic-am62-dt-partialio-v6-15-v5-3-b8d9ff5f2742@baylibre.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20251103-topic-am62-dt-partialio-v6-15-v5-3-b8d9ff5f2742@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SJ5PPFC322FD87E:EE_
X-MS-Office365-Filtering-Correlation-Id: 7629520e-86d3-4f7c-5e1d-08de21652ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3NWb3UwRFdURWNYdUtvUC8yWk42WE1aWXFUamNWeis3VVl6b1AzZFNaeG13?=
 =?utf-8?B?RUsvVTBTUjcrcFN6Tk44Yjl5cnZ0TXpqdnN0aklXNUF6Zzd3VVF2RDdRbGdQ?=
 =?utf-8?B?L21rSXYrbFhWc3F2WXY4TVAvR3hXWWpyVkp2bmgrQkdIa2l6TVpuVjRNTjR4?=
 =?utf-8?B?cUl6ZHRJT1gzTm8xWCtJbjlXaEtiSzZ1NG9DWEVSZ1BTVEE3YmFIMlc4ZWMz?=
 =?utf-8?B?bXg1KytDaUVna3F2WHJaNVdoZ0V2MUg3UmdWaGx4cWZjejVCNi9JU3ZSOTBO?=
 =?utf-8?B?ZU9PYnlLQ09FOEYyY2taNG16c25XRi91ZEpYVDRIaTJMLzBYS0VrSlFKb2t5?=
 =?utf-8?B?c1JCSk9vOC9lU2RnVkwySXdBbUJzWGRJVU96RlVnRXh4blhmVS9oTjJkVnBX?=
 =?utf-8?B?bURoY281ZEdYcGp6YktjWEZQc0UwMVplajFHYmtoeGhyRHNKdGxWNmxUcFd0?=
 =?utf-8?B?dHRrZk1WQkUrUXIxeUYvSC9HU2srSmZUM1JpdHlKUzdrcHRnUFk0eGx1VzlK?=
 =?utf-8?B?Y2RIMVpoclFiV1F0MUV3UWplTVlzSVdMZTVIWFBMa3U5MS9EbUNGeFFTdVRI?=
 =?utf-8?B?UnNBLzF2MldMdUZlY2RvaFc1SGRtME9HSXpzNUZlWTdIN05lakYrdEhQeFUz?=
 =?utf-8?B?akVqNXBqU2ZGcDVlZmdoK3FhN3BCU3dXU054MVRCN0xEYjd1aDBLeVJZcHd6?=
 =?utf-8?B?eVFyUGsvNzE2dVBJN2ozZGxyaU9SL2g2Q0NOdTkwNWdYVXFTVlhWUXhhK1Rh?=
 =?utf-8?B?ZEZkZjc0YXVPblMwaGkwNS9jMThnV3JJaGx0SGdoNHk0enNqN0NQQytQblAx?=
 =?utf-8?B?bGNpL2IvY1JUUnJXYVloaVQxL01NcG4xWXNOaUpqR1ZjYTBvQTdFblBydE82?=
 =?utf-8?B?M29ZbGRQMGt2STZ3eXlicjBmNEFRaENiQ25sUDJkQjZWd0dQOVRTRkxwN1Rl?=
 =?utf-8?B?ZG1pMDVSUU8ySEViV1ZTVCt2aXZOYy82SXNkUVhOY1dCblU3ckVqMCs0azE2?=
 =?utf-8?B?cDVFUjFCTWFCVGsweGxZZGhyZ3hqS0xLalQ0cEcvY1lqVFVBOSsvQXJlYUZp?=
 =?utf-8?B?WTZaWDhYdUY2SUJraGlQYTEzY2NiVWMwb0crcXc5YXcrTFF1WEF0UEVJc1pD?=
 =?utf-8?B?VmV0N3hWQkR2NWRQTndleG9QMnZuM0pTR1NaZ2gvQlVnUCtST1AwVjBKN3BE?=
 =?utf-8?B?QUxOMUxXMEp4WFlaZHRkdXdLd25Kd0JtbDVlaDRNRnZzQ1N0Q1hPUm5QWFZx?=
 =?utf-8?B?SUlZT2dNZ1VUK3ZIbU15Si93ZUZOaGJiVkFUdVpYdFRXZXdTNnZpSEdFRFV4?=
 =?utf-8?B?cFZsRmxYYUJ5ZEk4WGFHQXV2RlJNbFJ1dE5wdExkZWp0Y3lWODlkQ01UZG9Q?=
 =?utf-8?B?LzBKbWMyc2NhMGhaTmJUTDBDTWVXTXAycmNUb0NaejJvU1ZoMDV0UDhicnVn?=
 =?utf-8?B?UnE3Q3NOak1TSElFRW51WmhBc0tHK1AraFR3QU9IbVYrdXNSQkNWb0RJdlcx?=
 =?utf-8?B?QlNkM0NZL2NPVEdsckVQeUIxNE85Yi9LT0dJdzYyZmhYUU5xQ0dWZUphSkhD?=
 =?utf-8?B?N1Rybk5BSWFUOWE4cm51MTRWTDdTY3RZdE1odDFMREdxTi9GOGdnb1JqVXJy?=
 =?utf-8?B?WUlNQWQ5V3hLUlJMTnRzcmhjdEcvcUZsM1pLMklMeWdhc0RTRGNhcFFkRWcx?=
 =?utf-8?B?aVY1MTZLS01zZEpKV1ZoVTB1RkZkTUk2QktOblJqT0J4VUs5VFpYVkZMQ2py?=
 =?utf-8?B?ZysyTHoremFMSm43SXQ3cWJpZE85K1YxdkJHUGpOZGpsMFJUTks5aWR1bWsr?=
 =?utf-8?B?Y0hoY2ZPZUVBbC9GcloyeGVFcGp1NUhGNXd2Y3M0ck1ualJsRnJRU3hDelNk?=
 =?utf-8?B?TGJOWnJOcjJDMXJLOWJNUjczQzFualVRWHVwK1FhM0Q5NWhqSnRVTEdDNUJ1?=
 =?utf-8?B?MTB4RkpRc1RlYmpiMkFhWnNxRUY2NGQrN1NXcHhYdWpqNTZ4ZXhWOHFhY2V1?=
 =?utf-8?B?UVYzemc1bDdjWUI1V1ZPNjJFd1pRVEwvN3VHMUttWG1URThPN1VRWE90eHBl?=
 =?utf-8?B?MnNIOVFQYmpCNCtRTWJsSjdiRk4wTlovdnF3VGphOTRrbm50RjVESFJUejYv?=
 =?utf-8?Q?FEJY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 20:59:19.2049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7629520e-86d3-4f7c-5e1d-08de21652ec3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC322FD87E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_125929_129093_695F7143 
X-CRM114-Status: GOOD (  10.92  )
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
> Add the system states that are available on TI AM62P SoCs.
> 
> Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62p.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
> index 75a15c368c11b068430362fe0b8d2d9ecc052588..c69e16f16c835489f2bc5cba158235ab955347e3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
> @@ -44,6 +44,33 @@ pmu: pmu {
>   		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
>   	};
>   
> +	system-idle-states {
> +		system_partial_io: system-partial-io {
> +			compatible = "system-idle-state";
> +			idle-state-name = "off-wake";
> +		};
> +
> +		system_io_ddr: system-io-ddr {
> +			compatible = "system-idle-state";
> +			idle-state-name = "mem-deep";
> +		};
> +
> +		system_deep_sleep: system-deep-sleep {
> +			compatible = "system-idle-state";
> +			idle-state-name = "mem";
> +		};
> +
> +		system_mcu_only: system-mcu-only {
> +			compatible = "system-idle-state";
> +			idle-state-name = "mem-mcu-active";
> +		};
> +
> +		system_standby: system-standby {
> +			compatible = "system-idle-state";
> +			idle-state-name = "standby";
> +		};
> +	};
> +
>   	cbass_main: bus@f0000 {
>   		compatible = "simple-bus";
>   		#address-cells = <2>;
> 


Reviewed-by: Kendall Willis <k-willis@ti.com>

Best,
Kendall Willis

