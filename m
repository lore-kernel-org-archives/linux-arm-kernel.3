Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AEDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbLmQuH9gq03OUO7pge7522NOqSCrHOmz1rqFrvSapw=; b=17OkBf0lglo8OUTRLhdjSstAZ+
	pwE/IYS52utTSKgXC69l6peCDcZtgupyYbQXmnNnThcL2CZTtWCrr4sEeWtAvM7t0Snn+V9iagYJh
	3J7qz9GeuLPoZ2ZimNQWR5baWCowxOsawZuteVUgLHB3MN7ttFKaxRPb4y8ckp9CkeG7nAZ62MMls
	ll+ZdQZyCRA0hxtEksCSUiILrLmty6A2DBXR6FoxD/ownzOwuwkiepoC7+kYRXapoUPBQ2SEPKVbm
	lTVZCa8ExiepCIb0eb8MssXaJZbO1u9AjEFtPhe0RhLo02N7vqazOgW3BTUXCZj8bAG6zJ3YFlZAV
	rXKks34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weujX-000000028yW-0LLR;
	Wed, 01 Jul 2026 13:12:07 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weujU-000000028mo-1gnR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 13:12:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+hqTkjaBXwcJhNwLTgNA5DM5uQJUU5u2/OYjwvyWejoZv78krJg8vWeR028ptMB9IGu23272G1kzXbGwzO2tssn2kl+cna3AYQ8y2/SIpev8XlGnJjBY1sUdcVG+5iD3gRq0KPudwJT1n09yAKKW/GwVBBOKQcXTVs9HtVE89a+AXMI1L2nu5gchG5EOE6o1XGUo8G36J2sSXDNwgwhGTmqUifSIzVxg29OPZt1bTLrFSCqNHss6zyKC20NI7kuKeZfllKmidm+a2AONIjjcZJ23Q30pN8SprXKJEQfA2wwhEPU32XpAQLF0yr1s4WzTeFNMYxYtXGEYSC6aIPSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbLmQuH9gq03OUO7pge7522NOqSCrHOmz1rqFrvSapw=;
 b=URJHGPelc6yG8XHKJSjDquK5yKKtdxMzP+Lj6EeQGPaq6l/QU4GiGhv/UWm+jZDWJNGWnqv/trlwnJY7pF4Gr8oDjyDcEvSGnJkO33H65EIcGAadB/Tl52wtnGpc4h+/8pQALdwXmicoRWHwCvGx0LQRGM7iutXQDjkLpAP+UD4g++PCjekdXPx7Ieyr01UGoRZ7w1TNquM79MTaXiIAF4S8iJou0EzdgJ7JC2eOoc12rCtRvAgDa81Rys8GSY4FMMuDHPgS8qbsL3S73z8tivFbePQDER53fm1WSWSQ0hP1aTC5jm6yzjD35c+5aTcjrNKVMPBh/QmDFOeiVImvUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbLmQuH9gq03OUO7pge7522NOqSCrHOmz1rqFrvSapw=;
 b=H+w9lDR3AN3UbyuAQ9fs3ff5sHdkhQ1DFnYqYKZpzfDfeom0jvOW6PG4shMlkMv8g8m4kMyFu/c3kkhFCCBatXPEgE37d3qUqeFMCqHUDIzIn2KQqvsJy2yAYHatvPKeyoPgAgmDKb4ZDICvmEF+LrrLaClVmcSWs2gguBgs8ZlLuW/jIBkOYyPed0jfc2xOttz59Uv4Txm3uHwkWr+8q38OHo5D4AaMduHJaOk0dvM6wp8ERYGL2ekDP+5TJYRtu0hlJoBMJdDC1ZHEHCextKON044xEtkQTrqbf2GW05yBzi/zNrCXkwscuHIei+3M9TvKHAnj++3NMqzvsMgPdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AM9PR04MB7569.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 13:11:57 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 13:11:57 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 5/5] arm64: dts: ls1088a: describe the Lynx 10G SerDes blocks
