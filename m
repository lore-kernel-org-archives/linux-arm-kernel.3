Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC5ACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOb53BJ8tA6mJjofosn0Ab8naIc1d79iyYAqL8xTkMg=; b=DMRxqDNkLnlUSXSfQAo9pME+Zc
	SAkUKiN+t73NelVvoaF2+XXGtS7jcyBav6SmcjBJ0S9oAKho+EDA+yPPrNZEp2r2Pjm+2b2wQW4kM
	oNrJEkKcHuarGABz7Ge3g1fJCGxYdtwghM9tFhW9Ky6sN5YuYMA+F5SZgKJnRTSoM5RmyyP+HwIQP
	o1GHmGI8pG08tT0x8t8kSVFIv6a6EhpLI09KYeXDQBA3C2PUclyn38btXeJy59fhjoMK2B5/QwCgg
	kJh35VYsjP0bqZ3kAKQfg+Ks95E7BAoVjCTnCiIGp5iD9UD0/gGHUdpmEi/83CxnoVsJzkWERKk+d
	xhQAQPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Qx-0000000Auoq-3Cu2;
	Fri, 12 Jun 2026 12:56:27 +0000
Received: from mail-francecentralazon11013041.outbound.protection.outlook.com ([40.107.162.41] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Qs-0000000AulW-1tqn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1QD3xB1jW+rJ1vnlvg9nvhlS70JBe+2mKJ5mz73Kl15sE1HE67LkDQafBUTFIGeuKTr6f40pLgFGOwkgF6jtGJtiVivFtcGLakyY8jMbGzOMP3CgfVq14IfFF9T7DJALMBF17b44ERmpzBLe+70L7eMY7dHbJCG3sSTBG4RUFcg/9rUsXP20OY4RiAjp6QEglMMrptwXge8Mjv3msOXI/HDOEoAa34nRT1zbYYbY/0KXC1W8zyAT3+kt6U7cayBKB3tZRsC0Os+45rDVj76KxFEduVnWwmtCC/gcU2AFNjIpggDvzPYkNBZOpxKEAjt8FHX1d0iEJTY0t//YYUbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOb53BJ8tA6mJjofosn0Ab8naIc1d79iyYAqL8xTkMg=;
 b=ok9hpVZFTnWK0sR/0Win78Ob0RdZoz2m/uLwXsyDcK2n28yIvcy1n6XoNUmFv8Gg5NkKUYVYNxXlQpHpFo/AaobzvirzimBKOqBWEYZzPLCezK3gt7bnxf6xtOP/+n3i9rUOHYpJCu0i+2iXrXOnDpRbhAkxtSedTa6L5RuNsAsxotHv4ZjfJe85yZR8tD9YK/eZCcOyBj0qsnNc0/RBNBhiKzwnhb2iEpQDUiV0YV15hzhkXQCLdX+A1QzKis6bGlWJBWJk37TiXRahijQ8iiOfUcK7j7tUEqJwsg144HuZljxmrsIR6Mja2u+QBVzcoOFfOpjVJ8E7KOKGa1bN8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOb53BJ8tA6mJjofosn0Ab8naIc1d79iyYAqL8xTkMg=;
 b=Ys4e0+vaSmuAhj1h18o0k8fsbYBYkHDCppKv83avnnI8dvatkfxwNjZHXT88oPuX0gWxU1CFVS/33T/htkdCWPKADqLvKF2BfHGvZHkYOTGqF46tZib9Wtivv/6TzVrJuebCj5MSrDS7lgJFecU7RPiJHPj6Ienkp+/17PkK/4gmQASsgwQ0le8IlPc8kOknioQwVeDtfM+uqGwuc5R2ZlQQPV2Y6+D4g5Ou428uXpNnOxve2nV2b1c8uG1RAhhElS6Dse3rk5XgS9ON3Y5fcs3O3bzCQdrpP/DmEL8p44xolU4tmasLAB2r+YmV3Yxh2zEOn7Xjg25YFuJgc0pnsA==
Received: from AS8PR04CA0164.eurprd04.prod.outlook.com (2603:10a6:20b:331::19)
 by DU4PR10MB8322.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:566::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:56:14 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:331:cafe::88) by AS8PR04CA0164.outlook.office365.com
 (2603:10a6:20b:331::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Fri,
 12 Jun 2026 12:56:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 12:56:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 15:00:01 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 14:56:13 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 12 Jun 2026 14:56:02 +0200
Subject: [PATCH v2 1/5] arm64: dts: st: reorder ommanager node in
 stm32mp257f-ev1.dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260612-node_reordering-v2-1-f68032ca3088@foss.st.com>
References: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
In-Reply-To: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.71]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79C:EE_|DU4PR10MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e3e77a-76f6-427e-4385-08dec881fc09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: fv9o4xgY/LwdH7OdtfVgJNpMhNXnCgw2cehuTY/pBnqySz5g2d1huobox0OW3eAEr+iI+jnL5Vyx+2EAAuGDvG+lhiMU8U4Oc5VcA0vydcIyNt1IEWnckEUJzbebyPVoz3rQTnB7chpgY0y9qEYfNt40kqh+uISsDgux7AV+UDfebin0I5Q41iiH7fxQUDd4KQ8DoR8eVpjnoQyqDaHTz77DLRymgERy6K5Uw/seWZwqhidmsBNauQfW7zNmRPaiX16cmd7ke6yqnN8Yvscxju9J9r7QLH8IwcAS4+bhHUNh3/5n4kKJt+Z5pu11QZKhoiGsmNYzcbrTzRH8ErHBbeslGMOZiNNFEzDZFEyBDOPE0UieEYn7nFcA2N5K1hIrtEK9j2bGyXvHBHdbdtto+i+9oK14azj+BqJtGs90B3o2Oth8hpSAjVPIXsAEdS0Wp7JYH8ZyichGR1osB9tgXHgaLBsHBH6AkAJKr0oMoJeMAPw7Czo7iTlSJ9kSrLJqPeJdrSxDj3+gfmyP7C26+/rxFlbzmiqCymQWIFX+GCebNi345FPoVDz3dOQtuANYYUd4zPTFxgpIcH/XRX+Ftj56At7g4lwmq5pH0g1ymReQ2QCHn+bpANrgimcKdmUvG66Ewdm+i5+MWWQg6D/hQJ09JhnHJLwnaR+6SXOGvqZZOmk2FKFl91tDAf8ZFOg7zlsKYYSftfJKKmsi5PB8JoqdjyR4B2kMY1arOGFjodI=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WKtEKp/IEvv6s4L1S+Rl1ua6GNyNSDlifkETXYIguUGeZeGkvP6myl7UWtK8lHfJ70t6ILdXuK/IRF+eZGab6lE9x2faLxhm+DzbiYboZtTfu/mOPtGMIKau3lfelJ0v7u0xKP2lXextDEY6T9Zr0HTIaLsoeiNVI/HxoPQWvtDN3K1SYeq+Y0w3qcmk5Yav48/7TvVZ0vVJ+4CZM4iC1oGt8iFugky2wFJL43INv5PLzPe5+CF4r40WCTNkXIyPelKVRNfl113sLFU6VKyygzdvK9l23iQ5zc2S9Ltz3K44nljXYBhV+VJ7rk/WI4IsiZj7XfELPLKrcGQX4zzPhihJXzQjPa6fzBcJrKsZPArX9wi8Pj0DodquBOE2hj7GNmMdCLF+FyULwa367cWKtSjqPNxDDG19o+Ty8z8ao3J6NLPar0obVqXdarcEp/9K
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:56:13.7176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e3e77a-76f6-427e-4385-08dec881fc09
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_055622_495355_F9F26A3C 
X-CRM114-Status: UNSURE (   9.54  )
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

