Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B0ACE8D66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LQMCyys2+5z87py+Thc3kWE7F/MdJZ4gfW1rfmWVP+4=; b=ivWWIqHsdjBuHSXhsMoRGfwKFg
	U78lVy9y2VyWOgXo+ddZBA/DUgzvYOSsbUnsvlDeUhEChFjmVba72Vhl9ZDvxHUtwvlLk366s1Tcj
	de4t+U0I13aL2FlFg0FQRYosNav0vtcFUb8l/fBFi1kLfQzIqQbQa7gf5UbSGU8qn5G98nw/k8coH
	JyGCQhmE7gvlNrWf4kzsDGkPi7BOzYvvNVr4ZGTHlLWS4KJHb3T6AEhsZnr+2eCKBVEGhRj5Hkq6x
	Wp0f50po/UHL7Ji/ZfhEXhcgNuQX2pNc7krhnbKSfVqKcAVLnLEaq9j+7vxaK4Vk1fBRLIikSuQRk
	YTMfHrHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxtZ-0000000Cs6y-1Vag;
	Fri, 14 Nov 2025 17:47:37 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxtW-0000000Cs60-234q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 17:47:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2r2sGsIqeFrPawNW2NQDcL4TGD3136jjpVIIarFPIbSf+SzgRIlTzM7OldbHZUBMM/j2vX3Quk6Qh6MPORqoCMiMVApV9cHRO/8mmeCulZSapkohlUkArRU/U0J9/VWpVR+giJosETUWYet+nRT7CqSMX6/6WT+zC+Qh9LqCpx+SndslPCn8d6Nov53ZzjCN6F3+2IL6IQ0gBl0TL5osPKWf3U/+MYJn84MFW/fzZpXEy0QC61TIxqoxRHzbij8kev28j02OCsIEfsoGrKN+khpdPZyfDcClp2klL36D5ADZSXwBVHYOX1l+L+lEZ/TfqahNbKGQhgHt67CpTHV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQMCyys2+5z87py+Thc3kWE7F/MdJZ4gfW1rfmWVP+4=;
 b=UqgqTmEr4P+gX6Tc0baxzguqKmp8GXeFZjHwHB3sKbDE7yR4wbjwcGCencKrvb/RiaMUvR79e7SVikaXGGLL0a0Igspg6VA0tWDeTmS+nGQv5PPcS1DYJ3pjJxsqFIPeOJcpEvDkYpeOpTaArbyKzsbc9lRe01mb7mZ9U0Dc+FbbFRtkIfbyk7rBeb777s0DEWOOImiXDWKEsQwKpOzhMAFvsjNYqxh7xhnkwDeU21U9gcF5gq4eBgz4SKN+/5LBv5embKZ5S+9tYF04Pn/0Tmz2Bqj+zz+1eVDdzLG8DKpLpXOUKVY74o6zPIJAeTT+w6ZIixrqhIceK4K7gFx/hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQMCyys2+5z87py+Thc3kWE7F/MdJZ4gfW1rfmWVP+4=;
 b=EF7iZpPM0iyMsEmjBipD/LnAoXvdpqt+wUBuN63HxlWFJWg7zPLharHTjTHYvZkgl8ZhF38hRU3WIZ22ihVUfIOWUPO3xBooKZD/B85mPoHLdVWdNHnvk4ViW7Po7Kt2lK43yQbUVdXAVrkMK1WeEDUYIQ73eFj7KiesvZitPZBe14jMy+yxQa9dilo6W517aJPkg6l7OJedXFMzY6O65EqsAVzQ27ZNKdrQta/gycbTWbAD3cWtq2GB+ev+dARHg/I5ZoWkwE3F9Dc5jYN4IpR8STG5w2OFzPF4HDjTSjvbbCFWvyrfcCG38o6h2o5ivlOJp6Fs3pkj7JKQmNXEcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 17:47:28 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 17:47:28 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/5] ARM: dts: lpc32xx: remove usb bus and elevate all children nodes