Date: Wed,  1 Jul 2026 16:11:37 +0300
Message-Id: <20260701131137.940145-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701131137.940145-1-ioana.ciornei@nxp.com>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0023.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::28) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AM9PR04MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: ed26562f-3440-4a7a-8a53-08ded772547f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Cs/Wf4TqCKpsjB+40NJY9c/JEkAeXfe/vGzmLvnvMIZH2TpP5rFOUEBteW2wXXW2Myw3h6QmOx33hxsf9RzxG3j1BDeiGTURT+tdd2huOl8Y0ABMDi/zVBgxIIjfz/BFyX4yUwgjDYJ52LVxJ4IeUx9mtK57CJB0RM8ygrMufhyPA8hMTckJ+hPryy7pJTgeobL48khlJEKCdZtyJVBo2RgUw56ay6CoDalzbViRJRwya1jV0aaDm6v3uSND2xIoD6I7zEJwIisFhuYo50002sZ7c9HKhtBWRNCjz3h6MqT//ywLHNl9nTZrJf6KhQNp3SFu8FBkV1T2aTyBydULGx9NcY7q3YB+R5bwPtr65+gDUACkxv28VxW50+k2zc3MOA1KQSZfKXa6yRrOMgFr+Vj+hOgwGgD+gCWxZ9/NAs+eW9IByF/d1MrbFeYh5MR0Y5NLRJ8wRcU/pfcfqOqC/6mCRumWj0vXr3UyTF59vbfAuKaIISXIgI/RLpLJ7xMr6oc43eXThevdKKulx73N06ZbOfVAkGJ7D0OPwzrndVDDoIumjLOS/c2lsjxyIJAmOpaSLsmjSOyckp4S12TXt05wxEw5xHbgVrZpifS6PuAfPOoPvVoLsYniA5zl2xgb208VYksFXzJBxGGDudg1XSXlVnnN/FLktPZQppHmDJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vFHsjznF2zjthOW39csana7lzCDhmGLrOFi/01d7RjOCnbGAk3rby9c+vIj+?=
 =?us-ascii?Q?7EaoPJqUh9WdKV6z7jXyiJdBVBqM62WMhBn/Ll97cYZzgNcdYOe9eG4FPMbW?=
 =?us-ascii?Q?wTDMxGWoGvfvx8nkT92tSPxk4zk0udv/qNfYHepA2tCiM+w/2/xoAtbH2MYN?=
 =?us-ascii?Q?4nRntAKQnmeDJZfAvEoy1FrIL3hreVDAKK3Beu/Xo4S1zQCfCKYPgSfKY9+F?=
 =?us-ascii?Q?ERacJ8U0fEnmGKPP/Hzkg8c4TRbOosCmFgl6rWr2TCYnTlHHHbx6STQg23L8?=
 =?us-ascii?Q?4QrpVNrYn7MZVKbQXzKpQnUiSEa8S0Qd6GTQHtl2coHTVaLpPLrtjRatEku7?=
 =?us-ascii?Q?WzoCsCH1Vv/vSWRiGXITf/XQkqTYVuViNYA6QkYpTwEXASvJ7Btbs9cvqfqb?=
 =?us-ascii?Q?nN8hXVtOxllEPQ6XZPNK1yd+/BfvKuofZQImy5cgy14MQ/OivTTlMuRl471r?=
 =?us-ascii?Q?5F10xituJe/AaadLWH/MfskrPDYMmHYtma0fIBGG/wgIGaMBW+4aZWCfUafw?=
 =?us-ascii?Q?igNVMydrFWDGwN8YippwBy9w7bYkNBymh1GM0Qk1fLHrNURGBRXmSmHGq1u0?=
 =?us-ascii?Q?qiGUysOPRI25Mv/VtLiCHEqHlqd8fbakTV0cxheWCoWgalLKGyYVpE1HEsqa?=
 =?us-ascii?Q?WwPFjsNtLI5aYouZ7k+xEEVWGalG9Yyz/iJjjvLunUeNqHwVjiHYlN6a8MMQ?=
 =?us-ascii?Q?hnwmgtEHW6CZ8OKiCD1XVW123cepab31gF7uoCvJF90lqAgIGwhEKhx3+Wkz?=
 =?us-ascii?Q?PdvHciBB3xUNCpamHcLXKya4hG01KkZ/PiE5VtDhXopRwCzXKh/4OqV80Wpo?=
 =?us-ascii?Q?AxgSb2x1yF/yXiHi0L1+ocVcE8WsPUrQDJnfpn46OAfAuTdfG8IersBJSJhk?=
 =?us-ascii?Q?cdxAnJwNq5pik9triMEFEGluFzRTXsel3unbWPaAXEp5uCDemgH8QhO9HupS?=
 =?us-ascii?Q?k5bwv7dXvk/EO6iM81j7+xMF8SPq2uvyacHI2L7E+ChubV5eHksXF7JzP7TE?=
 =?us-ascii?Q?TXM/E5X95T2GEZVLyJla4x99voM/zBxgRWS8C4ZcKLCgvu3glOEJKTbZwAAh?=
 =?us-ascii?Q?v4oO8PvhHprwL+iymXCi6civE0pc8oqTq9a/eQ1/JpNOHj88UmKtJOEeuoeF?=
 =?us-ascii?Q?APFWTsuWNk3NgahPznBy6eHhKvpOtGww/37imshY3hsfsUkzmWBfpR1n80vM?=
 =?us-ascii?Q?2JA2quZ9wkSTKEi46cnrcsf1LFqHiLSUfkZCOHiCNs6PuvoTPrra5le4aiSy?=
 =?us-ascii?Q?GufWq2/hfGWft3wx5BRQdRWsa6+ndrYaZLq7XF4fPycgDIqmhdi7YtqtFR6H?=
 =?us-ascii?Q?CzfDbYsOHAVv7gj4dgRAsIBVm+4c8J2iueSGEaUQjiMFZ7aGuJ8Y2Q7lIDtT?=
 =?us-ascii?Q?LmkQa/xpMz65HAzCv7Glyq7ruAh+I7iwXvnvK5zjceAk7X8jZCWoiwY41Vl+?=
 =?us-ascii?Q?GbuQSL7BkS0X6/uR8gUyyaqQT4Q9H5+Casj4s6uNB+E2UOXiGgSqlVrS5cFU?=
 =?us-ascii?Q?UvGjE8MEzkPeanR84wCpQ5bnr+92/17MiK8XQdEtAUi6rvL/tBYJd8ywtO6r?=
 =?us-ascii?Q?eAKJYJyu4dKNVR1z0Sxqn80uHrjWWGHyXyYepA07PT5tDPuPgWftMPo1b8Dk?=
 =?us-ascii?Q?ngvDl3Z0N4N1LuirGe+6WTBw7THeKCjOQ4XMu7fE2eEgx50gHzf4JnyK9+d+?=
 =?us-ascii?Q?mo9o3g2dDM+q4Ko8PnT2l6/1hfLI3g9Y2ZaRnDyCWTjIKizj0BJJ2TiEY2RC?=
 =?us-ascii?Q?EnFPJ9IfMw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed26562f-3440-4a7a-8a53-08ded772547f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 13:11:57.7979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8EWs4Y2jIxKbFokMApPNllb/M0WFnuDTknVp02g/fImDKELOdxUdyKezn0qne8AMrUEKWznTcHV6wQNhpggAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_061204_474760_04E0202E 
X-CRM114-Status: GOOD (  10.83  )
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
Changes in v2:
- Change the size of the region to 0x2000
---
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 99016768b73f..e02f34329988 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -239,6 +239,64 @@ reset: syscon@1e60000 {
 			reg = <0x0 0x1e60000 0x0 0x10000>;
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls1088a-serdes1";
+			reg = <0x00 0x1ea0000 0x0 0x2000>;
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
+			reg = <0x00 0x1eb0000 0x0 0x2000>;
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


