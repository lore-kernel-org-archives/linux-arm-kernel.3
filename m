Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F94DFEFB4E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIfuowz8nSjFhRGbzmuigW80pBvrWEXFvFIfCinpINg=; b=L0qmYYbOqbyhWni7otRtrTK7HT
	TeS0xCVO027fVAAQIMc2ydkw69kKhAnOJYWRm+ULDteQLfLiWsJsspxpEl8738U55z+hI+I9MI9N3
	K6QutQLvJTyRxwvVKmVNeP38j93m8TJfoQJXXTR8GAbVt6i+zZA8bKi1TnPQ1UN6whPt5i99HnIbL
	t1J5XRTHyV46gRsyHhzrY5CCRDhtkUl0u4ax/pkqZnFLNtkzyJwI3BqGtkdf2Tqc8klH359+ymKvV
	1vovL4Qhlb7LjP/UnjsOFQUkzVxeb0b0PKRX7I9HSBAtZTzwsl1jWpfhz4Y9KVZIjZDi29CSi3wfe
	VxxvaJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvxSD-00000008LpF-0EzB;
	Fri, 27 Feb 2026 13:00:25 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvxSA-00000008Lnp-3898
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 13:00:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+riE8Y5QnDCQk+f+C45k9A/+70/4blT8L4bklOShlF6iL1+m+d9PQOl694oUaS5+4F2+YXyT54m8aSYM4L7u/opy/fWcasSH8tyO4npZ9/69RzfKztj63jJG7aa0YS869mS2QS2UbjIeVLMoui/qwp5by4B6nhOdwVnrAuOVvnMmX2OgC1M1CqNqauTHVsHEVPA7MHlcJ7IJpclAK950ojt9VZaE5MptpZFxLwSzBWFtENZIzJW0/qyNbhn0J526OfjcWtlbqKNNFMaOeKsnxLH3xu9iIPD0sK1Nsx4Gxm2QsI8obWj3d62ZaIHXPJaDJNTbIWBjNGuSUjdyY/24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIfuowz8nSjFhRGbzmuigW80pBvrWEXFvFIfCinpINg=;
 b=gxTcFRwabqE47OJQgevbcZPIAAubb7W7/EjklKes/EmfbYRrm58XRpFbSE8m4Pb9LwAltTSkvHtnGGjNgdAkQj+eIdKYdejmVs4nIOBRfTdW3TykIfTH2/C2snLJ+Gw6eNGBnbtZ5N1ibAac7xCN1jiHDPPGdxng+tovn+UNnDc4t4f8yDnS53tXRR5k/VkJanZA8ybM9S5nFM57cDxCwO/AjI0+AI1DAZ0EzJtZkiqqFPNKm3WMzb310z2BWXLtPAqPEex5oXwGTdPxlxMU0npNFMTXrUpfFbCpNVVaTJW9F1t9aJ3c/6jXzbFBTfOFQVmnc1swZaWrA3yRsWwydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIfuowz8nSjFhRGbzmuigW80pBvrWEXFvFIfCinpINg=;
 b=JzPifqFWZRMJCEPQP5k9xLOxf066O3Lo7bkdY13UMyZ37oZVhTvc0Jv7tZORzq4iZ/whH6OhgF0Cf3Bw5k/GdD6y2SihyaEWEMj6k8GjEi7KE1BsLPGsUG1bLEw2co4KmLL++HpKKHmOZNComT0IsJBNQR59IpwHyrzBdKISSmrqRD8PHPgQ3Wi8lkTf3Hd1+7Pmh3Tg8Exn/XbJ867PjXhYnZAhLnqiEJpGk6icCNcLoGVFWAAzbXfElCQvo4N9fHJ666GG7fluZZ0S9vpei1dd2nIEnE5cBSJnXjER3UhZwoXOYfV7RvtavH0iHv0J4JT3Ulu6FpH8SenOMruA1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PA4PR04MB7904.eurprd04.prod.outlook.com (2603:10a6:102:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 13:00:15 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 13:00:15 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	maudspierings@gocontroll.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [RFC PATCH 1/2] arm64: dts: imx8mp: Make MX8MP_I2C_DEFAULT independent on drive strength
Date: Fri, 27 Feb 2026 15:02:41 +0200
Message-ID: <20260227130242.1702329-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260227130242.1702329-1-daniel.baluta@nxp.com>
References: <20260227130242.1702329-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::20) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PA4PR04MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f0154a-29bd-4524-56c8-08de760026c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: y9Tsj9gTdUVa8+1R19dChR+fbuX0jsUbhPFdasyYFunAorWHQBCJVXyqg/HZ2txC2cDO5U+LhsO09r+MknHLIGbaMcs+eeA3pIg8kq/lI4E9ap4PWoiSDVaHv+C5tJxlu2KvhT9YMdrrhLrXxRagUnXs0wFhdoeCdBDDw/I2tey5AoiIEdK5R309u7IQvL66e1grL3/w3kanMsnCfOSg9/ikoTSJ/UHr8kEwBTzB5CKgR8SPaLjY5ROJnhvfCP5b9O62RR8HPhcDQV8RipMCmDOtr8Z98KyfCakCB5hUZzVh5pQlym6+RxcypVAvtobpKKQdnPnHHVo+5W+juWJPovkljH3bFXZ6YPJzxjSqs/XVCimvyYc0N+XMxWiq+j+XEOchdFIx4lXEfsgz+HufBTB981VwbVeyMnySg1cke97QiivTDzp+8koVIhig+dVYgPoChB7dD8caTNhQZHAaJh5GPNjxquzkHAy/PdrXGs+7u2mYSUrbnvaxPORG5DDdWEqbXU5gkKB8QAONbJjYc2W76UHzo+Jlmo5cxOBoGD9wyqApFULFW0Vc/ISFK3Wn3SYFkH37W9PBTZOEYHpcwums29vEWikH/EM7V/BHZ4xUhbj/6PeZxfr5Fdo+5/3KagQ9DCdQ5h21T3kh3rruqImLOjWSJvO8oIRwaZfiWPd0z5wDDfbwotWtMupS7eKG3FXc0BURBw036/jj/zZIWtLyWUB/0U0UyKfwhyawjym5eLQSbwmQsYZo/l0xMA8bffhnKfLbIsTwZP1Ng6KfsLLXnxCgZU4b4A8J5eCNJPU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?puIzB/p8WoeBZrXHbTKDZeihoG4CYpM1Z/GEsh83Caw+3TLVjWzAwkGqsYIM?=
 =?us-ascii?Q?6S9enIetosPzeqBzS42AEEzoMpCbJKqwXjvXgaELZvr3W9ce3/e595ZeX4rl?=
 =?us-ascii?Q?UCWvPihWhI3Hw6qprxeGuhm7riDXhvW6MUKnnXLH3qoIf6hmfckM1OaBog8k?=
 =?us-ascii?Q?SKAfZKsOtORk976T8nYGBJJ8odEftzpobDd9In6SKndcFuLEptVBUVaWEKve?=
 =?us-ascii?Q?UdK3iArgehaznRHbqhaVGlnYBpSti+ZtwUVbXtFHIDN+EI72bf2KSmJOMp3F?=
 =?us-ascii?Q?LzFF7+Ho+MhjZSSt5tb8xRphtp4VvFBegwo98BU5Y6cGddtCWEEwpMhBdZ6W?=
 =?us-ascii?Q?tRAXNZtfOloJWyBqamL5aNXnM1K7HuDIqzmvQkSbY+M3H6CEnZiQ1zbpA1Qh?=
 =?us-ascii?Q?8GQlqleG9xe1zztbKkguwoywYzZ09+647VWP78hRJJEDomNa/g3Gh9B8kTdd?=
 =?us-ascii?Q?k/vYsexSJJ3Sbx9qf4+JxRBk98bK5Z4wEsCgEwgaNwFa3tB3zhhbm6f5bR8n?=
 =?us-ascii?Q?hVn2xsJap4Q73+XUeD/a1nLRm71+0EDrLxqqibAyjbF4yRN4jaowarZ88ymf?=
 =?us-ascii?Q?6m95pi/DU3Ppak4HvuBImVmR5Eb6VDOjmUigwHP7d37SX+56DaOBt8deNEI3?=
 =?us-ascii?Q?7lZIduEy4X4hXCGECSkyiYMgyGwqVCXTmQ/brlReO7Z3gUbUmvoX50fmz2bm?=
 =?us-ascii?Q?oKXvQN7GdZ10pJO1cnhz2MB9dif2hdHVPraZS5cYDV9s+hLY4qJYprmnGIWN?=
 =?us-ascii?Q?bI3HDpADAad8dss2f3OCVpgQs2Zo0SNvc1BcXX9EWnQSt/N/5IPksL09o1zJ?=
 =?us-ascii?Q?dTQvPFfw3Fb8++ubpLauTrqpgG3rp3luVxVsy7v/PVJLYAJA8X75B8sx4pB1?=
 =?us-ascii?Q?Xba3c3ohl+H0uRDbcHfLNPZP5wCkoPwSZ+DzoouJi1DjM7KSj8nDXVWH9Yqc?=
 =?us-ascii?Q?GPCL/nNfKITe+j2f4Sie5WBGDYMii32PEFfVR714w7G0Ip9DA8lhMJMFnbKe?=
 =?us-ascii?Q?RoNbzFRbfvIJ3Z3mkoRq8uEQISwqBtrNwbcuzHet2RY90I6uH5ckX1mjEN1R?=
 =?us-ascii?Q?UOV8vCQqIHxinqVPqcY+ri5sd7sKfNzK+8X36fdUhPtAMMvU35FWJAug150d?=
 =?us-ascii?Q?SBHZG+3AEyY7Jr6O/YFMhF9cjbQXUNUPlx6u4gclkOOQyh/Rc9rL2Qy7eK62?=
 =?us-ascii?Q?Xriy8eYwq09YVO340J7Zl9siy31gF9nwKhqV4fO1a1a7cO3X+1dr8UaAFodE?=
 =?us-ascii?Q?nEEegUs78hkgQKHhj/Vo6z8oFquH0kZMa08Qhv7Z0iCE+ChhsmNeBwPA830p?=
 =?us-ascii?Q?+iTRGy5yvDaG4L0KIrTwvpriqaHVkDys4902fx4na19wg0l0sqji/ShC+qnl?=
 =?us-ascii?Q?ZU1f0i8x7UpHAnrk2rZtthZwDN+/XwQ6kxf3kwl7/knzBc6H7kQG5FnoNrKq?=
 =?us-ascii?Q?WQqquOufUTSMNb2JSlg9ajMn3MR3Qv6ouZf+qmWJGSR4JiVW26c31QmEHEBp?=
 =?us-ascii?Q?GqgBrqoFqCOd5H2vLiYhD2aj4we8z9vyBDhfSrZNd6hPNC6L74ycRfMMth4H?=
 =?us-ascii?Q?oGvOcJXxM5yluc/IlcwPWAzDy10jz933aso7b4qLrzhYUsUgHZtgH4LdgIzH?=
 =?us-ascii?Q?AnWzZWiq0YrZqHAeaea5u+sr5+SR40bl1Z1A2KO/ymqsWemqkuXfwKN58HJi?=
 =?us-ascii?Q?6Zb3i5T+yxZXcpiA0W/zejtZ0GWk/PEBjy1rL8gLPOOIoa6r7H9lJx+nEXNg?=
 =?us-ascii?Q?FDJhbRyYFg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f0154a-29bd-4524-56c8-08de760026c2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:00:15.7338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEWntERfn2OnBBhKjmkxEpxmUDqozPgNOAQwSz15rxqdBPRXPDrJ65IiKnwm+PiHDdY97iw4GiSKaHODktqeGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_050022_789094_3F3FC77C 
