Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37062C43638
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F34xujeJRcJvATqkaEbegD5OuAr1dSO4o0K6LsGVomc=; b=sLawiCCBI33Px7CNBLkxPrVFQz
	wQY0y2noKQ3hfyhDPNpbii7oT/natdqrIP+9h1XZAsvb2aniQwcT0QDJuEzPBABxZcu9OPhR4wDzO
	lg3k5x1pW5869XbnE6dNIJU9v+l26XCLCTtk5zKbMFDQUtnU76woDA7rSAMKi6kONEU1Nc7GBdZXz
	ty9jYaMOokBdtV26FD6vF01+a2dkpoAsaBoYU7EbrXWzn0A+FobalrQXwqU0HGiiUwRm7pbq5Bnl7
	NqaI5YvbCSqwjYf9gZdR3no8L8zjgchXcfCWqaeE5LbfNpeY0tkAbsMj41TYu/6bqXx6FwTZF/4Gg
	/hvBKIXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWHV-0000000GmFX-2l16;
	Tue, 30 Jun 2026 11:05:33 +0000
Received: from mail-francecentralazon11013039.outbound.protection.outlook.com ([40.107.162.39] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWHS-0000000Gm8o-0Obw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:05:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD2eOm2+4/z9XiP7SKBmMsjuS85W4RAt3qn2VL/7A8wZJ5OnEy+fuVKV6ie5IFJko8teCpcKGSvbtDdmGv96bpU29VspbQ3Is4o9lgcDIOqLWF57wlXOZMktvDvVYn7E/43Ocq9zxDnplnV5GZRhYxvTzzzaKiaoLPL2ruIbCNM6oc2IZRDjzBUgXWX/YupkkY/lZ+YjL8CFcKyTwpDHfAKU9ITyFc+Hy9WZtOgUPuUbFZvCLxG/eLgtqyj8IA3wHri9oOA3Rvpw0oPCqGS08JEKhmNK3YDseaBM3TYvierqfgH1w/dVD3ZLLGMN2Z0iSUy48+g7kqLv5BYXupb2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F34xujeJRcJvATqkaEbegD5OuAr1dSO4o0K6LsGVomc=;
 b=UEHCA8kCNTs6ZugaEB4J2gkh7J2hp4VcRRhb7mdft2Qw+0GJZhdg8oACaLrUc2U2HZRhmXjBbKZMS/VObSrNJEDnea7wsDlcM7CLodwrrARW5jNOA9R/TwwLZTTckg+F/N1wzmUGFyLXRbYonfX5FJwO2rQRSbHuCkmL9+ZD5fuRouAdcNhsFaQCZ71QkhORbkyL8mfsn/BaciIkgo3jLCXvhM3vy7wUMZjcN9BGjvx8rjj/i9vm21+wu48SgbG/Kp7lsGuR+dbAofvb/XnH/78tzC1mwh1IO5T6aHYvuyFFG4oDq8WaHIbOkTWxjq62lNTx0BZb9YOc8sUZlhbQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F34xujeJRcJvATqkaEbegD5OuAr1dSO4o0K6LsGVomc=;
 b=hAeHB9AAySIMKgCy+egJuE0vt9dwtphUX1HhPcp7+eAFHXfeJG72qqCPezkim4RBHgcXwD34S1kyQDD3avUDiiL6pJ2IkJMNrISYsXd2H322FDiqwpfNvnMx/j79uun86H7fsQCADqbokwzH1ZZaTm2W6OEcIhDHJz/eK8K5NugjJwRRpczXw7UGVK9BbdpNPbA/xpSzurSR6KF62XjeUwRtYR+IzzRh35bN6zMY3XGiNpIW5y0U5SsG31nmbPvD1POFWz7Mc4w5xxh9ioaoTCxKDiCAOiEuA2PZ4S6MmvPpUm3MpuUCVOxaI4KJH7824tErg/jelYyEuP89/MxFbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by DB9PR04MB9675.eurprd04.prod.outlook.com
 (2603:10a6:10:307::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 11:05:24 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 11:05:24 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
Date: Tue, 30 Jun 2026 14:04:57 +0300
Message-Id: <20260630110459.516364-4-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630110459.516364-1-ioana.ciornei@nxp.com>
References: <20260630110459.516364-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0341.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::16) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|DB9PR04MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: 734a779b-e764-4fff-8241-08ded6977c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Fro7iZtHJ6Hgu1nGacTbx/tW3FieLUC20FHqp3fnkkvcQwfu3QGY/a/urmSE9tge//QTd6Pbhk4j+fiEfM6FiY0wj0imf/sQT5JmInao3iLxv9bj6Mvbv3niPxdCfquX59lB//7TTVqnn1BiuO8AQ1ERiQPrEFldxegaw+49kbIcc0GkkhYUvlIEfWGi72zJd4c4WccbezXBm9Vf3Dc5bs9gHl3jRt5DWrxL5aBkK1ts+4gkFHcxs+SU1vCiKdwKMHHp4vsJkIz0sOxJAnpHjOShuO3SPKqy8rjwioBl4vUZtkOGPfl01HuiGUIMcx+0vzy0Fom050iTE6Rakgg+k6j2WqLC5Y8/rafCrvK5TZgsSIlFQyWJCSzUqcNKRd62gUWDwH/baoeTSzE1fz0CyagRskbfbsfsFy0SMsqlfpzgtgHSq844nYs3cWztirHwYJEWc3v96DkZkszKBRTKDbOf1uMdVK530pbJJ4ddikMyIA8kcW3GJJo2jN6ygSTsxJTFjCXOpHx0isa0Af3T7Fy7ganjH5X9PM7q0NfDHNUSV7SZ61T6ScSXRH8suc4L26IX1EuV63pHDZdy9JTYbWF7myj0+DgJKUnLskix2QuT1zLih5tMZVJAMlKth5FJVv76O2zAPvWwrgavNgzHznZCf65ZImEOF2Yn8pQilXA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jt2hyEeg9Y05N+ZYaLFj6MV5HwwGRipE4aI5P9b9bFzxwRFQidwcfliiaL/Y?=
 =?us-ascii?Q?0Hj/Ulkh6CERNkSQrug3HbrypKQhvhNGYgfdWltWkFmPqnaySIBJ0CDQoWRl?=
 =?us-ascii?Q?v4IvOSRF6gIDBkXAnNhsD175ndtKNFjsRwKgxlLAhuZPMjbRKJJiipp/5vrn?=
 =?us-ascii?Q?+lLDCqI4oqtU4jL7SOfmDvAwFW5LDZOqfYtM/kpbbUOVoiftx++cDTt+XCH+?=
 =?us-ascii?Q?/D1SxEIsMB1tS6Pp6VgB20rW7eRf2CG3rleuFCsf9SX6mPakp0CLh6ph88js?=
 =?us-ascii?Q?kTpndhGSgS54c1brehrII6LgO98beVRVeB9/WFRpZSiD9Opv6KUp+l3GLwQZ?=
 =?us-ascii?Q?9YdW2tWLN82+4E92pqENnhM7w+B7HleX74JUj+xi7BGPbSDxRoJC88icPf2c?=
 =?us-ascii?Q?gH1G6+N2UtYspL4ZBkXnImczjCSViKY23jTpPwK5Az/c3nA+WARDMpO5CNgL?=
 =?us-ascii?Q?dd8Q47x1r/86aEPke1ZtVltAPPesUViCIHbk6csMY1xujjcUkaITvA76F/iO?=
 =?us-ascii?Q?xRElUPyMb/87Her3XNkPbln27DeZaN7rBSVHcJP5f+v5H2wkOZe0czQXlN7Z?=
 =?us-ascii?Q?YZVeLFWkiI1IMkJNHPqzPevnxyzpJZKm2REFk3cyE1V/okFkS4UQyyc9vgcc?=
 =?us-ascii?Q?/bs1H/Ph+hLLp9SlaVcUjnQP03j715GAQWdcY68Ut3yVfR5yZSQpjSi6Wrzl?=
 =?us-ascii?Q?wMshivq/m40KF13E77KrlBODvzaNJG5/5skEExc5NTVhUueHdGfWOBeieR6S?=
 =?us-ascii?Q?j3GXWGDU+dFcQ+JN5rBUJb/ANnCZ4WE5F0esKObCOe0yXG2hV8YgBv8l/a+O?=
 =?us-ascii?Q?kmFybbFC8PJ85wEmkU6oq+YvXmPS1Ic+VvwTqRv/cctGNxBsJP/GZWaHWR6j?=
 =?us-ascii?Q?5/vLFQhkjyFJtirrNkX7wUQ6AMzckCVRC4Xsr08lrU6+TItboAhujc+RraIT?=
 =?us-ascii?Q?pnnmOa6hM9cHOyfDC0+42JrkM6pgWAgvFnsQDRHUyu/dC7i+0fARrvjJ3As5?=
 =?us-ascii?Q?e2tTFPmpDsIJ90Apb5taDTPBsvTBVlloXoJEs1i9qSZxf2TNS4mfthHKqlQA?=
 =?us-ascii?Q?/PhMDP57IxZ7X0hunRJgBTAEMaahHcTFvPrbCTQz3hfD5eLmTI4ylZz75mYC?=
 =?us-ascii?Q?W/iFiUwEwjvtpH7loOywcmNp3CQ0qzubimCQi2rO3WvLzas8Ydl5O1jRr2+C?=
 =?us-ascii?Q?1Kr+YM8yrUNs0wLOyEPfY0cp8NKP5qYN37oLVPAfGAdpHdvpToWaL1U78g7o?=
 =?us-ascii?Q?QSvhzN8nchpG6+LSQyco+4wuvoPjQF6icLaTcUigGsFBYTGj3LnSxKCCohmk?=
 =?us-ascii?Q?YVDbqJb8gqLZRwEcy3WaiGG5ly+0ZLt28szRkBWFwUy2FEHgBJsVXUjoerOo?=
 =?us-ascii?Q?CNykIkgr2szMirjQiicqsveZ9GzLi4JKoLYInCiQWB44zmtTFJrh4UmEEPSF?=
 =?us-ascii?Q?T/LzY22EnhioaURIK8Z8kAxn36wH61np0NfzoZEwqJOTBovqaeLhtzll367R?=
 =?us-ascii?Q?t4gKgogOoDIpzp2wJ/EDXXhHJheBZn3doaeZ+aTz6pIpMId9BQZT0n54wqKy?=
 =?us-ascii?Q?h4t9hfXlxO8xCWLlWUt1Lc8+e4LBJC2uGdMaL7MUKnbaMuGjExeXY4tFFkfU?=
 =?us-ascii?Q?ki5h9pNI3gaCLMpwOoNhNbXFaO/vj7skyzqp2KfEnSOudgETVWJadCfM6WN5?=
 =?us-ascii?Q?2LxwCkukfklBhsO0cW6AeJQ7XPVoWBWJTjdSICdNmYZAyhFylpv/LeYkqDm5?=
 =?us-ascii?Q?y06aKJmqqQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734a779b-e764-4fff-8241-08ded6977c38
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:05:24.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TS2p/W43OXrVDI59ZOkn7EqdZJCLzwCU8Q3I+WMkoqShg52sieP4WPzm2OT5c99YWWviV38D67H4rdmEM8wuWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_040530_150678_8E89F88A 
X-CRM114-Status: UNSURE (   9.81  )
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the two Lynx 10G SerDes blocks and their associated lanes found
on the LS1046A SoC. The nodes are left disabled at the SoC level; board
DTs will be expected to enable them once the consumer Ethernet nodes
appear.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 6fefe837f434..db935805c379 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -424,6 +424,66 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls1046a-serdes1";
+			reg = <0x00 0x1ea0000 0x0 0xffff>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			big-endian;
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
+			compatible = "fsl,ls1046a-serdes2";
+			reg = <0x00 0x1eb0000 0x0 0xffff>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			big-endian;
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
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1046a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x1000>;
-- 
2.25.1


