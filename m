Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2D2E73165
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 02:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0wHX0iGY+FpWwoiDV4hCWS+Ea/V+9Pd+u+jyqoeHxU=; b=N2Qmd+glGspbFg8wKQwtNj7A2i
	YxJyUkJ4uJv71yDek2avfnTN+e5ajdTF6wb8vPTd55LeXUHZrxWiLZ8WSSqi82SWWaRJlqGSHxrSr
	aOPK/anyuzWSBXPLTNnhKvSmMNEUfn+wydooAU8lnIUXftHOMSil3TptkPKi0JC3AcoaNzyWm/hy3
	LM9NcMQ1VYNCp+EDB9+owQqoiRDeA7J7vNOgaLnzvXXaz8rDWQRjNzzBrtpApsRDNtbv9iEsfrqp1
	1yjzBsiO/QC65w9Tn/sTlBelnp7BkDy8U0zdL/cTEmtClLOGBHTDNnRqkTxsxhPwl5fdnavdQGxp2
	luc1iuiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5sg-00000005toi-1ARE;
	Tue, 03 Feb 2026 02:11:06 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5sd-00000005to7-2Ymg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 02:11:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4sgjgCgEM6QLtASLNyv4YuvViOC1rmIGKDrklNARwrc6SjBfjoUkXpS065Ed3SaJJqGOHMaGjHPumerdA6d5t40iTgbCAbUsv3LRJg1icy9dCjUuRfVGHxFAK1BLhoPCFru8TsgwFhbvcFbDpu9PAx/JLG1piM7repp1JoypbKu2Iy11VI3xgW0NiK6rVH+MrHOpUojU1CJjRsnDGIUP8H6i8p9ZRb4984UQqSLEkmKxC92H6l1Tjatm2Lb/FNk3FFl3FsqJ06p2bBrYrXa5DnXLS+PDe1S1DudQ16zm1on58EcfBC2u2uFC5ASC8ITxrLBITSDmIVx6X4ojStZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0wHX0iGY+FpWwoiDV4hCWS+Ea/V+9Pd+u+jyqoeHxU=;
 b=C28FlZ429sg4+V/Kr5PTBGJphWSNulIMlJq0f2X9/gweARw7I6TQHEficfX3FX4Xeaw3ZEyq3pn+hMGa5+PAqBWHWo0GcIUz6EyjcWeRhRyGs4nZVSkkBg8i13g1iPuGob0nrkJ+XZs8eHPw6G1hc2ElZkc8x7qrbak+bLINXaI1fHviv3UMZkDlr50IfaIoFi7ZJQCNEhztlpjVM2jwmeLWu299RFo2YX/lCunFO/W9MgLM3wtQ5x82zUQGcWQu8AOXvSItmnnhku76XfqyBhAFUc+ieq5GVs/DxRYUYH/Auh5L8psgtTAg2HdUkvGM10CfCkcaYbybkbcojX6oWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0010.apcprd02.prod.outlook.com (2603:1096:3:17::22) by
 TYZPR06MB6305.apcprd06.prod.outlook.com (2603:1096:400:418::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:10:55 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:3:17:cafe::4c) by SG2PR02CA0010.outlook.office365.com
 (2603:1096:3:17::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 02:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 02:10:54 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D66314350707;
	Tue,  3 Feb 2026 10:10:53 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v6 1/3] dt-bindings: soc: cix: document the simple-mfd syscon on Sky1 SoC
