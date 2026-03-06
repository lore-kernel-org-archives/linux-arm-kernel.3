Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDA9F513EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 03:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kOF7aRMmZPFa3rHBhG7+1RzS/skO/vCFghHSZH/Ahg=; b=XjhoAmaq6Xi0w92CjaWUUc1pl7
	FKcoszajDbO3cLJF4wiEDR0FxKbpuhm1A/vg+v2nZiIYNVRd3UGwRqzX/K2iXUkfc3g9WnuGjSvJS
	IdiPxmRwzsyFSUEnr41KTcCeCLv31/0witcjMyunLHbUs9KuqOZcT+JNpba3KMjvuBUuwmF+Mja2C
	KgHVFsvYV3xcp/WkkoUnGs1LZHS2jBrtzyKU3aaom1qPESiI56MtrecNiPPEg89gpSKyzC2K9/B/g
	HiU+735toPI7ADD1vqGxBrk/GuyJ9i2J8lWn75N2Sr+1xGdcfNHac4Jre7P4sPqwkfz1Yu76P6Bs3
	Fr92n2pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLvi-00000002xpT-1LWf;
	Fri, 06 Mar 2026 03:32:46 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLvf-00000002xnb-2nGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 03:32:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mr0tRqqijTSLYc6VXlrMUbLrzbbQooZp1Hoi4k1sB5E32Qq7L1Qz+lXjCZ5yc37FtbFKKEedolUFXkkg9iXOnqwRTwDRFAixMDoifeRkiSXLYetVHmQM1eeDSEjTrBQdf78ag2HVCQSGo8mdjEju/kLdQ/dulUCA8Q7cefYcGgnYdhqWbqNDZ4L5Ru99uBpw7iWKWQT0wYB61LOsrJkLNo7eRf4y9/EK5X8MAETjK6SJvHasGAtz0erVg1XJFQm1vVIt/XLEaO2MV81P0+f6CyoaN1PhfoZa4Py5Ge6+cvTbWNQw325f/NgDwIYI7j61iixkKmoVWwrl3VrJQGHDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kOF7aRMmZPFa3rHBhG7+1RzS/skO/vCFghHSZH/Ahg=;
 b=M8tqlfBMYullh9mebif2FB4u5gh22y2m2vNKeszRv02h9QmW1WHWZ4s/vlfkCpaGPMvqc4oDeZH/rzaj+A4C5PfslpWBPAAemE+iSJJB3FJ9bPtFHCTbuBVmryBGNTXOYxoISYrS0wiTjcybcUyeqvQ8MFn0RsWkpYn9sNqLXFnK8LA1UWPM72wVQIg2qydR+Rq/yBtoFqAFNdsykqbqZjR/yWE1jg2hTSUYT/vxE65A4Tzk3gPfNMQWi9LpRA8Floz9VqwhJ4anJgB0vvB5L4QSp12rcQrq+jOtD85wk7xrjOS9Qa5x2BU2Ww2qUA562HOCUTG1M8/leIyPTqF38w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kOF7aRMmZPFa3rHBhG7+1RzS/skO/vCFghHSZH/Ahg=;
 b=TUMgBXUxJhitDrFWy8ij/+3xN1DeP6CglkmROzMRaXI7n98xjd/cf4t592u332Juln9BLlQ1yetGJ1jpAgOMjjucR1BLUJGZHX3oqt9GPt/uRn+g0LnNnFbF+HlxYD1jADJ6fUqvC5DXrMwfQuyhp4kh/yIbeHQAglP7XPWuL4GGaBJw2C/gviHbtSRveLOuUH2rHrKNJC9mzwS+WtKZSXebZs2pN8qwx2PvcrayREbex4d+Snl/mId9Ck7vlmAJdwM9OjItIaU+UBMZ1/2QdeBNQKSptKqns3dBO2qnpc3jM6CkNRBP+pN9KCKU7B3DJ2riVT0DM2fD6EvVSlLfmA==
