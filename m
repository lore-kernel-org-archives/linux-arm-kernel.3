Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E116C2A06C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 07:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJlTUhb/5UepKBoao7XHkzdJ0DZEnFzCirMi4DD3x9E=; b=ho9u/98y4KA4LfVdf6shYe2Qsx
	2k4v+/BptbDihKLoOUoeSBfZdZHcbkZ/Gsp5Pt4OhKPrEpXd2BYxD+3o9krVTeKG5lmsIIRqm295z
	qfuoujpK5uNPL3xckN68jLkSd9tBKwR5YvpHwtR4O24QQs0lLsM4WpOu0spXrLoRtgI319+4/HKya
	QREVoFgofMrWhGMdAVos+v+hHW+SOfaZhUkMCNAEkBcEym0vli9Jv7e8H8cilR+QDOt7b0UdsbfZf
	NJyolmjJAmsHWWLS0Mw8iN7dzVwX+YX7I2qTbJwc3z+MVL0UoMXvUQ9RA3ITjZ/jV68pbM6DsT9uY
	GXoqBh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcIwO-0000000A5zx-3ovj;
	Sun, 04 Jan 2026 07:54:20 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcIwK-0000000A5z0-1foB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 07:54:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Od7jaY9DrXTm7/kuqx/wiyL7vgr7xHefZ93FM/aZJVn7/gCGtskj05rePZ1tAUrZKPnArloc+yo9drBgGSLLF62nX2pbSfm7LBbzv/U6da4hbhjbZ/sj9lBoMHrjJ2rwEYdJCJM7AH/kk7ML4gWoKb3z+oZr7cnK7G23HacwOaFtX1fIlFklYKSvDQszgvpcEKd0xmOMaSPM82YZTDG92RZ0oJ2jdGPiikJ2kxbzwu5XzvdUm9gYKTN54lha/MHa2uZwIolp5f87nlBNnamGD55rVn/fvhntuqkNkdhVfNEO0ZObwGd/zMO3g/Id8lcU5nXm9B3i4jrZ4nG4ti++VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJlTUhb/5UepKBoao7XHkzdJ0DZEnFzCirMi4DD3x9E=;
 b=mMhDT3Pbaeo7nuFf84D1qchGNpmphxrSi/Jk/6VGQU1Ph/YkiBTmeSMivNGTuurucTH2uyUdbbAL6qIqY8fZ6+f4s4AiTLmWoP6TLkJ5jRw1OdH+y1VEyo6LOzr2I/da/qR1eR3U25iMea/LUlxKGsRhacnN+y5nBu/CzosHEABM1D6y5FT+bi/FGc9NLOF0hYrcbiRdAz8wjqPiXXwOjV9XaiEBoNXWMdmcCxj4frnfZigLQeU3YkVzh+tUUCahE9K49dCFdnSKWDeohZYH216B4THQN4go51rcsdqY9ckUIL9sZYEC+jqaDYAd/S7DmvwtjbNtGcFsM6S/jHok1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0089.apcprd02.prod.outlook.com (2603:1096:300:5c::29)
 by TYZPR06MB5950.apcprd06.prod.outlook.com (2603:1096:400:333::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 07:54:03 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:300:5c:cafe::4c) by PS2PR02CA0089.outlook.office365.com
 (2603:1096:300:5c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sun, 4
 Jan 2026 07:54:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sun, 4 Jan 2026 07:54:02 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 15DAC40A5BFE;
	Sun,  4 Jan 2026 15:54:01 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v3 2/2] arm64: dts: cix: Add OrangePi 6 Plus board support
