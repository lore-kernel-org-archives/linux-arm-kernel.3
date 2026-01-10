Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A72BD277D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJlTUhb/5UepKBoao7XHkzdJ0DZEnFzCirMi4DD3x9E=; b=f0dnnhfPG0pG6283HpwnvOhaGu
	bHKX6zuezgDfX4C2I5K+aWX0G8PQGwLwh3+55wTtbZlmG2z+ivtLGUwS3r9a3QDfYXic98yu/mmey
	2qJEi9a8l9xg/SQkGkhsCZ0+DdgrBxVXlE1MvIYj3+2znzVIb5EjcmFEamyFxAeRm0y8YHBxJ9BGg
	ie2VYp9VaVNddsJZFlfaCbSiWWDbK1UB3CwQmylqCMrMzQRUcZwFOOtXUoL+TmmzJPQpz+QEocu6q
	hkYZataONr3UutEXYgV6Gvxph7JKMEr2cA4L3CoeoQSrcpNdJ3jeERlvSNs0ju3i/e8sI/pxjf0zr
	6Ui/2mhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veVMV-00000003Mum-2cY4;
	Sat, 10 Jan 2026 09:34:24 +0000
Received: from mail-japanwestazon11022098.outbound.protection.outlook.com ([40.107.75.98] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veVMP-00000003MrG-3PYH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 09:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2wDlVKzEUJSx/zqfim9lkZHB3ge9PiKoG9Zks589IQhezp4EZkjIK+3n7JiSiIrLqmy8FtPsobPh5Dj7Ca0/vUgqF6Fty9/OdWfAZW0UByY653+nY173ImuVjLf/9XC7in8hC4CdCs/KkjJXJVdoqWWxWjmRJN6/vPPRxUaUNxqyLohl3AYVuz0SvKNbKJsIQruoAgKh3yCfaIb379VghHrplvLmIagvqxT8outwkM4b7TEjAydxZNcBABJ8dx5NrMiro9dFigbOJNYPq+5kOkl945LfhjJytwA/IOZKlRlDN7++PYqh7pRdWs0QTKkfNIVPXqReOq57Jh2YHrMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJlTUhb/5UepKBoao7XHkzdJ0DZEnFzCirMi4DD3x9E=;
 b=JYSYj+31b7yLuHxZgAuB2rcAyMT0uvANValhKVUBa2KrX/unL55e/LBETn3l9DSu/UKR2u5tdQKQWMcGYK7iSFzkjYmsub78h+ltSt8OqYjVgmZknfll94qnnub7kdugHKetjYvgTPk2ConBTZ85/EhvuZjJsbZpvWWu4ykfYH9Gxdlknwe8Z3v98EWZoYVNjY34bsvH46L7t2QCTSUxDqoov/3z6eXp10CUQNVrclze4NE4aRGLIXthXcYQDPiobk0zLeEoVLo8c5+XGemKGm/9GpA0bAd/97lXOxpVwVg09rAa+I1IV6AHimi9eeOvpXk2yesCBCjVK+tP27d+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OSTP286CA0085.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:227::7)
 by SEYPR06MB6929.apcprd06.prod.outlook.com (2603:1096:101:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Sat, 10 Jan
 2026 09:34:09 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:604:227:cafe::5e) by OSTP286CA0085.outlook.office365.com
 (2603:1096:604:227::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.6 via Frontend Transport; Sat,
 10 Jan 2026 09:34:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Sat, 10 Jan 2026 09:34:08 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A8D8740F0506;
	Sat, 10 Jan 2026 17:34:06 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v4 2/2] arm64: dts: cix: Add OrangePi 6 Plus board support
