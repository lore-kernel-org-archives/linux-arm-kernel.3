Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90421CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 20:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Rxb6OjIDrw6Lc2CbfEsPr4F4t8V5VzgplXzLX9kiJg=; b=EZL31bxKz2OsmSGLjo2oSXHtfb
	YqO9nzYIozDdh1IPCuVUFq6/3pOu1AXUdxUwg6edfpEsW8JCvfCOvfxOIjpkB53+8fk7DbRcJb6Wi
	n3cOt7e7iuqu9CI/HsRBcRpSRzPRaq88nS1AAHtiPgINkpBQpWlFHIy++QA2Yiekf+vu8Y1tuLvfM
	y8TgtvWj0x6i65QytZ50jAqAK9L80j5jAGxJgZm3CVsHrekedj+BumBGRn1/rqtQ/AQmu4rGTMcrM
	DL5cKDMu1j1qWGxMlAoWcK78/d1zZNBAnIPC6d9CpAXvNOVUxet4JUgqtXD1pjPcTDUJJ5LygKhfA
	npHeg7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIYuz-000000067jZ-1vLg;
	Mon, 10 Nov 2025 20:55:17 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIYuw-000000067i7-07tO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 20:55:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPtWFJwK7Od7WkyWVTx91Nu926Tvr1uCrTz8LbkKOpFjFdIBWvdxOUGcxcIFk9P5+lVbfSE11L443oaRXx6nKBDPet95VP4YFvdh2WT/Avbm04XaIIxpLGmi0OOWQmxqeMr86H6t/rp9TOdPzKLHni5VhLCHX1BjSSP301BUrC0HrMEqIMJ6p8arvwfDDRBV/3uo7cxxU8HoxoCI0Gu1y43RzwOgvOQvA2m8nTYxyKdvb/1SNswM+V3j7CZjDFCWwfMxr/FPUKGaBDinNeIJ9Jb/KOXrdc3qobZVyt5rCSqK+Gj0Pfc37Gs1Ws3CJPJhU9g3vXfG6qdwYGvL4ehkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Rxb6OjIDrw6Lc2CbfEsPr4F4t8V5VzgplXzLX9kiJg=;
 b=HoSqNPSRxQMxXlbJUEctjE7RMf3aG+yW4wmRFGqayJHOfiYob7LI7iUkW9EFXOOQDFPPaPv8efurodpAsZ1Zs47m3nH33JY4zXG7T+IlklemstCX/ZoxxtO5vwmlmdWRDPXdN3aiUBzuRwWBA4MdWWC5dH8ghaIh0V1Cb3lgvS6PKuIwlfIFAL7AjwUeL6ResskkffwK2eah+g0nhwZwNBXFRTs41+Ja7cCpIeaL3t1YYEEeXgu4DDP6VfbYgwzwDYihHxwR5cINcrO2smlmMxSBqLzU+YOCEbM1RqJns8rdSBSkyuXsIWpV8NirS2s0gGR6QrU2RHxsHEphvO4+Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Rxb6OjIDrw6Lc2CbfEsPr4F4t8V5VzgplXzLX9kiJg=;
 b=Y809nxbG+FjfIfX9/y8KMlUccjg0GZAcH+MaZ5AEGy6yTBmQxVBIoHJU0SMvaTMjd0fR6ewFPy3fjT/wco0lTpMLxi2u4fC/9N92ZzasrafVcSlkvU1B4TPvRg1YWQyN6TOdBjJT6DX1jaRNwkqDsB7+/6/PDpBTsdLrAGPOfqGanKvoPzC16KpcbFQXCTgRBj6Dc6idOzU5f2+wk/r+l7Ti0Fov77R60vxzJSAzlrGxnMhmBw/VpYRz8vsaqKasmH9YEySHkeENnBRp6sXISReOlW1odiMKaR3Rf/qh1tD6oeCm5bDKp2ar8IOqJRiqqgLgVqhesPTTT/KWdqyipQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Mon, 10 Nov
 2025 20:55:10 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:55:09 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Nov 2025 15:54:42 -0500
Subject: [PATCH 2/9] arm64: dts: imx8mm-evk: correct the spdif compatible
 string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-misc_dts-v1-2-7564b9f69a18@nxp.com>
