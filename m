Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A31CFD372
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 02:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=; b=qHbAp3ER79sxbZ7rrF7axVgDEK
	5DeUgm8s3DlD7CPox04MkLZiZZxXELTYyoYVQrLSlH8cZc/DDIM++8DYGlFMLiVIZJRD52KK8W8+i
	1mIVaEkDumizlsUnKEc76mxiejFS0NmiJ1grCAiMDfYDvYo+tNfvOhe4PNl62LXcIc719AQe2beAt
	W4/LOLH0kXG2iWB0vpKk4d886NWV+xEYrFoy2/DPGpExuPWBXSOp1RtZBS7NefiGqCm1Vc7FYBpgf
	SlptIQFkUbeZtrqGY0GqrAoZoMI6RjMEwK25l00yObno34dugaKMpzW/YaFx7W2QeoIFXxfqfWRlw
	PNKwEn8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNiWb-0000000CbJX-0gIN;
	Tue, 25 Nov 2025 02:11:25 +0000
Received: from mail-francecentralazon11023127.outbound.protection.outlook.com ([40.107.162.127] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNiWR-0000000CbDF-3Nnb;
	Tue, 25 Nov 2025 02:11:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgXb0lt6WNZ7ttjA0sHiCSC2SnJ44+r9kQFgQfrY2R9ovn0C24ZbUQT/i2XRN5Fd6G05FkIk8WGK0eNHWi3oB4yi7dz9ILfQVeqNF/bDZY4y3eNPJG9WYjg/7tZ8OkDrdzMV4RXvS4acPaChbY7iSrNy1G3Tf1Pex/T9G0KuR4CZ82rYgZIUDGuws4XBIJhjFnIxH3uWWojPsBdr2rorbcTwcHacd29koZbeuqdEBdM2w2MjKFbYt7J3Zb4bxAK70PemDg9xR3mDHCyPU1rwWyGyoNbvmsfD5b5AnGQGnQrXEcQsDWdFMdzoq33w3HTTsCA3iSy+bYHztLpH2j1saQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=D+c6yLbzuYpOoJB0H5oUMGowWa6Uk7jRbpYXugI3KE+CiM6VrCOyaAhEg9uf3YYh0HWVppAn5TyjmvNf/WGQyXBlj3zPUsPKkOnR5wK1M1B0tPHZTrc/hfpdgy3WecddgfzmgKYdBpIRllVlYZ83eKwWu6U2r7kvYilM4eQlUBuXT4mmLQy+QSSS1M6XvEYdLdKeFGUWD/sARhxfKSMcXjuQfLBaC14TMUfL9mZz4r5ENIkmmfW59xYGQZcxEbtMHxl2j1hDg44iFCIy2JNcGpRGP/CeV0qVgTH0Kf6coSjaSRYqjLNcczYhnYfRp5sXUv9m3NgpQV6FAHbE4ClbWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcjwgzJuu4GKdW6MOzMtH4k6Gjp8Fj9ec0RGvqyijPg=;
 b=Gah/EbBTNhFpL2DgY6Vfowo8665zTsMfLoEmaGRKMGS1xnfmux7CcxrpTBqZijd19pWG375tWp/pvY2z3bwgLfnAz89opy4QopOsixXrKRtpx4afupeXg6/gYfIh6QUVg7n0DiD/5AMCpyZVzRix6SMPNZF7N15I79NVXPZUKxNgoR+ZQfW1GcSZz3Vo7CcuNjlnENOejgAe10szWrVgjpo2RYrl94yUAZz3moPyllSu7utc9H72AIedodQxnjdQtvujono5VvkWzXVXcdS8JNtq+A0S80iY+ltN7SvTHNKIbxlldpXo4ckB3Uias3jpyY/0G40I9mxunihSOAV3/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GVXPR08MB10638.eurprd08.prod.outlook.com (2603:10a6:150:14b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 02:11:04 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 02:11:04 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v4 3/3] arm: dts: airoha: en7523: add SNAND node
Date: Tue, 25 Nov 2025 05:10:51 +0300
Message-ID: <20251125021051.857159-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125021051.857159-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251125021051.857159-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0099.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::34) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GVXPR08MB10638:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b9d2ee-7740-4815-cea4-08de2bc7e35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r4ae9GaFmWIZQDr5Mi87ckzcz3FtbEe4DuB0kr0HsMQILSMyEkBQMSaKcnS3?=
 =?us-ascii?Q?yNZMF2pB9BfrFmMUzZCr4XGmdzOjAPCcF/ND6BWG/qrn5l9gXvXh5XYj0NqH?=
 =?us-ascii?Q?eu8iONvVuOyObXcC7jXRnkzJ5bEZZVcPHjtBk9GQoU1yrbZAVsKpZDOeNdvY?=
 =?us-ascii?Q?dpY4WZrgRN4z+UYHFS8t3TNIBQ8HD7Fl9o5uVzZWbfIJFEIStOktZJUIQTKs?=
 =?us-ascii?Q?ZBWuB7CYAAyDAkENblLBB8IGisXMBuLN7N8+FN+Ad4AHsvuqcUHzmkNumdot?=
 =?us-ascii?Q?4yqzIFXstGffdP8K4TeMNb6oZnYOjVNL3sh4dSZ7ZMPM1LJg2/3EOAj9jRTD?=
 =?us-ascii?Q?9M0j1nzKteGuN/JDl88PfA9kUwXugyo3Z9Vg3e8qyq5B3J1VotcQwEjyb37v?=
 =?us-ascii?Q?MIZ3L1N8ID4Z/gzRi/wxWgTLiiKEJs2X5PEEupp1H1IZhWK/PhoXOKAu11hE?=
 =?us-ascii?Q?O1nmIX0NQL5OEeAjNyIJkEDCYo4e4bImCskqv2HND/UA4inAw+vNr5Int7xI?=
 =?us-ascii?Q?8s73zroSG+SfLyb556Zz/jarQfL4HNtEuwVl1FSs6gKZKDZwoBATPjNgwcOX?=
 =?us-ascii?Q?2hi3oT6L5rZayGmC/d2hmE/FdDUBw+1t1SzRPFpoFHG9eQRE2yaVqGdh4VUv?=
 =?us-ascii?Q?e4Vq44nfxOjYcf0QCAss79Y2dQ/Q9XGrdOZlrh3D7IsHv9mj0UawRJVkglAc?=
 =?us-ascii?Q?5Gw+60ay2wg9lK9pXmUEmfQ35lz6s28MvZn//QQhzy3hAaG2PaS9445RDBVp?=
 =?us-ascii?Q?qoIgicjfPBU2qTEF2AuEwUOkKsQF8X+X31LnUgFuPkFjs38L/rjIWhi9E2YG?=
 =?us-ascii?Q?f2rdU82FzCbIPmp84QdZbGKjxh8H61jMds0dFd98WgHPleqmL0nsRRabIQwU?=
 =?us-ascii?Q?W+Mk9jqaLWMrbsjIBSGaTy9GOi5MQkFGxehtiO70dTDh7musiS7i5jBTKoc1?=
 =?us-ascii?Q?5kIhha4Xjju6hceNVPLtMaHdB4KyURFPqtwS2zUmmNyOATyjtnjllHS31D5g?=
 =?us-ascii?Q?yH819dtGczUO0vVKpTZdg+b6jQd5IND4nWKAo6izPUI3NQIKkxQWhLib34Qn?=
 =?us-ascii?Q?F8G7gBxXXV1wQq5ABq63eR8weAw10P2pTZKnYNrvIV5pomnI8VxoaB0AWTt3?=
 =?us-ascii?Q?ro8Q2EL3NHupvQ4XKfUp3Eqo+lWHB2tJn5sVTS95aejIy33QWIyFf/vUHjpp?=
 =?us-ascii?Q?upiTD+q/smnQmIUwAQcaPbsi6Q/V3JLAdYrDbo4kt1mWUidt8Q73d0xBRNPt?=
 =?us-ascii?Q?K5gQ+fspmW4A2xu3EPc7nqoGj1c0ExcOMMnWHpbOpWI2EFtwQWF9522I2tM/?=
 =?us-ascii?Q?B3Y9Hh1br+hLVCP0FAKMvIVS6fT1iNZt8NKmWWhmNNbtYKJ/U8tU83Rb0o8v?=
 =?us-ascii?Q?uh4nT9Se7T9Dzh9EP50B7PLFUl+7dVbs23izf1v1Vou0hbSt6TmlNcZOgzIG?=
 =?us-ascii?Q?2sHcmQcoeFIMfCPThHmtSY3IAfsp5JMA6NsvL0t9TIzb59TkGSKEgK2ialTt?=
 =?us-ascii?Q?0i72ffOjgEOvPffb7XY27BFhPCGtlyotxtLv3BIY5cSJTbGyIBeBep1hLA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/BNW1YF5SmleQJczpRP2xueqwKdgqTAFUyKgoe7lnEmDttLO8Xk0Emp1BtC4?=
 =?us-ascii?Q?OlAhr3qjYdZKSq81wtxKRDcapfOSLJQmDX/bcJjVfdLtmWjdPj9wrUoGlbMw?=
 =?us-ascii?Q?20zxf+Z8mlk9VdAkRX+ly5mZ0KfBKKMjL8oyrVYo+fl+J88lHu0k3upZFgT/?=
 =?us-ascii?Q?gEXu6isEbYxgYcs6gBV3agpUCuFMiwUy2oZudHJiuLbi0T6xn1RSVDT2p0vH?=
 =?us-ascii?Q?IwqD7FDnE7eT2i329lfUbh2C/UteIZ3Sf6sRbBpf6UtFMUPgFnUFA5s2LSdh?=
 =?us-ascii?Q?RdA+4qae4JwZiP922159wnFsBqRoZ+QgRVSXRiZLDThDwJisnEne4khg42mR?=
 =?us-ascii?Q?W2b1pgVtFJ69NBKclaHYiV9xLgEWV5QOdXmv8TM3yJBctHBTqe46Gh2ccQ+L?=
 =?us-ascii?Q?BhMgf7u9nG3CnbfUvxDVswW9usxHqKCwXyUbC05Gu6sXzQ5jwvLAVWvrGKxb?=
 =?us-ascii?Q?I/2yj2LcxSGOGiBc5Xf8WBHikvmzO2lraoWy+vnR36qtRU+OfpJgalujya1J?=
 =?us-ascii?Q?0xoay4wMk9ZPdcUpoWdedZq38dh91rboTMLrh+6sIuoPt1MR/JuMsfdCW7F7?=
 =?us-ascii?Q?MUVK4tf3wUdsy8BjSqBRGZf1Y8mzwnZK+JIDmJwNZPiq9X+fX2hWazl8ndoB?=
 =?us-ascii?Q?SpCwscuW5Qa84Biz/cN2GI2sWSRezYiNeYbAaqjnYGgBryrBCi3KESJLRaMr?=
 =?us-ascii?Q?TIN8VnQ/jEZ6E8eGV8Y852QvvhWmGSjYJadqMkgGIxEPFufZ7abtHF0hGzzy?=
 =?us-ascii?Q?rcV7mCxQBfL4H+w0fGdKnUU59pLWFJ+IEI+HKrO+BL/TwbbpkEghbudv/qqo?=
 =?us-ascii?Q?KgiL04mEnQ6M50OOM8dlWNJNk2RJ/crQqjpAq7+6jg0aaIorYCc+VB+Liq70?=
 =?us-ascii?Q?6TeTDuxkL9W69i/jgY5kSEBio5EptWV/bdkTywY0ptgHlXAGdZXT3HTTyNB6?=
 =?us-ascii?Q?tBvYjttXBjcqHPwtAiNUOgUAswte8eE2L+TQaffTPQ6Qmj1W+d83lxePn8HS?=
 =?us-ascii?Q?gD4RjhtLsw/+zJV1s1/6nY8BnaPJkd8TfnBmDyxitKB2p/b9pOYBTa1sPj+A?=
 =?us-ascii?Q?BSatwe9hPP1f0O82cwqKYeRYb37BOeYF2CDYCXLvvkvdespdoZgiHqE6+qgu?=
 =?us-ascii?Q?2Xn7AlvZ64oZJ54iwxVuavFiNFxiZ41PmRdz09gIKo9ajhRcl+7HaqWO4ixR?=
 =?us-ascii?Q?Fcn9IUUrjCeSJiirfNL5TqoDtcqfCB/EXyHIDg3gqCQkUV/ZgBGdVUvL9pPF?=
 =?us-ascii?Q?UWJ4TcB7PKcCmO/XzgbJD4GE47EAHbSCh/CWdR5IRbnchCQsFsXXDsupbvFr?=
 =?us-ascii?Q?wQS3NFF4CDI/poSkYsfcHjROHsIXNkB9IAs+MsOlk581eAn9ci9MoZuuksRr?=
 =?us-ascii?Q?uYgBRiUg2A9DffcOInpS84YBd63uglJYFH506oNR2ld24dDs7quWVHLtJfW5?=
 =?us-ascii?Q?LqGLBjHNHrSqfJN94ipCzdGI2DzoCTcilsA7+nllUbEPdaLAUYFPfe33kZ2V?=
 =?us-ascii?Q?YR197uGNJt557i1Jo0aPXVstQqwwwV0o1dSeSOlAaW6xzONFABK/PLqAE7Cy?=
 =?us-ascii?Q?JiPP/cCZiMj7k/AxRoIXR+4icpTGIMDXwOYKxM6OR/sEH/qNckBem8u0Ah2V?=
 =?us-ascii?Q?SXLzqCIEyUDQgUCJT+UHZSg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b9d2ee-7740-4815-cea4-08de2bc7e35a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 02:11:04.7585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMbhfyTKieaIng4zHf30YhhorEW0B6N3hIoYOX8sGurJIU5nHR9rcDlX1gEG41UFZUQqGol0+MA6xAHo2yZjVUnYn1i7xGkoEpV6VT+TfU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10638
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_181115_851259_CD5B6D8E 
X-CRM114-Status: UNSURE (   9.05  )
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

Add SNAND node to enable support of attached SPI-NAND on the EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index b523a868c4ad..31191b8d1430 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -203,4 +203,24 @@ pcie_intc1: interrupt-controller {
 			#interrupt-cells = <1>;
 		};
 	};
+
+	spi_ctrl: spi@1fa10000 {
+		compatible = "airoha,en7523-snand", "airoha,en7581-snand";
+		reg = <0x1fa10000 0x140>,
+		      <0x1fa11000 0x160>;
+
+		clocks = <&scu EN7523_CLK_SPI>;
+		clock-names = "spi";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand: nand@0 {
+			compatible = "spi-nand";
+			reg = <0>;
+			spi-max-frequency = <50000000>;
+			spi-tx-bus-width = <1>;
+			spi-rx-bus-width = <2>;
+		};
+	};
 };
-- 
2.51.0