X-CRM114-Status: GOOD (  11.29  )
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

Currently MX8MP_I2C_DEFAULT macro includes a fixed drive
strength (MX8MP_DSE_X6) thus limiting its use to only I2C
pins that require X6 drive.

There are many pinctrl configurations for I2C that use different
drive strength while still using the common I2C default configurations
(pull-up, Schmitt input, pull enable, SION).

So make the MX8MP_I2C_DEFAULT macro more flexible and reusable by removing
DSE_X6 drive strength from it's definition but add it in all places
it is necessary.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h   |  2 +-
 .../imx8mp-tx8p-ml81-moduline-display-106.dts    | 16 ++++++++--------
 .../boot/dts/freescale/imx8mp-tx8p-ml81.dtsi     |  8 ++++----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
index 16f5899de4152..26e7a9428c4c7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
@@ -36,7 +36,7 @@
 /* long defaults */
 #define MX8MP_USDHC_DATA_DEFAULT (MX8MP_FSEL_FAST | MX8MP_PULL_UP | \
 				  MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
-#define MX8MP_I2C_DEFAULT (MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | \
+#define MX8MP_I2C_DEFAULT (MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | \
 			   MX8MP_PULL_ENABLE | MX8MP_SION)
 
 /*
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
index 399230144ce39..87b20b8564583 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
@@ -302,36 +302,36 @@ MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL
-				MX8MP_I2C_DEFAULT
+				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
 			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA
-				MX8MP_I2C_DEFAULT
+				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
 		>;
 	};
 
 	pinctrl_i2c2_gpio: i2c2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16
-				MX8MP_I2C_DEFAULT
+				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
 			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17
-				MX8MP_I2C_DEFAULT
+				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
 		>;
 	};
 
 	pinctrl_i2c4: i2c4grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ECSPI2_MISO__I2C4_SCL
-				MX8MP_I2C_DEFAULT
+				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
 			MX8MP_IOMUXC_ECSPI2_SS0__I2C4_SDA
-				MX8MP_I2C_DEFAULT
+				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
 		>;
 	};
 
 	pinctrl_i2c4_gpio: i2c4-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ECSPI2_MISO__GPIO5_IO12
-				MX8MP_I2C_DEFAULT
+				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
 			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13
-				MX8MP_I2C_DEFAULT
+				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
 		>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
index 761ee046eb72e..bf49ae942d411 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
@@ -425,18 +425,18 @@ MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL
-				MX8MP_I2C_DEFAULT
+				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
 			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA
-				MX8MP_I2C_DEFAULT
+				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
 		>;
 	};
 
 	pinctrl_i2c1_gpio: i2c1-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14
-				MX8MP_I2C_DEFAULT
+				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
 			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15
-				MX8MP_I2C_DEFAULT
+				(MX8MP_DSE_X6 | MX8MP_I2C_DEFAULT)
 		>;
 	};
 
-- 
2.45.2


