Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BB6E9DE62
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WKwkFtscm7EMC0jAN7VxSi96POIkm3nwl4WNzfzdG5A=; b=yMZo1l/swgaugT0nHRzC7/YXGa
	F8qfHlMwetZoNQTnLqwZO8cSbCUcWpzGQYQXbsGy4CXLgB7bwLjFwjTQHK2pRd6yPHHEFac7h/6QB
	5gXASR8FZDsXG9uEGDbvCdk4dVotQtYOMP1ituShUQvDJIS15cEu2NraZM4r4tQf/WZ37g1atRd5t
	rygMbCBHKWdkZ3G5LMWV/9dWiy3M4Q/vc8T5pkKY9XfB6ZcYi+oQKDa+xPRv+PdvYcCjJq2uP3LZT
	uS2E56cRsmPlKNV3evcMJU8aeHB8iCM2PagNRq3P2Q4iHe73rV3n1E4i2Ub8DJPiouYz8/A0/u4Rv
	+B3K1K3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkOl-00000009u5y-0xPK;
	Thu, 09 Apr 2026 08:05:59 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkOh-00000009u5D-43QR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 08:05:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMBfxxUH61s+tEk4qeQEm0k+hLb/0TnsV81jjdnmaN+qSJheXGavqChrKHvZGfOhaO5nHWXveAFGDpkwzRGaQT7PYir8i5pQFpu4vCJKI0ulUic11zxTvQUkshIIVtbbVCFWl82w054oCtNZwcPkc//A5tFBvJu/GafcglReZDFv+oB0zqTFAhgMc0pQD3s5L5DRFMduk1bvns5frCXNqlYS3wex9auZ3lQ7JroO/4xUmvRnSbo5AOX45BhMq6cXIldlp/Zk9aG+cMsiRdSIg5sjxRrG7bF/kcmrsGVBwjRkuz3bT0I1P6dwZLMKQIb9MjnFjvTgPyKQuf1H9JozjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKwkFtscm7EMC0jAN7VxSi96POIkm3nwl4WNzfzdG5A=;
 b=F0HamwQ2Pa+UNUPFJtOOJCOVaJXU7Ox+hFoN+FIuHFTtRnKcNFZznCn88Zu5ayxUOiY7H6Yir8YnXHrkNZW33VmeiGWRRmXxWvFEqhDuXtVdl3chcoi87QJk8WtvMBq5V8okcIOtZY2cWxNcpCfj/iXChabqLmUD54QqzGBBBMTENI3eItmUX9Fvlqc2LzinZlvMCVQWNvmAIMVyLXxLmTuex1plMBy/15PR+nvzGsFYQw8fU/dlhs44Chxly62BeP8uzaimIyl7qztJgH7Gp9WwMrNjkfDA692t5bwwwKxGLxEqXnhjVlJelX1ocYHyS/Xeu34/N1/IF8er/VnSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKwkFtscm7EMC0jAN7VxSi96POIkm3nwl4WNzfzdG5A=;
 b=BTUA/lRoob3UdSIV2YaO6X/lcsMUpdsGNYrpACCJ0ZDwN8gKJqLlvfti1C0qyoQ1WNtZC9lmHpXz4WQdiGg0AyF19nl++/SwyZH1TRWxypDfUqDrCT53fnuWVygwegQpNkhD3MjwrzZWtiuEIJ0NBzep0HYaq3G/i5sl64N2s03zihiovGfbuMSoYItgRqDiuarjkLjESusZ2dkaZsSlYF2RoN7qK3keoRgqSZrw9B6g1N1uUnqqv7GFY8Mu+X17/l8gHEyE1CPpFAmUKNZjeJH/yrGevQjDgQCFiCBsLEWsZ2HanztXYQaUOYi0vGHGX9APKqwaXJxDZ1B+EkCN2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9409.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 08:05:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 9 Apr 2026
 08:05:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 0/2] pmdomain: imx: Fix i.MX8MP VC8000E power up
 sequence