Received: from AS4P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::20)
 by AM0P195MB3237.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:6fa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 03:32:39 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::d7) by AS4P192CA0012.outlook.office365.com
 (2603:10a6:20b:5da::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 03:32:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 03:32:39 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 6 Mar
 2026 04:32:36 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v2 4/5] arm64: dts: ti: k3-j721s2-main: Add DSI1
Date: Thu, 5 Mar 2026 19:31:47 -0800
Message-ID: <20260306033151.276202-5-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306033151.276202-1-d.haller@phytec.de>
References: <20260306033151.276202-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004A:EE_|AM0P195MB3237:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea06abb-4028-479b-6721-08de7b3104d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: VLd5De+X//0iV8can551BH5bQDK2SG0yoKIQ+xtkEEmw0C6LT5MK4Yo+5ftA4KqvKFw72wZ6UyUH5TRPWrDk1PGbwgGR6IfPj+MZgjjYAuG2jTNIVyheAGLlN8JCp8zZWivGs0lXCq/tuy9Q3xDHIRul8hmasxOkUSTPxTf8KQWaD+N9Hj2A7Ly49VedDRGc4g4b/9+X6pB7+fd7nEoOjKX6kJy+4C6YeBzdkq/OX/EY94bxBElo2eCzwyYi8oVVOo4Vzw5pYbGFmj59tBBDMdftzTUcr6ZY5x9nvtiVzC5M2oBybxs8oJhFqIKgztA5ikOzYQEBhuWop3i7OEMwjOHCGGTU+pgcsCHVOOYZedBzxBGqJYh6lP1U/DxI38NW4j62I/+31lUAVBVrk4wrNM1cDvHCoIgWtP45M0/cgv4VhRTHFWpx99i79IQKAV6KcUlBiBHsUIpZIUMJrOAobuyP6HD6DsMyfFUcsTzgiEswEjG4tK2pcArR+GlFznEM0uJKYo3a+IWKfmiZ+P9aaj78mC0uT6i1wpXangqS2Z9Jw0nN2pM8EC6wNZJTB1qWwG17yc19s+AhNKbhNoXr5uhiEXla7yXjjt8WeV/TADH0nWJJjFHA14ScKwmgn08UMK1HiAWQ1clvqWktJ6/IoM9fwHg8qxIBo5C2qEGVIYIazwlVKQxgVpzdF4W+5aTMBv0uG5PUvmCu6oj5bq9cexzUn9yDNy6qwZyG2THqCq3EZr+B7VeDZbkr8WYwYxtpjqs1ApFxKl7vkehvtDZjSA==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hlUhsYK8pp+Jxs9jbnRjpI/nQYp9YWZU4vtGiXuqggqvdlREiqM+xe9EzPKSRcCehDBeEBt0ynKQT3ntHtHWHRNtxiIDFbhenIfK/Xi15y1IdB+L4dAvWRdnzzhzFpg7rbo7jAgJ5QO0Ulnfyy4NX5xeFXMhpPapxnRt0TFytDtYLwrWgMI/icHy7YzEr0Q/q1yNBDZSSiIkk7znkxRK5F6RIJax6T5NvHix3aRgi9sQIR2E5fRgaCAtl8O3vVeG2JD5Sot4Eke/2XZVFC5PBbWr5uMckV7kzXYs2OmyGm9BXVVbkMuS6RMAtD/fHvBIEDfHaxt/9cJiHqEpxr/x6r8JLoZpTLSuD3AgF/31LiHVz9wu473cAq5/RN5hTnv416QzydGJyRKVMpq+aCzw3W6ZWlmPh10dl/zbe2PgSP6R2s7h0ytifrfLaLT44pIW
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 03:32:39.7379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea06abb-4028-479b-6721-08de7b3104d4
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB3237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_193243_711938_BDD1267E 
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


