Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDCEE6BF37
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 20:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kOF7aRMmZPFa3rHBhG7+1RzS/skO/vCFghHSZH/Ahg=; b=C6a3WwtnduzYBVJU50zhjKBf48
	YFnooz4lF4MiLKsmtUkOZunrbucrdtqzUouMJjJSrFpbUzilPj5u5HMeH/R4W6yFRuO7kevb363l7
	KCYtMNnoRRRwG/UWkFxIO0gtq/ASvV4fUe/j4TiLizKWT2OF2f9C8Cjduo9L6viKKdDbh99YRgK7M
	Ey01tBWsIRiPL3FeW8LTWPMffx0w/QdrPaLWYwQ+0bMkQd0BwGO8EMGRDzT0AOn3bJ59ttByVnwuQ
	eNV6tkr+De11UWV1adKlr+P+UGQKizy9Y8mc0mdcIToVCtcMIpeND/HawN/zrlI/WhnMv327QAOOs
	HddbGGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvai-00000001yC0-0xN8;
	Fri, 30 Jan 2026 20:59:44 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvab-00000001y8E-2sFZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 20:59:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugQ3EF2pJrBIY5eoFZi2NfHeHbH6zEBjXRK+xaZnIJusq5ZwtDme2sGVBbLxvk6x+QNWknd03vFFhQIBKybOFE5g1/54WSrF71zaeT0Wztw9Nj0fLXClhlTHLybLPlNjALHZreNkfe96kPXYWrBmMaAQF2J34edZHNs8OLTcE+LkzixmXpQN7yj2H8Phu8ywqusUoIbV4iOOsH/uIgAj2ym9joJIX7NKZGybBE2eBD3dfH+Ym6GqcAQzyqKd6Y4zPI9E6Y0CCLTR+gi/fj7Eef1INlKnXLP+hhFel3TvZ99+Eobw3q5+FpDAn6ZSYGXI7rsbR0ar8zxGBlqPDWbBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kOF7aRMmZPFa3rHBhG7+1RzS/skO/vCFghHSZH/Ahg=;
 b=vTZWmLFD9OIP4osruUpyQGomZ3lJ12XQVeEWxzYtBiA7VeJjYI7klfpKO4LoxaOkI1M8JzmhJ5dUKPHkLE3tt1uNE/tH+v31bC2n0NDIGB/GAfECTV2nfgHCuIeMotAQ1NwFDWYA1XS5V0ggpqnoJKq76pW9ALnmh3DF/uOyB1dr6RuRq201MB6rEGNR/D64nLWPuKMSQduxM5O0UQw+6c/M38pf6I7iEUAHxTMP5reu8w1spZZd1W0OA2Sjohh0OEk00FdmDhh+1wSOpd+R+cBc5Co9UJDzgJDWhLeJntwEgSjk2KK3iYQtxO0sRTcUXfZiB1qcTRXFs97xD0BU2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=gmail.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kOF7aRMmZPFa3rHBhG7+1RzS/skO/vCFghHSZH/Ahg=;
 b=lL/50IZfpke5IhRfkBDPSKrh+b6CZSau1rQ06Ht4Wr+/Vfv76CFPZkI2c5aLa0FmOZzCGLEO7TLy0QTVoWfyq5igrBOFoPHzPiJCtt3sTAE3O62wP8lcHQfJpmUq+ZzaCmptOa69RTw6OVFwjLwgvwwkxqbZ1qRZhtbKnxB5cWy4yLzuRVwqJQRTG/xXvouqxTyvqQKZO6xBvmvBkeEkt1txVPUAsQ2fqKcpT0cRx5x0cuBib/hACc3LDzF5Dw+/QU/dVNfinPlgPDF5ucPb4MEzXs5FGGL7XKo/cQ4m3cYacJ0DEne6JmrVqQGktC02fwngJdlGw64c/xgfehS63g==
