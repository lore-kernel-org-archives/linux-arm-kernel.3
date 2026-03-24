Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C21F54ADA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gpzIRetEPs4kgJW//QiOuggoCLj9Dz7mJOBBmMbxFg=; b=DgRTztsqjKWj6KfN+cap7AVad7
	SzCPIYv6DE/We5/xRAf6zPNoy57yi488y/AQ8VlBdamvI1BqAGiXy2y6Drc3N+fl7NQwM3ZrixPyg
	t+F7vmlOQSUB89pS3KFFLPJS9npDJVpOTl817Np977xMh3BhatzDTWkBzuIzbT+y/HVaAMDwvcJhj
	KZCx/XkzVWuDMJwdcomqNmqRrWRYAzSknLsFzT9Z/NpmLz6xcjtcMkgaJxzjckFLv96XZciCUJ7wg
	CnGUYpMXfeG4tkk6hqqm8KS0tIZZJ0PVYg5lj9+hPP03RLTKUs2tm1zUivRrwsLoVup8LJ09p3ss9
	2nZ75onA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w553L-00000001wKk-2Kpi;
	Tue, 24 Mar 2026 16:56:27 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w553J-00000001wKH-13zA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:56:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q53iaab5k95nAZZcBWql8XRaz+d93lhJBE9j0BsXEVGhf6HYnEVnGNwapJhQJ1L6GNR3OQhcmO+84+Uq1xz3KqQ64EexSfYFYjV0x15XrQy/ezRDT4FH0tlinTc/m8JsH2fbcbf/TiaZYknsVV+S+B0SX4Ulljxm55cbLVNJWqKmWBgpvmYUVRm6z2jBd3o4GwlSWlfHosJyivUbj44k3tiorPW3GNwtSzrY0eB0K8ifJ6Aktdc2c8MnqWtQCvujyNMPZ6S8Tu7lfVUfBSm56SRsd5yA0VYxY4fnFb1zdM3lSZ1Dknbhb6LCkFZnATVTRIAutOReMKugJeRUQX4hpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gpzIRetEPs4kgJW//QiOuggoCLj9Dz7mJOBBmMbxFg=;
 b=iQUIDfE1Vx/GYoTuxaXL+/DeBzxi8xR/vFtaYFD2VP/Wzx+g4CTjlLNV30n+4VYJHEIyCAwsSYJaDQP3L7RW+3hmAVRRJRdOwIXuaDNmExipYdOTl1tAyVJlNc7hv/EPoRmJTCpy/MlqLHFVOtO5CESKp+kKEitmUSnoFnrVX4mZbXWMPxeYcVDXfnG3WErPY1dHqjRsXSivCb/zJ+gP6TVtXF1fMOEe7GeOycrILTto+BF8lExd5v8f4iZ2ZF6uJDvynmFQltHgnLjnYYFKq5ZWy1xm4bBaAI5rxXDSBLLTtAqVkzF8Djj25MdDSyXify5bnWiVuNVjoU41oJTK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gpzIRetEPs4kgJW//QiOuggoCLj9Dz7mJOBBmMbxFg=;
 b=dYcjgWkMMuMWlb2eYQ1bTfNMWmeUp++IhfAUOdrTwMIH5FlWdk7H9G09/4HPG2hjgOSVg4cBwMh+rkOVVATSOR1HdVtvQdhOngoxAjYd/+3P9NHMMtOZW7VQ2cXc6IlUP2ER6D+tN+5LqTR2e0Oke9OESrRZNiJn0Y9Qo/Gf9hkh/oHkpCJDE8bVxCtfsNmLggnrXUzkNQNIg0X2MILH2+NPZXK4o+k/VJJhWei1CbMSkU/gvQ32yJGFqQhahARx3iCfOVz/HMrwCSHbTesj57+s3LC0Ok5zsMiPQMu3OZJkJnqeJYSicUv7RHU4QToIwjAXgXhSp1P/TKTLkE11dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB9085.eurprd04.prod.outlook.com (2603:10a6:150:20::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 16:56:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 16:56:07 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Josua Mayer <josua@solid-run.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 0/4] arm64: dts: add description for solidrun imx8mp hummingboard-iiot
