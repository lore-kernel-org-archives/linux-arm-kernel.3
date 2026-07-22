Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC940C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9FG5wwCSPiRMGZ+BOGgAn++CUJqR2yDxXL4l0SkIuo=; b=nsIOa5z93PDS5JOQ0g4kOyCt83
	RiivdtHiIpooGQabKJG9JIdaYH0UtDgK5a+lfXWw7rSmH34cEqtPkFUb+WVN2vuiTSpnQFpUOl6IW
	kLnHMl4LE1NtNihCNzAOwCni5d9jcnsIT69zRT/pcCMR+hmV3/34Dz6eNNTiirmpShIgj9EiNtk2s
	PwAd51usNzcLIbEVqkynIUSN460+6ztU5zBkxGHcf7LFWezN+jg7/lmeV5BR01d+oDcXpzUTfyf70
	/oxBokeRoe3w9fsnQW49IJ/r4SBebhTyTKBcJeM6r3XSI7qRr0Trcpj2fO1Y6RHbwxmwy5rB7vs+H
	NX/Q0umw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT48-0000000BMx1-2IVn;
	Wed, 22 Jul 2026 09:16:36 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT46-0000000BMvH-48QI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:16:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZuSzNK1UVTK6rnLRO5sj5RRMoy1bTpdTaH7dPlvwYhWxyROU2TA7h4yv5qDgHLFyY+mFR6CN86QZEgDopcyfX5B9f5lrZ2BYNkKSEZy6qiUDG/Sr3aC2eNdE9UDSaaHuZAiUhFQqI8q9ZKXzCuX8n4C+lFWhw9SFvz7XmRe0WpxtQkBjjfu2mRBmCIzNPbRQOgdJOIWqD8G5aIM9jUKvnSM7/8fI2Or2TDgMscPLy0PSBWDkE11cqEve8zwfK8mFVKIeMiqEo7RefACPvvFy7nD2373/BfQAG9ZaRfteu37d9pVNYPFgvj47pnkozNRa525IDFE+vbgLw2/250UTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9FG5wwCSPiRMGZ+BOGgAn++CUJqR2yDxXL4l0SkIuo=;
 b=kRRhtNQ1O331NPdbQP0smghnG8rE2dHaUPjrMHayoSin6NR0T+2bDbeCi62MVYLtTESvyMdFd609AOBoiA6ET73Z1URBMrku25cRpRRRI4USEk+cClt/d6xqMD+f1AriwClJ6f6u5stmzVn4PQvqeYegDltcgr+PeQvfi+hVWj/ZAsslqLwTuIzPMZNMB41AyaNavWUpmUpU/fVQ7sfffhc7YoWS2FSu5Q16s5zfKe0SbWGFkwj+wZCWGm3GgUf9PksogK6TMo1gOeUfdo7PshkaPCDerHHB9ZqK/2UXbkcnHeu/DrReW2g0zdGW5z1XagDaNcAaNUPNdZpnHpx/Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9FG5wwCSPiRMGZ+BOGgAn++CUJqR2yDxXL4l0SkIuo=;
 b=Ef+8pGr7JLCxRGN8xu+um8FDsnfmidNFUHbWrvg7IldAOqUQjSIIQIeg2tlzCOYtdruvKcV1hmxOXuGFld5BoiMp3a3xvHitqKorrkPYOZUK++ZBdVPExIPSGYtTE72Q+MOGeufzunReulbM3BZd5g7CW+EsczcdEGAzpWnN61+2MUBBl6Eg5bvM2nd0uBSiWWklX2puHCFW4pXVubo6fF5exsKKILF4EJEv8qmDyO0UvF4tUNocbTTfWICv3hZKWOFYUKG+PIX9bY0qaC+l654V9Hoak6T9BDMxPW0V1jejsc7wk38wIt4ZekSxCDV2m0y5IFCGvRn/WlQZdayCQw==
