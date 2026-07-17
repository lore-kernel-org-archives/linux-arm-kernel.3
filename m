Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6484C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiJu2skQlEWNiAa16mlqt3/KVHzf5IMcERMD/a+0AhU=; b=q4a0ZLxXmrWwOa2/ReUA7VBLF9
	NAgRG/R7wIvA7BbDHdangt8/yIBDkYcsXqHSDoI1GYCaPUM+5012zA6/tMC3/ZZ90vmUZusnhz+Eb
	rdBU/xBOWDmwUpjNufTCwLr7ACIOoC5SlBhtbRrhEbfY6UiL8zmpmH31713KRrAFEhUzN11qOHPqH
	NsNKANQwQSISYCUhQnTu84Oh/Xk9CGblZutKOQzmo+uP8dzXpn0Hr/optyDY1Gk1X0PDX1ArzaohF
	4wkA/v2+L1+cSvUPescjMlJ7TRJijZRc2yY3Uw7z0TmUfFRa7WBzoxeJ1dpzm/Hj7fOKCGxSm+/e6
	+01fpADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhLI-00000002DxT-1ylG;
	Fri, 17 Jul 2026 12:07:00 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhLC-00000002Dur-1tb7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:06:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaaHqH2LC19UMf1mlaoKDv2GZnIh6A7CT65btW0O6dPnuoqnv7eaqX/823+1I6q1cZKr9vlhbnN2XjN2zfr7QugiiAVCpbAhkKlXfvxAkGuOsYrn1X1sE7cuSCno7qXywQEEiBzHEZMLzq7ZXHrAY+SdCROqMNH/uwmQ28FGRy7AZ7zZa58t/9ZgVoAKdG4Uu1TVB3yZrXlg7YeVY/q25yTTu6oeUP5fnv/XorR04I+wia1bVGuPx4braFUPGl+kAZ3789cuNPWigzW1m52OARnpE+R0q2tp8b5gpWo1wWkAdt/HYVn/ichm1if4XxzP/p6O8a76ZHISvT+pIFryMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiJu2skQlEWNiAa16mlqt3/KVHzf5IMcERMD/a+0AhU=;
 b=fqwtXM7w3py6nVz1KLYF3WmoyEjTzVo6AT5RFXUp8Bxoj3EH8JfifVGxKXJT+4OQ39dHQQjaxC8HtYR+GDXOqe1us8Mx+hAE483pyuVlE+eqmVXqA4AhdsL1tE6qn/SKf70NhmwHvVfLr42lb4fRCLrCmBdb2O+1DtMpSH3RSoBkYtIv/WtsNetYUrFo6YY1X9Nb9XhWZekRD60oM1G7mqU9Koz1+L8fw2eEuyZ7Z6U5h8mG3dimLFBKj8d0T+aTsxcxoDDUMuYrQlPa9ngrAtGvtxIWh9sk1xA/SNROwJwfOry9KnP8va5ZGIUULNiPgF21fa+y51eZsj2D25UDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiJu2skQlEWNiAa16mlqt3/KVHzf5IMcERMD/a+0AhU=;
 b=Xyv7E4mcCSYEismaIRw+TxGyhpcMMr5so13ZmYYhBDPz5YSoexIjIs40rQDDouTylgpoAC1IizwS6HZG3/1q/O4aS/5N5ppSkT0ZyIeLKK1yU2LQRjBGqRZxpB2FyjQdaCHBu/lX5ZLWAXs2dtShFUiW/W891A9rlg7sALP0fXySJRk78a1MFElPcllhfeIQusIp0sNhEP3oxx1bV08p5+QuBCNUO9tNmU6M5a/LoUl5XyUM0OUu9Oqj852ks0LkVbyunD+gSYMSCQ1qOOc9xfCRwVOMGb6No8QpQk/mfjq1wWwzGd+0DHAqWxRIIB+kN1TUvBS35YGyN2kmazw3rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by PA4PR04MB7645.eurprd04.prod.outlook.com
 (2603:10a6:102:eb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:06:48 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:06:48 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: [PATCH v3 01/11] arm64: dts: lx2160a: explicitly enable serdes_1 node
Date: Fri, 17 Jul 2026 15:06:25 +0300
Message-Id: <20260717120635.2118610-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::14) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: f2126478-c706-4692-b11c-08dee3fbe132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9VwY+0ed/Dx3fp5JFMB7nG8CP8xPGVYTKcv1ePBYXKFa3TKa00Y+9TUZbWhhhheTNfvVYPfr6dbCZsEYn92bbUdgGL+8WUfwov/J0ex7aQwxsSHAOZrvBC5dZtEAHxFrK3903gW3Z2FtAHzOOhWxm0ZauGZrxtTYBXs741vK6gzc5JL9r4EI91WUUbijwZi2+XU/zUgCo/WC018vHsLupfSP9N6AnSnKEj96NOfNPwS7hBja471prcENCno/Y3fwXQ35Qb6VFnavFKvH8k/gJ9hiy0AzMuCQiH2MKuH17f4SfzMGJNUcot5G6byK48LRFKnjQ8VpBpLCid+brkXPQtfyQwPuPt6gXzLJzOb2v5C8G5aPdFOZul24xLTxtKOS7vT1EV4ALma8wZihNhfQW7MMy0q9LLVdlBw5J7RB1Xs32FASYIHISq3tFJqdpBkkT8N6p4hsqWuKUNxjlo9fWmU9bjlYaf2o6EZT2pdgkdJLEAR2MhtIzzGeZEhv5Wpu7yH7/2B183l8Z6RQnLmUoZ5/PpzM7KFmm9kxFY+ad+mVhxtxHmbY2oQZ5SVssBvhHK6XrAkGayOF5sIzC8mLzTM/fBzsx+OBaEKmUUOexyzVW8Y44Cuqga1fxfhjmucNh877r1ycmsLuzWxGiwdrkb4HEdNBR/qiQp7Z2UXlXtc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U9sPuWADyeG3XLKvFEsVrPTWpFIxqK+/ptn7HkaojwoaicT7IurG9H5hU18R?=
 =?us-ascii?Q?NjiuASJgyZ94EOX9rFXGTmreYbD2r0SqE3wnG1szNiLC7BQC/iplImeGvMG7?=
 =?us-ascii?Q?35vIlMeifioP9KGMFTQWUfMb0AEqU1yaS+qQYRRml6Xhrv3ZAGEzOZAtb+Im?=
 =?us-ascii?Q?xeUq2WlB3mJrdlNbBztqr6OTIaCQWpess+cB2sqFJ5zRYJwLcl/EgABExr0Y?=
 =?us-ascii?Q?zHs0fjKT+sR1eDXhM89PlO/KCp2zT38TodbfZXkTzG+c5nBKdpSCQzBzxqrY?=
 =?us-ascii?Q?8aLjGDAHb3uGaIIhUQfb8CgF87vnxSO0Yq5gZ2hUt3LLzBARKumVon5zZ0i+?=
 =?us-ascii?Q?d8deYGUTEEG+ldK8gJeM1exokIxRQN2bYwvgKhJkvF5ZAVR6X2NaWnlUvG0G?=
 =?us-ascii?Q?6UVUSYpaCMA32reTS4rdZDSYDDEzNIUMaWEZBQvOe8yO4uhEe7RDJTIO5DGn?=
 =?us-ascii?Q?wYTo81Gqed5PTcvqeyiiEHYLmQlEw4h0o/XFfHe9TVvOqxS6f1KKRSNM7MsG?=
 =?us-ascii?Q?G0sTyoov+k1uWOi0sJkJ/wuL2Cw0b+omN6KhAiP1L6nHQu7aVKJoYJM8a570?=
 =?us-ascii?Q?j/KOH/X7KE3DoBZr5i26Z3W08/L+yXDTsU7KE2aQkuxHdM48iQjeiZenYdOu?=
 =?us-ascii?Q?jDAK3YB/z6MTsHud6ffPQSkRsxfVIfCWvIcKA/B4uMOF8CigAke5oZdEFyn9?=
 =?us-ascii?Q?wQOXte3cBUMd9WL5rO5psWiDJz9BO6SG4iEw8NY7nlz+UZpIfhoKLAXOxrTB?=
 =?us-ascii?Q?ZgdRaUYtqBqs7u3tMO0jnGSX5o5lyFEM2nwOrOh+GFNsFPizPJ2wV7tghGEi?=
 =?us-ascii?Q?hLTmW8BwBJ0hBM5MxSVvg2hE1QkLSlJ/8iDVFkzCsnHIj255zvzZKXANvwB7?=
 =?us-ascii?Q?A0D7RrmWn96wsN8P6cDvDV4cYfrgiGJm7cRnAdO5bC2gKmlafyS395nbm40k?=
 =?us-ascii?Q?XlSf6YQESZKrSZ5A8bzHlvI0zL1MCwJarY1nRN58Tq8jQO8jRiPA5yYJf7Cq?=
 =?us-ascii?Q?aG1+eqrxlDouFmWtrsOomJWe4P2WVot6+2sXXRLkODccn16wCrv/dLple8G6?=
 =?us-ascii?Q?SO/pnNfGT4xBrj9LIkiZWEB92i5lnYxzIjvbyoDcB9F+7ip3rPsXb1sNeWF0?=
 =?us-ascii?Q?MA7PUOHyQfwmyMKT0cQQCS7pdYCmut0VBbBZwNbkRzfojk2aI0w90On12xaw?=
 =?us-ascii?Q?R2b/KTtaVp54mB6CFlv+2uxSJ++nIIiRp6lNJS3FsTiA++SkzsatJqXaOjvR?=
 =?us-ascii?Q?kYNE5gTmhPSLFHdzc/QaKTKfdOwD/f0eEguZhqS6DRkfYSBJJq5xPC96HfTD?=
 =?us-ascii?Q?Mijr6ju8QteaWPJ7JGortpUe0z/DvAMqpVI7gaJJObDqZgUKdMHY2SNRCRHC?=
 =?us-ascii?Q?kj669AbV65MQ+5y2Zk4qq52LIhl6NxioxMXovYNU5zlDaB2d6BmtQ3I3Krk6?=
 =?us-ascii?Q?aaDHmoBf5VQ6UojJCIbMtzg5fDxQgXJ2W14cNAQPLP9gJRQl5qGJsjMWBSQp?=
 =?us-ascii?Q?dwDF1L3NGsHfNdP/Gip5q+Boa0Ra17vpv+AmaJTUYQcXhQTC3sQMp+uF3EKS?=
 =?us-ascii?Q?bRCcPtGAjaBjUsvtDDoEcJJAE2nsMApICSrRMEpe+ZPWwoFdZ2tGdeYZE7Jv?=
 =?us-ascii?Q?leoqhF2ajdyYPdyAft6T40wcvUfvbcYIdMpoZjn7D0vuuwH2b/lDfepsEo1D?=
 =?us-ascii?Q?WwlcPWiQ9yjhKRZkIbABIc8zZgwFMxVy6oxTuCNJrbhnyf3FPjt8ycgQS6wX?=
 =?us-ascii?Q?AfyA8YOJHA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2126478-c706-4692-b11c-08dee3fbe132
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:06:48.8586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bhgY0BU99T6GfHmYs2vmvzOIQT8xXdFEyLVoY6xybc04kttRYYwXULiB0Spakmp5YuQ5YMiAF37Mlgp0u6XgNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_050654_498248_0ECDD6EE 
X-CRM114-Status: GOOD (  10.98  )
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

Explicitly enable the serdes_1 node in all board DT files. This is
needed in order to be able to change the default status of the node to
"disabled" from the SoC DT file.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- new patch
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi | 4 ++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts    | 4 ++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts           | 4 ++++
 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts      | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
index 4bc151d721dd..1f946d3a4ec0 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
@@ -135,6 +135,10 @@ &sata3 {
 	status = "okay";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
index d16e27307275..954b9955b1b3 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
@@ -805,6 +805,10 @@ &rgmii_phy1 {
 	status = "disabled";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &serdes_2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 935f421475ac..39b2b04be532 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -325,6 +325,10 @@ &sata3 {
 	status = "okay";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 99ee2b1c0f13..df2568ec7f1a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -367,6 +367,10 @@ &pcs_mdio18 {
 	status = "okay";
 };
 
+&serdes_1 {
+	status = "okay";
+};
+
 &serdes_2 {
 	status = "okay";
 };
-- 
2.25.1


