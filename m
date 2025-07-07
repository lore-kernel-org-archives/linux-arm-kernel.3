Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBE8C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 02:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWGKLAKKnL47K95gu+sv0LN4Q91PegTCIE7YVP/1RFg=; b=WSG12P5lzNCHy+JekBFyN7dnSu
	kIg68M2DC9OuEm6e8ZPrc06C2MDW8mf9psiE3E00Y3CFs1mIdpGBwM+m7v2mnLaF2XO/jNlw9R6vF
	AZEyn2n3OaFv3khHsGv1CEgqeIiHN1z/z5mjC3LuzbV1dwXvVbGaIvp2PdzV5hk5MJi8qgaCoTllK
	WS3B8R+GaCfyhfFOi/0OUOf1X7GTdfMlCRYUMemrxoDzhXQnmMlFawNOleLpQ9aG0BCKBP8QmzlbC
	yN/7OsxzOflscPk8lQfi6es9Ar181WhROM5Js6naZasyLSf0kNg4GfB07cDIeKfndQw+9E7aiAmrF
	xVz21erQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYbdm-00000001ChS-3j2z;
	Mon, 07 Jul 2025 02:31:34 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYbZA-00000001Bui-15r4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 02:26:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQA4ZiTN7DH/Qru0P0rQAqMLW7Pv9GZT/RM3Shtg2ByK/dWwkojfNg1XVAPEEgaYd383bhLstSp5pSVzNopsaUB2ikz3MHQ7fcuL9fzugBeylfNVjhDyna9sw8Tuyg7Va9xl5vZx/UMzo8k+vthvrN4LLilWIemkdnICxheZ72JIqzyrm6f3VwujjWr3xQxHdWCrK5JZhwAMpW9kc1E0Itt6cUO2H86w35H8p+cBuXWaJIVLspCh/aCoV9z+rCvPqGuudULMlzIHaeBTi9uKipHGlIwxTI+zYn/wAWAEzN7KKP29ez23VLlge/lHpfeUHNLIxSmIQC6b+YddLYhdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWGKLAKKnL47K95gu+sv0LN4Q91PegTCIE7YVP/1RFg=;
 b=hQHoyDe7IdvlV2OcnDaBgJXooUaHCF+10xpswuv5r44zP1hn++7OHKi10WSTDDaSVomCyK2fIVbutB1VpFsFIaVZZK49wqvMHbR4AncdLPhW6TD4ETvuZojuTKzlNo2h2fR7ACsSO6VyzlePtrR5QYoXRjfyWvptuag87n/HeKCDywCN0pSmbScL9lv/F/KGxR5lwNtSVwA82TmjWHaKJkUBq4lIJcEqpuCnESvaRDAZbibKlFJPoqWiS9YFRuFpmqOFYkRSXABj7SgvvG1/jcOlxsCcZK55fS0ZaXtin6HO31Im5NGi294IsdYL+8Z+Hh7Lp6e3CJU3gokITh2qTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWGKLAKKnL47K95gu+sv0LN4Q91PegTCIE7YVP/1RFg=;
 b=hK0KFxXt+6Z1LSOIeAI1Rxv7AYuQDPaT9mellNmktIvFxbPZ8/adLHmcqUeLR26+NtsLrUC1RohMMHk8WOOT/ziHsO6uppe1VqGCfW0HSlDdpEsmc+sMDUa4QgLEbvX5DaGhZWgeBpVJ5t1GsM/LiQqHxX/J4NUQqAdsVhZS6fnx9QbBJJQu5BUAs8XXUNhgq6ecCWGw1NnOo835N1+3Y953Z8gtgXZQ2t9NymRn+0XLc5fxb1pqlPId2tuN8uRK3Vlh8pBpkT4jMsNNbyX3BIBnk9ez5sNkq2gc1ddm/GpgfWXolCNjVSiEr+FSvl+/S5r6XIFC7Zmcxe8y1YBoCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 02:26:41 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 02:26:41 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 07 Jul 2025 10:24:37 +0800
