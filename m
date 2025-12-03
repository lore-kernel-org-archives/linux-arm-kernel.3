Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C098D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 07:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffX7Cwxf4FNeiStsXGle6nZ8BwVsyBExIYL6Djti1AA=; b=32tW+upzl6ENSLFK0d3ueZxF5R
	HJi1ConUSjNvUwcyQbBYefjHxXo1VrzgtAzSWs9J68XB2K+V+v8VbmixzK9yfe8TTTc39QHbMH6Mo
	uOd6ZSEoFgJa3LizshaW9ia3OQL5TPpwXBBtF4Vtqn/S3AOBdmCZSiS5NZn17OpM8mtPxr0s1Re0x
	5fuHd3neiPVk3h0dDgaOnlvJ8DvKf+dZzYRkrgeoov46ybO0lcDk6JNuRAYo9nFt6m+LROjFtt5jq
	fP+yOsR+8wUSB29JIJn51qOJsw6aWnjLiFZb45vBXe05X7w6k14fLrKj6W7uZHgWJGKZn9N34fFny
	Q/8gLTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQgx2-00000006EdT-2HdR;
	Wed, 03 Dec 2025 07:07:00 +0000
Received: from mail-swedencentralazon11013050.outbound.protection.outlook.com ([52.101.83.50] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQgwx-00000006EXm-3Rjb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 07:06:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdZJm38CfzZyueaFAmpQSERAHWo2Csszvb3wFC0clRekZKcP8KA9yMN+JzsJsEEz2tF2EmyZEl0TJS5g6Oa9FXX/PEzBzX0E3YQ8uBz1wI3EUkTQOIAsGcxgZ35/hcSDsVul1bshQv8gmV9cZ+WXa9s6clg6axmxWHWPlDPE19LTak+7vE9ynMoiNf36eYlGEFzL1+4fnPSqsBGLe4ZmNDSVN+jGBnCidr5BwTpLz54rdV/AYjJwPiDlfg9RrWwRSJwnk14YHqT6mb9SvhF9pD3RbdEBPpovWb0cL0rrorML3Kq5MRiHoMxI/WOXTthIkaLWW0BKUVpZvukr1l7zKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffX7Cwxf4FNeiStsXGle6nZ8BwVsyBExIYL6Djti1AA=;
 b=hPMFeR130RSDhImvLdwFUL0DU+RNQ+AMgsPJAtEEbfGl3HNPSCbSnPfYgpuBF5c31er8g8RuHfFKP6JlP2BoAaRfCehZagl2rLdHHKnUDriaAmntsee/Z2G/bp1PoVq1QaQnh4ViGVHzVEjq1ejRJ51yPXiFYO4YjNbYr/LZ5+n8WLOFRj5wKOK1Y2OvAYlwPoA/nmqNl0KzFFmAgELxlwRfUhVgYuGXWMqYv/seM/EtTlrA0siEI9KasOIhIxI91ruqZRaBGI8MuZane+CSyE3qQEAIIE4xF9cZbNjO//Dx1rvUFtlQrv+hifwppzBRUm77TV8TsQ/ih06/FkVPLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffX7Cwxf4FNeiStsXGle6nZ8BwVsyBExIYL6Djti1AA=;
 b=ns6doVudBRcGe/2ZtBVW62CuNYbE1r/4Wzk32NSIi6DRcCUgxgbZHq+uAICjVAvZjAM1DQOjM4ZKfubdQftABxNBwdFQH/PboJRHU88RsU0CjRe7yMBnNBF3VTdpawfqvHVLe4I+Wih1Ug/gACjRdrwv1yR8mlhGZGr5ilNSjuGOcI4sdg6lfPt/nMLTMaHiX6fusScmsM3JDe1F0THoYe2jLJ1tIlMcltXfBr9ZkAgYJSJexjjrtqvcQkxvYC7hUoYCxvdyvKbsGTowetC797zTBnnstfjeek0NPU4rO+ErDqeC9IVdnvOkuABq6rqDxIWCdaGPIWYZrbhlZFh68A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS8PR04MB9174.eurprd04.prod.outlook.com (2603:10a6:20b:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 07:06:51 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:06:51 +0000
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
Subject: [PATCH 3/5] arm64: dts: imx91-11x11-evk: Add WM8962 sound card support
Date: Wed,  3 Dec 2025 16:06:03 +0900
Message-ID: <20251203070605.1868821-4-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f491bfd8-2cf9-452c-1d04-08de323a88bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dzuagUVV70yuqxmDUQKtw6JyGs/fCltP35ySlZKCprbLIyiUgLxdaxoPgayM?=
 =?us-ascii?Q?zD5vy0gSSF+po96Mx7Fh2aXHob9G0gKS6s0f+rGv95MKFGfBkikwJx93iTrb?=
 =?us-ascii?Q?tbCAvS7wX8hoLk5/g/aJklPQcPhTHnh4ZRHQvZ03jtwtibhyKlkYJ7acRR5v?=
 =?us-ascii?Q?cLwXJFJJVxxB9WfUtQ/X9E6qrBM4Pw9cvCOpHsMk/7WWDvexgUeZxNvO3lo/?=
 =?us-ascii?Q?gKaenNxujytSuNer3OLGFIEdljp+SWJ3x8EYmsprtVNKae1NVk0bu4JYhytK?=
 =?us-ascii?Q?DlGkCMFY6dJQjRgJk5cF+S0SrmHsht0Vkt4Sv8gix7LPZtK+tFCI5HCQGz8X?=
 =?us-ascii?Q?AYg41SVGS4qfDK+JBMHA/KX7EArRJvnEH1YcPSxgtv8YQZLzZW8TH4ouJw9K?=
 =?us-ascii?Q?ER7iKIZjbCF6FECCogv8SIT/cam5MUxq4ALCrT31akp9bBD29Nw2RLTsitsO?=
 =?us-ascii?Q?Wd+A6H+J7yK7vIHu5LN3Oa6CEutOos78LCnrzQ+YuIxKpzdGt0o2DTK2LnLk?=
 =?us-ascii?Q?jutfw60BxC7xBcSMFRivFyN/eQmAk+LjacJfGFRSiobyKwTj99pCXOLO6/3z?=
 =?us-ascii?Q?9e2pOZfo4UihTF7btuR0UJavXCUnLsnVzy7ug9GGLpPmBgCHpTxdVdFrXkmH?=
 =?us-ascii?Q?YrTo7swHeLJ8wzVY5OOUX18WXTnQVj578Na8UpXSeSWTZV/blMWVi77Lio8k?=
 =?us-ascii?Q?kyxM9Lh0SoglgJZG3cLiAtoRdO+JqnFye/Bv8qlQkB3biXpqb+16VONF0ESI?=
 =?us-ascii?Q?mRrw+fUTrUsyh5HxpvwjJsi0GvoskqWAEOXXYw13Y0hWw03+D7B2NpsAZW70?=
 =?us-ascii?Q?Z12bClH/Wes3yFZZQ7FpE7dstyQXAy0PMyE7qlMvMNKrX5wnQ9YqYJ3QX7kd?=
 =?us-ascii?Q?mXjSlPE7NDx5gw+aX5ICEg8T+QWurcplWfCVbr7Cvn+gx0ie4DYSbnCgGH9B?=
 =?us-ascii?Q?p49EmLa4RcSP0n1m92/rqquG3FnnNPl5ifBo73zlsodrosiW63sDpq1ij7Py?=
 =?us-ascii?Q?rvyfLRm8dXWVALa/F95BLKQdJHvWrO/XIMtEqZMdwbjhbLDg6TcHd0XzgQBK?=
 =?us-ascii?Q?vc4u9kt/Q+8Nlg8r6Pnz7ZAENyS5HzMGe1BSK3qnxixkGxbXU3uMmD+7FWy2?=
 =?us-ascii?Q?XqyvV7Rgi7hYaGFwQuDwhaWXPZt+66qOP4OstbV4XnlM/i/t6iZLyrRyPx86?=
 =?us-ascii?Q?a8QBVQYberqJZ4sEqvGufpY1E6tWZZYGHPeJgZ1Dboxkv2Rb3PN9mdHANvp6?=
 =?us-ascii?Q?27sEWj2Qz8rT0j06fh0CDgAcewZ4B2UDy8ugnDdOpiWw7FlKbyggGEyxtWjn?=
 =?us-ascii?Q?nh9WcQgHgoOL5Tq20l0/YzrfmSqQEHe+1/rICeXzVPBDEk28I4hB0XJiL+Se?=
 =?us-ascii?Q?esJg4pnHMeKXCdYckpwWXvfivEidiIQVb26y/I0RORlcEi9vCmqmEsZxdGzM?=
 =?us-ascii?Q?FVzoYFNKsMYhV9cDaz1qK+svXpCZBy6X2KR8JA2AM72C0GHS8GOC4edcSg3U?=
 =?us-ascii?Q?8Gs49CA37yDYO72Samdi5ekk4ESGgDLnMpBLk8L2kq3fN+9FnnbWiqDEoA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pjZXwP2P5Bw2mNnjbKrR8S304O4/pe4P6e9vrRDaxSd95reVnbu/52/8Z2+3?=
 =?us-ascii?Q?OO+QJm8x+2j6CPi4II5B40NYa4EXZUR4qpyp2Y5153Kcyb1zbTkRLHHg1JyO?=
 =?us-ascii?Q?+UyiX+pB9zNrhynblmACv9oRXCr+e0qOD4HRPlM4rJVl0YEXbhK6274ZVJGU?=
 =?us-ascii?Q?jhfBRvFsdogJnJ9netWM73UbnhFODxXHxNK2fgdigXMCd11RGYx0lcqY9QZ2?=
 =?us-ascii?Q?09lfjFh1O/P3Ijd0G+x5SmM2Che9FwBWs/z0XSOxwBDAaCf6w/pRQ3Z3TIHm?=
 =?us-ascii?Q?NvNmq/CxRYTt+F1kAhtAnWedDt7gTCXrMA9V0H+BOLyi74F5ONB50m+LXDw0?=
 =?us-ascii?Q?l3rfyGccO1+prASUBwoGsSk04deglJhpBFT94cy7TXx2Y9b3PZuWfT5AUjEG?=
 =?us-ascii?Q?XaOmmEvFTr4b4+ODmeYgh77LvhXcrbhgHX/Db1HcsEjvmpFNeA0tuXpPV+vY?=
 =?us-ascii?Q?Lgo3OkiGNe9S3yM3ifS1Uw30RtXJl+oi9yoXTg3HzQNDGSGc85+WWj/lUilc?=
 =?us-ascii?Q?pCDnZklGdY9sYbtKsyysiWn7Ftmw7VI2lvsu7lwdKOyHRGcutKGurA/9x0Lb?=
 =?us-ascii?Q?R/m7LyMOombujs1qvBLDKSM8sLr1VSITEuw1ExWL3wpuS8nd+DFcWixrXhOa?=
 =?us-ascii?Q?Mc7YWCMH9c7n+UOFmfOBC0nrWHYHeBwrFNGn2XRoY9uoF8y+3xzCVQcvhpgn?=
 =?us-ascii?Q?gv21crM2gqyjoyxBswBT/auVRmr5JIUvx1jcFL/R/MWo78GH7+F90pzpM0+K?=
 =?us-ascii?Q?Zf62WXtrugzZF31/yoQ+ld4y5Go0w5bmdnANve5DDyg7bVMED1e4kyo1W8Bt?=
 =?us-ascii?Q?dDxU6KiJnw6Zh2lHnHnUtOh8Yuh43+/o9w5XVPf0JjSIhk4HPVIzgJdN+OF7?=
 =?us-ascii?Q?sH4jWRvT5zRqEPLQHMo4p38seB0YGDbSCq3OJkMujnam5kdCYlK/XTlKsj3B?=
 =?us-ascii?Q?bHuEfgzmbAIV02QtKa5tyZSpOHkox4t6LOWG1bfj70XHFoBRQ4erP+9x0ULj?=
 =?us-ascii?Q?NokihDrkHTe3FdJQo9lYylQ3/SEAOV+XIJcfRRiRYFwZX3ycDjKM0jqYEMzf?=
 =?us-ascii?Q?O7ZH2Pq+AjXsVS3MGv3l/jCXbBTqVZgUMs1eTAdoaylAo2+X9nxuwUSxGnd1?=
 =?us-ascii?Q?Ek3jrXhEKWSmZy9VyA++MkWvU0hL8vn9EDQjyldn+Syxe9g/mOQX6SlL/htQ?=
 =?us-ascii?Q?HY/lil+bVkOqCfaWLDycpapfeUzsAoiHCeUPRwAUfkii8vAk1aQIJz+JqsmR?=
 =?us-ascii?Q?YSMGXkolUcLwVX558Mvb5V1OQ/ZyRCGnUpbt/NDc5tGEBglcQnHBOv/TV22c?=
 =?us-ascii?Q?hjisQ0VnQW18isYukc8hn4ahPPyOgcWJs1ESB2K8vyQnMYYm8mMYWR+FOkPD?=
 =?us-ascii?Q?USIneyayMlICd50XpE+TzbXcq2iQcrqkBeoYBnIid+UG68EUtC+dtYS7c0Sj?=
 =?us-ascii?Q?RTuI2J1PnR/eiWrqoPpJbdTyjLN9te6LKFWWXrX+/LE3hxC9SGIBLlbo3SbB?=
 =?us-ascii?Q?qXsGi4apbvPsS5v9bzJAtbzhd3DR9uTZcXmC+bPaqEDHl5w9CCFh44qlk707?=
 =?us-ascii?Q?4hZZGyrwRIdXDo1+YEJ+nRgxHNj41n6mtun/mMoy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f491bfd8-2cf9-452c-1d04-08de323a88bf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:06:51.7620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +k3D2scp5z5QuErLC+rdkTe6HIgziK38Up5/bUzX33RYJ6D7kRBs2xMcr50vPPrytDuUM3eMlJn1Ic3tN4L/lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_230655_862790_2873C5D8 
X-CRM114-Status: GOOD (  10.48  )
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

Add WM8962 sound card support which connects to SAI3.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 55d2ccafc376..a70a9af50ab7 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -83,6 +83,22 @@ linux,cma {
 		};
 	};
 
+	sound-wm8962 {
+		compatible = "fsl,imx-audio-wm8962";
+		model = "wm8962-audio";
+		audio-cpu = <&sai3>;
+		audio-codec = <&wm8962>;
+		hp-det-gpio = <&pcal6524 4 GPIO_ACTIVE_HIGH>;
+		audio-routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"Ext Spk", "SPKOUTL",
+			"Ext Spk", "SPKOUTR",
+			"AMIC", "MICBIAS",
+			"IN3R", "AMIC",
+			"IN1R", "AMIC";
+	};
+
 	sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
@@ -407,6 +423,17 @@ &sai1 {
 	status = "okay";
 };
 
+&sai3 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai3>;
+	pinctrl-1 = <&pinctrl_sai3_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &usbotg1 {
 	adp-disable;
 	disable-over-current;
@@ -581,6 +608,26 @@ MX91_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO16__SAI3_TX_BCLK		0x31e
+			MX91_PAD_GPIO_IO17__SAI3_MCLK			0x31e
+			MX91_PAD_GPIO_IO19__SAI3_TX_DATA0		0x31e
+			MX91_PAD_GPIO_IO20__SAI3_RX_DATA0		0x31e
+			MX91_PAD_GPIO_IO26__SAI3_TX_SYNC		0x31e
+		>;
+	};
+
+	pinctrl_sai3_sleep: sai3sleepgrp {
+		fsl,pins = <
+			MX91_PAD_GPIO_IO16__GPIO2_IO16			0x51e
+			MX91_PAD_GPIO_IO17__GPIO2_IO17			0x51e
+			MX91_PAD_GPIO_IO19__GPIO2_IO19			0x51e
+			MX91_PAD_GPIO_IO20__GPIO2_IO20			0x51e
+			MX91_PAD_GPIO_IO26__GPIO2_IO26			0x51e
+		>;
+	};
+
 	pinctrl_lpi2c3: lpi2c3grp {
 		fsl,pins = <
 			MX91_PAD_GPIO_IO28__LPI2C3_SDA                          0x40000b9e
-- 
2.50.1


