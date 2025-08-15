Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EB8CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ap5pxzMptt73QRVr7mpSs7plBX20z5KUEIspbBJwWzg=; b=ZYhQvVHCOTYbMGNFdiIAwgVnL+
	cfVbcMh81jVxXnvg29TvDBo94Oqu3d59QKPYEC8Gu8xUTVn/BvxlBfG7i24E6HpYhs2i41fEP/k5R
	oXWITq1gEN7Y16vQOq3mkHmKBENC88mphEdquhEEzz1ni+EdrElm2hO1FV9ieqGyoMcxgKgJsrU6w
	B+qItW8OU5x1taGxBm0y9/hNY6lRDMTNA+v9o2bkYkRLF7kJ0oRsEZcqkNOxNiXc0cEaWKyxRua6S
	kdCProrS1YO5rc/4Soaimz+3V6KS5TCHHAW6QsA+Me/qh7C/wZakI8S5KiO4+C/tjMfFv0gg6XFkU
	6rvFhEHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsmu-00000002MT1-03MC;
	Fri, 15 Aug 2025 11:40:00 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqMa-00000001ymU-1T1q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:04:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gi8IDSz0z3VZ2NExwl9OitdneO1e1a3cNW9oCW2qLfiW6+LAlrAtowKVsUEGfrSuh3l/FKw8g5PyHvbwzOI3MPtbWiWYiobWZ4Zwwnvphemzlc9J295870hG9efqj6/7+LS01vrZG2hbImY6h1uTB2grHEjKH+3qai4Tiq6MFEc/0J0r9L6PJYCHnqTR1NGgDgHigOd+/julyhLYdyFCi3mx8eSN/ffyTeUFgON37mOP6G6/TlH9cmEF+3REgBJhYwl7SSrTGrRQhnqkvhaKpftN6GxGcwXdz0uxZlmiOwawL7a+qjmtSv1SHnDbYzQjUR1TTf9oH5BBKa4K3hTljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ap5pxzMptt73QRVr7mpSs7plBX20z5KUEIspbBJwWzg=;
 b=pjTKlCay7jPZUqnQXYkcHhpEqJHsGJNGrjLzSIP5K3cTnNk3MPZigWNDJw7qG/zRh/J2bN1rst5cr+SVG3mRn31zdC6sSc5c/CUUmOH8+m4lamQS7M+zVmXZg2T17w4a/zfdQ2xiEQaWmFjMNMQtVCzEKHWzhNCxKxTWM7nDgGLUtuq1uAtGG9NfoCDKBQJsYRwDsfDbHhIXMY+7VsLVEQxH3Zy8SMYB6kQU9Vmnaqi0SVb3BDNkAsmA5H122151GFNiZtbtbUt8BWd5K7w9788ndiNSucwOvzF8Lbb3QE4Ypo3wYuL7iVYoOvqKjQxhWKrXpFHeKH3x1c8wHEtx6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ap5pxzMptt73QRVr7mpSs7plBX20z5KUEIspbBJwWzg=;
 b=YTd7+2ee91pbPrHNTacxa09LLhQgWnlbGb6bcuWKBHr9ocKhj5XqeX+EYX2jhTcIOVnj1XJT8TcG9ZOZKbGM5qdM4XRPFSwjJRwHRm0HEhLweSr/8m72hOVNoKTxfoQ6ZyKyHW0uZqEpx0JBuMBRgyqbJIjgkgOWDwFNJbP5GgdkyZDClEsytBEuZf3D/G+ScW4DvAxKiajbSj8dmJ5yC2D9SC42BiGnP5eSadh5qX1i9xD33oMjxozs9N/opyI4WFyE8/cxkXgl/CZZgcz0XQn7LnYrlODodcIx0h2V0eG8ecq/QFDEweKTzHok2DoMTGdM9lK/wmP4IOl5YMNyTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB8014.eurprd04.prod.outlook.com (2603:10a6:102:c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 09:04:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 09:04:39 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 15 Aug 2025 17:03:50 +0800
Subject: [PATCH 04/13] arm64: dts: imx95: Add more V2X MUs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-imx9-dts-v1-4-e609eb4e3105@nxp.com>
References: <20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com>
In-Reply-To: <20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755248657; l=1412;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=cv7+DNY4ilGdeqJtAqQV2+6M/kCaPlQIH4JskfrGGBk=;
 b=Ayd/XQhvjHBw1jUjloy6x52ATyoHNHhQ1idl8kCd/CHyX2UA7iwafL5U/rzXjy/g/VWwG8Guo
 xvD6DL8VJ5jD84cQ8EVyr0JfHS5cqDI2BSl4pvxwY8UWyXINNfuMkuR
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0158.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: b648eb22-a240-4362-8d93-08dddbdac399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejVaWnhXV2pLcGszTG1Cb0U0SG90MkFhcSt4TEJYY294cDlqekx6OERIZmNV?=
 =?utf-8?B?dlltbTFJZWgyT3h6YXhJUkh6d0U1bXNMOE5XV3BTbXBNUWkrZHVFY1hyTS9X?=
 =?utf-8?B?Q3hVNkgyU0o3Wms4OTliYW5oQnlDZzZGclV0dzBRT2lIZGZHNzBFTFBqVHZs?=
 =?utf-8?B?SVR6SzZiRjlpZ0NNeUYwUHJYQ2tQSTlGRmpsQXNzdGp0N1dLaGNNOVRUdUd1?=
 =?utf-8?B?dVVWUWZmd1JsTTd2WWJrTU5nR3FJUFpONjY5NlFSelkzMjAxQWcvWDZMUUtv?=
 =?utf-8?B?QitaL3hqMXBObVQ3Z2NEWlRCemxIWFR4V0Y0UDIwSFpFcmR1U2RWSndBcVBW?=
 =?utf-8?B?dVd6dnhnbHlKdWpjeVE3RXVjNjdEMXNndVoyRkFIcFNna1JhZE5TTi9oVGJE?=
 =?utf-8?B?bXJyKytuanNKQ3M4NXBLWFFEOXRicSs4clFnUDJCVTVBWnFrL1FCSGtPK2Jr?=
 =?utf-8?B?SC96a0daVVVMaEtTbk1tSm51dUNrMTA0VlFkMUpMdVNzOHVaN2hEMkxFTGJx?=
 =?utf-8?B?eEMvVTBPSFVTV0V0eG5MUjJvMmNBR1VCczZZODdIdjYrenAza290QUlGVW1z?=
 =?utf-8?B?MjI5WFhtTDdoOVBxZ3hLZXFjdHhuY082Q2hya05LY0ljdU9CYldKRkpTYmc5?=
 =?utf-8?B?Q1JKWjg3UDF4NlFDMEIxaG1RcXh3M1lYbThKZmdqTEdXeGRYWEhaVnd4MHJx?=
 =?utf-8?B?Q3p0MkVsWmV0aGlxTlRTZGwxQStzcThleHBXTjdrMzdBaThiNnRIZU5PZnBq?=
 =?utf-8?B?Vm1DRjllOWtVZEhwa2pHN0lMN2lsQjQvWVVWR1hQK0ZkK0JWRFUwdXZ1UWFX?=
 =?utf-8?B?ZW01NnhTZjFmb3paL0tkM0JZbTg4Q3dvKy80aUhESm5kZVBHSWRkOWhJMWo2?=
 =?utf-8?B?RFJiL1lmUGN6VWxsazI0NkdUeFlNdkpMbTVEVy9odjdDcFY2YVl3cmYxZno5?=
 =?utf-8?B?OVZLUVU5MHZla1U3VmJOOEIzYTdjTWpzbDY5QVNlcUpLMkRhVkg0ZFJVd2lk?=
 =?utf-8?B?cnJRUU8xTDB6UVp1eVRqejlqcnNyMmhMSk5HQlhNWWpNbkY2ZjBTMzVJb2JY?=
 =?utf-8?B?RlBDT2xSY1gwVXIwbnRjejRVbWpESnJmd0swbXJCOCttYkE4aHkvZUhGZlVQ?=
 =?utf-8?B?c2ZOa1owdmFUS0NVendrNWw5Y1NZcXl6SVN4OXRJRmNHT1RzUDJnMnRmb01p?=
 =?utf-8?B?SHV1S0o1Z3JMVEpLb0FERnBlbng2NVpyRDRLWGtONFl4YlQwL0tXRVFseGdQ?=
 =?utf-8?B?ZnhzYzlieDJlMzhBK0E5R1MrSWNPQ01rVmtFeEZZRU9abEc0YkNIQ25lYUNl?=
 =?utf-8?B?T3FPQmFsMmRtdmtyZklqcjdQSlF4eTQ3WFhrM0VIcDgvVlBUMmVkVHlzU3Fo?=
 =?utf-8?B?TURKV3BPcUMvaDNUN1dHcFdUMXFaU2RqNlhPQ0EzVGdxeHpUdFdzeXdEcXFh?=
 =?utf-8?B?MHpVeFV5WjBoVVU4Ulp4REg1ajBvUWMrNDMramNqbS9OK0VrOEt3NFYxaWxU?=
 =?utf-8?B?M05vTitkSStuelVxMmlNanhyUnJxQS9OalZDcTFXRE12UkkzUHorS3gvV21y?=
 =?utf-8?B?dmY3a3JmTFd4eHd4SDR3SjlMWTEvbnhkSWhyNGp0OEJodnMwbHNVKzlVOGpo?=
 =?utf-8?B?eUVVaVpWZnFCTnJobHdlVloyZTlkRjNqVGtOZjUxMmtsTTA4a09oZVMrS3V6?=
 =?utf-8?B?eWorY01pUVZIa1pqNWVBVXF0R3JPM25oSjE5VFYxUkhqR0hxYTVaNWQ3eXIv?=
 =?utf-8?B?c3MzTWVvNHJjeGxZVSs3VWUwcmxnZEFjTXlLd29aUHdpWFJYb1ZSZksrcDhV?=
 =?utf-8?B?WjVCbUpid20wLzdWazVTQnBVSEtFSDdxQklHZzY1OWtjaFhXcVVDc2VMYVdQ?=
 =?utf-8?B?WVVmSmFrcmNjb1djYTc0cGdERGNsdXYzU242V0dmTnBTbUJjZDJMOGtFMTN6?=
 =?utf-8?B?dThrMWkwVHZ3SjlnWnltZVBTaHJwRXBYa0hXRWk1OVB2WUErd0lZdEFGS2lN?=
 =?utf-8?B?WlhwaFRucFRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rkd3dlJQNnJnWjNmSTV3UVhKYmhuYXZObXhsVUwrQVB6dGZGZSsrNS9qeHhN?=
 =?utf-8?B?ZW4vVUVab0hVdWJrdVVIdlRNZ0FCTUFhT1FLYmN4QnNGdVJueXd3TzFLVEtR?=
 =?utf-8?B?YlUrb3oxeUNDRW9uR3hERHhjU1V2MEdTbkE3ZE9yYStOQUtreFlnZnVFRmd5?=
 =?utf-8?B?b1N4SmZDbVpaMCtEMEJReEIvMVNNTS8wSGlFTThjOEFEQ3NsdCsycnBkSnc4?=
 =?utf-8?B?dXJLVHFWV1VxbEtrSllWVzRzZzFneEwrSmRHSk9QcjRuWFpJekZwNjR1RzI3?=
 =?utf-8?B?UzZlTHFKOUlZVjdwd0YzUXJyN1RQaW4vYWFGMkszZDVwOFlkTGt5dzdoYzVm?=
 =?utf-8?B?cENaYmZqYVd4NjZsY3gyb243UjNtano4NEZiSmhnQ3p1SDFIUDhpaGJ3SnVJ?=
 =?utf-8?B?b3BOb1NjRlcreWQydXJ5bHhIeERvdERvYTJVTEp6clUvYnRXeEkyQlRYVmZN?=
 =?utf-8?B?eWk1bmxrNndocHFmOUtxdHRJcnhPODZkQ01wUFlmeTZya3F6L09KcWhyR2xV?=
 =?utf-8?B?cEc1T3NXaUY2QnZmaHk3ZUlLWW1qM0FKTE1TYTkxdTBUWUJ6MnpVNkRwaEIz?=
 =?utf-8?B?Y2tHTW83YkhRNk1HWURSeXFBY21SVDJNUEh3T2VHZUwySXRVYWJxV0dkL2xE?=
 =?utf-8?B?UmppbGJOckppWkdibG5iMzJTbk81NnhjMjNPdUtLT2R0Y2F5M1VyVnFzL3Ix?=
 =?utf-8?B?bGZ4VVUyQkcwaUxqT3JWQTIwREJrVC9xb2hjNTljeGd5RFIxYkJIZVpLcnBW?=
 =?utf-8?B?RDRiMEJYdzFVeTRSdlRoMnVzR3NCRkZWSEpqc2RoRk5heWNUWk00bGkxektn?=
 =?utf-8?B?MWlMalBZRVM2bHlGWXdMUnRKUWJtaDFMaWJHaTZ1R0F6ak40QmM5UUZBdUw0?=
 =?utf-8?B?QlVwTEFCVVBrbkx6MjVvdElYZTBjU1QvWG1PanRHaWNET2lJUlg4cWdRdzY4?=
 =?utf-8?B?RnNDWVBzUm05UG1LNVlMSXpRWFhsUlpNZmYrV2xLUE41cGFOVmtib3ZJcDVF?=
 =?utf-8?B?OGxaUjB3dFAvb1QxYytVNGswWWpDeENkZGRXZVcxbjRKUXlrSVR0WjVGVGFR?=
 =?utf-8?B?cURlNUFZeWNtMWd1L1liVlVyei9mUWpsZHJuNDRjV3NOVW81Z2NTdTlqSlFN?=
 =?utf-8?B?Z2FVSlgwZVQvR1AwNURTMWtUU1hBZVNNRGN5V2ZZTXBUdXpDYkdMYmZzNlht?=
 =?utf-8?B?eEJ5bmVBMG5saHlXK2JTZ01EWkpPbHAwTUNlUGsxUHF2VnNRenhJeUJmL0lX?=
 =?utf-8?B?WVdwWCt5VU5tZzlaTHplVGc5b09hNTBrR1pmQURlbXQ2WUY5ZmJrSk9BMlRj?=
 =?utf-8?B?RytWV044eTNxaEphdXl1ZUFKNGtURWg4ODJWWHdJaUkrR0JlQ3RnQUpybkVB?=
 =?utf-8?B?L2JQNkUvSHVtSEZYVDN6MnRrSEZIdHJTM3BHOHMyL2srNWtrRDU2TnlPSUpi?=
 =?utf-8?B?MVFNbHY2Nm00RDYzbUVBbUE1dWVONkxPczJITnhtczd1UXo1cWkreEFnYXpF?=
 =?utf-8?B?ZWdMV3NJcGhEME1Sd3NIa1k4cUpmVVVqQURSU2kyU0NoU2ZQS2ltbDhzSW1J?=
 =?utf-8?B?QlVBN1VnWDkyUUhiUSsyVHlIT0hNZEdaQy9BUXowNDU5bkRwUDFYVFgwczFr?=
 =?utf-8?B?ZC80TUltK3B4bVkxMFpPdm83UGZ4TGZpdTIwUW90b2lwTDRRaDRqSFJNQWUz?=
 =?utf-8?B?cjJvWUFWR2hpZkprbXRWOTFUUXlEZkVzaXJlbXNWamcxNElRamZTZytHNTVi?=
 =?utf-8?B?QU9sM2JXYVl2VVhRQUdnRmNQSThTNTBGcHg2a1h0TGpKU25Lc3gyajk3U2k4?=
 =?utf-8?B?QzJHT0h4NDRzY011V1U1czJyczU2V29Iai9yRUpBaFNZMTJ2WFhjZFpsVnJB?=
 =?utf-8?B?K0c2aGo2ZWcvbzRXNDlOZGsySUZYVHlSU0VSVGZ4eGtYN1NQTzJnTmpJZVZ0?=
 =?utf-8?B?ZUxpa1JYS2hERVZ5ZnVtamdOK245eWlxUnVQeU8zcHRLSW5INUtlRzBVL3RO?=
 =?utf-8?B?K1dwNUQwZnNHOHVwNzZGeGZMMDRPVjltSmZoSnNYZlZxVkRyVDlkVWNQbjVm?=
 =?utf-8?B?Z0NoZVdPbW1sdW13MHBzUzQxR0xTSXkybGp5czE1eUI3YXpQaHhneEN3ajkx?=
 =?utf-8?Q?TIlHmWXp+p6AT4Ym/AfYoyUoj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b648eb22-a240-4362-8d93-08dddbdac399
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 09:04:39.0225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaTBX9WLV5u3qo1mvgaMad3Xubrpe7kxEhi3HBgevsCTqR5HXgi+r+Za7a/XvvqtK7g+/U9T4BVcbmLZpGgVEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020440_397176_2FE6735E 
X-CRM114-Status: GOOD (  10.20  )
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

Add more MUs for V2X communication

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index e20feb1bcec6088949e7dd1ab2fc1c108393fb81..02c0422a7aa3877c8431c9b050d85f43f5ed7bde 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1500,6 +1500,13 @@ mu6: mailbox@44630000 {
 			};
 		};
 
+		mailbox@47300000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47300000 0x0 0x10000>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
 		mailbox@47320000 {
 			compatible = "fsl,imx95-mu-v2x";
 			reg = <0x0 0x47320000 0x0 0x10000>;
@@ -1507,6 +1514,20 @@ mailbox@47320000 {
 			#mbox-cells = <2>;
 		};
 
+		mailbox@47330000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47330000 0x0 0x10000>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47340000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47340000 0x0 0x10000>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
 		mailbox@47350000 {
 			compatible = "fsl,imx95-mu-v2x";
 			reg = <0x0 0x47350000 0x0 0x10000>;

-- 
2.37.1