Subject: [PATCH v3 1/6] dt-bindings: clock: Add support for i.MX94
 LVDS/DISPLAY CSR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-imx95-blk-ctl-7-1-v3-1-c1b676ec13be@nxp.com>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751855088; l=1631;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=xYmtVkmmwmNL7T69+MHaE9UDNrfw6evNPGIPEOs5j/I=;
 b=X9ZXrB/Did29jC6cF/KpAxb4NENTuz5Z2OlUcoNNty4wmMsbYQsVKhfh/C/etgcWVYXF//ld4
 /RHj08GV5waCP6YfVzmRHZWaPvBx8lKNaJe0XCqeM0Ui7O6cJ7z0lKV
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b01d750-ef58-463e-1ac3-08ddbcfdb534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUszQnNneHVZRXlVekVtN0tBd3E4NzRndVBybkZCdGpCMGI5dHkxaDR0cnlS?=
 =?utf-8?B?S0JOb0NDSWR6SWwxRW5qZlV3ejZJRkpiaklYYmhnVDI3RXFBY3o2akZYR0ZM?=
 =?utf-8?B?dGR4WVhXbmJkbktiRm11Wjc4ZTRubytlNzQ5OWlCY0FCYkxMSjNLaWlEaEtW?=
 =?utf-8?B?MzBHREcrYXRTU2h3eDhrVm5DY1EraEtTclowQTdNWHRnMlBLbjV4SU1ZRElu?=
 =?utf-8?B?Njc2TVdSK1ZlRHdFN1FFenUxTm1aUzNhc3hFS0pSdkJPdXJCYkdVdDlzZm54?=
 =?utf-8?B?OHZNMnllZDZPdUZhQmVVc01vRnhselRPKzIwSHdBVkNxb1NEcFNDbXYraWJF?=
 =?utf-8?B?elpXK293OWx1UCt3THMwS3JSNkNmRU5wWkk1VGVGNEowYllMVUo3MFpRTUZG?=
 =?utf-8?B?MnczTHBIRGQ0U2xpNlBTayt1NENBNm1PWFFXRnBMcXJhbGNmSGlScVVmdVZ3?=
 =?utf-8?B?cHJyUVZoYzZYaGZGOEdvTnd2TnZJb3N1SVNQcXh0WGJIbUc4dnZFOWUyVld0?=
 =?utf-8?B?Y21vZVRtNHVERXZCS3NiQXlTVTN1SExqWTltZGVwLzZLN05qVjEyWmo2ei9h?=
 =?utf-8?B?S3dFZm9aM1ZhemljcERaOWc4dmVMK1pkZ29VNXJpYlljQzFqZFFhTHhDQkto?=
 =?utf-8?B?cHdXWFBhaDZ1dzBJWW5LeU9xSnBXL0h2S0s3dWNxYzlwQzVyL3o1THJSdWsz?=
 =?utf-8?B?U25PUU14T2UrWUpRc3RJdWNDNXFNcEhIbUJ0TzZ2U0FLVEVOZkR2cHU2WVpK?=
 =?utf-8?B?R0NmMGFXSXJ3Y2tnaUlyTWRRc0U0MmQ2Sk9VMTA4NkhXKzg1VFpQMVp6OHh2?=
 =?utf-8?B?cEs1YnlxVGxPMFZ1QmpGOGVIdE1FK1hoSUY5SC96MHF6d0hoc0I3N0xSZkZP?=
 =?utf-8?B?WEZNdXFXUTJjd3dla3lhMFY5YU5vK2RxMVBtQVRzMTdIdmUzaHd0MEZzZU5T?=
 =?utf-8?B?cVVSVFpNSXNOMjFtVklwTWU1TUdlai9wK0xRczQ3TzhWL2NudHIvRmx1Tzdp?=
 =?utf-8?B?bXRUV09peHNDL1R2TDRUNDRSOXRTaTJod1FaVWI2L0xJZTlGQ3M1aVBuOFNy?=
 =?utf-8?B?ZFZjbG4zODRlZGVGNjVTeUFUSXY5MGRuMTBrU01ud1A5RmRUOGo5OTVwNUpS?=
 =?utf-8?B?QWZaZEVjODNpYlB1QTh3aHlvczNXNWQzcG9Kb2tnMkRXQUZIa1hsKzdRVUlj?=
 =?utf-8?B?OHp1V2FaU0p6QmJJNWNzVVBocEk2b01oM250TGUveSs4QUt3QjZzSnpvTXBl?=
 =?utf-8?B?blZybmRxcVQ5eWpqcEpwZmNJNWdzTE55UWFwRzlQUjVvZlN5RXBoYmEwODNu?=
 =?utf-8?B?dzNRV1hwNnBjaU45akN0NERJZU5OQUgrOWRGUXBSd0lxcGRORzE2MllsdTBn?=
 =?utf-8?B?REdaeUVoVWV2eEw0YjhlWktUci9JU0ZDUitIMFBpaEwxWnpmbm5wZmc3UFZ3?=
 =?utf-8?B?SE9wRXFYV21FRkt2WEx6cFJhalpBVmR3STdEQzROSjFvdHAvczlBZ2NMUVBW?=
 =?utf-8?B?NlRsMW1NaTlQL1RVYk5zbVpVTnZBbHUyRldLRUJJd2x1SjFIUlR2bFlZSm4z?=
 =?utf-8?B?NlVmS1g5dGF5dU9VOGRFaDE3UktqaW52QnBiWDZDUVNUUGllQkV1bmxQTDBv?=
 =?utf-8?B?N0ZxQjRmSHlkand5YVhlNjZoUGIvcS9NMGtsOFBNMFZvbjhpVE85aU1oNHp4?=
 =?utf-8?B?dzdvTUlJY1VvbERPQy9VNElnZnUwRmJEZUI1d1hickM5aUxlN1JJOFNCbCtO?=
 =?utf-8?B?OElEeUtnWDA3Y25vSWN1YnZSYnVuV1FuUXNESkVtL3FiS25FT3FqRC9hcEta?=
 =?utf-8?B?QmF5cE1GMXFqYU5WSjdpOWt2cVBlcHMvcWliNTF5dytSSUdHZkkyZ3dBSTRV?=
 =?utf-8?B?U0REMFM2ckdsNDQvNmQ3b01RY21NRGFISG50ZlBCa0hhWk5NRXNhS1BTbVZ0?=
 =?utf-8?B?RVJ0cHQ4UUFRUk9HTWhIMjJVWkUvU3JDeXM5bVpYcmY5ZUJjVnRmeVd3L09F?=
 =?utf-8?Q?QJDUyi5T9GJIB6s4ZczTkwfOlweGDg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzhrRS9pcytlVVNBYk9HcUJXamlNUGNVQThJbDRJanZBQnBlaWlXa2d5TzNq?=
 =?utf-8?B?R0pFWE9OVEdqZmRvK0wzOFR4S2RxMGZNSkRrSmZaZmlmNklaWThzLzAxYm1a?=
 =?utf-8?B?bW5xZUZ6RkVubWZEYVY2MWZaV1hBc25QT0E2ZEpmNzMyWE05TzJJSldTbmpN?=
 =?utf-8?B?MzcxbnBjellwSElpUWJ5UUFENk9abnh3Y2FxVkZmblViWG9ZcE00eEwxTzZP?=
 =?utf-8?B?QjQwUFlHNUtsdTdzR2dzbjNrZW8xeVgyRldya0dlbFhldkF3VGdzSFVjTzln?=
 =?utf-8?B?dE92L1dYcFZJMGJYR2prVjFINVQ1VDdLTGh5bjkrdzI4cEhJdFlmVUY1bUpD?=
 =?utf-8?B?UldKdVowZjFiWjZnZWZnekFkZWpQZWdBSC85YklOVFhPbDZXZ2M3eHMyVncz?=
 =?utf-8?B?Z1Z2elg4ZEo4ZUtNQ1VWZGdXRkY3Z2RZS25oazdVVnZRZm0yWTRlV2pydE9G?=
 =?utf-8?B?dzRoZU1XSFJQWnZwQVBFaVRYV0RISlhJOHNlY05XNG56UU1xL2ZXWjhiblFB?=
 =?utf-8?B?dzE0b0ZncXNjYjZaNEFnNUlmNkZ6NU5LbW9ab3JVampWUG1lYloxZUE0VEo5?=
 =?utf-8?B?d1RLWGNWYjRaZHN3TnhxdWlObGNJcGJveHRHcklMYlFFTDNYNTRJb2VlalBm?=
 =?utf-8?B?WDlxR1k3V3c5R1k2TFFERzJOSjBDVE5aTUd3MnpOaTgwYVJJSWJXSGpySy8r?=
 =?utf-8?B?NVk3akVCaU5PU0xLSnBpWE1vOGcxeFVWc1ExdFRpdk42S2pHY29VT2pQcFBv?=
 =?utf-8?B?Q1oyQ09DeUZ3eWdYZUdtQTRPN2xKWU1zeFVNRDMveTZjODhtKzY5YjFRaGpH?=
 =?utf-8?B?MElTREIvSkxSWW1tS0lrcnJJRU80dHlLT09oSmZXZkIrODhpK3NlYXNsSm81?=
 =?utf-8?B?UEIwUURTTEFLN2hXOXRWQlBwTk90UG1yVTJkR2VsMDhZR3NSclFSYzBrZVJG?=
 =?utf-8?B?SE0zVUFkMGNHTWdWcjRmWVBRb0s4ZUdzR3dCeTIvOWQ0azhPZkl5dzlvcXFE?=
 =?utf-8?B?bWdQcngrZngreGRzVStyTzhQbmlNUFkrcWh3UGhKc3NJazlYK0Q5L1kycEtY?=
 =?utf-8?B?R2ZOV0NjNkVYYXlmSzhxV0ZIeHpYNGpIRG9ZSjJNaEJ4NWZwRGR4N2VPbFE0?=
 =?utf-8?B?L0lHYU9yU1FpWDdiUHQzUjg1UDFqcWs3R1JWTXBHY1RmWTAxaDhKL2pHMlF6?=
 =?utf-8?B?blBMbTZhQkNBNmNibjZkalorWFlrN1YydzBiSU81NXdmL2pMZUJmMmxNbjM2?=
 =?utf-8?B?R05udFg4d285bDZpOVEyem5UYmxVSElZL2dGbDRzNGJBWUV6bzFxZkNqNEYy?=
 =?utf-8?B?U3lVMDFsZFRxVUxhRlJuaDdHZTZWWHJQTktHY3hkdG5GMUhmSXZnV1Rxcmha?=
 =?utf-8?B?YVdwSFZCbjdjQjV4cW9TYm5zK29zaDdTNzlxVXZkSndYS1FIa05jc09XREND?=
 =?utf-8?B?dE9jTjM3VGRRSVFCMGFteldlV01IQlJYcDdCRktmUVNabk9DOTk3MW8zNHk2?=
 =?utf-8?B?ck9jZ1VVa0NjeExPNCtHQm02TU1qMWtUd0FRMDdrYVVOMnNOcWc3VU0vaVRT?=
 =?utf-8?B?aGt3TlM4MVpSbmpvYVVkTWk3R0hPNzdNUVV6Smx2T3pxZWdaTUF2M21SMkZU?=
 =?utf-8?B?aWNEendDOGN5NkhDbU8wZXRTTmtrN09XbTRhbUVEVURRSnRzaSs5clVZdHRS?=
 =?utf-8?B?Y1gwZFJ5ZTVQN0FldTZURFF4cmU4NkdFVGhmcHozYnltc1BuWXZFNUZ6KzZN?=
 =?utf-8?B?cWhwRU5pS3JzSUFnSm1EL0IrRndkWHhXWUNnai9scDh5TUdrSWJkNGNDejYx?=
 =?utf-8?B?T0phTEJsM2lyMFBocGtIc2RLL2p6di9VZkdqQ1B1Y1RydWlrMHVMcjVHR2Z3?=
 =?utf-8?B?VmxsNWlJQThrL3dtdEhzRysyOVRHOWkrdEk2TjIwQ0w1ZUEvbFFnZE91WFBx?=
 =?utf-8?B?Y2hnQTdFMnp5YXFkRnZPQ0NtUGFjUUFiSUIzaUczb1FwMzhOS0RBOEE3VWYx?=
 =?utf-8?B?U2hXWktHeXJaVC9lYlFqQll5ejBqMGFpYTBFOEhveSsvZ0tmTFFmRHNiVElV?=
 =?utf-8?B?cHlSTGhwS0JhdXpUNDh4R2RBRmhjeGFlWmFwRXQvQmtha0RzL1NYbzA1aE5G?=
 =?utf-8?Q?hgdZQmBQFYDd8xfbkjzvjOYqc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b01d750-ef58-463e-1ac3-08ddbcfdb534
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:26:41.0624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGp3qah4AIqYlEFkFOzhhBCWPCBDY9LwDQt2AkxX2JCYdAUJErybfUj29aLGrZOCzj54kHZP24XeHIOJJbLv9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_192648_305850_4B6AB0E3 
X-CRM114-Status: GOOD (  12.83  )
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

