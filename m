Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FA6CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCsFOXuahiH06X0TYwoA0dnC9Xfz227rBqAGBKE3J7w=; b=Gp6jl6rVlHlwEtWHOi+WPBPOLI
	0GZpN8vn+k1wFm4URRMqAaKa3ceX0ybSb1nyPAQa4boAl5O3XKhNHycKouXsypEP8QWE7brV+/B6K
	v9b+K0RZNG6loepvNxLJMUUaS/rNSW2UBUZSBcmeYHBd1oOHlBKI6pSXVLG2i25B7GLtViDt/Dlbd
	HJcFVbqJPagEyEwn4TNeoKqXS8w28rDPDZ2aXSQl+NR7TVCb7SdnhZqo6fjCshTxGXy25UGQxg/pK
	JpiuRnGvV6ypDRdkWDamKhAJ59Dh7k32RLwJPav5uOYhXEB7cdIajnQ62MIjeK1CPvqK+B+w1yb86
	R6a3uCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPI4U-00000001DLp-0tA8;
	Tue, 19 May 2026 10:53:10 +0000
Received: from mail-northeuropeazon11011071.outbound.protection.outlook.com ([52.101.65.71] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPI4R-00000001DIO-2muq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:53:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QM2NjAzRKkwW/2yxYUBRxJQNPYblcg9BPiwNGQiwR0UBAoQqNv4uVudVC9tlnuiQ5uN/DHAUU1MO3fPQqSbyntrg4J50wYWhAcuebOkJz5uyFkqswSWDEXaEXnfncp5kzTLYgV90hjT9X5N4WaiatI5Z7XG9qJ9fzDvWarME1LE0+C7uU9t+quWgpE3DMISJTVZZsWtacL/g3MDkJWgPAkcJ8Jaz1HujHy3X2EFq+vjQuus/VGCldFiQQUJGEKr4Jx2ACCuS3COVkfZoO7nvV/bBrRNIAzvofy5kxOIVMv+r7EOyZNP8PVA5UUg0bxMKioqLZTDrwN6oB+KBztpOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCsFOXuahiH06X0TYwoA0dnC9Xfz227rBqAGBKE3J7w=;
 b=ph2b0IpgefXUyonC/wEk0xdIe+lenweqOyae9UiTV0XKOJkmqYp05x2B7Tjk0SDs8QQwSmnK/AIzzzOQnh6Jm5ujKclxfu1oVEpVEHYvGzFQgsTpFrHo6U6EIdYCn2vr/nwxsjMmv522emc1YUh8s2kZkA8nmGLIc+ZcQr4i3IKJP5F3iTGV+o2QNRpKwVwIucWwYLkQpZnbvFdTkwVZfWz9ewUmcBhQbaZUEqzrqBolJpUzMM2GzQkbQLVdsSaUMl2jHAu77jJWFo2BIag6ZNUmghi+viRcLOm76CuJmlpVGEUwRQSwYCk+LYv1hqH1ktJ2ErYf53JZtM+12TLQaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCsFOXuahiH06X0TYwoA0dnC9Xfz227rBqAGBKE3J7w=;
 b=ZA0Y4ffq2cWunUoquyOHBGTds9CbaH42z9aUCJfgGqZDgBw7WblpReMlLNnMgKOPPrqe/oyjaK8ZVV/kfmcyk504GqgQTJckh2YckI8iZAgGr7Z+Dx1m0h4oPhdYyyM6dkqpfL6/bKdHcyzAgLBD3JxeXXQL+iDVWH5yrRzfl7jl3QJ7U0NKy1jHdh9kn/bzLQtOmSpa3VAgdQUMqPBlGHlHmuavEoUqVuefv3Qmi3qrRQjUYqoE7sAX3f6w0xyVlis1Emgobws2YhPkNw0aL6yDPEN4oJKQvsrLXYzqFId8OjEMSeAfHWNODyoDAeVMMLdANtajLndba6ulga4VBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11)
 by GV2PR04MB11633.eurprd04.prod.outlook.com (2603:10a6:150:2b0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 10:53:00 +0000
Received: from PAXPR04MB9644.eurprd04.prod.outlook.com
 ([fe80::cf3:c5b0:7a0c:d11b]) by PAXPR04MB9644.eurprd04.prod.outlook.com
 ([fe80::cf3:c5b0:7a0c:d11b%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 10:53:00 +0000
From: alice.guo@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: freescale: add ULP watchdog nodes for i.MX platforms
Date: Tue, 19 May 2026 18:55:17 +0800
Message-Id: <20260519105517.3638614-3-alice.guo@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519105517.3638614-1-alice.guo@oss.nxp.com>
References: <20260519105517.3638614-1-alice.guo@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0308.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::17) To PAXPR04MB9644.eurprd04.prod.outlook.com
 (2603:10a6:102:242::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9644:EE_|GV2PR04MB11633:EE_
X-MS-Office365-Filtering-Correlation-Id: 60db5f78-9ce8-4f1a-1aa7-08deb594cb08
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|38350700014|22082099003|18002099003|56012099003|11063799006|3023799003;
X-Microsoft-Antispam-Message-Info: 6+8Bmpcvq3exVbTIGQn97IJr0HC7lFq7b9qXR3pf+frHypGNqHhcXOAtRuAcDaqC9X0fNK3z3hOu07EX1EFEq4MKQXgBk04bVJRS8J/9QeoMSDheXRTZWCpRO1UFhJoSnGlggetG0/jnV6NHrLebNa3e3JQbe3xwb2ij5y4h5WzFn4IEjcFh58/Fw3m4Qk1x0pIigjArXW3h2YQDMx7mfrQES2Uayha7OPpHvnJGqEtMdvS+iZUWHvCfwQ7N9ioUVDSZmjIYan8ObkRaGKPcXXRBGFMV7f84zEaBQ4BIOv4QzVwJwdzMjj0Syn5hCMuTsGDy7onFl5Mf2YhgooHk5o+NTvIo/oDaTwBSXRTa4/cY26rE8D5lLJCUTcLKGBIL9KepI6flYbP9KZseZlJe8xefeuHFpZ91h/+Ne6vFCGqJFTnGbW11491qNqdlZQupXh+jA/4uKFnziyLRqDs9Ba7U4p3vBSRG8LpScdVJFR4fSq8ukFGzOE19pq1shgtxG7BHbzPpIYV3Rvb1l9w16mna1nCHj5U8/s6PflYmDDNQ+fR8PLq0Z2psdRNBR7f+JwMTYen6HEJSjMws3LP/PyhMqBD2w4NnbpGvH6S4hfc/3tZr4McRkKoOxhBk1LXb2rsUBHKMtZN8KGLe9On0GQW3Vrtvtfq8ECDhwYwAUukTYEq4jUs9ewocWaH4a5diu8EACPG491hXkZeeTpbUCBr3TiXnMR3wUwtFEFQtz0LnmpNqPIzIvhFN0pVn0fOQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003)(11063799006)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RStLODhCdVR0cnFOb0lGVXlXeVpvUEkzL05YdVZoOHJUZHNyb044a3lBTzc0?=
 =?utf-8?B?eWRHTERkUnMvOXJCL09KUUZDN2R0Mmxkbmt6dVJpUCtVS1o4R0tYRFFWd1FH?=
 =?utf-8?B?VlY4UmZnK2hNS0IwQnpHYTBQMWYrQzRHQ0xnY2czb3YzcjNyTldld083Q3NO?=
 =?utf-8?B?ekxxaTErVktOSG1KMDNSNy9wMXMzNGREY25JU05ZWFRMcnJ6M3B2eG1GWmph?=
 =?utf-8?B?bVhkZ3FLbEdITHNnSUZwNXhWckhSSkFRSFNEaFB1aVBBQ1lVSnFMMzZVdTRr?=
 =?utf-8?B?YnQyaUJNZ0pTZ2ZQZ2tvNE42cG1va3RjUStSdHVJeTJ4TDFSMlA1ZTNzaTQ2?=
 =?utf-8?B?UmZBK0g1ZlFpa0VNc2V1TnBVRmRHaVowYzAxQ2RZTklJTHFPcmMrR2RWNG1w?=
 =?utf-8?B?NGN4ZE9RdXlDNTFZZnZYRlZGOW15SnlXbUQwQ0prY01UY2hOeTBYUmRDYngv?=
 =?utf-8?B?dDF2OHVVdUxWY2s1YW9PcXd3bGtUMUdjQjVnV2g2TmFxZ0tvaEc4bXcvQUVq?=
 =?utf-8?B?S3ZjTEpPT2I5M1QrMEZpY2lNQW5RVzFPT2F3VEcySTBOS3AyVWo3UVZjU0FL?=
 =?utf-8?B?NGhLcTdQZmtFN0ZPWFprZkRrckRZNUFBSjhKZVBWaENqaWhMeW9PcmFHRURr?=
 =?utf-8?B?d2dzdXo2bmV2YlNMZHA0MFIyZTVVTjl2V1N0Z25JQnhMQ0E2aXRrMGh1UVF2?=
 =?utf-8?B?bUJzT09BQ21lOW5IYmdUaW53WVBVWlkyenJVQ3VIWjRReGxURUQ2SnduREpV?=
 =?utf-8?B?bG0yN05sdmpuc0ZZMmM4dzVIa1BxbTNrcW9ISEF4OCtMT1lrNFh6OTgyTUQ3?=
 =?utf-8?B?SGpxR3o0SWNvWGdQc1JYek5oKzFHbk0zRzBWUk5PZzFvUDhuMXhabjF5cjA4?=
 =?utf-8?B?TGFGSWI3SEpoSDgxdHc3OTU2UXVac1ZiTUlCaTBvWUxnS2ZoZVh5L1ZIaFFq?=
 =?utf-8?B?UUl6QWJWWDRackFEaVVqbmtHbGhUVE1xYkhsV0g4Nm5kbUx2UDVFVVdtTVZI?=
 =?utf-8?B?UEpmZ25MeXJFc3FaRnZ0V3dsZklJWWxWU1Y5VTNWVGJEeklPWm1DVmpJSnhq?=
 =?utf-8?B?c3BSWThYc2psTkFDb3BHcmR3ZnRnaml1MVFuK0ljazdOeDYyMDdtMHh3dXFX?=
 =?utf-8?B?amd6WG9FZDE4VWlRT3o0SVVOdzRzVVAvZXJGQzRzblozdUJibjVhbFpBNzdI?=
 =?utf-8?B?T1hoVWxPOU1sWTBvSGJQcmFCQU1qQmF5Y3RiUjNnb3FpWnhkUVI0eTB1UGdW?=
 =?utf-8?B?cVlnU3NyL2NneXpWQUFma1ZYT0JML3NpZkdPbmZLbkF5ZXYvcEM4S2pZNzJy?=
 =?utf-8?B?dDViL0Z3TU9TclcxY2tRajZPZ0pYejlKSkhrSERXSmgwUDE1VDFGei9yWUQ5?=
 =?utf-8?B?U25OWkpyeXE0b1pxRzlqcmFac1JOUkU2ZzEzaks5OWpEV0FEK00ycVg1akZ0?=
 =?utf-8?B?UnkreXZEYmZ2Ym5WeDhHVVlrdFh6a1JvazFXM1l2R0hQeWhTQmw0UGFwL0tv?=
 =?utf-8?B?NkNhM1Z0L1F1b1JnVUtCV245Q0NIbzU3d2VVa0pvWVRUUTFNU1k5VndYMUFE?=
 =?utf-8?B?L2l6dDZiZFhmd2lQMERGQUJIZWdIY3FmblNvcmY2eVNCZXM0MHY2UjlqMnBW?=
 =?utf-8?B?V2trNVJ5U1JTcUVNdVBhNVRJaGZjdktoTEljeWc1K3ZVTjRaekZLaXdIcC9M?=
 =?utf-8?B?OExyV1BKaWtXdjBHbFBIY0FGZ0V5MEdma204Ui92OHFKNUQ1bGtTMEtTS1Fo?=
 =?utf-8?B?SUREYlJ6OTJuVTR1NjB5cVlMaWJBbjZaa1lnM3QzMUl4dVVrRnRPdVE4OTVH?=
 =?utf-8?B?L2wxb0VzcFBDOWFVZWlDMUlEUDgvaGRKM3FCVWdtUitsdDlMTW1pb2hZcEtj?=
 =?utf-8?B?d2V6bVA2aWdTdTlmZEtLalRJYitnckdEaG0rZTNiY3RyeHpPbEtWUDM0Q29D?=
 =?utf-8?B?QnpCS1RiVHJyUDhUdmVCMHR3OU5TVlQ2N3dNUnM3dlFwYnNwWHh4VlhXWXY2?=
 =?utf-8?B?K1pBUXZ0TUVSMkZFT2RCTHI1NkJnbjh1UmNiTGg3QlpJNjhFOU5wT2hhQXZk?=
 =?utf-8?B?N05yYmtzK2ZSUTBEbDJFM3d6YXlZT1NXcTdUaDhPMkVqRzd3NU80SDJQQlVG?=
 =?utf-8?B?LzdVRjl1UDNTVVlDK1hDZk5lNjZ2dXdLLzRRSHRHMmxUWlFxMys5TUZMRHcw?=
 =?utf-8?B?RVFBZ2FiK3ZUK0FJcGZ6VUpUOFEyQTNwdHF0NVZlWEw2RUNyRUNNZUxPcnhJ?=
 =?utf-8?B?Z1dldkZ3RDJ0ZTA0bUR5ZlZsb0xpS0tVNnlRZ1djSzlLbVludGU3YWZSMnB5?=
 =?utf-8?B?d0ZFTlFETSsxK2dFOXlRaUNvT2plM3pRNW1wNjJBVW9FTktvUG54UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60db5f78-9ce8-4f1a-1aa7-08deb594cb08
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9644.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 10:53:00.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zCKDZMUuMKjTY/YvwfGHdVKGOD+eqI4yQX1kRzvGidgZUJGOm4krq06yq68Wf7Ek9lWTRst3LjvF+c0o6ePrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_035307_705843_775655CB 
X-CRM114-Status: GOOD (  11.01  )
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

From: Alice Guo <alice.guo@nxp.com>

Add new ULP watchdog device tree nodes across multiple i.MX SoC device
trees. These watchdog instances were previously missing from the device
trees. All nodes are added with status disabled by default and include
the bootph-all property.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi    | 12 ++++++++++++
 arch/arm64/boot/dts/freescale/imx94.dtsi  | 11 +++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi  | 10 ++++++++++
 arch/arm64/boot/dts/freescale/imx952.dtsi | 10 ++++++++++
 4 files changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 1355feda1aa7..892799e1fe85 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -325,6 +325,18 @@ smc1: clock-controller@40410000 {
 			clock-names = "divcore", "hsrun_divcore";
 		};
 
+		wdog2: watchdog@40430000 {
+			compatible = "fsl,imx7ulp-wdt";
+			reg = <0x40430000 0x10000>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pcc2 IMX7ULP_CLK_WDG2>;
+			assigned-clocks = <&pcc2 IMX7ULP_CLK_WDG2>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
+			timeout-sec = <40>;
+			status = "disabled";
+			bootph-all；
+		};
+
 		pcc3: clock-controller@40b30000 {
 			compatible = "fsl,imx7ulp-pcc3";
 			reg = <0x40b30000 0x10000>;
diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index b88975fa7c8d..190316d2a500 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1285,6 +1285,17 @@ wdog3: watchdog@49220000 {
 				status = "disabled";
 				bootph-all;
 			};
+
+			wdog4: watchdog@49230000 {
+				compatible = "fsl,imx94-wdt", "fsl,imx93-wdt";
+				reg = <0x49230000 0x10000>;
+				interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				timeout-sec = <40>;
+				fsl,ext-reset-output;
+				status = "disabled";
+				bootph-all;
+			};
 		};
 
 		usb3: usb@4c100000 {
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 8c0b590d6ccf..7caacdc819c4 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -798,6 +798,16 @@ wdog3: watchdog@42490000 {
 				bootph-all;
 			};
 
+			wdog4: watchdog@424a0000 {
+				compatible = "fsl,imx93-wdt";
+				reg = <0x424a0000 0x10000>;
+				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+				timeout-sec = <40>;
+				status = "disabled";
+				bootph-all;
+			};
+
 			tpm3: pwm@424e0000 {
 				compatible = "fsl,imx7ulp-pwm";
 				reg = <0x424e0000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 4d8ce92db483..59f829004000 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -352,6 +352,16 @@ wdog3: watchdog@420b0000 {
 				bootph-all;
 			};
 
+			wdog4: watchdog@420c0000 {
+				compatible = "fsl,imx93-wdt";
+				reg = <0x420c0000 0x10000>;
+				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+				timeout-sec = <40>;
+				status = "disabled";
+				bootph-all;
+			};
+
 			tpm3: pwm@42100000 {
 				compatible = "fsl,imx7ulp-pwm";
 				reg = <0x42100000 0x1000>;
-- 
2.34.1