Date: Sun,  4 Jan 2026 15:54:00 +0800
Message-ID: <20260104075400.1673101-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260104075400.1673101-1-gary.yang@cixtech.com>
References: <20260104075400.1673101-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TYZPR06MB5950:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 098deefa-93cd-42ae-1ecd-08de4b666d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zs0qgkrM3fnd9TObsJYrjFnJ/YdZo+BddUdac0L0eBMjhbkZ6oHJ9MhT8v2D?=
 =?us-ascii?Q?TUyhJzyXaqFHTmowZGB6rHa6HpuUAgsbrBlw5tBVsJaWKQGlBmJhrSJs2HvK?=
 =?us-ascii?Q?35Rf+aC3fJaX7zsOgeppDB2rABv2JYaGDc5+iGFbRa7CfAd/7OmY1KT5LqSo?=
 =?us-ascii?Q?TbouHoqfXDhGGDUVVi6k7i7jaCLu92HEBiuKsFwMNBWPJTtqg/K0DumFAUFd?=
 =?us-ascii?Q?FqHO9VrsJiPwoyVrpGPAnh8c+2dV4PtXz8lpanxTfr8UcIvQOl70xJi18Ypv?=
 =?us-ascii?Q?gRKlDi5X7iyzJBKlz5N+hARefSxGR5Z5f+tlvAx5lgpA7xQoDv6aO4MlLNpK?=
 =?us-ascii?Q?nixfaTFADwyPT+y4wSEw87DNAm95Al9z7qqVIuJc8jaNPg8ev/+fCLK5OrUW?=
 =?us-ascii?Q?OP726TDYDyHIGA7vulUaRQo+BSc9f17BK2uGPEuET9LvylUXrD8eza03O+Qp?=
 =?us-ascii?Q?q6OISecdaMHQTXvfisE13dPYepL6bLt7sVlmcJCwdjv6wV/y85WhRe2YgEzu?=
 =?us-ascii?Q?OXWYqCNHnJ3Pa1UE/nvKxRkay/a2jeCzeq/6xQG/rBeFeeSwOzt+bq+KWmak?=
 =?us-ascii?Q?uDTibRlNMUtj8qiqL+jUFG0t23ORIgC7etElh6y3lY1dyreD5R7k85JmfXAa?=
 =?us-ascii?Q?2WqJB0T8RnjQKC3T1OIsgh8XQ/aQsyMcAozkVc87vrR/FLhT53k8kUZZ38EK?=
 =?us-ascii?Q?3feE/nQ4pvNwy6Lqj633HbYuza7+Gd+dttiJ5ahuq8csR2vyqM/PM8QwBTN2?=
 =?us-ascii?Q?K7ob3HO932pwZNSPS5apy8S2xb3ZcqUa2Q38V4SST6GY4EXJOB7vYGrlYlYG?=
 =?us-ascii?Q?sBXifouJzGM88d+0v3yxb9bbQlcCv1kkwK/KYQ0wtco1Lcydf01sFuurecvR?=
 =?us-ascii?Q?RFPmBPJSh0ZoVISXXz3ITnJqgAaEXnT+Vy86FovIHBO0kPPwV+v1J0L2MORn?=
 =?us-ascii?Q?gpGtPDFFlDhFBY6AN78aEVKC9FVq2mcX/laU2iilin9E4XOGd2ZltPKij8VQ?=
 =?us-ascii?Q?y++6TRI3cGzTmebdxRlI3ojzniV8iWthIOkTxFfv2Zn3cI55kAJ9uO8vl48y?=
 =?us-ascii?Q?/J7z+X/Lv4UHUWI428+KhpXZRI8kb/CHA99kucWlgTsMlbdMiENgLIphAuA2?=
 =?us-ascii?Q?P7dE9qkFlDiET/eV9E7qQ57knXrLxoFTccs10SNcYayDLkuRcrTgu5jtWY7R?=
 =?us-ascii?Q?+JgJcp5LNFzdxK0tlviGeF7vHdCkjDmYrwH/mMj2qFCM9cQCINb2s9GneS8V?=
 =?us-ascii?Q?3SLFY0MLiH9F5aJizKk8i5CR3OT9p5lnIrMvjz2Z6HG2/CoXr3/OFSLKUzEn?=
 =?us-ascii?Q?TOSNILUXpJhwlfZ7zXP+hNlGKBMoKK4AK1yXouEHw1NUQcUlO5yN7t6jxIUv?=
 =?us-ascii?Q?WxmGX1beGUJjuRFCtg6jsqpKMqbXSJzW9Eb+rdfxRefLvE3yGdRN5Ba7I5zF?=
 =?us-ascii?Q?eCqRabNUh9Jp5Qld4ebG1q/LoPEan2ulQJ0C3x2VP4UlfTgPzNlX0IlFECaB?=
 =?us-ascii?Q?NvllXOL7gJlLSxrINt2+IiOuVpTSX0ZZMnERzferkk0qN88cF35dnUzCJQnl?=
 =?us-ascii?Q?KLCdpp8+QseraEbAY0g=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 07:54:02.5884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 098deefa-93cd-42ae-1ecd-08de4b666d79
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5950
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_235416_477848_69AB27F6 
X-CRM114-Status: GOOD (  12.94  )
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