Date: Tue, 24 Mar 2026 12:55:56 -0400
Message-ID: <177437111033.2168198.4907988679135849585.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313-imx8mp-hb-iiot-v10-0-52b3084f2426@solid-run.com>
References: <20260313-imx8mp-hb-iiot-v10-0-52b3084f2426@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0188.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB9085:EE_
X-MS-Office365-Filtering-Correlation-Id: 542f1a8f-edba-4e4b-5314-08de89c63dcf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|52116014|7416014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: bG3OSZp86J9+Y83XiXcSeGiTO0CwVZ+bTrvf8AglrUAdUjKH4c5/kSmDpsJXdO0znBvOk9x4KBzhirWt26vv4onlmlp+73vnICRJtPOSjX4orGJ2aT7Bw+/4fR7TCcGIryQ7fVG887OSH9/MwT4WueS5NfwHkrSOnxhZqjnxUpjkV9/eTYYB1MjDfZwUf6FrFGNtDSEQHDl1XexZCfZEwJ+PFD/idOIsw+7wYAnrjJUSA8XuokIVjIyHhaIRvdv/KbAT+9g94jlI2ZJwV9noP1dUHcQnzy/HlP8lQC3u9thInjTbSag5xRgfTHxHet/rOBo/Q4w8YC1QlTeb1OIes77qGUrNspUIRGmMhfVTcx9myybuieohPVbrPbwfXHWHFil/EF2Ke9nFxzwED7DW5FJ9aBQNn711D6xK00ppFMsswfBdRkah/l4TZzla0azsBEeoqUuqaSzbgHiEQ5Z6+yAf+g/ZZSpzqnZ5VbDH0Lsj3QRptFfhe3IHVvoFqG1ZbGlvnpquvPd82WVsB/9Iwkw5EhWMGb6Tlr2SYL6z7v8PDHUe1z9MP2gs2Jl1vONb5nVKdQ4qbg+yUS4RwPLd8+D7NVfdBp5bnLqTMq2aOxNAyTY3omH/0b8gkCrS6dsdtK4hAcn/cI2Vq/4TEHt7yfKMNf7hNTiWllqsfda4WsKJc8K98IYi/cO2d3yV45nHO1TeKbhodDbi7Qi08pDjWY3oYatjzk+z2i1T6moIkQ0HC7vJxi53lnZ1rz6cgvVLJQxIZ4eov9FuwF1PIEJsxMONPn6Yt0A3UoMMlHc1eYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(52116014)(7416014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnpkZEtaR1NMaFdjcld3T3ZLM005eFZqOUJDZ25EZmhUTEdJRmRUc0JKeE1i?=
 =?utf-8?B?bm9jbGZ1Zm9VTExGSkhRYWNFWjJHc3c1dzc3YktLTlRRTmgvVDNnUEt5UzNq?=
 =?utf-8?B?UThzaGYrWHNpSnQ5N0Q3VTBldVBERmF2ckxHSDVIc2llQy81RXJadEZiY3Qx?=
 =?utf-8?B?VVFZZlR5K2FzWFJkMWw0VjRjVU9mektPVXpNaHd3NDZyblhucWRwNzM2SzdY?=
 =?utf-8?B?dnloUzBKelg1bDk4dlovUC9IZE15RzdHM1YyVkdGeEh1Nk0zRW5NRHlNRVd4?=
 =?utf-8?B?UmdCUkVLbWdseThURUtWeE85NzFMN1lGa0dTOGhldE96NElWaVhoK0JJdE5j?=
 =?utf-8?B?Y0Zlakdxc2ZhcENEU2tjMFdlYWdJd3lKS2dyQkpkZWFVZWR3anVLa0JVT2p0?=
 =?utf-8?B?bzArdWhlb2txVmRTT1dWTTFnaS9XdlkyQTRLOEpZZ1JKN0F4NWRpckI0Wmhq?=
 =?utf-8?B?NVYrVDNaOFFtcnVzb1oxRURLK1NrdHJGTXRSSHczY3VNbkp0WE9nQXFWUzFL?=
 =?utf-8?B?NW55YTJtYmZCMFB3NjVyWHZlZkdkck5BZUlBZ0lPWHRaY3NoYzFISE81aEhE?=
 =?utf-8?B?MllSSXdMMGo0bi9nTWZ2NkdyRWEzbC9qa3NoWTA4NGh3Q29ab1pDanhhKzhL?=
 =?utf-8?B?WFdncjE5LytSYmRRbE9xUVREM2N0MGpJeVlxamdYTjlOUXViZGp0NTdWVVla?=
 =?utf-8?B?TWxzcW1JaURrVHhZNVIwYlBVd2gxNDlxZmkvUHVDb1ArbGl3amZtTnNQQmtT?=
 =?utf-8?B?UjNFYUZPejVoVFFwdExJY3R0MEpNV290MVUwMk9hOHc3dnkrUUZBMGNtaGtO?=
 =?utf-8?B?SFFLK3IydlVXTG9nY25GeUwxcDlMM2wzMENUeVY4WDE1NWlnREdSZ1JQUVlJ?=
 =?utf-8?B?cDlHa2djRWhhYWpnWjR5KzJFN1dxVFBYOTFYbTc3NzVoN1NSaUFaeVRZT0po?=
 =?utf-8?B?T2FSeWFrVncvZXZvSHh4bDV4bE01U3RFZzRjOEZKdklJWVhJWHRQT2pzamor?=
 =?utf-8?B?TGpzR0lFVElSWkVYZmhFQkgyeEVYQTBPUXpsQjI1VXh2N2VaUGdpQm1YdkJJ?=
 =?utf-8?B?SGxqY0xDRml3ZzRrbXdKeWFobUExQTZ5eHY5emF4NHRER1pKYmRJaThkOVpl?=
 =?utf-8?B?bDlFQXI2K0FFSGNEVmhSRndBcTRudmM3RVRhMTVDL3RLTms4SnhNUlFyT2Js?=
 =?utf-8?B?NmpiNnl2ZFlYWHcyNHhwRktOSTRHdVU4YkVheExNMnEvL3BYbzFteUkyT0NZ?=
 =?utf-8?B?VmZXOEd2cHlTV2kvT21mbklPMzFyZVhXYjZOczg0WmRrblN5RWlmNmNXc3Qv?=
 =?utf-8?B?YkdxQmpXODllTjM5RnBXTFVaTTMreVJ1TXFINVRDbHRNbWQwd1U5bWQreXZs?=
 =?utf-8?B?OVJQRkxNTGsvMEFvcUJMUk83ZkV2ZVBiQk5BM0V2ZVpZNUNoMlU4ZWFwdGFy?=
 =?utf-8?B?Smx2MU9LRkx1OHRjTzgyN1NvVnQwT1Q1VVlJSnpKMHhFcFpyMkE4dm05Mkx6?=
 =?utf-8?B?aGhvcVdSSnpyMkl3aCtlbGRjdkN0aUh4L0drT2RkTXNldUJNNFZhYk5xdnkr?=
 =?utf-8?B?c1NBT0lkSXBMVUtHdzAyYXdXSWdCck52Rzd2dmc5MlFzZWRPekxuTW5NS0Rw?=
 =?utf-8?B?VzNqQ2hZbHA1MmVkdzJBZ1BTaElPbW05QkprTnBWSGdsdlRYK0syYzRLcS84?=
 =?utf-8?B?QVBteE52dklHdnByK3R6WXVUcjlRdGFjY3Rjd2pZelVtMm5Oby9DUzlLUWZU?=
 =?utf-8?B?U1A2b1A4cThaWGZWdk4zK3dtQnNaNUg4TnFZQXpPeUY0ZkZwbXR2TUNxSE1S?=
 =?utf-8?B?dStHRmMzeFhrcG0yeDRJSWZoQWRGdHJUeGtFOWxTOUJ3RDA1Q0VTZU15c0c0?=
 =?utf-8?B?dW1veXBzbWFnUnVQSzNta3RlQUxpM2dKUlhxMkg3WXllb2tyYWgra2RidS9z?=
 =?utf-8?B?NWt0WDV4dTFEYnpkOFU3d0F3OGlramsyRmwzSlNac3c1a1ZlOGRGb2k1M2RO?=
 =?utf-8?B?ak9xaUM3NE1VSmp3TldRWHU4YlQxbEtjcDQxWmtXbXBsYVhjdXg5anA4S0RU?=
 =?utf-8?B?Nnh6RGhXUGlzQ0VTcC9mRkdjdmtqZWVKUVZhTDk4N1VDbkdxSVFzbnFDRnht?=
 =?utf-8?B?Nk51RTBiRDh1ejRhQ2hHS0ZjMVlOTjJ1YnI2Ri9HYzJiZkVZbVFQTXJOY1pm?=
 =?utf-8?B?T0pXRmFYQ2I1QnhkeEh5OHd3UExoYTNZYTJCeDNwWlhvTXF4V3RsbFFmNlJs?=
 =?utf-8?B?ck1aRGxXcUxWNUFBOWNyNXRSYkpob1R1MWtFUndZcTBKalQvMGNrV1o5Vmpn?=
 =?utf-8?Q?rB5cQEaBd4TQ3aRubW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542f1a8f-edba-4e4b-5314-08de89c63dcf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 16:56:06.9881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ImSv19zejqFG7jK6Kd8rxO3i/5/GoiHyr0Lw33+4vc8dwAIQY8MjIMz/CVqJO8EtZHZ3M3x7IQUJg4ORjMu8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_095625_300723_C959776E 
X-CRM114-Status: UNSURE (   8.89  )
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


On Fri, 13 Mar 2026 14:30:56 +0200, Josua Mayer wrote:
> This patchset mainly adds description for 3 SolidRun boards:
> - i.MX8MP Hummingboard IIoT
> - SolidSense N8 Compact
> - i.MX8MM Hummingboard Ripple
>
> This includes dt bindings and a range of bug-fixes:
>
> [...]

Applied, thanks!

[1/4] arm64: dts: add description for SolidRun i.MX8MP HummingBoard IIoT
      (no commit info)

Change "description" to "support". Add freesacle tag in subject

[2/4] arm64: dts: imx8mp-hummingboard-iiot: add dt overlays for muxable ports
      commit: a26dd6546e2a05c3504072c96129a0932f9aa532
[3/4] arm64: dts: add description for solidrun solidsense-n8 board
      (no commit info)

Change "description" to "support". Add freesacle tag in subject

[4/4] arm64: dts: add description for solidrun i.mx8mm som and evb
      (no commit info)

Change "description" to "support". Add imx tag in subject

Best regards,
--
Frank Li <Frank.Li@nxp.com>

