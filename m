Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD225F51403
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nQZfmhFpO2PaeLV2doN+DKk+tr5bMg1j0V9pwujGq+0=; b=ipE8TyQncYqQNpqOze6AouTu8z
	Oi40OPadKl7i2IAMJ2plQe8RKpgu+E0/+lyNHaz+Z4utcCxWKaGGXPIsL9ftlvoTKA1+fSQRDbQjN
	Kzj7QLBSnJHHhNunuNF3KMt692KXZyteVXeu5VZQIqMhZeIbd8aQx2iSnW+XfFYiYB+ImdLsXi4ek
	PL9dF0DSAaTu/tnWwqC0k5KN2rYkmHuF6ytIA8dkJ1zhnZulNUPfuUBp8eJCptpMeo4JzG8ENjYJo
	bI+Kdfnc+lP8MUvv/T49ZZn2yDk+FlJWNpr26zluk2pfkfCRJYPHmJdTTCStisI4FPSGgq3LzMcX4
	z9AloD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOWX-000000034pz-0iK9;
	Fri, 06 Mar 2026 06:18:57 +0000
Received: from mail-westeuropeazon11013039.outbound.protection.outlook.com ([52.101.72.39] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOWT-000000034pJ-2Yfl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:18:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AG2IbSxxCxkro8xtIvBqQPV0EI2YY6ewNdBha17Ic1iveEyfIwXzwgBP6EDPmOPEturv1iv38JLCmddBa1Tj/7vwlevmEtuMKWPs5xVSLKZeIDXHHl/kRxIQBChmuY07Pp4/km4azfcwWolwUxIMoEFHCBEqdr8JmtoLdsYjIdq9D4EwJP4blhnFfKD8HqmKibgd281bbD9SiivYF1Yp/VXY3XUInkGo2srMM/Lh53xV9VoWlQbMmKi6LXbRP2btVv6Bjb45tjlSQ+XzT0wm/t+r8kRVPYlvKEjFikF3HTR2U8fKXHypA7eNUfNuCQNzKB0EGzoBbsmccAFlngoVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQZfmhFpO2PaeLV2doN+DKk+tr5bMg1j0V9pwujGq+0=;
 b=kJ6xJUH+qKg/pOm16DmgHpTxCCim9DzOdkrBxaU5mi9KQPyLnJnPInamfuTnXWzhgQr9odwUlc9a5Zew7VphFyo3FekJy8HMLHsCyKfCnXYpsRZ1Lic2JwuoZT7qDrkgAKD9kJP6EaoYAJW6UW9AyasbTm7mF3k+bI7Cqa0H9FKMfvjDfRLo4XqMJTGM+tHW2J8DGXUQIfPVNrTEq4nOJRWkx1gHq1ZHN+JHpuvMsP2r3QOGZqKTkmB5EMpMIHBpZ7bedirkVtuVj6dQ/I+Nm/GqD0XXOg8We7Cl8NROyLKLrGgT2Fx7HWMPAtBcrqUBkhIWOEeDUOUBklMKgGVl3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQZfmhFpO2PaeLV2doN+DKk+tr5bMg1j0V9pwujGq+0=;
 b=D7zZyn8huVa5jn2+IXSyIpVzW4V0XdsWdNlcq3FDHj9oGtB5Td3mwBk44QnTmlDXoXOZ1Mw3xuFT8h6YB+VIB13EwNZaAGTwzFux+oly0cj39smNtJgAqIvTIoUP6kiKYYOVbKutSH0Y9AQyzDixYE7CCiXWQB3OubJdY16lvBE2xvNh1VoIzDT0BkSNNyr8G3SxFk3alytcO4jdRCeD7PZ8KIFHhtAZ37KZfX5v8vgH3WS1YwDfwwX5CqNiW9nOO0XxOSGxUkOHlAXTe7D2jetY2mpXSGXmYrHlSVyE2a39jXUyhU/fgF2QtOTSfmiECoOe/3LV6ACbTplmZ8BfMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8771.eurprd04.prod.outlook.com (2603:10a6:20b:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 06:18:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 06:18:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: =?utf-8?q?=5BPATCH_RFC_0/2=5D_clk=3A_scmi=3A_DT_support_for_SCMI?=
 =?utf-8?q?_clock_rate_rounding_modes_=28per=E2=80=91clock_policy=29?=
Date: Fri, 06 Mar 2026 14:20:11 +0800
Message-Id: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABxyqmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMz3eLk3Ezd5Jxs3aL80rwUXUMzQ1MjU4vkNIO0RCWgpoKi1LTMCrC
 B0UpBbs5KsbW1AGrzH2hlAAAA
X-Change-ID: 20260306-scmi-clk-round-1615258cf0fa
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: ed478777-80f2-454e-c7a3-08de7b483980
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 4PWGE1sm6WV+6hkDLfKtDKRWte8PTGdtmgYaVcC/fnNnG4NqOlHDhsANTZMJ5icmYpN0kx1bh12/129gJkhIPU98NLMHDBN54x9Du3/YwBUrl3Z4pW8N9KX66i3ymNn3ygYr2wHdJVC7V4OVY+vQowp/xs1yYk6Rci4R5odtJaae5BHrPjjLePC4ovOl7eWhf533HAKzNdl0Q7ON0yjm9lGTBPOB35gtbGvfithGaumzDnhymbdRl6McBoDFlN01/sOvft1wCY3O6mVoOEI1nTcj0qQdBFwrVuBTt6mcCCRS4zTgnmkM4f/Jl5QwngJ57w2iLiLKhzQlGeY8bEYnHOMLoDHyt+HBqntlzkF1hXNoPvhDZzzKBNeL0fqwyn4EcJzvnKGIz07D+Db5l9zdGRg7OTao3JbrSFrNltROHC29aZtyi6rFyf49XzIDMwhbjaHwlHGnDPV2JmyTqoZ0ihyhOW8Kl3bRQFK/iw3bqzzt2MdFr1+ZAp8WdhSqqgCQIC4HBdpFdYg7O4sT4sh+4WUQMkEzlSHieLmXeAuw4XzReamTKI5u17xOSQB1/yMWfR1sXWkVvwToUQiX6aemh+/j84MOu70YLfAZF327y7j4tIzq+2WnQcUNwqoOpuN25rJ0ynwhWODVr995vr0cNudYD3n8C4Fva2GWfxR+iWD4xhLjQUgAU8bvpHp9SjFFZ4DLWIxaDFzCJAyKPL6eqJWE9ALxbJWoGjjR427sYnffjfodK8k2C54J5HmcfaI7Vcdm+GgixpHXVrGm7Vv5pF3sudwXz7jASxE6Q4al7wk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWVIUlkrbmQ4c0NsNzA1VUs1SENhancyS3pMQU04RFduY3dkU214U0xmZHdI?=
 =?utf-8?B?cHovWnJPY0FGc3VXR0JwSjhtdHNpVFd2MVpWcFRDUkpTemw1T2tjSGtrSHVk?=
 =?utf-8?B?aktneDkzNmxrT1NtWWhHUlNKaEdjSnRISjJVbisvQVBVdVBhR0ZoSS9uTTBh?=
 =?utf-8?B?RVl3RXMrWE1velJoSHdsV2Q4VjFWcnVQaVJVUlVVSlNGd2cvMWV3S2VzYkVs?=
 =?utf-8?B?eXZrV01Fa3dNcVZ6cUtxNncvQUFJM2xtUS9zQkh1YjdKTVZvSFpRTzVJaVV2?=
 =?utf-8?B?aU12MHJiMEpVM2dhWHNvSk9wM1QwZHJlS0lMTHY4ZW84dzdCMTJ3dDQwU0ps?=
 =?utf-8?B?dlEwNit3aFlud2JaRlROWUNVYzV2QzVkVXhGNzhHTCtheVNDb3hDMmo2alFF?=
 =?utf-8?B?Q3lHSHZaaUU3VVNROVRoNlBweUxXRzhWQ1cySndXN2FWYnNUSG5zNnlVRzRQ?=
 =?utf-8?B?b3pSUGxrdlZqT0UyeHVGSlpyQU9ITVlNVGh1RjlUV3k0dm5ONUlpYlFYa0xZ?=
 =?utf-8?B?YWYyaGVLZEFQTVBZWUFVZzNlQlQxdzgrdnIvdG40MUQ0UXE3NEc1OW1QSFNp?=
 =?utf-8?B?OWVsc0NvQmo1eFpiUUx3dWcybHUrV0hhcWtBc2YyQ2ExSGhCUGtMYmMxMndS?=
 =?utf-8?B?RzlQSWVmU1UvSFZjWFRaZVFLenBacmxLY1RMMDkrbkF6Q0pITmhlM0hTV29V?=
 =?utf-8?B?TFFxWXkvUklEUGo0QXBBT2JFSkFQOXpVcW5pM1lOWC85Q3d3VjFpTEtkdVdq?=
 =?utf-8?B?NUpFTlMrOGF6bG90Ykx3Znc0UEZ0REE5Y0Y1VkoxQ1J4NlFrREQyamhoZVlx?=
 =?utf-8?B?dktjdjdYd1Y3Ry91K2E5TFFqZ2wrM3BTQllkZ2N4QllLNlBYd0p3OW9kS05n?=
 =?utf-8?B?UFhqbkF3MXR1ekkxdWlLTy81MzZFU1RwZVBtUUo2dWhiNEt4N0twUUEySWpq?=
 =?utf-8?B?bmk4ZTJWU29pc1N3TnlCUVlqZkEzVFVuY0pHcVJ1cmkrQWxkdTJQNCtKN2tU?=
 =?utf-8?B?TVJtTXZZZWx5NkhlUmhWeXpmYk85VmlBVXVoOUEzN0d5WE14UUJxVFFoUHBT?=
 =?utf-8?B?STJPNS9qUTZoakhoNDFmMUppdVhVUVJ5Q0t0ODRKaE9GVnBnMldudTJXLzZ4?=
 =?utf-8?B?WDZsQWQ5MjFJRWdXZUZ5TnVNcU1jN1dwTEh1RjFTZWtvY0hkSlF5bnNXRjRI?=
 =?utf-8?B?NCtlWWVMOS9hOThnRVdLeE4wVHcwTjVmV3loRXYrR0hmYzkrcWZPNVlEdVZJ?=
 =?utf-8?B?TkxJVEI1TFROUjZnNWdZOG9IUlBGdTBiVk0xNlFYSHYwZUp0OXBrdTcxQUdy?=
 =?utf-8?B?YjNISk9QZXVxSFY1VGpid08rNCtKbWNlVTZ5azlITjc4ZDA1Q3MwaW91MlNl?=
 =?utf-8?B?UVI2eEZEMXRTa0kyb1BsdXRrYnU4OTlFWUxEbjNRZmpSZTl2Mm5EQTJhckdr?=
 =?utf-8?B?ZHJFYm9ycEhqREJ4VHRlUit3VVBXdmMveFN0QTRwTy9rK1E2clFQZXJnZUdz?=
 =?utf-8?B?OTI1YWJzMjFPeTIyWTJEaEs0TUxPRGg5bzkwOFBhUER1d2F5ZkVzcGJ2YW5G?=
 =?utf-8?B?SDk3OUg0bmZCeG1mQ09jVDArTGdqbjBRRzcwOHFHV1lPKzRIQktGcGtqVmVs?=
 =?utf-8?B?WTRkR1ZZM3hyMEhCNC96WTAyT2xvZHN1TXU4WGNXQnU2T1Jhc0ZkZkZMbTN2?=
 =?utf-8?B?bG1hdVhFOUtpUmxEenhBYkNwc1JDTTRLd0xNYm9hdzRlUzRzSmh4N1BHazdP?=
 =?utf-8?B?ZDQvMENBNTYrUUVIb1FPR0ZFVHBpa3ZvYnI3cE1ZdnZyR2tkdkpPakswZkYr?=
 =?utf-8?B?QzdycnJyUkZxTTZ1Zkptc1dvYzRQdS80ZS92RCs1M3BMMFI4SDlOMkFNQ3B4?=
 =?utf-8?B?cXpqZDJaUWlTTE0vVmdHUmdlS094SHdjN3ovTjMyV0k4ZVhpUkZRK1pjNTlI?=
 =?utf-8?B?RVdUendqcElPMURCM2E2OTRNajJodlByT3o2RWhyR2s1SEIxL25Nc1JCSlVl?=
 =?utf-8?B?czAwTUN1cFdxQVV6ZGJydXI5SnNxUXIrOVRybWtyNDRlRlpvbHVPamYrODZL?=
 =?utf-8?B?RDBCU0xtYWxYL1J4dDVad1krZnlNdFcxUHFZMmZoWWlxc0pyeVl2Vlo3S0pN?=
 =?utf-8?B?N3hUOWRWMlJFZkhEcjc1TlJiNXR3TlFNVm5UbEZFSDdOWGVNQjNqS0lkd3dB?=
 =?utf-8?B?bGlmU05iYzB0VjNYclpxK1VhYXdRcDFxbzFLNXFyajhiSHVoUW5RR2RIWmhr?=
 =?utf-8?B?SWtob1dGNDd4bk54bjFCdkpHQjdIM0dVMDhsZGtsMERQNkYyaUZNUTFtRTc1?=
 =?utf-8?B?ZTcwOWtodVJidXQ1cW5pQTVlVFBkMGxwejBGY2drdXZRN09ZdFl2UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed478777-80f2-454e-c7a3-08de7b483980
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 06:18:46.7436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asjugPjyhtI9Wk4cSotPYJZ8+66Wedgi7X8YpONRVshS6fKBDplhS9e2wSQmdV/toXqa4oFNnUu2VF7Nm2L7qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8771
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_221853_682846_40A72F05 
X-CRM114-Status: GOOD (  11.52  )
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

The ARM SCMI specification (DEN0056E) defines rounding‑mode flags for the
CLOCK_RATE_SET command, allowing a client to request that the firmware
round a requested clock rate down, up, or autonomously choose the
closest achievable rate.
This series introduces DT support in the SCMI clock provider to carry a
per‑clock rounding policy from the device tree into the SCMI protocol.

Patch 1 adds dt‑bindings constants for rounding modes:
ROUND_DOWN, ROUND_UP, ROUND_AUTO.

Patch 2 extends the SCMI clock provider to optionally support
"#clock-cells = <2>", where the second cell encodes the rounding mode.
The first consumer that references a given clock latches the per‑clock
policy. Subsequent consumers of the same clock must specify the same
mode; otherwise, the request is rejected to avoid non‑deterministic
behavior. The selected mode is passed through to the SCMI Clock protocol
and mapped to the corresponding CLOCK_SET_* flag.

Patch 2 includes changes to drivers/clk/clk-scmi.c and drivers/firmware
arm_scmi/clock.c, it is hard to separate the changes without breaking,
so I put the changes in one patch.

This design adopts a per‑clock policy model, not per‑consumer. The rounding
mode is applied by the provider per clock (index).
All consumers of the same clock must agree on the rounding mode.
Conflicting per‑consumer requests for the same clock are invalid and
are rejected during phandle translation.

This avoids silent clobbering and preserves deterministic behavior.

Existing device trees using #clock-cells = <1> continue to work and
default to ROUND_DOWN, exactly as before.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      dt-bindings: clock: Add SCMI clock rounding mode declarations
      clk: scmi: Add support for two #clock-cells to pass rate rounding mode

 drivers/clk/clk-scmi.c            | 62 +++++++++++++++++++++++++++++++++++++--
 drivers/firmware/arm_scmi/clock.c | 15 ++++++++--
 include/dt-bindings/clock/scmi.h  | 13 ++++++++
 include/linux/scmi_protocol.h     |  8 ++++-
 4 files changed, 92 insertions(+), 6 deletions(-)
---
base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
change-id: 20260306-scmi-clk-round-1615258cf0fa

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


