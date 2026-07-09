Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240BDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 20:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBsHNJB7vvD+TY12VYHy3g38nRBAzw3SLwievGPUqck=; b=BFiqFIZ0fOhFz+1pZ/tExH4BWN
	qAbIkf2QpusXpTAVjzJqxqgowGrurQNjwWz1l2h7vS/qC4GGlKsqQr7NF4TBCoRYrFj6lT8sNHX8+
	QOZ/9uGLsp0uLH/gwXHo29qUQpeNH/Ln1i8r/cEjEQ7EVypG8E8N63RUnAclHiPVxfDd3V7cuMrve
	9G3j80Ntu7sTQ3S0kSnAtINcgZFK8gEcQTsM68t8GxS0kJrhd5O72ge+RbTqe1WpLxVP82pDGVPrA
	g5my/fGwCoICjEEapF7RkdjUg2uXG7QNAgqZRZHFJg5Jt7gHDP5YWkGY/O9zKt9QU6X9Izuq5MqN2
	GaSpDWDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvNr-00000003ZrS-499m;
	Thu, 09 Jul 2026 20:30:11 +0000
Received: from mail-swedencentralazon11013055.outbound.protection.outlook.com ([52.101.83.55] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvNp-00000003Zo9-17bg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 20:30:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2ofEnj/wW0XEnDMlUveFbaZbcdcpO2Qqwc6MSFD6Dw2zWBDXgCZUP5wLHqsuEIlfV3ejtJ42SP9+MMJc3W98YbBLn061OU0ytbMQ4X/R3ltlFot7RuSiajBCynY+l4bDDRIfXYGulSVVltDVKcQye7c3XFyxALRwhnOzQSz4hfA+N7DyjxfzxcQ2baQnbYkmTxmFFHyschCgC2NDBdbTBJwOXaxsvaNxNVcD+HEk2nAJyJ2YZMPC0/pLy0+luzSughB1cpfouSURAilPxknj24Tx9InjqiHOz9evmHjpvzaX2ilXQPqO15U6LGETm2/AFZn7wgi7c8aXUyyJtk8dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBsHNJB7vvD+TY12VYHy3g38nRBAzw3SLwievGPUqck=;
 b=Q0l+Cjp734OAjqJ+iE1UQGaWlfsrRm0QcqWs5qK3WQIMrB2HVgR4kgweaKsuD9RkY/ooytlK4/nAB+d4QqQKXlF1sEckjupyLaTBiYR0WQi4PPseYDLv0vcANjP/uzWIY/DYtksrgm0obRpLq3Xilj5yjnSTngsGM+iNSe8iz/Qq96nngEmbqeOZWEJEzcDSH5u8yOt2s9YAPuFqlQEEBB2ffqk7vzSgrOgwMclVz7lhAXXQDjVSzVGVLC+nAnlHorzF/IavFV1993D17eXJcND+TPn+nvMjvrvf8kW+tO6I/FJoCZ//mLTsoqK9qTWqHE9VHa3MtDJT4GFNa+IblQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBsHNJB7vvD+TY12VYHy3g38nRBAzw3SLwievGPUqck=;
 b=E1RkLW+ZxGT1tTlRBeMasFXv2v3+gKRkirj9kuExxoBsv2cPCWNJrCgvkG/qqVsENh766hwHs95hhNrQTtxPQ9aFSQcsXXnTaVYhBMCdx4GqXSMigosdLpn+N4yxElx3Y4+DcT/zQ4whFQsXYcgA2BBNoFhLuuk45ftRsK9obEl+gKNPez+oPahS1ZoGgsuZVyyJ16Lvyhgxo2dJGWGDm7uf0WsJynofFf1rfxn7CQlxzQ4jGDUbSrFlL4WtfOduAJo4eG7wvq8lMGWRS4TqGoHDaWVE7d1B9EStfnSRgU0dM2D6mz5VwG0boesxxigH6BElsxmZCsgKBPz4/r2/QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11264.eurprd04.prod.outlook.com (2603:10a6:102:4eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 20:30:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 20:30:00 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 09 Jul 2026 16:29:44 -0400
Subject: [PATCH v2 2/4] arm64: dts: imx8qm-ss-audio: add spdif1 node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-qm_dts-v2-2-3ebcce82bb79@nxp.com>
References: <20260709-qm_dts-v2-0-3ebcce82bb79@nxp.com>
In-Reply-To: <20260709-qm_dts-v2-0-3ebcce82bb79@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783628984; l=2118;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=iy1xDV2jqeKN4o4GLlBWuLlxZkQzfZFJNL/GRgaQT38=;
 b=FfJovJpGeoSXqqmbGiZSJARS41KgKAKjC3nrf73wyeR7N0M59len+Db0LphFK99JATwnBb2NJ
 ktuU8FwGb9fBim3GoPiTxiPQ/4RpWBpIW6EdTjYeWckHh0NTxj8bgmD
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0118.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11264:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa6932d-075c-4ae1-bb7f-08deddf8d94e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|18002099003|3023799007|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ZJEdyVX96KEiZ9BjR24e+pRCkLUqR6G7/rRdYrKRfOLh/k/D49ZwXF/CYGLJXadJxPszu7LCtLHhaO+OhF4t1dIT3vBvkbWwih07sS15OWBuPsTlr2JIuZ3+D0XTa++MKan49EVnf02rWOqdM4PnAYxrAXI5DXU9U/mrKgRrHZanXSzdfGkI1p82hLzNy/vLSwG96lDsvLk+AlWlfGR7X3yesA0dDXGG3iJTgZ/iPaKhU48aiVDIxz6Kzmd5wyRq5HwhzgYHkJwJHyclVaJb/QF2gA1YwJq+b2IWuHTMPiRgaoHZdo67yfqOb/74xXj0HluF54JWhWTQ3nHRaMy68565WlF5Xa8qZUoWr7AORKO1sO8ey033QlbNYjtxAZzFrXvr44pqbetVqF4vI/z6vyAOZvd38EjEu6/7aaJYKSNsq6WEsbY4k9E94FYkGc4kx8aw9jTMwEfjDq/XDOroJPSMMbLa+5rKKhl9BpIMdA1BhwqNc3lcT2vAdcwI8BZbLPk6tYPXktXu9I3wkBDiHCSJElxphcvCfPeDxmfhCiJ7W2NhhM8H0TLJ9bEM5FlzuboF1NqqAceKiLHLIrIfUk6AFcqqGI4xV8YvfJNq91CLOqoYRub6TED98d0JhaHx//+OIY9OGbXa/e3uUGzUm7lvIVtEeJmRCP8Q4gXVlAY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(3023799007)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2NqTHZkZkZRdHRXR2VsM3NDUzdnQ01mc1gzd1ZSbzZwMTlrR0dncVloc1lw?=
 =?utf-8?B?YUZjNTZOeFhYZGlLN2pDaDhzNThYVndRcFNMclFmZEt4N2RrODBPS3Bhby9n?=
 =?utf-8?B?d3hXOUFEWFhnbWpJR3AzR29Cc3IvNXBGbmMxMEptNTNncExnUWZycHF4dThq?=
 =?utf-8?B?UGNhRGxRd2dpTW1GWEU3WVpoZnBHb292aWx6UDRyL0ZReC9LTTZuTkZZLzVQ?=
 =?utf-8?B?TVZJcGRPNzZJdWpPbS9uYmlsSjJhTWNiN1RuajNDUmJHM00yRnNoaUNzNGxk?=
 =?utf-8?B?TVJFbkFUR1Y3c0tGMERNbE5uRzFZeEpNYWY3d1AyS2Vqc2dXU1NYVUFzWVJy?=
 =?utf-8?B?Y3o5YTRNM05QUVE2YUp3UnRhNnJsRnFqVmdIYUl1a3gvUlBiSE5nNlpqQnVS?=
 =?utf-8?B?a2ZoSG4vc2J5alIxZUhid0xwcjZNbXBSU0NocGt0NmFYbUxBMlpjUTczSGFY?=
 =?utf-8?B?dUZLYUhqYVZnbUNYNlhDakRsQ1M5Y2s0TFJ2OFFrK3VvdkkwWUt3ZzlCajNR?=
 =?utf-8?B?QjlVRFVxVzJGQ0w0dmN1QUVGbGpzUjNKUktXbEVlR2xMM2dROE9MOS9JWitW?=
 =?utf-8?B?UGlwS0xySUJiZmhFVk1vUEUzTHRpMk9WdjFidnpIMVEvMmxpMzdTdVJ6eE9u?=
 =?utf-8?B?MTQ3K1AwSTVBcUtuK2tIek14Y3VDREFHWmJqeW1keTBORmh4eXZ0aVlmMytw?=
 =?utf-8?B?Tzl4RFgzeEJMWk9OVkpxRzJxS1RPUCs2ZSt3UVlXRDdCMk1TNlVQV2FwVk5R?=
 =?utf-8?B?ZlErZ2Jib0hzZVpEMGViUEdRWDF2MXNlN01vRHZnMXppUFZXdXBGUEV1VmZG?=
 =?utf-8?B?OE8yQ091d3BNQm96UEhrM1pHM2hDS0pBaGRrcHhGb1o4emxRdWJ6TExZZnZz?=
 =?utf-8?B?MGxLcnJZNEorbE55Z3k0TGI4UVUvMlFZN0JoRVBJMEpQNUVqc3NocVU2YzFT?=
 =?utf-8?B?b050S21Bd2FsQkRFT2NEZEwxNi9qYlZPcGt2aVU1Z0FIcyt0Y3pqS2xzb0pG?=
 =?utf-8?B?QTBjS1BxMGhQNjFMRUNQZ2ZJSFVyYVY3TUJHSm9yWUJ5b0hwNXY4bmpvcjNP?=
 =?utf-8?B?Zk1PZG1FbmVKTUNIbFdsczIyMUVMQ0ZxY2RIZXQ5ejFrYVU3ZkhkUFlGNDBB?=
 =?utf-8?B?d1pxMTZmTm5uS0Mralh3aEsrcWdpWk1RQ2Y1NTNVVjVORllhTStlT3RjZ3hh?=
 =?utf-8?B?WEZ1bjhaZlpQZ2EyMFBUWE10ZzdSY21uRy9Udit3TUlwODV6dVdjYjh1OEZY?=
 =?utf-8?B?bGFRU3pSaXlaQVNNY2dDTDllcUNVakRZaVVsdnRUcWc3endIaXRXY3dCd0ZJ?=
 =?utf-8?B?NkVrSjI1SmZKam00c3c1a2h1bjhnbGRnS3UwMGpYZXA1OWtMMXE5cjZJUjdT?=
 =?utf-8?B?Qk52MGEvSEVUaWIxZWRRcjdoTlpnbmE3RGZtbmxOdXRONXR3QzVYSFJBaUJr?=
 =?utf-8?B?MWdLVjBVSTQyRU9VVFlRUHBJQS9YL21NZzlUcmVOQVdLR0ZWU3RvdnhsY3Z3?=
 =?utf-8?B?czk0QXkrVGkxR2x6T2E2aGpXeGJaVDZYMXhaREI5V0RYTFBadm1JTmZYZm5X?=
 =?utf-8?B?cnVZVFA1bUlITjVwcGlvQTNpbkZHUHdhME5zQ2pWMEdVOXliVXd3bU9pZjJV?=
 =?utf-8?B?SDBQbzZpbU1CQzQ3N2R2b0FZOGhpeEFuWHdNTU05S3ZjK2x3TEUxY2t6anZ1?=
 =?utf-8?B?VGNnS29EZWxUZlUweGpoUXcvcTZCNnhPaXBBb2F0aFBRdDhWN1NKTkxLOGFL?=
 =?utf-8?B?a3Z2dmR6bXpRejdYR3BkM0pYRjBZdHJNeHRXaWFJd1c5L3BuTVdkbFluY0sz?=
 =?utf-8?B?RmwzUm5raWo4c0lQS01BWjVCSjE4U1pTTVZIRnNaNDRBdkU4ZHlYSG9pOEZR?=
 =?utf-8?B?Q1Vkb0Y0QjVWQjh0bFd3L1k5a0hiSVlKQmYvYS9HZEVaWkRpM0RMb1dKTXlD?=
 =?utf-8?B?QUFGZEMrR04yeXR2c2lRWktpVnJIcHRuUmF0UEVuV0t2RUVva0U1QXY5dnZB?=
 =?utf-8?B?YmU0MTZ4dGdxS25oalVoRlY5SzdQSlRrQTdWWXdNc3JkSkRtUk9KanJ4RDdH?=
 =?utf-8?B?dXN1TlZrV1FxN3pIWnU1aTJRS1FxdzMydWNCSW1BUzVjQ0ZrUW13T2F0cVQ1?=
 =?utf-8?B?MHF2RHRUVmZPZFdmVTRrRnRac3ltZjF2aTVDbFA0OU5yTWpFd2IxRktOTjY5?=
 =?utf-8?B?VVJwNUVvdCtyZktzQkdvZXNqT2ZPblk4bm51dmJEQk9ZQmZyUE0yT2JYZGtL?=
 =?utf-8?B?S2plcDdZOWUyMFpLS3ZoVThEUHBmTk1pb2ZvT1Q4NjlCblZ6RWhMSmRpSUdW?=
 =?utf-8?B?enV5N0FUWldsY0RqSzJaQ2FiVGRNeXhpQkZKL0lVajQ4dm94SCtGMWkrMzVQ?=
 =?utf-8?Q?vfCyrCVnSQ3kwdr2UN2eaTaW8Qo2Lr8j6/zHu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa6932d-075c-4ae1-bb7f-08deddf8d94e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 20:30:00.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5/U8k6cMfLaBY5o8glwTrUJKBWgr/lotH3h35+MX3EC0+cW+Tm6Rs3qKkmL7p9F9VDeAVYQGZ/SqPXEp4mhQhiIbXbBptCUf8VySSVQXaFbZLD6id/7Z4uWfRfzhCKz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_133009_326048_B024A111 
X-CRM114-Status: GOOD (  10.02  )
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

Add spdif1 and related lpcg node for imx8qm.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi
index 7c5386d4ab2b7..5cb644837d936 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi
@@ -74,6 +74,31 @@ &asrc1_lpcg {
 };
 
 &audio_subsys {
+	spdif1: spdif@59030000 {
+		compatible = "fsl,imx8qm-spdif";
+		reg = <0x59030000 0x10000>;
+		interrupts =  <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>, /* rx */
+			      <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>; /* tx */
+		clocks = <&spdif1_lpcg IMX_LPCG_CLK_4>, /* core */
+			 <&clk_dummy>, /* rxtx0 */
+			 <&spdif1_lpcg IMX_LPCG_CLK_5>, /* rxtx1 */
+			 <&clk_dummy>, /* rxtx2 */
+			 <&clk_dummy>, /* rxtx3 */
+			 <&clk_dummy>, /* rxtx4 */
+			 <&audio_ipg_clk>, /* rxtx5 */
+			 <&clk_dummy>, /* rxtx6 */
+			 <&clk_dummy>, /* rxtx7 */
+			 <&clk_dummy>; /* spba */
+		clock-names = "core", "rxtx0",
+			      "rxtx1", "rxtx2",
+			      "rxtx3", "rxtx4",
+			      "rxtx5", "rxtx6",
+			      "rxtx7", "spba";
+		dmas = <&edma0 10 0 5>, <&edma0 11 0 4>;
+		dma-names = "rx", "tx";
+		power-domains = <&pd IMX_SC_R_SPDIF_1>;
+		status = "disabled";
+	};
 
 	sai4: sai@59080000 {
 		compatible = "fsl,imx8qm-sai";
@@ -109,6 +134,19 @@ sai5: sai@59090000 {
 		status = "disabled";
 	};
 
+	spdif1_lpcg: clock-controller@59430000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x59430000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&acm IMX_ADMA_ACM_SPDIF1_TX_CLK_SEL>,
+			 <&audio_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_5>, <IMX_LPCG_CLK_4>;
+		clock-output-names = "spdif1_lpcg_tx_clk",
+				     "spdif1_lpcg_gclkw";
+		power-domains = <&pd IMX_SC_R_SPDIF_1>;
+		status = "disabled";
+	};
+
 	sai4_lpcg: clock-controller@59480000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x59480000 0x10000>;

-- 
2.43.0


