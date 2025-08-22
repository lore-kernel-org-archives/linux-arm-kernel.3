Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C67DCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ep70WlnTf9JFXdKocb9akM24Nju77MttzhKXK+l5k8A=; b=0639q5Pgvt58g9481Ol1fCCYOq
	pKmK5Q99Q5owfBZ6xKE9QNzNgg+4/5to3su19EP99j2C6hEcBJYCDMn1xgrWhRuaYSOWqMfLifZig
	jIT/Ca2QGb+EAHXM0EnZh3jzOzImhMHgEPXj/wIG3+eGoqQnm68bP8Eh1TagcwQLHrKd19GiufNI1
	N+xQMJtKaiZLCuCMFiQJmN5VfQoN1lfXBNeNmbQzQKPXUtSdhOT3ruStGbJQob9+nMelW2ewBixPE
	z2lCVEhtHSwxJajZ2+MVwZhCxDps4uXETE3V/U1mWLTXL5mmsExjGy8zIICw5Q0OAuCB1gnu9Q7sw
	4zAcvesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTnP-000000033Wm-0oTy;
	Fri, 22 Aug 2025 15:35:15 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPMU-00000002F5F-2Jp4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 10:51:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwqEu7UdxsnG/+Lkfbeq+Jv3zjr87I9ruTM6f45SHYZcU3NL/a7SmYDWyZSQY44Os1dlYyX0Q1PR0GZsk8vYFqYfZtzcgAFD/wKs48uuAs5tBknhft+6gyx0F3g6b7o2kQqTnVQHsuJ4UVHpsDXE2RLnuQbbDP6j8VJf54SUdAXli5z5d2999imnapySsMKYKPK1nv8WxdI5ywWr2J3PbYSnfS4p3rMO2Q/aEQ1TsjxujY0gRrCG5F4YVUj10MlAL2qeBPfD/BH5cxnaB3G8n8X8eaW5apv3/2dGHIjuaT+1E2U57a0VOzs8nJPpbpWgmAu/svRnnLdYw0ntGATLOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ep70WlnTf9JFXdKocb9akM24Nju77MttzhKXK+l5k8A=;
 b=vpsc5Lcj3Xbx/ZyyJgqRieH6WrtDLhyTRjYtC7y9shEwr6syQ8dZBXWRJxDrx4njaysknSL7NRMcet+rs2PxakTCs/dtvpCEubkOd8nKUdZFmhq5cjCblKtHvBZqK79D/zC6n1tyY1mxEzMnz6gSkUajBacQJ4XUMN43Kj/kSoEgApqacdp9ulYgSMYOZ+Ud0h9PpgCZiVd8CS1drMGI7KmElmhxEicpfxZgexS0ivqEZFhYVLLwBUiFfj960hXctikNPAnbe9khTwsE5/piUipMl1R2tMVLCI/dwSdDk2zY1bbB43b6xJAqryXzkt9J7AXLL+CAZvi+UcWuIsb/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ep70WlnTf9JFXdKocb9akM24Nju77MttzhKXK+l5k8A=;
 b=TFZwIv44E48QwxoqF3m7cdpBKXPTjlC6hFFfQ1zorHgYGMOQpPNLxCinfL3//Rw/J0ZjpmmtkgdDEOmcd3XSDU8u+uhZHGEfmq5n+RbDg2UZ83hUuAwXUGghbA+TEOSy61b96PwMjEM9JoF88eRQWOG7mmH7iijtUyxIoAaqwYFohoDT/AeulQ/xc7NH3VwFFHk3+eWWaCNq4Ieb/4GqYp8FN75+ccoR2QxInpN60wg58phIyLspCaI+FbCAWT8ppeDLJOlZtsKOJHx6hZ9uBo/ZTy+1sIYjhnPUiAy0COXroJ0DIRVcpVcL+bg0M4nZ8ay9Fi9uq0s+0uP63A616Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8207.eurprd04.prod.outlook.com (2603:10a6:102:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 10:51:04 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Fri, 22 Aug 2025
 10:51:04 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Fri, 22 Aug 2025 18:50:12 +0800
