Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3528DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZ6GF1xMJ5JFW3pjsGX4kECpdNy668Ac+wz7iKVmub8=; b=J4L/X1S0MiIBbHnXFEXPE1xer5
	7vGE8SqQRObsliEsDobYzBXnNkzbHH1rISFKNXtw2IP5mjrXhXaYHoI2N3HMM8uDNr9lmUhLeWZhD
	Z3Mi522FvUUxclgzkct/vA9UQSXFqRoT+m3B8WAiQaQEwBHj8ABkmfloHM1JrlhCCFamgmuOgSCmJ
	p/cTUrarZzum83HOnB26b+Qqni3fiz0Nr9LYPmfj/OKLUSS01LJzHyMrQY7zhyZKZ/7niU4Up0zno
	iqV3J8rqguBn2CqHqMm4JINU81d1zGXxK8nVgs4HsY9ucWhJnxrHyuz4t1bCArwRGsCXBRzOLvgJb
	M9Bu+OqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjykp-0000000EnOj-2h5P;
	Wed, 15 Jul 2026 12:30:23 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjykm-0000000EnMX-1rBS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:30:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBWBSiFxl6rGwNvMr+xKQAgxOm5T030o0ZygMVxe7sfaPC2e++rKOMI2PqedIoBaiJ4hrC00uHX0E6kPM1X8JWVXtZoC+9VZxPZeABpdrxKN4c+zF0k8LOtFsaDIltDYjEbzFeUTZn9/qlkeaRYPTezFWRNxd68UDJaClNs1oTsIrvYdGcEb8YN3u/SzZvUz5xWwCEIGRv+/BhaW3NwddiNXapBMG6R86w/itERgwLqmjSBmKzXqmtWWcIlCeXvu2atZ3ptxCHgB4xUBtkOJfvU+dJYpa8ii2qdbCh9wB5Kkr52RozmwvlWq3rOMh7CnStov1MBsOfeS5QPtwYnDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZ6GF1xMJ5JFW3pjsGX4kECpdNy668Ac+wz7iKVmub8=;
 b=ANCaD5bCo3bxaZ7Tyytg6XYmafgyOQSN5MXOLIybqsiyoET+dyRTrhviznvW4guC2/nd5GBzm2DmxpBrzXgMSppeNRUscwhMYJGZ9MrZ3moqICMSbZiCtVggE9ZyOvDMe8SFsTTU2HyKLH1e+oKysHWSCXC2PreV5VRdUMMsaK6GCpnS9Q0MCCv8LJb60IXKbytwoZR4fqWQ26FU6tVuOtP5YpOk1ilQtXbAFDB3WaaYWi9WCuv4pLVNx+9UokhAmd4W9A4hyyb4nkdRU4Fawks3LKLGb3KvHjsThsGmcmG+KguTfnpcsv8m9ZFRGL8UKTuPqjxMWGN2uyxTXax+hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZ6GF1xMJ5JFW3pjsGX4kECpdNy668Ac+wz7iKVmub8=;
 b=wESnxXOFMOqbkTbV+hTYYOz0/XUGCEwyOWHmODslmLvtt8ghNwgyDMwpVcSz8biMKe927lRSJHqzqNnG/4CBhAM8uKmVzqxdiGTuvYKVq0cfrkDMeAE4jATRDUEDluyQx4wvTZqfc0LsjLk1iTi4JOd3fk4GQPZOHyyBq4DR9k4GqYpYmHhB2km7TXtDtIjeviDke9Dzv4NSoP8yqL4p63sx/A8cgEcgx1siaoTayIp5FwJ5I54Mo3caNPKSTl2LCjpLbmmDkVfNLjbjr0QG24AFg/KexNwEOu1I9Uaeszh6HewG+3YBCSycgk2GO44V2AOjiYoG03Sd2tEcsQnFHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9684.eurprd04.prod.outlook.com (2603:10a6:20b:474::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:30:15 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 12:30:15 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 20:33:05 +0800
Subject: [PATCH 4/9] arm64: dts: imx8ulp: Add assigned clock properties for
 LPUART nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8ulp-dts-v1-4-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
In-Reply-To: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:295::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: acf5aafc-0cbf-41ce-2be6-08dee26cd2f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|19092799006|366016|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: VIn9FfzzrO54aHFB0jJW0LhygB81QL1HEI88l/c76FJdDAB95k9jqfW9KRBZs+oFFlWCJzONapMeC7DrDoItH5qn7pD9Qgle4b4aromdh4AbuWbZ8OYknW4VjtHKQMm2uyue0mC2kI6uTGx+/z33DZirEVVIY+tvZ/oyc9fyx7h8y/W9p8x2vn3fqR7DcWGg6uxYipygIgHGLzWE8OFR+csKXKC6rqycjzLzlsz9Pulbte9SyUuV4TRZXwTlcoXKIGJkQRrgwprBfq83KRupi4TUB9D+bU7gDStpM9IGlt2LtSkFTH+jtN+kzYCgJFuQfvCLmUMM9v6WYtEM5t9K6dQPXdDogcsQ81O6+J2yxv4Km7bRklBiedOqYscdPkMmwrfAxQr9PIFMVqv508mcBKp1eNdn180MZ/waSEHt1d8tp3YajXvrTZvSgb7Xvls9/koCRT2nDsdMVryWnl8ljhVpwW5jtrSWtjV5ZcjQ3kywzflVn2RhttTSxT1QjFEeAvB5hBG2B0D0naFKtjbB6tw/NLO+a+VoJJDcL69FduhBzzNKRhnHZPGRrN6PVe5rOrojj10MZ1E9ISoVf1Q/qIksZoUIRyvc7sGwcRMc2vOL7s/saIqRUhQb8WWuj3aucVlUdsuEOCUvJms9YquyiB4+lttq/KVu5wce8+Aach8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(19092799006)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1dhYkxsM201WWwrWFN6ZUN1TjV1MHdYUEdPMkFwSUVQckxwTjRMeWp1RWRC?=
 =?utf-8?B?WEJnWEZ5a251VkdlNDhsMTRKc2lFamxNNUtlVk1Dbi9nMTBBOFNuQVlkMjU0?=
 =?utf-8?B?bkRWaVdyaytybFlJR24xMWsrMlEvZzV4alQ2OHVrUCtvbHdFZFlLcE9SNWVE?=
 =?utf-8?B?Y2Q5bWVNNU45MG9NdlVuUTVwYkN3aEJVVzFNUHB4bVVnNUVtVHQzcTVlazBP?=
 =?utf-8?B?WTlpUlhtNnh3VnlUaGF2ZGx4WTBIelMxcEdlRUF3L1ZFZjUzaEdCZHZCUXFG?=
 =?utf-8?B?eW1YM0NkRFMva1d6a2hEait4eFM1TExkY1hpN3J3aVU0TUFkNVNmUUZKc2Er?=
 =?utf-8?B?b3YzYTMveGc5cW80T0FDck54MHVCVFJTeVhYQlp1QjJPSHgrcEU0bkhwMTJZ?=
 =?utf-8?B?V09MY2ZNaWFGdS92T1BpbVVUNkRvSjdESnZwTlRNUXNDZmlSV0NpcWxnM05h?=
 =?utf-8?B?TzlMZDdFcDR2eC83TVhSQ1BMckZkVm1xVS91bzdmYkRMcitadnF1TU1wZjV2?=
 =?utf-8?B?aFpjRnhQMzliZmJYU1hITHhhVGx2UkQ3Ui9wTFVUZ0V6V2NYZ2JONDJaN0F2?=
 =?utf-8?B?Mjhoek9FRGxyWndrcFo3U0NldFVCeGhsaU9TMlFiWnFwU1d1MytkTUdMOUVR?=
 =?utf-8?B?bjY0WHJ6UEM5WWlMTEJEMnlQeldqanptNjhKQ2ExMWkxdkQ1NjcxWEdqNzBs?=
 =?utf-8?B?dHEvS09qWHRmRUJ4K0d1djZGQ054NFErKzAwQUxqeElXU00zNG9JcjZYb2RK?=
 =?utf-8?B?ZVY2Z1BBcFVnT1QxRWczMkVCTklVcDlSbXh2VUNLck5jcFpzbVpHK25QVE5n?=
 =?utf-8?B?MVV4YTB6cm11WGtNekR4cmlNamliK3c3TUE1N1c1N1MyZEd6eHdJRzNmV2tv?=
 =?utf-8?B?MXN4Qm9qc0dTRnlpU1RsT3FPbThXV2hMRnJmK1VVYU83TFMrK1N5SDRXaW51?=
 =?utf-8?B?cnN5REdzVlpUdzNEb1paWHJFSDZqdXhqY3BQTnZ5enA3Y2V2VnQxTnNIc3VI?=
 =?utf-8?B?NXp3bDF0cmZXZjEzZFVFcC9IblJCOEpSRGF4Z3FTa3FPOHN2TTlMVnZ3V2FP?=
 =?utf-8?B?RWpxd1VrYlI0VVJpMXhvL0Z2NVAyMWhzeG9NN1A1LzFJN2Q2cStkOWh3c0FU?=
 =?utf-8?B?VGV1T2RaYlRDakdkKzJpYzZQRElaUDlVQW4xZmk1aDlXQmw2cURVbnFLM1ND?=
 =?utf-8?B?bW56SzUwZENlTEFrSzByR1RaaU9wVGxlOGpRdUdMaGJnZExYNTk1USszbDFk?=
 =?utf-8?B?dHNVSjZQTzJBWjRsL0ZoalcxYjFFMWorU1dxZFNINndRZDhoU0VRaEUrOU9E?=
 =?utf-8?B?d0dETTJ6TDZwQm1yZlk2QS9BZmcxTDZKaEJsZ2E4NmwwakJlbWZXMFJYTGkw?=
 =?utf-8?B?NHd1MEptdlhiL3dzamlkVEIvMngyZFRObkpYNnJZc01PUG9JNDhrN1pkT0VU?=
 =?utf-8?B?NHBwZTlvSTJNL083QVg3OXFtR1ZNTGdZYnFZZUxWaUxtbFpjWjFxNGs1c2V3?=
 =?utf-8?B?QzU4REtHTnVqd3BSSlBLd2ZmRDVjTmF0YlhWQWVjcnRCY3AvYkFlS1dZYzRp?=
 =?utf-8?B?MWZFdDhUSFZIcnNrTjgrTzN4ZFNvWkpuN2t5SnZ2cTVVTkp1TzZ2KzRsODVs?=
 =?utf-8?B?M0RDNWdlQXNSWmZvVmNiUnZ4SDF3SWZxOUtCTlI3OWM2ODE4MXh5R1BUT3Bi?=
 =?utf-8?B?M1J6dWgvb0J4bUk4bFh0YTk5UkZYQ1g0amRTeHlaZXEvdHhvb0g0QzFPb1h2?=
 =?utf-8?B?SU5RQmFlbHFSTnZEQ3BBMjgwOUt3a1hiUjdNYVYzVGV4N1F5SVdsdUdmZ3JQ?=
 =?utf-8?B?TUs0L010WUNrSnh3N1pTZnFIdW5kYTA3U20vL2dOYllGbjBCYlU1U0MwYWd2?=
 =?utf-8?B?a3JaeWhvZ2tSQ3RBMlBYWFhkb1VOdmFRRE12TTd0QjlGaFJVenVjVVhoMjF1?=
 =?utf-8?B?d1dxcEhmNGUxUnBHTFpFQzFYWWtNdHg0Uks5aFdIMGJqUmVsUkpodEFIdVp6?=
 =?utf-8?B?cEl4UVdWNnVZUlNVc3hlKzNRSndzRDhDYkZXUHhYK2toSWxLNWtINDQybTRu?=
 =?utf-8?B?WnRrVjZTVlZvNlQrVkszSks2TWVkY1hPY20xWTRya09lMVM4R0hjWkd2Yi96?=
 =?utf-8?B?cHI2dzMwQW9ndVhBRSszdyttdnJmcnFpRzRnV3F5dGpjYmpSUWR0eGFsYkgy?=
 =?utf-8?B?UysvSndhRmQyQmxzMHFxMDFTaDFHeVlIT0R5cVFiaG9MUGpGSkwrQzNIZ2V6?=
 =?utf-8?B?elltN1B6em9kMDFjWUtUQWY4T2pDMUI5dEFVSEh1ajdnekZ4ZDBUNzFXVHgy?=
 =?utf-8?B?RjlDMHhTLzFpUGVnOWszN2RCRlVJTGRWWTVoUzExbE96M3NvYzdaTUdLcytC?=
 =?utf-8?Q?+XeZhEYrtcAa76LQ2A7amfAgecObhTxEs1NpD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf5aafc-0cbf-41ce-2be6-08dee26cd2f6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:30:15.7774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1Cf/GAApgdmEOI5iirS7IlVxr5inhoKowY0wkuh21bAl8Zujy/vtLADvNVPGhQo1zv4M/m2irB9jAxVtjrbtU2pzJrE8gaTR72gU6FHWs3rJE0ukIp/O2jjy909u5cR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9684
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_053020_535035_E301EC0F 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

From: Peng Fan <peng.fan@nxp.com>

Add assigned-clocks, assigned-clock-parents and assigned-clock-rates
properties to lpuart4 through lpuart7, so the LPUART input clock is
configured automatically by the clock framework during probe.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 173d11dea5d4f..80e08ecb38490 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -413,6 +413,9 @@ lpuart4: serial@29390000 {
 				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc3 IMX8ULP_CLK_LPUART4>;
 				clock-names = "ipg";
+				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPUART4>;
+				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
+				assigned-clock-rates = <48000000>;
 				dmas = <&edma1 55 0 FSL_EDMA_RX>, <&edma1 56 0 0> ;
 				dma-names = "rx", "tx";
 				status = "disabled";
@@ -424,6 +427,9 @@ lpuart5: serial@293a0000 {
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc3 IMX8ULP_CLK_LPUART5>;
 				clock-names = "ipg";
+				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPUART5>;
+				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_SOSC_DIV2>;
+				assigned-clock-rates = <24000000>;
 				dmas = <&edma1 57 0 FSL_EDMA_RX>, <&edma1 58 0 0> ;
 				dma-names = "rx", "tx";
 				status = "disabled";
@@ -529,6 +535,9 @@ lpuart6: serial@29860000 {
 				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc4 IMX8ULP_CLK_LPUART6>;
 				clock-names = "ipg";
+				assigned-clocks = <&pcc4 IMX8ULP_CLK_LPUART6>;
+				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
+				assigned-clock-rates = <48000000>;
 				dmas = <&edma1 59 0 FSL_EDMA_RX>, <&edma1 60 0 0>;
 				dma-names = "rx", "tx";
 				status = "disabled";
@@ -540,6 +549,9 @@ lpuart7: serial@29870000 {
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc4 IMX8ULP_CLK_LPUART7>;
 				clock-names = "ipg";
+				assigned-clocks = <&pcc4 IMX8ULP_CLK_LPUART7>;
+				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
+				assigned-clock-rates = <48000000>;
 				dmas = <&edma1 61 0 FSL_EDMA_RX>, <&edma1 62 0 0>;
 				dma-names = "rx", "tx";
 				status = "disabled";

-- 
2.34.1


