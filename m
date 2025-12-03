Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279DBD1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 07:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRnzED4GC0b+hWqjPuk1RDoApSCWVC8OqwTnEp47bJY=; b=A0ORuPJs8+rnox9YbA2Wv379H9
	s9MC4x4FKf4skhjlFZLmlrR8k/YM/AejGSMGDLvZGClgg4QRFguKkPwep7/tVyn8ik0/6FY5wFAt1
	KYcAPgXCeEAojC1XKn9Udd50A1ZCzVBNVJXQjV3xrwiP4zegq4YprPlvtpjXFiWz0WVjf2JharApf
	+BchsMbB5AG2U+IuREb9Pziy32ilCXcE2g6aFiP3EUcprRv0lZjDhve3fOAHxk8SCBKj4rxttYb7G
	Mq5WnGTzdAwDmAGup08HSQ8cBE7Kfz8agCQ5Y/HJRUc2geKG6DJ9OIIRQNp2XCDFvu+MZhhD3u0qp
	Q6pQaEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQgwy-00000006Ebx-3stY;
	Wed, 03 Dec 2025 07:06:56 +0000
Received: from mail-swedencentralazon11013050.outbound.protection.outlook.com ([52.101.83.50] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQgww-00000006EXm-0S0y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 07:06:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3RdstUPSigSyZ5eLgA4gZBTWEvXTJPXTk4e39L4B0kxaoNPrRbSacU1PvEjl/AKG6oHVKlqqWO+fx/Xmnio0i51XdpfZUtZONoIPxLpLfzYUeMdV+FlJgUgVz3NaLdHvWDeKvne+wdrHlZ4XBpFyZQ1XoOycvtrfAiLyHL73D5P+Y7bUoMgSFKDhOLuoA1I6UEnVPR5cNVsQw/IfL5TIOQInMmp+UXrHCTj88p51mB20RTtB/ra1mCkzSZ3kRjkFaCObJCErKT5dshLdkExzfTkBfgt6YpEjXvPXdscpiU2CBTtLQli0Ck3DHJcy032y95+KXcPH5+DSJzkBtAQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRnzED4GC0b+hWqjPuk1RDoApSCWVC8OqwTnEp47bJY=;
 b=owkocy8DrnClu+PxGobpM8detAPcz4mpgCjahLwB8wtgHQqmIa0ngQwZ6O2KHx/kYWkWVvwR8E8pHmJQ5SpGlzS7pmGNzbhKZk8y/sAs/NMA6KA36eC430Sm6bCq+x+u6UUx3zsydYSnRAJHLrcj+1mx7jput6kk6hEtwAvviy0W08Q5J41mN7UdrSwVoXQyw3CIl3SchseAH3ntohhFUCc7q128eUhGg1fJSIotmgyxxUOZ4qhaMtQd45R/OUcfVVc+cjYKmM+UJkyMKHoC/RejWKs4cWEcBOgEV6GHzlz1FWIFSD04/TtE6OyFKadFXEaajJmpgh6htPHWGlfYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRnzED4GC0b+hWqjPuk1RDoApSCWVC8OqwTnEp47bJY=;
 b=W+A1RRxmFauJ5w0YDFc51isYsPE6PHrk5TJ5549Ig3890/ZNkDB1uzYMusZI4UGEDObxq//b0d4L5QAIaex7WuRrHSj5FTml6ecXkOGl0OPZNOJtsLlkr6M8c3mqcU8cXevD9sviayEvmOFf2VFFAzqOp2m8SqIPY2EJfZzG7SUhuOcgvmtj4ai1Wns4T9SGY7B8jRU0+6RfOnX7MuVUqZ/05JjV6SREhHr3KL4z6l0bzThA0SkVk4oMGMbVuJeo5rxlXEznhj+5MeYrN8yOaNPeXcAiWPYstySKVEZHvAldx23hvJ1pTd5VJV9X8OkzxcdrB7Y4jxhCWicjJMAwmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB9174.eurprd04.prod.outlook.com (2603:10a6:20b:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:06:48 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:06:48 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: imx91-11x11-evk: Add bt-sco sound card support
Date: Wed,  3 Dec 2025 16:06:02 +0900
Message-ID: <20251203070605.1868821-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251203070605.1868821-1-chancel.liu@nxp.com>
References: <20251203070605.1868821-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0156.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c1::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS8PR04MB9174:EE_
X-MS-Office365-Filtering-Correlation-Id: 292141db-19d3-4850-f6fa-08de323a86bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CQHJjhi4WMmZ05qNtd7nicKm8ijeNrvFGXJV8aKca6z4rDZyb551G1rVP2Ih?=
 =?us-ascii?Q?BsmIW7+Tf8CxTzPCQE5g9VMw+FdrLQsFXYhkMIii3mlDsnOWBYf+36nw3zAS?=
 =?us-ascii?Q?Ac0t+pizs03xngdywUaqyaWLrOzaHHPuw9KaKQp2FWhcVSTUdphHeOjwwVUg?=
 =?us-ascii?Q?IQ1wsWMsDUyn76Dh7hWI3uqrF2waEDhZ42R4WnlglW4jYnoULNS2HCQbEUKw?=
 =?us-ascii?Q?ulc1PFvrK318N8SZuYiDCS+Aq/r7Lbxye2hRfPzRSsh7/ECw1lk315eVevHY?=
 =?us-ascii?Q?4Sy9qPQ9ZXTtrv3K3dqjclV/G6i898jo4WlEdBkdpf49KiNwLJpyD/X6uFqa?=
 =?us-ascii?Q?jYgnD8om+s3l0iC261LwVpR9GYGXXFuOtAUBWAkhl3dkZcl9mKmAfwdqO7L2?=
 =?us-ascii?Q?sGf8u8lwsZBB3NtDRN/oqOGut77DOEM0LRtHNicViGGtUKn/AZjEwObH6r3G?=
 =?us-ascii?Q?s5TGBBkO8IFGpkgYG9qiN2DFEgblQwUMfJVRGhWPaV2wAfJRGdSffknmdXhI?=
 =?us-ascii?Q?sHBCZCCcwuLh8mJ9d5boigEsRtSvGCDb2ySwXkn87IwsTU17UdRj4f2MGxAe?=
 =?us-ascii?Q?m6EMCfP5zZDNugJi5ycI2MWEd98LoBHEE31EsN3M2N4AkcUVjqoj3pc/NDIP?=
 =?us-ascii?Q?1Nrm+xhR+j2ZR95LttLoPXYJXMVK9T6sSBgLi+vkNlyvJThHmEn0H2a9Onov?=
 =?us-ascii?Q?xZD75w5ucMWe6Ui/kCMnuY2ZEPY4+FEOnn0ZQDuJbX04FI/yy4FjncFEVPG7?=
 =?us-ascii?Q?Oddw0mnm+Y9B9X+J1OagXjP+xbFWtXnbwISp2LI2xlwZDZW7W6cOgmxY22YA?=
 =?us-ascii?Q?fCanfJGG2FXeicaw253PveYCU676r88lbXex/aXwxu4O9uAWwfjVtOJkbAR8?=
 =?us-ascii?Q?Q2EWHhiHcWn/2o2Kxh9EzUxoarmIcEo16KVp3U9YVb+1NcV1NJ/IVoufbpJB?=
 =?us-ascii?Q?M78gXkBiI77ZKkq57p8NIBwn/S89F4kxHuYP0wphB8MWFSmpBHrpW8okY6PC?=
 =?us-ascii?Q?NX90Xp5PgUQFLKnFwG2XsJcIE7XRs+YW5GPeLaXZvaaoz+IwLkwvv4J5C3RV?=
 =?us-ascii?Q?5M2IhZwxGZUi/Fv5Gke7qYYo80crdswMJZUAkf/Ii8DFpu9TwC6dadST6Xfh?=
 =?us-ascii?Q?j89M3mKHAx/x6fP5/ARCi3TL1JpnK5GDZM4QsS0KiArh1BLVgXQaO2lPlnSx?=
 =?us-ascii?Q?ayU97COmMv/ywolDcKn9QybgW6epFR+jBPC5RhMyBz/7Q6CVjvw/MP7QR+0I?=
 =?us-ascii?Q?5+2vuOjolZruCFNWlHzTYW31X4xrDkZqm14d9tbpLdMiG4J08fDcrOzZ/vPc?=
 =?us-ascii?Q?FWamXeBaaYvTh6hfQOVG7v1AB8/qM2rhQnvZHCMkn8RoWSCXpnUFIrIvNHVC?=
 =?us-ascii?Q?Xbv2guJI72MsMhqPR9J2M6PDks7VurqEQVQXLsdtNAWQBwOdWQRJkQTj+tyN?=
 =?us-ascii?Q?86x3IETjLNw1O1El7hs3aRPmVXDKFCQYVZrBahKTnIyQnVeh+qm8jqCRczzw?=
 =?us-ascii?Q?1vQMh3eo1jPlEi+BuZtc/coTdQpNMiofRO4xWprhnuZdyNOmvuAlFR6NVQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cowGnOxYDxFt5rKctRk4x7gl8ZvsNckWpG5KDLUhFTycxTgVtgfqJtfIJ1d1?=
 =?us-ascii?Q?jp1bwYKJ6SdL4Jri5LnE3PYEoP+Lts19ewKRLO3YUiino1L0f50UGOp7oMjN?=
 =?us-ascii?Q?VqmMqELqKIjazrWBzE/jxHt1dAdM+KAxL26wGH2BEy8jSaGo50Wyl1n51+IP?=
 =?us-ascii?Q?EvuD3/2n4bSjIe9ktF/ZIFHmlbs3mdNW6KdokPlfhpYCE1AtpQ66Dh685bmh?=
 =?us-ascii?Q?2k2dyo0x+MR6oiRdE5LBNaDlHo+3PKmK5Ah92VRWPnZsiNZbkifmu7+NdczG?=
 =?us-ascii?Q?6I5HBDRot/AmmC6MhVSNbB6tu6eldF8xB5zYS7cFh7E0BXRaJ5P8mXIKlU8p?=
 =?us-ascii?Q?ltn8zl56MWj68OzcxWopaa7C8oc7olarkLSipIP2OibIJIodf46+SUpqdSIz?=
 =?us-ascii?Q?ignxYrlKAWyWmyZYFqvcfguKnkvbxsYvVg4wmtPcQDWecwmnXCKd3BkNRxgp?=
 =?us-ascii?Q?uZVjkB+IZ1mOh80UKf+0VaSXKoaYUD+vDH03AijX8/Ty6Cj0GU1yxivrqDU0?=
 =?us-ascii?Q?Rezy2zHtbmp4P3+4rrZNmo1KYC4xClF6+Ewgoa/XXv1cJDlcjXn/x9SuFgLo?=
 =?us-ascii?Q?ZgpVmlW17oa0p162FpWAnTAcn0L1elguCmoom4BvqUs88cSRKAev/b721f93?=
 =?us-ascii?Q?ncJNo1NUjJpngMnr2E2gilRhpNidFDC4dMrYxo4A8hQZEmM/bOw0+0qn95Ve?=
 =?us-ascii?Q?gXNtCwuTlOKCZuvxP+E+/2wx9vVyz7nnsiQV6hLo86Is9zIC7ltIeKTRW3kU?=
 =?us-ascii?Q?AElY1NJunQtEiN5sLynl4MPVTUJJYE774rTT+zQcJMFsHr/ayt8N0sXXDaRu?=
 =?us-ascii?Q?EeZ1yqvZ1KzW8sgtPAfbi937pktgZFOVGQQnQgUmznmNFGsuJ7LslggV3xC+?=
 =?us-ascii?Q?KaPJbdfOTk9aEykVQ6t4//V4eD4nig4Yc43OgsS3C5sIMs/I5gyJfuZu+iEi?=
 =?us-ascii?Q?nUhQlf91iqUAjiHG5yXMwlZgPR0D/G6PWIiAh37Vhc49ABzqtnMe6leUd9iK?=
 =?us-ascii?Q?L30YE8Ac/vJ0TU0+iOrID4D/+fhwrCTmrNq8ZT0zoph/HLXq9PCPplkXxXkF?=
 =?us-ascii?Q?q34s/xn+1Ka5dXSorQCPfKFgk0qBLrvKP5yvc4NavDOfN+TRiy0UPgCp+GQF?=
 =?us-ascii?Q?fNAW+Htx8wPLWnpk/PKt+Uuuwp9BoU/K/ijAfhwDxfN1j/87W3J3NpDyAOe4?=
 =?us-ascii?Q?sZdKjHITVE4v+a/HNHp2rWAbjIsTKpTAvJqhRPsCT0kMe6gHbOUqRQJmDbfY?=
 =?us-ascii?Q?9n6KeNcTl6lfWhwGMc40gmdUkrDqzKO7kYU6qK1rsaFV1gTBQ0RE9vp0u6SL?=
 =?us-ascii?Q?SYAYO7Xf027RdR0BYkLP3GxSvr+DRWOpWHT28Xk8JK4ScKE1TAVZ2kQrsTg+?=
 =?us-ascii?Q?qNAE1AsOh4mUh41VKQh2Ert9Mgk9M6r/hBXqkDK/utvIGbSV69wd0EbUzn8j?=
 =?us-ascii?Q?4dVrUN95WpBJ0hq8st7tnrZHNjYugcsmn9qBPUWl/thKkQQObjsrpKA4At0R?=
 =?us-ascii?Q?v8DSgoW2wVfRgjACWT3JDAa2NcEw8+w8Ucg9VLpvJo1CLht+T+kHiit3i0pd?=
 =?us-ascii?Q?nT6midlumqo6m0QpnokoG+GtHeMpS0HW+qsnD0wy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292141db-19d3-4850-f6fa-08de323a86bd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:06:48.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBAsrNkrSqGwK6feOv/5qTSJpQ6dQ8yXn13Bt9zn7FM1fSq+PINpwNKmmTum9PdPi3qjruCOtRO2FUC6dRX7Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_230654_158485_5C3B3736 
X-CRM114-Status: GOOD (  10.61  )
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

Add bt-sco sound card, which is used by BT HFP case.
It supports wb profile as default.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 313ebc7e8a9c..55d2ccafc376 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -31,6 +31,11 @@ aliases {
 		serial4 = &lpuart5;
 	};
 
+	bt_sco_codec: bt-sco-codec {
+		compatible = "linux,bt-sco";
+		#sound-dai-cells = <1>;
+	};
+
 	chosen {
 		stdout-path = &lpuart1;
 	};
@@ -77,6 +82,25 @@ linux,cma {
 			linux,cma-default;
 		};
 	};
