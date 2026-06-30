Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB34C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEKuJeAx4xCeAwGF268Oep+meuR+amBHKeXo7tyOKmQ=; b=zR+5J/L+2on0Q1jybLkKBkuLQm
	tmQqP/UYPxc9/AFVnClZCCUcMcS/q5/X1CyfkeBuI1+BXMa7BDvPUNFobvaVzntpCYAiSjDnwv4qt
	jTgjotnW95n2CNTXFtAGRs+M5CNMAN3OO4V3F6z1KcW2H1xVkb+ecTNKtUOoG/piyyeUfeV3ZMLyk
	NbCApizrGEWaHiYulYytoXcS1u7TjOHl0W0mV6As+D5UE8fJPJX0mFOK3Yl/xY4iApDnF/iZfAAtm
	yZn2OrsnF7qO6mK5RJ2hNRUevAPk5rGUTOaO3JUoXTSoEdcR4J5qVjz2Mubi3/1JERpoXmd+OqxIF
	Xaoe3EIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWHk-0000000GmUX-0Q5J;
	Tue, 30 Jun 2026 11:05:48 +0000
Received: from mail-francecentralazon11013039.outbound.protection.outlook.com ([40.107.162.39] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWHW-0000000Gm8o-1VHq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:05:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UluvzCm2LvecWbuEoRcSSeULN55wVhmkwiqFX/UyLxtjh9Oj/K2XPb+lLNH/QMt/yCVt8ew7Q0fiE/i7ApfZcuKLH8LL/jA3yTMjxI2EnCPHnNiSsxX5qqheTMI3GfeaUJR+Fu6hbzTotwe/YpOEiUPXY0xLlVtnqW9pAUBURGMjD3Y5fD14UM3a8lHc8iOWfjECunkebdB+Zx8zxWSKx9XqgIkUdU3Z0Ebwb4qyiSXKODS9v87vSvnNpKAuWE4zcE/sBu9Zhwe2grFkQrsnW6hyDByygO4IULZChJJDoXdLPUIwLe1X2kuI7L17MY/to16TaStwgEmhydBUF2UX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEKuJeAx4xCeAwGF268Oep+meuR+amBHKeXo7tyOKmQ=;
 b=jjOyEox61TNDhSUQVIp+CyFCEcT4QFuS9mc3/w3l/qCUOB0R0n4r9WuzUF7m5cTiDvzW7pXTK3vvRhEMo2fzqtQlulT60jj0TwBoVkEDPtodihBpSZFQUXpUCv7rJw0FW2ejQ5E89XSllpJ0bYa7fjIOZrTXy8iqZekB7h1G174niucKbtiY8czS+wASVyYPelnFLf9X08IPFqdjIOznq08mJV7IelzaTTd1L/OmyMkZ5NtYq/s3+XlZOqnpdVziYkO4vJeOTdwZHwQHF/xCZBuSyHtRScCEXveDC1BWfKi8P++SvUUpP9TgABuZRerZFe0ATIxzWgY4+r3HcHtXqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEKuJeAx4xCeAwGF268Oep+meuR+amBHKeXo7tyOKmQ=;
 b=GVKPue2M5FqJCoLlXVPU0gGTzPUnz0Sj46Usym5yjOq0LEiDE3FqzeZASauHEJaFZBpD7H2Z45oTGgfNn8efY5Zl7+ekxyBla8WZO4DkXZ5CpOkLD06pPelyxolmjLZxSFVW0/TSDUDtEMGteOQOrP1zFV4LThacpl3oKZ1GFn00v0a9iPpBZ5VYRMtRKXTCHw85qmB1L1W1z+LxKtNFDs+EDNunjJLjk4LuPKp2dkdFN3LT8+tbnj4K7HRbClCBK3d6hNcbyC7gGKFvB96RVesH9Vj4qXdpUlgAwwmJxq1xAXfJcZsR9Nw6iax9NZDVZae70lp5sluw3mWzB0U3Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by DB9PR04MB9675.eurprd04.prod.outlook.com
 (2603:10a6:10:307::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 11:05:27 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 11:05:27 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks
Date: Tue, 30 Jun 2026 14:04:58 +0300
Message-Id: <20260630110459.516364-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630110459.516364-1-ioana.ciornei@nxp.com>
References: <20260630110459.516364-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0343.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::12) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|DB9PR04MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: de4b0aa1-3ca4-4366-7758-08ded6977da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: UAV/ACDcHMKktvS4X10IEksay2XpLaOTjNazjRWu6m6GnqukfGRwdeUO7sFELIV2iF+o/BSvZS7V0OgynBtb65A3nVVmwJuwh2XDXg6CXreZdcx3AyRLxlnLVfNZbB9xWhIOSc+x/C5yB7Nz3wCTJXWcy9xqtf2iGi0+VEnMbqdLXlFjb5anj9QmoyAIwnrYA9D4sqd5gt6cskXX4ZF9AYLiT6xiKWENPYob707jEvIO7OnFZDPk4yt5iyDQ6bESoOr+H8gMtx+MdiNDgsBQiNkRONkB8JgK1xyXDJxRzr9hD86O4vKl/kQ3Ns7xj389tx6VkfrAg6gIkVHoWZ/NSAgUzUThExiA312RP6bXyzrjiB0Hnun9Q0l5lr4QL/Q5egPib8dtd7Mf26wXdrUJPeJUzkiSDxjiUdcA0b3ikFmGQTJ5xuHmEjx9cLRdY+c8fBfOKhUqai2gai/3TeTlU0J3cNOy26reoII8C0NTkKVKmYdBaP1zB3jdJI51DyG+p0Vz1u9z6q5XD6CviP4PuQWv8yWC46pDFhhGtzC2tk5E2soSo4J8lWw3RaNChghz3zJAwoKT0IDebW0tl9WYgvop0vmg1eXJVriTGLUUv1l8ad15XyvBI12oSifz5JjFy47D5fk4shOqC6rAWIAKBk550Yxm7n6UJ/rRSzCSUD0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g681lWMoiA9ksMfWM4p+8EEVw+y0h0UgHB5Kks6a4clrqeSM1GwVzahhJzxz?=
 =?us-ascii?Q?tEL5nQdc9JHWiL4Gxu6Sn4d1Rhtn3beyFV/IlxrqvTcbDWceTh3A15vVIHsU?=
 =?us-ascii?Q?VmhrStC18tLj0BaWLsKJtwa3htVsxTQLr/7tPXp82aFjwqMlfRQlxQOtHa49?=
 =?us-ascii?Q?YlwtVCx6xT1U23r85Jlp/vHfspu3jhhlrk7dDxWdove49kNRZNBpCUw6mU8m?=
 =?us-ascii?Q?zHatLNu3aHWxsR1sFOfdmhTeU1RkwPbR1WSr2EheiUTYckdCGP6T2qw7PtLW?=
 =?us-ascii?Q?ssfFH6iYB4ffqKwnMTpLnSRglm9xuwMomZX0vl959ZH4l3vTOxlPwgKbNYJg?=
 =?us-ascii?Q?dHmRlM6xHkEUXLKPOIEVxPHkC72i+dTkqsYEru7tXBPpLf3lWmQSsqLno5ha?=
 =?us-ascii?Q?JHXWJJwigura4PV02JnM2jP3roa50E1V0OBObri61FFm9uLNtV1uQugfkBAt?=
 =?us-ascii?Q?euhNeBPASVEvnMFAoqVg2sYXEyJHYL+EQvishO0dFmtaUnzAa75P/VFC/lej?=
 =?us-ascii?Q?CeD8+Ezsg4ZmpcKg9gp0LtutVTEkWuUPAcAZ3azU7kxwBzGgSqhnzE6gH/L5?=
 =?us-ascii?Q?SuSLA+mtcNTmc9hSabTAc2geBjRIwBw/QLvrkpnspqNSk3y7YQuP7gosYBRw?=
 =?us-ascii?Q?3rNw1JNAYIPAwUHM7BR337vO3kRVPLV8/JwaRLdQrJnixQNrycStPDiJGOt1?=
 =?us-ascii?Q?rrN/LE2mlnieO4wqr3/yyLCsqMGCCr9whVlmKWPBgWBRSlQJJJ7BVvE9PNi2?=
 =?us-ascii?Q?8Ge/TjrcBpxS8sN/sWY6USsWkKmhmt4FEyXei2k8XzBWBTPG8g7g1RuRrbZE?=
 =?us-ascii?Q?rH1MJZ+WM0eoHB1yVulEJCJ3wbDHOKmVcjinNswVIMTFmtFbKcZZA+E1gqZ1?=
 =?us-ascii?Q?0ktji3vTnRzENnYVmxhxbGfD/4+0jkHJtWaSNp7xU4qEUDPwGt24zpIVWs7a?=
 =?us-ascii?Q?I31tcG7aQv1/oqZgshpqtrhtzVUOXE2s9QUJttwIlyWWXktxAeH3ytYKZv76?=
 =?us-ascii?Q?j4sf3qvfZFR0mQ7vYfP1QaZcGogYDuShEc2Ge1fXUtOH5bhDpDXsB5i8BhjB?=
 =?us-ascii?Q?ZjRIjZ94z0ktfmaDanQC1tjgTb57hLVG95xbJNIYf0mgzTfZPcbhTfEPDNk9?=
 =?us-ascii?Q?+kYdwj21Qfi4q2uXP27LP6+CTjcsl7z8EktJ4/klf6qkta2wJ+KWPDEAIWVO?=
 =?us-ascii?Q?vSKfCfrzsZjg38xpuwUFaUI8lWHktrOakBD2aj3Kpv2cfuc/2GTXLw6UXmuW?=
 =?us-ascii?Q?j6X96vyLfmljtNa/si9q9BEpLqXyp5zyoHakLaw6KiEqVstx2UpN8TBoUh1Q?=
 =?us-ascii?Q?wFOxuKpfLkrqLX0Ri/p49PGDZ5D22txnLzdTBK/xEhhsrnBW3xsqnUfYRyWe?=
 =?us-ascii?Q?3+dl2xOx0Q4Fq4dlKUGUbyjyMQAHCqxjH7ljc6QMEGkTTssJuhZNQ7mhU04D?=
 =?us-ascii?Q?ZMUQu9QB23ZxVH61FwysKDppRQj56oN5CdO4PiHOLav8g7wObMKIlJj/QxjN?=
 =?us-ascii?Q?lnOFK76Z6OkoEduhanMwhINpiQ1XdSjxOVPl3rql+VDsFzLW7tSnNAse8zVk?=
 =?us-ascii?Q?Vv1rSRR37BPOwUc6F6xmUP2bbLn3xDFSebRF56RTWPHgUPwn70UPHwMrmliI?=
 =?us-ascii?Q?Jtyz097CYtpUi+iyIrCAFybdimV/SEUO/VL4sDaSIeF99u4zqOsPmwy0+qcj?=
 =?us-ascii?Q?mGxVdEiMIgr/vSWQzpVS7Bkg9u/obM+qijpzipq0B+egxyOl85x6OVwqnUzp?=
 =?us-ascii?Q?1jt/WzuVBA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4b0aa1-3ca4-4366-7758-08ded6977da7
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:05:27.1014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mb1DMBbLfckE0diNrvnd2ASAV/aj5I6ZjAp2ibJnC3qz091PvA86mTh+sA0vj/WbJ5UUuKnrPbZlxuZ6MeQGNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_040534_426340_86A230D5 
X-CRM114-Status: GOOD (  10.23  )
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
on the LS208xA SoC. The nodes are left disabled at the SoC level; board
DTs will enabled them once there are consumers.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 6073e426774a..7d4260661766 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -280,6 +280,104 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls2088a-serdes1";
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
+
+			serdes1_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes2: phy@1eb0000 {
+			compatible = "fsl,ls2088a-serdes2";
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
+
+			serdes2_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
+		};
+
 		isc: syscon@1f70000 {
 			compatible = "fsl,ls2080a-isc", "syscon";
 			reg = <0x0 0x1f70000 0x0 0x10000>;
-- 
2.25.1


