Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEEFF01814
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=py/o6k0kY+IUYpIWRpIGTq1SpEeerbRk4nqi6/sW3IM=; b=wC68aqrZjUaZZ1HvYEnG0cW9ZZ
	NnGBgnC9Ef8uVZBpzvWOLhke8R/N8eQMmVCAugBRMdHlTYJXdky8Vb2sLb27KytyOQcyIbkYh8K+r
	kmQyOVb0VAuJhd/BscXQn7pWHoocclcM2tT9+MTXWQipE3CGdvecX1zt37CZiv20w+tdtkdy/w69D
	HbdK21yV4Yw7iEIazUY0WkJB5MQ29Y/jElIbcaxBvcBWnEvggxYgOBn1jU/w28OdRcOTB8k1tKqX/
	yJ1cOfLboEmKP4vZxZIuCyRwqRL2qT3Pqs/ckcBCTHpqgzwSB76LeYdlc7C/qWcvhxxXhH68gJ5Hq
	8DXEj5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyR9O-00000003JyA-0Ni7;
	Fri, 06 Mar 2026 09:07:14 +0000
Received: from mail-japanwestazon11022112.outbound.protection.outlook.com ([40.107.75.112] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyR9I-00000003Jwe-3pur
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 09:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fazaYfxLBaedJjwsIsL3vOzGedOP+a6M4/sqvQO1+Q0oWcKYf2Erwx6xyOzTeJWmN8rIzF2ZcL2wnBUm0f6NOm7RXMnpwyTiSmiFFkyWe9FoeaKNSUoh9IEfFq4imsVqqZ+25keH62D2hvgeMwqPLi+VANsnZuC3usQPjwnwM/Ohr7q3np5pOFhiIi5zp4AJ9s7hnPlGcH16A43UxDBHRwXW1c7rawrciPyGmg/cbf/PahpRhZWIB1+ztsbZoGpYLVyeNDVoZRXLANDT/lU+P+mkV9WN7PmrKgsxzlmRbW7tj7sDryzT0/N3u4yl+UqFLSaHuJbGlQx/mpskB3qlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py/o6k0kY+IUYpIWRpIGTq1SpEeerbRk4nqi6/sW3IM=;
 b=O4oi53CZ7JKGIXwmruoXMk4y81Ez2tsGr3I8nlaaNNwVx5/pyY8I3FypJjz1waoEGo8JjCXbP2kFdVy5/0dDMl/b11L+5q13LLAu5A9CC6s93JrE980/iGvJoAcl0GC40kLoUoEgUUMrpfFntK+Wq7PjmFwMds7dn/yI4eXh8z1vmAY6A5rEmV39yLDppRz7pV4ggdin7vGMbvc0S2oRW6hxsp43RqDTqI+4Hmg5gisPyedXTg0CIcX3CCdE7tmkTh6bu6i/ngT7qUYufFg9yMw2A/tfAodcxxW/o/bVPJEln6REBck0DJrIbTCuXa25DHAFypEWw05XtH6Ou2vEXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13) by
 TYZPR06MB6769.apcprd06.prod.outlook.com (2603:1096:400:453::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 09:07:01 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:b8:cafe::a8) by SGXP274CA0001.outlook.office365.com
 (2603:1096:4:b8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 09:07:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 09:07:00 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 87B7F40A5A01;
	Fri,  6 Mar 2026 17:06:59 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH] arm64: dts: cix: Add scmi powerdomain nodes for sky1
