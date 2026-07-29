Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DF1C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 01:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aO4SWgTc1e24aVl8hsJYzNC9nnGGnnK1N77oPo0P3k=; b=flqy2CQ3xLkXHB6v8biVUgkjbZ
	h0fWInobw5yU8DXKjeW1MoKQgIWWmku8K1VpBJMiLWpZQCp9NRWvrPLDmfXv7beXJnI+bUl8o3knr
	gFohV7ronojIt1+ifTh1eCyhS30JUQDwNEZsmTAmXY6Pf36PQ1VDyI7oV76T7enIwK+UvE7ZyGg1N
	4Vs9qpY9Yu77x4i4tC5G4nFgYj9RyTwURUrYf8e2ZNENLNXarpdGMXndGZd/UoWb5791cmL+EG1Yk
	sTqkF42IfIb4K6B+Ep5cp/cYRI0lhBbG/DuAsloSLlbDmbd31L40Dq9YQw0t+3eXNb6mSXY9V/3qy
	2GqbXoyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wot07-00000006a38-0MoS;
	Wed, 29 Jul 2026 01:22:27 +0000
Received: from mail-westeuropeazon11011015.outbound.protection.outlook.com ([52.101.70.15] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woszy-00000006Zy9-10Cy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 01:22:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NcrjPOXQq4m2P8SQMZXGTHnwtM3TYql/HSUklEMuJIBAXPg/cWkoQ6pM9yfT9wh3YbNRoF+Rt+kgjRfNz1tq+DyplExer0BfDuM8LG/pLf8k5GiTvNVIh8/PUjFXorTvjcgNaSyBl7YC1bJHwhja8WPt3i2ySBXOPNBzqASZUFpn8XvMq2yBK5aNsFCyq79AJfrnOdMAULz1rt+HC1xnBLr19POSP70jwFk1t0nU/ih8BoyHMt83+NtycB8qpEoxKA8FPP9Z9ZYfeTCrSt8gkpgqS/BsbiC1Qz6XiYeI/NxaWaR1uqSaVxYawzCrjRg9hyP6rlh9dt8OMKtdTuENTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aO4SWgTc1e24aVl8hsJYzNC9nnGGnnK1N77oPo0P3k=;
 b=FAQMoRMdyZB7z7DctJVhvolxMZzYUf3kHklt331JHKurq3J/iTbTtfhxFEG8+Y5e9nzZ0XLWMc/jfKEVkkA/AUsHgNtruj2gDGVE3hHp7a5kZ2oi9tZWwz/MT7GfBikNA89dk1ugdDk70lYwVWwvWZrEOxE8G9xnQLNmgWBNIsTr4F2OrazNJuWar4Uhu9EzAvV5L1LUDPBSeA2nmDILqhX1lXKWYOdqVptxD6svPPevOgayr4kT3sN0A673iw8SnJJWV3Dy09KQ0WlFlnYwd+ZXGEOQ97biTLE23ZdGj4gdd3t7uiQKApFRCsFdTwytJ8Z5N5oHaBQda2g/AebWVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aO4SWgTc1e24aVl8hsJYzNC9nnGGnnK1N77oPo0P3k=;
 b=pAkdnLrpodHM5UgpGQKc0IXpN+LCUWDLfBOSW+PyZByvOgxGGzoUgoHmutGPaONOz8MIkl2B3rrMSAmMrbu84Ch+ORraj+mTJ537iV+K2G53zpTy2kQBTjuxroQZmSGW4BfcEZGKFikm6bMb+C23qScQTyNWrl7wu4xmPv9G0brjeoJTU0ml46fYgzcfIW2wi66662vjdVeYpUuZQn9RLJA+cf+BMB3+GODymIGD0PVXToZO+pEzYWX+IbecJCt/H5NucyCG0QEPuRoQf7VUylQc/PATy63iwb+cnBg0gycSzdIMYRXrehMwBuogAq1+Hh9diPdmYapuB9EaD2O0SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB12274.eurprd04.prod.outlook.com (2603:10a6:10:62b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 01:22:14 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 01:22:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 09:25:38 +0800
Subject: [PATCH 3/7] arm64: dts: imx8qxp-mek: rename vdevbuffer to
 vdev0buffer
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v1-3-368bca0b309f@nxp.com>
References: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
In-Reply-To: <20260729-rproc-dts-v1-0-368bca0b309f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0076.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB12274:EE_
X-MS-Office365-Filtering-Correlation-Id: 099fb14e-6936-4613-4cf8-08deed0fd20d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: fZDTqdrTlCjmTMI756lzxOqe9pBkHtSApa1pwP3abBgzJ0BEwMkAvm5kKDmy7A3Y5Ir+CHQPRk49Lv/HM3rhM8Mq0GTX4zSB6eaqFJ+srtwm7X7lb2u6INEUyhldYRcAWKTj+Zzpq2RQqi4cNXODdg+g3RieK4QDBEXnUtHLI85th37kLEMPI3xcj5tn41WvpiOh1VsRAS1PZxMpOzHFLrxB3H8L4ntk7zDWgnpodlWhpMeiTVnKij7LxiYqFddCEDZ5hY/xX9UxTyC3LG7M6x1NfzQfs/YDPGdQJsr59JKvm4qKRI/n9piOLZkSXpYI0AIaBw3P77tf5+lYOCJ7jbdU4SBUAtJGQwZ+a3BM90QIFZO18yIeHzmjcAJMEaTMFAwVgvxilkCVn0l0iKNoU9Jwfw5KTX7dR1YcI2mScCP9DZ07p0myex1HWurTXwDX9jot0VK8x/6cF4p6mZ0u4BlnNXYyRoVZGgKqHFkDGpoLq7iBQeTXyAcMchwg9hoP2OvO05Pcy+hidodZy6bJsdb46RN6vn1m2TYiw/cbVERM1PbBMUeVOy4j3jh9RcroOeCvNEvTm2aiQYCkFzO4fizNI9gWlPfqx486E8mQWGwm2k+ro7doCK1a/5SXBbWqDSUyOQgvSKQqxePdQIvm51lPIaYF5sLaK4AHsUt7l1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGU3REFNTVBKUEM4U1FveXVQK1NXZ1k2cHo5dXUxdjAwQWgrKzNOT3R0VEh0?=
 =?utf-8?B?SHZ3cHZhR3ExR3NIV29DK00xMlpybHNoN1V3YnAzYW1vbGVhckFrSlY4eURQ?=
 =?utf-8?B?UWZ4NjlVdFlSMGhkZmRSNHFxSXdHRGxhZjd4Nk4vVFluWERWNHdHdzNBeWps?=
 =?utf-8?B?bktFMVJISytacEZHcW5Td3pNaGJpZThYUTBhRWVUbGxwNHJoNWx0L1NXMnhy?=
 =?utf-8?B?aEZOSE1pbE5IbWpFRHNRMGRjOHFRRFNyWTNPRURXaWtOOFlnQ1hNa3RJVnA0?=
 =?utf-8?B?ZHhoVmgvZ0RIYitNaVd4d0lIdCt6SFYwZWxjei9wQmFJQ3h3UHZLYldScnJs?=
 =?utf-8?B?TkJjT21adEVEUWU0R0F0anJtQmtDYXRYMmpQRFdzbWRLWGh5em90Z2VrSHgw?=
 =?utf-8?B?OC9rQnpuY2x6UUpjVU1VMmQ3cElhQ1NrUDBqVkRtSFN5dERMeG1YZFdqcFRI?=
 =?utf-8?B?Vmt2Q0VvclJJdkZIMUFzcFNKMkM5QndDaE9jbi9DVWdrSWtIUFJlQjhrRTdu?=
 =?utf-8?B?WmJQRlY4aU5HY2ZYOEt5bW9oM2ZzUXJCUzY2UUtSRUpEcHRsT2NKNDdUS3FZ?=
 =?utf-8?B?MHZkNzNlSjczb2sxcHRkRHJwZSt6cGZEeWJ3M3ovZjAxb3BGQzluaFVjMnFw?=
 =?utf-8?B?a3JRV3NiM3pra2cvMHZHWTRueW5RT1ZFT08yYXYxUmliUVNia1p5ZHlXRllM?=
 =?utf-8?B?QmJSSXNaRU10RHRPNkdxamlrL0xiT2Iwc1JZZjR1QVRBRjFSQ3hBODh4Zk1V?=
 =?utf-8?B?MW50OXdEclBrVnBYNE9oWDJGNkxhSnFqNFF4dkFqc3ZQQ0xickxidWc2R1dI?=
 =?utf-8?B?Mm1Fa1lCWlRlQTJzUjZIWW1UNHZsUFBHWFZsellOYXBlSzBYTFpoaWNFR1k1?=
 =?utf-8?B?b2xlOTF1bG5MeU1RY0hvMStUL1FnODRiN3A4WFVHYTNHZHJ5S1BtZmlLSmJt?=
 =?utf-8?B?dDV0TDJFQkVEeFo5WVh4SmNUU1FFeS8zL3doaW1LNGliR1hqRktrR3pvclI3?=
 =?utf-8?B?NVdwSUVOajQ2NmdhanV1WVZFTmNuMDJ4akNjVndDaVZ1Ymg1YzZ3L040YzFx?=
 =?utf-8?B?YkpIaEdGb056WGhkSDltWlNJUnBMS2FyT3hxcG5PblRUSzJDTE10N2JXQzk5?=
 =?utf-8?B?TWxITzB5SUNsOTBnNEI0L0lsaVJCSTZtWDhoSDZsTE1uMzFpKzkzdVNwb0p5?=
 =?utf-8?B?cDNrd3hwZUhoUUQ3RUhxNTZSZC9jSmU4QXRnSXZHTWRTQ1NiTHAxOW45cjZl?=
 =?utf-8?B?dVBzRlN0b1RSakFDaHAvQzFUM05zK2tDdGRZb1YyNkwyc3pxWjByekg0WTJh?=
 =?utf-8?B?emZPOGVzWWtwbVJ4dVVuRjZURmUzbzA4YkdxUUdwenRYUHN5RFZlQ2lpbU02?=
 =?utf-8?B?YkNxa2JFUjhtSDJvcE5UZGQramZGWmdrSzhYNlNaT20rcC9ucGxiRUpwbEpY?=
 =?utf-8?B?Z0tuRUtrcGx1Vmp2MTYvcVo3N3BGM0ZFUU5JdFliTGFYZkU2Y1I0S1lGdDFu?=
 =?utf-8?B?L0pCWjNIUGk3VzZnRzB1dU5vaG0yWkxZNFQ0eE9Kd2pMKzVKRVYvamZLUXZv?=
 =?utf-8?B?ajZJNlNoVGxoWDhOVk1Qek8rUVVvNVJMQUt6K3hMVmFXTXJybmZSSU90QTdv?=
 =?utf-8?B?b3IrSU84dWh1cXFNYk5tZ2hWYnR0dEdyTVNRRHlGYUZ3c2RkOUZZZ0RvRXJx?=
 =?utf-8?B?WjQ4RFIwY3Q4djVGTEtKVG9GYmFxWXFPdkpURitNL09TRVZRSEFUZExZd3dp?=
 =?utf-8?B?ZjVlZXdEYkhjZ0Z4Q2ZvZXlrbnphVm8xYVNydzRsWU1mRmN1a2duQVNOWUxz?=
 =?utf-8?B?aW9ub1VLOGxCSTd2TUw2bmRlN1RPbEhZdGh5aFpWcEtsRFJmRE8rc2JJb3J4?=
 =?utf-8?B?Y3dIcUVsZjBSK1ZwdHc1TEVsL2llNHIxT1l3LzZweDNtSlBROUJVcGRzODQv?=
 =?utf-8?B?R09FVGZhSlkzSHlHeXZqQ2g1dHUzMTlhRHVZSUJ5WmxLN0hTNGpTaHptYVZC?=
 =?utf-8?B?Rzl6U0NESkNZdGNFQjVTQXRmblA0eVJZWHFUTFhjUzBWMkRPclFWUzRwOVM3?=
 =?utf-8?B?SFh3S081aHpqNFpPZEFQeXFZTzYwQWkzYVRqVExaNHhYbjhmNXhUcWY4UVZ4?=
 =?utf-8?B?Vzltck16VUd5dzNoOGUxcm5XZGpVWnR4TElyajMxZGVDQVJQRmRhWHlkVFpK?=
 =?utf-8?B?SG95a3ZKQUVxWXVabVdBZnJuVmdvL1FUS20xZnE2RDJSd1V2RkJXbldLcGRm?=
 =?utf-8?B?SGxFYTFadkFXTktCODJ5b0M1aU5QOXRhSVpOMWZWaUo3M2NPNXNtVW1laUZF?=
 =?utf-8?B?WGcxd1BibC9ydTlpUTdiSyswNURhNmdvUnNvbk9xcmFROUlaV1RtUVozWmx6?=
 =?utf-8?Q?KWE8RG37hbsV5Jk5O+adX68xa7u6I/W0vLyIQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099fb14e-6936-4613-4cf8-08deed0fd20d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 01:22:14.0058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQse7ih+HrwvvIruY0J6ioU7beWBNAMw2iWB26BAUSzgGhUKIkXtJpxXDAqpbN1b9GdMD83j2QmiZbDApNZ4ZyDtWMFJ+qR0PVZK48W9iZIsnKmELbD5klIIqqiYzWdH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_182218_291042_97CF3913 
X-CRM114-Status: GOOD (  12.35  )
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

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region, as it is handled by rproc_add_virtio_dev.
With the node named "vdevbuffer", the check fails and the region gets
unnecessarily mapped. Rename it to "vdev0buffer" to match what the
driver expects.

Fixes: 5fa302590f17 ("arm64: dts: imx8qxp-mek: add cm4 and related nodes")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 857a6e5122283..a3bf12d9e41b3 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -27,7 +27,7 @@ imx8x_cm4: imx8x-cm4 {
 		mboxes = <&lsio_mu5 0 1
 			  &lsio_mu5 1 1
 			  &lsio_mu5 3 1>;
-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
 				<&pd IMX_SC_R_M4_0_MU_1A>;
@@ -267,7 +267,7 @@ rsc_table: memory@900ff000 {
 			no-map;
 		};
 
-		vdevbuffer: memory@90400000 {
+		vdev0buffer: vdev0buffer@90400000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x90400000 0 0x100000>;
 			no-map;

-- 
2.34.1


