Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D65C4453D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9lMxPqsWczlOjrSFqpMmnF3maztYZ0qMAsBB2EJCCk=; b=Ql8W2kkofhzGLPWROzqpdoCZh1
	qDwIsuoiWNARbgMPcrYDKg2KWKmGfOJ+ORoY+msIcw5calKf7f7Yet2V0giokPf2eMISmSJ+IpOse
	1EeMbHL99RMd+HtojcVwmtMkKSOPvfvi5IArnBfJJ7dPkky1wnGIykL57X/H8pvJnVgrezr2EyfXu
	5EREheunz4TQALVJhaIefTXPjVZzGijlK4iS9YAqcke0+CygCJ7gsRXz0gYDkaqdTSAI0zdNhkhIg
	gOMrULbJyMaUl93Y2cIW/Vn0txAtVcNrvLUAp2Xv64hGT29YQoxGCPntd+m91q9guAjjB1jZvjUIY
	W2KW/AJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT4E-0000000BMzn-409J;
	Wed, 22 Jul 2026 09:16:42 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT47-0000000BMvf-3s9h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:16:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zU/2ifcCL0O+/VxrvohFjcA0ZHDBj8Hp7KFydjRq644PRicFAoVa2m3RxAYRPAt9J5nVUxNqfr+e2HJjUuPS8H2BGnmXC+gqscdahDeTjP7kshDQMdltn95jO7QSIR2TfHASVUecmB7JUNFBb9EpXcCNUHLNQ/gtb/ATNyHSUt/33dSbWLBIF8SoKx6XY28fX3oWKH7NlGLn+B2m8BKcV76u6/UBQlY7ixnfR6633JOmU0SNf1ChGqk3kFjYODIo7k+IM2ojuQibTcdG2S6kkQ0dC3GmZCLSqhm3IDZFxeed+EnXiCgFs/aHU9ea+B+opbtbVxh4Qi5vZqeKOXPlTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9lMxPqsWczlOjrSFqpMmnF3maztYZ0qMAsBB2EJCCk=;
 b=gTCMbmmej9kKolgZiPxcLhpql24AFZ+B6lgMDso8mlEXRy/7E4alNYwiideW5daPua0dGsOI90Y6Zhbs8CSkURsBIEZYu4BZ7mTBsR2J3uesaGNCGcClQaAYUSWUsEF6+Ap6Un5YwZiNvMy5ujmA366MceWsMhYxvLnRx56dnIHWXA7s0L9uslZSXPuqkGjDQtPHtm5vY/5yZbD5YjFPo+6lQ8htLyse2YXakaCPnsY1gWDSlGBr9LUku6+WrpQcnC311uJpoWQePwGkUj7rDr5rPVGRLJXCcIK7luH5AUm/AXcCBsLD+jslSfrkTx0YYBR31sUFZG3UAiJVeF6JMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9lMxPqsWczlOjrSFqpMmnF3maztYZ0qMAsBB2EJCCk=;
 b=jnL+thz7pon2fOUnuqRfg4eb7Fj0xVxj9E45st06rLYYjA5oW5gT8lcAgATNK0YbzvitPDsqZPDkb/st7UFmnd4JU5t0Uh3grZ2UxTjvPRyHaoHbG5nkMyqSpnMo+ZJ/I/R8xLuC7kAnF02x4QDQf0ctc4VtJLVrELjsEBFvmkj1uW8WtscOrobwEd9FcztOKrur6O46k0MMGLf36QlKEJ4QCRpUS5j9RXsfLl3uSoo5YQg0NYd3COJH2Kux6swniwj6dzSFg19KU1HE8S540iANyBQVkzVxqPysI2HCpdcmhwsH1+3M0UztOLRI9Fq7MAA6bzvqCHumdpiHVvLPdg==
