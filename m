Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF19AD58E48
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fL58WHoZ8zrsfb89AkE2FO+mc3tC3SUX5xYJmYWFwYg=; b=BYDYtOQF16fdZt8ExF6krfIUSe
	KPjI2avn2seNVwr0lqV3sLFw7tOiSWu3hS3JFz1y1AYuFKw2Il7V9db/wRE48e7jr0JbHaLuEbqqf
	NkXeOe/3wzlmoryp4RqkDTsaoV7htjX0Juy71uYkaJLNcVEMv62FJj2erD7izkBpJEQr2RR+fkXvt
	C2is+yqC+oNzRFafiUWjfCfyQBiNa7PWspEv2ztAHf//cUavr/XeM4ZUZwYZcWlL+voQt7hHlKyXx
	11eJSZCJ7sK6YFkiDNZJnw9M7aFLzbmPTe9oJ9o8MgGPRuIArx/p7D30139mtPGY+fuXJJWndDhke
	unlH6IoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3R0-0000000D81Q-0QXT;
	Mon, 02 Mar 2026 13:35:42 +0000
Received: from mail-swedencentralazon11013035.outbound.protection.outlook.com ([52.101.83.35] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3Qy-0000000D7yZ-1ZuM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:35:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMJaPPd58nt9KWQUsTUmHEeC+mL83n/2R/nDD+E2aG0grsnbd/8SmnVP5uaqfsWPnF5M9vsCa9P7TmmV+JvZii12DEXRYmNW1xWIxgDg9BqFuMU8WzgFvvFM69fEF5TVqDe0xf+H6ytrToKVS1mHWwukms8l83GvE4hqmCmX+Xa2Lk3XkCbB4NXiZBoNxnmTWTT67Ftoe9VbubG91FuV7Tiv2XOo7Qk33GbvSvLpbItmLEWv8dfHRqXdo/c6r2YEl8p+z92EZespD8yyZDGsj5syAzk5x4q+C3U206+UbGoSsUpUZ5/96SXepseCCxnNaY4+DqUknTkPWw2d0DFU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fL58WHoZ8zrsfb89AkE2FO+mc3tC3SUX5xYJmYWFwYg=;
 b=haW9VGEsXIGUUzFHoXwK2/H8qk1DwBadHlaasvMRjEg6JdSzNep+TFZK08l9gF0FFJG1M5yCLds82Y0HtBLfc/V/XBVvSLo61hD6pYCXRwF6J1JruZUmo2kSVKNm91+PUPYHoc0vOnYM4v1lXoeZ6dDeb1sOGKsUXL5gDf3RmKXpG/qtj5tlFSE00q5eUivYZG2ynlT2E2lizw6FU4k2lGQ9hLJTpVYXN/vJRDmzsETgX8Vg14cXu3hcgkIqH1MYXIPu3BpC+yczgAkmxhm1xVW3K9u1LJZP2hx4CxDefH2K9dIxlwOebjCSEXlsWiSCYp7GA/QRLBfTziZNzZmwAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fL58WHoZ8zrsfb89AkE2FO+mc3tC3SUX5xYJmYWFwYg=;
 b=P4z+XgJwrd7jyQg2DvlHKcLFaLFRdsASX/Ibut0YS5t8op+TpoO59Ytqkqnx1ZyROZcwkeZHrzJ4WLwXDJjmScMAjgxDTSLH4EsixVjAnTF/EWgQOaH7RQTZbfDQUq5TWGJ3LgC3r4dbTJZcu7IK2nBdXgIWOVDstCH+vIrqawfMjuJqG3ncNZRKrpjVpw8Xf9HuK3ZZrXTaF74fzretWalctVwWtV8d9CK4jIgZbn9Lt0cN36lss3yXCQ5CsRj4HqyxlzCb+zGxm34LJAp5esrtlvy8dJKOO4PjZ9J6nwTiaG45ToJ8Bs9cSjgK6h5dtCTvtZZcoQtwpNCtrjcpSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 13:35:32 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 13:35:32 +0000
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
Subject: [PATCH v2 1/2] arm64: dts: imx8mp: Make MX8MP_I2C_DEFAULT independent on drive strength
Date: Mon,  2 Mar 2026 15:38:04 +0200
Message-ID: <20260302133806.76191-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260302133806.76191-1-daniel.baluta@nxp.com>
References: <20260302133806.76191-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::9) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be20f8a-e627-4c3a-9493-08de786093b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: +vX/FqWm6Qck5Nz8uSOuSnmzk6zVJ1joaAc/uBf2N3vSOqT1uG1W6hjrRNJp00gnp3dM4VyHahSZ2QVpK1PZt6BaUf6S3YB2plkobtLTHY08boYceccyK5w979A4ZEroPgeG4vrhqvBuEZ8r+PZRt8tazhk5tCwO6pQaql5Uf9ZEr8yGRFzjJo1vxferzgSt9MZda+9PckVafWbZ37y0xqvrS0F5L6vmWt25+1hHf7noqFqwiAUfV2Uq7VT7G3o/tL0o7SPssyAz1K1PVNNPCPj9PZepm9OrBkxln8DxwyunC/1SIKqZj+W4RBwaHAytaJhcqjy4arw/TRtxwzFJ6qiy3GfEAhrlzv5f2guyieE+f1/4eol7A+dmw4L4dG4N4k+OMpQHd/GBN9Ajr1jqyXPmtAwXF5i4cdjlqtL0dZ1QrgJ414rYuHYYv+xLJKTcCgQ/+Kgih7Rk80q8AaXHRCOBFQybJLHLSSkAA9ZzGwHK0T3IjCJ/X2IQxh9W+tGPmBXeac0OlpUC3qcGZ6v2lbNdHkaKa/9TtYRngu9DkY8YfEP1aFfFRGnB0L5eu/u0sXQXi6FqlBQl0CbxJZp1vwjMeBfcdjttt+IPenm2Ky6TwFd1mzkW2FjYwZSRYYh3zOKkkPJB/zvcK6Hog2vIFaTtpnZBtLZX8OPocNZBAPIiAUxpb7IqTCsiDoq/myY3MXPf15+DktPKGak0XmSsp8KbhRmJnTjOEzt7eZHx8lnmorgopZ/qydLGjBKWaSYwHcggswxIidBWJUx3/f1gjyE5zHnhC6zJOrujNpdsbNI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bl9yMFH/I9LuybF9Cr5hX0ekMBjgRQqH1i/JpeQpUJUZPsGBIBNjWrVWjb2Z?=
 =?us-ascii?Q?z2uwkjFbIZUIEfuTec6BOA5yEtFGDGRgqN2Hvd5cJyN/2IPoGupoY90zRR4I?=
 =?us-ascii?Q?cRkv6E1cUVbA95d4Se0RrCcPda0qsDftoggq8mt2NZSLHeC6TRmPNRkGMf7H?=
 =?us-ascii?Q?O2merDCXA5DEuS1HQBprQ+f3QGplzZ1pg+EXf7Et0DNy0tpEuRhxoEbAc46W?=
 =?us-ascii?Q?hbXEc+G668jWbW5Ct4OdsJ3gpWFjnCrJJ9AdknCoVInZygAWi3zPNoV8AEeQ?=
 =?us-ascii?Q?5Xf8olKfawy2IetA7x3HITEyctzgBzPp+EWbpE4NkGqVNOO33ryi+sjyaL3T?=
 =?us-ascii?Q?J6ZCeYNSsIrlWjtn0FChSXSLBmpte4O3I4nqZqi6qEI3KRdT39PegS7T8d8L?=
 =?us-ascii?Q?AGweAfSlUnR4H1LjlSpwW0WcK1/um595EZIqydo5gN+I+hhQEghgr2aBd6y0?=
 =?us-ascii?Q?Hl6ml1+VN62Xymdz6mkiANWZdhyEelsBw7E1rNeUdt0gfak9w1T/qC1hv2tx?=
 =?us-ascii?Q?Q5YPjAatvNntHGlDnDPDTG7HsW+isPXMddSUn+B3bGujLnSAtX/1e6DXxP0U?=
 =?us-ascii?Q?Mi7WSBvTkEpvHax9sZAUPFHL11OCbhDC1PeA9r3qcE7AyqzXYst08KR7+bw7?=
 =?us-ascii?Q?1kVJN1ptbHKkwZmZvu4E41Bc6FEmg3Ubt9Wl+sr5LWrj9J04GMi9l9rjo51z?=
 =?us-ascii?Q?mPjrfXbMdWf5gbbPzFnFvFZasx7Oq0OYIc1cuUTHZqPWqxHHwasaGY8b7BF4?=
 =?us-ascii?Q?5orU3+uwzvvpx3WWB0jnWOOrey8peZyM5dT0s4OyDRJ99DW/M0QUSg4833Yd?=
 =?us-ascii?Q?oJdwXrfAjPTzSd6XXKbWpOehr3Z+FY4yslB8OdhK6c40SdgSl+CDbB/YAiHB?=
 =?us-ascii?Q?rST9Ji/JaEeSynUKPLFeaopTxH8UM8AfLiA9wU1HrQG7KUR5nP5ro/ZcoQ30?=
 =?us-ascii?Q?YoVK9dbV4gcgttHO+XzpQSMfrYWl48rb0nLO9H3ut559LKa6gA76xZ2rDIUa?=
 =?us-ascii?Q?xW7p/MqO2Mx6Xvs333M3xXNssumYw9aKo1kLbQ1SItoRR6QCpUCzsi+bSUKa?=
 =?us-ascii?Q?Pyp5SkQ1ehZOumCMCd7wxsnYdSrlFTxafNj7m65kVnv34hjIldIVXWmfcHyS?=
 =?us-ascii?Q?lsSzTmdbR08xe8EQ4LnopyCxgUU6hloKmIskArNymul1sIQL+Y3x1EBKJaGH?=
 =?us-ascii?Q?xFVLeozN8Mnc67k3c2X6cXio+f/5yi1hQ6PRJSo5JE6iHQezFwLxqie9TLaD?=
 =?us-ascii?Q?4/mw0cuYQCudpY4rMUO/804Rvi7G71xS5kMTr+SuJb3nwDVsGjeX/siorLRF?=
 =?us-ascii?Q?0CuBf4FFOLzaX9bxuTyLgFZn1LjzKB885jQttTRGfBptTjA3VZ4M2U85u1T6?=
 =?us-ascii?Q?oKVTekZGdDzzVw0DTnsvMoXHaK0WKhM8nZ4Xwuwx49uo6on6z1LW6ZB3k9kf?=
 =?us-ascii?Q?MUTv9bXdMsx7P4Mju1Kr/Lubl36CWFsdhFed2mSzsYgagrzzv2me2/er1gHy?=
 =?us-ascii?Q?t1Pp6NH3Fk4eIID7aG5Le+VLnnIlvCobQthPOSiPFTxUD88YAG8I8MBIvX3Q?=
 =?us-ascii?Q?Di88kYO4s/LO6xbzAxYIcX1seaCr4FepwgDgQr+Zv+OaALvJ0cD5eR3UoxT0?=
 =?us-ascii?Q?cOUldQNv/JHIIteoWz54s34PsCXgOCMtwy3wVlQ1lF9xAHANcu74Qdrcw9Dj?=
 =?us-ascii?Q?M3Sd3pQncSjbuMNRHjoCfn0JrtWC6baRERDlgZHLnxLrftP4QMbyg6juOrJz?=
 =?us-ascii?Q?YBgy5QwJ2A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be20f8a-e627-4c3a-9493-08de786093b1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:35:32.5138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPyfcQikqM73fKnaIwPSEuj3tKDgRFv8x2rBpVyWkyBSWgMr33uJ1T/CHaFIYD+8pfv0z35QmSlDpXukWctlzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_053540_417370_25398532 
X-CRM114-Status: GOOD (  11.96  )
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
DSE_X6 drive strength from it's definition but add or it in all places
it is necessary.

Reviewed-by: Maud Spierings <maudspierings@gocontroll.com>
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


