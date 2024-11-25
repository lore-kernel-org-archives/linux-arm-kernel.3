Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D15ED58D5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJEbnwGFbeGayu084RsQ+0mRT5eGvQX/o9sPoQyCthI=; b=JigxkhWbZT/jHej96FT3aDs6lm
	DDbsonuBlJoIYuDRkB5j+ralSFdl0hAT00d4WILOIxl0TlMj3T3zMNCc1qL0e1TAabcdIzNUaAUYq
	wLyFTmT71yQjheZEa4jsBXCk4SAs9E4BY+v/wWjZ6M7AVHu0JjG2yGBNKyoM+jWTWMkNvlt4CE664
	m2sRfoUKozhjwRwz28SDOzI9pHUEVDz4XIY3NQ7VbAfFUt/u5txEgTdrldXD+B8Td4vbbiuGoPDHI
	7/rUcUUAQy8o9BqIwiziWVmCAUb/KqduuWBM6IfNVlD1bQbyp5gR/eoDsMcmKPNTryMafdecew3J8
	lvnydWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFb2X-00000008UTx-3G8I;
	Mon, 25 Nov 2024 15:30:17 +0000
Received: from mail-dbaeur03on20628.outbound.protection.outlook.com ([2a01:111:f403:260d::628] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFaw5-00000008Sxg-17Ol
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:23:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlSwekHSgyPREOyEmKU7Z/WLKUoo58Kc4Meva7F4kjUxfkdrkLNv+eT55c3aylNhTCWdZIwia+xN+Xc9Qoww2SlRo2L2NpytDr0Cr7EqRbmxOha3Vw2rSGTmBJLzfbgvkEf9m1AXTW7LTCQHteoA46U2H2UrWG3c7Ce1MCC1deIBZPs8lLcJu3i/D6BYp/dEKm9B+V9QlF25u5qpjMV0KmcnAn5QS8UzVekDIKUzLtIpuMhBbmsE/Q6y4ItNCRY9KbZMsaPD9ypSg0bxTXiBAMybSRkjH9RLNMgv6Zmi1VYa8i3OVP+Di7xf6ZUtSd4CI26rdEViXUDkf/sI5N5BGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJEbnwGFbeGayu084RsQ+0mRT5eGvQX/o9sPoQyCthI=;
 b=rb5rxtWDWp3Rh66TYLVrnsDg9aEy7iARGaua1tBH+JDYOCgwS7sh9SCm8q1gI8yPmTOtkD8x64PdRY5kKVya0PjGzFiRxtAFEs4WItBCtzTp5JfNhVcG8suE7ZpXn0TgohQ9AnjiqTKA6V7bo/66oQHQq9fp6HdDxWdz6bJ8zHxvo9zNeMo6TvIbrdpv4iF2WhFtJBnrNuT8w6eBSAmgdQn0ckviEk3f1OTbF/PzuCCk3gtm4TKgqRjGsOS6JFYHLPeFKDR4TORmpj5Uro6wrnuuVlpFdWcjX08GPy7TS2DoJFgd1s1ktdEkF2LN03Dh3WAJp5XGbKd3pE0bOZjMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJEbnwGFbeGayu084RsQ+0mRT5eGvQX/o9sPoQyCthI=;
 b=djo4kkBRtg08zS0NDCGbLUPBHCM4T0VgdB5KJZd/1CYh86YjY07qbZpfshHGWvDQ44aqYO0J5wwmmvFfy1d4ns4Xn6Zy68cBRb9Syr1mHKIAV/3M54zwhVI10GTKtjhWnCAI3is+tJOrpDE7LjwLnIR2nSmh7dHUnF46R2yMnX1P5kQxt2VpFpFsMRAwE7gIP9tJrqoQuZLIZMOW79no9n1yaqvm4U83pZw527ZDWy8xIyzoJ8CyCsap/xEu8usJkYRSy4i6NDn2oW4pOH3jLdY3KPUQ0gfe8Qsyy5HoQiML9b33K/6rEt11shT7HCmAeO8e7AnHXCVMpqnvdxuhWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU4PR04MB10886.eurprd04.prod.outlook.com (2603:10a6:10:580::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 15:23:28 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 15:23:28 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2 6/6] arm64: dts: Add dsp rproc related mem regions
Date: Mon, 25 Nov 2024 17:24:26 +0200
Message-ID: <20241125152427.136883-7-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241125152427.136883-1-daniel.baluta@nxp.com>
References: <20241125152427.136883-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU4PR04MB10886:EE_
X-MS-Office365-Filtering-Correlation-Id: 11915bb5-7576-4ab1-95cf-08dd0d651cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wwC1Utr3flzVBPJ6xGaBA8/jQipReR4h4Y3WpSIK74MhncDFXie5PNKuMuTj?=
 =?us-ascii?Q?DVgBm5XRqV3zZYXZFCAUSWGwrxta2rN8y1dk+rE57XeY+zuE2iFfP8dRvprD?=
 =?us-ascii?Q?7VkM2JoftgSHaBVHiz5HIEKBw77nFXgIcd9lA2raDdD7gkSqrY2Xa0dRf74n?=
 =?us-ascii?Q?BKSTr0mFwmH2p2Isyz/frdLfucfDCRZ1v2n5lak/OuqOxlLrpzKWv4bUwOik?=
 =?us-ascii?Q?PHrChwKfyD0Y8goaYPU/h3MHzmgecb1qFUegLJnQRgbvXg3Gac3c8wkS8YDh?=
 =?us-ascii?Q?uHMhKrMyaZp3btXyO34qNYqQyFl/BCtjtF7K7wVj529C07dyixCs1bRqJXXX?=
 =?us-ascii?Q?NDtuJTR1odVoGd5L7N86R9DEOE0IAWpYVI3f1PmrbP0mveyKNGx3f9EAd7Ye?=
 =?us-ascii?Q?MCBtLnBmE60qCvg+7GMJH6fdlABX6qwX5/MDpLdLUI9jhAF6sApqWgH4aJIu?=
 =?us-ascii?Q?x6FZwGTBtYJ6ePbKzYA+8jXf1JDXKPZcZvwIaI98U1gaI12P0HfFG058HKTW?=
 =?us-ascii?Q?5XH/CqQd1lLSgk0oqtiCKD3ajWNZ5q+kTB9y2/6B6Lq9OYVbxguAaFjxnknX?=
 =?us-ascii?Q?BYtSjr6ikpCQ2whdNUYoxj4we5UZ9gC3Sr9mp5L9w+5MGE3Vqj4su7ZUDTr5?=
 =?us-ascii?Q?MZeeGLOiDi89aQhmYERnFl6Bij6X6SBcycJSI2TOwTTLw0Lwh+uPj0FvB11O?=
 =?us-ascii?Q?rLp26v7kPZKEkRCwVCb8B9uQF+n5+kLbKmccFiU6VABk1+59BDEqHGe3VRAJ?=
 =?us-ascii?Q?ZaSlSzSMpDWZrmSUBQtrwZtPnnF++uBMEFHc/OI9/kRBc71+xfkFpoTkJSKO?=
 =?us-ascii?Q?2Hewjig0JGNebVr3LBmXblHWepLh9a0SMazYSgqEZPQtvo75hF7jCZ5PdgrH?=
 =?us-ascii?Q?eCDrNnW2xwIvCaKL0ppC0XAsv2H321nGtIN3sWR5tkze8C/UTQbiQOxOo+5s?=
 =?us-ascii?Q?bLpCyNU5BxvhEi1xBmmjPtVfYuJq+YPTh47BNvUjc7o0EY97NSjOveuQGZGg?=
 =?us-ascii?Q?99fHhxJhV5mnkFWedL9vWt6If24HXmNhwyaMx+Q2y38KKgME74OmoK4NDLB9?=
 =?us-ascii?Q?m+EWOVi3+mx7JeDTZaWZdDotPehPWqjW1Fb/XOzd4MeC5YLSPdfaIyrvLzcL?=
 =?us-ascii?Q?I5nlM2v2Q7z7Y0fLJ971Zu/PbNcjFPN9Yvn3MhWrF/i33mXTBH6PWcv7AdMi?=
 =?us-ascii?Q?UNi1BVpGOyxkdV02QmUvtwoKMhVKc76JW2OBJSc6loPfa/ZGD6tZnQzw/Qd9?=
 =?us-ascii?Q?cWw+7HeG9t9NmJ3PXscih76vac085IhZg5CkJ9I82AwaPg/JU+qePG9wKzjC?=
 =?us-ascii?Q?qRbGuzGAHgkFYn3apA+gxwrvtfwvqKorheXTFGL3mNN/JY/oW1aI1a1nw5A1?=
 =?us-ascii?Q?czh9kSrFDiZB8avlQVBo6vDV42TYZ1VMHRw2o37c+Xh97KJ31A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eeRwLHvqxtb27auGfl/CeP7pQMLbLPcqtlIyGjLh2c73srOKEmWr+QWGQo+3?=
 =?us-ascii?Q?jWoKWqTH5gfTzZyeuV2VYfuMBVLRJa61PFp8BKhpEjTpJgt4tYXzJm7grBV1?=
 =?us-ascii?Q?HIzqDzVaZPVW78IKnvEek+FTflEH/ELlT4GqPVN7pSFlKUv71rVCZ2ZxCkSu?=
 =?us-ascii?Q?+RCeoNJy1v8QFeFTzm3nm07snA9AhpyT+PclX0VDvcM2Zlwj/bwfIkSESdEj?=
 =?us-ascii?Q?Dx44E+M/BQM7gA3jDQe0YOlEQqXVRiXiTZCKxN2THetfakFMrnIZyfDfj4h4?=
 =?us-ascii?Q?Ok4lastHi6o8kBaoxJ2XQMA7ZsaF/pdMTXOIiKTV/I93xRiSVkFE2gi/3s4F?=
 =?us-ascii?Q?QndkowhPo50rVtQ+7djRkzN1Ejp2wgMoXSA+uqNLY87KWkysxBm/UZ4ym2Av?=
 =?us-ascii?Q?8jQYLhQpOGyrU5nFZlhb/wbOudeTK0bwKeG34foHvFEo9tvpbfNtpVdTDB8c?=
 =?us-ascii?Q?mbaYUM/Bs94epdS9LjXVHsjv8gb18dfJODgQBgHwoOZfHED5w01+/285oqJP?=
 =?us-ascii?Q?DpbhryhedXfT9OhrxfRL9/RKyQEOw+Kpqipaw6ZCdJMksXnckHzHhhMhmZqz?=
 =?us-ascii?Q?7+4bauFleX4Lxp+c+6XsBKTFf5iFq5KdP87LLNw9Dfai9x+GOo2Y0pt30uO3?=
 =?us-ascii?Q?O5yhAw+cbBvh2S7A171ESn4d56QMSROI8OQ8SRXIBkXn7RybuU01XFVMoEBp?=
 =?us-ascii?Q?rYjunnyoh0tSxw6eOf3UPh6xuOdTbVAYgi6attxzPe6DRVL9GzeNFvgiiptd?=
 =?us-ascii?Q?VFSHUPzCZoaOdnShS3KfV79WaBMMuGzxhlX+A6vTRQziWN7qS1WWbRk3/Kuo?=
 =?us-ascii?Q?dALYQzlvDhI0WWSLbxpRNBeZ7x56p5YcEhMI19yp9K7qcB3uW47na3W6fPN1?=
 =?us-ascii?Q?riDklNlV4gnC34X7K6BVIhCv8xU7mQRD4sSQxbQZqnBAtGfXLEz2V5shUZ7c?=
 =?us-ascii?Q?NiyfZKOUJJ9UUHesUc149gLxdio7advGIS7zurjoZW02RQQ8gd0pLKZbmREr?=
 =?us-ascii?Q?GP54eKp0JsILzLvswXFX6Vkz5NYvuLDxH7JWf5OKwtXRGwCx/V3lPSS6mvzh?=
 =?us-ascii?Q?PC6HnVnwkZWWTkBf18mCgk8gPP5FOmeuEvdIfdwsWQJmdVg4FR1dmXUGhI+I?=
 =?us-ascii?Q?r5VPBRDgP1wfzPICkQEkrmPPbBoRmJr7y06cQGeZtdAVROFZuuIxhsiPBQ95?=
 =?us-ascii?Q?dnirtPjW04cLjZJkkB20lCDmkV3YO/ujmYH2QS6mC2vU4gEMa3YDIp/47R4I?=
 =?us-ascii?Q?Jm0HNETd67URO0Pe7e8ROtNJicIa+Hi5IC41+vIbQl1AhEh4puhV2JCfO7Pr?=
 =?us-ascii?Q?rVGWDQtv2hwKBYRItLXTuig8OH1gPHyn2ZQKrcnWoKk7O5AfXhXtx4I9OSRw?=
 =?us-ascii?Q?nd6e0Bxhra0pdksaqEnoGpxEnhpXeAEcvmj9L63z2JlKiOamI17OrcfvASnl?=
 =?us-ascii?Q?X2xIYdf7XPKvGNzdpiCyv+DVsto+EsYm0l6gkdksb9MHSPN9LK+TOnln419N?=
 =?us-ascii?Q?yKNxRNArO72TrXFH2EFuZ4rgQmeEEOOFVK8KBiF3udW0yQC2BKs8LiCbc9mR?=
 =?us-ascii?Q?dx3mxc5fN++oLTkM7fxJvobIYqUAKnzdKwtkQWPO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11915bb5-7576-4ab1-95cf-08dd0d651cf9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 15:23:28.7445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qjh49CFD1/diIZDeJGA8XwpiMcKrtzT750VK1cbPJ/1LMtgtJtD/BzKVune95D90F7c9ZcrrFUyy95/d71jag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10886
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_072337_346337_7B7B9134 
X-CRM114-Status: GOOD (  10.26  )
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

With imx8mp-evk board we are now configuring 'dsp' node for rproc usage,
so add rproc specific memory regions.

Also, enable dsp node because it is ready to be used.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index d26930f1a9e9..c732ee79772d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -291,6 +291,16 @@ &aud2htx {
 	status = "okay";
 };
 
+&dsp_reserved {
+	status = "okay";
+};
+
+&dsp {
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
+	status = "okay";
+};
+
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
-- 
2.43.0


