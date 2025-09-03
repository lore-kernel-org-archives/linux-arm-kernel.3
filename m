Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86E1CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pKz+WlvrYJ+fPEt2bgu3jtniyOiD0UOJU/vbSrbWmw=; b=WSxyfndb9PUYGliofJrQuLZmqE
	It5sYc8wUmM6kd8NjdKIUo926N4BqxqeABKt9zzLFMaWVminhVX+RR8yJhZNwGtrXRmdckZGX3Ntg
	SevqXpHXM5iyzAXfpTuaK+txHOplwisoQHC8k/YcrqUdPh2IfaAfihNI+hj5cSi6qE/q/nIgLjQfW
	js66UA+JuO1J6wE9No4MD25QXR2pLsRMSnFys29JfExWTnyfXa1RO1A/oUMS25ZDi0jroWj8qIwRF
	DtXuv7fB+sU6DyBIql0x3eH6R1PfdER86yZxe6tsmrerzptnfPZYueY3xVjqw07CbdDrHCFc/22pQ
	/gcfjP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomS-00000006lLW-3G1D;
	Wed, 03 Sep 2025 14:48:12 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmgz-00000006OvP-1YWg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aK75Eoz0wE5312UDZ/dAk1Wt+jwzQ+RC0cO7wDSw1EPXBwut2I+cz1+agCmdy9WWwArfw24GDZSXTyMhPcYNo1TiL7AdNjbnt9rF+zsFuM/1gbUK84jbte6OfCmjMAwFU+MJwFu5dnqY7GpC6yEzdnlWex7Q37Ir4nTlZScndpMsGEQnegf6YTFRB9YOrjYNVWJb6kXjpX/O5dki7C4Y+OIxJnuGitFB/5h+q0dvtRQqdgRClHIFnV0Llb8Pv/iwthHq7EYOuj7TXeaoM4/8gWFQvQ90ldd2vdzatpdJ5v5Z+iIWFoq8V/xZZMmqkwTRwWX23blL7/b+4qQd1pqAgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pKz+WlvrYJ+fPEt2bgu3jtniyOiD0UOJU/vbSrbWmw=;
 b=TfonscUcNPdVxn9ysSQ7apSap4fDHz5SVNZNwGEbPXCTXbOh8a4K7xwV6p9LPEL2MltDD10pbHqJo9oEe+kOYs89sQFMikH+f6heSw6Xx7cRUy+zT7oBN6aMiDaeVWPiVnCV3/15X7H09tkLeUQYbq4/iiwdoga8JgCjkTNmNo2ZdFuU4ZEOmik8CAegnvjwPwG8HY45U8B+UE9m5Px87x/xRlETvnZoY0FG6w/JP1IOWy5JZHZyNlB9fhf3zvFMygb7TXXRQHUoUqIpSkldtjzj8OFMcYXrlptFZ7kzk/va7qf8P94KMAIaMpstlXQYGHSfS+fcYCtitYdI9yDjEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pKz+WlvrYJ+fPEt2bgu3jtniyOiD0UOJU/vbSrbWmw=;
 b=XOWmVRYdBE918FGSrP0Uv5ROrkdfyWh7sXgF3OoSD2lXPtrUxBb2n3ak+gGNXkD/WPLW5jw7B+/p89tSG+C6hRNSrUY3PHtvCh7tDLaT0aEXmVxVH7nRx3XbmmHTOZACVUZgkJNX36Htyq7LrSG1Pmh9ItKi43cSYTc8Vl8gAznbjpUT7vIRvVDw2fmXAM2VglGjPmDWXcgBlM1n6Qlbvb3zM4ye6wS5KcBpTmhjrZUEfCotb12ZG7LIrEjf10saInDG6oIBgoUzK2XEunbKxuPjR98QjCRlx6gIx5EEuBcytJicp9uxkX1YHeXgCSBzU3vPJFRG5esbM3sHgHGvmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DB9PR04MB8233.eurprd04.prod.outlook.com (2603:10a6:10:24b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 12:34:19 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 12:34:19 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <frank.li@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] arm64: dts: imx943-evk: Add display support using IT6263