Subject: [PATCH v2 1/4] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-csi2_imx8ulp-v2-1-26a444394965@nxp.com>
References: <20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com>
In-Reply-To: <20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755859853; l=2808;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=BDXgefd/UYzHQiV8LPuqbnQkpULZ0Pwg36axmrIw4cE=;
 b=nIuMbNg+ghnLb+aA9htMZw3uS4J9gLAhps6j70+wjcSBrypr6J/BhfCi5raueuKNS7UiSHG5o
 s52e3uQFeXnCY/67gy3v2Xa6CNG9W77Q5fIJCARclSwcqUtT0WJ0i2r
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be06d01-86f8-4ae4-3dd6-08dde169cac1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Si95M05MZHVWV3NhQ2VTNjlXRnZkR3pnNE5EVmdDVHBmNEc2TmtNS0JLcThG?=
 =?utf-8?B?ZmVNZ05JaWRZMXEzNGVINkR6UU1MU1AyeFN4YS84ckI5SnczbzR1dHBLQnhX?=
 =?utf-8?B?angwaEhwaWRLNEhldlV0YzZ2VjYzeXdXdTk3Ukpqa0x0K0J0andEb1FKK2pn?=
 =?utf-8?B?OHd1QW1NL2FGWENvT3pwc3gxQlljL3RQQi9BNmFnNUVtOVNTaUhKYzhhYTFm?=
 =?utf-8?B?Sm9RM25vdGdhakh5Nms0cjQ5eW8wY0lSbGNLL1NHK1gwWDN6Ump6QTlxREcv?=
 =?utf-8?B?SnZaRGVrRitQb1FEdHR5ajd5N2lnSTVucjYvbitlTjVKb3ZzeW0yQTk2YUNq?=
 =?utf-8?B?eWRDMlY2Mm1UaC8zd3dWRE9hWm9OcnlDQzlPK2MwYXcvZlRva2xiL3Roa2kv?=
 =?utf-8?B?OTd0dkI2QjRLckZZQlFuMTBxZ2l6eUI4azcwQkJ0ai9ncWJhSWhNWi91MEd0?=
 =?utf-8?B?V2lqV2pzaHpKMHdzQUdPZ1IyWFdwWnFacHEvWWk4UlF3OFZqb1RMRGFuUEtW?=
 =?utf-8?B?cEFoZExraXRMekQzK0hVSVpVN1NhVFFnaHZqbHpZTnNNNytRZks1TExuSjVX?=
 =?utf-8?B?c096MVo5d3R6MnFCTkpJN2ltZHFudjZjMkJYSW9HT09YYWEwRjBKQ1NPbmlE?=
 =?utf-8?B?ZmdNS2NydytEaTczMFVDV1RHTUoyd2lETXZzL24yUmNya283TnA1ZWU3WmtC?=
 =?utf-8?B?elRGVm83Y3VSVzd1eFlHaExTeDIyOW5BbDFFa0ZYK1E4dUZXa3N4dDlDaGNF?=
 =?utf-8?B?SUltWUJWOVFlREM3RkJESkpiYkhneU1HQTFLMk5wVzVOTFhlbkVZb1J6VDgy?=
 =?utf-8?B?L0l1dlBwRVV1ZVNPL3Q5OEdoZGczSzQzSXBvcWlYTkh2Y0xPTTR5cEEwM3Zt?=
 =?utf-8?B?cm5LbkdycmtLbW9mZ1pFbzMzMm9WN2ZwUkMzc1JNbGE1MXpDY2RYQnQyWmtD?=
 =?utf-8?B?RjBVYzlUUEZVY21XWWZ1ZzVxZEdKOGhaUk5na21nSHQrMXZVVEJ1TDZtRk9T?=
 =?utf-8?B?ZXNENjc2czQ4bkQ0RTBRZDVjSkJnQTVVSGdOZG5qT1czQ3dVc3hkTXFBVkZP?=
 =?utf-8?B?UTV4ejFKWlVHWXBlK2s3aUlycHJqb01nZGNUOUhzVURlYytqcUkydG9Ed2Iv?=
 =?utf-8?B?R2oyY2dGRmR0eG9QK0V5Y2diSmV4cVZyUm9pTmdDSWFkR2xTOW4wZ25qSWwv?=
 =?utf-8?B?SUtiSW9iMWRDakZ2WG5iV2RGdURmTFJoOWNnSE91b1JnVEdwWnRFRmdWYitD?=
 =?utf-8?B?SXJXb20vcGtkcytwWERZNHBwcW1qT0E0cFM3eEZxb0dHcEZwWE9DQTR1MHYv?=
 =?utf-8?B?SmhrWUZkOEpKQllpWldHWi8weEU2aWFFanc1UXFVL21hYWsvRjlTS29qOHM4?=
 =?utf-8?B?S2JlQVdvUlBhVVpySHhtMFd1UndGUURzOWlDTTVLeTAvTXZaTjQ5Ymo5cGdu?=
 =?utf-8?B?ZVhhamJUdE9VdktXbDB6NlZHc3JHSVVuYi9qYVRWZ0FiQm53QW8wTXpxbEVW?=
 =?utf-8?B?dU1RMGZoNnBaNXlndUl0V3l4OEV1a1BaS0ZRbHEycFg4Y2Y2NEoyaExQUDQv?=
 =?utf-8?B?R0Yyb3ZER3hmVm1JSmdWdHhrejhIdk9JM1ZjYmJZQVZVaDJOcVdpdUZKbkMz?=
 =?utf-8?B?NVBxT3pGYUxwaGxENk1KcWhYK2tDak9oem1aTkIxR0tqQXpTZ05QRHpkenQ4?=
 =?utf-8?B?SG92UTFudGMzOVYxSXE3QkhZRlowWDRCakgrY2dNQSt2c3BxZ1NNMjlvUGgz?=
 =?utf-8?B?NjFZTGhZVGxHVS9rOWVDRlpTc0VQSWZVdm93YzNOd0hCbytUT0ZEVkJDM1dN?=
 =?utf-8?B?RWlPeEx4RkR5NXJDZ0NVaWNKRkV6MmpHb1kwbjdodlh0VDJmcWUxRjRoTk11?=
 =?utf-8?B?VFc3TzJTTGJHNiszNWs5Mks1TVNiLzhtSkJoK2J6Rk1nTlhEMFV5VnFzYXYr?=
 =?utf-8?B?NGJvKytsZThJKy9VTGRCQ0ZFNnpzZFh5Nzh4ekFSSDlLbzd1TWE3TnlXcFJE?=
 =?utf-8?Q?p3MKf3OmC8ZXKfsUxjZpJHW/hYbb2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW1IUDN4SWpzbEhhMm16dTVkNHVvbWFiZ2srK0lkOFlJWGN1ZHdNbWRiSHhk?=
 =?utf-8?B?Y0w4czMwSEpsNmJPMEhpUHZ1NTFCRWU3TzNGdjZhNWxJSkFVZ2gyQXV2SUNq?=
 =?utf-8?B?ckdBL01COGFLNS9DWDdaOWxZanI0dEE3bUlObGFOMkhyZ3djeVRzZmN0Rmhw?=
 =?utf-8?B?OGNwR1gwNklLUlVnSzhPTWVzc1UrK3d0bnZVUHhaWXVpSzl4cWFLVzVFOFA3?=
 =?utf-8?B?SlJyWktHbFM1OUJ5MTd0RWF5dVlIazFBM3pnT25icnVCSk45MHBlY0J5bERO?=
 =?utf-8?B?VnBiMUY4TzdmQUFzZDVlVjJmWHZtckJJWkxpaCtzLysxMzJyV044RTFHWFc3?=
 =?utf-8?B?Z2xxS0NKTlY1Mkdkam9mSFBSTy94UXJyZ2NyMU9MeU44WHZzUDJRRXBvSnQ2?=
 =?utf-8?B?SkkvQVlUdDNNNUp2Y0dyc0hNeDVKZjZYblVyY3hVak8rTzZyckpMVTNrclRG?=
 =?utf-8?B?SmRsWEtpTHRLME1ZRCsxejNKK0dCL1h3U1VuVzFzWHg5VE8rL0JNbmZ0VjR5?=
 =?utf-8?B?RGhKcGZMWmduUXA5YXN1VEsrRGFxbUNwaG1QdUwzYUlCUXlEMkd3aEFyOC9M?=
 =?utf-8?B?dTVFN3FSVitKVGxJMmIyWTAwTitUdDkrK3B4cThwN0NnV0d1eXNlQ25xalhj?=
 =?utf-8?B?ODhBSGxPd3dRRWNtRVNVcTdxR0NsQ3J3eDNuaTIyWlJSOTYxQlBBblhIUnN6?=
 =?utf-8?B?cFl4Yy9RaE01UlpvcXpPYWlKb2t5VGJWMGwycWNabmY3dWtjVy9mWGhOTndv?=
 =?utf-8?B?S2lpbG5jMTFDbVZ3NVdpUFV1a3RwcHdXSnRacTRzR0ZZSjJtVmZlMUMvcDJ6?=
 =?utf-8?B?cjZZREN5eDkwSW5SWE9yUkhnTmdqV2JZMjhDUmUxL1ZWT0o4RFA3QzIzVVJy?=
 =?utf-8?B?aGt1cklxa0hZbUxKL1YzVzJxZWdnQnhiYjlMdVlUUUdnanZBNk5tRGxlUUJr?=
 =?utf-8?B?WS9vdXhaaFNwRHdoZk8wQTRnQTVtZlA2TUJuQnlGZWNWQ1UvTVk3cmpFNklj?=
 =?utf-8?B?b3RINUo5UTR1Y1ArQlJOZjFBUXNBaUVjZVRYSWZqNDhMM0w0aDkvODFzSGlW?=
 =?utf-8?B?cW5YQW5ZdytFK0svOFZEeE1mRTdHcG9pMG4zRHpvMTg4ZEMwbkloS0sxZjZi?=
 =?utf-8?B?Qld6bDNqTEMwS3FnUkdpOUNUVXE4bGtQNlhRbFNDc2hidjRnR3VZUVpSYmdM?=
 =?utf-8?B?WUlXTzI0bnhMdTMveXhvc0s5WGxENWdHWHYrRWNYbmpQVnF6WE1laXUzUFpP?=
 =?utf-8?B?c3llanFBQXZHNUw0WXk3cjBsRDVQTm1rWnY5bU1PZmw2NWlVcVo1S2ZpS0Mr?=
 =?utf-8?B?TjVaZXpURDByaEtzL1JBRzZCcHA5NnFCbU1XR3EybzQzYkF6ZVNLZUEyQ0o3?=
 =?utf-8?B?UkpDbFhzYkNudksvOEd6NTJuSFE4UkVUV2lsaURNaWZteURDZFM1a3pJYkVq?=
 =?utf-8?B?L09mRlhBeDh6cVBiVE5nWVBnU3lLMi9IdFpMVFNFbFRCK3JsS1Ira0hLZTlo?=
 =?utf-8?B?RkFOMVh1TjNCWTVhZkc2dmtlYXZBZmVTVi9MdXFSL0NoMGFOUHllbFNVR21R?=
 =?utf-8?B?bXpDWXZ4ckxMbzBlR1lzenZSaUxQb2VJb2UxY1lyM1FIMHJOSHYxcEZNdHNF?=
 =?utf-8?B?MzhPcjB3aldhRU1Mc01URnd6RzF5WXdjRlJoUUdRZXp6V2xhQzM2SmUwRCs4?=
 =?utf-8?B?Z2JLMUtQYTNNd0xRNVFsK28vdXZ5VjBaMnY1MklrdnlPYnBITzJGLzBCVURZ?=
 =?utf-8?B?dTRRV0pSVnJVNE1Va2hrT3BJaG1pbyttaVFXd09nbnorTjJwbHo5MWFnTVhO?=
 =?utf-8?B?bFZNdDczMmFnYzlYS3ZQTzRybGdwQUxDUWMzZU94UXJoODVweWNZTjBXT3pa?=
 =?utf-8?B?V0c4Vkt1U2xITmV5aCswMHllb094QjZRVGJZU0ZoNjBJaGVyQnNVdktPMUJh?=
 =?utf-8?B?bTQ4TEZVaW4rdVdzeno4eGs1V0piVEdDcmlUaE1ZYW4za1E4ZkdCTGZwTXo1?=
 =?utf-8?B?eS9FTjVOL1o5RTQweFRiRG9rZHdONFNuTHh1QVhOQWJWbVIrN0tiMVlRVTZ3?=
 =?utf-8?B?aCtBbDNLQU1EdE4wUmVlSTBKVVY5bnpFODJiU3Ewd2RuK2piWVQ2TElnbUhp?=
 =?utf-8?Q?zhYsrfvHOY/MzoOW5+ixcWAE2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be06d01-86f8-4ae4-3dd6-08dde169cac1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:51:04.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9U1dVUqpVQ2JIrwJmZLLV3EEAT1sl1kSfNiZaP9XGROcU7dL2WljbwL4QrASCcWOHsIKDJuZF7Mfs5ZSid9yRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_035110_591199_A8536D15 
