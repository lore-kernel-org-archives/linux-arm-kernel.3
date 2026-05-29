Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB50CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XXVxA87OMHv4oCEwE0N2B8pkgSnIOKaB1Z1G8eB8jv0=; b=w8aywPQ5rsU/eUxLxhCgxs5S+5
	MbyEj6hPrGstNqX6ar3PIuqaPNtVtxG+cjWsiDuMfwYugGgJBhtpE9G3qZHjcqgRn/RF/lyCKvnyB
	D0u9Q1FeCM3C0JKc3ZAeud8fP1GDIpWNKdS7FCTYQPvrKednnrBhC6CxVLy3AIdro5Pqjybjy7VCV
	H5n2uVcChycfJD+CIalaI5UyP0VEH7mS32F2QH7ZbnAUs5j/cjgtBy2rl7ET22SD6f2x24eQL+Dww
	CXYnwh2Z1ySE9Gs+PW5DV7xhErsuxRTb4tro8bEqrqILbOTq6BvFrlN9GDUe28paVTGzUPF6ydnJC
	7/vwIRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrHz-00000006rH5-13K4;
	Fri, 29 May 2026 07:05:51 +0000
Received: from mail-norwayeastazon11013046.outbound.protection.outlook.com ([40.107.159.46] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrHt-00000006rEv-296r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:05:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuJgD3cFGhkSWWxHhxmsuCUW852pIEV3i2Utu0fGzOHiGeVkbdZer6CXzEEfxc1WIm88flAwXrqmEK26VAJfjto6tw+QH34aehMGRpuu0WXsQilPRrlVjfaa8LIwb2B8guQAn7aDsmPl9n6/g2FOO4/cbSf/M8ozuKe6Qj2hfu8q7VeXdNNwf6dl4jxvhz/NhdM3WH0njbWvp9RLOF2ooefQwGSfSz2M4ehq1j6vc0QaNjCodpLygEshX9dPpUeYnHDsBC6RBc1VvZjlg1sZKRiC50b4snx9iH3/9O7hY8NooQ/5O44bVq4ZT41e5aBOdbYldr0sqrmUoTWvYqHHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXVxA87OMHv4oCEwE0N2B8pkgSnIOKaB1Z1G8eB8jv0=;
 b=ZxgPHe/yNV0rSN/mV+KgyrQ/68w7eCIrku2FcEJMI8nPu59FD9mf1UBass7v/dk7cvEsB7eaGaWWTDo5YgqzpQ0PgP+GxZ4IOWLtHoDZrAaPLzpo/czaLGSllB3xCULLzOTJNQfIoFO/fhK7SyHigU31Jz8ROBl1zpcg1tmJq5FiwcpxlOtPWg2vTeGXQgYMbdJzLt1ikXVH9wCn5xBw6iFgkh8OwAGVWqH6wEfr+eGUrKhW2ZyvE9XrpH2NKBS/xns75tT6PJQVFpzoIs5l0mec1vKgy/W84oN8vffXI0ZqJgXN0fplU0ID7dePq6E7ZvC7yy8nHi06hjNQWw0qNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXVxA87OMHv4oCEwE0N2B8pkgSnIOKaB1Z1G8eB8jv0=;
 b=auZ5QmVj53JPv0nOlJ6gvqrbJl57uqTiHtfLhbdC3dajNcALsHapr6bzgCcfQiE/sawXaa0qrk4CyQyuoPcrVKsfKyQOl2GEfSBpLg1SgUBNUmV2sjdnBNbBmnZ/ToJIwOb4rit2/Q8Ij6MeSTPU0gnWTs/TQzbgoTLHjW0v2MLb4fGEs+nLoryVGYbZfRdM+/DXpSsk0jnEIdSegcE7H/pgSgJDgcou9LgrYWE1d5Gv6q+EYg3xc4jRRoVHDlPUBVqsP7QVNf/39hmSV6f1c/VIr6vgKkHZ0jqYBGjTMG0wW/45cyn+66FGnqJeHHyOLRhtHrDXs3LEkn9g/EhvXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAWPR04MB9839.eurprd04.prod.outlook.com (2603:10a6:102:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 07:05:04 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 07:05:04 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v3 0/1] add PWM DTS support for S32G2/S32G3 SoCs
Date: Fri, 29 May 2026 09:05:01 +0200
Message-Id: <20260529070502.1749632-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0122.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::19) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAWPR04MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: c059914e-a585-4cf8-9cc8-08debd509c00
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ihwA4RZ5niDWtwo0RB5WhfZ2kjA8pgMKS/B21toZ4zCNNM82QegnzFn7m2qlAJ6CiZN+HTDIgckfkOWs8zuIcUVnX41/OXHJDTMxrbyMxaLkbrYxjN1QwScTpL7eLWBg6qI1qZ1YOERpgSbKXGP8gjGx8AjZuqcy2Uz9H1bWnvUmJ4EviitNqXn7t3F0+rXK1S4JY04Kgf9IIH5kVQTC5zkXc5qfs6LjVV1u1GGxaxJaGBDW5t9dO+RiO0DwFJ5yNBM8kovb8Yml1winqv3HsKYARNfDY4VUGgQpeNq2hMKIZH3OzhIiyoLfVbTVr2SUZKsb9WCPBKt558fbg7+/T7ZYa/t8H0CmiBOkROhLL9uBQsZVBZavfs9F7hjZuu/UpL+TwXssaBSs9ucLVvGUoubUBixC8PSAbatzf4m8Z8gXeX92fIAvS3oPV8jFr9JQFRqvuK83gY/Dz563zyZ+gHEbdi4QARn8XawcmZwfsyF9NM7uw7vWneIqRupLy7qFk36q2AgxV5KKMmqGlGtcEqNnwPLkz22TQ9UXqlvENhryrUEKhAdZGSUkjtbeyCqrRCmvZlhfpjmkH4kSuj8yuXCFsWuWBLWi/PMMxv0GF5BG/UWQcOe+KcZPx4LuHjdxG5Yh6wQjYlkXRi7dvCnyXptq5cJ9WI92W13bUCje+Rz19tZvsce4liEjXYd1qPeA/BYA3sW+64WZ94CEihUWzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDVJYW9RQTE1QTFsK0o0elJGalRHZTQyZEZOT1dxMzM3M0lzY1B2Uk1QWGlK?=
 =?utf-8?B?bnBReUFOdDdKYnk2NjBLM1cybnV6TjR5NWRxNW9uQ3d4WlJYc0E0RndxeFJZ?=
 =?utf-8?B?cFNrZzNTQVU1eU4xZVh5ZHpmUCsxTG9kb0JSaWpOeS9BSk1CN05nMU5kOXFN?=
 =?utf-8?B?c0E1clRBeEh2NHoxRTZCQWd0N0lYVVVRMWNIMVBLMFdOcHlnSW5GZm50KzNk?=
 =?utf-8?B?dEVSMnRDZm55UlpPcVVMMVN3dndiYk1oZ21uODBmMkdqbE1XTjNUd09yMzZV?=
 =?utf-8?B?ZDBnZ05WNjhZa1dLcXgwK0MxVlVyUTl0anBQdHdORjFDcDRqcitvaFJsa1NV?=
 =?utf-8?B?b0duRCtWWjJNVWV3V0J6ZitLcHBMaERMeVJ2K3I4T2wzZ3FDNkViM3JqK3BE?=
 =?utf-8?B?aWtUaFduVUxrVXlobVZyY3V4a1BmTWVZZ2JEUkFaNHJxYWRoRU45eUJENkVy?=
 =?utf-8?B?Ri9mMmZSMUd1QjBEaTkrK2FaWlM4ZUZZd0lyVkp0YjZXTVlpWW1GM1BxT2tP?=
 =?utf-8?B?Y1VoN2tQOXg3dGFmNmNoSXhOUXFsWnVTTnFEa3VYaVZLQy9NNGdyZWN6cC84?=
 =?utf-8?B?dmx4b0tlY3hZOERpSjM2Y3JEN1k3R3hEZCtPT0ExbUkyR0tIQ052Z0VKbkFT?=
 =?utf-8?B?NWh4YUxDZFhjN21uYk1IRHFHUGVtcVpKRnJVa2FkYTE4eHhKeDVJbXZieCt2?=
 =?utf-8?B?Q0VXUUNycGtneG5DQnBuTENwTjV0TWYrYUJ3RmZLQWN0VDI2WUtOVGg1RWlD?=
 =?utf-8?B?MGRWTDRpOXRzTUxnd1ArdUk3bENwcHVkdFVlcHd2Nno3UmY1alFHR2xoTUNV?=
 =?utf-8?B?Smt6V092MTRZc3h0SEdXNmhHY3dOcnFoZ0h5OHVnWVFITnVzSTVMRUN0b00v?=
 =?utf-8?B?eHdIWThMMDR2a0tNYlozTXFhcDd3M25CRms4QU5RVktUcGg1cFZFTDJkL1Bs?=
 =?utf-8?B?QU1MajVnTURVSDl0ejBYci9RYnJsdDRuaml4K2U1ZXdaNlIzVHNTZHJSRlE4?=
 =?utf-8?B?RmtFUm1aQURXY3RFOFpWNzgvVDJ1aUJxNUxGd3NoY1dBd3A4d0dqcWVGcDl0?=
 =?utf-8?B?cVNKL2oycUEvQ3ZYNjhWQzFPSjBmZURLS0ROZnVkOUk1SlZsc1hzb0tLRThB?=
 =?utf-8?B?MWhxY3pDN3ZhY3UvS01IM3dKdWJGMmlkR3JIYk13UEliQUNLeXZkOTZhSkhu?=
 =?utf-8?B?VTV5ZUNkUG1zT3dxaVZaUkpEWHRBS0xoTVNRdUVsVnlUZzFRZUk3RFBjT0U3?=
 =?utf-8?B?V2hjNVJBUkhRcFAxNHJVNGROTXlXZEZQOEp0SjVrRFhMM29GbWgvYTBrTWdH?=
 =?utf-8?B?WllKL2Y5V0ZzWWo2aGN2MFNQLytrOUxpd0lnRTg5SXVEdVNUUFBwOEhsUWdH?=
 =?utf-8?B?bnhNaDhmZXJpOWUreVVPcWptOHRabTAvOTBZUUIvaG1ycjJlcXhFWklBUVFw?=
 =?utf-8?B?YTMwNXhRd3JYbG1wSlY0VWlLazV2ZW5aRFMyTnQ0VGp2M2MzZkFlL2NXSmx6?=
 =?utf-8?B?N2NwWHYrMEw5L1NJcDBtZ25vSWlUV3liUk81OWg1eGVMVGo1NlFETEZUTHVO?=
 =?utf-8?B?YS9kYnUrMGVOQVlPdDlxTkF6N1lySVV3TTZXOXA0N29PQU94ZmNKZHIybm5q?=
 =?utf-8?B?MFlGVndMUWozaWZZeXhZYW9ucXMwcndmM3FVZW4rd2g0VytHY2VaMVJobDc3?=
 =?utf-8?B?SnZzd0xHT3gyTTdhanFESUNIbitKbVpINTVPT0hmMTZmVXo0MUVDSC9WejN0?=
 =?utf-8?B?c0JZQy9DUmdacjlmanUzbWZKM0FDTzZZb2RSTEJidGJpdzhaRXJSNmo5QktM?=
 =?utf-8?B?SEoreFJvUG1zVXAzTndwSkZCSzZocGJGMjJVeFZrRWRwM25LS3pBVEVxeTN2?=
 =?utf-8?B?WDZEVG96aHVJenFhd0dwRTdmdVdnZktkKzhHcThqejRiRGVvUmE0cnUxZmtO?=
 =?utf-8?B?TEZzQVRPZHJwMTEyVWM5RDc0SkpBN2VMcTlJbGlsSVBWQ1l3T1VIZ1N5WEQz?=
 =?utf-8?B?d1BBdVJSQ3RWS1dZdXZyWis0dlRQazJHWEZuSVhpSTZLQ0xaNGNTVVJTamo4?=
 =?utf-8?B?RDNTWGZrUXZhdlZVekdPbG0xelVvTEhPamxmd3hpdVMvWmh0TGswN3ZHUERB?=
 =?utf-8?B?SmFwU2FuV3BwRkhaL0ZML3ZPVlpiTHRoK0JmWmFTb2MyeVRyNTFiTmZ6UWFq?=
 =?utf-8?B?bkdoM3VOZ0JqeWJoTk9vREIxMnVuMm9vNzJoVHlFTzBCQ2M1T0tObmppVVR6?=
 =?utf-8?B?bUJLSklKN3RmS2VrTmZ3MEhLNmExYytsRU45QUdSVlA3a2VPRjJvN2JVSWN1?=
 =?utf-8?B?bTJMcHEwRWlyYlBFMWFDaE9OWkVYMFFmMllaQ2h6aWFUekVsRXBNNjI5YVJw?=
 =?utf-8?Q?TzOqN4mZdLaoSB2sJrQQNYOWvJmLZORrdmU0L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c059914e-a585-4cf8-9cc8-08debd509c00
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 07:05:04.7205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3PwVIaNXr8+vYOtmU40hleqahvU7iSNAaI/qPtmIoFthshwttO1JKccQX2B/x0Z+okKX7Wq9t3Ds4xN78oaTZS+cJRmjO7HcTjkwRnQHhbwrceVs5bBrF21b2xl9MZn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_000545_556085_CFCEC1E5 
X-CRM114-Status: UNSURE (   8.58  )
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

This patchset aims to add one change to the S32G2/S32G3 dtsi support:
- Add PWM dts support for S32G SoC based boards

v3 -> v2:
- remove vendor internal issue tracker

v2 -> v1:
- fix indentation alignment
- use hyphens for pwm pinctrl nodes
- sort pwm nodes alphabetically

Khristine Andreea Barbulescu (1):
  arm64: dts: s32g: add PWM support for s32g2 and s32g3

 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
 3 files changed, 133 insertions(+), 3 deletions(-)

-- 
2.34.1


