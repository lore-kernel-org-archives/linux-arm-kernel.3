Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF414C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=el4g6LpGB+hnV+wYyRw3Q9HLql2HB9OblDgk0fnlV70=; b=vb7ddJfi5TvvIWFNfYRBn1QTzJ
	8vqFEA761lQYU33K10UkFukZXKBafwxpDGWZiRudE88P0pB+960GXuz4jblE1HEGyf1PD3ZalPDzO
	EYMWjUyejkr+iIkU60vf9nqj9DLbgPJy+9wBgx9MzW44r8zuVjVYt4+r6FNx5e1zvPwAk9wu1Too2
	MTuv8gn4JF3N/5vvqILCEBjhWWMA/qp/+xv4KDtvT1PQ1uBkIeOFXBdztlo3sRZdoOLz4jyBcpp2g
	0rZ5vTXroJ3/VkMB3FxlBYLQ1ipCeWXspeWMOuMyNrqId1Fc0I7RPlVlbkJ4cdljKpSo10lJ51fKl
	YFIRfytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnuf-00000002t9v-28Fp;
	Mon, 07 Jul 2025 15:37:49 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnqt-00000002sRr-1QQj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:33:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zC+2jPW5GrRODvY+ZnWRHu012OEQoV0ZlAUmQfUGWi/V4nDk5lhYw+0DvOnpLjyQZyB4bkH4rxqFhnTxNOaj1Pj7W05Bsa8VPRRtEUiiFLE4WiYdrwf652oC2W37yfLGeXO3D6bQfFHdLYEvYeZFCEpXRx75D4Cu9dC5rlCdXRIDMMQQFg2+xleyXRream37ht4JQWq8gVTY2ohyIsZnuDTfOqRynETSNI8FS9D5Pbb+J74NkDf+AP2dIMlFZETAO5RpOSXGTsXidpIxOHbn/57J/effHuLSI4La1uk9ujaykRSjGtsWPsmyaDo3zT/3qD10AbHJA5anfiT5fbSL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=el4g6LpGB+hnV+wYyRw3Q9HLql2HB9OblDgk0fnlV70=;
 b=cSgLY5C4A83tJ/k6v6/AWuwIma0Upur32IOyvVV2UxGCFZmu3S4fd7pXD9l5vpqV/UXFcc4gLr4GE4ZClFE1WrgrOTghMFyRiuwHgemV2hwpW0Fyctp6BhfuLtFqSoc6n6z+C4qzuRocXlSzlyfDXeuHPaWJCEnGEa7aPXOp6+zNYaM8zAH8dqbsQziF3j/AhyPd88E6FXfzJA7vjd2Ib6kSNzyd6l1W8909jZyyBgmtE3aq56KalDOCZzCgruup6EQ8bEjiASywXBmTnmi2DOz9WWUFVQCEZWT0J970xVwqH2qjB34RYDDU5e2Scq+sACBkDl1+ZR9mt1IkonNT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=el4g6LpGB+hnV+wYyRw3Q9HLql2HB9OblDgk0fnlV70=;
 b=A/EBq3BMdQF9SAEzq4mVV7wGU9zDHAuIun618/f4TD402w8HRUDl0RKehnEkTUEV2FBldr2VaCZrDIkFvZhcNqHuGddhyoVO7LiQruhVsBiUbJbSu2FMO/GPnd/IKknAEB6yxNUu/GkT1LK6NwbUQpMzaIDfKFswjyasmXWXUqQ0E0nWxSdIs6P4DXGrcFPSBWOTsWF2BQH6vPoaaOY15b1MlSHKZwNjsqYNidBfxAaHQ6NSSwldHES0yIsGHBNF1M6R2DxHnd1FXvWurqDu8/Q8Vvzsf4nA+R7C0oqbuQXpFMACa4tvYWH+uUMiZ35nNFC/eXOssQ3RovlH1A5kZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB8449.eurprd04.prod.outlook.com (2603:10a6:20b:407::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 15:33:45 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Mon, 7 Jul 2025
 15:33:45 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: lx2160a-qds: add the two on-board RGMII PHYs
Date: Mon,  7 Jul 2025 18:33:31 +0300
Message-Id: <20250707153331.1372606-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a271d9-b43c-4eb0-1c0a-08ddbd6ba91a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yLAeFaZgsWKYXs3Hj+3sTVTqQFpGh6sbFy1RXOfvLCQC2J//48o2jCzSudj6?=
 =?us-ascii?Q?tpHW2IVEYpkcq+fKZ1fY43JP3c/NxyJJRQKpq1WJAIuxn+2Gd0Iv5vMaV2eD?=
 =?us-ascii?Q?0A6jSiQR7Gu0ixtkuBSadQhJy2OrsoeDOV2n74uI1wLr5WBtMAtBbKsccyjD?=
 =?us-ascii?Q?gl0qp8ijP+3yCExEPz1WBWzX6UPXe0ZIB1zKXRDVHHoGskmBbHFl8ty8IRwp?=
 =?us-ascii?Q?cF7l86rSsDClAuiLEryYUVHPh9h75fTyjm9Ueo5jIT6VFu0pEKUXG32Nz94F?=
 =?us-ascii?Q?8EWLo6xVaR96xaWdOg7X0VnF1W67T3Cj6aZuR1Qr90YU1THs979Ds4AyWjjl?=
 =?us-ascii?Q?YjrjewPTEB7hHsix7NJi99n4qL0be9xfbiWNfPjrLmbxjDi/7TdQDkTzjbWg?=
 =?us-ascii?Q?GyQIfpvr9/22XXiVYyPjIt1hqjT+h+80DeFoaY4zU5P9/iBby9/TcMVPqXYZ?=
 =?us-ascii?Q?A/785QBgBCKgVqujERG/iU4FNUiK69XGbT1zyOrcOIc/jKrqB6sli5c+tF10?=
 =?us-ascii?Q?16CL1osswiYnGxijp3o1suZ+8jjFEKX8BPYsbQopKCwnadZOIzzh7tlG0+wG?=
 =?us-ascii?Q?eB0nkbx6g5Gfjo9zs08pEFZro/f9PkwqkDHUHPqKga5oGjTa4SFWm8tgvDN8?=
 =?us-ascii?Q?IAmopgSzONCH4cnxXFSfhWdc9VOl/UB9oFk+bE3GXUOguFzLUXv7hNEqLbh/?=
 =?us-ascii?Q?kwDzAQYADLDsrqpx8oLorCYP6r0mHT50ApESKxDLBwh3cnnCWVw+nUs2zQ60?=
 =?us-ascii?Q?LDlKiCclv4fIXgmYaRNEJHqosoyZjKyY2C/lZ4oexOIlFMa0oero0Pm6obFr?=
 =?us-ascii?Q?6TkahUY+lGN0u1KAJWJHHTTOdg+TMVkTgcSVOStMNqloQEs/l1dc4Mr3xy2y?=
 =?us-ascii?Q?hNKB0zsx430UsY/8Ib3bZIDHW4jmysRqm/jwnsztteJ7LID3CyJwnFia3O9O?=
 =?us-ascii?Q?h2rSUY9ALiQFl5+HVjG/Eo4ltxM0zxPaIZ/PU7Evz9UlJDyrVHk8A3dyFJBv?=
 =?us-ascii?Q?z79DPUGUl7l235ItG43tN+32lyTpuBuoj/IqTtpxVl2JBHBo9E0zOLbIx9tV?=
 =?us-ascii?Q?w7y7/M2DDewNWwFNxvlifkAjNPvFiaOCJY//ackrHCku5dD28kHPzCBJY5Gw?=
 =?us-ascii?Q?Ar/4j0yOW2R/Dz8xtZ+OB/nTctje03qo3JOvaHhbOQgWr2R2rT+i4ts9WLFK?=
 =?us-ascii?Q?OEuNWDtY7qOWnOUDUHUXmP7CSwQZnIMq4ClDCS0mI79n7K1NIhV5q5jSRF/h?=
 =?us-ascii?Q?F/+Q9zd3OLpo9wqpkdWbt56YVJ6VziAp6O07gCj6UN0AnI5KcQ1RptrY+LT6?=
 =?us-ascii?Q?ehMZPbBSXeGq3nyQU3rUkBL8idqjy+RLxXDeqIdN7okskb7/P8SZ/XJaWhzd?=
 =?us-ascii?Q?g/Tupa6u5qANBCCZ+v1IYXkw5t7ERfYBO98pTXOswf9jxwxUOzQTm/JpQea1?=
 =?us-ascii?Q?MNS9yl2GHas=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gVGfLpCadsUKSVJ6N7Z+W5yn3vNrk5CFBU7WwhJlsmoop59HCPbTP06XL2p9?=
 =?us-ascii?Q?fqy6cbZBjaR35p+Kcg97Eu8t76g/hMDKc42MBL+bJimzVMggiuZGNZmQzjku?=
 =?us-ascii?Q?ZBJ2kncFL8bv+9yX9+5KlkJSOvE7wnQKA6QMBn4OrL9Pa+pB/Yp9WIV5+6oI?=
 =?us-ascii?Q?6Cq9Ht8d9xypiXiICG2os7VYQD5VGIdEgLnMjhHph64FDn15989X74HWJESd?=
 =?us-ascii?Q?UM269bHjl7LJARAWdGWTD5+XihLBxCwZkO1JvZNxTU1cnKJie7wj5nxrkOvU?=
 =?us-ascii?Q?RX2Vq/zEBplHQEEaCUk7zZBNrfkzE4W7kPXUvD6i1BTkaQjuMz8Op+EzuECN?=
 =?us-ascii?Q?GTWFDg+KZFh/zzwPKpEBMlcUU6xbGUnPSgH0ns3iZlDIQwl52FSzXpdDwqOe?=
 =?us-ascii?Q?e17UGQLryUE7bbUMkirD3GImhOQ1sVah4ZgLiFUtUk5sjATJP2T9p+cUmgyO?=
 =?us-ascii?Q?zmbOybmD6ge22xNk2H2UcxxP46x+7saGxmri0y7m4wgCwVOMODvz9z84h+ad?=
 =?us-ascii?Q?RqoxLXwNASRxoRiVw/YADEEfkwoqI0bCvjCABG6YHZ2kAGMR03w2erL5JR2D?=
 =?us-ascii?Q?EIrW5gqpbNX42yvFlbcUrbZsFv3QwbbNaj4QLl3nei9uNp/TI//x+3fR/7R3?=
 =?us-ascii?Q?LEbq3+6mkKz5inayeOTTW+rxmQg6YvPX7EHyZiaHfntijhFvQ3S8iETYRWor?=
 =?us-ascii?Q?Jjplc6LiTrJi29NBgcIssuOoVQsX2MmrPskHshSUF32oq2bI8JAoL002+j3q?=
 =?us-ascii?Q?wBycTZHXWlOzfEvQSDqyrk4dCsdN/RUNYq5lzNGA7uyIF2tpap/ADEvGqF7U?=
 =?us-ascii?Q?Ib6GiuChj+CqulCEmhj+Lv+57V+SAVou0NPUY+XGFK5ApaH2n1KTsfTugg1f?=
 =?us-ascii?Q?80vBUS66AfHqYvjSq3zISGn1sH4BOFc/7hG7267hC73jVegORc8nK9tQPpVk?=
 =?us-ascii?Q?uifDylgZvt31Hkqtlv/GDfJ7hu9UwwNJy1a3d7vJx4Vpa2Y+Gve05KxHgJ70?=
 =?us-ascii?Q?3UOwusskkJezBsOXEbqnzH+y4j37dFakkti2SZcc4CKL6bJ2vsXnd19fpEDW?=
 =?us-ascii?Q?7UHWbvS/QKhH9HEg+GZUPgIV+Q63VfTH3YI0Lt3GZFJDAOoayUBYn5cpwqeW?=
 =?us-ascii?Q?MDQGWUk1EWTFbDnazXBmtQJ/0aZy0j31pF7dDEF1o/5rtB5TiOzNRzhyWhTa?=
 =?us-ascii?Q?TRPcg0TqbzdzN/iOCuD+eFRUM60rRqBH/1hgtr6cg0GpXJJ4UVkmvFdy94EH?=
 =?us-ascii?Q?5N6ABUMXyEzJJmrCrKS++UKsKQ3jLxaENenr6OErSwGmktttMMBzqXB/SVfT?=
 =?us-ascii?Q?e2O+KvLB6wlS9DDMesaLKSjiaze2pn5FLXJFhufpzw4g89SrwSSC+A9SP8Sx?=
 =?us-ascii?Q?DOhjypEyBRA+b3fh1/Aa/Pk0cugG7/wYRlcaWMj8qN6/XNBYWZft1t0QWMjX?=
 =?us-ascii?Q?3CMTArJdCq4QLFP3j36DITnU+zgBRekHBkClginnHst7cLuKYkNaDFBIDC2B?=
 =?us-ascii?Q?J3RMAft+dLjy8jwDEXBqOwsnUPhlO9NWbIQX7UoucDGQQq51wlI/GiwTOAxW?=
 =?us-ascii?Q?LP8k4d4rCQTuZJLqqRTW79KKGH0SWNrQXwVJktq0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a271d9-b43c-4eb0-1c0a-08ddbd6ba91a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 15:33:45.4175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLc2gOxIFbkOpfkgQUWkA9r5mk4xCqRAPYqJwRSJp7Uv6bGIjYI32si1DhsmKp5nkJDjZO3q4xB4ln06jccyDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_083355_378072_ADD2148C 
X-CRM114-Status: UNSURE (   9.40  )
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

Describe the two LX2160AQDS on-board RGMII PHYs on their respective MDIO
buses behind the MDIO multiplexer.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../boot/dts/freescale/fsl-lx2160a-qds.dts    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
index 4d721197d837..2d01e20b47e7 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
@@ -43,12 +43,22 @@ mdio@0 { /* On-board PHY #1 RGMI1*/
 			reg = <0x00>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			rgmii_phy1: ethernet-phy@1 {
+				compatible = "ethernet-phy-id001c.c916";
+				reg = <0x1>;
+			};
 		};
 
 		mdio@8 { /* On-board PHY #2 RGMI2*/
 			reg = <0x8>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			rgmii_phy2: ethernet-phy@2 {
+				compatible = "ethernet-phy-id001c.c916";
+				reg = <0x2>;
+			};
 		};
 
 		mdio@18 { /* Slot #1 */
@@ -169,6 +179,16 @@ &crypto {
 	status = "okay";
 };
 
+&dpmac17 {
+	phy-handle = <&rgmii_phy1>;
+	phy-connection-type = "rgmii-id";
+};
+
+&dpmac18 {
+	phy-handle = <&rgmii_phy2>;
+	phy-connection-type = "rgmii-id";
+};
+
 &dspi0 {
 	status = "okay";
 
-- 
2.25.1


