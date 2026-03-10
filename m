Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B30FFCC9D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgXaRu62bDI4lXUtVBUlTRrU1dHNeQaOCBImwJzLquc=; b=ZscEQ40YtO3KStuKPPOBNmlK9K
	9XHOLR5SMaRzvEXtX6m6kjOF6B8mk4kBL+YQLoKHpjFBv2lMzcOUt0AuSPS8n7Dhq7sbKYGPU/JYb
	QsJGjStvwr0YXujduaqqYBhsgsib/NDwvS5en9aJ1zGsrfM6C7eujgCOo3DD0qYlS5ELpOEDJUw0M
	2sQs49STD9GMeIvYE40U4sebBSGjQBZvPnM7uczxbQzudsobBKEHQxNXgRJE03Dsp1FMKctYtZHMT
	eKM9QBccsFf1bQn/Uo0Lw0NtHV5/awD9Veo+Y9lLJOvDzsiFAaJ6idwV+Ki+C8bGBW+lsGtJiMsHC
	231M2e2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrul-00000008sQI-1xBU;
	Tue, 10 Mar 2026 07:54:03 +0000
Received: from mail-francesouthazon11011018.outbound.protection.outlook.com ([40.107.130.18] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzruj-00000008sOl-2t0y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 07:54:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYjPYHNF3GiR/TaJAjid29Xl30PTGTO28hTrbqrBZsOz4ZbysmH09S8LUOtXjXHdjE5ieeqzaBqXLxXM9hjH0hvJWixg+Hh/J63EkmKMpFQ/3eVggrj+yqpKYHBHlX9o+qMr04nzJyvY+4bmYl8b40FNgncZy7dQcg4ZnK2TRbBNYZ13fI3M2u+5QwicuIoNvQ0PilU6OcV/CpQhzfZxzApfG+ifyWYqJqMv3UX6rLA0HR0wAOukNyv/0Vu4QQXaXvzUfT+kc2qU3hdAhFqhTSyAcrwiXsQ89HBUlZz47dPoGyvWEm9cjhVcwWRmf2EGXsBRpQLk2/71aWoacjgNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgXaRu62bDI4lXUtVBUlTRrU1dHNeQaOCBImwJzLquc=;
 b=mdZf3AwCdHofiVJsH5oEu8ZjUrqBjOuPtEqWeodkzF7D8x3ylUzlVatkABPIHvwDmVOd+P3l3qHdV/qFfmedNBGRtZWqtdh1EE6r5bj4XO8R3muMfBUqApLOwmWzEHSx0ObenjQyCjj9VpvjnkmUgNg9diC8AJZ+0Swbj62zYT/vAs5Qmj6TSumv3584VL+L3L+3zmUHa6oaU4tT1qRUKldJ3lvXkMyrNdE7BHCicpDBMkeeWedVgDzDy2UpaHmry+9vYkzR+4v38yVrqTw7EllRikTyUnnAfKll2G/FNTKZr6ZNm/Km4KBll9/ColsOjP7jCH3QLAI1ahe7GjcXeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgXaRu62bDI4lXUtVBUlTRrU1dHNeQaOCBImwJzLquc=;
 b=eHUpHwdSdm7KFXoz6W/zepiBECXqG5QfJwLZ2vV8KBpjw+CVSmRSfwVNZOfPra+4PETjmlTzXyZ2Q4J0SwsYSh+xh7/Z5AyvPcpXSQJDTbjsrG++avwaq4oasoIXZ9FlNpIzVGCxDXS9Fls/sNldLQHSILXQTDcFcUDfC6D5+lZLBDE1BviqcHRkpA0gK5kFPeAPS8HUBRZJn3r9ialuPJU/XNkXltXjpI7HAesJ4BXUxYyDqhBQqGzyh86V9R19r1rAUowjMX+Zv1dQOnv645W/M+XfCOLw73jKGJYwcgkhKusAEAVAkc5C9/tO2VBanulzanhvgR7b9pIy5dMomg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by GV1PR04MB10128.eurprd04.prod.outlook.com (2603:10a6:150:1af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 07:53:50 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 07:53:56 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v4 3/4] arm64: dts: imx943: add pcie1 and pcie1-ep supports
Date: Tue, 10 Mar 2026 15:54:58 +0800
Message-Id: <20260310075459.726495-4-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260310075459.726495-1-hongxing.zhu@nxp.com>
References: <20260310075459.726495-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To AS8PR04MB8833.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8833:EE_|GV1PR04MB10128:EE_
X-MS-Office365-Filtering-Correlation-Id: 303b16a7-4cab-47b0-4637-08de7e7a2e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info: Y59vvw2qaiyeblWvO1NBwCA1oNIdXYc71jkdB01FBzZw7lQtIBG1VY2LRVPzhagRt/KbofRzjs6g49wNzCbuUmJy9wM6Yi0YY+lTcOLXtqtIESh/MH+BHsuUhQVnsXUDwW5hYn+nXYarXKyKz4xfgGLxTgP9KY7mtKUpnDJiVYTu3KmAfgdau4KrsX38lcS9NDEpaWZ369Uygj6dSils8K3ogEn61pB8U5a9xgO5IlBHimauiBP0fAbL/QYwC8SvWNtua7aFnI1GcEi10H/sksFSfRMuzlgmE+r5CTxhi/zhU8nWqLSFxVy+l+a+TTgX38IVBm8T02FBsObIgmQXwXUHPT+2guO7gUUOXRm+OvBXvr5T3YS3yzmIXzMIsWPhk8cXhXIZhjgfIO65/AbTervQPNruwtNQvAq7kvxXFAE3R7R3htQ8EtIPqIRdfvxG6+sYLHijs61LknnLPl4Q5pe/m0iO2+dVRV+Hl/d9tmwxEMN4kiGHHihgP2RYDf9iK1+z5dI6LJnRR4xVgJbF9sb1kD2HmDFV9//1ziZnQqOV5qhJGBvmx952UZzwfVX9aU/hBkgfjE7qrdvCe6XvosKtVuYXlb51f2CM7qIGcb1+GJ6XmET2iKgwPxYAE1l6Kspt25bMm+UC1hbiLxiKG79BYCwICuxdyyN7E8dlUZcV6ZzPanU0P8XcrZ6uUo7QJkIS84sGBU1dLFNQWqyqPEMpl8orwwZstGVeYFrShtBOusSJ4iI8f3jnp9RurJJFMiYO1SrKYjk1goDklNPkO/gr+ZSxjeEc4XwutytSjVk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8KcZoMNTmDEfJCNui8e20csjAtnAgYueIXmA3SfV6jWBbxtXNERV67iBcT//?=
 =?us-ascii?Q?XTFjoKCpOLrUVzzgHgBMS7Q4QODrWRusK4HQeiTjddalMWKn0Rs9zWl6NWm4?=
 =?us-ascii?Q?nuEJKFLyCJ8uxUfdJpnqmn4L7IhWbRFeBE1lhru0NXklWLLFcSfP/Z49ugsq?=
 =?us-ascii?Q?/Afc+xE+tvcIYrHwOpVgZJ/0xefMy2k0zmBdjCAT+dU/FKodpc1baUlEKbYl?=
 =?us-ascii?Q?lb9y/hCCsQfmlevSr41svoxUREHyyLzIGO0zeG1pPwTlQMRSLy7wl3TcQmZs?=
 =?us-ascii?Q?2bMYb1rlqmPCc0m4loOqHEjAf5jC7jBnUMroK6CDTC4LFxtXalzssZTDrAk8?=
 =?us-ascii?Q?PE77uBbftFBbNggIDX0mLt/5HEny2jkS1FIVBgLFBbpOhgnEdW08Vn2dRtwc?=
 =?us-ascii?Q?m14lelVFN7a3jJ8CXwESlmReRojW/uPBFNqnWi+Ok5bAAnNSvL1+hVxa9Ft9?=
 =?us-ascii?Q?xkxz/FnS7P6x66lxLuomInbtjhBHg8Wft0eQnA4FWBFBs4WDJxA8fxU341+Z?=
 =?us-ascii?Q?ILiLTxJQpzJBckbl2rXuCP/8KGTRBWr98CqVNL2L532JgKXlz2ELaTkTXru7?=
 =?us-ascii?Q?vcXzIKc4785KuSZiIRKtXXjn9tnSTgUl3gdIvl/nHiFOOfEw9YTsu/LhVrgP?=
 =?us-ascii?Q?gKzYMpkjXxzwuQlgo6+7a9g0ZZWLutIUxNpb2DviUsN8LjpSjWlULgS2dC28?=
 =?us-ascii?Q?CJOY6VCi/6upujsYSzWINdedzapIakqcEJQIvtBFD2HCa1OToGlHGPOMGdWz?=
 =?us-ascii?Q?2UQG8oYr/vyXs/anGu3AJeSKwmja5tf7sw3QjPwJ6t1/gSJSe+G9BEvo9i3+?=
 =?us-ascii?Q?Dn0UQIXuKd488+NX2KeSNxquC6WhT0OYZikEIWIJN/B5mAo9rBNeNAKk3XQ8?=
 =?us-ascii?Q?9+UPMjXQb/Tmge90ZeAD1A7wvFE3/oqyX1n/R1pCsWYy+29eREAtw/sl9aPE?=
 =?us-ascii?Q?mpU3XGTiMfaNqQrmVrUgHGEXDInNcsbcX6DB46Kw9FP4Sl8dBw0b6eYQq6Jq?=
 =?us-ascii?Q?56P88Uqf9jBwPm/aJRYEqZdyqep3GbUe9UuAJsZOTz/yzKffpS+isx9acoYh?=
 =?us-ascii?Q?p+XHK1uIdbo4eiJoBNf/ts7D+sIIvxi2n7FlPqSJ3xWHH0DN3PigASKSspn2?=
 =?us-ascii?Q?WmfniFtinSUuk9guwInVdlbajrARSdLhio1klHF5AK1jKPA2Sl7d1ipolUjb?=
 =?us-ascii?Q?hs7dYAxzduFMVtWvfiv4yWTOWiWKOM8ZodfxSZkU42onVjgKJgILupRWJeDk?=
 =?us-ascii?Q?KQZA5Ro2l2pb84En1iZ9YIDYn1Ix3T2vBC8Sojyw/yrLRF1V1biQ3x9etFgw?=
 =?us-ascii?Q?Yoqvp+Kfxd9wxXGccgi6NHUe09Qi7HoB3fBrJA0MxGCe/AKneVYGtJsar3zz?=
 =?us-ascii?Q?Yy4xzbNPd2U1KaTdtLdoaIwFfX8b9kqyW3aJiJWjex9D/cKRFY836hxKoXJk?=
 =?us-ascii?Q?rM9X1WADJhoSpRkWOKloTWEiv08wvhg0a7mX/ce6z3BziDSb3SX1C2fEMZYq?=
 =?us-ascii?Q?1CFIjKOHiS1tBdjg73VF6BfGtEOOS47qWrv3NVwmBcJDnRvtzNEadTLekQz0?=
 =?us-ascii?Q?5keHaQovsFWXtJ3wswSWInaKjqAqQ87hrQyAzi3hYxwXPS94kU0Ro15p1Mvr?=
 =?us-ascii?Q?Fw8UXi8maKEji3AmvwMwc0wvTvtGVwInvtZV4UVfU11e98n4Cw626tRMPtYy?=
 =?us-ascii?Q?Av9gFjStVBkHE0CdU6ucJ9CjZjLoY+wT8ykTVm2dHb1HYTHHoJKVvyQCEa9x?=
 =?us-ascii?Q?hbJFEiehCw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303b16a7-4cab-47b0-4637-08de7e7a2e5a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 07:53:56.4491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DoZqGIhHsdw+wYjvpRvGd3yiMyuUFA3iBlFV/eovciBuKwQJtQl0hoFZtscdyzkKRco1JagnLiTPhPGydmjFMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_005401_745482_00573A5D 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Add pcie1 and pcie1-ep supports.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 73 +++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 45b8da758e87..908bdac59139 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -145,4 +145,77 @@ l3_cache: l3-cache {
 			cache-unified;
 		};
 	};