Date: Tue,  3 Feb 2026 10:10:51 +0800
Message-ID: <20260203021053.4073258-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260203021053.4073258-1-gary.yang@cixtech.com>
References: <20260203021053.4073258-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|TYZPR06MB6305:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6ca2ab5-91e7-4fac-57b5-08de62c9764c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jnKGKfhuZHTJ7LDh5+3Q2w9+rkQN6VDpnHEVAQ/IpGA1VD5x33dVvvMNpPri?=
 =?us-ascii?Q?cV8mF+iPEh9Fa5QPMl9HogT4/ofXMXHIJ60GmXAsdq/Wgmm70SJN7O2ScEJU?=
 =?us-ascii?Q?RUlzaSfiOSHYOiQthOAkIIAnSUsxQ4f4wKq6neGt8DB0Gv4ITnjpEqF74a4k?=
 =?us-ascii?Q?sBr31uBlLDrG7w0wKmYfWaIYoBWuXq2tpyiKVMqJTqDplvnZKd4rT6zWpxjv?=
 =?us-ascii?Q?6GOX8d3LBsucPZo2ZBU19h+RAmEksD6Wg8LR9toZps2+Wxxhd1MxB+KjCrQi?=
 =?us-ascii?Q?tMLqejE2M1Xl2mg7xH8rVZiN9ksm4dlv5h+2zkMEkJiD7s8p5u9uPP5MHIct?=
 =?us-ascii?Q?1VlWOsw3LNeiykeKNLkpdTpUy0LXooE/qRB0V6RVym9kLQyct2sOc0dPAqd3?=
 =?us-ascii?Q?Zi3Gjm68NP46cq9egWWLXQhxUW+eDUMpS0PtYzbSOiWsAh3YketxsZHIiBtp?=
 =?us-ascii?Q?CziMhX67le8KqMQCA+4OP+3JIzmmqEn8IckToZVNYcV/zZbal/rTFFh6nxFp?=
 =?us-ascii?Q?MZIgFguReJGUEtmaZN4gvQ892kZsBF6m6Y0rLlbOo3ZYeATBM0YUIWGFivT/?=
 =?us-ascii?Q?yEmbRYjHNLYSEdHcIKJr5NneW3/p0Uhha2gtofB0WmIPcDjlN1NstfUQsN4W?=
 =?us-ascii?Q?Lf4pFGPJnJBOzE3Pw8BupksHDRFwdD/NbL/Yq80ZY9kaRufbY/AxIMEyEdaE?=
 =?us-ascii?Q?yYP6EHc8HjUyzomYCeTGGhUZwbNNgvqxRjtG3BfU+DJP7U0Yz0X7D10bKc2S?=
 =?us-ascii?Q?hhvOBYGg9gWxTGb4W3cPBTNYfQ7HVmK3rftoNBLsfTba+7i30yGAPXBPa5qm?=
 =?us-ascii?Q?HpFnO7y50jsF6/0rD7WWt6L4XLvZeO4Y50b8hBBtrh0McyReVtUjYiZ86fXl?=
 =?us-ascii?Q?bpPQbvtZlUDtcHKnKatU1PdDG+Ud4YzSqnGMTu+K0PkY4CWvWXeET8wPqFl4?=
 =?us-ascii?Q?7nswvNhPAfFv5V5BSroleSgEsIbSz20RRKibvxlYY2xc4/3Hd+M+vVSaJ+QB?=
 =?us-ascii?Q?SDUcNLRpBoKcKpsO8lSSZRKj6hy43ynBOkc5p01HddmZoK5rZr/bDeV0CWHD?=
 =?us-ascii?Q?vXYTkcIktf5Xd0nHjwqVpc9Ynx6ZCN1REEHiD4HFaWT/6ays4MetBuUoIEJJ?=
 =?us-ascii?Q?f6M1XObl3Xn4epMWZgaBCELi0/Q8s0n2a7A6fb3F/3dSHfUFiyXFwcaBZKxB?=
 =?us-ascii?Q?S09/SEqOvIpGrbUQH+FD8+QVVyCecl8MuleuuChQEUEovc2jduq7pPejDRp0?=
 =?us-ascii?Q?WEIH74Lmfe7MJWOohWZbiYnvx3K85BG5s1p+DcBlk5A9N+rv7NJxp1D1T6+L?=
 =?us-ascii?Q?N8Zp+AW9YWrT75i6TxzXVfzesj4PHVAF9ZSQ3bo08RG47vx23HiYKmK9t8VL?=
 =?us-ascii?Q?P68OwFLTgpikmxzvpq2Cpr1WRNsRgRizOC+N3JLXkm/I6h/yUY1JZobbKzQd?=
 =?us-ascii?Q?rIxSKjZuhn/tVTztjjSa1BFfdKBa/f2+ct5qjvcwIWIkhLppJYXqG+Vmw031?=
 =?us-ascii?Q?1YyT3/gJhR26rZmZm6Za36jW4AkvKumSiK6HF68YNjs6Nr2u/i2Kgd9jrchD?=
 =?us-ascii?Q?IbZ6ZLM8PUbHasohFO3hvSdDC5HmGXxqLXSWVHTPkja04gqZqSbaNxrCHTml?=
 =?us-ascii?Q?Mv19miW6Ph3Od6FIP5yqDAs=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EaBowvSUb289a/i8mQOU3ZK6274de1aFw3UbllL94RQSvUQLDhSWzR/fgbj+PLnMLJf8AbPJmbAONFCmuvEmz2AFdMs5EBFs35KGMZ0PPhXgBUihOSQ49m8apNydyPpyowtRNdPoH9Qh89zZbpRQaV2XYtiwumpkInfvza3EcM1WNnZXWvzrsYLy+gQOiKsPealm6Gm4mHLMU4zWKRGcCUOZD4nrAyKypVFz+nXUWYWOEWBP2zazB6+lBIXIzs4z2OKheCXo7aLVerP3EUL+7BTVayeulvfNrLPgCmxCaS5l6eHv+0tKVUkZCUh/MwS034fBGKl6fY5tupd20qu05GnDr2C3uxwZLVcaWTU9+4IH/n5NMGvq8tbmJh7a8FuvHfnqCPkAivxMsFP5RxkEufmdzCYzSVqOOEYTmWpFK1KDvLoCdPuY9zZ9cM4Hq/MN
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 02:10:54.4220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ca2ab5-91e7-4fac-57b5-08de62c9764c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_181103_775858_83219FC0 
X-CRM114-Status: GOOD (  13.88  )
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