Add i.MX94 LVDS/DISPLAY CSR compatible string.

Add clock index for the two CSRs.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml        |  2 ++
 include/dt-bindings/clock/nxp,imx94-clock.h                 | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index d0291bfff23a27cb55683880fe3a1f8b3e2ada5a..27403b4c52d6219d31649d75539af93edae0f17d 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -13,6 +13,8 @@ properties:
   compatible:
     items:
       - enum:
+          - nxp,imx94-display-csr
+          - nxp,imx94-lvds-csr
           - nxp,imx95-camera-csr
           - nxp,imx95-display-csr
           - nxp,imx95-hsio-blk-ctl
diff --git a/include/dt-bindings/clock/nxp,imx94-clock.h b/include/dt-bindings/clock/nxp,imx94-clock.h
new file mode 100644
index 0000000000000000000000000000000000000000..c4ba13352b99b4b13d4331450c78590cf6c1660c
--- /dev/null
+++ b/include/dt-bindings/clock/nxp,imx94-clock.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_IMX94_H
+#define __DT_BINDINGS_CLOCK_IMX94_H
+
+#define IMX94_CLK_DISPMIX_CLK_SEL	0
+
+#define IMX94_CLK_DISPMIX_LVDS_CLK_GATE	0
+
+#endif /* __DT_BINDINGS_CLOCK_IMX94_H */

-- 
2.37.1