Received: from DUZPR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::11) by GVXP195MB1736.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:150:2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 20:59:30 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::f4) by DUZPR01CA0084.outlook.office365.com
 (2603:10a6:10:46a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 20:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 30 Jan 2026 20:59:30 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 30 Jan
 2026 21:59:26 +0100
From: Dominik Haller <d.haller@phytec.de>
To: <adrien.grassein@gmail.com>, <jernej.skrabec@gmail.com>, <onas@kwiboo.se>,
	<Laurent.pinchart@ideasonboard.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <robh@kernel.org>, Nishanth Menon <nm@ti.com>,
	"Vignesh Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/6] arm64: dts: ti: k3-j721s2-main: Add DSI1
Date: Fri, 30 Jan 2026 12:58:14 -0800
Message-ID: <20260130205820.83189-5-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130205820.83189-1-d.haller@phytec.de>
References: <20260130205820.83189-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|GVXP195MB1736:EE_
X-MS-Office365-Filtering-Correlation-Id: fd48db40-2a43-4045-e10a-08de6042767d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|7416014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OuXK73xKHOs6wRvxyo25UER4SUV6FHXZNe9asmGcmjk/mG6635F29uNbet3R?=
 =?us-ascii?Q?1U+SovLg/BmkhtaRJnNV92qXFSk+Z+uaCHoNm8Vdq00rQbNMWtzwCRPIvC1d?=
 =?us-ascii?Q?T8AeEnQY5Pxx3jgY0oZeNv0TsSAA3wPsCCbfd6YZx9DTppSnmW9KPN4sPaII?=
 =?us-ascii?Q?19BHlIdvOCoSuNwmGHDcRaAlsW1ESNBII9yTqqwZ4jt2oBHwQYejLxuidY49?=
 =?us-ascii?Q?poUfDClksjGIMElWkMg3c/zfv6O5w4k9CJK2PgCtl1h9YIafSgIaoFo1XN83?=
 =?us-ascii?Q?5KNost7cwfjohb5znqzlI/i8ZhsJc3yuK21QYudz70OSxC80M/lmDORtfNxY?=
 =?us-ascii?Q?5YpdL3ViOiQNkEp0jJebFJFRhXV8whkNXAlbC9PypIzM09FRIE3FXSF2iTu+?=
 =?us-ascii?Q?NM8L1tZUj2GBH5oaqoruDSbsWUc37SOn4FaLZFOeR1UFyiXR4Q1bXZgYNTx5?=
 =?us-ascii?Q?3b6Y2HG5voL9bd9LhqNnxZmmcFMTKrJ5Fu4e+sGTa7BifNkJiXW8tlo3Hd5E?=
 =?us-ascii?Q?rXnfeIxGtAAFwSd7Qn1AEUX9Pn2k1/1MCVzMeoJH7tcfQaXYgItY4PMiWQgJ?=
 =?us-ascii?Q?3NC5OnBl1QeeT9b8kxcp5ZFRHVhtNpulRuuzG8MNfo8yGWZRkHBm163WamYs?=
 =?us-ascii?Q?iwQBh9CupnGgequ9wu+EIP+1/50tCdqMqCDmGHi6suaRCFEHlqRrFQAI5Fh+?=
 =?us-ascii?Q?BuyRIQdPKfA+fI90BZKjvBnAac0SI3LRd4uc7CDbJj7QV7+zKdarGHg4IkPq?=
 =?us-ascii?Q?dZt/IIX07QhfCci5sjfabinevRVhUObYRS6C1LYUYt7CAwFeqsOewH9v1qg2?=
 =?us-ascii?Q?Mto4TY8WOWey9N6pxoJ+BCcQz6R1bSDubtkYslfvBkZQUR/ogkqUlnLD81nG?=
 =?us-ascii?Q?wqVU6bm/oWH/WB3GpfvDPUyTRQL8yPI2IAyfAPzVb9oLbb6zBj+LLIT3exIq?=
 =?us-ascii?Q?A4I71SQcA2lSeT6uw1LTRyqHCB3x0mOOap7rFAJ73py6bTnCFCjRp6HkT6Fp?=
 =?us-ascii?Q?lUuJDFLcwEHSE8Nr5H/m0JTEnTgrzRwGRy0BbQOgQQpuSvA0pynuxrps58R4?=
 =?us-ascii?Q?j4XjmA0Xp5EiKDvHLKATMkYfyzP8x0NxPm+xVsz+1vWdrjEnjn1RFLaJyF25?=
 =?us-ascii?Q?4Alr6rgsz7S/Fdlmz3kXQBt3zS4Awc58qsY6Q8XNVgKM6FLY/DYdJlHEDmW9?=
 =?us-ascii?Q?d7vHtOxW+CtjXIcEUGg2GXDNhaxLm7q+NlzTTbURncSOQk8CiZpy/7rACt3G?=
 =?us-ascii?Q?KB/vavNAjcr9y5+N2WncsUw7CxJQvyereu/RdfI++d/cLemlXGnRs5tvolA5?=
 =?us-ascii?Q?OS0gBZtJ+ycqdAeulNolNHTHIvlmLxQewg22HKqNv9q5P0E4LvY7Ylw/furx?=
 =?us-ascii?Q?CVt0NGuhnd6Kyz/xIt5uCYYq2BKkf5dGIjZKaD0fDf3RT1UcEiJt0Z3EkjIY?=
 =?us-ascii?Q?imMjUmvJNt9Rs+BfJmblaPSroGKY5fNpCezGk6SUT+LmYJcbdzL6lcsFemCl?=
 =?us-ascii?Q?zWG+0nPpfx+aYOr+/ieNFFkifcDSQ94OB//o8Q5XHJHgNmKg1ipLCIocSNAY?=
 =?us-ascii?Q?W9oF1q18eV5WI2Co3fv0AhmFcCubvp3azdiewEJqtJ6qqJmTIZuYtEGx9LA6?=
 =?us-ascii?Q?7J72KPYIlpGg6rg5z4MOWfMYH2Uqs2kT39vAeKrTpLJ1NVTVxG+9noB8+Yc8?=
 =?us-ascii?Q?v/XhJQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: raHKCGEjxH+GSCOrOeLq39DJALe5g6iv5l/y/dQNZYEo7H4azG9MjZHv5l7pkLN0kXB+lsffZbOcGZwZu3dDr1XBgMxUAKlQgttiIIyZ6CTrJsP0PGkag9Hfi8+IHN8Eq7KgAxlzJhXloxszQAfHVmNKr+AXifCAEp+Fcxh7Hq0uJEKzAlL2bMHl2dX/ZnWnngYnr7he4DfsUgSVweWMMpS8Nm09mbPTKf+RzHzjncU3sfrbp59NBOGJeySrpLPGwWXuHz6D5dEe+JXwi5Du5yrn0z9G8TYLCREbRr5qzBqXwUCk9JlXya+xydJXJZzEqgdBU51ciVbpuwx7niHbVi+EwiXLSwekUwqdzvZUfOmTz3XYsPepjZZ+hA732/4uVu1y9sohcF5rpky08/cDFHPeSUHl3zEePnRkar4IqvB7Yh0x7bR00DTKHB6x/6aD
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 20:59:30.4557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd48db40-2a43-4045-e10a-08de6042767d
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP195MB1736
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_125937_758212_CB0C1DD7 
X-CRM114-Status: UNSURE (   9.69  )
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

Add the second DSI instance and its corresponding phy to the main domain
include file.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 80c51b11ac9f..80a32c451d1b 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1815,6 +1815,19 @@ dphy_tx0: phy@4480000 {
 		status = "disabled";
 	};
 
+	dphy_tx1: phy@4481000 {
+		compatible = "ti,j721e-dphy";
+		reg = <0x00 0x04481000 0x00 0x00001000>;
+		clocks = <&k3_clks 364 8>, <&k3_clks 364 14>;
+		clock-names = "psm", "pll_ref";
+		#phy-cells = <0>;
+		power-domains = <&k3_pds 364 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 364 14>;
+		assigned-clock-parents = <&k3_clks 364 15>;
+		assigned-clock-rates = <19200000>;
+		status = "disabled";
+	};
+
 	dsi0: dsi@4800000 {
 		compatible = "ti,j721e-dsi";
 		reg = <0x00 0x04800000 0x00 0x00100000>,
@@ -1841,6 +1854,32 @@ port@1 {
 		};
 	};
 
+	dsi1: dsi@4900000 {
+		compatible = "ti,j721e-dsi";
+		reg = <0x00 0x04900000 0x00 0x00100000>,
+		      <0x00 0x04720000 0x00 0x00000100>;
+		clocks = <&k3_clks 155 4>, <&k3_clks 155 1>;
+		clock-names = "dsi_p_clk", "dsi_sys_clk";
+		power-domains = <&k3_pds 155 TI_SCI_PD_EXCLUSIVE>;
+		interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+		phys = <&dphy_tx1>;
+		phy-names = "dphy";
+		status = "disabled";
+
+		dsi1_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	dss: dss@4a00000 {
 		compatible = "ti,j721e-dss";
 		reg = <0x00 0x04a00000 0x00 0x10000>, /* common_m */
-- 
2.43.0


