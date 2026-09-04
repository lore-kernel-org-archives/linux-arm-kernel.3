Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768E3C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBPEaDXQO01h195cFgrVDmilajzGn5xAzhRBQToTXs8=; b=VfyYTNpSALLgfjVY6AGqdIWz8l
	r6IxegE/Y0FEeIE7DoX0ePN31bR96m1P/he03l5Tmifhb81vgBB45mO1F6i0JX4bVXWDHVm0Qin41
	hgatqKfroT0GND4t+qwJ1MfDJFETF69tJT8ISSP21pRXyun0ST+1aocJEgxTYLoTYZu46bzsiMUgx
	VV3WJhMzi8cULrl9BGx07ov/bnorK+ItoasAfKC1U8czaB9mDsUtdsBMN/qrrNHCtk/7nBBCZvSDe
	pa1ZW3BufJaGPkt72FfA6Zlcwz9UGsSzT2RFAC5F/xEDNR6hhUQ0vvCQzMEZNWC4Z5kWnpIodAvqV
	cJ9bTjkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2V3t-00000002PQv-3bD6;
	Fri, 04 Sep 2026 14:38:37 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2V3s-00000002PPN-0UsH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:38:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFq3lorsnx9E4CNtmiC9kgv3LnXgV1EI3w9Xus+xmGDKkxpMX6E+E/1MupklSmOLr/jlrysaSRMa8cS9ib4bdJ779s5vf+2385VlDXlugXTqvkoEi7FVaKUhMJ8TUO1xQiBegvDa5W5QNKB32HRYC/oH8iO4kEIymHA2zTOuiIPRJl4YKZH+Ppiu3KjCPgSJwCMFr4kpUa3lr34bUFDm6/l88fvIyGrq3gtHk9g18lwE95QUASPlvu0TYLK9dd0JrkDeCGUiyQuenktCOTIcXFKm2Ea+E/Sn8ay8zAE/rq1A1gBZFQD1gixRLFZWGlsIzfEjuArsSZpcg/VhEuphOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBPEaDXQO01h195cFgrVDmilajzGn5xAzhRBQToTXs8=;
 b=AT5WQRb+vozfJNMEYxY1Zjnia88ebpulw2xeJe1EkVmRpRlBWmSqmJq2NFZ/HC3YcWuXkW8YOt41I5KLafnL9Dg6IOOyStkwK/v0gVGVY7ySkoAiLEUUAiTW/imCFId+qs7YwpZpoBv0/QsGi9KVxnrH/ZqqIsG4V83mg1VuVPdkOO1v3Y37IhbrLIoaLW70+O0rKGcVWuTo0AABxUQzvk/vxd1bHF47xsiPx3QaN3i2COcpJL3hcVaJHPA2Rt0u2aZZmaz7jYsfLCVkPvBKjsNBbPyBGlIJYM9k8B4p2wjWHY//Nq/KJhrW0qZa7p8VSm8+pKxWdSa6j+BjEQUgyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBPEaDXQO01h195cFgrVDmilajzGn5xAzhRBQToTXs8=;
 b=n5aHo9SAnp8gUlwkI5IWfsxRuQ3/zuPyIvIMe4useST5wd8bFuW/ORuEsoMFlKv1PKG8KVZD//iQRhq4uPpjigGBY6VJ3u42KhVRXBy7LSh2hlj0MJED3ROIUVqUurCiy4eRsJGul0KC4Kgsq4YljhZXTKHZ9HGqtRhqTXHG7HkdTd/b1ucRkP8xEulYgWjFjlQ+DGOt2Os6e8dvpmirY++pMHi/rGFaINGIRj0yieKNG4oSKYCIckoki3gdf93k2MbsOFv8TVQF3hdbsjyU3x0ZYP5BHQOYhtfgwedsVpzzwi5lbCNY/T++gW5Dl6N/Qj5G5Gy3X3jS7o+hIYhm3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8347.eurprd04.prod.outlook.com (2603:10a6:10:245::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 14:38:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 14:38:29 +0000