X-CRM114-Status: GOOD (  12.12  )
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

The CSI-2 receiver in the i.MX8ULP is almost identical to the version
present in the i.MX8QXP/QM. But have different reset and clock design,
so add a device-specific compatible string for i.MX8ULP to handle the
difference.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 42 ++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 3389bab266a9adbda313c8ad795b998641df12f3..ca485d1d596c274eb7e1f3cdc39c61bb54cc0685 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -21,7 +21,9 @@ properties:
           - fsl,imx8mq-mipi-csi2
           - fsl,imx8qxp-mipi-csi2
       - items:
-          - const: fsl,imx8qm-mipi-csi2
+          - enum:
+              - fsl,imx8ulp-mipi-csi2
+              - fsl,imx8qm-mipi-csi2
           - const: fsl,imx8qxp-mipi-csi2
 
   reg:
@@ -39,12 +41,19 @@ properties:
                      clock that the RX DPHY receives.
       - description: ui is the pixel clock (phy_ref up to 333Mhz).
                      See the reference manual for details.
+      - description: pclk is the lpav bus clock of i.MX8ULP. It provides
+                     clock to CSI_REG module.
+                     (see section "4.5.4 Peripheral clock diagrams,
+                      Figure 76 MIPI CSI clocking" in IMX8ULPRM REV1)
+    minItems: 3
 
   clock-names:
     items:
       - const: core
       - const: esc
       - const: ui
+      - const: pclk
+    minItems: 3
 
   power-domains:
     maxItems: 1
@@ -125,19 +134,48 @@ required:
   - ports
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-mipi-csi2
+    then:
+      properties:
+        reg:
+          minItems: 2
+        resets:
+          maxItems: 2
+          minItems: 2
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+
   - if:
       properties:
         compatible:
           contains:
             enum:
               - fsl,imx8qxp-mipi-csi2
+          not:
+            contains:
+              enum:
+                - fsl,imx8ulp-mipi-csi2
     then:
       properties:
         reg:
           minItems: 2
         resets:
           maxItems: 1
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8mq-mipi-csi2
+    then:
       properties:
         reg:
           maxItems: 1

-- 
2.34.1