Date: Thu, 09 Apr 2026 16:07:16 +0800
Message-Id: <20260409-imx8mp-vc8000e-pm-v3-0-3e023eaa245b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADRe12kC/32NsQ6DIBRFf8W8uTTwBKWd+h9NBwtY34ASaIiN8
 d+LLi5Nx3OTc+4CyUVyCa7VAtFlSjSNBepTBWboxpdjZAsDcmy4QM3Iz9oHlo3mnDsWPJPYatd
 YqZ9KQvFCdD3Ne/P+KDxQek/xs19ksa3/alkwwRojWiGVMG2Nt3EOZzN52FoZDx9/+1j83qJSH
 bfqovThr+v6BWd7nU3wAAAA
X-Change-ID: 20260128-imx8mp-vc8000e-pm-4278e6d48b54
To: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0245.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS4PR04MB9409:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d536e10-9478-4542-4b92-08de960ecf58
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: mpwtrjf6kjn1z4q4RU6ji3VLovQ9oPFuTMUtONZC+LqXK8fK60hPYtwN/V5qHHHXrNZoUfhBjEzQXGo7PZWoeaAmCiGUofZ3PRVjhQ5V9lAT216w89dyof/33cxpgM6mi2dM7+Sf06NLETCdTSqMK8o4sY5feJHLLpTb/4pI9e5Mv/7k1dB2liNoMdvzQTbJG/3ST+IcYom9MVcry6sMAxWsTf43HMVzs9MxusRfYCjZVRvICBL9108FTlA9NovdiOdVEmMsthNLbZXjuroneg75aHxbzYDc/h8Qm75qr6EEMukVXqF7Goxj0D689oGsA2vRkCdU0X6gRiy/q7bO8FuOeHKAtAjdz2eGPGB3gTiATlnsNv4o9vBE8kkB6f+1xajqg3G0+lRZ3RwmCW3mqKpGT9qIROx53zChjlvwtIA1LH8QhxHpiA9e98xxKGjn71ek/D45wyLFXmomJT1uTNuuuXv7z7NaSGsr/GeZo0Rh6Yuq+vr8ocKKPGp+z7naBfI/Pj+R63G9WNUlKN7oHRcG9lXmFUaE+RXuuMgOlrDA0roJ0pDc1ZLwYuJuPaqLf30XHWBy8MNREm0dp9Ly+rIgnzTvZG7ROPPtV9DO7BOE3NUbHCsJbW7nbFjus2uYgjkGVIvIZIqczCrHV79JUX8QVHQWnI3ED4oDTCfTfxCcCRkhbOaRCw++g+Cm6wInDvHAvdIRGw/5W+4wqcFCOIaWaGsqGxzxxlpi6W858tw1/qkEvBPwG4+f8o8RfbzedNyDTfbMD6MhQJjRnga/puWdk+5yuGXEKZEOYrySARzujHtsx7Z13K/qwyx4fyNn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2dDSkdYNU55d3BXYjh0WUcraUlWVG52VU9MVHhXeW5KMDZKM1dYUUhvZlN1?=
 =?utf-8?B?Y0ozak80R0JxMWhjR3hhRk8rUU9yV21GUFNpTG1sd1EraThxQk90ckR6ZTRU?=
 =?utf-8?B?dUlHcHd0KzRkS1paajFiRUJ4NTB5OFVwV293Zk9iaXMwRXhSNHRVUU5wRVlJ?=
 =?utf-8?B?b2hBZ241Z20xRFdyQkszUm5KbisyaENCRCszQ0RldFdTM1MxRVNrRUQ1SC9j?=
 =?utf-8?B?STN4UnpXRUZIWlhWN21sWDVpNU9hcEpkWmVrVHhCeXFNSzZDT055WHNMY0hu?=
 =?utf-8?B?WmhEZFhGdE9Qbi9RdG1ucTJsWjJxcDNMUEhreXJUdm1OekhHMkovVnY3M2po?=
 =?utf-8?B?UER4emFnQXkzdC9KVUxncmZUV2NPWng3YXpVd1liaHExbTlLZ2Fham83ZGlS?=
 =?utf-8?B?YzdPb0ExRVpxZ0NqVkRaSU43c3hjTVNHR0Qzb0hWTmhZWU1QdzM4NEt0Yys2?=
 =?utf-8?B?M3p5bDdrNnViQS8yKy9JQXNmei8rakFBcFpDaU1HUTBCUzMzaUsrMTZaUVdx?=
 =?utf-8?B?N1R6b1RIR24weVFIVUt4TUI2dXY1QjZhZGg4YXorUWdxR1FuV0RIMjdPOHps?=
 =?utf-8?B?bnNJRGdsRVZxbEJYZWNkUUJudFFJTUkwMlE3MWFXSXVJaHYwdFM1T0VETEJs?=
 =?utf-8?B?Rm1VL29aZldaOHl2Q3FBMUljMFBodVl4b3dzYzh1UUNjeGdCRm80RWlGN1Zm?=
 =?utf-8?B?UC8xeDNvd2pTVzZmRkM3T1Jmd2VBTXFqdURjeHJtUndUcUs3bUVkdCtZTllR?=
 =?utf-8?B?NVEzM21jd01ReDhBdnF2UTBMYjF0MGxkNnoyeU9EbE1sdUVERlZkeWorZmtS?=
 =?utf-8?B?clpsTVlBREdReU5nSmFvemdBclRNN2t1cDdCRXpGc1VlekY4b3lyNW8yTEwz?=
 =?utf-8?B?WXB5Q2ZKSVhUZ1QrYVhWdHo2Y2dkYVV6SkZwS2tmTjhDRHJJVXNPRUVLdUxm?=
 =?utf-8?B?dnRrcmc5ZHk1c2tTVkQ4d0lvMU9WUkZYNnhvSERPa2Q0ZGU5ZFhjRW1EV1JJ?=
 =?utf-8?B?djJqSTh3aDhVTXhrbnRwK1JBUnZmdXpzV01uWkExclJlYXRqcWVnME1JWjg3?=
 =?utf-8?B?ZU9Dd2pkb0grSTVkOVNqdHZtMi96Sytha1VTRnZMaGhlVjV2UjAxbEJ0SWg1?=
 =?utf-8?B?bC9pcENUYXMxS0lpSlltaEhqbkdkUHQwNmYrVXFVTjJxd3lndFJEbUhrbFg1?=
 =?utf-8?B?Q2dyNHloRld1TkVpb1VZZ2VWZDRFNzdLdkhnMzBYczVMZElMbEFYbjNDVzN5?=
 =?utf-8?B?LytoeHc1VTErWHNBV0FJc3lsUWVRMEFNcExveXhKR2VnOVptWFBwbnA5d0cy?=
 =?utf-8?B?eWNDeVVCSDE3djlkTWtQZ3lNblF4QTZESkEyaytkZXg4UmFiMVBwLzlDNXUv?=
 =?utf-8?B?cm54RHFVeG13ejZURHFUbFljQU5oVTNEZEFxU0dkL1BKWGxQZnhEd3l0RE1V?=
 =?utf-8?B?TGhidDJKRlNOWEkwUGUxUDZqM1hBeEQwK3EyVVZXeWxVK2VCMVViRHd1azFy?=
 =?utf-8?B?Q1piRFp6ZlVEd25kdTFlaUVkbVZiQTZIUGZjWmRhNTFSMzVZMzQzWEhCazJJ?=
 =?utf-8?B?QVJ1Y0NRUUZqck5nMW9DTHNDd216ZmpIdHlXcHBPZGhkZVFjS3JHNzRlQmpD?=
 =?utf-8?B?dE5DTHFPZ3lKeTJ6TFl1cHFqVHREMjFzT2lINEtpd1p6dXJIVUhMN2lPZDln?=
 =?utf-8?B?VHRvU0hTaWFoUTJFMjd3Y1VWeDhnY1hZMDV3T3hpbEYxUVZtcTJFckswSXN3?=
 =?utf-8?B?U3lBQTlrdis2ZkpBVEFCWkorZjhnbnRqQWtHZ0dYclgrQkJDb21HdiswYkR5?=
 =?utf-8?B?a05qcGF6dm5zUXdLbEpyaElMM2pCQXZSTXo1UzZxVWVycHZnYWMvaG9UMVNY?=
 =?utf-8?B?bU1URHNLUmFWMGEzbFB2K3lYUS9WdWVuekFzaSs0cy9pTWluUWhVMHpMblBn?=
 =?utf-8?B?OEtXSlhKaFV6b3ROK1BHY2hMWFhhUkdGd242eXVqcUJrRG5iWlZEZ1NlZHFi?=
 =?utf-8?B?d2tRUUdhUEgxSllrOGZ3ZW9lZXJpWlZGcGt0QjZFOUFkeFM5SEJBVGVLYzZZ?=
 =?utf-8?B?bHJlWXZaT24ycUZZMUhBMjdPVklVblZYZzl2MkZ4ampkRmd2RmFtQTFYOC96?=
 =?utf-8?B?NlR3S3A1MGpRMjRKamFxUlpFcVpsQ1ZydFM0YkN0NzJpckhucEZlOW95bXA4?=
 =?utf-8?B?eU82OUxaZVlQK3VtbjV3UFlpZ2dqTHZKbHg4SzhUY1dmNjMwRUJjVGxtT3I1?=
 =?utf-8?B?MU1EWHE3MVliamphcktjblJNbXVCSWI0V1ZzanZWT0wwSlJjN3h6WktER2tR?=
 =?utf-8?B?YXlCZFVPS3lNUmJJekdWZlZrMWV1U2w2azVSMGhQem03bkxHY1Zmdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d536e10-9478-4542-4b92-08de960ecf58
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 08:05:48.7165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8rUipCXGoEdm2s1tmpgfrHvKweQjBdpQP1pkfeTIb7884lvtIkA1/DLHpSpeoT8VSEC4vOCpsBiXj4XOwYKLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9409
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_010556_020536_B751206B 
X-CRM114-Status: UNSURE (   8.21  )
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