+
+	sound-bt-sco {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "bt-sco-audio";
+		simple-audio-card,format = "dsp_a";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,frame-master = <&btcpu>;
+		simple-audio-card,bitclock-master = <&btcpu>;
+
+		simple-audio-card,codec {
+			sound-dai = <&bt_sco_codec 1>;
+		};
+
+		btcpu: simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <16>;
+		};
+	};
 };
 
 &adc1 {
@@ -372,6 +396,17 @@ bluetooth {
 	};
 };
 
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &usbotg1 {
 	adp-disable;
 	disable-over-current;
@@ -528,6 +563,24 @@ MX91_PAD_I2C2_SDA__LPI2C2_SDA                           0x40000b9e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX91_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
+			MX91_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
+			MX91_PAD_SAI1_TXD0__SAI1_TX_DATA0		0x31e
+			MX91_PAD_SAI1_RXD0__SAI1_RX_DATA0		0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1sleepgrp {
+		fsl,pins = <
+			MX91_PAD_SAI1_TXC__GPIO1_IO12			0x51e
+			MX91_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
+			MX91_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
+			MX91_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
+		>;
+	};
+
 	pinctrl_lpi2c3: lpi2c3grp {
 		fsl,pins = <
 			MX91_PAD_GPIO_IO28__LPI2C3_SDA                          0x40000b9e
-- 
2.50.1