Received: from DU7P194CA0021.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::27)
 by AM0PR10MB3523.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:16:27 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::15) by DU7P194CA0021.outlook.office365.com
 (2603:10a6:10:553::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 09:16:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 09:16:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:21:39 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:16:26 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 22 Jul 2026 11:16:11 +0200
Subject: [PATCH 1/6] ARM: dts: stm32: add sram[123] nodes on stm32mp131
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260722-spi_arm_stm32_dt-v1-1-6ef611523232@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0D:EE_|AM0PR10MB3523:EE_
X-MS-Office365-Filtering-Correlation-Id: 22496531-948e-48fe-a660-08dee7d1e8c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /5+WV1s/GPBtAFOmPUfdmy8DZJaDhZDKkRf57UucRpn7GUCOQRe+I4gVALVngVaD06syayBIdxmoKKDAhXLwImDzAGR29qL/UNj6+BySvAd0AxrMZwtDzM/ImAdinRdKFEDH9nrUEvkQutgl+KngiD0NfdkXRqD9oGZ7zqIxQDhQqSiK0P9MQoX+rf/IRSAK9Q2RfiuVlB7grTjV2e7IG1hLIoTMz2/rrWW9cJ6Hy9Wr2gyAZKqDEqrR06rD7al9oBYIrz45TbHNcl4lKKmHYDeOVG35WuodBCrziEtjSbN2mrE79H/rrFWMhQab/NyEfJyizqV53XBhg8mryZ3UCpCzSTHZljgAYeIsTabOXfFoSMq8GAPM63bbOwEGRL9V9K3nNtVLpE4vfD5NAjOaKhkuw2colIiWgsZdC32zYPE0ffqTafUXkQqVqWi364Rl0o1/Mzhjs4wjO4sPzxMuxbaoF+bjJmkHNmNdUwNvIq+JbM4u/z/nEiLL073GiWoGQI3qfSdG9GSS+t3wc1BlgM71VnXnBjUiWLn/kz1ZC2HoZuyxIM/1j4GPFQ7ml7/OB0shgf/FyIuPhJYsHXl6ojdNTwxFVN9SkAAvLYE2DsEcG2sIkDbG4kmHK2q8m/fuMCkeTUi2fo4sqt6ufEXgYlPAzqTm5EtxZbt4KR73Tzx39YZEN3aiFchhXyxVasYnmP3++7URrgr4c0fLUrJOQw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KAV+TSb0AATTMueYOBTUGZCdBEvt5yiOnTsPIh4EPkmGfUiDoA83sfkugkL7BPlizXXQngasYHFunPgFXnaQphDRm7OBImu6+KWcVfT0SOrdnXV4Bn0P9B+R5gTRPSIcCKJIBFVg+HD/QjtjPzbQPY2/Cw7Mjcv0gbjgg6MyLMbfb2VA3PklNt1XzCQHupufyZsag3RV46W4uUmpFKyRuhTjn0kOhG4nLe8JUspKPE8xHXqWVbiqiDm+9nNxQegFYFZ+P7ukx2hAGqEV46k7RN4yI8bpVTyZCQronI7K6/5zlg2NymfaWKtWd2s5GRWxe+ZXrp/x2fAnO6izMgTYIX/6HZjaAxcbmO5XjQbg8/wKzbazH4CneFyRVBHA+ugkmnDuMwTJkPl97nQ/sPzckjlJcgfejbIrPNSF1VNOtvNDG0EqpFfbx3NS3r76GPMD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:16:27.1631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22496531-948e-48fe-a660-08dee7d1e8c7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3523
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_021635_056285_D2C926BE 
X-CRM114-Status: UNSURE (   7.94  )
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

Add SRAM nodes with "mmio-sram" compatible in STM32MP131 SoC device
tree.
Those nodes describe the SRAM memory area (SRAM1 16kB, SRAM2 8kB, SRAM3
8kB).

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 83ae59b73dd09..5ae33b26e313f 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -139,6 +139,30 @@ soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
+		sram1: sram@30000000 {
+			compatible = "mmio-sram";
+			reg = <0x30000000 0x4000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x30000000 0x4000>;
+		};
+
+		sram2: sram@30004000 {
+			compatible = "mmio-sram";
+			reg = <0x30004000 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x30004000 0x2000>;
+		};
+
+		sram3: sram@30006000 {
+			compatible = "mmio-sram";
+			reg = <0x30006000 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x30006000 0x2000>;
+		};
+
 		timers2: timer@40000000 {
 			#address-cells = <1>;
 			#size-cells = <0>;

-- 
2.34.1