There is an errata for i.MX8MP VC8000E:
    ERR050531: VPU_NOC power down handshake may hang during VC8000E/VPUMIX
    power up/down cycling.
    Description: VC8000E reset de-assertion edge and AXI clock may have a
    timing issue.
    Workaround: Set bit2 (vc8000e_clk_en) of BLK_CLK_EN_CSR to 0 to gate off
    both AXI clock and VC8000E clock sent to VC8000E and AXI clock sent to
    VPU_NOC m_v_2 interface during VC8000E power up(VC8000E reset is
    de-asserted by HW)

This patchset is to fix the errata. More info could be found in each
patch commit.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Separate power up notifier fix into patch 1
- Link to v2: https://lore.kernel.org/r/20260228-imx8mp-vc8000e-pm-v2-1-fd255a0d5958@nxp.com

Changes in v2:
- Add errata link in commit message
- Add comment for is_errata_err050531
- Link to v1: https://lore.kernel.org/r/20260128-imx8mp-vc8000e-pm-v1-1-6c171451c732@nxp.com

---
Peng Fan (2):
      pmdomain: imx: Fix i.MX8MP power notifier
      pmdomain: imx: Fix i.MX8MP VC8000E power up sequence

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 45 +++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)
---
base-commit: b3ab9a7b9b32806b1b68c4fe7d5298702195eb3a
change-id: 20260128-imx8mp-vc8000e-pm-4278e6d48b54

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


