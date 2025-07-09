Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6E0C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwdVa9Oac52R3YN5t2o7npSvnVsUX8p1Y21b8hZjc1Y=; b=bAL5mnBEtbu/tdm6uT0BNpnMxx
	QvH5e77aOT+tUvw36oxOflULSI5A/goS6h/UjKHwhyzVUOfFUOHtIDbMvOzYpWYRxDtqpSkS2TJ2w
	BtGaU5o70n8tgJv/8oXFZ9ikBTp5/fg8L8c3cn6Vo0nApmz0aMBQIaWwhqTGGG7o+TaCM7u4B57jr
	SGmHzmjZooLBou5XTD5Xnz+fxyk+O7bsi9XJIMYM5GXCKEendDa+MlRbDfbAAWNQnGMkPWAPAqFzS
	hc0YL4j9yHi29IlsqBImVXV5UO0cryIc+S1je3menI6mcJHrMYFdzs44oWC3MdFJ9dSwk5eo3mt5k
	p27G7YEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVvZ-000000090Rm-313F;
	Wed, 09 Jul 2025 14:37:41 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSxk-00000008Ulh-1OTe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 11:27:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEZX4bcK+5z9ozB3Jyx/3tJsAIhJAONaYETc7q/klQ+Z2+2QGswzQgDKUbNa4U6b0JjIQMMZTNNlC6Sgxc6TAOEZPJKUbuYBjrxpPDjzrApzXpaQKgu2mqKDA+XeZzbzkMeSW00S44Ia9+vrCdMousoCNI2lplqPAXia2ZbppdGbV30NmpFdFEThcC1/7TUT9zh2jRcGIVMzArqbN1TfM0YBp/TQCxE8AUtI0DcuadntXuNou6EXj+GG0+Xsx/TDGhYjGCl2NscVxwUIKxMFHvFJHaRjz8TwT0AMyHbjYFjWKDUgpWHs99jnOYDGSQlFhSKsX9KGzo74vijnVaG33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwdVa9Oac52R3YN5t2o7npSvnVsUX8p1Y21b8hZjc1Y=;
 b=Mgt/xfIOJLPL183E+u7J2PcRRG6vM33bA98s7bdziHerTuHvnW4iNYweuJi14GtjrvEggKpi7jnoEer/y4cam4OlE7AOZHdbg+TGHtkHBQ8nCIh7Ko2AgLTRVgt3otmXFI0GSwyF5i9nYoIHPRd2+rhnHLRVhx+mWPKc3tnqUo0SXhpBKKMYvZKVCamtoETgIA1z5esbR75f9H1VufZ1K90pqw9MvWXoCdQkXt+/JrzuqgDP0phQdMTVQMx4/kU7y3JWgCQUvCX77wwQXrodKUqv9alT9/B4ncWAsiXZ4OUcVydmKxUxRVyx+jiogZjw+f4IrD3oMKntpgDq5kZ53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwdVa9Oac52R3YN5t2o7npSvnVsUX8p1Y21b8hZjc1Y=;
 b=MlnX6U3T9zmsHs9HUgA2TvFTirbZW2vnmlOhDIKA1+t+xf6z5oUrTtT+H0mkpuWV0HMmwr7XJdYtYnoSyQgvcMepNsf9YzrE/Uhl+Xp4vxM5it/Yf5FMH0vn22hPBMU3VJMdsqz/IV2I72X+WQobrfHqorqjHNlQD3raE53xa2Fyco3vPIaOQ6d/wloUiwpJQhdvtQY9wHLBTEegjevDeuVOXKwrkhZQYCoZRvEtDdwEH3qq5ndCTaDw3orHxx0n4WJZd+uFlJGEglu7LypVc+JLYsqx5grG8nBbOGX2izjGsppoPSelY5xRs0FrRK0hFOFBjvcKcN0erc0YeENYYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 11:27:41 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Wed, 9 Jul 2025
 11:27:41 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 9/9] arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages
Date: Wed,  9 Jul 2025 14:26:58 +0300
Message-Id: <20250709112658.1987608-10-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::6) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: caf950a3-5e51-46b0-2cd6-08ddbedb9e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pfqYSsz3fHV1e87hgnCyisbj3KQmHeTSV05Kld2dymUHSqTN3Our7Aruf6wF?=
 =?us-ascii?Q?Kj54DxKDZvVba3ZnCj0tTO0/YgABEZozyqWFy3v/uBi/n+JTsLHIibeljAgI?=
 =?us-ascii?Q?Kc97fSbZ/L0Z9h8ohD8QrqQfenGwVVFu7uqmJAFKcebiF21Xz4sB2HT9VWBn?=
 =?us-ascii?Q?E8Pm2BTeRiVY2lklqFdabm4RLlY1YS+33l/zfVVQ3G9x86Py0XdFEvwjpNbR?=
 =?us-ascii?Q?17i3lfwmLfJPQuWcGNkUcPw+exZrDh72G+IJa36zhgOsIMP6onot+JxL9d4a?=
 =?us-ascii?Q?wqXO39UIPe6lCw8dvDNc5n5e97X4Hn79uM2jUyBg62P6dlaAfi2dZbdW0+dM?=
 =?us-ascii?Q?oC70fMjwJZfDckBDYWM5fW+0JAVajF5K57LtZp4ZqjQvo+GGOf+3s5CBFV3F?=
 =?us-ascii?Q?bVpMCKIxIfaDua70NVOJ640ggJNb2jjmG1PMEnSdl5zO5Tev4VLq53OsAV7u?=
 =?us-ascii?Q?WIZjzpOVh5X8r8Y8fAZhews8XqxI3kXkdzg5khbN4XqCBgLH6uGk5k48R5Rs?=
 =?us-ascii?Q?JsPVdaonpqhAb6lVUriYHEIb7NU4dm2l/yFsFBLNZXQmOu3HhvU83TXyGcGm?=
 =?us-ascii?Q?I4YD42vlrtWSL/8FTzYsYVGbbFzL70essluNPq+3OfJbKGoP5dsmre7IpaJ1?=
 =?us-ascii?Q?9pKS7kbb/H+1rE+8J1dsjct6StDcTKWfEEnjMmuIspcV+mEGoE/qeEM4s+Nz?=
 =?us-ascii?Q?gdedukzETzf7HdfKoZPqQsMbUjElZ8Kfy04Zeg+K2/8IXHrVoXcf5noqtDWN?=
 =?us-ascii?Q?COdRZACPHYMHxVZ0IWoCNrFpbXKY/ZeHtDt8Uo1hnRo5FEJfFItGYD7mC8VV?=
 =?us-ascii?Q?2S7NV/l0s7FXaJCvhKJS//y4E2SEfP+7llMtb4hxtTPvuX1lunJMpd3rK0up?=
 =?us-ascii?Q?kwwZdvUgn5ao12rF5CXcJWOb0l2LIBTAS5ggf5nvTZ7NIpLVfXVxlCvjU7sc?=
 =?us-ascii?Q?o74Jeh5xmFYMIXhxw9TimLdAl+qKtaZq/k1MyyxAnlYnwZz8nJgehuXoQx4B?=
 =?us-ascii?Q?SKU2rlGKrznslKeY2SnQXf+hEMFyofEEbMpYEKjdpkaJRng9ZaVvzvOHa4Rk?=
 =?us-ascii?Q?LGn35Nf6/i67zjebl1rPJtKJ/236JVEkcxNfuXSjkmEswUGQ4eCKlSwv20P2?=
 =?us-ascii?Q?DKCJ4UAWPSrFD9T7Q0MtTGJ8Y6QhXH2RO8ZjS0q7bbiF0QGXoc2Ubs9lcq1z?=
 =?us-ascii?Q?3DBM+CJM7i4jJVYiEKG6cqxfKWY0TgXde6u7YGT6vOTgNLe/hmWFy5Hf16MO?=
 =?us-ascii?Q?My63ojljDdG+JJINmP78C//2YRl5jjGBtwkKdmKCkQ/vxPnbZr+Ey8sW7qyd?=
 =?us-ascii?Q?6h8jfrO4IF7ne/GQQphSQ/7FpIA16mWyWULckVyssqESblUDfJXf+cTvem6g?=
 =?us-ascii?Q?qYqApE60Mk2uh21XS992yMKYAiDxUbF2KLfiQAAWb3nParrOk68cAHeCRjIt?=
 =?us-ascii?Q?Ug9OKdMswfg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZBNY7UGkk52PVVsbP0FKI0hbJsjss8P8ydFOiWUVx6YttTbvY4xkajkKri2t?=
 =?us-ascii?Q?MdG87aMWaohs76sHK8eNJ2ps4NgsMP/l0aAx1EQLEPtQoCAgEyV0e30t9lae?=
 =?us-ascii?Q?e8A8m1+ytx5QfbPcmgCIS/XUTTF2Sx2bLtf0r/NiVEl/kQaJLrhG7lf+2NE8?=
 =?us-ascii?Q?lDiXMzGEeLBai295RgVGjatS6qko7JIrzLwXKqK8tdX4nN+toJqc8RuAsRAv?=
 =?us-ascii?Q?SBd9qsGwgIDRCeBn7EB0JSRC/kX/sz/oZauMbXAwmsG4oRXBsZgolzGtwTHf?=
 =?us-ascii?Q?C3jTjxw/zwnDoWgTAQjZUlHLH4raCQaQgrVvVNgAssuOT67FuEj0ZmKA0qTf?=
 =?us-ascii?Q?L6vo1qhHW7uCPp2QngFgptavbP+NuB1yCKA6+XNdv7iRBsc36jteE741jnnW?=
 =?us-ascii?Q?ujRyplc96XMB9+ReMCnRjlY480QQF3VPa/h4B8R4vBMda4X5wqEIcTi+C2e/?=
 =?us-ascii?Q?2iTq2uz8pGXk8AwYjJHmNDHmh3ClOekeTZ7G6in6YZ5j/2pkip4kM7Cuci31?=
 =?us-ascii?Q?0hpPlEOtgexwuwh+1TgQAynvU/oiDxceNI2XqfCCh9qvicmMrAIHLR277lWf?=
 =?us-ascii?Q?NJDMNxmQWLRLDMgGxO1huJ9dWRi9PnAbbJDUKev+zOiPo400TC3KdlJgtjYR?=
 =?us-ascii?Q?ZN7UQjth1FQGMPu1jd1I9mCb6M3pen9ijmJZ59jjDqV+uv92dPC9JUU0cBRQ?=
 =?us-ascii?Q?mCiQk79WNGKwm6dGKwUzC19GpHsUlV+QNU1N9+UF/8Phgq5fAlna5BCRA641?=
 =?us-ascii?Q?/HwHaqxyqvM4JMhzufuEwMYqurPwgfFXFTvy69LD2lRT57yI8T/yVdFYgln1?=
 =?us-ascii?Q?HUHkYvxx5NBRBt2KK3pYtff72mAUuJTplBAD/KKkJFbxCswRu6NlgNZ2FPv9?=
 =?us-ascii?Q?KuHsq6zPZpFZVeUC/FskbWomzY/Md7iG/7c7qndTR+NINtCr6v+QJyp4ZdA7?=
 =?us-ascii?Q?qAScuWQHNYY103XIzxDrGN39NFFF259c3hN0hKxfC+wXgHSfr3esUDgl1pn9?=
 =?us-ascii?Q?ak3uOoz269m7Cc/mdqb8CRL30JMIEO9A5aVqFEDAKP2PCVNgE4px5Hfz0QGT?=
 =?us-ascii?Q?ZnbtDstvEF5DGLRbpHf+3zNHsCyitymMVl8SO97l5ImTPXF2vGpROlwskMI9?=
 =?us-ascii?Q?7+vQhZPJQO+TB7Dzxcz07IGrwq8ouHW6jn/9Q321HSMit6DP9sAQwc6vtDpF?=
 =?us-ascii?Q?OiqVrlPm3FEZL3iztAdNGZ1NCojEFcuNVlZFywt9RdF10eKxWJhnkWqmpQ68?=
 =?us-ascii?Q?C/ADux7jW/Mpw+vc0zp9XyK0FZCVdtwiXfv5Kcm7TsEFtmdBQJhDh0J4hPbs?=
 =?us-ascii?Q?Wl7FBAYfCa7s8lhQqQk1BBYGY8BKrPhXCUGfAIAMTPch2xLsLtygye5fQ6Wj?=
 =?us-ascii?Q?C2m190/sDiO0iPgnHYy+pOVtTlEboclP01piCWF2b4qwxHOOmzrmRP3APUQQ?=
 =?us-ascii?Q?Dsr3oy0InEPQrn12+gCZXJCiVjHaQcwGdsnt1by8TQLrBF77uHhGGUTfDRfp?=
 =?us-ascii?Q?Z/6pL7/af3bGKvexwYP5+RWekuAZhpGNwhkxbLLEjP1/sDL1l/cGl1xTBkPr?=
 =?us-ascii?Q?i4Rzcq2/EVKKZMK0AmDZ852tSv0mBagAvgoS0VcM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf950a3-5e51-46b0-2cd6-08ddbedb9e09
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:27:41.6880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7h6gwpPMhUfIPzpsRT+t82kq+iGOTBtmkcJFNb2awv2QShO5HBDBR/2hFfXH42FDUfFb3f/Yzs6p413sNiFzSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_042744_369566_85C48DE6 
X-CRM114-Status: GOOD (  10.39  )
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

Describe the two SFP+ cages present on the LS1046AQDS board and their
associated I2C buses and GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 64133e63da96..c188977a901e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -42,6 +42,21 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sfp1: sfp-1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp1_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&stat_pres2 6 GPIO_ACTIVE_LOW>;
+	};
+
+	sfp2: sfp-2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp2_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&stat_pres2 7 GPIO_ACTIVE_LOW>;
+	};
+
 };
 
 &dspi {
@@ -139,6 +154,31 @@ temp-sensor@4c {
 				reg = <0x4c>;
 			};
 		};
+
+		i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9547";
+				reg = <0x76>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sfp1_i2c: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x6>;
+				};
+
+				sfp2_i2c: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x7>;
+				};
+			};
+		};
 	};
 };
 
-- 
2.25.1