In the ST board DTS files, the &label entries must be ordered
alphanumerically.
The nodes became misordered when &ommanager and &lptimer3 were added
simultaneously. After that, &ltdc and &lvds used the &lptimers position
as a reference.

Move ommanager at the right place to avoid future misordering.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 56 +++++++++++++++---------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 14e033f365e3..f044331b8b55 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -307,34 +307,6 @@ &i2c8 {
 	/delete-property/dma-names;
 };
 
-&ommanager {
-	memory-region = <&mm_ospi1>;
-	memory-region-names = "ospi1";
-	pinctrl-0 = <&ospi_port1_clk_pins_a
-		     &ospi_port1_io03_pins_a
-		     &ospi_port1_cs0_pins_a>;
-	pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
-		     &ospi_port1_io03_sleep_pins_a
-		     &ospi_port1_cs0_sleep_pins_a>;
-	pinctrl-names = "default", "sleep";
-	status = "okay";
-
-	spi@0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		memory-region = <&mm_ospi1>;
-		status = "okay";
-
-		flash0: flash@0 {
-			compatible = "jedec,spi-nor";
-			reg = <0>;
-			spi-rx-bus-width = <4>;
-			spi-tx-bus-width = <4>;
-			spi-max-frequency = <50000000>;
-		};
-	};
-};
-
 /* use LPTIMER with tick broadcast for suspend mode */
 &lptimer3 {
 	status = "okay";
@@ -374,6 +346,34 @@ lvds_out0: endpoint {
 	};
 };
 
+&ommanager {
+	memory-region = <&mm_ospi1>;
+	memory-region-names = "ospi1";
+	pinctrl-0 = <&ospi_port1_clk_pins_a
+		     &ospi_port1_io03_pins_a
+		     &ospi_port1_cs0_pins_a>;
+	pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
+		     &ospi_port1_io03_sleep_pins_a
+		     &ospi_port1_cs0_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	spi@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		memory-region = <&mm_ospi1>;
+		status = "okay";
+
+		flash0: flash@0 {
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-rx-bus-width = <4>;
+			spi-tx-bus-width = <4>;
+			spi-max-frequency = <50000000>;
+		};
+	};
+};
+
 &pcie_ep {
 	pinctrl-names = "default", "init";
 	pinctrl-0 = <&pcie_pins_a>;

-- 
2.43.0