Date: Wed,  3 Sep 2025 15:33:26 +0300
Message-Id: <20250903123332.2569241-9-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
References: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::10) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DB9PR04MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: ee64a4e5-4b0f-46d6-d374-08ddeae633bb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|19092799006|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gOBDJDqcLAWgLIWUIJpqZOt/rZPUv8rL4LhH9NVWtH/M7UBh+GrFoblvOeFo?=
 =?us-ascii?Q?0CobmN2sPs+/LHC5sioG9Bvg1zepeAXAnjoL/Xg1+Q9wIuJAXheJa1R+Ehjk?=
 =?us-ascii?Q?+5Jju/PjltI61mF9KCmXthm+wwSgeOLN5y812h6PtpB/FLnQ6JcAauKFWq4F?=
 =?us-ascii?Q?QAwhWCNtLa0kCeb2fu/estIviKfP50z6qcNseSeXSlj/C8mFUmm/LWwQwCXd?=
 =?us-ascii?Q?hrkZnyXP6t4tWhJgJRYHI76St/DfXTQOLkXBtidlJVHWrLpAUNVhLCSHiEDU?=
 =?us-ascii?Q?23vIm1vNYHOgDNFcmYEcu0sT3nDWRB2M8ZUasdVpuYqCtddc8vX9ruohnMJe?=
 =?us-ascii?Q?esGMdWfdrkIAqWhg5eSCJTwnXGH+VsQd/Bc5arEkpaTnt46DPS/dDTzKYb+i?=
 =?us-ascii?Q?7kjSJDOC8u1nUF4C7vr4KtBVeYeb0KMGpyaUyd0YoiMTDk4HThkvW6syj2D/?=
 =?us-ascii?Q?wGGbkrZTOnejHH81kYIpskXbO4xw1REsvK4UfIafVgT/rqv31gIYpkT0GUdj?=
 =?us-ascii?Q?DKhKOJnCH7vp5nwrA9or3vKfVqOvDW0wCxDjxuC4Gfj0v2RWONCdpgNMY5J0?=
 =?us-ascii?Q?M+gD4EcaZD3TLcuHw5/Bp7jO10A0GIHmPaZ813/gNKKBK9f7EWlVR3DGAV0c?=
 =?us-ascii?Q?n7wNxPHgF7MioWbNW8jocWLANJh48eymdR32TbbjEn7iUibYVQxec/PbZ1FT?=
 =?us-ascii?Q?7e8/7Pj7rs/yPX62PQkmoaweonD79r2O/1V3qCxMzRbw8zS8vqwCoO6obzea?=
 =?us-ascii?Q?vao2qlMzY7L42bJyC1r/x1aSLxahyeXgSquu1ucACDATu6TWLJ+XJmXfgcva?=
 =?us-ascii?Q?jZtcRijVSStNHmnGLtlvOxplVpTA8KyGsLR5LovRs/oHAqvA54jd026pO3C6?=
 =?us-ascii?Q?TZ2tAcstcTKwiltz/2Sd3vztuHBqhAupq498at8p/ZekjQusC+oGeM2/p+Tb?=
 =?us-ascii?Q?yrJEreJwUMcrKpCk29d15nU+v1RF5PiKRNSWwGj63+uqJXUZDtVHO4qthcwX?=
 =?us-ascii?Q?VaI/LbXQgxrqMhqcyJBiO7Nl/AsNwp8xPyRWwZFC8CUkybUGIj3Vt1lpVC9v?=
 =?us-ascii?Q?lrpSoT7z3wJf+UndREnL9OjJGlrSrLBAZk0ILAUFZ528Z0Ck8FJRP1O4RyHw?=
 =?us-ascii?Q?Ose2grmJALXPaUmNwXgOJRH7aFm+Xv6P/AEvkOILytRGqhuS059P0BcBfBLw?=
 =?us-ascii?Q?bxpWSQZtOue/XXGUiYztFMKi0IkX1ud86IOc9ioseYR2ao4Q6KMc7pUstDYF?=
 =?us-ascii?Q?ZPxnpdbz+5245ZaRMYlRsGX/gRQco60iB5pzEc38C8yQqN91pVaPNCI+Zwcn?=
 =?us-ascii?Q?l90H5tLnGGQwulHbeU3UXT9O779KWJW15IsQ3yvdPdnGIxyJDzgCnaAFph7G?=
 =?us-ascii?Q?5JnzquaiapqAWLpqThvrW2cMD4PZb15HFX75exUV0TBmNhV1Rw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TMk7blbCR2Eyn9woOAGbS0eoMFkCCxNBUt0v8S6nvM9MqcjWLB2Sb1f2gFPc?=
 =?us-ascii?Q?7ByYX+UvkVZXDTAxvPmDDKKQjxkIJBZZdUuyPvL4Po+vbQDR1VW97WL0c5TG?=
 =?us-ascii?Q?E9r2bE7ldxgNL98v0HH1xVnm07HyCMEWGSK/u9MHp5cjngFCc+2y9jBEZru8?=
 =?us-ascii?Q?yi4Bp07FwcOLdMx/XfGkDUbDaP53bFePZq99vp1qiOtCQ9nqQ7dR8y7IdWyL?=
 =?us-ascii?Q?HlvntoqR06zBBi0Vxi40n/7X7OdaIwZb2GAa10JlikZoUlk6MrTr5ae/LnUM?=
 =?us-ascii?Q?u/oEbF5AyGK6NW6g4AWxW/lSIc0sp5yrGE43wjO71sbCC5lrsjrygTtn37Tg?=
 =?us-ascii?Q?bKXbyzmhJ7vY6fA3WuAMfd206BbnDt1QJBW19aaIZ1sduqz6yxnfoTLVrA2H?=
 =?us-ascii?Q?SFzAvr0z20wiGf+Mz9KxMS4oDYyikslpgRe3bYNGV0fLhrnVsSp+O5DWxIFU?=
 =?us-ascii?Q?5OyYtACVDsz0Lu4EebHDRrosrKvZ4JpoZH44dQnqzqRfbQeuZHYUZc+Cso2L?=
 =?us-ascii?Q?CqckP8LSzF0kANS96gOq+WxDsnao+FACKek4fB0hYVF0QD9LcLCTY9sQ/ROw?=
 =?us-ascii?Q?eNJNYYEs6OuoS2PzaPVru3NSbacyoXOaqp2yB9/LBda95a1KzY9pz3mP0Rz3?=
 =?us-ascii?Q?FV2tV4FYzwouWKW4KR3k+BM5qKzvivV71ZB0SIqlWgAS8jD3th+NZjBjyINL?=
 =?us-ascii?Q?fWX5qQ1eEqu5zpWGAiiCnAROI/Tsv1XhfTepbNJ9UyPxAUxeg3eF4m+w6aMd?=
 =?us-ascii?Q?PdsC1eHVs+Xbz2hGp98ampQqPRj7MBOIjdOkP+GzHaMiOR47q4rQeDCZKbEj?=
 =?us-ascii?Q?1UDb2GZTGEyzegb0AhPVvGyRwZyg6ndC+XkuvkrLqZSNJXKLJhmUvMNLGZPw?=
 =?us-ascii?Q?s7p2BB+oscUUUoCcFinMwmvmmY1GH395dAseAe1ZtacVWTOm5fPErilrB9oG?=
 =?us-ascii?Q?RjFePcDFY4AYxO+TyWGckRNpDyXJmhzPo9TWMJZ7aFb0GjGtw93020puXPOs?=
 =?us-ascii?Q?k8flKTP8QLeqjEEkSJCFgfhFOQHZ1jcxn8weQGXZoC0HbJvsde50ztX+FVys?=
 =?us-ascii?Q?KGZUAeaOYQxWEwbW1z5BD8oJOQsw1TpCta1cFfkeYtx3qFwFP9+IlvPl78C9?=
 =?us-ascii?Q?vi1L6mvik/p4L8BqIWmdnIE97gW+BS9SQimstxQqz3bqMNw884bGIOODI7Ls?=
 =?us-ascii?Q?Z7phyf4JaR9VUTZHXqKgnlG4L5Fv/8/Rje8ix85nfc5bMrAuZUGkwG4ni5aj?=
 =?us-ascii?Q?jvDAizvUAnexqJ4pe7Iw+4NO1gcEmDvFv3SeidypnXNDtKfvQNvqyWG9ACsM?=
 =?us-ascii?Q?xyKM73tUT6a+UV325xYg6osM17b8QlN5x9zHTd2YTHiuveZa1KPgSWTRjSaJ?=
 =?us-ascii?Q?nzjcQRBjPsgfEMrMDTL4UNCWlE0P2kYTfrVlM57pEtkPPSSqdF86BIpl/p+5?=
 =?us-ascii?Q?bWoWBaVa0HlsEojO366Yq+B00lyE63VmainIfE73MPHwS3/dzNlhzdZOaZ7G?=
 =?us-ascii?Q?6XbykwncFxdV3Q/nC0AOS3+Ic1DMuGtcKlhSzLb9Fib+0eYusyz/YB3K3C82?=
 =?us-ascii?Q?s5Q7vRl2F83pqgETJRP2lHtj7t6ZLc/6uTuh2n2GRWQ+72ftHy5Ylg2yO7BR?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee64a4e5-4b0f-46d6-d374-08ddeae633bb
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:34:19.2386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tQZWoVrqwc3KoLc3KXDVdD2QiPseuXYg+frBdcevALPTmuP28DGiEC6GBTLgilTzcrs4ndN5kVDMpNPvXHcKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_053425_413125_D7ED9852 
X-CRM114-Status: GOOD (  11.47  )
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

