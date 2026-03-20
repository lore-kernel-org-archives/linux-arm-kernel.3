Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3A91099B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfHSUF4wl+C6LBp3abm/D5GtZrb/+lTNNlXqgPh4ZIg=; b=idC7c4a0UnoMI5THGircNCPdYn
	faPXcBBjuDov6jW36qx1URUBlEqoP5VBCDI6n6r0qpgy3krw+xRx8wCLDhU1PpIv1rxJ+zdA37I/1
	7FOxNqkN3HAKUDue1fY0lyvLmirFILVKRfd6Of+XoBAjkIuRCF1455aaJ5GuvRI6B2NiZuf9s7mQy
	H+ebn6yP+43KoPJVIVLKQSMFe18vBv6SWFI9Af5llNAEvLy6irbjedbMjcXrg4U2yLlGkmOvablSd
	jb5hcgPF8qRZoKfGRfYKTF7Wc/Cb4cIhIriAh69gYV0b2lYF3uL9aZkMxPehvyEWwgUD7+PKalesW
	xmqcjpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hKe-0000000DccI-2qBR;
	Fri, 20 Mar 2026 21:24:36 +0000
Received: from mail-norwayeastazon11023080.outbound.protection.outlook.com ([40.107.159.80] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hKV-0000000DcYx-0Hwe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:24:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/vuOFIsHcPwLXmS1NGuJAlM5zMjyDRdS3Wd/9XkbaKX3jZDBSHGMemNmH3CIpdf7ihx4b+wJHXQb3nGB5ks2K2NYslT73UYlLawA558HBnm6YbF93y+PR+cFh3gqIG3lqLkFnKyropS5Pb7Tpya37sUPZSbJFk2hAM3AvGAkAmOybr3dSR7xco1Cs5oglJvNruFkUziAdz+tQWFqtzyFCcWU6wB5IoFtgx3gWzMEJHBljBEj44ucRvBuimAp503poomhytNehVz4X/r65Sqg+70ser3n+HNX4GBxd5i6eY24qM03WVGZKI1q5gv0l/o/BomsfmPdm4FF+7qXUaaCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfHSUF4wl+C6LBp3abm/D5GtZrb/+lTNNlXqgPh4ZIg=;
 b=ixgi6iFnu4Mnp6SNdKAb/pvRucu/R4Vz53tcRgA9NTtwv4NklxGX9gEjMa2Cvr9v3QJObzTGu7Et3mg086a4FXpRKL9cjgrRAInlBLpFDh0Y6zXlq+xgkZlX1uKpzQHJFCG1ZnlDJM+LOLAkFMwIP6pMFQ6hea3RTrVr+8IU0FmdFhFImWgbeCvCAK9aL6epQW2Embh98DrbERh3C7sglO278ulgSvVUJstvha4AsoADZYRtqUsfYtERKJ3vGFQ/zNRAkQQOKc6PZ270yeNzkVqxb89JxfeNPoKQqsmDOvskXMaYyL1ZyBkBnooy6QIyGZq8J1Y7yjuH7ByQ2Sh5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfHSUF4wl+C6LBp3abm/D5GtZrb/+lTNNlXqgPh4ZIg=;
 b=fJrT269lxe+XwHseqxtRMuI7h0ryhFuwM2Om6MOLiW/upuvcSmePT5jZ5wcGonNHU2Hf/J58zCyR143vF8J6T3hJH+26YOwow87lUAh8LaFtiDXxWKbEefgcMq3yrmy4J21nWUgjq1jh6IWVwJzbujBt1ALpPdI2Lep693F2lFrlF/6QkShLSYAQFGuWDi+egBvwxgHHl+NF8jDxwcKaHnHvsksD3kSZGEFyKErUltFgg+igKQHIR6zjmAjIr28KyIRvilA8OdUqcFGu4guXH9loG+gvkMp2DoYUGUCE9Jf/UgU4CjLk8gOgTHM1pl9TGHt0KE1VMT7F5vNN1vPs5w==
Received: from AM0P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::12)
 by DU0P195MB2276.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:424::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 21:24:21 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::90) by AM0P190CA0002.outlook.office365.com
 (2603:10a6:208:190::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Fri,
 20 Mar 2026 21:24:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 21:24:20 +0000
Received: from lws-haller-privat.attlocal.net (172.25.39.212) by
 Postix.phytec.de (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 20 Mar
 2026 22:24:17 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>, Beleswar Padhi <b-padhi@ti.com>
Subject: [PATCH v4 4/5] arm64: dts: ti: k3-j721s2-main: Add DSI1
Date: Fri, 20 Mar 2026 14:23:45 -0700
Message-ID: <20260320212349.420951-5-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320212349.420951-1-d.haller@phytec.de>
References: <20260320212349.420951-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000192:EE_|DU0P195MB2276:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df9247c-e3d6-4a22-d1d2-08de86c70d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: R0DBk/540PHV+poX+XxfW0UV+3b8UXNb8NxY2tc2EkIFnOR7GWeX9SNe0fMf3omtowAW3iLoVwsrK25qPOZvXi2XkazfQRhJnYnlpUsQOMgAxFBooz6xXnAzZfno51pu41kCTfKNQyRnM7fDBldUYvDnO5WcGOpepZkqbHVF9ciG0JjuEUc17b4m5ndZ5j5WLB2SonuH/Zpo8EWnUD83o7R4PpuFXW57yWRn8sB/HQW9NX+1/JQqklpZSqF6h9eP+zHA5Uz9VsvQAuHdZK1oGNXmZXNaQuxa9Z9Qy/NcbC6C0GHJjayJVe7OEb+z7LoIIm8GHxxQkWlROF2paqeThyaUlkBEY0+bKmB6sAuxZLx5gsy38JrXQmHiwFd9R3mJQkSgOVFw24my/JGW/60PYHr8f543MBNX0mjBICD2J6QnP6DooNoTAp1oUdZJ7ecAGb7YIaDHSCbhFlM9YEW5byVaCJxoXKq6CXdh1aMN2+3hsGJ6HSlLjkTPkV3NnQj2s16Fm+koow8kVFHyIjoOtdbHh26/y0igm5rDmw6l+VgB+bVh78G6maKd+oqfGvJrSHQnxm3ZZP7T+r/PZrfx135r0DKXDLjKmVkKbrYqa52GOfO6mb9lU4mPkUPflpA3YND2uZ7cy4jCZgKfextP/U5NbcvzGYyCDorusQpD/2LDZ2qoPTqBJSz0G75vvwA4vqMbUAmxFyqpYf9xYOCgrJyK0rnsNt4D204hiE+Z8dWl2V5+MrJ0iPVqr9tm7IDCS2q5CJBffNjQZRazIg5ceA==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Jxl0RNcRzqjGq8r65Itf6TsgagTVJlIf+WELaRLJOkW96DK7FkYjv21I+NbY6Y40Yp9z5o97XDI8F3T0BZnO4P8nGty//V6KGPjVL5VqTcW3DhYn5ECm5d8C6M58MNrHNSLfCy82zR5r0XQheEabtGyO/xe/wmXkCTTqWNqbuPDsFAvjftllgzn2LKQt6mv4/ZPW+vGIH+fAR5b9ICxwd01oVzloMDFY9YGKSrgveGQKNjMkoQ4aa1SgmBBrFcXT5gKqon6LF/GFi1e3vzwgHNrQo970VGUiGZyfYQ/0t0XP50EFxGLU45wsK8bJHgYOKwhZPZWOM9w3N46madrTYIUEuzW+k2dXw285HVYW64nHFd4Ufn1Sbf3v5jAEqUy4k3wH/C3+px6MIM35r3XJzIU/QBxBCqYsxo6LBhjbNGrZITwmSzi/SHEyy5CW6iBS
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 21:24:20.8700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df9247c-e3d6-4a22-d1d2-08de86c70d12
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB2276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_142427_149704_E93FF982 
X-CRM114-Status: UNSURE (   8.44  )
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
Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
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


