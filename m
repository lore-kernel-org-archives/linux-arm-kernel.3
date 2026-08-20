Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B066EC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cp8HSdmmR+14SDCnBGqQ8apDjEHM9QM/RW1CWl53Uu8=; b=bXKB2mVilp4jgVo33++3fWjsrk
	lK8lTYtDJvLFv5ZdmIApX4kN8XD5Oz8Bp/DAsv4oz6JtAPPcK4rIUv6ntmxMuUfbmyJ/CGd6KUYQd
	LC9aaXTOpE3IGQCbj8m96J5FZsPsFCVIumBA5RdlNT16NBID9DnOD3aB5kWOGnh6v1ynLIAG5Erme
	/B/yIDhA6CIm8cOuYawcuGWaSFzj5UiqGbVPuzGDnYoD5JOEMkpgOZoXRx4dCJ1FLx9/aHYZA9rj/
	v6ESC86K3uXYHsaIGPz7nf/Tn0PC0FXPO0FD2hU44/uyK0tY14Ra5F2OckgC4SiI9cNmLC5PO7BV0
	mjnVIFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyCb-0000000BAA0-0zWG;
	Thu, 20 Aug 2026 08:32:45 +0000
Received: from mail-westeuropeazon11010014.outbound.protection.outlook.com ([52.101.69.14] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyCV-0000000BA6Z-11e7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 08:32:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTMsZZY+u3M6id6Bi7yPzxGvZ9/m4YqUxXaJFT72azZLrUTDfq+NLdk7/Ji9DjkltsJ29h1kPcnguFhT/o3lERKht/Te6EHahcDbh/IFsXFOp0n3HFXvI6BBVuR1GdR86+A4DU9IQkp8p8lyglN8oqJFJwWZgqMHwia5gtmUHjFZC1YU2lRLUbsKfQJfoTh9cSCCHsVIYLmOV23+FqUKFY4s2HFl5M/DAugTCkZyxUZuDwY35V42jVzDVeTWoDL/u2uAzS+7oEfJ+1nZYnjGLfvSpP2OCOQFd7WjSVqSfIWhvfBivPqoA6fMwQwDDi4/Al4qUUJLWl/MdJOemvWIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cp8HSdmmR+14SDCnBGqQ8apDjEHM9QM/RW1CWl53Uu8=;
 b=hIV8SUDl1tqpVbzUwt6PXc1Wg2xDf3AMqA7jBfftmm7cg3P+lgPWSMZcAls/pHnq+gDi+zfIlEEjHAohh3G03wxPooGqp7H2tIKRxdpYI2GsR3EANrjBBo6pNEngRAbtvFwSJ51A3vNUiOTNUi9y4TWIlNZ4KNFrCaD46RsZeWrsSeHMOktmobAHTfuxsifdFIaZFTwchZNgHSArsG6hHE1lj9c/jzdnBVHYhdlzOn8V+/LEyWs438b3CytUUXJ+wXo9zAMsFlW23boaI1mZsh5xfOsCoCqg3N7pJp2w1cHjSwsbhqSjrfIbSab0ML3m9BEGu8xuXX/5M5RKMZ6qhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp8HSdmmR+14SDCnBGqQ8apDjEHM9QM/RW1CWl53Uu8=;
 b=ExckCRk/fLn1Sur5iF+AaMqX8LmNWiS+rWL+kDo/u8nWmnGeAZFyBznNKRm9QTi23sLuMhd1pcyGBYbVa4AyEzTebQqCEFQBIKRjgJ+/Ugt2k9cqymr5Hb3HvdTfcx6Xv5Drc+x5nGIBAUuOxVOGIiWx1a3vJKXxxOyudENjY04wfEvrjWLPAKVkY7CS3iUB2Oh/bnABuDc1QkHdwiw3fwV8GsxMH0G3BSPX8Zp5tbBB3UVIa9ctUGg2U+1mcc6Y+YTPXJTMdoVAt+h10XAM5DZjCzRYbUZqYIKuaCktQBswWT4LvuSNmp/1kNy2cTGg/3mwGkh/SFf9+hOxOTuzag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by DU4PR04MB11727.eurprd04.prod.outlook.com (2603:10a6:10:623::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 08:32:37 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 08:32:36 +0000
From: hongxing.zhu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window System RAM overlap
Date: Thu, 20 Aug 2026 16:36:18 +0800
Message-Id: <20260820083620.877251-2-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
References: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To PAXPR04MB8096.eurprd04.prod.outlook.com
 (2603:10a6:102:1c7::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|DU4PR04MB11727:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ebd4af-a9f1-4bab-2d07-08defe959626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|11063799006|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: w81JSCJAFxcm7LlEY4ZB21WW5wEkR4C897sncVVBzHnemQagaw5kCPyPvQ71AMTSH8YJtPcc70Id9Qygc4JZzqjDiRqQfvaV0Ua0WVols5G/cB6znHMb9oE0pp7i0N0ta32Xm7c6Ab9Ii+DBBCjAg84FxfL2hAMKC7NGZL7flKgWDPfWla0pp1OKX3HCICGIh5uisDos7mnBSBg78Tq6UGxvaSpJ/tncoDyHxoZbxBNBCFVsLUIU1+u4UanG076DgMMP6qfCiimOIfJHyvBXcuRD/QZK8Cjqh+D1YqhXSmYLZWgf/16r4dJ/FOekbbuv08DsQrJV71p2JbafPEpBCed/wfqBQiuFYT7i+nHRYaSpsI3nf3if6bqpVcySOxqIjk8ZzC3Ttl23VtjzP7QaR0594nGrYyZU3sBJOaB4nN6BTLeKcqkMpn4UNaVpKld9sz4gbA2k/wWcjP79gTJhUUaflxTUeYIIv4Ufp4RVJEQpYnp+BdoPPSHmIYHJd/DTRe0kiKRwzteoBRzPXgasPTR0dlxVKlkd0D8QZ+eJgRNaFFo814DSmh91vTjTYjRmzJe4QYFg3MYkl8zP2QefwBmgvMePu3t7jTe2YWuB54EDIhH13lTknn0b3W8pPXGVwTtmq4KuUSsXYERCBil8PqnYL1w0e/merXgnqH9Usds=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IheBXuwxUlM6+ftyC7ksHts+Mlq36O91VyF/MPBvzqZ8oFdf29mgKrdKgQuz?=
 =?us-ascii?Q?SqBLocoR3XAgL6kd5bIRsoB9kA7C0UyJveTSZptX1uji/dadncv4XoWF/oon?=
 =?us-ascii?Q?k+D4VXut2F4/kTOXSnMMEiWhrafWNiDt3Mu3+N0R2LQ38ygyk32+ADJAWJha?=
 =?us-ascii?Q?oFmhlWYTtw+wCe8UzDAX6cmkAihm6rU9VgdWg/iiNLL3OSinLZpvhuCAOvp4?=
 =?us-ascii?Q?ti8H4ot3xggjFfp6wtVuqVon8hS3A+Ae+OONgzEWmD3rFfZT6VUdL5FJl2eI?=
 =?us-ascii?Q?JKb766L4oUaJNe39pdkhv+7vx6ZCe87/lHLiuaUrxZwxnodd7xDRYxNmxw/z?=
 =?us-ascii?Q?v/am03RqNLZ31uQnGbpxMCPELJaVo4HlJ6r5T6e8dgfrfz9jyMVbWJ1HmG2L?=
 =?us-ascii?Q?xua6Mh2gAWTdkULf3rDchs1WP4UAzpB5J1jzJKqZ1Eujqsy6nAmsRBNeXIzT?=
 =?us-ascii?Q?WyDOOMb7xJQ9gI3QqEm+VByH4Rpv2Q8Ra+ti4QiZO13o/nqBVfZMrkcy3uYX?=
 =?us-ascii?Q?xw4SnOuNGgoVxuyPxHSXXF4QqZFxlYMhN2E79IdcaKFWSMOIFiSbiP+5e3uj?=
 =?us-ascii?Q?HHT9MSCCCr4KfCl9kl1nM1At2b6wBOCkV5GwoUhAwtBnv+xLqULjlzS/8hKL?=
 =?us-ascii?Q?D5bXs9mbYY6BU5pLKntpTflp/rLXFYCMpKlcqSD8nN9u2lVxGyXv4dQq0DkM?=
 =?us-ascii?Q?RDVydNekh0kh442vGeIqIx0UkI0i0Jdl3NTkBm0jqCWsca0CS5Tw2NMG5WUR?=
 =?us-ascii?Q?FkFu/ueZsVm1d37kx5LtD4lZ/fAKsCgsNUDoMu9JzgtDQnebR6vmuoOZfJ7v?=
 =?us-ascii?Q?Ak3uSMKBpV2VMgXfXxZGLcooSRmRvDQoBYQYJoznzrcPdJeKIuztAMwPB53m?=
 =?us-ascii?Q?xpsCRj73lN2Rv4ATM1VLlDEWDZ6+SprmXWaIwTD7Euu53aGnB79gN5PijNyo?=
 =?us-ascii?Q?cKZvt5ahzfx0UtOQFlO+xhBTEuPi9z2KodBiidQQ+iF78wRzxFp7cFcfbVBU?=
 =?us-ascii?Q?7T98/Bi/eLZK2J39vvrS/1lastEnBIIpbK0JFlBqsPkPPInRFLzJpsncT5uR?=
 =?us-ascii?Q?xEhcYf9EqXFmf3vduj16CutLjhXvmVyslSRhTqZn779DDwp4vWHQ6rzMSgQI?=
 =?us-ascii?Q?ypc0oi5JYTRsdvzdi4Y3ut4wto2dcEhLXo5CDL9w2X2Ubdy+ESQf2Q0RuuF2?=
 =?us-ascii?Q?XcWe4puU/jLZxgdqZYBgBBuftBlnJByxKLjtjylHWXG6xh+S38SzwvL0WSit?=
 =?us-ascii?Q?TvBaADaz1DpGSCTyE5bdDHMp+v8YOKhx1EVeZbybYA5GEpJXK55xmtNDCee0?=
 =?us-ascii?Q?qUTIeZVpvCmr9Ko7Nq767NGZoZWW7HQIKtI8xkJTxd4HM6seFghzlrbNPOcl?=
 =?us-ascii?Q?gFqRgzeMHSZjMuKMNtS3cCgTnlNG80YwPFVHBB5/VRl42/WAH957qe6J41H+?=
 =?us-ascii?Q?b3ye0Gy4n194VydKVQRvt06EIpdGyYtXcMaGwIMqxxrOWSkPVcbKObbMs8VQ?=
 =?us-ascii?Q?96JSSCCtleDEIq9ncvSzZ8pYrjcHfmZEW//wYeonifuOZ7/smFfcL0nk5d6I?=
 =?us-ascii?Q?etdgDGA9RiumuUmTvAw4CphFPzLa62qdkI6exjjQHW1zwylolNryvwFQXkNa?=
 =?us-ascii?Q?gNaVApm4nd1c7xhTQmjBoD8S2Y7Xt9aoyWe459xaxA7PLnnUvUfJQR5qWdoN?=
 =?us-ascii?Q?4uv/Ku6MiRv5z99JeB88FATgP1veAhlVKEi+UVfNKW+AyFXVG3OwlCDGrJFJ?=
 =?us-ascii?Q?TPw+HwHG4f710QPD3qI+weqRkNveQHNNZ9lqEYq17yTnibkA9TnI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ebd4af-a9f1-4bab-2d07-08defe959626
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 08:32:35.9454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QBsXfWGd+yF+791X3nA47BWXAqAAvxF6KKGiTgbG4c+2ucvOuv6lmjFNyg4X2BsboqT0pKM79VBkuEoPTv4uqIvWxMI/U4LJ5ZyOl5mQp4XKHKNGvKaAjZgRdtV2HX8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_013239_285529_AE53E7BD 
X-CRM114-Status: GOOD (  10.07  )
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

From: Richard Zhu <hongxing.zhu@nxp.com>

Move the PCIe non-prefetchable memory CPU address from 0xe0000000
to 0x10000000 to avoid overlap with DRAM. The 0x10000000 range is
reserved and safe to use.

Fixes: dbecf38e60d4e ("arm64: dts: imx95: Correct PCIe outbound address space configuration")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 38fc47024841f..0f03b85aaec17 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1948,7 +1948,7 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
-				 <0x82000000 0x0 0xe0000000 0x9 0xe0000000 0x0 0x10000000>,
+				 <0x82000000 0x0 0x10000000 0x9 0xe0000000 0x0 0x10000000>,
 				 <0x81000000 0x0 0x00000000 0x9 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -2039,7 +2039,7 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x43000000 0xa 0x00000000 0xa 0x00000000 0x0 0xe0000000>,
-				 <0x82000000 0x0 0xe0000000 0xa 0xe0000000 0x0 0x10000000>,
+				 <0x82000000 0x0 0x10000000 0xa 0xe0000000 0x0 0x10000000>,
 				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;
 			#address-cells = <3>;
 			#size-cells = <2>;

base-commit: eba4724641990bd9975ca10ababe726b6143f0b6
-- 
2.34.1


