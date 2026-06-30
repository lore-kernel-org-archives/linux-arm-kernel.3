Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E88C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrIUnEVrO7jCHDjplGTmsW1ycMckh/tRa+1ep4SAYcw=; b=gtgcrX9WH6Gu1bPXwOOchlb3pm
	lTNJnzFckSlCxbdz8+FVBGdVzVdRFbGFCWgaRSsNu+h/vmB/XxiLmJhNyqW78RyBX9epmaIiBgc1j
	orFUjYVm3hRh43UBBDFEhJ+y7+Ljr9R5Ny4WNk1tiJ/sd+4ZDrwmDXnZE5ODE7j53IIm2LYOjouxj
	MdvTyPZxiU6XYnj4CbHmEXztOkfW9IqlH/g6B/MiJ8aT4XFGDJauL027uuQcXYSiVO5DZ8Hwin5Z7
	bl79fCL0BBFCmsjsqj+idsFUdQYtUBEl9cTARxtvtX5I4m4sYXQWG88pjqXVPDutFoSVAW9Na2Fnv
	M9Du/0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWHk-0000000GmVF-1YDl;
	Tue, 30 Jun 2026 11:05:48 +0000
Received: from mail-francecentralazon11013039.outbound.protection.outlook.com ([40.107.162.39] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWHY-0000000Gm8o-0dxK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:05:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gb3z/1ZlHdrNBpt8XVVWHW+iIt/2SGLo8Xs5l1sJI3yullUMXuI++KgY7BlyjJeVyB52zmw04VQoZ2F0btfnnSKQbxH+cjdI8tsJh9C/QYhdvIb1GqD2cy4t02aWRuGPpeT46lRKio5ekBILmt1vj3bfbpSomLwdWZd60GcFQoo7l6o2iBDpd5n1p2f+KoSgniGexV1nDpxMABSCwwiTwwv9h1D9G0OXz614lCLUWoGp18KPuqZUKBMqWavsV2ffL2gaMRVw1Wmeb63C12/wLS2FLz5SmYDfkNE9kNAgKekHR7dc2H2wQJ7e7vdWo8A1WWunyW8pp61UGy8sqRvTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrIUnEVrO7jCHDjplGTmsW1ycMckh/tRa+1ep4SAYcw=;
 b=bedT1l/735CtK9ItTwD3v8LCu0MdTrxM5jULvN4H4VHmAZHtaBDK8WHjTV8nSE29wTNaUtq5lksfPX0Ej4/BOwUaBNaY0CK9U04AKt9t3G0zA3SrXJITiCjw4oHNhZSmp0z4tFaZ4Qzq/oZViF6qDVsYM9ruWkZc/GeEwj1ouMFIhICeVKP0iJis1GOrdPEetYmumaogKTYBf40Qvy/tJAjNQ9S0xOEqff4y7YrxndMfNOBqve6Y5ln4ohTu3MA/QQGvUUXXhGUWyQuuT7Q/W0lAH7ZmY7Zla56mFAdIDkJlQo9T1UPIsHI+/PFPIw2R5E1nxZzeOrt2SHlfqgGIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrIUnEVrO7jCHDjplGTmsW1ycMckh/tRa+1ep4SAYcw=;
 b=iqo1jNm5Hw6+2iChYZSZ9GbpiDf67U5P/6sDbyj8dM4VRfUGGmfViUXKEQRc9F5cs7yMHX3Vb7sf/32EIy/8EgEvll26o0IyICleTCNSTNEn9yv78t8/beT76kdqa3cj9CPXsGt3CAAnUcWzbpj1VS5BjaZxnitsD9m39Hzh/lIjJAAHHCObqgADKfcA5/IkKuf+Phguc14gjmebMXhcWJSJvnKlPLhk6CoVEtyzUmiKkz2+/ES2Thj0gbS0VHJq7Kw+sbUVvDFxlP5JVEgudtsxoZ0eniZ3boiO8cQWGfK5Qalu0cMchzjz9zZZTvBgpv30s7MoF6IsjbX5f/yKzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by DB9PR04MB9675.eurprd04.prod.outlook.com
 (2603:10a6:10:307::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 11:05:29 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 11:05:29 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: ls1088a: describe the Lynx 10G SerDes blocks
Date: Tue, 30 Jun 2026 14:04:59 +0300
Message-Id: <20260630110459.516364-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630110459.516364-1-ioana.ciornei@nxp.com>
References: <20260630110459.516364-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0338.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::11) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|DB9PR04MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1bd2e8-d6b0-4e9a-d734-08ded6977f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: QY4VSCcS1jQ/6RgAK3vrmu/qy0lck7ICrQGi3CYsZD8JhAXMgsVs690HOtH6hpbJW/LNpzpb8k3C5Y9wxgJPPqOjDiU0c0Pp31OlO2wj2nu91u3rTSpJYptLBJbYhYboYbn/8MiGHs5zpXOwXL8iCzb9aaQ8pEkaeZHqTRIChW7Df8tqIOZoFalp4+bpCaZAop/pYVA7vk21ClMwkurJtMjmnkyoUlZnRZtsiziPdNK5BNYP6q6TvKA4KOLGKsXZACQ1yrgxNevkcC+zrRU/4iEIFJKKYdOfV652WAmOesrnTV8LEDYsy5XCzBqM3txcBr01TvhuaEOrdXy61DX3m3yuENJ+jlbdPNDLP13OSVJzOy1tPkZyZc72B4ZsbpGznuniMvO/nIw3rlnAYJD1slkah0KB0doYy+xYa+LhX2q1SWhT6cBoOaDvmUnvZQ93Z7ixPZK/QIXNGIzKrFSplGGGTw9aG7pkRLRlzoYAfaBSUklYIRrkfpEw2tpdFQy0qbdrpNnUy9X/5y5VHJGbxC9piRpxPihRRs2OY2/1hwRyRnRU59QG9nElhemnIPBBY2xw30ATm7uuUKvWI5LQoAQa+Ad/ga8HeZivdjsjAlnRdhCWbPuhi3vdl4/IcIiNXi0Ngh+Fn1Oh1kI1Wx6s2c0dPboNaXfiiMCjsvxSBdc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AlDEt44Tz2jVfXqzQgdreFJY+mQHPjkfGzm3JJfL5s8i3reQsR6yBt2fPrvk?=
 =?us-ascii?Q?bzbwuivalpCL+hk9wRGEXIaKZ+9ZhMH91QuXsI9eInypezcqElHlQKegCBZ3?=
 =?us-ascii?Q?CIVO1nYTSDZTWJq9LwFQSW0TC2JPG2QKIId/DOTspRAYF8L7owC27LVggUww?=
 =?us-ascii?Q?97yn/EGHflGx4hDKwYcyUAMVRwBIf2hrfbaOHhsWJhKyVhlEIt1nOed//ZDC?=
 =?us-ascii?Q?1ijHPcdo6++NDaun5eCZQXBlDNhXC5SZSyX1XhJq2Y6GsjNia5KDOrhvgP0h?=
 =?us-ascii?Q?WbtHJCzBKkTewLqkyw1niOxle0r8GEz5WXmw1iHdgiIXBLoawUM1Ki2g8KhT?=
 =?us-ascii?Q?7eE2PlYLLp9d9+IE3J97lchAZNcbxJPYoREXOFSK5SnXgPeBUHkj+FyhzTYm?=
 =?us-ascii?Q?HSgaXa72rxrafflWWjclG3PPkn2nHxvGtQwaF1LtSDvXMv7aTc4LzKGxGVdP?=
 =?us-ascii?Q?wfG5JsDgvzX9dqqJ4HIVBjWA4S6BJWD3ZWEgl6ZZZUv1sMdfqxGzQP77bwO4?=
 =?us-ascii?Q?ynJT8pDNMv0SMd7tep93ox8udZe50nOl2ubUgti4MJ4McVA82fJwvFz9ZKBe?=
 =?us-ascii?Q?XFwehHZxAJ90FSZhgInyLZ7JZ6LuGOZOE5uguwByjBj/IxSh2MV18AIg87w/?=
 =?us-ascii?Q?xZHvpDi++N66ev8St0GZpMrEfdUdxd9q6yvUS3w/3kSmpiCPA+bFWVOvGart?=
 =?us-ascii?Q?DLO6JiVTjsqIuj5UIPMF/l2tYcRy3UO5dJWoOOOheEX1+sxRaE+rWVFIEUrt?=
 =?us-ascii?Q?S9P4fJ0BOAG9Gwuif9bGKVCzB5DJlnf34KqAQiC5OtbI1Gf/MpUZ1IU67OqZ?=
 =?us-ascii?Q?71KdCf4AgJCsIaSBCqn6shFbn3FMBhZr+dxUvySXOBMisRTFeAvr3jODzum1?=
 =?us-ascii?Q?2woc83pJsjWqIfJDedTwFv/NU5gOez4O0YfE0kmxdTgR6pFVI8lKka246BXx?=
 =?us-ascii?Q?i6xo9NAKs5tQKZRnyFIhsAcRsz9xd/nKM8Obh68x5vqejvBdUJ0607AFM1T9?=
 =?us-ascii?Q?iwpv/aT5LzsQv+5+Nssd2hkWz/fV/N+yoRV2XTPa3HmG09vOXy03nmLaaRrr?=
 =?us-ascii?Q?LOG5wp/4Gk5ZPG0LrI9weL+xqDtUEwdJ8wE1bZp9kGhEl1zaMGTlmDADwsZh?=
 =?us-ascii?Q?TdiiczzUCH+alJrCC2HgiDTeynlkw6JAEWjkcrBzgpoWL8EvH/mNJXsLIDII?=
 =?us-ascii?Q?4+k7vWT00T+QgrWFX61YSKDpOAQIUXZTgKPl4yYXMshL8bZugp0NmXW366mV?=
 =?us-ascii?Q?3OY4T/DFDju5TXjPpjmOs5MNuqvPDdNi7j7FBzq0syaYkILEtTeQvi3VLjHr?=
 =?us-ascii?Q?MFv9pZMBB31Tq0KXMPTG1wd0v9OV19n0iXCNQrefV63/YSIgd9SnxpYNzrze?=
 =?us-ascii?Q?A0laXhbtYlY3GT8oq0a3AuYwGLi1UFdNBh/zkPcWTyjwbRYZDNG6kJx6I/me?=
 =?us-ascii?Q?PHx5wbQOfxxQZaH6G2sb5mj8+yYF12l1+e2oCCq06xpOc205/tW0o+TTJxwG?=
 =?us-ascii?Q?h3djO4WAUSnnU/LtP80p9nTqUrSxCObNga5yYmoVhNiuPQyKAfQK11qZs+zy?=
 =?us-ascii?Q?B77PVddZdodPliRIl4lJzjb/trfG4f/YhBsrnI0eqlCzfUxzCtKDXts9JjnW?=
 =?us-ascii?Q?zP/6+7qpLD31j05ZhW6JKTCQAJVLE6Vw2cs40mOSfYglTfNnQUX984YOE+EG?=
 =?us-ascii?Q?lvNoKVjmmOl9e2o56BXl34m9uN3J6tl3snlOAixIZJcKKeQipuVnK9oRQsQA?=
 =?us-ascii?Q?NAczOyqNiQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1bd2e8-d6b0-4e9a-d734-08ded6977f1d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:05:29.5522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpVZUzh2mJIQ6IdIqCW3hqDzuPTzq60k4cT9dja6RfejHZGG3INL+PRvDAD+zNk62p1MTVepwCoMnB2kuMTKFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_040536_241665_30C545D1 
X-CRM114-Status: UNSURE (   9.68  )
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

Describe the two Lynx 10G SerDes blocks and their associated lanes found
on the LS1088A SoC. The nodes are left disabled at the SoC level; board
DTs will enable them once there are consumers.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 99016768b73f..dcf13ac1fce5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -239,6 +239,64 @@ reset: syscon@1e60000 {
 			reg = <0x0 0x1e60000 0x0 0x10000>;
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls1088a-serdes1";
+			reg = <0x00 0x1ea0000 0x0 0xffff>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes1_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes2: phy@1eb0000 {
+			compatible = "fsl,ls1088a-serdes2";
+			reg = <0x00 0x1eb0000 0x0 0xffff>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes2_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
 		isc: syscon@1f70000 {
 			compatible = "fsl,ls1088a-isc", "syscon";
 			reg = <0x0 0x1f70000 0x0 0x10000>;
-- 
2.25.1