Date: Fri, 14 Nov 2025 12:47:08 -0500
Message-Id: <20251114174712.1206027-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV2PR04MB12102:EE_
X-MS-Office365-Filtering-Correlation-Id: 2082422c-aa0e-4cc4-7407-08de23a5e0cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xa2AhiF/nTd64PugTEs77J4rM3rf9S23pK7i0qfX5IWpRNfJUrq+bAE2KTI/?=
 =?us-ascii?Q?LThdmDBw1n5Ne+JugBuCrVWLPKD6vSAlORo9VDNJAN/VVJ6jM137chvozg3u?=
 =?us-ascii?Q?Pp5iM5rLOQge1Rb2E0NOjepQ7gwfOQuDZ/YaCXA7jVB9V2ofoPlKK2u5CyrR?=
 =?us-ascii?Q?j1llX6q87gSS7BYeZ9NDiTfuLtVuCsuIN2XZfWNS55WQ+mkIpOK43aIFs9SD?=
 =?us-ascii?Q?XnPDNtekuVNKHnK7CC1lehUmOr4VcrODxA8Yh6m0bCmU1xU+icDYtZh0u+B9?=
 =?us-ascii?Q?gfJqHMHBJZbh5meXSuB/olu+LosfX6yIhP+uKcPmfqdnTYatqYHiJ4kgPdAn?=
 =?us-ascii?Q?LDa3KwvcHGhxkuLpt9ynaJ5uIHWJZ5CZryTgbraBBqf3QgGFElmsa9tf7tQn?=
 =?us-ascii?Q?AA3748VofT7/NEu0HeeaXUBeLoMQqswpxshtIVs18je4OBIgwixq3nJj86/0?=
 =?us-ascii?Q?MzDz8KGI3L1Wrl4veD1wnYAnVeW9kCO2QPHWmJXQwj8az/3h4kulalv8OhJp?=
 =?us-ascii?Q?I0gfmn1m+qCp73hXuP9oYhI2piJzBwM9fZM4erYWQfM7weUW6mB/kAcbfdMC?=
 =?us-ascii?Q?aLQnJWunP8y8K9kzvXa53PBar6EMsgWlWGG7Nxjx840uLYOv8KlJOkY2OwYY?=
 =?us-ascii?Q?AH7AHeh7JbptrVKINfQS26U2KYYqt3oOHanGSKVeKOrTx705gItcVWU50Kvf?=
 =?us-ascii?Q?226FoGio7hrHEwfHZKMVNDISHO7/QAQYcy39qeb/pR2D/nIc3vne3ProqLQi?=
 =?us-ascii?Q?vPslZde4ik4JHqSBdoyp3yS/eg7LQXB1tqLxEacZPTUoGHIquCIxMif3IrW7?=
 =?us-ascii?Q?QjC2Y4LcRL+uLytdWNano1tnGzkE2iVpNxo1Wx8sOfq5D3G/6xgq14E+I1AV?=
 =?us-ascii?Q?GSKcU8t2uj/eHEXwDf9dV4gGohRDbV9xbKCHC7W3bgSsCuBYlUsnAtIInvdf?=
 =?us-ascii?Q?U96HrRSRf7vPUpLNpzuOSY6ZW4shWdqvE0ZmmdMmWmuq/+lWYqgNlBWpAMxZ?=
 =?us-ascii?Q?QogwHW+KjjKPVyt5VaCluqQ+1n1J8cAA2EhWhjk5Tg0D8CaxQHnvRXLDiCuF?=
 =?us-ascii?Q?1LO69X2z70J5i4cmDsqOKoQWI2xktlLUMZZj1jLSSSO9b0qycQpswOGb1kxW?=
 =?us-ascii?Q?Y84wzlGsuq1SrPscgIUpmbZEYRcxETM1SqlYqZ5aGIrKdk2K2Vw+smQPWYSS?=
 =?us-ascii?Q?nr9KG42d0AvXIk65RwgMssuBHDvu7virfHADIA64sblyoJ5gX5vEEQoyK/fd?=
 =?us-ascii?Q?/UH8zxIC8g6afirSd6JMvdt50Lzz5I9EMQvL+QWs7xpTHXZaSjBOhGVpi4dj?=
 =?us-ascii?Q?rbpyBEXhED7ptBhRrp3U68HN9EtifnQyn2oZpjpWuMyfx4V2+vr/8ayKV0Pp?=
 =?us-ascii?Q?a5awyLB69PZQXywKZjU2H4ZWv6rT2eYd0bSzMV/ktZ900djvMRHOQN+OHXqW?=
 =?us-ascii?Q?fUGkul+B86AwizSGinJZCLpHxp2WnmSkHkP0hrND5BqFoSTnEjSFEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YBJONxcfW5zoY+VsUIAgWVd9tlvCDsyyWnDxJO/uu45eR8OYeGZ8Ggg415S+?=
 =?us-ascii?Q?JZaaaCmNYm6ZOOAOhLYXxEr1q+CN77d8vP8xa0rYHrhbj6t+N4nStozy7L4e?=
 =?us-ascii?Q?SsfO6etBRgYxZpnchXPWJiOZubAFW5R0ZzXoOgRJ3OKi73PFCANg2kx/AAYl?=
 =?us-ascii?Q?NEBOJ5AHtsUYqI/gxLVZpuFIUe8Om6PaEA1SfO/eGh5ycDrvLi0kii9nHF0R?=
 =?us-ascii?Q?qXdEFXGd6u6ZPwjV5mWlbjUWP2I7hyG252GiOITq23+UXFm4NDThz+i9WCiB?=
 =?us-ascii?Q?rmtYzNdTFNyYZb/Xu5D9bzix7VFoyh0hqFmxAn2oDLiDS724SEVe3+zAezPC?=
 =?us-ascii?Q?NvY+Rv+nZuXGmopwywv4qq9X4NE5Bk68dB4HZUnUtLgldbciq6r8JyDS3eHE?=
 =?us-ascii?Q?9+Tvxf2bQfPXal+NEozSVE3xdxtprWG5BEE5GilW5sYicr4VTjgjngH5emTZ?=
 =?us-ascii?Q?4AxlNOy+pVnBSnaUwwtD0svsZzcdUurUU79UarhNQJUfT6qgxlIE7YFGhCH9?=
 =?us-ascii?Q?Fz+tUrqcK6zg/4JECbrls8FZF4KHl7yp/3CWNsWkQ9Dd+vQ89Z2jB6EdDTXV?=
 =?us-ascii?Q?z9EBk4FOQBgJv/stzOiNz3rfdBVEZesTZabHDEDslG+SXTYVdRxHV67HATQA?=
 =?us-ascii?Q?i5kFU348LPXAJfj1244afDFEabDP7/i728Y5p3P31j8D0jHJ/zCtGo/vKo66?=
 =?us-ascii?Q?H0Ryz2yCN0G7FGCtwgDgmJ9LAjmu1JcDIbGlolf8H2W7NBnJhc9xo5cGzhT/?=
 =?us-ascii?Q?9SBOLMCz4PmQ+P+oKSkLIp1iGhPGYFEqTQje+w4uYHaSxekvU6Aauz2Ax7jb?=
 =?us-ascii?Q?7CuXVeFdE1j9uZUrw4MSvHc7g52bl6EfAk9LhD+JwEQREeGOQqLpPQmU+rbR?=
 =?us-ascii?Q?Y1/eYzJuER4Rjt7yVNIEP3Yy4qxfvg1F87pOCCem/yV1RheDZjQByAZ2qtAa?=
 =?us-ascii?Q?WDU43AhBsQMR3Jvjqalkpxte/hJ0ytnndYsF6CVJsx4wzKAG+HHFJ0ogl70g?=
 =?us-ascii?Q?/q/d45ihprOEg5RF55ZmWQYfvZo2OS2XIzXXNnrjVrZVwJwdvpyo+MjWPVZn?=
 =?us-ascii?Q?oJAZpjmsTU6lOf2QbHrYLZsgprTloOPUicD7FdR2hH70kiwhckPbCa4SiJKa?=
 =?us-ascii?Q?r/xT8ht5llnUu/l964aAY4+Ajn6KEWjOEiiH7kh9SXkuVKXSkuX7wJ0PbD1P?=
 =?us-ascii?Q?qm81IAfnVytUh4o1ExYLAsxCGeRgWpJ7+SqQ5/BV6UB1Gn8UrMIFNd7V8X5Y?=
 =?us-ascii?Q?L9vjmOs6B8dhiVaKXWzhPhnyADXw6f+WTN7mM5IlLRH0et6cB90SUYikUwRw?=
 =?us-ascii?Q?bMrz1A7qjO+6U3IDepbky5uApEL+y9xXw41cJVczdzyqHaniNo1/btm2lhmb?=
 =?us-ascii?Q?8RCGZNTF/doo/k2T6MabjuUctzhSunG++C56yinVsmP4BGL5FIscJjqvMlNz?=
 =?us-ascii?Q?Iv1QK/7ipCzKOChdC2huqEcpW4q+KbtCKHaAKa6w5inWLda5QYCp6skblhSO?=
 =?us-ascii?Q?GBTgvLzXw81OkhiTRnFS7CDtDJ2CGYRnDKSkFxdgcE70gdDwKbIbhXiaKmmI?=
 =?us-ascii?Q?OGq3wlYdL+Jz/3J/tFk4/D/TTUPPulEOmOxv4rsE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2082422c-aa0e-4cc4-7407-08de23a5e0cb
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:47:28.3309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LofQxQagiMe2ibyo+MYwQNAMDl8xrF5973Jvj6VYR+XLiuB46zwOK17+YFNo60WrmVQPmhdYWcGCKtMI0ErLRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_094734_528057_4C47F62F 
X-CRM114-Status: GOOD (  11.20  )
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