Date: Fri,  6 Mar 2026 17:06:59 +0800
Message-ID: <20260306090659.990527-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|TYZPR06MB6769:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ef5f505d-aec5-448e-51c4-08de7b5fba3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016;
X-Microsoft-Antispam-Message-Info: RgRtSMV8f5VyUdNcxaSwwz3fQOXWVmVcNsX7otJJjEINF8NVmV8eTLMv6J9cipvIYgJZbwcaLgW5y2ThPsmDh5x/6OWvExFnunI1tkYk4POgrWGZJaiyObrIzRcPOiTVwg+VjG70NeX8naaffVkkv54gWbAajafiMJtaFP4SXKEHdYBgpiFc0nHah8pkJvjShKJzlW+VhKP9RF5L66nyKFHE+bNZ8ahfas+7/d8csQIVWyIsgcfcTOSHwPUG9lqSOTgOMo3K7dFeWgPpOl1z/jxRWq3h/hd3t3jknmtUeV3I+RYari8wIYh78t3hdtHFObk5ZA4mtrgBoSTLaBIAjlLB6aVJaRV3r9+afVG4gDmsHBwpOlft1Iqh7aqa2BM/MEwdVCt+6Rx67hCbdP9T0o9aIdKRwUX9YXJiMB/z9eAv7x7zutkDucbT23KQGn0Ol+L1JX0eL0spiKf//MncMuFeQPMw0/5Gv3a68JDaNWf+53nu3cdf3RZ8YuYJ9mGFkaEGdRuwYlflFmAEZKpWTSFuU6m8EpqQH1g3GmnhyJiWommDg9SRUiBHbsRY/2j7K/+GsP9Y1/A/mwKAd54iTyL6/BUzSst82cCrj5InZ4od3dKiMrMW7pW3/6Td6eeci4Nc7EtyV+Evt7DcbVtRUXdJn1UgENUBi8S1t5XAUponc+V0KSYHJ2t+TdVi9Nd3CwomqiX6lgRSosZ+JbelDgvPQ+S92mRttC1DHxI2OeXD9FDsm1vMLnkxF54rlSj0Thb/P41Sn3bv3DNn+VePcg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: T/vFtJRM0h2ZmgQPfGiKdz7GjBXChbrNLGQ/2140vGniTNk5fMyiNdyHu3O6JdaCn4osVcEhznaHqVBaKIIqVSYBLjhkFqqC9jtq5VZydr+xgGYWGEohT2YJXq5OJzu0ZgbVHJcx+sS4tHpxjSfjiaazBfzt8Eg9OzouoDyKxQUS0pg1q+FU1I+MohH5qId+00xRV4VlE1hxcIz9Jk1oNBVJqTx0PZS9a0sTBchFRr+ZksTEy3fnW5oFTy7tcenCjwbbAVdgHgHDZsdwnlYGWGsCUzrrYupI8XA+/zsWHuoiyovKqnJA+sKTzGNGud+MlbDSPPRBjXUDfCsZtf7elLZrDNF4lWKEBZ/yjYkKB4yw3XD/DoR6pi+EcnOTe2BuUjpeU8sTA/iAeSru2CFM2cMIIqff28HajtOcL51OYq8GxIydysk+X1sjNuz3E7l0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:07:00.8079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5f505d-aec5-448e-51c4-08de7b5fba3e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6769
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_010708_955682_97BE1C45 
X-CRM114-Status: GOOD (  11.97  )
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

Add a second SCMI channel using SMC transport to communicate with TF-A
for power domain management on the Sky1 SoC.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-power.h | 34 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi    | 19 ++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-power.h

diff --git a/arch/arm64/boot/dts/cix/sky1-power.h b/arch/arm64/boot/dts/cix/sky1-power.h
new file mode 100644
index 000000000000..743c0e5558ee
--- /dev/null
+++ b/arch/arm64/boot/dts/cix/sky1-power.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2026 Cix Technology Group Co., Ltd.
+ */
+
+#ifndef __SKY1_POWER_H__
+#define __SKY1_POWER_H__
+
+/* The Rich OS need flow the macro */
+#define SKY1_PD_AUDIO		0
+#define SKY1_PD_PCIE_CTRL0	1
+#define SKY1_PD_PCIE_DUMMY	2
+#define SKY1_PD_PCIEHUB		3
+#define SKY1_PD_MMHUB		4
+#define SKY1_PD_MMHUB_SMMU	5
+#define SKY1_PD_DPU0		6
+#define SKY1_PD_DPU1		7
+#define SKY1_PD_DPU2		8
+#define SKY1_PD_DPU3		9
+#define SKY1_PD_DPU4		10
+#define SKY1_PD_VPU_TOP		11
+#define SKY1_PD_VPU_CORE0	12
+#define SKY1_PD_VPU_CORE1	13
+#define SKY1_PD_VPU_CORE2	14
+#define SKY1_PD_VPU_CORE3	15
+#define SKY1_PD_NPU_CORE0	16
+#define SKY1_PD_NPU_CORE1	17
+#define SKY1_PD_NPU_CORE2	18
+#define SKY1_PD_NPU_TOP		19
+#define SKY1_PD_ISP0		20
+#define SKY1_PD_GPU		21
+#define SKY1_PD_MAX		22
+
+#endif
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 64b76905cbff..d37ab16ad9b6 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -168,6 +168,19 @@ scmi_clk: protocol@14 {
 				#clock-cells = <1>;
 			};
 		};
+
+		ap_to_tfa_scmi: scmi-1 {
+			compatible = "arm,scmi-smc";
+			arm,smc-id = <0xc2000001>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			shmem = <&ap_tfa_scmi_mem>;
+
+			smc_devpd: protocol@11 {
+				reg = <0x11>;
+				#power-domain-cells = <1>;
+			};
+		};
 	};
 
 	pmu-a520 {
@@ -572,6 +585,12 @@ iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-pinctrl-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
 		};
+
+		ap_tfa_scmi_mem: shmem@84380000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x84380000 0x0 0x80>;
+			reg-io-width = <4>;
+		};
 	};
 
 	timer {
-- 
2.49.0