The ITE IT6263 based NXP LVDS to HDMI converter can be attached to the
i.MX943 EVK board LVDS port using the mini-SAS connector. Since this is
the default configuration for the EVK, add support for it here.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 121 +++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8c3eff9df1a2..5900ff355abc2 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -34,6 +34,18 @@ dmic: dmic {
 		#sound-dai-cells = <0>;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -127,6 +139,115 @@ memory@80000000 {
 	};
 };
 
+&dcif {
+	status = "okay";
+};
+
+&ldb {
+	assigned-clocks = <&scmi_clk IMX94_CLK_LDBPLL_VCO>,
+			  <&scmi_clk IMX94_CLK_LDBPLL>;
+	assigned-clock-rates = <4158000000>, <1039500000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds_out: endpoint {
+				remote-endpoint = <&it6263_in>;
+			};
+		};
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca9548_i2c3: i2c-mux@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lvds-to-hdmi-bridge@4c {
+				compatible = "ite,it6263";
+				reg = <0x4c>;
+				data-mapping = "jeida-24";
+				reset-gpios = <&pcal6416_i2c3_u171 8 GPIO_ACTIVE_HIGH>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						it6263_in: endpoint {
+							remote-endpoint = <&lvds_out>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						it6263_out: endpoint {
+							remote-endpoint = <&hdmi_connector_in>;
+						};
+					};
+				};
+			};
+		};
+
+		i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@7 {
+			reg = <7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
 &lpi2c3 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&pinctrl_lpi2c3>;
-- 
2.49.0