From: Frank.Li@oss.nxp.com
To: linux-arm-kernel@lists.infradead.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	Roger Quadros <rogerq@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: (subset) [PATCH v3 0/7] ARM: dts: Replace clock-frequency in camera sensor nodes
Date: Fri,  4 Sep 2026 10:38:22 -0400
Message-ID: <178853267507.3991447.16904124015113436598.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR22CA0007.namprd22.prod.outlook.com
 (2603:10b6:930:45::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4f18cc-14e3-42cc-9f83-08df0a922fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|23010399003|19092799006|376014|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: +Bq2RZx9gEKmAAKr/rxEAOygHdK6PQ/YtD89gBUuJLhZWItTUNWDvd89ANk8r2DLXzePGH1eTNS8uNENotO9r288LMWApFkLMusvsuva5SI+4NTm92aRCihELXcwDDM8SW/dGRq2/bMDryNsy+CmRECFS2GSJ1xyIH+WdXyA9vM5qjyAIfZLtJisgP6apHQngFU3YQ7GtEbA4NYBJRduQNkCxcSMk/qFvlN6Wy6Qu9/RZ6JuZxHDs6v0WoKQk2/28F3VEzmYDNMGAJ12KEG4iCOMZYCxz/oHOKDzbKSG8jPFIj3mPdlDlWzHkic1OZTMFNd9CnSAv8cV+vXoplaSq3j291Pw0G17Pna531MuDGpfxaeHEtWh7Ns8oF7n3avImeXXwxiRuNOQYgG3C+02POdy6sUVkg5D4ofrQ3ZVn+ICrTRRmNtfn2t50yLBKyLEgzRi11CgPNaGU5bK2VrPAWbpuAhICbGysTtDU/ydOsEhQiIyAVqS8BM6XCnTVo6hn1nTgM6yt8+/j2PWCXF6jaAYdoCN41Q8zExL6im8/0NYPIkVxTdYIPy0g4XnSSolrW4BXrnHi9O9OfeLa/1U08zf9bXx/AA10C/ePR7FMFJzzIO8hkiTSlR9TryHjyXfHMG1Pw8o8UW7iwMlXu9u3CliET0MPDum1KqMm9BmtcE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(23010399003)(19092799006)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anAwRTZQRUZNRVN1YTVkaDJxaU00VzhzdGNVNG9ydmhjeXU1c3R1NCsrazMz?=
 =?utf-8?B?YlJzbjhjODBCU2JVbDdzQzFRb0N6QVZjREQyUExjZk1zakxFWitRRmMxbDU5?=
 =?utf-8?B?Z21qc1hCa1UvR2N1TkdVMGpIRFB6dDhjdU9XZm1CTVRoczBMcTcyTnlhamNO?=
 =?utf-8?B?TmViUXFXSExhN1E5Y0owcml3NWhOSEVrMU5OUEsrei9JOEY3MHpXdGtPNVZz?=
 =?utf-8?B?VkNkV1FzRWY0NlJTeFhvbC9JRXB0ck04Y3I0SlU0RDd4akJXOFRGdWEzNXZV?=
 =?utf-8?B?VmRPQ3I4ZFJsZFdMdklINjQycTl2cDZ3YWZrajB2SktLdGY0d0d4NFZjc3px?=
 =?utf-8?B?S2RHcG5qVmdzREp2b1FrMnl2a3AzTXlhcW9KZ0lCaU1Wa0lWRDFtQWVUV09F?=
 =?utf-8?B?VzB4MkxnaVQxZUhtUGdCOTBsNHBNaldoK3h6WVdPc3VtQ2ZyL01rZzRYcytJ?=
 =?utf-8?B?czkwZ1pqeXIxR3NScUk4RTZYNjZqc09rc3ZmZ1l1Z0hkb1phbzFHbFF6VHJI?=
 =?utf-8?B?TXNuNjJmcmg3NmVzWUM2NUtvd1BvRUVCMTBseDdUVU4yNVllSlhlQlJKVUI1?=
 =?utf-8?B?ZjNjUlZYSDJ0eUR5Z1FHYVhVNzQ3RGN6bm9IZ1R5ZkVUMHN1azJBUFFKMTdY?=
 =?utf-8?B?NG5EempadmV5czM3SmJHR1J4aHB0azhTaENSV2ZCeVdOWjU0Rmh6dzV5S0tw?=
 =?utf-8?B?NFdMMXVyT1lzcFZxM2k5bWlTWVRNNG1KcUxQSDBjN04wN3NLTXdFVGNaWUFx?=
 =?utf-8?B?bU5hTmEyckZzNThpVXpOcUVyRVkvNzcvYVc2RENGaEF3a1pVc2xaZlk3bWJI?=
 =?utf-8?B?UGhPYVFnOUtycFI5NDNXRTBjLzJabDY1b2sweVkyMUUxVkhvN01uOFlxa0Zx?=
 =?utf-8?B?Q29EbmlBY2J3aGJyMk5qdHJtMVQxTEk1YVdzV0lyOVBUUWozM3N0M1VsTnVB?=
 =?utf-8?B?QlY0ZGpnM3hDQ3B1SnlsQUdseUJEN3hwb0FIN0VrbFZtM0g3ak1yZ29QNis4?=
 =?utf-8?B?djRpSlg3d2dRR0xvTDJndWpWTjIxaUVwTHVaN1VFSFdNT011QVY1eHlrS3I3?=
 =?utf-8?B?U29SSWZ5U3R2ek5vWW14QXIxRXNWa0c5YXpkbjhpSGhNa0FJODFYNHQxYzBT?=
 =?utf-8?B?cTcwV2p3bHVYUU1qVS95bXc0UEt6MGVGM1FkaDhnMDNpU0lYWGJLLy9sOE5l?=
 =?utf-8?B?eVFOelFqNVRJQXBYL0NVbVdDK25FdXVKL0l4TFRnNEhscVhGVDhVTDFvS25Y?=
 =?utf-8?B?UlFEbDdxcFArRXZtZjBMU0ZoSWd2eUdwdnR0bHZjTytUNnJ5YSt1OThoREZU?=
 =?utf-8?B?SU5vcndJZVNGam9FUnZQWmxrZEFHTkpZTXoyeGI0d01VeGhmalBkckthU2I3?=
 =?utf-8?B?NUNNQmFOUStxRGZBdWdJTlIvQlhZa01KdjUyUXZvNXlKeEVmTk43VFhncEVp?=
 =?utf-8?B?dVpMampKU0lHZXBRK3kxSTZWbkRyUVJCM2Z5REtGcFlkQk02WjAwRWFTb2Jm?=
 =?utf-8?B?LzB0K0VCc3Y4TmpIcHJVc0xhSkpzOHNWZjF2cDdRbURMc0xSSEh2Y1ZPaGQv?=
 =?utf-8?B?K3R0R2FmK0RFMSthY1lTQit6TlZpNTBQcUtGRUo0aFJpU2hadUg0NjNoRHhE?=
 =?utf-8?B?RDkxV1Fld0FrY2lwSXhRRzZKa0FpVTFiaEwyb01UdXlkNllzQWt1K0Q1SUdI?=
 =?utf-8?B?WWljRExTMEFQMFdSTkxBUjU2b1pTdXhZTGJuclpubkJwWUpTQTJ6VmpjSXhF?=
 =?utf-8?B?U2JNaWV3OHBHbzhWcTVDUmM4clZnaXNPaVNYaHZ2WUEyMHVJaVFCOVI1QlNF?=
 =?utf-8?B?NEtjdjBGZXZmelRMVkl0TVNaSFFTNm5Dd1dUYUZ3QktGd3lpNlgrY28vSHpX?=
 =?utf-8?B?WnpoSWFtS0VRK2xGT1NwejMrUHVhbkl5aXMzTllCTzZYbjFNTXI5ZWltSVht?=
 =?utf-8?B?L2tnVWxJL085WTd4WVI0d2dGT21WTjlsY29jcXJVY1hXWlFGMFFQd1pTd1Iz?=
 =?utf-8?B?UWp0d1RZZ2VWeHBZUXFUYnJObWJVN2pJK0xTN3BQRVhiTDVxeFpXM2hHQk9R?=
 =?utf-8?B?RHc3VzBTb2JMcEsvRjJDYUZzZ2VDSFM0dHhDc3JGUHBDNHk4bnMvQ3FmQVpZ?=
 =?utf-8?B?Uzd3c3BkcEI3ZFptOGdWQ28rSzN4MitLb1J3bUhac3poeEFJK3E5NFpRQ0pK?=
 =?utf-8?B?MzZPQmg0QmNNYnNad2Z4NjlVMW1jVy9KUUtHYmZjRm5VWWFhamU1T2tKZGVI?=
 =?utf-8?B?Qk1kTWVYNHlLR2RGb2Z6YnFYZmNqZ1N6TVpKN2NkZ1BNbjd4RE5VajlKNXdh?=
 =?utf-8?B?WGx4Qldhd3ZLMms1TDcySGFiMTVhcnBESUhmdzdvNFpnZThIMmYyWWFsbVFm?=
 =?utf-8?Q?aco5jLE9gBO/iMtntfU7nkch/FUN5xP2ZsVVa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4f18cc-14e3-42cc-9f83-08df0a922fcb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:38:29.5126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8Ha2Lug7YyAITMq6F3okeROFt3GKdSxpDVWxtkjnwjb25+cppFbe4TQRq8ZHuEc4VgeVn4cC51h0GLy09iSoWSHChfaZrvyvnrs68l3gkxLMkHSTz+fuS/4blymCKYn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_073836_163573_D52FDCE0 
X-CRM114-Status: GOOD (  13.50  )
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

From: Frank Li <Frank.Li@nxp.com>


On Mon, 10 Aug 2026 21:05:57 +0300, Laurent Pinchart wrote:
> This patch series contains the leftovers from "[PATCH v2 00/72] media:
> i2c: Reduce cargo-cult" ([1]). All driver patches have been merged, but
> DT changes for ARM platforms were postponed to the next kernel release
> and ended up being forgotten.
>
> To refresh everybody's memory, a large number of camera sensor drivers
> directly use the "clock-frequency" property to retrieve the effective or
> desired external clock rate. This is standard behaviour on ACPI
> platforms that don't implement MIPI DisCo for Imaging, but usage of the
> property has leaked to OF-based platforms, due to a combination of
> historical reasons (using "clock-frequency" was initially considered
> right until before the introduction of "assigned-clock-rates") and plain
> cargo-cult.
>
> [...]

Applied, thanks!

[6/7] ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor node
      commit: 3d597df4760eae04914c52dedc55e1325f7e1e62
[7/7] ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera sensor node
      commit: 3c5fe802a7eee3e43e8a8fc771d8a6e85a8016d4

Update commit message

Best regards,
--
Frank Li <Frank.Li@nxp.com>