Date: Sat, 10 Jan 2026 17:34:06 +0800
Message-ID: <20260110093406.2700505-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260110093406.2700505-1-gary.yang@cixtech.com>
References: <20260110093406.2700505-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|SEYPR06MB6929:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 11ad1789-e666-4783-0ee2-08de502b6797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Euk+SRUZZT4rWO3DXfPGDYhlfnV6uMhauqmfV6g5JthQt1v15v/B2x79HYny?=
 =?us-ascii?Q?LR++CG8Wdhnn7SiPGWRrLF/LMegT/aHBiBzr8FpL2sDGpEouNqWt3efLxkMu?=
 =?us-ascii?Q?XZoUCVfAJUE9GFtUwfze/LsS6zMNdLCnuI3Cml5EeQXZ9NlfWXDWfPRT8/9y?=
 =?us-ascii?Q?p47FR/o70kJ8TesPhfwAECqSt7UjOS5d048DtPaMPRcsST9S41Gvq7sgpEkg?=
 =?us-ascii?Q?VUlDEHTiXmiABVXPJx3MVKJ+VYq/lkqNG2PQujvuKrhAtUyIKztxYb59+Psr?=
 =?us-ascii?Q?p5XX4iZRAk69CjhYRwHjJAtjoX+jbNMrWYGCe7ENNjUabzQrbsSQw2QUCflz?=
 =?us-ascii?Q?JMrAnXMPWcFUVroD1qMoSh8nRct+6YomLIA8tpRvFb56VzpUoyzhSa5sQilx?=
 =?us-ascii?Q?+IV0baftwapYYH5RaswNzF44sMoGSlAN9mAjowMljHucteOrIv7NRPbM0aXE?=
 =?us-ascii?Q?Xchw3Att9ik5raV4gc7FikugSTBUipG8YCA1HeGOBP02HfBiIcAW37eOqZc3?=
 =?us-ascii?Q?0goGSgi19lxDlsiYIwaVhLBpR6hEQR32L51c+zwLaPXxSMFncV9GwMeN8Znz?=
 =?us-ascii?Q?An3MjizrbscJeivARKArgwf15qXXX++42lUjJFeVRAvIYo9d5ls5e2wLDNIb?=
 =?us-ascii?Q?zs66Ave1yLqhHXRXnSDuAEChfCh45X05yA2h3T4cjxhCPAdXyXiCLdNrTFXZ?=
 =?us-ascii?Q?A5LTjHJm+RqKxv3Z0PIXlDqPtzDo0oSVYeXs2ERnB8U9tlsku6Ct9xe1IFhO?=
 =?us-ascii?Q?oRKyFPIfYs/KL6uxk1nKxngfHY5ifvmuHLpPh1NiX+b5p4QjUxtVK0ifFDnw?=
 =?us-ascii?Q?RThk8tmNftYgxIpsoEXydyhmD7Iv63jLLA5E8r+n9SjBURg1OioV1Xi55ppD?=
 =?us-ascii?Q?BQjgGD4hw4cgx+H03bWR6Sp5d8I1xAm+x1JJG7JjlsQyR0GudtCcTJr7Ekd2?=
 =?us-ascii?Q?BLn2wLKDqwgQmaTNnN2XGBeM3exvcy4wMrB51VZ7SZfi0oFTn0/urt6NFER0?=
 =?us-ascii?Q?YvJUa5N2wvudOb015U+6Jwxu9VtQAC1mbQYpL+MRZ4cBKaAA3vXGL6I41RnQ?=
 =?us-ascii?Q?O5CaBMpi2yeCCuFqd8C8NbEsZKIQ+P7kqAkFdGV6orHiv+UWApBQ39eQczcq?=
 =?us-ascii?Q?mWgoJ9pF67QzEX4fOH7pn/1285zK3ftxcEP2v/uF18CpIx4C4Gep0GB9crxr?=
 =?us-ascii?Q?qQOJRkFTh1G4hxUWZfuZ8Ak5nNILEOsfEa/pJBYK7Fv8gT80ajbY+bOiOtBw?=
 =?us-ascii?Q?UzntVBHdqkayYJY1e8iRsCL/pBKbrEuENfSFarmHL7HDRm5BX85o1bycyar7?=
 =?us-ascii?Q?srMaMQExEiZflHDOUhaRHc6+GXr/0DRPsyQwmWXj7bCJmpvAiUl/NJfE1Arl?=
 =?us-ascii?Q?BIrjjH246RpvXtHAwKArtVgNl/iD/NzHVK4RI+tOZ9pOHlk1UMI9mI0NDOcc?=
 =?us-ascii?Q?KBK/9qAKYwoM1982QEvOABETNmE9329D2efog+F7wzrUC0t82c012GsAxdFd?=
 =?us-ascii?Q?kQXwme7cGxnuks8bF9EJOvLTCngSfHz7cNzuUPh8UTEctcBZwFORuPljylQa?=
 =?us-ascii?Q?xx3r60SViRsL/7Cc880=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 09:34:08.2269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ad1789-e666-4783-0ee2-08de502b6797
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6929
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_013417_900018_CD14FBEA 
X-CRM114-Status: GOOD (  12.30  )
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

OrangePi 6 Plus adopts CIX CD8180/CD8160 SoC, built-in 12-core 64-bit
processor + NPU processor,integrated graphics processor, equipped with
16GB/32GB/64GB LPDDR5, and provides two M.2 KEY-M interfaces 2280 for NVMe
SSD,as well as SPI FLASH and TF slots to meet the needs of fast read/write
and high-capacity storage

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/Makefile     |  1 +
 arch/arm64/boot/dts/cix/sky1-xcp.dts | 83 ++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-xcp.dts

diff --git a/arch/arm64/boot/dts/cix/Makefile b/arch/arm64/boot/dts/cix/Makefile
index ed3713982012..8a6c6fdc4ec0 100644
--- a/arch/arm64/boot/dts/cix/Makefile
+++ b/arch/arm64/boot/dts/cix/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_CIX) += sky1-orion-o6.dtb
+dtb-$(CONFIG_ARCH_CIX) += sky1-xcp.dtb
diff --git a/arch/arm64/boot/dts/cix/sky1-xcp.dts b/arch/arm64/boot/dts/cix/sky1-xcp.dts
new file mode 100644
index 000000000000..1fae52dc9bb0
--- /dev/null
+++ b/arch/arm64/boot/dts/cix/sky1-xcp.dts
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright 2025 Cix Technology Group Co., Ltd.
+ *
+ */
+
+/dts-v1/;
+
+#include "sky1.dtsi"
+#include "sky1-pinfunc.h"
+
+/ {
+	model = "Xunlong,OrangePi 6 Plus";
+	compatible = "xunlong,orangepi-6-plus", "cix,sky1";
+
+	aliases {
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x0 0x28000000>;
+			linux,cma-default;
+		};
+	};
+
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_hog: hog-cfg {
+		pins {
+			pinmux = <CIX_PAD_GPIO144_FUNC_GPIO144>,
+				<CIX_PAD_GPIO145_FUNC_GPIO145>,
+				<CIX_PAD_GPIO146_FUNC_GPIO146>,
+				<CIX_PAD_GPIO147_FUNC_GPIO147>;
+			bias-pull-down;
+			drive-strength = <8>;
+		};
+	};
+};
+
+&iomuxc_s5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog_s5>;
+
+	pinctrl_hog_s5: hog-s5-cfg {
+		pins {
+			pinmux = <CIX_PAD_GPIO014_FUNC_GPIO014>;
+			bias-pull-up;
+			drive-strength = <8>;
+
+		};
+	};
+};
+
+&pcie_x8_rc {
+	status = "okay";
+};
+
+&pcie_x2_rc {
+	status = "okay";
+};
+
+&pcie_x1_1_rc {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
-- 
2.49.0