References: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
In-Reply-To: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762808097; l=899;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZLN0gPDQ8e77JzRyWCRJGtf973rHgOenRA/O3/nXPuM=;
 b=PfuRHHpuwEOPkcVGwvOfOcT+YFZKwUjYr63DpW6SXbSvvDUepTDjOpKuYGCPEBNDG8uOIkITg
 9lWXdX3TQ9TBXYjvUFdZsWPsY2Sk2+DzyRFc/goz5cJFON3rAqerNYP
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::21) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a31a8ed-c24d-4e7d-5718-08de209b6f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RW5IblJjMlRDQU5vNjAwS3h1V3BVby85NnMxRmljMVAwYSt3bG5xWTV3Y1Az?=
 =?utf-8?B?QjMrUGwvNC9hL1FHTHdZQzFGMUhrWlhIczh6Z2UzSmVUZlRUbUU0c3NyOWt4?=
 =?utf-8?B?MjZtQ3dzMGhITmVDNW1YYmZWOW1iQUh5ZDZZS3c2V3NzaHJKV2JWb2J3bGdP?=
 =?utf-8?B?QkJJTm5sZkszaERDZE5kRkdLdDJFYWxiRW9sbEowY3UyTisvSGpORUozR1Yv?=
 =?utf-8?B?U2dvRzZNbXdySU9pNEdqaFc4dVEvTnpVTVVoL2dUWWw5OTl0RTFjalE3ZXFN?=
 =?utf-8?B?aTdZY2c0NUkrTmV3UWNvcWdSUWUvYkxTTU5zMlc1cHlvNmJCNk5kNy9iN05x?=
 =?utf-8?B?MnRSSHA0ZndybzlrZU5ma3VNaFNMYWdFUGJEbG16R3FLREJpWjVWNHZtSFYy?=
 =?utf-8?B?WnVWK0N2cjFiajB4S2htUHJ3MktpcHBuZlpxVUtHUjZuZzA0NWc1Q3lpUk9h?=
 =?utf-8?B?eUF6N1QwNWU5Z21qT3NzL1d3SzFTREg3S3lwRmk0SFk2OHBSZmRtd1plZHg1?=
 =?utf-8?B?aWwwTmZwd2lGQ3RQMGgvN2pNUWtWazZYeks5MDdjd2Q5TTgzcDVUdmlkb2pX?=
 =?utf-8?B?L1RXRytyRERvU2JHTUJKdW1NMW1MMmtxQ3IvWHdCTGd4ODFkMTBLbnRBRkIr?=
 =?utf-8?B?T2NWd05ETFEzMWU4SCtUdHZVbXBPVnRUb3F4WG5xTDQxMThveGovLytZaUxC?=
 =?utf-8?B?bE5OaVl6M090bER1M3V4d0duNnFocXRmeFFHRDhiMlBGUHlHTVlHYnlxcVRi?=
 =?utf-8?B?K0VUck5NT2h0Syt6ZS8wK2tncW85TnhkOGNYZTNvSkZVMHFZR0RBcUZMRUdy?=
 =?utf-8?B?U0hZUjV3a2ZGNENFdW42ZkFYRVRPQlc3KzVUR3AzZk9YUS95VXlzTFIrc0lx?=
 =?utf-8?B?dDdab2NLT2tXNkIxTjdrUUtWWnpxc1VUclAwemxYaVJqZW9XaVZiWE9pK0g2?=
 =?utf-8?B?Z2Vvcnlvb3piRHF6d1RPMU9nYlFweHZ2dGdGRXBodlpxWjNSdVB5WDdIamc2?=
 =?utf-8?B?RjljT2IrUnlEWGZvZXZ5ZVR3UmlDOGFGZC9GK0Q2T3ZlSFRiRUpsa2hrNnM1?=
 =?utf-8?B?bysvMWJwN2owdzA1OHFJSGVQcUVFWUFxR09CbjRmQkNoWTBhSWRCQ1NkOHZJ?=
 =?utf-8?B?aXo3bTFoTmF1WU9ZQ3hqSTEyTWNCRlRVQTZpTktuZnB5b1YvbThaWkh5Z2Vy?=
 =?utf-8?B?blhIK3hnSTFrcDFYYUFZejRpMFpsSEFDUUZXaGtSVmQ2dEd2U1NUOW1MUDJz?=
 =?utf-8?B?S3hORWJUZ1RsMjNjSG5UNjZWckV3VjRRNUdrS3Q0aWNVdGJrdWdUbVF5ZXVQ?=
 =?utf-8?B?RVFJeEF5MTlXaFI0Sk9ueXRiTzQ2ZGIrM1ZGTmZKRHRNRGx2K0tUZ1dYbytO?=
 =?utf-8?B?eXN2eUV0NXZ4UVlHNWJzSEluSFIyQlJscHAyRkh1MXJzVkh6OVlmRFA0bXZp?=
 =?utf-8?B?YWw3b3JQd1NTZ2IwQkJTZ29ZRTU1a3V1cXZOYjhCdTNNY3oydXNrY0F6L0Fx?=
 =?utf-8?B?bmhmY25zWnBMMDBEYUVkQlRUdUM1dCtMTzZ4Z0FGcmh5Z3BTQVVCblRMbDBz?=
 =?utf-8?B?cUZnZVo1Y2VEMm51MDNPRXhSZUozZlFhbXA4ZHlqcDZQRkhkdEg5L3BpMG5T?=
 =?utf-8?B?K3lWaksxL1prMEZlQWVlb2ZnNU9Bam9aWmJwbk4veGNvNTZLUnR4TkVqYXVI?=
 =?utf-8?B?RzZaLzZEUDBUV3dhSUlrclVySUdCeDdDeXVnUU9objlNSWdIUkVYWTNNM2ty?=
 =?utf-8?B?NmtLaW8zYitSbzQ2WThOT2c4eFkrTVpXZW9zS1RHc0ptTHE0NjhiWGZCMk5i?=
 =?utf-8?B?N0VubGpzVnUrOGZrTTV6bUt0NFRreXVaRngzcHZBV3o3azBmOURhemoyT2NK?=
 =?utf-8?B?TUlHOVFEL0YwRWRhZWVWN1B6cVhubGRIWFdldDlHamlPckJUYVRwS3pkSlhJ?=
 =?utf-8?B?TDlrZXFQaWtRVW5OQWtJUE5DK1FaYkhyTXhzUUpKN3l4K013aGZBYjI4OWJH?=
 =?utf-8?B?ZklOQjRGWUNxUVZOck5HTnAzd1ZwT3RZdVdCTGtJbVVWc1hjY2NSYk9YUU44?=
 =?utf-8?Q?AZB3ix?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGJEL1BQRXFFOHN2d1ZKdWhDRG1qWnJTdlFNVFdjN1pXYjFjQ2wvdkgvZDBh?=
 =?utf-8?B?TmFjWlNxdUdJT0lrcktpVGJ3OGdOZGVNZmRRMnVMSmNDY0hXenVML3U0OUVE?=
 =?utf-8?B?enYyU09ZcEFOQms3c01VWDNCcW1jSkJCcmUxcDNGaWthMXl1bUdPcFhhK0lK?=
 =?utf-8?B?THNpZ3gvc3R1VWFqS0FkNkJhckJPVXF2Qi9TM3huSjJhQzVsTUpMdmpIbUw1?=
 =?utf-8?B?UjVFYU13NGNLM3ZmQVFkNGF2cHo4dTRCSkJzTmRXa2hKb0s1V0tiQVdaaXJU?=
 =?utf-8?B?dEZQTWRjcVJqWjhFMVVMcFFYdFM3U2cvMkFlKzZaaTlvTEZUbm9uVlNtbUdl?=
 =?utf-8?B?MGRQd01ZS0Z5cEtnZ0hnMHorV2hmMzdwSUlhakpYdWY5WEpaYnJ3ckF2d2pS?=
 =?utf-8?B?QlVPcGNveXFKYnF6amhVVGJhaVlma090MXpnM3A2REZOY0gxWStyVmEwOXli?=
 =?utf-8?B?Wm95VVJnb3NlOWFQQlppa3JhbEFoV1RSRkdYVW9DTHR2UjhSMTFwdkE0ZkpM?=
 =?utf-8?B?cEV4aWh1MFFodUtOR1dLWUdHWTJ5NGx2YjhJYkY3VElaUk51U2NXaTFWbEZ4?=
 =?utf-8?B?OWdlTktxQ2lCMkxveXh3TFlyN2VudEJEQ011d2JDa0UwWll5SlNJd2UvVEtQ?=
 =?utf-8?B?YzRTaWZSZ2hsNE5aYXplSklnd2YyNkt4c3hzbjJ0SmhUS1Qxdjg4MnJaRUxh?=
 =?utf-8?B?elhzTUdPSUhmTTdmYkRWWnl0cVdlV0k1bWQxT2h1cStsd0pOUUl4ci8xMXBD?=
 =?utf-8?B?cWVsRGJENVZ3U05XQXJsaHBPZ3UySmRGS2NkVG92aW94RzNYMk54SEU4M0Rs?=
 =?utf-8?B?NUlreCt1MTVlenB1T2lWVm5WYWhwdS9zNFFWUkY5Sm5JRUhjVFd4QjdycFFV?=
 =?utf-8?B?aUhPK0FDV2hqQ05VWmZhOVZPMllBMm9EVk8zZFU4Q282eVFHZk5ZR2tpeEFN?=
 =?utf-8?B?bGQzMi9IZkMxNlNXb05XT0E4TGRjaWZEY0x5bjVXWWNGUWFrUncydE1SWnJw?=
 =?utf-8?B?RjcvUHNGaHd4ZTJjTHQ5MkFUVUdqb0s5Z2hMTVpROUNQTElSZnZlQlJsV01s?=
 =?utf-8?B?WTUvVGFXakhmdTBnNjBLQ0Z5bHQzdzA0VWdta1RjcTVHbzZidjB0ZnZudnlX?=
 =?utf-8?B?ZXVPUUNDVm00Wi9yQ2p3bDU0K0NaNW90MFNDblhYdEMyN2tVSzFRTzBta3dz?=
 =?utf-8?B?UDNFS2RoNllzV2tIRVJocWxwSzVRY3dyVW1HdDV5N05BQ25VSXVoMnMzY2NU?=
 =?utf-8?B?YlRtOGk2M1JjUCs1QTBQMS9lMCtZeVRRTFQ5VXVvd1piZTVMd0tQNjZucTQ4?=
 =?utf-8?B?WW9SQXZCeERESmRSdjQ3a1JSY3l1c3ZvaVFZQlBVS2xnV29aYWtuUWZ1YjZx?=
 =?utf-8?B?VzJERCtZVWlycFR3QjlHaWhkdjZoUmFrUnFnQVdoT3FGRWlTU3dlc3k1Ky8r?=
 =?utf-8?B?cXc3djZ0Q0t6Yi9iS2FRcnNVYzdvS2x6QnZOT1d1Z2NJbnpUOUI5NHhRNGxx?=
 =?utf-8?B?eFBSdkpXeTgrT2x2RGgzSWV4cXE0d0FyTndWRWxlV1RaMFNIOTVvbGlEZlpK?=
 =?utf-8?B?OU9mMm1QTmNWK0RSbGMzcGZJQ0tlYWZzdEY1cUI1VDBYMEJ1OTh6T2RCdm1s?=
 =?utf-8?B?L2VhUkRmRm9xaUJoTEZXbzlxR0c5SHEzRXlJYmp0Q0ZEQkVtMXE2Yko3STIr?=
 =?utf-8?B?by9oaGJ3ZnYwYVZOT1hqTEh3VE9ub0NBSlorMGxXQTZVRFEvQ0hYUzlqektY?=
 =?utf-8?B?MnBiQWI0OHhjMGhhaTlFaFNkR3Vabml3Ny95RTFkNUloamdyVmlJZm9IUmlD?=
 =?utf-8?B?bHZmTnFSWWl3TFFjRXBXQlBlYTFQV3lSdTNTaU1zMlkyRXpQOXpUVjVTK3lz?=
 =?utf-8?B?THZQZW40S3l3WFhZSWppNWE4cmpHR1pKWVRURjZpbUZTMytKUzZmeFY0dUQ2?=
 =?utf-8?B?ckVUNmQrTUFyV3NOajhYdFcvRFBKbzVWUklsMGNEMWdsMURkVU1TN1AraEtt?=
 =?utf-8?B?SlVISithR2gxZFc5S09xa2pnMmpBZThxSEZzOEpHSnZnZksraGtadUUzSHda?=
 =?utf-8?B?eU56U29wZE5uMW5LNDhDcmthZGMzM3ZrVVNKSFdOMk1KaWJhNzBjRmNRVmJz?=
 =?utf-8?Q?MXv8XHtBwW6TpHAYWXx5KdcWc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a31a8ed-c24d-4e7d-5718-08de209b6f78
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 20:55:09.7965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhlwEfMD63N8rKXhkBYGTmljVvwa3amxoYrdd7tCXfb60Gh65ZHpA/hObi4yL1WbFd7oaU0g7kefY7PAg7o5Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_125514_079089_A3698AE8 
X-CRM114-Status: GOOD (  12.26  )
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Correct the spdif compatible string to "fsl,imx8mm-spdif".

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index fc3cd639310ef07d6d14c457af607f61e2288b1e..ed8b4843acb4804379ba025e83a63fe962c2937e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -400,7 +400,7 @@ micfil: audio-controller@30080000 {
 				};
 
 				spdif1: spdif@30090000 {
-					compatible = "fsl,imx35-spdif";
+					compatible = "fsl,imx8mm-spdif";
 					reg = <0x30090000 0x10000>;
 					interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clk IMX8MM_CLK_AUDIO_AHB>, /* core */

-- 
2.34.1