There are two system control on Cix sky1 Soc. One is located in S0 domain,
and the other is located in S0 and S5 domain. The system control contains
resets, usb typeC and more. At this point, only the reset controller child
is described as usb typeC uses it by phandle.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 .../soc/cix/cix,sky1-system-control.yaml      |  49 ++++++
 include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 +++++
 include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++++++
 3 files changed, 255 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
new file mode 100644
index 000000000000..5fb6b97c3c00
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/cix/cix,sky1-system-control.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cix Sky1 SoC system control register region
+
+maintainers:
+  - Gary Yang <gary.yang@cixtech.com>
+
+description:
+  An wide assortment of registers of the system controller on Sky1 SoC,
+  including resets, usb, wakeup sources and so on.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - cix,sky1-system-control
+          - cix,sky1-s5-system-control
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@16000000 {
+      compatible = "cix,sky1-s5-system-control", "syscon", "simple-mfd";
+      reg = <0x16000000 0x1000>;
+      #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/reset/cix,sky1-rst-fch.h b/include/dt-bindings/reset/cix,sky1-rst-fch.h
new file mode 100644
index 000000000000..8e67d7eb92aa
--- /dev/null
+++ b/include/dt-bindings/reset/cix,sky1-rst-fch.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Author: Jerry Zhu <jerry.zhu@cixtech.com> */
+#ifndef DT_BINDING_RESET_FCH_SKY1_H
+#define DT_BINDING_RESET_FCH_SKY1_H
+
+/* func reset for sky1 fch */
+
+#define SW_I3C0_RST_FUNC_G_N	0
+#define SW_I3C0_RST_FUNC_I_N	1
+#define SW_I3C1_RST_FUNC_G_N	2
+#define SW_I3C1_RST_FUNC_I_N	3
+#define SW_UART0_RST_FUNC_N	4
+#define SW_UART1_RST_FUNC_N	5
+#define SW_UART2_RST_FUNC_N	6
+#define SW_UART3_RST_FUNC_N	7
+#define SW_TIMER_RST_FUNC_N	8
+
+/* apb reset for sky1 fch */
+#define SW_I3C0_RST_APB_N	9
+#define SW_I3C1_RST_APB_N	10
+#define SW_DMA_RST_AXI_N	11
+#define SW_UART0_RST_APB_N	12
+#define SW_UART1_RST_APB_N	13
+#define SW_UART2_RST_APB_N	14
+#define SW_UART3_RST_APB_N	15
+#define SW_SPI0_RST_APB_N	16
+#define SW_SPI1_RST_APB_N	17
+#define SW_I2C0_RST_APB_N	18
+#define SW_I2C1_RST_APB_N	19
+#define SW_I2C2_RST_APB_N	20
+#define SW_I2C3_RST_APB_N	21
+#define SW_I2C4_RST_APB_N	22
+#define SW_I2C5_RST_APB_N	23
+#define SW_I2C6_RST_APB_N	24
+#define SW_I2C7_RST_APB_N	25
+#define SW_GPIO_RST_APB_N	26
+
+/* fch rst for xspi */
+#define SW_XSPI_REG_RST_N	27
+#define SW_XSPI_SYS_RST_N	28
+
+#endif
diff --git a/include/dt-bindings/reset/cix,sky1-rst.h b/include/dt-bindings/reset/cix,sky1-rst.h
new file mode 100644
index 000000000000..2f0990922aad
--- /dev/null
+++ b/include/dt-bindings/reset/cix,sky1-rst.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Author: Jerry Zhu <jerry.zhu@cixtech.com> */
+#ifndef DT_BINDING_RESET_SKY1_H
+#define DT_BINDING_RESET_SKY1_H
+
+/* reset for csu_pm */
+
+#define SKY1_CSU_PM_RESET_N		0
+#define SKY1_SENSORFUSION_RESET_N	1
+#define SKY1_SENSORFUSION_NOC_RESET_N	2
+
+/* reset group0 for s0 domain modules */
+#define SKY1_DDRC_RESET_N		3
+#define SKY1_GIC_RESET_N		4
+#define SKY1_CI700_RESET_N		5
+#define SKY1_SYS_NI700_RESET_N		6
+#define SKY1_MM_NI700_RESET_N		7
+#define SKY1_PCIE_NI700_RESET_N		8
+#define SKY1_GPU_RESET_N		9
+#define SKY1_NPUTOP_RESET_N		10
+#define SKY1_NPUCORE0_RESET_N		11
+#define SKY1_NPUCORE1_RESET_N		12
+#define SKY1_NPUCORE2_RESET_N		13
+#define SKY1_VPU_RESET_N		14
+#define SKY1_ISP_SRESET_N		15
+#define SKY1_ISP_ARESET_N		16
+#define SKY1_ISP_HRESET_N		17
+#define SKY1_ISP_GDCRESET_N		18
+#define SKY1_DPU_RESET0_N		19
+#define SKY1_DPU_RESET1_N		20
+#define SKY1_DPU_RESET2_N		21
+#define SKY1_DPU_RESET3_N		22
+#define SKY1_DPU_RESET4_N		23
+#define SKY1_DP_RESET0_N		24
+#define SKY1_DP_RESET1_N		25
+#define SKY1_DP_RESET2_N		26
+#define SKY1_DP_RESET3_N		27
+#define SKY1_DP_RESET4_N		28
+#define SKY1_DP_PHY_RST_N		29
+
+/* reset group1 for s0 domain modules */
+#define SKY1_AUDIO_HIFI5_RESET_N	30
+#define SKY1_AUDIO_HIFI5_NOC_RESET_N	31
+#define SKY1_CSIDPHY_PRST0_N		32
+#define SKY1_CSIDPHY_CMNRST0_N		33
+#define SKY1_CSI0_RST_N			34
+#define SKY1_CSIDPHY_PRST1_N		35
+#define SKY1_CSIDPHY_CMNRST1_N		36
+#define SKY1_CSI1_RST_N			37
+#define SKY1_CSI2_RST_N			38
+#define SKY1_CSI3_RST_N			39
+#define SKY1_CSIBRDGE0_RST_N		40
+#define SKY1_CSIBRDGE1_RST_N		41
+#define SKY1_CSIBRDGE2_RST_N		42
+#define SKY1_CSIBRDGE3_RST_N		43
+#define SKY1_GMAC0_RST_N		44
+#define SKY1_GMAC1_RST_N		45
+#define SKY1_PCIE0_RESET_N		46
+#define SKY1_PCIE1_RESET_N		47
+#define SKY1_PCIE2_RESET_N		48
+#define SKY1_PCIE3_RESET_N		49
+#define SKY1_PCIE4_RESET_N		50
+
+/* reset group1 for usb phys */
+#define SKY1_USB_DP_PHY0_PRST_N		51
+#define SKY1_USB_DP_PHY1_PRST_N		52
+#define SKY1_USB_DP_PHY2_PRST_N		53
+#define SKY1_USB_DP_PHY3_PRST_N		54
+#define SKY1_USB_DP_PHY0_RST_N		55
+#define SKY1_USB_DP_PHY1_RST_N		56
+#define SKY1_USB_DP_PHY2_RST_N		57
+#define SKY1_USB_DP_PHY3_RST_N		58
+#define SKY1_USBPHY_SS_PST_N		59
+#define SKY1_USBPHY_SS_RST_N		60
+#define SKY1_USBPHY_HS0_PRST_N		61
+#define SKY1_USBPHY_HS1_PRST_N		62
+#define SKY1_USBPHY_HS2_PRST_N		63
+#define SKY1_USBPHY_HS3_PRST_N		64
+#define SKY1_USBPHY_HS4_PRST_N		65
+#define SKY1_USBPHY_HS5_PRST_N		66
+#define SKY1_USBPHY_HS6_PRST_N		67
+#define SKY1_USBPHY_HS7_PRST_N		68
+#define SKY1_USBPHY_HS8_PRST_N		69
+#define SKY1_USBPHY_HS9_PRST_N		70
+
+/* reset group1 for usb controllers */
+#define SKY1_USBC_SS0_PRST_N		71
+#define SKY1_USBC_SS1_PRST_N		72
+#define SKY1_USBC_SS2_PRST_N		73
+#define SKY1_USBC_SS3_PRST_N		74
+#define SKY1_USBC_SS4_PRST_N		75
+#define SKY1_USBC_SS5_PRST_N		76
+#define SKY1_USBC_SS0_RST_N		77
+#define SKY1_USBC_SS1_RST_N		78
+#define SKY1_USBC_SS2_RST_N		79
+#define SKY1_USBC_SS3_RST_N		80
+#define SKY1_USBC_SS4_RST_N		81
+#define SKY1_USBC_SS5_RST_N		82
+#define SKY1_USBC_HS0_PRST_N		83
+#define SKY1_USBC_HS1_PRST_N		84
+#define SKY1_USBC_HS2_PRST_N		85
+#define SKY1_USBC_HS3_PRST_N		86
+#define SKY1_USBC_HS0_RST_N		87
+#define SKY1_USBC_HS1_RST_N		88
+#define SKY1_USBC_HS2_RST_N		89
+#define SKY1_USBC_HS3_RST_N		90
+
+/* reset group0 for rcsu */
+#define SKY1_AUDIO_RCSU_RESET_N			91
+#define SKY1_CI700_RCSU_RESET_N			92
+#define SKY1_CSI_RCSU0_RESET_N			93
+#define SKY1_CSI_RCSU1_RESET_N			94
+#define SKY1_CSU_PM_RCSU_RESET_N		95
+#define SKY1_DDR_BROADCAST_RCSU_RESET_N		96
+#define SKY1_DDR_CTRL_RCSU_0_RESET_N		97
+#define SKY1_DDR_CTRL_RCSU_1_RESET_N		98
+#define SKY1_DDR_CTRL_RCSU_2_RESET_N		99
+#define SKY1_DDR_CTRL_RCSU_3_RESET_N		100
+#define SKY1_DDR_TZC400_RCSU_0_RESET_N		101
+#define SKY1_DDR_TZC400_RCSU_1_RESET_N		102
+#define SKY1_DDR_TZC400_RCSU_2_RESET_N		103
+#define SKY1_DDR_TZC400_RCSU_3_RESET_N		104
+#define SKY1_DP0_RCSU_RESET_N			105
+#define SKY1_DP1_RCSU_RESET_N			106
+#define SKY1_DP2_RCSU_RESET_N			107
+#define SKY1_DP3_RCSU_RESET_N			108
+#define SKY1_DP4_RCSU_RESET_N			109
+#define SKY1_DPU0_RCSU_RESET_N			110
+#define SKY1_DPU1_RCSU_RESET_N			111
+#define SKY1_DPU2_RCSU_RESET_N			112
+#define SKY1_DPU3_RCSU_RESET_N			113
+#define SKY1_DPU4_RCSU_RESET_N			114
+#define SKY1_DSU_RCSU_RESET_N			115
+#define SKY1_FCH_RCSU_RESET_N			116
+#define SKY1_GICD_RCSU_RESET_N			117
+#define SKY1_GMAC_RCSU_RESET_N			118
+#define SKY1_GPU_RCSU_RESET_N			119
+#define SKY1_ISP_RCSU0_RESET_N			120
+#define SKY1_ISP_RCSU1_RESET_N			121
+#define SKY1_NI700_MMHUB_RCSU_RESET_N		122
+
+/* reset group1 for rcsu */
+#define SKY1_NPU_RCSU_RESET_N			123
+#define SKY1_NI700_PCIE_RCSU_RESET_N		124
+#define SKY1_PCIE_X421_RCSU_RESET_N		125
+#define SKY1_PCIE_X8_RCSU_RESET_N		126
+#define SKY1_SF_RCSU_RESET_N			127
+#define SKY1_RCSU_SMMU_MMHUB_RESET_N		128
+#define SKY1_RCSU_SMMU_PCIEHUB_RESET_N		129
+#define SKY1_RCSU_SYSHUB_RESET_N		130
+#define SKY1_NI700_SMN_RCSU_RESET_N		131
+#define SKY1_NI700_SYSHUB_RCSU_RESET_N		132
+#define SKY1_RCSU_USB2_HOST0_RESET_N		133
+#define SKY1_RCSU_USB2_HOST1_RESET_N		134
+#define SKY1_RCSU_USB2_HOST2_RESET_N		135
+#define SKY1_RCSU_USB2_HOST3_RESET_N		136
+#define SKY1_RCSU_USB3_TYPEA_DRD_RESET_N	137
+#define SKY1_RCSU_USB3_TYPEC_DRD_RESET_N	138
+#define SKY1_RCSU_USB3_TYPEC_HOST0_RESET_N	139
+#define SKY1_RCSU_USB3_TYPEC_HOST1_RESET_N	140
+#define SKY1_RCSU_USB3_TYPEC_HOST2_RESET_N	141
+#define SKY1_VPU_RCSU_RESET_N			142
+
+#endif
-- 
2.49.0