Received: from DUZPR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::13) by AS8PR10MB7253.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:61a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 09:16:30 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::41) by DUZPR01CA0086.outlook.office365.com
 (2603:10a6:10:46a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 09:16:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 09:16:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:21:42 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:16:29 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 22 Jul 2026 11:16:15 +0200
Subject: [PATCH 5/6] ARM: dts: stm32: add sram pool to spi4 for DMA-MDMA
 chaining on MP15 DK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260722-spi_arm_stm32_dt-v1-5-6ef611523232@foss.st.com>
References: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
In-Reply-To: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<clegoffic@baylibre.com>, Alain Volmat <alain.volmat@foss.st.com>,
	=?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.130.77.105]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0F:EE_|AS8PR10MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: b1062ddc-8871-46a0-34d1-08dee7d1eabb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 0E3HoT6XCnT1/WazyxwTQhrz9zEXZxfKZmhKagt4QIW5KvZ67XH/n12fbRnb/el1O1EAsqN0d2LP6ZH+TQmzoe9dfI539uuXelU2SGpmn9vdibz22vjxRveM+D5+Op5Gi669sy/Dr4UuDuvO/RmoFD4T8heXIGfqwkxItVeCzBnEMQt8Ewgzra3j+mCe6D5kcPr+vGR9D6vVFP4q8PjjAz66f+gwzH39D8JQiaqZ29oQ4M9864QAxGSUg63zJWSEDz23/B9dXrMHAVOUDQcprcsiCrKLvkYVFWQ+mncXFtDFYRf1MCurXAPuJDJJzNEZUywAz+wLAUCWZNHhJIXA+ICSQmjcv88eQAGGgXQY+XBpy2VQ3ZBeppqm19Bxles168d+j/n2uiKlIKwN+JkZOs4ZPZk6iZ9S3tTcPAA7yeGy9A5y07KWubzHG+vOFpRZHnGcB4Z2jc75HdvYLf88eaithRGsiuQImmGm1E6fZPrYrpx54AYdTFHsQweXTrlbxuZ/ZEGlbI0peKJBR0lXyzxMM6EHKSxIcK/dQTMSJ24oonBTvoZEd03WvwXCEjtBewRvWn6l7hmMyIr3vjR8/EcUGedMqViG83XAq9KooJl72qBrghLmknt8vN7lIj1bHaZ8ZDE1qlPDQySpQbZYcrQiBfaW1WcIf6h0CGioq+3cQpmfPb1BW7WebTeQQi0hWwXkAGDULhJ9rrByJIqHWQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fVBkUGoukNizIlM53HRTeV8y2SuoeLHel0sePh4bvMNjURdQ36g140z7K6V1B+r4CwP4kj1YFMNIJSouTvcR4ixgoXVh6Uag3MeEbkhFVkO+C9Nmc4ixKYNpvYUKfl0Virn8S9DFyOUun4cPmpB3WlBnKrt8mY1zZSB/zAmmmgBAc9B2+XAJ4rsGdfzF/cyhh+fthZUXK+fNvqoMwU2R2npewk3/YJVDhP4dSGWDvVt4WOGv5Q9CQdVWDoJhjVV05IfUgXc6l3KlD9nqxq8pjtts1/htEklJWGTj5RgTh542tc+mgRhdzwS/EAnv9KA5KakQNLYSWGP2hrr1eyyOiR37Yl/gtEvGombuVp3iCMk5m/EnAtrFtnBu+2LyA3C+T0RM+2puvuT6Rj9/zFabTsTlcYd7MX64wkGg2X/dWYRVsBvqqbX6A9W6dmei1u94
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:16:30.4380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1062ddc-8871-46a0-34d1-08dee7d1eabb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7253
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_021635_961883_18979323 
X-CRM114-Status: UNSURE (   9.39  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

The sram pool is used as a buffer area during a spi transfer using
DMA-MDMA chaining.
The pool size depends on the SPI framework that creates sg up to
4096 bytes.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 681e9b1106025..580f7da7f63f2 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -627,6 +627,11 @@ &spi4 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi4_pins_b>;
 	pinctrl-1 = <&spi4_sleep_pins_b>;
+	dmas = <&dmamux1 83 0x400 0x01>,
+	       <&dmamux1 84 0x400 0x01>,
+	       <&mdma1 0 0x3 0x1200000a 0 0>;
+	dma-names = "rx", "tx", "rxm2m";
+	sram = <&spi4_dma_pool>;
 	status = "disabled";
 };
 
@@ -637,6 +642,13 @@ &spi5 {
 	status = "disabled";
 };
 
+&sram4 {
+	spi4_dma_pool: dma-sram@9000 {
+		reg = <0x9000 0x1000>;
+		pool;
+	};
+};
+
 &timers1 {
 	/* spare dmas for other usage */
 	/delete-property/dmas;

-- 
2.34.1