+
+	soc {
+		pcie1: pcie@4c380000 {
+			compatible = "fsl,imx95-pcie";
+			reg = <0 0x4c380000 0 0x10000>,
+			      <8 0x80100000 0 0xfe00000>,
+			      <0 0x4c3e0000 0 0x10000>,
+			      <0 0x4c3c0000 0 0x4000>;
+			reg-names = "dbi", "config", "atu", "app";
+			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
+				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x80000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			linux,pci-domain = <3>;
+			msi-map = <0x0 &its 0x98 0x1>,
+				  <0x100 &its 0x99 0x7>;
+			msi-map-mask = <0x1ff>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			num-viewport = <8>;
+			interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+				 <&hsio_blk_ctl 0>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
+			assigned-clocks = <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					  <&scmi_clk IMX94_CLK_HSIOPLL>,
+					  <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			status = "disabled";
+		};
+
+		pcie1_ep: pcie-ep@4c380000 {
+			compatible = "fsl,imx95-pcie-ep";
+			reg = <0 0x4c380000 0 0x10000>,
+			      <0 0x4c3e0000 0 0x1000>,
+			      <0 0x4c3a0000 0 0x1000>,
+			      <0 0x4c3c0000 0 0x4000>,
+			      <0 0x4c3f0000 0 0x10000>,
+			      <0xa 0 1 0>;
+			reg-names = "dbi", "atu", "dbi2", "app", "dma", "addr_space";
+			num-lanes = <1>;
+			interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dma";
+			clocks = <&scmi_clk IMX94_CLK_HSIO>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL>,
+				 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+				 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
+			assigned-clocks = <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+					  <&scmi_clk IMX94_CLK_HSIOPLL>,
+					  <&scmi_clk IMX94_CLK_HSIOPCIEAUX>;
+			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
+			assigned-clock-parents = <0>, <0>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			msi-map = <0x0 &its 0x98 0x1>;
+			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
+			status = "disabled";
+		};
+	};
 };
-- 
2.37.1


