Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B68CD98DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkpoZYme1igCYo7RV9Ybu+kOaKS5R0NPA6Zye4F9C2I=; b=iYy7ORdsKut2JvPdsMdINsEITe
	0En7vF71Q7YJ0iGiANc9TZ4KM/vH6NtDAhvnjcCrAsXRtCOOfL6BNqSCscM7lkbrMmadFOfn7L27i
	XPQHxinOpsxWZUjF89oMlhlJHcPnMnssHPDniKp1jIyb3ItnU5iQZTrTr0ncSdFfS+rB20MnZhLlF
	gHr838wvNyPEbCsfYbjTR9kBYNJYFvdspt4OIC+sCOEFQaOZa/bGZ6/Zavc83/M63E7azsyfHyGYV
	xsRzqu3kIPFDuNDcfZeMmynU79agqtR1Kxc9jeyCyopW38SRudjE11w4cQlZWGBFGCWLFV3Hauci1
	mmx2MPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Qy-0000000Auqp-2KuJ;
	Fri, 12 Jun 2026 12:56:28 +0000
Received: from mail-westeuropeazon11013060.outbound.protection.outlook.com ([52.101.72.60] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1Qw-0000000AunC-26vC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:56:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqwmaDOZcepvp+AxBMm21zsKQCIlK8/GUfQf3gG2lLFm4ppqsiqhRWLUerBj/bUwNpHlBN2YpVIq6ycqengP36mvUC8m7wXAYoWk3YGqeCPLzwvZs8Coj65e20eMREoTI4hGIc+3M7T9RQe9kuR5stR533fbJE5rndbSylYusrSNmrTmYH6cYCXzCbuqE/jzAcPBtS3og/PoYbV0YWL1U3NxqUM0zVxX/fkr3RIN8VsX+ZwQsTrIH0EPT9t+wASg/BJK2W4/F7fvH/+th2FUjaCx/pel6lBNopuY3mT8oB0VqAcplMvifZo3P2k2Zuw8P8Rc2YdYGxbxEb/O2837Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkpoZYme1igCYo7RV9Ybu+kOaKS5R0NPA6Zye4F9C2I=;
 b=sPz/hL0OW8RITO5y9ISaiM6YCgjK4DUeQSbhPpNF8VRncO3EgRBk8/88he433y2QNRZ+Cn1i0Irdve+EpGYWquCmy6Utp1RuIP8Ieut2rbxJg5IUH6UC3q7mu7+FAQi2vE5KK6ccTSuhfcS0sHQGoHfIYv7LoGn4iJIbbqE+xC2y6M6w05WllEcSWpcqg1xYB58Ze/NdpBn5Hj6ocQgJpm5qj3Fz2OvbP3MMmotFuUv2gmapys1OYRkUiD+DtK7qkgHYV5orqM3Hci8Oy35xjGl/rMbpseQr5gypcGB+klPu+iztbzHR72WmmO40Gfw2ocOaOouoOh5ybsUzRMASpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkpoZYme1igCYo7RV9Ybu+kOaKS5R0NPA6Zye4F9C2I=;
 b=LhM333uaRZYdrZ5EUI+mIqekUOUdJDsqIAFwtbnO7itki5TnmIm23xhn2OSx7kVjkbDYGsV+FhNoLM0iOkN1iAnrjx0XDXxHNwkpd0hbANmuOJLbU/1UhAYyi80zmN+/yqNzWCpdX/2Zt5cbCqkzDw+6CqClAn0TaIiA6PegCGrR3w8IRzcqtER47hupnJeG1jLFJnc4DdQfo33u/hX/NjEhOFqjpAA8HFWcrXXaDj7dKi+JgGwd9GvF9JxENWXwzszWNmsm/Zk6n9pkyTLpuxSFauIV+8s7vEXWIBHvZ3lNlLZi77iA6xoCDtlAddhpjoylABteVTy69MVibSNQyA==
Received: from AS9PR05CA0356.eurprd05.prod.outlook.com (2603:10a6:20b:490::22)
 by GV2PR10MB6307.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:7b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Fri, 12 Jun
 2026 12:56:16 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::54) by AS9PR05CA0356.outlook.office365.com
 (2603:10a6:20b:490::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Fri,
 12 Jun 2026 12:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 12:56:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 15:00:04 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 14:56:15 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 12 Jun 2026 14:56:06 +0200
Subject: [PATCH v2 5/5] ARM: dts: stm32: reorder mdma1 node in
 stm32mp15*-scmi.dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260612-node_reordering-v2-5-f68032ca3088@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|GV2PR10MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa0c9a7-d781-4e1c-63df-08dec881fda3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: zpK8NRwMdJe55qImf/F9lxGHrVbw9g83MPraMpDMaMRjt8rZ9BQ39TEsyoLJ+lzlrJl3zKqcgpOeSGGG+NRDGMgwt+YsJaRSLJXTa+A9uBp6cuCLn46d7ANmg82dBx6zLlGBEKbKnP6tXcY1890tT2KsXWxCfb2RomCgA7ZQVVdWYZ85bDY4WOQ4axTE/9KtsgZIU0Gz+rtPZrPbxRhUUBgHvuVGoL7HA50mv7gWNZw82zsHF3hzOWTiAfRKd8ZA7edWLDOnGka3e2W30lxX0G9nV9upFee8qeTqEBsKQVUJe7KZ6MLjg/Yp9PiQn0VMUIFTDhsmKdIXqaxF/g39QJWj+o4QHWubz2i0fAUb4SsvKd/5DqLThSj/exm5cR3Pyi+0NWqYJRvrHS3bSMhlbK1Fh7L8XEfREMjWifKPWleQANRiWyxHfPSQRKpY/GSjND2Jlm2BkBbqkVZS0nuvo9HB2GEvobCcgwpK2HNU+hpB/deun/maA4dB5B9JyRpv3WQah56FccAbJiwkBM/x0deGdDyARUFW8m29q/ZSoWYkrAHoWO3El2rqhl73rfmeT9Sk8wBe5nLXuRd3ZJzc547e6R2dTjbIfXsl3gBr8+LpfgdfiPPCrAzSLh4NUAXdazHLdx+r/6f83nG1Ok8xU0/bKpjT+f1EwylZKaKXaukcEhWPglrsCWE0krsOphZ3oUnBiOvm+7KAiBhgFzrrRLIscqzlWrUMt3dqpnwtJds=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nEPhhNuoxjoN/5OWkMVWuvPC8jDoTrYdsRasIhVLXDFNz8hOswmZjCf2wYZ2JKALug0tqKiMUuW8yMpoQBpJE21RnA3JusOK32XoXaF69gA43JgTl78s5G1M7D+/ra9Gzz5eKBfk4t7olE7c1Ita9ETfOTR8WIDx5vpOKWHUBotUXyD4eqYqgMe81qoXccMMVau0VyPlKep84DH7OQMDCvYDEeOglGw14eV2s6DZCKDvITrHjnbgxBgAzMmnKMruxAxqLd7vVbkPt7e/NmWw7CZlD1g0IPqp0G6OdIX0yhuygF1As8lCnWcGSFQA5Ar+yUolp1nrxl0eCfahgLLL9LauouLLGiY5i26n1HGQNQFTp2wrzxvmIQIh5a9PFnZ4ytmFu7wgdFUz8Kx999hMlgjBFdxtxldeq0zNLmk0KYAMb7Fn/6hhfoYQtaBgUmAb
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:56:16.4018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa0c9a7-d781-4e1c-63df-08dec881fda3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_055626_540866_E7EE53F4 
X-CRM114-Status: UNSURE (   7.91  )
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
The nodes became misordered when mlahb was replaced by m4_rproc.

Move mdma1 to the right place to avoid future misordering.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 8 ++++----
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts | 8 ++++----
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 8 ++++----
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 8 ++++----
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
index 847b360f02fc..53e40e2f776b 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
@@ -51,10 +51,6 @@ &iwdg2 {
 	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
 };
 
-&mdma1 {
-	resets = <&scmi_reset RST_SCMI_MDMA>;
-};
-
 &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
@@ -62,6 +58,10 @@ &m4_rproc {
 	reset-names = "mcu_rst", "hold_boot";
 };
 
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
index 43280289759d..0790ed426ebc 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
@@ -57,10 +57,6 @@ &iwdg2 {
 	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
 };
 
-&mdma1 {
-	resets = <&scmi_reset RST_SCMI_MDMA>;
-};
-
 &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
@@ -68,6 +64,10 @@ &m4_rproc {
 	reset-names = "mcu_rst", "hold_boot";
 };
 
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
index 6f27d794d270..0a3894aff4ae 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
@@ -56,10 +56,6 @@ &iwdg2 {
 	clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
 };
 
-&mdma1 {
-	resets = <&scmi_reset RST_SCMI_MDMA>;
-};
-
 &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
@@ -67,6 +63,10 @@ &m4_rproc {
 	reset-names = "mcu_rst", "hold_boot";
 };
 
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
index 6ae391bffee5..c2b6efb1cbb7 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
@@ -61,10 +61,6 @@ &m_can1 {
 	clocks = <&scmi_clk CK_SCMI_HSE>, <&rcc FDCAN_K>;
 };
 
-&mdma1 {
-	resets = <&scmi_reset RST_SCMI_MDMA>;
-};
-
 &m4_rproc {
 	/delete-property/ st,syscfg-holdboot;
 	resets = <&scmi_reset RST_SCMI_MCU>,
@@ -72,6 +68,10 @@ &m4_rproc {
 	reset-names = "mcu_rst", "hold_boot";
 };
 
+&mdma1 {
+	resets = <&scmi_reset RST_SCMI_MDMA>;
+};
+
 &optee {
 	interrupt-parent = <&intc>;
 	interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;

-- 
2.43.0