Remove usb bus and elevate all children nodes because usb bus is not
existed and only group usb devices logically.

Update register address and related full node name.

Fix below CHECK_DTBS warnings:
arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
        from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- elevate usb children node
- fab leave unchange now utils finish discussion.
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 77 ++++++++++++--------------
 1 file changed, 35 insertions(+), 42 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 4dff0d7694322..d6243adbc05bc 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -86,51 +86,44 @@ dma: dma-controller@31000000 {
 			#dma-cells = <2>;
 		};
 
-		usb {
-			#address-cells = <1>;
-			#size-cells = <1>;
-			compatible = "simple-bus";
-			ranges = <0x0 0x31020000 0x00001000>;
-
-			/*
-			 * Enable either ohci or usbd (gadget)!
-			 */
-			ohci: usb@0 {
-				compatible = "nxp,ohci-nxp", "usb-ohci";
-				reg = <0x0 0x300>;
-				interrupt-parent = <&sic1>;
-				interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&usbclk LPC32XX_USB_CLK_HOST>;
-				status = "disabled";
-			};
+		/*
+		 * Enable either ohci or usbd (gadget)!
+		 */
+		ohci: usb@31020000 {
+			compatible = "nxp,ohci-nxp", "usb-ohci";
+			reg = <0x31020000 0x300>;
+			interrupt-parent = <&sic1>;
+			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&usbclk LPC32XX_USB_CLK_HOST>;
+			status = "disabled";
+		};
 
-			usbd: usbd@0 {
-				compatible = "nxp,lpc3220-udc";
-				reg = <0x0 0x300>;
-				interrupt-parent = <&sic1>;
-				interrupts = <29 IRQ_TYPE_LEVEL_HIGH>,
-					     <30 IRQ_TYPE_LEVEL_HIGH>,
-					     <28 IRQ_TYPE_LEVEL_HIGH>,
-					     <26 IRQ_TYPE_LEVEL_LOW>;
-				clocks = <&usbclk LPC32XX_USB_CLK_DEVICE>;
-				status = "disabled";
-			};
+		usbd: usbd@31020000 {
+			compatible = "nxp,lpc3220-udc";
+			reg = <0x31020000 0x300>;
+			interrupt-parent = <&sic1>;
+			interrupts = <29 IRQ_TYPE_LEVEL_HIGH>,
+				     <30 IRQ_TYPE_LEVEL_HIGH>,
+				     <28 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&usbclk LPC32XX_USB_CLK_DEVICE>;
+			status = "disabled";
+		};
 
-			i2cusb: i2c@300 {
-				compatible = "nxp,pnx-i2c";
-				reg = <0x300 0x100>;
-				interrupt-parent = <&sic1>;
-				interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&usbclk LPC32XX_USB_CLK_I2C>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
+		i2cusb: i2c@31020300 {
+			compatible = "nxp,pnx-i2c";
+			reg = <0x31020300 0x100>;
+			interrupt-parent = <&sic1>;
+			interrupts = <31 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&usbclk LPC32XX_USB_CLK_I2C>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 
-			usbclk: clock-controller@f00 {
-				compatible = "nxp,lpc3220-usb-clk";
-				reg = <0xf00 0x100>;
-				#clock-cells = <1>;
-			};
+		usbclk: clock-controller@31020f00 {
+			compatible = "nxp,lpc3220-usb-clk";
+			reg = <0x31020f00 0x100>;
+			#clock-cells = <1>;
 		};
 
 		clcd: clcd@31040000 {
-- 
2.34.1


